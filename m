Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6927A328690
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Mar 2021 18:13:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0419166A;
	Mon,  1 Mar 2021 18:12:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0419166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614618821;
	bh=JAZW71oGr+uPsf05sRgZbONv7U3epY8nJsk/yvQb0aY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C/VZ7oNukVLBpjOG01P7L11csa8dRt88jfxIOb24AaUqITiGZfcM/Hv/olxbWys9A
	 REX36lts15sW248Tv6Kg+CBkFDEpRwnXAH868xTirdYBLUHAOG+mdYa1g2eiKz4Jr2
	 rI2rPHXlfg1hpMO/LoaF0i2IKrqM0XGS8WNbodm0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DEEEF804AA;
	Mon,  1 Mar 2021 18:10:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DC19F804AF; Mon,  1 Mar 2021 18:09:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7794DF804AB
 for <alsa-devel@alsa-project.org>; Mon,  1 Mar 2021 18:09:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7794DF804AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="aYUbpRMy"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1614618597; x=1646154597;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JAZW71oGr+uPsf05sRgZbONv7U3epY8nJsk/yvQb0aY=;
 b=aYUbpRMyAe9tniT6afZV/RRk2VS5QFpQd5/uiflcdtetHyzZaaReHLf2
 U5ZrcVGxKis17UY4mI42FShvs12Kj7/b/ghN4Sdah8FSYn/OXIkSdDvgS
 LnuNjITpLFQdemBnStQ5Ng9fsHksgXn5A0WEphS4qSpEAcgOLY7ZJ9W3t
 JKTBMC4txZRtqHaqNXdgH9glXozSKC0bupZ4yKLW+vmQXnig5WNL4prJS
 NvO9BOIYZes1M8sby9aQSgeq9FhLEArP7ytM5/TiNGI2JVSSUrGff8b+E
 x2S+BjnFx7HjtoqzSj/1Ul+QRRxU3J/DCqHB+84ca+E4D0F495+hOMVlO g==;
IronPort-SDR: OPDsas62esXmTkEDESjLiHXRHblwzIfU0ueGzYrZIw/dOcdPD2yx1XgAlDHFc2xTpHZsz43RJ3
 4yLsRplyaAbjqUvgsXWihaeNVctgWBHvQQQh4Lk+0hIzWXevUNmHs3VAUe6904MDuzz2lru7YM
 9+wYMXjSPg1Qfo0F1KclMNWMm7zQm/iq720ZtIagfmthg6Le49RxCYKyMD1ERJ0szF2H+4FovP
 XxtY5Fz00L96swuHseNSjUh+fG3KQNciR9kHY4xB775oQBdvN9TnJ250SXMj7uW+ThTqjaa65S
 6Zo=
X-IronPort-AV: E=Sophos;i="5.81,215,1610434800"; d="scan'208";a="111511738"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Mar 2021 10:09:54 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 1 Mar 2021 10:09:49 -0700
Received: from rob-ult-m19940.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Mon, 1 Mar 2021 10:09:46 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 4/7] dt-bindings: mchp,
 i2s-mcc: Add property to specify pin pair for TDM
Date: Mon, 1 Mar 2021 19:09:02 +0200
Message-ID: <20210301170905.835091-5-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210301170905.835091-1-codrin.ciubotariu@microchip.com>
References: <20210301170905.835091-1-codrin.ciubotariu@microchip.com>
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

Changes in v2:
- changes are done to mchp-i2s-mcc.txt insted of mchp,i2s-mcc.yaml

 Documentation/devicetree/bindings/sound/mchp-i2s-mcc.txt | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/mchp-i2s-mcc.txt b/Documentation/devicetree/bindings/sound/mchp-i2s-mcc.txt
index 2180dbd9ea81..af8fe3e657df 100644
--- a/Documentation/devicetree/bindings/sound/mchp-i2s-mcc.txt
+++ b/Documentation/devicetree/bindings/sound/mchp-i2s-mcc.txt
@@ -19,7 +19,12 @@ Required properties:
 Optional properties:
 - pinctrl-0:      Should specify pin control groups used for this controller.
 - princtrl-names: Should contain only one value - "default".
-
+- microchip,tdm-data-pair: 8 bit value that represents the DIN/DOUT pair pins
+			   which are used to receive/send TDM data. It is optional
+			   and it is only needed if the controller uses the TDM
+			   mode. Not available for "microchip,sam9x60-i2smcc"
+			   compatible. If it's not present, the default value is 0,
+			   so the DIN/DOUT 0 pins are used.
 
 (1) : Only the peripheral clock is required. The generated clock is optional
       and should be set mostly when Master Mode is required.
-- 
2.27.0

