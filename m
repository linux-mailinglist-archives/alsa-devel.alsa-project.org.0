Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B372C468C88
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Dec 2021 19:09:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 289C81FC1;
	Sun,  5 Dec 2021 19:09:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 289C81FC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638727793;
	bh=TEZT8B8OlV2X+/J2EU42e22AZhQ9zCk3qDFZY0q+v5o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eWlnxtHOqp2brrPS7HCAoGX3t10b0S0Bo607/bLP6UhBaDwF4VC4BguhoSk+kVfDv
	 xr5F+eABnMoaOdMZNgLXVsvkNwBz9ruNK9zGam2tooFrwF9ab9sJMnAZtVK3h/vEFk
	 n06gevih0Q5aB5eKWJJhETDbMdxEnTMT2cHqLopM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01078F8028D;
	Sun,  5 Dec 2021 19:08:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B04EDF8028D; Sun,  5 Dec 2021 19:08:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA381F80143
 for <alsa-devel@alsa-project.org>; Sun,  5 Dec 2021 19:08:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA381F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.b="KIZdhgCE"
Received: by mail-wm1-x331.google.com with SMTP id
 m25-20020a7bcb99000000b0033aa12cdd33so7061460wmi.1
 for <alsa-devel@alsa-project.org>; Sun, 05 Dec 2021 10:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UR2Ba1A9AvNmFcbxAlN+YSRhW1d1ZwOF+JFtYhvT/b0=;
 b=KIZdhgCEwUJdMoCmlfQUA9qF6FMerEpPkMQ3isXiKfc2tjpAMOWd4AVw04PE0aJ7Tu
 847MgIywSb6fmjWvz+YMLgrpaRKBwtUrWTD4YD2rw/iu0/OJIiAkDt/jTCFW16nSWgPl
 ClvxszNMg0qQ48HXApiKmIr2k9gX59P3nidvpALMFjKpbqp/STdiC174tT2PfDc3X/fe
 tQ5pIsxPy5YRdNfkvwOVSsRLhQuYMIAayoQoqSeECh0GeKsIUtMIaejruFIxhvrXDbai
 BgqbjTrdbGFn+wzuVT0t4Rk75N4i2wpn9iotXmqdCU8aOt7oWGrPimE1VLgvI+yeYUIw
 e44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UR2Ba1A9AvNmFcbxAlN+YSRhW1d1ZwOF+JFtYhvT/b0=;
 b=plDeIvAerYz8TLi0HLfpa81qy76nT3cdS9/xPCM0jw+Y0NxHEGU1La0hf4A5E6qjz1
 pBfSi2rsD3CYp8aUPzhC1pdNt1Oaeiz9DIIRbmMu1ezYmZYC1iUZKqmjozrpAbPm1pNT
 2CZT/5HtOhrj4FgFsyjgAAopEyIC9L0HMcbc1Tc+UNPx2nQ+m59sA2Rvukuj7Kuk9fAc
 pERiG2nbhAnxGvV/9JrFf1W+OZtCtbRnagUkyzRoPzmViqRtKYKOIAr7pOFZy86yl7LR
 v3kiUidVKnx21MVDG4wCkrWjol74pkBEUOaW+E1hSLVIwzwhQPb7fo5adl+EjNWFRp1M
 qiWw==
X-Gm-Message-State: AOAM533T8RdYA0U08QJTmtUqLpSMinMn+ml8mh+8cUe/yGyMjtLQxLGV
 ub2Ra0Jbv3mrb4ib4uaMHMU=
X-Google-Smtp-Source: ABdhPJx9Ualqlnc/EAKhyt1P0o0D7IRAUAD/esJwhJ2JbmTU16ZZf6RtkLGSXnEuM8A9AwpmKzjrng==
X-Received: by 2002:a05:600c:4793:: with SMTP id
 k19mr33453179wmo.72.1638727707741; 
 Sun, 05 Dec 2021 10:08:27 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-2a01-0c23-c11b-a200-f22f-74ff-fe21-0725.c23.pool.telefonica.de.
 [2a01:c23:c11b:a200:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id x13sm9250551wrr.47.2021.12.05.10.08.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Dec 2021 10:08:27 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: jbrunet@baylibre.com, linux-amlogic@lists.infradead.org,
 alsa-devel@alsa-project.org
Subject: [PATCH RFC v1 2/2] ASoC: meson: aiu: Move AIU_I2S_MISC hold setting
 to aiu-fifo-i2s
Date: Sun,  5 Dec 2021 19:08:16 +0100
Message-Id: <20211205180816.2083864-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211205180816.2083864-1-martin.blumenstingl@googlemail.com>
References: <20211205180816.2083864-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Christian Hewitt <christianshewitt@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Geraldo Nascimento <geraldogabriel@gmail.com>
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

Additional testing shows that when AIU_I2S_MISC[2] is set to 1 then no
interrupts are generated anymore. The way this bit is managed by the
vendor driver as well as not getting any interrupts can mean that it's
related to the FIFO and not the encoder.

Move setting the AIU_I2S_MISC[2] bit to aiu_fifo_i2s_hw_params() so it
closer resembles the flow in the vendor kernel. While here also
configure AIU_I2S_MISC[4] (documented as: "force each audio data to
left or right according to the bit attached with the audio data")
similar to how the vendor driver does this. This fixes the infamous and
long-standing "machine gun noise" issue (a buffer underrun issue).

Fixes: 6ae9ca9ce986bf ("ASoC: meson: aiu: add i2s and spdif support")
Reported-by: Christian Hewitt <christianshewitt@gmail.com>
Reported-by: Geraldo Nascimento <geraldogabriel@gmail.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 sound/soc/meson/aiu-encoder-i2s.c | 33 -------------------------------
 sound/soc/meson/aiu-fifo-i2s.c    | 12 +++++++++++
 2 files changed, 12 insertions(+), 33 deletions(-)

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
index 2388a2d0b3a6..d0a1090d6465 100644
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
@@ -117,6 +123,12 @@ static int aiu_fifo_i2s_hw_params(struct snd_pcm_substream *substream,
 	snd_soc_component_update_bits(component, AIU_MEM_I2S_MASKS,
 				      AIU_MEM_I2S_MASKS_IRQ_BLOCK, val);
 
+	snd_soc_component_update_bits(component, AIU_I2S_MISC,
+				      AIU_I2S_MISC_FORCE_LEFT_RIGHT,
+				      AIU_I2S_MISC_FORCE_LEFT_RIGHT);
+	snd_soc_component_update_bits(component, AIU_I2S_MISC,
+				      AIU_I2S_MISC_HOLD_EN, 0);
+
 	return 0;
 }
 
-- 
2.34.1

