Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FB357956D
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jul 2022 10:42:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B68C516BD;
	Tue, 19 Jul 2022 10:41:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B68C516BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658220137;
	bh=JSh1TR3cpL57wosX6i0dlFWnEdd/CMSkyB7HbFMR6oY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Reply-To:From;
	b=o2q59bjh/BHWqP8p9aukTF8kJTev3Fh8EZO9KHgqudht0F6Q+qTwY19cggPfxcBGQ
	 plEQiEUCCQIcHkzgMIcfuXoEs/d19DZrPzhUknzYGSyPGEZerMDXPqehk3kxbnZEYp
	 lSquuvl3h3/z9+fiUKm3pcEyHfb732/jmiYv1eBo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20B98F80224;
	Tue, 19 Jul 2022 10:41:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90524F801EC; Tue, 19 Jul 2022 10:41:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A40BF80125
 for <alsa-devel@alsa-project.org>; Tue, 19 Jul 2022 10:41:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A40BF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="A6Ber8dm"
Received: by mail-pg1-x529.google.com with SMTP id s27so12846422pga.13
 for <alsa-devel@alsa-project.org>; Tue, 19 Jul 2022 01:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:reply-to:mime-version
 :content-transfer-encoding;
 bh=HdlCGwehYvXgUQKGT6l7Q/qdJdOACFalGrE3RF/LG14=;
 b=A6Ber8dmZyGnRRhUMGdmVBg+t6WNDUMebWB5AnlocEFv8V2pur3qPomxPLPAWJgZh6
 gaeHAtQKSILE+RNvBP2E1oWXZBAJxKT/KNaGA1fMR7eqWJnPbNhQwcBfMdV4EE3oeLOT
 X2x5koyKmHVqEuRXdPxgmdz6VbV/8hjIHr4oD+z/f9uOBbidHo9yTRZBNf5OxTcOrJs3
 rVfGgTHZTXVSvfPq1y7wriDXHOENY2f9KuPLD9gMOmF2sKhKU6uFXUsY2NfZMiNdO3Bs
 uGCUegjRF1KJpWrGmRuKhgun25amZd1b5Kd5nvEcxxyOWm1rqNthaF5yLUCmQWDHDCTE
 f6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :mime-version:content-transfer-encoding;
 bh=HdlCGwehYvXgUQKGT6l7Q/qdJdOACFalGrE3RF/LG14=;
 b=DRVk0kLnAv4WiN9oPPftYP/w8bL4GbamRPrCz8YmyttOWojkHZ0mHHGoSccuMtOyc/
 RxaNNIOsT/rkuDRTzXPhYeJhFG2ECoR0d4Fbdl76XFYj1yVkGYL0E2b7bgTRFTEbDTcx
 TAKh7/P4aVeXWCQ3E/gEaornZx8E0LL0AlN18O+utva/YfOBnrnIYHhoTQxyMMVm2luF
 yAEQl6ZTCY22FjJ320XekEoC7n8c1rXAmrTHnxWLzQnFTUniD/E44PTwQRNii2EnajSB
 DoMyTrIktt28MoHrUD5zkJsd6COwT+MKV4vQlnMXqqx5FFSrw9Krpz3wpJ5sBUVxrwNu
 wAgw==
X-Gm-Message-State: AJIora/zksQGBdSPLH0ZbF5RS551abWQa0MDxw11D6TqExARIF+p8D/W
 dyRkQv0EFmUoyTtazgPbJyk=
X-Google-Smtp-Source: AGRyM1sNdlzmGnOnvKYPYXXaoDC55OkPViTDGJNMMAWWsBrQZ3QuhDGkzjm2Zl2wNnfy6CjVV/mZ6Q==
X-Received: by 2002:a05:6a00:1393:b0:52a:d70a:bad with SMTP id
 t19-20020a056a00139300b0052ad70a0badmr32203118pfg.43.1658220065205; 
 Tue, 19 Jul 2022 01:41:05 -0700 (PDT)
