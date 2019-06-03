Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 390DD3378F
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 20:10:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C203D166A;
	Mon,  3 Jun 2019 20:09:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C203D166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559585422;
	bh=NfEsQqra4njt8TSZNWvtqosF8rU2uPa+qIhuIFKGM7k=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=bq3hfZRwllSLAZkc/x02P730hA5t0NfipraCzC4lKYr4+130/Bt0xC3aLMrb+F2V2
	 9wAw0AZbZYjJBNxfyKEqYuZ8meQG0k5Ktz+NiqdceMus48aWVmP+660gdLXQpiOiOz
	 TM74qvd446z9NAsy/LyfirMqByBLAUpQwBWuQuh8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5794F89767;
	Mon,  3 Jun 2019 20:02:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14EB5F8972F; Mon,  3 Jun 2019 20:02:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39C02F896DB
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 20:02:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39C02F896DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="G3J//+Zf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=7fYSZR9PWg3JcZ0oCpV8fOeLvStxc6mjCEH+3MIkcfk=; b=G3J//+ZfLiLQ
 9WojA7aOkJCXEuSB6K/DoJs88iviKHOzpnm8bVrMmgO6eBgBuXRukB5o0iN6oy10ociXu/imY4uof
 P/gPPaMkU5QV7hJYu+8Kvz+NDvLL5fCsuPBNWXkiRYGMPZnOSVTZrlAtY9VdWyRMwI8/VtqRHHN4L
 MbIJo=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hXrHT-0003Yk-J4; Mon, 03 Jun 2019 18:01:59 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 06297440046; Mon,  3 Jun 2019 19:01:59 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20190603162032.7626-4-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190603180159.06297440046@finisterre.sirena.org.uk>
Date: Mon,  3 Jun 2019 19:01:58 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: cnl-ipc: move code around
	for clarity" to the asoc tree
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

   ASoC: SOF: Intel: cnl-ipc: move code around for clarity

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

From ddbe9223393e4d067f010de65a05c9a6cb7790c1 Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Mon, 3 Jun 2019 11:20:27 -0500
Subject: [PATCH] ASoC: SOF: Intel: cnl-ipc: move code around for clarity

Move all register access to cnl_ipc_host_done()
No functionality change.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/cnl.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 1fae75fc313f..4ecba1d8ec7f 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -99,15 +99,6 @@ static irqreturn_t cnl_ipc_irq_thread(int irq, void *context)
 			snd_sof_ipc_msgs_rx(sdev);
 		}
 
-		/*
-		 * clear busy interrupt to tell dsp controller this
-		 * interrupt has been accepted, not trigger it again
-		 */
-		snd_sof_dsp_update_bits_forced(sdev, HDA_DSP_BAR,
-					       CNL_DSP_REG_HIPCTDR,
-					       CNL_DSP_REG_HIPCTDR_BUSY,
-					       CNL_DSP_REG_HIPCTDR_BUSY);
-
 		cnl_ipc_host_done(sdev);
 
 		ret = IRQ_HANDLED;
@@ -118,6 +109,14 @@ static irqreturn_t cnl_ipc_irq_thread(int irq, void *context)
 
 static void cnl_ipc_host_done(struct snd_sof_dev *sdev)
 {
+	/*
+	 * clear busy interrupt to tell dsp controller this
+	 * interrupt has been accepted, not trigger it again
+	 */
+	snd_sof_dsp_update_bits_forced(sdev, HDA_DSP_BAR,
+				       CNL_DSP_REG_HIPCTDR,
+				       CNL_DSP_REG_HIPCTDR_BUSY,
+				       CNL_DSP_REG_HIPCTDR_BUSY);
 	/*
 	 * set done bit to ack dsp the msg has been
 	 * processed and send reply msg to dsp
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
