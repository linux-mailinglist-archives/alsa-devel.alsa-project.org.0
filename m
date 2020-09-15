Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FBA26AD15
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Sep 2020 21:09:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A3CB822;
	Tue, 15 Sep 2020 21:08:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A3CB822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600196968;
	bh=cXsetD4m+UWYy6yKHzB7IC4dXHH2WBdWL1BI0hl2x+g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e1IgNGeC8RJn2kzFgtnkOaZYP91Mm01Xv6yuHSV9Ra6SOw0T/IM3lzcg1xp4Fv9YQ
	 /Al6r7Cev+OA839Kdicim9oe03K5XX+L2UFrU3ndJqjntuP56zlbbh2ZfBgL1gauEi
	 5Nn94Tpb9keN/OOj4iTRP5AT3n8syKgVDiGZinIY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DDA0F802DD;
	Tue, 15 Sep 2020 21:06:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77634F802DC; Tue, 15 Sep 2020 21:06:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 812A8F8025E
 for <alsa-devel@alsa-project.org>; Tue, 15 Sep 2020 21:06:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 812A8F8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BNqM+wyL"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08FJ6Ocf013532;
 Tue, 15 Sep 2020 14:06:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600196784;
 bh=hgyrILCOHxn4aWfNT+mBa0oIr/oD9RVinyh1T/rioAw=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=BNqM+wyLN/jDKHkAaTzKShkDAfBaAQKd4tStU0EF/fZCwrx5pbO49bwxOPMkVCAAk
 CHmUw49P4q7vsobYJ9+di2J3pRtFcRVRGKAJwGW2QjxlYJyrS4Ap9+98giYgAU9Gz5
 CLePWE2JHyTWh8ZY0L+T1SVAo03aPQqNze2iYj9I=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08FJ6O0R060657
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 15 Sep 2020 14:06:24 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Sep 2020 14:06:24 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Sep 2020 14:06:24 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08FJ6NcD102452;
 Tue, 15 Sep 2020 14:06:23 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <tiwai@suse.com>,
 <robh+dt@kernel.org>
Subject: [PATCH 3/6] dt-bindings: tlv320adcx140: Add ASI Tx drive
Date: Tue, 15 Sep 2020 14:06:03 -0500
Message-ID: <20200915190606.1744-3-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200915190606.1744-1-dmurphy@ti.com>
References: <20200915190606.1744-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>, camel.guo@axis.com
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

Add a property to indicate if the device is to go into a High-z state on
the Tx ASI output pins when the device is idle.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 Documentation/devicetree/bindings/sound/tlv320adcx140.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml b/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml
index f578f17f3e04..e79f8d1891e4 100644
--- a/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml
+++ b/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml
@@ -108,6 +108,12 @@ properties:
       maximum: 7
     default: [0, 0, 0, 0]
 
+  ti,asi-tx-drive:
+    type: boolean
+    description: |
+      When set the device will set the Tx ASI output to a Hi-Z state for unused
+      data cycles. Default is to drive the output low on unused ASI cycles.
+
 patternProperties:
   '^ti,gpo-config-[1-4]$':
     $ref: /schemas/types.yaml#/definitions/uint32-array
-- 
2.28.0

