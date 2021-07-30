Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B72A3DB7AB
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jul 2021 13:22:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC94A1A16;
	Fri, 30 Jul 2021 13:21:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC94A1A16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627644136;
	bh=OImzFAP1/J+iWaVFdb7+Eb8HblvIooYj8bsWWfsunAo=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SCKHgxEHA4ry/iLX/fHLWdH3lioNp6rrzzyEePx26O+jaI7mzhX9YoOI5OmoAvhHW
	 2U3hxo69CWVavwZPL+TANiOqLTLlFlVidu6G4ykK9RehzMXKhKOWAawzkzFjiTf+k2
	 HF8V6M/RkaAF9LMJ6pwNdljwvIpBOJE50h+xIUMM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C6B0F8025A;
	Fri, 30 Jul 2021 13:20:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81497F80253; Fri, 30 Jul 2021 13:20:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E33C4F800ED
 for <alsa-devel@alsa-project.org>; Fri, 30 Jul 2021 13:20:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E33C4F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="SDodMHuP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627644042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xoZ0rQJzkAlEARYpy185r3rkUF2xvV1IMhM1fzZ9V3I=;
 b=SDodMHuPMU+5KTzQuW0TaFPGI3AIPIzX8xsflqVCw40Ah0PC7sE8xlCq6HRWgp29qYCbM0
 +iX/RtIvFqu+i2dT1xtjYC7/t7gfa6iTl5uFEPpPhMupW5a9jVaTzpsrYRVHJFZ10sLAQG
 k8QsHVT8CEB7OrW1GFqzP7XBHU3Zf+8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-h-ohsW2-NQiAAYoRSYdXpQ-1; Fri, 30 Jul 2021 07:20:37 -0400
X-MC-Unique: h-ohsW2-NQiAAYoRSYdXpQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 ay20-20020a0564022034b02903bc515b673dso4467680edb.3
 for <alsa-devel@alsa-project.org>; Fri, 30 Jul 2021 04:20:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xoZ0rQJzkAlEARYpy185r3rkUF2xvV1IMhM1fzZ9V3I=;
 b=F4IzfDOmHH8pVT4WXEuXLWC2C9Fr7aGvwz+csmRmHSW62wAX7t6TUTjE/4xqmENigF
 N6lqaAkMMPcu6e68Bqzf7wZ2oIDT8tBHXKleDQ6VeSRe5vDua67q1aqrqpMNvAFvNCmB
 e2slo/hBTOw+dqXr3a6BKhlodBYRxnIAHqXJT5115VHlreKNr1GiE5qYepbwUCi1CLz8
 wGIeNrRzdzFqaa3YuIPwCvBQX27LsIBMZYDZY73hfWu0CMf8yXLX3aJRF8BYxbCzh/SF
 MT+88Ki6iD8bbG9lrtmDA/uaRFNGAYJpFKpIvRBli0qfKswNeqmne+TTapPd7IPd1tMI
 u9/Q==
X-Gm-Message-State: AOAM533oluLFQBJ5ajRmahHl3oAJYhpAXjvDj+8INPVcsu14jw4GoYo/
 mfpop6j+28KDUVzDK4B2opFaaulWqaK7DBEvfLfYUfKzJdTxt4N/LriuC5IJhJXf+THlJxakegK
 Uez9ZNT3nQSO3LO0WM1x7REv4nwett38TmzUFXVg9yZxiKDMMmm6/QxYNYEkHEGHkDjwUiFd3ej
 c=
X-Received: by 2002:a17:906:2bd3:: with SMTP id
 n19mr2109176ejg.232.1627644036371; 
 Fri, 30 Jul 2021 04:20:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRQZscaSYBSXu3oIIawwYVmFOJERQra3qvilLEmFXOAR2WIDy/rjn+BZczPMLK57KAd8/3rA==
X-Received: by 2002:a17:906:2bd3:: with SMTP id
 n19mr2109156ejg.232.1627644036164; 
 Fri, 30 Jul 2021 04:20:36 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id r11sm458345ejy.71.2021.07.30.04.20.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 04:20:35 -0700 (PDT)
Subject: Re: 5.14 regression, Intel SST (BYT) audio no longer works
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <6ebbcf0f-3a4b-0b28-1f17-8e1108f040c0@redhat.com>
 <f5dbc1c8-0118-17f7-1f6c-4dc8366b8dd0@linux.intel.com>
 <808f4c7f-4460-40b7-aa91-68bebc639db2@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <189f7c6f-afb4-8d83-54ca-a3542b876a57@redhat.com>
Date: Fri, 30 Jul 2021 13:20:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <808f4c7f-4460-40b7-aa91-68bebc639db2@linux.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 7/19/21 5:57 PM, Pierre-Louis Bossart wrote:
> 
>>> I just noticed and I won't have time to dig any deeper for approx. the
>>> coming 10 days. Still I wanted to report this in case anyone has any
>>> ideas. Or maybe you can reproduce and look for a fix ?
>>>
>>> After building + installing 5.14-rc1 on a HP Elitepad 1000 G2
>>> (Bay Trail) with a RT5642 codec, I noticed that sound over the
>>> speakers and over the docks line-out jack no longer works.
>>>
>>> Downgrading to 5.13 (without any other changes) fixes this, so this
>>> seems to be a regression with 5.14.
>>>
>>> I've no been able to make time to test this on other BYT/CHT hardware,
>>> but I suspect that other models will be affected too.
>>
>> Thanks Hans for the report, will look into this. 
>> I can't think of anything that might explain this regression.
>> I need to update the series to remove device properties so if the baseline is broken I'll see it as well...
> 
> I don't see any issues seen on a headless CHT Zotac device with RT5640, both with v5.14-rc1 or broonie/for-next.
> Maybe something else happening with e.g. ACPI or GPIOs?

I guess you tested with the SOF driver? I just tested and SOF
works fine in 5.14-rc#, but SST gives no sound. And we still
default to SST due to a couple of remaining SOF issues ...

I'm investigating this further now.

Regards,

Hans

