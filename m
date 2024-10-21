Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A389A901B
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2024 21:49:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 566DD950;
	Mon, 21 Oct 2024 21:49:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 566DD950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729540181;
	bh=Z4sy60vsb+0tQMrPobGyM/lEU7DFUc95CLrXp+OuEXY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=pkOsFYPtq/GOgvdQBGg8BwZGC+kVtQmb5e9lm6FgKasbgA3J6Tq2ZvYyw4DSTdGwm
	 nOsMevnlrnUk71QymGRr8wR+IyBgyBcua0c7CWZg+IkMCM2e1t6fcr8JRBpytLjRYh
	 GO0FhcVmykoO5wz5VrEjUuCC9WpFl9vOnzLx4weY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51730F80580; Mon, 21 Oct 2024 21:49:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 91CEAF805B1;
	Mon, 21 Oct 2024 21:49:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 486A9F8016C; Mon, 21 Oct 2024 21:49:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 82A00F80104
	for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2024 21:48:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82A00F80104
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1729540138830908775-webhooks-bot@alsa-project.org>
References: <1729540138830908775-webhooks-bot@alsa-project.org>
Subject: ALSA error: snd_pcm_hw_params_set_format failed: Invalid argument.
Message-Id: <20241021194901.486A9F8016C@alsa1.perex.cz>
Date: Mon, 21 Oct 2024 21:49:01 +0200 (CEST)
Message-ID-Hash: KAGMYORUGLWPVX7DVAOO3NYDTHUBRT4L
X-Message-ID-Hash: KAGMYORUGLWPVX7DVAOO3NYDTHUBRT4L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KAGMYORUGLWPVX7DVAOO3NYDTHUBRT4L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #413 was opened from linuxandos2:

Playing a flac with a samplerate higer than 96000 with audacious gives: 

> _ALSA error: snd_pcm_hw_params_set_format failed: Invalid argument._

Output device for audacious is hw:1.0 - USB Audio
the device is a soudbaster blasterx G6.

output of _cat /proc/asound/card1/stream0_

> Creative Technology Ltd Sound BlasterX G6 at usb-0000:00:14.0-4.1, high speed :
> USB Audio
> 
> Playback:
>   Status: Stop
>   Interface 1
>     Altset 1
>     Format: S24_3LE
>     Channels: 2
>     Endpoint: 0x01 (1 OUT) (ASYNC)
>     Rates: 44100, 48000, 88200, 96000, 176400, 192000, 352800, 384000
>     Data packet interval: 125 us
>     Bits: 24
>     Channel map: FL FR
>     Sync Endpoint: 0x81 (1 IN)
>     Sync EP Interface: 1
>     Sync EP Altset: 1
>     Implicit Feedback Mode: No
>   Interface 1
>     Altset 2
>     Format: S32_LE
>     Channels: 2
>     Endpoint: 0x01 (1 OUT) (ASYNC)
>     Rates: 44100, 48000, 88200, 96000, 176400, 192000, 352800, 384000
>     Data packet interval: 125 us
>     Bits: 32
>     Channel map: FL FR
>     Sync Endpoint: 0x81 (1 IN)
>     Sync EP Interface: 1
>     Sync EP Altset: 2
>     Implicit Feedback Mode: No
> 
> Capture:
>   Status: Stop
>   Interface 2
>     Altset 1
>     Format: S24_3LE
>     Channels: 2
>     Endpoint: 0x82 (2 IN) (ASYNC)
>     Rates: 44100, 48000, 88200, 96000, 176400, 192000, 352800, 384000
>     Data packet interval: 125 us
>     Bits: 24
>     Channel map: FL FR
>   Interface 2
>     Altset 2
>     Format: S32_LE
>     Channels: 2
>     Endpoint: 0x82 (2 IN) (ASYNC)
>     Rates: 44100, 48000, 88200, 96000, 176400, 192000, 352800, 384000
>     Data packet interval: 125 us
>     Bits: 32
>     Channel map: FL FR
> 
linux: gentoo
kernel: 6.9.9-gentoo-x86_64
alsa-lib-1.2.12
alsa-topology-conf-1.2.5.1
alsa-ucm-conf-1.2.12
alsa-plugins-1.2.12
alsa-utils-1.2.12

selecting  

> pulse - PulseAudio Sound Server

 in audacious results in no sound and audacious hangs.
Pipewire and wireplumber are used.

On an old gentoo- system on another partition all samplerates play successfully.

kernel: linux-6.8.1-gentoo
the versions of alsa are:
alsa-lib-1.2.10-r2
alsa-topology-conf-1.2.5.1
alsa-ucm-conf-1.2.10-r1
alsa-plugins-1.2.7.1-r1
alsa-utils-1.2.10-r1

On the new system the 'old' kernel linux-6.8.1-gentoo is also available.
Rolled back alsa-lib from alsa-lib-1.2.12 to alsa-lib-1.2.10 and booted kernel kernel linux-6.8.1-gentoo
Still same problem.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/413
Repository URL: https://github.com/alsa-project/alsa-lib
