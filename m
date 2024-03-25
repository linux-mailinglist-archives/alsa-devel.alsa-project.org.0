Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F104588B3B9
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 23:14:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5401821DF;
	Mon, 25 Mar 2024 23:14:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5401821DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711404867;
	bh=ib5TuHlM6NnjBR9KEjhulILeTIHNUj0n85x/toUXsU0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jnYrnemQJZzJHrtQxsVwhxB8+Inbg/Z8UdJOeEq+txPCfChHXd50aQeMr/Tq+IZCJ
	 +K0PqB21UGxa7gBLxDNr6EjL8XbmISvJ4xfFNgZs2gjQOc6ZlszVDgyeBB1i6JDg9/
	 RSkCq2TBqH4plSuXPgZNTRs+dfDf5c0UnA6S6cvY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C0A3F8070C; Mon, 25 Mar 2024 23:12:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C917CF806E9;
	Mon, 25 Mar 2024 23:12:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01EE1F80636; Mon, 25 Mar 2024 23:11:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4E03EF80564
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 23:11:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E03EF80564
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=M4+QiMHX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711404686; x=1742940686;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ib5TuHlM6NnjBR9KEjhulILeTIHNUj0n85x/toUXsU0=;
  b=M4+QiMHXpjhOkNWAFx+BUKnAnodBnJMh0TX7BGqic1JBdsVj8KzHNw0B
   EQ1H5gZxS2uPNRO8+ojpptoeF9w0IvT6caYxlAGb7tPAeQ91bMPvLMKMM
   yJxpZPaajK7mqRO6lVJvVOm6TGF4lS6icCSQMESWNQr+7uBh7xM6RIMMT
   fhmN1y4I+rcnc+IQ3ijSputOcDnytuA0Z6rh+MVciXTpZrv11069M+8ss
   jyeDkzifmA8PJn4WiDkSE0ticxkkHsxDVEcS0pLx5kk2ZPjG68Y3Yw/FF
   It5ntG3WGLUu1ESOQhqZnm/5eedLyLG6o2OxBCglGMCXi73bKTsU+CyX3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6643629"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="6643629"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:11:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="15722115"
Received: from jaimbres-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.lan)
 ([10.212.98.109])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:11:19 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 07/21] ASoC: Intel: board_helpers: support sof_card_private
 initialization
Date: Mon, 25 Mar 2024 17:10:45 -0500
Message-Id: <20240325221059.206042-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
References: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Z7MHKGFO6UCNNBS35SGQH2OKXPHD7VDU
X-Message-ID-Hash: Z7MHKGFO6UCNNBS35SGQH2OKXPHD7VDU
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z7MHKGFO6UCNNBS35SGQH2OKXPHD7VDU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Add a helper function for machine drivers to initialize common part of
sof_card_private structure. Also unify the macros of board quirks for
the initialization.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_board_helpers.c | 43 ++++++++++++++++++++++
 sound/soc/intel/boards/sof_board_helpers.h | 40 ++++++++++++++++++++
 2 files changed, 83 insertions(+)

diff --git a/sound/soc/intel/boards/sof_board_helpers.c b/sound/soc/intel/boards/sof_board_helpers.c
index feba1a522527..a5135be94f32 100644
--- a/sound/soc/intel/boards/sof_board_helpers.c
+++ b/sound/soc/intel/boards/sof_board_helpers.c
@@ -587,6 +587,49 @@ int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
 }
 EXPORT_SYMBOL_NS(sof_intel_board_set_dai_link, SND_SOC_INTEL_SOF_BOARD_HELPERS);
 
