Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DBC3404E4
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 12:44:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 982E116C1;
	Thu, 18 Mar 2021 12:43:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 982E116C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616067870;
	bh=Ua5vr3cdWYOZqMcEl0xSIJP9sFrP0Dm1YYjzZpGsHcg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GgDEaZofIS1Lc6OPd+uxm5RdjRHTJ2TK5Y27gfl9qhSjsUvJ4wu7XRc5GdWr45YHz
	 kT9ZjRz/++eETz2QSl5XyhuUE1OmUvYeWOjN3RNhKHh48C7tMN8FXUKoRB8guwf9Of
	 CgofKte1Qkx6iwUZMzQzLAjUqNTMJ9PAMBZdb83g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D3E8F8023B;
	Thu, 18 Mar 2021 12:43:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8A66F80224; Thu, 18 Mar 2021 12:43:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51022F80165
 for <alsa-devel@alsa-project.org>; Thu, 18 Mar 2021 12:43:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51022F80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="NUsfxEv4"
Received: by mail-wm1-x333.google.com with SMTP id
 n11-20020a05600c4f8bb029010e5cf86347so6769469wmq.1
 for <alsa-devel@alsa-project.org>; Thu, 18 Mar 2021 04:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=qlh0PLI7gh/qmZ34aTQwcT+xdXL5fD/J8CQcbj7KKrg=;
 b=NUsfxEv4djJ6Ej8xDqOo7zjA3jA6YXbq2HmjCS2XbUrlo8NFP38X1dqdG7q1IMGJit
 zbXI/4JuajopV+n76wfbO75FdAY6CxPom4nD8go0ia0NBjPP3tioicSib8TwY4BzcX+U
 nu56D/6N7nBfrd9CfrFp8YCDQ1UgS5luOCTbX7cCuSJeNczKiIPCMTsHKVEEs94ZwTy+
 mx11kN9vkV67tHtBJ/46m24GCoGiOL2eOGYIr7gRvBb8HZw4X2RxeCQlWYbUD8nvIVIA
 Fj3RPQND/DnVaQeUgurOUQ4+y9VNmsdoEf2TjbBmn591VWhrnf1PSa9INaI0scVjEfcy
 VbKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=qlh0PLI7gh/qmZ34aTQwcT+xdXL5fD/J8CQcbj7KKrg=;
 b=aff3WCELAOwHdMkfLUN/z2CpTndgRndJ3HuazxDTPr+Q4TgyJsZh842VtAiI8xvnLp
 IwibYs4qnLo4u6LPmADmpVvJ2UwmvSo/BRvd9nIiKu+RGEvQKsKipwGlP0BV4EgN+mb6
 soWu2LZE/BYuDgwebpbNmdgEfF74BLLhZy89422x+YcuW3DWY7hSc4Zizop/h+Da58M3
 1kXwaYNxGjNmYm06pTvCSIXzWTfJltxs2Rjsp7xFAU1MfUyhgUgzhWZJrbH8JN91HR90
 Gb2PvLI02fouMyuFtdNWrJ/FHWxchCutHCmFvGj0jKnljrmrARsCE4unJcOTUfdMaER/
 7TZw==
X-Gm-Message-State: AOAM531BFJB8n522J41dQpy9sp5PdNmXvcerQJh1GoJri0YaJVwtSIyU
 nLgHkkZCFrZcdtUgdv10gbWRNA==
X-Google-Smtp-Source: ABdhPJwDsjFbmhs8zkFQ91cXTJVPdBZL/4TzKiQZhgpkFmHLoQ1cwC496vYDK6cJtaio41lVF+8gOQ==
X-Received: by 2002:a1c:5416:: with SMTP id i22mr3247883wmb.146.1616067792719; 
 Thu, 18 Mar 2021 04:43:12 -0700 (PDT)
Received: from dell ([91.110.221.194])
 by smtp.gmail.com with ESMTPSA id u2sm2724691wrp.12.2021.03.18.04.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 04:43:12 -0700 (PDT)
Date: Thu, 18 Mar 2021 11:43:10 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v4 resend 00/13] MFD/extcon/ASoC: Rework arizona codec
 jack-detect support
