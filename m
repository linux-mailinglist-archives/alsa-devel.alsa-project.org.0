Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A81060F14C
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 09:42:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10A163164;
	Thu, 27 Oct 2022 09:41:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10A163164
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666856533;
	bh=B0e4dYMMAY22wZtJm0ZCgVqNvJCu7iQDrCQ4ct+1pRg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eGSLRR43Ox7qAz36GXyuSUSiIgG72Kt4ZZKIifBxnJSzlh4NCQH9Vo7u+eLRw9CLC
	 F5aD8mQCECJMZlw401JMSwbVg0N0mNi8HRsNiopGMjYGsKXwH9t/4K+dQ2xn6BpLV2
	 eiOdh/JF7roMLMvEQWqjlzzts4QgyVNEdIFOxzuw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6E40F80496;
	Thu, 27 Oct 2022 09:41:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B15AF8025E; Thu, 27 Oct 2022 09:41:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50C8EF80095
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 09:41:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50C8EF80095
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MyctL3Nh6z15M19;
 Thu, 27 Oct 2022 15:36:10 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 27 Oct 2022 15:41:04 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 27 Oct 2022 15:41:04 +0800
Subject: Re: [PATCH] ALSA: aoa: i2sbus: fix possible memory leak in
 i2sbus_add_dev()
To: Takashi Iwai <tiwai@suse.de>
References: <20221027013438.991920-1-yangyingliang@huawei.com>
 <87r0ytojos.wl-tiwai@suse.de>
From: Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <91e667bb-b6dd-4966-eba6-31de4f2b56a7@huawei.com>
Date: Thu, 27 Oct 2022 15:41:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <87r0ytojos.wl-tiwai@suse.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org,
 johannes@sipsolutions.net
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


On 2022/10/27 14:38, Takashi Iwai wrote:
> On Thu, 27 Oct 2022 03:34:38 +0200,
> Yang Yingliang wrote:
>> dev_set_name() in soundbus_add_one() allocates memory for name, it need be
>> freed when of_device_register() fails, call soundbus_dev_put() to give up
>> the reference that hold in device_initialize(), so that it can be freed in
>> kobject_cleanup() when the refcount hit to 0. And other resources are also
>> freed in i2sbus_release_dev(), so it can return 0 directly.
>>
>> Fixes: f3d9478b2ce4 ("[ALSA] snd-aoa: add snd-aoa")
>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> The check of kobj state is awkward, but it seems to be the simplest
> way...  Applied now.  Thanks!

Indeed, it's awkward, shall we introduce a helper like this:

diff --git a/sound/aoa/soundbus/i2sbus/core.c 
b/sound/aoa/soundbus/i2sbus/core.c
index f6841daf9e3b..950c37e0297e 100644
--- a/sound/aoa/soundbus/i2sbus/core.c
+++ b/sound/aoa/soundbus/i2sbus/core.c
@@ -302,7 +302,7 @@ static int i2sbus_add_dev(struct macio_dev *macio,

         if (soundbus_add_one(&dev->sound)) {
                 printk(KERN_DEBUG "i2sbus: device registration error!\n");
-               if (dev->sound.ofdev.dev.kobj.state_initialized) {
+               if (soundbus_dev_initialized(&dev->sound)) {
                         soundbus_dev_put(&dev->sound);
                         return 0;
                 }
diff --git a/sound/aoa/soundbus/soundbus.h b/sound/aoa/soundbus/soundbus.h
index 3a99c1f1a3ca..2c9c95cf156a 100644
--- a/sound/aoa/soundbus/soundbus.h
+++ b/sound/aoa/soundbus/soundbus.h
@@ -174,6 +174,10 @@ struct soundbus_dev {

  extern int soundbus_add_one(struct soundbus_dev *dev);
  extern void soundbus_remove_one(struct soundbus_dev *dev);
+static inline bool soundbus_dev_initialized(struct soundbus_dev *dev)
+{
+       return dev->ofdev.dev.kobj.state_initialized;
+}


Thanks,
Yang
>
>
> Takashi
>
>
>> ---
>>   sound/aoa/soundbus/i2sbus/core.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/sound/aoa/soundbus/i2sbus/core.c b/sound/aoa/soundbus/i2sbus/core.c
>> index faf6b03131ee..f6841daf9e3b 100644
>> --- a/sound/aoa/soundbus/i2sbus/core.c
>> +++ b/sound/aoa/soundbus/i2sbus/core.c
>> @@ -302,6 +302,10 @@ static int i2sbus_add_dev(struct macio_dev *macio,
>>   
>>   	if (soundbus_add_one(&dev->sound)) {
>>   		printk(KERN_DEBUG "i2sbus: device registration error!\n");
>> +		if (dev->sound.ofdev.dev.kobj.state_initialized) {
>> +			soundbus_dev_put(&dev->sound);
>> +			return 0;
>> +		}
>>   		goto err;
>>   	}
>>   
>> -- 
>> 2.25.1
>>
> .
