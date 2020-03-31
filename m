Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA68519994A
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Mar 2020 17:11:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AE14166D;
	Tue, 31 Mar 2020 17:10:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AE14166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585667474;
	bh=U9eoagrnyNM0e7amdAhnt5pEEM8yNpvOB1I82u/NNHk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZYDnwsHLK+TKKAf4bOYR4cEPfoylPIn6KfIKr/BOFTcIucY6ryhgT5iwpAwIpIDet
	 gIhyTjsS518/RgTkpEzeXIIi8Ql6pw3YiRwnEqb7oUf3UQ6KNWKo7dM6V2tUhFeMEI
	 U3sOTuu/izJXoaOlmu72ERfPZVK1osnvS2KLsRw0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84695F8014F;
	Tue, 31 Mar 2020 17:09:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD10EF80146; Tue, 31 Mar 2020 17:09:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E16FEF8010C
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 17:09:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E16FEF8010C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="c3OaoTbj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=5922; q=dns/txt; s=axis-central1;
 t=1585667368; x=1617203368;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WjDipkcQwdRr91Vyb7wMUd0SIx+AMwNpoeqDI7toYiY=;
 b=c3OaoTbjKazPDdhPccsgiEE4JBHMQJqvByjvM8HKTQ7pQg5w5A0pssv4
 +wfp6J4ktCzYzSKUndF48ejSBZVc5NtNPf5YfQyF/Z6jSuUGiC2bwkgoV
 5b7us42xyjl9yhMc6x5RNKppYbjGM5uo2uEZI08SAoIf5E7Qiw9NUHc8Y
 HzcFcVVIs2T4oLUTOEkqTdLOC6ouu3DbJ6p9FjT6raqf9xH9Z7xGeGHBv
 C4hH2KRUG/EEFOuDZdq+UuGVQzo/MeyTCPrKCTK8IXwq1PGIFvF1SMopF
 n6lcCNUoYJeX/ruxYWzX2eBf9jW6Tc35ZNpMmutT5Ie3a9Y+/5L4piUbN g==;
IronPort-SDR: UY75Qgsd0viQu4aHQURp2nl0vj1rM3f4xpvbkMZAb6oEcnpeESL8FJRDw81qH39Oi3+48z9eLW
 CBeNGWdOaIB+HPyi5qL6F4T5GPIYVerG7wExGeJMHotgBWoAsm3BxTr52cv4IIpVijweCQfDMi
 wOuPgYLpzESlIwnqs1Dr7ngBTkQx6TGjNTFBMIv0dsfatUZ2VFabyxo+21Xg6jz13aHUzIF80V
 v7ujjs65jMjG4QlCPQqZnRUWE3iADOQ/MKtK0Hls6wss5A7WA3rCg6wN1qZzraD1+TqoOMe2d4
 4tw=
X-IronPort-AV: E=Sophos;i="5.72,328,1580770800"; 
   d="scan'208";a="7164088"
From: Jonas Holmberg <jonashg@axis.com>
To: <tiwai@suse.de>
Subject: [PATCH] pcm: add chmap option to route plugin
Date: Tue, 31 Mar 2020 17:09:25 +0200
Message-ID: <20200331150925.788419-1-jonashg@axis.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add a config definition "chmap" to override the channel maps in the same
way as in the hw and null plugins.

Signed-off-by: Jonas Holmberg <jonashg@axis.com>
---
 src/pcm/pcm_route.c | 57 +++++++++++++++++++++++++++++++++++++--------
 1 file changed, 47 insertions(+), 10 deletions(-)

diff --git a/src/pcm/pcm_route.c b/src/pcm/pcm_route.c
index bbcc6118..d3e5f3ff 100644
--- a/src/pcm/pcm_route.c
+++ b/src/pcm/pcm_route.c
@@ -104,6 +104,7 @@ typedef struct {
 	int schannels;
 	snd_pcm_route_params_t params;
 	snd_pcm_chmap_t *chmap;
+	snd_pcm_chmap_query_t **chmap_override;
 } snd_pcm_route_t;
 
 #endif /* DOC_HIDDEN */
