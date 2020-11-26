Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBFA2C5B96
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Nov 2020 19:08:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D25017E3;
	Thu, 26 Nov 2020 19:07:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D25017E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606414096;
	bh=llwzcNh9+pjnyZeItfAgWBiVxS6Sw7CQAmqPKQHzxiI=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XYCgJMKArvLhepKw+VuU3AWoS0ZSIJbaz4Yc+A4sxwOIFtFxFLo8wG2ZrU0jVuQR/
	 NLPDmeGL5Gyvbts/jFVpT6JL9U1mNIUUyqpPECnCNHZgTp8YehRbycfDPqbmQ6bNh2
	 2DfUM+jAh0M1/gdnYOD69DcO4AaB3UsuJv765jgo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58723F8016A;
	Thu, 26 Nov 2020 19:06:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3E0CF80166; Thu, 26 Nov 2020 19:06:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=MISSING_MID,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from roobarb.jellybean.co.uk (roobarb.crazydogs.org [46.235.224.144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B953BF80159
 for <alsa-devel@alsa-project.org>; Thu, 26 Nov 2020 19:06:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B953BF80159
Received: from localhost ([127.0.0.1])
 by roobarb.jellybean.co.uk with esmtp (Exim 4.92)
 (envelope-from <bjb-alsa-devel@deus.net>) id 1kiLee-0000Wx-Hf
 for alsa-devel@alsa-project.org; Thu, 26 Nov 2020 18:06:04 +0000
Date: Thu, 26 Nov 2020 18:06:04 +0000
From: Ben Bell <bjb-alsa-devel@deus.net>
To: alsa-devel@alsa-project.org
Subject: Behringer WING usb audio - cyclic xruns dependent on periods/buffers
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: bjb-alsa-devel@deus.net
X-SA-Exim-Scanned: No (on roobarb.jellybean.co.uk);
 SAEximRunCond expanded to false
Message-Id: <20201126180612.E3E0CF80166@alsa1.perex.cz>
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

I've got a Behringer WING digital mixer which is equipped with a USB
interface supporting 48 in, 48 out at 44.1 or 48kHz. It's plugged into a
USB3 interface and for the most part it seems to work well as a class-compliant
audio interface, but I'm struggling to eliminate xruns and it's starting to
feel either driver or hardware quirk related issue.

I've done all the usual things -- I'm running a PREEMPT_RT kernel, set up
the realtime priorities of Jack and the relevant USB IRQ to no avail. I'm
doing most of the debugging remotely over ssh with X shutdown and most
other processes on the system stopped. There's nothing plugged into the
computer beyond network, keyboard, mouse and the audio interface.

I'm currently testing on kernel 5.10.0-rc5 with preempt-rt patches, but I've
previously seen the same things on 5.4-rt (Debian backports) and 5.8
(self-compiled).

The xruns are characterised by bursts of "retire_capture_urb" warnings in
the kernel logs (and in particular the frame status for everything in those
URBs is EXDEV, meaning I think that the frames haven't been consumed by the
time it's retired). I've patched sound/driver/pcm.c to provide me with a bit
more debugging information and it looks like usually it's almost always
between 7-10 consecutive calls to retire_capture_urb that are affected.

The bursts of retire_capture_urb warnings seem roughly cyclic, with a
cycle time that is dependent on the combination of the frames/period setting
and the number of periods per buffer, though it doesn't appear to be a
strictly linear thing: 512/2 (~170s cycle); 256/2 (~94s); 128/3 (~65s);
64/13 (~270s). I can't immediately see any definitive smoking gun in the urb
or interrupt counts, but there is some grouping in the timings between
the xruns. Taking 64 frames, 5 periods, it's usually 50s, but sometimes 60s:

 21:47:57 50s since xrun 4 
 21:48:47 50s since xrun 5 
 21:49:46 59s since xrun 6 
 21:50:46 60s since xrun 7 
 21:51:36 50s since xrun 8 
 21:52:36 60s since xrun 9 
 21:53:36 60s since xrun 10 
 21:54:37 61s since xrun 11 
 21:55:27 50s since xrun 12 
 21:56:27 60s since xrun 13 
 21:57:27 60s since xrun 14 
 21:58:17 50s since xrun 15 
 21:59:16 59s since xrun 16 
 22:00:06 50s since xrun 17 
 22:00:56 50s since xrun 18 
 ...

If I count the URB numbers (sorry, I'm shaky on the terminology, but I'm
counting each URB which is retired) I often (but not always) see the same
number of URBs passing between xrun bursts. Currently at 64 frames/5
periods, it's often exactly 50042 or 49923 urbs between bursts.

The delay between starting Jack and encountering the first burst is not
predictable -- it's not just a whole cycle -- but stopping jack for e.g 30s
then starting again delays the next burst by the same amount. So it does seem
related to something in the audio streaming rather than anything else going on
on the system interfering. It's as if something is slowly slipping out of sync
between the Wing and the kernel until they need to resync, but I don't really
know enough about USB to have any deeper insight.

All the tests above happen to be at 44.1kHz with the Wing set to 48 in,
48 out, but changing to 48kHz or 2/2 IO doesn't seem to cure anything.

One more data point which may not be relevant: if I switch off or unplug
the Wing while Jack is running, the system gradually locks up over a period of
a few seconds. I can get something out of the console briefly afterwards but
within about ten seconds it's completely unresponsive. I imagine that pulling
out a USB device from a realtime thread isn't a kind thing to do, but I don't
recall this happening with other interfaces.

Any help or insights into where I should be looking (I'm a newbie in kernel
space) appreciated. If someone wants remote access to the box to investigate
in realtime we could probably figure something out.

bjb


