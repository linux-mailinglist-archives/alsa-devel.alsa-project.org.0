Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A546598B7
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Dec 2022 14:27:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0266020FA;
	Fri, 30 Dec 2022 14:26:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0266020FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672406867;
	bh=IvRWO4eC3xoqIX2FSb49iiteNk3z/ZAdb3J8xt3zlVs=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=K4kZnyF7spI7ckNFl9FZx0/Z32psmIAEEv13zt1QxUg0I4j3PhjJDkGfOnQg156Md
	 /rfc3QIQnhRsRolOAR1zG/1G+YE1041RKLKPgZ0I9ohkEBa/uBSvrUGRR3KZIY279O
	 TrK99NeZeLREJnIOCcvaFQmS0iVmYqzcdPjLRPU8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25C58F804CF;
	Fri, 30 Dec 2022 14:26:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E66FAF80310; Fri, 30 Dec 2022 14:26:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA7CCF80310
 for <alsa-devel@alsa-project.org>; Fri, 30 Dec 2022 14:26:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA7CCF80310
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=ZIW+RKVz
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2BUDQl7p049625;
 Fri, 30 Dec 2022 07:26:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1672406807;
 bh=dbCx/VXUiWAoUqcghBEwXB4ZiVVFhxpChn2d7CnKOXU=;
 h=From:To:CC:Subject:Date;
 b=ZIW+RKVz4OU9MFov9wSeeSoFO4Vyjv+6tywWrO+5IoE5KwZxvN5FTq7qfr4kRvlG+
 dYBQ/v6pbJr0L0V/6HRcLVLkSeR8tFcg6Qe/1fcEjZU9/GBm3r1WIizA5RY0gccWHv
 1SO8ofVJSaHSU0zaAQoKWxAEzi/No8hpV813c55Q=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2BUDQlrF010566
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 30 Dec 2022 07:26:47 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 30
 Dec 2022 07:26:47 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 30 Dec 2022 07:26:47 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2BUDQkpp003672;
 Fri, 30 Dec 2022 07:26:46 -0600
From: Jai Luthra <j-luthra@ti.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v2] dt-bindings: sound: tlv320aic3x: Add optional clock and
 port properties
Date: Fri, 30 Dec 2022 18:56:44 +0530
Message-ID: <20221230132644.6398-1-j-luthra@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Jai Luthra <j-luthra@ti.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Describe optional properties for clocks and ports that were missing in
the original txt binding, to fix warnings like:

aic33@18: 'assigned-clock-parents', 'assigned-clock-rates',
	'assigned-clocks' do not match any of the regexes:
	'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap2420-n810.dtb

tlv320aic3106@1b: 'port' does not match any of the regexes:
	'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-sl50.dtb

codec@18: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/imx6dl-gw5903.dtb
	arch/arm/boot/dts/imx6q-gw5903.dtb

Some uses of "port" still lead to warnings because they pass clocks in
the endpoint, but that is discouraged:
https://lore.kernel.org/all/20210205152644.GA3083322@robh.at.kernel.org/

Signed-off-by: Jai Luthra <j-luthra@ti.com>
---

Splitting this patch from v5 of the old series, as the base bindings in 
[1/2] were picked in broonie's tree

v2:
- Add maxItems to clocks
- Use audio-graph-port bindings

v1:
https://lore.kernel.org/all/20221227082717.29561-3-j-luthra@ti.com/

 .../devicetree/bindings/sound/ti,tlv320aic3x.yaml          | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/ti,tlv320aic3x.yaml b/Documentation/devicetree/bindings/sound/ti,tlv320aic3x.yaml
index f0375bbf4c40..e8ca9f3369f8 100644
--- a/Documentation/devicetree/bindings/sound/ti,tlv320aic3x.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,tlv320aic3x.yaml
@@ -110,6 +110,13 @@ properties:
   '#sound-dai-cells':
     const: 0
 
+  clocks:
+    maxItems: 1
+
+  port:
+    $ref: audio-graph-port.yaml#
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg
-- 
2.17.1

