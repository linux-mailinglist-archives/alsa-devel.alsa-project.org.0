Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B843C328674
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Mar 2021 18:12:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FD321693;
	Mon,  1 Mar 2021 18:11:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FD321693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614618725;
	bh=9Dw+kwhMQDbH+M3mWnOXIqZENc4i58L5DgTTWewcxdU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KSCMWMLAwNgLMR0zhO3d0PPiZvh/C33ckxCyHUl4YuscG6gzW7ZCj3cmnxGZcwkqL
	 MTTQnJh43+0qI4BpXPUc4I98hc+Hp7EXE5MpXpx9oQcNkTJYVfYjXVT6Bn8PWA7AT3
	 FZLeez+Psk2NQeWtNvDM2IginE3m8NGwlGgfTlwQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C554EF802E7;
	Mon,  1 Mar 2021 18:09:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86A1EF802E3; Mon,  1 Mar 2021 18:09:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A91D5F80275
 for <alsa-devel@alsa-project.org>; Mon,  1 Mar 2021 18:09:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A91D5F80275
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="K4eNeyXy"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1614618583; x=1646154583;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9Dw+kwhMQDbH+M3mWnOXIqZENc4i58L5DgTTWewcxdU=;
 b=K4eNeyXyElq1ZxX5o3zhh4x8pcvihin03JZ6VWgI8sQG02bGVdHUV4CP
 6xkikhEzrInuEc2gzCIlHFtdqF6OAPhSs8oSnmIEUNFsg/iqdD0uY1JsA
 HdiL3VJE9eYikHZbPrv1tl0hmA/6oseuoa//KjmB+eozBWodxcaJW5rzV
 FI/qCVh8unJakMX0YCNDYV1sIUCopmE0d+dH5+UMzXzgJw0KkAWkqdkPJ
 Ip59ttK4QDSGvUbO8+Dd2X1NDjKBnYCYZp+ovhncieNltiQZxBmD+ZjgG
 aNE516NvwizUIQhrmbk4OgQxyo67Ph9qm+SuK0RmhDhvY5BtcLdZLUhEH Q==;
IronPort-SDR: KUIfx+c87XzXmqdIZUjC7INv++N9JoD8Vn+raEsJ7CxoEifIYuw6S4RjEiXU8gczsv0CczRSdQ
 jEVeGdfGSsfDymW2DgPxo6roOOfH/hYr5TwjX7nTs2r3keiKgZSzi88Exi6Lz6EGfauvoilmnb
 fQBCrzUNcr5YXqriGeJGsCdFEQkgiDmhAvQviccNf4lXiJwQ1Is3KSnBbpeaLTG5phHTS+GUTz
 lqOcyeUDZybU4p2zhDCBXmecgOrvGeKfigyV05nn3BkpAVzZmpxRAYriCAZvtb4nKA+mkpAz6W
 N0w=
X-IronPort-AV: E=Sophos;i="5.81,215,1610434800"; d="scan'208";a="111511618"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Mar 2021 10:09:38 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 1 Mar 2021 10:09:38 -0700
Received: from rob-ult-m19940.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Mon, 1 Mar 2021 10:09:34 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 1/7] dt-bindings: mchp,i2s-mcc: Add SAMA7G5 to binding
Date: Mon, 1 Mar 2021 19:08:59 +0200
Message-ID: <20210301170905.835091-2-codrin.ciubotariu@microchip.com>
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

SAMA7G5 includes an updated version of the I2S-MCC driver, that includes
3 more DIN/DOUT pin pairs for multi-channel.

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---

Changes in v2:
- changes are done to mchp-i2s-mcc.txt insted of mchp,i2s-mcc.yaml

 Documentation/devicetree/bindings/sound/mchp-i2s-mcc.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/mchp-i2s-mcc.txt b/Documentation/devicetree/bindings/sound/mchp-i2s-mcc.txt
index 91ec83a6faed..2180dbd9ea81 100644
--- a/Documentation/devicetree/bindings/sound/mchp-i2s-mcc.txt
+++ b/Documentation/devicetree/bindings/sound/mchp-i2s-mcc.txt
@@ -1,7 +1,8 @@
 * Microchip I2S Multi-Channel Controller
 
 Required properties:
-- compatible:     Should be "microchip,sam9x60-i2smcc".
+- compatible:     Should be "microchip,sam9x60-i2smcc" or
+		  "microchip,sama7g5-i2smcc".
 - reg:            Should be the physical base address of the controller and the
                   length of memory mapped region.
 - interrupts:     Should contain the interrupt for the controller.
-- 
2.27.0

