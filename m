Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B776E14378D
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jan 2020 08:26:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33D7D1688;
	Tue, 21 Jan 2020 08:26:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33D7D1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579591611;
	bh=R7bu+H4HisJHKuSG+l5sRjBT/NjWDHEVfx4gBG29X5A=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X8eyjV0/wk3J66KD8U8fhw3kQQ0sCTcP7km/3UDxLqD9qoSYe9vKugI7oPXRx8bFO
	 GYciJm7MTsy8RrZ7fxmNKi/ALbyQrlMRA+m36gdELsQtr3HtQuyDHBZIFo5vfSkaOG
	 5uvXT1DSShuge7hEDBG1t+iW7GRfDbBDhHswcp7w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9051FF801ED;
	Tue, 21 Jan 2020 08:25:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96BECF801D9; Tue, 21 Jan 2020 08:25:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 060A4F8012F
 for <alsa-devel@alsa-project.org>; Tue, 21 Jan 2020 08:24:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 060A4F8012F
Received: from sslproxy02.your-server.de ([78.47.166.47])
 by www381.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1) (envelope-from <lars@metafoo.de>)
 id 1itnuB-0002MZ-V7; Tue, 21 Jan 2020 08:24:56 +0100
Received: from [93.104.121.58] (helo=[192.168.178.20])
 by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1itnuB-000Amn-NW; Tue, 21 Jan 2020 08:24:55 +0100
To: Takashi Iwai <tiwai@suse.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87k15l7ewd.wl-kuninori.morimoto.gx@renesas.com>
 <s5ha76h2t4f.wl-tiwai@suse.de>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <34657dc8-ea69-c16f-3755-d4c16d13fff1@metafoo.de>
Date: Tue, 21 Jan 2020 08:24:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <s5ha76h2t4f.wl-tiwai@suse.de>
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.101.4/25701/Mon Jan 20 12:41:43 2020)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] Question about snd_pcm_limit_hw_rates() call timing
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 1/21/20 7:58 AM, Takashi Iwai wrote:
> On Tue, 21 Jan 2020 02:54:26 +0100,
> Kuninori Morimoto wrote:
>>
>>
>> Hi ALSA ML
>>
>> soc-pcm has snd_pcm_limit_hw_rates() which determine rate_min/rate_max fields.
>> It updates runtime->hw.rate_min/max (A) based on hw->rates (B).
>>
>> 	int snd_pcm_limit_hw_rates(struct snd_pcm_runtime *runtime)
>> 	{
>> 		int i;
>> 		for (i = 0; i < (int)snd_pcm_known_rates.count; i++) {
>> (B)			if (runtime->hw.rates & (1 << i)) {
>> (A)				runtime->hw.rate_min = snd_pcm_known_rates.list[i];
>> 				break;
>> 			}
>> 		}
>> 		for (i = (int)snd_pcm_known_rates.count - 1; i >= 0; i--) {
>> (B)			if (runtime->hw.rates & (1 << i)) {
>> (A)				runtime->hw.rate_max = snd_pcm_known_rates.list[i];
>> 				break;
>> 			}
>> 		}
>> 		return 0;
>> 	}
>>
>> I guess the calling timing is
>>
>> 	1) set hw->rates
>> 	2) call snd_pcm_limit_hw_rates()
>> 	3) update hw->rate_min/max
>>
>> soc_pcm_init_runtime_hw() is calling it as this order
>>
>> 	static void soc_pcm_init_runtime_hw(xxx)
>> 	{
>> 		...
>> 1)		hw->rates = snd_pcm_rate_mask_intersect(rates, cpu_stream->rates);
>>
>> 2)		snd_pcm_limit_hw_rates(runtime);
>>
>> 3)		hw->rate_min = max(hw->rate_min, cpu_stream->rate_min);
>> 		hw->rate_min = max(hw->rate_min, rate_min);
>> 		hw->rate_max = min_not_zero(hw->rate_max, cpu_stream->rate_max);
>> 		hw->rate_max = min_not_zero(hw->rate_max, rate_max);
>> 	}
>>
>> But, dpcm_fe_dai_startup() are different.
>>
>> 	static int dpcm_fe_dai_startup(xxx)
>> 	{
>> 		...
>> 		/*
>> 		 * dpcm_set_fe_runtime() updates runtime->hw.xxx
>> 		 */
>> 1) 3)		dpcm_set_fe_runtime(fe_substream);
>> 2)		snd_pcm_limit_hw_rates(runtime);
>> 		...
>> 	}
>>
>> I guess we need fixup dpcm_fe_dai_startup() ?
> 
> A good catch.
> 
> Actually the question is whether we need snd_pcm_limit_hw_rates() call
> or not.  The current code in soc_pcm_init_runtime_hw() assumes that
> each cpu and codec dais already set the proper rate_min and rate_max,
> and narrow the range accordingly.  So basically the call there is
> superfluous.  OTOH, in dpcm_fe_dai_startup(), the call overrides the
> existing rate_min/max setup as you mentioned, so it may be wrong.
> 
> Or, better to ask -- is there any case that snd_pcm_limit_hw_rates()
> is mandatory in ASoC?  The snd_pcm_limit_hw_rates() is for setting up
> rates_min and rates_max from rates bits.  It's a function to be called
> only when we know that rates bits contain the full information and
> rates_min and rates_max are bogus.  That is, its overriding behavior
> is designed.
> 
> OTOH, if the driver sets up already valid rates_min and rates_max
> values, there is no need to call this function at all.

Usually a driver either sets rate_min/rate_max or it provides a discrete 
rate mask. Most drivers typically only provide the rate mask since they 
only support a discrete set of rates.

The generic code is supposed to support both cases, and even the rare 
case were both are set.

- Lars
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
