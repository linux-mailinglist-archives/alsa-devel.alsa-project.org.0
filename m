Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 884073FFF19
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 13:24:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29BD4181A;
	Fri,  3 Sep 2021 13:23:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29BD4181A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630668263;
	bh=Et7dVPIQrkP9JfNZBPxDiR4TDEnTwFEVrbR20Z/sdoc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Thscj9wN7my4IHRf+jnkmwxo5LdOu9/fG9HmhQkVVk8dkXDDRAtTW5G/2nD46+O0+
	 DDTjHzQQ7OKRLhnJSnwUib9jNyMXIBrLsCcSkgWwwSYhvYsC76Lx6r0A5KA1q6qH3l
	 faTlJCCsHEblvt7PphiJT9q01r2cPE/kOqvBblMs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B752F80507;
	Fri,  3 Sep 2021 13:21:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A3EBF804F3; Fri,  3 Sep 2021 13:21:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAE0AF80254
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 13:21:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAE0AF80254
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="wmZS/Jpd"
Received: by mail-wr1-x435.google.com with SMTP id u9so7709767wrg.8
 for <alsa-devel@alsa-project.org>; Fri, 03 Sep 2021 04:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=//dKqQtyVNezpAIRnDOA9TcRJZDgQ0d9R3BICS21tDc=;
 b=wmZS/JpdpDhKKOiUAcrscdLMLOUHMjFl5m+4MoOLjHpeYa7goPbKbBaCfQuPHBFdtR
 r6/+jssbulj32HuMqSQ48oFlcquv9/pzggC9xW/wPRY8wksFy7+r05H5ZdF+rNxS7kWS
 SA3Ktpm98Sm4ECMrwItZQ48B+E1BCGeVgyDNn4ylccO7YU7odqh8JwiHYtsh6ZzscUc4
 kEaTgkZtUQjB9CenCE238k0C91+c/G+3EoeNeU1ecGHxo4MTbaYqUvMMcYPurlWAo0re
 e6My8mEfexB7InlMhXzSxuJiCK/skJuvyhmDkrOlAWT3Gb3LQnjSAzocKs/b0DC8nTYj
 i3/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=//dKqQtyVNezpAIRnDOA9TcRJZDgQ0d9R3BICS21tDc=;
 b=eB4q5LcnYc+ucYQ65p4obQtdTMEi/h/LzrlDsconoKiesShEmJM3aS+WuGdwjdTfrR
 p5J03VM9bXDfQLMZ+JBGjPXXF/gZtqRLyNckb48J38Un9HpOLKFspvyoUPH+JuarbTe+
 NYgCCPNEe7sHx9v7cvqAKe3lRRVjoZ58ZFONzTbcnhxPsGB5oYSXapofeEgx1W75tm/7
 7nCSQfHEOoWJoXRtcQmHYi9xE5YZrBYrdRbvWnEdlR1eMQO6pkhSvJpdUxFHkBKzCA/o
 AujkoBC3bo9kb+u+mYexZvYgaeGKUfR9n/DFYDvEVHdErlTFVT5vvgqtRUhJVQYVD+kv
 zzbA==
X-Gm-Message-State: AOAM530Rdpf14ePn5X+80G3/H1ocUlLLBm6EIcvxwy9iKoMmUljbCcWi
 /jtLHV0TsjiugbXlyVvRR1L1UQ==
X-Google-Smtp-Source: ABdhPJzdx00/bR6Zmsjxe4MaeAATmKIDg/ma7PcG8N0v6jOVuazg79rcvbgd8Gbxkzg43gNAaNMmug==
X-Received: by 2002:adf:c550:: with SMTP id s16mr3529756wrf.25.1630668094060; 
 Fri, 03 Sep 2021 04:21:34 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id f20sm3881877wmb.32.2021.09.03.04.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 04:21:33 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org,
	robh@kernel.org
Subject: [PATCH v5 02/21] soc: dt-bindings: qcom: apr: deprecate qcom,
 apr-domain property
Date: Fri,  3 Sep 2021 12:20:13 +0100
Message-Id: <20210903112032.25834-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210903112032.25834-1-srinivas.kandagatla@linaro.org>
References: <20210903112032.25834-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, tiwai@suse.de, plai@codeaurora.org,
 lgirdwood@gmail.com
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

replace usage of qcom,apr-domain property with qcom,domain property so
that bindings and driver can be reused.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../devicetree/bindings/soc/qcom/qcom,apr.yaml | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
index 133e9c6cd961..922c8567c134 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
@@ -31,6 +31,20 @@ properties:
         5 = Application processor Domain
         6 = Modem2 Domain
         7 = Application Processor2 Domain
+    deprecated: true
+
+  qcom,domain:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 3, 4, 5, 6, 7]
+    description:
+      Selects the processor domain for apr
+        1 = APR simulator
+        2 = PC Domain
+        3 = Modem Domain
+        4 = ADSP Domain
+        5 = Application processor Domain
+        6 = Modem2 Domain
+        7 = Application Processor2 Domain
 
   '#address-cells':
     const: 1
@@ -89,7 +103,7 @@ patternProperties:
 
 required:
   - compatible
-  - qcom,apr-domain
+  - qcom,domain
 
 additionalProperties: false
 
@@ -98,7 +112,7 @@ examples:
     #include <dt-bindings/soc/qcom,apr.h>
     apr {
         compatible = "qcom,apr-v2";
-        qcom,apr-domain = <APR_DOMAIN_ADSP>;
+        qcom,domain = <APR_DOMAIN_ADSP>;
         #address-cells = <1>;
         #size-cells = <0>;
 
-- 
2.21.0

