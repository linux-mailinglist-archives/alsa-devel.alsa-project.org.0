Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9B56DD8FE
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Apr 2023 13:11:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7CBEF17;
	Tue, 11 Apr 2023 13:10:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7CBEF17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681211463;
	bh=iUWoo+fQX5YHDr97l30scpDC70izLlWwntiufwTiqc0=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=CeVHXvh69AaJKvK7dOGapD7L55EON8F/VKQPcGIxfo0GAGoohakIqybIr2dFE/5ZS
	 u3gLV0++Lik/hryiq8UnUjBpRV2GxSfhkD2NUBgkJKKAqJ7k0qCr5AxE5gWuVdg58M
	 MgyUdT4g5Lwc6fCGb5fXx83Ct4+J17j96YZcN4qw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 65E3AF8025E;
	Tue, 11 Apr 2023 13:10:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4234CF8032B; Tue, 11 Apr 2023 13:10:10 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B9334F80100
	for <alsa-devel@alsa-project.org>; Tue, 11 Apr 2023 13:10:03 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id D04FE11D9;
	Tue, 11 Apr 2023 13:10:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz D04FE11D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1681211402; bh=uE3caihZAUFxo9m5yDgtBOKJyY6wNJMpAgfn+JxtGwg=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=bxdCfXrfaRvobYEVDyyLk8yjTXfjofuwrQjNlfnxJLhEbufBBavvmxx9VGiK5S+OP
	 QAReIPPVLFhdHyanpiPC7E7ywlNR18T38OOS0IWfp+aa4DBlOyPA1kaEhJ0ccMOMXy
	 1lUSCO94tiJg5xTk3fIaF5BcLsVOBc03SHLuJTGc=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue, 11 Apr 2023 13:09:59 +0200 (CEST)
Message-ID: <22f551f3-deae-1536-bd07-0b9340940ea4@perex.cz>
Date: Tue, 11 Apr 2023 13:09:59 +0200
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
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <ZDEWyjdVE2IocpGY@ugly>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: LW4V6XRFL3QGBYOYAF74TOIUN5NMVYC2
X-Message-ID-Hash: LW4V6XRFL3QGBYOYAF74TOIUN5NMVYC2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LW4V6XRFL3QGBYOYAF74TOIUN5NMVYC2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 08. 04. 23 9:24, Oswald Buddenhagen wrote:
> On Sat, Apr 08, 2023 at 01:58:21AM +0200, Jaroslav Kysela wrote:
>> On 05. 04. 23 22:12, Oswald Buddenhagen wrote:
>>> Draining will always playback somewhat beyond the end of the filled
>>> buffer. This would produce artifacts if the user did not set up the
>>> auto-silencing machinery. This patch makes it work out of the box.
>>>
>> I think that it was really bad decision to apply this patch without a
>> broader discussion.
> 
>> When we designed the API, we knew about described problems and we
>> decided to keep this up to applications.
>>
> i ran into no documentation of either the problems nor the decisions and
> their implications for the user.

The documentation may be improved, but the "period transfers" are described.

>> The silencing may not help in all cases where the PCM samples ends with
>> a high volume.
>>
> that would just create a slight crack, which isn't any different from a
> "regular" sudden stop.
> 
>> A volume ramping should be used and it's an application job.
>>
> imo, that entirely misses the point - the volume is most likely already
> zero at the end of the buffer. that doesn't mean that it's ok to play
> the samples again where the volume might not be *quite* zero yet.
> 
>> Also, silencing touches the DMA buffer which may not be desired.
>>
> hypothetically, yes. but practically? why would anyone want to play the
> same samples after draining? draining is most likely followed by closing
> the device. and even if not, in most cases (esp. where draining would
> actually make sense) one wouldn't play a fixed pattern that could be
> just re-used, so one would have to re-fill the buffer prior to starting
> again anyway. never mind the effort necessary to track the state of the
> buffer instead of just re-filling it. so for all practical purposes,
> already played samples can be considered undefined data and thus safe to
> overwrite.

The buffers can be mmaped so used directly for application and hardware. I 
don't really feel that it's a good thing to modify this buffer for playback 
when the application has not requested for that.

>> And lastly drivers can handle draining correctly (stop at the exact
>> position - see substream->ops->trigger with SNDRV_PCM_TRIGGER_DRAIN
>> argument).
>>
> yeah. hypothetically. afaict, there is exactly one driver which supports
> this. most (older) hardware wouldn't even have the capability to do such
> precise timing without external help.

Most hardware has FIFO and most drivers uses the DMA position, so I think that 
the interrupt -> stop DMA latency may be covered with this FIFO in most cases.

But I would really keep this on the driver code to handle this rather than do 
the forced silencing.

> On Sat, Apr 08, 2023 at 07:55:48AM +0200, Takashi Iwai wrote:
>> Applying the silencing blindly might be an overkill, indeed, although
>> this could be seen as an easy solution.  Let's see.
>>
> i don't think that "overkill" is right here. someone has to do the
> silencing for draining to be useful at all, and so the question is only
> who that should be. my argument is that not auto-silencing is
> *extremely* unexpected, and thus just bad api. i'm pretty certain that
> about 99% of the usages of DRAIN start out missing this, and most never
> get fixed.

Again, I would improve the documentation. Also, the silencing is controlled 
using sw_params, so applications may request the silencing before drain.

> imo, if any api is added, it should be to opt *out* of auto-silencing.
> but i don't think this makes any sense; there would be ~zero users of
> this ever.

Lastly, I think that you cannot call updated snd_pcm_playback_silence() 
function with runtime->silence_size == 0.

         if (runtime->silence_size < runtime->boundary) {
                 frames = runtime->silence_threshold - noise_dist;
                 if ((snd_pcm_sframes_t) frames <= 0)
                         return;
                 if (frames > runtime->silence_size)
                         frames = runtime->silence_size;
         } else {


The frames variable will be 0, so your code will do nothing.

			Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

