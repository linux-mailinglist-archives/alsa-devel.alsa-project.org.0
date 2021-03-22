Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B071234484D
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Mar 2021 15:56:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1110E1607;
	Mon, 22 Mar 2021 15:55:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1110E1607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616424994;
	bh=f0LhVGAjziPUWgYfdUYTXO86Awg7VC+S6hQ0Aum1IR4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zk3ff0QknCmj+9Is8HiRWw3FGscbzy7pMzbt/hKGCPj+Tjn5EfdbmE4RCQ4IH7ULW
	 AP+SOgKxcS6dlWi5KvmWLu0wQ6G74mNPJNQ4f7W4t+041duf/4TQzE11IoVG++/uQa
	 p2Hfz2SsYsV/oKZFv7zVP3ApYkV9amnL5cZKQwCk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84EF8F801D5;
	Mon, 22 Mar 2021 15:55:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81E73F8016B; Mon, 22 Mar 2021 15:55:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D214AF80107
 for <alsa-devel@alsa-project.org>; Mon, 22 Mar 2021 15:55:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D214AF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="WlKWfvY0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616424901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m6iQUjQycK1sTABfq5tlKr+irKk0x/vcI8pphi4WOdU=;
 b=WlKWfvY0HFyuf3zCHNejAfCY/2Y94+Q9BpqtD/yXi8hVHgC1TfCzZ8f6+ch8SUb9qS8FH6
 iPmASY9RThFvdSN+syCvrJx/1B7OtFCFr8AZ+VuYCmfh+jOqvVJgzDMmG8v262+VHwD6i1
 lU+ybE9PIZ7YddM/zblETLRLePvPS/4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-CCb6vbTUOtOWf5kS6bkckA-1; Mon, 22 Mar 2021 10:54:58 -0400
X-MC-Unique: CCb6vbTUOtOWf5kS6bkckA-1
Received: by mail-ed1-f69.google.com with SMTP id h5so27604161edf.17
 for <alsa-devel@alsa-project.org>; Mon, 22 Mar 2021 07:54:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m6iQUjQycK1sTABfq5tlKr+irKk0x/vcI8pphi4WOdU=;
 b=OX9LIl6yW0JafJwmgDjsDL+HfOmC4+jP7i3KH9UO7hyGsan5etgIEAO0VtdaEKp8es
 rIvblzw67Yw6KBq8Hao2OKPrU6t+HXQ0y6+Cf41pA3uYDVMyKgt88aiUi4lHGoPQ9Kl/
 44IqVS/3T5rmhmq6MX2GuZSn8Mj4ryOLjWT3ztxIYiQw+b336XbnSA586BEy7VbINM75
 NlbU0UVu2YG5i6jp5DP/86a304W1Mf9BCGLwEGMmGr77mrkNBWxcDTgawzQVVwdZ70Sy
 UeO2gp4K4b0lMaxHxn5d68XGZC7yxDrY/UT3ll6mhk0NXDCfRHot4WDpkcD6cPg92mPE
 u++Q==
X-Gm-Message-State: AOAM5334yrgJD9Nf1wuw9EoyRTbed7Ez5PQD5yzf9Kg+PldAA8NyVeUa
 Ox6vLxzEx3XBYtRpmiFB07WJnWj9lnkMlS+nPBcyw2E+KKOMxsAEJnEM1zZO1v3IUi0XSm7ike3
 ZnDbJLUirm/IH4OStZyKFbZzvTXSqEoUAkqPAFl4Ofny5/gURf01zVR4nrXTUjmwbjbM4Dj/xAL
 s=
X-Received: by 2002:a17:906:1a4b:: with SMTP id
 j11mr135870ejf.55.1616424897046; 
 Mon, 22 Mar 2021 07:54:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFJgvoAB5IhBaexAdxZrh2Nx4yd/dRDvJg0PcoQDjNPJcStUY7NDLa0ZRc5dFHgvEe3T69wA==
X-Received: by 2002:a17:906:1a4b:: with SMTP id
 j11mr135842ejf.55.1616424896822; 
 Mon, 22 Mar 2021 07:54:56 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id cy5sm11549738edb.46.2021.03.22.07.54.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 07:54:56 -0700 (PDT)
Subject: Re: [GIT PULL] Immutable branch between MFD and Extcon due for the
 v5.13 merge window
To: Lee Jones <lee.jones@linaro.org>
References: <20210307151807.35201-1-hdegoede@redhat.com>
 <20210322144025.GW2916463@dell>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <83f9ff3c-ab92-cabf-6746-19b15c3f7661@redhat.com>
Date: Mon, 22 Mar 2021 15:54:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210322144025.GW2916463@dell>
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
 Liam Girdwood <lgirdwood@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, linux-kernel@vger.kernel.org
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

On 3/22/21 3:40 PM, Lee Jones wrote:
> Enjoy!
> 
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-extcon-v5.13
> 
> for you to fetch changes up to a908a716696eee75bf85199cde2b0989290536d1:
> 
>   ASoC/extcon: arizona: Move arizona jack code to sound/soc/codecs/arizona-jack.c (2021-03-18 11:46:15 +0000)

Thank you.

Mark can you merge this into your ASoC tree and merge patches 7-13 of:
https://lore.kernel.org/alsa-devel/20210307151807.35201-1-hdegoede@redhat.com/

?

Regards,

Hans





> 
> ----------------------------------------------------------------
> Immutable branch between MFD and Extcon due for the v5.13 merge window
> 
> ----------------------------------------------------------------
> Hans de Goede (6):
>       mfd: arizona: Drop arizona-extcon cells
>       extcon: arizona: Fix some issues when HPDET IRQ fires after the jack has been unplugged
>       extcon: arizona: Fix various races on driver unbind
>       extcon: arizona: Fix flags parameter to the gpiod_get("wlf,micd-pol") call
>       extcon: arizona: Always use pm_runtime_get_sync() when we need the device to be awake
>       ASoC/extcon: arizona: Move arizona jack code to sound/soc/codecs/arizona-jack.c
> 
>  MAINTAINERS                                        |  3 +-
>  drivers/extcon/Kconfig                             |  8 ---
>  drivers/extcon/Makefile                            |  1 -
>  drivers/mfd/arizona-core.c                         | 20 -------
>  .../soc/codecs/arizona-jack.c                      | 63 +++++++++++-----------
>  5 files changed, 34 insertions(+), 61 deletions(-)
>  rename drivers/extcon/extcon-arizona.c => sound/soc/codecs/arizona-jack.c (98%)
> 

