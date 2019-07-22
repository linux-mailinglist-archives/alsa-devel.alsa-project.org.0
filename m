Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B2B7025D
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 16:29:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EE97183E;
	Mon, 22 Jul 2019 16:28:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EE97183E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563805761;
	bh=yz9e3ZiqjjCUxNP5envj7FvxnZt8qd1R23Dl++PsIyU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=giEeuXF/p5ALdXIQeoLwr5NxRokgJbjP4KrWl3SAAG7vJJ6iv9xbcTBr7Mj0HofcM
	 hPLUz9INW4RbJ59hsRFT01UZEK414fQ+8peZB2vaSrtIqPdgFBOq66T6OPvUEKqChn
	 2gcMqxRYu52q76l5T3fsByxB8u2Ixx80OWgi1Gxc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5A96F8070D;
	Mon, 22 Jul 2019 16:14:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B1E6F803D6; Mon, 22 Jul 2019 16:14:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 746FCF804CF
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 16:14:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 746FCF804CF
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jul 2019 07:14:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,295,1559545200"; d="scan'208";a="192733311"
Received: from agalla-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.254.103.46])
 by fmsmga004.fm.intel.com with ESMTP; 22 Jul 2019 07:14:23 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 22 Jul 2019 09:14:02 -0500
Message-Id: <20190722141402.7194-22-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722141402.7194-1-pierre-louis.bossart@linux.intel.com>
References: <20190722141402.7194-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Janusz Jankowski <janusz.jankowski@linux.intel.com>
Subject: [alsa-devel] [PATCH 21/21] ASoC: SOF: Intel: ssp: BCLK delay
	parameter
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Janusz Jankowski <janusz.jankowski@linux.intel.com>

Some codecs require BCLK to be on for some time, before sending
any data. SOF can enable BCLK and then wait for guaranteed time,
before starting DMA on SSP start.

Signed-off-by: Janusz Jankowski <janusz.jankowski@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof/dai-intel.h   | 3 +++
 include/uapi/sound/sof/abi.h    | 2 +-
 include/uapi/sound/sof/tokens.h | 1 +
 sound/soc/sof/topology.c        | 3 +++
 4 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/sound/sof/dai-intel.h b/include/sound/sof/dai-intel.h
index 4bb8ee138ba7..a81afd3fbd41 100644
--- a/include/sound/sof/dai-intel.h
+++ b/include/sound/sof/dai-intel.h
@@ -76,6 +76,9 @@ struct sof_ipc_dai_ssp_params {
 	uint16_t tdm_per_slot_padding_flag;
 	uint32_t clks_control;
 	uint32_t quirks;
+	uint32_t bclk_delay;	/* guaranteed time (ms) for which BCLK
+				 * will be driven, before sending data
+				 */
 } __packed;
 
 /* HDA Configuration Request - SOF_IPC_DAI_HDA_CONFIG */
diff --git a/include/uapi/sound/sof/abi.h b/include/uapi/sound/sof/abi.h
index 4a9c24434f42..dff70a42445a 100644
--- a/include/uapi/sound/sof/abi.h
+++ b/include/uapi/sound/sof/abi.h
@@ -26,7 +26,7 @@
 
 /* SOF ABI version major, minor and patch numbers */
 #define SOF_ABI_MAJOR 3
-#define SOF_ABI_MINOR 8
+#define SOF_ABI_MINOR 9
 #define SOF_ABI_PATCH 0
 
 /* SOF ABI version number. Format within 32bit word is MMmmmppp */
diff --git a/include/uapi/sound/sof/tokens.h b/include/uapi/sound/sof/tokens.h
index dc1b27daaac6..6435240cef13 100644
--- a/include/uapi/sound/sof/tokens.h
+++ b/include/uapi/sound/sof/tokens.h
@@ -75,6 +75,7 @@
 #define SOF_TKN_INTEL_SSP_FRAME_PULSE_WIDTH	503
 #define SOF_TKN_INTEL_SSP_QUIRKS		504
 #define SOF_TKN_INTEL_SSP_TDM_PADDING_PER_SLOT	505
+#define SOF_TKN_INTEL_SSP_BCLK_DELAY		506
 
 /* DMIC */
 #define SOF_TKN_INTEL_DMIC_DRIVER_VERSION	600
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 432ae343f960..12b7d900b9c2 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -748,6 +748,9 @@ static const struct sof_topology_token ssp_tokens[] = {
 		get_token_u16,
 		offsetof(struct sof_ipc_dai_ssp_params,
 			 tdm_per_slot_padding_flag), 0},
+	{SOF_TKN_INTEL_SSP_BCLK_DELAY, SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		get_token_u32,
+		offsetof(struct sof_ipc_dai_ssp_params, bclk_delay), 0},
 
 };
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
