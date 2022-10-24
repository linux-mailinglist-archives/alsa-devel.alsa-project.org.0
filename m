Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E90660BCF4
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Oct 2022 00:02:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B80474C9D;
	Tue, 25 Oct 2022 00:01:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B80474C9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666648928;
	bh=Cl6GfsphAxiCZ5E3D8HAUPBm74fyX9J6KcBotnOQmDA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DamLSvuEnQSuLq1Xn0xpx8n+sjlGUPwZ7upsmeV/L+pUh+12pgMjOEMwuYNM6JitM
	 Ml3yEu6tVD0KWDWuDWlMVFaDOA3H7itNrFcF7ujoibnins1c1OIkl/Sa1drgAtQGaQ
	 HQqiB3OkG8Am5rOaZ/HzwkPWQftv9HHD4Mg5XTB8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06A9BF8052F;
	Tue, 25 Oct 2022 00:00:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27035F8055B; Tue, 25 Oct 2022 00:00:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDACFF80557
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 00:00:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDACFF80557
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="ID3qXsFm"
Received: from notapiano.myfiosgateway.com (unknown [194.36.25.51])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 09649660282D;
 Mon, 24 Oct 2022 23:00:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1666648831;
 bh=Cl6GfsphAxiCZ5E3D8HAUPBm74fyX9J6KcBotnOQmDA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ID3qXsFmihkJuT+GTXBzA5+5DC55otTvA1xCDJvqSYN6rB4jJkspdl773YLHV98sT
 Q8ommXuT/UfwNpHH2N/43mAyIh/NYP7yvEnu6HK/+o1Q7dOHlTVU4vkIVqsShm8xFi
 Wmbk67eDUYb/uO0sbBvMbiXFlmY2CdY/vwhE1lhU7j4JMz5Ovimt5Plu8psCiMe3kZ
 AvceS+K9Eqe6X7JCt5hY/86oLTaXjsJKBPXnKmhNx+zS2kDJzOZva1CZ/RFjlc78SC
 KPcvyfcCWuRbOhxu1MBuPnMFS0Hu827T5Zw8J87M5+mtj5oiapGqmtxg52+j4U4Bub
 nnYTwsN6eWEMA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 4/4] ASoC: dt-bindings: rt5682: Add AVDD,
 MICVDD and VBAT supplies
Date: Mon, 24 Oct 2022 18:00:15 -0400
Message-Id: <20221024220015.1759428-5-nfraprado@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221024220015.1759428-1-nfraprado@collabora.com>
References: <20221024220015.1759428-1-nfraprado@collabora.com>
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

The rt5682 codec can have three supplies: AVDD, MICVDD and VBAT. They
are already used by sc7180-trogdor.dtsi, so document them in the
binding.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

Changes in v2:
- Added mention that property is already used in a DT to the commit
  message

 Documentation/devicetree/bindings/sound/rt5682.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/rt5682.txt b/Documentation/devicetree/bindings/sound/rt5682.txt
index 6b87db68337c..c07a1fc7b122 100644
--- a/Documentation/devicetree/bindings/sound/rt5682.txt
+++ b/Documentation/devicetree/bindings/sound/rt5682.txt
@@ -48,6 +48,12 @@ Optional properties:
 
 - #sound-dai-cells: Should be set to '<1>'.
 
+- AVDD-supply: phandle to the regulator supplying AVDD
+
+- MICVDD-supply: phandle to the regulator supplying MICVDD
+
+- VBAT-supply: phandle to the regulator supplying VBAT
+
 Pins on the device (for linking into audio routes) for RT5682:
 
   * DMIC L1
-- 
2.38.1

