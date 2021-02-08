Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE72313E95
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Feb 2021 20:14:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDC91169A;
	Mon,  8 Feb 2021 20:13:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDC91169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612811640;
	bh=ImVR5UUA/v1doEtSCYfm7P+SNUwnZgT6O1tF1kwzmAU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=msKHDC5mFrTCrUL+X1GDqmjt1l4bJ/9LyRPzSjnFMtPvo4lis8G3SV/JDPuta2Z7d
	 99PfqPy6SmD2Z8ssgeWvSmqaL9BRoE7AyPZK7ls0LLzZ1OapbM59eurDZIFtPt5EKf
	 Dx/zvU/v6o2k8QjmKRbzALwTpPRoD3wRQQyvmWmI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1003CF8022D;
	Mon,  8 Feb 2021 20:12:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3C73F8022B; Mon,  8 Feb 2021 20:12:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E008F8013A
 for <alsa-devel@alsa-project.org>; Mon,  8 Feb 2021 20:12:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E008F8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Umvj8aYJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612811542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sTiu3UzG/iGc9IqjW06TnQn3gQrqCGP+HJYPlasxAhM=;
 b=Umvj8aYJIvULvINOls2I9k0T+b/JWAR1b2cB53y45rncFycSNqKFxjs4uKgf+WlnozFblA
 9SwZcKbP/WURNzIUmXkXPTwYKobapq3y8Ew083Ke9pDBBttozLDabe+4U9T/FoWS/U+RNc
 04Sv8ySC9uYorsgnXOnxwCRLs1ZgIi4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-rPBmaqNdO0m9FuR4ZCQ4uQ-1; Mon, 08 Feb 2021 14:12:18 -0500
X-MC-Unique: rPBmaqNdO0m9FuR4ZCQ4uQ-1
Received: by mail-ej1-f70.google.com with SMTP id ar1so9675399ejc.22
 for <alsa-devel@alsa-project.org>; Mon, 08 Feb 2021 11:12:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sTiu3UzG/iGc9IqjW06TnQn3gQrqCGP+HJYPlasxAhM=;
 b=JSgReDgReO99NboQPiGvNuTSIgD8fQMIRbO69nUfA3jkHEqajnq4lXUtU45oulnBtH
 wPMBVngbfEemQFYP9LVvEdpgIPpGAjOX/XI0qPIwexXS0QqXQEsLgCTkKUPVs1VzwzGI
 BQy3C/5+mtyWRFWmkwFF7xLsO6w1G3CC06Rxx1HRwc554i5TqwNP5y7XYxvS29s5AYsr
 9HIV9mNoSybG+Ofw5N0jpk4YzZI4NCu8yMe5ezun5Jzbwe90Y2DHLhXpOmoznmiG8VGH
 kejmlxASc1hdjZYqwTj9ZPbmhKeIhV9bnHk59bbuk0f+PLURbBRsmP/kZbNUCUT5hjbb
 LfGQ==
X-Gm-Message-State: AOAM532owIeHm6v17jd4v3z8Nar7yu436bzSz2SQFOVyX2YJRWdIqNSv
 RtjqfmBqzV8Uz54+vPaZxZAfig/cDwisJw4upGdawgoADwu68vK1w8gwueQRvGySjrAzHMiZCSi
 KJ8/ihh4haFKJCiFKzvKlggk=
X-Received: by 2002:aa7:d808:: with SMTP id v8mr18651977edq.380.1612811537081; 
 Mon, 08 Feb 2021 11:12:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwLtw3J8PubnCu1t850YVdWN9lEvlS4rw9kSNrlLF1jcKCDScRdW0yMp3uB4RjVlOi25gLdKg==
X-Received: by 2002:aa7:d808:: with SMTP id v8mr18651957edq.380.1612811536950; 
 Mon, 08 Feb 2021 11:12:16 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id lc11sm4006899ejc.95.2021.02.08.11.12.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 11:12:16 -0800 (PST)
Subject: Re: (subset) [PATCH v4 0/5] MFD/ASoC: Add support for Intel Bay Trail
 boards with WM5102 codec
To: Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Jie Yang <yang.jie@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20210120214957.140232-1-hdegoede@redhat.com>
 <161280948306.10741.6212553639750410303.b4-ty@kernel.org>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <1d5ca89f-8862-cdb7-838e-350e178915e1@redhat.com>
Date: Mon, 8 Feb 2021 20:12:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <161280948306.10741.6212553639750410303.b4-ty@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

Hi Mark,

On 2/8/21 7:38 PM, Mark Brown wrote:
> On Wed, 20 Jan 2021 22:49:52 +0100, Hans de Goede wrote:
>> Here is v4 of my series to add support for Intel Bay Trail based devices
>> which use a WM5102 codec for audio output/input.
>>
>> This was developed and tested on a Lenovo Yoga Tablet 1051L.
>>
>> The MFD and ASoC parts do not have any build-time dependencies
>> on each other. But the follow-up jack-detect series does have
>> patches depending on each-other and on this series. So IMHO it
>> would be best if this entire series would be merged through the
>> MFD tree to make merging the follow-up series easier.
>>
>> [...]
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> 
> Thanks!
> 
> [4/5] ASoC: Intel: Add DMI quirk table to soc_intel_is_byt_cr()
>       commit: 8ade6d8b02b1ead741bd4f6c42921035caab6560
> [5/5] ASoC: Intel: bytcr_wm5102: Add machine driver for BYT/WM5102
>       commit: 9a87fc1e061900e81ab13d823e85012a78849244

Thank you.

Regards,

Hans

