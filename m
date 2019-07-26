Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FB276C5B
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 17:08:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 099F120A1;
	Fri, 26 Jul 2019 17:07:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 099F120A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564153689;
	bh=KWMbb5Nu53XAWa4oI7HZt3sGylrKPFAMglWRaD87G6w=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CqgHXWEM8zfvp0yl3tGapfpTpVqtovBbFSX355IOVPyZJvuTPP/XSYqWucp9yyFXl
	 7S5GugP1fGP+dUG1jrH7Tfsc98saDlsaUqiEurlTauu69vZOs2vPWr5ddJfLPv5hjA
	 pf3lBRCj8s/xD+ih/nViNlZ/JhsSjmshnBuEnvko=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF0EBF8045F;
	Fri, 26 Jul 2019 17:06:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64209F803D7; Fri, 26 Jul 2019 17:06:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 901A4F803D5
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 17:05:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 901A4F803D5
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 08:05:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,311,1559545200"; d="scan'208";a="322060204"
Received: from msmall-mobl.amr.corp.intel.com (HELO [10.251.154.62])
 ([10.251.154.62])
 by orsmga004.jf.intel.com with ESMTP; 26 Jul 2019 08:05:55 -0700
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-24-pierre-louis.bossart@linux.intel.com>
 <20190726145129.GI16003@ubuntu>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <8ec39464-81f7-e29d-7a2c-b2903a7fbf60@linux.intel.com>
Date: Fri, 26 Jul 2019 10:05:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190726145129.GI16003@ubuntu>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 23/40] soundwire: stream: fix disable
 sequence
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


> Unrelated to this specific patch, but I looked at _sdw_disable_stream()
> and I see this there (again, maybe my version is outdated already):
> 
> 	struct sdw_master_runtime *m_rt = NULL;
> 	struct sdw_bus *bus = NULL;
> 
> where both those initialisations are redundant. Moreover:

will look at this, thanks.

> 
> On Thu, Jul 25, 2019 at 06:40:15PM -0500, Pierre-Louis Bossart wrote:
>> When we disable the stream and then call hw_free, two bank switches
>> will be handled and as a result we re-enable the stream on hw_free.
>>
>> Make sure the stream is disabled on both banks.
>>
>> TODO: we need to completely revisit all this and make sure we have a
>> mirroring mechanism between current and alternate banks.
>>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> ---
>>   drivers/soundwire/stream.c | 19 ++++++++++++++++++-
>>   1 file changed, 18 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
>> index 53f5e790fcd7..75b9ad1fb1a6 100644
>> --- a/drivers/soundwire/stream.c
>> +++ b/drivers/soundwire/stream.c
>> @@ -1637,7 +1637,24 @@ static int _sdw_disable_stream(struct sdw_stream_runtime *stream)
>>   		}
>>   	}
>>   
>> -	return do_bank_switch(stream);
>> +	ret = do_bank_switch(stream);
>> +	if (ret < 0) {
>> +		dev_err(bus->dev, "Bank switch failed: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	/* make sure alternate bank (previous current) is also disabled */
>> +	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
>> +		bus = m_rt->bus;
> 
> "bus" is only used below, so at least take that line under "if (ret < 0)"
> or even just do "dev_err(m_rt->bus->dev,...)" everywhere in this function
> and remove the variable altogether...

will look at this, thanks Guennadi

> 
> Thanks
> Guennadi
> 
>> +		/* Disable port(s) */
>> +		ret = sdw_enable_disable_ports(m_rt, false);
>> +		if (ret < 0) {
>> +			dev_err(bus->dev, "Disable port(s) failed: %d\n", ret);
>> +			return ret;
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
