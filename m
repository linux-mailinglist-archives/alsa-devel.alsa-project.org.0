Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B715040DCED
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 16:36:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 356A11893;
	Thu, 16 Sep 2021 16:35:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 356A11893
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631802997;
	bh=ZLFNblNZGUk3xAUdXx0zvs4DcAzoMhDmOg/8iz8daj8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=F7y7EPaNzO7DklpQlEPTfgLipGq/LyV/N793q4Qdhg0gIYm767rRpVVnxoJsYoObC
	 C11LgTMJLFRFbFg5eUWnZsn8cVcyR8SP+vbWaYQHRoXNR/K6rYiX37WQPDIM6Tqxh8
	 EpDTD6Dd7H69aezeHTyqWh9dbDY6HToEHYrhNFtE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AC8AF80113;
	Thu, 16 Sep 2021 16:35:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87F47F8025E; Thu, 16 Sep 2021 16:35:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0B73F80113
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 16:35:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0B73F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tYnD1+TZ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D548C6120C;
 Thu, 16 Sep 2021 14:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631802908;
 bh=ZLFNblNZGUk3xAUdXx0zvs4DcAzoMhDmOg/8iz8daj8=;
 h=From:To:Cc:Subject:Date:From;
 b=tYnD1+TZo8+X0SqDU+ARGGKkk0g78LFcjqOBnjMhOuM8ntgr0zUOt/zVH1qi7S5E/
 SI++eLwiNsO3l9FWvLyyAgXJoIFUYvoSmZTrRWk+vPUEsII513JTI8mVRK0gWUjPAB
 QalZXLbq79+IDY5F1hjgBko5f6SuY/2xjfsM7koFq+cMmx23bV7LooWPx4GZOvV7ke
 jpIHOjQgIgtQ18A07DO/S9E5XCktnssdAa4Oq3kmn13lRdDBitPthnVeRXXKd9h7xq
 DhMsGAECTGS2IcW9cgLRRLVzOTVO4ZVqwcyY+Oq2I2pwaW/rcWJ93kZd4NOoZRFjbZ
 TDtKSrw/5gLFQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>
Subject: [PATCH] ASoC: bcm: Convert to modern clocking terminology
Date: Thu, 16 Sep 2021 15:34:23 +0100
Message-Id: <20210916143423.24025-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5019; h=from:subject;
 bh=ZLFNblNZGUk3xAUdXx0zvs4DcAzoMhDmOg/8iz8daj8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhQ1VR7f/CnAZyrrH1GGrUWHHCEyS82ye41J40E//t
 H0pwJ8yJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUNVUQAKCRAk1otyXVSH0MHvB/
 wPYTuujkNia+d3qMwz+ZCaBCynJmHkXaMlgr/j34GbjxqFoz7L8rthXSgNJbg9B8tNpUTjdeJtUSsQ
 p381UAogHIwT4W05Ks96rVet7ApaJj2MvFQ+rlwASVSdgXcRW/huzshJIoOlRliYPsBi+OTdTyhqlv
 4ynjDacNv4KPgwhHbjhC6uTfLVT7ZD0jwGTR6Z0jG7CXt6Z8N54Imw/kQ08P7U2ehT4Z/GX2D/84w+
 ulid9IYzVwDfze74mbDmQm1Z4zCFb6qMkxGi1QDv8seWCpDLJZrGW4Ie+Y97snRlF3moeYhNR6DgZg
 HWHfiANhH/Fc9YTIjkSh3seSKKZsLL
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linux-rpi-kernel@lists.infradead.org
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

As part of the effort to remove our old APIs based on outdated terminology
update the Broadcom drivers to use modern terminology.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/bcm/bcm2835-i2s.c | 56 ++++++++++++++++++-------------------
 sound/soc/bcm/cygnus-ssp.c  |  6 ++--
 2 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/sound/soc/bcm/bcm2835-i2s.c b/sound/soc/bcm/bcm2835-i2s.c
