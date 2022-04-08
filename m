Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 979F94F97C0
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 16:13:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 315121A23;
	Fri,  8 Apr 2022 16:12:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 315121A23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649427183;
	bh=C1G265Eaie6a4nvHnDU4l4Dxvu50vZh0e8lbjCp1q7I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pv7rGfnM/RpNqd8Es7sdC/YXaOArb4v05IbGfD/lA1YTIoaoPZ1pAhKJmjJJmN5Ou
	 /QQYbYhQNzDIdCUIuSM5X+nmyY9jka9DCLf9bOD+vLHs4ol+kvBlOHAQu85zbRoR2x
	 TvfUGFD2mQlhhhKUlZcrKgYjGvh6WK/K9bik82yg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE81EF80311;
	Fri,  8 Apr 2022 16:12:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AC36F8012A; Fri,  8 Apr 2022 16:12:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FROM,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from n169-110.mail.139.com (n169-110.mail.139.com [120.232.169.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBDE9F8012A
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 16:11:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBDE9F8012A
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM: 
X-RM-SPAM-FLAG: 00000000
Received: from LAPTOP-39QA2GAC.localdomain (unknown[120.231.214.12])
 by rmsmtp-lg-appmail-04-12082 (RichMail) with SMTP id 2f326250428c9b2-6bbb4;
 Fri, 08 Apr 2022 22:11:51 +0800 (CST)
X-RM-TRANSID: 2f326250428c9b2-6bbb4
From: Raphael-Xu <13691752556@139.com>
To: broonie@kernel.org
Subject: [PATCH v1 2/2] update to support either TAS2764 or TAS2780
Date: Fri,  8 Apr 2022 22:11:19 +0800
Message-Id: <20220408141119.958-2-13691752556@139.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408141119.958-1-13691752556@139.com>
References: <20220408141119.958-1-13691752556@139.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

update tas27xx.yaml to support either TAS2764 or TAS2780

Signed-off-by: Raphael-Xu <13691752556@139.com>
---
 .../devicetree/bindings/sound/tas27xx.yaml     | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/tas27xx.yaml b/Documentation/devicetree/bindings/sound/tas27xx.yaml
index 5bf8c76ecda1..191f4bceb4ee 100644
--- a/Documentation/devicetree/bindings/sound/tas27xx.yaml
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


