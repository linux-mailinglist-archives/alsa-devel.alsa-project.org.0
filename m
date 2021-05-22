Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFEB38D712
	for <lists+alsa-devel@lfdr.de>; Sat, 22 May 2021 20:59:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B8F31686;
	Sat, 22 May 2021 20:58:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B8F31686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621709950;
	bh=VItIZabSJ5Nqw0Qd3FjWUyDorP35stN2WA6dAvezyFk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DZMEjPqhU1F4EMZeUDdKcLZvwgoB2tyh0WJdx+D32IHqEMRe+Fg4gd0yIGodbNi8c
	 x2SMG0PusrwdhfX95TwytHqZNG29p6pvOV/MMvfcPQl6mdrIRDXzu+GLMtJpKPvuj+
	 tQZSlz2Sy81EHEysVxjeDCS47h3yDt+jVCM+VhDQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9F51F80153;
	Sat, 22 May 2021 20:57:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D5D3F80217; Sat, 22 May 2021 20:57:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3332FF80153
 for <alsa-devel@alsa-project.org>; Sat, 22 May 2021 20:57:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3332FF80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="TdEe1k9D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621709852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0CTWc1JanZX5F1YBqTdDHu1pVBPB9ZkDdv+t/XPpJMM=;
 b=TdEe1k9DdM+jukdCOtyQXXGhLYXiJ7Z1RsrASb7pkYGi6/0hCRZWofkXphZAeMdMZghtcW
 BHfQVlHhx/Pu1LAVxQNSMGl0Xvo4h+GglQPnrCheNvKreDnz9gZ2BODfuqUCzuRorA6DTb
 yzAbN+SAG6dEMlrIJutelRvscPRkwDc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-r4C1f9rtOrWxb4JBnZNLeg-1; Sat, 22 May 2021 14:57:31 -0400
X-MC-Unique: r4C1f9rtOrWxb4JBnZNLeg-1
Received: by mail-ed1-f70.google.com with SMTP id
 i3-20020aa7dd030000b029038ce772ffe4so13294679edv.12
 for <alsa-devel@alsa-project.org>; Sat, 22 May 2021 11:57:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0CTWc1JanZX5F1YBqTdDHu1pVBPB9ZkDdv+t/XPpJMM=;
 b=ms+fVvmhY1LJYvcHbCENrtgpI3U+yq8aPBxkfoCg6U+6VxpiK71Un+iP+xROJe/mYj
 M3vylUI3tmey26KV3EcBDfyBbBMDN+Ifb3OJCkd9LNkuVZLc77XG18shm14Kk6OiERhW
 9P8PdOo67slKr2xz3DkA9Rb7HLNrKQXPFOHP32ful+UZZ3u1xjoty3ohEpvHD8eM+JpY
 Hq3vKu2uBwjf0JuHDj1y+Lubsq+0/PnAwkfhy2MYhl3aNHIAcJzUyKFdr1hFa+JfX3Wa
 xokhqPlrA8R53bTuAuLChjXBurGbNn4yxKTFPTJyESBDXBPzguzx0JHldA4/+LvAnKhz
 BscQ==
X-Gm-Message-State: AOAM5330EhI4ZQkQTB5EtN/wxPs7wrYEA+mICMEcwOKQXIIfgyTQeVUR
 jEBM4ggLjF7QEJaCtaJ1VPe+gKNVDK+pcsV5P2pUClRI0rczELdF1addQ0/pwXlMdyORCnvf5TZ
 3wJrZ0xyJkYG9OV5ilF7eSX2ssotOn5yx7mIxEdty8IkAN1KlXv8EgISrw7+7K19cYDEF1NuM9H
 A=
X-Received: by 2002:aa7:df90:: with SMTP id b16mr4007673edy.361.1621709849685; 
 Sat, 22 May 2021 11:57:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiKhucOb2X+aPVb1IqqLm28bIfgK0q/UzHUrDNgYN2egw4HnbnRDwMW2GddqSCGkNGvB3ZBw==
X-Received: by 2002:aa7:df90:: with SMTP id b16mr4007651edy.361.1621709849427; 
 Sat, 22 May 2021 11:57:29 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id q16sm5739229ejm.12.2021.05.22.11.57.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 May 2021 11:57:29 -0700 (PDT)
Subject: Re: [PATCH 3/8] iio: accel: bmc150: Move check for second ACPI device
 into a separate function
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20210521171418.393871-1-hdegoede@redhat.com>
 <20210521171418.393871-4-hdegoede@redhat.com>
 <CAHp75VfL0U90qcG4D1eOEP0f8sOMiNsrHwXVe4YjR1ypQFBLwQ@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <8e4e58a1-49ab-0a45-057d-838e4e934a98@redhat.com>
Date: Sat, 22 May 2021 20:57:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VfL0U90qcG4D1eOEP0f8sOMiNsrHwXVe4YjR1ypQFBLwQ@mail.gmail.com>
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

On 5/22/21 8:09 PM, Andy Shevchenko wrote:
> On Fri, May 21, 2021 at 11:23 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Move the check for a second ACPI device for BOSC0200 ACPI fwnodes into
>> a new bmc150_acpi_dual_accel_probe() helper function.
>>
>> This is a preparation patch for adding support for a new "DUAL250E" ACPI
>> Hardware-ID (HID) used on some devices.
> 
> ...
> 
>> +#ifdef CONFIG_ACPI
>> +static const struct acpi_device_id bmc150_acpi_dual_accel_ids[] = {
>> +       {"BOSC0200"},
> 
>> +       { },
> 
> I guess it is a good chance to drop a comma.

Ack, will drop for v2.

Regards,

Hans


> 
>> +};
> 
> ...
> 
>> +       if (!IS_ERR(second_dev))
>> +               bmc150_set_second_device(client, second_dev);
> 
> I would comment on the pattern here, but I have noticed that this code
> is changed in the further patches anyway.
> 

