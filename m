Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BE13153F8
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Feb 2021 17:36:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 271B716BE;
	Tue,  9 Feb 2021 17:35:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 271B716BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612888598;
	bh=HrlpBTNUJ+bAbhbEPzkneXZTpnxnsEiSlUGwYo++Zzw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jO6QodOy09yl8wSqBc2UP3BJEE09c+KyickSBe8pO3gIyiKUNSV3/9HgBjeKJ7NOm
	 FPMvVu+okW/GZ/dv7YEbAdm3N6vAJRwLrakzXRB1CVEzW5ccB5JWPTBCBI0a1UWXHR
	 eeMnpukDzELkBcQPeObLO0Z1Vs+qAD9lcPpzOMYU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68536F801EB;
	Tue,  9 Feb 2021 17:35:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60502F801D5; Tue,  9 Feb 2021 17:35:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6126F80165
 for <alsa-devel@alsa-project.org>; Tue,  9 Feb 2021 17:34:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6126F80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="bPHim6+C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612888494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WE5mpi7ygmfeed8LxkrTimbUCAkDMTPfX6TbCxa66yE=;
 b=bPHim6+C5yoPrMKtu4Cjo7257R0AFgN33kHw6+7TfbcjOcS836Li6oi+ONbS3JpUS0JbnE
 iiUrklzYc0ZRjVz2QPUy31NyxtfCFEQVHgaeGZa0yykaRruEoYBhmBwl68vNN0brJbNbj4
 dNsOKHipjCgOwEWd7HKsew/JnHxCK6M=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-JJhOpK6nOfqHjweIbpJ0HQ-1; Tue, 09 Feb 2021 11:34:52 -0500
X-MC-Unique: JJhOpK6nOfqHjweIbpJ0HQ-1
Received: by mail-ej1-f72.google.com with SMTP id yc4so16141903ejb.2
 for <alsa-devel@alsa-project.org>; Tue, 09 Feb 2021 08:34:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WE5mpi7ygmfeed8LxkrTimbUCAkDMTPfX6TbCxa66yE=;
 b=IBwpG+hYhGdXlZajh20p7TySQpE+BnH2y9XV0VRgZSVDsc6EBLONjkR8p/LRh7YSh6
 Kp4QrQbEiQs/tmEB09Lbvq7IH7INTRs8p9kZBeq8eDZOfyeJrHh4fDqhklzuZU1rdXYQ
 MWW25Ungbnrtb7QqchjR1zR315BqGWelS5hq6MDQOJTcTWgj5S/lq/oU4aZKg4bG494y
 fD7dsxDO/qz/nnn9PrI2aI8a1RfdOKT9ytHh5pcvqIkxZMUW2BFFZcgmXvn48emQq7y7
 nnrGNLlRDX9pCRa0+L2S6P/WHhIAJUUNDfL3QwJ3WE55A2D13nnhSKYsBKi6WRM2lSGv
 HwcQ==
X-Gm-Message-State: AOAM5333H5gHLdL02hBw7Z7APeWR2uzE5l9na2JPHSJyWEobuqbUe3DI
 XQv7O2uLghUViiei/0AtNt/MKBxxdg7SRI0s9LI0qYM24lrOaUEhTCS7sLZowYkU42cvXQYJLQk
 TcllXl8v4rmB1XX+3XkyJxPvBzDGEeORHGFIdcrwneKEMYZ0qwL+QV2J6h2yBd0mDqot7fj3pSj
 Y=
X-Received: by 2002:a17:906:2495:: with SMTP id
 e21mr23111122ejb.280.1612888489596; 
 Tue, 09 Feb 2021 08:34:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwXQ2QXB9+9Mhzc58vdMVhJmHOiv2EQfnoI6xpqFh6KzkipbxXAk7ZgiV4CUMW+PsiRlSPbXg==
X-Received: by 2002:a17:906:2495:: with SMTP id
 e21mr23110989ejb.280.1612888488386; 
 Tue, 09 Feb 2021 08:34:48 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id d3sm4215537edk.82.2021.02.09.08.34.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Feb 2021 08:34:47 -0800 (PST)
Subject: Re: [PATCH v4 resend 00/13] MFD/extcon/ASoC: Rework arizona codec
 jack-detect support
To: Lee Jones <lee.jones@linaro.org>
References: <20210204112502.88362-1-hdegoede@redhat.com>
 <ba9c1add-8ac0-766b-4577-1c2769c0e5e6@redhat.com>
 <20210209141420.GE4766@dell>
 <c0b4c612-7f60-5126-4c4d-b7085bd356d0@redhat.com>
 <20210209154511.GC220368@dell>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <80068116-eb04-fd75-f656-804ab9f5d414@redhat.com>
