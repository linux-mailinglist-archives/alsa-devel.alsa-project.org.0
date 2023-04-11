Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B466A6DDE79
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Apr 2023 16:50:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD27FEF9;
	Tue, 11 Apr 2023 16:49:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD27FEF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681224606;
	bh=6a03IaQVX6qpXX6Y71+rdNyM2bePAJRiwT6Y/UqhHDM=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=uf4b3dlsefEBtmgCCoxy5OO+dInivw0KiXQsyyKxTT8G7ZMnEdAHLRJAqKXew/p1o
	 8pJsyot5DGxgtuEMilBBjLM3TJ+8vIUKUGt06MD7hDoA7eK9/Miw5DzMjQ8UfUNoeZ
	 Kb59reOUH3KuZ3T1xDowM4jGx+JMrwV11KBm3Iyw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 06620F80100;
	Tue, 11 Apr 2023 16:49:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2016EF8032B; Tue, 11 Apr 2023 16:49:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5DABAF80100
	for <alsa-devel@alsa-project.org>; Tue, 11 Apr 2023 16:49:03 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 7754F11D8;
	Tue, 11 Apr 2023 16:49:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 7754F11D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1681224542; bh=3007J/4DUPAi9yreL+X9s96S1ft/k282kQz//d5KHaA=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=RfRBwFt5qqmZOKzzXQ+oDTZlEEBbmY9V4444s/qO0KGZr0taY4RG79IIdXG/O/tL5
	 BpvRLyUAYxyu6wsKbpbKVWAqXFFTyhPdBxKokOtQnDo7sJHOlIiwpF3lPOomm5HYTm
	 2hOxyvBaOBQ6hOrc5qr0Dgzm5//Z7tAyPx8IZSIs=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue, 11 Apr 2023 16:48:59 +0200 (CEST)
Message-ID: <6d6c5f3a-81bc-acf4-eb4d-229b581bbe8b@perex.cz>
Date: Tue, 11 Apr 2023 16:48:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 2/2] ALSA: pcm: auto-fill buffer with silence when
 draining playback
Content-Language: en-US
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
 Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
References: <20230405201219.2197789-1-oswald.buddenhagen@gmx.de>
 <20230405201219.2197789-2-oswald.buddenhagen@gmx.de>
 <3d75c103-7e94-e6a1-7f3d-7f957c33cddc@perex.cz> <ZDEWyjdVE2IocpGY@ugly>
 <22f551f3-deae-1536-bd07-0b9340940ea4@perex.cz> <ZDVnUj2B0EkMiOlA@ugly>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <ZDVnUj2B0EkMiOlA@ugly>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: GOV4YHVYQJAFXGCAZHY6EJBSVOJVXYAE
X-Message-ID-Hash: GOV4YHVYQJAFXGCAZHY6EJBSVOJVXYAE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GOV4YHVYQJAFXGCAZHY6EJBSVOJVXYAE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 11. 04. 23 15:57, Oswald Buddenhagen wrote:
> On Tue, Apr 11, 2023 at 01:09:59PM +0200, Jaroslav Kysela wrote:
>> On 08. 04. 23 9:24, Oswald Buddenhagen wrote:
>>>> Also, silencing touches the DMA buffer which may not be desired.
>>>>
>>> hypothetically, yes. but practically? [...]
>>
>> The buffers can be mmaped so used directly for application and
>> hardware.
>>
> yes, and they are owned by the hardware/driver. an application would
> know better than doing with them anything they were not designed for.
> 
>>>> And lastly drivers can handle draining correctly (stop at the exact
>>>> position - see substream->ops->trigger with SNDRV_PCM_TRIGGER_DRAIN
>>>> argument).
>>>>
>>> yeah. hypothetically. afaict, there is exactly one driver which supports
>>> this. most (older) hardware wouldn't even have the capability to do such
>>> precise timing without external help.
>>
>> Most hardware has FIFO and most drivers uses the DMA position, so I think that
>> the interrupt -> stop DMA latency may be covered with this FIFO in most cases.
>>
> on most hardware it would be quite a stunt to re-program the buffer
> pointers on the fly to enable a mid-period interrupt. and given the
> reliability problems insisted on by takashi in the other thread, the
> approach seems questionable at best. and that's still ignoring the
> effort of migrating tens (hundreds?) of drivers.

I said to not change things at the moment. Drivers may be revised at some 
point. If we have large buffers, the silencing may consume many CPU ticks. If 
the driver already behaves nicely for the drain operation, this is an extra 
step which should be avoided. This can be handled using new snd_pcm_ops, of 
course.

You're using a hammer to fix a little issue.

>> Again, I would improve the documentation.
>>
> no amount of documentation will fix a bad api. it's just not how humans
> work.

Which code does not fill the last period? Alsa utilities do it. We can 
eventually handle this in alsa-lib.

>> the silencing is controlled using sw_params, so applications may
>> request the silencing before drain.
>>
> yeah, they could, but they don't, and most won't ever.
> 
> you're arguing for not doing a very practical and simple change that
> will fix a lot of user code at once, for the sake of preventing an
> entirely hypothetical and implausible problem. that is not a good
> trade-off.

I'm arguing that we should not do anything extra with the buffers until the 
application requests that. That's the clear API context.

>> Lastly, I think that you cannot call updated snd_pcm_playback_silence()
>> function with runtime->silence_size == 0.
>>
>>          if (runtime->silence_size < runtime->boundary) {
>>
> you missed the hunk that adjusts the code accordingly.

Ohh, yes. You're right.

If we allow modification of the PCM buffer, I think that we should:

- Do not modify the buffer for drivers already working with the
   appl_ptr data (end position) only.
- Handle the situation with the large buffer; it may make sense
   to change the "wait" operation from the end-of-period interrupt to time
   scheduler and stop the drain more early when the end-of-valid data condition
   is fulfilled.
- Increase the protocol version.

But as I wrote, I would make those extensions configurable 
(SNDRV_PCM_HW_PARAMS_DRAIN_ALLOW_SILENCE). It can be turned on by default.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

