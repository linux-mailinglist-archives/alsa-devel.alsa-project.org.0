Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F103380D98
	for <lists+alsa-devel@lfdr.de>; Fri, 14 May 2021 17:51:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C79951776;
	Fri, 14 May 2021 17:51:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C79951776
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621007517;
	bh=PSyqK24w/ddjuu7+my86HU1IannWd5Ni+YikJj7tpjI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aylxl+21NZSUtQ3Cq7oUqc7d8gdlj/b0W4Sfj8yUrfH5ZWX8chMA3bbJPEjxjeVAr
	 Z3P1ITXPTNDaYUP1ZU2rszRSMgQPc+85+jNMfQN3pyQwO2j4CVPs8xA+dmM8Mwk6E4
	 rkTgnU8ski8uXmml7RsR4GqKG12nS/QLhWLT00L0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AE8FF8026B;
	Fri, 14 May 2021 17:50:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C4F8F80240; Fri, 14 May 2021 17:50:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15ECDF8013A
 for <alsa-devel@alsa-project.org>; Fri, 14 May 2021 17:50:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15ECDF8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GYXaNZsW"
Received: by mail-ot1-x331.google.com with SMTP id
 q7-20020a9d57870000b02902a5c2bd8c17so26842784oth.5
 for <alsa-devel@alsa-project.org>; Fri, 14 May 2021 08:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=sZ49ShKIaNwQHidJObzN6bEDvol7JHlJL1Wi/UaAnxU=;
 b=GYXaNZsWNePfNOac3fPkooPRbg2kZJTHNs0N3Z/eJHHA38WTiqQPDaKCwKtavhEm/c
 UoCfL76HrqFIZY80AwGm2dQmbWDrF4Qkh1lVKfnwglYXGFhOwvy99xZi8X48tYPBPTVv
 XsGTbvy6PsPq7y96LlqpK7Ee+7P1G1vPNgaoK04p0SfYcapVAqlgNzlV27K8Wp5g4dPM
 iAQTOS17OGxguKFPuy0asOnVZNwrJNcD4DIhlZRlA67dV2IdiHt22pHCbfMtdsfHfE81
 yASkmbL5IrTY2k7ZueMZy7vuY44aBvN9C3um0OFqTuJcT7fG81/9pcKeu4gdZzdnzpOE
 Ogdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=sZ49ShKIaNwQHidJObzN6bEDvol7JHlJL1Wi/UaAnxU=;
 b=JRsK2R3GPvjJqjEwijiE9EUfabHlqsbWH8jRTPdy8Tp3sytDMkSnQQC5UU3iet4qLP
 HZ7jFo0zc4gVtyN4UIgEssC3cxB9UFMRiTr3kOEXnOKLHJ3pnIhOYVMuxQsApiitQfug
 GJHIjB5goYtIV+ovqqIBnfDlGCEJrbC1//wdrpbsisdAAhN85ahtpN/b878tj4K6X6vj
 lDuCtHOfcEtCjfvHVJF784u12puXFikl7dHHbREC2QDpHB2KJePX3vIP6ohaCvJwkzXJ
 10wuObla8FueW+vfXNl0AVlyX77GRibtSeXvPXDHA8c77l30LLtrpGcQ9lU2SPSyPLTE
 9gIA==
X-Gm-Message-State: AOAM533NHo9qA3nBWXTfetGA5HCLE3O/kskRJOqvL/cMa6QIYCuyrUs9
 8Qay2N1YZQ8Zo09J8uoL8XY=
X-Google-Smtp-Source: ABdhPJxjeIcCmjTfmhzVGhK3314cJcUyudKyb+hUO6U7bkwBaEpW9n6IfEK1qsbDY4o9ghN6dT0R/Q==
X-Received: by 2002:a9d:6e92:: with SMTP id a18mr40646346otr.169.1621007411636; 
 Fri, 14 May 2021 08:50:11 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id g11sm1263544oif.27.2021.05.14.08.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:50:10 -0700 (PDT)
Date: Fri, 14 May 2021 10:50:08 -0500
From: Chris Morgan <macroalpha82@gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v9 1/4] mfd: Add Rockchip rk817 audio CODEC support
Message-ID: <20210514155008.GA5719@wintermute.localdomain>
References: <20210505140854.15929-1-macroalpha82@gmail.com>
 <20210505140854.15929-2-macroalpha82@gmail.com>
 <20210510162329.GD751702@dell>
 <20210513150122.GA8450@wintermute.localdomain>
 <20210513201114.GE805368@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210513201114.GE805368@dell>
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