Received: from localhost.localdomain
 (2001-b400-e38c-6ae9-98c8-af82-38bd-d18f.emome-ip6.hinet.net.
 [2001:b400:e38c:6ae9:98c8:af82:38bd:d18f])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a056a00004800b00518285976cdsm10794438pfk.9.2022.07.19.01.41.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 01:41:04 -0700 (PDT)
From: Wallace Lin <savagecin@gmail.com>
To: broonie@kernel.org
Subject: [PATCH] ASOC: nau8821: add new widget to control system clock
Date: Tue, 19 Jul 2022 16:40:47 +0800
Message-Id: <20220719084047.11572-1-savagecin@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, scott6986@gmail.com, WTLI@nuvoton.com,
 Wallace Lin <sjlin0@nuvoton.com>, KCHSU0@nuvoton.com, lgirdwood@gmail.com,
 YHCHuang@nuvoton.com, Wallace Lin <savagecin0@gmail.com>, CTLIN0@nuvoton.com,
 dardar923@gmail.com, savagecin@gmail.com, supercraig0719@gmail.com
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
Reply-To: 20220707080751.76892-1-savagecin0@gmail.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Wallace Lin <savagecin0@gmail.com>

Add new widget to control system clock for power saving.

Signed-off-by: Wallace Lin <savagecin0@gmail.com>
Signed-off-by: Wallace Lin <sjlin0@nuvoton.com>
---
 sound/soc/codecs/nau8821.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/sound/soc/codecs/nau8821.c b/sound/soc/codecs/nau8821.c
index 2600be250a3c..83a17c48d594 100644
--- a/sound/soc/codecs/nau8821.c
+++ b/sound/soc/codecs/nau8821.c
@@ -36,6 +36,7 @@
 
 static int nau8821_configure_sysclk(struct nau8821 *nau8821,
 	int clk_id, unsigned int freq);
+static bool nau8821_is_jack_inserted(struct regmap *regmap);
 
 struct nau8821_fll {
 	int mclk_src;
@@ -495,7 +496,33 @@ static int nau8821_output_dac_event(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+static int system_clock_control(struct snd_soc_dapm_widget *w,
+				struct snd_kcontrol *k, int  event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
+
+	if (SND_SOC_DAPM_EVENT_OFF(event)) {
+		dev_dbg(nau8821->dev, "system clock control : POWER OFF\n");
+		/* Set clock source to disable or internal clock before the
+		 * playback or capture end. Codec needs clock for Jack
+		 * detection and button press if jack inserted; otherwise,
+		 * the clock should be closed.
+		 */
+		if (nau8821_is_jack_inserted(nau8821->regmap)) {
+			nau8821_configure_sysclk(nau8821,
+				NAU8821_CLK_INTERNAL, 0);
+		} else {
+			nau8821_configure_sysclk(nau8821, NAU8821_CLK_DIS, 0);
+		}
+	}
+	return 0;
+}
+
 static const struct snd_soc_dapm_widget nau8821_dapm_widgets[] = {
+	SND_SOC_DAPM_SUPPLY("System Clock", SND_SOC_NOPM, 0, 0,
+		system_clock_control, SND_SOC_DAPM_POST_PMD),
 	SND_SOC_DAPM_SUPPLY("MICBIAS", NAU8821_R74_MIC_BIAS,
 		NAU8821_MICBIAS_POWERUP_SFT, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("DMIC Clock", SND_SOC_NOPM, 0, 0,
@@ -607,6 +634,9 @@ static const struct snd_soc_dapm_route nau8821_dapm_routes[] = {
 	{"AIFTX", NULL, "ADCL Digital path"},
 	{"AIFTX", NULL, "ADCR Digital path"},
 
+	{"AIFTX", NULL, "System Clock"},
+	{"AIFRX", NULL, "System Clock"},
+
 	{"DDACL", NULL, "AIFRX"},
 	{"DDACR", NULL, "AIFRX"},
 
-- 
2.25.1

