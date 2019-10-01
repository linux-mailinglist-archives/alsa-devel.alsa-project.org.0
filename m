Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E72C333E
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 13:47:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 635771694;
	Tue,  1 Oct 2019 13:46:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 635771694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569930464;
	bh=lWY5Bko7opVJeU1SgR3apVYSoygK4Xbvs5NToNninQM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=rqAcf7Nexa+PmwmBl/JJvdDTCVzlfPHKZYktEpDF+geLq7LRNGrBihvm67wXXA2Lj
	 Fp+yS90I6CYn279px295uBFbfixBw69fJ9j5irkNSwkf6/2+vUwDIgTcPzfH9WdluE
	 M7jyhOQW4ObbrLlbjuzfoiP4UuxYBROXeEJF1kzw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 388A9F8060F;
	Tue,  1 Oct 2019 13:41:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0ADC8F80674; Tue,  1 Oct 2019 13:40:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3598F805FA
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 13:40:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3598F805FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Frr2ZOaa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=VNyirlbo32jI74Gnx32OywMdUtsIIVh9GP/R2nfj/v4=; b=Frr2ZOaaFUYE
 74AZiv+7tXVoVcLD8SeKaeizv+IwZT9V8NkQbKn9ZhuZdIbgv8afh5XkVA691S0QcK/UyhFYZWl7V
 /gqm+ZR1ERucCEYN02wfVo/BfigXg+PNU0MuxySHuBf94VWF+oUgTnZVlFfy3Q4r08hhJFTt/y/NY
 iJALc=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iFGWO-0004TJ-O0; Tue, 01 Oct 2019 11:40:48 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 3491227429C0; Tue,  1 Oct 2019 12:40:48 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Frank Shi <shifu0704@thundersoft.com>
In-Reply-To: <1568962709-19185-1-git-send-email-shifu0704@thundersoft.com>
X-Patchwork-Hint: ignore
Message-Id: <20191001114048.3491227429C0@ypsilon.sirena.org.uk>
Date: Tue,  1 Oct 2019 12:40:48 +0100 (BST)
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, linux-kernel@vger.kernel.org,
 navada@ti.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 Mark Brown <broonie@kernel.org>, dmurphy@ti.com
Subject: [alsa-devel] Applied "dt-bindings: ASoC: Add tas2770 smart PA dt
	bindings" to the asoc tree
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

   dt-bindings: ASoC: Add tas2770 smart PA dt bindings

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

From 4b7151dadfd450b837b6b28073ad9f19f4a7547c Mon Sep 17 00:00:00 2001
From: Frank Shi <shifu0704@thundersoft.com>
Date: Fri, 20 Sep 2019 14:58:28 +0800
Subject: [PATCH] dt-bindings: ASoC: Add tas2770 smart PA dt bindings

Add tas2770 smart PA dt bindings

Signed-off-by: Frank Shi <shifu0704@thundersoft.com>
Link: https://lore.kernel.org/r/1568962709-19185-1-git-send-email-shifu0704@thundersoft.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../devicetree/bindings/sound/tas2770.txt     | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/tas2770.txt

diff --git a/Documentation/devicetree/bindings/sound/tas2770.txt b/Documentation/devicetree/bindings/sound/tas2770.txt
new file mode 100644
index 000000000000..ede6bb3d9637
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/tas2770.txt
@@ -0,0 +1,37 @@
+Texas Instruments TAS2770 Smart PA
+
+The TAS2770 is a mono, digital input Class-D audio amplifier optimized for
+efficiently driving high peak power into small loudspeakers.
+Integrated speaker voltage and current sense provides for
+real time monitoring of loudspeaker behavior.
+
+Required properties:
+
+ - compatible:	   - Should contain "ti,tas2770".
+ - reg:		       - The i2c address. Should contain <0x4c>, <0x4d>,<0x4e>, or <0x4f>.
+ - #address-cells  - Should be <1>.
+ - #size-cells     - Should be <0>.
+ - ti,asi-format:  - Sets TDM RX capture edge. 0->Rising; 1->Falling.
+ - ti,imon-slot-no:- TDM TX current sense time slot.
+ - ti,vmon-slot-no:- TDM TX voltage sense time slot.
+
+Optional properties:
+
+- interrupt-parent: the phandle to the interrupt controller which provides
+                     the interrupt.
+- interrupts: interrupt specification for data-ready.
+
+Examples:
+
+    tas2770@4c {
+                compatible = "ti,tas2770";
+                reg = <0x4c>;
+                #address-cells = <1>;
+                #size-cells = <0>;
+                interrupt-parent = <&msm_gpio>;
+                interrupts = <97 0>;
+                ti,asi-format = <0>;
+                ti,imon-slot-no = <0>;
+                ti,vmon-slot-no = <2>;
+        };
+
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
