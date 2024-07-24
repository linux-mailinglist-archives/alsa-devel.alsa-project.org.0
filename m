Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 933FF93B0D4
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jul 2024 14:03:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33722E94;
	Wed, 24 Jul 2024 14:03:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33722E94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721822634;
	bh=PdWk6AYGFtfb9uIJdO8POXo9h5SSOTee/IDJqaTUczc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SFekZnerWod2AkXE/Yh1iOBP/di2hydxa+21nE4dIoqnU90UEcbjn+yPuPd672zkB
	 8qrImlF/ePXAi+RbjIzO4m05SxwTLXkbTVbG1wpxN6SiV9Phy/Lo1YD+NRW8+v7XG3
	 jU08bjRF/KuCvo9zFuiL6sU78X0HITSypWr+cnfk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8584CF805AE; Wed, 24 Jul 2024 14:03:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C929F805AE;
	Wed, 24 Jul 2024 14:03:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1189AF801F5; Wed, 24 Jul 2024 13:53:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,TIME_LIMIT_EXCEEDED,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 231CBF8013D
	for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2024 13:47:47 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 8CCF736254;
	Wed, 24 Jul 2024 13:47:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 8CCF736254
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1721821665; bh=OwMD8JFCrl3RUh4OADuuCetLJTu2SCrOu1yU0yz2aU4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GPsXZv1s6l/B5ZdZI0McZf51Gs0caBVjQi/heaA9aLpfg/ZFdFP+uRaW9AQJOYuK4
	 Zfju2DVGj/7/zFdtSGDJhHzzKCAs3zGuA4SREPoxDVpdnPoVplSW97c29dEH4c18HE
	 2G7GIY6DXTZojVh8wcdf+AuJNKsRpf2waQ05FYR0=
Received: from [192.168.88.200] (unknown [46.188.238.230])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Wed, 24 Jul 2024 13:47:37 +0200 (CEST)
Message-ID: <58899a1d-163d-45cc-8358-72ea7bb44354@perex.cz>
Date: Wed, 24 Jul 2024 13:47:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 00/xx] ALSA: ALSA: add snd_pcm_is_playback/capture()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <87plr3ft3q.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <87plr3ft3q.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: L7O3MED42XWYXXX6IEZQ7SEKGSRL7RSM
X-Message-ID-Hash: L7O3MED42XWYXXX6IEZQ7SEKGSRL7RSM
X-MailFrom: perex@perex.cz
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L7O3MED42XWYXXX6IEZQ7SEKGSRL7RSM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Dne 24. 07. 24 v 3:59 Kuninori Morimoto napsal(a):
> 
> Hi Iwai-san, Mark
> Cc Sakamoto-san, Amadeusz, Pierre-Louis
> 
> It seems we can use _Generic() more simply, v2 RFC is using it.
> I'm not 100% sure but unfortunately we can't use bit-field with _Generic()
> in gcc (clang seems possible to handle it ?).
> pci/ac97 is the only user of bit-field direction.
> 
> To avoid posting patch-bomb, I will post main patch and some sample patches
> as RFC. Please review it.
> 
> Link: https://lore.kernel.org/r/87zfqel1g7.wl-kuninori.morimoto.gx@renesas.com
> 
> Thank you for your help !!

Hi,

	my opinion is that this massive patch-set is just an overdesign. Even using 
the _Generic macro does not bring anything new and the code readability is not 
improved. If we add such macros for all simple cases (condition expressions), 
the code will be unreadable at some point.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

