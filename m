Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1714772EC94
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 22:11:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FEBDEAA;
	Tue, 13 Jun 2023 22:10:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FEBDEAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686687079;
	bh=tPpBsGOWtupN7fuSMxljkkRUN2YJMAGAQ5Y76U1VMao=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=lE0TzGHELANETFF85gSO0VAM6MIWwwKWtVm4UThFctg9t28//4w5UIRW8aN/jjeHH
	 ewnWHyNiCTmZ3lMW1LIuF2iTWwRpwnDwpby8fenWz7+mcJZ+L8zWUHQFFNGvuw2xRF
	 7sRQQSZV5lxKfImN2hv5EYfhSZI371SVIbW6vgQE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B4ADF80544; Tue, 13 Jun 2023 22:10:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9B9AF80132;
	Tue, 13 Jun 2023 22:10:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B830F80149; Tue, 13 Jun 2023 22:10:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3EA3DF800ED
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 22:10:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EA3DF800ED
Received: by mail-il1-f172.google.com with SMTP id
 e9e14a558f8ab-34051bd5b6aso4834885ab.1
        for <alsa-devel@alsa-project.org>;
 Tue, 13 Jun 2023 13:10:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686687014; x=1689279014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fNJF+JpqUK2LzFWyZXr4JUPL5v94vmK36QO13SvQR1s=;
        b=hd3EQqr/zVOly0meHWohzfRtTSsE1OxNWP0GtPgyVXRgmh3CrCEtRNXjfFV/MLVIkq
         HJDPaAccuaqOag2crmfA9bXg6cT2NnhTDfSy99s6z3qEvCBEj+XWzDl9R6RG49VWA3sK
         IXu1R+MA8koEOcU/9VaMZ6AQzr5ck6PgCZ7L8sZhnBUIoW0nAoxvYyWHoN/ORmQxl9bP
         0JN0Z/3CyqCMy+y3I5bF027KWg1boQKVoO5rAsl5jjD8FnzMlQzJhIO/n21p4x64+HmF
         i7rikWpNFoL+5dI4/IXBYJCcVJc2v9oo4zQcCAQdHOAZ6itdvIFNKqhH1LnvOl1bsU9P
         EweQ==
X-Gm-Message-State: AC+VfDxy9UKh786Hu8ayckJHeRjcfk1oKUA6bEPpej78a7WfH7jRKclZ
	kxqGtPiAS3eUHl6j/ho/IQ==
X-Google-Smtp-Source: 
 ACHHUZ4X3ORRu8CW/zCZ3uLQTOZ9V3VzYdxcKGNZp/bYlo7DSHB+vI05hHFlC7glBgPB+/+Zrs5/aQ==
X-Received: by 2002:a92:c686:0:b0:334:de38:d600 with SMTP id
 o6-20020a92c686000000b00334de38d600mr10113765ilg.3.1686687013783;
        Tue, 13 Jun 2023 13:10:13 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id
 s7-20020a92d907000000b003350c8ae201sm4029875iln.29.2023.06.13.13.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 13:10:13 -0700 (PDT)
Received: (nullmailer pid 2823122 invoked by uid 1000);
	Tue, 13 Jun 2023 20:10:11 -0000
From: Rob Herring <robh@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jai Luthra <j-luthra@ti.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: ti,tlv320aic3x: Add missing type for
 "gpio-reset"
Date: Tue, 13 Jun 2023 14:10:05 -0600
Message-Id: <20230613201006.2822985-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VQ3BVD2BFU6NXJR5DMWXXK3GU667PQOJ
X-Message-ID-Hash: VQ3BVD2BFU6NXJR5DMWXXK3GU667PQOJ
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VQ3BVD2BFU6NXJR5DMWXXK3GU667PQOJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

"gpio-reset" may be deprecated, but it still needs a type.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/sound/ti,tlv320aic3x.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/ti,tlv320aic3x.yaml b/Documentation/devicetree/bindings/sound/ti,tlv320aic3x.yaml
index e8ca9f3369f8..206f6d61e362 100644
--- a/Documentation/devicetree/bindings/sound/ti,tlv320aic3x.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,tlv320aic3x.yaml
@@ -61,6 +61,7 @@ properties:
       GPIO specification for the active low RESET input.
 
   gpio-reset:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
     maxItems: 1
     description:
       Deprecated, please use reset-gpios instead.
-- 
2.39.2

