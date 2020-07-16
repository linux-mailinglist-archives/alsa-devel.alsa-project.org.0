Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCEC222889
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jul 2020 18:50:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02C861614;
	Thu, 16 Jul 2020 18:49:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02C861614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594918209;
	bh=RGmVNVPvDx6iI86D9hXdXgKSCco1e3BJrvg/4HtIZHI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nkQkeb+Xm4+v2nRZtglevZGkQoY7vnbdBH/REtUdvZdpehrCTY/mRIOUIZJQW22+9
	 LiGJNTjTM5TGJbospHDGR9H3DPz1/QG/0LIoZyKWHMjlC5t40LgE612ICOH4mSMWMf
	 Z1sPAqo9XnX3hsTOzk8/uVmiLlOI/YOhXMuvICsM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F461F80110;
	Thu, 16 Jul 2020 18:48:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B3D1F801EC; Thu, 16 Jul 2020 18:48:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B467F8014E
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 18:48:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B467F8014E
IronPort-SDR: MR9pofLpw9HdC4JTIjKizg7u410K1jXhA4UnH79muqnfQQCvda/JsVObmlhky25NGZzuMex2RY
 Q9UlotGo4dig==
X-IronPort-AV: E=McAfee;i="6000,8403,9684"; a="146942443"
X-IronPort-AV: E=Sophos;i="5.75,360,1589266800"; d="scan'208";a="146942443"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2020 09:48:09 -0700
IronPort-SDR: ZA7q2BJMG9dZklnBPNFeSbY2pb+Z2/ehqdKBomNyLVBvDQ88gZ+ViD81h0cABUL4xa+XPO7QO6
 1kvKZFaRlAlA==
X-IronPort-AV: E=Sophos;i="5.75,360,1589266800"; d="scan'208";a="486672417"
Received: from unknown (HELO [10.254.114.13]) ([10.254.114.13])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2020 09:48:08 -0700
Subject: Re: [PATCH] ASoC: Intel: bytcht_es8316: Add missed put_device()
To: Hans de Goede <hdegoede@redhat.com>,
 Jing Xiangfeng <jingxiangfeng@huawei.com>, cezary.rojewski@intel.com,
 liam.r.girdwood@linux.intel.com, yang.jie@linux.intel.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 kuninori.morimoto.gx@renesas.com, paul@crapouillou.net
References: <20200714080918.148196-1-jingxiangfeng@huawei.com>
 <25abce87-5572-a78a-f001-7776f07be4ac@redhat.com>
 <48bdc22e-a0fc-0402-a003-1d0736107e8a@linux.intel.com>
 <0405e05d-3f46-dba4-6558-7cf09fa3abe4@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <9ace068c-5ec7-7e2b-0aa5-56cb59a55f7e@linux.intel.com>
Date: Thu, 16 Jul 2020 11:48:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0405e05d-3f46-dba4-6558-7cf09fa3abe4@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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



>>>> snd_byt_cht_es8316_mc_probe() misses to call put_device() in an error
>>>> path. Add the missed function call to fix it.
>>>>
>>>> Fixes: ba49cf6f8e4a ("ASoC: Intel: bytcht_es8316: Add quirk for 
>>>> inverted jack detect")
>>>> Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
>>>
>>> Patch looks good to me:
>>>
>>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>>
>> Actually the existing code looks quite odd to me:
>>
>> if (cnt) {
>>      ret = device_add_properties(codec_dev, props);
>>      if (ret)
>>          return ret;
>> }
>>
>> devm_acpi_dev_add_driver_gpios(codec_dev, byt_cht_es8316_gpios);
>> priv->speaker_en_gpio =
>>      gpiod_get_index(codec_dev, "speaker-enable", 0,
>>              /* see comment in byt_cht_es8316_resume */
>>              GPIOD_OUT_LOW | GPIOD_FLAGS_BIT_NONEXCLUSIVE);
>> put_device(codec_dev);
>>
>> if the first branch is not taken the put_device() will not be balanced.
> 
> The get_device() does not come from the device_add_properties, it comes
> from the earlier:
> 
> codec_dev = bus_find_device_by_name(&i2c_bus_type, NULL, codec_name);
> 
> call.

I probably needed more coffee when I wrote this, indeed this is fine...

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

