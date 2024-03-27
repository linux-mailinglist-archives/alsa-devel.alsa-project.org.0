Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F7288D581
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 05:46:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81C4D2BD7;
	Wed, 27 Mar 2024 05:46:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81C4D2BD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711514791;
	bh=VwXPjkQWHsEIlbcjAG7STaTTGaYYWFxbZHNruzz0/kM=;
	h=Date:From:To:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tyIgSvVltuSxqYDUMTqykZTudgk821WapzeATeawS67H3d+TzdCMbwJDxTQGaGYH/
	 cURBGUldG/Iq1juoASmfll6tMFRGwlBvZC5sPr/PVn21Oxbs45/pgXstv86CLBHtd2
	 gp2Wojn0pttOajsOfIiF2o3n5emfAI5HP/6Xq6Xk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2CBE3F805AB; Wed, 27 Mar 2024 05:45:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B7C56F8057D;
	Wed, 27 Mar 2024 05:45:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B2B9F8025F; Wed, 27 Mar 2024 05:43:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com
 [IPv6:2001:41d0:203:375::b0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A2AC9F801D5
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 05:43:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2AC9F801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=jookia.org header.i=@jookia.org header.a=rsa-sha256
 header.s=key1 header.b=ptj7Ykr4
Date: Wed, 27 Mar 2024 15:43:20 +1100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1711514624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=VwXPjkQWHsEIlbcjAG7STaTTGaYYWFxbZHNruzz0/kM=;
	b=ptj7Ykr4doTktP4kzG7Tve7pDIWpRvsLzggJTwQUtj+T9NP+X8eXAkH0REN6Jxji6+7pIV
	9IyjVFzSEYh/SeuIO900RivK6AP2yyrwYlVPLGL5k74w4VYYEtTeHLPzRomCf0W50zZ6iU
	JXGysdIAB7EMXriq8MNMhqHMLhfuXMEsC94F00BPJ5ED0xUJO3wJsHKU/KqUrVrBbrjncm
	Ct/YoZuL3o44gYo4d74uUGkB0ewQfWN2LBQgUC1V/4MmtA3+EkZAfd655XBxg1nDd59yia
	tRM4vwDy2XfqbMQi0q2nIrbvX64ikHbNpjj07F73vjiiGoYLQFzsQwr4NwCZWg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: John Watts <contact@jookia.org>
To: alsa-devel@alsa-project.org
Subject: Writing documentation for simple device tree ASoC cards
Message-ID: <ZgOj6BsGdDZCHXwq@titan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Migadu-Flow: FLOW_OUT
Message-ID-Hash: HWRUFRTIXNRZ6ISE3U623KLLRLXAM6FM
X-Message-ID-Hash: HWRUFRTIXNRZ6ISE3U623KLLRLXAM6FM
X-MailFrom: contact@jookia.org
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello!

I've spent way too much time digging through emails, documentation and
kernel source code to form a mental model that lets me understand and
use simple-sound-card, audio-graph-card and audio-graph-card2.

There's really no introductory documentation geared towards people who
are writing device trees intending to glue together multiple audio
components in to a single sound card. I'm deciding I'll try and take up
this task to provide some basic documentation for this.

Before starting I would like to quickly go over some notes in case I'm
actually just incredibly wrong. I'd rather find that out now than later.

As a general ASoC refresher:

- ALSA provides PCM interfaces and controls to a sound card
- ASoC introduces the concept of components
- Components are what you instantiate with the device tree
- Components can be asked to set a clock or create a PCM stream
- Components have one or more DAIs
- DAIs represent capabilities of a stream
- Components have DAPM widgets for power management
- These can be related to physical pins on the board or DAI streams
- CPU components are ones that ALSA can use directly to process data
- Codec components provide information about DAIs or drive streams

Most of this is already explained in the documentation.

The generic sound cards you can create using simple-sound-card and
audio-graph-card are machine drivers. Their jobs are to ensure that
when using a DAI all the related components, clocking and power
management is set up and ready for use.

This is done by:

- Linking multiple DAIs together
- Connecting DAPM widgets together to power on components
- Calculate and setting the shared clock (usually mclk)
- Setting DAI properties (like TDM slots and width)
- Adding widgets for jack detection

DAI linking isn't explained in the documentation but was a core part
of my confusion when trying to use these cards: I didn't understand if
it represented some relationship between physical pins, PCM channels,
etc.
My fuzzy model of a DAI link is that it exists to group DAIs (and thus
components) necessary to acheive a desired data flow, where that flow is
left up to the components themselves to implement.

There's a lot of examples for actually using the simple family of cards
but I imagine documenting the above would help people troubleshoot or
describe their problems better.

Other minor notes:

- sound-name-prefix is very useful and fits in somewhere here
- audio-graph-cards don't support GPIO jacks from what I can see

I also have noticed that with audio-graph-card you can't use a DAI
multiple times in different cards. This makes sense but is this due to
the way graphs and endpoints work or due to the underlying sound system?

This problem and jacks seem to point towards maybe allowing specification
of DAPM widgets in the device tree, and maybe kcontrols for selecting
which codec to use? I'm not sure.

It would also be useful to understand the scope of these simple cards.
Complex audio needs like mine seem to be outside the scope at the moment
and require writing a custom card driver.
Perhaps it's worth taking that as an opportunity to write a driver using
the simple card framework as an example?

John.
