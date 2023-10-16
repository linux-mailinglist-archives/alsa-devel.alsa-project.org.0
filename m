Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9377CAE62
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Oct 2023 17:57:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87BD482A;
	Mon, 16 Oct 2023 17:56:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87BD482A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697471835;
	bh=rS8ttdH7WqPKsAyAEVXCiG6sxU6x573DMftc10WCQzw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Bd/yAsREZb//YZ0F/kG8oJAE+hT64vWktvzZMrKk0JKjDy7J2lyrvyeD5apLpert2
	 UXAWIUOK7Lp0tVZzPaTRBjZre0jrQE2HVerzHM3EHisnzwv07SniPFmatO+fAN3qyb
	 tJ5f2HBQ7aEmASgUmO/GTZMRf92HBX3X09n5kx6g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E467F80552; Mon, 16 Oct 2023 17:56:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9805DF8024E;
	Mon, 16 Oct 2023 17:56:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24934F8025F; Mon, 16 Oct 2023 17:56:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 56681F8019B
	for <alsa-devel@alsa-project.org>; Mon, 16 Oct 2023 17:55:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56681F8019B
Received: by mail-ot1-f49.google.com with SMTP id
 46e09a7af769-6c646b5028dso3169008a34.3
        for <alsa-devel@alsa-project.org>;
 Mon, 16 Oct 2023 08:55:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697471753; x=1698076553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bYqTlxzJpgPZHi0SFQeGZeZ+UqJkgDA/Fe8BpwAySnI=;
        b=H6oRt2uJbxBdyVFpIcilf3AoakbxZRQ1nrwmi0IE6c9rus/GrViOVDiMUZ9nNstkRZ
         B0r72K+uXk3eK8O4qO6JBDtn4vnZcuYxoDyBczojyInPfJXXavahQRS75eoMbU8A+EQZ
         d23aALL91I72NJXirmVyZFP7X5gkRB4SajjLDhrh+bS4yukv9UPKriBva7/c4ZaA5GYA
         BlcAuptwTTlLyqZQzceT6lu+YJCsgHHRKfEnvw8EuJz6qK+9l5x/l4dBWFX2gfwltcvy
         aKXYHBL4fLuZ1Kg87Y8twEbxBTtsHlizIbgK3/ZabhfWmZzcQGqDhdNHWCT4VwGIGjhI
         NGdA==
X-Gm-Message-State: AOJu0YzKCLY/1pfAb0Fmx3aS2Dc418Vtn/JM+M2cpnLQp5d++n4EbKyX
	ut/gMgDIo7rGeEc8ACyUjg==
X-Google-Smtp-Source: 
 AGHT+IEYO0DVPg5dp2+bVEWXMrPE9XhLRSLjbH9Y4SXF1r+s0lXGRz4Tf3jf1v0cAjqE7L7uP7K+Gw==
X-Received: by 2002:a9d:74d9:0:b0:6b8:7eef:a236 with SMTP id
 a25-20020a9d74d9000000b006b87eefa236mr36034676otl.30.1697471753539;
        Mon, 16 Oct 2023 08:55:53 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 q6-20020a9d4b06000000b006b89dafb721sm1726248otf.78.2023.10.16.08.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 08:55:52 -0700 (PDT)
Received: (nullmailer pid 2973998 invoked by uid 1000);
	Mon, 16 Oct 2023 15:55:51 -0000
From: Rob Herring <robh@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Daniel Beer <daniel.beer@igorinstitute.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: tas5805m: Disallow undefined properties
Date: Mon, 16 Oct 2023 10:55:47 -0500
Message-ID: <20231016155547.2973853-1-robh@kernel.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XH55A4I4H3IORJDRNPMSQ2U3BJ2W6Z3K
X-Message-ID-Hash: XH55A4I4H3IORJDRNPMSQ2U3BJ2W6Z3K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XH55A4I4H3IORJDRNPMSQ2U3BJ2W6Z3K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Device specific bindings should not allow undefined properties. This is
accomplished in json-schema with 'additionalProperties: false'.

Examples should be last in the schema, so move additionalProperties up
while we're here.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/sound/tas5805m.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/tas5805m.yaml b/Documentation/devicetree/bindings/sound/tas5805m.yaml
index 63edf52f061c..12c41974274e 100644
--- a/Documentation/devicetree/bindings/sound/tas5805m.yaml
+++ b/Documentation/devicetree/bindings/sound/tas5805m.yaml
@@ -37,6 +37,8 @@ properties:
       generated from TI's PPC3 tool.
     $ref: /schemas/types.yaml#/definitions/string
 
+additionalProperties: false
+
 examples:
   - |
     i2c {
@@ -52,5 +54,4 @@ examples:
                 ti,dsp-config-name = "mono_pbtl_48khz";
         };
     };
-
-additionalProperties: true
+...
-- 
2.42.0

