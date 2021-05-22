Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D7638D71D
	for <lists+alsa-devel@lfdr.de>; Sat, 22 May 2021 21:06:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA1931679;
	Sat, 22 May 2021 21:05:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA1931679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621710387;
	bh=yY5/FdSth7s/09mxJoRc1sbpTAFrn/N3OQNvqOAINpM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Uqg5KJ9TfPfmz+BpSKZfSHIT53fZp+3PcJ65Sgw/BPIDgBamq3AtmNA8pQE71o0j+
	 Z6dt2w/7vBlEoz43OPZhqmxL4AMiJlbA6wmMx1lKVqlUqDFjZMd90F06FIB2WzmvtE
	 eOqMRefiNftY9ofWMfx/HMF29p6ZxzGqK3x69QiA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75404F80229;
	Sat, 22 May 2021 21:04:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0796EF80217; Sat, 22 May 2021 21:04:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D2C7F800DF
 for <alsa-devel@alsa-project.org>; Sat, 22 May 2021 21:04:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D2C7F800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="bDJ24nJ3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621710293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JTYqpU4ltDUcNSbPoUdnAx3Y5FQHMd2LMPQn4HBUBaw=;
 b=bDJ24nJ30MjCO0nWULCHfJThkpxGBM4PM8n5Y3bEk5W1RRjs7ojZGZWU4g9gKTmhYn7Wsj
 e9sseSl5+/YlRm9cUcFHq1Nztvr5daI3tmM3XuAqRE7S5pGFVO2gNc9qEA6VkJD8AgIz/U
 RPfZlZTD0phyM+jqbX4qEJTO5ruik84=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-Hj_vDVnuNWSkEEKlaioi8A-1; Sat, 22 May 2021 15:04:52 -0400
X-MC-Unique: Hj_vDVnuNWSkEEKlaioi8A-1
Received: by mail-ed1-f70.google.com with SMTP id
 c15-20020a05640227cfb029038d710bf29cso7177746ede.16
 for <alsa-devel@alsa-project.org>; Sat, 22 May 2021 12:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JTYqpU4ltDUcNSbPoUdnAx3Y5FQHMd2LMPQn4HBUBaw=;
 b=J6r7d7q8qINd08rUSox+BbJ90Y7als0SbqLeAHbejmrmwcJ1kmsxbyDfp93O3lJioe
 gaPCwj4i06lsOUBI9j8NEv8F4+OJ4n+9hiLFVKzW99rUjfWRs0Xt+fjTZoe6HwXh5wWp
 Y1lQqJZ0W7lqSxB/lYTQE/cPFFssy339QkJUuO21XAX8A2xZ3CT0Km/Uy5EonIBzRi2U
 l16ipbEErzXjal1oYhziLPD+MsbjldIQFVp6UNWkoeIjAggA2J6I8jRyk36i/O2p4of6
 ACB/xAS1OOPN5OJqFaLadBLioPrR5BBvnOERah5zdM+jO39iNe+HXtdNl8RTyRTqZQHx
 bCtg==
X-Gm-Message-State: AOAM530sig4yzdzOMzdB2JBOsF+fo7kHeNtHxDY0DK8uxD1KANRU/67A
 uD7rSswEWc6g/PeQnsoeL0uPREoYCPLWfXgcppnb9RrwjmXmGjzLaoP9sOiEo3cltSCFRlO/MZ4
 3UvJ7UEduyWm1w8iglhcFvzPvaxsajzBTauKtUGczvk3mpiYyh1o/rRvkfvM3FtisZ1u655UqpB
 8=
X-Received: by 2002:a17:907:1b06:: with SMTP id
 mp6mr16119721ejc.292.1621710290815; 
 Sat, 22 May 2021 12:04:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5S9lzwdzwMNz7zIjzaMkasypoc/wWhCqbx5Y97aDyj6iRIBkj7CbgYdIxqOAU0FN4XsRhYw==
X-Received: by 2002:a17:907:1b06:: with SMTP id
 mp6mr16119700ejc.292.1621710290572; 
 Sat, 22 May 2021 12:04:50 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id p11sm194424edt.22.2021.05.22.12.04.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 May 2021 12:04:50 -0700 (PDT)
Subject: Re: [PATCH 8/8] iio: accel: bmc150: Set label based on accel-location
 for ACPI DUAL250E fwnodes
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20210521171418.393871-1-hdegoede@redhat.com>
 <20210521171418.393871-9-hdegoede@redhat.com>
 <CAHp75VeOpT9yJx8FT57NwQQCo0ojs+-sHZn7D3DSA=caH3FZMg@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <da47ac52-e584-7369-e153-09cb474d9708@redhat.com>
Date: Sat, 22 May 2021 21:04:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VeOpT9yJx8FT57NwQQCo0ojs+-sHZn7D3DSA=caH3FZMg@mail.gmail.com>
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

On 5/22/21 8:34 PM, Andy Shevchenko wrote:
> On Fri, May 21, 2021 at 11:23 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Some Yoga laptops with 1 accelerometer in the display and 1 in the base,
>> use an ACPI HID of DUAL250E instead of BOSC0200.
>>
>> Set the iio-device's label for DUAL250E devices to a value indicating which
>> sensor is which, mirroring how we do this for BOSC0200 dual sensor devices.
>>
>> Note the DUAL250E fwnode unfortunately does not include a mount-matrix.
> 
>> +       /* Special case for devices with a "DUAL250E" HID */
>> +       if (adev && acpi_dev_hid_uid_match(adev, "DUAL250E", NULL)) {
>> +               if (strcmp(dev_name(dev), "i2c-DUAL250E:base") == 0)
>> +                       label = "accel-base";
>> +               else
>> +                       label = "accel-display";
>> +
>> +               indio_dev->label = label;
>> +               return false; /* DUAL250E fwnodes have no mount matrix info */
>> +       }
>> +
>>         if (!adev || !acpi_dev_hid_uid_match(adev, "BOSC0200", NULL))
>>                 return false;
> 
> 
> This sounds to me like
> 
> _apply_orientation_generic()
> ...
> 
> _apply_orientation_dual250e()
> 
> 
> _apply_orientation()
> 
> if ()
>   return _apply_orientation_generic()
> 
> if ()
>  return _apply_orientation_dual250e
> 
> return false;

Good point, I'll give that a try for v2 and see if I like the end result
of that. If it turns out to be a bit ugly I'll just stick with
what is in v1.

Regards,

Hans

