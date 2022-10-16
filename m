Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4245FFFA7
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Oct 2022 15:30:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1FB16192;
	Sun, 16 Oct 2022 15:29:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1FB16192
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665927020;
	bh=tKLwdSWQLYs6/yC7udRIXee/aJ4qnPMgTMMEcdUTLQM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vXuLRA4B8Q8NUpxPbC8xhfywebyu+td7dSIfJxMBrMLgC98UZi3RDkz1qKsgl53/h
	 ShMlJDazM9gjreZwskIxK5Zkz/79R8lBbN8WHQHFMIap/1Lh37SccUeHFDqiPdUBE+
	 8FyFj7kcE8cqwj1d4l8AbSgs17VCyH/xOIjCXFPo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12938F8055B;
	Sun, 16 Oct 2022 15:27:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 326AEF80557; Sun, 16 Oct 2022 15:27:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D4EEF8053D
 for <alsa-devel@alsa-project.org>; Sun, 16 Oct 2022 15:27:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D4EEF8053D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="nnhEubGW"
Received: by mail-ed1-x529.google.com with SMTP id e18so12654010edj.3
 for <alsa-devel@alsa-project.org>; Sun, 16 Oct 2022 06:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CqjTgeUd6gWhUWYVrTKOj3mTSf21kU7OjGiHvk8JsVI=;
 b=nnhEubGWYhDFWbs8jnu2ZsbffdvT/gOCsYhx0i17+WGLo3+P9CsnAUUN4ByFGjBKum
 IsSgxTK4Jbh+Z75eNSWa9BzjNX6rm/m27aECTaRsq4f6S2xTUFPfglDV6P0xpqeMfLAr
 36KldilDoSeXXtLnCnCeKMTs7GLMCGGqvDFFgkTJLB2MAF62ku9mwJLovpo5/56xuGco
 ShSuoxhuXM2bmiVldaRdh+7VNdncdQid8v/pqoIZymz3JVSt7LMfGHAjEEcVrdUKQpSq
 R3HGEx3ZGGEeLlBtCThUy31hZT0sCZ6sPCSSxsxRnomIa2Kxs0uYwVCMaENHNV99U4U6
 1YJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CqjTgeUd6gWhUWYVrTKOj3mTSf21kU7OjGiHvk8JsVI=;
 b=XnMogpVIhht/1FABPjjnxFOdL1N+lvlH/KK4UKKTZquOdtJWp9XBKpCtWWmFI8kl5O
 ds2/wn14Wnp3jjB3AU+m7WIQcd5bMU2MA+uJz+M1CXIXZXr5zhnb7FGdBKXSjAUQEH05
 +e4oo9bJR0AvOwXKVcVS+EHIakkp9LwOHmHhDss3JeujKaVpR2GxwGXt9XGanNPYEYsm
 fDY8gq5jjG30CxqUhQ1kTnH+Ys2xkFn4RyAHbsERetE0oVJSeKGOPjRJG81k5+/LwAQL
 AU+mJYKdZKfvBsYfI6uoQlr8ML2h9E35+4kBXFNNcxwmkiVdOuL7hag4p+4afcDAAcnA
 eo0A==
X-Gm-Message-State: ACrzQf2P9ZN+tLoYXVf5V5jjoJyo5IS6NjCGPkbkqViJoo6f6uvwYPjR
 qrBIzJorGKx1GflYLYa1lJI=
X-Google-Smtp-Source: AMsMyM4suZSAWgqPObYYUnsdjfTMP7uEvVdDuRDd5N912MwgTFrE4+Jo83pgDCd7mOf5mv/MFC4E8Q==
X-Received: by 2002:a05:6402:40c4:b0:45c:c718:54d1 with SMTP id
 z4-20020a05640240c400b0045cc71854d1mr6213755edb.319.1665926872430; 
 Sun, 16 Oct 2022 06:27:52 -0700 (PDT)
Received: from hp-power-15.localdomain
 (mm-39-7-212-37.vitebsk.dynamic.pppoe.byfly.by. [37.212.7.39])
 by smtp.gmail.com with ESMTPSA id
 y5-20020aa7ce85000000b0045c72bba0bfsm5572057edv.4.2022.10.16.06.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 06:27:51 -0700 (PDT)
