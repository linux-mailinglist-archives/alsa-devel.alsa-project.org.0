Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC50F88B3BD
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 23:15:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 736A122CC;
	Mon, 25 Mar 2024 23:15:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 736A122CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711404919;
	bh=DFPuc2K8UUJmDtViTOMBZVHUupgaVBLQVlGwzidkiy4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KadyM8gYRAHdRdqL9xIlQehjqhR28E6k+51+sax+AIpCL5rnUy7YWZ0sWQXFsCt5U
	 ww/4FVqb66hStX4aSIu1gbyAXU7MSQWyqJNpB2vdXSQy2a9EE8Go6FnHoU9cBGKNpR
	 iocA0aK5pwsjBlVZRQM0Kyq76SDbZKlxrTVRmMKw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0673F807B5; Mon, 25 Mar 2024 23:12:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C218F80798;
	Mon, 25 Mar 2024 23:12:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D2A9F8069F; Mon, 25 Mar 2024 23:11:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73F1CF80093
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 23:11:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73F1CF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=P9v5Wy9Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711404690; x=1742940690;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DFPuc2K8UUJmDtViTOMBZVHUupgaVBLQVlGwzidkiy4=;
  b=P9v5Wy9YwC5t9vNYaWrhCktJUUtYSRcTUadYYYkY1aovkAS02PTLJBl/
   M9Q3EZuOV5gx0O0GYeFzun88qcFfKc4VImaMIzKyhTao+sn5uYJ3P1INd
   19I7MPbbiXvo1dcIHabazLr2TDIYbOkeEmp1WwQxxbWO1M4t8o7rb1Sb6
   SllgMIrbqOEmOc7B6Hn03YxjB1XpTFm3xcNeFnFfjqztYguZx4KglryKe
   fcvTE4iBdpbm10Z1VrA8sV2qWFfYEWJJZ5GUJS+sE0S4PbcGE3BALGM2G
   RZzY0DHr59GqFlKIUu/KLuNr7RsOPTP9pBurbhdjKNbtbyRXEV/D7Wtoi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6643661"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="6643661"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:11:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="15722151"
Received: from jaimbres-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.lan)
 ([10.212.98.109])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:11:23 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 14/21] ASoC: Intel: sof_da7219: add SOF_DA7219_MCLK_EN quirk
Date: Mon, 25 Mar 2024 17:10:52 -0500
Message-Id: <20240325221059.206042-15-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
References: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NUZ2ZNGKGRZHU6Q45QWNQWEC47DZYRWC
X-Message-ID-Hash: NUZ2ZNGKGRZHU6Q45QWNQWEC47DZYRWC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NUZ2ZNGKGRZHU6Q45QWNQWEC47DZYRWC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

PLL bypass mode requires mclk to be present. However, mclk pin is not
connected in JSL boards. Here we add the SOF_DA7219_MCLK_EN quirk to
improve driver readability.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_board_helpers.h |  2 ++
 sound/soc/intel/boards/sof_da7219.c        | 13 ++++++++++---
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/sof_board_helpers.h b/sound/soc/intel/boards/sof_board_helpers.h
index 1701481ab6ae..2f27ad8726f8 100644
--- a/sound/soc/intel/boards/sof_board_helpers.h
+++ b/sound/soc/intel/boards/sof_board_helpers.h
@@ -87,10 +87,12 @@ enum {
  * sof_da7219_private: private data for da7219 machine driver
  *
  * @is_jsl_board: true for JSL boards
+ * @mclk_en: true for mclk pin is connected
  * @pll_bypass: true for PLL bypass mode
  */
 struct sof_da7219_private {
 	bool is_jsl_board;
+	bool mclk_en;
 	bool pll_bypass;
 };
 
diff --git a/sound/soc/intel/boards/sof_da7219.c b/sound/soc/intel/boards/sof_da7219.c
index 3d9c48107f58..4417e2b7adfd 100644
--- a/sound/soc/intel/boards/sof_da7219.c
+++ b/sound/soc/intel/boards/sof_da7219.c
@@ -20,6 +20,7 @@
 
 /* Driver-specific board quirks: from bit 0 to 7 */
 #define SOF_DA7219_JSL_BOARD			BIT(0)
+#define SOF_DA7219_MCLK_EN			BIT(1)
 
 #define DIALOG_CODEC_DAI	"da7219-hifi"
 
@@ -126,7 +127,8 @@ static int da7219_codec_init(struct snd_soc_pcm_runtime *rtd)
 	 * Use PLL bypass mode if MCLK is available, be sure to set the
 	 * frequency of MCLK to 12.288 or 24.576MHz on topology side.
 	 */
-	if (mclk_rate == 12288000 || mclk_rate == 24576000) {
+	if (ctx->da7219.mclk_en &&
+	    (mclk_rate == 12288000 || mclk_rate == 24576000)) {
 		/* PLL bypass mode */
 		dev_dbg(rtd->dev, "pll bypass mode, mclk rate %d\n", mclk_rate);
 
@@ -337,6 +339,9 @@ static int audio_probe(struct platform_device *pdev)
 		}
 	}
 
+	if (board_quirk & SOF_DA7219_MCLK_EN)
+		ctx->da7219.mclk_en = true;
+
 	/* update dai_link */
 	ret = sof_card_dai_links_create(&pdev->dev, &card_da7219, ctx);
 	if (ret)
@@ -383,7 +388,8 @@ static const struct platform_device_id board_ids[] = {
 	},
 	{
 		.name = "adl_mx98360_da7219",
-		.driver_data = (kernel_ulong_t)(SOF_SSP_PORT_CODEC(0) |
+		.driver_data = (kernel_ulong_t)(SOF_DA7219_MCLK_EN |
+					SOF_SSP_PORT_CODEC(0) |
 					SOF_SSP_PORT_AMP(1) |
 					SOF_NUM_IDISP_HDMI(4) |
 					SOF_SSP_PORT_BT_OFFLOAD(2) |
@@ -391,7 +397,8 @@ static const struct platform_device_id board_ids[] = {
 	},
 	{
 		.name = "rpl_mx98360_da7219",
-		.driver_data = (kernel_ulong_t)(SOF_SSP_PORT_CODEC(0) |
+		.driver_data = (kernel_ulong_t)(SOF_DA7219_MCLK_EN |
+					SOF_SSP_PORT_CODEC(0) |
 					SOF_SSP_PORT_AMP(1) |
 					SOF_NUM_IDISP_HDMI(4) |
 					SOF_SSP_PORT_BT_OFFLOAD(2) |
-- 
2.40.1

