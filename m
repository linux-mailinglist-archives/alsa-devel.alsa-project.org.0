Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7890A37FA37
	for <lists+alsa-devel@lfdr.de>; Thu, 13 May 2021 17:03:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E43C717C2;
	Thu, 13 May 2021 17:02:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E43C717C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620918186;
	bh=smM0CV2lmQ6gr9AGZ4HtIbHUFlSE576fvpVgCrU0WMU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZeKNbPZGkMED4h4gQ+jGs17vMZBXSdxCEV3VKFBN5e0ru3m016RYzEJa8dLOQJMyK
	 HeGeSh+AEzLIxa12WIdEPNvjX6F6IQje0yEPJTWFqEJRzVLyS1XkiwIqLR10KgXf07
	 UVhq92iBvWtZIrv89FuIcx3LGJB7j1atUEf4ShPI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E5E4F8016B;
	Thu, 13 May 2021 17:01:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDD4EF80163; Thu, 13 May 2021 17:01:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17D35F8012E
 for <alsa-devel@alsa-project.org>; Thu, 13 May 2021 17:01:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17D35F8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="uYchrcCS"
Received: by mail-oi1-x22a.google.com with SMTP id u16so25594565oiu.7
 for <alsa-devel@alsa-project.org>; Thu, 13 May 2021 08:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ldgM2NO/Seow+Q56F+YNVD+hDuAL7t+LwPBtglqZh1k=;
 b=uYchrcCSs746S+q+9gMFDs6pbFLse8WQ2iy43FWr0fZToAUlq/4rnF1ltQEKoNweE9
 CkkEYo4Eya6PfW2wAroDNcr1tL3SML6J2unwF5momMpunX923eAMlEMk6qYGR8bC1NCR
 ctx9nHfoAzpWkueL6j7Jt+6M9qpgkLEI+r5AK6+eMlGJPSWogR271QQ49emat4oZYOWO
 zG6lhb42WpTw5HEs6ClOhIXmRNItwJqkEH3th/EzSx3UUD0+J8bFW3uCRNtMJn893i8T
 xpjIBeAiFz2e8FgOGIDjfBF5bFM0W7wAPYKIaBi/+Cr+ub2CZDlf5vhQwBKjVreDzSEA
 9eCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ldgM2NO/Seow+Q56F+YNVD+hDuAL7t+LwPBtglqZh1k=;
 b=TQZlyi8M2y1c6vmgfMKZUoCLbtivO1I5jg9879kxR2i9vJMQdDLflSRRM86BV/A2k8
 1FPyGUumo4tb2Bznabr2MmtP9szJTgTqQh2kH98p7yPUYFSXHGQTWi47q0hl9EdXI53T
 t8Kpv8qphnB4rKbYYsdMMoqKkIEBvm2+gtTJvcjDUXzOK0QpkuFtPPCOtZWLRSHq9SDT
 XTynohotQ4eNrFrwLWWJznxngN7tF9wp3iPzsD0O9zWgJs8J/gQ87kzHvLtVfpkPWyEx
 nQJWFFezxpudGO5uqgZGZJ104xw5+kA++HO7YCC0UOLfPCVqVBJqDxRuS/vyGKNbitLA
 YVCw==
X-Gm-Message-State: AOAM531K9apUrC4O8Pr/0LPPVsYcBrZgLzaUoQZlM0005wRbmDhG6/w+
 LJV3QXWz5f/NQkvLoqVyD1U=
X-Google-Smtp-Source: ABdhPJyt5yDteKzelnGnRuRCn9CZhQKv5LRroEA1l8WsVRyhotR5+3i5X3VeFHbmGyO221CzU290OQ==
X-Received: by 2002:aca:5d08:: with SMTP id r8mr735254oib.51.1620918084722;
 Thu, 13 May 2021 08:01:24 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id x30sm694721ott.41.2021.05.13.08.01.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 08:01:24 -0700 (PDT)
Date: Thu, 13 May 2021 10:01:22 -0500
From: Chris Morgan <macroalpha82@gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v9 1/4] mfd: Add Rockchip rk817 audio CODEC support
Message-ID: <20210513150122.GA8450@wintermute.localdomain>
References: <20210505140854.15929-1-macroalpha82@gmail.com>
 <20210505140854.15929-2-macroalpha82@gmail.com>
 <20210510162329.GD751702@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210510162329.GD751702@dell>
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

On Mon, May 10, 2021 at 05:23:29PM +0100, Lee Jones wrote:
> On Wed, 05 May 2021, Chris Morgan wrote:
> 
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > Add rk817 codec support cell to rk808 mfd driver.
> > 
> > Tested-by: Maciej Matuszczyk <maccraft123mc@gmail.com>
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> 
> Nit: These should be chronological.

