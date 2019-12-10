Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4D91189F7
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 14:38:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 623D01657;
	Tue, 10 Dec 2019 14:37:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 623D01657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575985121;
	bh=K4T+rd3uNZXHbYB1tPNSA4OVxt9n0Om2Xhsh5LB9544=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=dDMJcL8woMk31z8RVrnd+zSOHr/C7LX3kb6IMN6QsbEFrFBxXGwtBAyBvR6NXvC6r
	 fspqQ64v78AJ4oSaGSCczNhNGXinBphAOQcLnjJ2i8j3Lk0kG9DLSABYfcBCEDK4Kp
	 hCkncVtU5XBph9NLuoIW8/suTJ/zy/tUNt+h8kGE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6591CF80360;
	Tue, 10 Dec 2019 14:23:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3EA6F8034C; Tue, 10 Dec 2019 14:23:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 13047F8034C
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 14:23:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13047F8034C
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A2A31396;
 Tue, 10 Dec 2019 05:23:30 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E5173F52E;
 Tue, 10 Dec 2019 05:23:29 -0800 (PST)
Date: Tue, 10 Dec 2019 13:23:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Karol Trzcinski <karolx.trzcinski@linux.intel.com>
In-Reply-To: <20191210004854.16845-4-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20191210004854.16845-4-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Bartosz Kokoszko <bartoszx.kokoszko@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: loader: fix
	snd_sof_fw_parse_ext_data" to the asoc tree
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

   ASoC: SOF: loader: fix snd_sof_fw_parse_ext_data

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

From 6bb03c21e4bfee29e48e480ee4ca7cb1e12f587c Mon Sep 17 00:00:00 2001
From: Karol Trzcinski <karolx.trzcinski@linux.intel.com>
Date: Mon, 9 Dec 2019 18:48:49 -0600
Subject: [PATCH] ASoC: SOF: loader: fix snd_sof_fw_parse_ext_data

An error occurs during parsing more than one ext_data from the mailbox, because
of invalid data offset handling. Fix by removing the incorrect duplicate
increment of the offset.

The return value is also reset in the switch case. This does not change the
behavior but improves readability - there is no longer a need to check what the
return value of get_ext_windows is.

Signed-off-by: Karol Trzcinski <karolx.trzcinski@linux.intel.com>
Signed-off-by: Bartosz Kokoszko <bartoszx.kokoszko@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191210004854.16845-4-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/loader.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index a041adf0669d..432d12bd4937 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -50,8 +50,7 @@ int snd_sof_fw_parse_ext_data(struct snd_sof_dev *sdev, u32 bar, u32 offset)
 
 	while (ext_hdr->hdr.cmd == SOF_IPC_FW_READY) {
 		/* read in ext structure */
-		offset += sizeof(*ext_hdr);
-		snd_sof_dsp_block_read(sdev, bar, offset,
+		snd_sof_dsp_block_read(sdev, bar, offset + sizeof(*ext_hdr),
 				   (void *)((u8 *)ext_data + sizeof(*ext_hdr)),
 				   ext_hdr->hdr.size - sizeof(*ext_hdr));
 
@@ -61,6 +60,7 @@ int snd_sof_fw_parse_ext_data(struct snd_sof_dev *sdev, u32 bar, u32 offset)
 		/* process structure data */
 		switch (ext_hdr->type) {
 		case SOF_IPC_EXT_DMA_BUFFER:
+			ret = 0;
 			break;
 		case SOF_IPC_EXT_WINDOW:
 			ret = get_ext_windows(sdev, ext_hdr);
@@ -68,6 +68,7 @@ int snd_sof_fw_parse_ext_data(struct snd_sof_dev *sdev, u32 bar, u32 offset)
 		default:
 			dev_warn(sdev->dev, "warning: unknown ext header type %d size 0x%x\n",
 				 ext_hdr->type, ext_hdr->hdr.size);
+			ret = 0;
 			break;
 		}
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
