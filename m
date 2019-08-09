Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B937E87A42
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 14:36:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4277F851;
	Fri,  9 Aug 2019 14:35:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4277F851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565354190;
	bh=bgZw9tEr/gLZbAU87vqgSm3lZLV5cAGQnzLqDKxQogg=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=dijBlr0XkA1jooNu6L6D6zcRLqd5UYm4tKxN+KCV0/OED4zUEvy09yO9IYpjy5Rly
	 7jsOwGoq75j8DEGi7Ke5LlPEJqcDOOfCNGtWB7uo90VlMv/5AvsGjLRHuEYnlfhAMX
	 5nQgbnnnuPuZjMalqUQRmHRRr19MUuxRDiCoRrKo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AD25F80635;
	Fri,  9 Aug 2019 14:32:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 198F8F805F6; Fri,  9 Aug 2019 14:32:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A210CF805A9
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 14:31:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A210CF805A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="toGb2iHc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=hvKg57q1AYA/E2QjYjUuSFgsy/9C4emNCfnsun5kC1A=; b=toGb2iHcpPL5
 nT0XP/Kxbf4xwJrUge3jG69Vhn6uGydQ6iNMKy/Z45hJ19SaYSMr3VXEIRLK3+j19YeD9PxzG/ArH
 Onrwk8+eSWvCZAtqTEsU8uQItAohSDzTJejO1wX4eFPXPx+2e02o5tseogUPqnHMQRvX8NNxPjEx0
 QOpBo=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hw43k-000615-QQ; Fri, 09 Aug 2019 12:31:52 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 2DA1F27430D6; Fri,  9 Aug 2019 13:31:52 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
In-Reply-To: <20190807150203.26359-2-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190809123152.2DA1F27430D6@ypsilon.sirena.org.uk>
Date: Fri,  9 Aug 2019 13:31:52 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Keyon Jie <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Remove call to
	snd_sof_dsp_mailbox_init" to the asoc tree
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

   ASoC: SOF: Remove call to snd_sof_dsp_mailbox_init

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

From 0b76f512c206dd7c3f7761b24826887af80204c6 Mon Sep 17 00:00:00 2001
From: Daniel Baluta <daniel.baluta@nxp.com>
Date: Wed, 7 Aug 2019 10:01:58 -0500
Subject: [PATCH] ASoC: SOF: Remove call to snd_sof_dsp_mailbox_init

This is reserved for some historical reason, we didn't enable memory
windows for byt/bdw at the beginning, to make it compatible, we get
those mailbox offsets from fw_ready struct firstly, and then update them
if they existed in the following memory windows, to make sure the
mailbox still can be used if no memory windows are created.

With this change all platforms have the same implementation for
xxx_fw_ready function so that we can refactor it in a common file.

Suggested-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20190807150203.26359-2-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/bdw.c | 5 -----
 sound/soc/sof/intel/byt.c | 5 -----
 2 files changed, 10 deletions(-)

diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index 4bb9636da990..94be024a99eb 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -455,11 +455,6 @@ static int bdw_fw_ready(struct snd_sof_dev *sdev, u32 msg_id)
 	sof_block_read(sdev, sdev->mmio_bar, offset, fw_ready,
 		       sizeof(*fw_ready));
 
-	snd_sof_dsp_mailbox_init(sdev, fw_ready->dspbox_offset,
-				 fw_ready->dspbox_size,
-				 fw_ready->hostbox_offset,
-				 fw_ready->hostbox_size);
-
 	/* make sure ABI version is compatible */
 	ret = snd_sof_ipc_valid(sdev);
 	if (ret < 0)
diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index 000d576f6a8d..cb8f02ee09f2 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -237,11 +237,6 @@ static int byt_fw_ready(struct snd_sof_dev *sdev, u32 msg_id)
 	sof_block_read(sdev, sdev->mmio_bar, offset, fw_ready,
 		       sizeof(*fw_ready));
 
-	snd_sof_dsp_mailbox_init(sdev, fw_ready->dspbox_offset,
-				 fw_ready->dspbox_size,
-				 fw_ready->hostbox_offset,
-				 fw_ready->hostbox_size);
-
 	/* make sure ABI version is compatible */
 	ret = snd_sof_ipc_valid(sdev);
 	if (ret < 0)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
