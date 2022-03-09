Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FBE4D3535
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 18:28:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12F1E17C5;
	Wed,  9 Mar 2022 18:27:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12F1E17C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646846908;
	bh=BVR5NTQasPFDu89RNKNre2hfjG7Sn5HsveNMmi4Pv7U=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fic+yX4uQ1t9FtONwsythUQat0oM4WNIhx8tgeuA1za3igqr+79pCv8evr1JLLBge
	 7fEf2yxPa57kGcV/YLNrX1oY9FxRbeMn3SMJN75OVAdkQ5qH7cVfV5mTVLCtbXIZAA
	 //u4zWPG44tzhW/9Stx/e9bBtVvb8jMw2bPRm3q4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FA62F8025E;
	Wed,  9 Mar 2022 18:27:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED32DF800D2; Wed,  9 Mar 2022 18:27:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 923B7F800D2
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 18:27:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 923B7F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="LAupdXeD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646846837; x=1678382837;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=BVR5NTQasPFDu89RNKNre2hfjG7Sn5HsveNMmi4Pv7U=;
 b=LAupdXeDY0YoMwzC2ybTR7h19qSl95PRxT3VkRvtUeky8hDZH/FVH7Kf
 q6CbpSzi0Gdw+zVIstZhG20iqgTuuOfsIA2IV8iBQGknaeygyf5p5XplR
 EYYQDuDLeiEQ+r/V3DZLYzEV7RZZzyG/TSiXA8BRq71gmRw5niQqPu/Fi
 mx/frQBUpEZ7BXyw8ip0KE2ZokPjHblQNrFE5rhXd1veemZ95OwBM0afN
 UYqQy4MDP82k/TeDSsDoPLF+lDynf37ufclgn0zhgl7HSxL21Hs48pte8
 Kq0jHjJ+x0winppEXCGUnl/lMfMiW1LUs3sbeLs3zfy6HbOPhObR34TUH A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="242484136"
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="242484136"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 09:27:12 -0800
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="554214538"
Received: from thihoan5-mobl.amr.corp.intel.com (HELO [10.209.14.48])
 ([10.209.14.48])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 09:27:11 -0800
Message-ID: <d5228aa3-ea48-bc2b-6f62-d2ee81cbbb5f@linux.intel.com>
Date: Wed, 9 Mar 2022 11:10:16 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 03/20] ASoC: SOF: Intel: hda: retrieve DMIC number for I2S
 boards
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20220308192610.392950-1-pierre-louis.bossart@linux.intel.com>
 <20220308192610.392950-4-pierre-louis.bossart@linux.intel.com>
 <6626d04b-1ad3-457f-1f45-296cb79672fb@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <6626d04b-1ad3-457f-1f45-296cb79672fb@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Huajun Li <huajun.li@intel.com>, tiwai@suse.de,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Nikolai Kostrigin <nickel@altlinux.org>, broonie@kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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



On 3/9/22 10:49, Cezary Rojewski wrote:
> On 2022-03-08 8:25 PM, Pierre-Louis Bossart wrote:
>> We currently extract the DMIC number only for HDaudio or SoundWire
>> platforms. For I2S/TDM platforms, this wasn't necessary until now, but
>> with devices with ES8336 we need to find a solution to detect dmics
>> more reliably than with a DMI quirk.
> 
> ...
> 
>> @@ -644,24 +642,35 @@ static int hda_init(struct snd_sof_dev *sdev)
>>       return ret;
>>   }
>> -#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA) || 
>> IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
>> -
>> -static int check_nhlt_dmic(struct snd_sof_dev *sdev)
>> +static int check_dmic_num(struct snd_sof_dev *sdev)
>>   {
>>       struct nhlt_acpi_table *nhlt;
>> -    int dmic_num;
>> +    int dmic_num = 0;
> 
> 
> s/int/u32? (paired with question below)
> 
>>       nhlt = intel_nhlt_init(sdev->dev);
>>       if (nhlt) {
>>           dmic_num = intel_nhlt_get_dmic_geo(sdev->dev, nhlt);
>>           intel_nhlt_free(nhlt);
>> -        if (dmic_num >= 1 && dmic_num <= 4)
>> -            return dmic_num;
>>       }
>> -    return 0;
>> +    /* allow for module parameter override */
>> +    if (dmic_num_override != -1) {
>> +        dev_dbg(sdev->dev,
>> +            "overriding DMICs detected in NHLT tables %d by kernel 
>> param %d\n",
>> +            dmic_num, dmic_num_override);
>> +        dmic_num = dmic_num_override;
>> +    }
>> +
>> +    if (dmic_num < 0 || dmic_num > 4) {
> 
> How come dmic_num be negative?

static int dmic_num_override = -1;
module_param_named(dmic_num, dmic_num_override, int, 0444);
MODULE_PARM_DESC(dmic_num, "SOF HDA DMIC number");

The value is already negative by default, and we want to apply sanity 
checks on what the user or distributions sets.

This code has been in the kernel for several years now, we're just 
moving it around.

> 
>> +        dev_dbg(sdev->dev, "invalid dmic_number %d\n", dmic_num);
>> +        dmic_num = 0;
>> +    }
>> +
>> +    return dmic_num;
>>   }