+struct sof_card_private *
+sof_intel_board_get_ctx(struct device *dev, unsigned long board_quirk)
+{
+	struct sof_card_private *ctx;
+
+	dev_dbg(dev, "create ctx, board_quirk 0x%lx\n", board_quirk);
+
+	ctx = devm_kzalloc(dev, sizeof(struct sof_card_private), GFP_KERNEL);
+	if (!ctx)
+		return NULL;
+
+	ctx->codec_type = sof_ssp_detect_codec_type(dev);
+	ctx->amp_type = sof_ssp_detect_amp_type(dev);
+
+	ctx->dmic_be_num = 2;
+	ctx->hdmi_num = (board_quirk & SOF_NUM_IDISP_HDMI_MASK) >>
+			SOF_NUM_IDISP_HDMI_SHIFT;
+	/* default number of HDMI DAI's */
+	if (!ctx->hdmi_num)
+		ctx->hdmi_num = 3;
+
+	/* port number/mask of peripherals attached to ssp interface */
+	if (ctx->codec_type != CODEC_NONE)
+		ctx->ssp_codec = (board_quirk & SOF_SSP_PORT_CODEC_MASK) >>
+				SOF_SSP_PORT_CODEC_SHIFT;
+
+	if (ctx->amp_type != CODEC_NONE)
+		ctx->ssp_amp = (board_quirk & SOF_SSP_PORT_AMP_MASK) >>
+				SOF_SSP_PORT_AMP_SHIFT;
+
+	if (board_quirk & SOF_BT_OFFLOAD_PRESENT) {
+		ctx->bt_offload_present = true;
+		ctx->ssp_bt = (board_quirk & SOF_SSP_PORT_BT_OFFLOAD_MASK) >>
+				SOF_SSP_PORT_BT_OFFLOAD_SHIFT;
+	}
+
+	ctx->ssp_mask_hdmi_in = (board_quirk & SOF_SSP_MASK_HDMI_CAPTURE_MASK) >>
+				SOF_SSP_MASK_HDMI_CAPTURE_SHIFT;
+
+	return ctx;
+}
+EXPORT_SYMBOL_NS(sof_intel_board_get_ctx, SND_SOC_INTEL_SOF_BOARD_HELPERS);
+
 struct snd_soc_dai *get_codec_dai_by_name(struct snd_soc_pcm_runtime *rtd,
 					  const char * const dai_name[], int num_dais)
 {
diff --git a/sound/soc/intel/boards/sof_board_helpers.h b/sound/soc/intel/boards/sof_board_helpers.h
index 38e459e6af9b..0d0a8d97843b 100644
--- a/sound/soc/intel/boards/sof_board_helpers.h
+++ b/sound/soc/intel/boards/sof_board_helpers.h
@@ -10,6 +10,44 @@
 #include "sof_hdmi_common.h"
 #include "sof_ssp_common.h"
 
+/*
+ * Common board quirks: from bit 8 to 31, LSB 8 bits reserved for machine
+ *                      drivers
+ */
+
+/* SSP port number for headphone codec: 3 bits */
+#define SOF_SSP_PORT_CODEC_SHIFT		8
+#define SOF_SSP_PORT_CODEC_MASK			(GENMASK(10, 8))
+#define SOF_SSP_PORT_CODEC(quirk)		\
+	(((quirk) << SOF_SSP_PORT_CODEC_SHIFT) & SOF_SSP_PORT_CODEC_MASK)
+
+/* SSP port number for speaker amplifier: 3 bits */
+#define SOF_SSP_PORT_AMP_SHIFT			11
+#define SOF_SSP_PORT_AMP_MASK			(GENMASK(13, 11))
+#define SOF_SSP_PORT_AMP(quirk)			\
+	(((quirk) << SOF_SSP_PORT_AMP_SHIFT) & SOF_SSP_PORT_AMP_MASK)
+
+/* SSP port number for BT audio offload: 3 bits */
+#define SOF_SSP_PORT_BT_OFFLOAD_SHIFT		14
+#define SOF_SSP_PORT_BT_OFFLOAD_MASK		(GENMASK(16, 14))
+#define SOF_SSP_PORT_BT_OFFLOAD(quirk)		\
+	(((quirk) << SOF_SSP_PORT_BT_OFFLOAD_SHIFT) & SOF_SSP_PORT_BT_OFFLOAD_MASK)
+
+/* SSP port mask for HDMI capture: 6 bits */
+#define SOF_SSP_MASK_HDMI_CAPTURE_SHIFT		17
+#define SOF_SSP_MASK_HDMI_CAPTURE_MASK		(GENMASK(22, 17))
+#define SOF_SSP_MASK_HDMI_CAPTURE(quirk)	\
+	(((quirk) << SOF_SSP_MASK_HDMI_CAPTURE_SHIFT) & SOF_SSP_MASK_HDMI_CAPTURE_MASK)
+
+/* Number of idisp HDMI BE link: 3 bits */
+#define SOF_NUM_IDISP_HDMI_SHIFT		23
+#define SOF_NUM_IDISP_HDMI_MASK			(GENMASK(25, 23))
+#define SOF_NUM_IDISP_HDMI(quirk)		\
+	(((quirk) << SOF_NUM_IDISP_HDMI_SHIFT) & SOF_NUM_IDISP_HDMI_MASK)
+
+/* Board uses BT audio offload */
+#define SOF_BT_OFFLOAD_PRESENT			BIT(26)
+
 enum {
 	SOF_LINK_NONE = 0,
 	SOF_LINK_CODEC,
@@ -111,6 +149,8 @@ struct sof_card_private {
 int sof_intel_board_card_late_probe(struct snd_soc_card *card);
 int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
 				 struct sof_card_private *ctx);
+struct sof_card_private *
+sof_intel_board_get_ctx(struct device *dev, unsigned long board_quirk);
 
 struct snd_soc_dai *get_codec_dai_by_name(struct snd_soc_pcm_runtime *rtd,
 					  const char * const dai_name[], int num_dais);
-- 
2.40.1

