Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF60AB7ED5
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 09:30:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2EDA604F4;
	Thu, 15 May 2025 09:24:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2EDA604F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747293857;
	bh=uXV98Zrpl4il+ECjXyEhMPhF7ON9sgsXksffGaRdVHA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fplSGlpQDm7Egb50U9dewdWlzBZ6/FBPbI+GUE4kQQdjeG2yJDl+/60lGbzxP7/Ni
	 0qHU3QQN5h+9eY2eM1WFun1Qu73P6amefrjTwcYepTVgA/RF8k+J45q6tCuDjJRyAr
	 JWwADq/wQrLp06ue1kOHThasbdQRRAIu8uHzo6PQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90CFDF89900; Sun, 11 May 2025 16:33:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E649F898F9;
	Sun, 11 May 2025 16:33:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D95CBF8A026; Wed,  7 May 2025 10:02:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3AECCF89E2A
	for <alsa-devel@alsa-project.org>; Wed,  7 May 2025 10:02:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AECCF89E2A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=fairphone.com header.i=@fairphone.com
 header.a=rsa-sha256 header.s=fair header.b=J0WSL4N8
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5e5e8274a74so10096761a12.1
        for <alsa-devel@alsa-project.org>;
 Wed, 07 May 2025 01:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1746604928; x=1747209728;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JdSfmOpjUf+n+Gt/wFek20I3+645i1PcH5llUxC+XYk=;
        b=J0WSL4N83WxkRd14dlIz6ypL+R/GyvMxQv/rlIO64vFNx3xwQTIwv0XFvG9qvHdy3f
         o/EMU41KDjaj0QuU/BGzOGHN+8h+mvky7rkGENkIAkJJt2lcPcxlasu7/kdxTBA6zK3J
         QYxxzkXZbrjtTPOoiZ/PN4Dq9JmYe21dyrX0fGP90mGj7OToXSesSZxhzdE3aeP45IZ1
         Udn7Set4RjYyz5c7G6sd4joSFmzKIxLEBUBkjxm98mDqhydIKQ3JwUG20ZUkObLeUsn/
         iCEWFs0a0jrXrOsbvf2HUcVU/sEySHrLDwDwDGVwwYkuG9V/BX+2KRcys9n3w0lL9qXx
         AexQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746604928; x=1747209728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JdSfmOpjUf+n+Gt/wFek20I3+645i1PcH5llUxC+XYk=;
        b=ZECTG15kGzHDDLMJwHCZBuod7CZ0jpmLejHNvXPNBeFqb3ZmE+L+jwGB2ZWqq1wDRa
         zQurTJgpbnFwRkLXRxLrcCZsF8YKYYW/oZqE6pn3XRONohFOU5aMzz/ypOMDwPQsvdWE
         tj6+CZ7d6X2niIzgZCfRzzRJe9AkoJaOoMXRhd1z9ceDI/dXfAJcZdccO86MTsDKzfvs
         Yiqn5JCfd2BCvqC8hUpNN2OTMRX7MwyVTvceTJmlJi5+5idnzln3nCh53BnCSUAVOMWk
         OHizs1mZW7RR27Ps6fnKj4RnM4givq5ZJiN63uWdWveCTBXQfpOcvW6juDYlHIfZCtZk
         5hoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrta/nUqwyilx5xwKnolvw1bOu8vwLaVB6tW4+n/Gkw3E/wRS18mlAfOtUjbWEhjb117ImWACBsyRk@alsa-project.org
X-Gm-Message-State: AOJu0Yx1q7/bAksSk3VNHSLk3m3FiBee/JxJGQGOJiede7vUcBFdv9ze
	VoE/+g66JiwCvjXTwYYNgR4kwLnPHWZ98qHZMjEx3URHj6jrnTdm6IuD7CjVpso=
X-Gm-Gg: ASbGncuD8tFxsbsRgyNwmiV7WHQdHyI87AKqkmrvywTZlMZUKn3G3XaHh3WMNtHfD+c
	l1W1S6cuavlgfRMemfnkh+/mE1ONOc1FrKyHlegwgDafXk4nVKuFjM8NjzLzaVq7jZ/z/SiA2+7
	/m2Dp8CUfvngHed0o5STbmKlp7qTJKSxGSYvkuSvwB7funoOBVbdEL9jwL8RtZI3XWJqQQu2gTf
	MvlXxTtb/tESdRITCpQBD4DKEx3aBpKFQjJKisP1K/csXjfgu13QHvXKYPoxptD/OqkBOL9r62R
	CBv17H7hCsf/hwl4UZWU/1qgnbZ9001tM9jq8Ip+xnhpo70qJpW+v57Da/kN17BxO/u40i8U0wA
	h0rPXwHUtXOE+yQ==
X-Google-Smtp-Source: 
 AGHT+IGAPRmQLx7xnwBq815f2zYCjZM2sBf1I1fFBdjt+vGkM/lX/FAon8S0MIUZj4B3CeheWCktWg==
X-Received: by 2002:a17:907:6e94:b0:acb:5f9a:7303 with SMTP id
 a640c23a62f3a-ad1e8c93689mr249348866b.35.1746604928202;
        Wed, 07 May 2025 01:02:08 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl.
 [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1894c0310sm855236066b.88.2025.05.07.01.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 01:02:07 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 07 May 2025 10:01:40 +0200
Subject: [PATCH v4 4/5] ASoC: qcom: sm8250: Add Fairphone 5 soundcard
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-fp5-dp-sound-v4-4-4098e918a29e@fairphone.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-MailFrom: luca.weiss@fairphone.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 7NLM4EJKKMO2AB2TOONBLHGJEVSYRT4B
X-Message-ID-Hash: 7NLM4EJKKMO2AB2TOONBLHGJEVSYRT4B
X-Mailman-Approved-At: Sun, 11 May 2025 14:33:41 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7NLM4EJKKMO2AB2TOONBLHGJEVSYRT4B/>
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
index 2317fe285ee7d41689d7fac453164fbe706744ff..69c514fad0b1babafae4b61bb5ac944c6b4906dd 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -208,6 +208,7 @@ static int sm8250_platform_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id snd_sm8250_dt_match[] = {
+	{ .compatible = "fairphone,fp5-sndcard", .data = "qcm6490" },
 	{ .compatible = "qcom,qrb4210-rb2-sndcard", .data = "sm4250" },
 	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },
 	{ .compatible = "qcom,sm8250-sndcard", .data = "sm8250" },

-- 
2.49.0

