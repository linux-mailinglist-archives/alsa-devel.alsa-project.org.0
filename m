Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA53B4193D3
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 14:07:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52F0E16AD;
	Mon, 27 Sep 2021 14:06:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52F0E16AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632744460;
	bh=H8WkfszTsBbu2dLrYyIZ+mlXR07nAVNkBaLbWcT/J2w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oVu25I/KPFStwsp5/MeKHCGjPkqoKoZLkx1QrFlcOmCunB+EeZdd3JI5QXlM/4LFD
	 0Xq39Rxe1WFD6U6uCa9z+ZSleI5Q6S/FMLMrWhiYk/GuaJdJi45vRIjX1sI9wAX/uM
	 PR89+710DbkiSYmc1Ns26mXJzPlvubKcTwV3+AYA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22517F804EC;
	Mon, 27 Sep 2021 14:05:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5780F804E3; Mon, 27 Sep 2021 14:05:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B258F80161
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 14:05:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B258F80161
X-IronPort-AV: E=McAfee;i="6200,9189,10119"; a="221260448"
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="221260448"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 05:05:20 -0700
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="553164352"
Received: from unknown (HELO pujfalus-desk.ger.corp.intel.com)
 ([10.251.220.221])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 05:05:17 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, daniel.baluta@nxp.com
Subject: [PATCH v3 01/12] ASoC: topology: change the complete op in
 snd_soc_tplg_ops to return int
Date: Mon, 27 Sep 2021 15:05:06 +0300
Message-Id: <20210927120517.20505-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210927120517.20505-1-peter.ujfalusi@linux.intel.com>
References: <20210927120517.20505-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 seppo.ingalsuo@intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

In the SOF driver, the operations performed in the complete callback
can fail and therefore topology loading should return an error in
such cases. So, change the signature of the complete op
in struct snd_soc_tplg_ops to return an int to return the error.

Also, amend the complete callback functions in the SOF driver and
the SKL driver to conform with the new signature.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/soc-topology.h           |  2 +-
 sound/soc/intel/skylake/skl-topology.c |  6 ++++--
 sound/soc/soc-topology.c               | 10 ++++++----
 sound/soc/sof/topology.c               | 12 ++++++++----
 4 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/include/sound/soc-topology.h b/include/sound/soc-topology.h
index 4afd667e124c..7f33de8ffd95 100644
--- a/include/sound/soc-topology.h
+++ b/include/sound/soc-topology.h
@@ -151,7 +151,7 @@ struct snd_soc_tplg_ops {
 		struct snd_soc_tplg_hdr *);
 
 	/* completion - called at completion of firmware loading */
-	void (*complete)(struct snd_soc_component *);
+	int (*complete)(struct snd_soc_component *comp);
 
 	/* manifest - optional to inform component of manifest */
 	int (*manifest)(struct snd_soc_component *, int index,
diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index b036852d6889..89e4231304dd 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -3637,7 +3637,7 @@ static int skl_manifest_load(struct snd_soc_component *cmpnt, int index,
 	return 0;
 }
 
-static void skl_tplg_complete(struct snd_soc_component *component)
+static int skl_tplg_complete(struct snd_soc_component *component)
 {
 	struct snd_soc_dobj *dobj;
 	struct snd_soc_acpi_mach *mach;
@@ -3646,7 +3646,7 @@ static void skl_tplg_complete(struct snd_soc_component *component)
 
 	val = kmalloc(sizeof(*val), GFP_KERNEL);
 	if (!val)
-		return;
+		return -ENOMEM;
 
 	mach = dev_get_platdata(component->card->dev);
 	list_for_each_entry(dobj, &component->dobj_list, list) {
@@ -3671,7 +3671,9 @@ static void skl_tplg_complete(struct snd_soc_component *component)
 			}
 		}
 	}
+
 	kfree(val);
+	return 0;
 }
 
 static struct snd_soc_tplg_ops skl_tplg_ops  = {
diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 73e1b7b48ce9..88f849b119da 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -78,7 +78,7 @@ struct soc_tplg {
 };
 
 static int soc_tplg_process_headers(struct soc_tplg *tplg);
-static void soc_tplg_complete(struct soc_tplg *tplg);
+static int soc_tplg_complete(struct soc_tplg *tplg);
 
 /* check we dont overflow the data for this control chunk */
 static int soc_tplg_check_elem_count(struct soc_tplg *tplg, size_t elem_size,
@@ -312,10 +312,12 @@ static int soc_tplg_dai_link_load(struct soc_tplg *tplg,
 }
 
 /* tell the component driver that all firmware has been loaded in this request */
-static void soc_tplg_complete(struct soc_tplg *tplg)
+static int soc_tplg_complete(struct soc_tplg *tplg)
 {
 	if (tplg->ops && tplg->ops->complete)
-		tplg->ops->complete(tplg->comp);
+		return tplg->ops->complete(tplg->comp);
+
+	return 0;
 }
 
 /* add a dynamic kcontrol */
@@ -2625,7 +2627,7 @@ static int soc_tplg_load(struct soc_tplg *tplg)
 
 	ret = soc_tplg_process_headers(tplg);
 	if (ret == 0)
-		soc_tplg_complete(tplg);
+		return soc_tplg_complete(tplg);
 
 	return ret;
 }
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index cc9585bfa4e9..96b8791f7cc1 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -3567,10 +3567,11 @@ int snd_sof_complete_pipeline(struct device *dev,
 }
 
 /* completion - called at completion of firmware loading */
-static void sof_complete(struct snd_soc_component *scomp)
+static int sof_complete(struct snd_soc_component *scomp)
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct snd_sof_widget *swidget;
+	int ret;
 
 	/* some widget types require completion notificattion */
 	list_for_each_entry(swidget, &sdev->widget_list, list) {
@@ -3579,8 +3580,11 @@ static void sof_complete(struct snd_soc_component *scomp)
 
 		switch (swidget->id) {
 		case snd_soc_dapm_scheduler:
-			swidget->complete =
-				snd_sof_complete_pipeline(scomp->dev, swidget);
+			ret = snd_sof_complete_pipeline(scomp->dev, swidget);
+			if (ret < 0)
+				return ret;
+
+			swidget->complete = ret;
 			break;
 		default:
 			break;
@@ -3590,7 +3594,7 @@ static void sof_complete(struct snd_soc_component *scomp)
 	 * cache initial values of SOF kcontrols by reading DSP value over
 	 * IPC. It may be overwritten by alsa-mixer after booting up
 	 */
-	snd_sof_cache_kcontrol_val(scomp);
+	return snd_sof_cache_kcontrol_val(scomp);
 }
 
 /* manifest - optional to inform component of manifest */
-- 
2.33.0

