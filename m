Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D1138D71A
	for <lists+alsa-devel@lfdr.de>; Sat, 22 May 2021 21:04:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39D19167F;
	Sat, 22 May 2021 21:03:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39D19167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621710272;
	bh=+4ARJ1QyNax/yxOESG3yu59raOpIIUiTGkGOtkqhP8g=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ij+udyT9fUGB8+5SozsIV7b7cVHsoX6InMbiPFlWR9GQ7ZQfcFKqKj3HDyb9stzPa
	 ge3Mq+9xfSM8pSRAgKU2zXSr83BI5ng3xgGb3WC0+ixlYo+6JzM43juaB66i6t+MsR
	 l5FSTqJrKVqs/PLQYTvA6GyekmlGKQ3JYKzSfxwY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A295DF80229;
	Sat, 22 May 2021 21:03:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B44CF80217; Sat, 22 May 2021 21:03:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_21,RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A417AF800DF
 for <alsa-devel@alsa-project.org>; Sat, 22 May 2021 21:02:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A417AF800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="JdacKdUl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621710177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JYdRGNdgyQ77jFt5KAhRgCs8M38rfYVJr2I7i5lsq3I=;
 b=JdacKdUltOrOtHxF3IKCbyvIOVWRBa0NBhiHffLnrSh17I6YZCXbbR8ZHGKHWxcGZgP659
 mp9/Xl9qX32Dj3/C72cl7AAq88IDZUgeIt9G/9HxvqVKTWl+ebmsenLinM0RqnRpfHVo+o
 s2Gbhas2J8aPwGgB3t94M7kTGUmIj1E=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-wewXS3TlOnql2ikHMYfpVA-1; Sat, 22 May 2021 15:02:55 -0400
X-MC-Unique: wewXS3TlOnql2ikHMYfpVA-1
Received: by mail-ed1-f72.google.com with SMTP id
 n6-20020a0564020606b029038cdc241890so13180637edv.20
 for <alsa-devel@alsa-project.org>; Sat, 22 May 2021 12:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JYdRGNdgyQ77jFt5KAhRgCs8M38rfYVJr2I7i5lsq3I=;
 b=c2BUzW1AKuxIXQ0g0fRl/dJ5TfpKBAq3SPYTzQdQlAOZMRhaHc3+nu/S5ArN3vgrZD
 UKfi6NFwZq8rQRlhFjryA0+0V5O10RIAE9N8EZBmaD0g/ra2YlkNoCgo0/QqHrlb08bJ
 aEfS0jZU5U+D7jj0JLShz+7T41yscuCaaDDD+Gp41TrHK6MEg0HnQdaDSIYI3PpthDI5
 Vg7lhJERI1vxImYzBbQ8A8xACFuAu1rNLH2X9kTXxAPgyl5llcpeUUz9dqSWvSr1sZg6
 84vQ+w7JzNT9DTD5H8DiVCY46wQV5+4sNW5lbhI3jhxF1KJKJWAByTbvIpXrCoiKibo3
 9xVA==
X-Gm-Message-State: AOAM531eojXX6xLr2UCWyUvTz1Mi2sw/E9m0cMBrvPnVN4xkTlAVhIwG
 RzqFGBNwa9GJAuOYC5RrDIDf064h1zmYv8lv/qbYYrpT2ZhrBvn0ma0qoWP9rxFx/sawTuXudLA
 /m6qRdWT1xV44qhmLlzkudfZgoK4TCwDLEWj3HmF400SU5qjZy8Fc5TNdLRs+9JyvJI7zrE0MjV
 Y=
X-Received: by 2002:a17:906:6ad0:: with SMTP id
 q16mr16329342ejs.286.1621710174327; 
 Sat, 22 May 2021 12:02:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4kOKPXYvDMx5F7qSOWZORnK/15eAZYq6RX3yuds6Pp+SOA1erE7zFy/wnOWcgm79SqSVgMA==
