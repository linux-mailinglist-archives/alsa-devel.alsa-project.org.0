Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A377E393065
	for <lists+alsa-devel@lfdr.de>; Thu, 27 May 2021 16:05:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F3781701;
	Thu, 27 May 2021 16:04:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F3781701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622124317;
	bh=uPCihi2U4MOW8iQeYXhQw8gLVckxtRHRBYypXBck0nw=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ViAuNQwEM1O1C+mZ8ps55GwtGgS3M8/bh20BdublXcxHJF95cS1FBf47NaIG/tpsu
	 MrWoO4qM7X3EPA7iuFSWTNgcDGhJ0yPvHG4cz4v8jISXq4GR+xSefKR8WdvyllmrY/
	 q2KXf1GGQoxLecofzRrxXVf1tLjMf6Qkh85LI5BI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 425B9F80149;
	Thu, 27 May 2021 16:03:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1C64F80147; Thu, 27 May 2021 16:03:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp.ungleich.ch (smtp.ungleich.ch
 [IPv6:2a0a:e5c0:0:2:400:b3ff:fe39:7956])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37DD0F80116
 for <alsa-devel@alsa-project.org>; Thu, 27 May 2021 16:03:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37DD0F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ungleich.ch header.i=@ungleich.ch
 header.b="bDlpmAGP"
Received: from nb3.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id D76951FD8E;
 Thu, 27 May 2021 16:03:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch; s=mail;
 t=1622124216; bh=uPCihi2U4MOW8iQeYXhQw8gLVckxtRHRBYypXBck0nw=;
 h=References:From:To:Cc:Subject:In-reply-to:Date:From;
 b=bDlpmAGPvCskgi5+CC3OIuwLH6q+NMigHpDTnxKT6qkWWUm8dqdCbgBw7vmzoAGXo
 FLGSl1nDcgp7Ut+s9BE5TpNl0xgCjxRAJKQJi+Do+0xpZQe1c7Waw+6ldwupjYTsOj
 2Y2MICPo+NdVkhnkgKBTZX3gLBqbwGeiiLI2a49i1AgRYy8oXvpnl8rrNSmwsFuHul
 tEsEFLw2nm17/PuPbkBR2T2SB1i4NlJI2H7MJ6dHZTrNOyfuQhk6+fltvUCAUKuWJs
 r0uNYjWFLSCivLskGz+p3kL+MVSjUmc2XuITF8mbb5BtDDS+Od+TK5zY/izfA0NM9O
 NReOk+k5emkkA==
Received: by nb3.localdomain (Postfix, from userid 1000)
 id CF1FB14C01E3; Thu, 27 May 2021 16:04:04 +0200 (CEST)
References: <874keoijzh.fsf@ungleich.ch>
 <f2e7c889-cc99-63b3-3bd3-302faf1745fa@perex.cz>
 <87r1hs31h6.fsf@ungleich.ch>
 <alpine.DEB.2.22.394.2105271343540.3922722@eliteleevi.tm.intel.com>
 <877djk8jw2.fsf@ungleich.ch>
 <alpine.DEB.2.22.394.2105271551100.3922722@eliteleevi.tm.intel.com>
User-agent: mu4e 1.4.15; emacs 27.2
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: Internal microphone does not work with 5.12 (Tiger Lake, X1 Nano)
In-reply-to: <alpine.DEB.2.22.394.2105271551100.3922722@eliteleevi.tm.intel.com>
Date: Thu, 27 May 2021 16:04:04 +0200
Message-ID: <87h7io8e97.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Nico Schottelius <nico.schottelius@ungleich.ch>,
 alsa-devel@alsa-project.org
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


Hey Kai,
Kai Vehmanen <kai.vehmanen@linux.intel.com> writes:

> Hi Nico,
>
> On Thu, 27 May 2021, Nico Schottelius wrote:
>
>> > it seems more kernel config options are missing. Distribution kernels
>> > typically enable all the machine drivers, but you are specifically missing
>> > CONFIG_SND_SOC_INTEL_SKL_HDA_DSP_GENERIC_MACH=m
>>
>> I've enabled this one and all machine types and indeed the card is being
>> recognised (report at
>> http://alsa-project.org/db/?f=5cbe7c293cbb80ab548b892cfc8b991476b0b2aa).
>> I checked permissions on /dev/snd, which looks good.
>>
>> However, obs does not list the microphone at all and
>> chromium / jitsi shows the snd-hda-dsp mic, however does not let me
>> select it.
>
> ok, that's great so the driver appears to work now. You could try
> to do simple arecord test in terminal:
>
> arecord -fdat -vv -Dplugw:0,6 -c4 /dev/null

That does not work:

[15:55] nb3:~% arecord -fdat -vv -Dplugw:0,6 -c4 /dev/null
ALSA lib pcm.c:2660:(snd_pcm_open_noupdate) Unknown PCM plugw:0,6
arecord: main:830: audio open error: No such file or directory

However, recording with audacity produces to results:

- no sound recorded by default
- sound recorded when I plugin an external headset

And using arecord -fdat -vv -c4 /dev/null (without -Dplugw) I get
output, but the level is always 00% without the headset, ranges 02 ~ 90%
with the headset plugged in.

I was wondering if there's a hardware switch "broken"
for the detection of the headset and that's why the mic is muted
internally?


--
Sustainable and modern Infrastructures by ungleich.ch
