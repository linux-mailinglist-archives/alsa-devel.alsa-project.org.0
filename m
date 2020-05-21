Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEC61DC7D4
	for <lists+alsa-devel@lfdr.de>; Thu, 21 May 2020 09:39:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3996A182A;
	Thu, 21 May 2020 09:39:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3996A182A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590046794;
	bh=q2ASjOdq4QP2I6jr8bdVZbhcU/sR9zuGYALdnUrrGcY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zax9i4YTnYmx3bBz1HxE7zosYDqE/AcExbYzXWklCkz4Ub/Agv0wiF0TvKWw135kP
	 +tnTqJW819UT4CaYxWDZwQDOjJSNg81s42itQ3mWnCCihfYD1pgjMrFYfQ9ZH4lt7y
	 Dun94t7YEm2I8K94NvpArUZDIekqm2d+8+59UXBY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10D51F8028E;
	Thu, 21 May 2020 09:37:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13D97F801A3; Thu, 21 May 2020 09:37:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8AC2F801A3
 for <alsa-devel@alsa-project.org>; Thu, 21 May 2020 09:37:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8AC2F801A3
IronPort-SDR: OWKsmfzOxrZ8GcsxyXLc2Ke8OuszL0k0XEFeCZ+rYAGHl/Rl3piddO+8hpya+EvUki2ltK1WiB
 vCGfN4BwodHQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2020 00:37:05 -0700
IronPort-SDR: NWmtzfKW0SoS5+FFNmFBfTtft7eXZxDOAl6mqqaYM2MnI+0OpGqE0kPXrBQguRXJ4n/zoYbO6G
 jYt4SaYdaLWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,417,1583222400"; d="scan'208";a="268548062"
Received: from keyon-x299.sh.intel.com ([10.239.159.75])
 by orsmga006.jf.intel.com with ESMTP; 21 May 2020 00:37:02 -0700
From: Keyon Jie <yang.jie@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 2/2] ASoC: topology: remove the redundant pass checks
Date: Thu, 21 May 2020 15:48:47 +0800
Message-Id: <20200521074847.71406-3-yang.jie@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200521074847.71406-1-yang.jie@linux.intel.com>
References: <20200521074847.71406-1-yang.jie@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: cezary.rojewski@intel.com, tiwai@suse.de,
 Keyon Jie <yang.jie@linux.intel.com>, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, broonie@kernel.org
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
---
 sound/soc/soc-topology.c | 46 ++--------------------------------------
 1 file changed, 2 insertions(+), 44 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 70c0ff7ce13f..6f4269ffd84f 100644
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

