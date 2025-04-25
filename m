Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B53AB7EF7
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 09:38:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3280619F2;
	Thu, 15 May 2025 09:30:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3280619F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747294251;
	bh=0Tu7c/55MLpVHgNQHr6rjQgjyskQ0bSBrdifeMj848A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AfjaxIkN3BGDjv4Ox+/9RZZPb+2k6w73ep+nHZf9lRVlGAfRUTTEqF7wNQF7j4z/o
	 qT/MCYZqxz/6KpOonUpLi6WLw79k1oYhikC4P1nl9Qt0PYMFtyNw+zoh0vxFggd2BY
	 c2t/z1MmIxVavWvy0pZnTtapaF+dWiRa3lCVLRFY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BB27F8963C; Sun, 11 May 2025 16:32:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F02BF89670;
	Sun, 11 May 2025 16:32:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07A09F95BDB; Fri, 25 Apr 2025 10:07:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 39AFDF8DDD7
	for <alsa-devel@alsa-project.org>; Fri, 25 Apr 2025 10:07:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39AFDF8DDD7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=fairphone.com header.i=@fairphone.com
 header.a=rsa-sha256 header.s=fair header.b=w8TsO9zA
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-39129fc51f8so1505240f8f.0
        for <alsa-devel@alsa-project.org>;
 Fri, 25 Apr 2025 01:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745568455; x=1746173255;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E/5LsCgffLwJC40iP8PJSPd6pyxub1HE/XdBIbu8y+o=;
        b=w8TsO9zAiiR11CDzC/mqdbVEwI3RpmdLAHtOSSLlXdfMPTgaiTB5TElVBgrt8J0Dbt
         Qs0RlCLRWky9241ubxcrtemvvpjviZLncI1unw8ioGhkVqiu5QUw8PcPqBLyiDJiDU3O
         H8wbUVQah8OTg5sI5Hwb+pO+hLv2QFKM6438Kl85c+DHSKRT0sRU6lhU+4ZgnkY5O5kk
         N1sH/KNwD8g5h2qXpY+tNBDg+MT4KO9l7tLzSl0VObLGhAUPiw66sXDnoaKCGYbnYU27
         G3AwIDvrEg2qPJZp9mSr8ck5gRrjzQKGWE4wm9Pi3FKFhs9WjH14WbCvJSsR4SrScNsL
         +drw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745568455; x=1746173255;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E/5LsCgffLwJC40iP8PJSPd6pyxub1HE/XdBIbu8y+o=;
        b=TaNNeVQLxT0vOs80rDYwZoC1MO+V8B7AzkXumO6ne8gFOPtq3MvJ+u+dleojhlAztu
         AbYG5DaZvYux7kqL26gwJ9pNuPqjbKuIEJZd28Ar8UJg882G+/fJo4oQbm+I8dR7HbHD
         2MX99PaHBt9lTxDJ3AmTiYVmbjCLM0h5IA3BJW2n+KGFKgUJYn0x4UOaOKQCpjRUq45L
         eSipj13U5/+/x3tWowbBVyN8rhOUYnW1KKq4RJ0Cg8mjVM1+LvDCGeEosd/u5iMd8cQV
         fs2hHAWiME4EcurEQSU/t9C2QuBj6Jm+hnArQ80a+608K4bwVw5N/Rez22Ud7TkaR+fv
         BUSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpnI/fAbR7+c6Yw/OqvFBIoL596x3+TMy6MJBUL/1i9iJnuH0jltgb+sP7ETz7L/sJsC+JniPmu0ur@alsa-project.org
X-Gm-Message-State: AOJu0YxWsWpmSYLPz5bX0QhT/NQQ+TCPdbGfF1DIzgFx1e8XeSuGhpM7
	hgARrD649rvikCQpB8ug0G3C+CUsEkIgvgMZNqXn/am8bHDObBpwXtX/DOiE51E=
X-Gm-Gg: ASbGncs13EDkAa+GutJ4omc6X+vfbHNT5DOaaueAOuB2u3vWtBrIqykJRRKIjEhx0Zu
	vwoT4lp8+CQ01gfJHd2J27VvjiUnZt7wFZoXG9K8TSTP8GN3vc/eiYCGnFFjGZi6p5TCU2EsPfi
	VbmfBHgXHiGdBoq5go8yosIKaSc5B7iSs93+6ABYa0yBOF1BFCo7wBAOL2nBmqsgRhnljkicmuW
	cOw/9diWx8Lo0ndcg0GSs6dZNzDaTrtAbx/YKGse38TrigjaMNIgRqoe4aQpOVKVzcDlFqIirco
	JzGtWLij1JQnHT8CswBfH1ztWH7binN6C3CsteWG5aTBkUl++tGtmbWWQohvDwYLF6/gCbP3jms
	3rXiyCdtn9/tHaEwHrX4whPDgrjwanTIHU5Cx6u4SX+3Iw/U9ksSlPCGu
X-Google-Smtp-Source: 
 AGHT+IGnsZ1b2dFNba8xAUTuBj3bQrZzqkheFyeShJZeV/m9/iuVWWISzbszqwiJOzfRZPRZ+u6F+w==
X-Received: by 2002:a5d:5983:0:b0:39e:cbef:c071 with SMTP id
 ffacd0b85a97d-3a074e2f521mr936972f8f.22.1745568454883;
        Fri, 25 Apr 2025 01:07:34 -0700 (PDT)
Received: from [100.64.0.4]
 (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at.
 [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e461casm1593513f8f.74.2025.04.25.01.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:07:34 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 10:07:27 +0200
Subject: [PATCH v3 3/5] ASoC: qcom: sm8250: add DisplayPort Jack support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fp5-dp-sound-v3-3-7cb45180091b@fairphone.com>
References: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
In-Reply-To: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
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
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-MailFrom: luca.weiss@fairphone.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: UX5F25ZZBGEVJZSYXNQR5LM2LZ2A4SBU
X-Message-ID-Hash: UX5F25ZZBGEVJZSYXNQR5LM2LZ2A4SBU
X-Mailman-Approved-At: Sun, 11 May 2025 14:32:10 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UX5F25ZZBGEVJZSYXNQR5LM2LZ2A4SBU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add support for DisplayPort Jack events, so that user space can
configure the audio routing correctly.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/qcom/sm8250.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index e920b413b762c803cfcc4049f35deba828275478..a4bf6eff811ea3e2b005071cf3410e5a0410f5d8 100644
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