@@ -441,6 +442,7 @@ static int snd_pcm_route_close(snd_pcm_t *pcm)
 		free(params->dsts);
 	}
 	free(route->chmap);
+	snd_pcm_free_chmaps(route->chmap_override);
 	return snd_pcm_generic_close(pcm);
 }
 
@@ -634,6 +636,9 @@ static snd_pcm_chmap_t *snd_pcm_route_get_chmap(snd_pcm_t *pcm)
 	snd_pcm_chmap_t *map, *slave_map;
 	unsigned int src, dst, nsrcs;
 
+	if (route->chmap_override)
+		return _snd_pcm_choose_fixed_chmap(pcm, route->chmap_override);
+
 	slave_map = snd_pcm_generic_get_chmap(pcm);
 	if (!slave_map)
 		return NULL;
@@ -660,8 +665,14 @@ static snd_pcm_chmap_t *snd_pcm_route_get_chmap(snd_pcm_t *pcm)
 
 static snd_pcm_chmap_query_t **snd_pcm_route_query_chmaps(snd_pcm_t *pcm)
 {
+	snd_pcm_route_t *route = pcm->private_data;
 	snd_pcm_chmap_query_t **maps;
-	snd_pcm_chmap_t *map = snd_pcm_route_get_chmap(pcm);
+	snd_pcm_chmap_t *map;
+
+	if (route->chmap_override)
+		return _snd_pcm_copy_chmap_query(route->chmap_override);
+
+	map = snd_pcm_route_get_chmap(pcm);
 	if (!map)
 		return NULL;
 	maps = _snd_pcm_make_single_query_chmaps(map);
@@ -818,10 +829,10 @@ err:
 	return -EINVAL;
 }
 
