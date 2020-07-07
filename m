Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F9C2179A3
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 22:43:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1144168E;
	Tue,  7 Jul 2020 22:42:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1144168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594154596;
	bh=Ta0OouKo/ebi3WGFn6ZN5ZkTJeSjvTpbfRsg+/rHSDE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AcaOxBpjwWd6tk+NBP0fTVjralyggfxpcFMkxZlC3evx5JsJjP1vCdg9rucT1pzkf
	 7Au9imB3tGEd8+JGCc2M/gzfC9XJWcc8Q+Cp0qvr1P/FQTGsqMBGNoJKy/rvihyuxk
	 3yuSu75WWFZOu6qZ5BTpJqmiN3Li+pew1SjPRiBE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C64ABF802E8;
	Tue,  7 Jul 2020 22:38:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C85E9F802DF; Tue,  7 Jul 2020 22:38:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABDA4F80257
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 22:38:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABDA4F80257
IronPort-SDR: tnej+uOSZK3zX4jWNuFMMopVtektvtYzifXC5Y4Lh6xk9aVrk2SnFAapv620ZLMFV+lCs0SIrl
 1p0ruQu0F6YQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="147700570"
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="147700570"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 13:38:23 -0700
IronPort-SDR: Otrtj5swxbIPn8oVrgBYx8Z9UjANBvKXwMdKnV3GgJVoDDMAm0L0AYvRaBbrT74bUB+xweVNpY
 NA/Jsst2XSOQ==
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="483640818"
Received: from colvinch-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.229.3])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 13:38:23 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/5] ASoC: topology: use break on errors, not continue
Date: Tue,  7 Jul 2020 15:37:47 -0500
Message-Id: <20200707203749.113883-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707203749.113883-1-pierre-louis.bossart@linux.intel.com>
References: <20200707203749.113883-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

Since the beginning of the topology, the code continues to the next
object even when an error is detected.

The topology should be handled with an all-or-nothing design, loading
a partially valid topology is a sure way to get bug reports that are
difficult to deal with.

