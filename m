Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8355C995163
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2024 16:22:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11DF584A;
	Tue,  8 Oct 2024 16:22:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11DF584A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728397340;
	bh=LOfadXrLg7ZRoN+A8CWVlfI8ytsXadkatDmRlJNEVAg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jpw5y4LMeUsGGUp70NAI7F6C68XmiS2b7hm9Sjp8KswVVzOBIRZPfRqvJuLHpja1U
	 UxqNXztP1OJBCgYXbXTPhNPbVhSL3hMlQtASlbiG7caEtn/EaHt6SdPSowujMg80yT
	 sMw4iUiFpG7iVzevs3JZbz2PvagytZxXxX99Zx8I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E06E2F80634; Tue,  8 Oct 2024 16:20:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 08607F80638;
	Tue,  8 Oct 2024 16:20:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EDC0EF8059F; Wed,  2 Oct 2024 04:20:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3BBF6F8057A
	for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2024 04:20:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BBF6F8057A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=D7GanSzY
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5c42f406e29so8514187a12.2
        for <alsa-devel@alsa-project.org>;
 Tue, 01 Oct 2024 19:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727835625; x=1728440425;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OCYOTM8/0Ug4V9lj8bQNm7elnTCjMFp7xXGYdHTDU3c=;
        b=D7GanSzY/jcO78RqTyrbiJpvPzwuJBA/n77Um+VD9RDBOtp05W3LhDeGh2GsXijxlh
         ggZlcJ66kd5lxHqESj6mBnXaUaqUR8gWSl1nEyo2ltWMnRrQd4rEGUWhfnPsATM1C5w0
         Z1xHWzbrUxnyIz3UchGwmQmGWBSLSeDtS928spmkcJmkP5ATUdzuUIJf/CFf5oDIoM20
         d8gZ7ikdcy8GFP2BcYI1doLrHgdvseoKanmsdIuOkRq62dvWE4W6N/VSSp2JDTwGC3rc
         SUz2zTHOQug5fcfr7YA+2pm7DiCqTB1rFJ31LtSvjM6Km/K9PX3EeD7q1Uc0T1pwfX74
         nXaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727835625; x=1728440425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OCYOTM8/0Ug4V9lj8bQNm7elnTCjMFp7xXGYdHTDU3c=;
        b=wceVcsb+oqJD/7Symqv4qeKLASGUIQofBaixArtkvS2okjIErDc9cqG/XCMlzbwFQm
         Pp2c4NElXXL94i6MF2g+WklP8QmDONQiABn+lxcxc4E1t7DEkfex9Lp8VT5Y4W4e4PoY
         Yh1HSyrbnFcQFlDSDq3jI7WM6khnYST/GjpzBfuFcws4KIbwMf2ixi5XWh3mSmOX+Zn0
         tqZhZPuLws+Y086m5rj1nmPMwHacssn8NE7/OO+eBqYaFFCwm0mRJQD1YjUVH7YDGNt9
         9UPhRakXr49tMLL1ujxRGfirlWZMdQa0vwk2jOj0a/QhTdC8C09cxkhmtKkkqOXJ0Ugr
         EWTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9i6HCL4FsdsJkf1WuqYi9ptli4U/6PTJnucJJyhcU9bzmBIrQMw5m7fd/E0HA1YLkB6+St9yXXSlW@alsa-project.org
X-Gm-Message-State: AOJu0YxQ+GwGMZPF+Dib0tqV1QoXfE1nxBDEWElo/gv+OW31gHX5Kxku
	E+fysKyjAR9H4ac9WDdJ/fKonO98vjKkVmfeZW3NRMaBPi2t9QcfUa+Hys8oiMU=
X-Google-Smtp-Source: 
 AGHT+IG+Q/gURHat1q3AUvb0+GovkmpG4ajTJTbVyAEb1VAT3Jst29VyqLUHNkKFUyiefEeDXTOUcg==
X-Received: by 2002:a17:906:99c5:b0:a7a:9144:e256 with SMTP id
 a640c23a62f3a-a98f8213366mr125224866b.6.1727835624893;
        Tue, 01 Oct 2024 19:20:24 -0700 (PDT)
Received: from localhost.localdomain ([2.125.184.148])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2945f2esm787518866b.117.2024.10.01.19.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 19:20:23 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: linux-sound@vger.kernel.org,
	srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com,
	lgirdwood@gmail.com,
	broonie@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	elder@linaro.org,
	dmitry.baryshkov@linaro.org,
	krzysztof.kozlowski@linaro.org,
	caleb.connolly@linaro.org,
	linux-kernel@vger.kernel.org,
	a39.skl@gmail.com,
	alexey.klimov@linaro.org
Subject: [PATCH v2 3/7] ASoC: qcom: sm8250: add handling of secondary MI2S
 clock
Date: Wed,  2 Oct 2024 03:20:11 +0100
Message-ID: <20241002022015.867031-4-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241002022015.867031-1-alexey.klimov@linaro.org>
References: <20241002022015.867031-1-alexey.klimov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: alexey.klimov@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: OPRJ5YDSVRCUE7YV22B4R5K3XC7OVWKC
X-Message-ID-Hash: OPRJ5YDSVRCUE7YV22B4R5K3XC7OVWKC
X-Mailman-Approved-At: Tue, 08 Oct 2024 14:20:35 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OPRJ5YDSVRCUE7YV22B4R5K3XC7OVWKC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add handling of clock related to secondary MI2S_RX in
sm8250_snd_startup().

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 sound/soc/qcom/sm8250.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 19adadedc88a..8776c35a98df 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -63,6 +63,14 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
 		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
+	case SECONDARY_MI2S_RX:
+		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_SEC_MI2S_IBIT,
+			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		snd_soc_dai_set_fmt(cpu_dai, fmt);
+		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		break;
 	case TERTIARY_MI2S_RX:
 		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
 		snd_soc_dai_set_sysclk(cpu_dai,
-- 
2.45.2

