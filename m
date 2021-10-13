Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FAB42DAC3
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Oct 2021 15:48:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EA5D1670;
	Thu, 14 Oct 2021 15:47:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EA5D1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634219305;
	bh=2Xje8pKfkwfEzJnN5Km/T/71jC9qThKArd4i/qedYX8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=i6iP6EmtNjzoDUivWBiESDWjOJyVf5+iBaOWrCmpcO6AjsY38EkCKyIsKdSozCqbM
	 sFc5lQ/+UXGIO5a+iuu+BLOIFL39uMtrF2ay9LiBcK6CsBq9vRvU47ABaLEsclp+uB
	 U76cKliwUa/Jxj2iffWm3VtERaAQiS2ObHuny9YI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0967CF801F7;
	Thu, 14 Oct 2021 15:47:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1825F80269; Wed, 13 Oct 2021 08:04:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96312F80088
 for <alsa-devel@alsa-project.org>; Wed, 13 Oct 2021 08:04:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96312F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jsFSQ/yE"
Received: by mail-pf1-x431.google.com with SMTP id q19so1513361pfl.4
 for <alsa-devel@alsa-project.org>; Tue, 12 Oct 2021 23:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MH9z8oRP1WEDSYSBSdmgw7YkHAb/fp8UIslbgmjVY44=;
 b=jsFSQ/yE1vIMk0ZXSOG9PWuCn5JQscSjwdkdEmx5aOvUYwvASQnDZakuR6eciLBhCD
 92h6e10Hpbm8ucmaq1aPOmMgftVR0sX95ktsmJ/WiRmU9Ayk7dCoe1VSFlq8ZA2hM2HU
 y2eKEyPSFUaDIn31Ep4clKCxYx/16sreoichvvDvxip+viqowN5qndQ4XvqcMpnEOqYT
 cqdDNwZvuF325dM6dDUmzd+ENrmQiCGm3PriDqt57028lAcewW7aWUxCLkdFmXXj6hU2
 AvAKXTnqjDIbL+YVRDtUrwUJNlqj38bL9KS/5aMy86pwVpw6Ox5HlXfuEsAf8lA6Cwto
 y7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MH9z8oRP1WEDSYSBSdmgw7YkHAb/fp8UIslbgmjVY44=;
 b=In/d7YGfgQY6MAD2FDz13q1DPHYxNi8eHmmIuaQlQFqZkPeFeKNfl4GtlMMCx4lM9U
 7i30+dTPI10xwvN3VOaxPP8Kbo1WbrAeWO5YLUHxknfikCI3TmNnpAK3LQCCRZckMDIt
 EWtHwIx5b3FTMeHsCSmp45JyyfxtOCy7oc3qjVus5yrLfmqvpBFUVHWBQysUifWcwBep
 6tCbRplqnCqjhx64gUqoAfwybsbnOd6uOqe2Y+dBRT20Oce1dAmjqi3A6GLWU+a3ht1Z
 i4gtz5BLtth2f7Aklez99pqjCaCW9CM4+31/HlAS8XkINdWIrSFy8T4qbAtP7t6HQN6U
 xZWA==
X-Gm-Message-State: AOAM531uuZ6RmCrJRPbi9exbHhWMvXLHEEhrENn99JbIc0zgiO4EUwH8
 +ewoQHgdED4bsStr1L9gJyA=
X-Google-Smtp-Source: ABdhPJyqqqSApXRNIzuuH5iQRESjESRbu7jNUNmMjLGTCrUAzRTOBbZ2z4ajKRyTDITgvwz2iFDUkg==
X-Received: by 2002:a63:f410:: with SMTP id g16mr25875791pgi.201.1634105088816; 
 Tue, 12 Oct 2021 23:04:48 -0700 (PDT)
Received: from SEL-LT-028891.maxim-ic.internal ([223.62.162.93])
 by smtp.gmail.com with ESMTPSA id w9sm5003461pjk.28.2021.10.12.23.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 23:04:48 -0700 (PDT)
From: George Song <georgesong0119@gmail.com>
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 george.song@maximintegrated.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ALSA SoC MAX98520 dt-bindings : Added device tree binding
 for max98520 Signed-off-by: George Song <george.song@maximintegrated.com>
Date: Wed, 13 Oct 2021 15:04:41 +0900
Message-Id: <20211013060441.18177-1-georgesong0119@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 14 Oct 2021 15:47:05 +0200
Cc: "george.song" <george.song@analog.com>
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

From: "george.song" <george.song@analog.com>

---
 .../bindings/sound/maxim,max98520.yaml        | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/maxim,max98520.yaml

diff --git a/Documentation/devicetree/bindings/sound/maxim,max98520.yaml b/Documentation/devicetree/bindings/sound/maxim,max98520.yaml
new file mode 100644
index 000000000000..02481428e2ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/maxim,max98520.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/maxim,max98520.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim Integrated MAX98520 Speaker Amplifier Driver
+
+maintainers:
+  - Goerge Song <George.song@maximintegrated.com>
+
+properties:
+  compatible:
+    const: maxim,max98520
+
+  reg:
+    maxItems: 1
+    description: I2C address of the device.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      max98520: amplifier@38 {
+        compatible = "maxim,max98520";
+        reg = <0x38>;
+      };
+    };
-- 
2.25.1

