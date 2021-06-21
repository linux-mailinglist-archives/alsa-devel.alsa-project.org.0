Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB833AF48E
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Jun 2021 20:12:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95A4F16C2;
	Mon, 21 Jun 2021 20:11:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95A4F16C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624299169;
	bh=2NWQdEnBu1Z5wmVVzxXBr7fWOuY3ZhP69ePPnK/7j08=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D5eOzvuxJ2cSW/HsjOuUbqy0uk8ylhSclk2qGeTZEOqpB9qRdV5HpYb2rC7pCzXft
	 D0Oa9VZryg4QXbj0BIgsO/Hq2uE41bo+/cq3V14Ew/IL6C4LSjnN4mg8hP67zZnq1V
	 n3I3aiSldVxb5KlKQpblMwZ2flpoiOh+BqmsfGYw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79EC5F804FE;
	Mon, 21 Jun 2021 20:09:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2FDCF804F2; Mon, 21 Jun 2021 20:09:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 591A3F804E7
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 20:09:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 591A3F804E7
Received: by m.b4.vu (Postfix, from userid 1000)
 id DB0CE61E5F00; Tue, 22 Jun 2021 03:39:26 +0930 (ACST)
Date: Tue, 22 Jun 2021 03:39:26 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 06/31] ALSA: usb-audio: scarlett2: Merge common line in
 capture strings
Message-ID: <d91dce45ac75a541c21f47540ecbda24bd83f68c.1624294591.git.g@b4.vu>
References: <cover.1624294591.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1624294591.git.g@b4.vu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Hin-Tak Leung <htl10@users.sourceforge.net>,
 Vladimir Sadovnikov <sadko4u@gmail.com>
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

Use a common sprintf() format for the mixer element names generated in
scarlett2_add_line_in_ctls() in preparation for more of them.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett_gen2.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 4c2ae81f94a8..c401b7d56408 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -1660,10 +1660,11 @@ static int scarlett2_add_line_in_ctls(struct usb_mixer_interface *mixer)
 	const struct scarlett2_device_info *info = private->info;
 	int err, i;
 	char s[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
+	const char *fmt = "Line In %d %s Capture %s";
 
 	/* Add input level (line/inst) controls */
 	for (i = 0; i < info->level_input_count; i++) {
-		snprintf(s, sizeof(s), "Line In %d Level Capture Enum", i + 1);
+		snprintf(s, sizeof(s), fmt, i + 1, "Level", "Enum");
 		err = scarlett2_add_new_ctl(mixer, &scarlett2_level_enum_ctl,
 					    i, 1, s, NULL);
 		if (err < 0)
@@ -1672,7 +1673,7 @@ static int scarlett2_add_line_in_ctls(struct usb_mixer_interface *mixer)
 
 	/* Add input pad controls */
 	for (i = 0; i < info->pad_input_count; i++) {
-		snprintf(s, sizeof(s), "Line In %d Pad Capture Switch", i + 1);
+		snprintf(s, sizeof(s), fmt, i + 1, "Pad", "Switch");
 		err = scarlett2_add_new_ctl(mixer, &scarlett2_pad_ctl,
 					    i, 1, s, NULL);
 		if (err < 0)
-- 
2.31.1

