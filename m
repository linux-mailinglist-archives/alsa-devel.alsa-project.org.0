Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E614146A930
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Dec 2021 22:10:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B0802294;
	Mon,  6 Dec 2021 22:09:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B0802294
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638825038;
	bh=JHMtBZ/tUHTrn15K7vhb8liGMc1WxzMa0EoetFTu+qE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Or/6coaW459Zv825aVPicN1adr3LplL8b5K19IadXPU8fJEyhD4GTTQ3RHAmlSFv2
	 8bzIFRsiA11rWELRoIBnBQdllNz+TNJ75W76UJ6Dc0HULw6I+O0Ga4z5WGdGfF5AWZ
	 wtYG3BBStF+NfWF0mEfczP/1FVvK0nfDNYLRHclY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF13BF804FD;
	Mon,  6 Dec 2021 22:08:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98BC2F804E4; Mon,  6 Dec 2021 22:08:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B19F0F804E4
 for <alsa-devel@alsa-project.org>; Mon,  6 Dec 2021 22:08:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B19F0F804E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.b="j/hARFT0"
Received: by mail-wr1-x42c.google.com with SMTP id d24so25223832wra.0
 for <alsa-devel@alsa-project.org>; Mon, 06 Dec 2021 13:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yVwInqdQPwWX4Qe3BGSaiec8LwEwiHTiRzv+V8FUPV4=;
 b=j/hARFT0fWHGsb2iMVFhbY7TsVKDd1pdb4bE1pVTXogyrwclHKw+GhxGq/bC+1tTi5
 t9xIENPR7ITnICu04uR5Rrm8dRZv8xuJQmGEiHzmv7ZkTPlMaCxZayjqLHTyQTtx9emH
 9JqL1/wtG6l5pdB0NihNnaU9M4bvo8wOqhl6OwyEwqR92BNJ4CfoUL99lBhLpxmSGbo4
 ZLgWu4OC2YNRvUwZut44zkVv8UWYVN4YjJfNmgJuRS6QAu0mRjESmWV4CucMMXNyYtXh
 owvRtsX1jd7NamruYtA6O5nJqdvVWJ4zAKeJef2LIJpl7jXh4J76EjxWEkj75UpvKtqg
 dr7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yVwInqdQPwWX4Qe3BGSaiec8LwEwiHTiRzv+V8FUPV4=;
 b=RDil9V+4JKJQ455p3DAVuYyrJp1+FT9x+/Yqigo5O7i/vCEP4C2M9xG3NV69fClfGp
 gpAxF2qSaWdaRnsgLODYx9VpDva8F2iylqJAZwi0sAF0a3DqBVpkPsYgE3AVPHaJcZcN
 RM2B8WOKVhLh7PJi4S0oVNA79Hr1O5kCqCfuxOCzM6IyUPNoY+9lh40HxePnZxS2AvEs
 WwSUJXHZRI2Rmk3Ynv3zEVVw0/YnqkP/2vVtYwtugypJNeYQTbg8zfLdV7CwxdwQDtPy
 OZoc2vnMPpWmIs/mFgio8PV+DqUJ1l99W8kT6O+UV7Uz6o4yOdtEyIymox+bw4iVAhlc
 zweg==
X-Gm-Message-State: AOAM533MzaoOWpjoxSgWD0KJ6rkO1hfIIOp5/M892E8/ncYeXzA2O9Lt
 IuCL35qNXdjykoatibCO1kk=
