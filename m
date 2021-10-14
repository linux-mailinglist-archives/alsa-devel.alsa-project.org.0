Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E24342D9BF
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Oct 2021 15:08:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FE431664;
	Thu, 14 Oct 2021 15:07:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FE431664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634216900;
	bh=JA9FK3eJiGhP9jAB4ELZo4r7Q2en6tU7cHdpzeAGfHk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UrhGhYUxL5385lA9MI77SIzyjdbCwmfI5CceM1nnCejJfBZkSZ86YbXuiu7O0EwTF
	 aKYl9+zwEYVfweuPsrqenidoppkki7TgeyDMpmuytzmJvGwAxRjBs0cbR9arNnLdpQ
	 JwahW/fVStCRlSwbff0pSfGQsaw2casQjsFgAvxw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 224D0F804E6;
	Thu, 14 Oct 2021 15:06:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D016EF804E5; Thu, 14 Oct 2021 15:06:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80069F8016C
 for <alsa-devel@alsa-project.org>; Thu, 14 Oct 2021 15:06:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80069F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="1n/svAA7"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="zu/Hd3JN"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 207841FD36;
 Thu, 14 Oct 2021 13:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634216799; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/c8fJy4bKqMYhmQkaVpdRsEYGLwA9KNgZQcwQdyy8b8=;
 b=1n/svAA7Q1NUeQ6WgwgxlhVtsphidcEOk/w9iUjX1vNh6zjDSg6edFyhwzWRL6bJ2qzwCQ
 fKaZSX0JhOK8DtH/wYPIyDvkAwCN8JvReFGWM4HxEP4ysHH7H52Nw6+8xB7MxVaIfS/1o/
 l6Qlch4qoZYkdTbfmFIK7vn/pR9fPrA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634216799;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/c8fJy4bKqMYhmQkaVpdRsEYGLwA9KNgZQcwQdyy8b8=;
 b=zu/Hd3JNzDbceXVa1EtqEE3xeyd2DPGUjZMgipgl3cXa2Z5UqKGsxLTEcx7w4gVxVbftKl
 1iIcy9O6zPN6VRCA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 0E00FA3B84;
 Thu, 14 Oct 2021 13:06:39 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/3] ALSA: usb-audio: Drop superfluous error message after
 disconnection
Date: Thu, 14 Oct 2021 15:06:35 +0200
Message-Id: <20211014130636.17860-3-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211014130636.17860-1-tiwai@suse.de>
References: <20211014130636.17860-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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

The error from snd_usb_lock_shutdown() indicates that the device is
disconnected, hence it makes no sense to show any further control
message error in get_ctl_value_v2().  Return the error directly
instead.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index a20af9243155..60d394361a43 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -361,9 +361,8 @@ static int get_ctl_value_v2(struct usb_mixer_elem_info *cval, int request,
 
 	memset(buf, 0, sizeof(buf));
 
-	ret = snd_usb_lock_shutdown(chip) ? -EIO : 0;
-	if (ret)
-		goto error;
+	if (snd_usb_lock_shutdown(chip))
+		return -EIO;
 
 	idx = mixer_ctrl_intf(cval->head.mixer) | (cval->head.id << 8);
 	ret = snd_usb_ctl_msg(chip->dev, usb_rcvctrlpipe(chip->dev, 0), bRequest,
@@ -372,7 +371,6 @@ static int get_ctl_value_v2(struct usb_mixer_elem_info *cval, int request,
 	snd_usb_unlock_shutdown(chip);
 
 	if (ret < 0) {
-error:
 		usb_audio_dbg(chip,
 			"cannot get ctl value: req = %#x, wValue = %#x, wIndex = %#x, type = %d\n",
 			request, validx, idx, cval->val_type);
-- 
2.26.2

