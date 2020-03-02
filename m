Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75700175D72
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Mar 2020 15:42:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A72C16BF;
	Mon,  2 Mar 2020 15:41:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A72C16BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583160125;
	bh=tXyfu1JfWIOSWVP1oxVvi6ab3Njrm+Dlkj9lOWM2bGU=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=CJqUITP4++EasRa7LAMezaOr1jZZnNa+T5vs2lb/J0cAaHQVpS+2rWbjHfaEjtJ88
	 cm0EeewPDKQfxIErl/77T9Lt0HC1JuDXZNwFLx+URTdmvPiDl1pYfd7ZQmBYWEyOt4
	 mKGAzN2Tk3JvaxD/2x5GDvmsbvb3D4uz18CAJyEA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B555F80299;
	Mon,  2 Mar 2020 15:37:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E1DBF8029B; Mon,  2 Mar 2020 15:37:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id DE5C9F8028F
 for <alsa-devel@alsa-project.org>; Mon,  2 Mar 2020 15:37:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE5C9F8028F
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6233B2F;
 Mon,  2 Mar 2020 06:37:19 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DADFD3F534;
 Mon,  2 Mar 2020 06:37:18 -0800 (PST)
Date: Mon, 02 Mar 2020 14:37:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Keyon Jie <yang.jie@linux.intel.com>
Subject: Applied "ASoC: SOF: Intel: hda-loader: clear the IPC ack bit after
 FW_PURGE done" to the asoc tree
In-Reply-To: <20200228231850.9226-4-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200228231850.9226-4-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: SOF: Intel: hda-loader: clear the IPC ack bit after FW_PURGE done

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From 8354d9b44530b5f534146668ae641572dede79a4 Mon Sep 17 00:00:00 2001
From: Keyon Jie <yang.jie@linux.intel.com>
Date: Fri, 28 Feb 2020 17:18:49 -0600
Subject: [PATCH] ASoC: SOF: Intel: hda-loader: clear the IPC ack bit after
 FW_PURGE done

Set DONE bit after the FW_PURGE IPC is polled successfully, to clear the
interrupt and avoid the arrival of the confusing unexpected ipc.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Link: https://lore.kernel.org/r/20200228231850.9226-4-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda-loader.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 8852184a2569..03b05d7f66da 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -131,6 +131,12 @@ static int cl_dsp_init(struct snd_sof_dev *sdev, const void *fwdata,
 		goto err;
 	}
 
+	/* set DONE bit to clear the reply IPC message */
+	snd_sof_dsp_update_bits_forced(sdev, HDA_DSP_BAR,
+				       chip->ipc_ack,
+				       chip->ipc_ack_mask,
+				       chip->ipc_ack_mask);
+
 	/* step 5: power down corex */
 	ret = hda_dsp_core_power_down(sdev,
 				  chip->cores_mask & ~(HDA_DSP_CORE_MASK(0)));
-- 
2.20.1

