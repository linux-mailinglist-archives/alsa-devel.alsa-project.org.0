Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AF18C9E26
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 15:29:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA0DD14F;
	Mon, 20 May 2024 15:28:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA0DD14F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716211749;
	bh=6MSGlKBYOtbIfBrOwKOEfO+LalxWOYW7++dbVZ3bZ5A=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=JKeknh5XcBxEnHqG/deuKPbwwFOV+HFGlwb5uwnXBvf7y+wlTGbmqygP820to+Po9
	 79ZfMU2ztr/6Oidt9sLERYUZXTnj1spAlAQTVNBc+1Nf/XN7wzNOtlMrcBUVryk8Yd
	 KE3wNw063QQ6cwP7onkI6g1nMVfhW8Sp7noqTJs8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D091F805D2; Mon, 20 May 2024 15:28:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE43FF805B2;
	Mon, 20 May 2024 15:28:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5FBCEF805B5; Mon, 20 May 2024 14:52:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7A77EF800BA
	for <alsa-devel@alsa-project.org>; Mon, 20 May 2024 14:52:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A77EF800BA
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D0A601A04A4;
	Fri, 17 May 2024 12:05:34 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 86D221A0F4C;
	Fri, 17 May 2024 12:05:34 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id DFB7B1820F76;
	Fri, 17 May 2024 18:05:32 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shengjiu.wang@gmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] ASoC: dt-bindings: fsl,mqs: Add i.MX95 platform support
Date: Fri, 17 May 2024 17:45:45 +0800
Message-Id: <1715939146-13031-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1715939146-13031-1-git-send-email-shengjiu.wang@nxp.com>
References: <1715939146-13031-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: WUHTA5ZSQQAG7XWHGMGHDVANGHZMPUZR
X-Message-ID-Hash: WUHTA5ZSQQAG7XWHGMGHDVANGHZMPUZR
X-MailFrom: shengjiu.wang@nxp.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In order to support the MQS module on i.MX95, a new property
"fsl,mqs-ctrl" needs to be added, as there are two MQS instances
on the i.MX95 platform, the definition of bit positions in the
control register is different. This new property is to distinguish
these two instances.

Without this property, the difference of platforms except the
i.MX95 was handled by the driver itself. But this new property can
also be used for previous platforms.

The MQS only has one control register, the register may be
in General Purpose Register memory space, or MQS its own
memory space, or controlled by System Manager.
The bit position in the register may be different for each
platform, there are four parts (bits for module enablement,
bits for reset, bits for oversampling ratio, bits for divider ratio).
This new property includes all these things.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../devicetree/bindings/sound/fsl,mqs.yaml      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl,mqs.yaml b/Documentation/devicetree/bindings/sound/fsl,mqs.yaml
index 8b33353a80ca..a2129b7cb147 100644
--- a/Documentation/devicetree/bindings/sound/fsl,mqs.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,mqs.yaml
@@ -23,6 +23,7 @@ properties:
       - fsl,imx8qm-mqs
       - fsl,imx8qxp-mqs
       - fsl,imx93-mqs
+      - fsl,imx95-mqs
 
   clocks:
     minItems: 1
@@ -45,6 +46,22 @@ properties:
   resets:
     maxItems: 1
 
+  fsl,mqs-ctrl:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 6
+    maxItems: 6
+    description: |
+      Contains the control register information, defined as,
+      Cell #1: register type
+               0 - the register in owned register map
+               1 - the register in general purpose register map
+               2 - the register in control of system manager
+      Cell #2: offset of the control register from the syscon
+      Cell #3: shift bits for module enable bit
+      Cell #4: shift bits for reset bit
+      Cell #5: shift bits for oversampling ratio bit
+      Cell #6: shift bits for divider ratio control bit
+
 required:
   - compatible
   - clocks
-- 
2.34.1

