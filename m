Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1587489F9B
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2019 15:25:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E5D3167F;
	Mon, 12 Aug 2019 15:24:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E5D3167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565616312;
	bh=yVGowx1jrf7au6v/fTAda4Xc0yr5xalhg2MTTx7i2sE=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ngpUafSZm/Tna3WKnSbE/4RKeIGmO8oto3J/H62A+wyuvGx/nWdUqi/hX2ceksdzu
	 N0NLmr8kCySV8AxPixiy1XVPe7Hp+CMw6dw9Ke7hL6ATgCmkvB5tqHPOiKa62/Ohhr
	 w30jaLuwDka1wy0XDz8NPl8DprO429tGYnjAseao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54AABF80678;
	Mon, 12 Aug 2019 15:16:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56636F800F6; Mon, 12 Aug 2019 15:10:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D2D6F805F9
 for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2019 15:09:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D2D6F805F9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="IAnqxtHq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=F0gmxUAAjWJnRglc2Yf6S4DQe+WJTYChMRg+co4GZNE=; b=IAnqxtHqt+LB
 RtnX1T5uV+NdtUfIrFKdWxL8HtfvzILca5PdW/yxZ5jEuLaoytGqYEfZ1ez+1Vr7W5H1dr8M4n9Lr
 H3GAuTU1uLQxqbdoVAaKeGU2Nz6zb3TgUUlNg7k6nsiDbCkQHEnc0iCpEUFl+abHXZTO3E6hy/J24
 T7P4E=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hxA5A-0001MB-1H; Mon, 12 Aug 2019 13:09:52 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 683732740CED; Mon, 12 Aug 2019 14:09:51 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Curtis Malainey <cujomalainey@chromium.org>
In-Reply-To: <20190809215952.155660-1-cujomalainey@chromium.org>
X-Patchwork-Hint: ignore
Message-Id: <20190812130951.683732740CED@ypsilon.sirena.org.uk>
Date: Mon, 12 Aug 2019 14:09:51 +0100 (BST)
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <bardliao@realtek.com>
Subject: [alsa-devel] Applied "ASoC: rt5677: Revert remove superfluous set"
	to the asoc tree
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

   ASoC: rt5677: Revert remove superfluous set

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From ae032156ec4142b7a1d644eba652806785de1777 Mon Sep 17 00:00:00 2001
From: Curtis Malainey <cujomalainey@chromium.org>
Date: Fri, 9 Aug 2019 14:59:51 -0700
Subject: [PATCH] ASoC: rt5677: Revert remove superfluous set

Commit 4dc057a786dc23 ("ASoC: rt5677: remove superfluous set") was an
attempted code cleanup but was incorrectly tested before sent and
actually breaks the interrupt since it never resets the value on each
loop now. The breakage is most testable when hotwording code is added
and also uses the interrupt.

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
Link: https://lore.kernel.org/r/20190809215952.155660-1-cujomalainey@chromium.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt5677.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index deaed5132dc9..c779dc3474f9 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -5098,6 +5098,7 @@ static irqreturn_t rt5677_irq(int unused, void *data)
 			goto exit;
 		}
 
+		irq_fired = false;
 		for (i = 0; i < RT5677_IRQ_NUM; i++) {
 			if (reg_irq & rt5677_irq_descs[i].status_mask) {
 				irq_fired = true;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
