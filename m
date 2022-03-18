Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F1F4E428D
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Mar 2022 16:11:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 330D7166F;
	Tue, 22 Mar 2022 16:10:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 330D7166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647961870;
	bh=oRTv5m0e8ii6MGOnVm/A7ZMd75hYysl6VUrWXrqbs4U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vg/0Kkyt6btCYfPQr15ygllV6JyxpS2sJHJkowIq8abTypDXBEcA9df40lHHcJZEX
	 KdNN5JsNKNxB9HaognXwvVOAmJSzyNREY5KzG8WyLjYptyu/TI0hzUhSFvCCVqYxXo
	 zNPtl+W8JTHY4vxDFiiNvh8jsJSUjFy3jIvziWRE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2A48F8012A;
	Tue, 22 Mar 2022 16:10:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4709FF8026D; Fri, 18 Mar 2022 10:49:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FROM,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,SPF_HELO_NONE,SPF_NONE,
 SPOOFED_FREEMAIL,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from n169-112.mail.139.com (n169-112.mail.139.com [120.232.169.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABD47F80121
 for <alsa-devel@alsa-project.org>; Fri, 18 Mar 2022 10:49:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABD47F80121
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM: 
X-RM-SPAM-FLAG: 00000000
Received: from LAPTOP-39QA2GAC.localdomain (unknown[223.73.211.159])
 by rmsmtp-lg-appmail-25-12028 (RichMail) with SMTP id 2efc623455949a0-42d88;
 Fri, 18 Mar 2022 17:49:19 +0800 (CST)
X-RM-TRANSID: 2efc623455949a0-42d88
From: Raphael-Xu <13691752556@139.com>
To: broonie@kernel.org
Subject: [PATCH v2 1/2] support either TAS2764 or TAS2780 from TI-yaml
Date: Fri, 18 Mar 2022 17:49:02 +0800
Message-Id: <20220318094903.22026-1-13691752556@139.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 22 Mar 2022 16:10:02 +0100
Cc: navada@ti.com, alsa-devel@alsa-project.org, shenghao-ding@ti.com,
 raphael-xu@ti.com, Raphael-Xu <13691752556@139.com>
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

Signed-off-by: Raphael-Xu <13691752556@139.com>
---
 .../sound/{tas2764.yaml => tas27xx.yaml}       | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)
 rename Documentation/devicetree/bindings/sound/{tas2764.yaml => tas27xx.yaml} (72%)

diff --git a/Documentation/devicetree/bindings/sound/tas2764.yaml b/Documentation/devicetree/bindings/sound/tas27xx.yaml
similarity index 72%
rename from Documentation/devicetree/bindings/sound/tas2764.yaml
rename to Documentation/devicetree/bindings/sound/tas27xx.yaml
index 5bf8c76ecda1..191f4bceb4ee 100644
--- a/Documentation/devicetree/bindings/sound/tas2764.yaml
+++ b/Documentation/devicetree/bindings/sound/tas27xx.yaml
@@ -1,25 +1,27 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-# Copyright (C) 2020 Texas Instruments Incorporated
+# Copyright (C) 2020-2022 Texas Instruments Incorporated
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/sound/tas2764.yaml#"
+$id: "http://devicetree.org/schemas/sound/tas27xx.yaml#"
 $schema: "http://devicetree.org/meta-schemas/core.yaml#"
 
-title: Texas Instruments TAS2764 Smart PA
+title: Texas Instruments TAS2764/TAS2780 Smart PA
 
 maintainers:
-  - Dan Murphy <dmurphy@ti.com>
+  - Shenghao Ding <shenghao-ding@ti.com>
 
 description: |
-  The TAS2764 is a mono, digital input Class-D audio amplifier optimized for
-  efficiently driving high peak power into small loudspeakers.
-  Integrated speaker voltage and current sense provides for
-  real time monitoring of loudspeaker behavior.
+  The TAS2764/TAS2780 is a mono, digital input Class-D audio amplifier
+  optimized for efficiently driving high peak power into small
+  loudspeakers. Integrated speaker voltage and current sense provides
+  for real time monitoring of loudspeaker behavior.
 
 properties:
   compatible:
     enum:
       - ti,tas2764
+      or
+      - ti,tas2780
 
   reg:
     maxItems: 1
-- 
2.35.1


