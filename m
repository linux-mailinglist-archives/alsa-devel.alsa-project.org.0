Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 335FD12F5B8
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jan 2020 09:49:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2FC2175E;
	Fri,  3 Jan 2020 09:49:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2FC2175E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578041393;
	bh=l3pqrPB7dTvzzFltt7Sh+LrY4s231xUJqcQWp+1ZyIA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mJBXe3mcj6wW/qsAxVFYMkFlaAn7PGfsV0SPw0XEn7bKBG6hlmkmlmAdqmkFmLBJk
	 3n61hf4MzFruyWCWKKPRI9foZrNX27AJuTNr3vcX3gjlGkIeFhLO9bSg+mo8GdHw9g
	 5moBVq0QQQ4+9qs+urmP0NeYimSmRdTnc60Ni9VY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C969F804DC;
	Fri,  3 Jan 2020 09:19:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D631F802DC; Fri,  3 Jan 2020 09:18:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94BA4F802DC
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 09:17:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94BA4F802DC
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 16F23B1F7
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 08:17:22 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri,  3 Jan 2020 09:17:06 +0100
Message-Id: <20200103081714.9560-51-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200103081714.9560-1-tiwai@suse.de>
References: <20200103081714.9560-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 50/58] ALSA: line6: Constify snd_ratden
	definitions
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

The snd_ratden definitions used in line6 drivers are all read-only, so
they can be marked as const.

There should be no functional changes by this patch.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/line6/pod.c      | 2 +-
 sound/usb/line6/podhd.c    | 2 +-
 sound/usb/line6/toneport.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/usb/line6/pod.c b/sound/usb/line6/pod.c
index ee4c9d220fdf..cd44cb5f1310 100644
--- a/sound/usb/line6/pod.c
+++ b/sound/usb/line6/pod.c
@@ -110,7 +110,7 @@ enum {
 	POD_BUSY_MIDISEND
 };
 
-static struct snd_ratden pod_ratden = {
+static const struct snd_ratden pod_ratden = {
 	.num_min = 78125,
 	.num_max = 78125,
 	.num_step = 1,
diff --git a/sound/usb/line6/podhd.c b/sound/usb/line6/podhd.c
index 27bf61c177c0..d37db32ecd3b 100644
--- a/sound/usb/line6/podhd.c
+++ b/sound/usb/line6/podhd.c
@@ -42,7 +42,7 @@ struct usb_line6_podhd {
 
 #define line6_to_podhd(x)	container_of(x, struct usb_line6_podhd, line6)
 
-static struct snd_ratden podhd_ratden = {
+static const struct snd_ratden podhd_ratden = {
 	.num_min = 48000,
 	.num_max = 48000,
 	.num_step = 1,
diff --git a/sound/usb/line6/toneport.c b/sound/usb/line6/toneport.c
index d0a555dbe324..94dd5e7ab2e6 100644
--- a/sound/usb/line6/toneport.c
+++ b/sound/usb/line6/toneport.c
@@ -63,7 +63,7 @@ static int toneport_send_cmd(struct usb_device *usbdev, int cmd1, int cmd2);
 
 #define TONEPORT_PCM_DELAY 1
 
-static struct snd_ratden toneport_ratden = {
+static const struct snd_ratden toneport_ratden = {
 	.num_min = 44100,
 	.num_max = 44100,
 	.num_step = 1,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
