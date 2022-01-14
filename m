Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F6948E354
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jan 2022 05:37:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6B561FA8;
	Fri, 14 Jan 2022 05:36:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6B561FA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642135046;
	bh=I7EX1sgM295J7pPU5dDB3cslpOl7o8Z+Xe5IyDMJoLs=;
	h=Date:To:References:From:Subject:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vGalFt0ykpQOOjo4fxzaq38/oX2jTVvMa/SoIvHWAJdS3Hf1gv4UQ99aPf9AWcuQm
	 r0dBYdHBiIgyLBQthLZWwIzWNjYVzXZacFXu9SMEXy64YYLWalq+3yyngOU2BRD68H
	 sdz1h+4MwXt6UegF69ZmqIzdeRAp4+xukuYC3UzE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DB6AF80310;
	Fri, 14 Jan 2022 05:36:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D6A5F80141; Fri, 14 Jan 2022 05:36:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from server1.nandakumar.co.in (nandakumar.co.in [198.100.152.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0DDC4F80141
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 05:36:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DDC4F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nandakumar.co.in header.i=@nandakumar.co.in
 header.b="ZvGsHi0+"
Received: from [192.168.100.185] (unknown [61.3.112.72])
 by server1.nandakumar.co.in (Postfix) with ESMTPSA id A4B2BC816B;
 Fri, 14 Jan 2022 04:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nandakumar.co.in;
 s=mail; t=1642134966;
 bh=I7EX1sgM295J7pPU5dDB3cslpOl7o8Z+Xe5IyDMJoLs=;
 h=Date:To:References:Cc:From:Subject:In-Reply-To:From;
 b=ZvGsHi0+iMzwoGnRT5ki4ctlnpRdWPLut6/PRrQPOAOJzOWp7Hob+Q3nV51Icnbpu
 kgWMxAK3Rs9yuG9F39e46PtEcWtQTTzfgTvXmH3k0nkNV6cA/rs0P1V/ja1q0yByB6
 g7mVVFjsUilxkyKgUrhZe/bwov5rEWzM83nTokuY=
Message-ID: <e30962b0-931c-83b4-12fb-aa5e377b4f4d@nandakumar.co.in>
Date: Fri, 14 Jan 2022 10:06:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-GB
To: Geraldo Nascimento <geraldogabriel@gmail.com>
References: <d61a41eb-a820-b1ca-dcf6-f447f80494a8@nandakumar.co.in>
 <YeB2zEnPlwVEKbTI@geday>
 <e1a7d67d-9862-3085-4e01-091ca443d2df@nandakumar.co.in>
 <YeDw89KZOh4yG7c8@geday>
From: Nandakumar Edamana <nandakumar@nandakumar.co.in>
Subject: Re: Behringer UMC202HD issues and a partial solution
In-Reply-To: <YeDw89KZOh4yG7c8@geday>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

Hi Geraldo,
> Have you tried unloading the snd-usb-audio module and the reloading it
> with implicit_fb=1 as in "modprobe -r snd-usb-audio" and "modprobe
> snd-usb-audio implicit_fb=1" ?
>
> If not, try it. If it works and your playback issues are gone then
> your device may just need a quirk. If it doesn't work we still
> have dyndbg to go through.
It works! Had to switch the devices and options back and forth in 
pavucontrol
(sometimes needed even for the choppy playback), but it works.

So why did my quirks didn't work? Maybe I gave the wrong numbers? Or the 
code
was unreachable (I didn't put printk()s, sorry). I guessed the combos from
`lsusb -v` output, and even tried the combos that didn't make any sense
(because I didn't know what I was doing).

Here's what I tried, one after another (added to 
playback_implicit_fb_quirks in
/sound/usb/implicit.c):

IMPLICIT_FB_GENERIC_DEV(0x1397, 0x0507),

/* Didn't work */
IMPLICIT_FB_FIXED_DEV(0x1397, 0x0507, 0x84, 1),

/* Interface 2 is actually Capture as per `cat /proc/asound/card1/stream0`,
  * but "Implicit feedback Data" is found under that
  * (Interface 1 has explicit Feedback), and a Scarlett quirk seemed to use
  * a capture interface in playback_implicit_fb_quirks
  * (I know that it's a capture interface from `lsusb` output posted by 
someone
  * online)
  */
/* Didn't work */
IMPLICIT_FB_FIXED_DEV(0x1397, 0x0507, 0x88, 2),

/* Didn't work */
/* What am I doing with 0x08 ? */
IMPLICIT_FB_FIXED_DEV(0x1397, 0x0507, 0x08, 1),

/* Didn't work */
/* Why BOTH? But what's FIXED at first? Didn't find any doc. */
IMPLICIT_FB_BOTH_DEV(0x1397, 0x0507, 0x84, 1),

/* Didn't work */
IMPLICIT_FB_SKIP_DEV(0x1397, 0x0507),
> Last but not least, please use a vanilla kernel for these tests.
I built it using the source from kernel.org, not apt. But I've used 
oldconfig,
and I think patches are being applied while installing the kernel 
(currently I'm
using my daily driver installation for this). If it has to be more pure, 
I 'll
try. BTW, do you have any distro to recommend that has a near-vanilla 
kernel for
experiments like this?

Another question: assuming a quirk gets added for this device, is there any
chance that the quirk would break the experience for those who are already
using the device (possibly a different revision, but the same ID [1]) 
without
any issues?

[1] https://h-node.org/soundcards/view/en/2228/Behringer-UMC202HD

Thank you,

-- 
Nandakumar Edamana
https://nandakumar.org

GPG Key: https://nandakumar.org/contact/gpgkey.asc
GPG Key Fingerprint: BA6B 8FDE 644F F861 B638  3E2F 45D6 05FC 646A F75D

