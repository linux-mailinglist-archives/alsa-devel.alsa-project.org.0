Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BABC13629B
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jan 2020 22:33:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4B1E1784;
	Thu,  9 Jan 2020 22:32:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4B1E1784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578605596;
	bh=2EnFP2UqrLo8QcWz0/6DaeqzXRxiUcb4sSOXJoFFhv0=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=QdSLXwYrBHM49M4X31ZcrjDYvU6ZtiGRcfVgPZss8B6VljB6vusnP4ZvUP89fCZyH
	 IjJrjJ0d1psu6ZI18yMxDQNSapPij61lRWDr7TUTbs0+Tq/NQ+S3e3g27zfCEcJh8L
	 fSim7aENEWpuhaak6w2RagiLpN32lCWwlrBGJ9Ec=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E339AF8027B;
	Thu,  9 Jan 2020 22:29:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33A6EF800E4; Thu,  9 Jan 2020 22:29:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id D32CFF800E4
 for <alsa-devel@alsa-project.org>; Thu,  9 Jan 2020 22:29:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D32CFF800E4
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFD9F1063;
 Thu,  9 Jan 2020 13:29:25 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3763E3F534;
 Thu,  9 Jan 2020 13:29:25 -0800 (PST)
Date: Thu, 09 Jan 2020 21:29:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20200108115007.31095-2-m.szyprowski@samsung.com>
Message-Id: <applied-20200108115007.31095-2-m.szyprowski@samsung.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Dylan Reid <dgreid@google.com>
Subject: [alsa-devel] Applied "ASoC: max98090: fix lockdep warning" to the
	asoc tree
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

   ASoC: max98090: fix lockdep warning

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

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

From 2dc98af62c32ff6c8b9a32365346c5c407e291a8 Mon Sep 17 00:00:00 2001
From: Marek Szyprowski <m.szyprowski@samsung.com>
Date: Wed, 8 Jan 2020 12:50:07 +0100
Subject: [PATCH] ASoC: max98090: fix lockdep warning

Commit 62d5ae4cafb7 ("ASoC: max98090: save and restore SHDN when changing
sensitive registers") extended the code for handling many controls by
adding a custom put function to them. That new custom put function
properly handles relations between codec's hardware registers. However
they used card->dapm_mutex to properly serialize those operations. This
in turn triggers a lockdep warning about possible circular dependency.
Fix this by introducing a separate mutex only for serializing the SHDN
hardware register related operations.

This fixes the following lockdep warning observed on Exynos4412-based
Odroid U3 board:
======================================================
WARNING: possible circular locking dependency detected
5.5.0-rc5-next-20200107 #166 Not tainted
------------------------------------------------------
alsactl/1104 is trying to acquire lock:
ed0d50f4 (&card->dapm_mutex){+.+.}, at: max98090_shdn_save+0x1c/0x28

but task is already holding lock:
edb4b49c (&card->controls_rwsem){++++}, at: snd_ctl_ioctl+0xcc/0xbb8

which lock already depends on the new lock.

the existing dependency chain (in reverse order) is:

-> #1 (&card->controls_rwsem){++++}:
       snd_ctl_add_replace+0x3c/0x84
       dapm_create_or_share_kcontrol+0x24c/0x2e0
       snd_soc_dapm_new_widgets+0x308/0x594
       snd_soc_bind_card+0x80c/0xad4
       devm_snd_soc_register_card+0x34/0x6c
       odroid_audio_probe+0x288/0x34c
       platform_drv_probe+0x6c/0xa4
       really_probe+0x200/0x490
       driver_probe_device+0x78/0x1f8
       bus_for_each_drv+0x74/0xb8
       __device_attach+0xd4/0x16c
       bus_probe_device+0x88/0x90
       deferred_probe_work_func+0x3c/0xd0
       process_one_work+0x22c/0x7c4
       worker_thread+0x44/0x524
       kthread+0x130/0x164
       ret_from_fork+0x14/0x20
       0x0

-> #0 (&card->dapm_mutex){+.+.}:
       lock_acquire+0xe8/0x270
       __mutex_lock+0x9c/0xb18
       mutex_lock_nested+0x1c/0x24
       max98090_shdn_save+0x1c/0x28
       max98090_put_enum_double+0x20/0x40
       snd_ctl_ioctl+0x190/0xbb8
       ksys_ioctl+0x470/0xaf8
       ret_fast_syscall+0x0/0x28
       0xbefaa564

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&card->controls_rwsem);
                               lock(&card->dapm_mutex);
                               lock(&card->controls_rwsem);
  lock(&card->dapm_mutex);

 *** DEADLOCK ***

