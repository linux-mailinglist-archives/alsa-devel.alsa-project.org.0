Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B8F300EBD
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 22:19:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0D0A1F0F;
	Fri, 22 Jan 2021 22:18:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0D0A1F0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611350342;
	bh=lHZ9mICmwxQU8e5NL/zv9KiVWzryOgP2QcdelgPRpW8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OB3zH6Mz2D4TXw5fonTY2EwGLtqZT/B9sY1NHWejJIa1xJJDvGSVJlhI+HuvgflkE
	 m5puxPTT3QdGwg9Suw3GNlQ4Cikh7kXHaATkpH3kQlHbYbRfXrVcQnBa3qo2n9e/Nd
	 oTydcKdHEaGb9ApHI6ZCAu+7za5RP02V/ZXUx7tg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FCBFF80166;
	Fri, 22 Jan 2021 22:17:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1C4EF8015B; Fri, 22 Jan 2021 22:17:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B6AFF8015B
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 22:17:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B6AFF8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="HVLxtBRU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611350240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BDjPT9iPHhu8PUnABJf0D49/IjW21PMzqZx/2LRxvgE=;
 b=HVLxtBRUFigkm5eci38J1Fw6WJcM7sC8IsFwgrVVwsfrKotCGwsV1RZxRBP8SsWUjnnzvX
 T17nhS4fJ/0NVn1rbCFKxuET7rLQ6izUqBfk8kQiJIukPwnuMpFT3ONa5kjvsV3RkHUkVr
 f+pbopc/qQEapcLKXB8RVkX9Wnf8HOQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-I5Lc3WMKPHmOfOB_83AOXQ-1; Fri, 22 Jan 2021 16:17:18 -0500
X-MC-Unique: I5Lc3WMKPHmOfOB_83AOXQ-1
Received: by mail-ed1-f70.google.com with SMTP id w4so3543656edu.0
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 13:17:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BDjPT9iPHhu8PUnABJf0D49/IjW21PMzqZx/2LRxvgE=;
 b=ro3aUsHaRks6p22c0dr0geeftRdVFo4TfidOIBTF8TbN5HN5dAuGlwrLCr1lmqVIgv
 UFYJgaeF2ikK080FlzO3oXYmxJT9cLyTTS7x2jJGhlyf8CqZDD11paHQuS6fWj5D8eVK
 kEMMSKK7ymeuLQ8UgZoYsYkCBtl/gJVAAt6ha4nST45zURRS3h1l49yHKijlCa2S4sJW
 lHeP4sAZZ1aLb7bZOo9cov1urj0J1uAQI89LzLpK80aFTFplGPrlAuHGq+V9Q8j5yj9X
 gqbgnA23ALgRmnrY3urqgooMjx/STeuPWjDQczPfPB3DqEzg6wMBYSG7N5wQnhQIx1kI
 cL3w==
X-Gm-Message-State: AOAM530mw9ySg3X+OkOqgiiTiY70MwPr1IFHXYOpAx1zf1ABUxMxa+Ac
 3h+gjWbgbLBrbqTtuiqN74cIsZMgxBdecih54RywkmIqHYVX8WwoATJ8qMGBAVa+SY/fu6F8PPm
 EGqQNE+X9/7K12YxxGCM0OC3aWAvdj0or2F7QkWYZG6ylVE3tzPdmTVFUkfnlQQHWVm9W+x1Xpz
 Q=
X-Received: by 2002:a05:6402:3510:: with SMTP id
 b16mr1002119edd.242.1611350236983; 
 Fri, 22 Jan 2021 13:17:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw0hFVgHmuGiHHbKAqBXsmd3goO6RuIwjF4vltR2iPF94lLbwxkEF9o448HxKNY3lQl4eALlA==
X-Received: by 2002:a05:6402:3510:: with SMTP id
 b16mr1002100edd.242.1611350236777; 
 Fri, 22 Jan 2021 13:17:16 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
 by smtp.gmail.com with ESMTPSA id b26sm6380261eds.48.2021.01.22.13.17.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 13:17:15 -0800 (PST)
Subject: Re: [PATCH v3 06/13] ASoC/extcon: arizona: Move arizona jack code to
 sound/soc/codecs/arizona-jack.c
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20210122164107.361939-1-hdegoede@redhat.com>
 <20210122164107.361939-7-hdegoede@redhat.com>
 <CAHp75VedGzihYi1Ndjj4K4326pMrLtk3V7gi_rxteu5HaqWfEA@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <63f62136-8d19-c281-bbae-3e1e6b0fd4e3@redhat.com>
Date: Fri, 22 Jan 2021 22:17:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VedGzihYi1Ndjj4K4326pMrLtk3V7gi_rxteu5HaqWfEA@mail.gmail.com>
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

On 1/22/21 9:40 PM, Andy Shevchenko wrote:
> On Fri, Jan 22, 2021 at 6:41 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> The jack handling for arizona codecs is being refactored so that it is
>> done directly by the codec drivers, instead of having an extcon-driver
>> bind to a separate "arizona-extcon" child-device for this.
>>
>> drivers/mfd/arizona-core.c has already been updated to no longer
>> instantiate an "arizona-extcon" child-device for the arizona codecs.
>>
>> This means that the "arizona-extcon" driver is no longer useful
>> (there are no longer any devices for it to bind to).
>>
>> This commit drops the extcon Kconfig / Makefile bits and moves
>> drivers/extcon/extcon-arizona.c to sound/soc/codecs/arizona-jack.c .
>>
>> This is a preparation patch for converting the arizona extcon-driver into
>> a helper library for letting the arizona codec-drivers directly report jack
>> state through the standard sound/soc/soc-jack.c functions.
> 
> ...
> 
>>  MAINTAINERS                                               | 1 -
> 
>> -F:     drivers/extcon/extcon-arizona.c
> 
> Commit message doesn't shed a light if we need to move this actually
> to another record in MAINTAINERS database.

Ah, good call, yes we should. I'll fix this for v4.

Regards,

Hans

