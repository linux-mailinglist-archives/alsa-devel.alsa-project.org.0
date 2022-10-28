Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 701D9611BFE
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 22:58:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1522E1630;
	Fri, 28 Oct 2022 22:57:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1522E1630
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666990681;
	bh=r1qaS5ViUxHsg1AZWvTvqTeEqXfMJSJaHVFIn2x377M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XP8iJxtHXL/K1LQlP2rxVf7+DGtcabRpJuQMWFSQ1MwOuF801OXNB0jIhOXzaFzEP
	 0LXr5xAunh08eyISY6negvPP1gNdYrzPS5WAuCkkYvBTIicngj0w6x60IgY3vQnJNe
	 LBz4zJ2j0Tn6Wnak+5YCOEJ1Qg+uWf7GQeiSQIfU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4C31F80564;
	Fri, 28 Oct 2022 22:56:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC4E7F8024C; Fri, 28 Oct 2022 22:56:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AC16F8024C
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 22:55:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AC16F8024C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="Be5H31LH"
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk
 [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 877906602940;
 Fri, 28 Oct 2022 21:55:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1666990553;
 bh=r1qaS5ViUxHsg1AZWvTvqTeEqXfMJSJaHVFIn2x377M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Be5H31LH2WXgTiryfnYQhUfs1ziaP8O4tktnP6GMZ9lHvDHyDw2tANpsISZUTjfkq
 OcI8IdOUoPhFlnB3qhBKE+zTOFr8qvc6PGHUIHAF/tihmeyKrhB1OVbew/pCENPxhR
 leaM04Iv+RZx14OV/Nmu1BEDuiKsqYU3yFZn1zGc04GgfsNi/nqNwIuv1gANRlFMwA
 jryI7hRCxCgixD9PKbC/dQfE6IqYOk/SrDVapZBOtEoJBDvARQQcJI9ipqohMCMm9K
 ShWaLByQEudq5HXvmL7kzSonT2c3WSyQ8NanSXY5N5YFwdQbujlpjvNySmzHTMKBk+
 BcKXmrXvDlLhg==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Subject: [PATCH 3/8] ASoC: dt-bindings: rt5682: Add AVDD,
 MICVDD and VBAT supplies
Date: Fri, 28 Oct 2022 16:55:35 -0400
Message-Id: <20221028205540.3197304-4-nfraprado@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221028205540.3197304-1-nfraprado@collabora.com>
References: <20221028205540.3197304-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

The rt5682 codec has three supplies - AVDD, MICVDD and VBAT - which are
already used by sc7180-trogdor.dtsi. Document them in the binding.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---
Commit adapted from [1], changes:
- Made supplies required
- Improved supplies descriptions

[1] https://lore.kernel.org/all/20221024220015.1759428-5-nfraprado@collabora.com

 Documentation/devicetree/bindings/sound/rt5682.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/rt5682.txt b/Documentation/devicetree/bindings/sound/rt5682.txt
index 6b87db68337c..89e6245b870e 100644
--- a/Documentation/devicetree/bindings/sound/rt5682.txt
+++ b/Documentation/devicetree/bindings/sound/rt5682.txt
@@ -8,6 +8,15 @@ Required properties:
 
 - reg : The I2C address of the device.
 
+- AVDD-supply: phandle to the regulator supplying analog power through the
+  AVDD pin
+
+- MICVDD-supply: phandle to the regulator supplying power for the microphone
+  bias through the MICVDD pin. Either MICVDD or VBAT should be present.
+
+- VBAT-supply: phandle to the regulator supplying battery power through the
+  VBAT pin. Either MICVDD or VBAT should be present.
+
 Optional properties:
 
 - interrupts : The CODEC's interrupt output.
@@ -75,4 +84,7 @@ rt5682 {
 
 	clocks = <&osc>;
 	clock-names = "mclk";
+
+	AVDD-supply = <&avdd_reg>;
+	MICVDD-supply = <&micvdd_reg>;
 };
-- 
2.38.1

