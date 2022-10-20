Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B6A6061CE
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 15:38:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 767C26E23;
	Thu, 20 Oct 2022 15:37:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 767C26E23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666273127;
	bh=n9lfn8lMLmsQd2PNybIZJEzCPptTW0HDMazFlz+R+Tg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AO8BbL8r8BDfONW5vEuu8fHjXlnvnBtlB8m1jntgqjVt9+9qlDnxP9wYC7bxdcCkM
	 ogR2b9QpRGY6MP7jWZT7Gb5HqB/TQFK9+N8VVr7NFPTopWU22Cur192TiktmzLewqy
	 SQCldPiKGKQhrg21ZIhIl3M8XaRXLB5KDfzDF+HA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBC4DF804E5;
	Thu, 20 Oct 2022 15:37:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F21BF804D8; Thu, 20 Oct 2022 15:37:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=NICE_REPLY_A,PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6842F800B5
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 15:37:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6842F800B5
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MtT7G53Hgz1P6lt;
 Thu, 20 Oct 2022 21:32:58 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 20 Oct 2022 21:37:43 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 20 Oct 2022 21:37:43 +0800
Subject: Re: [PATCH v2] ASoC: Intel: Skylake: fix possible memory leak in
 skl_codec_device_init()
To: Cezary Rojewski <cezary.rojewski@intel.com>, <alsa-devel@alsa-project.org>
References: <20221020105937.1448951-1-yangyingliang@huawei.com>
 <61e23a97-93bc-a9e9-3677-e1490a886bcf@intel.com>
From: Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <19dbe3cb-e7a8-629d-e2e5-d5805b0000fc@huawei.com>
Date: Thu, 20 Oct 2022 21:37:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <61e23a97-93bc-a9e9-3677-e1490a886bcf@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
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


On 2022/10/20 20:10, Cezary Rojewski wrote:
> On 2022-10-20 12:59 PM, Yang Yingliang wrote:
>> If snd_hdac_device_register() fails, 'codec' and name allocated in
>> dev_set_name() called in snd_hdac_device_init() are leaked. Fix this
>> by calling put_device(), so they can be freed in 
>> snd_hda_codec_dev_release()
>> and kobject_cleanup().
>>
>> Fixes: e4746d94d00c ("ASoC: Intel: Skylake: Introduce HDA codec init 
>> and exit routines")
>> Fixes: dfe66a18780d ("ALSA: hdac_ext: add extended HDA bus")
>
> I do not believe the second Fixes-tag is required as it's not 
> connected directly with the fix you're providing.
When the reference of device is leaked, it leads to two memory leak: 
'codec' and 'dev->kobj.name' which
is allocated in dev_set_name(). The name leak is introduce by the second 
fix tag. This patch calling put_device()
to free both of them.
>
> Tag:
> Suggested-by: Cezary Rojewski <cezary.rojewski@intel.com>
>
> would be most welcome though.
>
> Also, if there would happen to be v3, please bundle Skylake and SOF 
> patches together into a single patchset (still not a single patch!).
OK, It's my pleasure.
>
>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>
> ...
>
>>   sound/soc/intel/skylake/skl.c | 8 +-------
>>   1 file changed, 1 insertion(+), 7 deletions(-)
>>
>> diff --git a/sound/soc/intel/skylake/skl.c 
>> b/sound/soc/intel/skylake/skl.c
>> index bbba2df33aaf..3312b57e3c0c 100644
>> --- a/sound/soc/intel/skylake/skl.c
>> +++ b/sound/soc/intel/skylake/skl.c
>> @@ -689,11 +689,6 @@ static void load_codec_module(struct hda_codec 
>> *codec)
>>     #endif /* CONFIG_SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC */
>>   -static void skl_codec_device_exit(struct device *dev)
>> -{
>> -    snd_hdac_device_exit(dev_to_hdac_dev(dev));
>> -}
>> -
>>   static struct hda_codec *skl_codec_device_init(struct hdac_bus 
>> *bus, int addr)
>>   {
>>       struct hda_codec *codec;
>> @@ -706,12 +701,11 @@ static struct hda_codec 
>> *skl_codec_device_init(struct hdac_bus *bus, int addr)
>>       }
>>         codec->core.type = HDA_DEV_ASOC;
>> -    codec->core.dev.release = skl_codec_device_exit;
>>         ret = snd_hdac_device_register(&codec->core);
>>       if (ret) {
>>           dev_err(bus->dev, "failed to register hdac device\n");
>> -        snd_hdac_device_exit(&codec->core);
>> +        put_device(&codec->core.dev);
>>           return ERR_PTR(ret);
>>       }
>
> Shy question: why my suggestion seems reasonable, I did not test it 
> yet, proposed it based on static analysis of the code. Did you test it?
I did it by static detailed analysis, there is a common driver core 
mechanism to make sure snd_hda_codec_dev_release() is called in
device_release() when refcount hit 0, and it's ok to call 
snd_hda_codec_dev_release(), because the member of codec that need be
freed is still null, it won't cause any problem. Could you test this 
patch if you wish ?

Thanks,
Yang
>
>
> Regards,
> Czarek
>
> .
