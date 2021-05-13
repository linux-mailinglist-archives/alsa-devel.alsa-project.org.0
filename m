Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7556337FEA7
	for <lists+alsa-devel@lfdr.de>; Thu, 13 May 2021 22:13:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDF5417C6;
	Thu, 13 May 2021 22:12:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDF5417C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620936780;
	bh=A7atH/PMaIY77sSfiUqkXbDo9jPxGl6nwM/jWncx7jo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DaHQJa53czKgbNF49J5clycF2Fnzc7cua4Vj+GaMG/rmkGIIsvbPd2q/U3SAmwwy6
	 nB5JHauyCquooxn7KUSpBRi1taKIydjAzp7Cu1wd9Zl/7Xe+5TRTPAAMNgCMm6rTv5
	 GWzP3ERUh+B4IMtSyuoy8epDXBsLk7YPRcq7S1Sw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CE28F800E3;
	Thu, 13 May 2021 22:11:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21CD0F80163; Thu, 13 May 2021 22:11:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAABFF8012E
 for <alsa-devel@alsa-project.org>; Thu, 13 May 2021 22:11:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAABFF8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="GIwGyzP5"
Received: by mail-wr1-x42a.google.com with SMTP id d11so28005941wrw.8
 for <alsa-devel@alsa-project.org>; Thu, 13 May 2021 13:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=w/tzSs3pMNhmQae+nTddF81fyXP89tQ8kavFT4k6oOw=;
 b=GIwGyzP59MWwIr1FkBw+UOSvsPwKQpzftwq0kuw95r6SKAR7s0UtWfKUCYA/RU+Eq3
 izVL+EO/kZ4pv610a4asj1Vfb1jfdrqPL5NNsP0+Vy14W35aoIRleY4dTgRJZb0sSbIg
 slK25fbZNNWrtdP3Wc7bieqWuzC1gGXFgheCqKuYNNIcyaSOC+nf2BqaEOWo+BuQHY2I
 BfwAbqJRwcEPonmZ+FiRsuouoJ3pninGs0mLy6iBXq4VUq7ljrz9+Rf2kggfZ9DYUijb
 6bfwSvK/eczrmOHVedTaVIz8NauJ+PZnR3eShz96+IeVt38PRaRqu+POZ6VYGsnb6Q9y
 vw1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=w/tzSs3pMNhmQae+nTddF81fyXP89tQ8kavFT4k6oOw=;
 b=Wkp3Bu/hCEDrhkzeg0yUb7AT5xQQemyKfwHxy9KvEW0E3abhfjb4z4siemB4JYIUpt
 LWm/K0n2BP6E+1tZBeQQCu927T1TH5hdJt603jJNBPGdIfDh+AD1lgvNf8PZwfpktiF9
 j+aWGGNIJo8dToK4CCMZXB+7IyXb+WacN1X6BKaR1S8vvZdXEJGECqYEUd5xiaJUNpem
 IJWLsnDfv02S6nwjs3N8ExEC+LfAF3+ilaFmRyAovTBmJYNTTSCn4OUBvPwkDmtalQ/2
 10aJMjh3yCY8FBqMYSxuiL+eZ34Awf8ZN4C/cKuQUEEDu1qfL+1X3bPTH8/UqQQshlss
 NePA==
X-Gm-Message-State: AOAM5309VacWOIwMsbcE848KFtwycnBZIx81qB/eKVmxD1FTi/8nlziD
 LcJWNXVVbh+EkXmLXETji39Ing==
X-Google-Smtp-Source: ABdhPJwNIcd0EDRfG3jhOFUxpQlxO8GboAJpcG/rEHXU0psLBmv6fJiIiBBxr9hEMER99bKq9zCqOg==
X-Received: by 2002:a5d:4e52:: with SMTP id r18mr52497343wrt.179.1620936676923; 
 Thu, 13 May 2021 13:11:16 -0700 (PDT)
Received: from dell ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id y12sm3138587wma.47.2021.05.13.13.11.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 13:11:16 -0700 (PDT)
Date: Thu, 13 May 2021 21:11:14 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [PATCH v9 1/4] mfd: Add Rockchip rk817 audio CODEC support
Message-ID: <20210513201114.GE805368@dell>
References: <20210505140854.15929-1-macroalpha82@gmail.com>
 <20210505140854.15929-2-macroalpha82@gmail.com>
 <20210510162329.GD751702@dell>
 <20210513150122.GA8450@wintermute.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210513150122.GA8450@wintermute.localdomain>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 heiko@sntech.de, devicetree@vger.kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, lgirdwood@gmail.com, linux-rockchip@lists.infradead.org,
 broonie@kernel.org, Chris Morgan <macromorgan@hotmail.com>, jbx6244@gmail.com,
 maccraft123mc@gmail.com
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

On Thu, 13 May 2021, Chris Morgan wrote:

