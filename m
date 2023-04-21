Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F1E6EA6BB
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 11:15:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 612E0E76;
	Fri, 21 Apr 2023 11:14:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 612E0E76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682068518;
	bh=Jkr6QW0iA66f/pk+GtkxVy8ns7rlPEc7v2gtAdlHAMs=;
	h=Date:To:References:From:Subject:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pan1/r2pVDQYss/woQikN2XwlAIxohUmxoYOTE1ZVzZ4XcQzxE5UKpGDv96MCtx8S
	 gu3IkcVONHQMOjDrOAJN0wIpeHf3SNgrkPGaMAejuLY7jiiqfLzlQl/euUmLGGYLpa
	 r03NkNYSVH2Srq/lgyd36CpQIsy+2Ji8tMA6wckY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 24700F80149;
	Fri, 21 Apr 2023 11:14:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E762F80155; Fri, 21 Apr 2023 11:14:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 29F92F800F8
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 11:14:20 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 5258411CF;
	Fri, 21 Apr 2023 11:14:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 5258411CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1682068459; bh=ggai3QSg9mMPrWSYu2C/tl+sOIuz1anGetX6lKv6ZE8=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
	b=K7XF7V3SNsfq9kSsqhO5ZLdWx7I/isZbzcdNLckWKXIKUYXBcl5iPt0nfSXGPIx11
	 o73N2wLmB18DuNAGmZ6FUjeMYrGPJOYDdVYGSBkWnbIVNOkRei7MIvCdVrPzFunrPd
	 hhChN9xYNQ0Plg/Ji5qYeh/BuEyVAb2Xc0Dm9ws4=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Fri, 21 Apr 2023 11:14:16 +0200 (CEST)
Message-ID: <934aa544-e614-ba4d-961e-43091d6ead99@perex.cz>
Date: Fri, 21 Apr 2023 11:14:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>,
 Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
References: <20230405201220.2197878-1-oswald.buddenhagen@gmx.de>
 <87sfddv7e4.wl-tiwai@suse.de> <ZEE0T+jx5i59oV37@ugly>
 <87wn26u32c.wl-tiwai@suse.de> <ZEFB0r20odpxH6pR@ugly>
 <87leimtyqw.wl-tiwai@suse.de> <ZEFl5hlFL/VAIVTB@ugly>
 <87leilsjgk.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [RFC PATCH] docs: sound: kernel-api: writing-an-alsa-driver.rst:
 add FIXMEs
In-Reply-To: <87leilsjgk.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: DROZGRJ3WQSJWEB56UDUCH37DPAKBIM3
X-Message-ID-Hash: DROZGRJ3WQSJWEB56UDUCH37DPAKBIM3
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DROZGRJ3WQSJWEB56UDUCH37DPAKBIM3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 21. 04. 23 10:55, Takashi Iwai wrote:
> On Thu, 20 Apr 2023 18:18:46 +0200,
> Oswald Buddenhagen wrote:
>> i suppose we'd have to add SNDRV_CTL_ELEM_ACCESS_{PLAYBACK,CAPTURE}.
>> both could be set for unspecific and actually bidirectional
>> controls. if neither is set, user space would fall back to the keyword
>> based rules (and exceptions ...) - that would be backwards compatible
>> and would enable a gradual migration.
> 
> The backward compatibility isn't really easy as you wrote, I'm
> afraid.  If you run an old user-space stuff on the new kernel, you
> must not fill that new information bit but translate it to the string
> suffix instead; and that has to be done inside the kernel
> automagically.

Also, I think that playback/capture flags are too limited for the current use. 
The original naming scheme expected to build something more complex later, but 
we did not realize that.

Given the fact, that the ASoC tree is completely crazy about naming, I would 
propose to check drivers using the Tone controls (only few is using them) and 
if all are for playback, the alsa-lib code can set the playback direction in 
the simple mixer API for them (workaround, fine-tune the specification in 
control-names.rst).

But if someone has a power to design the API extensions, we can talk about it. 
Picking one minor thing without a complex view is not so ideal.

The drivers can mark all associated controls for a PCM stream, for example. So 
the direction classification can be taken from this information.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

