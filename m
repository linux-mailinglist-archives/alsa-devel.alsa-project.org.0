Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85133D91D6
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Oct 2019 15:01:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 143A31654;
	Wed, 16 Oct 2019 15:00:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 143A31654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571230869;
	bh=4XgY+X6FpfdEGVT6w9IvbawuMzaMWlXo8tkKaqynDtY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=guVIDZiBBP3kAy14BQIYCPTUpjDrC0fMh1SYiYNNe1UuyAZ0xdmXbdVFrRxp8Ap+h
	 aXhHAzjLQbaadhklnAC0MvXDoHn2Fjuo4B6Rlb8bZ8H4UOVfK1ldectCnFaqMHR93s
	 pTPRzJPlEoQUcEuztTluanOxMczAFRLzgXeOMuYU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2636EF8060D;
	Wed, 16 Oct 2019 14:58:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51344F80445; Wed, 16 Oct 2019 14:58:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_21,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80E58F8036C
 for <alsa-devel@alsa-project.org>; Wed, 16 Oct 2019 14:58:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80E58F8036C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="gExDv11/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=IMV6sxNZsTQbAoCY4QWWlPLCw3v2Erjb3kK1XV7RnoE=; b=gExDv11/E/Lz
 onlO9Z7uV0xfpfU9MDBGC3Nepa5ymqllCL22EyGWw5xdfcQxRbawxWuLKM9TVgqyp1BN1EOrgZFvW
 3YqzoVSdwNfW2Xkg3Q4PvNlvbuRwt7AWBXwHVgU7Hp1SA+4Cb7dOysMtN2P3n7fAIh+5yiBvCJnps
 x88pE=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iKisX-0005MO-No; Wed, 16 Oct 2019 12:58:13 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 31AD92742162; Wed, 16 Oct 2019 13:58:13 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Shuming Fan <shumingf@realtek.com>
In-Reply-To: <20191016115617.23213-1-shumingf@realtek.com>
X-Patchwork-Hint: ignore
Message-Id: <20191016125813.31AD92742162@ypsilon.sirena.org.uk>
Date: Wed, 16 Oct 2019 13:58:13 +0100 (BST)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, cychiang@google.com, lgirdwood@gmail.com,
 Mark Brown <broonie@kernel.org>, derek.fang@realtek.com, flove@realtek.com
Subject: [alsa-devel] Applied "ASoC: dt-bindings: rt1011: add r0 and
	temperature device property" to the asoc tree
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

   ASoC: dt-bindings: rt1011: add r0 and temperature device property

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

From cf775f68a0939f0e5aad5855f63338c4b5e51c59 Mon Sep 17 00:00:00 2001
From: Shuming Fan <shumingf@realtek.com>
Date: Wed, 16 Oct 2019 19:56:17 +0800
Subject: [PATCH] ASoC: dt-bindings: rt1011: add r0 and temperature device
 property

Typically, the r0 (calibration data) and temperature were measured in the factory.
This information is written into the non-volatile area
where keeps data whether factory reset or OS update.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
Link: https://lore.kernel.org/r/20191016115617.23213-1-shumingf@realtek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/devicetree/bindings/sound/rt1011.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/rt1011.txt b/Documentation/devicetree/bindings/sound/rt1011.txt
index 35a23e60d679..02d53b9aa247 100644
--- a/Documentation/devicetree/bindings/sound/rt1011.txt
+++ b/Documentation/devicetree/bindings/sound/rt1011.txt
@@ -20,6 +20,14 @@ Required properties:
         |     1     |    1     |   0x3b     |
         -------------------------------------
 
+Optional properties:
+
+- realtek,temperature_calib
+  u32. The temperature was measured while doing the calibration. Units: Celsius degree
+
+- realtek,r0_calib
+  u32. This is r0 calibration data which was measured in factory mode.
+
 Pins on the device (for linking into audio routes) for RT1011:
 
   * SPO
@@ -29,4 +37,6 @@ Example:
 rt1011: codec@38 {
 	compatible = "realtek,rt1011";
 	reg = <0x38>;
+	realtek,temperature_calib = <25>;
+	realtek,r0_calib = <0x224050>;
 };
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
