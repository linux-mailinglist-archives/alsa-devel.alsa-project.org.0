Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84576611BF9
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 22:57:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D78C1633;
	Fri, 28 Oct 2022 22:56:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D78C1633
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666990660;
	bh=kjJv2wI4r1COdPJDLysFujzo37yIvD0eiCbT/D7WY8Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OnbkkoCkxI0wu+5lNZ9tZSJwNoMQr/xfIWtW/ltDhU4Ae+gz/76Ajv3Sgdw63XCUI
	 VdFJNmy20vXk406fj0DAG5iQXPa+Nr6cvMrUzCHeYoP6aqvetwqmkJjECAFLUp57Uq
	 Z8ubirLtI7PplxeyM+csMjEtq5EPpIexRSab9Q8M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDED3F80558;
	Fri, 28 Oct 2022 22:56:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88671F804DF; Fri, 28 Oct 2022 22:55:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1022F8016A
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 22:55:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1022F8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="gVADpfkI"
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk
 [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9DDD76602946;
 Fri, 28 Oct 2022 21:55:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1666990555;
 bh=kjJv2wI4r1COdPJDLysFujzo37yIvD0eiCbT/D7WY8Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gVADpfkI9YN8wvlcRgrsvTvdm8VyxolhpHN7+2z3ao+LKiotKKSHsYNVuoUFAh/X5
 ncUKhS0W2QJK0rnAK9M2Sp2D6+GfW+EtzDfDgpQyywPigP79gyWm1kGgGYzFhydyMP
 kjYlMenwb/GMAlTOrL1tgeoPOoLr7LMJPPIu4xH9IvcsHqDk6AXdcxs5SI4Mgc0OOw
 xxUN+QMiWsSbzESkpU+7viNdCpv1BUrC0GXVNOezS/xbb2CyuLjhaisxxTmgBgDqqc
 /M8/Awa1tJIQTDSnYKD1ENE4fwv8exUmDkeFZPoln8BPcQ5AFYuMIrp8nO2cb/Z/3n
 WH75CERAEuSFA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Subject: [PATCH 4/8] ASoC: dt-bindings: rt5682: Add dbvdd and ldo1-in supplies
Date: Fri, 28 Oct 2022 16:55:36 -0400
Message-Id: <20221028205540.3197304-5-nfraprado@collabora.com>
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

The rt5682 codec has two additional power supply pins, DBVDD and
LDO1_IN, that aren't currently described in the binding. Add them.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

 Documentation/devicetree/bindings/sound/rt5682.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/rt5682.txt b/Documentation/devicetree/bindings/sound/rt5682.txt
index 89e6245b870e..948109ff0db3 100644
--- a/Documentation/devicetree/bindings/sound/rt5682.txt
+++ b/Documentation/devicetree/bindings/sound/rt5682.txt
@@ -17,6 +17,12 @@ Required properties:
 - VBAT-supply: phandle to the regulator supplying battery power through the
   VBAT pin. Either MICVDD or VBAT should be present.
 
+- dbvdd-supply: phandle to the regulator supplying I/O power through the DBVDD
+  pin.
+
+- ldo1-in-supply: phandle to the regulator supplying power to the digital core
+  and charge pump through the LDO1_IN pin.
+
 Optional properties:
 
 - interrupts : The CODEC's interrupt output.
@@ -87,4 +93,6 @@ rt5682 {
 
 	AVDD-supply = <&avdd_reg>;
 	MICVDD-supply = <&micvdd_reg>;
+	dbvdd-supply = <&dbvdd_reg>;
+	ldo1-in-supply = <&ldo1_in_reg>;
 };
-- 
2.38.1

