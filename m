Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 171EA6DDD0B
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Apr 2023 15:58:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EAB3EE0;
	Tue, 11 Apr 2023 15:57:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EAB3EE0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681221520;
	bh=G0dbWK9a/t0F69dWz/H6sf/385PZ7uGbJnFAbsDRnG0=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=d5VBgIt0gJF5rsaM8c2AHB2o//vhql4h+WIRRCuDiuIRo5UtNNnOR1raHHdy/FV/r
	 Oj7nnH1sE3ZULKhOcqizicn82wXuFrawK+anxIDZd3meDanWEQjLqpMMoOZmnr5VT5
	 APhBmhkeB4xctb+8lmf/8SFkd2fVpLgWVxjVE4YM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DFCE5F8025E;
	Tue, 11 Apr 2023 15:57:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4BD8F8032B; Tue, 11 Apr 2023 15:57:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 30624F80149
	for <alsa-devel@alsa-project.org>; Tue, 11 Apr 2023 15:57:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30624F80149
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id B3E3823EA1;
	Tue, 11 Apr 2023 09:57:38 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pmEV8-2cB-00; Tue, 11 Apr 2023 15:57:38 +0200
Date: Tue, 11 Apr 2023 15:57:38 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 2/2] ALSA: pcm: auto-fill buffer with silence when
 draining playback
Message-ID: <ZDVnUj2B0EkMiOlA@ugly>
Mail-Followup-To: Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
References: <20230405201219.2197789-1-oswald.buddenhagen@gmx.de>
 <20230405201219.2197789-2-oswald.buddenhagen@gmx.de>
 <3d75c103-7e94-e6a1-7f3d-7f957c33cddc@perex.cz>
 <ZDEWyjdVE2IocpGY@ugly>
 <22f551f3-deae-1536-bd07-0b9340940ea4@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <22f551f3-deae-1536-bd07-0b9340940ea4@perex.cz>
Message-ID-Hash: NWFUUAX3UPZ3DR7FSWZX5TT65U4CS34S
X-Message-ID-Hash: NWFUUAX3UPZ3DR7FSWZX5TT65U4CS34S
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NWFUUAX3UPZ3DR7FSWZX5TT65U4CS34S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Apr 11, 2023 at 01:09:59PM +0200, Jaroslav Kysela wrote:
>On 08. 04. 23 9:24, Oswald Buddenhagen wrote:
>>> Also, silencing touches the DMA buffer which may not be desired.
>>>
>> hypothetically, yes. but practically? [...]
>
>The buffers can be mmaped so used directly for application and 
>hardware.
>
yes, and they are owned by the hardware/driver. an application would 
know better than doing with them anything they were not designed for.

>>> And lastly drivers can handle draining correctly (stop at the exact
>>> position - see substream->ops->trigger with SNDRV_PCM_TRIGGER_DRAIN
>>> argument).
>>>
>> yeah. hypothetically. afaict, there is exactly one driver which supports
>> this. most (older) hardware wouldn't even have the capability to do such
>> precise timing without external help.
>
>Most hardware has FIFO and most drivers uses the DMA position, so I think that 
>the interrupt -> stop DMA latency may be covered with this FIFO in most cases.
>
on most hardware it would be quite a stunt to re-program the buffer 
pointers on the fly to enable a mid-period interrupt. and given the 
reliability problems insisted on by takashi in the other thread, the 
approach seems questionable at best. and that's still ignoring the 
effort of migrating tens (hundreds?) of drivers.

>Again, I would improve the documentation.
>
no amount of documentation will fix a bad api. it's just not how humans 
work.

>the silencing is controlled using sw_params, so applications may 
>request the silencing before drain.
>
yeah, they could, but they don't, and most won't ever.

you're arguing for not doing a very practical and simple change that 
will fix a lot of user code at once, for the sake of preventing an 
entirely hypothetical and implausible problem. that is not a good 
trade-off.

>Lastly, I think that you cannot call updated snd_pcm_playback_silence() 
>function with runtime->silence_size == 0.
>
>         if (runtime->silence_size < runtime->boundary) {
>
you missed the hunk that adjusts the code accordingly.

regards
