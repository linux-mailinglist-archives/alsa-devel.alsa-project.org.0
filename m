Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 843A11362A7
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jan 2020 22:35:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22A8617A9;
	Thu,  9 Jan 2020 22:34:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22A8617A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578605731;
	bh=lHZY0Msf4kM9qZ9bsdk0rotRZ2IFZLMs6QTCiSHY6UQ=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=PP4cX8UZQtziqbeXV/XqW3IgsxWWTK8XVKPCXqY69/Q6a6/sklppqQwYtZ80qWrca
	 wSVhByNRn9PsIdCopgd+GDnzqg4iFsFEMPDoWP+m7njRUuYFMdjmhvStnrYqkj8/hb
	 E6bKp/nrgIVLXLdEu6NNBOAgPUO9GlkLouBuU4QQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF49EF802D2;
	Thu,  9 Jan 2020 22:29:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B731BF802A2; Thu,  9 Jan 2020 22:29:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 0D9CCF8015B
 for <alsa-devel@alsa-project.org>; Thu,  9 Jan 2020 22:29:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D9CCF8015B
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F39B31B;
 Thu,  9 Jan 2020 13:29:32 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB9863F534;
 Thu,  9 Jan 2020 13:29:31 -0800 (PST)
Date: Thu, 09 Jan 2020 21:29:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20200108115007.31095-1-m.szyprowski@samsung.com>
Message-Id: <applied-20200108115007.31095-1-m.szyprowski@samsung.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Dylan Reid <dgreid@google.com>
Subject: [alsa-devel] Applied "ASoC: max98090: fix incorrect helper in
	max98090_dapm_put_enum_double()" to the asoc tree
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

   ASoC: max98090: fix incorrect helper in max98090_dapm_put_enum_double()

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

From 1d7b051891722a36ee0b228bc940dd245f161ab1 Mon Sep 17 00:00:00 2001
From: Marek Szyprowski <m.szyprowski@samsung.com>
Date: Wed, 8 Jan 2020 12:50:06 +0100
Subject: [PATCH] ASoC: max98090: fix incorrect helper in
 max98090_dapm_put_enum_double()

Commit 62d5ae4cafb7 ("ASoC: max98090: save and restore SHDN when changing
sensitive registers") extended the code for handling "LTENL Mux", "LTENR
Mux", "LBENL Mux" and "LBENR Mux" controls by adding a custom
max98090_dapm_put_enum_double() function to them. However that function
used incorrect helper to get its component object. Fix this by using the
proper snd_soc_dapm_* helper.

This fixes the following NULL pointer exception observed on
Exynos4412-based Odroid U3 board:
8<--- cut here ---
Unable to handle kernel NULL pointer dereference at virtual address 000000b0
pgd = (ptrval)
[000000b0] *pgd=00000000
Internal error: Oops: 5 [#1] PREEMPT SMP ARM
Modules linked in:
CPU: 0 PID: 1104 Comm: alsactl Not tainted 5.5.0-rc5-next-20200107 #166
Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
PC is at __mutex_lock+0x54/0xb18
LR is at ___might_sleep+0x3c/0x2e0
...
Process alsactl (pid: 1104, stack limit = 0x(ptrval))
...
[<c0b49630>] (__mutex_lock) from [<c0b4a110>] (mutex_lock_nested+0x1c/0x24)
[<c0b4a110>] (mutex_lock_nested) from [<c0839b3c>] (max98090_shdn_save+0x1c/0x28)
[<c0839b3c>] (max98090_shdn_save) from [<c083a4f8>] (max98090_dapm_put_enum_double+0x20/0x40)
[<c083a4f8>] (max98090_dapm_put_enum_double) from [<c080d0e8>] (snd_ctl_ioctl+0x190/0xbb8)
[<c080d0e8>] (snd_ctl_ioctl) from [<c02cafec>] (ksys_ioctl+0x470/0xaf8)
[<c02cafec>] (ksys_ioctl) from [<c0101000>] (ret_fast_syscall+0x0/0x28)
...
---[ end trace 0e93f0580f4b9241 ]---

Fixes: 62d5ae4cafb7 ("ASoC: max98090: save and restore SHDN when changing sensitive registers")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
Link: https://lore.kernel.org/r/20200108115007.31095-1-m.szyprowski@samsung.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/max98090.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 4c7b16d557e2..c01ce4a3f86d 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -82,7 +82,7 @@ static int max98090_dapm_put_enum_double(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+		snd_soc_dapm_kcontrol_component(kcontrol);
 	struct max98090_priv *max98090 =
 		snd_soc_component_get_drvdata(component);
 	int ret;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
