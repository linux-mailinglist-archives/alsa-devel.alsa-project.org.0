Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C06D519D7E1
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Apr 2020 15:43:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 677341682;
	Fri,  3 Apr 2020 15:42:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 677341682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585921424;
	bh=q6AdiMxvzw7MArM+ejlb2N6oB8jNJ3xHUlwDq5Ofmxg=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ZOVvuJLUdo3xb1jInsoxD8/wVhgmpHfQ8b3ddQx8GYmt4pZUhHCD1G3De5u1AJ3ls
	 P5YR3cCOHA/N4SbHvaPz4RbQPI4P+bo1FJqGrY+ZJORDWHDKVz9+/mwXwKx08+Y1JA
	 Wj1cMLVmVCcXo3f2JdUVuLaefoB+4sVzynAP5MWg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B49BBF802A2;
	Fri,  3 Apr 2020 15:40:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57159F80299; Fri,  3 Apr 2020 15:40:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id C44DBF80268
 for <alsa-devel@alsa-project.org>; Fri,  3 Apr 2020 15:40:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C44DBF80268
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A6F71045;
 Fri,  3 Apr 2020 06:40:24 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F6A53F68F;
 Fri,  3 Apr 2020 06:40:23 -0700 (PDT)
Date: Fri, 03 Apr 2020 14:40:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Applied "ASoC: SOF: Turn "firmware boot complete" message into a dbg
 message" to the asoc tree
In-Reply-To: <20200402184948.3014-2-hdegoede@redhat.com>
Message-Id: <applied-20200402184948.3014-2-hdegoede@redhat.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
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

   ASoC: SOF: Turn "firmware boot complete" message into a dbg message

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

From 904f353d0e508fb4b3a3f902a02b0a028cda33a6 Mon Sep 17 00:00:00 2001
From: Hans de Goede <hdegoede@redhat.com>
Date: Thu, 2 Apr 2020 20:49:48 +0200
Subject: [PATCH] ASoC: SOF: Turn "firmware boot complete" message into a dbg
 message

Using a Canon Lake machine with the SOF driver causes dmesg to fill
up with a ton of these messages:

[  275.902194] sof-audio-pci 0000:00:1f.3: firmware boot complete
[  351.529358] sof-audio-pci 0000:00:1f.3: firmware boot complete
[  560.049047] sof-audio-pci 0000:00:1f.3: firmware boot complete
etc.

Since the DSP is powered down when not in used this happens everytime
e.g. a notification plays, polluting dmesg.

Turn this messages into a debug message, matching what the code already
does for the ""booting DSP firmware" message.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200402184948.3014-2-hdegoede@redhat.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/loader.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index 1f2e0be812bd..64af08293daa 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -597,7 +597,7 @@ int snd_sof_run_firmware(struct snd_sof_dev *sdev)
 	}
 
 	if (sdev->fw_state == SOF_FW_BOOT_COMPLETE)
-		dev_info(sdev->dev, "firmware boot complete\n");
+		dev_dbg(sdev->dev, "firmware boot complete\n");
 	else
 		return -EIO; /* FW boots but fw_ready op failed */
 
-- 
2.20.1

