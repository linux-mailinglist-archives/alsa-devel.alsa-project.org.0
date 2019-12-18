Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF81312535F
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 21:23:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81F761684;
	Wed, 18 Dec 2019 21:22:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81F761684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576700608;
	bh=XEfhpJjZQJgDw6h8Lrvu0J8ztuwMthaiRTUk61L0vqE=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=mYkLQAhU756fnT4BykCWylJsdeQFDHb7BwPLPPRJivfNY++oUGhd34JcmieEPo3pv
	 mAA9s6+zyYaknx5rlLhkbSjXwzJNhXbuc31DgxlHkAgHkoEN/KGtU4S3fIBefJFk4c
	 au4adNgteBflCdCg1yltElKKc2gwk9QsVBWYSPuc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0335F80393;
	Wed, 18 Dec 2019 21:06:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A9BFF80384; Wed, 18 Dec 2019 21:06:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 RCVD_IN_DNSWL_BLOCKED, SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id A6093F8037E
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 21:06:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6093F8037E
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 174B91396;
 Wed, 18 Dec 2019 12:06:28 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 88AAC3F67D;
 Wed, 18 Dec 2019 12:06:27 -0800 (PST)
Date: Wed, 18 Dec 2019 20:06:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20191218000518.5830-2-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20191218000518.5830-2-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [alsa-devel] Applied "ASoC: SOF: fix fault at driver unload after
	failed probe" to the asoc tree
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

   ASoC: SOF: fix fault at driver unload after failed probe

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

From b06e46427f987bf83dcb6a69516b57276eb8ec0c Mon Sep 17 00:00:00 2001
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Date: Tue, 17 Dec 2019 18:05:16 -0600
Subject: [PATCH] ASoC: SOF: fix fault at driver unload after failed probe

If sof_machine_check() fails during driver probe, the IPC
state is not initialized and this will lead to a NULL
dereference at driver unload. Example log is as follows:

[ 1535.980630] sof-audio-pci 0000:00:1f.3: error: no matching ASoC machine driver found - aborting probe
[ 1535.980631] sof-audio-pci 0000:00:1f.3: error: failed to get machine info -19
[ 1535.980632] sof-audio-pci 0000:00:1f.3: error: sof_probe_work failed err: -19
[ 1550.798373] BUG: kernel NULL pointer dereference, address: 0000000000000008
...
[ 1550.798393] Call Trace:
[ 1550.798397]  snd_sof_ipc_free+0x15/0x30 [snd_sof]
[ 1550.798399]  snd_sof_device_remove+0x29/0xa0 [snd_sof]
[ 1550.798400]  sof_pci_remove+0x10/0x30 [snd_sof_pci]

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191218000518.5830-2-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/ipc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 5994e1073364..5fdfbaa8c4ed 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -826,6 +826,9 @@ void snd_sof_ipc_free(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_ipc *ipc = sdev->ipc;
 
+	if (!ipc)
+		return;
+
 	/* disable sending of ipc's */
 	mutex_lock(&ipc->tx_mutex);
 	ipc->disable_ipc_tx = true;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
