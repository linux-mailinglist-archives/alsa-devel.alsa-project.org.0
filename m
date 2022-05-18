Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C42952C83D
	for <lists+alsa-devel@lfdr.de>; Thu, 19 May 2022 01:57:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0745815CA;
	Thu, 19 May 2022 01:56:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0745815CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652918269;
	bh=sNQwva/aXkdFD+u+E7b8HUsDg4bZy7nmgt8SJwlBxbg=;
	h=Date:Subject:To:References:In-Reply-To:From:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QXCRs9VWidl4LbcnE1hjLSC++Ydn77dC/vXIyF/HEVlI2q3a/Zd4rqERgPjD9k5Ld
	 EUjsLd1e37JZBejpsnuy9tX6Um/BVrIeRLzI2Rm/q3cjgZI0fsMvrBSy4Dmrk+e8Y2
	 o8gxIFxL7eqrmdaaN8dZXhd+0ndqbWPSCsNZqgv4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64F50F80279;
	Thu, 19 May 2022 01:56:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33AE5F8023B; Thu, 19 May 2022 01:56:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BFA3F80109
 for <alsa-devel@alsa-project.org>; Thu, 19 May 2022 01:56:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BFA3F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Xhcvf84C"
Received: by mail-ed1-x534.google.com with SMTP id n23so5065928edy.0
 for <alsa-devel@alsa-project.org>; Wed, 18 May 2022 16:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:in-reply-to:from:cc:content-transfer-encoding;
 bh=nV7vbEcI/XlaN5+VOLvyZmnBK7oHA+94fUbYDalX+ow=;
 b=Xhcvf84CjweMLL5bEmvyJQalKl6YNdbwCMuVsD/bwVXG5FP2PzcaN2o8tkB/sKDHrv
 4z4mpmrbKrzjiNLpGpza9k2LDVwkk/8zYta5/n1Be8fz/VlOLtmMZC6NySl3GJljcBFB
 aHrJQeJvRBk91wBRVLZu3yKLY5iNSy5HUYecn44ilT5uykd+reZruSMYc3rxYgxKc1v8
 ocbGHugiii15/UT2buIDBBkN9RfEEvhIZs0hIw5XRwOy0b/QF5SqNGF07hjgVOVUosDU
 OhyQdUWR9reEQo0RzucxZhgHF7A79mYIxgA3ZHPWnWCEdaWLoO8ShNQopdi/s87+UEMJ
 i9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:in-reply-to:from:cc
 :content-transfer-encoding;
 bh=nV7vbEcI/XlaN5+VOLvyZmnBK7oHA+94fUbYDalX+ow=;
 b=Lqjit0jaosq712JvFQebHsIfzBUPyPugjdbayerEJfECtVcSuZXxAGBhNzAWZYr+Ag
 Jt+aXpk3FjGf2H8a2flWeJXPWJJJcBOtcclhXgAPMaw4QPbx2LBlyKcLs1fp2Lyma1sH
 2FfHr+iRCW9/rYLPiZExhDjv7d1K/l4tthn4HgUhNZaFzj+bSa+cRSvQwderpzyzRnwp
 TExi01+rDb/xBRcivTnhB6J6e/Oy85lPVdfUwH4DbKfj7Izi6aDrctdXBZSACtIIXWY7
 MCUtjKZIRbfR/wf+3MRsoARY4I7KQ9+k5kjbfqdDE0sLYPDzeL1eQ2bAsJIciXdGf+Fz
 9aPg==
X-Gm-Message-State: AOAM5336S3XzrEj1RYNtbPqdQLCOJ/FBCU29cmFACZEneAa0qsaFpcEF
 jB73hqXYLP7pdLdPyXH3W4w=
X-Google-Smtp-Source: ABdhPJwRaIq1zP7CRaqPrY9231XvaBM0upXxl8n1QRhbOu8FEjEcHM1JzbgIIGJHKlevgoGNXPd8QQ==
X-Received: by 2002:a05:6402:26ca:b0:427:c181:b0ed with SMTP id
 x10-20020a05640226ca00b00427c181b0edmr2396526edd.400.1652918198706; 
 Wed, 18 May 2022 16:56:38 -0700 (PDT)
Received: from [192.168.1.110] ([178.233.88.73])
 by smtp.gmail.com with ESMTPSA id
 s27-20020a170906221b00b006f3ef214e73sm1474465ejs.217.2022.05.18.16.56.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 16:56:38 -0700 (PDT)
Message-ID: <5a0e9339-5bdc-3e05-08f4-9137ebeb5ce5@gmail.com>
Date: Thu, 19 May 2022 02:56:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] ASoC: ops: Fix the bounds checking in
 snd_soc_put_volsw_sx and snd_soc_put_xr_sx
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <fde0dc8a-a861-3c8e-1316-cfa81affc19e@gmail.com>
 <YoThkxU9Q2cDrq4v@sirena.org.uk>
In-Reply-To: <YoThkxU9Q2cDrq4v@sirena.org.uk>
From: =?UTF-8?Q?Tan_Nay=c4=b1r?= <tannayir@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Marek Vasut <marex@denx.de>, alsa-devel@alsa-project.org,
 stable@vger.kernel.org
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

For a control defined like this:
-- SOC_SINGLE_S8_TLV("IIR0 INP0 Volume", 
WCD934X_CDC_SIDETONE_IIR0_IIR_GAIN_B1_CTL, -84, 40, digital_gain) --
This is what the snd_soc_info_volsw_sx reports:
$mc->platform_max:40, $mc->max:40, $mc->min:-84,
$uinfo->value.integer.max:40, $uinfo->value.integer.min:0

Now this is obviously wrong which is another issue which I'll explain a 
bit later
but the mixer control($mc) limits are exactly the same inside
the snd_soc_put_volsw_sx function.
So the min and max fields inside the $mc are the same in 
snd_soc_put_volsw_sx
so this means that the code without my patch has an incorrect check.

Here's an example, this is the check before the patch:
-- if (mc->platform_max && val > mc->platform_max) --
Let's say the userspace passes 50 as $val which should be within the 
range of
0 to 124 so it is a valid value.
The check is done before the val is re-scaled, so it checks whether the val
is bigger than 40 which is the value of platform_max at that point.

Is the $mc->platform_max supposed to be set to the number of steps
as opposed to the maximum value?

Back to the first issue that I've mentioned in this message, the 
snd_soc_info_volsw_sx
reports the wrong value because it adds the $mc->min to the value which 
not necessary.
Curiously enough, there are actually two commits from 6 years ago
on the Qualcomm's fork of Linux that fix this one.
Neither of these commits exist on the upstream Linux kernel at the 
moment. I've linked them below.

For the sake of integrity, all of the values that I've gathered from 
debugging
were the same before and after applying these patches.
What I mean by that is that the only thing that changes when the patches 
below are applied
is that the snd_soc_info_volsw_sx reports the correct range to the userspace
which should be 0 to 124.
Also the snd_soc_put_volsw_sx still checks the value from userspace
which has a range of 0 to 124 against the maximum of the signed range
which is from -84 to 40 regardless of the patches below.

65c7d020fbee8 ("ASoC: Update the Max value of integer controls.")
https://git.codelinaro.org/clo/la/kernel/msm-4.9/-/commit/65c7d020fbee8070f33072291c32eef7584a56d4

0d873de90eb16 ("ASoC: sound: soc: fix incorrect max value")
https://git.codelinaro.org/clo/la/kernel/msm-4.9/-/commit/0d873de90eb16e3af499eb87da1ed14440b788d5

