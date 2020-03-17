Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 217FF1883D7
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Mar 2020 13:24:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 858351847;
	Tue, 17 Mar 2020 13:23:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 858351847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584447880;
	bh=NOhtipFYWtoc+EopBve4b7VIGk5ey2TIIbxEGnRAcbA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pC5+HLw378c/91eXzyEluqqPbVFroBoBEH/jXX5Zr9bZOSKmqg9/32wbxDlZdydN0
	 diihJT6MWlQdV5uz4zgOl5ExZwpG3GNBH6vnSTYoBFMp6YeKPY7bZqa5ijlKCoPjxk
	 3jAGlaBFiJh+HfswnS07ycxgh1YiiLjYv2kellQs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F4A7F80232;
	Tue, 17 Mar 2020 13:22:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72A11F8022B; Tue, 17 Mar 2020 13:22:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 502AFF800CD
 for <alsa-devel@alsa-project.org>; Tue, 17 Mar 2020 13:22:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 502AFF800CD
IronPort-SDR: o06LFQ974aKwdjkH0g6k551C1P/NSfjZ9FgNlpmcPFued183PZPa0ZtrjSqz4RVPgwcmPC33NC
 PpXTrdrSaZfg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2020 05:22:49 -0700
IronPort-SDR: XdqzQsl1uPlDaP+NqkKStWnVn0XxYradtpWoKzUMeBatCJSEp3HS/E4eXGhBOGb/rYDjgj2Sgc
 9Z8qsBE5mvrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,564,1574150400"; d="scan'208";a="290978968"
Received: from dasabhi1-mobl.amr.corp.intel.com (HELO [10.255.35.148])
 ([10.255.35.148])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Mar 2020 05:22:48 -0700
Subject: Re: [PATCH] soundwire: stream: only change state if needed
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 alsa-devel@alsa-project.org
References: <20200317105142.4998-1-pierre-louis.bossart@linux.intel.com>
 <6bc8412a-f6d9-64d1-2218-ca98cfdb31c0@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <27a73cbd-9418-4488-5cb2-fb21f9fc9110@linux.intel.com>
Date: Tue, 17 Mar 2020 07:22:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <6bc8412a-f6d9-64d1-2218-ca98cfdb31c0@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, vkoul@kernel.org, broonie@kernel.org,
 jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

Hi Srinivas,

> This patch did not work for me as it is as wsa881x codec does prepare 
> and enable in one function, which breaks some of the assumptions in this 
> patch.

Ah yes, if two transitions happen in the same DAI callback that wouldn't 
work indeed. We should probably add this restriction to the state 
machine documentation, the suggested mapping from ASoC DAI states to 
stream states did not account for compound cases.

> However with below change I could get it working without moving stream 
> handling to machine driver.

The change below would be an error case for Intel, so it's probably 
better if we go with your suggestion. You have a very specific state 
handling due to your power amps and it's probably better to keep it 
platform-specific.

Can you confirm though that this patch works fine if you move all the 
stream transitions to the machine driver? That should be a no-op but 
better make sure there's no misunderstanding.

Thanks
-Pierre

> ---------------------------->cut<-------------------------------
> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> index be71af4671a4..4a94ea64c1c5 100644
> --- a/drivers/soundwire/stream.c
> +++ b/drivers/soundwire/stream.c
> @@ -1574,7 +1574,8 @@ int sdw_prepare_stream(struct sdw_stream_runtime 
> *stream)
> 
>          sdw_acquire_bus_lock(stream);
> 
> -       if (stream->state == SDW_STREAM_PREPARED) {
> +       if (stream->state == SDW_STREAM_PREPARED ||
> +           stream->state == SDW_STREAM_ENABLED) {
>                  /* nothing to do */
>                  ret = 0;
>                  goto state_err;
> @@ -1754,7 +1755,8 @@ int sdw_disable_stream(struct sdw_stream_runtime 
> *stream)
> 
>          sdw_acquire_bus_lock(stream);
> 
> -       if (stream->state == SDW_STREAM_DISABLED) {
> +       if (stream->state == SDW_STREAM_DISABLED ||
> +           stream->state == SDW_STREAM_DEPREPARED) {
>                  /* nothing to do */
>                  ret = 0;
>                  goto state_err;
> ---------------------------->cut<-------------------------------
> 
> --srini
> 
>> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
>> index 1b43d03c79ea..3319121cd706 100644
>> --- a/drivers/soundwire/stream.c
>> +++ b/drivers/soundwire/stream.c
>> @@ -1572,6 +1572,7 @@ int sdw_prepare_stream(struct sdw_stream_runtime 
>> *stream)
>>       sdw_acquire_bus_lock(stream);
>>       if (stream->state == SDW_STREAM_PREPARED) {
>> +        /* nothing to do */
>>           ret = 0;
>>           goto state_err;
>>       }
>> @@ -1661,6 +1662,12 @@ int sdw_enable_stream(struct sdw_stream_runtime 
>> *stream)
>>       sdw_acquire_bus_lock(stream);
>> +    if (stream->state == SDW_STREAM_ENABLED) {
>> +        /* nothing to do */
>> +        ret = 0;
>> +        goto state_err;
>> +    }
>> +
>>       if (stream->state != SDW_STREAM_PREPARED &&
>>           stream->state != SDW_STREAM_DISABLED) {
>>           pr_err("%s: %s: inconsistent state state %d\n",
>> @@ -1744,6 +1751,12 @@ int sdw_disable_stream(struct 
>> sdw_stream_runtime *stream)
>>       sdw_acquire_bus_lock(stream);
>> +    if (stream->state == SDW_STREAM_DISABLED) {
>> +        /* nothing to do */
>> +        ret = 0;
>> +        goto state_err;
>> +    }
>> +
>>       if (stream->state != SDW_STREAM_ENABLED) {
>>           pr_err("%s: %s: inconsistent state state %d\n",
>>                  __func__, stream->name, stream->state);
>> @@ -1809,6 +1822,12 @@ int sdw_deprepare_stream(struct 
>> sdw_stream_runtime *stream)
>>       sdw_acquire_bus_lock(stream);
>> +    if (stream->state == SDW_STREAM_DEPREPARED) {
>> +        /* nothing to do */
>> +        ret = 0;
>> +        goto state_err;
>> +    }
>> +
>>       if (stream->state != SDW_STREAM_PREPARED &&
>>           stream->state != SDW_STREAM_DISABLED) {
>>           pr_err("%s: %s: inconsistent state state %d\n",
>>
