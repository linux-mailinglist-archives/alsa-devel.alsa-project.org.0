Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B09FF6D907D
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 09:34:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB912828;
	Thu,  6 Apr 2023 09:33:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB912828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680766487;
	bh=EIveiB53HCdNGAdCxQYRmQ+v8b76hiwLzkKwx/hmQOo=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=RujdSjF7+xMEA5uihKj5+IFh9lks3W6ukUr4l5OybS69h5IaPRTZWF49HMjeLZJ7K
	 B428OC9/pEgT6p7+261PbE7yBQeMxDQ88hJDkX+9ci0/QdUyY/YILE+31rbGDX7MUz
	 9E/xGvrxMvtO8hfRj+O6JrmXIlfP8yzeKOnxshRA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 22C9AF80171;
	Thu,  6 Apr 2023 09:33:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30168F80246; Thu,  6 Apr 2023 09:33:51 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 8C5B7F8013D
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 09:33:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C5B7F8013D
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 0BE1124196
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 03:33:42 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pkK7p-JBF-00
	for <alsa-devel@alsa-project.org>; Thu, 06 Apr 2023 09:33:41 +0200
Date: Thu, 6 Apr 2023 09:33:41 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: Re: [PATCH] docs: sound: kernel-api: writing-an-alsa-driver.rst:
 polishing
Message-ID: <ZC511SOI1BH6xKpo@ugly>
Mail-Followup-To: alsa-devel@alsa-project.org
References: <20230405201220.2197863-1-oswald.buddenhagen@gmx.de>
 <87pm8hv6sg.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87pm8hv6sg.wl-tiwai@suse.de>
Message-ID-Hash: AGWXG23J7FSNCGC2NJRR5HE2CCF67GO5
X-Message-ID-Hash: AGWXG23J7FSNCGC2NJRR5HE2CCF67GO5
X-MailFrom: ossi@kde.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AGWXG23J7FSNCGC2NJRR5HE2CCF67GO5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Apr 06, 2023 at 08:55:27AM +0200, Takashi Iwai wrote:
>On Wed, 05 Apr 2023 22:12:20 +0200,
>Oswald Buddenhagen wrote:
>> @@ -2262,7 +2156,7 @@ Typical code would be like the following.
>>                        /* over the period boundary? */
>>                        if (chip->size >= runtime->period_size) {
>>                                /* reset the accumulator */
>> -                              chip->size %= runtime->period_size;
>> +                              chip->size -= runtime->period_size;
>>                                /* call updater */
>>                                spin_unlock(&chip->lock);
>>                                snd_pcm_period_elapsed(substream);
>
>Hmm, this kind of change shouldn't be sneaked in.
>That's more than the typo fixes etc,
>
true, the patch grew too big and i missed this hunk.
(i only kept it as one patch, because some pieces overlap and i didn't 
want to add churn.)

>and even worse, it's a wrong replacement.
>
hmm, yeah, if the timer ints are configured to occur too rarely, this 
wouldn't do the right thing.
but then, why would they be? that would basically defeat the point of 
using many periods in the first place. should i instead change the text 
to emphasize that the ints should occur at least once per period?
(i've actually pondered the timer option in the context of the emu10k1 
driver as well, and concluded that there should be two timer ints per 
period, so snd_pcm_period_elapsed() is reliably called in the first half 
of the next period, which is critical when only two periods are 
configured.)
