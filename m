Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 525CAE97BC
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Oct 2019 09:13:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0D552322;
	Wed, 30 Oct 2019 09:12:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0D552322
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572423218;
	bh=pdO1PuWcCZva+CSXl6ZmhAfVfhYhTtIT9goHtO/QVpE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JooWIeg3TpkGbVHjmghxJ8SIxd+mNAehsGNWmz65du9W1hLHApO8pfTqKGbc5yvDr
	 2iozxKqz6UWm0VnNjzMnTbS90mTA4N+9XeS4J4bv/ms+G+QDn8nuVDyQ0RR3JOkEku
	 /sFXNlZWtNcHorvQZ8rJ+FZzIVGEXAPNh9NZPHQs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C4BAF8044A;
	Wed, 30 Oct 2019 09:10:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEDA6F80361; Wed, 30 Oct 2019 09:10:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=PRX_BODYSUB_18, SPF_HELO_NONE, 
 SPF_NONE autolearn=disabled version=3.4.0
Received: from heaven.argudo.org (heaven.argudo.org [195.154.250.235])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43F9BF802A1
 for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2019 09:10:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43F9BF802A1
Received: by heaven.argudo.org (Postfix, from userid 1008)
 id 6B6551502247; Wed, 30 Oct 2019 09:10:40 +0100 (CET)
Received: from deiphobe (maison [78.229.44.71]) (Authenticated sender: jpa)
 by heaven.argudo.org (Postfix) with ESMTPSA id 3224E1500724
 for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2019 09:10:39 +0100 (CET)
Message-ID: <769b9f5dae864cf1eb433ab84eed385a161931c8.camel@argudo.org>
From: Jean-Paul Argudo <jpa@argudo.org>
To: alsa-devel@alsa-project.org
Date: Wed, 30 Oct 2019 09:10:38 +0100
Organization: PostgreSQL Fr
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: [alsa-devel] snd-bebob : from kernel 4.13 to 5.3.19 and .20
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi there,

I wrote 1st this here: 
https://github.com/takaswie/snd-firewire-improve/issues/25

But I think it was the bad place, sorry for that.

I think this ML is better?

My problem in one line:

I upgraded my Ubuntu Disco (kernel 4.13) to Ubuntu Eoan (kernel 5.3.19)
and I can report my SaffireLE / Firewire doesnt work anymore, snd-bebob reports "discontinuity of CIP" on dmesg...


At startup it lights green ok, but no sound is playable, then the
lights turn orange (like it is when it's not working), I hear a "relay
sound" (a electric clic of a relay), then, the Saffire LE disapears from the sound menu in Ubuntu sound menu.

I can see this in dmesg:

[   19.083583] snd-bebob fw1.0: Detect discontinuity of CIP: 10 50
[   19.746665] snd-bebob fw1.0: Detect discontinuity of CIP: A0 A8
[   19.846775] snd-bebob fw1.0: Detect discontinuity of CIP: 70 B0
[   20.335861] snd-bebob fw1.0: Detect discontinuity of CIP: 90 D0
[   20.856301] snd-bebob fw1.0: Detect discontinuity of CIP: 78 B8
[   21.312770] snd-bebob fw1.0: Detect discontinuity of CIP: 30 70
[   21.796716] snd-bebob fw1.0: Detect discontinuity of CIP: 00 40
[   22.347664] snd-bebob fw1.0: Detect discontinuity of CIP: 00 40
[   22.818247] snd-bebob fw1.0: Detect discontinuity of CIP: A8 E8
[   23.306079] snd-bebob fw1.0: Detect discontinuity of CIP: 98 D8
[   29.544652] snd-bebob fw1.0: Detect discontinuity of CIP: 10 50
[   30.272090] snd-bebob fw1.0: Detect discontinuity of CIP: A8 E8
[   30.776168] snd-bebob fw1.0: Detect discontinuity of CIP: 00 40
[   31.268123] snd-bebob fw1.0: Detect discontinuity of CIP: E0 20
[   31.766085] snd-bebob fw1.0: Detect discontinuity of CIP: E0 20
[   32.267903] snd-bebob fw1.0: Detect discontinuity of CIP: 88 C8
[   32.767989] snd-bebob fw1.0: Detect discontinuity of CIP: F8 38
[   33.263808] snd-bebob fw1.0: Detect discontinuity of CIP: 78 B8
[   33.757156] snd-bebob fw1.0: Detect discontinuity of CIP: 08 48
[   34.258860] snd-bebob fw1.0: Detect discontinuity of CIP: 80 C0
[   34.755571] snd-bebob fw1.0: Detect discontinuity of CIP: 40 80
[   35.261252] snd-bebob fw1.0: Detect discontinuity of CIP: 60 A0
[   35.753980] snd-bebob fw1.0: Detect discontinuity of CIP: 78 B8
[   36.253547] snd-bebob fw1.0: Detect discontinuity of CIP: C0 00
[   36.752500] snd-bebob fw1.0: Detect discontinuity of CIP: 08 48
[   37.255203] snd-bebob fw1.0: Detect discontinuity of CIP: B0 F0
[  277.760550] snd-bebob fw1.0: Detect discontinuity of CIP: 40 80
[  278.488972] snd-bebob fw1.0: Detect discontinuity of CIP: C0 00
[  278.986290] snd-bebob fw1.0: Detect discontinuity of CIP: E0 20
[  279.485998] snd-bebob fw1.0: Detect discontinuity of CIP: 18 58
[  279.983838] snd-bebob fw1.0: Detect discontinuity of CIP: D0 10
[  280.486776] snd-bebob fw1.0: Detect discontinuity of CIP: C0 00
[  280.979487] snd-bebob fw1.0: Detect discontinuity of CIP: 30 70
[  281.480952] snd-bebob fw1.0: Detect discontinuity of CIP: 78 B8
[  281.975413] snd-bebob fw1.0: Detect discontinuity of CIP: 38 78
[  282.475487] snd-bebob fw1.0: Detect discontinuity of CIP: 60 A0
[  282.979446] snd-bebob fw1.0: Detect discontinuity of CIP: 88 C8
[  283.472403] snd-bebob fw1.0: Detect discontinuity of CIP: 88 C8
[  283.968484] snd-bebob fw1.0: Detect discontinuity of CIP: 68 A8
[  284.471585] snd-bebob fw1.0: Detect discontinuity of CIP: 30 70
[  284.562886] usb 3-4.1: reset high-speed USB device number 5 using
xhci_hcd
[  284.965508] snd-bebob fw1.0: Detect discontinuity of CIP: D0 10
[  285.469348] snd-bebob fw1.0: Detect discontinuity of CIP: 68 A8
[  285.965174] snd-bebob fw1.0: Detect discontinuity of CIP: 20 60
[  285.981618] firewire_core 0000:05:01.0: phy config: new root=ffc1,
gap_count=5
[  290.103982] firewire_core 0000:05:01.0: phy config: new root=ffc1,
gap_count=5
I tried update the kernel with eoan-proposed I know run 5.3.20 and I
have the same problem (the trace above is made with 5.3.20.

First, I hope I report this the best way, really not sure here.

If not, please tell me what to bring (files? logs?) and where (on this
list? elsewhere?).

I have spare time to investigate anything that could help here.


Thanks!

-- 
Jean-Paul Argudo


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
