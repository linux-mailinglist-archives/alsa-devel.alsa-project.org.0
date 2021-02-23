Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BAD323091
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Feb 2021 19:23:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78E2C1662;
	Tue, 23 Feb 2021 19:23:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78E2C1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614104633;
	bh=84j7/78rR9j49AoWteswWe25XyPzYeNSKwnQ095gk3g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sRN4jHwA86ldomN9YbnZowRcNN8MFAERRzuad6+KxuNULp3DQ7Q24orsKTjy6CE+Q
	 MiXx+5Jqa7TdbBZuhwwrf2qh3muvUo2QIwMKbaBAv+pwh4bJSkVK73/+4/Zy2jKmyB
	 Vn0giLp6JxRmRlT/unFLFkHsr2+ujwrwy/W5yhVY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3061F804AC;
	Tue, 23 Feb 2021 19:20:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF60CF80475; Tue, 23 Feb 2021 19:20:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3522F80430
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 19:20:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3522F80430
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="mGKkvrAj"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1614104421; x=1645640421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=84j7/78rR9j49AoWteswWe25XyPzYeNSKwnQ095gk3g=;
 b=mGKkvrAjCAUhv3X4B1P9Fe6VCVK86aEOVcRakQXsuY8hjdBEYacUjWG3
 HQlD/mfmfLGUvub4TF8Dk3+SSmBMS0Z29cd1TUqjwJV1wOikzSxagxKqw
 NqRBRHTKOzuS/kTIo0LC96MAEY+22el5GArqzK/3ccTiHuMoZFLwu//qZ
 0vtvAQMz0IPWGx1pdpklOnz9rPNNlrWF89BQ7XuJPeXC/DzY+9wqWY/5s
 PuqbBuptpLeOhkkgbxfqnt06GGwdkj9MkZjoRt3EOieWQbq0NMKxXa0q7
 xC2GL0FXxD77fy8P8SI+P3ZrF9v162ipAr+yeCy475KQtViMQCrrvtRwN A==;
IronPort-SDR: OMtCRUgrXv/RNqU6mV4ks+b8ag4aX4ymCli0/qKPvIsf6bX4q/eUGZrL3EFQS79iKq7k09h3ru
 B0U6onQLonRsePINzpsqeyZYpAsyXGgwI9cQ9ObeWZTRBUJ8JwOMsm6naaq7FrkjMpqSr8Ygib
 HHfw1/LCXMpL1WpIW/9ww2RGpDcDO6oRthFfe1o0XV94YwMZPRuTKq6R9w6sxZK1TmAYsLVD81
 h71Lf1iLwPDVQd72ZhXg5kh5SLLCaFQQHznvHCuGREIyBaFTZ/DwO2oh5PRh0WT8etLBApyPj1
 7TM=
X-IronPort-AV: E=Sophos;i="5.81,200,1610434800"; d="scan'208";a="110827460"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Feb 2021 11:20:16 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 23 Feb 2021 11:20:15 -0700
Received: from rob-ult-m19940.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Tue, 23 Feb 2021 11:20:12 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 5/7] dt-bindings: mchp,
 i2s-mcc: Add property to specify pin pair for TDM
Date: Tue, 23 Feb 2021 20:19:27 +0200
Message-ID: <20210223181929.444640-6-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210223181929.444640-1-codrin.ciubotariu@microchip.com>
References: <20210223181929.444640-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alexandre.belloni@bootlin.com, lgirdwood@gmail.com,
 nicolas.ferre@microchip.com, robh+dt@kernel.org, tiwai@suse.com,
 ludovic.desroches@microchip.com, broonie@kernel.org, Codrin
 Ciubotariu <codrin.ciubotariu@microchip.com>
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

SAMA7G5's I2S-MCC has 4 pairs of DIN/DOUT pins. Since TDM only uses a
single pair of pins for synchronous capture and playback, the controller
needs to be told which of the pair is connected. This can be mentioned
using the new "microchip,tdm-data-pair" property. The property is optional,
needed only if TDM is used, and if it's missing DIN/DOUT 0 pins will be
used by default.

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---
 .../devicetree/bindings/sound/mchp,i2s-mcc.yaml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mchp,i2s-mcc.yaml b/Documentation/devicetree/bindings/sound/mchp,i2s-mcc.yaml
index a8a73f3ed473..0481315cb5f2 100644
--- a/Documentation/devicetree/bindings/sound/mchp,i2s-mcc.yaml
+++ b/Documentation/devicetree/bindings/sound/mchp,i2s-mcc.yaml
@@ -57,6 +57,23 @@ properties:
       - const: tx
       - const: rx
 
+  microchip,tdm-data-pair:
+    description:
+      Represents the DIN/DOUT pair pins that are used to receive/send
+      TDM data. It is optional and it is only needed if the controller
+      uses the TDM mode.
+    $ref: /schemas/types.yaml#/definitions/uint8
+    enum: [0, 1, 2, 3]
+    default: 0
+
+if:
+  properties:
+    compatible:
+      const: microchip,sam9x60-i2smcc
+then:
+  properties:
+    microchip,tdm-data-pair: false
+
 required:
   - "#sound-dai-cells"
   - compatible
-- 
2.27.0