X-Google-Smtp-Source: ABdhPJxpVXCa7Lm3mSav7+NYGzpVO2VRSAiqRDHaow5+eq/DIiRSpnNldOwc2JisEfWYZf2SKdBj/g==
X-Received: by 2002:adf:f708:: with SMTP id r8mr46149102wrp.198.1638824903916; 
 Mon, 06 Dec 2021 13:08:23 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-2a01-0c23-c0cf-f800-f22f-74ff-fe21-0725.c23.pool.telefonica.de.
 [2a01:c23:c0cf:f800:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id p13sm511195wmi.0.2021.12.06.13.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 13:08:22 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	alsa-devel@alsa-project.org
Subject: [PATCH v2 2/2] ASoC: meson: aiu: Move AIU_I2S_MISC hold setting to
 aiu-fifo-i2s
Date: Mon,  6 Dec 2021 22:08:04 +0100
Message-Id: <20211206210804.2512999-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211206210804.2512999-1-martin.blumenstingl@googlemail.com>
References: <20211206210804.2512999-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Christian Hewitt <christianshewitt@gmail.com>, lgirdwood@gmail.com,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org,
 Geraldo Nascimento <geraldogabriel@gmail.com>,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
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

The out-of-tree vendor driver uses the following approach to set the
AIU_I2S_MISC register:
1) write AIU_MEM_I2S_START_PTR and AIU_MEM_I2S_RD_PTR
2) configure AIU_I2S_MUTE_SWAP[15:0]
3) write AIU_MEM_I2S_END_PTR
4) set AIU_I2S_MISC[2] to 1 (documented as: "put I2S interface in hold
   mode")
5) set AIU_I2S_MISC[4] to 1 (depending on the driver revision it always
   stays at 1 while for older drivers this bit is unset in step 4)
6) set AIU_I2S_MISC[2] to 0
7) write AIU_MEM_I2S_MASKS
8) toggle AIU_MEM_I2S_CONTROL[0]
9) toggle AIU_MEM_I2S_BUF_CNTL[0]

Move setting the AIU_I2S_MISC[2] bit to aiu_fifo_i2s_hw_params() so it
resembles the flow in the vendor kernel more closely. While here also
configure AIU_I2S_MISC[4] (documented as: "force each audio data to
left or right according to the bit attached with the audio data")
similar to how the vendor driver does this. This fixes the infamous and
long-standing "machine gun noise" issue (a buffer underrun issue).

Fixes: 6ae9ca9ce986bf ("ASoC: meson: aiu: add i2s and spdif support")
Reported-by: Christian Hewitt <christianshewitt@gmail.com>
Reported-by: Geraldo Nascimento <geraldogabriel@gmail.com>
Tested-by: Christian Hewitt <christianshewitt@gmail.com>
Tested-by: Geraldo Nascimento <geraldogabriel@gmail.com>
Acked-by: Jerome Brunet <jbrunet@baylibre.com>
Cc: stable@vger.kernel.org
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 sound/soc/meson/aiu-encoder-i2s.c | 33 -------------------------------
 sound/soc/meson/aiu-fifo-i2s.c    | 19 ++++++++++++++++++
 2 files changed, 19 insertions(+), 33 deletions(-)

diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
index 932224552146..67729de41a73 100644
--- a/sound/soc/meson/aiu-encoder-i2s.c
+++ b/sound/soc/meson/aiu-encoder-i2s.c
@@ -18,7 +18,6 @@
 #define AIU_RST_SOFT_I2S_FAST		BIT(0)
 
 #define AIU_I2S_DAC_CFG_MSB_FIRST	BIT(2)
-#define AIU_I2S_MISC_HOLD_EN		BIT(2)
 #define AIU_CLK_CTRL_I2S_DIV_EN		BIT(0)
 #define AIU_CLK_CTRL_I2S_DIV		GENMASK(3, 2)
 #define AIU_CLK_CTRL_AOCLK_INVERT	BIT(6)
@@ -36,37 +35,6 @@ static void aiu_encoder_i2s_divider_enable(struct snd_soc_component *component,
 				      enable ? AIU_CLK_CTRL_I2S_DIV_EN : 0);
 }
 
