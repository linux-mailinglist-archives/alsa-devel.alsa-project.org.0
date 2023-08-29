Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4909178CC01
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 20:25:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDA741F2;
	Tue, 29 Aug 2023 20:25:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDA741F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693333554;
	bh=mvJOKteySkAMuBwIOSTp4xOKzzZEnzcAjIVPXkAkt8U=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g2Cor6zyymb3gtbe3OObEYaVWU7p7OcCdutQMr5d/v6Aa+brsFD6lyOYbVSPJ7tzL
	 Vp8daj9jRwk6RbUF+jy0E7VjaYFQvvLLvObY3pjI0L9laQrtjbdRs/qDm6lqJcufWL
	 PIVuRGGXpPOAHE25/5w943DUlI8MG67TXn4FnL2E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54F0DF8025F; Tue, 29 Aug 2023 20:24:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 04502F80155;
	Tue, 29 Aug 2023 20:24:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14E7FF80158; Tue, 29 Aug 2023 20:24:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E0B29F800F5
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 20:24:36 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id C432811E2;
	Tue, 29 Aug 2023 20:24:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz C432811E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1693333474; bh=tGrN9uK0PhIM2WtCx+Bc1DOqpmxLAuC/DhCTKEPd1PY=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
	b=t2G+EmUw3UmNocmbALyJKFW8p6t1ciOh1xxRvk0XJ0HqnuB/hCInFXBpVefcbBcVH
	 eSra1Z6mt2XpCoL0lmY0pLyi9svOMttWgvKxZuzD2m/7HTAgK6GVtTwbfl+2vUlEGE
	 BgKq2bmGaeXMtusYl8f7uqeArJhaqlVzlbIKmQag=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue, 29 Aug 2023 20:24:28 +0200 (CEST)
Message-ID: <77643549-fb58-2571-5aa2-2dc7bf3dbd74@perex.cz>
Date: Tue, 29 Aug 2023 20:24:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Curtis Malainey <cujomalainey@google.com>
Cc: cujomalainey@chromium.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 ethan.geller@gmail.com
References: <20230824213312.1258499-1-cujomalainey@chromium.org>
 <ce20d02b-56ed-acd1-411b-8c68d8cabea8@perex.cz>
 <CAOReqxiDZOAEYYb5c73AHu+Nd2vZinLR5qdMAVJnEcV8TS6=Nw@mail.gmail.com>
 <6d498d35-841d-4ea4-2fd9-990f9b02563e@linux.intel.com>
 <6fc8a33a-52f2-0cd1-6259-b2b974548602@perex.cz>
 <cc15a374-97b9-9b58-78b2-34241c5dd2a9@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 1/2] ucm: docs: Add EchoReferenceDev
In-Reply-To: <cc15a374-97b9-9b58-78b2-34241c5dd2a9@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: YZMM2WPPXZWRTF7ZPS2AWUEIC3ZVM2M6
X-Message-ID-Hash: YZMM2WPPXZWRTF7ZPS2AWUEIC3ZVM2M6
X-MailFrom: perex@perex.cz
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YZMM2WPPXZWRTF7ZPS2AWUEIC3ZVM2M6/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 29. 08. 23 18:30, Pierre-Louis Bossart wrote:
> 
> 
> 
>> It seems that there are some assumptions. I will try to address some
>> things:
>>
>> You can enable/use multiple modifiers per device.
>>
>> The modifiers may define extra PCM streams in the standard Value section
>> - you can use CapturePCM value for the modifier like "Echo Reference".
>> Modifiers may alter the characteristics of the original UCM device
>> stream (using command sequences), too.
> 
> Sorry, not following.
> 
> The 'modifier' has to be selected by userspace, isn't it? "someone" has
> to tell UCM that the 'echo reference' is on.
 >
> And that's precisely the conceptual issue I have. The echo reference in
> our cases is ALWAYS available when the speaker output is selected.

The function of modifier is selected by it's name, so an app should know, how 
to handle the "Echo Reference". And this use is optional.

> In other words, we are asking userspace to select something that is
> always present and available. Or put differently, a modifier that's
> always applicable is not really a modifier, is it?

Yes, in this special case, only joined PCM will be provided. But do not 
forget, that we have command sequences for modifiers, if we need to initialize 
something else like related controls for this stream in future. It's just more 
universal than to hardcode this to key/value in the UCM device definition.

> And last, the whole story of the echo reference is that it needs to be
> opened when the speaker output is opened. How would we model this with
> the modifier concept?

The modifiers are allowed to be activated only for the active devices. We can 
refine the use of the "Echo Reference" for applications and define that the 
playback PCM should be opened at first. If we need to alter this default 
behaviour in future, we may put a hint to configuration values.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

