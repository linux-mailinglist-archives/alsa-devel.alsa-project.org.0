Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 746FE30F3C5
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 14:20:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F299216E2;
	Thu,  4 Feb 2021 14:19:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F299216E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612444837;
	bh=i9toXj1Xhc6uCDC8Dn/B1pbNUdK1kXQJHPC3ozEiNHY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YRZAal5Wt50+6Q4Vyu/FMwaoqDy++9R65LG749IYuTZmtZnC4FZnRoTX6punFs81G
	 /EofD6ba3KXSsfAWMe+2HOYOfjZ84+411Nna0SMHShytldbydPUoW6CXJ0fML0HaCa
	 IdbEdifoGuKY4Fb/RSeENaCL+eecYtqC6eH2Nexo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A1D8F801F7;
	Thu,  4 Feb 2021 14:19:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 507F0F80171; Thu,  4 Feb 2021 14:19:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72992F80152
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 14:18:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72992F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="hZt00SDo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612444738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+vAM9v4eMZKg6YBIf04QqVg9hAruxcJZ81FnwmCn3uw=;
 b=hZt00SDoSrBnPrrcB9qTeiFazK6yG6FCYMT9mlksjhiPmviXsj2fL0XRl1EJZ776pU2/S2
 i7JxYtrJl594HTrxWMQCxdqW/Qr8+2Qi9aCBuE6QTeD2iTUwnEOqx86Bhgg1a7raRKS4Tz
 6lHjnisM2SHckZPy6iN+NVf5ObTFMno=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-a-fBWxIuM_iZj7wVbvjHyA-1; Thu, 04 Feb 2021 08:18:57 -0500
X-MC-Unique: a-fBWxIuM_iZj7wVbvjHyA-1
Received: by mail-ej1-f69.google.com with SMTP id n25so2542936ejd.5
 for <alsa-devel@alsa-project.org>; Thu, 04 Feb 2021 05:18:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+vAM9v4eMZKg6YBIf04QqVg9hAruxcJZ81FnwmCn3uw=;
 b=RQZT3FbVLGUCuGo2Bm4ILTCFtE6HDtenomiiUBSVk1sRFFysdj6h/XmsfMSpaqCwQ8
 BHEBjWwFmU6du0MxuyfMHJZkUEPRYTNt2Cz0jsP8V7aQW7vhAeY7VwI4JoBfOA+KMCs2
 GbEEr1yb5NqQiMKoQbfJIoimafJd+e2dAaPPr0SgvXN2qdZlGUq9bhpsE2HRquahYLK1
 I9vYSxrfwjWUDiCiNguCzIfY/JDTjjcXcXMCGImkyotYJCn1p+38ELdXd13dgCVp6HIx
 HAxuzJVkHnT99xdc+I1oF9hEfOPVZ4X6VLLOMzEa6fz/pdmes5hAF7aJrF5ovK9q/JlL
 AIxQ==
X-Gm-Message-State: AOAM533EXuR26EczPdQJgVRqwBjaa/MfDPu1nQ7pJBIebs8ohl9DnS1H
 bx362RR2zuhCeLQYxcbeiRnb4R/pecfBYeK+YG7otB+VG7jRVj8fd1vosutUNpWrvsxol2qcBXl
 3pAkQTyf4wS4YZ6i0AfqkpPSDWkm1R5IEaWS+Z4kHgmsiHSH1n7D8dO7J6fO0l28Q4PNJq4Lpk4
 A=
X-Received: by 2002:a50:b5c5:: with SMTP id a63mr7829391ede.227.1612444735712; 
 Thu, 04 Feb 2021 05:18:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy2epJQrWbJJX+FnAr7MKarJjT9f2YzxU/r4xM9FHyMjplb+G8hEPNok/ANUNzd9X3viV9Qzg==
X-Received: by 2002:a50:b5c5:: with SMTP id a63mr7829370ede.227.1612444735537; 
 Thu, 04 Feb 2021 05:18:55 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
 by smtp.gmail.com with ESMTPSA id r4sm2445330edv.27.2021.02.04.05.18.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 05:18:55 -0800 (PST)
Subject: Re: [PATCH v4 0/5] MFD/ASoC: Add support for Intel Bay Trail boards
 with WM5102 codec
To: Mark Brown <broonie@kernel.org>
References: <20210120214957.140232-1-hdegoede@redhat.com>
 <249f1a7c-048e-d255-d860-68a97a0092c8@redhat.com>
 <20210204105748.GD2789116@dell>
 <7f53dede-946e-c38e-e871-3df1119f1faf@redhat.com>
 <20210204124335.GA4288@sirena.org.uk>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <e646cd26-f61c-8414-c3ae-15fb5d5cc21d@redhat.com>
Date: Thu, 4 Feb 2021 14:18:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210204124335.GA4288@sirena.org.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Lee Jones <lee.jones@linaro.org>
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

On 2/4/21 1:43 PM, Mark Brown wrote:
> On Thu, Feb 04, 2021 at 12:07:49PM +0100, Hans de Goede wrote:
>> On 2/4/21 11:57 AM, Lee Jones wrote:
>>> On Thu, 04 Feb 2021, Hans de Goede wrote:
> 
>>>> series are both ready for merging. All patches have Reviewed-by and/or
>>>> Acked-by tags now.
> 
>>> I don't think they do.  You're missing ASoC and Extcon Acks.
> 
>> Right, what I meant is that the patches have been reviewed by other
>> stake-holders, including the follow-up series being tested by the cirrus
>> codec folks (thank you Charles).
> 
>> But yes the actual subsys maintainers have not acked these yet;
>> and I'm aware that you will need those for merging this through
>> the MFD tree.
> 
> The usual pattern here is that the MFD patches get merged and then I
> pull a shared branch in for any dependencies - at this point the series
> is now on the backlog of serieses where I'm waiting for the MFD to sort
> itself out before I really look at it again.

I understand. But this series is somewhat special, if you also take
the follow-up series into account:

"[PATCH v4 resend 00/13] MFD/extcon/ASoC: Rework arizona codec jack-detect support"

That again has some MFD bits, and some extcon patches and ASoC patches
which depend on the extcon bits and this series.

So it is really hard to merge all the bits through there separate trees
and just merging it all through one tree and then pulling in the end-result
as a shared branch would IMHO be easier.

In the follow-up series one of the patches is moving the jackdet code from the
extcon dir to sound/asoc/codecs. So that is a single commit touching 2 trees ...

Regards,

Hans

