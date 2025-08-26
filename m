Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1049FB3723C
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Aug 2025 20:31:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2710E60291;
	Tue, 26 Aug 2025 20:30:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2710E60291
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756233068;
	bh=AGdTVUmyL1f9JdpYwKzSEh2/ZGaueC7Uf59N0KrLnT0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=nW0npOustt7p2cj5u84DAIiRzP/Qh3hC0cJstCUK2zlOCU3A92Ex41C/nTETurO8P
	 uXbpPtoO0+t6uE+9o+U0LNMWd6fRJ0pqBh8KBp2UGO0DKpbNrGR+WJUGvswG76zysy
	 1D3KXmY3f+20bB4o1JKcidd5rSz4dkh1DteqgnSk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE121F805C6; Tue, 26 Aug 2025 20:30:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E6D3F805C8;
	Tue, 26 Aug 2025 20:30:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5993CF8051F; Tue, 26 Aug 2025 20:30:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DAB5F8010B
	for <alsa-devel@alsa-project.org>; Tue, 26 Aug 2025 20:30:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DAB5F8010B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <185f64a066476600-webhooks-bot@alsa-project.org>
In-Reply-To: <185f64a065563300-webhooks-bot@alsa-project.org>
References: <185f64a065563300-webhooks-bot@alsa-project.org>
Subject: Audio garbled when using Multi plugin to record from 2+ USB
 soundcards on Raspberry Pi
Date: Tue, 26 Aug 2025 20:30:22 +0200 (CEST)
Message-ID-Hash: KBGUDDM32CUBCEZVAXAZSGNQEGAHFOPL
X-Message-ID-Hash: KBGUDDM32CUBCEZVAXAZSGNQEGAHFOPL
X-MailFrom: github@alsa-project.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KBGUDDM32CUBCEZVAXAZSGNQEGAHFOPL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #472 was edited from TommyKaneko:

I have been trying to use the multi plugin to record multiple channels from multiple soundcards on the Raspberry Pi.  The results are a garbled mess.

==== EDIT 26/08 ====

Having probed the issue some more, I would like to add more detail:

The devices and drivers I try to use are:
`**** List of CAPTURE Hardware Devices ****
card 0: Device [USB PnP Sound Device], device 0: USB Audio [USB Audio]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: Device_1 [USB PnP Sound Device], device 0: USB Audio [USB Audio]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
`
...Curiously, I have actually had success using the multi plugin to record using a pro audio interface AND ONE `USB PnP Sound Device`, in this set up
`**** List of CAPTURE Hardware Devices ****
card 0: Device [USB PnP Sound Device], device 0: USB Audio [USB Audio]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: USB [Scarlett 2i2 USB], device 0: USB Audio [USB Audio]
  Subdevices: 1/1
  Subdevice #0: subdevice #0`

HOWEVER, if I try to add another `USB PnP Sound Device` to the multi setup, then the result is a garbled mess.  My conclusion is that the multi plugin works generally, but it does NOT work for two or more `USB PnP Sound Device`.  Something tells me that the plugin cannot differentiate the addresses of the audio frames held in two or more of these cheap USB microphones.

I have a more verbose post of my issue here: https://www.reddit.com/r/linuxaudio/comments/1m24po8/recording_on_multiple_usb_mics_on_raspberry_pi/


===EDIT 26/08 The following diagnosis was wrong:
I have diagnosed the reasons as thus:
- current raspberry Pi OS uses alsa v1.2.8+rpt1
- the "fix" for the multi plugin was implemented in v1.2.9 : https://github.com/alsa-project/alsa-lib/commit/369df322577034ea872978d6470edbadf30d81a9

I am aware that the multi plugin was not meant to be used on multiple soundcards that are not in sync, however if the clock drifts over time, this is ok for my application.

I am here to seek advice on how I should go about creating a workaround.  The limitations are that I need to use cheap USB microphones (it is a weight issue).

Without going along the microcontroller route, I thought one way was to make an [external plugin](https://www.alsa-project.org/alsa-doc/alsa-lib/pcm_external_plugins.html), based on the newly patched pcm_multi plugin.  I am working on this, while climbing the steep learning curve.  Perhaps I can contribute an external plugin for the project...

In the meantime, does a developer have a better suggestion that I might have success with?  Or any tips if you are familiar with the pcm_multi plugin? @perexg ?

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/472
Repository URL: https://github.com/alsa-project/alsa-lib
