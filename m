Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6E734048E
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 12:26:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB3A116AB;
	Thu, 18 Mar 2021 12:25:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB3A116AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616066776;
	bh=AKETLdla507PtcvV8TkYiQKOWpYQd+7YSFxFj9mGJWU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DbpcwIhNtCl8h5yKqrM/0LhHWGtX4D6DSxqZrrWLej6/i9Qz1jbqgRRt9WuLMWOYC
	 VgbbTIfcvjZfWjFu48P44ZZxCOoVQvUrUcm4GiLa38xZXZGODRkD6Xs5noCRkT4VrW
	 4/LyNnYKIm682Zx5xvw4BEvCkVQZN5vjxyUM2dE0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0588F80171;
	Thu, 18 Mar 2021 12:24:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 864B7F80165; Thu, 18 Mar 2021 12:24:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D44B1F800E0
 for <alsa-devel@alsa-project.org>; Thu, 18 Mar 2021 12:24:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D44B1F800E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="WE5TRI4s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616066676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4iXOrVyMySTuoCrUgKSxCYUTZzujXDxpyIVUUHHpo6E=;
 b=WE5TRI4s/gktKZHXb04J5RoaKmGYvivr30VVilRqS+24y0/ofc+RVii0Qg7q9gus3nGMV2
 BVhjQEpRaNt/VRyhGqg123b9jjEQ7V43hwRtnC3aAWFXqT/WqNY1DA1l6GVpPIHRuXXFER
 HSoFbhu0XHMek3Jh4UAkGDUi2OMOukQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-kJhD-kohOJ-vfY73ZplBaQ-1; Thu, 18 Mar 2021 07:24:34 -0400
X-MC-Unique: kJhD-kohOJ-vfY73ZplBaQ-1
Received: by mail-ed1-f70.google.com with SMTP id a2so20960117edx.0
 for <alsa-devel@alsa-project.org>; Thu, 18 Mar 2021 04:24:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4iXOrVyMySTuoCrUgKSxCYUTZzujXDxpyIVUUHHpo6E=;
 b=Wkv3Ej24jZ21q2frIJWSy9ZdqauEyTc4OL6NBzsobScBrhkobuTrvfxblBTMPXwPh1
 hvu4GQrqQdBQLf5kPlZSmzmJnzv9T71NxZfFMEYlTckXFAQEXPuLQy+A9Fq5pd2Dn6QX
 nVMnF9f/4430gA8DvT2oUDKAUq9paqEV7RXmsMxCUJFMONXjSBcuADfcYWqJp+22x6Wc
 s33paIOQ+7NGRKfuAn6BhkR9BHHs9WVRuj4Tna79wAJlZYGdNiDKPZuC9BQ+b74nSWsl
 bGT61phGjbkHyTkCZdmGYNonuqE44/LqszfyqRjshmgAmPwqXFLDGr6r9jB7ZIGvuQoO
 0JKg==
X-Gm-Message-State: AOAM530Yn1MuLSPdwUV2T6cUPu0yI73uJsvq0NkkEg18LGiYvT52bWea
 U85tqWUQ7ir7eDlarGYJeijzLugylJag2VkzVYCvEXe+1Ev34zdDgmECTE56in1szcy9nJUhDab
 g4+Ch5Y4R9xY3eapaCM7x/clXnf82DvjtBLe0fQsooAspjtXXGmIsa1WTHuYH6ENVBpA2trz09x
 M=
X-Received: by 2002:aa7:df86:: with SMTP id b6mr3017843edy.294.1616066669434; 
 Thu, 18 Mar 2021 04:24:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHuwfa/RMwxwdlj/Z414K7wfajD1biUO6xL/R+rKEsNZIXRlnhQS1xRR229+DDRcUCHGhNEg==
X-Received: by 2002:aa7:df86:: with SMTP id b6mr3017814edy.294.1616066669163; 
 Thu, 18 Mar 2021 04:24:29 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id r17sm1765538edm.89.2021.03.18.04.24.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 04:24:28 -0700 (PDT)
Subject: Re: [PATCH v4 resend 00/13] MFD/extcon/ASoC: Rework arizona codec
 jack-detect support
