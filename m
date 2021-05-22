Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2190838D6DD
	for <lists+alsa-devel@lfdr.de>; Sat, 22 May 2021 20:12:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CF051699;
	Sat, 22 May 2021 20:11:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CF051699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621707123;
	bh=mNeg7+phSbeVYJtOT2UJ9mOO6LRz72nK62zoixosP2g=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tuu14GSHoNAWvuKN0wjGI+9eOFImzky/oayhF4gc1HfHNSS3Nhq1eIef0wUtR2Ehm
	 OyKZ1hStmzURPZ9i+oK2LVmtGF0KcMT9Q+aPjyopwwmw/7YHtiNpoA1tGBjWLNXa7q
	 MOIgCRbTyvHSQXh4lAal6A3RjHBFKZzv6Gim4SoU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37C53F804AA;
	Sat, 22 May 2021 20:10:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A984F804AA; Sat, 22 May 2021 20:10:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31091F80431
 for <alsa-devel@alsa-project.org>; Sat, 22 May 2021 20:10:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31091F80431
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="CaBmfcfO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621707016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4W2QcH7GGhbjcz45YQXs8r26c8aVBBmE8RTGqgNUAzA=;
 b=CaBmfcfO8QzpQNUiU7b6gfOeK5+9aIxwHttYDVkUNPWqHwCmqFojS2A+DySVgRfVpyGK7X
 biD63wz++nKL5p2HdOWIU8dcbmpo/dyDmr5rfDKkRyT4f48Pn8Ne2NjmQgf8N2hM9Y9m/V
 ZB6znillTL6UXRN1agV6cgSBruvplfQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-dfZdaCK3OEedg6EXCQh2XA-1; Sat, 22 May 2021 14:10:14 -0400
X-MC-Unique: dfZdaCK3OEedg6EXCQh2XA-1
Received: by mail-ed1-f70.google.com with SMTP id
 w1-20020aa7da410000b029038d323eeee3so11159072eds.8
 for <alsa-devel@alsa-project.org>; Sat, 22 May 2021 11:10:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4W2QcH7GGhbjcz45YQXs8r26c8aVBBmE8RTGqgNUAzA=;
 b=CaOLogDL/XWuMaYjrsI/ce9etkhjtmXrOOoF53hOCdkA6SXq3YN8cnRKWMmfeUemxS
 uV1SklAhjKX+6tWuUDvHOfemZbkfWcV51fRwfFHr4RXOIShmdnws+j/4iXM+0tFWsnq2
 5DRd99+MX6JgnoN+/qD3eFHUXy0UfR200vZr1Z+OemeOgfXSOkCi0Le5uX0jAdj6gH4n
 BQe8EwLaOlO22csfo/7WS5+TE02YQ9TF73DE3LrW/gtBTqlx0vrFlIj0+ytOVNL9u66l
 Epagf7suSBGYKTU+Nq7mci0rsXSyH0HB3HDJ8iBnqIfCHHh2/QHnw4UKn/Dx/9hSFD5E
 rJ4A==
X-Gm-Message-State: AOAM532jCZruW/yT+6W0WQZ/ma26zpfQ80N3G6g/dvUfli5CyZ/Mia2w
 wAXdgbpasMAIUCx11T2cgJ9f6EANroZIeLdXnSQ03Y2kBs8uSgoiWFHmBaeB514xlIPg7XQ07hT
 GCBzmbeJls1WuFTQoWqD0asdV600L9cN+MWTaQ+2ylkJwMLD99f6A2/MhQtysHvTgBYruqChKJN
 s=
X-Received: by 2002:a17:906:e15:: with SMTP id
 l21mr15377157eji.538.1621707013162; 
 Sat, 22 May 2021 11:10:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDDRmIS+L1ZyDel3O6pfJ1kfu8hHyQboMTZ25cTa+wEBEqX7ZEtMU1ZbxLOAuGTslV7Zx0hA==
X-Received: by 2002:a17:906:e15:: with SMTP id
 l21mr15377135eji.538.1621707012974; 
 Sat, 22 May 2021 11:10:12 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id s11sm6716936edt.27.2021.05.22.11.10.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 May 2021 11:10:12 -0700 (PDT)
Subject: Re: [PATCH 2/8] iio: accel: bmc150: Don't make the remove function of
 the second accelerometer unregister itself
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20210521171418.393871-1-hdegoede@redhat.com>
 <20210521171418.393871-3-hdegoede@redhat.com>
 <CAHp75VchPrngr5h91sfqxEPk81DHG43UkOsjhXpz4iNDagPjaw@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <88627e31-b417-c0b3-2019-84fd9be69a0b@redhat.com>
Date: Sat, 22 May 2021 20:10:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VchPrngr5h91sfqxEPk81DHG43UkOsjhXpz4iNDagPjaw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 linux-iio <linux-iio@vger.kernel.org>, patches@opensource.cirrus.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jeremy Cline <jeremy@jcline.org>,
 Mark Brown <broonie@kernel.org>, Jonathan Cameron <jic23@kernel.org>
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

On 5/22/21 8:06 PM, Andy Shevchenko wrote:
> On Fri, May 21, 2021 at 11:23 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On machines with dual accelerometers described in a single ACPI fwnode,
>> the bmc150_accel_probe() instantiates a second i2c-client for the second
>> accelerometer.
>>
>> A pointer to this manually instantiated second i2c-client is stored
>> inside the iio_dev's private-data through bmc150_set_second_device(),
>> so that the i2c-client can be unregistered from bmc150_accel_remove().
>>
>> Before this commit bmc150_set_second_device() took only 1 argument so it
>> would store the pointer in private-data of the iio_dev belonging to the
>> manually instantiated i2c-client, leading to the bmc150_accel_remove()
>> call for the second_dev trying to unregister *itself* while it was
>> being removed, leading to a deadlock and rmmod hanging.
>>
>> Change bmc150_set_second_device() to take 2 arguments: 1. The i2c-client
>> which is instantiating the second i2c-client for the 2nd accelerometer and
>> 2. The second-device pointer itself (which also is an i2c-client).
>>
>> This will store the second_device pointer in the private data of the
>> iio_dev belonging to the (ACPI instantiated) i2c-client for the first
>> accelerometer and will make bmc150_accel_remove() unregister the
>> second_device i2c-client when called for the first client,
>> avoiding the deadlock.
> 
> I would rather call it aux device (at least in the code). The
> terminology maybe needs more clarification (like the main one in the
> block with the display panel and aux in the keyboard).
> 
> If you disagree, ignore this comment. I have no strong opinion here
> since I don't know the difference between them (accelerometers).

Thank you for your input, but both sensors are identical, so calling
one aux sounds of to me, so lets keep this as is.

Regards,

Hans

