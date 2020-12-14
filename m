Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6012D9335
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Dec 2020 07:08:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 430981727;
	Mon, 14 Dec 2020 07:07:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 430981727
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607926111;
	bh=1KZ2t8Sc5i8qDgy2xhvwuoBxTa9noTTGipn3KiE6uMI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gudr1SG5haRrwOWnl3A03xGB4zMlK74df2qxzQZaCyw8IaP27BAvdLHmkD5WSjis2
	 ByjTd7+NAJwfLqJUi2QVW8NJFEwKVeuxi03QQhBPTYLXVIujW36Lf2oshrZaKP2CE3
	 26eTSoqHw/xZ8JI2l5ZIaMLXdmeB6Iu53VxhSauA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4ED4F80121;
	Mon, 14 Dec 2020 07:06:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8450F801F7; Mon, 14 Dec 2020 07:06:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=5.0 tests=AC_FROM_MANY_DOTS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99948F800ED
 for <alsa-devel@alsa-project.org>; Mon, 14 Dec 2020 07:06:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99948F800ED
Received: from 1-171-239-132.dynamic-ip.hinet.net ([1.171.239.132]
 helo=localhost) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>)
 id 1koh07-0004hH-Ao; Mon, 14 Dec 2020 06:06:28 +0000
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: tiwai@suse.com
Subject: [PATCH] ALSA: hda: Enable runtime PM when codec probe fails
Date: Mon, 14 Dec 2020 14:06:20 +0800
Message-Id: <20201214060621.1102931-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Alex Deucher <alexander.deucher@amd.com>, Mike Rapoport <rppt@kernel.org>
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

When codec probe fails, it doesn't enable runtime suspend, and can
prevent graphics card from getting powered down:
[    4.280991] snd_hda_intel 0000:01:00.1: no codecs initialized

$ cat /sys/bus/pci/devices/0000:01:00.1/power/runtime_status
active

So enable runtime PM when codec probe fails, to let graphics card be
able to runtime suspend again.

Merge azx_probe_continue() into azx_probe() and just let probe fail for
this case could be a better approach. However that's a much bigger task
so let's settle with a quirk workaround.

BugLink: https://bugs.launchpad.net/bugs/1907212
Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 sound/pci/hda/hda_intel.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 6852668f1bcb..3fd920069268 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2328,7 +2328,7 @@ static int azx_probe_continue(struct azx *chip)
 	if (bus->codec_mask) {
 		err = azx_probe_codecs(chip, azx_max_codecs[chip->driver_type]);
 		if (err < 0)
-			goto out_free;
+			goto out_enable_rpm;
 	}
 
 #ifdef CONFIG_SND_HDA_PATCH_LOADER
@@ -2360,6 +2360,7 @@ static int azx_probe_continue(struct azx *chip)
 
 	set_default_power_save(chip);
 
+out_enable_rpm:
 	if (azx_has_pm_runtime(chip)) {
 		pm_runtime_use_autosuspend(&pci->dev);
 		pm_runtime_allow(&pci->dev);
-- 
2.29.2

