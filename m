Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 496D2224E8C
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Jul 2020 03:48:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B37851664;
	Sun, 19 Jul 2020 03:47:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B37851664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595123307;
	bh=S62L8OB28usSewvl76985h1cg1fdMCcBVXBBNdPYDwk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DcRVZDOfkqgOlZqnP2NLUa6NWCThEiW9HcuOgcAteArr2p9XBOIZsom1VgRyXpAH1
	 PYFBOMyk5tO2DwSS6Fs95g0ARIquI45kYmivBpYwmnxBbDaQ1BFybD4MSQTMQerXqU
	 tgnR6WJhxHYVkmNJ6+i7aatPRUxf62TWWMcBCth8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6965F800C1;
	Sun, 19 Jul 2020 03:46:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66F69F801F5; Sun, 19 Jul 2020 03:46:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=3.0 required=5.0 tests=MISSING_DATE,MISSING_MID,
 PRX_BODY_135,PRX_BODY_138,SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 9F741F800F5
 for <alsa-devel@alsa-project.org>; Sun, 19 Jul 2020 03:46:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F741F800F5
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1595123194546633959-webhooks-bot@alsa-project.org>
References: <1595123194546633959-webhooks-bot@alsa-project.org>
Subject: Realtek ALC892 produces low volume garbled output.
Message-Id: <20200719014643.66F69F801F5@alsa1.perex.cz>
Date: Sun, 19 Jul 2020 03:46:43 +0200 (CEST)
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

alsa-project/alsa-lib issue #69 was opened from RoryO:

I'm sorry if this isn't the correct project for this. I don't know if this problem is relevant to the Alsa project or the Linux kernel directly and I don't know how to find that out.

Personal background
=== 

Programmer, experienced. First used Linux with Red Hat Linux 6 about 20 years ago. Mostly using Linux on the server side of things since. I'm not afraid to try things so have at it.

Problem
=== 

PCM audio to device heavily distorted and extremely low volume. Happens with all applications. Works flawlessly with Windows. Bypassing PulseAudio using aplay or speaker-test does not help. Interestingly, playing a raw sine wave with speaker-test works fine! Therefore it's only PCM based output causing an issue. Even using something like VLC which has it's own codecs and outputs directly to the sound buffer exhibits this issue, so it's not a system codec issue. For example, this produces a perfectly fine sounding sine wave

    speaker-test -l 3 -t sine -c 2

And this produces nothing

    speaker-test -l 3 -t wav -c 2

If I play something on Spotify or Youtube and max out the volume I can barely hear some heavily distorted, clipped noise vaguely sounding like it should.

I only have powered headphones for testing, no powered external speakers.

Relevant details
===

Latest KDE neon, which is Ubuntu 18.04 base with the GUI switched from Gnome to KDE Plasma.

Hardware is an Asus z170 motherboard, integrated Realtek/Intel audio. Using the rear green line out jack. I think there are headphone jack headers on the board as well, they are unused.

lspci output

    00:1f.3 Audio device: Intel Corporation 100 Series/C230 Series Chipset Family HD Audio Controller (rev 31)
    01:00.1 Audio device: NVIDIA Corporation GP104 High Definition Audio Controller (rev a1)

kernel messages regarding snd

    snd_hda_intel 0000:01:00.1: Disabling MSI
    snd_hda_intel 0000:01:00.1: Handle vga_switcheroo audio client
    snd_hda_codec_realtek hdaudioC0D0: autoconfig for ALC892: line_outs=3 (0x14/0x15/0x16/0x0/0x0) type:line
    snd_hda_codec_realtek hdaudioC0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
    snd_hda_codec_realtek hdaudioC0D0:    hp_outs=1 (0x1b/0x0/0x0/0x0/0x0)
    snd_hda_codec_realtek hdaudioC0D0:    mono: mono_out=0x0
    snd_hda_codec_realtek hdaudioC0D0:    dig-out=0x11/0x1e
    snd_hda_codec_realtek hdaudioC0D0:    inputs:
    snd_hda_codec_realtek hdaudioC0D0:      Front Mic=0x19
    snd_hda_codec_realtek hdaudioC0D0:      Rear Mic=0x18
    snd_hda_codec_realtek hdaudioC0D0:      Line=0x1a

Output of alsa-info dumping everything it knows about

https://pastebin.com/wCif6Qzv

I'm stuck and don't know where to go from here. Since utilities like aplay and sound-test bypass PulseAudio I think it's a problem with Alsa or the device driver for this card. That's as far as I can discover on my own.

Things I have tried
===

- Using alsamixer, confirming all volume sliders at max, none are muted. Maxing out all sliders is when I can barely make out garbled output through powered headphones.
- Using Ubuntu Mainline Kernel Installer, signing it properly, and upgrading the kernel from 5.3.0 to 5.7.9
- Using `hdajackretask` and overriding jack plugin detection
- Modifying PulseAudio config to not resample and force sampling to 44.1khz
- Playing around with `pavucontrol` and kde equivalents, disabling the unused nvidia output and trying different jack configurations 

I also found some modprobe settings for Realtek devices, however usually that information was usually about 6-8 years old and didn't look relevant.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/69
Repository URL: https://github.com/alsa-project/alsa-lib
