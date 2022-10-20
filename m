Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2078A605C56
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 12:31:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAD0BAEC1;
	Thu, 20 Oct 2022 12:30:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAD0BAEC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666261864;
	bh=pIJZmSaxCUo46Z1lwbD1pjKvor4Bhl/o7cP+aYzE1MA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E3UY2YkcZMo/GmYwEN7U+ZV3PvPU21/f0VHRmGUdsgyBzKSzUWEn6eZo2seGCmIGc
	 r0+Cz8dDp0YoI+Qns4zLaGzFZH0DgGM78rJF6R3W2DYWmkj4ARlS82Qfh/BsFhDGfJ
	 yPvRQ6NrLaBggLCVyUQRqejj4nWNMs2D8lsfiW8A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DD6BF804E5;
	Thu, 20 Oct 2022 12:30:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08330F804E5; Thu, 20 Oct 2022 12:30:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE9EBF800EC
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 12:30:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE9EBF800EC
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MtNyY4mdSzmVDJ;
 Thu, 20 Oct 2022 18:25:09 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 20 Oct 2022 18:29:39 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 20 Oct 2022 18:29:39 +0800
Subject: Re: [PATCH] ASoC: Intel: Skylake: fix possible memory leak in
 skl_codec_device_init()
To: Cezary Rojewski <cezary.rojewski@intel.com>, <alsa-devel@alsa-project.org>
References: <20221020034548.2391293-1-yangyingliang@huawei.com>
 <876886cd-56f8-1ca7-aaa1-632a0b5ecfb6@intel.com>
From: Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <f239b872-8b89-5eee-b810-d04f45a681c1@huawei.com>
Date: Thu, 20 Oct 2022 18:29:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <876886cd-56f8-1ca7-aaa1-632a0b5ecfb6@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Cc: tiwai@suse.de, broonie@kernel.org, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com, yangyingliang@huawei.com
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

On 2022/10/20 16:39, Cezary Rojewski wrote:
> On 2022-10-20 5:45 AM, Yang Yingliang wrote:
>> If snd_hdac_device_register() fails, 'codec' is leaked, free it
>> in snd_hdac_device_exit(). And device_initialize() is called in
>> snd_hdac_device_init(), it should call put_device() to give up
>> reference or the name allocated in dev_set_name() is leaked.
>> The snd_hdac_device_exit() will be called in dev->release().
>>
>> Fixes: e4746d94d00c ("ASoC: Intel: Skylake: Introduce HDA codec init 
>> and exit routines")
>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>> ---
>>   sound/soc/intel/skylake/skl.c | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/sound/soc/intel/skylake/skl.c 
>> b/sound/soc/intel/skylake/skl.c
>> index bbba2df33aaf..f0048e3fa619 100644
>> --- a/sound/soc/intel/skylake/skl.c
>> +++ b/sound/soc/intel/skylake/skl.c
>> @@ -691,7 +691,11 @@ static void load_codec_module(struct hda_codec 
>> *codec)
>>     static void skl_codec_device_exit(struct device *dev)
>>   {
>> -    snd_hdac_device_exit(dev_to_hdac_dev(dev));
>> +    struct hdac_device *hdac_dev = dev_to_hdac_dev(dev);
>> +    struct hda_codec *codec = container_of(hdac_dev, struct 
>> hda_codec, core);
>> +
>> +    snd_hdac_device_exit(hdac_dev);
>> +    kfree(codec);
>>   }
>>     static struct hda_codec *skl_codec_device_init(struct hdac_bus 
>> *bus, int addr)
>> @@ -711,7 +715,7 @@ static struct hda_codec 
>> *skl_codec_device_init(struct hdac_bus *bus, int addr)
>>       ret = snd_hdac_device_register(&codec->core);
>>       if (ret) {
>>           dev_err(bus->dev, "failed to register hdac device\n");
>> -        snd_hdac_device_exit(&codec->core);
>> +        put_device(&codec->core.dev);
>>           return ERR_PTR(ret);
>>       }
>
> Hello,
>
> That's a tricky one. And that's because the code added in commit [1] 
> which you're fixing here, basically mimics the original code that has 
> been removed later on in the series of mine [2].
>
> The key part is: function snd_hda_codec_device_init() replaced 
> snd_hdac_device_init(). I believe the former may generate codec-leak 
> in situations you speak of.
Yes, after using snd_hda_codec_device_init(), 'codec' is leaked.
And there is another leak, the name allocated in dev_set_name() called 
in snd_hdac_device_init() is always leaked if snd_hdac_device_register() 
fails
in snd_hdac_ext_bus_device_init() which is introduced by comit 
dfe66a18780d ("ALSA: hdac_ext: add extended HDA bus").
>
> Now, on to the fix. My suggestion is to start with removing the 
> following line:
>     codec->core.dev.release = skl_codec_device_exit;
>
> and skl_codec_device_exit() function itself. Let's leave the default 
> as is and see if the leak still occurs.
OK, I will send a v2.

Thanks,
Yang
>
>
> [1]: 
> https://lore.kernel.org/alsa-devel/20220816111727.3218543-2-cezary.rojewski@intel.com/
> [2]: 
> https://lore.kernel.org/alsa-devel/20220816111727.3218543-6-cezary.rojewski@intel.com/
>
>
> Regards,
> Czarek
> .
