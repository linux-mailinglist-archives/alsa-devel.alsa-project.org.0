Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D94D964B59E
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Dec 2022 14:04:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7000F189E;
	Tue, 13 Dec 2022 14:04:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7000F189E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670936696;
	bh=DuQx14l/EdAAtBLIYrTr3ELptWPmAGQE3gYtWL3wHZY=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=BSzb/c4ysjlBD9MTtjVTVjC9CWZPo0VfLJQqps0B7u+G/0PiDH/VG5x1WzbtxS9KI
	 IA751gkHb6c1mBkS149s67Xt04XOSUFAlTRO07eCR/KSvWHEhjCZgzmbZdRVS+ytBl
	 fN63DbkFgUsS4an/JqWMPTFolBk7ki/RyFzl+Cgw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F1E6F804E2;
	Tue, 13 Dec 2022 14:03:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FE4FF804E2; Tue, 13 Dec 2022 14:03:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DF29F80141
 for <alsa-devel@alsa-project.org>; Tue, 13 Dec 2022 14:03:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DF29F80141
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=jQi9FqjE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670936633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=igpx7nyNOl8mDZGwY/ZGKGyn4ksuEHnUhk5H7UO44nY=;
 b=jQi9FqjEnoqa1xTjwfhsaxJRrjuPP+0IdGLIWSFi5msIk+LrAuP/7YCjmZVJJmAau3udl2
 g8BUQNWRc143XG/6whpCsyC+W8qpJYI3rh2/TFc/przWxvQ6uJU10gP20SQ1CwkggXMeHl
 VW8TEasBsAW4w4HKZ72geZAvAncF7qE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-107-nEvz0zIANY-42npNzssKTg-1; Tue, 13 Dec 2022 08:03:52 -0500
X-MC-Unique: nEvz0zIANY-42npNzssKTg-1
Received: by mail-ed1-f69.google.com with SMTP id
 f17-20020a056402355100b00466481256f6so7154205edd.19
 for <alsa-devel@alsa-project.org>; Tue, 13 Dec 2022 05:03:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=igpx7nyNOl8mDZGwY/ZGKGyn4ksuEHnUhk5H7UO44nY=;
 b=Q4ltK0FsWzHQqk0r7VceSvBYLw5A9Lz6GUwviDX6EBeSJHqH2T37zpL6uCoGYMxztk
 P0CXnypMlr4dE2ANj5oileJpuQgvV96R+gAQj7NDTVm/Xb3tVwNpbJtVe6+VmJ6XlRAg
 QhVdXhZApaQ4vw7nvlWn75G6QZD8N/YtCb8ujJ0g1sn+7t3WO7n90So6OWLm6mDtJ+KB
 aniNVdGIQBD7sO/irn6RKv9KG67bGxJdCocCVi7ZcSO3wz6lH9yFFDyjBiCpvZWFBr4h
 8U5t4LxeC0Cah3nFZU5ucbWcVYwA3ammDYuw/olFC8GPg/2e14KIv4BaNTEjxM0RVnal
 iV2w==
X-Gm-Message-State: ANoB5pkyXkvgsPbqxg5dLoAgywxlwBr9LKj+rkRR9IpAkGVzJj/2QyQt
 vFQytTCCtmhR4ZzriEHKK4VexPMAxUVySRNl/8irhVpI3HPYYtD7/jxWpnpBoe9Vxzb3SoC9cJs
 ipKrHldzuU6bziX1rf4qyut4=
X-Received: by 2002:aa7:dc14:0:b0:46d:e3f8:4ed1 with SMTP id
 b20-20020aa7dc14000000b0046de3f84ed1mr17267163edu.35.1670936630073; 
 Tue, 13 Dec 2022 05:03:50 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5Bopsey9Ub4TIILOWnLHAsreWydFvEJYQ/+PA4E0c4n4sgtygU9CH89FoF4A4yHi8saftmGA==
X-Received: by 2002:aa7:dc14:0:b0:46d:e3f8:4ed1 with SMTP id
 b20-20020aa7dc14000000b0046de3f84ed1mr17267144edu.35.1670936629875; 
 Tue, 13 Dec 2022 05:03:49 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 d10-20020a50f68a000000b0045b3853c4b7sm5067478edn.51.2022.12.13.05.03.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 05:03:49 -0800 (PST)
Message-ID: <c92ef15c-53cb-acd5-4b5b-73f5b3afb8be@redhat.com>
Date: Tue, 13 Dec 2022 14:03:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] ASoC: rt5670: Remove unbalanced pm_runtime_put()
To: Cezary Rojewski <cezary.rojewski@intel.com>
References: <20221213123319.11285-1-hdegoede@redhat.com>
 <c490d006-20f2-bf47-fe4e-61d9ba29b6a7@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <c490d006-20f2-bf47-fe4e-61d9ba29b6a7@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard Liao <bard.liao@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Cezary,

On 12/13/22 13:55, Cezary Rojewski wrote:
> On 2022-12-13 1:33 PM, Hans de Goede wrote:
>> For some reason rt5670_i2c_probe() does a pm_runtime_put() at the end
>> of a successful probe. But it has never done a pm_runtime_get() leading
>> to the following error being logged into dmesg:
>>
>>   rt5670 i2c-10EC5640:00: Runtime PM usage count underflow!
>>
>> Fix this by removing the unnecessary pm_runtime_put().
>>
>> Fixes: 64e89e5f5548 ("ASoC: rt5670: Add runtime PM support")
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   sound/soc/codecs/rt5670.c | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/sound/soc/codecs/rt5670.c b/sound/soc/codecs/rt5670.c
>> index ebac6caeb40a..a230f441559a 100644
>> --- a/sound/soc/codecs/rt5670.c
>> +++ b/sound/soc/codecs/rt5670.c
>> @@ -3311,8 +3311,6 @@ static int rt5670_i2c_probe(struct i2c_client *i2c)
>>       if (ret < 0)
>>           goto err;
>>   -    pm_runtime_put(&i2c->dev);
>> -
>>       return 0;
>>   err:
>>       pm_runtime_disable(&i2c->dev);
> 
> 
> Hello Hans,
> 
> Good finding, weird one though. I just analyzed commit pointed by 64e89e5f5548 and it seems that entire change could be reverted. The rt5670 i2c_driver does not assign any PM ops, only ASoC component ones. The later is tied to machine board driver though (and it assigning snd_soc_pm_ops in its descriptor).
> 
> From i2s (non-sdw) Realtek codec drivers found in sound/soc/codecs it seems that only rt9120.c defines PM ops and configures the PM for the device. OTOH, there are several which define suspend/resume on ASoC component level and do not touch pm_runtime_* at all.
> 
> Thus, voting for a complete revert.

A complete revert seems fine to me too.

Regards,

Hans