Changing the behavior may break previous solutions and expose problems
in topology files delivered in the past, so it's probably not wise to
add this patch to stable branches without revalidation.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/soc-topology.c | 53 +++++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 25 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 6eaa00c21011..d42f73f7038f 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -741,7 +741,8 @@ static int soc_tplg_dbytes_create(struct soc_tplg *tplg, unsigned int count,
 	struct snd_soc_tplg_bytes_control *be;
 	struct soc_bytes_ext *sbe;
 	struct snd_kcontrol_new kc;
-	int i, err;
+	int i;
+	int err = 0;
 
 	if (soc_tplg_check_elem_count(tplg,
 		sizeof(struct snd_soc_tplg_bytes_control), count,
@@ -786,7 +787,7 @@ static int soc_tplg_dbytes_create(struct soc_tplg *tplg, unsigned int count,
 		if (err) {
 			soc_control_err(tplg, &be->hdr, be->hdr.name);
 			kfree(sbe);
-			continue;
+			break;
 		}
 
 		/* pass control to driver for optional further init */
@@ -796,7 +797,7 @@ static int soc_tplg_dbytes_create(struct soc_tplg *tplg, unsigned int count,
 			dev_err(tplg->dev, "ASoC: failed to init %s\n",
 				be->hdr.name);
 			kfree(sbe);
-			continue;
+			break;
 		}
 
 		/* register control here */
@@ -806,12 +807,12 @@ static int soc_tplg_dbytes_create(struct soc_tplg *tplg, unsigned int count,
 			dev_err(tplg->dev, "ASoC: failed to add %s\n",
 				be->hdr.name);
 			kfree(sbe);
-			continue;
+			break;
 		}
 
 		list_add(&sbe->dobj.list, &tplg->comp->dobj_list);
 	}
-	return 0;
+	return err;
 
 }
 
@@ -821,7 +822,8 @@ static int soc_tplg_dmixer_create(struct soc_tplg *tplg, unsigned int count,
 	struct snd_soc_tplg_mixer_control *mc;
 	struct soc_mixer_control *sm;
 	struct snd_kcontrol_new kc;
-	int i, err;
+	int i;
+	int err = 0;
 
 	if (soc_tplg_check_elem_count(tplg,
 		sizeof(struct snd_soc_tplg_mixer_control),
@@ -880,7 +882,7 @@ static int soc_tplg_dmixer_create(struct soc_tplg *tplg, unsigned int count,
 		if (err) {
 			soc_control_err(tplg, &mc->hdr, mc->hdr.name);
 			kfree(sm);
-			continue;
+			break;
 		}
 
 		/* create any TLV data */
@@ -889,7 +891,7 @@ static int soc_tplg_dmixer_create(struct soc_tplg *tplg, unsigned int count,
 			dev_err(tplg->dev, "ASoC: failed to create TLV %s\n",
 				mc->hdr.name);
 			kfree(sm);
-			continue;
+			break;
 		}
 
 		/* pass control to driver for optional further init */
@@ -900,7 +902,7 @@ static int soc_tplg_dmixer_create(struct soc_tplg *tplg, unsigned int count,
 				mc->hdr.name);
 			soc_tplg_free_tlv(tplg, &kc);
 			kfree(sm);
-			continue;
+			break;
 		}
 
 		/* register control here */
@@ -911,13 +913,13 @@ static int soc_tplg_dmixer_create(struct soc_tplg *tplg, unsigned int count,
 				mc->hdr.name);
 			soc_tplg_free_tlv(tplg, &kc);
 			kfree(sm);
-			continue;
+			break;
 		}
 
 		list_add(&sm->dobj.list, &tplg->comp->dobj_list);
 	}
 
-	return 0;
+	return err;
 }
 
 static int soc_tplg_denum_create_texts(struct soc_enum *se,
@@ -997,7 +999,8 @@ static int soc_tplg_denum_create(struct soc_tplg *tplg, unsigned int count,
 	struct snd_soc_tplg_enum_control *ec;
 	struct soc_enum *se;
 	struct snd_kcontrol_new kc;
-	int i, ret, err;
+	int i;
+	int err = 0;
 
 	if (soc_tplg_check_elem_count(tplg,
 		sizeof(struct snd_soc_tplg_enum_control),
@@ -1053,7 +1056,7 @@ static int soc_tplg_denum_create(struct soc_tplg *tplg, unsigned int count,
 					"ASoC: could not create values for %s\n",
 					ec->hdr.name);
 				kfree(se);
-				continue;
+				goto err_denum;
 			}
 			/* fall through */
 		case SND_SOC_TPLG_CTL_ENUM:
@@ -1065,15 +1068,16 @@ static int soc_tplg_denum_create(struct soc_tplg *tplg, unsigned int count,
 					"ASoC: could not create texts for %s\n",
 					ec->hdr.name);
 				kfree(se);
-				continue;
+				goto err_denum;
 			}
 			break;
 		default:
+			err = -EINVAL;
 			dev_err(tplg->dev,
 				"ASoC: invalid enum control type %d for %s\n",
 				ec->hdr.ops.info, ec->hdr.name);
 			kfree(se);
-			continue;
+			goto err_denum;
 		}
 
 		/* map io handlers */
@@ -1081,7 +1085,7 @@ static int soc_tplg_denum_create(struct soc_tplg *tplg, unsigned int count,
 		if (err) {
 			soc_control_err(tplg, &ec->hdr, ec->hdr.name);
 			kfree(se);
-			continue;
+			goto err_denum;
 		}
 
 		/* pass control to driver for optional further init */
@@ -1091,23 +1095,23 @@ static int soc_tplg_denum_create(struct soc_tplg *tplg, unsigned int count,
 			dev_err(tplg->dev, "ASoC: failed to init %s\n",
 				ec->hdr.name);
 			kfree(se);
-			continue;
+			goto err_denum;
 		}
 
 		/* register control here */
-		ret = soc_tplg_add_kcontrol(tplg,
-			&kc, &se->dobj.control.kcontrol);
-		if (ret < 0) {
+		err = soc_tplg_add_kcontrol(tplg,
+					    &kc, &se->dobj.control.kcontrol);
+		if (err < 0) {
 			dev_err(tplg->dev, "ASoC: could not add kcontrol %s\n",
 				ec->hdr.name);
 			kfree(se);
-			continue;
+			goto err_denum;
 		}
 
 		list_add(&se->dobj.list, &tplg->comp->dobj_list);
 	}
-
-	return 0;
+err_denum:
+	return err;
 }
 
 static int soc_tplg_kcontrol_elems_load(struct soc_tplg *tplg,
@@ -1361,8 +1365,7 @@ static struct snd_kcontrol_new *soc_tplg_dapm_widget_dmixer_create(
 		if (err < 0) {
 			dev_err(tplg->dev, "ASoC: failed to create TLV %s\n",
 				mc->hdr.name);
-			kfree(sm);
-			continue;
+			goto err_sm;
 		}
 
 		/* pass control to driver for optional further init */
-- 
2.25.1

