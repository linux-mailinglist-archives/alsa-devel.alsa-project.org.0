Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD12387434
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 10:41:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AF0816BA;
	Tue, 18 May 2021 10:40:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AF0816BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621327279;
	bh=kttx+y9cZCAJ7bjUpuoCHkWFdW2Uq1OynjEPi1jMj7A=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IZOuc17B8eG/yJWgLA6hJu7joC9jZLFHr5inaPjUyLbc38diMLhZ6JTBWFWxeOrIe
	 kV27gvIz+asaJPmL5p9BbKra9E3HpFEkGXVivngXwwYKv8lC/ZG8b7hdfLVJWmBYrW
	 NEqgqogaWRH1lJJDT+FeeKw8zlO22TZqeXuR326s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 898B5F8012C;
	Tue, 18 May 2021 10:39:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB9A4F80217; Tue, 18 May 2021 10:39:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB894F8012C
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 10:39:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB894F8012C
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AA1C5AE1C;
 Tue, 18 May 2021 08:39:41 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: line6: Fix racy initialization of LINE6 MIDI
Date: Tue, 18 May 2021 10:39:39 +0200
Message-Id: <20210518083939.1927-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Hyeonggon Yoo <42.hyeyoo@gmail.com>
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

The initialization of MIDI devices that are found on some LINE6
drivers are currently done in a racy way; namely, the MIDI buffer
instance is allocated and initialized in each private_init callback
while the communication with the interface is already started via
line6_init_cap_control() call before that point.  This may lead to
Oops in line6_data_received() when a spurious event is received, as
reported by syzkaller.

This patch moves the MIDI initialization to line6_init_cap_control()
as well instead of the too-lately-called private_init for avoiding the
race.  Also this reduces slightly more lines, so it's a win-win
change.

Reported-by: syzbot+0d2b3feb0a2887862e06@syzkallerlkml..appspotmail.com
Link: https://lore.kernel.org/r/000000000000a4be9405c28520de@google.com
Link: https://lore.kernel.org/r/20210517132725.GA50495@hyeyoo
Cc: Hyeonggon Yoo <42.hyeyoo@gmail.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/line6/driver.c | 4 ++++
 sound/usb/line6/pod.c    | 5 -----
 sound/usb/line6/variax.c | 6 ------
 3 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/sound/usb/line6/driver.c b/sound/usb/line6/driver.c
index a030dd65eb28..9602929b7de9 100644
--- a/sound/usb/line6/driver.c
+++ b/sound/usb/line6/driver.c
@@ -699,6 +699,10 @@ static int line6_init_cap_control(struct usb_line6 *line6)
 		line6->buffer_message = kmalloc(LINE6_MIDI_MESSAGE_MAXLEN, GFP_KERNEL);
 		if (!line6->buffer_message)
 			return -ENOMEM;
+
+		ret = line6_init_midi(line6);
+		if (ret < 0)
+			return ret;
 	} else {
 		ret = line6_hwdep_init(line6);
 		if (ret < 0)
diff --git a/sound/usb/line6/pod.c b/sound/usb/line6/pod.c
index cd44cb5f1310..16e644330c4d 100644
--- a/sound/usb/line6/pod.c
+++ b/sound/usb/line6/pod.c
@@ -376,11 +376,6 @@ static int pod_init(struct usb_line6 *line6,
 	if (err < 0)
 		return err;
 
-	/* initialize MIDI subsystem: */
-	err = line6_init_midi(line6);
-	if (err < 0)
-		return err;
-
 	/* initialize PCM subsystem: */
 	err = line6_init_pcm(line6, &pod_pcm_properties);
 	if (err < 0)
diff --git a/sound/usb/line6/variax.c b/sound/usb/line6/variax.c
index ed158f04de80..c2245aa93b08 100644
--- a/sound/usb/line6/variax.c
+++ b/sound/usb/line6/variax.c
@@ -159,7 +159,6 @@ static int variax_init(struct usb_line6 *line6,
 		       const struct usb_device_id *id)
 {
 	struct usb_line6_variax *variax = line6_to_variax(line6);
-	int err;
 
 	line6->process_message = line6_variax_process_message;
 	line6->disconnect = line6_variax_disconnect;
@@ -172,11 +171,6 @@ static int variax_init(struct usb_line6 *line6,
 	if (variax->buffer_activate == NULL)
 		return -ENOMEM;
 
-	/* initialize MIDI subsystem: */
-	err = line6_init_midi(&variax->line6);
-	if (err < 0)
-		return err;
-
 	/* initiate startup procedure: */
 	schedule_delayed_work(&line6->startup_work,
 			      msecs_to_jiffies(VARIAX_STARTUP_DELAY1));
-- 
2.26.2

