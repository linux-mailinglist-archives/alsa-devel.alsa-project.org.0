Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6434C41E923
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Oct 2021 10:37:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E43DF16DA;
	Fri,  1 Oct 2021 10:36:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E43DF16DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633077429;
	bh=HY3MID72xY5T2HUBtwOQ2hIg+keQ4IWDCLvjUASWPuA=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Vyb+BBV5kz/InXR2QNMY9d8beq+5ph2fStxcx5LboklQmFVGjwn6HHyLVCYt3SxEv
	 dTrmpVcjObc6Dq/7hu6UpxJHi1vLudMs0DrmpJ5vhh9+kc77wlCqvo/bWdWYJGAqMf
	 NQsXp67/xfl/BsnBWf4cYTAjSBPmP/rXXycQ21nU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E9A5F8026D;
	Fri,  1 Oct 2021 10:35:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36024F80245; Fri,  1 Oct 2021 10:35:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from cable.insite.cz (cable.insite.cz [84.242.75.189])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CBDBF800F3
 for <alsa-devel@alsa-project.org>; Fri,  1 Oct 2021 10:35:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CBDBF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="h8icSYLp"; 
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="oa/YsPuS"
Received: from localhost (localhost [127.0.0.1])
 by cable.insite.cz (Postfix) with ESMTP id A85D1A1A3D401;
 Fri,  1 Oct 2021 10:35:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1633077343; bh=HY3MID72xY5T2HUBtwOQ2hIg+keQ4IWDCLvjUASWPuA=;
 h=To:Cc:From:Subject:Date:From;
 b=h8icSYLpYKnmMFTb+gHbhVA96RG1P84MPMyJh5Ak/yXR69IrlsYvcdJjuuOXarFe3
 7qHk2sPTNWGADpQghG9CWnPuw4ayMaFWmzcW/VCfrFaBqBE3RWFE9J4Q8/XtAolcLb
 JqV1ECtg2S6CzG0J+m4miyfQUJrdNS/RXrSqNvN8=
Received: from cable.insite.cz ([84.242.75.189])
 by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0KK9ARRdQAp7; Fri,  1 Oct 2021 10:35:38 +0200 (CEST)
Received: from [192.168.105.22] (ip28.insite.cz [81.0.237.28])
 (Authenticated sender: pavel)
 by cable.insite.cz (Postfix) with ESMTPSA id 49CFCA1A3D400;
 Fri,  1 Oct 2021 10:35:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1633077338; bh=HY3MID72xY5T2HUBtwOQ2hIg+keQ4IWDCLvjUASWPuA=;
 h=To:Cc:From:Subject:Date:From;
 b=oa/YsPuStpvZitNF4gU6La/8i8gJGWMgCl1cukX90shMwjRPAnZqGgF7cvwF4/Tnt
 BE4S4tc6CsVOdjtYKnjkzbumQAVqvkMdznld+DjKquVg8f4rQzJP5dCsNMhXO1sLpt
 IfFEHWfOlTECAdYfi4fWufAjDSjCVCKkO3MaSi2Y=
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
From: Pavel Hofman <pavel.hofman@ivitera.com>
Subject: Alsaloop: sync mode PLAYSHIFT + Loopback on playback side
Message-ID: <a87670e2-302b-8408-cdc2-f0f010646fdc@ivitera.com>
Date: Fri, 1 Oct 2021 10:35:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Hi,

I added support for "Playback Pitch 1000000" ctl elem to UAC2 gadget 
(not submitted to USB yet) and now I am working on alsaloop support for 
this ctl elem. The changes are simple (tested to work perfectly, patch 
to follow), but during the work I hit the following issue with playback 
Loopback "PCM Rate Shift 100000".

If the snd-aloop device is on playback side (i.e. capture from soundcard 
-> Loopback), the required sync mode is PLAYSHIFT. That means Loopback 
ctl elem "PCM Rate Shift 100000" should be controlled (by a reciprocal). 
That is simple by a patch like this:

diff --git a/alsaloop/pcmjob.c b/alsaloop/pcmjob.c
index 845ab82..619bf35 100644
--- a/alsaloop/pcmjob.c
+++ b/alsaloop/pcmjob.c
@@ -1061,7 +1061,13 @@ static int set_rate_shift(struct loopback_handle 
*lhandle, double pitch)
         int err;

         if (lhandle->ctl_rate_shift) {
-               snd_ctl_elem_value_set_integer(lhandle->ctl_rate_shift, 
0, pitch * 100000);
+               long value;
+               if (lhandle->loopback->play == lhandle)
+                       // playback => reciprocal
+                       value = 1/(pitch) * 100000;
+               else
+                       value = pitch * 100000;
+               snd_ctl_elem_value_set_integer(lhandle->ctl_rate_shift, 
0, value);
                 err = snd_ctl_elem_write(lhandle->ctl, 
lhandle->ctl_rate_shift);
         } else if (lhandle->capt_pitch) {
                 snd_ctl_elem_value_set_integer(lhandle->capt_pitch, 0, 
(1 / pitch) * 1000000);
@@ -1205,15 +1211,18 @@ static int openctl(struct loopback_handle 
*lhandle, int device, int subdevice)
         int err;

         lhandle->ctl_rate_shift = NULL;
+       // both play and capture
+       openctl_elem(lhandle, device, subdevice, "PCM Notify",
+                       &lhandle->ctl_notify);
+       openctl_elem(lhandle, device, subdevice, "PCM Rate Shift 100000",
+                       &lhandle->ctl_rate_shift);
         if (lhandle->loopback->play == lhandle) {
+               // play only
                 if (lhandle->loopback->controls)
                         goto __events;
                 return 0;
         }
-       openctl_elem(lhandle, device, subdevice, "PCM Notify",
-                       &lhandle->ctl_notify);
-       openctl_elem(lhandle, device, subdevice, "PCM Rate Shift 100000",
-                       &lhandle->ctl_rate_shift);
+       // capture only
         openctl_elem(lhandle, device, subdevice, "Capture Pitch 1000000",
                         &lhandle->capt_pitch);
         set_rate_shift(lhandle, 1);


However, IIUC how the Loopback device works, the "PCM Rate Shift 100000" 
ctl elem applicable to device=0 on playback side is that of the capture 
side, i.e. for device=1. The patch above would pick the playback-side 
device=0 ctl elem in pcmjob.c:openctl_elem. Hard-coding the device=0 -> 
device=1 is possible, but Loopback supports more devices.

Please what solution for picking the correct "PCM Rate Shift 100000" ctl 
elem for the PLAYSHIFT sync mode would you recommend?

Thanks a lot,

Pavel.
