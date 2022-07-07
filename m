Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0167156D696
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jul 2022 09:20:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97FDE82A;
	Mon, 11 Jul 2022 09:19:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97FDE82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657524043;
	bh=rSfH7YNd/4WHLwJgnc6gYAd4SwILS4C3ejiI88JhD28=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Jv3vL5uJccvNQpnZp0GBJo7wCrVwWZ7XhmtdzWElbTYX90VaHbObqRHUG5pYot1Lp
	 8r/JrczBmmLhWSsa1wxW1VaPTcjs9Dh8ZQAWppBr2sLxjYf+0Uc2ivhhxJvRKB0f1t
	 V9ebahFvQRhnuRWhUtq7+blV/TGVrj/t7E4ZITx8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32F99F804D6;
	Mon, 11 Jul 2022 09:19:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 169FAF8016A; Thu,  7 Jul 2022 10:08:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3C9BF800DF
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 10:08:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3C9BF800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WJGXQsQP"
Received: by mail-pf1-x429.google.com with SMTP id y9so3630920pff.12
 for <alsa-devel@alsa-project.org>; Thu, 07 Jul 2022 01:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9OQsn3k7n+Fp/tYnNYewakJ/MpfwqjttJ4lbj4UUSe4=;
 b=WJGXQsQPGUJctU8cd/RnpN8TP6kutcpXuqVtV1Gyzy9fAxFOMoS0c5aG5BBl/r0g2V
 DX0smN9na0ycikKK9J1lLlolmPNdPh1hMPk2Yo1JE89CCZ+sS4vI2yu5+08GXTSmioBS
 wmOTQSH+xbS1OeXbY45P540rwHb9UZncvioPLvB0JRjTLIWu0X/TOX8t2/LDG+OTneYw
 C4n2aYrcGG5/ykQRVa0VrBsJT7wY5pNhen1nfFaL3tVikjnDZtWZzeVzJDm7vAFPq7QY
 cFBPEM5sLyOSCyp/13mdDJfmalBmIkLVydVvQqx+plS+D9Q0qsu4V96miuGOzM6BgC6k
 Sjsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9OQsn3k7n+Fp/tYnNYewakJ/MpfwqjttJ4lbj4UUSe4=;
 b=mDiBVFWjEs11N8MeT7MOtbREs6gIziU4Ox+jZe4xfJ2K+23fYOO8uMPm+78QaJI2El
 ZqgNQIp3BFtkgTRToGOPuRCe2Tl+c9SdYTp0KEOc/lI5gXvWQTT3Ohk0S/PUnNDt9jII
 /ojc0CTHRwACmiG78iLD4izYbljflbGDWuLU2o4AC/Il/j+v92J+Y0HHPm03s3ei1p/Q
 +wt22SreHnnIqsuZzzIt5VhYJcKKC3phak2PeGqRDsO6eMQyOd/eey5PNyMBF669Mlae
 LEHjjfXZgeSAa5JfI0EJ09qu6OD6I4za0SSWfg6wmJnllmFuybkJzmYjn4mrqgAgYlw9
 /f/Q==
X-Gm-Message-State: AJIora8MTkZhC491FbEnHTHr1XfDYaKdeyUwc6HGUmrgxa8lr2luRVGu
 bfKmN+gME7Wzd/7Zb9pJI8k=
X-Google-Smtp-Source: AGRyM1vZrUQmD+5Mo6+rpCk2lsIsYar6ugQqKJvtlrfgHziLSU/Dlyc96lm7YDa1F5HgB+vs8/FMAg==
X-Received: by 2002:a63:904b:0:b0:412:aea7:9e7a with SMTP id
 a72-20020a63904b000000b00412aea79e7amr4292460pge.421.1657181291984; 
 Thu, 07 Jul 2022 01:08:11 -0700 (PDT)
Received: from localhost.localdomain
 (2001-b400-e35a-838c-69b6-1f1f-b3c0-f714.emome-ip6.hinet.net.
 [2001:b400:e35a:838c:69b6:1f1f:b3c0:f714])
 by smtp.gmail.com with ESMTPSA id
 cp2-20020a170902e78200b001664d88aab3sm27059430plb.240.2022.07.07.01.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 01:08:11 -0700 (PDT)
From: Wallace Lin <savagecin@gmail.com>
X-Google-Original-From: Wallace Lin <savagecin0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH] ASOC: add new widget to control system clock
Date: Thu,  7 Jul 2022 16:07:51 +0800
Message-Id: <20220707080751.76892-1-savagecin0@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 11 Jul 2022 09:19:08 +0200
Cc: alsa-devel@alsa-project.org, scott6986@gmail.com, WTLI@nuvoton.com,
 Wallace Lin <sjlin0@nuvoton.com>, KCHSU0@nuvoton.com, lgirdwood@gmail.com,
 YHCHuang@nuvoton.com, CTLIN0@nuvoton.com, dardar923@gmail.com,
 savagecin@gmail.com, supercraig0719@gmail.com
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

From: Wallace Lin <sjlin0@nuvoton.com>

Signed-off-by: Wallace Lin <sjlin0@nuvoton.com>
Signed-off-by: Wallace Lin <savagecin@gmail.com>
---
 sound/soc/codecs/nau8821.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/sound/soc/codecs/nau8821.c b/sound/soc/codecs/nau8821.c
index 6453e93678d2..761a3dc08edc 100644
--- a/sound/soc/codecs/nau8821.c
+++ b/sound/soc/codecs/nau8821.c
@@ -34,6 +34,7 @@
 
 static int nau8821_configure_sysclk(struct nau8821 *nau8821,
 	int clk_id, unsigned int freq);
+static bool nau8821_is_jack_inserted(struct regmap *regmap);
 
 struct nau8821_fll {
 	int mclk_src;
@@ -493,7 +494,33 @@ static int nau8821_output_dac_event(struct snd_soc_dapm_widget *w,
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
@@ -605,6 +632,9 @@ static const struct snd_soc_dapm_route nau8821_dapm_routes[] = {
 	{"AIFTX", NULL, "ADCL Digital path"},
 	{"AIFTX", NULL, "ADCR Digital path"},
 
+	{"AIFTX", NULL, "System Clock"},
+	{"AIFRX", NULL, "System Clock"},
+
 	{"DDACL", NULL, "AIFRX"},
 	{"DDACR", NULL, "AIFRX"},
 
@@ -1430,6 +1460,7 @@ static const struct snd_soc_component_driver nau8821_component_driver = {
 	.dapm_routes		= nau8821_dapm_routes,
 	.num_dapm_routes	= ARRAY_SIZE(nau8821_dapm_routes),
 	.suspend_bias_off	= 1,
+	.non_legacy_dai_naming	= 1,
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-- 
2.25.1

