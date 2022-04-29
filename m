Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 861FB5155B1
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Apr 2022 22:32:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6E3F1630;
	Fri, 29 Apr 2022 22:31:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6E3F1630
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651264358;
	bh=TGXOnKC566KySlgE7TthYsPemPWKYachLNySsPYvAsg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pFe3QUY+4Aa410d3WpiWRHmsX3ruOCeFMHwHO560r87cprPZU2nmbTJMgS9Gp35yk
	 FyCvf7z6H4g+Tnfb7NyYmyPgBekMz7ebTRaO8aywm8RV9UXGtXTls35t8pQjM2e85l
	 LJYSqcc8liHnXXVd4II4lke+5lmPyidSZXrGrWzQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1D64F804FE;
	Fri, 29 Apr 2022 22:31:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A9E8F804FD; Fri, 29 Apr 2022 22:31:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C998F8047B
 for <alsa-devel@alsa-project.org>; Fri, 29 Apr 2022 22:30:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C998F8047B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="JGBsEe1e"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 8504F1F469DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651264256;
 bh=TGXOnKC566KySlgE7TthYsPemPWKYachLNySsPYvAsg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JGBsEe1eRAd8NEWxwWO63Bgl5dZPFLGJlFdaRgKMETqsbNVgwXwcRfRlEFgcJJCyS
 ooSnwfpyncNz0b9V2AU76cO2jhtczgyap0FFpH/nIMS1NmP6xcx16YzEak2F/OUwYQ
 PgUgwY8wePE7RHEdwIuyqlLyM1e640JeXNvHWhG+dTcBPE/ZMTrDJEsCCKdjxLrg+C
 Si1Z4cK7N0emfsOSCGIMsZ9jcHJTj+FNk400VBay/6N+CnuPZ8D12I7/6w1S5HinvZ
 on70teL+QK4YgcrORHVrjzo4PXuPOjhTwo+xhyHngAwqz/7xq/xP/T33A/GHQbXv96
 IE6c3nISQweTA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 3/3] ASoC: dt-bindings: rt5682: Add #sound-dai-cells
Date: Fri, 29 Apr 2022 16:30:39 -0400
Message-Id: <20220429203039.2207848-4-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220429203039.2207848-1-nfraprado@collabora.com>
References: <20220429203039.2207848-1-nfraprado@collabora.com>
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

The rt5682 codec can be pointed to through a sound-dai property to be
used as part of a machine sound driver. dtc expects #sound-dai-cells to
be defined in the codec's node in those cases, so add it in the
dt-binding and set it to 0.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

 Documentation/devicetree/bindings/sound/rt5682.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/rt5682.txt b/Documentation/devicetree/bindings/sound/rt5682.txt
index cd8c53d8497e..c5f2b8febcee 100644
--- a/Documentation/devicetree/bindings/sound/rt5682.txt
+++ b/Documentation/devicetree/bindings/sound/rt5682.txt
@@ -46,6 +46,8 @@ Optional properties:
 
 - realtek,dmic-clk-driving-high : Set the high driving of the DMIC clock out.
 
+- #sound-dai-cells: Should be set to '<0>'.
+
 Pins on the device (for linking into audio routes) for RT5682:
 
   * DMIC L1
-- 
2.36.0

