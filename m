Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 734746EABB6
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 15:30:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A90FE8A;
	Fri, 21 Apr 2023 15:29:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A90FE8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682083848;
	bh=oLLvMyGCfFEf6A2lA1XzBGpqGO25AWEnCM+X7MKYz4Y=;
	h=Date:To:References:From:Subject:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ty3y+ehDjmRjZUc2JozZIthF0+kBEoCvgCwtnjILAdQ/+R81D19NVGU2qm12Q816z
	 31zOI5/XpHA2mTbfJIRFDpMd7N+4OVT5FHk/CdnsnV5/K0HiiE9nyPkdKfR6nRcEpi
	 wt4FZEeWqhPLmKMeuo5vVvb6gYkiWDNXvcfE5UDA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 75A26F80149;
	Fri, 21 Apr 2023 15:29:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46C2CF80155; Fri, 21 Apr 2023 15:29:52 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 4B2D8F80053
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 15:29:42 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id D1F5F11CF;
	Fri, 21 Apr 2023 15:29:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz D1F5F11CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1682083781; bh=R2wCnSLnoQHBAHr/hS78SA+FDMsgDswoe1Ftai6uups=;
	h=Date:To:References:From:Cc:Subject:In-Reply-To:From;
	b=Kd1siccBJsKn3RT+zfKLb7c+QE4JntyfCoOjAk1k8O7eUayurvtCoH+yE04Sk4PKi
	 DUX+hbaNuOw4apSGbeOxMFUWOh/uEIYC4iB2vEycW2gWypX80cTZKFjl/rDa+JIfDU
	 CvbLTFM8HyUAp8sNWK4OYpu8f+AZnDdOEWYs9Cis=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Fri, 21 Apr 2023 15:29:38 +0200 (CEST)
Message-ID: <bb342e84-b468-8adc-6688-88da2c857da1@perex.cz>
Date: Fri, 21 Apr 2023 15:29:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
References: <20230420113324.877164-1-oswald.buddenhagen@gmx.de>
 <20230420113324.877164-2-oswald.buddenhagen@gmx.de>
 <6b7275c2-4f88-46ed-3b8b-076298c7562a@perex.cz> <ZEJfyzFXVuLHPs+S@ugly>
From: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH v2 2/2] ALSA: pcm: auto-fill buffer with silence when
 draining playback
In-Reply-To: <ZEJfyzFXVuLHPs+S@ugly>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 6SJLZVII56Q5BU3K3VM3NLHEIE6BPKUK
X-Message-ID-Hash: 6SJLZVII56Q5BU3K3VM3NLHEIE6BPKUK
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6SJLZVII56Q5BU3K3VM3NLHEIE6BPKUK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 21. 04. 23 12:04, Oswald Buddenhagen wrote:
> On Fri, Apr 21, 2023 at 11:33:35AM +0200, Jaroslav Kysela wrote:
>> On 20. 04. 23 13:33, Oswald Buddenhagen wrote:
>>> Draining will always playback somewhat beyond the end of the filled
>>> buffer. This would produce artifacts if the user did not set up the
>>> auto-silencing machinery, which is an extremely easy mistake to make, as
>>> the API strongly suggests convenient fire-and-forget semantics. This
>>> patch makes it work out of the box.
>>
>> NACK. The initial implementation should be put to alsa-lib as discussed.
>>
> as discussed, a user-space only implementation based on the current
> kernel api is not reasonable:
> it could either enable auto-silencing on device open (which would be
> unreasonably expensive) or it could enable it on drain (and disable it
> once draining is done, which would be unreasonably complex due to
> needing to handle asynchronous draining completion).

I doubt. We should consider all solutions. The drain ends with the SETUP 
state, thus the application must call prepare again. We can restore the 
sw_params there for all types of i/o access (if the app does not reset 
sw_params itself). We can just set the silence_size (sw_params) in 
snd_pcm_hw_drain() and it's all.

Also, an interrupt can be "lost" or "merged" only for the small periods where 
the system is not able to handle the fast interrupts. For large periods, we 
should not assume that any of the interrupt is lost. Otherwise, it would break 
many things and the driver is really broken in this case. So the drain fill 
size should be updated for the big periods like "fill_align_to_last_period + 
100ms" or so.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

