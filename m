Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E39C33799
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 20:13:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1658F16A0;
	Mon,  3 Jun 2019 20:12:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1658F16A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559585588;
	bh=BDmPEBOFxEfp7V2iCbt37UJJlh/z7DQudZ0wWv4kbzY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=jVIBa4ff6ryET2RXIeu7bpi7zvvHiDer9dYKPTOp5RwZ3UG4X0adG94W5ohbFiSSS
	 /nFLmuW2Kw7bXOhzm/4lY7xQlCu8QnZKX9twk6j6PnIC1Fb5vsAR7VYUSNGcrfUW9F
	 Un6zpf2ex7L9umjMm7fNT7mc8daz/N0YSywuu0VE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1F3DF89781;
	Mon,  3 Jun 2019 20:02:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02E39F89746; Mon,  3 Jun 2019 20:02:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 081BAF89739
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 20:02:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 081BAF89739
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="iL7yp/bK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=RPF6ZmejqKm0wgerxhoYRW51ykTdgIvMvTW057+i7eI=; b=iL7yp/bKNrsr
 lyCn2O+tr6ZSWQdu5PaEl/fKdnnx4GtdezGwEq4NoemNqBrDvWR85wk6iyDMyCw6doWTXwkxm2G6I
 poJHKp+GdA5/APWDthy5WKn37Kh4WsUF32NVYZ9SQA0E95Fud7SnKS5xeDTJgFLQgXjvhbixhLx8C
 qRmrg=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hXrHS-0003YZ-CS; Mon, 03 Jun 2019 18:01:58 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id C7E1D440046; Mon,  3 Jun 2019 19:01:57 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20190603162032.7626-6-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190603180157.C7E1D440046@finisterre.sirena.org.uk>
Date: Mon,  3 Jun 2019 19:01:57 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: hda-ipc: read all IPC
	registers first" to the asoc tree
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

   ASoC: SOF: Intel: hda-ipc: read all IPC registers first

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

From 5dbeb8287421984a09c92a79c503f8bd41cf3fe7 Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Mon, 3 Jun 2019 11:20:29 -0500
Subject: [PATCH] ASoC: SOF: Intel: hda-ipc: read all IPC registers first

Align with hardware recommended sequences, and read all IPC registers
before doing any other actions. Playing with BUSY and DONE bits may
invalidate values.

The values read may not actually be necessary but at least this
provides a snapshot of the IPC registers with no consistency issues.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda-ipc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/intel/hda-ipc.c b/sound/soc/sof/intel/hda-ipc.c
index 728dd1e075a4..1f01897fa6e3 100644
--- a/sound/soc/sof/intel/hda-ipc.c
+++ b/sound/soc/sof/intel/hda-ipc.c
@@ -145,6 +145,8 @@ irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context)
 				  HDA_DSP_REG_HIPCIE);
 	hipct = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_HIPCT);
 	hipcctl = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_HIPCCTL);
+	hipci = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_HIPCI);
+	hipcte = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_HIPCTE);
 
 	/* reenable IPC interrupt */
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, HDA_DSP_REG_ADSPIC,
@@ -153,8 +155,6 @@ irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context)
 	/* is this a reply message from the DSP */
 	if (hipcie & HDA_DSP_REG_HIPCIE_DONE &&
 	    hipcctl & HDA_DSP_REG_HIPCCTL_DONE) {
-		hipci = snd_sof_dsp_read(sdev, HDA_DSP_BAR,
-					 HDA_DSP_REG_HIPCI);
 		msg = hipci & HDA_DSP_REG_HIPCI_MSG_MASK;
 		msg_ext = hipcie & HDA_DSP_REG_HIPCIE_MSG_MASK;
 
@@ -202,9 +202,6 @@ irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context)
 	/* is this a new message from DSP */
 	if (hipct & HDA_DSP_REG_HIPCT_BUSY &&
 	    hipcctl & HDA_DSP_REG_HIPCCTL_BUSY) {
-
-		hipcte = snd_sof_dsp_read(sdev, HDA_DSP_BAR,
-					  HDA_DSP_REG_HIPCTE);
 		msg = hipct & HDA_DSP_REG_HIPCT_MSG_MASK;
 		msg_ext = hipcte & HDA_DSP_REG_HIPCTE_MSG_MASK;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
