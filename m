Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D76991D298
	for <lists+alsa-devel@lfdr.de>; Sun, 30 Jun 2024 18:07:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A77D2343;
	Sun, 30 Jun 2024 18:06:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A77D2343
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719763620;
	bh=GX5Otp5utvZGGs/kBsIHZhr8eaLpHC8CGzKUfMMXM5g=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=eVp4ZLfSu/HrYfwXK9lL7fgnsz2axYi3tmbvYVjeuER7yps33+vOYQV5o+SAptTo6
	 /w8g4xwrWo7Zr177A6K1fYhH1RPSgIrI6YDpmuFqvUTKd2Inrc9B/iJJ2mcvFLJbOx
	 0PXtjF3G/5SP9vD4GnqamX/s2LhP7D5a2Hdqxwpg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 927D8F80578; Sun, 30 Jun 2024 18:06:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D80D9F805AF;
	Sun, 30 Jun 2024 18:06:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0178F8028B; Sun, 30 Jun 2024 18:04:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 817B1F8013D
	for <alsa-devel@alsa-project.org>; Sun, 30 Jun 2024 18:04:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 817B1F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=asahilina.net header.i=@asahilina.net
 header.a=rsa-sha256 header.s=default header.b=zM4sM+Bz
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: lina@asahilina.net)
	by mail.marcansoft.com (Postfix) with ESMTPSA id D02594267F;
	Sun, 30 Jun 2024 16:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1719763486;
	bh=GX5Otp5utvZGGs/kBsIHZhr8eaLpHC8CGzKUfMMXM5g=;
	h=Date:From:To:Cc:Subject;
	b=zM4sM+BzNTaLA/4AarFvz2lVndLzN/xefCkuJILq7ZkoqMIiGrIRFxr373U61Tg7G
	 V18+/IrM9nSMRcSQnRdN058nLgeH3x2M6409+VYfuTJReeD32q/FGLSN0QVbVoN6kp
	 fdBf+vzfE/b8JbfiSeTnfRs1i64wSgxibLFmqM6jlKY59Vq3t5SYBrsGINmlEsQbv9
	 ljcuDEv90dph6+uZn0tZP2qbv0zfRqPabP9Y7JC6sG6haD24P/hrmPFSiXsLMP007U
	 4X3BYmXrtYgI0Zd2Z6z9f6Mn1HIEUS418Qu2enpiruhJOxHwQjnj74EfpHzoBim65i
	 KWXBpeNsADRKw==
Message-ID: <48beda37-1795-4d48-987d-1e2582cb3a18@asahilina.net>
Date: Mon, 1 Jul 2024 01:04:41 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Asahi Lina <lina@asahilina.net>
To: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Subject: Handling complex matrix mixers in ALSA
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: TYIPQNIHIQTW5OCCPFZ3PNRYMFQSKNI5
X-Message-ID-Hash: TYIPQNIHIQTW5OCCPFZ3PNRYMFQSKNI5
X-MailFrom: lina@asahilina.net
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TYIPQNIHIQTW5OCCPFZ3PNRYMFQSKNI5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

I'm reverse engineering and implementing support for the RME Digiface
USB, which is an ADAT interface with a non-class-compliant interface
(probably similar to other RME interfaces like the MADIface, but I don't
have any others to test). The basic audio streaming works fine with an
entry in quirks-table.h and a format quirk to set the system sample rate
in quirks.c. Now I need to figure out how to implement the mixer controls.

Currently I have the snd-usb-audio driver claiming only interface #0
(streaming) and I use a Python script to control the mixer/settings
directly with libusb (control transfers and interface #1). This works
fine and there's some prior art for this in the firewire world (for
example, snd-dice doesn't do any mixer control stuff and you have to use
ffado-mixer to control everything from userspace) but I assume it's not
really the best way to go?

The problem is that the device has a 66x34 matrix mixer, with up to 2048
cross points enabled at once. Exposing each cross point as an ALSA mixer
control (similar to how mixer_scarlett2.c does it) would mean 2244
controls just for the mixer... which seems like a bit too much.

On top of that there is also VU meter feedback for all the
inputs/outputs, as well as general fader controls for each output and
global output configs and status. I'm not sure about the VU meters, but
everything else sounds like it would map fine to normal mixer controls.

Is there some recommended way to expose this kind of matrix mixer
interface to userspace? I think for something like this you pretty much
have to rely on device-specific tools to make the UX manageable, so
maybe hwdep... but at least exposing everything as an ALSA control would
have the advantage of supporting save/restore with something like
alsactl. So I don't really know what's the way to go here.

System settings/general status/output faders go via control transfers,
while interface #1 has an interrupt IN endpoint (streaming state
feedback, not very useful) and two bulk endpoints (matrix mixer control
out, VU meter data in). There's another pair of bulk endpoints in
interface #2 which I'm guessing are for firmware updates (I haven't
looked at that part). So in principle it's not crazy to expose all the
system controls/output faders as mixer controls in ALSA and leave
interface #1 entirely unclaimed so a userspace program can directly
configure the matrix mixer and access VU meter levels. There is a global
mixer enable bit (controlled via ctl transfer), so if that is exposed as
an ALSA control and disabled by default the interface will operate as a
1:1 in/out interface without needing any custom userspace to configure
the mixer.

There's one other quirky thing: it also needs a way to set the sample
rate as a mixer control, because you need to be able to configure the
rate even when the PCM device is not open (since that affects
stand-alone mixer operation). I imagine the right logic here would be to
have a selector control for the system sample rate, and automatically
change it and lock it when the PCM is opened with a given rate?

Any thoughts welcome ^^

~~ Lina