index 3d668f449bc1..e3fc4bee8cfd 100644
--- a/sound/soc/bcm/bcm2835-i2s.c
+++ b/sound/soc/bcm/bcm2835-i2s.c
@@ -127,14 +127,14 @@ struct bcm2835_i2s_dev {
 
 static void bcm2835_i2s_start_clock(struct bcm2835_i2s_dev *dev)
 {
-	unsigned int master = dev->fmt & SND_SOC_DAIFMT_MASTER_MASK;
+	unsigned int provider = dev->fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK;
 
 	if (dev->clk_prepared)
 		return;
 
-	switch (master) {
-	case SND_SOC_DAIFMT_CBS_CFS:
-	case SND_SOC_DAIFMT_CBS_CFM:
+	switch (provider) {
+	case SND_SOC_DAIFMT_CBC_CFC:
+	case SND_SOC_DAIFMT_CBC_CFP:
 		clk_prepare_enable(dev->clk);
 		dev->clk_prepared = true;
 		break;
@@ -337,8 +337,8 @@ static int bcm2835_i2s_hw_params(struct snd_pcm_substream *substream,
 	unsigned int rx_mask, tx_mask;
 	unsigned int rx_ch1_pos, rx_ch2_pos, tx_ch1_pos, tx_ch2_pos;
 	unsigned int mode, format;
-	bool bit_clock_master = false;
-	bool frame_sync_master = false;
+	bool bit_clock_provider = false;
+	bool frame_sync_provider = false;
 	bool frame_start_falling_edge = false;
 	uint32_t csreg;
 	int ret = 0;
@@ -383,36 +383,36 @@ static int bcm2835_i2s_hw_params(struct snd_pcm_substream *substream,
 	if (data_length > slot_width)
 		return -EINVAL;
 
-	/* Check if CPU is bit clock master */
-	switch (dev->fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
-	case SND_SOC_DAIFMT_CBS_CFM:
-		bit_clock_master = true;
+	/* Check if CPU is bit clock provider */
+	switch (dev->fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBC_CFC:
+	case SND_SOC_DAIFMT_CBC_CFP:
+		bit_clock_provider = true;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFS:
-	case SND_SOC_DAIFMT_CBM_CFM:
-		bit_clock_master = false;
+	case SND_SOC_DAIFMT_CBP_CFC:
+	case SND_SOC_DAIFMT_CBP_CFP:
+		bit_clock_provider = false;
 		break;
 	default:
 		return -EINVAL;
 	}
 
-	/* Check if CPU is frame sync master */
-	switch (dev->fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
-	case SND_SOC_DAIFMT_CBM_CFS:
-		frame_sync_master = true;
+	/* Check if CPU is frame sync provider */
+	switch (dev->fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBC_CFC:
+	case SND_SOC_DAIFMT_CBP_CFC:
+		frame_sync_provider = true;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFM:
-	case SND_SOC_DAIFMT_CBM_CFM:
-		frame_sync_master = false;
+	case SND_SOC_DAIFMT_CBC_CFP:
+	case SND_SOC_DAIFMT_CBP_CFP:
+		frame_sync_provider = false;
 		break;
 	default:
 		return -EINVAL;
 	}
 
 	/* Clock should only be set up here if CPU is clock master */
-	if (bit_clock_master &&
+	if (bit_clock_provider &&
 	    (!dev->clk_prepared || dev->clk_rate != bclk_rate)) {
 		if (dev->clk_prepared)
 			bcm2835_i2s_stop_clock(dev);
@@ -501,11 +501,11 @@ static int bcm2835_i2s_hw_params(struct snd_pcm_substream *substream,
 	/*
 	 * Transmitting data immediately after frame start, eg
 	 * in left-justified or DSP mode A, only works stable
-	 * if bcm2835 is the frame clock master.
+	 * if bcm2835 is the frame clock provider.
 	 */
-	if ((!rx_ch1_pos || !tx_ch1_pos) && !frame_sync_master)
+	if ((!rx_ch1_pos || !tx_ch1_pos) && !frame_sync_provider)
 		dev_warn(dev->dev,
-			"Unstable slave config detected, L/R may be swapped");
+			"Unstable consumer config detected, L/R may be swapped");
 
 	/*
 	 * Set format for both streams.
@@ -538,11 +538,11 @@ static int bcm2835_i2s_hw_params(struct snd_pcm_substream *substream,
 	mode |= BCM2835_I2S_FSLEN(framesync_length);
 
 	/* CLKM selects bcm2835 clock slave mode */
-	if (!bit_clock_master)
+	if (!bit_clock_provider)
 		mode |= BCM2835_I2S_CLKM;
 
 	/* FSM selects bcm2835 frame sync slave mode */
-	if (!frame_sync_master)
+	if (!frame_sync_provider)
 		mode |= BCM2835_I2S_FSM;
 
 	/* CLKI selects normal clocking mode, sampling on rising edge */
diff --git a/sound/soc/bcm/cygnus-ssp.c b/sound/soc/bcm/cygnus-ssp.c
index fca5a3f2eec5..9698f4531c90 100644
--- a/sound/soc/bcm/cygnus-ssp.c
+++ b/sound/soc/bcm/cygnus-ssp.c
@@ -848,12 +848,12 @@ static int cygnus_ssp_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 
 	ssp_newcfg = 0;
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
 		ssp_newcfg |= BIT(I2S_OUT_CFGX_SLAVE_MODE);
 		aio->is_slave = 1;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		ssp_newcfg &= ~BIT(I2S_OUT_CFGX_SLAVE_MODE);
 		aio->is_slave = 0;
 		break;
-- 
2.20.1

