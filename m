Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE704428136
	for <lists+alsa-devel@lfdr.de>; Sun, 10 Oct 2021 14:24:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8355B1687;
	Sun, 10 Oct 2021 14:23:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8355B1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633868654;
	bh=MFImbL7l7iaihtx0OWpPhL0Cx6Oqn4VM20u+CfvjnGU=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PV7qHmpVaQbADeC8eeCEhL508TFhSy9bipc8+q1CW9pTxKliUc8uYeo2RxrABwnXV
	 n9KxA6Cf9oDn6hRIJ4Fas5U5KPg63vV9otVuZpqTWXXQMAMl7pmjnVgi8ReQ6Uym/u
	 rMncby73NkSClvD+8bwepGQGVixoSU/ajaTrF1hk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D53C2F80212;
	Sun, 10 Oct 2021 14:22:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D8B2F801F7; Sun, 10 Oct 2021 14:22:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69553F8016D
 for <alsa-devel@alsa-project.org>; Sun, 10 Oct 2021 14:22:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69553F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="d0VzwahR"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E18DE60EDF;
 Sun, 10 Oct 2021 12:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1633868564;
 bh=MFImbL7l7iaihtx0OWpPhL0Cx6Oqn4VM20u+CfvjnGU=;
 h=Date:From:To:Cc:Subject:From;
 b=d0VzwahRyfgcYxaVj3SNb8rpNrrtMItE8E3pKQ8e6B95dPQC3StN7N2lFrV6q0YNA
 o+s0J+KlErfnkJdn726PuyhnECiSmeCBOohx07DBGtEb9TE7r6MzGtIWi5D8CHOqPq
 nEzQXlzxwg3C8IjrWMnm+ZdN8lbUGH06GBiyQD6E=
Date: Sun, 10 Oct 2021 14:22:41 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ALSA: usb-audio: allow -EPIPE errors for some v2 messages
Message-ID: <YWLbEdHUE3k/i0fe@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

The Schiit Hel device does not like to respond to all get_ctl_value_v2()
requests for some reason.  This used to work in older kernels, but now
with more strict checking, this failure causes the device to fail to
work.

Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---

This fixes the Shiit Hel device that I have.  It used to work on older
kernels (a year ago?), but stopped working for some reason and I didn't
take the time to track it down.  This change fixes the issue for me, but
feels wrong for some reason.  At least now I can use the device as a
headphone driver, much better than the built-in one for my current
machine...

If needed, I can take the time to do bisection to track down the real
issue here, it might be due to stricter endpoint checking in the USB
core, but that feels wrong somehow.

Here's the debugfs USB output for this device, showing the endpoints:

T:  Bus=07 Lev=02 Prnt=02 Port=01 Cnt=01 Dev#=  5 Spd=480 MxCh= 0
D:  Ver= 2.00 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=30be ProdID=0101 Rev=01.02
S:  Manufacturer=Schiit Audio
S:  Product=Schiit Hel
C:  #Ifs= 4 Cfg#= 1 Atr=c0 MxPwr=0mA
I:  If#= 0 Alt= 0 #EPs= 1 Cls=01(audio) Sub=01 Prot=20 Driver=snd-usb-audio
E:  Ad=8f(I) Atr=03(Int.) MxPS=   6 Ivl=1ms
I:  If#= 1 Alt= 1 #EPs= 2 Cls=01(audio) Sub=02 Prot=20 Driver=snd-usb-audio
E:  Ad=05(O) Atr=05(Isoc) MxPS= 104 Ivl=125us
E:  Ad=85(I) Atr=11(Isoc) MxPS=   4 Ivl=1ms
I:  If#= 2 Alt= 1 #EPs= 1 Cls=01(audio) Sub=02 Prot=20 Driver=snd-usb-audio
E:  Ad=88(I) Atr=05(Isoc) MxPS= 156 Ivl=125us
I:  If#= 3 Alt= 0 #EPs= 1 Cls=03(HID  ) Sub=00 Prot=00 Driver=usbhid
E:  Ad=84(I) Atr=03(Int.) MxPS=  16 Ivl=1ms

Any other suggestions to fix this are welcome.

 sound/usb/mixer.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index a2ce535df14b..37d3d697776b 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -371,11 +371,11 @@ static int get_ctl_value_v2(struct usb_mixer_elem_info *cval, int request,
 			      validx, idx, buf, size);
 	snd_usb_unlock_shutdown(chip);
 
-	if (ret < 0) {
+	if ((ret < 0) && (ret != -EPIPE)) {
 error:
 		usb_audio_err(chip,
-			"cannot get ctl value: req = %#x, wValue = %#x, wIndex = %#x, type = %d\n",
-			request, validx, idx, cval->val_type);
+			"cannot get ctl value: req = %#x, wValue = %#x, wIndex = %#x, type = %d, ret = %d\n",
+			request, validx, idx, cval->val_type, ret);
 		return ret;
 	}
 
-- 
2.33.0

