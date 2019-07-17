Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDE96BF28
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2019 17:32:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E409A168E;
	Wed, 17 Jul 2019 17:31:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E409A168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563377546;
	bh=jct/k7bNqxaLJ8pdUps0Gs2Fw1aDkr/UdpkU2C6c1CY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qewbo+07NHb++FzVbov7QfyO089KXhsCtVBP6NJeFzfCoTkj5sFjyu6NX1ikRWpib
	 42XBLXiAEOS3vneVeUejQ6B0bbdNXare1+uLF45lLxDNz9BSl15C1E7WI3RzIgcqMF
	 C3rRYGpXqCFEZLhNxkfeJaM/W65FdhD/L5diV6i8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 483DDF80363;
	Wed, 17 Jul 2019 17:30:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1A07F80363; Wed, 17 Jul 2019 17:30:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDCE9F8015B
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 17:30:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDCE9F8015B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jul 2019 08:30:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,274,1559545200"; d="scan'208";a="172898749"
Received: from szrederp-mobl.amr.corp.intel.com (HELO [10.252.199.30])
 ([10.252.199.30])
 by orsmga006.jf.intel.com with ESMTP; 17 Jul 2019 08:30:27 -0700
To: Curtis Malainey <cujomalainey@google.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20190709040147.111927-1-levinale@chromium.org>
 <20190709114519.GW9224@smile.fi.intel.com>
 <CAOReqxirZdKJQ59Z4789wT5Cxh2fyQrUcuB1pm9AidYLiPEs1A@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <029bc013-608b-031b-780e-c48486fd9c15@linux.intel.com>
Date: Wed, 17 Jul 2019 10:30:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAOReqxirZdKJQ59Z4789wT5Cxh2fyQrUcuB1pm9AidYLiPEs1A@mail.gmail.com>
Content-Language: en-US
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Jie Yang <yang.jie@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ben Zhang <benzh@chromium.org>, Mark Brown <broonie@kernel.org>,
 Curtis Malainey <cujomalainey@chromium.org>,
 Alex Levin <levinale@chromium.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: Atom: read timestamp moved to
 period_elapsed
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



On 7/10/19 6:15 PM, Curtis Malainey wrote:
> On Tue, Jul 9, 2019 at 4:45 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
>>
>> On Mon, Jul 08, 2019 at 09:01:47PM -0700, Alex Levin wrote:
>>> sst_platform_pcm_pointer is called from both snd_pcm_period_elapsed and
>>> from snd_pcm_ioctl. Calling read timestamp results in recalculating
>>> pcm_delay and buffer_ptr (sst_calc_tstamp) which consumes buffers in a
>>> faster rate than intended.
>>> In a tested BSW system with chtrt5650, for a rate of 48000, the
>>> measured rate was sometimes 10 times more than that.
>>> After moving the timestamp read to period elapsed, buffer consumption is
>>> as expected.
>>
>>  From code prospective it looks good. You may take mine
>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>
>> Though I'm not an expert in the area, Pierre and / or Liam should give
>> their blessing.
>>
> Agreed, Liam or Pierre should also give their ok since this is one of
> the closed source firmware drivers.
> 
> Reviewed-by: Curtis Malainey <cujomalainey@chromium.org>

Humm, this first review after my Summer break isn't straightforward.

By moving the timestamp update to the period elapsed event, don't you 
prevent the use of this driver in no-interrupt mode - which I understood 
as the baseline for Chrome?

And I also don't get how this timestamp might lead to 10x speed issues, 
this driver has been around for a number of years and that specific 
error was never seen. What is different in this platform and can this be 
seen e.g. on a Cyan device?


>>>
>>> Signed-off-by: Alex Levin <levinale@chromium.org>
>>> ---
>>>   sound/soc/intel/atom/sst-mfld-platform-pcm.c | 23 +++++++++++++-------
>>>   1 file changed, 15 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
>>> index 0e8b1c5eec88..196af0b30b41 100644
>>> --- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
>>> +++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
>>> @@ -265,16 +265,28 @@ static void sst_period_elapsed(void *arg)
>>>   {
>>>        struct snd_pcm_substream *substream = arg;
>>>        struct sst_runtime_stream *stream;
>>> -     int status;
>>> +     struct snd_soc_pcm_runtime *rtd;
>>> +     int status, ret_val;
>>>
>>>        if (!substream || !substream->runtime)
>>>                return;
>>>        stream = substream->runtime->private_data;
>>>        if (!stream)
>>>                return;
>>> +
>>> +     rtd = substream->private_data;
>>> +     if (!rtd)
>>> +             return;
>>> +
>>>        status = sst_get_stream_status(stream);
>>>        if (status != SST_PLATFORM_RUNNING)
>>>                return;
>>> +
>>> +     ret_val = stream->ops->stream_read_tstamp(sst->dev, &stream->stream_info);
>>> +     if (ret_val) {
>>> +             dev_err(rtd->dev, "stream_read_tstamp err code = %d\n", ret_val);
>>> +             return;
>>> +     }
>>>        snd_pcm_period_elapsed(substream);
>>>   }
>>>
>>> @@ -658,20 +670,15 @@ static snd_pcm_uframes_t sst_platform_pcm_pointer
>>>                        (struct snd_pcm_substream *substream)
>>>   {
>>>        struct sst_runtime_stream *stream;
>>> -     int ret_val, status;
>>> +     int status;
>>>        struct pcm_stream_info *str_info;
>>> -     struct snd_soc_pcm_runtime *rtd = substream->private_data;
>>>
>>>        stream = substream->runtime->private_data;
>>>        status = sst_get_stream_status(stream);
>>>        if (status == SST_PLATFORM_INIT)
>>>                return 0;
>>> +
>>>        str_info = &stream->stream_info;
>>> -     ret_val = stream->ops->stream_read_tstamp(sst->dev, str_info);
>>> -     if (ret_val) {
>>> -             dev_err(rtd->dev, "sst: error code = %d\n", ret_val);
>>> -             return ret_val;
>>> -     }
>>>        substream->runtime->delay = str_info->pcm_delay;
>>>        return str_info->buffer_ptr;
>>>   }
>>> --
>>> 2.22.0.410.gd8fdbe21b5-goog
>>>
>>
>> --
>> With Best Regards,
>> Andy Shevchenko
>>
>>
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
