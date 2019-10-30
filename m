Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D639FE9D5B
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Oct 2019 15:21:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 365CB232A;
	Wed, 30 Oct 2019 15:21:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 365CB232A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572445317;
	bh=fCxfDfdL82Mez5n5l5VIuZLo4OD9Eu1e+ocSd3QV/80=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=NYkxp2qWCSt+YtDCydEotGdVFCUKIfD+tJzb2HzEv558RzetiTgfQkxEA96y9BGET
	 A+ZORsBG20qWz7CEBvAMnxai/mGqgno0r5FGn69eMyzUYvuj9Gm0PHVhyV40kTpNY3
	 e84MRSC1VALavBjaE539+pqDJiMPkVVHfJPik+W4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B39BF8048F;
	Wed, 30 Oct 2019 15:19:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E7ACF8015A; Wed, 30 Oct 2019 15:16:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 110B3F802A1
 for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2019 15:16:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 110B3F802A1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="EC5kaQpu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=RrLCG2xyQki8m8qtxkI6aM6uYjfEvxOhe+gidiqj6lw=; b=EC5kaQpuQ61t
 m/Q6CpMKWy1bjs/gLb9I88xxAAR9Ij/2hQV5+U2ifRsuyLHG+dOG84SHCKAScEbNc8ZfGWtTySOlS
 2n1UH+HoNzp4OE/V5UM2clVDJ7EAZ9h6PbrfHcV0ZVp5WVE/x+5WeYmYmw2IYxZcuPZsPiK++UhF2
 Chp7g=;
Received: from [195.11.164.221] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iPolz-0005Cf-3i; Wed, 30 Oct 2019 14:16:31 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id A477BD020A6; Wed, 30 Oct 2019 14:16:30 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Shuming Fan <shumingf@realtek.com>
In-Reply-To: <20191030085556.14351-1-shumingf@realtek.com>
X-Patchwork-Hint: ignore
Message-Id: <20191030141630.A477BD020A6@fitzroy.sirena.org.uk>
Date: Wed, 30 Oct 2019 14:16:30 +0000 (GMT)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>,
 derek.fang@realtek.com, sathya.prakash.m.r@intel.com, flove@realtek.com
Subject: [alsa-devel] Applied "ASoC: dt-bindings: rt5682: add button delay
	device property" to the asoc tree
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

   ASoC: dt-bindings: rt5682: add button delay device property

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

From 059c67f11c897a10e447d9802ace1a2069ae1b83 Mon Sep 17 00:00:00 2001
From: Shuming Fan <shumingf@realtek.com>
Date: Wed, 30 Oct 2019 16:55:56 +0800
Subject: [PATCH] ASoC: dt-bindings: rt5682: add button delay device property

The btndet-delay device property could control the HW debounce time.
It is easy to adjust the sensitivity of push button.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
Link: https://lore.kernel.org/r/20191030085556.14351-1-shumingf@realtek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/devicetree/bindings/sound/rt5682.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/rt5682.txt b/Documentation/devicetree/bindings/sound/rt5682.txt
index 312e9a129530..30e927a28369 100644
--- a/Documentation/devicetree/bindings/sound/rt5682.txt
+++ b/Documentation/devicetree/bindings/sound/rt5682.txt
@@ -27,6 +27,11 @@ Optional properties:
 
 - realtek,ldo1-en-gpios : The GPIO that controls the CODEC's LDO1_EN pin.
 
+- realtek,btndet-delay
+  The debounce delay for push button.
+  The delay time is realtek,btndet-delay value multiple of 8.192 ms.
+  If absent, the default is 16.
+
 Pins on the device (for linking into audio routes) for RT5682:
 
   * DMIC L1
@@ -47,4 +52,5 @@ rt5682 {
 	realtek,dmic1-data-pin = <1>;
 	realtek,dmic1-clk-pin = <1>;
 	realtek,jd-src = <1>;
+	realtek,btndet-delay = <16>;
 };
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
