Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAEE198046
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 17:57:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5BAB166D;
	Mon, 30 Mar 2020 17:56:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5BAB166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585583829;
	bh=vPtOrDH3dv6Ku7BbuZbQ+x4YjFaXNmi1KpTUcdWD674=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NxmRsCzu6p2jHAqIkWQ7dx32IwhopojCNwy9TjUQeG47hCraPorY7Bzb9Xl/rd0BF
	 47jM2ijBOd2Vw7H02nMm35BgeR0kbKNjQa0hR/bQTnjWE9zWjE0CCMCZ5/OXpcFS9v
	 UHOqEpHKTPhMVGwP4bw4fVHKCwaOn2Q4BOuRO81c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97ADBF80145;
	Mon, 30 Mar 2020 17:55:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23C1BF80148; Mon, 30 Mar 2020 17:52:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18295F800AA
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 17:52:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18295F800AA
IronPort-SDR: NMpkV9Y0Sub5DqvQKf3zY5TPPwo688WtLXKoiPPHSg2SmmDkgf7ZLTnUmQnQn+w2zQBTNdr6Sd
 ZQ2Um3UgcwSg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2020 08:51:55 -0700
IronPort-SDR: 6ZhI8R90W+NOCg5nfg4qyAKnK78okYmsk7KIpoHTrh4Jab/gBvRmomCtEwGZ83BP+dZVtUhvKr
 +piYZDeY6XVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,324,1580803200"; d="scan'208";a="395166114"
Received: from sgobriel-mobl.amr.corp.intel.com (HELO [10.212.145.94])
 ([10.212.145.94])
 by orsmga004.jf.intel.com with ESMTP; 30 Mar 2020 08:51:54 -0700
Subject: Re: [PATCH v2 3/6] ASoC: topology: Check return value of
 soc_tplg_*_create
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
References: <20200327204729.397-1-amadeuszx.slawinski@linux.intel.com>
 <20200327204729.397-4-amadeuszx.slawinski@linux.intel.com>
 <ea618248-5c0c-24f2-b1fb-2b5aecb16049@linux.intel.com>
 <41ce872f-7fa5-74cd-396b-9bfae989e91c@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <8e03a294-3562-7e26-6654-a5b0f7970060@linux.intel.com>
Date: Mon, 30 Mar 2020 10:51:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <41ce872f-7fa5-74cd-396b-9bfae989e91c@linux.intel.com>
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


>>>       if (tplg->pass != SOC_TPLG_PASS_MIXER) {
>>> @@ -1152,25 +1153,30 @@ static int 
>>> soc_tplg_kcontrol_elems_load(struct soc_tplg *tplg,
>>>           case SND_SOC_TPLG_CTL_RANGE:
>>>           case SND_SOC_TPLG_DAPM_CTL_VOLSW:
>>>           case SND_SOC_TPLG_DAPM_CTL_PIN:
>>> -            soc_tplg_dmixer_create(tplg, 1,
>>> -                           le32_to_cpu(hdr->payload_size));
>>> +            ret = soc_tplg_dmixer_create(tplg, 1,
>>> +                    le32_to_cpu(hdr->payload_size));
>>>               break;
>>>           case SND_SOC_TPLG_CTL_ENUM:
>>>           case SND_SOC_TPLG_CTL_ENUM_VALUE:
>>>           case SND_SOC_TPLG_DAPM_CTL_ENUM_DOUBLE:
>>>           case SND_SOC_TPLG_DAPM_CTL_ENUM_VIRT:
>>>           case SND_SOC_TPLG_DAPM_CTL_ENUM_VALUE:
>>> -            soc_tplg_denum_create(tplg, 1,
>>> -                          le32_to_cpu(hdr->payload_size));
>>> +            ret = soc_tplg_denum_create(tplg, 1,
>>> +                    le32_to_cpu(hdr->payload_size));
>>>               break;
>>>           case SND_SOC_TPLG_CTL_BYTES:
>>> -            soc_tplg_dbytes_create(tplg, 1,
>>> -                           le32_to_cpu(hdr->payload_size));
>>> +            ret = soc_tplg_dbytes_create(tplg, 1,
>>> +                    le32_to_cpu(hdr->payload_size));
>>>               break;
>>>           default:
>>>               soc_bind_err(tplg, control_hdr, i);
>>>               return -EINVAL;
>>>           }
>>> +        if (ret < 0) {
>>> +            dev_err(tplg->dev, "ASoC: invalid control\n");
>>> +            return ret;
>>> +        }
>>
>> Sounds good, but this happens in a loop, so would all the memory 
>> previously allocated by denum/dbytes/dmixer_create leak, or is it 
>> freed automatically somewhere else?
>>
> 
> Well, now that error is propagated, snd_soc_tplg_component_remove() 
> should be called by snd_soc_tplg_component_load() in case of errors 
> while parsing. From quick look it seems like it should be able to free 
> it up correctly by calling remove_enum/bytes/mixer.

I am not sure what you meant by 'should be called', if it's a 
recommendation for a future change or a description of the existing 
behavior.
Just to be clear, are you saying the existing code will take care of 
this error flow or that a new patch is needed?
