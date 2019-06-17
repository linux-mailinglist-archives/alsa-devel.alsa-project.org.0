Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A5148769
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2019 17:38:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98D5B17AB;
	Mon, 17 Jun 2019 17:37:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98D5B17AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560785885;
	bh=cUB1Z3n4/8WpOfvvpbUEZNGVn6ovRt+wPDSVsbvFwkg=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=IpJF3UB0bWGe1sxdgOvi6DOaBJNzCCapY10Dvg6yMC3FvHo/L+lt2c0gN2zTcfpMj
	 8uj4XS3imsI5yzJzSEK2Y/bWyasJbdkun65g4f2HsBBloquzYAI2GiJv8MwLbQLzWq
	 ZVcz/d6RUo+YudlzPZtpjQ+U6ZqKuh+KuOZGZzDo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FA3DF8978D;
	Mon, 17 Jun 2019 17:25:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0EF3F896DF; Mon, 17 Jun 2019 17:24:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50C33F896DF
 for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2019 17:24:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50C33F896DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="k4a61Fsm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=CIY51a7RXn+3BakapD28ylMMASdeoR+L+pX2WrJ2130=; b=k4a61FsmCo7X
 ILeku7cXPaNGUbrKgAyZYzc+VMKe4+0PhcAWqPU9T5jp1sJFUDUvSMaG2xmVaS+xPeUE5GhoohZ2D
 y+9SMNSF6w41Lqe6BNxtXr25k+eHrHzdBXpgIIZaIK+2J05wUCoxYGCinVgtMT4wY4K2O8WJQ9tat
 pBxWM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hctUk-0001zC-H4; Mon, 17 Jun 2019 15:24:30 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 031FB440046; Mon, 17 Jun 2019 16:24:29 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
In-Reply-To: <20190617110615.2084748-1-arnd@arndb.de>
X-Patchwork-Hint: ignore
Message-Id: <20190617152430.031FB440046@finisterre.sirena.org.uk>
Date: Mon, 17 Jun 2019 16:24:29 +0100 (BST)
Cc: simon.ho@synaptics.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
Subject: [alsa-devel] Applied "ASoC: cx2072x: mark PM function as
	__maybe_unused" to the asoc tree
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

   ASoC: cx2072x: mark PM function as __maybe_unused

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From 83ee240aad9147ed5dac5a7c7b4c559d134072e7 Mon Sep 17 00:00:00 2001
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 17 Jun 2019 13:06:15 +0200
Subject: [PATCH] ASoC: cx2072x: mark PM function as __maybe_unused

While the suspend function is already marked __maybe_unused,
the resume function is not, which leads to a warning when
CONFIG_PM is disabled:

sound/soc/codecs/cx2072x.c:1625:12: error: unused function 'cx2072x_runtime_resume' [-Werror,-Wunused-function]

Mark this one like the other one.

Fixes: a497a4363706 ("ASoC: Add support for Conexant CX2072X CODEC")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cx2072x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cx2072x.c b/sound/soc/codecs/cx2072x.c
index f2cb35a50726..1c1ba7bea4d8 100644
--- a/sound/soc/codecs/cx2072x.c
+++ b/sound/soc/codecs/cx2072x.c
@@ -1622,7 +1622,7 @@ static int __maybe_unused cx2072x_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int cx2072x_runtime_resume(struct device *dev)
+static int __maybe_unused cx2072x_runtime_resume(struct device *dev)
 {
 	struct cx2072x_priv *cx2072x = dev_get_drvdata(dev);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
