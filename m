Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D52EA813300
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Dec 2023 15:24:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B073DE5;
	Thu, 14 Dec 2023 15:24:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B073DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702563872;
	bh=WXB1c7ernYz0tJWArDKhx499nDcfaGA0MDoI3fa3ELE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nbjHSJ41l+dCKwg9ZC3+/H0DHJ1AM8YNfkqSw1WUrqITRUyb0qjU2cLVqkoZrEBHy
	 DIidyos/3tRJrmBSJw/YmCiM4jMMsdOtc6iJYM/VcsgL2WXv+JMwS/YaH1J2Mvjnwt
	 xurtcigQNT8pVK9PNi58X8kcICCOaAISkEYCS0c4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0BB5F80639; Thu, 14 Dec 2023 15:23:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 34B83F8061C;
	Thu, 14 Dec 2023 15:23:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4FE5DF8016A; Wed, 13 Dec 2023 13:37:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2A59AF8001F
	for <alsa-devel@alsa-project.org>; Wed, 13 Dec 2023 13:36:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A59AF8001F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Md5LqOaU
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-5c210e34088so5613328a12.2
        for <alsa-devel@alsa-project.org>;
 Wed, 13 Dec 2023 04:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702471010; x=1703075810;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZihwxl0v63j7g6/9Ub3zyT34OyL1Z04NfBICmYEzJk=;
        b=Md5LqOaUajfzGRoU5QK5XJqQg0olFalqpbXKXwMvZCewKYZswKLy4OKEUIMk5qXLP+
         G2g5RXh2F00rGcdwYosm3fDATewnShZ/mxdEmIvsJUuU+9HlH+VU0C6yMzRawVaw2YBf
         jnpyHTIPun4O0mlYvUvf/OwjHy3vU3v0SshRs5vKj0OcXTVBV8QbUaAjN7PjjJOTqsyg
         NHFg6jXy8X0hfnGmcey1o5UOAnHXwgTAl9SA87dxInIpNuMSL9kQxy4+j9iGBBq+6QmE
         urt8VJImbvAkw/rfqSSdBpH8ojISJjQYab5Ew+Ad6v5d6mtjKiLLC6+zEJ5qSIJJ7PDL
         5IBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702471010; x=1703075810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QZihwxl0v63j7g6/9Ub3zyT34OyL1Z04NfBICmYEzJk=;
        b=ZJ/3he9wMsWnD9c6dr6ThfrbsyuSPyiwLGnYs7Iry9N3z20QLFPSOio24tqLFJt5jT
         696eLJ/W6WR9A3UdTzYIB/yFL2x1ZN1EjPD1ggxDVAhOopzbwJ5bu/awTrm5rY9h22rn
         X3VUxIo5fpIjBH27tOECPpy3Q+40hg+B0NWVmCjQOxHdpO2m4zV3V0RQT4L80lKxB20l
         ZjuTYyXNi4eb1mZWCcSQ8KhhPyRq4LPT7zRw2NYtrpG4EU5Ip9CyIkYL5B1TQ/fxPvdw
         TmQHLIHuAqPdXtCEywzPSxKLMMHWfejFSErMhJ9cuuUbUS/ePwV+JHUYxW3cDip85wYn
         DvUQ==
X-Gm-Message-State: AOJu0YzTUCqnI1Zv87mf49b5LMOntNYMpTUO1mHvtG0iVOPwjlFG8rkx
	hmQVl5nHMg5WITfGkVQabFY=
X-Google-Smtp-Source: 
 AGHT+IEm5mEDtS1LOQPlg62W3tJlZX2ZCSTzqHOg/4SL8BX/XhHwx2CVtF+Cuq8ajRix5XT7ni3shg==
X-Received: by 2002:a05:6a20:9481:b0:18b:4a28:6e15 with SMTP id
 hs1-20020a056a20948100b0018b4a286e15mr8029288pzb.34.1702471009861;
        Wed, 13 Dec 2023 04:36:49 -0800 (PST)
Received: from localhost.localdomain ([117.189.237.103])
        by smtp.gmail.com with ESMTPSA id
 x3-20020a056a00188300b0068fe5a5a566sm10193584pfh.142.2023.12.13.04.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 04:36:49 -0800 (PST)
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
Subject: [PATCH v3 4/4] ASoC: qcom: sm8250: Add TERTIARY_TDM_RX_0 support
Date: Wed, 13 Dec 2023 20:35:56 +0800
Message-ID: <20231213123556.20469-4-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231213123556.20469-1-lujianhua000@gmail.com>
References: <20231213123556.20469-1-lujianhua000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: lujianhua000@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: WCE3USNLU5A34VDBU4NJM3PPDW6M3SJ6
X-Message-ID-Hash: WCE3USNLU5A34VDBU4NJM3PPDW6M3SJ6
X-Mailman-Approved-At: Thu, 14 Dec 2023 14:22:56 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WCE3USNLU5A34VDBU4NJM3PPDW6M3SJ6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add TERTIARY_TDM_RX_0 case to make speaker amplifiers working
on Xiaomi Pad 5 Pro tablet.

Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
---
No changes in v3.

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

