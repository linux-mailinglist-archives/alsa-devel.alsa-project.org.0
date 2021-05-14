Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA76380E4E
	for <lists+alsa-devel@lfdr.de>; Fri, 14 May 2021 18:38:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05F27176C;
	Fri, 14 May 2021 18:37:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05F27176C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621010310;
	bh=GiSUIIxu6CP3sZiF8Y4rglSQXB7RXca7ADjQvubgRZM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vhBkwb4LwjJIsVXOwG6nvBuR2uWNtOwNDFa8QBt2CmcFsiSSFTWmR4aCBLTo6E/6O
	 D2xmp/ju4Szd1AiZf0YoPlS4igu3sMn8qgF5PP5WrYQoheNMKLDEVKnZOOj9FR5ykI
	 sSOiU/MRY6WSzill75gkOHtL4e7NQLaSx3y0p11Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60CDDF8012A;
	Fri, 14 May 2021 18:37:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A3A9F80240; Fri, 14 May 2021 18:36:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 018C5F8013A
 for <alsa-devel@alsa-project.org>; Fri, 14 May 2021 18:36:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 018C5F8013A
Received: from p5b127fa9.dip0.t-ipconnect.de ([91.18.127.169]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1lhanv-0003oa-RH; Fri, 14 May 2021 18:36:47 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Lee Jones <lee.jones@linaro.org>, Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [PATCH v9 1/4] mfd: Add Rockchip rk817 audio CODEC support
Date: Fri, 14 May 2021 18:36:47 +0200
Message-ID: <4053760.iZASKD2KPV@phil>
In-Reply-To: <20210514155008.GA5719@wintermute.localdomain>
References: <20210505140854.15929-1-macroalpha82@gmail.com>
 <20210513201114.GE805368@dell> <20210514155008.GA5719@wintermute.localdomain>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, tiwai@suse.com, robh+dt@kernel.org,
 lgirdwood@gmail.com, linux-rockchip@lists.infradead.org, broonie@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, jbx6244@gmail.com,
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

Hi Chris,

Am Freitag, 14. Mai 2021, 17:50:08 CEST schrieb Chris Morgan:
> On Thu, May 13, 2021 at 09:11:14PM +0100, Lee Jones wrote:
> > On Thu, 13 May 2021, Chris Morgan wrote:
> > 
> > > On Mon, May 10, 2021 at 05:23:29PM +0100, Lee Jones wrote:
> > > > On Wed, 05 May 2021, Chris Morgan wrote:
> > > > 
> > > > > From: Chris Morgan <macromorgan@hotmail.com>
> > > > > 
> > > > > Add rk817 codec support cell to rk808 mfd driver.
> > > > > 
> > > > > Tested-by: Maciej Matuszczyk <maccraft123mc@gmail.com>
> > > > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > > 
> > > > Nit: These should be chronological.
> > > 
> > > Acknowledged. I will make sure to do this if a v10 is necessary.
> > > 
> > > > 
> > > > > ---
> > > > > Changes in v9:
> > > > >  - Add cover letter.
> > > > >  - Remove documentation for interrupt parent per Rob Herring's request.
> > > > >  - Remove unused MODULE_DEVICE_TABLE to fix a bug identified by kernel test
> > > > >    robot.
> > > > > Changes in v8:
> > > > >  - Added additional documentation for missing properties of #sound-dai-cells,
> > > > >    interrupt-parent, and wakeup-source for mfd documentation.
> > > > >  - Corrected order of elements descriptions in device tree documentation.
> > > > >  - Changed name of "mic-in-differential" to "rockchip,mic-in-differential".
> > > > >  - Changed name of sound card from "rockchip,rk817-codec" to "Analog".
> > > > >  - Removed unused resets and reset-names from the i2s1_2ch node.
> > > > > Changes in v7:
> > > > >  - Removed ifdef around register definitions for MFD.
> > > > >  - Replaced codec documentation with updates to MFD documentation.
> > > > >  - Reordered elements in example to comply with upstream rules.
> > > > >  - Added binding update back for Odroid Go Advance as requested.
> > > > >  - Submitting patches from gmail now.
> > > > > Changes in v6:
> > > > >  - Included additional project maintainers for correct subsystems.
> > > > >  - Removed unneeded compatible from DT documentation.
> > > > >  - Removed binding update for Odroid Go Advance (will do in seperate series).
> > > > > Changes in v5:
> > > > >  - Move register definitions from rk817_codec.h to main rk808.h register
> > > > >    definitions.
> > > > >  - Add volatile register for codec bits.
> > > > >  - Add default values for codec bits.
> > > > >  - Removed of_compatible from mtd driver (not necessary).
> > > > >  - Switched to using parent regmap instead of private regmap for codec.
> > > > > Changes in v4:
> > > > >  - Created set_pll() call.
> > > > >  - Created user visible gain control in mic.
> > > > >  - Check for return value of clk_prepare_enable().
> > > > >  - Removed duplicate clk_prepare_enable().
> > > > >  - Split DT documentation to separate commit.
> > > > > Changes in v3:
> > > > >  - Use DAPM macros to set audio path.
> > > > >  - Updated devicetree binding (as every rk817 has this codec chip).
> > > > >  - Changed documentation to yaml format.
> > > > >  - Split MFD changes to separate commit.
> > > > > Changes in v2:
> > > > >  - Fixed audio path registers to solve some bugs.
> > > > > 
> > > > >  drivers/mfd/rk808.c       | 85 +++++++++++++++++++++++++++++++++++++++
> > > > >  include/linux/mfd/rk808.h | 81 +++++++++++++++++++++++++++++++++++++
> > > > >  2 files changed, 166 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/mfd/rk808.c b/drivers/mfd/rk808.c
> > > > > index ad923dd4e007..9231209184e0 100644
> > > > > --- a/drivers/mfd/rk808.c
> > > > > +++ b/drivers/mfd/rk808.c
> > > > > @@ -65,6 +65,7 @@ static bool rk817_is_volatile_reg(struct device *dev, unsigned int reg)
> > > > >  	switch (reg) {
> > > > >  	case RK817_SECONDS_REG ... RK817_WEEKS_REG:
> > > > >  	case RK817_RTC_STATUS_REG:
> > > > > +	case RK817_CODEC_DTOP_LPT_SRST:
> > > > >  	case RK817_INT_STS_REG0:
> > > > >  	case RK817_INT_STS_REG1:
> > > > >  	case RK817_INT_STS_REG2:
> > > > > @@ -163,6 +164,11 @@ static const struct mfd_cell rk817s[] = {
> > > > >  		.num_resources = ARRAY_SIZE(rk817_rtc_resources),
> > > > >  		.resources = &rk817_rtc_resources[0],
> > > > >  	},
> > > > > +#ifdef CONFIG_SND_SOC_RK817
> > > > > +	{
> > > > > +		.name = "rk817-codec",
> > > > > +	},
> > > > > +#endif
> > > > 
> > > > No #ifery please.
> > > > 
> > > > Just replace it with a comment.
> > > > 
> > > > If no associated driver exists, it just won't match/bind.
> > > 
> > > I did the "if" here because I noticed that if I have a rk817 and do not
> > > utilize the codec I receive a dmesg warning. I put the if here to silence
> > > it in the event that someone was using this PMIC but didn't want to use
> > > the audio codec. I will make the change if you say so though, but I just
> > > want to confirm that it's acceptable to have a warning for all rk817s
> > > that do not use the codec about a missing codec.  The hardware is always
> > > present, I just can't say for certain it will always be used.
> > 
> > What is the dmesg warning you receive?
> 
> It appears I was confused, I will update the code. No warning is
> received when I take away the ifdef guard. However, if I build the
> codec and don't include a devicetree node for it I get the following
> lines in dmesg:
> 
> rk817-codec rk817-codec: rk817_codec_parse_dt_property() Can not get child: codec
> rk817-codec rk817-codec: rk817_platform_probe() parse device tree property error -19
> 
> So it looks like this ifdef was meant to "fix" a problem that it
> doesn't even fix. I'll get rid of it and resubmit. To that end, do you
> think these messages above are okay, or should we try to fix them in
> the edge case of a user with an rk817 who doesn't use the codec but
> still has the codec driver compiled?

The general case is always having most stuff enabled (as modules)
think distro-kernels. So having the codec available but a board not
using it should not result in error messages confusing the user ;-) .

I don't think the rk817-codec will be the first mfd to stumble upon
this, so I guess just looking through others might provide the
solution on how to resolve this "silently" ;-)


Heiko





