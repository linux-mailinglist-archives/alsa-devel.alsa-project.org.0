Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 139F6380E8C
	for <lists+alsa-devel@lfdr.de>; Fri, 14 May 2021 19:00:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82EE3175F;
	Fri, 14 May 2021 19:00:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82EE3175F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621011656;
	bh=fuaB29/uQUgKD2eHYxV2E3UbhbiTzYczqHlDB+Y7iDg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GyhPtn98oDfDwvhGzGiahzkbwbZfoOtFtRPcDjwRIuYlwCElQUh3hQM3bU9+9NfED
	 rHSiY3YybN5HO8oLndkVCLr1ECa/sjs1DiKzw9Uvpzq6/ozjay2sPQGN1AMZBjVHYI
	 XVYXDjGZQaSHSGffGMaqYAJ1zg+jvQPDT5OIFmbo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F018AF8026B;
	Fri, 14 May 2021 18:59:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC546F80240; Fri, 14 May 2021 18:59:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18D5BF8013A
 for <alsa-devel@alsa-project.org>; Fri, 14 May 2021 18:59:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18D5BF8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="J5GX2Ey5"
Received: by mail-oi1-x22a.google.com with SMTP id c3so84943oic.8
 for <alsa-devel@alsa-project.org>; Fri, 14 May 2021 09:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=34ZK4Znpy/fh11pd6VP4uGTFAuTF4ZviNWdJvn2Xj6g=;
 b=J5GX2Ey5RFrIlLlVEDAB9KQwt9GSsukD9eqJgfXBvw2/Ll3dk4LrH7ZaVRHqr9o8xR
 FG/rlw2mDQT7nIrZlByCWPKj32S1SBxjaAyTIp4PigJk6r36fnRnqDfmPv7s/ngT8o2X
 pVjo9ENV6Y3rXBf+qUHUyGLTMjNj5TFH9jzivFZ2FBC8gwfM0lO/ls74zXQ96wpwqQ9I
 EL7AnHgholxFSWYCIa5TZPJU3sHeKozEQWL6rMMVN/qs+MWApR+0z+1HGywcuN4+u5O4
 Pzl6GTLtm/2EsaLVSR2vf0fLvcxH3tt68C5TJWZ9LJMENd+eGlC1X4DJxGVgHNH03OfL
 W+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=34ZK4Znpy/fh11pd6VP4uGTFAuTF4ZviNWdJvn2Xj6g=;
 b=JfUEb4KYpqPJnVObmZuppHr3IGmGen5EX2rypsjcnSwQILDfAVUDMHxpAW9VYcXk41
 zCVyIlitCA86FwwZasvz3aJUiGGOl8bk+btQ4hjL/AexRNlV5uhjRToNnCtYyNO4t9HP
 Pz/sRCB48mnT2Y9k6JgWe94zGsS0qh9wpye49oZgeshSiZi0L9BChBzWzX892kGC0a7Q
 T92DeQayLuJH5Z+vpzYOXyLBdbf3hi9QPA+mFTairRWOaSxcrp02UqRYraQZZy8w7oga
 IqAiVWNhLMHG7TF5+uIPHNi08mgSXUN5JPQw8mWFKedVySKHUHhnCAXaftPMmsduPsVK
 r3GQ==
X-Gm-Message-State: AOAM531lUmv4SiMr4enHzck5jPyz3UeFxh9+ICKTwQW9AmPDNqct8rMC
 H0mpBfWUObWMgoz7wG08rHc=
X-Google-Smtp-Source: ABdhPJxQScSRkXBlE6Pe3qC/wOjUPdR/pfB+ChTTnIupfJPL0doRdKKc7r4AAoISE0/q7f0EThf62g==
X-Received: by 2002:aca:f144:: with SMTP id p65mr7380296oih.117.1621011560860; 
 Fri, 14 May 2021 09:59:20 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id a12sm1399627oti.12.2021.05.14.09.59.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 09:59:20 -0700 (PDT)