1 lock held by alsactl/1104:
 #0: edb4b49c (&card->controls_rwsem){++++}, at: snd_ctl_ioctl+0xcc/0xbb8

stack backtrace:
CPU: 0 PID: 1104 Comm: alsactl Not tainted 5.5.0-rc5-next-20200107 #166
Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
(unwind_backtrace) from [<c010e180>] (show_stack+0x10/0x14)
(show_stack) from [<c0b2a09c>] (dump_stack+0xb4/0xe0)
(dump_stack) from [<c018a1c0>] (check_noncircular+0x1ec/0x208)
(check_noncircular) from [<c018c5dc>] (__lock_acquire+0x1210/0x25ec)
(__lock_acquire) from [<c018e2d8>] (lock_acquire+0xe8/0x270)
(lock_acquire) from [<c0b49678>] (__mutex_lock+0x9c/0xb18)
(__mutex_lock) from [<c0b4a110>] (mutex_lock_nested+0x1c/0x24)
(mutex_lock_nested) from [<c0839b3c>] (max98090_shdn_save+0x1c/0x28)
(max98090_shdn_save) from [<c083a5b8>] (max98090_put_enum_double+0x20/0x40)
(max98090_put_enum_double) from [<c080d0e8>] (snd_ctl_ioctl+0x190/0xbb8)
(snd_ctl_ioctl) from [<c02cafec>] (ksys_ioctl+0x470/0xaf8)
(ksys_ioctl) from [<c0101000>] (ret_fast_syscall+0x0/0x28)
...

Fixes: 62d5ae4cafb7 ("ASoC: max98090: save and restore SHDN when changing sensitive registers")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Link: https://lore.kernel.org/r/20200108115007.31095-2-m.szyprowski@samsung.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/max98090.c | 10 ++++++----
 sound/soc/codecs/max98090.h |  1 +
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index ede03663cbed..ba0e3ba162f8 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -52,14 +52,14 @@ static void max98090_shdn_restore_locked(struct max98090_priv *max98090)
 
 static void max98090_shdn_save(struct max98090_priv *max98090)
 {
-	mutex_lock(&max98090->component->card->dapm_mutex);
+	mutex_lock(&max98090->shdn_lock);
 	max98090_shdn_save_locked(max98090);
 }
 
 static void max98090_shdn_restore(struct max98090_priv *max98090)
 {
 	max98090_shdn_restore_locked(max98090);
-	mutex_unlock(&max98090->component->card->dapm_mutex);
+	mutex_unlock(&max98090->shdn_lock);
 }
 
 static int max98090_put_volsw(struct snd_kcontrol *kcontrol,
@@ -2313,12 +2313,12 @@ static void max98090_pll_work(struct max98090_priv *max98090)
 	 */
 
 	/* Toggle shutdown OFF then ON */
-	mutex_lock(&component->card->dapm_mutex);
+	mutex_lock(&max98090->shdn_lock);
 	snd_soc_component_update_bits(component, M98090_REG_DEVICE_SHUTDOWN,
 			    M98090_SHDNN_MASK, 0);
 	snd_soc_component_update_bits(component, M98090_REG_DEVICE_SHUTDOWN,
 			    M98090_SHDNN_MASK, M98090_SHDNN_MASK);
-	mutex_unlock(&component->card->dapm_mutex);
+	mutex_unlock(&max98090->shdn_lock);
 
 	for (i = 0; i < 10; ++i) {
 		/* Give PLL time to lock */
@@ -2731,6 +2731,8 @@ static int max98090_i2c_probe(struct i2c_client *i2c,
 	if (max98090 == NULL)
 		return -ENOMEM;
 
+	mutex_init(&max98090->shdn_lock);
+
 	if (ACPI_HANDLE(&i2c->dev)) {
 		acpi_id = acpi_match_device(i2c->dev.driver->acpi_match_table,
 					    &i2c->dev);
diff --git a/sound/soc/codecs/max98090.h b/sound/soc/codecs/max98090.h
index 0a31708b7df7..dabd8be34a01 100644
--- a/sound/soc/codecs/max98090.h
+++ b/sound/soc/codecs/max98090.h
@@ -1539,6 +1539,7 @@ struct max98090_priv {
 	unsigned int pa2en;
 	unsigned int sidetone;
 	bool master;
+	struct mutex shdn_lock;
 	int saved_count;
 	int saved_shdn;
 };
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
