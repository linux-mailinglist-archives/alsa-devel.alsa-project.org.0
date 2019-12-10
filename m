Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E92511936F
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 22:12:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96DEE166C;
	Tue, 10 Dec 2019 22:11:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96DEE166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576012319;
	bh=VtapHsD2bWmH5OEE/ldyou6DEWzWukoZ+LiBaUkGYms=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZOr36F4VaODdneUQhCGYTIh1IetB+fjpUTrpYJx5+KhE88wX6adsylpHB6TYjiD2w
	 EI5E4rV9Ziek+/mVWI1VIaqEyylYv7X5K3JJE9YHTb/ottcHSQTHhbSYR2UadnYkRA
	 3PfuMzYq0OzQ8pQpvsfEgEQ7k2Junzq9TDG/8SBg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35B33F80255;
	Tue, 10 Dec 2019 22:10:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90D47F80254; Tue, 10 Dec 2019 22:10:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDD4FF800F3
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 22:10:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDD4FF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EB3oeAZH"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 78F1E246AD;
 Tue, 10 Dec 2019 21:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576012220;
 bh=QLCQh0vfV7h/ZjC9RNBV9ppkij/a1m7fig8tN2/1+Dc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EB3oeAZHDppBQIVMS7t9sdZ/KMxxloRuZ6AJ5TpyRFjrIjfe9+v7F+cBNMRcREiiL
 JXd/+VnS64mDU1QhA199ALrfoDncOmSShZXomajMKSj5cVLKahfFu3R3aT2vpqIM28
 qFGlHUOrj96paTx2GRl8SrZSkjhYns2YP1qWyXKY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Tue, 10 Dec 2019 16:04:35 -0500
Message-Id: <20191210210735.9077-131-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210210735.9077-1-sashal@kernel.org>
References: <20191210210735.9077-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org, Chris Wilson <chris@chris-wilson.co.uk>
Subject: [alsa-devel] [PATCH AUTOSEL 5.4 170/350] ALSA: hda - Fix pending
	unsol events at shutdown
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Takashi Iwai <tiwai@suse.de>

[ Upstream commit ca58f55108fee41d87c9123f85ad4863e5de7f45 ]

This is an alternative fix attemp for the issue reported in the commit
caa8422d01e9 ("ALSA: hda: Flush interrupts on disabling") that was
reverted later due to regressions.  Instead of tweaking the hardware
disablement order and the enforced irq flushing, do calling
cancel_work_sync() of the unsol work early enough, and explicitly
ignore the unsol events during the shutdown by checking the
bus->shutdown flag.

Fixes: caa8422d01e9 ("ALSA: hda: Flush interrupts on disabling")
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Link: https://lore.kernel.org/r/s5h1ruxt9cz.wl-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/hda_bind.c  | 4 ++++
 sound/pci/hda/hda_intel.c | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/sound/pci/hda/hda_bind.c b/sound/pci/hda/hda_bind.c
index 8272b50b83493..6a85645663759 100644
--- a/sound/pci/hda/hda_bind.c
+++ b/sound/pci/hda/hda_bind.c
@@ -43,6 +43,10 @@ static void hda_codec_unsol_event(struct hdac_device *dev, unsigned int ev)
 {
 	struct hda_codec *codec = container_of(dev, struct hda_codec, core);
 
+	/* ignore unsol events during shutdown */
+	if (codec->bus->shutdown)
+		return;
+
 	if (codec->patch_ops.unsol_event)
 		codec->patch_ops.unsol_event(codec, ev);
 }
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index c52419376c748..86a416cdeb296 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1382,8 +1382,11 @@ static int azx_free(struct azx *chip)
 static int azx_dev_disconnect(struct snd_device *device)
 {
 	struct azx *chip = device->device_data;
+	struct hdac_bus *bus = azx_bus(chip);
 
 	chip->bus.shutdown = 1;
+	cancel_work_sync(&bus->unsol_work);
+
 	return 0;
 }
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