Date: Tue, 9 Feb 2021 17:34:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209154511.GC220368@dell>
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

On 2/9/21 4:45 PM, Lee Jones wrote:
> On Tue, 09 Feb 2021, Hans de Goede wrote:
> 
>> Hi,
>>
>> On 2/9/21 3:14 PM, Lee Jones wrote:
>>> On Mon, 08 Feb 2021, Hans de Goede wrote:
>>>
>>>> Hi Mark, Lee,
>>>>
>>>> On 2/4/21 12:24 PM, Hans de Goede wrote:
>>>>> Hi all,
>>>>>
>>>>> Here is v4 of my series to rework the arizona codec jack-detect support
>>>>> to use the snd_soc_jack helpers instead of direct extcon reporting.
>>>>>
>>>>> This is a resend with some extra *-by tags collected and with the extcon
>>>>> folks added to the "To:" list, which I somehow missed with the original
>>>>> v4 posting, sorry.
>>>>>
>>>>> This is done by reworking the extcon driver into an arizona-jackdet
>>>>> library and then modifying the codec drivers to use that directly,
>>>>> replacing the old separate extcon child-devices and extcon-driver.
>>>>>
>>>>> This brings the arizona-codec jack-detect handling inline with how
>>>>> all other ASoC codec driver do this. This was developed and tested on
>>>>> a Lenovo Yoga Tablet 1051L with a WM5102 codec.
>>>>>
>>>>> This was also tested by Charles Keepax, one of the Cirrus Codec folks.
>>>>>
>>>>> This depends on the previously posted "[PATCH v4 0/5] MFD/ASoC: Add
>>>>> support for Intel Bay Trail boards with WM5102 codec" series and there
>>>>> are various interdependencies between the patches in this series.
>>>>>
>>>>> Lee Jones, the MFD maintainer has agreed to take this series upstream
>>>>> through the MFD tree and to provide an immutable branch for the ASoC
>>>>> and extcon subsystems to merge.
>>>>>
>>>>> Mark and extcon-maintainers may we have your ack for merging these
>>>>> through the MFD tree ?
>>>>
>>>> Now that the pre-cursor (1) series to this has been merged, I guess it
>>>> is time to decide how to merge this series. 
>>>>
>>>> Chanwoo Choi has given his ack to merge the extcon bits through the MFD
>>>> tree and since Mark has expressed a preference for merging ASOC patches
>>>> directly I guess that it would be best to merge 1-6 through the MFD
>>>> tree and then Lee can send Mark a pull-req and Mark can apply the others? :
>>>>
>>>> 1/13  mfd: arizona: Drop arizona-extcon cells
>>>> 2/13  extcon: arizona: Fix some issues when HPDET IRQ fires after the jack has been unplugged
>>>> 3/13  extcon: arizona: Fix various races on driver unbind
>>>> 4/13  extcon: arizona: Fix flags parameter to the gpiod_get("wlf,micd-pol") call
>>>> 5/13  extcon: arizona: Always use pm_runtime_get_sync() when we need the device to be awake
>>>> 6/14  ASoC/extcon: arizona: Move arizona jack code to sound/soc/codecs/arizona-jack.c
>>>>
>>>> 1 is:    Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
>>>> 2-6 are: Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
>>>>
>>>> Note patch 6 renames drivers/extcon/extcon-arizona.c to sound/soc/codecs/arizona-jack.c
>>>> but it does not touch any other files under sound/soc (including NOT touching
>>>> sound/soc/codecs/Makefile that is done in a later patch). So it cannot cause any
>>>> conflicts.
>>>>
>>>> Mark, would merging 1-6 through the MFD tree, and you applying the rest
>>>> (which are all ASoC patches) work for you ?
>>>
>>> What a faff.
>>>
>>> I still don't see why they can't all go in and a PR provided.
>>
>> Well patch 13/13 of this set relies on 5/5 from the previous set which is
>> only in Mark's ASoC tree and not in the MFD tree, so splitting things over MFD + ASoC
>> again makes the most sense here too.
> 
> Right, this is what can happen when patch-sets are split up.
> 
>> The alternative is Mark doing a PR from ASoC to MFD to get 5/5 from the previous set
>> in MFD first, which seems less then ideal.
> 
> Well this set isn't likely to go in this cycle anyway, so actually the
> problem should just go away.

That is true.

> Best to let the first set get sucked
> into v5.12, then send this one up subsequently for v5.13.

Ack. So should I resend this once 5.12-rc1 is out ?

Regards,

Hans

