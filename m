Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5139C2E2BE6
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Dec 2020 17:49:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7B9E1852;
	Fri, 25 Dec 2020 17:48:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7B9E1852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608914981;
	bh=HFiF3ffqo+Y+LtBc/U+zHvPRHGdS/sqTgH95EEVIpzk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TTASY4Fq9u2CLcJWeU6D+rJoEQi+Lo830yBYiZp4eNd4Bct1+GrruDY2yamCuTCo/
	 QcuSIjml5XmMhn7qR71UjKl0nQ5hxGUHoRTPMQa2G2mJySGZKBnbDt8Ui08tm+kxFv
	 0G0lH7uEVtiLH/ocZccUbZDwmP3A42HzT2kze+z4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F899F80168;
	Fri, 25 Dec 2020 17:48:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FAFAF801D5; Fri, 25 Dec 2020 17:48:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=AC_FROM_MANY_DOTS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B98A7F80128
 for <alsa-devel@alsa-project.org>; Fri, 25 Dec 2020 17:47:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B98A7F80128
Received: from 1-171-89-5.dynamic-ip.hinet.net ([1.171.89.5] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>)
 id 1ksqFd-0000Km-W6; Fri, 25 Dec 2020 16:47:39 +0000
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: tiwai@suse.com
Subject: [PATCH] ALSA: hda: Resume codec for system suspend if LED is
 controlled by codec
Date: Sat, 26 Dec 2020 00:47:23 +0800
Message-Id: <20201225164727.103280-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 Randy Dunlap <rdunlap@infradead.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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

Laptop with codec controlled LEDs takes a very long time to suspend
after commit 215a22ed31a1 ("ALSA: hda: Refactor codec PM to use
direct-complete optimization"):
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

That commit keeps codec suspended during the system suspend. This
doesn't play well with codec controlled mute and micmute LEDs, because
LED core will use codec registers to turn off those LEDs.

Currently, all users of create_mute_led_cdev() use codec to control
LED, so unconditionally runtime resume those codecs before system
suspend to solve the problem.

Fixes: 215a22ed31a1 ("ALSA: hda: Refactor codec PM to use direct-complete optimization")
Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 include/sound/hda_codec.h   | 1 +
 sound/pci/hda/hda_codec.c   | 7 +++++++
 sound/pci/hda/hda_generic.c | 1 +
 3 files changed, 9 insertions(+)

diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
index 2e8d51937acd..b01d76abe008 100644
--- a/include/sound/hda_codec.h
+++ b/include/sound/hda_codec.h
@@ -255,6 +255,7 @@ struct hda_codec {
 	unsigned int relaxed_resume:1;	/* don't resume forcibly for jack */
 	unsigned int forced_resume:1; /* forced resume for jack */
 	unsigned int mst_no_extra_pcms:1; /* no backup PCMs for DP-MST */
+	unsigned int resume_for_sleep:1;  /* runtime resume for system sleep */
 
 #ifdef CONFIG_PM
 	unsigned long power_on_acct;
diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 687216e74526..b890d9b4339e 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -2983,6 +2983,13 @@ static int hda_codec_runtime_resume(struct device *dev)
 #ifdef CONFIG_PM_SLEEP
 static int hda_codec_pm_prepare(struct device *dev)
 {
+	struct hda_codec *codec = dev_to_hda_codec(dev);
+
+	if (codec->resume_for_sleep) {
+		pm_runtime_resume(dev);
+		return 0;
+	}
+
 	return pm_runtime_suspended(dev);
 }
 
diff --git a/sound/pci/hda/hda_generic.c b/sound/pci/hda/hda_generic.c
index 8060cc86dfea..6d259d5bb5bb 100644
--- a/sound/pci/hda/hda_generic.c
+++ b/sound/pci/hda/hda_generic.c
@@ -3913,6 +3913,7 @@ static int create_mute_led_cdev(struct hda_codec *codec,
 	cdev->brightness_set_blocking = callback;
 	cdev->brightness = ledtrig_audio_get(micmute ? LED_AUDIO_MICMUTE : LED_AUDIO_MUTE);
 	cdev->flags = LED_CORE_SUSPENDRESUME;
+	codec->resume_for_sleep = 1;
 
 	return devm_led_classdev_register(&codec->core.dev, cdev);
 }
-- 
2.29.2

