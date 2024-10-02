Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3C1995160
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2024 16:21:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13AFA83B;
	Tue,  8 Oct 2024 16:21:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13AFA83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728397318;
	bh=h+nCwsYfs5sYx3LuwElbokrzjS36O6h6OKiN8mmmqqo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J7Sxx/h8r+6nE0Xu3GBbbjf63X7LzFCURwdeFoLQ2XPAf+KlYqdl7q9IDIGDWlW5Q
	 hCiMqZTdZitmNqaclJNOKUUg+l0/TyVLdbxLXNSlV3tq/KnA2VzxWQSPWRe+0Iqkq5
	 vh6m7xVHxNNgWiqZwuy0aJnpIb/5zpWsN2EODzfU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 715F6F80616; Tue,  8 Oct 2024 16:20:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B2853F8061A;
	Tue,  8 Oct 2024 16:20:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20834F8057A; Wed,  2 Oct 2024 04:20:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5AB3EF8001E
	for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2024 04:20:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AB3EF8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=yJ2frU3s
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5c42f406e29so8514157a12.2
        for <alsa-devel@alsa-project.org>;
 Tue, 01 Oct 2024 19:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727835622; x=1728440422;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n9xIAfbz7fjBNidtmDjZcASh4YKSIa46CQvlQ26gYQA=;
        b=yJ2frU3shbOCLOxvXqZpIcdpd2tasfSRDCGmc8Zv7mZZ+Dre81RpQhgN4XZyLkLBKc
         c40TEtfa1z8uW3dgAc4/EwIM/YTJgStyUPBf77I6MRYltwPpRWtgWVGCqTqk7B39rS8W
         rllUrT/PwvaAsQkyCZxKgHSkNvLdw1Qx4ADPdb2vfg042rVNnZ4ZmnUnL8w7HPHxgRuO
         6HJ4c2d3fYW6GLIp5hphauEgccsj/htMdx71ovU7LxAf7dBNrPbKN4ijv5kK2aNWkx8h
         PO4Aey/srggjMPqxCjgjwEnt3dZ9fo/+HvAZWetqJ68wg5RR/PVb8tpc5IBOUbFAamie
         z66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727835622; x=1728440422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n9xIAfbz7fjBNidtmDjZcASh4YKSIa46CQvlQ26gYQA=;
        b=PUBjrbGiKA5LTfd4uwOMQJA4we0GDZ3Ap/Eqn9hNrKRr1uP1yaBXz8xb3+qRH6dHEg
         qefNnYwgjfO0+tqL0iZbqWm9/RWRIsxti8hYnVHO/9ojJe2FVjEcIFaEurn70hhXUOBl
         lv/ebGL/IY138IGlbA4ADnFUBUoVvKjM9PhCDCTR5tORHEkR/65JPB7n6Ze8di3qD/Fm
         4U73UyIeLjYNYsaTmUzzdgzelgh2YbltXKACCHgtmr6SVe3A29Qsjbjkv4Cygcy7QV+2
         b4Phm98w5GqssOgwCKcnzmPbmWTPrlaf6DKFhcSeBBg+WgUjTqglTw4QVIw4dGYKwoft
         8mNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0Cr7CUvXRpYbJlBQBoGq96WekmgeKht0FlRENvqVxgKpc0k0rbDtf3osDesXH2j77JU8F/GG84U0m@alsa-project.org
X-Gm-Message-State: AOJu0Yw+yzetKPrDLjuCLrJApuxMx7NmFotHTXX0l38aI3EG7cp2i3FM
	WwQ768wjQuHha3G4dAw3J56+xkqZtsb5io2no1yBcq3FltoGzS0Ekb7N38wdZxo=
X-Google-Smtp-Source: 
 AGHT+IFLmq+2mwLJhF5wcOOkF3bdVL/ltt9sQiXECke/uv9VIlvSNZdfCfyEy1s8dICY8l0J/ILy0A==
X-Received: by 2002:a17:907:268c:b0:a86:82e2:8c6d with SMTP id
 a640c23a62f3a-a98f839d3ccmr130606766b.62.1727835622420;
        Tue, 01 Oct 2024 19:20:22 -0700 (PDT)
Received: from localhost.localdomain ([2.125.184.148])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2945f2esm787518866b.117.2024.10.01.19.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 19:20:21 -0700 (PDT)
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
Subject: [PATCH v2 2/7] ASoC: qcom: sm8250: add qrb4210-rb2-sndcard compatible
 string
Date: Wed,  2 Oct 2024 03:20:10 +0100
Message-ID: <20241002022015.867031-3-alexey.klimov@linaro.org>
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
Message-ID-Hash: 62C5PGWGNFLDIRU3LTNNAEJMABPYWYRN
X-Message-ID-Hash: 62C5PGWGNFLDIRU3LTNNAEJMABPYWYRN
X-Mailman-Approved-At: Tue, 08 Oct 2024 14:20:35 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/62C5PGWGNFLDIRU3LTNNAEJMABPYWYRN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add "qcom,qrb4210-rb2-sndcard" to the list of recognizable
devices.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 sound/soc/qcom/sm8250.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 274bab28209a..19adadedc88a 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -174,6 +174,7 @@ static int sm8250_platform_probe(struct platform_device *pdev)
 
 static const struct of_device_id snd_sm8250_dt_match[] = {
 	{.compatible = "qcom,sm8250-sndcard"},
+	{.compatible = "qcom,qrb4210-rb2-sndcard"},
 	{.compatible = "qcom,qrb5165-rb5-sndcard"},
 	{}
 };
-- 
2.45.2

