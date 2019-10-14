Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FDFD66FA
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Oct 2019 18:13:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 003731689;
	Mon, 14 Oct 2019 18:12:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 003731689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571069613;
	bh=6JQX2HOasMl3nO9AOHminh+7EuXPi1HraQ34gcN3JPo=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=FMCoh92ncBxpRVm+NOdqRAnwzSpxPBGT5ngvDdKb/N+1MASNHCwS88PCNEXEQUhd0
	 WTREY0CcLgdZxHbuguErsFyWAW+xjItOvrCdFDBwDgMo6wEXFVbWwf7MRvDjEsss2g
	 z2ahg9UpVg04JaTfGj1hzC7qe3a2rH0j/Cpmayoo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 389AFF80376;
	Mon, 14 Oct 2019 18:12:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64E62F80369; Mon, 14 Oct 2019 18:12:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2375CF80212
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 18:12:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2375CF80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="J7Fsb/Eu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=2lucGtC5FgFnkQOwXgFW6LIHJ1tEIf7HqGz9IDto4us=; b=J7Fsb/Eu9Ao9
 +0W6VbhNrfvcxYfqsERKsz/ohtt6gTdLZtA32MltYmlne6Yq3Psc/q+6XwhEPuEqkqIvaHqmfn6N8
 vQO++KVVYsGl+FD1odllUQ/GS8rcvv0VOdz+BNQu6XcaLP7DucU+Il2V/lLqXs/MaTUsP8/x46zT6
 skR3E=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iK2xK-0007yg-HJ; Mon, 14 Oct 2019 16:12:22 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id E13102741EF2; Mon, 14 Oct 2019 17:12:21 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
In-Reply-To: <20191014091308.23688-1-yuehaibing@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20191014161221.E13102741EF2@ypsilon.sirena.org.uk>
Date: Mon, 14 Oct 2019 17:12:21 +0100 (BST)
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, yuehaibing@huawei.com, tiwai@suse.com,
 yang.jie@linux.intel.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 Hulk Robot <hulkci@huawei.com>, Mark Brown <broonie@kernel.org>,
 yung-chuan.liao@linux.intel.com, jaska.uimonen@linux.intel.com
Subject: [alsa-devel] Applied "ASoC: SOF: Fix randbuild error" to the asoc
	tree
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

   ASoC: SOF: Fix randbuild error

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

From 9899a7a869935c4c93247b290ac7a70e0deab202 Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 14 Oct 2019 17:13:08 +0800
Subject: [PATCH] ASoC: SOF: Fix randbuild error

When LEDS_TRIGGER_AUDIO is m and SND_SOC_SOF is y,

sound/soc/sof/control.o: In function `snd_sof_switch_put':
control.c:(.text+0x587): undefined reference to `ledtrig_audio_set'
control.c:(.text+0x593): undefined reference to `ledtrig_audio_set'

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 5d43001ae436 ("ASoC: SOF: acpi led support for switch controls")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191014091308.23688-1-yuehaibing@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/control.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index 41551e8f6ac3..2c4abd406c4f 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -36,10 +36,12 @@ static void update_mute_led(struct snd_sof_control *scontrol,
 
 	scontrol->led_ctl.led_value = temp;
 
+#if IS_REACHABLE(CONFIG_LEDS_TRIGGER_AUDIO)
 	if (!scontrol->led_ctl.direction)
 		ledtrig_audio_set(LED_AUDIO_MUTE, temp ? LED_OFF : LED_ON);
 	else
 		ledtrig_audio_set(LED_AUDIO_MICMUTE, temp ? LED_OFF : LED_ON);
+#endif
 }
 
 static inline u32 mixer_to_ipc(unsigned int value, u32 *volume_map, int size)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
