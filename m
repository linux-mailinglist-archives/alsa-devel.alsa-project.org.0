Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F955402E7D
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Sep 2021 20:44:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE5BA1729;
	Tue,  7 Sep 2021 20:44:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE5BA1729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631040290;
	bh=bC+bMkdJkhMa7EzOBCwmQkaBu2YZ8ZRLKlZkvkoBkUw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WgV+8V5TOVdp2Rik2SByCViXaQleEh4+iVeAmpwXWblDXUULzL/zHc7BjxYaAKBAw
	 hLmg+x4a9L2ono0Bwwh4sxdMLQxHv/5gUMvpabRgNk1JK45HfxwqjI5lrmrHlYq0KC
	 DPsxMJKBikPy+EwFylt58Oon40C+JO5KR40SM7TY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24817F80253;
	Tue,  7 Sep 2021 20:43:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29DB4F80224; Tue,  7 Sep 2021 20:43:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43880F800BC
 for <alsa-devel@alsa-project.org>; Tue,  7 Sep 2021 20:43:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43880F800BC
X-IronPort-AV: E=McAfee;i="6200,9189,10100"; a="220341351"
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; d="scan'208";a="220341351"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 11:43:19 -0700
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; d="scan'208";a="464977752"
Received: from fdiasmor-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.186.104])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 11:43:17 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: amd: acp: declare and add prefix to 'bt_uart_enable'
 symbol
Date: Tue,  7 Sep 2021 13:42:14 -0500
Message-Id: <20210907184216.33067-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, tiwai@suse.de,
 open list <linux-kernel@vger.kernel.org>, Chuhong Yuan <hslester96@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, broonie@kernel.org,
 Mario Limonciello <mario.limonciello@amd.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Gu Shengxian <gushengxian@yulong.com>
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

Sparse reports the following warning:

sound/soc/amd/acp-pcm-dma.c:39:6: error: symbol 'bt_uart_enable' was
not declared. Should it be static?

It's not very good practice to export such symbols that can easily
conflict, add the acp_ prefix and add declaration in header file.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/amd/acp-da7219-max98357a.c | 6 +++---
 sound/soc/amd/acp-pcm-dma.c          | 6 +++---
 sound/soc/amd/acp.h                  | 2 ++
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-da7219-max98357a.c
index b3df98a9f9f3..b2065f3fe42c 100644
--- a/sound/soc/amd/acp-da7219-max98357a.c
+++ b/sound/soc/amd/acp-da7219-max98357a.c
@@ -33,7 +33,7 @@ static struct clk *da7219_dai_wclk;
 static struct clk *da7219_dai_bclk;
 static struct clk *rt5682_dai_wclk;
 static struct clk *rt5682_dai_bclk;
-extern bool bt_uart_enable;
+
 void *acp_soc_is_rltk_max(struct device *dev);
 
 static int cz_da7219_init(struct snd_soc_pcm_runtime *rtd)
@@ -760,8 +760,8 @@ static int cz_probe(struct platform_device *pdev)
 				"devm_snd_soc_register_card(%s) failed\n",
 				card->name);
 	}
-	bt_uart_enable = !device_property_read_bool(&pdev->dev,
-						    "bt-pad-enable");
+	acp_bt_uart_enable = !device_property_read_bool(&pdev->dev,
+							"bt-pad-enable");
 	return 0;
 }
 
diff --git a/sound/soc/amd/acp-pcm-dma.c b/sound/soc/amd/acp-pcm-dma.c
index 11b3c4f39eba..1f322accd9ea 100644
--- a/sound/soc/amd/acp-pcm-dma.c
+++ b/sound/soc/amd/acp-pcm-dma.c
@@ -36,8 +36,8 @@
 #define ST_MIN_BUFFER ST_MAX_BUFFER
 
 #define DRV_NAME "acp_audio_dma"
-bool bt_uart_enable = true;
-EXPORT_SYMBOL(bt_uart_enable);
+bool acp_bt_uart_enable = true;
+EXPORT_SYMBOL(acp_bt_uart_enable);
 
 static const struct snd_pcm_hardware acp_pcm_hardware_playback = {
 	.info = SNDRV_PCM_INFO_INTERLEAVED |
@@ -596,7 +596,7 @@ static int acp_init(void __iomem *acp_mmio, u32 asic_type)
 	acp_reg_write(val, acp_mmio, mmACP_SOFT_RESET);
 
 	/* For BT instance change pins from UART to BT */
-	if (!bt_uart_enable) {
+	if (!acp_bt_uart_enable) {
 		val = acp_reg_read(acp_mmio, mmACP_BT_UART_PAD_SEL);
 		val |= ACP_BT_UART_PAD_SELECT_MASK;
 		acp_reg_write(val, acp_mmio, mmACP_BT_UART_PAD_SEL);
diff --git a/sound/soc/amd/acp.h b/sound/soc/amd/acp.h
index e5ab6c6040a6..85529ed7e5f5 100644
--- a/sound/soc/amd/acp.h
+++ b/sound/soc/amd/acp.h
@@ -204,4 +204,6 @@ typedef struct acp_dma_dscr_transfer {
 	u32 reserved;
 } acp_dma_dscr_transfer_t;
 
+extern bool acp_bt_uart_enable;
+
 #endif /*__ACP_HW_H */
-- 
2.25.1