On Thu, May 13, 2021 at 09:11:14PM +0100, Lee Jones wrote:
> On Thu, 13 May 2021, Chris Morgan wrote:
> 
> > On Mon, May 10, 2021 at 05:23:29PM +0100, Lee Jones wrote:
> > > On Wed, 05 May 2021, Chris Morgan wrote:
> > > 
> > > > From: Chris Morgan <macromorgan@hotmail.com>
> > > > 
> > > > Add rk817 codec support cell to rk808 mfd driver.
> > > > 
> > > > Tested-by: Maciej Matuszczyk <maccraft123mc@gmail.com>
> > > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > 
> > > Nit: These should be chronological.
> > 
> > Acknowledged. I will make sure to do this if a v10 is necessary.
> > 
> > > 
> > > > ---
> > > > Changes in v9:
> > > >  - Add cover letter.
> > > >  - Remove documentation for interrupt parent per Rob Herring's request.
> > > >  - Remove unused MODULE_DEVICE_TABLE to fix a bug identified by kernel test
> > > >    robot.
> > > > Changes in v8:
> > > >  - Added additional documentation for missing properties of #sound-dai-cells,
> > > >    interrupt-parent, and wakeup-source for mfd documentation.
> > > >  - Corrected order of elements descriptions in device tree documentation.
> > > >  - Changed name of "mic-in-differential" to "rockchip,mic-in-differential".
> > > >  - Changed name of sound card from "rockchip,rk817-codec" to "Analog".
> > > >  - Removed unused resets and reset-names from the i2s1_2ch node.
> > > > Changes in v7:
> > > >  - Removed ifdef around register definitions for MFD.
> > > >  - Replaced codec documentation with updates to MFD documentation.
> > > >  - Reordered elements in example to comply with upstream rules.
> > > >  - Added binding update back for Odroid Go Advance as requested.
> > > >  - Submitting patches from gmail now.
> > > > Changes in v6:
> > > >  - Included additional project maintainers for correct subsystems.
> > > >  - Removed unneeded compatible from DT documentation.
> > > >  - Removed binding update for Odroid Go Advance (will do in seperate series).
> > > > Changes in v5:
> > > >  - Move register definitions from rk817_codec.h to main rk808.h register
> > > >    definitions.
> > > >  - Add volatile register for codec bits.
> > > >  - Add default values for codec bits.
> > > >  - Removed of_compatible from mtd driver (not necessary).
> > > >  - Switched to using parent regmap instead of private regmap for codec.
> > > > Changes in v4:
> > > >  - Created set_pll() call.
> > > >  - Created user visible gain control in mic.
> > > >  - Check for return value of clk_prepare_enable().
> > > >  - Removed duplicate clk_prepare_enable().
> > > >  - Split DT documentation to separate commit.
> > > > Changes in v3:
> > > >  - Use DAPM macros to set audio path.
> > > >  - Updated devicetree binding (as every rk817 has this codec chip).
> > > >  - Changed documentation to yaml format.
> > > >  - Split MFD changes to separate commit.
> > > > Changes in v2:
> > > >  - Fixed audio path registers to solve some bugs.
> > > > 
> > > >  drivers/mfd/rk808.c       | 85 +++++++++++++++++++++++++++++++++++++++
> > > >  include/linux/mfd/rk808.h | 81 +++++++++++++++++++++++++++++++++++++
> > > >  2 files changed, 166 insertions(+)
> > > > 
> > > > diff --git a/drivers/mfd/rk808.c b/drivers/mfd/rk808.c
> > > > index ad923dd4e007..9231209184e0 100644
> > > > --- a/drivers/mfd/rk808.c
> > > > +++ b/drivers/mfd/rk808.c
> > > > @@ -65,6 +65,7 @@ static bool rk817_is_volatile_reg(struct device *dev, unsigned int reg)
> > > >  	switch (reg) {
> > > >  	case RK817_SECONDS_REG ... RK817_WEEKS_REG:
> > > >  	case RK817_RTC_STATUS_REG:
> > > > +	case RK817_CODEC_DTOP_LPT_SRST:
> > > >  	case RK817_INT_STS_REG0:
> > > >  	case RK817_INT_STS_REG1:
> > > >  	case RK817_INT_STS_REG2:
> > > > @@ -163,6 +164,11 @@ static const struct mfd_cell rk817s[] = {
> > > >  		.num_resources = ARRAY_SIZE(rk817_rtc_resources),
> > > >  		.resources = &rk817_rtc_resources[0],
> > > >  	},
> > > > +#ifdef CONFIG_SND_SOC_RK817
> > > > +	{
> > > > +		.name = "rk817-codec",
> > > > +	},
> > > > +#endif
> > > 
> > > No #ifery please.
> > > 
> > > Just replace it with a comment.
> > > 
> > > If no associated driver exists, it just won't match/bind.
> > 
> > I did the "if" here because I noticed that if I have a rk817 and do not
> > utilize the codec I receive a dmesg warning. I put the if here to silence
> > it in the event that someone was using this PMIC but didn't want to use
> > the audio codec. I will make the change if you say so though, but I just
> > want to confirm that it's acceptable to have a warning for all rk817s
> > that do not use the codec about a missing codec.  The hardware is always
> > present, I just can't say for certain it will always be used.
> 
> What is the dmesg warning you receive?

It appears I was confused, I will update the code. No warning is
received when I take away the ifdef guard. However, if I build the
codec and don't include a devicetree node for it I get the following
lines in dmesg:

rk817-codec rk817-codec: rk817_codec_parse_dt_property() Can not get child: codec
rk817-codec rk817-codec: rk817_platform_probe() parse device tree property error -19

So it looks like this ifdef was meant to "fix" a problem that it
doesn't even fix. I'll get rid of it and resubmit. To that end, do you
think these messages above are okay, or should we try to fix them in
the edge case of a user with an rk817 who doesn't use the codec but
still has the codec driver compiled?

Thank you.

> 
> -- 
> Lee Jones [李琼斯]
> Senior Technical Lead - Developer Services
> Linaro.org │ Open source software for Arm SoCs
> Follow Linaro: Facebook | Twitter | Blog
