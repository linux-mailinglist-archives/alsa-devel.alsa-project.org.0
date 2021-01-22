Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D90AA300E0C
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 21:49:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1E5A1F03;
	Fri, 22 Jan 2021 21:48:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1E5A1F03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611348548;
	bh=6PtZ219Nke7Me/WTGf/PFgGNyLkIaOaL85rnFIWwWGg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vlvDNJ0c0Xo+2QEVMBscz+kPoObOcUtjnC/mvBJpSPvyXgjx4RWi7FreCfKaUTeEa
	 vvsduwBuBsIwqcPx/rUjBT3udW6ZsV5jUDE7prpEwLBbJ9LF7y//sjGMc1OkQlfx3T
	 IWWoKLuVYiC0DLDE2GRpsNfhtRgeFH4DeLUErIr0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF297F804CA;
	Fri, 22 Jan 2021 21:47:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16531F804C3; Fri, 22 Jan 2021 21:47:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 492C6F804BD
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 21:47:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 492C6F804BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="hsOWl/ur"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611348456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bt8jsoC8w4pX7n1okX/YWWxr8+fNbZirJrt6Rmv6/KE=;
 b=hsOWl/urOaxfqB+4Qx0OwUH9pR1VHYp/+FAapgy9OlCRq45ZnOnne0pZBE2kQCWTbJD/cn
 eDQXIioBLKG+glItX9hmnuqMEorD3TT3rv69B0VNmh/GB4l3cTMf6f/K/1f60gO09b0VCt
 +MZ/dWhWO3reOFchl8LaMobkDrjZfA0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-OzgKx8eaMuqgag-QWm525A-1; Fri, 22 Jan 2021 15:47:32 -0500
X-MC-Unique: OzgKx8eaMuqgag-QWm525A-1
Received: by mail-ej1-f70.google.com with SMTP id m4so2669128ejc.14
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 12:47:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bt8jsoC8w4pX7n1okX/YWWxr8+fNbZirJrt6Rmv6/KE=;
 b=k4vtQ+ns+1claiP0gozWk5+iQI3tozxejVja6jrcR1SQUzy5GdxT7JnkZrkoCuELS+
 pOKz+Jwi5EVGiBPY1I/940z523lTOYl2hKuXTComsIQ6vOvwNWzIvvAxID+K3MZCmUIK
 6Yp9YodE2PxtDgIFi/vqDeftdWXfV4kIVdM6xC4v9OG+Y4FgDn78rrdALPCbaXk/86Qc
 v8U/EWgxOrtspXvd1q2zAs92jHSH1ZN/SuWKub57Ae5c24nQb5trKV1gMYXN7GrP+o5q
 S2APLgtEFsdyNI1bxbIRZZtJRwEmZiXeoSP5be/HBxRxujq/rPyNP7gWTOf4VhwgLS7e
 qRIw==
X-Gm-Message-State: AOAM531NlWU+jbdJ7HJh3RHu1A4GM8n0uJTBFKZF6Jx3jy7uv5ptd8rr
 ou5UrTcxGk3GRHmnMlpkyiUle5pTL8Et98+1RyUdwUjfgPnPAEqPG4y3TXHMVQDNiAG0Hs1yAil
 PjGdoVNp0anKSmOXylqfPuiDovpefzLRDlS3uT2iId23C0ZDVTMZyuzODak9QmZtGV63XuaYpCq
 g=
X-Received: by 2002:a17:906:2755:: with SMTP id
 a21mr4226788ejd.374.1611348450802; 
 Fri, 22 Jan 2021 12:47:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwo163a+f8F/EOwisq+gJafad5l/6GVGT0dTmP8QFP5yGh0Mq6mKUNkt7IGPgMbDROQFsSGmg==
X-Received: by 2002:a17:906:2755:: with SMTP id
 a21mr4226768ejd.374.1611348450595; 
 Fri, 22 Jan 2021 12:47:30 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
 by smtp.gmail.com with ESMTPSA id m8sm2769649eds.70.2021.01.22.12.47.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 12:47:30 -0800 (PST)
Subject: Re: [PATCH v3 05/13] extcon: arizona: Always use
 pm_runtime_get_sync() when we need the device to be awake
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20210122164107.361939-1-hdegoede@redhat.com>
 <20210122164107.361939-6-hdegoede@redhat.com>
 <CAHp75VdPVNMvQnkOr2YOL_VirwS7QxKfG5A9P-P8q2suK=J9dw@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <8209882c-ae98-ecf1-3e76-1bce34017b41@redhat.com>
Date: Fri, 22 Jan 2021 21:47:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VdPVNMvQnkOr2YOL_VirwS7QxKfG5A9P-P8q2suK=J9dw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>
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

On 1/22/21 9:38 PM, Andy Shevchenko wrote:
> On Fri, Jan 22, 2021 at 6:41 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Before this commit the extcon-arizona code was mixing pm_runtime_get()
>> and pm_runtime_get_sync() in different places.
>>
>> In all places where pm_runtime_get[_sync]() is called, the code
>> makes use of the device immediately after the call.
>> This means that we should always use pm_runtime_get_sync().
> 
> I think it implies the non-atomic (may sleep) context in the below functions.

Right, but there were always called with the info->lock mutex held anyways,
so no change there.

> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Thank you.

Regards,

Hans



> 
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Changes in v3:
>> - This is a new patch in v3 of this patch-set
>> ---
>>  drivers/extcon/extcon-arizona.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-arizona.c
>> index 72d23b15108c..56d2ce05de50 100644
>> --- a/drivers/extcon/extcon-arizona.c
>> +++ b/drivers/extcon/extcon-arizona.c
>> @@ -290,7 +290,7 @@ static void arizona_start_mic(struct arizona_extcon_info *info)
>>         unsigned int mode;
>>
>>         /* Microphone detection can't use idle mode */
>> -       pm_runtime_get(info->dev);
>> +       pm_runtime_get_sync(info->dev);
>>
>>         if (info->detecting) {
>>                 ret = regulator_allow_bypass(info->micvdd, false);
>> @@ -695,7 +695,7 @@ static void arizona_identify_headphone(struct arizona_extcon_info *info)
>>         dev_dbg(arizona->dev, "Starting HPDET\n");
>>
>>         /* Make sure we keep the device enabled during the measurement */
>> -       pm_runtime_get(info->dev);
>> +       pm_runtime_get_sync(info->dev);
>>
>>         info->hpdet_active = true;
>>
>> --
>> 2.28.0
>>
> 
> 

