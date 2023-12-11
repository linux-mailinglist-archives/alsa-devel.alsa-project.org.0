Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E35580CB39
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Dec 2023 14:38:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2821FE72;
	Mon, 11 Dec 2023 14:38:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2821FE72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702301939;
	bh=Z4dXxdtXtBABxN8+xzfYAPaecDj0d8xQ+Hb4hmjrcHw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=u2T4+966bFS5EaZNx7mJ6SRUPHXzmBTc1HSDhgFx30bmt+mRHVg3ue+BQyhWq7syj
	 yu0SymppqFi462wKAoCqMTSrxUtzuXByXpGvVBvzgZBz2BPFUJAHFWuTeKGc44jmkH
	 gsKbyYkfmXNcqW5QQkmlHzmyzwwBN+f3fxXuBSv0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03D98F80674; Mon, 11 Dec 2023 14:37:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E430AF8065C;
	Mon, 11 Dec 2023 14:37:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8D5FF80166; Mon, 11 Dec 2023 10:54:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BD0F3F800D2
	for <alsa-devel@alsa-project.org>; Mon, 11 Dec 2023 10:54:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD0F3F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Hb8jYlle
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-5c21e185df5so3588063a12.1
        for <alsa-devel@alsa-project.org>;
 Mon, 11 Dec 2023 01:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702288454; x=1702893254;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AA04sfNkH62YtYg6Nmq5x2j1Jcg5BYJtxmdnCLXGgCI=;
        b=Hb8jYlleShzasVK+BjvD0MGV+LbS8Wto+lxYuvXemTNpN4w6YmOnD6yBJBcwtyYgRL
         QWlNrYvDcdJk7u67Lt/10jjGIs5CmulOu5eG7hdx05OdJhTRaLIogAZ2tdTgwOVLI69h
         byMOO/px0YENs+sWjqINyO4f7G31Cai5TPakifaQUEG8L308RgTdyPeJUojZ4PIlU4GI
         UUvui9PwArQmxfjUoHqz5l9KaTgakMkqdUx6cjf4lKIH/NXoz7JeCHBS0nrs8UsRwUBE
         XYCEyHNyjy7zkXR1qDZqfPoEtNLdjwdBLWjz+Z9i3F0oCaKEw4zVXkM+EOAohEWQzoiD
         dPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702288454; x=1702893254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AA04sfNkH62YtYg6Nmq5x2j1Jcg5BYJtxmdnCLXGgCI=;
        b=TNQCBAInvJpQzUt31WznLU6DekOXiUs53WnYMB9KNCLV/mIWfSOgc39946fl03uZo2
         QakvQu7TgpRbFmngS7Gw68is3fxo3Sk/n8lp5uc6naSoL06xpw8sjC4rZXKtZF2aW6Pk
         6vgA75ZeO5Tz7ZZgl0R0HqQZADjA0MnarTxOzcxLk6NKiCygcK9cFQECcbs/meQJr9As
         21irIsB3RKAJDgTnuSfm0xD5QBs1ftCKbFe63jDUt5Dpa3q6if2cFEDCTROc9PMNDK4s
         6SYGNzuVUychxqODvCbp8uHeDLVStNUXO4gJcqr3uw5RJAxszgNE38riBLSMXbH1INTc
         m+Rg==
X-Gm-Message-State: AOJu0YyWRZ0yE4zN2GSIUxs0rK+9ONgdIzfD+jJNc5CqWQ2QxzNoB9o5
	MxwRJHyE/fu3uj2XFz43lxI=
X-Google-Smtp-Source: 
 AGHT+IFqSNjgBxvcCASuoNTVlJPNlgjlLzFSaeUpu44Ey6GZeodxdNuVHFZImKjMy0H9Ph6Aiyyh5w==
X-Received: by 2002:a05:6a21:789d:b0:18f:df5f:d9f3 with SMTP id
 bf29-20020a056a21789d00b0018fdf5fd9f3mr6159341pzc.91.1702288454100;
        Mon, 11 Dec 2023 01:54:14 -0800 (PST)
Received: from localhost.localdomain
 ([2409:8a6a:5426:70b1:a6fc:77ff:fe50:e63d])
        by smtp.gmail.com with ESMTPSA id
 mt20-20020a17090b231400b002853349e490sm8149734pjb.34.2023.12.11.01.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 01:54:13 -0800 (PST)
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
Subject: [RFC, PATCH 2/2] ASoC: qcom: sm8250: Add TERTIARY_TDM_RX_0 support
Date: Mon, 11 Dec 2023 17:53:57 +0800
Message-ID: <20231211095357.4629-2-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211095357.4629-1-lujianhua000@gmail.com>
References: <20231211095357.4629-1-lujianhua000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: lujianhua000@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 73TXQHF5VXCZYKYYS4ITQG773EK52MLE
X-Message-ID-Hash: 73TXQHF5VXCZYKYYS4ITQG773EK52MLE
X-Mailman-Approved-At: Mon, 11 Dec 2023 13:37:06 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/73TXQHF5VXCZYKYYS4ITQG773EK52MLE/>
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

