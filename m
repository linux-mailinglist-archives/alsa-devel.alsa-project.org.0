Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F5A80F189
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Dec 2023 16:54:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2E0F868;
	Tue, 12 Dec 2023 16:54:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2E0F868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702396482;
	bh=Lgqc+VmtbjrvqAKislWqkpgWXOdYzrE/++kcbwu6YoE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Jyvo/AbOryCfacUNrryw6qgKYL5dr9IXhBQmGubgb1H0+6d+qQuYL0jRN0H1weQ5d
	 BovRSq2VyMTv0u5Tku2Z1qr2l4cIgvM70Zpt8uNC0ded5FnVsPH5U1mgWHs/BPlIsD
	 iEh7gGONjV+x/u78RFiSekrYMIbc6hjz0vscYJMU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0FC6BF806A6; Tue, 12 Dec 2023 16:52:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EFE3F806AA;
	Tue, 12 Dec 2023 16:52:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6704F8016A; Tue, 12 Dec 2023 10:59:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF6A8F8001F
	for <alsa-devel@alsa-project.org>; Tue, 12 Dec 2023 10:59:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF6A8F8001F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BgBTP1nO
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-3b9ef61b6b8so3071418b6e.3
        for <alsa-devel@alsa-project.org>;
 Tue, 12 Dec 2023 01:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702375162; x=1702979962;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5GlMW1Kh4nLITNIYwe64bCuIn3y8U980DG6b5ax924=;
        b=BgBTP1nOVBFbYuIaxpo38dsUT967RXzVwwvZ9xY15R+mbyX4Q+nrruQhXWkLOHBYHs
         49p/LOsJ4gIL4NksORKW2vf01CYLC+MDu59asxH8GGh9stAwElEFruqLn9oen8qivWs9
         9Nc79tP6T+4zEtLY3aNzwCOF0lfY4+KHINJbRIVOtnnFTKd+6VUErx9Zi0kjn6yJKSPI
         F3rGz+NS3sHM1FO2ngZybO4aiHEllFbWATsmv9XyhT8uF0cf5H8snmHEeiwXY0OWDfc/
         7yp1I1hh+iSPHGC6J/6Ztva5jjf6+CWsbihK9zSABx3KWqCjUQ5R9vywpoD9wKmf6Vp/
         2S2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702375162; x=1702979962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p5GlMW1Kh4nLITNIYwe64bCuIn3y8U980DG6b5ax924=;
        b=EXBG4/kyxCNU0T6BSfk49AcmmgeHabkMDZle58EObTenwBOLMDDYWmWOG/BmtSeLq4
         N+ltBzRB7lV1SBYSdRXmW/5+G6gutz2o8HfDVn21pw/v+T1vQc1EAA+g3m3SV2lSTliZ
         3Geuc3bPCQvjOfesmShId1NIs9WWUEAExRZ4HMq9pm05ofFfs0xWyvEFcg/5idqtU2cb
         cWJwEmyTCQ9GNNVqkWYS85zaw4XSKXoX+XtBzzDUJlqLzbKLOTk3dN/YENORH+XU8LHj
         PKCCQxKKMEzPL8iGVhBaKTepfLelgyUFwPIcDgudMv657PyvOboCDLAc1y11fe1pA04Z
         ByRw==
X-Gm-Message-State: AOJu0YwB91WwN1M4y12te+1kVFl5hYeX56m5ls4viX5GvpmVSyVjWPBk
	GdE8F1w6qmAuK7u+le1jTqQ=
X-Google-Smtp-Source: 
 AGHT+IGv+pUTcYw3AN16Fy3gEBQql0CgY9sI+VsP3TLi5giVX8oZb9syxSid0H88mpsNY3owKtMXEw==
X-Received: by 2002:a05:6808:3028:b0:3a8:432a:ea13 with SMTP id
 ay40-20020a056808302800b003a8432aea13mr7516672oib.46.1702375162279;
        Tue, 12 Dec 2023 01:59:22 -0800 (PST)
Received: from localhost.localdomain ([117.189.239.2])
        by smtp.gmail.com with ESMTPSA id
 d4-20020a056a0010c400b006ce7344328asm7730354pfu.77.2023.12.12.01.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 01:59:21 -0800 (PST)
From: Jianhua Lu <lujianhua000@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jianhua Lu <lujianhua000@gmail.com>
Subject: [RFC, PATCH v2 2/2] ASoC: qcom: sm8250: Add TERTIARY_TDM_RX_0 support
Date: Tue, 12 Dec 2023 17:58:50 +0800
Message-ID: <20231212095850.26482-2-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212095850.26482-1-lujianhua000@gmail.com>
References: <20231212095850.26482-1-lujianhua000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: lujianhua000@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XNGBP22XSG4LA346VXVT3KBLG6TWGVAL
X-Message-ID-Hash: XNGBP22XSG4LA346VXVT3KBLG6TWGVAL
X-Mailman-Approved-At: Tue, 12 Dec 2023 15:52:07 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XNGBP22XSG4LA346VXVT3KBLG6TWGVAL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add TERTIARY_TDM_RX_0 case to make speaker amplifiers working
on xiaomi-elish tablet.

Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
---
No changes in v2.

 sound/soc/qcom/sm8250.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index f298167c2a23..00c89c073e72 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -16,6 +16,7 @@
 
 #define DRIVER_NAME		"sm8250"
 #define MI2S_BCLK_RATE		1536000
+#define TDM_BCLK_RATE		12288000
 
 struct sm8250_snd_data {
 	bool stream_prepared[AFE_PORT_MAX];
@@ -53,6 +54,7 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	int ret, j;
 
 	switch (cpu_dai->id) {
 	case TERTIARY_MI2S_RX:
@@ -63,6 +65,23 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
 		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
+	case TERTIARY_TDM_RX_0:
+		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_DSP_A;
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_TER_TDM_IBIT,
+			TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+
+		for_each_rtd_codec_dais(rtd, j, codec_dai) {
+			ret = snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+			snd_soc_dai_set_sysclk(codec_dai,
+				0,
+				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+			if (ret < 0) {
+				dev_err(rtd->dev, "TDM fmt err:%d\n", ret);
+				return ret;
+			}
+		}
+		break;
 	default:
 		break;
 	}
-- 
2.41.0