Date: Fri, 14 May 2021 11:59:18 -0500
From: Chris Morgan <macroalpha82@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v9 1/4] mfd: Add Rockchip rk817 audio CODEC support
Message-ID: <20210514165918.GA1175@wintermute.localdomain>
References: <20210505140854.15929-1-macroalpha82@gmail.com>
 <20210513201114.GE805368@dell>
 <20210514155008.GA5719@wintermute.localdomain>
 <4053760.iZASKD2KPV@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4053760.iZASKD2KPV@phil>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, tiwai@suse.com, robh+dt@kernel.org,
 lgirdwood@gmail.com, linux-rockchip@lists.infradead.org, broonie@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, jbx6244@gmail.com,
 Lee Jones <lee.jones@linaro.org>, maccraft123mc@gmail.com
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

On Fri, May 14, 2021 at 06:36:47PM +0200, Heiko Stuebner wrote:
> Hi Chris,
> 
> Am Freitag, 14. Mai 2021, 17:50:08 CEST schrieb Chris Morgan:
> > On Thu, May 13, 2021 at 09:11:14PM +0100, Lee Jones wrote:
> > > On Thu, 13 May 2021, Chris Morgan wrote:
> > > 
> > > > On Mon, May 10, 2021 at 05:23:29PM +0100, Lee Jones wrote:
> > > > > On Wed, 05 May 2021, Chris Morgan wrote:
> > > > > 
> > > > > > From: Chris Morgan <macromorgan@hotmail.com>
> > > > > > 
> > > > > > Add rk817 codec support cell to rk808 mfd driver.
> > > > > > 
> > > > > > Tested-by: Maciej Matuszczyk <maccraft123mc@gmail.com>
> > > > > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > > > 
> > > > > Nit: These should be chronological.
> > > > 
> > > > Acknowledged. I will make sure to do this if a v10 is necessary.
> > > > 
> > > > > 
> > > > > > ---
> > > > > > Changes in v9:
> > > > > >  - Add cover letter.
> > > > > >  - Remove documentation for interrupt parent per Rob Herring's request.
> > > > > >  - Remove unused MODULE_DEVICE_TABLE to fix a bug identified by kernel test
> > > > > >    robot.
> > > > > > Changes in v8:
> > > > > >  - Added additional documentation for missing properties of #sound-dai-cells,
> > > > > >    interrupt-parent, and wakeup-source for mfd documentation.
> > > > > >  - Corrected order of elements descriptions in device tree documentation.
> > > > > >  - Changed name of "mic-in-differential" to "rockchip,mic-in-differential".
> > > > > >  - Changed name of sound card from "rockchip,rk817-codec" to "Analog".
> > > > > >  - Removed unused resets and reset-names from the i2s1_2ch node.
> > > > > > Changes in v7:
> > > > > >  - Removed ifdef around register definitions for MFD.
> > > > > >  - Replaced codec documentation with updates to MFD documentation.
> > > > > >  - Reordered elements in example to comply with upstream rules.
> > > > > >  - Added binding update back for Odroid Go Advance as requested.
> > > > > >  - Submitting patches from gmail now.
> > > > > > Changes in v6:
> > > > > >  - Included additional project maintainers for correct subsystems.
> > > > > >  - Removed unneeded compatible from DT documentation.
> > > > > >  - Removed binding update for Odroid Go Advance (will do in seperate series).
> > > > > > Changes in v5:
> > > > > >  - Move register definitions from rk817_codec.h to main rk808.h register
> > > > > >    definitions.
> > > > > >  - Add volatile register for codec bits.
> > > > > >  - Add default values for codec bits.
> > > > > >  - Removed of_compatible from mtd driver (not necessary).
> > > > > >  - Switched to using parent regmap instead of private regmap for codec.
> > > > > > Changes in v4:
> > > > > >  - Created set_pll() call.
> > > > > >  - Created user visible gain control in mic.
> > > > > >  - Check for return value of clk_prepare_enable().
> > > > > >  - Removed duplicate clk_prepare_enable().
> > > > > >  - Split DT documentation to separate commit.
> > > > > > Changes in v3:
> > > > > >  - Use DAPM macros to set audio path.
> > > > > >  - Updated devicetree binding (as every rk817 has this codec chip).
> > > > > >  - Changed documentation to yaml format.
> > > > > >  - Split MFD changes to separate commit.
> > > > > > Changes in v2:
> > > > > >  - Fixed audio path registers to solve some bugs.
> > > > > > 
> > > > > >  drivers/mfd/rk808.c       | 85 +++++++++++++++++++++++++++++++++++++++
> > > > > >  include/linux/mfd/rk808.h | 81 +++++++++++++++++++++++++++++++++++++
> > > > > >  2 files changed, 166 insertions(+)
> > > > > > 
> > > > > > diff --git a/drivers/mfd/rk808.c b/drivers/mfd/rk808.c
> > > > > > index ad923dd4e007..9231209184e0 100644
> > > > > > --- a/drivers/mfd/rk808.c
> > > > > > +++ b/drivers/mfd/rk808.c
> > > > > > @@ -65,6 +65,7 @@ static bool rk817_is_volatile_reg(struct device *dev, unsigned int reg)
> > > > > >  	switch (reg) {
> > > > > >  	case RK817_SECONDS_REG ... RK817_WEEKS_REG:
> > > > > >  	case RK817_RTC_STATUS_REG:
> > > > > > +	case RK817_CODEC_DTOP_LPT_SRST:
> > > > > >  	case RK817_INT_STS_REG0:
> > > > > >  	case RK817_INT_STS_REG1:
> > > > > >  	case RK817_INT_STS_REG2:
> > > > > > @@ -163,6 +164,11 @@ static const struct mfd_cell rk817s[] = {
> > > > > >  		.num_resources = ARRAY_SIZE(rk817_rtc_resources),
> > > > > >  		.resources = &rk817_rtc_resources[0],
> > > > > >  	},
> > > > > > +#ifdef CONFIG_SND_SOC_RK817
> > > > > > +	{
> > > > > > +		.name = "rk817-codec",
> > > > > > +	},
> > > > > > +#endif
> > > > > 
> > > > > No #ifery please.
> > > > > 
> > > > > Just replace it with a comment.
> > > > > 
> > > > > If no associated driver exists, it just won't match/bind.
> > > > 
> > > > I did the "if" here because I noticed that if I have a rk817 and do not
> > > > utilize the codec I receive a dmesg warning. I put the if here to silence
> > > > it in the event that someone was using this PMIC but didn't want to use
> > > > the audio codec. I will make the change if you say so though, but I just
> > > > want to confirm that it's acceptable to have a warning for all rk817s
> > > > that do not use the codec about a missing codec.  The hardware is always
> > > > present, I just can't say for certain it will always be used.
> > > 
> > > What is the dmesg warning you receive?
> > 
> > It appears I was confused, I will update the code. No warning is
> > received when I take away the ifdef guard. However, if I build the
> > codec and don't include a devicetree node for it I get the following
> > lines in dmesg:
> > 
> > rk817-codec rk817-codec: rk817_codec_parse_dt_property() Can not get child: codec
> > rk817-codec rk817-codec: rk817_platform_probe() parse device tree property error -19
> > 
> > So it looks like this ifdef was meant to "fix" a problem that it
> > doesn't even fix. I'll get rid of it and resubmit. To that end, do you
> > think these messages above are okay, or should we try to fix them in
> > the edge case of a user with an rk817 who doesn't use the codec but
> > still has the codec driver compiled?
> 
> The general case is always having most stuff enabled (as modules)
> think distro-kernels. So having the codec available but a board not
> using it should not result in error messages confusing the user ;-) .
> 
> I don't think the rk817-codec will be the first mfd to stumble upon
> this, so I guess just looking through others might provide the
> solution on how to resolve this "silently" ;-)
> 
> 
> Heiko
> 
> 
> 
> 
> 
I'm just going to change the message to a dev_dbg, since it's coming
from the codec driver anyway. That way if you purposefully aren't using
the codec the messages shouldn't appear in the dmesg log, however if
you're troubleshooting a problem that exists because of a missing or
invalid entry and enable debug messages you'll see this error. Again, I
expect this to be an edge case where a user has an rk817 but
purposefully doesn't want to use the codec hardware that's on 100% of
all rk817s.

Thank you.
