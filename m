Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA89799515F
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2024 16:21:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07AA5AE8;
	Tue,  8 Oct 2024 16:21:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07AA5AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728397306;
	bh=/4OzswiX65Sc0g0+jbX5ZOydAN10emdJ5kCChBhnLgc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NyxQJFgzDbIDejXEYiKVCVtx5Zbm2VnhEZsmqahZGelIzBGJQ+6C3hNHj93EdTnmE
	 H8KqDhpkHsh3wrTQM0oRs6rMa7SomzrdbuYMtHqgqE5d8JrOBuRwkMN3cd9NfTTg//
	 16ohcLo4ocLgCrybJyqsaR2Vsy0L5Ts1lFkNxk/k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FB62F805F6; Tue,  8 Oct 2024 16:20:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 24E99F805F5;
	Tue,  8 Oct 2024 16:20:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BAA6EF80517; Wed,  2 Oct 2024 04:20:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F18CDF80104
	for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2024 04:20:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F18CDF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=kimSBLao
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a7a843bef98so893328466b.2
        for <alsa-devel@alsa-project.org>;
 Tue, 01 Oct 2024 19:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727835621; x=1728440421;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qULz6qGLbMOUjMR5vVv1AH2Pj+Ui9tcw2zEInfPNef0=;
        b=kimSBLaoQl7gVdBVrGZc8fGEASyij2M35n63AEBQKs7yc81L5kr6ukBquIRkTpml20
         blFbkPsICDW0XitlT/fEmz5L5JRmv3XMhMhPBy2FoIJ8euouYqmAacvM+vC/uPUDakwt
         HkYAnBDF420n9UR/JIUWigdnmc7IkWmJigZuq6KrAwfdmGjtpzhUtyYvSTpUS9FfmwYa
         qStGP0Ahm7GEEKIK9ve/FmxbQpsm+3zQO7AQl+x3/y4Lryw15lRnQiLyD+ks0OOCRGpY
         loEGLmrzGXkAKd/H7Q5vsqhybfMWS8ZJgq1vz1AxgQvjPtoQlQpYhii99dILZuWGrRi4
         9A7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727835621; x=1728440421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qULz6qGLbMOUjMR5vVv1AH2Pj+Ui9tcw2zEInfPNef0=;
        b=pZAH7FdTYpDSHNBkKniwKnrmkSuqDMR3QdB1t1/OQ0TwJNzugVnC6InKiPslKmZMxP
         tkjf2pBZGMLChXeeUwKgLkz/Tfmn1w5C1T45WF96gERO8JJ/Qnnxi84god44ncZqJmkH
         jdphFPdNISr64AAOVXc0rqtt2JDQOLuF90EUeepdjZUg9m9TjWe8/Avxwmef2leMMBHr
         RvYZdSACbiplrVrKWhZ6YgGeceSulNf9NVoyTKHaPU7Aslr2MFP58tmV8rbe/aMgdHlS
         bc1FW+oxVWFSwiLA5tWO2NvZiBskrphI0UTCGHQvd22hj/oE+oqZc91ugjyp1tFeXj+Z
         j6Ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCUt/RhMJzqJVk1MAPZDkB7X/gp7B0ucH7aRu61dfwgD42vA4nUoFFTfqeecBenAWOp8uuNUeR8pWSDB@alsa-project.org
X-Gm-Message-State: AOJu0YxLPxjkL5ImyYUwGB1C7OsGnSeKaui7Kx3T07Yui9VPBcLeOiFa
	/gc7vPCtwo2xkxXTD1QEtXuAcrnA5NZfQP10+eS+fmTn0qlO9XPpt83hhWP9Bys=
X-Google-Smtp-Source: 
 AGHT+IGE1xKkXbjGlYr68N6L4QY5x/jSLWNeq4c/fQ8oGKGTVtK4Gvl9c5GnBJX1hBRWwC0HCq1myA==
X-Received: by 2002:a17:907:25cb:b0:a8d:2e3a:5303 with SMTP id
 a640c23a62f3a-a98f8295ed5mr139129766b.39.1727835620710;
        Tue, 01 Oct 2024 19:20:20 -0700 (PDT)
Received: from localhost.localdomain ([2.125.184.148])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2945f2esm787518866b.117.2024.10.01.19.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 19:20:19 -0700 (PDT)
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
Subject: [PATCH v2 1/7] ASoC: dt-bindings: qcom,sm8250: add
 qrb4210-rb2-sndcard
Date: Wed,  2 Oct 2024 03:20:09 +0100
Message-ID: <20241002022015.867031-2-alexey.klimov@linaro.org>
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
Message-ID-Hash: JXAAPKHLMLIFYUB3XDQNBTQGUEQBEJRV
X-Message-ID-Hash: JXAAPKHLMLIFYUB3XDQNBTQGUEQBEJRV
X-Mailman-Approved-At: Tue, 08 Oct 2024 14:20:35 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JXAAPKHLMLIFYUB3XDQNBTQGUEQBEJRV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add adsp-backed soundcard compatible for QRB4210 RB2 platform,
which as of now looks fully compatible with SM8250.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 1d3acdc0c733..2e2e01493a5f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -30,6 +30,7 @@ properties:
           - qcom,apq8096-sndcard
           - qcom,qcm6490-idp-sndcard
           - qcom,qcs6490-rb3gen2-sndcard
+          - qcom,qrb4210-rb2-sndcard
           - qcom,qrb5165-rb5-sndcard
           - qcom,sc7180-qdsp6-sndcard
           - qcom,sc8280xp-sndcard
-- 
2.45.2

