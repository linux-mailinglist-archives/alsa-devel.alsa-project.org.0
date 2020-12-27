Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D28E2E3138
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Dec 2020 14:06:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE7E3176A;
	Sun, 27 Dec 2020 14:06:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE7E3176A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609074417;
	bh=BK+DlmagNe0mMkcqFfnOAOqR2QYkm1a+8xT2z5ZlJnI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eMnu/usZwjkG9fs5HKpgICpu531U6kj2y19rGLOJAmAfz8Q/pOg/OmpIBmCt3IUyD
	 zSR8N+F0OzpUYUCm/Rxfx8Rvtjf6NFsK6EEPHjxzLcaZf1Cb7AT45tXosoGOyXGmOY
	 q2+eITA6+vMEkcK/DJPMSFp7t7eTB+kpjtt0Rl2c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86AC0F8022D;
	Sun, 27 Dec 2020 14:05:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3746F8022B; Sun, 27 Dec 2020 14:05:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-m963.mail.126.com (mail-m963.mail.126.com [123.126.96.3])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6504F80169
 for <alsa-devel@alsa-project.org>; Sun, 27 Dec 2020 14:05:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6504F80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=126.com header.i=@126.com
 header.b="cF5XRXkX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=z3Vnq31DxKVyPM1hK6
 Zk4ooSbMhCB5IcK28zkGpz+eg=; b=cF5XRXkXfYCX8adgqACgW9jUa9FeRFHX1n
 7m2WMVmh8Fd4JGjnneVKdJgX0JOoEpSfbPSCrkfa/kPQdFBgS/NWgJWI6bgmXwq8
 sDvB6x/3LWWgsUhhUKwkUZyuUiOKvVZJgSYZUgjIFOFmLeE6Rnjq0VdroJhe4Aac
 9eR2gDnPs=
Received: from localhost.localdomain (unknown [36.112.86.14])
 by smtp8 (Coremail) with SMTP id NORpCgDnE1SBhuhfwJ5wBA--.10417S2;
 Sun, 27 Dec 2020 21:05:07 +0800 (CST)
From: Defang Bo <bodefang@126.com>
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] ALSA:usb-audio:check urb before kill it
Date: Sun, 27 Dec 2020 21:04:59 +0800
Message-Id: <1609074299-3990670-1-git-send-email-bodefang@126.com>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: NORpCgDnE1SBhuhfwJ5wBA--.10417S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtr4DJF4rWryxArWUurWfKrg_yoW3tFc_Wr
 s3Xw18GryUG347Cr1UGw42vw1rtw4xZ3WxZwsrt3yrXFyvkFy5tw40qryDG3Z2kr4kXFZr
 Ar1kuFy3Zry2gjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUgo7tUUUUU==
X-Originating-IP: [36.112.86.14]
X-CM-SenderInfo: pergvwxdqjqiyswou0bp/1tbiFg0I11pECs+7hQAAsh
Cc: alsa-devel@alsa-project.org, kai.heng.feng@canonical.com,
 linux-kernel@vger.kernel.org, Defang Bo <bodefang@126.com>, tom.ty89@gmail.com
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

Similar to commit<124751d5e>, there should be a check for urb before kill it.

Signed-off-by: Defang Bo <bodefang@126.com>
---
 sound/usb/mixer.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 81e987e..0223ef3 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -3589,8 +3589,10 @@ void snd_usb_mixer_disconnect(struct usb_mixer_interface *mixer)
 /* stop any bus activity of a mixer */
 static void snd_usb_mixer_inactivate(struct usb_mixer_interface *mixer)
 {
-	usb_kill_urb(mixer->urb);
-	usb_kill_urb(mixer->rc_urb);
+	if (mixer->urb)
+		usb_kill_urb(mixer->urb);
+	if (mixer->rc_urb)
+		usb_kill_urb(mixer->rc_urb);
 }
 
 static int snd_usb_mixer_activate(struct usb_mixer_interface *mixer)
-- 
2.7.4

