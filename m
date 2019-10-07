Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DD2CE1B2
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2019 14:29:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFC9A1612;
	Mon,  7 Oct 2019 14:28:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFC9A1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570451385;
	bh=N/q0m3tFCpNOlVOO6AUewz66bv6TzxsmNUXk2LYNSiY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XaaK3j9yQ/+24+QX5BC29nrnaYJodbTV5MP3aDE+QJ35RHK6fuXNacBKbNkA4PsLj
	 miiz+rMp1vb48U1z4F3CGdpTS/nORTmCKqSc8OZDxUvqW/KjnvUFB8yL0GqSHiVjZO
	 ODPIS0hoA1kvYLNaYM6TSHRzapn1izfp+sguUtA4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BB65F802BE;
	Mon,  7 Oct 2019 14:28:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50F2CF80273; Mon,  7 Oct 2019 14:27:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06D7CF80273
 for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2019 14:27:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06D7CF80273
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lmzJINmt"
Received: by mail-pg1-x541.google.com with SMTP id e1so8122292pgj.6
 for <alsa-devel@alsa-project.org>; Mon, 07 Oct 2019 05:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Vo/eOLaIbA5/xys1EhkAUTChVY65F/rc67s1TRj6toM=;
 b=lmzJINmtvYtOTelPHr4Qun2GMR4udVEweNf38iCm0MkKZ/AEuIkJVu98CqLUvahfwb
 xwButHhOOdSTlk74Ca8TE3QPhxMphnKWOHfQ6idYiMgYZyJlOcqp8/YLs9MlKPQfkLFB
 9zijhJAUUS72y4LhVtG1URiFq3d8WT5kQuzQPFwdSTNG3TIdRr8+TVYkK8GQYY796hIu
 yCr+vGZYzxGGN57+ORwZPRVJHQQ2nO/HHUk+91E0ZWrbNJaTBHFuEcGeaIGD6x1+lRz+
 6dEDgRkczOh2oWYEuGBLA4KXSWGsdzqFuu5HbijpbfMvO4YChCFVu61sxf4Z7MO2+uzR
 WlFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Vo/eOLaIbA5/xys1EhkAUTChVY65F/rc67s1TRj6toM=;
 b=CCmgpvV20O7oo5zKos3qgHG/cZclufVk2eUBFCQAX+Q3KPX2zCgKM0x6FsePKdQsY0
 dOjm4G7msatHm1av4iwSND3WJ/8VRxzKOB9ORY/SYkVw8CEcz+tIscQ6Rotr734B6n46
 U5pLx0xPIovY+bX7wigdM7vJ/SEwMtv1sf/ECs0pg4aYEFr9LiNUyAX4hbA1j93FpAp+
 oz44KpuuH1vB09eZHuowXjZg7Qq6ib9k+PHa09FHhePPdXeXCcXgEH+sBkSV7j4GcC60
 6TBlITFn94CATakT1NBAXHWe7cXr5rSyeqN38ZAtqOLxTah4yqJWV5zGepw3mmyU59ou
 yRGw==
X-Gm-Message-State: APjAAAULu1cKevwKecNeuvbNJiI65yK8O6Cq1h1z5wJTgPnTlr1QAkWo
 Wl56Lvgkhi5q1XThnfwomoU=
X-Google-Smtp-Source: APXvYqwVUQXMdc3IJOV7AOvEPFDOKCA7npRdo2UmZoYJdG+kd3wdkx/YIAZbMpmqSNjGnWRg90BH/Q==
X-Received: by 2002:a63:fb55:: with SMTP id w21mr30311545pgj.267.1570451273560; 
 Mon, 07 Oct 2019 05:27:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 f185sm18467820pfb.183.2019.10.07.05.27.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Oct 2019 05:27:52 -0700 (PDT)
To: Tzung-Bi Shih <tzungbi@google.com>, Cheng-Yi Chiang <cychiang@chromium.org>
References: <20191007071610.65714-1-cychiang@chromium.org>
 <CA+Px+wWkr1xmSpgEkSaGS7UZu8TKUYvSnbjimBRH29=kDtcHKA@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <ebf9bc3f-a531-6c5b-a146-d80fe6c5d772@roeck-us.net>
