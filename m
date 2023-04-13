Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A666A6E0A71
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Apr 2023 11:45:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 552A9ED3;
	Thu, 13 Apr 2023 11:44:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 552A9ED3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681379135;
	bh=5utJ0m4yIxBti9hfoEkk8A18J2u9m7PKpjEq+mCbJaA=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=HmVEs3t4NeUjPZTntJp4GAlZzispgWzT5lM8NRF1lqUNJrcU9e8l6SAM1PosxfQyF
	 YmECze3DrmXFQPl7w7lj4hD4dCgviJ6o3UspZAnml1lUf9eYvt3QdT1IKMAJ8sNL1z
	 DMB26SryKiIu8Vorhm7AHANXj116yiTP0ULRft3E=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 916A2F80100;
	Thu, 13 Apr 2023 11:44:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1711F8032B; Thu, 13 Apr 2023 11:44:38 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 19326F80100
	for <alsa-devel@alsa-project.org>; Thu, 13 Apr 2023 11:44:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19326F80100
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id B58A8240CF
	for <alsa-devel@alsa-project.org>; Thu, 13 Apr 2023 05:44:29 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pmtVF-bDP-00
	for <alsa-devel@alsa-project.org>; Thu, 13 Apr 2023 11:44:29 +0200
Date: Thu, 13 Apr 2023 11:44:29 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: Re: [PATCH 1/2] ALSA: pcm: rewrite snd_pcm_playback_silence()
Message-ID: <ZDfO/dxtg81czJ2O@ugly>
Mail-Followup-To: alsa-devel@alsa-project.org
References: <20230405201219.2197789-1-oswald.buddenhagen@gmx.de>
 <8a3a2490-eb0f-7b76-3bc6-58ef5473d360@perex.cz>
 <ZDaJA4fCTFcsy9N1@ugly>
 <1775ab67-1967-e496-58af-e2aaa034f105@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <1775ab67-1967-e496-58af-e2aaa034f105@perex.cz>
Message-ID-Hash: I7UZ5X27DUEIBPTYPQMNB6VJJX3AA247
X-Message-ID-Hash: I7UZ5X27DUEIBPTYPQMNB6VJJX3AA247
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I7UZ5X27DUEIBPTYPQMNB6VJJX3AA247/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Apr 12, 2023 at 09:23:23PM +0200, Jaroslav Kysela wrote:
>On 12. 04. 23 12:33, Oswald Buddenhagen wrote:
>> On Tue, Apr 11, 2023 at 12:47:26PM +0200, Jaroslav Kysela wrote:
>>> On 05. 04. 23 22:12, Oswald Buddenhagen wrote:
>>>> +	else if ((snd_pcm_uframes_t) hw_avail >= runtime->boundary)
>>>> +		hw_avail -= runtime->boundary;
>>>
>>> If hw_avail is above runtime->boundary then the initial condition is totaly
>>> bogus. I would use snd_BUG_ON() and direct return here.
>>>
>I will correct that it will make sense where hw_ptr is nearby boundary 
>(boundary - buffer_size ... boundary - 1) and appl_ptr is cropped using 
>boundary (0 ... buffer_size).
>
no, that's the case where it goes negative.
because it's a subtraction, it plain cannot go over the boundary when 
both inputs are bounded.
due to the remaining correction, it could still go "very big" in an 
underrun condition, as the comment in the patch says.
we should discuss the implications of the latter for the 
snd_pcm_*_avail() functions separately (the apidoc doesn't make the 
contract clear at all).

>But because appl_ptr can be set by application without any kernel side 
>correction, it may be possible to check if the appl_ptr is in 0 ...  
>boundary range before any use.
>
that should be rather obviously done *somewhere*, as otherwise appl_ptr 
can often be even slightly above 2*boundary, at which point the above 
correction (and many alike) wouldn't even work. but for the sake of 
efficiency, that should be done asap, so when it is set or the boundary 
changes. no?

>>>>    		frames = runtime->silence_threshold - noise_dist;
>>>> +		if ((snd_pcm_sframes_t) frames <= 0)
>>>> +			return;
>>>
>>> The retyping does not look good here. Could we move the if before frames
>>> assignment like:
>>>
>>>    if (runtime->silence_threshold <= noise_dist)
>>>      return;
>>>    frames = runtime->silence_threshold - noise_dist;
>>>
>> dunno, i don't like it - it's more noisy and imo it loses
>> expressiveness, as the question we're asking is "how many frames do we
>> need to fill?".
>
>It seems that you have answer to everything.
>
only to the parts that i actually reply to ...

>(is the requested silence threshold fulfilled? or is the noise distance 
>greater than the whole buffer / buffer_size?).
>
but why would you want to approach it that way? it's just an extra step 
to think through. to reinforce the point: if the compiler is any good, 
then your variant will be optimized into mine.

regards
