Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA99AB7F8E
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 10:02:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD5EC6220B;
	Thu, 15 May 2025 09:50:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD5EC6220B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747295437;
	bh=b8O4l3RSvg0fy+NWpm7X0oPQjhPePwQH1mA0z4k72Qw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F53c25kPlreZ6OnjbmeuDtb2KpnWwHqAfA4paesspbSzFC7X8tnqCVd7G92TU6zqc
	 rHSKvyIIBGvi4uZ29+MEjrnTVlNzPJD2xiDjthUe6CyK+dydm6R2zetNGOmM0LrevY
	 k2awVpFoWzj202pYiCYVtt0dmVxB37pP/iLOZYgM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC7EAF896DE; Sun, 11 May 2025 16:32:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C7E86F896E2;
	Sun, 11 May 2025 16:32:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99AB1F95BDC; Fri, 25 Apr 2025 10:07:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7E849F8E231
	for <alsa-devel@alsa-project.org>; Fri, 25 Apr 2025 10:07:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E849F8E231
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=fairphone.com header.i=@fairphone.com
 header.a=rsa-sha256 header.s=fair header.b=X22froPd
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4394a823036so18059625e9.0
        for <alsa-devel@alsa-project.org>;
 Fri, 25 Apr 2025 01:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745568456; x=1746173256;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WC8RFGmD1RHEB436RAA/xlbqbziPuzDw03yfjSeC4YY=;
        b=X22froPd5pG1olvCAsBXiQSWs9/ZNzUba076R+yTJtvEGA0YSxmgn32f0LDGWe0ZSM
         Wk5xfK+PIeYw8EvXFoUIJNW2Za+01zUkKoofCRv+DPSIV8AV+aIL7qidSUfgWbpukVaM
         W2SYSEMXp1WQ+pVzrizWP1YPLnLq5f2xezMyQ+idmKVLKvrTnnszv7bPtQMqtyiEre8o
         S70JAbiDjuDcc6V8tGQRBOGmtF23gLfZfo9p/fhvGvkAvAdFRXi0bZYhau8tMOS1voBq
         U0FUchgn1s9S2Uxoyt0iKGPTzsMIu4Xnb0aok2Lx+GhkFyQ7hz0RlFzm9WrKKeIYeyxr
         bMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745568456; x=1746173256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WC8RFGmD1RHEB436RAA/xlbqbziPuzDw03yfjSeC4YY=;
        b=RIth+65gARdf84xi7DPQTJ0ueFH1Qzzi3mZO2Fy7lTyomPUiLlIxMGXp9oFSIcK2xW
         uFJzO4o/A77NC6Q3w3jiAwL2EbuCzRNgrGRtmS/hlJs+aAC7Rbdxl26KxSCa6+Ml5t4m
         FptP47z8rkYn/AKZsybKPYEQ3f9QE12nsGzxv4LrN14BSYULbVKz3rwesCL/i5MCUjbr
         pXT/9KeUftpeIjF87zX7or7p95ZNjoqeL81lyctvbH8D0oCN2T5oPY2kXqdH9rRkGwyJ
         S/5G9PYEJRTlncipduE/LnE7usxalowsglt48j8xte3WBAWQ0IWIjJQ659js+02g/qCm
         6U5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUx1t6iVt369hbvuuSRCEg09LvwzTA3au7UCYuCFSTwka7qBR8y0zrK4KwVOAr1Ao/JQ6NgTZBWokw7@alsa-project.org
X-Gm-Message-State: AOJu0YxoDDa1A5JMBrKkh2GR/HQAwyQO0erofNFRztI6DcZZpbbyBAhw
	zWL0u2rd+Nk1wYGZxfj2OhiA+x8zTlOvXU4teVVgelw9dUbi3kIHvCsFzPLgFPk=
X-Gm-Gg: ASbGncsNHpP9hbREcjnJn8jVYXAJoyPj7Cgu1bZCH3d7aGrmEw6amr+XOhkf0kI+/8v
	0t2BRy4r8n8HaRQ7bfHcyrLdu3Viq1Tqpa+ytbIOfQD9oZxJi+RfWMWirqqycdgrLT8MFpRb0Z6
	C84wPl5mdOLDeH/60ogka6fH8aaNWUwMIDWpNAkAjFw1ifU/jsvTqxGTxrtNyUc55cEdIlC16hv
	anAvsyWkFk4x8kyWWA82931MsO/a75O1KaEoD2x1FKy6PY63UMcjp5jMV2+2/wWWNjh3FFCz8Kp
	Zkjxkv+PyFqh5l1IB57qHAs1nbbW0uPTVqvqX2Fs1MKX6eVVssth6HRngINucxFfULUgKEemcq9
	CWxVTLQ5M3/Q/9FBbiMpwrs921WdaSS9rbIBYaVU2wJadSj5vtUBGc2ED
X-Google-Smtp-Source: 
 AGHT+IHnGU5E9kdTmOEv3J8nz+wIEIG5a+AbZeoA5daYiMBxcw7FiKXP7Z+blV7YWaSaCVLY5aXfcg==
X-Received: by 2002:a05:600c:4e88:b0:43d:fa:1f9a with SMTP id
 5b1f17b1804b1-440a66ab7femr10627065e9.30.1745568456199;
        Fri, 25 Apr 2025 01:07:36 -0700 (PDT)
Received: from [100.64.0.4]
 (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at.
 [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e461casm1593513f8f.74.2025.04.25.01.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:07:35 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 10:07:28 +0200
Subject: [PATCH v3 4/5] ASoC: qcom: sm8250: Add Fairphone 5 soundcard
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fp5-dp-sound-v3-4-7cb45180091b@fairphone.com>
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
Message-ID-Hash: LHGCVCLIKQ2OV7AWAJSIIOHVMANS64R2
X-Message-ID-Hash: LHGCVCLIKQ2OV7AWAJSIIOHVMANS64R2
X-Mailman-Approved-At: Sun, 11 May 2025 14:32:10 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LHGCVCLIKQ2OV7AWAJSIIOHVMANS64R2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a compatible for the QCM6490-based Fairphone 5 which can use this
machine driver.

As a note, QCM6490 RB3 board is using audioreach architecture while
Fairphone 5 uses pre-audioreach.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/qcom/sm8250.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index a4bf6eff811ea3e2b005071cf3410e5a0410f5d8..43c93e24d77259f232062c7e4182a39151111c59 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -208,6 +208,7 @@ static int sm8250_platform_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id snd_sm8250_dt_match[] = {
+	{ .compatible = "fairphone,fp5-sndcard", .data = "qcm6490" },
 	{ .compatible = "qcom,qrb4210-rb2-sndcard", .data = "sm8250" },
 	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },
 	{ .compatible = "qcom,sm8250-sndcard", .data = "sm8250" },

-- 
2.49.0

