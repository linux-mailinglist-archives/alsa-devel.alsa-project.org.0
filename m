Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 810C9B613C
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2019 12:16:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06025167E;
	Wed, 18 Sep 2019 12:15:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06025167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568801786;
	bh=ivCJa9/ESTHxgZisVCBn4O2/0Kg/nrSOqWjqAsiCT8E=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=NTJWMxIERTEt2togaEfY3uukgDbx1R80QI0jUuZ8bJv67eGdhnsWeRnHbNFEyQBMw
	 fQa1gKXfzm21S9oNxgm6Y6IebooGI3T0IjYOYBcStIQqFp25mQzR+WhX+DdXCy2zUs
	 KrvYpYwwZH7huSNxjDt++yJgOKsYQCaHtcLa+hDM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A9AAF80292;
	Wed, 18 Sep 2019 12:14:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 173ECF800C1; Wed, 18 Sep 2019 12:14:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8233EF800C1
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 12:14:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8233EF800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="m5oW4CwK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=MmPKWC3O3aiRgwRF5r7v7A55zsox5DrsRAlIJYxJWAk=; b=m5oW4CwKnkKz
 tX23Gfp9x5hWXypvrmERpnA+CebyHgdhR38+UGZvySrfNaR9F+etuEEh/n4umosppkLEpir7Dy5WR
 Igm3qucH2KtD8rjsvaIiUl+dmpARX5i0lCiWmlTxXkc/POCzNl3ULUSTE0EhVclEvciJTFA803YJA
 Yv6cs=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iAWyo-0004e5-Qe; Wed, 18 Sep 2019 10:14:34 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id E2D832742927; Wed, 18 Sep 2019 11:14:33 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
In-Reply-To: <20190918100344.23629-1-gregory.clement@bootlin.com>
X-Patchwork-Hint: ignore
Message-Id: <20190918101433.E2D832742927@ypsilon.sirena.org.uk>
Date: Wed, 18 Sep 2019 11:14:33 +0100 (BST)
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 alsa-devel@alsa-project.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Mark Brown <broonie@kernel.org>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: atmel_ssc_dai: Remove wrong spinlock
	usage" to the asoc tree
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

   ASoC: atmel_ssc_dai: Remove wrong spinlock usage

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

From 0dce49efc70536a8c3b4bb5354a71b727ba31b80 Mon Sep 17 00:00:00 2001
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Wed, 18 Sep 2019 12:03:44 +0200
Subject: [PATCH] ASoC: atmel_ssc_dai: Remove wrong spinlock usage

A potential bug was reported in the email "[BUG] atmel_ssc_dai: a
possible sleep-in-atomic bug in atmel_ssc_shutdown"[1]

Indeed in the function atmel_ssc_shutdown() free_irq() was called in a
critical section protected by spinlock.

However this spinlock is only used in atmel_ssc_shutdown() and
atmel_ssc_startup() functions. After further analysis, it occurred that
the call to these function are already protected by mutex used on the
calling functions.

Then we can remove the spinlock which will fix this bug as a side
effect. Thanks to this patch the following message disappears:

"BUG: sleeping function called from invalid context at
kernel/locking/mutex.c:909"

[1]: https://www.spinics.net/lists/alsa-devel/msg71286.html

Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
Link: https://lore.kernel.org/r/20190918100344.23629-1-gregory.clement@bootlin.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/atmel/atmel_ssc_dai.c | 12 ++----------
 sound/soc/atmel/atmel_ssc_dai.h |  1 -
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/sound/soc/atmel/atmel_ssc_dai.c b/sound/soc/atmel/atmel_ssc_dai.c
index 48e9eef34c0f..ca603397651c 100644
--- a/sound/soc/atmel/atmel_ssc_dai.c
+++ b/sound/soc/atmel/atmel_ssc_dai.c
@@ -116,19 +116,16 @@ static struct atmel_pcm_dma_params ssc_dma_params[NUM_SSC_DEVICES][2] = {
 static struct atmel_ssc_info ssc_info[NUM_SSC_DEVICES] = {
 	{
 	.name		= "ssc0",
-	.lock		= __SPIN_LOCK_UNLOCKED(ssc_info[0].lock),
 	.dir_mask	= SSC_DIR_MASK_UNUSED,
 	.initialized	= 0,
 	},
 	{
 	.name		= "ssc1",
-	.lock		= __SPIN_LOCK_UNLOCKED(ssc_info[1].lock),
 	.dir_mask	= SSC_DIR_MASK_UNUSED,
 	.initialized	= 0,
 	},
 	{
 	.name		= "ssc2",
-	.lock		= __SPIN_LOCK_UNLOCKED(ssc_info[2].lock),
 	.dir_mask	= SSC_DIR_MASK_UNUSED,
 	.initialized	= 0,
 	},
@@ -317,13 +314,10 @@ static int atmel_ssc_startup(struct snd_pcm_substream *substream,
 
 	snd_soc_dai_set_dma_data(dai, substream, dma_params);
 
-	spin_lock_irq(&ssc_p->lock);
-	if (ssc_p->dir_mask & dir_mask) {
-		spin_unlock_irq(&ssc_p->lock);
+	if (ssc_p->dir_mask & dir_mask)
 		return -EBUSY;
-	}
+
 	ssc_p->dir_mask |= dir_mask;
-	spin_unlock_irq(&ssc_p->lock);
 
 	return 0;
 }
@@ -355,7 +349,6 @@ static void atmel_ssc_shutdown(struct snd_pcm_substream *substream,
 
 	dir_mask = 1 << dir;
 
-	spin_lock_irq(&ssc_p->lock);
 	ssc_p->dir_mask &= ~dir_mask;
 	if (!ssc_p->dir_mask) {
 		if (ssc_p->initialized) {
@@ -369,7 +362,6 @@ static void atmel_ssc_shutdown(struct snd_pcm_substream *substream,
 		ssc_p->cmr_div = ssc_p->tcmr_period = ssc_p->rcmr_period = 0;
 		ssc_p->forced_divider = 0;
 	}
-	spin_unlock_irq(&ssc_p->lock);
 
 	/* Shutdown the SSC clock. */
 	pr_debug("atmel_ssc_dai: Stopping clock\n");
diff --git a/sound/soc/atmel/atmel_ssc_dai.h b/sound/soc/atmel/atmel_ssc_dai.h
index ae764cb541c7..3470b966e449 100644
--- a/sound/soc/atmel/atmel_ssc_dai.h
+++ b/sound/soc/atmel/atmel_ssc_dai.h
@@ -93,7 +93,6 @@ struct atmel_ssc_state {
 struct atmel_ssc_info {
 	char *name;
 	struct ssc_device *ssc;
-	spinlock_t lock;	/* lock for dir_mask */
 	unsigned short dir_mask;	/* 0=unused, 1=playback, 2=capture */
 	unsigned short initialized;	/* true if SSC has been initialized */
 	unsigned short daifmt;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
