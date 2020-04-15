Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF491AB2A2
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 22:42:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADAF61616;
	Wed, 15 Apr 2020 22:41:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADAF61616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586983361;
	bh=6F8vJhA98c6imaIc2K8lnIxoEwR8ORMUWBhvmct1R2Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AST+B4Xcg8dke5nDeeBhAyAYFaDBB69ZF8ig2XOdahK1wuaT/jr5IMrrNWKQ7bFdW
	 Jn6XTXy6lRJcdNnmt+FPav466ziH3vkpc0R+uB17NZLqI4LKIEoBjhg4R7n0FNUwus
	 fzoAQ8nLPRMAkwxu831g08+p0YVX3SbTGXz6dFqc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 966CEF80361;
	Wed, 15 Apr 2020 22:29:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99720F80303; Wed, 15 Apr 2020 22:29:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 517E6F802E2
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 22:29:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 517E6F802E2
IronPort-SDR: EHhbkgyfIuf+WXSiUh15hVhGxwxPMGVNUF2TymLEq2mwg/YG9mBk4JnxsQUdPIyfoamHl0jCMF
 6aFpYoVjxRQw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 13:29:22 -0700
IronPort-SDR: Y+O+rTvjOkdIPCrnHO4Z9aRw32wWdiezp9sEg4VBmF/sHJIz9TtAc8cfqQx9EYvf4Qggwo8rG2
 JfcKAmFVeegA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,388,1580803200"; d="scan'208";a="288656344"
Received: from jplam-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.82.197])
 by fmsmga002.fm.intel.com with ESMTP; 15 Apr 2020 13:29:21 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 22/24] ASoC: SOF: topology: Get HDA rate and channels from
 topology
Date: Wed, 15 Apr 2020 15:28:14 -0500
Message-Id: <20200415202816.934-23-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415202816.934-1-pierre-louis.bossart@linux.intel.com>
References: <20200415202816.934-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>
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

From: Bard Liao <yung-chuan.liao@linux.intel.com>

FW interface for HDA DAI parameters was extended with information on
sampling rate and channel count in version 3.16. Align kernel header
with the FW change. This change is backwards compatible. Old firmware
will ignore the values.

Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof/dai-intel.h   | 2 ++
 include/uapi/sound/sof/abi.h    | 2 +-
 include/uapi/sound/sof/tokens.h | 4 ++++
 sound/soc/sof/topology.c        | 9 +++++++++
 4 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/include/sound/sof/dai-intel.h b/include/sound/sof/dai-intel.h
index 4db906c4a534..896db2243d87 100644
--- a/include/sound/sof/dai-intel.h
+++ b/include/sound/sof/dai-intel.h
@@ -88,6 +88,8 @@ struct sof_ipc_dai_ssp_params {
 struct sof_ipc_dai_hda_params {
 	struct sof_ipc_hdr hdr;
 	uint32_t link_dma_ch;
+	uint32_t rate;
+	uint32_t channels;
 } __packed;
 
 /* ALH Configuration Request - SOF_IPC_DAI_ALH_CONFIG */
diff --git a/include/uapi/sound/sof/abi.h b/include/uapi/sound/sof/abi.h
index 6c802a2386ef..d54be303090f 100644
--- a/include/uapi/sound/sof/abi.h
+++ b/include/uapi/sound/sof/abi.h
@@ -26,7 +26,7 @@
 
 /* SOF ABI version major, minor and patch numbers */
 #define SOF_ABI_MAJOR 3
-#define SOF_ABI_MINOR 15
+#define SOF_ABI_MINOR 16
 #define SOF_ABI_PATCH 0
 
 /* SOF ABI version number. Format within 32bit word is MMmmmppp */
diff --git a/include/uapi/sound/sof/tokens.h b/include/uapi/sound/sof/tokens.h
index b7ad1cd4526a..5941e2eb1588 100644
--- a/include/uapi/sound/sof/tokens.h
+++ b/include/uapi/sound/sof/tokens.h
@@ -130,4 +130,8 @@
 #define SOF_TKN_INTEL_ALH_RATE			1400
 #define SOF_TKN_INTEL_ALH_CH			1401
 
+/* HDA */
+#define SOF_TKN_INTEL_HDA_RATE			1500
+#define SOF_TKN_INTEL_HDA_CH			1501
+
 #endif
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 51d19ffe35b3..a1287924a12d 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -753,6 +753,12 @@ static const struct sof_topology_token dmic_pdm_tokens[] = {
 
 /* HDA */
 static const struct sof_topology_token hda_tokens[] = {
+	{SOF_TKN_INTEL_HDA_RATE,
+		SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc_dai_hda_params, rate), 0},
+	{SOF_TKN_INTEL_HDA_CH,
+		SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc_dai_hda_params, channels), 0},
 };
 
 /* Leds */
@@ -3083,6 +3089,9 @@ static int sof_link_hda_load(struct snd_soc_component *scomp, int index,
 		return ret;
 	}
 
+	dev_dbg(scomp->dev, "HDA config rate %d channels %d\n",
+		config->hda.rate, config->hda.channels);
+
 	dai = snd_soc_find_dai(link->cpus);
 	if (!dai) {
 		dev_err(scomp->dev, "error: failed to find dai %s in %s",
-- 
2.20.1

