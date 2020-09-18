Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 307E32704B3
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Sep 2020 21:08:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDD501689;
	Fri, 18 Sep 2020 21:07:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDD501689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600456127;
	bh=p0I3jt0zTGiBSIi3m/DRv4Sfl5/mOAiB0Gqqvt6pDLA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aGXNqmtDCEeYobWQAnlepqC7xkbbBrnVt2UuR8hRuqR25dk/dB6BTOIHFsvYVFKGd
	 k0XljbWIXaOf98CqP0QjG0WJ032Gigg1LUxqrtzxmkMHW7fzx0uNbpLpUVuxFkJdzC
	 yH3wZaf7qKp5LmPX9CjrdSBW6aBdtYFq1gl2Gmgo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37797F802DB;
	Fri, 18 Sep 2020 21:06:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5ACEAF802D2; Fri, 18 Sep 2020 21:06:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A78DFF8015A
 for <alsa-devel@alsa-project.org>; Fri, 18 Sep 2020 21:06:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A78DFF8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="FRo7ilWB"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08IJ603B041397;
 Fri, 18 Sep 2020 14:06:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600455960;
 bh=dTAM7ZNYGRkaUHqtwQ2Jc2yzxy7+xjgyUcfu900PcvM=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=FRo7ilWBEk+jMnvWMm4uu4oQt2Ldbz/CCuX/9BqHLMtgC1AJSjBGYBX00dYsnSXGW
 F/5rcjKJZ8NIRi6rewI8PForP/VBMOr2qzml3jU8gGKHbEG3DJsdCpNUech4ia2Cfd
 uvBS4LTxmumItHpmSu2C9Jp7Ly/dWUp6y3gRILIo=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08IJ60Cp047438
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 18 Sep 2020 14:06:00 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 18
 Sep 2020 14:06:00 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 18 Sep 2020 14:06:00 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08IJ60as012332;
 Fri, 18 Sep 2020 14:06:00 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <tiwai@suse.com>,
 <robh+dt@kernel.org>
Subject: [PATCH 3/9] dt-bindings: tas2770: Fix I2C addresses for the TAS2770
Date: Fri, 18 Sep 2020 14:05:42 -0500
Message-ID: <20200918190548.12598-3-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200918190548.12598-1-dmurphy@ti.com>
References: <20200918190548.12598-1-dmurphy@ti.com>
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

