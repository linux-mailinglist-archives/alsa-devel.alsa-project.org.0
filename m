Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E104198D3D
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Mar 2020 09:42:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BEF11666;
	Tue, 31 Mar 2020 09:41:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BEF11666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585640545;
	bh=fU/35TCyGyMAVLo4yzYkFknu7qPOEouFYekeV8An0FQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YEeOBQBk8bnN3rhm7BvjU0lnPIKdM5mzgEV/7FBZgVsaQ3W1Epecunpvgc5kiSyVl
	 fmUvQa7XqabJWYKoIrh3txuZqXq1spRhTT2K5qs//ubN57lqv4v6ReRs21vCsHELkK
	 b6JKEmk4+RwTuIcbS9kuKK/5yCWrjHit9kRZx2t8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82372F80146;
	Tue, 31 Mar 2020 09:40:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2244DF80146; Tue, 31 Mar 2020 09:40:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mx.flatmax.org (mx.flatmax.org [13.55.16.222])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1553BF800AA
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 09:40:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1553BF800AA
Received: from 41.68.233.220.static.exetel.com.au ([220.233.68.41]
 helo=[192.168.1.51])
 by mx.flatmax.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <flatmax@flatmax.org>)
 id 1jJBVb-0000O8-Ex; Tue, 31 Mar 2020 18:40:27 +1100
Subject: Re: [PATCH] ASoC: snd_soc_dai_set_fmt add substream independence.
To: Mark Brown <broonie@kernel.org>
References: <20200328015831.6230-1-flatmax@flatmax.org>
 <20200330103213.GA4792@sirena.org.uk>
 <3c00bf93-04a8-04af-e0b5-d0f76f5dbb06@flatmax.org>
 <20200330163142.GI4792@sirena.org.uk>
From: Matt Flax <flatmax@flatmax.org>
Message-ID: <98c3a94a-9020-9a34-7bdf-0ce504573f79@flatmax.org>
Date: Tue, 31 Mar 2020 18:40:26 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20200330163142.GI4792@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com
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


On 31/3/20 3:31 am, Mark Brown wrote:
> On Mon, Mar 30, 2020 at 11:28:26PM +1100, Matt Flax wrote:
>> On 30/3/20 9:32 pm, Mark Brown wrote:
>>> On Sat, Mar 28, 2020 at 12:58:31PM +1100, Matt Flax wrote:
>>>> This patch is aims to start a stronger discussion on allowing both CPU
>>>> and Codec dais to set formats independently based on direction.
>>> If the DAIs support completely separate formats they're not a single DAI
>>> and should be represented as two DAIs.
>> I understand, however having two DAIs produces subdevices and pushes the
>> overhead of managing registers to the end user in the form of two sub
>> devices.
> I think that's a swings and roundabouts thing where it really depends on
> your use case - for example if the DAIs can be organized however people
> like then people can come up with creative ways to wire things that
> don't pair things in the way that makes sense for userspace.  Ideally
> we'd be able to match up any playback only stream with any capture only
> stream which would help a much wider range of systems.
>
>> Is everyone firm on the concept that a DAI's playback and capture stream has
>> to have the same format in the same DAI ?
> It does push a requirement for dealing with asymmetric setups including
> validation that nobody did anything that can't be supported onto all
> users to at least some extent, even if standard stuff were factored out
> into the core (which didn't happen yet).  This is for a *very* unusual
> requiremenet.


ok, I don't quite follow you, but I think what you are saying is that 
there is a trade off between simplifying things for the end user and 
core complexity leading to developer sloppiness ?

I believe you are saying that it is a rare case to require format 
asymmetry in the same DAI link. For that reason introducing extra 
functionality into the core may not be worth while ?


>>> having an asymmetric configuration.  You probably need to represent
>>> these isolators as a CODEC and do a CODEC to CODEC link and even then it
>>> seems worrying.
>> I like to think of isolation as innovative, not worrying :)
>> However w.r.t. the codec to codec link approach, I will take your advice and
>> not go down that route.
> No, my advice is to go down that route if you are doing this.  I'm just
> not convinced that it's going to work reliably since this all sounds
> rather shaky.

OK - I can try to go down that route. However I would like to confirm 
that having a codec to codec link doesn't require the original codec or 
CPU drivers to have separate DAIs for playback and capture ? In my case 
both the CPU and Codec drivers have single DAIs for both streams.

For example, my virtual codec DAI would have symmetric formats with the 
original CPU and asymmetric formats with the target codec. However the 
target codec only has one DAI defined, and thus I can't understand how 
to setup the virtual codec DAI to have an asymmetric link with the 
actual single codec DAI !


Matt

