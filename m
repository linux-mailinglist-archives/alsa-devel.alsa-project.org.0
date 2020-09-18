Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73887270275
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Sep 2020 18:45:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0EC916B8;
	Fri, 18 Sep 2020 18:44:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0EC916B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600447525;
	bh=p0I3jt0zTGiBSIi3m/DRv4Sfl5/mOAiB0Gqqvt6pDLA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FEwR4lFYHv23Liau0s+uCnYBvwZtOkgDHSPiQqhe9CZtz0PQFivG1itR8f334CoeQ
	 T3Tvtya2cc5qDdHVsBwKS+mDhYNTkxpTigwUIXs0kKJ9QL6R5ktWbLcAONhiOZmDs8
	 QipAaSdAqvUdPTqWd/fyhg/Y99JjTL5luO8XaViM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5C46F8015C;
	Fri, 18 Sep 2020 18:43:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C62AF8015A; Fri, 18 Sep 2020 18:43:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB2FCF800E8
 for <alsa-devel@alsa-project.org>; Fri, 18 Sep 2020 18:43:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB2FCF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="j7Rq2ltp"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08IGhRTm028426;
 Fri, 18 Sep 2020 11:43:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600447407;
 bh=dTAM7ZNYGRkaUHqtwQ2Jc2yzxy7+xjgyUcfu900PcvM=;
 h=From:To:CC:Subject:Date;
 b=j7Rq2ltpESmHeDC2HoGQzJl7Pm5p/xXEuBcABDJIe3AdPama3YcNFZG124RqV7GB0
 pUpaTeiLKbyd7+LSl6GA9DUqb3FmPa9RNsKhxrZ8HnxlPmNJfYh5UmD8Es13nPW4Ly
 kr09BfqWvrixzjmT0TGQJZPFnhVxIB4DJHrBNTU8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08IGhRNV090571
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 18 Sep 2020 11:43:27 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 18
 Sep 2020 11:43:27 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 18 Sep 2020 11:43:27 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08IGhQkw024902;
 Fri, 18 Sep 2020 11:43:27 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <tiwai@suse.com>,
 <robh+dt@kernel.org>
Subject: [PATCH] dt-bindings: tas2770: Fix I2C addresses for the TAS2770
Date: Fri, 18 Sep 2020 11:43:20 -0500
Message-ID: <20200918164320.11577-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
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

The I2C addresses listed in the yaml are not correct. The addresses can
range from 0x41 through 0x48 based on register configurations. Fix the
example and the description.

Fixes: 4b7151dadfd4 ("dt-bindings: ASoC: Add tas2770 smart PA dt bindings")
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 Documentation/devicetree/bindings/sound/tas2770.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/tas2770.yaml b/Documentation/devicetree/bindings/sound/tas2770.yaml
index 33a90f829c80..bb26d081c9fa 100644
--- a/Documentation/devicetree/bindings/sound/tas2770.yaml
+++ b/Documentation/devicetree/bindings/sound/tas2770.yaml
@@ -24,7 +24,7 @@ properties:
   reg:
     maxItems: 1
     description: |
-       I2C address of the device can be one of these 0x4c, 0x4d, 0x4e or 0x4f
+       I2C address of the device can be between 0x41 to 0x48.
 
   reset-gpio:
     description: GPIO used to reset the device.
@@ -62,9 +62,9 @@ examples:
    i2c0 {
      #address-cells = <1>;
      #size-cells = <0>;
-     codec: codec@4c {
+     codec: codec@41 {
        compatible = "ti,tas2770";
-       reg = <0x4c>;
+       reg = <0x41>;
        #sound-dai-cells = <1>;
        interrupt-parent = <&gpio1>;
        interrupts = <14>;
-- 
2.28.0

