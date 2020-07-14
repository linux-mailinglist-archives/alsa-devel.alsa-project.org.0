Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4897021FD66
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 21:31:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1C6F1660;
	Tue, 14 Jul 2020 21:30:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1C6F1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594755095;
	bh=OTnVJ8l6yIgGkIPdWgWF4zcUhbvMkoTbZs3Y0TguXls=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ifW3J0QdR9BY61qA5edsBqNfy7Zb/OSKYhS0/asLbJx0JBrV4DrMG3o8emT7gDRsm
	 DYVQcCnH7sWJNkOGnhuo3pS/WC2SgHJhthEmSeoTTk066IYZaUi9uHVo1sK3c0kWqt
	 7a1W1O6escalkc1QcX2L7xt5Ky0siNnhNW8OPum4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C398EF8016F;
	Tue, 14 Jul 2020 21:29:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6CACF8019B; Tue, 14 Jul 2020 21:29:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EED4CF8014E
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 21:29:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EED4CF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="INengTAu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594754979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Se13lQ+CRIfb3wczYYNcPpZ+CJSV+AV7XeFB0nsW9Bg=;
 b=INengTAum7Hwv2RBem/Jt+LbBAFY/N2qhuDcIMAaBelVaY0T7gPBOSGVP0WRc8v7tngNjP
 35QdPrcI5Dt0VHTmj9veqdYG0yAPCnRgDcysJrNmfAyB0KaUUbUdFD2i7XFuFxCIdUUUGQ
 wP4f67C6imNxsOniGjIUk+XktoUHmg0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-KWRyIIxoPMWs1v0BB4eYrw-1; Tue, 14 Jul 2020 15:29:36 -0400
X-MC-Unique: KWRyIIxoPMWs1v0BB4eYrw-1
Received: by mail-wm1-f71.google.com with SMTP id g187so5337659wme.0
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 12:29:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Se13lQ+CRIfb3wczYYNcPpZ+CJSV+AV7XeFB0nsW9Bg=;
 b=XlH4h4UWtKY3vXKwBddAEfXaSt/ThoeDJJM4bDCsEwjR4y4x9NOSeIb2TpcnOzR3Pl
 Dsdc2T1lbyedjpm66gsQZPhgCALe3CJPvn6nKeQH/XKVcN5oT6b7cy8avOD/OaUZ2m0S
 S8KHmx/ELMPClKDOiXU0qyTcFdBMWESrri+B7sO8/BNzDodJF40F8nvBMAZ6RBn5WqY7
 y3WtYSRrOm8ivU9BcwH8+CksFaWM80mNveJsmOFSHJQYWwLofYMGRocGf1vthzxtM9Ce
 aK64bykJfd8VDywH6yu2qpUNBYtJbVbl5Iq5mKW9p3G3Koqzv3wMhnxRlAlJjZuEY8G1
 keUQ==
X-Gm-Message-State: AOAM5334s5F/0CxDG9ifZg6X1J9kVDuMR7uPwjwhoyPDn+jABhtn+A0E
 dkoBfNc+y3zo++n4uPH/pvapNh0c+Cn714Ud+3oM+f7lNC5LnDtMcv9cy6U2uVKnvfQ3W19lueG
 JUj/y/hABvLGy+sdnHxvERcM=
X-Received: by 2002:a5d:6a90:: with SMTP id s16mr7465828wru.8.1594754975061;
 Tue, 14 Jul 2020 12:29:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSeJkI7z8WDbBOeYyVmOlkEvrIzXZey3Q5E1/PnSLt1NtmuSs61S7NuXpLadP67n6hFVhkpA==
X-Received: by 2002:a5d:6a90:: with SMTP id s16mr7465807wru.8.1594754974798;
 Tue, 14 Jul 2020 12:29:34 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id u65sm6219443wmg.5.2020.07.14.12.29.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2020 12:29:34 -0700 (PDT)
Subject: Re: [PATCH] ASoC: Intel: bytcht_es8316: Add missed put_device()
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jing Xiangfeng <jingxiangfeng@huawei.com>, cezary.rojewski@intel.com,
 liam.r.girdwood@linux.intel.com, yang.jie@linux.intel.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 kuninori.morimoto.gx@renesas.com, paul@crapouillou.net
References: <20200714080918.148196-1-jingxiangfeng@huawei.com>
 <25abce87-5572-a78a-f001-7776f07be4ac@redhat.com>
 <48bdc22e-a0fc-0402-a003-1d0736107e8a@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <0405e05d-3f46-dba4-6558-7cf09fa3abe4@redhat.com>
Date: Tue, 14 Jul 2020 21:29:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <48bdc22e-a0fc-0402-a003-1d0736107e8a@linux.intel.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
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

Hi,

On 7/14/20 5:32 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 7/14/20 8:33 AM, Hans de Goede wrote:
>> Hi,
>>
>> On 7/14/20 10:09 AM, Jing Xiangfeng wrote:
>>> snd_byt_cht_es8316_mc_probe() misses to call put_device() in an error
>>> path. Add the missed function call to fix it.
>>>
>>> Fixes: ba49cf6f8e4a ("ASoC: Intel: bytcht_es8316: Add quirk for inverted jack detect")
>>> Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
>>
>> Patch looks good to me:
>>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> Actually the existing code looks quite odd to me:
> 
> if (cnt) {
>      ret = device_add_properties(codec_dev, props);
>      if (ret)
>          return ret;
> }
> 
> devm_acpi_dev_add_driver_gpios(codec_dev, byt_cht_es8316_gpios);
> priv->speaker_en_gpio =
>      gpiod_get_index(codec_dev, "speaker-enable", 0,
>              /* see comment in byt_cht_es8316_resume */
>              GPIOD_OUT_LOW | GPIOD_FLAGS_BIT_NONEXCLUSIVE);
> put_device(codec_dev);
> 
> if the first branch is not taken the put_device() will not be balanced.

The get_device() does not come from the device_add_properties, it comes
from the earlier:

codec_dev = bus_find_device_by_name(&i2c_bus_type, NULL, codec_name);

call.

Regards,

Hans



> 
> Shouldn't this be:
> 
> if (cnt) {
>      ret = device_add_properties(codec_dev, props);
>      put_device(codec_dev);
>      if (ret)
>          return ret;
> }
> 
> devm_acpi_dev_add_driver_gpios(codec_dev, byt_cht_es8316_gpios);
> priv->speaker_en_gpio =
>      gpiod_get_index(codec_dev, "speaker-enable", 0,
>              /* see comment in byt_cht_es8316_resume */
>              GPIOD_OUT_LOW | GPIOD_FLAGS_BIT_NONEXCLUSIVE);
> /* removed put_device(codec_dev); */
> 
>>
>> Regards,
>>
>> Hans
>>
>>
>>> ---
>>>   sound/soc/intel/boards/bytcht_es8316.c | 4 +++-
>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
>>> index 9e5fc9430628..ecbc58e8a37f 100644
>>> --- a/sound/soc/intel/boards/bytcht_es8316.c
>>> +++ b/sound/soc/intel/boards/bytcht_es8316.c
>>> @@ -543,8 +543,10 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
>>>       if (cnt) {
>>>           ret = device_add_properties(codec_dev, props);
>>> -        if (ret)
>>> +        if (ret) {
>>> +            put_device(codec_dev);
>>>               return ret;
>>> +        }
>>>       }
>>>       devm_acpi_dev_add_driver_gpios(codec_dev, byt_cht_es8316_gpios);
>>>
>>
> 

