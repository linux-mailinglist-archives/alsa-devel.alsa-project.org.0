Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8305BFB0C6
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Nov 2019 13:49:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17CF811C;
	Wed, 13 Nov 2019 13:48:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17CF811C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573649343;
	bh=gnW3vDAaVeNH6JksyiHEKDMbj9B62BQACwzgcetdm5w=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OROJavGbo4wohx4X95UOvsOC1XKcO6IjzSZEtmsleS753mHHajiTylQMN0OuUfqaN
	 bv0BZhMNsMQsAzs9vks2Qk0PuJFqp2eR7MjDQxn9sXo2p9c03ZB8UlOqjNFf5/qyiA
	 249B2Z9uH6cSRT4rqxn2YMCmsnEwATrAd/u80YkU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A229FF80086;
	Wed, 13 Nov 2019 13:46:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26854F80036; Wed, 13 Nov 2019 13:46:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65758F80036
 for <alsa-devel@alsa-project.org>; Wed, 13 Nov 2019 13:46:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65758F80036
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ksFivVFH"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xADCkOMl013610;
 Wed, 13 Nov 2019 06:46:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1573649184;
 bh=8aQ8N44hvS+8dZKUfv1GLSveBB3IfB2708I6w+E/VzA=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=ksFivVFHjffDLgFQK0dN/YY0iep7idsI/DJK/M/3mk93CKCkhIgEQqNhoLzsn2gjK
 Ps3l0mE/gdj4EamWZiPCU0Xuh0pqqyW9WuYgxsoWPWZ0ePUGOatN+mXBLGcwYVbF44
 JJaGT1SdVkbAH/+HKxEVhflAyfKwSGxJdgZcETg4=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xADCkNK4115042
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 13 Nov 2019 06:46:23 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 13
 Nov 2019 06:46:05 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 13 Nov 2019 06:46:06 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xADCkIGF127078;
 Wed, 13 Nov 2019 06:46:21 -0600
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Wed, 13 Nov 2019 14:47:33 +0200
Message-ID: <20191113124734.27984-2-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191113124734.27984-1-peter.ujfalusi@ti.com>
References: <20191113124734.27984-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org
Subject: [alsa-devel] [PATCH 1/2] bindings: sound: pcm3168a: Document
	optional RST gpio
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On boards where the RST line is not pulled up, but it is connected to a
GPIO line this property must present in order to be able to enable the
codec.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 Documentation/devicetree/bindings/sound/ti,pcm3168a.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/ti,pcm3168a.txt b/Documentation/devicetree/bindings/sound/ti,pcm3168a.txt
index 5d9cb84c661d..f30aebc7603a 100644
--- a/Documentation/devicetree/bindings/sound/ti,pcm3168a.txt
+++ b/Documentation/devicetree/bindings/sound/ti,pcm3168a.txt
@@ -25,6 +25,12 @@ Required properties:
 
 For required properties on SPI/I2C, consult SPI/I2C device tree documentation
 
+Optional properties:
+
+  - rst-gpios : Optional RST gpio line for the codec
+		RST = low: device power-down
+		RST = high: device is enabled
+
 Examples:
 
 i2c0: i2c0@0 {
@@ -34,6 +40,7 @@ i2c0: i2c0@0 {
 	pcm3168a: audio-codec@44 {
 		compatible = "ti,pcm3168a";
 		reg = <0x44>;
+		rst-gpios = <&gpio0 4 GPIO_ACTIVE_HIGH>;
 		clocks = <&clk_core CLK_AUDIO>;
 		clock-names = "scki";
 		VDD1-supply = <&supply3v3>;
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
