Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE2A7800F9
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Aug 2023 00:21:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3993829;
	Fri, 18 Aug 2023 00:20:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3993829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692310871;
	bh=/Sv1kGgKDn7S2FbTb6IvlIeLPQCf81Olt1SmhDDI8ns=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=biE/5vGPng25yprX4/8+c+Np39TIeq8Q1g3ptf9RmWtyyJl7ujGbY689h2uxs/hIj
	 06MrVnjBUp8zyYz4p+g6n+Js+hyo2PP5+s+xqRqCmE5HMSuFktSg2eiRLy+iYbKU1u
	 Grll+6F9c/jPLdMxxnZbuFchn7Bly1mF4M01xMjA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6EEDF800EE; Fri, 18 Aug 2023 00:20:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E50DF8016D;
	Fri, 18 Aug 2023 00:20:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F762F801EB; Fri, 18 Aug 2023 00:20:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail.mutex.one (mail.mutex.one [62.77.152.124])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94304F800D1
	for <alsa-devel@alsa-project.org>; Fri, 18 Aug 2023 00:20:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94304F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mutex.one header.i=@mutex.one header.a=rsa-sha256
 header.s=default header.b=b2QpnMMF
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.mutex.one (Postfix) with ESMTP id 65DB016C0048;
	Fri, 18 Aug 2023 01:20:11 +0300 (EEST)
X-Virus-Scanned: Debian amavisd-new at mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
	by localhost (mail.mutex.one [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VfRvenErUw5k; Fri, 18 Aug 2023 01:20:10 +0300 (EEST)
From: Marian Postevca <posteuca@mutex.one>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
	t=1692310810; bh=/Sv1kGgKDn7S2FbTb6IvlIeLPQCf81Olt1SmhDDI8ns=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=b2QpnMMF2AkG0s86IbnHQLR+1jRYu5x6CIkpeZIBX+Ce1cuLmffMtdd3Uo0aWUb8G
	 yRToAoz0eeA5fs/FI9DLP6rLTO6OzFCbULpK2zlq7++3eD0GLu5bQnVJ7XXxy2WvCf
	 KAviz9cGJjHggpOvBxvKp336ZwxA9sivaEvOtDRo=
To: Mark Brown <broonie@kernel.org>
Cc: =?utf-8?B?5rKI5LiA6LaF?= <zhuning0077@gmail.com>, yangxiaohua
 <yangxiaohua@everest-semi.com>,
 Zhu Ning <zhuning@everest-semi.com>, Takashi Iwai <tiwai@suse.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH 3/4] ASoC: amd: acp: Add machine driver that enables
 sound for systems with a ES8336 codec
In-Reply-To: <d2be9183-87fd-4cc4-a239-9401b5b88364@sirena.org.uk>
References: <20230320203519.20137-1-posteuca@mutex.one>
 <20230320203519.20137-4-posteuca@mutex.one>
 <141a3320-ff65-459f-9d00-c8bed691dcfc@sirena.org.uk>
 <87lejpwxzf.fsf@mutex.one> <ZBr9rJn50ovG1w9W@sirena.org.uk>
 <87ttycjyw3.fsf@mutex.one> <ZBty1CdPaWm0IcRi@sirena.org.uk>
 <87r0t9uc08.fsf@mutex.one> <ZCRCqJ7oG6oefo9g@sirena.org.uk>
 <87zg2pxtog.fsf@mutex.one>
 <d2be9183-87fd-4cc4-a239-9401b5b88364@sirena.org.uk>
Date: Fri, 18 Aug 2023 01:20:06 +0300
Message-ID: <87o7j5b9bd.fsf@mutex.one>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: IE6SMWKQXA4VMFANATDTV6AL2TBU4DPQ
X-Message-ID-Hash: IE6SMWKQXA4VMFANATDTV6AL2TBU4DPQ
X-MailFrom: posteuca@mutex.one
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IE6SMWKQXA4VMFANATDTV6AL2TBU4DPQ/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Mark Brown <broonie@kernel.org> writes:
>
> You didn't quote any context here so it's not 100% clear what "this"
> is...
>
The context was your question on why the machine driver in patch 3
disables the jack detection in suspend and enables it in resume.
I explained back then, that the reason for this handling,
is that during suspend with inserted headphones the sound stops
working after resume. I couldn't explain back then why that happened
but other machine drivers using the same codec also disabled the jack
detection during suspend and enabled it during resume.

> This is saying that the machine driver should disable jack detection
> over suspend and restart it during resume.  The machine driver should
> suspend before the rest of the card which should mean that the CODEC
> gets powered off then.  The core can't tell if jack detection is
> supposed to work over suspend, it is a standard wake event on systems
> like phones, but it sounds like on this system the power gets removed
> from the device so that can't work.
>

Sorry, I don't understand what you are trying to say here. My intention
is to find a way to have sound working when suspending/resuming
with jack inserted by not fudging the jack in the machine driver but
fixing it in the CODEC.

> I don't understand why that would be expected to help?  The main effect
> of keeping the bias on all the time would be to consume more power.

I don't fully understand the whole bias thing (I did try hard to
understand it from the code), but in this specific instance it helps for
suspending the CODEC. If idle_bias_on is true then idle_bias_off will be
false, that would mean that during suspend (with jack inserted)
in snd_soc_suspend() in switch (snd_soc_dapm_get_bias_level(dapm))
the flow goes in case SND_SOC_BIAS_STANDBY and since dapm->idle_bias_off
is false it doesn't break from the case but falls through to
SND_SOC_BIAS_OFF case which in turn calls the CODEC component's suspend
callback.

The reason the sound stops working with jack inserted is that the CODEC
suspend callback never gets called. It only gets called when the jack
is not inserted.