Date: Mon, 7 Oct 2019 05:27:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CA+Px+wWkr1xmSpgEkSaGS7UZu8TKUYvSnbjimBRH29=kDtcHKA@mail.gmail.com>
Content-Language: en-US
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Hung-Te Lin <hungte@chromium.org>,
 Mark Brown <broonie@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 dgreid@chromium.org
Subject: Re: [alsa-devel] [PATCH] firmware: vpd: Add an interface to read
	VPD value
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 10/7/19 1:03 AM, Tzung-Bi Shih wrote:
> On Mon, Oct 7, 2019 at 3:16 PM Cheng-Yi Chiang <cychiang@chromium.org> wrote:
>>
>> Add an interface for other driver to query VPD value.
>> This will be used for ASoC machine driver to query calibration
>> data stored in VPD for smart amplifier speaker resistor
>> calibration.
>>
>> Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
>> ---
>>   drivers/firmware/google/vpd.c              | 16 ++++++++++++++++
>>   include/linux/firmware/google/google_vpd.h | 18 ++++++++++++++++++
>>   2 files changed, 34 insertions(+)
>>   create mode 100644 include/linux/firmware/google/google_vpd.h
>>
>> diff --git a/drivers/firmware/google/vpd.c b/drivers/firmware/google/vpd.c
>> index db0812263d46..71e9d2da63be 100644
>> --- a/drivers/firmware/google/vpd.c
>> +++ b/drivers/firmware/google/vpd.c
>> @@ -65,6 +65,22 @@ static ssize_t vpd_attrib_read(struct file *filp, struct kobject *kobp,
>>                                         info->bin_attr.size);
>>   }
>>
>> +int vpd_attribute_read_value(bool ro, const char *key,
>> +                            char **value, u32 value_len)

FWIW, I don't think the "_value" in this function name adds any value,
unless there is going to be some other read function.

The API should be documented, and state clearly that the caller must release
the returned value.

>> +{
>> +       struct vpd_attrib_info *info;
>> +       struct vpd_section *sec = ro ? &ro_vpd : &rw_vpd;
>> +
>> +       list_for_each_entry(info, &sec->attribs, list) {
>> +               if (strcmp(info->key, key) == 0) {
>> +                       *value = kstrndup(info->value, value_len, GFP_KERNEL);
> 
> Value is not necessary a NULL-terminated string.
> kmalloc(info->bin_attr.size) and memcpy(...) would make the most
> sense.
> 
kmemdup() ?

> The value_len parameter makes less sense.  It seems the caller knows
> the length of the value in advance.
> Suggest to change the value_len to report the length of value.  I.e.
> *value_len = info->bin_attr.size;
>  > Also please check the return value for memory allocation-like
> functions (e.g. kstrndup, kmalloc) so that *value won't be NULL but
> the function returned 0.
> 
>> +                       return 0;
>> +               }
>> +       }
>> +       return -EINVAL;

Maybe something like -ENOENT would be more appropriate here.

>> +}
>> +EXPORT_SYMBOL(vpd_attribute_read_value);
>> +

I would suggest to use EXPORT_SYMBOL_GPL().

>>   /*
>>    * vpd_section_check_key_name()
>>    *
>> diff --git a/include/linux/firmware/google/google_vpd.h b/include/linux/firmware/google/google_vpd.h
>> new file mode 100644
>> index 000000000000..6f1160f28af8
>> --- /dev/null
>> +++ b/include/linux/firmware/google/google_vpd.h
>> @@ -0,0 +1,18 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Google VPD interface.
>> + *
>> + * Copyright 2019 Google Inc.
>> + */
>> +
>> +/* Interface for reading VPD value on Chrome platform. */
>> +
>> +#ifndef __GOOGLE_VPD_H
>> +#define __GOOGLE_VPD_H
>> +
>> +#include <linux/types.h>
>> +
>> +int vpd_attribute_read_value(bool ro, const char *key,
>> +                            char **value, u32 value_len);
>> +
>> +#endif  /* __GOOGLE_VPD_H */
>> --
>> 2.23.0.581.g78d2f28ef7-goog
>>
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
