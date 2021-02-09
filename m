Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1546C315218
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Feb 2021 15:54:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87D7A16BA;
	Tue,  9 Feb 2021 15:53:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87D7A16BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612882442;
	bh=WjH8gHTCHRGLIqUsjM0vWnHevNh7RT2B8B7LjWznKRM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dDoNVGWGtpxT/ZqTXrBf1U3m/y9SsGEdbSGLAQ+TbtNdQgB+Aa9/1riQ3Ugy+RMfK
	 vUAszDzubl8jErk0t0DbhR0+SNpo4R7VkUh5EHeanZWruQXLY0wbUrVVr1rFgVQIvy
	 JMgnyzfQzekr2gElMnEPYjsYPIlevIfINqbKaN2g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80CC1F80107;
	Tue,  9 Feb 2021 15:52:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9771CF801D5; Tue,  9 Feb 2021 15:52:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C894F8013A
 for <alsa-devel@alsa-project.org>; Tue,  9 Feb 2021 15:52:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C894F8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="SJ3iu6am"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612882339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZZurZ2p+Oz9T6fAZtfH5OfgZcCPb/XCukhWZRZD790Y=;
 b=SJ3iu6amIUGyXkokN9ypHWramFW9frdgNX7q3OigbrqZ+an8UX4GnpWRDkp4VGTMwZFpeW
 /lxSDvU4dMpv8vJ2AmWecPNhdCY9BlxSWmZ3l5Ij2w8gKp2ZwHpxtzrUEpF2yiqHE0ya7i
 16/baaTu26gIRi2RwqxEoh2kQtdE01U=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-5GO9RoCDMhOVwUMG2BeBIg-1; Tue, 09 Feb 2021 09:52:17 -0500
X-MC-Unique: 5GO9RoCDMhOVwUMG2BeBIg-1
Received: by mail-ej1-f72.google.com with SMTP id gv53so8554593ejc.19
 for <alsa-devel@alsa-project.org>; Tue, 09 Feb 2021 06:52:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZZurZ2p+Oz9T6fAZtfH5OfgZcCPb/XCukhWZRZD790Y=;
 b=KoU/uv1hhRlYMHyxcJ4ih2pOh29k9ApL3Wr3tjT0qPXnSSQe3NGNkdj6QXrWZN6g1L
 GbNEtYWdulhQ9uwReeWYmZgRS0clHLpoehUoTrZZNMRTMInF3wSUVDWL5Nok/rQ/17Ll
 HH1GCeYEg8HDHvl1nYu9EHx2WZtu7M9svPxP0TT3X7mxDKIoYbcIP5xz8VvdNGqZmVgs
 VeSBrPVSqF27F45VohJEYEtW4i9hNSbnvsywqCXOgoT1AEXikOrT38eaC3N9wnfZWkM4
 ZTSaV/tqAsGSt8J1tycK7MVo/K5v/kVjwNgREcmaq37m2oGJs+wsZ23R15lTe8jtATdo
 pmWg==
X-Gm-Message-State: AOAM533lOrgXKxQUKVpHX8nYhmQETJcXyI0FStbCmBo0xzUT2TcUaR5N
 bfDuUdajB2WFkOYPwAHHbaCH3rZSw2bQGuK8U9c/PJvLZRbAXrDr8yd+2UOcx25dP1J1Z/Fw5Uy
 DrvmaQdGR35A7wIlAkvaYmlkDVu4D2YS82fCVLgOJuIOZT0zi9AyP1UNIVmlKR/WT3lNLY1AxOA
 c=
X-Received: by 2002:a17:906:5857:: with SMTP id
 h23mr22032989ejs.465.1612882335524; 
 Tue, 09 Feb 2021 06:52:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxnZEri6RLCqyJIJnLPm/wgV4KEeFSCkri4avV84ph/v41CgyK2i5cF+/z4p5qQPyfEYe+QTA==
X-Received: by 2002:a17:906:5857:: with SMTP id
 h23mr22032955ejs.465.1612882335165; 
 Tue, 09 Feb 2021 06:52:15 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id bm2sm10658168ejb.87.2021.02.09.06.52.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Feb 2021 06:52:14 -0800 (PST)
