Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AF12F9C56
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jan 2021 11:30:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91E0517D2;
	Mon, 18 Jan 2021 11:29:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91E0517D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610965819;
	bh=sFzbU1WxECcKCOdA6lc9poOlSWFpN3mLKj9jVdS6TWg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kCy3yazr4dXFo9jqdD84nJPT4+qFijovzAwDoH69B7S+4OE0NRPEu9V0NDuSJAXYh
	 CgshXxNTTJiLInPip0tjfR6XoSxNma9SwI+KTuIlGeUdmR/gYn95Vi9qadxBbPhrFk
	 jbCCLBXOehFO7PwuVu7OTaWaYL1Y5s5Or5KhBUfE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3641F8019D;
	Mon, 18 Jan 2021 11:28:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 822E3F8016E; Mon, 18 Jan 2021 11:28:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4946BF800C0
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 11:28:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4946BF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="FsL5gumO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610965698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DcioXB/UdMlsYBZivaxmZD1my4PTiLM/bF+IXbZJzro=;
 b=FsL5gumOhSkxDO+RDPW/x0dmd71MOu7RapSvzD3IEdmX7abND5KDK6MO82ZywEKID1UUaj
 o6cCcARf6ebf5Nnfav91NTS/SERgNomiRmv70bX3JMUTDA/1v4PGFMmiW2P0hHRKRw2v4V
 Gcx2VP/0T0lrZ/Aost569T/RvO0wMxo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-JASEXZXjNYysk0CuCnVaAg-1; Mon, 18 Jan 2021 05:28:12 -0500
X-MC-Unique: JASEXZXjNYysk0CuCnVaAg-1
Received: by mail-ej1-f69.google.com with SMTP id jg11so4435734ejc.23
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 02:28:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DcioXB/UdMlsYBZivaxmZD1my4PTiLM/bF+IXbZJzro=;
 b=rEdai5QXg5kcm/eryFMyl97iB9muxkENkek1xOmoyqXVAeFLSPdua/7B3Ac0+OJdAm
 FBvZ7LImbmMu9dHQdVVaDfi8Zuv0LM9VGzxih/xsrflo1yjfj2EUpPwmzjnV0TsMcftp
 wWSAeucdR/0LBu/Al3T65Wo6VaBuOtrTm+czsg1/LreZ+1A2DJ+r6zwWzXDPZSb5Ai28
 6ZuhK1Vyb/afYMpTg1ovzVnp2G9qM6NKRsagLQfJ2NKF5zP5W6WUfOvHG5lgr4Bf8Oi5
 LBx5t12/7/6wouQIGk9eUqxuSaK3KLtn1QrKv8ylbzMWk9KKprb8EGRmqIZ9O1/uWQLS
 rG2w==
X-Gm-Message-State: AOAM530I1m2LqeqWFmnnd1BmQfMgYIuSy5Q9LkKVJIytvDJDMRqmX/3c
 SzqWa0xA3QTPHtbTF1gcr8HGSzIXbbVjaEm/yB+NbUWxHLWqmBtR+K4RIHhydmDOyhmRo5R3c/j
 oCTdLBsS5mrKZUaGjmHPQ+7bArUVtYDCeDtfYxTKYaQm3W1Wr67ulT0KlymImmAwXHgme6TqVHQ
 4=
X-Received: by 2002:a05:6402:30ac:: with SMTP id
 df12mr19641491edb.175.1610965691401; 
 Mon, 18 Jan 2021 02:28:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKjZRu6y7Eez6K9LchcmhzoZWqgCU36cr2SlmBxQJtlWrydRl+v98Thet1XSfWUW/hCuozkQ==
X-Received: by 2002:a05:6402:30ac:: with SMTP id
 df12mr19641475edb.175.1610965691206; 
 Mon, 18 Jan 2021 02:28:11 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
 by smtp.gmail.com with ESMTPSA id q9sm5667939ejd.113.2021.01.18.02.28.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 02:28:10 -0800 (PST)
Subject: Re: [PATCH v2 00/12] MFD/extcon/ASoC: Rework arizona codec
 jack-detect support
To: Lee Jones <lee.jones@linaro.org>
References: <20210117160555.78376-1-hdegoede@redhat.com>
 <20210118095509.GA4903@dell>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <8905f9f2-1c1c-1b64-d70d-374f84568ccb@redhat.com>
Date: Mon, 18 Jan 2021 11:28:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210118095509.GA4903@dell>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>
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

On 1/18/21 10:55 AM, Lee Jones wrote:
> On Sun, 17 Jan 2021, Hans de Goede wrote:
> 
>> Hi All,
>>
>> This series reworks the arizona codec jack-detect support to use
>> the snd_soc_jack helpers instead of direct extcon reporting.
>>
>> This is done by reworking the extcon driver into an arizona-jackdet
>> library and then modifying the codec drivers to use that directly,
>> replacing the old separate extcon child-devices and extcon-driver.
>>
>> This brings the arizona-codec jack-detect handling inline with how
>> all other ASoC codec driver do this.
>>
>> This was developed and tested on a Lenovo Yoga Tablet 1051L with
>> a WM5102 codec.
>>
>> The MFD, ASoC and extcon parts can be merged independent from each-other
>> although that could lead to a case where both the extcon driver and
>> the new arizona-jackdet library will try to do jack-detection. If we
>> end up with a git tree in that state then one of the 2 will fail to
>> load because the other will already have claimed the IRQs, so this
>> is not a problem really.
>>
>> Or the entire series could be merged through the MFD tree if people
>> prefer that.
>>
>> Note that this series also paves the way for some further cleanups,
>> removing some jackdetect related variables like hp_ena and hp_clamp
>> from the arizona data struct shared between all the MFD child devices.
>> I've deliberately not done that cleanup as part of this patch-series,
>> since IMHO the series is big enough as is. These cleanups can be done
>> in a follow-up series once this series has landed.
> 
> Would you mind using `git format-patch` to create your cover-letters
> in the future please?  This one is missing useful information such as
> the diff-stat and patch list.

I never heard about that git feature until today, so I learn something
new every day :)

I just tested it and it seems useful. I will try to use it next time.

Regards,

Hans

