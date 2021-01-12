Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3022F304C
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jan 2021 14:09:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8ED516E3;
	Tue, 12 Jan 2021 14:08:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8ED516E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610456942;
	bh=fdT8lCXlt2Z2FQhmH3II9aS2GcW3FvLrGSBJvnGQJnQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fwxKGK1Ms+o175LsZ1gp9EIyxUyDfehXpTTLT0XGm3fsBz/JKmtFfdoXjnVZBMTPX
	 ic2HJA00j7DaJ8TIu2Vdvg4K3Z9c+rNAzkDBzNcvehl/5jGeMUyU9z+ia36rY0QGgk
	 zJRK5ySDSTdPdeVimm0JKLgB1aTl4uNSF50zg5yk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4DECF800B9;
	Tue, 12 Jan 2021 14:07:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D086F8026F; Tue, 12 Jan 2021 14:07:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=AC_FROM_MANY_DOTS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60700F800EB
 for <alsa-devel@alsa-project.org>; Tue, 12 Jan 2021 14:07:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60700F800EB
Received: from 36-229-236-11.dynamic-ip.hinet.net ([36.229.236.11]
 helo=localhost) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>)
 id 1kzJO9-0008Qs-MG; Tue, 12 Jan 2021 13:07:10 +0000
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: tiwai@suse.com, pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 daniel.baluta@nxp.com
Subject: [PATCH v3 1/4] ALSA: hda/realtek: Power up codec when setting LED via
 COEF and GPIO
Date: Tue, 12 Jan 2021 21:06:59 +0800
Message-Id: <20210112130704.1201406-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Kailang Yang <kailang@realtek.com>, Thomas Hebb <tommyhebb@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, broonie@kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, Jian-Hong Pan <jhp@endlessos.org>,
 Hui Wang <hui.wang@canonical.com>, Kai-Heng Feng <kai.heng.feng@canonical.com>
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

System takes a very long time to suspend after commit 215a22ed31a1
("ALSA: hda: Refactor codec PM to use direct-complete optimization"):
[   90.065964] PM: suspend entry (s2idle)
[   90.067337] Filesystems sync: 0.001 seconds
[   90.185758] Freezing user space processes ... (elapsed 0.002 seconds) done.
[   90.188713] OOM killer disabled.
[   90.188714] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
[   90.190024] printk: Suspending console(s) (use no_console_suspend to debug)
[   90.904912] intel_pch_thermal 0000:00:12.0: CPU-PCH is cool [49C], continue to suspend
[  321.262505] snd_hda_codec_realtek ehdaudio0D0: Unable to sync register 0x2b8000. -5
[  328.426919] snd_hda_codec_realtek ehdaudio0D0: Unable to sync register 0x2b8000. -5
[  329.490933] ACPI: EC: interrupt blocked

That commit keeps the codec suspended during the system suspend. However,
led_suspend() for mute and micmute led writes codec register, triggers
a pending wake up. The wakeup is then handled in __device_suspend() by
the following:
- pm_runtime_disable() to handle the wakeup event.
- device is no longer is suspended state, direct-complete isn't taken.
- pm_runtime_enable() to balance disable_depth.

if (dev->power.direct_complete) {
	if (pm_runtime_status_suspended(dev)) {
		pm_runtime_disable(dev);
		if (pm_runtime_status_suspended(dev)) {
			pm_dev_dbg(dev, state, "direct-complete ");
			goto Complete;
		}

		pm_runtime_enable(dev);
	}
	dev->power.direct_complete = false;
}

Since direct-complete doens't apply anymore, the codec's system suspend
routine is used.

This doesn't play well with SOF driver. When its runtime resume is
called for system suspend, hda_codec_jack_check() schedules
jackpoll_work which uses snd_hdac_is_power_on() to check whether codec
is suspended. Because of the previous pm_runtime_enable(),
snd_hdac_is_power_on() returns false and jackpoll continues to run, and
snd_hda_power_up_pm() cannot power up an already suspended codec in
multiple attempts, causes the long delay on system suspend.

When direct-complete path is taken, snd_hdac_is_power_on() returns true
and hda_jackpoll_work() is skipped by accident. This is still not
correct, and it will be addressed by later patch.

Explicitly runtime resume codec on setting LED to solve the issue.

Fixes: 215a22ed31a1 ("ALSA: hda: Refactor codec PM to use direct-complete optimization")
---
v3:
 New patch.

 sound/pci/hda/patch_realtek.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 3c1d2a3fb1a4..304a7bc89fcd 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -4164,7 +4164,10 @@ static void alc_update_gpio_led(struct hda_codec *codec, unsigned int mask,
 {
 	if (polarity)
 		enabled = !enabled;
+	/* temporarily power up/down for setting GPIO */
+	snd_hda_power_up_pm(codec);
 	alc_update_gpio_data(codec, mask, !enabled); /* muted -> LED on */
+	snd_hda_power_down_pm(codec);
 }
 
 /* turn on/off mute LED via GPIO per vmaster hook */
@@ -4287,8 +4290,10 @@ static void alc_update_coef_led(struct hda_codec *codec,
 	if (polarity)
 		on = !on;
 	/* temporarily power up/down for setting COEF bit */
+	snd_hda_power_up_pm(codec);
 	alc_update_coef_idx(codec, led->idx, led->mask,
 			    on ? led->on : led->off);
+	snd_hda_power_down_pm(codec);
 }
 
 /* update mute-LED according to the speaker mute state via COEF bit */
-- 
2.29.2

