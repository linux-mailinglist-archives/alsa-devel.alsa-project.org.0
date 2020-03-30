Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F93519763D
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 10:14:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BD98166D;
	Mon, 30 Mar 2020 10:13:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BD98166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585556068;
	bh=Ao4CnocQQXX7C4xjyQFV0wNvr6mzOp4i8V3kuMfBn04=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mpGRyNYM4muRdSqx+qLNWUrNTnkw+7okMXEK6F4WTx1BxG7jzIKSO7EfIsZDxO3Sl
	 65v5IK3XOvIzDVAHxn/tKWFaEKd2S1hMq2hBfu0ppPu9WGRUddboPp/wn8i3o08Sy3
	 84w1ihI1IgTbShu87RPOhYNvRnfIoDIpUJs01gkI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC5FCF800AA;
	Mon, 30 Mar 2020 10:12:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BDC6F80148; Mon, 30 Mar 2020 10:12:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F555F800EB
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 10:12:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F555F800EB
IronPort-SDR: 5xdmNJ4EDugrrKk/kOeSI8I77pWKF4LLZMh7RqrNs2b8X+n5527fOVoMbIJhNGvMGGdxC15Sj5
 PYutlurWGKhA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2020 01:12:37 -0700
IronPort-SDR: gaiOMh+alj66gW6Hz+QqEFWD5TSaaoUBMqn30ltst5jrGYgX/w47d+i0xwnQmJ5x3BXCs4QbDW
 TY6t81ea7t9A==
X-IronPort-AV: E=Sophos;i="5.72,323,1580803200"; d="scan'208";a="395051175"
Received: from aslawinx-mobl1.ger.corp.intel.com (HELO [10.249.135.1])
 ([10.249.135.1])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2020 01:12:35 -0700
Subject: Re: [PATCH v2 3/6] ASoC: topology: Check return value of
 soc_tplg_*_create
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
References: <20200327204729.397-1-amadeuszx.slawinski@linux.intel.com>
 <20200327204729.397-4-amadeuszx.slawinski@linux.intel.com>
 <ea618248-5c0c-24f2-b1fb-2b5aecb16049@linux.intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Message-ID: <41ce872f-7fa5-74cd-396b-9bfae989e91c@linux.intel.com>
Date: Mon, 30 Mar 2020 10:12:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <ea618248-5c0c-24f2-b1fb-2b5aecb16049@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
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



On 3/27/2020 7:56 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 3/27/20 3:47 PM, Amadeusz Sławiński wrote:
>> Functions soc_tplg_denum_create, soc_tplg_dmixer_create,
>> soc_tplg_dbytes_create can fail, so their return values should be
>> checked and error should be propagated.
>>
>> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>> ---
>>
>>   v2:
>>    Added this patch
>>
>>   sound/soc/soc-topology.c | 18 ++++++++++++------
>>   1 file changed, 12 insertions(+), 6 deletions(-)
>>
>> diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
>> index c3811dd66b68..860bced933d6 100644
>> --- a/sound/soc/soc-topology.c
>> +++ b/sound/soc/soc-topology.c
>> @@ -1124,6 +1124,7 @@ static int soc_tplg_kcontrol_elems_load(struct 
>> soc_tplg *tplg,
>>       struct snd_soc_tplg_hdr *hdr)
>>   {
>>       struct snd_soc_tplg_ctl_hdr *control_hdr;
>> +    int ret;
>>       int i;
>>       if (tplg->pass != SOC_TPLG_PASS_MIXER) {
>> @@ -1152,25 +1153,30 @@ static int soc_tplg_kcontrol_elems_load(struct 
>> soc_tplg *tplg,
>>           case SND_SOC_TPLG_CTL_RANGE:
>>           case SND_SOC_TPLG_DAPM_CTL_VOLSW:
>>           case SND_SOC_TPLG_DAPM_CTL_PIN:
>> -            soc_tplg_dmixer_create(tplg, 1,
>> -                           le32_to_cpu(hdr->payload_size));
>> +            ret = soc_tplg_dmixer_create(tplg, 1,
>> +                    le32_to_cpu(hdr->payload_size));
>>               break;
>>           case SND_SOC_TPLG_CTL_ENUM:
>>           case SND_SOC_TPLG_CTL_ENUM_VALUE:
>>           case SND_SOC_TPLG_DAPM_CTL_ENUM_DOUBLE:
>>           case SND_SOC_TPLG_DAPM_CTL_ENUM_VIRT:
>>           case SND_SOC_TPLG_DAPM_CTL_ENUM_VALUE:
>> -            soc_tplg_denum_create(tplg, 1,
>> -                          le32_to_cpu(hdr->payload_size));
>> +            ret = soc_tplg_denum_create(tplg, 1,
>> +                    le32_to_cpu(hdr->payload_size));
>>               break;
>>           case SND_SOC_TPLG_CTL_BYTES:
>> -            soc_tplg_dbytes_create(tplg, 1,
>> -                           le32_to_cpu(hdr->payload_size));
>> +            ret = soc_tplg_dbytes_create(tplg, 1,
>> +                    le32_to_cpu(hdr->payload_size));
>>               break;
>>           default:
>>               soc_bind_err(tplg, control_hdr, i);
>>               return -EINVAL;
>>           }
>> +        if (ret < 0) {
>> +            dev_err(tplg->dev, "ASoC: invalid control\n");
>> +            return ret;
>> +        }
> 
> Sounds good, but this happens in a loop, so would all the memory 
> previously allocated by denum/dbytes/dmixer_create leak, or is it freed 
> automatically somewhere else?
> 

Well, now that error is propagated, snd_soc_tplg_component_remove() 
should be called by snd_soc_tplg_component_load() in case of errors 
while parsing. From quick look it seems like it should be able to free 
it up correctly by calling remove_enum/bytes/mixer.

Thanks,
Amadeusz
