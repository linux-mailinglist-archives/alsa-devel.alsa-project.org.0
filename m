Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 267D61E3572
	for <lists+alsa-devel@lfdr.de>; Wed, 27 May 2020 04:19:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8CF6178B;
	Wed, 27 May 2020 04:18:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8CF6178B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590545980;
	bh=4nvRZD2EMmldKoqWu9zUG75ESWlSqxhpLM5kxBr7W4I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LxNts6WDy+lqmcino9pVuI9YDqY49gMd8F7ukFQrXe1e2eJ2kWIrPNDmCZIr4nwOy
	 31eMOa4ay9sW/DOT0Si9VX1Quj2c/vAlkVZPFxIlESr7ikaHH6fiWiQ5/iMH6Kg1H2
	 6v/D+fQkldgMHCW183T3M5aCf0pc65ifpGk43AEM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 169ACF80299;
	Wed, 27 May 2020 04:17:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEB4AF8029B; Wed, 27 May 2020 04:16:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D85FF80299
 for <alsa-devel@alsa-project.org>; Wed, 27 May 2020 04:16:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D85FF80299
IronPort-SDR: rbJGmvv1dz/prQt2GCwAyp3VaRaBGJm409dL5MTZgtPtkO7zssYXA+F/TjRuOEVkzMuBr1lTGP
 K5ZKo9yr61Tw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2020 19:16:37 -0700
IronPort-SDR: fQ5w+V4sjVMzp4Qf1D+VAr97zDGgQR4WvkrMp3r4/CFcsR1PV+1v3Wu2SvEVKG7yPPznq184Hx
 lCFr6Cr6Bo8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,439,1583222400"; d="scan'208";a="468534135"
Received: from keyon-x299.sh.intel.com ([10.239.159.75])
 by fmsmga005.fm.intel.com with ESMTP; 26 May 2020 19:16:35 -0700
From: Keyon Jie <yang.jie@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 2/2] ASoC: topology: remove the redundant pass checks
Date: Wed, 27 May 2020 10:28:01 +0800
Message-Id: <20200527022801.336264-3-yang.jie@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200527022801.336264-1-yang.jie@linux.intel.com>
References: <20200527022801.336264-1-yang.jie@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: cezary.rojewski@intel.com, tiwai@suse.de,
 Keyon Jie <yang.jie@linux.intel.com>, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, broonie@kernel.org,
 sathya.prakash.m.r@intel.com, vamshi.krishna.gopal@intel.com
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

As we have check the 'pass' in the soc_elem_pass_load(), so no need to
check it again in each specific elem_load function, at the same time,
the tplg->pos will be reset to the next header base when the pass is
mismatched, so the increasing of the tplg->pos in these cases made no
sense. Here remove all of them.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Tested-by: Vamshi Kerishna Gopal <vamshi.krishna.gopal@intel.com>
Tested-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/soc-topology.c | 46 ++--------------------------------------
 1 file changed, 2 insertions(+), 44 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index f0a1a47d9808..9e89633676b7 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -246,8 +246,8 @@ static inline void soc_control_err(struct soc_tplg *tplg,
 }
 
 /* pass vendor data to component driver for processing */
-static int soc_tplg_vendor_load_(struct soc_tplg *tplg,
-	struct snd_soc_tplg_hdr *hdr)
+static int soc_tplg_vendor_load(struct soc_tplg *tplg,
+				struct snd_soc_tplg_hdr *hdr)
 {
 	int ret = 0;
 
@@ -268,16 +268,6 @@ static int soc_tplg_vendor_load_(struct soc_tplg *tplg,
 	return ret;
 }
 
-/* pass vendor data to component driver for processing */
-static int soc_tplg_vendor_load(struct soc_tplg *tplg,
-	struct snd_soc_tplg_hdr *hdr)
-{
-	if (tplg->pass != SOC_TPLG_PASS_VENDOR)
-		return 0;
-
-	return soc_tplg_vendor_load_(tplg, hdr);
-}
-
 /* optionally pass new dynamic widget to component driver. This is mainly for
  * external widgets where we can assign private data/ops */
 static int soc_tplg_widget_load(struct soc_tplg *tplg,
@@ -1127,12 +1117,6 @@ static int soc_tplg_kcontrol_elems_load(struct soc_tplg *tplg,
 	int ret;
 	int i;
 
-	if (tplg->pass != SOC_TPLG_PASS_MIXER) {
-		tplg->pos += le32_to_cpu(hdr->size) +
-			le32_to_cpu(hdr->payload_size);
-		return 0;
-	}
-
 	dev_dbg(tplg->dev, "ASoC: adding %d kcontrols at 0x%lx\n", hdr->count,
 		soc_tplg_get_offset(tplg));
 
@@ -1204,14 +1188,6 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
 
 	count = le32_to_cpu(hdr->count);
 
-	if (tplg->pass != SOC_TPLG_PASS_GRAPH) {
-		tplg->pos +=
-			le32_to_cpu(hdr->size) +
-			le32_to_cpu(hdr->payload_size);
-
-		return 0;
-	}
-
 	if (soc_tplg_check_elem_count(tplg,
 		sizeof(struct snd_soc_tplg_dapm_graph_elem),
 		count, le32_to_cpu(hdr->payload_size), "graph")) {
@@ -1741,9 +1717,6 @@ static int soc_tplg_dapm_widget_elems_load(struct soc_tplg *tplg,
 
 	count = le32_to_cpu(hdr->count);
 
-	if (tplg->pass != SOC_TPLG_PASS_WIDGET)
-		return 0;
-
 	dev_dbg(tplg->dev, "ASoC: adding %d DAPM widgets\n", count);
 
 	for (i = 0; i < count; i++) {
@@ -2101,9 +2074,6 @@ static int soc_tplg_pcm_elems_load(struct soc_tplg *tplg,
 
 	count = le32_to_cpu(hdr->count);
 
-	if (tplg->pass != SOC_TPLG_PASS_PCM_DAI)
-		return 0;
-
 	/* check the element size and count */
 	pcm = (struct snd_soc_tplg_pcm *)tplg->pos;
 	size = le32_to_cpu(pcm->size);
@@ -2386,12 +2356,6 @@ static int soc_tplg_link_elems_load(struct soc_tplg *tplg,
 
 	count = le32_to_cpu(hdr->count);
 
-	if (tplg->pass != SOC_TPLG_PASS_LINK) {
-		tplg->pos += le32_to_cpu(hdr->size) +
-			le32_to_cpu(hdr->payload_size);
-		return 0;
-	}
-
 	/* check the element size and count */
 	link = (struct snd_soc_tplg_link_config *)tplg->pos;
 	size = le32_to_cpu(link->size);
@@ -2528,9 +2492,6 @@ static int soc_tplg_dai_elems_load(struct soc_tplg *tplg,
 
 	count = le32_to_cpu(hdr->count);
 
-	if (tplg->pass != SOC_TPLG_PASS_BE_DAI)
-		return 0;
-
 	/* config the existing BE DAIs */
 	for (i = 0; i < count; i++) {
 		dai = (struct snd_soc_tplg_dai *)tplg->pos;
@@ -2610,9 +2571,6 @@ static int soc_tplg_manifest_load(struct soc_tplg *tplg,
 	bool abi_match;
 	int ret = 0;
 
-	if (tplg->pass != SOC_TPLG_PASS_MANIFEST)
-		return 0;
-
 	manifest = (struct snd_soc_tplg_manifest *)tplg->pos;
 
 	/* check ABI version by size, create a new manifest if abi not match */
-- 
2.25.1