Subject: Re: [PATCH v4 resend 00/13] MFD/extcon/ASoC: Rework arizona codec
 jack-detect support
To: Lee Jones <lee.jones@linaro.org>
References: <20210204112502.88362-1-hdegoede@redhat.com>
 <ba9c1add-8ac0-766b-4577-1c2769c0e5e6@redhat.com>
 <20210209141420.GE4766@dell>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <c0b4c612-7f60-5126-4c4d-b7085bd356d0@redhat.com>
Date: Tue, 9 Feb 2021 15:52:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209141420.GE4766@dell>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Mark Brown <broonie@kernel.org>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>
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

On 2/9/21 3:14 PM, Lee Jones wrote:
> On Mon, 08 Feb 2021, Hans de Goede wrote:
> 
>> Hi Mark, Lee,
>>
>> On 2/4/21 12:24 PM, Hans de Goede wrote:
>>> Hi all,
>>>
>>> Here is v4 of my series to rework the arizona codec jack-detect support
>>> to use the snd_soc_jack helpers instead of direct extcon reporting.
>>>
>>> This is a resend with some extra *-by tags collected and with the extcon
>>> folks added to the "To:" list, which I somehow missed with the original
>>> v4 posting, sorry.
>>>
>>> This is done by reworking the extcon driver into an arizona-jackdet
>>> library and then modifying the codec drivers to use that directly,
>>> replacing the old separate extcon child-devices and extcon-driver.
>>>
>>> This brings the arizona-codec jack-detect handling inline with how
>>> all other ASoC codec driver do this. This was developed and tested on
>>> a Lenovo Yoga Tablet 1051L with a WM5102 codec.
>>>
>>> This was also tested by Charles Keepax, one of the Cirrus Codec folks.
>>>
>>> This depends on the previously posted "[PATCH v4 0/5] MFD/ASoC: Add
>>> support for Intel Bay Trail boards with WM5102 codec" series and there
>>> are various interdependencies between the patches in this series.
>>>
>>> Lee Jones, the MFD maintainer has agreed to take this series upstream
>>> through the MFD tree and to provide an immutable branch for the ASoC
>>> and extcon subsystems to merge.
>>>
>>> Mark and extcon-maintainers may we have your ack for merging these
>>> through the MFD tree ?
>>
>> Now that the pre-cursor (1) series to this has been merged, I guess it
>> is time to decide how to merge this series. 
>>
>> Chanwoo Choi has given his ack to merge the extcon bits through the MFD
>> tree and since Mark has expressed a preference for merging ASOC patches
>> directly I guess that it would be best to merge 1-6 through the MFD
>> tree and then Lee can send Mark a pull-req and Mark can apply the others? :
>>
>> 1/13  mfd: arizona: Drop arizona-extcon cells
>> 2/13  extcon: arizona: Fix some issues when HPDET IRQ fires after the jack has been unplugged
>> 3/13  extcon: arizona: Fix various races on driver unbind
>> 4/13  extcon: arizona: Fix flags parameter to the gpiod_get("wlf,micd-pol") call
>> 5/13  extcon: arizona: Always use pm_runtime_get_sync() when we need the device to be awake
>> 6/14  ASoC/extcon: arizona: Move arizona jack code to sound/soc/codecs/arizona-jack.c
>>
>> 1 is:    Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
>> 2-6 are: Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
>>
>> Note patch 6 renames drivers/extcon/extcon-arizona.c to sound/soc/codecs/arizona-jack.c
>> but it does not touch any other files under sound/soc (including NOT touching
>> sound/soc/codecs/Makefile that is done in a later patch). So it cannot cause any
>> conflicts.
>>
>> Mark, would merging 1-6 through the MFD tree, and you applying the rest
>> (which are all ASoC patches) work for you ?
> 
> What a faff.
> 
> I still don't see why they can't all go in and a PR provided.

Well patch 13/13 of this set relies on 5/5 from the previous set which is
only in Mark's ASoC tree and not in the MFD tree, so splitting things over MFD + ASoC
again makes the most sense here too.

The alternative is Mark doing a PR from ASoC to MFD to get 5/5 from the previous set
in MFD first, which seems less then ideal.

Regards,

Hans

