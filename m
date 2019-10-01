Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF729C3388
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 13:57:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 645891657;
	Tue,  1 Oct 2019 13:56:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 645891657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569931064;
	bh=euCqUfWxE3+31aLProQGxphK1P74liJlu8orwd7T9io=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=sOHy/kOwY2OGr9L1zwhcP3kNj/BiL9y/XV5sfiNNzdhK+B08Ez+jVOXJSYZkG0YDI
	 Qowvp4NvZV1a4VjiQsXnPIgWGUMFOTuELI86SiqdW9+PKhTY/OzE1Z5l2GzjwgbLr8
	 4dG4AGsHeZnXJJptRi0Cm5zidzrMJWZjFDullDO0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FDE8F8086C;
	Tue,  1 Oct 2019 13:41:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23372F806F8; Tue,  1 Oct 2019 13:41:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28E75F8060F
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 13:40:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28E75F8060F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="tCb9X5iS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=fST/AH+GOt2GHguW9Cy53gJrYgbzWWwyPXEqzuvSsEs=; b=tCb9X5iSdz0b
 Xn1KGOQTBvZ2Z6OVme0fjPxRVkv5AEjseEShBXVJMwGRdua+NxRxVeWRY0ZQQ+TAdA4vdPZdGo0gV
 A4jbN5nN+OwUmDI4e0LUa5vnuad2n0YS/DDUV8xELsEVOmGdCmQ+FqEFgbyhoOzvuddfSngWrAUfG
 NRjAE=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iFGWQ-0004UX-V9; Tue, 01 Oct 2019 11:40:51 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 5D7C527429C0; Tue,  1 Oct 2019 12:40:50 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
In-Reply-To: <20190920130218.32690-7-s.nawrocki@samsung.com>
X-Patchwork-Hint: ignore
Message-Id: <20191001114050.5D7C527429C0@ypsilon.sirena.org.uk>
Date: Tue,  1 Oct 2019 12:40:50 +0100 (BST)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, ckeepax@opensource.cirrus.com,
 b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, Krzysztof Kozlowski <krzk@kernel.org>, robh+dt@kernel.org,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 m.szyprowski@samsung.com
Subject: [alsa-devel] Applied "ASoC: dt-bindings: Document "samsung,
	arndale-wm1811" compatible" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: dt-bindings: Document "samsung, arndale-wm1811" compatible

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From f4528af69fdc112247a78599c6e8f7f618aff4e6 Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Fri, 20 Sep 2019 15:02:15 +0200
Subject: [PATCH] ASoC: dt-bindings: Document "samsung, arndale-wm1811"
 compatible

Add compatible string for boards with WM1811 CODEC to the list.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Link: https://lore.kernel.org/r/20190920130218.32690-7-s.nawrocki@samsung.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/devicetree/bindings/sound/arndale.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/arndale.txt b/Documentation/devicetree/bindings/sound/arndale.txt
index 0e76946385ae..17530120ccfc 100644
--- a/Documentation/devicetree/bindings/sound/arndale.txt
+++ b/Documentation/devicetree/bindings/sound/arndale.txt
@@ -1,8 +1,9 @@
 Audio Binding for Arndale boards
 
 Required properties:
-- compatible : Can be the following,
-			"samsung,arndale-rt5631"
+- compatible : Can be one of the following:
+		"samsung,arndale-rt5631",
+		"samsung,arndale-wm1811"
 
 - samsung,audio-cpu: The phandle of the Samsung I2S controller
 - samsung,audio-codec: The phandle of the audio codec
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
