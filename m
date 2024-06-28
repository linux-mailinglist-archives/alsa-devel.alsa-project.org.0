Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A9F91DF6F
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:36:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCD032C1A;
	Mon,  1 Jul 2024 14:36:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCD032C1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719837389;
	bh=qJXIxi00JGv1u1BKGWLBWZ9NoQ0XPM5g1tXOS5qbSFs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cG+iYQfwr67FESV3t9ZA5W2CfrAnGY8Dxn3ZF51Q85pOQWpnrDIWI0qQ/WlJ/PjJq
	 jPBzoJW1FJYYlM8HL8L57rgGtLzRIruU2QrjNSiHKTIth8oy8Ck6iI1pLRGe9S/So8
	 p/ycCK6EoqCsWkO+0bmqezsgt+TLMKs9Pp+m8y4s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C04AF808C6; Mon,  1 Jul 2024 14:23:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DC55F89AC9;
	Mon,  1 Jul 2024 14:23:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08CC1F80578; Fri, 28 Jun 2024 03:07:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 758CEF800E4
	for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2024 03:07:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 758CEF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=xxZMa6C5
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-367339bd00aso24972f8f.3
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 18:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719536838; x=1720141638;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QHuNYRVa9MaRtF3OqiAH8vWk9W7tt+JmVEYKJVNFQi0=;
        b=xxZMa6C59IT4dsLGXxhAIa1JEWKichSSFSYkfAwwrgB2vKTE1G9nbrDioYg4MeQ1rE
         dcHdj586ONmIEZpUqn6DqraDhuTVnOG5dpMiKgnmU0jhz/HSQtZnUxBW5wxZI3/vP3Va
         Y+9XZX9vPFS0KPJRsTY4D/11YGb2KPpPtadVkcjwIm5sm4ke+SU8zpw9vo5EsVJazAXW
         V/q1XEnXENMwX6PXeaI1WQDgr+VZtGHgK0ntIyOq5OBPgeL29Ki6bankM7i6GL+vEf/t
         0RYIqBSWgcWOQUJRy1tJStM/FuX9LfQEfapSV61xzWZXZHlibuIOTdnm7qukyTvh+3lV
         otiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719536838; x=1720141638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QHuNYRVa9MaRtF3OqiAH8vWk9W7tt+JmVEYKJVNFQi0=;
        b=I5cxUEwES7DYr67eOuhsCQnGYY5/ovpxYpU4tQ9YEdAWMNxtdTw4CaEOywg2xu2j7a
         RsR/vF53ILbRAlFHa+tqJ/lnQKlgVBYq9denaYveLCzQ9QjVARnQvyn9KT6yt8XiRRWn
         D5mqH98euSO+pIrMboKBTRQJTRECrsj79bBu2+6DoAVxfoMqGl3iZZVPgonkTsT3880X
         KZeElTNv8EA36YYkBx3qHHiwnRjNHwj46t3hHq6vlzaInSTvKylLW2JnU00ip9vrvteW
         EfSqJ4VaZqfp2gUOedU3uGZBGGJLiS65PPs8nm1HtYuEFDG9tj9PgjNsdP6FWWamX+G1
         FIkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlhgUxq8osySfcBma5DVsVodzJkd+GsmaaQih+HOqfrfepdT1TM2h0sKRzMf3xWgYiu2QiAf5Lu+F3djdN+coV5uER12yKilL/qw0=
X-Gm-Message-State: AOJu0YzJvmkqko3Ym+XaJvBQbiqucaXG9N/az8Lt+PNnZ47Y3RiUsQpd
	WaUPfaLLjZmvoCKStW7rGDBRTf0xuj8n3D0iXzFeesH2m0o13KRhKLwcW9vx6x8=
X-Google-Smtp-Source: 
 AGHT+IF3udj+skoJjmirIovH98gez1HrbmQEfLVlULNbdY3lNe98fjyToQ/tPdf9UZvUlx/d+JRROw==
X-Received: by 2002:a5d:44c8:0:b0:362:4dc7:dc7b with SMTP id
 ffacd0b85a97d-366e965298amr9542604f8f.58.1719536837965;
        Thu, 27 Jun 2024 18:07:17 -0700 (PDT)
Received: from fuerta.Home ([2a02:c7c:7213:c700:2cd1:b0e8:abb:540])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af3c27dsm13075805e9.7.2024.06.27.18.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 18:07:17 -0700 (PDT)
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
	alexey.klimov@linaro.org
Subject: [PATCH 1/7] ASoC: dt-bindings: qcom,sm8250: add qrb4210-rb2-sndcard
Date: Fri, 28 Jun 2024 02:07:09 +0100
Message-ID: <20240628010715.438471-2-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240628010715.438471-1-alexey.klimov@linaro.org>
References: <20240628010715.438471-1-alexey.klimov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: alexey.klimov@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: NJGDHFIKWRMB22RDZSQFZKNI5NK6LKFM
X-Message-ID-Hash: NJGDHFIKWRMB22RDZSQFZKNI5NK6LKFM
X-Mailman-Approved-At: Mon, 01 Jul 2024 12:23:18 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NJGDHFIKWRMB22RDZSQFZKNI5NK6LKFM/>
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
index b2e15ebbd1bc..a92ac8501138 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -31,6 +31,7 @@ properties:
           - qcom,msm8916-qdsp6-sndcard
           - qcom,qcm6490-idp-sndcard
           - qcom,qcs6490-rb3gen2-sndcard
+          - qcom,qrb4210-rb2-sndcard
           - qcom,qrb5165-rb5-sndcard
           - qcom,sc7180-qdsp6-sndcard
           - qcom,sc8280xp-sndcard
-- 
2.45.2