-static void aiu_encoder_i2s_hold(struct snd_soc_component *component,
-				 bool enable)
-{
-	snd_soc_component_update_bits(component, AIU_I2S_MISC,
-				      AIU_I2S_MISC_HOLD_EN,
-				      enable ? AIU_I2S_MISC_HOLD_EN : 0);
-}
-
-static int aiu_encoder_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
-				   struct snd_soc_dai *dai)
-{
-	struct snd_soc_component *component = dai->component;
-
-	switch (cmd) {
-	case SNDRV_PCM_TRIGGER_START:
-	case SNDRV_PCM_TRIGGER_RESUME:
-	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		aiu_encoder_i2s_hold(component, false);
-		return 0;
-
-	case SNDRV_PCM_TRIGGER_STOP:
-	case SNDRV_PCM_TRIGGER_SUSPEND:
-	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		aiu_encoder_i2s_hold(component, true);
-		return 0;
-
-	default:
-		return -EINVAL;
-	}
-}
-
 static int aiu_encoder_i2s_setup_desc(struct snd_soc_component *component,
 				      struct snd_pcm_hw_params *params)
 {
@@ -353,7 +321,6 @@ static void aiu_encoder_i2s_shutdown(struct snd_pcm_substream *substream,
 }
 
 const struct snd_soc_dai_ops aiu_encoder_i2s_dai_ops = {
-	.trigger	= aiu_encoder_i2s_trigger,
 	.hw_params	= aiu_encoder_i2s_hw_params,
 	.hw_free	= aiu_encoder_i2s_hw_free,
 	.set_fmt	= aiu_encoder_i2s_set_fmt,
diff --git a/sound/soc/meson/aiu-fifo-i2s.c b/sound/soc/meson/aiu-fifo-i2s.c
index 2388a2d0b3a6..57e6e7160d2f 100644
--- a/sound/soc/meson/aiu-fifo-i2s.c
+++ b/sound/soc/meson/aiu-fifo-i2s.c
@@ -20,6 +20,8 @@
 #define AIU_MEM_I2S_CONTROL_MODE_16BIT	BIT(6)
 #define AIU_MEM_I2S_BUF_CNTL_INIT	BIT(0)
 #define AIU_RST_SOFT_I2S_FAST		BIT(0)
+#define AIU_I2S_MISC_HOLD_EN		BIT(2)
+#define AIU_I2S_MISC_FORCE_LEFT_RIGHT	BIT(4)
 
 #define AIU_FIFO_I2S_BLOCK		256
 
@@ -90,6 +92,10 @@ static int aiu_fifo_i2s_hw_params(struct snd_pcm_substream *substream,
 	unsigned int val;
 	int ret;
 
+	snd_soc_component_update_bits(component, AIU_I2S_MISC,
+				      AIU_I2S_MISC_HOLD_EN,
+				      AIU_I2S_MISC_HOLD_EN);
+
 	ret = aiu_fifo_hw_params(substream, params, dai);
 	if (ret)
 		return ret;
@@ -117,6 +123,19 @@ static int aiu_fifo_i2s_hw_params(struct snd_pcm_substream *substream,
 	snd_soc_component_update_bits(component, AIU_MEM_I2S_MASKS,
 				      AIU_MEM_I2S_MASKS_IRQ_BLOCK, val);
 
+	/*
+	 * Most (all?) supported SoCs have this bit set by default. The vendor
+	 * driver however sets it manually (depending on the version either
+	 * while un-setting AIU_I2S_MISC_HOLD_EN or right before that). Follow
+	 * the same approach for consistency with the vendor driver.
+	 */
+	snd_soc_component_update_bits(component, AIU_I2S_MISC,
+				      AIU_I2S_MISC_FORCE_LEFT_RIGHT,
+				      AIU_I2S_MISC_FORCE_LEFT_RIGHT);
+
+	snd_soc_component_update_bits(component, AIU_I2S_MISC,
+				      AIU_I2S_MISC_HOLD_EN, 0);
+
 	return 0;
 }
 
-- 
2.34.1

