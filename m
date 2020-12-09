Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9152D44FE
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Dec 2020 16:03:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2378116BB;
	Wed,  9 Dec 2020 16:02:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2378116BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607526189;
	bh=/1HXfGpXj7MBkBRUY/G9gZCLPilpDmQBSPICbO08RoI=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aoerEdjrHj071/IDYxez4Q3SS8e1xftXA4sEVdlMcGGuE6TcTp9IPhr81myR9ae+D
	 HNcO6GeJ26Fg+9yjKbWqHn0Rk5ZMNKUcrkCcItFmb01gNqtLE2bUfqK3DJPqlO2wmD
	 e2k67T/nYzAL0bhAXn8b+kzm1Nyu6BvgXXlDQS3I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F76FF80217;
	Wed,  9 Dec 2020 16:01:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E20EAF8020D; Wed,  9 Dec 2020 16:01:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C72F5F800EF
 for <alsa-devel@alsa-project.org>; Wed,  9 Dec 2020 16:01:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C72F5F800EF
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DEAA5AC9A
 for <alsa-devel@alsa-project.org>; Wed,  9 Dec 2020 15:01:21 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda: Fix regressions on clear and reconfig sysfs
Date: Wed,  9 Dec 2020 16:01:19 +0100
Message-Id: <20201209150119.7705-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

It seems that the HD-audio clear and reconfig sysfs don't work any
longer after the recent driver core change.  There are multiple issues
around that: the linked list corruption and the dead device handling.
The former issue is fixed by another patch for the driver core itself,
while the latter patch needs to be addressed in HD-audio side.

This patch corresponds to the latter, it recovers those broken
functions by replacing the device detach and attach actions with the
standard core API functions, which are almost equivalent with unbind
and bind actions.

Fixes: 654888327e9f ("driver core: Avoid binding drivers to dead devices")
Cc: <stable@vger.kernel.org>
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=209207
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_codec.c | 2 +-
 sound/pci/hda/hda_sysfs.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 4bb58e8b08a8..687216e74526 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -1803,7 +1803,7 @@ int snd_hda_codec_reset(struct hda_codec *codec)
 		return -EBUSY;
 
 	/* OK, let it free */
-	snd_hdac_device_unregister(&codec->core);
+	device_release_driver(hda_codec_dev(codec));
 
 	/* allow device access again */
 	snd_hda_unlock_devices(bus);
diff --git a/sound/pci/hda/hda_sysfs.c b/sound/pci/hda/hda_sysfs.c
index eb8ec109d7ad..d5ffcba794e5 100644
--- a/sound/pci/hda/hda_sysfs.c
+++ b/sound/pci/hda/hda_sysfs.c
@@ -139,7 +139,7 @@ static int reconfig_codec(struct hda_codec *codec)
 			   "The codec is being used, can't reconfigure.\n");
 		goto error;
 	}
-	err = snd_hda_codec_configure(codec);
+	err = device_reprobe(hda_codec_dev(codec));
 	if (err < 0)
 		goto error;
 	err = snd_card_register(codec->card);
-- 
2.26.2

