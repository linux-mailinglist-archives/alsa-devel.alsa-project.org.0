Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1B05FFFA6
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Oct 2022 15:29:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62D8F6188;
	Sun, 16 Oct 2022 15:29:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62D8F6188
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665926996;
	bh=nthHZ7QoFtIT/Hmc3r4U0KxiMVEozSQ0PMt4VqIOOb8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pM8JW8hVr4WZKZi0HTCuJeJl0WHXje75+LY73bReinIwTDRn77I2ziLEKeKbhSrWa
	 RURIFasVrRlDpGqtQHFXhS8UDo/Pa8Z63FsDeadg4Y1Ar0ZE0IVnAm+1ZipqFBfWTf
	 iP5iO8/c55/huxA2sjTnKgkFJqa1JTX1z+PndI3w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C61AF80553;
	Sun, 16 Oct 2022 15:27:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EBA2F80549; Sun, 16 Oct 2022 15:27:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3C04F8053C
 for <alsa-devel@alsa-project.org>; Sun, 16 Oct 2022 15:27:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3C04F8053C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="d0F1c3o0"
Received: by mail-ej1-x629.google.com with SMTP id a26so19613098ejc.4
 for <alsa-devel@alsa-project.org>; Sun, 16 Oct 2022 06:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZA0KpJu28BqLozBBPuBVAqokT3cgceSjy1up9PTHuYA=;
 b=d0F1c3o0/2IEmFhVt8sfandi2JGjbMImQOINE1wpmbolCoo4w8vESRTGwbFuJV6AT6
 8g9gz+S9ghdI+OxN6um0jK6bEClWqsHuYTIY/ACG69nrQdne7FtFoiD9zFHUqNQEaFET
 DHSUjKLf5t9dvWjCPCcLSRXUn15x0BVMOHEkFEab/kZdaQVT0jZNVD08WpCKveZSfwd0
 KrWg1qhLMHptUJc9FfQVq9hazG4ojzqqj6t7eq27vQNic0hvIPMEkJC3N3Tos7X8KG6H
 Po909OSaYnkM64TwwkjY2vJ7rFaYMFA3fhO0qyWXTfLud2EMuSOHEeiHL+PjdNcC9e7P
 ya8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZA0KpJu28BqLozBBPuBVAqokT3cgceSjy1up9PTHuYA=;
 b=F0o38c5zAcwluhBIU24aSvJtvpDBuSnFC9+ZTpqLaLapuwI0NzAzeFKXpmuGE6H6kT
 41bUJ1YmxeC/Ww0R+lVC0BamKv0D6nJUUMCrTiyZ6f91Rzbw6O+xzxX8IUsWj25vt5Ef
 USJaPLJJRXsjMTyQOQpxyr8f2f3TJivxMSs+HZv8jLUzE6SyMlBZFFICNOnkqszres2G
 ZmDgb3rhfgVDDg3EB7Tz05eVdIs5lgKeH15316Qesmp1EX7aGCqwOtHZ0bZWYjG0EZtn
 EHR8ycA2Ig9UFa5lScPOC5VL6hbM9TT2UMVijGXJLv1kSFg2UtZllfgWYElb23/XIfsi
 UlOg==
X-Gm-Message-State: ACrzQf3F9IpJ98480CumKwa5AlROqI+ytYKOHkM9Nz/dxuODB7yCb7Ab
 mJijAA2CxKPQvpHdEsesyTY=
X-Google-Smtp-Source: AMsMyM7vJ5B+t/BN2zg5D8USxC98nHmQpUv1w5LlTWAQwcXZawwS7Mn8bvBfRjAvNKqrFrmifJChgQ==
X-Received: by 2002:a17:906:591:b0:73d:c3ef:84ae with SMTP id
 17-20020a170906059100b0073dc3ef84aemr5202358ejn.155.1665926870045; 
 Sun, 16 Oct 2022 06:27:50 -0700 (PDT)
Received: from hp-power-15.localdomain
 (mm-39-7-212-37.vitebsk.dynamic.pppoe.byfly.by. [37.212.7.39])
 by smtp.gmail.com with ESMTPSA id
 y5-20020aa7ce85000000b0045c72bba0bfsm5572057edv.4.2022.10.16.06.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 06:27:49 -0700 (PDT)
From: Siarhei Volkau <lis8215@gmail.com>
To: 
Subject: [PATCH v3 4/7] ASoC: codecs: jz4725b: fix capture selector naming
Date: Sun, 16 Oct 2022 16:26:45 +0300
Message-Id: <20221016132648.3011729-5-lis8215@gmail.com>
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

At the moment Capture source selector appears on Playback
tab in the alsamixer and has a senseless name.

Let's fix that.

Signed-off-by: Siarhei Volkau <lis8215@gmail.com>
---
 sound/soc/codecs/jz4725b.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/jz4725b.c b/sound/soc/codecs/jz4725b.c
index 4363d898a..d57c2c6a3 100644
--- a/sound/soc/codecs/jz4725b.c
+++ b/sound/soc/codecs/jz4725b.c
@@ -183,7 +183,7 @@ static SOC_VALUE_ENUM_SINGLE_DECL(jz4725b_codec_adc_src_enum,
 				  jz4725b_codec_adc_src_texts,
 				  jz4725b_codec_adc_src_values);
 static const struct snd_kcontrol_new jz4725b_codec_adc_src_ctrl =
-			SOC_DAPM_ENUM("Route", jz4725b_codec_adc_src_enum);
+	SOC_DAPM_ENUM("ADC Source Capture Route", jz4725b_codec_adc_src_enum);
 
 static const struct snd_kcontrol_new jz4725b_codec_mixer_controls[] = {
 	SOC_DAPM_SINGLE("Line In Bypass", JZ4725B_CODEC_REG_CR1,
@@ -228,7 +228,7 @@ static const struct snd_soc_dapm_widget jz4725b_codec_dapm_widgets[] = {
 	SND_SOC_DAPM_ADC("ADC", "Capture",
 			 JZ4725B_CODEC_REG_PMR1, REG_PMR1_SB_ADC_OFFSET, 1),
 
-	SND_SOC_DAPM_MUX("ADC Source", SND_SOC_NOPM, 0, 0,
+	SND_SOC_DAPM_MUX("ADC Source Capture Route", SND_SOC_NOPM, 0, 0,
 			 &jz4725b_codec_adc_src_ctrl),
 
 	/* Mixer */
@@ -287,11 +287,11 @@ static const struct snd_soc_dapm_route jz4725b_codec_dapm_routes[] = {
 	{"Mixer", NULL, "DAC to Mixer"},
 
 	{"Mixer to ADC", NULL, "Mixer"},
-	{"ADC Source", "Mixer", "Mixer to ADC"},
-	{"ADC Source", "Line In", "Line In"},
-	{"ADC Source", "Mic 1", "Mic 1"},
-	{"ADC Source", "Mic 2", "Mic 2"},
-	{"ADC", NULL, "ADC Source"},
+	{"ADC Source Capture Route", "Mixer", "Mixer to ADC"},
+	{"ADC Sourc Capture Routee", "Line In", "Line In"},
+	{"ADC Source Capture Route", "Mic 1", "Mic 1"},
+	{"ADC Source Capture Route", "Mic 2", "Mic 2"},
+	{"ADC", NULL, "ADC Source Capture Route"},
 
 	{"Out Stage", NULL, "Mixer"},
 	{"HP Out", NULL, "Out Stage"},
-- 
2.36.1

