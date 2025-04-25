Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA32AB7F29
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 09:48:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62050608E3;
	Thu, 15 May 2025 09:27:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62050608E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747294066;
	bh=t2UqwPYP1B9XN/iC4TKLlBIAancDyLL4wrE626PGHow=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q/XBkKABf9b6acCcXx5j4HZlDDMjO2D0rHOh2PuQ7+IlHAC/fQVJ0a2m5hauARqTH
	 XtP7AKK22Z4jiDaPYCGIYSyBG2PxK3bIlXJBTqX0fAacrj+OPzYrjZSE4K4N37rXYJ
	 bxVzM4movxPZZHBYzhCY1Wx5uwulqe82KEXYbaeM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D601F89619; Sun, 11 May 2025 16:32:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7993F80C81;
	Sun, 11 May 2025 16:32:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6144F95BD7; Fri, 25 Apr 2025 10:07:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E3298F8DDD7
	for <alsa-devel@alsa-project.org>; Fri, 25 Apr 2025 10:07:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3298F8DDD7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=fairphone.com header.i=@fairphone.com
 header.a=rsa-sha256 header.s=fair header.b=Sm9FsHps
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-39149bccb69so1716476f8f.2
        for <alsa-devel@alsa-project.org>;
 Fri, 25 Apr 2025 01:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745568454; x=1746173254;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mF78VVS1a3vgPm4/yr7suBZclt6DuZ16jbZS8capHhc=;
        b=Sm9FsHps495M4ZhPSV7yVok01oZgChEWfZTTeGprNOnRDYvcJ3vsK1Bu0+9rh1nmlq
         14L4uNDSryFd98zpAPYfMEls+zh+vzC3QCqLJt4OOc+PLU6W9lcpJiPQb6g5W05nuYCa
         rbYsad0sqwliAEOn+UPbPp9yt88/bugXUT8euus73NGX5Jyv2yoSb4v0C6EqB/X+BpRC
         3kXkEOcSTuhw1KuoIVRvgpH3m3m5EYlHB4LrfKrgoSytmOofD8/4r3Xm+BzLhvr5KYiq
         MzIisdxKKhYAnLVK30AmZkScWSrMoX/ykGc0myNkygitIKcWONBnb1OUnBA71mdVLPf4
         3Hnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745568454; x=1746173254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mF78VVS1a3vgPm4/yr7suBZclt6DuZ16jbZS8capHhc=;
        b=g6EJHfXiHQJUINVE6etHscTxEn91GGSOJw3Ta7EipXc/RPKkGI/KDdEIGIvHMRnDQ4
         iohKKL3T7DnwZm+hN/2XmmzXssJ8ZKlhWfBr4QsLGv/8qOnL7A9he/Rjv0SOkfOKKI4Y
         ullgpr7EOTAUF7/0xBIEKGtZKzSSGlJTswU+DqV9oE1KttqEn379Uj9KEX/qNCwChc1c
         pzFvob0tZxI4EPGddMeMAgN52Uv77I9MvkrVC1uFRTPfF24M+1pitFbXU4kg4SpDQNgX
         C6r1ZAQIG2RXzsvrp1O+3LYrpRGo8slrLcsLmaAL1i9VXr5Qikg/lURUUyD/sqNQqQwM
         lyqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKLy1MjXsEgNud71Y3PNTwuywiLjetmEDCfZ+NkrjGv7uEVKuh1M+/7ad3iQ5QQiRFyDA4HIMYOwC7@alsa-project.org
X-Gm-Message-State: AOJu0YzbdDyWwpVIeKVdDJNJ8hZmJm+aaSkEOdaW04V76PX4yPoDseVW
	esyZ1SS6a65KJfAXJumF/TfYpEslYCmUZWLpopXe+lYZfuRYcdxxKZtRxl+3rlI=
X-Gm-Gg: ASbGnct6BqKy3UE69bBUx0wUFG4lrpf0fNN5qdZEInXSqARMoy3oh3Tak/iwQgLXFcA
	hZ2vlIYtwUfYTeevryCyS2AS9XGeIIfwVnDoWembx4lK8ok88RrWLeKc4M7BrHNl4N705iYn4cT
	TqA1u/E7ZhIA3vZuooAfC8GiSvBBErZEaYgcBMBfqJhzfphpqHp8Gssr33sDl6QeVSZHf6+pPqn
	kvQpgnQVb+640jCVznOISIVAMLpNohqUNTXOvgTaFCsJbL+SfGwz5xffRSK4VTIZ/eJX9zbtazC
	+mnAficM2w0fghy8WybiKq47ahw2y4909WpdnDlhGn+FCw/Gn2kUCzHYIRBveLV4Up+ApT2LX1F
	nMyLuLUfzx05ww6bHgofnvzbthJMlB6du4VBBeKAyD03kLlpI2QTphrTZ
X-Google-Smtp-Source: 
 AGHT+IFVDfaMfuOXmMfOCltuXID8xfqxstRaUVHZiIEzVJ71LDPZOd47+6G3giv9YW3kXwRnEPBUTA==
X-Received: by 2002:a05:6000:1848:b0:39c:30c9:815 with SMTP id
 ffacd0b85a97d-3a074e1e7b5mr964843f8f.21.1745568453788;
        Fri, 25 Apr 2025 01:07:33 -0700 (PDT)
Received: from [100.64.0.4]
 (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at.
 [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e461casm1593513f8f.74.2025.04.25.01.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:07:33 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 10:07:26 +0200
Subject: [PATCH v3 2/5] ASoC: qcom: sm8250: set card driver name from match
 data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fp5-dp-sound-v3-2-7cb45180091b@fairphone.com>
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
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-MailFrom: luca.weiss@fairphone.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: FWSPZZAO5CICKVOPRLUGLIUECZ7NU5YH
X-Message-ID-Hash: FWSPZZAO5CICKVOPRLUGLIUECZ7NU5YH
X-Mailman-Approved-At: Sun, 11 May 2025 14:32:10 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FWSPZZAO5CICKVOPRLUGLIUECZ7NU5YH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Sound machine drivers for Qualcomm SoCs can be reused across multiple
SoCs. But user space ALSA UCM files depend on the card driver name which
should be set per board/SoC.

Allow such customization by using driver match data as sound card driver
name.

Also while we're already touching these lines, sort the compatibles
alphabetically.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/qcom/sm8250.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index b70b2a5031dfbf69024666f8a1049c263efcde0a..e920b413b762c803cfcc4049f35deba828275478 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -16,7 +16,6 @@
 #include "usb_offload_utils.h"
 #include "sdw.h"
 
-#define DRIVER_NAME		"sm8250"
 #define MI2S_BCLK_RATE		1536000
 
 struct sm8250_snd_data {
@@ -200,15 +199,15 @@ static int sm8250_platform_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	card->driver_name = DRIVER_NAME;
+	card->driver_name = of_device_get_match_data(dev);
 	sm8250_add_be_ops(card);
 	return devm_snd_soc_register_card(dev, card);
 }
 
 static const struct of_device_id snd_sm8250_dt_match[] = {
-	{.compatible = "qcom,sm8250-sndcard"},
-	{.compatible = "qcom,qrb4210-rb2-sndcard"},
-	{.compatible = "qcom,qrb5165-rb5-sndcard"},
+	{ .compatible = "qcom,qrb4210-rb2-sndcard", .data = "sm8250" },
+	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },
+	{ .compatible = "qcom,sm8250-sndcard", .data = "sm8250" },
 	{}
 };
 

-- 
2.49.0

