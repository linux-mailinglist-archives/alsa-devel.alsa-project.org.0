Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD6041D903
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Sep 2021 13:42:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC25116B1;
	Thu, 30 Sep 2021 13:41:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC25116B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633002153;
	bh=UVnyjZtUseiqk/d7avs5zWGjhPiLiI16FCZH1NQDxrg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GaZsYkLJQ1DC9EestXQ3YgZjCSfXvI+XrmzaAuk3W4teJZI7wYtCUUXNxB8g6f2Je
	 ZkG7Ulz6VWa74PiLAmZCQFE8pd5ZnlPRFttMuJdva+bb486/Js54e3e+jfLdimIs+y
	 YqgqhjcBzHADSIRB5yxNK/L6ife4ZGluJ5k/8hlg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DDABF804D6;
	Thu, 30 Sep 2021 13:41:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C02DCF80218; Thu, 30 Sep 2021 13:41:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6270EF80218
 for <alsa-devel@alsa-project.org>; Thu, 30 Sep 2021 13:41:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6270EF80218
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="e98NkaJL"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="4z7ER4ds"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id B238E20018;
 Thu, 30 Sep 2021 11:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1633002079; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=mjCb0/R5/rCQLP3XwxAwEARpZnRYMd9pA2ThPMJGQxQ=;
 b=e98NkaJLhMYUDYHwuWi2ppzPIJo8cF3i0r0vvSWW/Oni/EyitFBJ4ruUI9V74LFW2Dvz66
 k30oGYPZIKFl6cjkOZJcvSvg5xvDyiKI75wHjy/uYyf/Y5s8TFVn1uxYkI+8jgDh5D19W7
 VQLusGkxsjbjIXNgdcoEO7LyEa50m78=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1633002079;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=mjCb0/R5/rCQLP3XwxAwEARpZnRYMd9pA2ThPMJGQxQ=;
 b=4z7ER4dsL0LV2HuOhET69Sx8CuIML38sxfTdNKxfNbRebRwa5HkOcP+U/kAfim2mQ/1+0n
 LNU1OkNZHvytYbCQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id AEFF1A3B83;
 Thu, 30 Sep 2021 11:41:19 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: seq: Fix a potential UAF by wrong private_free call
 order
Date: Thu, 30 Sep 2021 13:41:14 +0200
Message-Id: <20210930114114.8645-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: John Keeping <john@metanate.com>
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

John Keeping reported and posted a patch for a potential UAF in
rawmidi sequencer destruction: the snd_rawmidi_dev_seq_free() may be
called after the associated rawmidi object got already freed.
After a deeper look, it turned out that the bug is rather the
incorrect private_free call order for a snd_seq_device.  The
snd_seq_device private_free gets called at the release callback of the
sequencer device object, while this was rather expected to be executed
at the snd_device call chains that runs at the beginning of the whole
card-free procedure.  It's been broken since the rewrite of
sequencer-device binding (although it hasn't surfaced because the
sequencer device release happens usually right along with the card
device release).

This patch corrects the private_free call to be done in the right
place, at snd_seq_device_dev_free().

Fixes: 7c37ae5c625a ("ALSA: seq: Rewrite sequencer device binding with standard bus")
Reported-and-tested-by: John Keeping <john@metanate.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq_device.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/core/seq_device.c b/sound/core/seq_device.c
index 382275c5b193..7f3fd8eb016f 100644
--- a/sound/core/seq_device.c
+++ b/sound/core/seq_device.c
@@ -156,6 +156,8 @@ static int snd_seq_device_dev_free(struct snd_device *device)
 	struct snd_seq_device *dev = device->device_data;
 
 	cancel_autoload_drivers();
+	if (dev->private_free)
+		dev->private_free(dev);
 	put_device(&dev->dev);
 	return 0;
 }
@@ -183,11 +185,7 @@ static int snd_seq_device_dev_disconnect(struct snd_device *device)
 
 static void snd_seq_dev_release(struct device *dev)
 {
-	struct snd_seq_device *sdev = to_seq_dev(dev);
-
-	if (sdev->private_free)
-		sdev->private_free(sdev);
-	kfree(sdev);
+	kfree(to_seq_dev(dev));
 }
 
 /*
-- 
2.26.2

