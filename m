Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 941C217D430
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Mar 2020 15:29:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 293F71657;
	Sun,  8 Mar 2020 15:28:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 293F71657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583677776;
	bh=LsG0/ZXHpN1fJYgPqtqxa+VCz0EWG64frqp1DcBRb/w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q42pilN5ga5te/q0vK5CjK8/L0w3A/5Ghb8Dk0HH/+5YRTvgXUpoPDtG9Rm+K1p5z
	 Ckmz7jtPgM5WR99FPBvC0gSNU0ssSpyQMeNP0JCvsxw0fFRhbhROxQkeiMoE2zgMra
	 WmjFlGqyLO6qpGooLgJGx2i/jECuxUMs/M2EdcFM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C67DBF8029B;
	Sun,  8 Mar 2020 15:25:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B84E3F80291; Sun,  8 Mar 2020 15:25:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6267EF80249
 for <alsa-devel@alsa-project.org>; Sun,  8 Mar 2020 15:25:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6267EF80249
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.b="W8CEr9Wd"
Received: by mail-ed1-x542.google.com with SMTP id h62so8799860edd.12
 for <alsa-devel@alsa-project.org>; Sun, 08 Mar 2020 07:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9wrkembjowAPTNsOgmMmMbhT9NlC7DKGZCBV+/iO4pc=;
 b=W8CEr9Wdvd0mRWjoVbyHUOkGYhfNrxw4QsJkGOvoABEaZqEmgBmZAXpXwi52O3hggG
 xX11TBHF75ZNCms5PAmRJEwa2YbIpkiUySspIwkRbAoOn/R2rco5Jly3uKU96QlYC8S8
 U4r409L8h5vyI/644DLc47/WfeslXDIkAdl6BvqBeGzSnmsjacpiLZRk9ZSulDEB1KGM
 8iLN7aILokK3Y0zuxGCEDm0DaU1EZXGi4tRCJyKxK7bf8BN1VQ++9QIgXEm2FE3esJzh
 jAYmNEH4blt/PbFXaMDyeHXEEM7+DJIAfNUobT/8TLvRJyMgWqL3zA+aHQd70xM1EGh7
 lThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9wrkembjowAPTNsOgmMmMbhT9NlC7DKGZCBV+/iO4pc=;
 b=WpB8lN+4XYydj6ImD5MwS1fUPDQY/6d9Z9RZSY4ZOmDUYpTyRsSFqY37gfdh93ahsg
 FWRorA7juS9apKTfBoc7znJBNw28GdLri0Ek8afmFpS9SRnpOHO1jt24Tk9k3CdtkwuJ
 bhwYuIBIUwKascfNklSTFF9DOfzheYV6vGcTEuaTT8rJff1wwc1qEwvSHkRl7HKrAU+C
 rtVeaObdy5obfMHG/wBqVQIKz4fE8sTWDyXwQaeoayxxhWzUUrdllymllKhFIjE+gVKS
 RJSn5E9t4MIp+hYHZ4P0jEgmk0BcKriqzo2LK9v997SADkS0uaDu7GC5Vs0Ujl41P7Xp
 PLqw==
X-Gm-Message-State: ANhLgQ1v1HZBQV2kr/0H55ZRWa/jDyHcdJBM/VIShrHbVtu4Ovw3VQjf
 6D/A8o8BTxDAncfM+/5W228jL+MH+2U=
X-Google-Smtp-Source: ADFU+vsrefLqY+TOluOAuivj6Xz5IWCyG5feZz2qSRuMebyNATTfueplxWpg1aE11ns/1N2YIKlDwQ==
X-Received: by 2002:a50:ec0b:: with SMTP id g11mr5624884edr.80.1583677532617; 
 Sun, 08 Mar 2020 07:25:32 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:44b4:9700:886c:841d:dea2:ee2a])
 by smtp.googlemail.com with ESMTPSA id h20sm1736516edr.43.2020.03.08.07.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2020 07:25:32 -0700 (PDT)
From: Charles-Antoine Couret <charles-antoine.couret@mind.be>
To: alsa-devel@alsa-project.org
Subject: [PATCH 6/6 V3] ASoC: tas5756m: Add DT binding document
Date: Sun,  8 Mar 2020 15:25:09 +0100
Message-Id: <20200308142509.27765-7-charles-antoine.couret@mind.be>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200308142509.27765-1-charles-antoine.couret@mind.be>
References: <20200308142509.27765-1-charles-antoine.couret@mind.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org,
 Charles-Antoine Couret <charles-antoine.couret@mind.be>
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

Document the bindings for the tas5756m driver.

Signed-off-by: Charles-Antoine Couret <charles-antoine.couret@mind.be>
---
 .../devicetree/bindings/sound/tas5756m.yaml   | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/tas5756m.yaml

diff --git a/Documentation/devicetree/bindings/sound/tas5756m.yaml b/Documentation/devicetree/bindings/sound/tas5756m.yaml
new file mode 100644
index 000000000000..2fd4492c4bd2
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/tas5756m.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/tas5756m.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TAS5756M audio codec Device Tree Bindings
+
+maintainers:
+  - Charles-Antoine Couret <charles-antoine.couret@mind.be>
+
+description: |
+  You can read datasheets there:
+  http://www.ti.com/lit/ds/symlink/tas5754m.pdf
+  http://www.ti.com/lit/ds/symlink/tas5756m.pdf
+
+  TAS5754M datasheet has a more complete datasheet about register mapping
+  which is common with TAS5756M.
+
+  Those devices have a programmable DSP whith several modes named hybridflow.
+  More details about it there: http://www.ti.com/lit/ug/slau577a/slau577a.pdf
+
+properties:
+  compatible:
+    enum:
+      - "ti,tas5756m"
+      - "ti,tas5754m"
+
+  reg:
+    maxItems: 1
+    description: I2C slave address
+
+  "#sound-dai-cells":
+    const: 0
+
+  mute-gpios:
+    maxItems: 1
+    description: GPIO wired to the mute pin.
+
+  ti,hybridflow:
+    description: |
+      Select the HybridFlow DSP program.
+      If not supplied default DSP program is used instead.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [1, 2, 3, 4, 5, 6, 7, 8, 9]
+
+additionalProperties: false
+
+required:
+  - "#sound-dai-cells"
+  - compatible
+  - reg
+
+examples:
+  - |
+    tas5756m: tas5756m@4c {
+        compatible = "ti,tas5756m";
+        reg = <0x4c>;
+        #sound-dai-cells = <0>;
+
+        ti,hybridflow = <6>;
+        mute-gpios = <&gpio1 11 GPIO_ACTIVE_LOW>;
+    };
-- 
2.24.1