To: Lee Jones <lee.jones@linaro.org>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20210307151807.35201-1-hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <433cda84-2d61-ccb4-155a-5f8fa1021c90@redhat.com>
Date: Thu, 18 Mar 2021 12:24:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210307151807.35201-1-hdegoede@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: patches@opensource.cirrus.com, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
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

Hi Lee,

On 3/7/21 4:17 PM, Hans de Goede wrote:
> Hi All,
> 
> Here is v4 of my series to rework the arizona codec jack-detect support
> to use the snd_soc_jack helpers instead of direct extcon reporting.
> 
> As discussed before here is a resend rebased on 5.12-rc2, making sure that
> all patches this depends on are in place.
> 
> Lee, can you pick-up patches 1-6 through the MFD tree and then send a
> pull-req to Mark so that Mark can merge the Asoc parts throught the ASoC
> tree ?
> 
> Patches 2-6 touch drivers/extcon, these all have an Ack from Chanwoo Choi
> for merging these through the MFD tree.

Lee, is there a specific reason why these have not been merged yet,
or did you just not get around to these yet ?

As I already mentioned Chanwoo Choi already gave an ack for merging
the extcon patches through MFD, so AFAICT eveything is ready to merge
1-6 through the MFD tree, and then have Mark merge an ib from the
MFD tree and merge the rest.

Regards,

Hans



> 
> Here is some more generic info on this series from the previous
> cover-letter:
> 
> This is done by reworking the extcon driver into an arizona-jackdet
> library and then modifying the codec drivers to use that directly,
> replacing the old separate extcon child-devices and extcon-driver.
> 
> This brings the arizona-codec jack-detect handling inline with how
> all other ASoC codec driver do this. This was developed and tested on
> a Lenovo Yoga Tablet 1051L with a WM5102 codec.
> 
> This was also tested by Charles Keepax, one of the Cirrus Codec folks.
> 
> Regards,
> 
> Hans
> 
> 
> Hans de Goede (13):
>   mfd: arizona: Drop arizona-extcon cells
>   extcon: arizona: Fix some issues when HPDET IRQ fires after the jack
>     has been unplugged
>   extcon: arizona: Fix various races on driver unbind
>   extcon: arizona: Fix flags parameter to the gpiod_get("wlf,micd-pol")
>     call
>   extcon: arizona: Always use pm_runtime_get_sync() when we need the
>     device to be awake
>   ASoC/extcon: arizona: Move arizona jack code to
>     sound/soc/codecs/arizona-jack.c
>   ASoC: arizona-jack: Move jack-detect variables to struct arizona_priv
>   ASoC: arizona-jack: Use arizona->dev for runtime-pm
>   ASoC: arizona-jack: convert into a helper library for codec drivers
>   ASoC: arizona-jack: Use snd_soc_jack to report jack events
>   ASoC: arizona-jack: Cleanup logging
>   ASoC: arizona: Make the wm5102, wm5110, wm8997 and wm8998 drivers use
>     the new jack library
>   ASoC: Intel: bytcr_wm5102: Add jack detect support
> 
>  MAINTAINERS                                   |   3 +-
>  drivers/extcon/Kconfig                        |   8 -
>  drivers/extcon/Makefile                       |   1 -
>  drivers/mfd/arizona-core.c                    |  20 -
>  sound/soc/codecs/Makefile                     |   2 +-
>  .../soc/codecs/arizona-jack.c                 | 577 +++++++-----------
>  sound/soc/codecs/arizona.h                    |  44 ++
>  sound/soc/codecs/wm5102.c                     |  12 +-
>  sound/soc/codecs/wm5110.c                     |  12 +-
>  sound/soc/codecs/wm8997.c                     |  14 +-
>  sound/soc/codecs/wm8998.c                     |   9 +
>  sound/soc/intel/boards/bytcr_wm5102.c         |  28 +-
>  12 files changed, 325 insertions(+), 405 deletions(-)
>  rename drivers/extcon/extcon-arizona.c => sound/soc/codecs/arizona-jack.c (76%)
> 

