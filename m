Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BF56E2FF7
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Apr 2023 11:11:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C356DDEE;
	Sat, 15 Apr 2023 11:10:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C356DDEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681549890;
	bh=dPzhvhNtmpuYL2INdwllZ+OCLuQwF1O2dJxS5UbZZmU=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=Jz9kSLDL68/C8rVnK6jtBZkSbKxuRJpOra5JCz1Ahu4Udk0LbVZnjZuQZ43rvyakw
	 Es4FTgzwPuyY9rgOxdZL3Caz/TBQMeR6NkewzCHcHhOWYd6jXkdCd+Zetafo86iHd/
	 Zbbvl2Ss2K8h0/1xGtayHcTYrMwW/kBpExFQPgPY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EEDFEF8053B;
	Sat, 15 Apr 2023 11:09:28 +0200 (CEST)
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 2/9] dt-bindings: ASoC: Add chv3-i2s
Date: Fri, 14 Apr 2023 16:01:56 +0200
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UI3BICKRKMFU32OCMGUXI6ZJDBJZJJBP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168154976821.26.18418440357031944166@mailman-core.alsa-project.org>
From: =?utf-8?q?Pawe=C5=82_Anikiel_via_Alsa-devel?=
 <alsa-devel@alsa-project.org>
Reply-To: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Cc: tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dinguyen@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 upstream@semihalf.com, =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03D42F804F2; Fri, 14 Apr 2023 16:02:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5EB7CF80149
	for <alsa-devel@alsa-project.org>; Fri, 14 Apr 2023 16:02:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EB7CF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=semihalf.com header.i=@semihalf.com header.a=rsa-sha256
 header.s=google header.b=HYr1AJD9
Received: by mail-lj1-x22f.google.com with SMTP id z38so2822991ljq.12
        for <alsa-devel@alsa-project.org>;
 Fri, 14 Apr 2023 07:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google; t=1681480964; x=1684072964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WLixTRfjgENcovszATtGl8QPdC0Pd1weyqx+S/unz9w=;
        b=HYr1AJD9m6oRzthxD0R3069MK8VuvZvtWAoQpZlxrFyHMJ4nU/c5FyZKYeOig8uMSj
         uGFMmqbadrconO75X6ztpe44p+Ku6G7jL5DmcgyZ1hq12rZFhpZ6hyVtTplNqNBCzJWu
         XfOR18dwtShwQIar93V5opgVMYaHKJAAYppuruB8+KyzpQPzzM4N+zat0BH2h1IsLCmq
         UMYJwaoRl7kYzee5Fphzl71rnWPD6vbafkgCvs4E0mDq4T8ySmSLUpqwL0LRET4UdM4B
         z/7G1KR9DON5ir3hrOMhn9Sal2JyF3iatNVjX0jZFvvZVnEuhX3iMEH7k8m2fup6CVSj
         mgiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681480964; x=1684072964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WLixTRfjgENcovszATtGl8QPdC0Pd1weyqx+S/unz9w=;
        b=hZ7Gbs6/voLojPAOryF6PHMc4UiS1o18YmfKes58KJhhSOm7Ab5IPrBO9D5lJYYcRP
         pPSKUcPXi36NW/cmzPpb42Sfd96QfGprwlCbdXJF6gvx/XdaLI0UT+otPidyZSblB6xZ
         b803OKWOpw40kjQtlZHVaBDGJ9CSbKAfFFFZnZhn1KqPBy+7sO0aJ8Bkjwk45aFxpJPe
         ayME6ua88pC3Sap17mJHhsgFHSUop67qn7A9N1KxzhtoRTpp5GAHalsjtnraMRiywHwI
         DYPmICEr+9d7luz0Bedj8hmYeiUgq3Ktc056ZJE8gkPPVaDbGsWLnauILY2fZdv9o80r
         ICaQ==
X-Gm-Message-State: AAQBX9ftzMZBFib9hhIwVHhiQ/Erl2mfsSJJUx843jLTyVxRlkkNro1d
	NZvAkCKyailSF55LUO0jsZeq3WqFzQEfv734DzG5KA==
X-Google-Smtp-Source: 
 AKy350ZYVGEPLLxfVYu+/HWW1CWF15hmWbDiIZLuRfjxN0aQCDsV6QACgfOZTdQ+VsxwMQxddFYJ+A==
X-Received: by 2002:a05:651c:d5:b0:2a7:6f60:34f2 with SMTP id
 21-20020a05651c00d500b002a76f6034f2mr2103167ljr.33.1681480964321;
        Fri, 14 Apr 2023 07:02:44 -0700 (PDT)
Received: from panikiel.roam.corp.google.com
 (staticline-31-182-201-26.toya.net.pl. [31.182.201.26])
        by smtp.gmail.com with ESMTPSA id
 15-20020a2eb2cf000000b002a76e2dedbcsm828684ljz.139.2023.04.14.07.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 07:02:44 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 2/9] dt-bindings: ASoC: Add chv3-i2s
Date: Fri, 14 Apr 2023 16:01:56 +0200
Message-ID: <20230414140203.707729-3-pan@semihalf.com>
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
Message-ID-Hash: UI3BICKRKMFU32OCMGUXI6ZJDBJZJJBP
X-Message-ID-Hash: UI3BICKRKMFU32OCMGUXI6ZJDBJZJJBP
X-Mailman-Approved-At: Sat, 15 Apr 2023 09:08:57 +0000
CC: tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dinguyen@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 upstream@semihalf.com, =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UI3BICKRKMFU32OCMGUXI6ZJDBJZJJBP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add binding for chv3-i2s device.

Signed-off-by: Paweł Anikiel <pan@semihalf.com>
---
 .../bindings/sound/google,chv3-i2s.yaml       | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/google,chv3-i2s.yaml

diff --git a/Documentation/devicetree/bindings/sound/google,chv3-i2s.yaml b/Documentation/devicetree/bindings/sound/google,chv3-i2s.yaml
new file mode 100644
index 000000000000..6f49cf059ac5
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/google,chv3-i2s.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/google,chv3-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Chameleon v3 I2S device
+
+maintainers:
+  - Paweł Anikiel <pan@semihalf.com>
+
+description: |
+  I2S device for the Google Chameleon v3. The device handles both RX
+  and TX using a producer/consumer ring buffer design.
+
+properties:
+  compatible:
+    const: google,chv3-i2s
+  reg:
+    items:
+      - description: core registers
+      - description: irq registers
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2s0: i2s@c0060300 {
+        compatible = "google,chv3-i2s";
+        reg = <0xc0060300 0x100>,
+              <0xc0060f00 0x10>;
+        interrupts = <0 20 IRQ_TYPE_LEVEL_HIGH>;
+    };
-- 
2.40.0.634.g4ca3ef3211-goog

