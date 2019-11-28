Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A701E10C963
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Nov 2019 14:22:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D96D16D0;
	Thu, 28 Nov 2019 14:21:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D96D16D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574947336;
	bh=ac5BnkTGIi4dVbcpR+gvSf+ORxaksrYWN7E65kT/1wg=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=qi6QwS2qZaKae/owf0tLTGwh/k+12bWYrMDR3d2OcBZKhL0GRZnUOJnpbR2rjgLmA
	 Z+55DeLu4PFwCKeMms9iPwl9iuModbkfZbxCSwwidklzlkJBLNXauyhbanrs2yV6RK
	 c+rrlxDGc6wQ8bs1TZeSLQBKXpaJnmD6KP0soPE4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0031F8022D;
	Thu, 28 Nov 2019 14:18:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 313B4F80213; Thu, 28 Nov 2019 14:18:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 4CD74F801ED
 for <alsa-devel@alsa-project.org>; Thu, 28 Nov 2019 14:18:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CD74F801ED
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7FCD131B;
 Thu, 28 Nov 2019 05:18:30 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F38E63F52E;
 Thu, 28 Nov 2019 05:18:29 -0800 (PST)
Date: Thu, 28 Nov 2019 13:18:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Michael Walle <michael@walle.cc>
In-Reply-To: <20191122232532.22258-1-michael@walle.cc>
Message-Id: <applied-20191122232532.22258-1-michael@walle.cc>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: wm8904: fix automatic sysclk
	configuration" to the asoc tree
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

   ASoC: wm8904: fix automatic sysclk configuration

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

From 2a0bda276c64212e517cc1d65cf65719a9ab1ef6 Mon Sep 17 00:00:00 2001
From: Michael Walle <michael@walle.cc>
Date: Sat, 23 Nov 2019 00:25:32 +0100
Subject: [PATCH] ASoC: wm8904: fix automatic sysclk configuration

The simple-card tries to signal the codec to disable rate constraints,
see commit 2458adb8f92a ("SoC: simple-card-utils: set 0Hz to sysclk when
shutdown"). This wasn't handled by the codec, instead it would set the
FLL frequency to 0Hz which isn't working. Since we don't have any rate
constraints just ignore this request.

Fixes: 13409d27cb39 ("ASoC: wm8904: configure sysclk/FLL automatically")
Signed-off-by: Michael Walle <michael@walle.cc>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20191122232532.22258-1-michael@walle.cc
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8904.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/codecs/wm8904.c b/sound/soc/codecs/wm8904.c
index 2a7d23a5daa8..d191d81850ee 100644
--- a/sound/soc/codecs/wm8904.c
+++ b/sound/soc/codecs/wm8904.c
@@ -1806,6 +1806,12 @@ static int wm8904_set_sysclk(struct snd_soc_dai *dai, int clk_id,
 
 	switch (clk_id) {
 	case WM8904_CLK_AUTO:
+		/* We don't have any rate constraints, so just ignore the
+		 * request to disable constraining.
+		 */
+		if (!freq)
+			return 0;
+
 		mclk_freq = clk_get_rate(priv->mclk);
 		/* enable FLL if a different sysclk is desired */
 		if (mclk_freq != freq) {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
