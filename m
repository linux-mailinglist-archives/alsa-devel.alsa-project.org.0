Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F0A3ADF72
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Jun 2021 18:49:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30A5E16CE;
	Sun, 20 Jun 2021 18:48:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30A5E16CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624207745;
	bh=6/rRnTB1nb2/M0m8guvB9SU8Ce4dDl7vWaKxh5rveWw=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Dr1fEc091QloVY5GsRyI1QGMOm5QFQ//R6wrNrsj9kZnS16oAe+arBw9Clycayrmd
	 hgB9KCZu1O/3R1bZpoE6LWVoUzQOZLmdY8M837fHRbijZuoQgXSQP+Z5QZX3qxYVwW
	 4lKbiLF8PMMepfGdhhXZsakjGDRgimBCO1HWcPcA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F4092F804DF;
	Sun, 20 Jun 2021 18:46:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 440B8F804D9; Sun, 20 Jun 2021 18:46:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D29AEF804D2
 for <alsa-devel@alsa-project.org>; Sun, 20 Jun 2021 18:46:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D29AEF804D2
Received: by m.b4.vu (Postfix, from userid 1000)
 id 60CFF61E287C; Mon, 21 Jun 2021 02:16:32 +0930 (ACST)
Date: Mon, 21 Jun 2021 02:16:32 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 05/14] ALSA: usb-audio: scarlett2: Remove interrupt debug
 message
Message-ID: <20210620164632.GA9186@m.b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Just ignore instead of printing an error if the interrupt data is not
the expected length. This check was for development and the condition
has not been observed.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett_gen2.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index a5f5c537e344..3225ec709d98 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -2018,19 +2018,14 @@ static void scarlett2_mixer_interrupt(struct urb *urb)
 	int ustatus = urb->status;
 	u32 data;
 
-	if (ustatus != 0)
+	if (ustatus != 0 || len != 8)
 		goto requeue;
 
-	if (len == 8) {
-		data = le32_to_cpu(*(__le32 *)urb->transfer_buffer);
-		if (data & SCARLETT2_USB_INTERRUPT_VOL_CHANGE)
-			scarlett2_mixer_interrupt_vol_change(mixer);
-		if (data & SCARLETT2_USB_INTERRUPT_BUTTON_CHANGE)
-			scarlett2_mixer_interrupt_button_change(mixer);
-	} else {
-		usb_audio_err(mixer->chip,
-			      "scarlett mixer interrupt length %d\n", len);
-	}
+	data = le32_to_cpu(*(__le32 *)urb->transfer_buffer);
+	if (data & SCARLETT2_USB_INTERRUPT_VOL_CHANGE)
+		scarlett2_mixer_interrupt_vol_change(mixer);
+	if (data & SCARLETT2_USB_INTERRUPT_BUTTON_CHANGE)
+		scarlett2_mixer_interrupt_button_change(mixer);
 
 requeue:
 	if (ustatus != -ENOENT &&
-- 
2.31.1

