Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E0E3DDC47
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 17:23:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 237351740;
	Mon,  2 Aug 2021 17:22:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 237351740
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627917781;
	bh=Z4qPUQ6qms2IroExM+VKhsKvCSq8E2bwSTu2FujNUlI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cVkFs6dreM/9sXvF6HBYfmUHICaM29cTztwXroal8cm45gF3qwya2LraE5lYToady
	 jfK38hIXhPw552dA/aCfSAOPFxPxHSxMvaxFy9opwp6Uimebc6wU11i29Xp2kDtiiB
	 tYNxJG+VUJZcZO/g5PcrVxhDI97wt9mxGoFy0PcI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DF3FF80268;
	Mon,  2 Aug 2021 17:21:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5677F8025F; Mon,  2 Aug 2021 17:21:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net
 [194.109.24.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95529F8014D
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 17:21:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95529F8014D
Received: from cust-b66e5d83 ([IPv6:fc0c:c157:b88d:62c6:5e3c:5f07:82d0:1b4])
 by smtp-cloud8.xs4all.net with ESMTPA
 id AZklmM9KQXTlcAZkmmiEYw; Mon, 02 Aug 2021 17:21:20 +0200
Received: from localhost (localhost [127.0.0.1])
 by keetweej.vanheusden.com (Postfix) with ESMTP id EDA041626F6;
 Mon,  2 Aug 2021 17:21:18 +0200 (CEST)
Received: from keetweej.vanheusden.com ([127.0.0.1])
 by localhost (mauer.intranet.vanheusden.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id kf_z4f-cJufD; Mon,  2 Aug 2021 17:21:17 +0200 (CEST)
Received: from belle.intranet.vanheusden.com (belle.intranet.vanheusden.com
 [192.168.64.100])
 by keetweej.vanheusden.com (Postfix) with ESMTP id 52F3815F770;
 Mon,  2 Aug 2021 17:21:17 +0200 (CEST)
Received: by belle.intranet.vanheusden.com (Postfix, from userid 1000)
 id 4375816063C; Mon,  2 Aug 2021 17:21:17 +0200 (CEST)
Date: Mon, 2 Aug 2021 17:21:17 +0200
From: folkert <folkert@vanheusden.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: aconnect occasionally causes kernel oopses
Message-ID: <20210802152117.GT890690@belle.intranet.vanheusden.com>
References: <20210801182754.GP890690@belle.intranet.vanheusden.com>
 <s5hlf5kz80e.wl-tiwai@suse.de>
 <20210802061845.GQ890690@belle.intranet.vanheusden.com>
 <s5him0oz5zq.wl-tiwai@suse.de>
 <20210802091012.GR890690@belle.intranet.vanheusden.com>
 <s5hczqvyj8m.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hczqvyj8m.wl-tiwai@suse.de>
Reply-By: Fri 16 Jul 2021 08:34:34 AM CEST
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Envelope: MS4xfNvJRq3MAIGIHmUcWurCrqOU3B5sg1r3WBSlXjw7ulyNo8T1ojOS4H8G2QRcCxxAfpJ+Yv33RXAcO7kXkbp3StupApFLKPmWFjguC9XSm8lTwjHZ0Qoz
 IN3GyqgOQ8G54LqTuCNG4FV8OYoqt6S5zbAnVTv8W7QhOyZNoqkWavX1qarv+V79/HtWxOObxUwsZCU0vcMxXgVHGLHkdG74fyOsVyITPsVQGq097zewoNuO
 K7Cbpia+28nuB1JVSVPGlA==
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

[ kernel bug if repeatingly aconnect'ing midi devices ]

> Does this happen if you do reconnect of kernel sequencer client?
> You can use snd-virmidi as well as snd-dummy.
> I'm asking it because it'll simplify the test a lot, which will be
> almost self-contained.

Like this?

root@lappiemctopface:~# aplaymidi -l
 Port    Client name                      Port name
 14:0    Midi Through                     Midi Through Port-0
 20:0    Virtual Raw MIDI 1-0             VirMIDI 1-0
 21:0    Virtual Raw MIDI 1-1             VirMIDI 1-1
 22:0    Virtual Raw MIDI 1-2             VirMIDI 1-2
 23:0    Virtual Raw MIDI 1-3             VirMIDI 1-3
128:0    rtpmidi lappiemctopface          Network
128:1    rtpmidi lappiemctopface          metronoom
128:2    rtpmidi lappiemctopface          AppleMidi2IPMidiBridge
128:3    rtpmidi lappiemctopface          oensoens
130:0    FLUID Synth (11462)              Synth input port (11462:0)

and then:

root@lappiemctopface:~# cat test.sh 
while true
do
	aconnect 20:0 21:0
	aconnect -d 20:0 21:0
done

root@lappiemctopface:~# for i in `seq 0 3` ; do (./test.sh &) ; done

This hard locks-up my laptop: it doesn't even respond to capslock (led
on/off) anymore nor the ctrl+prtscr+alt+b combination.
