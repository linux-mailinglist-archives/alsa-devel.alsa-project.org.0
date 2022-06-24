Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 265AC559825
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jun 2022 12:48:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2861F1887;
	Fri, 24 Jun 2022 12:48:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2861F1887
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656067734;
	bh=bBRa8nevTNOZWvilLQ4FsUBKwTmWUgsHXM7MPfQlOVc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nRMRiQJU+55TjYh+ypuCvsawNIrN4c7H5clUYHGszqtNGeHc+J9K0dQ+MGy/4V2nY
	 a2Z6g2+WvaA6jSF9sYj7eK3Pg6ouVmh4fUWBp1MFQhAxgP9KM88I77LA89U0hgGJ3/
	 8TtCnAur3Vqd9RAUEkb7PD+6LKhndp8yCa2YFsqw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CE08F802BE;
	Fri, 24 Jun 2022 12:48:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5BC5F80535; Fri, 24 Jun 2022 12:47:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
 by alsa1.perex.cz (Postfix) with ESMTP id C292AF800CB
 for <alsa-devel@alsa-project.org>; Fri, 24 Jun 2022 12:47:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C292AF800CB
Received: from hq-00021.holoplot.net (unknown [176.126.217.202])
 by mail.bugwerft.de (Postfix) with ESMTPSA id 79992284B6F;
 Fri, 24 Jun 2022 10:47:22 +0000 (UTC)
From: Daniel Mack <daniel@zonque.org>
To: broonie@kernel.org,
	ryan.lee.analog@gmail.com
Subject: [PATCH 1/8] ASoC: dt-bindings: max98396: add voltage supplies
Date: Fri, 24 Jun 2022 12:47:05 +0200
Message-Id: <20220624104712.1934484-2-daniel@zonque.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220624104712.1934484-1-daniel@zonque.org>
References: <20220624104712.1934484-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, robh+dt@kernel.org,
 Daniel Mack <daniel@zonque.org>
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

The device is supplied with 3 core voltages (DVVDIO, DVDD, AVDD), and
PVDD and/or VBAT.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 .../bindings/sound/adi,max98396.yaml          | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/adi,max98396.yaml b/Documentation/devicetree/bindings/sound/adi,max98396.yaml
index ec4c10c2598a..a23ac8036e1c 100644
--- a/Documentation/devicetree/bindings/sound/adi,max98396.yaml
+++ b/Documentation/devicetree/bindings/sound/adi,max98396.yaml
@@ -24,6 +24,21 @@ properties:
     maxItems: 1
     description: I2C address of the device.
 
+  avdd-supply:
+    description: A 1.8V supply that powers up the AVDD pin.
+
+  dvdd-supply:
+    description: A 1.2V supply that powers up the DVDD pin.
+
+  dvddio-supply:
+    description: A 1.2V or 1.8V supply that powers up the VDDIO pin.
+
+  pvdd-supply:
+    description: A 3.0V to 20V supply that powers up the PVDD pin.
+
+  vbat-supply:
+    description: A 3.3V to 5.5V supply that powers up the VBAT pin.
+
   adi,vmon-slot-no:
     description: slot number of the voltage sense monitor
     $ref: "/schemas/types.yaml#/definitions/uint32"
@@ -72,6 +87,10 @@ examples:
         max98396: amplifier@39 {
             compatible = "adi,max98396";
             reg = <0x39>;
+            dvdd-supply = <&regulator_1v2>;
+            dvddio-supply = <&regulator_1v8>;
+            avdd-supply = <&regulator_1v8>;
+            pvdd-supply = <&regulator_pvdd>;
             adi,vmon-slot-no = <0>;
             adi,imon-slot-no = <1>;
             reset-gpios = <&gpio 4 GPIO_ACTIVE_LOW>;
-- 
2.36.1

