Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F4E6BE311
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Mar 2023 09:22:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA159F84;
	Fri, 17 Mar 2023 09:21:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA159F84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679041362;
	bh=jZryJ1YI5kbs41t4hcbdRpRMdGaqjboZjBTwoVH5iYk=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=T636Dk9ro+F8Kom39CAnJWnvQHEBBwGDHUw0Yq/ht7/ok8u+7tMK9cXhI30UN8OP4
	 sJTM0R+6HNh0Lh+ZWhIRwKSMCN1CPUZIHT4ZOiqI71mrmPzafSKZ1RhJ15YXrFAcgL
	 06uJrC0k8EjnQkRhSFkaRn/d8nbGOtQcfeIE647A=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6244BF80423;
	Fri, 17 Mar 2023 09:21:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7209FF80425; Fri, 17 Mar 2023 09:21:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6B5E3F8032D
	for <alsa-devel@alsa-project.org>; Fri, 17 Mar 2023 09:21:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B5E3F8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=JeiNuyIo
Received: by mail-ed1-x52c.google.com with SMTP id eg48so17149351edb.13
        for <alsa-devel@alsa-project.org>;
 Fri, 17 Mar 2023 01:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679041302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ttgr06Px/QEUxP0oNoIFTGB9mYSSeRv48aMtVkoD6UQ=;
        b=JeiNuyIoP+dpZMvhNpzBeFhkEA0+Z6EAwmxKMjoUTZKi4GodVFvRz8oGGWiaNPS9Bz
         HeJ352TsFytsuVoSmb6/0ExhsUgPg5KA3JLb2HHN9QicvxrXF1Jmm3pI812ykcyIaqGq
         dV6xN7QbyFPMvlJtq4QBQCV5ztDsT78IKGyM8gDB8YM9YA9NZ2lu+sDlR1ACtPhq06Mb
         Aylrqt4gyM7FuHaehEwJIBJiAY28ZZBUJt+1ta64EcN0ADMPeCj9fN+tDLm0UrNiY5Rr
         BDQx4h1UAuwM4Pq7HGp5tRbH2WYP14MUAKCr5Hq7xriZswI3W1e0bTJz8w13owjPl/So
         M2lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679041302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ttgr06Px/QEUxP0oNoIFTGB9mYSSeRv48aMtVkoD6UQ=;
        b=TdbWiwoZiS7yD7LqlELjqHCTYltHWLRA3UyqwH1gEP/cp8Xz/vAXjkswpAo0tcL67B
         Gpf03Cp5k2K+3uq58u0543vuo03JfDXvPVqyywmieLURsEmPMYyitJLihPM/bhJFv39A
         eyHXCF5OG6FrYXViZjBKMRpWyBUIISUFl8Qq5cTtjpkgX9bTl91KEyhQBGk7Wwvuab2J
         xqf0V2ac7fJJ5+l6X0IyN5lRYxztl6Z3g2I/M+DdUnAUmr109LtYhVqvjEHUXoigQtph
         Jk54l9Dga5X67SME5DK11Fe8kowGDtFb9NsvUethJt6Ek2W9cXxPVbNjP1JXLq8izkom
         gTkQ==
X-Gm-Message-State: AO0yUKWBtITDmBzrIugOiCBZ3zED19/xgQr2/radNqu/R9vuR63moIP+
	CAaP8VX79QR/p9WEX3XFx60eRQ==
X-Google-Smtp-Source: 
 AK7set8h1D4JPdlcDv4x/a3XajXnmoWknZq2UQGEUaV9yQdTNCy0+V1oVHB44c04RBWBDgnfuDbOKw==
X-Received: by 2002:a17:907:6d09:b0:931:de76:c2e8 with SMTP id
 sa9-20020a1709076d0900b00931de76c2e8mr2016427ejc.9.1679041302511;
        Fri, 17 Mar 2023 01:21:42 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:848a:1971:93e0:b465])
        by smtp.gmail.com with ESMTPSA id
 e5-20020a170906314500b009236ae669ecsm673882eje.191.2023.03.17.01.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 01:21:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: renesas: rsnd: correct comments syntax
Date: Fri, 17 Mar 2023 09:21:37 +0100
Message-Id: <20230317082137.12629-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: F7BVYOGSUBRCR6LZNJCVEHBQ5RWOBUHY
X-Message-ID-Hash: F7BVYOGSUBRCR6LZNJCVEHBQ5RWOBUHY
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F7BVYOGSUBRCR6LZNJCVEHBQ5RWOBUHY/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

yamllint expect space after '#' comment mark:

  renesas,rsnd.yaml:282:4: [error] missing starting space in comment (comments)

Fixes: 7f8b5b24bbb4 ("ASoC: dt-bindings: renesas,rsnd.yaml: add R-Car Gen4 support")
Reported-by: Rafał Miłecki <zajec5@gmail.com>
Link: https://lore.kernel.org/all/b2810924-169d-0bad-8f20-6ec2e683d170@gmail.com/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/renesas,rsnd.yaml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index 676dfe7a7f17..68a93b290433 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -279,9 +279,9 @@ required:
 allOf:
   - $ref: dai-common.yaml#
 
-  #--------------------
+  # --------------------
   # reg/reg-names
-  #--------------------
+  # --------------------
   # for Gen1
   - if:
       properties:
@@ -336,9 +336,9 @@ allOf:
               - ssi
               - sdmc
 
-  #--------------------
+  # --------------------
   # clock-names
-  #--------------------
+  # --------------------
   - if:
       properties:
         compatible:
-- 
2.34.1

