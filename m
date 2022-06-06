Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DC253E572
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 17:26:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EF8E18F1;
	Mon,  6 Jun 2022 17:26:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EF8E18F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654529215;
	bh=n0n0WtLdjHGysi7HQyXylTbROYN14VH5/Fz95ISJfNs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lZEcQcaTWxrENK/TjyIkVqhK3gGW8rohYPqvCOZBUYCvEXnJz1JAYs+X9R55zHieX
	 Ds5PLDkONEbW9KH7nAXU4gzujnY4IEhJPooBHB7VzniZG0+CLpNxpPKKDk0bql0H+T
	 o3wUZZocjL6jNacxIGoPm6Qx6js4Vdi/Orpf+vHw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84EF9F80310;
	Mon,  6 Jun 2022 17:25:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C559F80310; Mon,  6 Jun 2022 17:25:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8414F80116
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 17:25:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8414F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SyRBV2TJ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B02B861549;
 Mon,  6 Jun 2022 15:25:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25D91C341EE;
 Mon,  6 Jun 2022 15:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654529149;
 bh=n0n0WtLdjHGysi7HQyXylTbROYN14VH5/Fz95ISJfNs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SyRBV2TJCk+cQ7Tdrw7NUuwMMWYDrQ2+swwAFUxrhnBVuxYgGXg9DCvfIB6fWOWJw
 OcF4mG0EBO7ZCQMoRLmtmACaUEaF5jTA6TyjUHpThe5/ya+ni4NwynVkN3e1ySBxey
 rni5yMAcAKraS72ibpwoH1EUdlc03pdZRqTZwK7d5KTAh5vZVq1tpBBv910ZRvddfy
 45t6H0OD4acfBGpQsSAuxeEPS6vchhtVYHvj6lAfYSJAmcQbYFI79DFftY1IqZwZll
 nfdRvrOQwP0WZekD5Jp9Mf9PWn4RQpH0UfU4n72o/DYzLEJ4fdT3Cn74hRW/Bb2IKo
 AZjLb8cHU9FZQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1nyEby-0012Q5-Fh;
 Mon, 06 Jun 2022 16:25:46 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 22/23] ASoC: wm8731: update wlf,wm8731.yaml reference
Date: Mon,  6 Jun 2022 16:25:44 +0100
Message-Id: <e56e54fe0ebb1b6e8dd2e245c398190016eb0a34.1654529011.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1654529011.git.mchehab@kernel.org>
References: <cover.1654529011.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org
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

Changeset 0e336eeaf467 ("ASoC: wm8731: Convert DT bindings to YAML format")
renamed: Documentation/devicetree/bindings/sound/wm8731.txt
to: Documentation/devicetree/bindings/sound/wlf,wm8731.yaml.

Update its cross-reference accordingly.

Fixes: 0e336eeaf467 ("ASoC: wm8731: Convert DT bindings to YAML format")
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/23] at: https://lore.kernel.org/all/cover.1654529011.git.mchehab@kernel.org/

 .../devicetree/bindings/sound/atmel-sam9x5-wm8731-audio.txt     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/atmel-sam9x5-wm8731-audio.txt b/Documentation/devicetree/bindings/sound/atmel-sam9x5-wm8731-audio.txt
index 0720857089a7..8facbce53db8 100644
--- a/Documentation/devicetree/bindings/sound/atmel-sam9x5-wm8731-audio.txt
+++ b/Documentation/devicetree/bindings/sound/atmel-sam9x5-wm8731-audio.txt
@@ -16,7 +16,7 @@ Board connectors:
  * Line In Jack
 
 wm8731 pins:
-cf Documentation/devicetree/bindings/sound/wm8731.txt
+cf Documentation/devicetree/bindings/sound/wlf,wm8731.yaml
 
 Example:
 sound {
-- 
2.36.1