Message-ID: <20210318114310.GE2916463@dell>
References: <20210307151807.35201-1-hdegoede@redhat.com>
 <433cda84-2d61-ccb4-155a-5f8fa1021c90@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <433cda84-2d61-ccb4-155a-5f8fa1021c90@redhat.com>
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

On Thu, 18 Mar 2021, Hans de Goede wrote:

> Hi Lee,
> 
> On 3/7/21 4:17 PM, Hans de Goede wrote:
> > Hi All,
> > 
> > Here is v4 of my series to rework the arizona codec jack-detect support
> > to use the snd_soc_jack helpers instead of direct extcon reporting.
> > 
> > As discussed before here is a resend rebased on 5.12-rc2, making sure that
> > all patches this depends on are in place.
> > 
> > Lee, can you pick-up patches 1-6 through the MFD tree and then send a
> > pull-req to Mark so that Mark can merge the Asoc parts throught the ASoC
> > tree ?
> > 
> > Patches 2-6 touch drivers/extcon, these all have an Ack from Chanwoo Choi
> > for merging these through the MFD tree.
> 
> Lee, is there a specific reason why these have not been merged yet,
> or did you just not get around to these yet ?
> 
> As I already mentioned Chanwoo Choi already gave an ack for merging
> the extcon patches through MFD, so AFAICT eveything is ready to merge
> 1-6 through the MFD tree, and then have Mark merge an ib from the
> MFD tree and merge the rest.

I can't remember where we left it.

I guess I can take 1-6 (as suggested above) without issue.

Hold tight.

> > Here is some more generic info on this series from the previous
> > cover-letter:
> > 
> > This is done by reworking the extcon driver into an arizona-jackdet
> > library and then modifying the codec drivers to use that directly,
> > replacing the old separate extcon child-devices and extcon-driver.
> > 
> > This brings the arizona-codec jack-detect handling inline with how
> > all other ASoC codec driver do this. This was developed and tested on
> > a Lenovo Yoga Tablet 1051L with a WM5102 codec.
> > 
> > This was also tested by Charles Keepax, one of the Cirrus Codec folks.
> > 
> > Regards,
> > 
> > Hans
> > 
> > 
> > Hans de Goede (13):
> >   mfd: arizona: Drop arizona-extcon cells
> >   extcon: arizona: Fix some issues when HPDET IRQ fires after the jack
> >     has been unplugged
> >   extcon: arizona: Fix various races on driver unbind
> >   extcon: arizona: Fix flags parameter to the gpiod_get("wlf,micd-pol")
> >     call
> >   extcon: arizona: Always use pm_runtime_get_sync() when we need the
> >     device to be awake
> >   ASoC/extcon: arizona: Move arizona jack code to
> >     sound/soc/codecs/arizona-jack.c
> >   ASoC: arizona-jack: Move jack-detect variables to struct arizona_priv
> >   ASoC: arizona-jack: Use arizona->dev for runtime-pm
> >   ASoC: arizona-jack: convert into a helper library for codec drivers
> >   ASoC: arizona-jack: Use snd_soc_jack to report jack events
> >   ASoC: arizona-jack: Cleanup logging
> >   ASoC: arizona: Make the wm5102, wm5110, wm8997 and wm8998 drivers use
> >     the new jack library
> >   ASoC: Intel: bytcr_wm5102: Add jack detect support
> > 
> >  MAINTAINERS                                   |   3 +-
> >  drivers/extcon/Kconfig                        |   8 -
> >  drivers/extcon/Makefile                       |   1 -
> >  drivers/mfd/arizona-core.c                    |  20 -
> >  sound/soc/codecs/Makefile                     |   2 +-
> >  .../soc/codecs/arizona-jack.c                 | 577 +++++++-----------
> >  sound/soc/codecs/arizona.h                    |  44 ++
> >  sound/soc/codecs/wm5102.c                     |  12 +-
> >  sound/soc/codecs/wm5110.c                     |  12 +-
> >  sound/soc/codecs/wm8997.c                     |  14 +-
> >  sound/soc/codecs/wm8998.c                     |   9 +
> >  sound/soc/intel/boards/bytcr_wm5102.c         |  28 +-
> >  12 files changed, 325 insertions(+), 405 deletions(-)
> >  rename drivers/extcon/extcon-arizona.c => sound/soc/codecs/arizona-jack.c (76%)
> > 
> 

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
