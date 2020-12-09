Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 850642D4698
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Dec 2020 17:20:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C44F616C7;
	Wed,  9 Dec 2020 17:19:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C44F616C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607530838;
	bh=7Rcvqzcfbrg7Ru6wnf5UpICJR9hJsvOFVv32oQ/f2Ww=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pq14vPFr2rvOLMXE/WE0P9rJZscEB0/8jPSanrolOZXXQNVx6Pa3aRttftYas3dFr
	 72bFznCIKzWFvNldnn3Qb3lMuNpnMjiLQWqbMi0/xMd5Ea1lkz1drOQz3P6EW+DYeH
	 MpQ27TxvigQdsNulmDObs7qN5cPJh6CnExJgQtIU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 179B4F80240;
	Wed,  9 Dec 2020 17:19:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18A3AF80227; Wed,  9 Dec 2020 17:19:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=BIGNUM_EMAILS,NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E4C7F8020D
 for <alsa-devel@alsa-project.org>; Wed,  9 Dec 2020 17:19:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E4C7F8020D
IronPort-SDR: v573gzh1NFRiwQmYB+zPdbMHMWm8rQj2nWpuoRyPdIG4jJVJljOo4s3pIOqVtlZ6+Z1uU4QKHv
 fQNuRk6F/psA==
X-IronPort-AV: E=McAfee;i="6000,8403,9829"; a="173342482"
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; d="scan'208";a="173342482"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2020 08:19:39 -0800
IronPort-SDR: SDm9yU9TO2EiBBg8rYxrlq4fOMEDfkUospzUXe5WDALpmWeozu1vG57bJTwJVLLBlzZOQnBNoB
 ZMBsIz6KAOIg==
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; d="scan'208";a="364199753"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.249.141.187])
 ([10.249.141.187])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2020 08:19:34 -0800
Subject: Re: [bug report] ASoC: topology: fix endianness issues
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <X9B0eDcKy+9B6kZl@mwanda>
 <5d0d7992-49fa-21b4-d301-6456a11c13a9@linux.intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Message-ID: <b98a6125-c1a6-31c1-578b-b5ce7dbf12dc@linux.intel.com>
Date: Wed, 9 Dec 2020 17:19:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <5d0d7992-49fa-21b4-d301-6456a11c13a9@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

On 12/9/2020 3:30 PM, Pierre-Louis Bossart wrote:
> Thanks Dan for the bug report.
> 
> On 12/9/20 12:53 AM, Dan Carpenter wrote:
>> [ This bug is way older than your patch but you might know the answer.
>>    -dan ]
>>
>> Hello Pierre-Louis Bossart,
>>
>> The patch 5aebe7c7f9c2: "ASoC: topology: fix endianness issues" from
>> Apr 4, 2019, leads to the following static checker warning:
>>
>>     sound/soc/soc-topology.c:903 soc_tplg_denum_create_values()
>>     warn: potential pointer math issue ('se->dobj.control.dvalues' is 
>> a 64 bit pointer)
>>
>> sound/soc/soc-topology.c
>>     887  static int soc_tplg_denum_create_values(struct soc_tplg 
>> *tplg, struct soc_enum *se,
>>     888                                          struct 
>> snd_soc_tplg_enum_control *ec)
>>     889  {
>>     890          int i;
>>     891
>>     892          if (le32_to_cpu(ec->items) > sizeof(*ec->values))
>>
>> The warning is from this line where Smatch starts to think that
>> "ec->items" is the number of bytes, but later in the function we treat
>> it was the number of elements.
>>
>> I do think probably this should be if:
>>
>>         if (le32_to_cpu(ec->items) > ARRAY_SIZE(ec->values))
>>             return -EINVAL;
>>
>> The ec->values[] is an array of u32:
>>
>>     __le32 values[SND_SOC_TPLG_NUM_TEXTS * 
>> SNDRV_CTL_ELEM_ID_NAME_MAXLEN / 4];
>>
>> so this code will return -EINVAL for anything larger than 4.  Changing
>> it to ARRAY_SIZE() would raise the limit to 176.
> 
> I agree with your analysis, even in the initial code the pattern was
> 
> if (ec->items > sizeof(*ec->values))
> 
> and that's indeed a clear confusion between number of elements and total 
> number of bytes.
> 
> Ranjani and Amadeusz are more familiar than me with the topology code, 
> let's see if they concur?
> 

Yes, seems about right, we can also replace devm_kzalloc below with 
devm_kcalloc to make it even more clear that we are dealing with array.


On related note looking at the UAPI header... I noticed:

struct snd_soc_tplg_enum_control {
	(...)
	char texts[SND_SOC_TPLG_NUM_TEXTS][SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
	__le32 values[SND_SOC_TPLG_NUM_TEXTS * SNDRV_CTL_ELEM_ID_NAME_MAXLEN / 4];

which means that there is 16 names and then there is an array of values, 
which seems somehow oversized compared to names... not sure why we 
multiply it by maximum length of name and then divide...

I guess we could change it to something like:
__le32 values[SND_SOC_TPLG_NUM_TEXTS];
__le32 reserved[160];

I'm not sure if we want to change it, but I guess it is something to 
keep in the back of the head. Quite frankly looking at it bit more I'm 
starting to think that those values from topology are not used anywhere 
after being assigned in the function from which this investigation 
started, simple grep for "dvalues" reports nothing more than 
soc-topology.c file, but I might have missed something.

Another thing which I started wondering about, why we even keep those 
values in "se->dobj.control", can't we just use "se" directly, as it 
seems to have required fields.

I guess I will look at it again tomorrow when I have a bit more fresh 
head, but I guess for now ARRAY_SIZE and devm_kcalloc change seems good 
to me, as the rest will have less to do with "array" type and more with 
general logic of parsing things.


>>
>>     893                  return -EINVAL;
>>     894
>>     895          se->dobj.control.dvalues = devm_kzalloc(tplg->dev, 
>> le32_to_cpu(ec->items) *
>>     896                                             sizeof(u32),
>>     897                                             GFP_KERNEL);
>>     898          if (!se->dobj.control.dvalues)
>>     899                  return -ENOMEM;
>>     900
>>     901          /* convert from little-endian */
>>     902          for (i = 0; i < le32_to_cpu(ec->items); i++) {
>>     903                  se->dobj.control.dvalues[i] = 
>> le32_to_cpu(ec->values[i]);
>>     904          }
>>     905
>>     906          return 0;
>>     907  }
>>
>> regards,
>> dan carpenter
>>

