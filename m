Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F9B6E2FF6
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Apr 2023 11:11:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA1E2A4E;
	Sat, 15 Apr 2023 11:10:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA1E2A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681549868;
	bh=cTPBEXxh/HiBnq0kzwtYZ8D9auqPitsgf2xFwU4eK28=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=TUEGhpAG1OC3csA5XvK2g+ii7VXR+xj0NI3WfT41pBHya1F0r0yMhqPhsUyR0aPDp
	 rOrYQmLLYDeY/qMaylZjwcAo+7NTwfF7OPgUJnHSO3PK1sZCSt5y2mOsvb/AlOEwCf
	 H35R7fp6UqH8to3ToS2L/gO9kICPik4fXlchTkws=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E4A0F8052D;
	Sat, 15 Apr 2023 11:09:27 +0200 (CEST)
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 3/9] dt-bindings: ASoC: Add chv3-audio
Date: Fri, 14 Apr 2023 16:01:57 +0200
In-Reply-To: <20230414140203.707729-1-pan@semihalf.com>
References: <20230414140203.707729-1-pan@semihalf.com>
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Approved-At: Sat, 15 Apr 2023 09:08:57 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OEKUASNSSGB7OVKCH2DKC5WIZPYABUSK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168154976667.26.16680054607697595873@mailman-core.alsa-project.org>
From: =?utf-8?q?Pawe=C5=82_Anikiel_via_Alsa-devel?=
 <alsa-devel@alsa-project.org>
Reply-To: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Cc: tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dinguyen@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 upstream@semihalf.com, =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71D7DF80529; Fri, 14 Apr 2023 16:02:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6F83FF8032B
	for <alsa-devel@alsa-project.org>; Fri, 14 Apr 2023 16:02:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F83FF8032B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=semihalf.com header.i=@semihalf.com header.a=rsa-sha256
 header.s=google header.b=Qi8J8nvW
Received: by mail-lj1-x232.google.com with SMTP id a10so2279951ljr.5
        for <alsa-devel@alsa-project.org>;
 Fri, 14 Apr 2023 07:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google; t=1681480966; x=1684072966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pAsx/vtlSONsGJaMiUuvZrWP17NNhM0s9aopfUG3YMs=;
        b=Qi8J8nvWCtFhQJhd2UX1NuWmfKbSuxCdjqjnDbhKFiBYPv3xo/hUC6Do2yDnUCewAT
         tl4VOteQPr1vA9ehtzJx9//7fZlv2nySr+BsyVTmcwpIEX1nKSDMlvaAlyUlYHXNsEpx
         gRf0Q7SM1nyAeFaDsOuPiresr4FTfzZwyOvBn6qzJEFghHmpmtp+Uap2CZHpoeicqPFC
         TlO8OVPwTjnp/FJTOYL+dZPoyeFIcpk/Gn0o5iSNzBJScOAyrh8sVcPPbEZrjuWTThOR
         QJ0AsZSe1L+lXynCjQG2TIcE/AElygHP+mila0NJdBrRzO7TCSkxv+fOFSljBz39gnOD
         M3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681480966; x=1684072966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pAsx/vtlSONsGJaMiUuvZrWP17NNhM0s9aopfUG3YMs=;
        b=TYTF2mkwNihucUWgmZW/9sF+fm2+zm6pGGKt48l4RCtECufNULDk4KzE7cdN3e5dlK
         9FMc1Eg79ADiklzNGU6xG7tulhHvPt8XpQ+7UBpFbBhRoTlXgFZbGI8SoKQOIF+6xcYi
         P9FJ9NI9upUx9CmiIFUtf9XYGxTEvzDDOYJziXIPlfFMRHC8UTFRuPMhgHMn9qH/9L3z
         +qYEpZfDO5WiAMFSfKczhie1KtoS6redzJntkema8DZiktig0U+STD0yTd+7ilyExrxf
         ZV+lAuQQPksncoCbLAa1AJLvKbbDxD1X1b52ZDbBCScMGQkLqpWHipAw4TeuFqvl8A0O
         Eeng==
X-Gm-Message-State: AAQBX9cxs5SyluppbTWXyfak3/V7SO3dthBUGA/lvFCK/vxCGwKci/9i
	XgYDrDqF6/5cReOsmYxmiDdEtviAX+mifXt9Dm5hPA==
X-Google-Smtp-Source: 
 AKy350Z+QDZGlS7XF9A1X0316HTp53Mi+Jrm8uEaFMhPQvNowT32YfQLUfNynbysrYJBu0ehToQ6JA==
X-Received: by 2002:a2e:9d84:0:b0:295:d7a8:559b with SMTP id
 c4-20020a2e9d84000000b00295d7a8559bmr1714528ljj.10.1681480965408;
        Fri, 14 Apr 2023 07:02:45 -0700 (PDT)
Received: from panikiel.roam.corp.google.com
 (staticline-31-182-201-26.toya.net.pl. [31.182.201.26])
        by smtp.gmail.com with ESMTPSA id
 15-20020a2eb2cf000000b002a76e2dedbcsm828684ljz.139.2023.04.14.07.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 07:02:45 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 3/9] dt-bindings: ASoC: Add chv3-audio
Date: Fri, 14 Apr 2023 16:01:57 +0200
Message-ID: <20230414140203.707729-4-pan@semihalf.com>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
In-Reply-To: <20230414140203.707729-1-pan@semihalf.com>
References: <20230414140203.707729-1-pan@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: pan@semihalf.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: OEKUASNSSGB7OVKCH2DKC5WIZPYABUSK
X-Message-ID-Hash: OEKUASNSSGB7OVKCH2DKC5WIZPYABUSK
X-Mailman-Approved-At: Sat, 15 Apr 2023 09:08:57 +0000
CC: tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dinguyen@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 upstream@semihalf.com, =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OEKUASNSSGB7OVKCH2DKC5WIZPYABUSK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add binding for chv3-audio device.

Signed-off-by: Paweł Anikiel <pan@semihalf.com>
---
 .../bindings/sound/google,chv3-audio.yaml     | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/google,chv3-audio.yaml

diff --git a/Documentation/devicetree/bindings/sound/google,chv3-audio.yaml b/Documentation/devicetree/bindings/sound/google,chv3-audio.yaml
new file mode 100644
index 000000000000..8b602b60eaee
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/google,chv3-audio.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/google,chv3-audio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Chameleon v3 audio
+
+maintainers:
+  - Paweł Anikiel <pan@semihalf.com>
+
+properties:
+  compatible:
+    const: google,chv3-audio
+
+  google,audio-cpu0:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of controller #0
+
+  google,audio-codec0:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of codec #0
+
+  google,audio-cpu1:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of controller #1
+
+  google,audio-codec1:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of codec #1
+
+required:
+  - compatible
+  - google,audio-cpu0:
+  - google,audio-codec0:
+  - google,audio-cpu1:
+  - google,audio-codec1:
+
+additionalProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "google,chv3-audio";
+        google,audio-cpu0 = <&i2s1>;
+        google,audio-codec0 = <&ssm2603>;
+        google,audio-cpu1 = <&i2s0>;
+        google,audio-codec1 = <&it68051>;
+    };
-- 
2.40.0.634.g4ca3ef3211-goog