> On Mon, May 10, 2021 at 05:23:29PM +0100, Lee Jones wrote:
> > On Wed, 05 May 2021, Chris Morgan wrote:
> > 
> > > From: Chris Morgan <macromorgan@hotmail.com>
> > > 
> > > Add rk817 codec support cell to rk808 mfd driver.
> > > 
> > > Tested-by: Maciej Matuszczyk <maccraft123mc@gmail.com>
> > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > 
> > Nit: These should be chronological.
> 
> Acknowledged. I will make sure to do this if a v10 is necessary.
> 
> > 
> > > ---
> > > Changes in v9:
> > >  - Add cover letter.
> > >  - Remove documentation for interrupt parent per Rob Herring's request.
> > >  - Remove unused MODULE_DEVICE_TABLE to fix a bug identified by kernel test
> > >    robot.
> > > Changes in v8:
> > >  - Added additional documentation for missing properties of #sound-dai-cells,
> > >    interrupt-parent, and wakeup-source for mfd documentation.
> > >  - Corrected order of elements descriptions in device tree documentation.
> > >  - Changed name of "mic-in-differential" to "rockchip,mic-in-differential".
> > >  - Changed name of sound card from "rockchip,rk817-codec" to "Analog".
> > >  - Removed unused resets and reset-names from the i2s1_2ch node.
> > > Changes in v7:
> > >  - Removed ifdef around register definitions for MFD.
> > >  - Replaced codec documentation with updates to MFD documentation.
> > >  - Reordered elements in example to comply with upstream rules.
> > >  - Added binding update back for Odroid Go Advance as requested.
> > >  - Submitting patches from gmail now.
> > > Changes in v6:
> > >  - Included additional project maintainers for correct subsystems.
> > >  - Removed unneeded compatible from DT documentation.
> > >  - Removed binding update for Odroid Go Advance (will do in seperate series).
> > > Changes in v5:
> > >  - Move register definitions from rk817_codec.h to main rk808.h register
> > >    definitions.
> > >  - Add volatile register for codec bits.
> > >  - Add default values for codec bits.
> > >  - Removed of_compatible from mtd driver (not necessary).
> > >  - Switched to using parent regmap instead of private regmap for codec.
> > > Changes in v4:
> > >  - Created set_pll() call.
> > >  - Created user visible gain control in mic.
> > >  - Check for return value of clk_prepare_enable().
> > >  - Removed duplicate clk_prepare_enable().
> > >  - Split DT documentation to separate commit.
> > > Changes in v3:
> > >  - Use DAPM macros to set audio path.
> > >  - Updated devicetree binding (as every rk817 has this codec chip).
> > >  - Changed documentation to yaml format.
> > >  - Split MFD changes to separate commit.
> > > Changes in v2:
> > >  - Fixed audio path registers to solve some bugs.
> > > 
> > >  drivers/mfd/rk808.c       | 85 +++++++++++++++++++++++++++++++++++++++
> > >  include/linux/mfd/rk808.h | 81 +++++++++++++++++++++++++++++++++++++
> > >  2 files changed, 166 insertions(+)
> > > 
> > > diff --git a/drivers/mfd/rk808.c b/drivers/mfd/rk808.c
> > > index ad923dd4e007..9231209184e0 100644
> > > --- a/drivers/mfd/rk808.c
> > > +++ b/drivers/mfd/rk808.c
> > > @@ -65,6 +65,7 @@ static bool rk817_is_volatile_reg(struct device *dev, unsigned int reg)
> > >  	switch (reg) {
> > >  	case RK817_SECONDS_REG ... RK817_WEEKS_REG:
> > >  	case RK817_RTC_STATUS_REG:
> > > +	case RK817_CODEC_DTOP_LPT_SRST:
> > >  	case RK817_INT_STS_REG0:
> > >  	case RK817_INT_STS_REG1:
> > >  	case RK817_INT_STS_REG2:
> > > @@ -163,6 +164,11 @@ static const struct mfd_cell rk817s[] = {
> > >  		.num_resources = ARRAY_SIZE(rk817_rtc_resources),
> > >  		.resources = &rk817_rtc_resources[0],
> > >  	},
> > > +#ifdef CONFIG_SND_SOC_RK817
> > > +	{
> > > +		.name = "rk817-codec",
> > > +	},
> > > +#endif
> > 
> > No #ifery please.
> > 
> > Just replace it with a comment.
> > 
> > If no associated driver exists, it just won't match/bind.
> 
> I did the "if" here because I noticed that if I have a rk817 and do not
> utilize the codec I receive a dmesg warning. I put the if here to silence
> it in the event that someone was using this PMIC but didn't want to use
> the audio codec. I will make the change if you say so though, but I just
> want to confirm that it's acceptable to have a warning for all rk817s
> that do not use the codec about a missing codec.  The hardware is always
> present, I just can't say for certain it will always be used.

What is the dmesg warning you receive?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
