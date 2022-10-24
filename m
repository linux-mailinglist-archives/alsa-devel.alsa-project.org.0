Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C2060AF17
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Oct 2022 17:31:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 287C16297;
	Mon, 24 Oct 2022 17:30:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 287C16297
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666625500;
	bh=2Uce2G1fm2oe+IKvFNyNgVWd0XnvGmJMj3pqkaPXNN4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PN72aOLDCXB/Old7CkrLU5Q1+KstPrORGIP5r3cCcEo8xM64cGGs589LBZhm6d30F
	 EpcBHqdb8D6GtfkU3jzGd5mw0tViTrxsvQDGTIRSiZWgrHpkobP+M1oIqAL2YCassv
	 MikJSuVyn150PN/NPAoLdnl9rffTKSsoDftyDpCM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47B09F80548;
	Mon, 24 Oct 2022 17:30:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C8CFF80240; Mon, 24 Oct 2022 17:30:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A06CAF80240
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 17:30:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A06CAF80240
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MwzRc56jBz15M0V;
 Mon, 24 Oct 2022 23:25:48 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 24 Oct 2022 23:30:39 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 24 Oct 2022 23:30:38 +0800
Subject: Re: [PATCH] ALSA: hda: fix possible memory leak in
 azx_codec_configure()
To: Takashi Iwai <tiwai@suse.de>
References: <20221024122646.1175390-1-yangyingliang@huawei.com>
 <87edux8gik.wl-tiwai@suse.de>
From: Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <5265559f-a873-b94c-7f5c-7566e8d99d88@huawei.com>
Date: Mon, 24 Oct 2022 23:30:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <87edux8gik.wl-tiwai@suse.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, yangyingliang@huawei.com, tiwai@suse.com
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

On 2022/10/24 22:04, Takashi Iwai wrote:
> On Mon, 24 Oct 2022 14:26:46 +0200,
> Yang Yingliang wrote:
>> If the codec device is registered, after calling snd_hdac_device_unregister(),
>> codec has already been removed from chip bus, it should call put_device() to
>> give up reference to free codec and device name.
>>
>> Fixes: c0f1886de7e1 ("ALSA: hda: intel: Allow repeatedly probing on codec configuration errors")
>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> Hrm, are you sure that this will result in a memory leak?
> put_device() is called at snd_hda_codec_unregister() that is invoked
> via dev_free callback of the snd_hda_codec object -- which is called
> when the top-level driver is removed.  I'm afraid that your patch will
> lead to a double-free.
Thanks for point out.
I look deeper, the snd device is add to device list of card, but 
snd_hdac_device_unregister()
is just remove the codec from chip bus, and the snd device still in 
device list of card,
at last each of snd device is freed in snd_device_free_all() with 
calling snd_hda_codec_dev_free().

Thanks,
Yang
>
>
> thanks,
>
> Takashi
>
>> ---
>>   sound/pci/hda/hda_controller.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/sound/pci/hda/hda_controller.c b/sound/pci/hda/hda_controller.c
>> index 0ff286b7b66b..f6a73ce300a4 100644
>> --- a/sound/pci/hda/hda_controller.c
>> +++ b/sound/pci/hda/hda_controller.c
>> @@ -1257,8 +1257,11 @@ int azx_codec_configure(struct azx *chip)
>>   		/* unregister failed codecs if any codec has been probed */
>>   		list_for_each_codec_safe(codec, next, &chip->bus) {
>>   			if (!codec->configured) {
>> +				bool is_registered = device_is_registered(&codec->core.dev);
>>   				codec_err(codec, "Unable to configure, disabling\n");
>>   				snd_hdac_device_unregister(&codec->core);
>> +				if (is_registered)
>> +					put_device(&codec->core.dev);
>>   			}
>>   		}
>>   	}
>> -- 
>> 2.25.1
>>
> .
