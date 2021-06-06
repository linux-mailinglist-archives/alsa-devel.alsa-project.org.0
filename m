Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 617B839D041
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Jun 2021 19:47:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F02F11670;
	Sun,  6 Jun 2021 19:46:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F02F11670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623001666;
	bh=kuJT+E4zwOz8JIv72PobnK414Vn/vTzvTSICT9O8o6M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YDpSBVdMHzK1v7HQEoczz5YJ03tS5JVyqvcJMMgX8I45h+9ADTXPtrAuog0hIpfij
	 p5tsBlvHb+F69WvhU+A7kDKOlHgrcJPsepC/I+ZEapzm0KKB1uwkvBcxGyrsdDOoXh
	 2HMQLOJNZ7Knu+4RvdSjWDrYkCkq5+IHu9Dk9ak4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8670DF804BC;
	Sun,  6 Jun 2021 19:46:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C2B0F804D1; Sun,  6 Jun 2021 19:46:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CEDCDF804CF
 for <alsa-devel@alsa-project.org>; Sun,  6 Jun 2021 19:46:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEDCDF804CF
Received: by m.b4.vu (Postfix, from userid 1000)
 id 5C87E612FB14; Mon,  7 Jun 2021 03:16:05 +0930 (ACST)
Date: Mon, 7 Jun 2021 03:16:05 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 4/8] ALSA: usb-audio: scarlett2: Remove interrupt debug message
Message-ID: <26c68450810d6cd3770bc895feb105a7eb94618a.1622999147.git.g@b4.vu>
References: <cover.1622999147.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1622999147.git.g@b4.vu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Vladimir Sadovnikov <sadko4u@gmail.com>
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
index b134663f331a..3f1148bc0883 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -2019,19 +2019,14 @@ static void scarlett2_mixer_interrupt(struct urb *urb)
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

