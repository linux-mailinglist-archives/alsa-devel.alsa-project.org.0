Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AFB9B75BB
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Oct 2024 08:49:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD3DBEF2;
	Thu, 31 Oct 2024 08:49:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD3DBEF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730360982;
	bh=n6Ci6snbbTS77sKnR0luXedZvoG7wzN2jg9Cr6KC3xI=;
	h=Subject:From:To:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hbthBV1Zsb//g24UDLvRsX5jzHidh+nuk33cwnMofa/Bis3V/yykvtRnkz4NvKf7J
	 YFcXYXmOph2VpoLFjcU5jfNQHvbfDL2bQxTmqcS5KEFcL+UyQ7TxgQ+Xj8IoiIaeQA
	 UqeE7ltSob4YWeVQ1+3UYrnBKJV8V68PDQ7pAXZU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F109FF805AF; Thu, 31 Oct 2024 08:49:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC9F2F805AE;
	Thu, 31 Oct 2024 08:49:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1228F80269; Thu, 31 Oct 2024 08:49:02 +0100 (CET)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id CE713F800ED
	for <alsa-devel@alsa-project.org>; Thu, 31 Oct 2024 08:49:02 +0100 (CET)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Direct MIDI event delivery to ALSA sequencer's hardware port without
 any
 connections/subscriptions fails with -ENODEV.
From: giedrius@blokas.io
To: alsa-devel@alsa-project.org
Date: Thu, 31 Oct 2024 07:49:02 -0000
Message-ID: 
 <173036094280.7932.15651402625270790788@mailman-web.alsa-project.org>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: 4COFPZNGH35OZZ3ZPURTVIEKEH6JW3GL
X-Message-ID-Hash: 4COFPZNGH35OZZ3ZPURTVIEKEH6JW3GL
X-MailFrom: giedrius@blokas.io
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KYBV3R7774RETHIS35BEFMJ2UYMRYVRV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello,

I had written an `aseqsend` utility to send MIDI events from hex strings to ALSA sequencer ports, similar to the -S arg of `amidi`, but I just noticed that while sending events directly to application ALSA Sequencer ports works just fine, trying to send to a hardware MIDI port fails with -19 (-ENODEV).

Here's the aseqsend utility code, the highlighted line is the one returning -ENODEV:

https://github.com/BlokasLabs/aseqsend/blob/main/aseqsend.c#L173

Here's some sample commands showcasing the problem (I've added a printf with drain result just after the indicated line above locally):

https://paste.debian.net/hidden/9690d660/

It shows that in case there's no active subscriptions to the port, the event delivery fails, with no data ever reaching the hardware device. As long as there's at least one subscription to the port, it works ok. I've reproduced this on 5.15.36-rt41-v7+ and 6.6.58-v8-16k (running on Raspberry Pi, based on https://github.com/raspberrypi/linux)

I've traced the -ENODEV to be returned at this location: https://elixir.bootlin.com/linux/v6.6.58/source/sound/core/seq/seq_midi.c#L134

Whenever there's a subscription, the 'substream' is not NULL.

But what I would naturally expect is for the events to get delivered to the hardware port when using direct addressing, regardless of its subscription status, the same way how it's possible to send events to application aseq ports:

-- Terminal 1 --
patch@patchbox:~ $ aseqdump
Waiting for data at port 128:0. Press Ctrl+C to end.
Source  Event                  Ch  Data
129:0   Note on                 0, note 64, velocity 48

-- Terminal 2 --
patch@patchbox:~/work/aseqsend $ ./aseqsend 128:0 90 40 30
drain: 0


Is this a bug in ALSA Sequencer, or is my expectation of being able to write directly to a hardware ALSA sequencer port incorrect?