From: Siarhei Volkau <lis8215@gmail.com>
To: 
Subject: [PATCH v3 5/7] ASoC: codecs: jz4725b: use right control for Master
 Playback
Date: Sun, 16 Oct 2022 16:26:46 +0300
Message-Id: <20221016132648.3011729-6-lis8215@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221016132648.3011729-1-lis8215@gmail.com>
References: <20221016132648.3011729-1-lis8215@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-mips@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Siarhei Volkau <lis8215@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
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

At the moment DAC control is used as Master Playback control, this is
incorrect as DAC's output goes to a Mixer.

The Mixer couples analog input from 4 sources (DAC, Line In, Mic 1,
 Mic 2) each input has its own gain & mute controls.

Output of the Mixer goes to Output Stage control which is the best suite
for the new Playback Master. However, it doesn't have mute capability.

The patch implements Output Stage control as a new master and renames
old Master to DAC. Rest of mixer inputs will be implemented in the next
patch in the series.

Manual states that Output stage control (16.6.3.5 Programmable output
amplifier: PGAT) gain varies from -33.5dB to +4.5dB, gain step isn't
fixed and has 3 opts.

Signed-off-by: Siarhei Volkau <lis8215@gmail.com>
---
 sound/soc/codecs/jz4725b.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/jz4725b.c b/sound/soc/codecs/jz4725b.c
index d57c2c6a3..c39398e0a 100644
--- a/sound/soc/codecs/jz4725b.c
+++ b/sound/soc/codecs/jz4725b.c
@@ -136,6 +136,12 @@ enum {
 #define REG_CGR3_GO1L_OFFSET		0
 #define REG_CGR3_GO1L_MASK		(0x1f << REG_CGR3_GO1L_OFFSET)
 
+#define REG_CGR8_GOR_OFFSET		0
+#define REG_CGR8_GOR_MASK		(0x1f << REG_CGR8_GOR_OFFSET)
+
+#define REG_CGR9_GOL_OFFSET		0
+#define REG_CGR9_GOL_MASK		(0x1f << REG_CGR9_GOL_OFFSET)
+
 #define REG_CGR10_GIL_OFFSET		0
 #define REG_CGR10_GIR_OFFSET		4
 
@@ -147,9 +153,14 @@ struct jz_icdc {
 
 static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(jz4725b_adc_tlv,     0, 150, 0);
 static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(jz4725b_dac_tlv, -2250, 150, 0);
+static const SNDRV_CTL_TLVD_DECLARE_DB_RANGE(jz4725b_out_tlv,
+	 0, 11, TLV_DB_SCALE_ITEM(-3350, 200, 0),
+	12, 23, TLV_DB_SCALE_ITEM(-1050, 100, 0),
+	24, 31, TLV_DB_SCALE_ITEM(  100,  50, 0),
+);
 
 static const struct snd_kcontrol_new jz4725b_codec_controls[] = {
-	SOC_DOUBLE_TLV("Master Playback Volume",
+	SOC_DOUBLE_TLV("DAC Playback Volume",
 		       JZ4725B_CODEC_REG_CGR1,
 		       REG_CGR1_GODL_OFFSET,
 		       REG_CGR1_GODR_OFFSET,
@@ -160,7 +171,13 @@ static const struct snd_kcontrol_new jz4725b_codec_controls[] = {
 		       REG_CGR10_GIR_OFFSET,
 		       0xf, 0, jz4725b_adc_tlv),
 
-	SOC_SINGLE("Master Playback Switch", JZ4725B_CODEC_REG_CR1,
+	SOC_DOUBLE_R_TLV("Master Playback Volume",
+			 JZ4725B_CODEC_REG_CGR9,
+			 JZ4725B_CODEC_REG_CGR8,
+			 REG_CGR8_GOR_OFFSET,
+			 0x1f, 1, jz4725b_out_tlv),
+
+	SOC_SINGLE("DAC Playback Switch", JZ4725B_CODEC_REG_CR1,
 		   REG_CR1_DAC_MUTE_OFFSET, 1, 1),
 
 	SOC_SINGLE("Deemphasize Filter Playback Switch",
-- 
2.36.1

