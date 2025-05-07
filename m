Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 391F1AB7FA9
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 10:04:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9C37625CD;
	Thu, 15 May 2025 09:56:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9C37625CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747295784;
	bh=+NkIa3tRR6OnKKuCWg/7/UZBXPY1qcvu5koCiqXLwVo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ezmAVb0OJaJgcqKMGeQ00VpSVmlptXL6JgUZ9V8WsI5C+h8UkwBOsd1VLUxKZ2kQj
	 70QAXiyR1NuVeKrayNlegnWxX8fJlCJKTidJraJInyZlFvCXYWpCK68zkHTtoJ2HRe
	 /f/wbSiIER3/q0JRAT0GSXQUwINUaNjnPfnypF74=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A8B5F898D3; Sun, 11 May 2025 16:33:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2E4DF898D2;
	Sun, 11 May 2025 16:33:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 504BBF8A079; Wed,  7 May 2025 10:02:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84B06F89E26
	for <alsa-devel@alsa-project.org>; Wed,  7 May 2025 10:02:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84B06F89E26
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=fairphone.com header.i=@fairphone.com
 header.a=rsa-sha256 header.s=fair header.b=0xPzp3Q7
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ace3b03c043so999533266b.2
        for <alsa-devel@alsa-project.org>;
 Wed, 07 May 2025 01:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1746604927; x=1747209727;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zEN0PXya3Y5YPAUDTh8Px+2+gU/KgrKVkv5tePKDfas=;
        b=0xPzp3Q7KIN0E7n5Mf6Vf8AWF5qWyygCmz7WcV1lgGQj3bXwbodLyqfOHWWNn7XGeF
         XNTccVXzC7CTTu7O5YGS+TCwc/DAiwUZfqPrLSk9DNM+2xrGE5nr9oglsoa9sXfWPyRW
         ZVtFDvTngye6m/jU4jZ5NC4WwahqPJrxL/2mwikKI0SAottvWgKDVdE6YxY/q0zC0Gxp
         hX5tYED8rS5dtri9UJJR6iSvsS49Zvrz6Vf23hD0PFyAZpG0FhUj9OAg4ksTP6kDV57c
         7gneuv5c4SeVD2c8xV+T3yxYHVT2tOvHbp/jgZe+8X1PQVG8kQnL9lFHL1x6bdDcfDbb
         XeoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746604927; x=1747209727;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zEN0PXya3Y5YPAUDTh8Px+2+gU/KgrKVkv5tePKDfas=;
        b=tO3nnrG4rFepqZRpUMSBaCvYQwcuPYkokd46ofHVCoKAg9J7BoQ0FsRM/Uu01oGhd8
         CTJmxI92QdWWgXfV7mvzCFuzdY+yXLR48ESiCaBEll7OMzdCWFoMeg215uEwaUw5eymn
         coMJzNhZYuCWLKtyYqTEc9/RJIhn40xO5yylkz6JuvvgHOhmaCvmCMp5CvpstzhkNkIx
         7B/fDT7/nEwXioS6vkSXYqxC+cNDJrUhOcgaqrdniPej2CH245whnRe9BvXvWB6hd9gP
         jqZyqfalHJgyrupZsKTJyjIJhIHsAc04hd7vHdbIeBUY+Ugbs8dctA1i3EMmo+BnzhNO
         jbfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCP2GMeI/JTYSTZycmifdkmYsCJ0WDKNd/2MB5JWEQezC60grzCVsqyBBRr6Fe8+9f2XoGLLKHKckL@alsa-project.org
X-Gm-Message-State: AOJu0Yx3Fq5Z8Qh5hFgUQmyyADLlmaQw6JGRETFht4vx4Kh67IVtZKbA
	7+f4R3y3N9+fBuqkiS77eqsRUT29xH5gdjaLP9hGxaVs7pdXl/J+9EcvslsfY18=
X-Gm-Gg: ASbGncuNAap+XMzfA83OqL8+XFcJVfXmwuKG8wHTKVMGzrzBMcRLBvdQFsuzPOrkpHb
	R3UyIIOfsFCwsHAghKUPC/ykKpXCtMtnFUM5uvhWkda3qN0tDEyzRGefRm9fzkP90dFfuCbXntN
	SFenwvWiqFY0MSdIe9zcdS/Mrf6rmubc6WGNTYQWIS02V7Cm7NSP738aqV+EWQFxFyXV2AqWyyo
	qTcCrVEY0rj/4vW3YHeMXTVVAzujAQArB8Kf/sPfaXcq1D0IdTuJNM+2FtnTlsWpbDEkKgXgjlz
	8wqJMqwK9TDyQC+jn77ZbLc/EocoW/WZgyT+IhQ7tTCmXSvynZOOD8/2PDxeXzk3qBf1XkR6pjR
	er9NBDh/qFEuM0Q==
X-Google-Smtp-Source: 
 AGHT+IFM7Oq1Xn0VIuxfyz3KRNIFNY5cp5qjc6oWjmusZGZM8KjZIdX1ZYRy5EquRLMrIpwTTSPwwg==
X-Received: by 2002:a17:907:c28e:b0:acb:5f17:624d with SMTP id
 a640c23a62f3a-ad1e8d2ce68mr215405466b.57.1746604927193;
        Wed, 07 May 2025 01:02:07 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl.
 [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1894c0310sm855236066b.88.2025.05.07.01.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 01:02:06 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 07 May 2025 10:01:39 +0200
Subject: [PATCH v4 3/5] ASoC: qcom: sm8250: add DisplayPort Jack support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-fp5-dp-sound-v4-3-4098e918a29e@fairphone.com>
References: <20250507-fp5-dp-sound-v4-0-4098e918a29e@fairphone.com>
In-Reply-To: <20250507-fp5-dp-sound-v4-0-4098e918a29e@fairphone.com>
To: Srinivas Kandagatla <srini@kernel.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-MailFrom: luca.weiss@fairphone.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 7EUPGPMP4T5S7DMOWDIJO5MFHDNG3CJ3
X-Message-ID-Hash: 7EUPGPMP4T5S7DMOWDIJO5MFHDNG3CJ3
X-Mailman-Approved-At: Sun, 11 May 2025 14:33:41 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7EUPGPMP4T5S7DMOWDIJO5MFHDNG3CJ3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add support for DisplayPort Jack events, so that user space can
configure the audio routing correctly.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/qcom/sm8250.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index f0d83a843765d8dcdd51569e7cbc95eb72292497..2317fe285ee7d41689d7fac453164fbe706744ff 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -25,6 +25,7 @@ struct sm8250_snd_data {
 	struct snd_soc_jack jack;
 	struct snd_soc_jack usb_offload_jack;
 	bool usb_offload_jack_setup;
+	struct snd_soc_jack dp_jack;
 	bool jack_setup;
 };
 
@@ -32,14 +33,16 @@ static int sm8250_snd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	int ret;
 
-	if (cpu_dai->id == USB_RX)
-		ret = qcom_snd_usb_offload_jack_setup(rtd, &data->usb_offload_jack,
-						      &data->usb_offload_jack_setup);
-	else
-		ret = qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
-	return ret;
+	switch (cpu_dai->id) {
+	case DISPLAY_PORT_RX:
+		return qcom_snd_dp_jack_setup(rtd, &data->dp_jack, 0);
+	case USB_RX:
+		return qcom_snd_usb_offload_jack_setup(rtd, &data->usb_offload_jack,
+						       &data->usb_offload_jack_setup);
+	default:
+		return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
+	}
 }
 
 static void sm8250_snd_exit(struct snd_soc_pcm_runtime *rtd)

-- 
2.49.0

