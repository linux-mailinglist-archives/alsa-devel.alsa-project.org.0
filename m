Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4D8607EBF
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Oct 2022 21:11:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7024A82A;
	Fri, 21 Oct 2022 21:10:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7024A82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666379463;
	bh=TSzB9s/nYLhBExyStCN6t0/NJr0MxrTNQOpVLK8HItQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o1temQrWVyLrqhnxIF9xx919qtcWUI4DiSPk56s9I0SdZYNMLgCLB0OcPOtfW5ET0
	 PNL1PfDIwBpcq+YHVC0tf2Rc3edogc3E1xrhfIL9PBr1ZzwnJb+wYWIrFM7IvciDVI
	 LqBSeLvmvXnFr75EWos2dI5mRzEjHzRoHdGfnoUo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF4C4F80557;
	Fri, 21 Oct 2022 21:09:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38358F80553; Fri, 21 Oct 2022 21:09:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C637F8053C
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 21:09:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C637F8053C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="f7Q8hxro"
Received: from notapiano.myfiosgateway.com (unknown
 [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0F2B866025DF;
 Fri, 21 Oct 2022 20:09:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1666379358;
 bh=TSzB9s/nYLhBExyStCN6t0/NJr0MxrTNQOpVLK8HItQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f7Q8hxrolHCXqkoQxqQfkVh/NJ6dOT90S8sE0RxXfxzzzpq92P9/xuguTgU8NEqn4
 rAG0Ea15bDF/myzfJs9Nwgrk046HdFo7r/zZjF9ek4kxPekv9sI9Ve/j8Vg+G0HCNl
 /nBMVRyIB3UKQrSxFUlfeE3/p1sZf9HmqfXJZEANOViwDZEoYuo16O/ClyQYc+q92H
 yu6V6kSHXlQRLfpclTWw28+DD/NRmKkBCPtavzluivXxDI4Y6ez340z7qvVP+Ol9Ny
 Le16K8HyW3uNf6MIZlBx++r/JocAc8AC2sa4YKavd9m2gIWmgCuTshxnNSA3r7ry/m
 9D1ef9zLR9Hhg==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 3/3] ASoC: dt-bindings: rt5682: Add AVDD,
 MICVDD and VBAT supplies
Date: Fri, 21 Oct 2022 15:09:08 -0400
Message-Id: <20221021190908.1502026-4-nfraprado@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221021190908.1502026-1-nfraprado@collabora.com>
References: <20221021190908.1502026-1-nfraprado@collabora.com>
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

The rt5682 codec can have three supplies: AVDD, MICVDD and VBAT. Add
properties for them.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

 Documentation/devicetree/bindings/sound/rt5682.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/rt5682.txt b/Documentation/devicetree/bindings/sound/rt5682.txt
index c5f2b8febcee..5ccf4eaf12a9 100644
--- a/Documentation/devicetree/bindings/sound/rt5682.txt
+++ b/Documentation/devicetree/bindings/sound/rt5682.txt
@@ -48,6 +48,12 @@ Optional properties:
 
 - #sound-dai-cells: Should be set to '<0>'.
 
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