Acknowledged. I will make sure to do this if a v10 is necessary.

> 
> > ---
> > Changes in v9:
> >  - Add cover letter.
> >  - Remove documentation for interrupt parent per Rob Herring's request.
> >  - Remove unused MODULE_DEVICE_TABLE to fix a bug identified by kernel test
> >    robot.
> > Changes in v8:
> >  - Added additional documentation for missing properties of #sound-dai-cells,
> >    interrupt-parent, and wakeup-source for mfd documentation.
> >  - Corrected order of elements descriptions in device tree documentation.
> >  - Changed name of "mic-in-differential" to "rockchip,mic-in-differential".
> >  - Changed name of sound card from "rockchip,rk817-codec" to "Analog".
> >  - Removed unused resets and reset-names from the i2s1_2ch node.
> > Changes in v7:
> >  - Removed ifdef around register definitions for MFD.
> >  - Replaced codec documentation with updates to MFD documentation.
> >  - Reordered elements in example to comply with upstream rules.
> >  - Added binding update back for Odroid Go Advance as requested.
> >  - Submitting patches from gmail now.
> > Changes in v6:
> >  - Included additional project maintainers for correct subsystems.
> >  - Removed unneeded compatible from DT documentation.
> >  - Removed binding update for Odroid Go Advance (will do in seperate series).
> > Changes in v5:
> >  - Move register definitions from rk817_codec.h to main rk808.h register
> >    definitions.
> >  - Add volatile register for codec bits.
> >  - Add default values for codec bits.
> >  - Removed of_compatible from mtd driver (not necessary).
> >  - Switched to using parent regmap instead of private regmap for codec.
> > Changes in v4:
> >  - Created set_pll() call.
> >  - Created user visible gain control in mic.
> >  - Check for return value of clk_prepare_enable().
> >  - Removed duplicate clk_prepare_enable().
> >  - Split DT documentation to separate commit.
> > Changes in v3:
> >  - Use DAPM macros to set audio path.
> >  - Updated devicetree binding (as every rk817 has this codec chip).
> >  - Changed documentation to yaml format.
> >  - Split MFD changes to separate commit.
> > Changes in v2:
> >  - Fixed audio path registers to solve some bugs.
> > 
> >  drivers/mfd/rk808.c       | 85 +++++++++++++++++++++++++++++++++++++++
> >  include/linux/mfd/rk808.h | 81 +++++++++++++++++++++++++++++++++++++
> >  2 files changed, 166 insertions(+)
> > 
> > diff --git a/drivers/mfd/rk808.c b/drivers/mfd/rk808.c
> > index ad923dd4e007..9231209184e0 100644
> > --- a/drivers/mfd/rk808.c
> > +++ b/drivers/mfd/rk808.c
> > @@ -65,6 +65,7 @@ static bool rk817_is_volatile_reg(struct device *dev, unsigned int reg)
> >  	switch (reg) {
> >  	case RK817_SECONDS_REG ... RK817_WEEKS_REG:
> >  	case RK817_RTC_STATUS_REG:
> > +	case RK817_CODEC_DTOP_LPT_SRST:
> >  	case RK817_INT_STS_REG0:
> >  	case RK817_INT_STS_REG1:
> >  	case RK817_INT_STS_REG2:
> > @@ -163,6 +164,11 @@ static const struct mfd_cell rk817s[] = {
> >  		.num_resources = ARRAY_SIZE(rk817_rtc_resources),
> >  		.resources = &rk817_rtc_resources[0],
> >  	},
> > +#ifdef CONFIG_SND_SOC_RK817
> > +	{
> > +		.name = "rk817-codec",
> > +	},
> > +#endif
> 
> No #ifery please.
> 
> Just replace it with a comment.
> 
> If no associated driver exists, it just won't match/bind.

I did the "if" here because I noticed that if I have a rk817 and do not
utilize the codec I receive a dmesg warning. I put the if here to silence
it in the event that someone was using this PMIC but didn't want to use
the audio codec. I will make the change if you say so though, but I just
want to confirm that it's acceptable to have a warning for all rk817s
that do not use the codec about a missing codec.  The hardware is always
present, I just can't say for certain it will always be used.

Thank you.

> 
> -- 
> Lee Jones [李琼斯]
> Senior Technical Lead - Developer Services
> Linaro.org │ Open source software for Arm SoCs
> Follow Linaro: Facebook | Twitter | Blog
