Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 453E048D9CA
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jan 2022 15:39:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FC7A1F46;
	Thu, 13 Jan 2022 15:38:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FC7A1F46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642084753;
	bh=TaHEMGIE9WQRzc+bmG5CHF19D/vuhGk7CLGXh0CLdqI=;
	h=Date:To:From:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Lb8I/9ArIgW44f5WT8tffW3yiDTdcAl4jAlv/OZJkdzBGsjQnX+YMyhmlVojmBVbj
	 6zRjGOwLfSOpJqLL9AAluz3Ws872Ea3dkXIu3/98z+XVb7mFHPwedh395W1YmGU5H1
	 whfUz9RdJJiT7Nwa886dDSwPZCTysN5k60wnqHMk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08087F80088;
	Thu, 13 Jan 2022 15:38:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E531F8013F; Thu, 13 Jan 2022 15:38:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from server1.nandakumar.co.in (nandakumar.co.in [198.100.152.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9FBBF80054
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 15:37:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9FBBF80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nandakumar.co.in header.i=@nandakumar.co.in
 header.b="jAG6QTeb"
Received: from [192.168.100.185] (unknown [117.208.29.60])
 by server1.nandakumar.co.in (Postfix) with ESMTPSA id F289AC815B
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 14:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nandakumar.co.in;
 s=mail; t=1642084673;
 bh=TaHEMGIE9WQRzc+bmG5CHF19D/vuhGk7CLGXh0CLdqI=;
 h=Date:To:From:Subject:From;
 b=jAG6QTeba5+EcftoXD5AFCU0pFxtkVH7VmAMFr0nw+MFnO4kGAk3S/MXakZQFF1Le
 pcyTPKawnvibAZHIErErrB9dgO0WYuBPozyIlUYAqXGqLoNzuXhI9HoPChl7Tq5e1o
 0PzayxeLw3nnZOKkGW4QYIQz4aQIhgobUrlSZa5o=
Message-ID: <d61a41eb-a820-b1ca-dcf6-f447f80494a8@nandakumar.co.in>
Date: Thu, 13 Jan 2022 20:07:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
To: alsa-devel@alsa-project.org
Content-Language: en-GB
From: Nandakumar Edamana <nandakumar@nandakumar.co.in>
Subject: Behringer UMC202HD issues and a partial solution
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Trying to make my Behringer UMC202HD audio interface work with GNU/Linux.
While doing so, I managed to make a warning disappear by editing a file in
the kernel source. The main issue I'm having with the interface isn't 
gone, and
I am not sure whether to bother you people with that now. However I'd 
like to
read your comments on the edit I made regarding the warning.

Details:

- Product: 1397:0507 BEHRINGER International GmbH UMC202HD 192k
- dmesg warning: clock source 41 is not valid, cannot use
- kernel: linux-5.15.13
- Edit that made the warning disappear:

$ diff -u sound/usb/clock.c.orig sound/usb/clock.c
--- sound/usb/clock.c.orig    2022-01-13 08:14:49.555281286 +0530
+++ sound/usb/clock.c    2022-01-13 08:18:38.004618792 +0530
@@ -180,7 +180,11 @@
       * Sample rate changes takes more than 2 seconds for this device. 
Clock
       * validity request returns false during that period.
       */
-    if (chip->usb_id == USB_ID(0x07fd, 0x0004)) {
+    if (chip->usb_id == USB_ID(0x07fd, 0x0004) ||
+        /* Trying the same for BEHRINGER International GmbH UMC202HD 
192k */
+        chip->usb_id == USB_ID(0x1397, 0x0507)
+        )
+    {
          count = 0;

          while ((!ret) && (count < 50)) {



Yes, I was just adding the ID of UMC202HD to an existing workaround. I'm not
sure if the device's clock should actually be accepted (but I think so 
because
the retry works, right?), or if two seconds is the right delay for UMC202HD.

The real issue I'm having with this device is related to the periodic
stuttering/pops while playback (recording is okay). I remember having 
read that
UMC20x is well-supported in Linux. Maybe now they're using a different
firmware version or something? If you are interested, here is a list of 
things
I've already tried:

- Different ports, including USB 2.0, and disabling xHCI using `setpci`
- Disconnecting other USB devices
- Disabling wireless
- Making sure speech-dispatcher isn't running
- Old and new GNU/Linux distros on different computers
- Switching sound servers (PulseAudio and JACK) and direct ALSA
- Different sampling rates, buffer sizes, etc.
- Lower volume levels
- Making sure there are no xruns
- tsched=0 and 1 for module-udev-detect (pulse)
- realtime-scheduling, high-priority, and nice-level (pulse)
- Choosing Performance mode for CPU Governer and disabling Intel Boost
   (as recommended by Ubuntu Studio dashboard)
- lowlatency kernel
- A recent kernel (v5.15.13) built from source with oldconfig
- Clock source workaround in sound/usb/clock.c
- Quirk entries in sound/usb/implicit.c (I won't claim I did it right)

Again, I'd like to hear your comments on the clock detection workaround 
first,
since that's the only thing I seem to have solved with all these hours spent
(except for learning a lot, of course). But if you have time, please 
consider
the second (main) issue also. Maybe I'm posting this in the wrong place; 
if so,
please let me know where to repost it (official forum or a kernel 
mailing list).

Thank you,

-- 
Nandakumar Edamana
https://nandakumar.org

GPG Key: https://nandakumar.org/contact/gpgkey.asc
GPG Key Fingerprint: BA6B 8FDE 644F F861 B638  3E2F 45D6 05FC 646A F75D

