Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7F732308D
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Feb 2021 19:22:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D3471699;
	Tue, 23 Feb 2021 19:21:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D3471699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614104560;
	bh=dK2vWaZOPK17Lmr+m9zk2hLho0FOToHeXM48kxb1z+g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sanj2fBQoFiVpjwMj07N0YehqNapfr798K+Q1NSEaf+xg6qlQoDR79i5+qHwu0l13
	 HcJMOuDxnM2YxtddJ2j4oU1ixeAMEA+ae5WLsimn33Rdfok3y5QgL/StL1urpLIJad
	 weHINUP44zViLTHgsE/kp2EUapkWXagcElmnehVA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B932AF8032D;
	Tue, 23 Feb 2021 19:20:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46747F802E3; Tue, 23 Feb 2021 19:20:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BBE3F8016A
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 19:20:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BBE3F8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="Ak6LHrxK"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1614104409; x=1645640409;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dK2vWaZOPK17Lmr+m9zk2hLho0FOToHeXM48kxb1z+g=;
 b=Ak6LHrxKqocRpTiiDiAvi/IwbXJGRIIpafQFDlf/bSuCY873WhIg9bh4
 a4Eg677ELuWd14RTcr5jVxwb43LoxTRISsBi2VEXuCFFMpFPYHTh8Yjde
 47O+PYDiOuf2+7SXs8mO2b8TaYhN3Uf2GV+ZYe/+oSoc+Lsja42d5Dq98
 huNm7Gjo8+xsIcGS0FHwQNB1MHDqYk0kE4Hk+Dst7efGkka/KUPXG0TIQ
 fXMLU41hRdp+brvw73f/IS7bMJzejXI2E+xxOlghi+Tf9ZI7pIOSmJmMb
 sZ1HSqDcqwrEi7BzQfpw8uGRfL5B535hg3+lFeVT6WzKFAFW44l7/MAE+ w==;
IronPort-SDR: XRqINWKwEni1gFHvuFusQPJ5tKXsUJwg64SGAqj/xrKSgTYR/xp3trJMVEnaMMgMA8KHdQ9CaD
 UztH6MH4+WSXi1vlTCgsroCBDJUKO8ZJuIg8zvSLT0gcnsLTEMh76eae7SWMloGo+UOTBebOD6
 BOqLS3792upr6s6TKLLIAfocTWnoUDpOwvdkPCXRSx4MrrKPxpvN/QEd6ZaUPVfrFehhjaJNjF
 qbi/JkfZ8H/jDNb0J3QU1S+nfDwwWA3YrmjNS8KfZSjCRPuzu2tTNTtD6ukNYqfYQm9niDLX6M
 dOA=
X-IronPort-AV: E=Sophos;i="5.81,200,1610434800"; d="scan'208";a="107691056"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Feb 2021 11:20:05 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 23 Feb 2021 11:20:04 -0700
Received: from rob-ult-m19940.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Tue, 23 Feb 2021 11:20:01 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 2/7] dt-bindings: mchp,i2s-mcc: Add SAMA7G5 to binding
Date: Tue, 23 Feb 2021 20:19:24 +0200
Message-ID: <20210223181929.444640-3-codrin.ciubotariu@microchip.com>
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

SAMA7G5 includes an updated version of the I2S-MCC driver, that includes
3 more DIN/DOUT pin pairs for multi-channel.

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---
 Documentation/devicetree/bindings/sound/mchp,i2s-mcc.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/mchp,i2s-mcc.yaml b/Documentation/devicetree/bindings/sound/mchp,i2s-mcc.yaml
index 79445f5f2804..a8a73f3ed473 100644
--- a/Documentation/devicetree/bindings/sound/mchp,i2s-mcc.yaml
+++ b/Documentation/devicetree/bindings/sound/mchp,i2s-mcc.yaml
@@ -15,13 +15,18 @@ description:
   multi-channel audio codecs. It consists of a receiver, a transmitter and a
   common clock generator that can be enabled separately to provide Adapter,
   Client or Controller modes with receiver and/or transmitter active.
+  On later I2SMCC versions (starting with Microchip's SAMA7G5) I2S
+  multi-channel is supported by using multiple data pins, output and
+  input, without TDM.
 
 properties:
   "#sound-dai-cells":
     const: 0
 
   compatible:
-    const: microchip,sam9x60-i2smcc
+    enum:
+      - microchip,sam9x60-i2smcc
+      - microchip,sama7g5-i2smcc
 
   reg:
     maxItems: 1
-- 
2.27.0

