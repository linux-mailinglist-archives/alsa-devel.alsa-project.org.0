Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0958C8C6391
	for <lists+alsa-devel@lfdr.de>; Wed, 15 May 2024 11:20:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3021B206;
	Wed, 15 May 2024 11:19:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3021B206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715764804;
	bh=vLCdWJiZuxlL9/ekQEzEY6Py6sNMfC/b3bvB1D5ygPg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iGlzugTqItjjQVtny9BDz7CvDZ2+yCO2FhAOgo6mRKFTUUiKq1gpX3zNF3dcE+jhf
	 39wFXRuKxOPZxtbZM4EhSYOM8+5fDeFh05L629BXIDOY2C2o3hxEEmcABORn3AxxHm
	 1A/3r8DIc99Lt5+aPorCSYLSrZYqbU1dqVzgY5oE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68331F80588; Wed, 15 May 2024 11:19:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A33BF80588;
	Wed, 15 May 2024 11:19:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8BF66F80224; Wed, 15 May 2024 11:17:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 81C0BF800E9
	for <alsa-devel@alsa-project.org>; Wed, 15 May 2024 11:17:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81C0BF800E9
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 67F0561484;
	Wed, 15 May 2024 09:17:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 579ABC116B1;
	Wed, 15 May 2024 09:17:14 +0000 (UTC)
Message-ID: <c5dbb765-8c93-4050-84e1-c0f63b43d6c2@xs4all.nl>
Date: Wed, 15 May 2024 11:17:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 00/16] Add audio support in v4l2 framework
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>, Shengjiu Wang
 <shengjiu.wang@gmail.com>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, sakari.ailus@iki.fi,
 tfiga@chromium.org, m.szyprowski@samsung.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, tiwai@suse.com,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
References: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
 <ZjEEKyvb02CWz3l4@finisterre.sirena.org.uk> <20240430172752.20ffcd56@sal.lan>
 <ZjGhPz-bokg6ZbDJ@finisterre.sirena.org.uk> <87sez0k661.wl-tiwai@suse.de>
 <20240502095956.0a8c5b26@sal.lan> <20240502102643.4ee7f6c2@sal.lan>
 <ZjRCJ2ZcmKOIo7_p@finisterre.sirena.org.uk> <20240503094225.47fe4836@sal.lan>
 <CAA+D8APfM3ayXHAPadHLty52PYE9soQM6o780=mZs+R4px-AOQ@mail.gmail.com>
 <22d94c69-7e9f-4aba-ae71-50cc2e5dd8ab@xs4all.nl>
 <51408e79-646d-4d23-bc5b-cd173d363327@linux.intel.com>
 <CAA+D8AM7+SvXBi=LKRqvJkLsrYW=nkHTfFe957z2Qzm89bc48g@mail.gmail.com>
 <cd71e8e8-b4dc-40ed-935e-a84c222997e6@linux.intel.com>
 <CAA+D8AMpLB0N++_iLWLN_qettNz-gKGQz2c2yLsY8qSycibkYg@mail.gmail.com>
 <2f771fe9-7c09-4e74-9b04-de52581133fd@linux.intel.com>
 <CAA+D8AMJKPVR99jzYCR5EsbMa8P95jQrDL=4ayYMuz+Cu1d2mQ@mail.gmail.com>
 <28d423b1-49d8-4180-8394-622b1afd9cd9@perex.cz>
 <850a80b2-d952-4c14-bd0b-98cb5a5c0233@perex.cz>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <850a80b2-d952-4c14-bd0b-98cb5a5c0233@perex.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: HAJO6D6OGTTY5UBQIG4ODAVTCYINW6NM
X-Message-ID-Hash: HAJO6D6OGTTY5UBQIG4ODAVTCYINW6NM
X-MailFrom: SRS0=pqBR=MS=xs4all.nl=hverkuil@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HAJO6D6OGTTY5UBQIG4ODAVTCYINW6NM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Jaroslav,

On 5/13/24 13:56, Jaroslav Kysela wrote:
> On 09. 05. 24 13:13, Jaroslav Kysela wrote:
>> On 09. 05. 24 12:44, Shengjiu Wang wrote:
>>>>> mem2mem is just like the decoder in the compress pipeline. which is
>>>>> one of the components in the pipeline.
>>>>
>>>> I was thinking of loopback with endpoints using compress streams,
>>>> without physical endpoint, something like:
>>>>
>>>> compress playback (to feed data from userspace) -> DSP (processing) ->
>>>> compress capture (send data back to userspace)
>>>>
>>>> Unless I'm missing something, you should be able to process data as fast
>>>> as you can feed it and consume it in such case.
>>>>
>>>
>>> Actually in the beginning I tried this,  but it did not work well.
>>> ALSA needs time control for playback and capture, playback and capture
>>> needs to synchronize.  Usually the playback and capture pipeline is
>>> independent in ALSA design,  but in this case, the playback and capture
>>> should synchronize, they are not independent.
>>
>> The core compress API core no strict timing constraints. You can eventually0
>> have two half-duplex compress devices, if you like to have really independent
>> mechanism. If something is missing in API, you can extend this API (like to
>> inform the user space that it's a producer/consumer processing without any
>> relation to the real time). I like this idea.
> 
> I was thinking more about this. If I am right, the mentioned use in gstreamer 
> is supposed to run the conversion (DSP) job in "one shot" (can be handled 
> using one system call like blocking ioctl).  The goal is just to offload the 
> CPU work to the DSP (co-processor). If there are no requirements for the 
> queuing, we can implement this ioctl in the compress ALSA API easily using the 
> data management through the dma-buf API. We can eventually define a new 
> direction (enum snd_compr_direction) like SND_COMPRESS_CONVERT or so to allow 
> handle this new data scheme. The API may be extended later on real demand, of 
> course.
> 
> Otherwise all pieces are already in the current ALSA compress API 
> (capabilities, params, enumeration). The realtime controls may be created 
> using ALSA control API.

So does this mean that Shengjiu should attempt to use this ALSA approach first?

If there is a way to do this reasonably cleanly in the ALSA API, then that
obviously is much better from my perspective as a media maintainer.

My understanding was always that it can't be done (or at least not without
a major effort) in ALSA, and in that case V4L2 is a decent plan B, but based
on this I gather that it is possible in ALSA after all.

So can I shelf this patch series for now?

Regards,

	Hans