X-Received: by 2002:a17:906:6ad0:: with SMTP id
 q16mr16329321ejs.286.1621710174151; 
 Sat, 22 May 2021 12:02:54 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id r2sm5603281ejc.78.2021.05.22.12.02.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 May 2021 12:02:53 -0700 (PDT)
Subject: Re: [PATCH 7/8] iio: accel: bmc150: Add support for DUAL250E ACPI DSM
 for setting the hinge angle
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20210521171418.393871-1-hdegoede@redhat.com>
 <20210521171418.393871-8-hdegoede@redhat.com>
 <CAHp75VdAC9nP5EyCCMZ41vmSsZoV8gPOMxOkY=U4gVm5dQAXCg@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <c53e13fc-d12d-aa5c-ba06-757fc58d2f1f@redhat.com>
Date: Sat, 22 May 2021 21:02:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VdAC9nP5EyCCMZ41vmSsZoV8gPOMxOkY=U4gVm5dQAXCg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 5/22/21 8:21 PM, Andy Shevchenko wrote:
> On Fri, May 21, 2021 at 11:22 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Some 360 degree hinges (yoga) style 2-in-1 devices use 2 bmc150 accels
>> to allow the OS to determine the angle between the display and the base
>> of the device, so that the OS can determine if the 2-in-1 is in laptop
>> or in tablet-mode.
>>
>> On Windows both accelerometers are read (polled) by a special service
>> and this service calls the DSM (Device Specific Method), which in turn
>> translates the angles to one of laptop/tablet/tent/stand mode and then
>> notifies the EC about the new mode and the EC then enables or disables
>> the builtin keyboard and touchpad based in the mode.
>>
>> When the 2-in-1 is powered-on or resumed folded in tablet mode the
>> EC senses this independent of the DSM by using a HALL effect sensor
>> which senses that the keyboard has been folded away behind the display.
>>
>> At power-on or resume the EC disables the keyboard based on this and
>> the only way to get the keyboard to work after this is to call the
>> DSM to re-enable it.
>>
>> Call the DSM on probe() and resume() to fix the keyboard not working
>> when powered-on / resumed in tablet-mode.
>>
>> This patch was developed and tested on a Lenovo Yoga 300-IBR.
> 
> ...
> 
>> +       if (strcmp(acpi_device_hid(adev), "DUAL250E"))
> 
> Can we use like in the other case in this series the acpi_dev_hid_uid_match() ?

I agree that that would be more consistent, I'll fix this for 2.


> Because it's actually what you are doing here and it may be better to
> see the same approach for this HID done in different places in the
> code to recognize what it is about.
> 
>> +               return false;
> 
> ...
> 
>> +       /*
>> +        * The EC must see a change for it to re-enable the kbd, so first set the
>> +        * angle to 270° (tent/stand mode) and then change it to 90° (laptop mode).
>> +        */
>> +       if (!bmc150_acpi_set_angle_dsm(client, 0, 270))
>> +               return false;
> 
>> +       /* The EC needs some time to notice the angle being changed */
>> +       msleep(100);
> 
> I feel that you conducted a research and answer to the following will
> be no, but...
> 
> Do we have any means of polling something (embedded controller / ASL /
> etc) to actually see the ACK for the action?

Nope, there is nothing to poll and I tried shorter time-outs and that
lead to the EC sometimes not seeing the change.

> 
>> +       return bmc150_acpi_set_angle_dsm(client, 0, 90);
> 
> ...
> 
>> +       schedule_delayed_work(&data->resume_work, msecs_to_jiffies(1000));
> 
> Isn't it the same as 1 * HZ ?

Yes, but this makes it clearer that the delay is 1 second, IMHO using n * HZ
is harder to read / reason about then having the delay right there in msecs.
This also means less churn if it needs to change to a different amount of msecs
later.

Regards,

Hans

