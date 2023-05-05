Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 357526FA16A
	for <lists+alsa-devel@lfdr.de>; Mon,  8 May 2023 09:48:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7E3712C5;
	Mon,  8 May 2023 09:47:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7E3712C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683532119;
	bh=QhWEOP3FlpvYPwZiJ8i+RWHCxp1FQxx7XNdGh30W9sA=;
	h=Date:From:To:Subject:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=nYN2t/N7jiztjADV/lq8CkbXLYSB/OVWvyP3dY+dZ9QKt3sUk5DrelQcZoanZ++Fr
	 aYPolr+FDHGppAhHEwPb7scNoakPmSSGF4UdaFylZWXCrTx7ggo0ZXkE+AtMdDOkwx
	 gvXU+CRZMKXZw74aDIdJyanHwb68Tr6UMHkaIY+k=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 83638F805B6;
	Mon,  8 May 2023 09:45:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31C2CF8052D; Fri,  5 May 2023 15:30:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3B027F80520
	for <alsa-devel@alsa-project.org>; Fri,  5 May 2023 15:30:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B027F80520
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=FdSmeTr1
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-24e2bbec3d5so1313219a91.3
        for <alsa-devel@alsa-project.org>;
 Fri, 05 May 2023 06:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683293449; x=1685885449;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k7jCr7W/FI3aFXYPnC0hqNFeny2rAOk/VL+jdI5ieBk=;
        b=FdSmeTr1tdaMdcTKYwHAy5czhxIDodmH++ULQd8fwCqvjhBDJV4nzDqgE4wkIS5VQY
         1GuvqsSIQoiPf9ANBdpotVCgefREYblbUczW8PJIePj74iUQc7lCkgdXFt5z2wcW0HrM
         /TRh+go4t6Ji/XeEqPMSLbGKMEmqKz3LIeGR8cQKslcY10u+PK3pZu2/tCFfhPUNRQDP
         4AQNGVpw6KSvATSIe3h1U0khbhg0gLIvD9iZFwA1vxfeRoHPn/+wCg+6ezx0NxSCZA78
         lc70OpH05PXKtTFOLFj4YQzlZB09LkMz1g1nlgWZCu+84QR0WCziCFrR6AmR7qJQ2Hm+
         StGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683293449; x=1685885449;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k7jCr7W/FI3aFXYPnC0hqNFeny2rAOk/VL+jdI5ieBk=;
        b=PWioaEiFvKFb0QnwvODP0QtqQ8tnMafjoB84zc4MJ4eRxJ2owbUnvlpgzZyVMh2b6a
         Ujx5yNP9glbuWEmKy6BMDL+OlfH9azp75ktRHnyaWUDxWnD5p8+yAQulFBY55i0jtV7e
         AGGXTrhtr3dyAzwl1WKFnAF0m6UfXvOWOXhXzTKiEfqFnpb1yHmxWi7uC2Jh6vFqpAyW
         HhuOD8+/OS5yRFTZD9JEofP2RBtQ92UA2dCNu3ahgUa2AHZ0Zlh12M/tIzA9C+zi9JVy
         jiey28ELXfawdlJqZHPbE1G0D+XzWJ7uLwKYCAfHQAuVdjgI1jP6O+DNEnEQHF/bEdpG
         jAaw==
X-Gm-Message-State: AC+VfDzrj1hMp51ziEHG2rOJE884XK9/tXHeeU+vDBo7KjdqtxcnTOIP
	VnERoWoBzsnQYACZU+y4qMk=
X-Google-Smtp-Source: 
 ACHHUZ6YTKLwPCN7D+WAoHB+acEnPplFDn5bF7gYSisfHLgidWRPNl9QzYULSdm4gLahQ3+1dHO7Ew==
X-Received: by 2002:a17:90a:128e:b0:24d:eb30:daa6 with SMTP id
 g14-20020a17090a128e00b0024deb30daa6mr1369608pja.40.1683293448677;
        Fri, 05 May 2023 06:30:48 -0700 (PDT)
Received: from yoga ([202.131.133.155])
        by smtp.gmail.com with ESMTPSA id
 iq14-20020a17090afb4e00b0024df400a9e6sm9771850pjb.37.2023.05.05.06.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 06:30:48 -0700 (PDT)
Date: Fri, 5 May 2023 19:00:42 +0530
From: Anup Sharma <anupnewsmail@gmail.com>
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH] ASoC: dt-bindings: rt1016: Convert to dtschema
Message-ID: <ZFUFAmBJXvkQAG7m@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-MailFrom: anupnewsmail@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 5UMJMOHB5RTR5IZEPKLBVTB42APFEM5C
X-Message-ID-Hash: 5UMJMOHB5RTR5IZEPKLBVTB42APFEM5C
X-Mailman-Approved-At: Mon, 08 May 2023 07:45:13 +0000
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5UMJMOHB5RTR5IZEPKLBVTB42APFEM5C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the RT1016 Stereo Audio Amplifier bindings to DT schema

Signed-off-by: Anup Sharma <anupnewsmail@gmail.com>
---
 .../bindings/sound/realtek,rt1016.yaml        | 40 +++++++++++++++++++
 .../devicetree/bindings/sound/rt1016.txt      | 17 --------
 2 files changed, 40 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt1016.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/rt1016.txt

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt1016.yaml b/Documentation/devicetree/bindings/sound/realtek,rt1016.yaml
new file mode 100644
index 000000000000..5287e9c9197e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/realtek,rt1016.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/realtek,rt1016.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Reaktek RT1016 Stereo Class D Audio Amplifier
+
+maintainers:
+  - oder_chiou@realtek.com
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: realtek,rt1016
+
+  reg:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        codec@1a {
+            compatible = "realtek,rt1016";
+            reg = <0x1a>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/sound/rt1016.txt b/Documentation/devicetree/bindings/sound/rt1016.txt
deleted file mode 100644
index 2310f8ff259b..000000000000
--- a/Documentation/devicetree/bindings/sound/rt1016.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-RT1016 Stereo Class D Audio Amplifier
-
-This device supports I2C only.
-
-Required properties:
-
-- compatible : "realtek,rt1016".
-
-- reg : The I2C address of the device.
-
-
-Example:
-
-rt1016: codec@1a {
-	compatible = "realtek,rt1016";
-	reg = <0x1a>;
-};
-- 
2.34.1

