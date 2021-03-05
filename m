Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB4232E5AE
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Mar 2021 11:04:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B864217B4;
	Fri,  5 Mar 2021 11:04:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B864217B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614938690;
	bh=Uorol9TSY3MFQ9+mclsjOiyet+HyEEDne7fg8ZV27Bk=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IUimbkBq/Ypb6eOWn9Jgyq22xSgcFnWQnbzZtgxlXOQEZG11rSy60Bn8WPednEVqX
	 nVtP0RJ84OhDe74R8b18s8vLdoUaLa81lENRZjSnXm9S3vhhPPGcz4lGh32xQWQXhr
	 PCSEneBjXF6jcWWyICVh0cMTDHY00/r8wN5tZAn8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77CC4F8026A;
	Fri,  5 Mar 2021 11:03:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CA5EF8025E; Fri,  5 Mar 2021 11:03:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C8ADF800ED
 for <alsa-devel@alsa-project.org>; Fri,  5 Mar 2021 11:03:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C8ADF800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="cjszoUTU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614938592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XssU2E3GP/+TYByKTJaM9Oxg7yYivY6yHiKRjqsoOd8=;
 b=cjszoUTUmPn+o2fDawLTNCEEJNFP0JtdSHC0MRziaPkI5P5j6VMYfOX+sR0MQCtxAsPxWI
 3lCl8598oJn4TO33UXi96v8QVcpugU/xekskIceaTtBuN1Ohv7yXxO5qowHocplhBcxiT1
 vJHNQy0ZXIyRVakXzkdNg4UAs1Sq3V0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-7gmsmBReNUCBJFKFHw3NMw-1; Fri, 05 Mar 2021 05:03:10 -0500
X-MC-Unique: 7gmsmBReNUCBJFKFHw3NMw-1
Received: by mail-ej1-f71.google.com with SMTP id jo6so634119ejb.13
 for <alsa-devel@alsa-project.org>; Fri, 05 Mar 2021 02:03:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XssU2E3GP/+TYByKTJaM9Oxg7yYivY6yHiKRjqsoOd8=;
 b=LDxzZuQwLJlqu+6kvtqbamFSY6xx0RzPv2JjGXYRpYeFDZQDcxCDYIjLqM305VBoTr
 dm/s7RTFRogiTR6HbbJGNTPRT7HWDYuS/nMZo2w7Ww7U6EG6dlAWarpTGl6i0FHPTivH
 oSC8cNAgB5N8ql7Yor1IjLqwRq4gmyNyUmKzJvzUuh0rIFwYhvFmi0S6/o6NX3b+QMSQ
 UN5zeEZqBGEwu9weBJWqOTnb5D7m6ONh7aKSBu8F64ItTsqa9astLTrvrn21JpneFsp9
 NN5XZH8j7fSkJJ/JBCgZiVGgUDCl+4nc2a8axswq6HRgKrPjhcR+zp/TwYFsSxGk1IOG
 5FVg==
X-Gm-Message-State: AOAM533x4ultp5Iw+aytyj9QWmKozLkByvVbG+zn/KKdoiR8O+Nz2Zlr
 aHgCnaWyK/oUCeYJDk2BgR0X0FdSjOxxIUUvE6DTpRH70AL9Wz5Wif2uOQ1PJ1V11R/jcE0ebX+
 echFO189z2y8nID3C2EbOgB4YGKqEUapLCK3tSycWlw3a/TeamoWKOZte3VpemGmfrDH8OtRgOm
 g=
X-Received: by 2002:a17:906:a157:: with SMTP id
 bu23mr1498082ejb.491.1614938589050; 
 Fri, 05 Mar 2021 02:03:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxS7mve+oi7oqWqDBQXVpoWZeOfI8lyftR9qEoPy/Pi/Bo9serMpPtxMZSpZhSd4vDvlphtbA==
X-Received: by 2002:a17:906:a157:: with SMTP id
 bu23mr1498075ejb.491.1614938588894; 
 Fri, 05 Mar 2021 02:03:08 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id y12sm1198611ejb.104.2021.03.05.02.03.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 02:03:08 -0800 (PST)
Subject: Re: [PATCH alsa-lib v2 0/3] mixer: Volume control fixes
To: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org
References: <20210228161304.241288-1-hdegoede@redhat.com>
 <d879513b-7047-8e95-d037-cd45669bb0b3@redhat.com>
 <d8de7ba5-8e61-8a5d-f800-65a99bcbd33d@perex.cz>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <28a3a8b8-fb61-d585-a01d-fb37d0d6407d@redhat.com>
Date: Fri, 5 Mar 2021 11:03:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <d8de7ba5-8e61-8a5d-f800-65a99bcbd33d@perex.cz>
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

On 3/5/21 10:57 AM, Jaroslav Kysela wrote:
> Dne 04. 03. 21 v 22:50 Hans de Goede napsal(a):
>> Hi All,
>>
>> On 2/28/21 5:13 PM, Hans de Goede wrote:
>>> Hi All,
>>>
>>> Here is v2 of my series of alsa-lib volume-control fixes which I wrote
>>> while working on adding hw-volume control to UCM profiles for various
>>> x86 ASoC setups.
>>>
>>> New in v2 is adding an extra entry to the capture_volume_names array
>>> for the "ADC PGA Gain Volume" control used in the es8316 codec driver
>>> in patch 3/3.
>>>
>>> Note that patch 3/3 is not strictly necessary to make hw-volume control
>>> work. At least the PA hw-vol-control code does not care if the controls
>>> are wronly marked as global-volume-controls instead of
>>> capture-volume-controls. I mostly wrote patch 3/3 because for
>>> correctness reasons, so if it is deemed controversial we can drop it.
>>
>> Self-nack, I have some plans to make this more generic and I found
>> another set of control-names which need special handling (which is
>> the motivation to make the exception mechanism more generic).
> 
> I think that we should put the exceptions to a configuration file per driver,
> but I haven't a time to propose a complete solution.

Yes that would be ideal. But I don't have the time for that either.

What I do have in mind should be able to serve as a basis for that.

> BTW: The first patch looks really straight, so I have a plan to merge it.

That is fine, my planned re-write of this patch-set starts at patch 2   :)

Regards,

Hans