-static int find_matching_chmap(snd_pcm_t *spcm, snd_pcm_chmap_t *tt_chmap,
+static int find_matching_chmap(snd_pcm_chmap_query_t **chmaps,
+			       snd_pcm_chmap_t *tt_chmap,
 			       snd_pcm_chmap_t **found_chmap, int *schannels)
 {
-	snd_pcm_chmap_query_t** chmaps = snd_pcm_query_chmaps(spcm);
 	int i;
 
 	*found_chmap = NULL;
@@ -854,7 +865,6 @@ static int find_matching_chmap(snd_pcm_t *spcm, snd_pcm_chmap_t *tt_chmap,
 			int size = sizeof(snd_pcm_chmap_t) + c->channels * sizeof(unsigned int);
 			*found_chmap = malloc(size);
 			if (!*found_chmap) {
-				snd_pcm_free_chmaps(chmaps);
 				return -ENOMEM;
 			}
 			memcpy(*found_chmap, c, size);
@@ -863,8 +873,6 @@ static int find_matching_chmap(snd_pcm_t *spcm, snd_pcm_chmap_t *tt_chmap,
 		}
 	}
 
-	snd_pcm_free_chmaps(chmaps);
-
 	if (*found_chmap == NULL) {
 		SNDERR("Found no matching channel map");
 		return -EINVAL;
@@ -1252,6 +1260,7 @@ pcm.name {
                         SCHANNEL REAL   # route value (0.0 - 1.0)
                 }
         }
+        [chmap MAP]             # Override channel maps; MAP is a string array
 }
 \endcode
 
@@ -1292,6 +1301,7 @@ int _snd_pcm_route_open(snd_pcm_t **pcmp, const char *name,
 	snd_pcm_route_ttable_entry_t *ttable = NULL;
 	unsigned int csize, ssize;
 	unsigned int cused, sused;
+	snd_pcm_chmap_query_t **chmaps = NULL;
 	snd_config_for_each(i, next, conf) {
 		snd_config_t *n = snd_config_iterator_entry(i);
 		const char *id;
@@ -1306,31 +1316,45 @@ int _snd_pcm_route_open(snd_pcm_t **pcmp, const char *name,
 		if (strcmp(id, "ttable") == 0) {
 			if (snd_config_get_type(n) != SND_CONFIG_TYPE_COMPOUND) {
 				SNDERR("Invalid type for %s", id);
+				snd_pcm_free_chmaps(chmaps);
 				return -EINVAL;
 			}
 			tt = n;
 			continue;
 		}
+		if (strcmp(id, "chmap") == 0) {
+			chmaps = _snd_pcm_parse_config_chmaps(n);
+			if (!chmaps) {
+				SNDERR("Invalid channel map for %s", id);
+				return -EINVAL;
+			}
+			continue;
+		}
 		SNDERR("Unknown field %s", id);
 		return -EINVAL;
 	}
 	if (!slave) {
 		SNDERR("slave is not defined");
+		snd_pcm_free_chmaps(chmaps);
 		return -EINVAL;
 	}
 	if (!tt) {
 		SNDERR("ttable is not defined");
+		snd_pcm_free_chmaps(chmaps);
 		return -EINVAL;
 	}
 	err = snd_pcm_slave_conf(root, slave, &sconf, 2,
 				 SND_PCM_HW_PARAM_FORMAT, 0, &sformat,
 				 SND_PCM_HW_PARAM_CHANNELS, 0, &schannels);
-	if (err < 0)
+	if (err < 0) {
+		snd_pcm_free_chmaps(chmaps);
 		return err;
+	}
 	if (sformat != SND_PCM_FORMAT_UNKNOWN &&
 	    snd_pcm_format_linear(sformat) != 1) {
 	    	snd_config_delete(sconf);
 		SNDERR("slave format is not linear");
+		snd_pcm_free_chmaps(chmaps);
 		return -EINVAL;
 	}
 
@@ -1345,13 +1369,19 @@ int _snd_pcm_route_open(snd_pcm_t **pcmp, const char *name,
 	if (err < 0) {
 		free(tt_chmap);
 		free(ttable);
+		snd_pcm_free_chmaps(chmaps);
 		return err;
 	}
 
 	if (tt_chmap) {
-		err = find_matching_chmap(spcm, tt_chmap, &chmap, &schannels);
+		if (!chmaps)
+			chmaps = snd_pcm_query_chmaps(spcm);
+		if (chmaps)
+			err = find_matching_chmap(chmaps, tt_chmap, &chmap,
+						  &schannels);
 		free(tt_chmap);
-		if (err < 0) {
+		if (chmaps && err < 0) {
+			snd_pcm_free_chmaps(chmaps);
 			snd_pcm_close(spcm);
 			return err;
 		}
@@ -1360,12 +1390,14 @@ int _snd_pcm_route_open(snd_pcm_t **pcmp, const char *name,
 	err = _snd_pcm_route_determine_ttable(tt, &csize, &ssize, chmap);
 	if (err < 0) {
 		free(chmap);
+		snd_pcm_free_chmaps(chmaps);
 		snd_pcm_close(spcm);
 		return err;
 	}
 	ttable = malloc(csize * ssize * sizeof(snd_pcm_route_ttable_entry_t));
 	if (ttable == NULL) {
 		free(chmap);
+		snd_pcm_free_chmaps(chmaps);
 		snd_pcm_close(spcm);
 		return -ENOMEM;
 	}
@@ -1374,6 +1406,7 @@ int _snd_pcm_route_open(snd_pcm_t **pcmp, const char *name,
 	if (err < 0) {
 		free(chmap);
 		free(ttable);
+		snd_pcm_free_chmaps(chmaps);
 		snd_pcm_close(spcm);
 		return err;
 	}
@@ -1385,9 +1418,13 @@ int _snd_pcm_route_open(snd_pcm_t **pcmp, const char *name,
 	free(ttable);
 	if (err < 0) {
 		free(chmap);
+		snd_pcm_free_chmaps(chmaps);
 		snd_pcm_close(spcm);
 	} else {
-		((snd_pcm_route_t*) (*pcmp)->private_data)->chmap = chmap;
+		snd_pcm_route_t *route = (*pcmp)->private_data;
+
+		route->chmap = chmap;
+		route->chmap_override = chmaps;
 	}
 
 	return err;
-- 
2.24.1

