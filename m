Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F20E26FDCC2
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 13:34:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B6A9108F;
	Wed, 10 May 2023 13:33:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B6A9108F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683718467;
	bh=cVsw7XeExQT3lGM1j2jmQ4RZYytUjk4IUtECG4L/gr4=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ic6OSKKYp+DSi0lBg/wuWNaFTMuR5SNL2x8h3axtmdoFHSZClBTkyQTWvL1Il4LST
	 AS0ioRdq56rEZ22853uLNAyShf5dfVhbU5N8T6ioH+q6DD+1yN2IaR7bknskAQpknS
	 tMawIyed4T8gqeQQg+9LY8WVGeVdVxLaLoAKP8Ow=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3D9EF80310;
	Wed, 10 May 2023 13:33:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1913DF8052E; Wed, 10 May 2023 13:24:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EC7ABF80310
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 13:24:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC7ABF80310
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=iYhqqeBj
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f42b984405so13656975e9.3
        for <alsa-devel@alsa-project.org>;
 Wed, 10 May 2023 04:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683717855; x=1686309855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tQz0nqDpJgVq4PjwkeydzjRKfpwtaxnYesaYZraUnVA=;
        b=iYhqqeBjM48QaMhRPEkYT2YU9xh0zNEersu8qnkpWo8LOKJaY3U5yQqANAxFm/q32w
         FMPRVVqJoISnC6aPbthNCZ2xdFiww+h/rIBGHZfUEopODddgDdHLxjCJmFAUt91aBTQz
         JrODj+00bSBsNoicc9lV8Dy2QwiPJehj74NO1isLhlafHaNxiCGHGToDXt7tJx3I019+
         Ztg2rXL5HL00WhdtU1PesRNpVDA13SUzlwzBRZtDrMYf18IZP3jW15u2rHJQqVnmF6Qq
         BB5n8Xx0MVZ06IhybmDycGLq8GT69u1nkiQGXUiUgBdV9HM2RSVX0o/siMijRnpchDzA
         pWDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683717855; x=1686309855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tQz0nqDpJgVq4PjwkeydzjRKfpwtaxnYesaYZraUnVA=;
        b=Ox0J2ts65nEe1mqDQGo4moZ6nUMS+snzeoMMKHXbTmPtzjtbaQ82k3hHWGJNPXXXCD
         YisDuAXnnIqjq+uybePoSGXCRrDye4aPv3GVdhqg9v3pezPGDCBSQQaRKMn2RfFVL1wp
         FT5UDAg+UR8LaZGvhO2+DksoY6NGaVPAlbHSxs/YqsQu7xKu72FLmIroqAkI4qNycP1R
         kzLa6x2YQDsrYSbvlxwGm09k8Uqi90beKCaJvR/OzNdrB1XNaUXZoGOHyZ4Xgt6LjDJD
         N+HK7Gg5/Rg/rA+/pIlSvTiLiHE1SWvNdAGGYNjEShlCEQJGNSUB45iqpc29ENi9sIMQ
         PVTg==
X-Gm-Message-State: AC+VfDyJhvbeD2duBpn6nY7Z5DrRgYQIyhpJPtwvuccgQYPLOOq45MEL
	OMcKQCRJpC9peF0YjxxUzb8=
X-Google-Smtp-Source: 
 ACHHUZ4TgiXNcni0p3xfh64OwhXDfR+Wd1HCOLbq3FCl8U1mNPBP52Jlnoi7sT3v6T7q/sv7EfLcTA==
X-Received: by 2002:a05:600c:21ca:b0:3f4:2c46:e74f with SMTP id
 x10-20020a05600c21ca00b003f42c46e74fmr3686113wmj.12.1683717855239;
        Wed, 10 May 2023 04:24:15 -0700 (PDT)
Received: from localhost ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id
 n23-20020a1c7217000000b003f4ad703aecsm1262417wmc.15.2023.05.10.04.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 04:24:14 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Subject: [PATCH v1 2/3] dt-bindings: vendor-prefixes: Add ESS Technology
 vendor prefix
Date: Wed, 10 May 2023 12:23:48 +0100
Message-Id: <20230510112349.939991-2-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20230510112349.939991-1-aidanmacdonald.0x0@gmail.com>
References: <20230510112349.939991-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6OXVMTI6FFWXPRVB4ST5IDVMGDLA7BYY
X-Message-ID-Hash: 6OXVMTI6FFWXPRVB4ST5IDVMGDLA7BYY
X-MailFrom: aidanmacdonald.0x0@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.com, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6OXVMTI6FFWXPRVB4ST5IDVMGDLA7BYY/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add prefix "ess" for ESS Technology <https://www.esstech.com>.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 82d39ab0231b..95c42e32e02e 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -438,6 +438,8 @@ patternProperties:
     description: Seiko Epson Corp.
   "^esp,.*":
     description: Espressif Systems Co. Ltd.
+  "^ess,.*":
+    description: ESS Technology, Inc.
   "^est,.*":
     description: ESTeem Wireless Modems
   "^ettus,.*":
-- 
2.39.2

