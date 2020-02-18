Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E496D1628E1
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2020 15:51:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70B4316A3;
	Tue, 18 Feb 2020 15:50:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70B4316A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582037462;
	bh=gPn39BmH7e6TwxaaNzhq3bp1oN2oLW2NdbzDGUX+qQ4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aZmwDdeoWnOWXx3MWyVCejb5tNgH6Zza5PtcErBUXlxjotJdRST5GfXQWKolcGJ0s
	 pMY4OkIyjqBc1J+X4iHhhE9HakwqQu0jUWrQ/kLZhG9nU55Nomlr56vBMk7zq0QlJ7
	 ffjlN2Cvkse41RJ8laG4PYVquiEbO9X91vAG8RdQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91FC5F8014A;
	Tue, 18 Feb 2020 15:49:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 639ECF80148; Tue, 18 Feb 2020 15:49:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E30DF80135
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 15:49:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E30DF80135
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Feb 2020 06:49:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,456,1574150400"; d="scan'208";a="224155997"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.237.137.172])
 ([10.237.137.172])
 by orsmga007.jf.intel.com with ESMTP; 18 Feb 2020 06:49:10 -0800
Subject: Re: [PATCH v4 06/11] ASoC: SOF: Intel: Account for compress streams
 when servicing IRQs
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20200131123115.14247-1-cezary.rojewski@intel.com>
 <20200131123115.14247-7-cezary.rojewski@intel.com>
 <56ed74d5-2f03-711f-9f21-cde0ddf8ecc7@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <44e8f78b-dbb5-e03a-637e-d8a8d71f4721@intel.com>
Date: Tue, 18 Feb 2020 15:49:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <56ed74d5-2f03-711f-9f21-cde0ddf8ecc7@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: vkoul@kernel.org, alsa-devel@alsa-project.org, broonie@kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com
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

On 2020-01-31 17:39, Pierre-Louis Bossart wrote:
> Maybe be a paranoid check but the types used in this patch seem to need 
> additional work:
> 
>> diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
>> index 9a8bf1eb7d69..9a24d57f0cf2 100644
>> --- a/include/sound/hdaudio.h
>> +++ b/include/sound/hdaudio.h
>> @@ -496,6 +496,7 @@ struct hdac_stream {
>>       bool locked:1;
>>       bool stripe:1;            /* apply stripe control */
>> +    unsigned long curr_pos;
> 
> 'long' is an error-prone definition...
> 
>>       /* timestamp */
>>       unsigned long start_wallclk;    /* start + minimum wallclk */
>>       unsigned long period_wallclk;    /* wallclk for period */
>> diff --git a/sound/soc/sof/intel/hda-stream.c 
>> b/sound/soc/sof/intel/hda-stream.c
>> index c0ab9bb2a797..c8920a60e346 100644
>> --- a/sound/soc/sof/intel/hda-stream.c
>> +++ b/sound/soc/sof/intel/hda-stream.c
>> @@ -571,6 +571,23 @@ bool hda_dsp_check_stream_irq(struct snd_sof_dev 
>> *sdev)
>>       return ret;
>>   }
>> +static void hda_dsp_set_bytes_transferred(struct hdac_stream *hstream,
>> +                      u64 buffer_size)
>> +{
>> +    unsigned int prev_pos;
>> +    int pos, num_bytes;
>> +
>> +    div_u64_rem(hstream->curr_pos, buffer_size, &prev_pos);
> 
> ... here you use it as a u64 value so I guess the intent was to use more 
> than 32 bits?
> 
> But then the u64 for the 'buffer size' argument is also not consistent 
> with the definition of div_u64_rem, it's got to be u32, or you wanted to 
> use div64_64_rem?
> 
> static inline u64 div_u64_rem(u64 dividend, u32 divisor, u32 *remainder)
> 
> prev_pos should also be declared as u32 to avoid any ambiguity.
> 
>> +    pos = snd_hdac_stream_get_pos_posbuf(hstream);
>> +
>> +    if (pos < prev_pos)
>> +        num_bytes = (buffer_size - prev_pos) +  pos;
>> +    else
>> +        num_bytes = pos - prev_pos;
>> +
>> +    hstream->curr_pos += num_bytes;
> 
> ... and here it's a never ending-increment that is likely to hit a 
> 32-bit ceiling.
> 
> I remember we made a mistake some time back on compressed stuff and 
> updated the counters to rely on 64 bits. Unless this is a hardware 
> counter (and then we should use u32 and deal with overflow), we should 
> use u64, no?

All addressed in v5, thanks for review!
