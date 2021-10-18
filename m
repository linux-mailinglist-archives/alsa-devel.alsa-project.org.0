Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE93E431E91
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Oct 2021 16:00:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44C17174F;
	Mon, 18 Oct 2021 15:59:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44C17174F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634565638;
	bh=dQHKAO1m/LNuwICjj9WzoXKGhj6SR1qmagedc91L/wk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gjyGjSs1I96UlutPKrnjlKK4BtwgAT9awnki6a1UCIbtE65iKKT3oZNmezeiN8I2a
	 DLYW9o+HZLSK019vSBnzyOsBUg75gsUmpS9WEkxyP8edNJbPp/RUqrcuGqfoaUSIll
	 Y7ZZLi1Wsk5eSzQVULsBFrXL1fX/sFLkWqrJUtuw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A27A4F802DF;
	Mon, 18 Oct 2021 15:59:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05F64F801DB; Mon, 18 Oct 2021 15:59:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 PRX_BODY_135, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62280F801DB
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 15:59:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62280F801DB
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:e87a:7c37:aec5:5884])
 by xavier.telenet-ops.be with bizsmtp
 id 7RzA2600C22VXnz01RzAJc; Mon, 18 Oct 2021 15:59:10 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mcTAU-005uyZ-3E; Mon, 18 Oct 2021 15:59:10 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mcTAT-00DdiU-9g; Mon, 18 Oct 2021 15:59:09 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Adam Ford <aford173@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, patches@opensource.cirrus.com
Subject: [PATCH 0/2] ASoC: wm8962: Conversion to json-schema and fix
Date: Mon, 18 Oct 2021 15:59:01 +0200
Message-Id: <cover.1634565154.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
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

	Hi all,

This patch series converts the Wolfson WM8962 Device Tree binding
documentation to json-schema, after fixing an issue in the imx8mn-beacon
DTS file.

Thanks for your comments!

Geert Uytterhoeven (2):
  arm64: dts: imx: imx8mn-beacon: Drop undocumented clock-names
    reference
  ASoC: dt-bindings: wlf,wm8962: Convert to json-schema

 .../devicetree/bindings/sound/wlf,wm8962.yaml | 118 ++++++++++++++++++
 .../devicetree/bindings/sound/wm8962.txt      |  43 -------
 .../freescale/imx8mn-beacon-baseboard.dtsi    |   1 -
 3 files changed, 118 insertions(+), 44 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8962.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/wm8962.txt

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
