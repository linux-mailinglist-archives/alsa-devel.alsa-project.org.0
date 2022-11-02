Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 080B5616BFC
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Nov 2022 19:21:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 236181685;
	Wed,  2 Nov 2022 19:21:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 236181685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667413317;
	bh=aHKXHg5yRWCszz4RN5TUFELZQbFWp0LXSet1RHes8lw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t4r3Mm5bmW7/ttWuYOPQnzlPRJ9yX4506fpO2JU92YprAWopvw77/CSPjcZL1PGE5
	 /8ZSDm0RmS/cwUZpT0E9dFmB3p4qLRYaGy/U/mCrn+mDw530+7PVC46d12G3bjGcJL
	 xvWp1UG3BFqdOSQUY44Gy6y9aEnCQGDgSK1J8iTE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63BC8F80254;
	Wed,  2 Nov 2022 19:20:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B9E2F80558; Wed,  2 Nov 2022 19:20:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AE8BF8026D
 for <alsa-devel@alsa-project.org>; Wed,  2 Nov 2022 19:20:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AE8BF8026D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="LqLVraj7"
Received: from notapiano.myfiosgateway.com (unknown
 [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id AFC3066028E3;
 Wed,  2 Nov 2022 18:20:11 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1667413213;
 bh=aHKXHg5yRWCszz4RN5TUFELZQbFWp0LXSet1RHes8lw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LqLVraj7daBs/qNGOyMgszO7PYrOjdyFfjnFJkoiTC/1Jxm/fdHpn0MZNNjV/xUG1
 b3Z+YeiUD0HOls+xF1xUB8EfRTcIy/2diBZJonReDRRWGhA0t29hD/yq0j1MYKI4b9
 eu/eJZCBtewDSvaKdl0j7KdrJS72+y7SaCc1xlT2boF2tHuejdDD0xlja5TjdcC/ol
 1y6pTQcLfzmyYA6AMGsydD7QgHx/yyqfVxIa9rZx24pTRUl/i1MuQ8gZh2ET6VQzFF
 MNb1qX2O0oXwypUhidFIpRE4syMtSyg6o0s4pUfbFJxnVhvCW0C5V1aav0HiKUUUMh
 iDE4Mo2/OxTPA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Subject: [PATCH v2 3/8] ASoC: dt-bindings: rt5682: Add AVDD,
 MICVDD and VBAT supplies
Date: Wed,  2 Nov 2022 14:19:57 -0400
Message-Id: <20221102182002.255282-4-nfraprado@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221102182002.255282-1-nfraprado@collabora.com>
References: <20221102182002.255282-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
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

(no changes since v1)

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

