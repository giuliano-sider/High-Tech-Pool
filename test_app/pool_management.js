
// simple in-memory store for some critical data structures for managing the High Tech Pool

var loggedInPools = {};

module.exports.is_lane_free = function(id_piscina, numero_raia) {
	if (loggedInPools[id_piscina] &&
	    loggedInPools[id_piscina][numero_raia]) {
		return false; // there's an entry for this lane in the memory store
	} else {
		return true;
	}
};

module.exports.lock_lane = function(id_piscina, numero_raia) {
	if (loggedInPools[id_piscina] === undefined) {
		loggedInPools[id_piscina] = {};
	}
	loggedInPools[id_piscina][numero_raia] = {estado: 'travada'};
};

module.exports.free_lane = function(id_piscina, numero_raia) {
	delete loggedInPools[id_piscina][numero_raia];
};