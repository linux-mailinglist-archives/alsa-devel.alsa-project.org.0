Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEC93DE057
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 21:55:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 466FD1728;
	Mon,  2 Aug 2021 21:54:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 466FD1728
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627934129;
	bh=Pmg8m3m6pkXIGVGzF7wq6dyZ0Ect3/4E409w5gqvM9s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pia0oP/FoM0luWMBFpji4PT/lrdlnD9fll3sM6Kl2XLgkDEWCS1tCtMMYtHE+dDMR
	 kGTn3YTitdHhkz5GXvwAz8i+Emk+7csHgDvfLN1UVxMtaypLSOTb9BseYc2bjJtlak
	 qWmVIfe/rx933U8jond4F08ICOXf3QsqXzXAppl4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5CF7F80095;
	Mon,  2 Aug 2021 21:54:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF39AF801F7; Mon,  2 Aug 2021 21:53:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net
 [194.109.24.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 921DDF80095
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 21:53:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 921DDF80095
Received: from cust-b66e5d83 ([IPv6:fc0c:c157:b88d:62c6:5e3c:5f07:82d0:1b4])
 by smtp-cloud9.xs4all.net with ESMTPA
 id Ae0UmAxn24JsbAe0VmlA3K; Mon, 02 Aug 2021 21:53:52 +0200
Received: from localhost (localhost [127.0.0.1])
 by keetweej.vanheusden.com (Postfix) with ESMTP id A9FC41626F6;
 Mon,  2 Aug 2021 21:53:50 +0200 (CEST)
Received: from keetweej.vanheusden.com ([127.0.0.1])
 by localhost (mauer.intranet.vanheusden.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id Xt17fCfgE1-Q; Mon,  2 Aug 2021 21:53:49 +0200 (CEST)
Received: from belle.intranet.vanheusden.com (belle.intranet.vanheusden.com
 [192.168.64.100])
 by keetweej.vanheusden.com (Postfix) with ESMTP id 8D85015F770;
 Mon,  2 Aug 2021 21:53:49 +0200 (CEST)
Received: by belle.intranet.vanheusden.com (Postfix, from userid 1000)
 id 7EE3716063C; Mon,  2 Aug 2021 21:53:49 +0200 (CEST)
Date: Mon, 2 Aug 2021 21:53:49 +0200
From: folkert <folkert@vanheusden.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: aconnect occasionally causes kernel oopses
Message-ID: <20210802195349.GV890690@belle.intranet.vanheusden.com>
References: <20210801182754.GP890690@belle.intranet.vanheusden.com>
 <s5hlf5kz80e.wl-tiwai@suse.de>
 <20210802061845.GQ890690@belle.intranet.vanheusden.com>
 <s5him0oz5zq.wl-tiwai@suse.de>
 <20210802091012.GR890690@belle.intranet.vanheusden.com>
 <s5hczqvyj8m.wl-tiwai@suse.de>
 <20210802152117.GT890690@belle.intranet.vanheusden.com>
 <s5h5ywnydlz.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5h5ywnydlz.wl-tiwai@suse.de>
Reply-By: Fri 16 Jul 2021 08:34:34 AM CEST
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Envelope: MS4xfK+D070kTVgLqyMwF970IA2zSsYQV0FKRn3lNihV+5HI57wrHE+sbb6GWiF7NcXeW7h7nm917oWfG5IS6mD7GDcYMdO0La5VIb8qf51H8qoQZuNbaOoc
 jRGSydXL7WzkWr1kx8Ye/kjWNp1y2h30C5X9Hf6mIFXCE8la4us3OZw2CxVt2ry/16YyQNpS7AW+nuc0R1L1ult+FFBlJsyAHlork2blRhZ6zmPY6x/YUT1+
 YqTnLJXD/aAY5QTWZlJGIA==
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

> > [ kernel bug if repeatingly aconnect'ing midi devices ]
> > 
> > > Does this happen if you do reconnect of kernel sequencer client?
> > > You can use snd-virmidi as well as snd-dummy.
> > > I'm asking it because it'll simplify the test a lot, which will be
> > > almost self-contained.
> > 
> > Like this?
> > 
> > root@lappiemctopface:~# aplaymidi -l
> >  Port    Client name                      Port name
> >  14:0    Midi Through                     Midi Through Port-0
> >  20:0    Virtual Raw MIDI 1-0             VirMIDI 1-0
> >  21:0    Virtual Raw MIDI 1-1             VirMIDI 1-1
> >  22:0    Virtual Raw MIDI 1-2             VirMIDI 1-2
> >  23:0    Virtual Raw MIDI 1-3             VirMIDI 1-3
> > 128:0    rtpmidi lappiemctopface          Network
> > 128:1    rtpmidi lappiemctopface          metronoom
> > 128:2    rtpmidi lappiemctopface          AppleMidi2IPMidiBridge
> > 128:3    rtpmidi lappiemctopface          oensoens
> > 130:0    FLUID Synth (11462)              Synth input port (11462:0)
> > 
> > and then:
> > 
> > root@lappiemctopface:~# cat test.sh 
> > while true
> > do
> > 	aconnect 20:0 21:0
> > 	aconnect -d 20:0 21:0
> > done
> > 
> > root@lappiemctopface:~# for i in `seq 0 3` ; do (./test.sh &) ; done
> > 
> > This hard locks-up my laptop: it doesn't even respond to capslock (led
> > on/off) anymore nor the ctrl+prtscr+alt+b combination.
> 
> Thanks, that's really helpful!
> I see the possible race now.

> Could you try the quick fix below?

Something may have changed:

folkert@oensoens:~$ aplaymidi -l
ALSA lib seq_hw.c:466:(snd_seq_hw_open) open /dev/snd/seq failed: Permission denied
Cannot open sequencer - Permission denied

???

Otoh it now runs fine from what I've could test.
