Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 686E2952A65
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2024 10:26:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 882662BD0;
	Thu, 15 Aug 2024 10:26:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 882662BD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723710387;
	bh=iQCCZNb15xA7YzIyMpV93MbfBBT7xhwt8+pmmQPh75s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LPWTEiXAq89I0uJCt2cj4JdLNjFMzrhhTU4pHfJ7GLpgUc7JSkuDE6e1uAvFGGbb+
	 uwo3F47z32ZxCVhPqJ3xfaTvqa+Km3ymIrzj+fevcOZ50Q3BT8tpSB6XAhZae/XjZV
	 eA6nD/C7N8XtHxh8buhL++QnyeQ18sRNdiLgA56g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8562DF806FA; Thu, 15 Aug 2024 10:23:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0ECE0F80709;
	Thu, 15 Aug 2024 10:23:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BC1AF80448; Fri,  9 Aug 2024 10:34:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CE262F8023A
	for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2024 10:34:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE262F8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=fairphone.com header.i=@fairphone.com
 header.a=rsa-sha256 header.s=fair header.b=vBran/mx
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5a1c49632deso1954216a12.2
        for <alsa-devel@alsa-project.org>;
 Fri, 09 Aug 2024 01:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1723192453; x=1723797253;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pM2zQn5p3FDpIYaXA2RbE1R8wZYvgZjYLsbkdX740GY=;
        b=vBran/mxoZdJUZjb8DIE+B+rhZNBzjap0CWr+fH2Jfzd6dkW44Q3nLImHm8HAbNjky
         0Awfq2go2zIKfH893370RN2syF5v7CAtp5nsvCd14oqSo4XYiBO7LUWwxPkMFHxMbT7p
         XJqmgWQJPuavh+NxfGSADw5uN4X+0dS+hc5M2S5ApLzz5cgR0cHTEiELn4FpFx/jycM8
         0+NWN+tyDigK/seCmCM5Hb3t62Pk2LixV8nZLnyGGPjL99MtT9/BwPFn+46S3GdeNe9d
         fQ4zUxGgVRV32h1HKpxgLNGTNLPfLTJwISK2Hwfgu8UYkriqbbtekayhW+QLkyGSzMV2
         YhIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723192453; x=1723797253;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pM2zQn5p3FDpIYaXA2RbE1R8wZYvgZjYLsbkdX740GY=;
        b=eSyV0pAW7Bb1vciKu95168LFixF4bKbs/KXxTwhxdiYl7n4SzHYUbj9c31ihJjSwkg
         XjAL2+QAfBnIMUMBZn9gTBU6GMenbBRZUM5EhenUds7opRXuZsmr4KF7QgE2CMwNT5vW
         IlHcSBv1OgBOmE9S//1oeY62Hahz9NupZZYU812j5Atx9sAbng3xEUgsxkrIyw20p2Sm
         FmEYAusX3acYJx73IE74D879mWRnlEKMbwlHDuCXzzQZBb05pjnKvS69IdE4kGYaGVQs
         OHSVp1XdxDhsRu+5g6cRfgZaqfJLNgR6lxhdEOQOkDPph+Rp+V0Wgbys5JSXdsU2sHNR
         HeVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWb5DszXK41JPfR3Tg0q+KvfFEFPFD4DVFKWVOZpTYMxOufMsAw6ucmpJYucEFSjhL4lZi+P3xXY1+d@alsa-project.org
X-Gm-Message-State: AOJu0YzAP2v8GLJf/Chwjfn6k6n77UgjQ55TqEqgkC6m33HGLBuN3WLz
	edcyZh8P7a2yaN/8rC4uvBDQHKYcsgalyxGgXrzr1/H/NiC8kzMugJ+Zy3dzUZfCYZWqP7xQX7V
	D
X-Google-Smtp-Source: 
 AGHT+IFCpnNxr3OIcmfuo39c+nNlT21/T85VjYH0R0lGnoZyeMzkVNE10LVLArSs5TAUEYYxuW88qw==
X-Received: by 2002:a05:6402:3548:b0:5a3:b64:3b98 with SMTP id
 4fb4d7f45d1cf-5bd0a5a5d44mr558924a12.19.1723192453020;
        Fri, 09 Aug 2024 01:34:13 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl.
 [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bbb2c41916sm1336288a12.41.2024.08.09.01.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 01:34:12 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 09 Aug 2024 10:33:58 +0200
Subject: [PATCH 2/3] ASoC: qcom: sc8280xp: Add support for generic QCM6490
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240809-fp5-dp-sound-v1-2-d7ba2c24f6b9@fairphone.com>
References: <20240809-fp5-dp-sound-v1-0-d7ba2c24f6b9@fairphone.com>
In-Reply-To: <20240809-fp5-dp-sound-v1-0-d7ba2c24f6b9@fairphone.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
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
X-Mailer: b4 0.14.1
X-MailFrom: luca.weiss@fairphone.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: NJ2CEXXAVQEGIONJJ5IZ6UETIOYIDD7V
X-Message-ID-Hash: NJ2CEXXAVQEGIONJJ5IZ6UETIOYIDD7V
X-Mailman-Approved-At: Thu, 15 Aug 2024 08:23:16 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NJ2CEXXAVQEGIONJJ5IZ6UETIOYIDD7V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add compatibles for sound card on Qualcomm QCM6490 boards, e.g.
Fairphone 5 smartphone.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/qcom/sc8280xp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 922ecada1cd8..385e902944b3 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -185,6 +185,7 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
 
 static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{.compatible = "qcom,qcm6490-idp-sndcard", "qcm6490"},
+	{.compatible = "qcom,qcm6490-sndcard", "qcm6490"},
 	{.compatible = "qcom,qcs6490-rb3gen2-sndcard", "qcs6490"},
 	{.compatible = "qcom,sc8280xp-sndcard", "sc8280xp"},
 	{.compatible = "qcom,sm8450-sndcard", "sm8450"},

-- 
2.46.0

