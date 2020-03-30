Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2235197BDE
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 14:30:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83D301666;
	Mon, 30 Mar 2020 14:29:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83D301666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585571428;
	bh=GLDd/+Fz8haNi4vTztC0RxiVI8rvXo+s9L+KiJlcOuI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sUzvtQWt2ApRG4rgzTzC7DIObT9QdBf+hcwwyb9BT421+G8muvV4Zrvf3nxTs/rq9
	 e5PCbyXe0PSQSgC3I0HBz2fsOgj3zllMDItspQmdX7oC1g7bKqFkzDOOBUYkSQlxfg
	 e+xuK3DNGjXqr77RelRVzuGe4HeHyhONCdfAoRR0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92CC0F800AA;
	Mon, 30 Mar 2020 14:28:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89481F80148; Mon, 30 Mar 2020 14:28:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mx.flatmax.org (mx.flatmax.org [13.55.16.222])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1801EF8010C
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 14:28:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1801EF8010C
Received: from 41.68.233.220.static.exetel.com.au ([220.233.68.41]
 helo=[192.168.1.50])
 by mx.flatmax.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <flatmax@flatmax.org>)
 id 1jItWl-0002iW-0a; Mon, 30 Mar 2020 23:28:28 +1100
Subject: Re: [PATCH] ASoC: snd_soc_dai_set_fmt add substream independence.
To: Mark Brown <broonie@kernel.org>
References: <20200328015831.6230-1-flatmax@flatmax.org>
 <20200330103213.GA4792@sirena.org.uk>
From: Matt Flax <flatmax@flatmax.org>
Message-ID: <3c00bf93-04a8-04af-e0b5-d0f76f5dbb06@flatmax.org>
Date: Mon, 30 Mar 2020 23:28:26 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200330103213.GA4792@sirena.org.uk>
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


On 30/3/20 9:32 pm, Mark Brown wrote:
> On Sat, Mar 28, 2020 at 12:58:31PM +1100, Matt Flax wrote:
>
>> This patch is aims to start a stronger discussion on allowing both CPU
>> and Codec dais to set formats independently based on direction.
> If the DAIs support completely separate formats they're not a single DAI
> and should be represented as two DAIs.


I understand, however having two DAIs produces subdevices and pushes the 
overhead of managing registers to the end user in the form of two sub 
devices.

Is everyone firm on the concept that a DAI's playback and capture stream 
has to have the same format in the same DAI ?

I can see a much better solution (then the one I posted here) which is 
also very simple to solve this problem in the same DAI.


>
>> One example of a sound card which requires independent stream formats is
>> an isolated sound card, such as the Audio Injector Isolated sound card.
>> The magnetic isolation chips on the sound card require stream fomats to
>> be different because of digital latency variations on the I2S lines.
> Honestly I'm not convinced this is ever going to work reliably - there
> is in general an assumption in the code that the formats on both ends of
> the link are the same, it seems you'll have to break that as well as
> having an asymmetric configuration.  You probably need to represent
> these isolators as a CODEC and do a CODEC to CODEC link and even then it
> seems worrying.

I like to think of isolation as innovative, not worrying :)

However w.r.t. the codec to codec link approach, I will take your advice 
and not go down that route.


thanks

Matt

