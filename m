Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D84AA4654B7
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 19:05:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DDE3264B;
	Wed,  1 Dec 2021 19:04:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DDE3264B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638381934;
	bh=jZP/uGFGeTWyFYwi736sffqI1AIeXYj12+7qaNWbYbU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g+oxIUMTNvMW7bWdEb5KbqDOOtzdvqWqiQH0Ob0C6Qkheb5Jew98XYlj7EtlOv/YD
	 ht53RiBKCXd2w8w8J6PuwXM9zngHf9lDV953Ak6EuEmNVnyikfzf0TQzzq6ncdMV5r
	 Fa7hhZFXI2+WlipqsNtbw2orUe8jvrjF+D7bBmfc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB283F800EE;
	Wed,  1 Dec 2021 19:04:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73AE9F80246; Wed,  1 Dec 2021 19:04:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45FCEF800EE
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 19:04:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45FCEF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="RsFsRk0q"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1B19NQ9r027499;
 Wed, 1 Dec 2021 12:04:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=pyp1TAbxa7YUdNkiOpOcVtxFm2XnRURzLJBvohFGoxk=;
 b=RsFsRk0qU/Tu5etsNutV5xMOylDY+gxDuywgfncsTdmNJXrHlU04WjenmDorQYqkthT/
 xE7ba0/617qGDM9AR9j4UXK72ZzFcv2CYdn8x/aVC+YReTxfJK1PyirRVRD1BSaSG5Ef
 q1+lALHX+m0Bw9fPfbbhorsjaQXrNHq9lwr86dbcosN/8K1d2Pjx7OfI5v1O0Qd1BRHI
 wh2OPXqGniAYWMY/UcSrnAzDLQFfc53lS96rOUU+6mnneszn9WWm2c4gRCGuUwTbRtce
 Pg/9bDsJA51uEFmeaY18dxIzutuMeZNTXH9GPXQOys7/meUCJlz4MhygXAxL16f12G34 2A== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3cp6c88m0b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 01 Dec 2021 12:04:03 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 1 Dec
 2021 18:04:01 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Wed, 1 Dec 2021 18:04:01 +0000
Received: from [10.0.2.15] (AUSNPC0LSNW1.ad.cirrus.com [198.61.65.14])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C68222A9;
 Wed,  1 Dec 2021 18:04:00 +0000 (UTC)
Subject: Re: [PATCH] ASoC: cs42l42: Implement system suspend
To: Mark Brown <broonie@kernel.org>
References: <20211201153648.17259-1-rf@opensource.cirrus.com>
 <YaejghraYE6lD7FD@sirena.org.uk>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
Message-ID: <87930df9-6220-807e-a655-1c7d7ec020ab@opensource.cirrus.com>
Date: Wed, 1 Dec 2021 18:04:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YaejghraYE6lD7FD@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: l6NUKJMfHVc9esOqDhTuWtwLtDP8WAL0
X-Proofpoint-GUID: l6NUKJMfHVc9esOqDhTuWtwLtDP8WAL0
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On 01/12/2021 16:32, Mark Brown wrote:
> On Wed, Dec 01, 2021 at 03:36:48PM +0000, Richard Fitzgerald wrote:
>> Add system suspend functions to handle clean power-down on suspend and
>> restoring state on resume.
>>
>> The jack state could change during suspend. Plug->unplug and unplug->plug
>> are straightforward because this looks no different from any other plug
>> state change. However, the jack could be unplugged and a different type
> 
> This fiddling about with the jack detect feels like it should be at
> least one separate change, possibly multiple changes - the reporting of
> button states feels like it should be a good cleanup/fix separately for
> example.

I'll split them out.

> 
>> of jack plugged, and on resume the plug state would not have changed.
>> Some code changes are needed to the jack handling so that on resume a
>> plugged state will be re-evaluated instead of filtered out. In this case
> 
> It would be helpful to elaborate on what these code changes might be.
> 
>> +	/*
>> +	 * PWR_CTL2 must be volatile so it can be used as a canary bit to
>> +	 * detect a reset during system suspend.
>> +	 */
>> +	case CS42L42_PWR_CTL2:
> 
> This feels a bit hackish

I can't think of a better way of detecting whether the chip reset. If
we don't have control of the reset GPIO we can't force a reset. So it
depends whether power turned off (also whether it dropped below the
Vmin voltage at which a reset is triggered). The regulator framework
can't tell us if it really turned off power and on ACPI systems the
power is all controlled magically.

 >     - is the cost of doing the cache sync really so> expensive that 
it's worth the effort of trying to skip it?
> 

It's not cost, it's about getting the correct values in the registers.
If we call regcache_mark_dirty() it tells regmap that all the hardware
registers have reset to default. Then regcache_sync() will skip writing
cache values that are the register default value, assuming that the
register already has this value. If the chip didn't reset, the registers
could retain non-default values while the cache contains a dirty
default value, in that case the register needs updating to match the
cache.

I tried to persuade myself that a cache value couldn't possibly change
at any time from suspend() being called to resume disabling cache-only
so I could safely accept default values being skipped. But that
assumption made me very uncomfortable - I don't like leaving potential
bugs in when its simple enough to prevent them.

>> +	if (cs42l42->suspended) {
>> +		mutex_unlock(&cs42l42->irq_lock);
>> +		return IRQ_NONE;
>> +	}
> 
> Given that you're using disable_irq() to force the interrupt off (which
> is a bit rude but often the best one can do) how might we be getting an
> interrupt while suspended?  This seems to indicate an error condition.
> 

I may have misunderstood here, but the documentation says that
enables/disables are nested. The interrupt starts out enabled right
after calling request_threaded_irq(), so I expected that all users of
the shared interrupt would have to call disable_irq() for it to actually
get disabled (I put the call in on that basis that it does no harm). If
disable_irq() forces the irq off even if it's shared then I'll remove it
because as you say that would be rude.

>>   			case CS42L42_PLUG_OMTP:
>>   				snd_soc_jack_report(cs42l42->jack, SND_JACK_HEADSET,
>> -						    SND_JACK_HEADSET);
>> +						    SND_JACK_HEADSET |
>> +						    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
>> +						    SND_JACK_BTN_2 | SND_JACK_BTN_3);
>>   				break;
>>   			case CS42L42_PLUG_HEADPHONE:
>>   				snd_soc_jack_report(cs42l42->jack, SND_JACK_HEADPHONE,
>> -						    SND_JACK_HEADPHONE);
>> +						    SND_JACK_HEADSET |
>> +						    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
>> +						    SND_JACK_BTN_2 | SND_JACK_BTN_3);
> 
> This unconditionally clears the button status - will something notice if
> the buttons are pressed?
> 
>> +	} else {
>> +		/*
>> +		 * Only call regcache_mark_dirty() if cs42l42 reset, so
>> +		 * regcache_sync() writes all non-default cached values.
>> +		 * If it didn't reset we don't want to filter out syncing
>> +		 * dirty cache entries that have default value.
>> +		 * DISCHARGE_FILT==1 after suspend. If the cs42l42 reset
>> +		 * it will now be 0.
>> +		 */
> 
> Something needs to tell regmap that the cache is dirty otherwise it

Regmap knows if it has dirty values that it hasn't written out to the
hardware.

> won't sync anything, including the non-default register values?  There's

That's fine. If the registers have not been reset they still have the
value of every clean cache entry. Every dirty cache entry will be
written out by regcache_sync().

> currently an assumption coded in there that the cache is dirty because
> the device was reset and everything has default values.
> 

Regmap only assumes that if regcache_mark_dirty() is called.
