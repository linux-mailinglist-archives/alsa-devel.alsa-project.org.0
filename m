Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FB3263C1E
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Sep 2020 06:36:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C938165D;
	Thu, 10 Sep 2020 06:35:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C938165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599712580;
	bh=s+Ea/4mCH5oMphDfDYac4q++AKBUESnx/stbdSPLDPI=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h1BmRz0sUXQnFKwap7xsgjIco/P3WogXs+buaLgUHDj1RWKV5qcip+sxt1Np4RMzj
	 5XYxBaZt0MZ9UKHXJI8Q3T1F+u67T4oYGs0iIQsoL3cNM1/s3cSzh7p30MK5i5CC/A
	 CUVd2IcT7RKljPFxNy/YBIXKmp2wIbVXKHS82/as=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE40FF800D0;
	Thu, 10 Sep 2020 06:34:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80062F8028C; Thu, 10 Sep 2020 06:33:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2964AF801F2
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 06:33:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2964AF801F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="THImz+ev"
Received: by mail-qk1-x74a.google.com with SMTP id u23so2753620qku.17
 for <alsa-devel@alsa-project.org>; Wed, 09 Sep 2020 21:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=kepGzz19JH800nsZ5Euti5avIzl4EmHZn4FGf0VjD0I=;
 b=THImz+evU69aiW7lVozK8lfXVEvqb5rS2iTkM4mQlTFfk26rIIMHdBcCSQRS/7jGaW
 mArPRYtTu0VhgV4LSMGWBaF+TQEkuXN347EB9qNhdYe8GGXl9IpDPSFJ1ano9zth5Dr8
 VWKB11yKbl03rzckK4Zxr7+CktyHThy4pJBWhIsH5n6t3eX1kenolJiPjeO/SX6gGTHC
 iHPxG0NASw8DpM0Wtzb9i38TQ4escQQOmBfSCBnq3HCUS9IunUGgUi86nMrYwH+TMvo4
 yiWjMw8/a+K02vWh7TmS90UgS2I+OqOWF0qM0ot15+lK6j4dBObB6nHlogHwxXl505MN
 xk5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=kepGzz19JH800nsZ5Euti5avIzl4EmHZn4FGf0VjD0I=;
 b=FeOY33jmtcsYUaIbqRh5JcnyIwy5tpPZDy1wU13HwXm6g8YpF0ftd7iWe9HsYvCKuU
 QF1kNAwhrYpRICmRbHLKd7kM3Tvy08e1xWT7eQrT8+IvVsdalbvqsRKN5WtUgtWwG66b
 AzzQw6gi0JkyhqKcqK+SMs15pIORLjYNfflOF0wrtH2cNTfVh1OikGVx3e7V08RS6F7X
 x0252skhJitmEdA7pcMh9lJ1uC1OpI9EF2Bzsq+gmmqSWWDm0d5VjMe/b107aDLvkOl+
 LVL6GBK2Vz9PVyvK3HoyLR8sVfYfZqDcMcbDnbvW1z8ebWou+DYx0FakM0xS5Dapc/SG
 w5GQ==
X-Gm-Message-State: AOAM532kAcW29DZPorSM6SoG3KbOlV/Bj3fhsYIIMrrmGh1+OvGgdA2o
 /XKLFXODSk48zQ7n/VloyR3PKscGum+a
X-Google-Smtp-Source: ABdhPJxKSj/lsjg9wQDLeS2GUfIq9++14VvrNo44AJdg/0uAWewWnroPPltEH4kuL72hmdxf2My0ln8ARLb1
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a05:6214:14a3:: with SMTP id
 bo3mr7207877qvb.8.1599712427993; Wed, 09 Sep 2020 21:33:47 -0700 (PDT)
Date: Thu, 10 Sep 2020 12:33:31 +0800
In-Reply-To: <20200910043331.3808223-1-tzungbi@google.com>
Message-Id: <20200910043331.3808223-3-tzungbi@google.com>
Mime-Version: 1.0
References: <20200910043331.3808223-1-tzungbi@google.com>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
Subject: [PATCH RESEND 2/2] ASoC: dt-bindings: rt1015p: add document
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: jack.yu@realtek.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, tzungbi@google.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Adds DT binding document for rt1015p.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../bindings/sound/realtek,rt1015p.yaml       | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt1015p.yaml

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt1015p.yaml b/Documentation/devicetree/bindings/sound/realtek,rt1015p.yaml
new file mode 100644
index 000000000000..def1db298eac
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/realtek,rt1015p.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/realtek,rt1015p.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek rt1015p codec devicetree bindings
+
+maintainers:
+  - Tzung-Bi Shih <tzungbi@google.com>
+
+description: |
+  Rt1015p is a rt1015 variant which does not support I2C and
+  only supports S24, 48kHz, 64FS.
+
+properties:
+  compatible:
+    const: realtek,rt1015p
+
+  sdb-gpios:
+    description:
+      GPIO used for shutdown control.
+      0 means shut down; 1 means power on.
+    maxItems: 1
+
+required:
+  - compatible
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    rt1015p: rt1015p {
+        compatible = "realtek,rt1015p";
+        sdb-gpios = <&pio 175 GPIO_ACTIVE_HIGH>;
+    };
-- 
2.28.0.526.ge36021eeef-goog

