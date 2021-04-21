Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F88367131
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Apr 2021 19:21:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1A031614;
	Wed, 21 Apr 2021 19:20:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1A031614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619025680;
	bh=OsGeQjQ+dYE3DgN8TJtZ8kFmfCvwk3j21SSwg/yoSXY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OZG24XCkBlm5wFOYkS5QOO97r1qjvOnQoHuYKGbH6OweEOjsMY//PnmV79QJCeFlv
	 HcGYqWfMhztpF9Zansw2O2TI7jNzuAxbcGfQUBt/s66Hm2qe/6nacRyiMVWMgafshf
	 hyzX3evEjU+jjLBvuI7zxT1J2qUs5kAdh3uyhiF4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D6DEF80256;
	Wed, 21 Apr 2021 19:19:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B438F80227; Wed, 21 Apr 2021 19:19:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11olkn2103.outbound.protection.outlook.com [40.92.19.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7052F800FE
 for <alsa-devel@alsa-project.org>; Wed, 21 Apr 2021 19:19:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7052F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com
 header.b="kT2xVhKx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a9JovvAh7SqxsaYX2CElN2QsmN4CfKh06Wth2FX5X6npu0FkvqDR06yaffhsp3O63pZkaSJjw/spNMPaLE2Nr/tNwrtVbUYlMjC+E+ejKcBY6WNqtIoGDCUnqae+RVe8SKkfn6WG89sDFiMQvf1pQIu+omy+knUE/YJM2Ls//Og8KvG0F+rWfWlyPt63tX4UXSDeA3jIG2vv3qdaOXQw7TuXnptiG5iXXC4cFGS9eLbVoMuIM1FTY7viU2QEb2kZPk0Vocm6bl+v+0HG1+yi7A2HsPNuPScA0YnWMvii5jCVQ4aBjgfUUEHpZZ+Op1HqMZx0IsHSSxIc8ASk48YI3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NB0yfNvWyMp26wFDNA2XtrNmmbRd+2Zm3l0zr1Pm8so=;
 b=XBvM+GmVuq9Q1q6f9/N7a0u+TNAUvMcn800DTkQLVhiix/fmcqnMoA7XbQfU2ZKvdfgYGSS5efyorUXshrTToGwBUW5GuH49XAlDuZnD4yojao4vs8EGC7ifHA2VJxttMwBrzyFHzqlslgW3fRtJLrkvC90TGRbqDngFeyFAaLD6RRYqpmCegl9aUCAW87rSYUZfiaPPK4EPsBCtnl6K8Fd9aVaReaPZGR/srxGfY7Avr18+56ODxfhS95knBH7SxIg5mRaykRJ+i0JKQ2Hxp0fbRrmis0xDRoqzSsFqaiWORN5ZVHDeLK0efrynj/Jq7NHohyRBX41QGzlxlZc3BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NB0yfNvWyMp26wFDNA2XtrNmmbRd+2Zm3l0zr1Pm8so=;
 b=kT2xVhKxbs05lNmPAFNtwplZUcQRLhxL7Cm8r/edltWlhQCwglsTnLYDJtDviQKpED2fVFqgzTRao+A4D3DA7eKf/V1B7Bf8HHvHr5raUhkUtSAPbUspJWumSs0JDZUdXEDUYdnRE7nUDLUXLqKK9shOPTD35z6hCLUGv1ExDKYU5zPvLchcD8SPaF4Ls4maDb+01Ak9peW7dN/AZV5TgBBuMq8X7xA1Ovaa0pkAprNEwksH+GEQo/mouAJBwWS4uWlrea/ryfwylqVKq0bG7d2kV+UFaENJ6gr/D/s90x36X+SUHZKLBQe8TYxj8VDYqrXqq0w92cp8FsLw8wfe+A==
Received: from DM6NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:fc4d::40) by
 DM6NAM11HT180.eop-nam11.prod.protection.outlook.com (2a01:111:e400:fc4d::105)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Wed, 21 Apr
 2021 17:19:34 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 (2a01:111:e400:fc4d::48) by DM6NAM11FT012.mail.protection.outlook.com
 (2a01:111:e400:fc4d::365) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21 via Frontend
 Transport; Wed, 21 Apr 2021 17:19:34 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:4B758E55213042BA89874B91152A28AFFE9AB132BFA3A83AE098443655A32332;
 UpperCasedChecksum:D0632CD6D7291639C1EA76EE9CB62DF5E1DEC8A94E5098530E1B7ADABF90C90D;
 SizeAsReceived:7812; Count:46
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e%7]) with mapi id 15.20.4042.024; Wed, 21 Apr 2021
 17:19:34 +0000
Date: Wed, 21 Apr 2021 12:19:32 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [v7 4/4] arm64: dts: rockchip: add rk817 codec to Odroid Go
Message-ID: <SN6PR06MB5342DB86A948FAADA4B175C7A5479@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20210420160747.22942-1-macroalpha82@gmail.com>
 <20210420160747.22942-4-macroalpha82@gmail.com>
 <c31c3417-0ded-3274-6879-bbd56f26a2aa@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c31c3417-0ded-3274-6879-bbd56f26a2aa@gmail.com>
X-TMN: [DVhHmNP/xhzOFpjDsclT0nqyWZDEr+nh]
X-ClientProxiedBy: SN6PR05CA0032.namprd05.prod.outlook.com
 (2603:10b6:805:de::45) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20210421171932.GB1713@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wintermute.localdomain (76.183.134.35) by
 SN6PR05CA0032.namprd05.prod.outlook.com (2603:10b6:805:de::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.16 via Frontend Transport; Wed, 21 Apr 2021 17:19:33 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 46
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 4f6d8efa-a751-4af3-f8b3-08d904e9a1de
X-MS-TrafficTypeDiagnostic: DM6NAM11HT180:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6DPAn6mz32mRJI11R08mJp04DtEamkXkS768XT97cpmYzBLhUzMY9PbU+XVtuz5AB7lWt8dPNvMgxrqDrMpmcY0r5dJxgFootxnGLKDos8+rLozj6ShsU9ZeTUUVZFfGxxBiRz9ZGZOPFcGmKy5rHJMdJ9XQSDWY3W3pgz8yudKvgW56u9WNbx6SHO1p1hV5z9TPUqhFlN7ivmCOlZBHGLPtJS3g5a7uTyFhlbl9Eh+BgHvyNwj/6sLUDgdj9ArEz0JfsOeZRAg1iow5/bUX/SGX41qDCpehPf/BSqVNzI/zwxelF5H1ROdYrQBh7axtw+aWILuPVxXcI58q5vl04F6tD7X/azcerq3mpj1YCjZdtH07HDCfev4WSEoUiehp2+7P/tNImVzy+LpoWIPZeA==
X-MS-Exchange-AntiSpam-MessageData: eehreRASYGtnGzeNH5cILR+YWKGsMfVlUtrOO1J52FGQ1AD4b5ffdf78MhUnse7pCmgTTJHprmvkdTERvawr3YXkfl1uAb/7IpOQfUwcMY8qmIPxSge79um920e+2+bWXDP6oX/tbfWG40Hl88hXag==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f6d8efa-a751-4af3-f8b3-08d904e9a1de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 17:19:34.3219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6NAM11HT180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, heiko@sntech.de,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com, robh+dt@kernel.org,
 tiwai@suse.com, linux-rockchip@lists.infradead.org, broonie@kernel.org,
 Chris Morgan <macroalpha82@gmail.com>, lee.jones@linaro.org
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

On Tue, Apr 20, 2021 at 10:13:38PM +0200, Johan Jonker wrote:
> On 4/20/21 6:07 PM, Chris Morgan wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > Add the new rk817 codec driver to the Odroid Go Advance.
> > 
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
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
> >  .../boot/dts/rockchip/rk3326-odroid-go2.dts   | 36 +++++++++++++++++--
> >  1 file changed, 34 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
> > index 97fb93e1cc00..5356bcf6d99c 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
> > @@ -161,6 +161,29 @@ blue_led: led-0 {
> >  		};
> >  	};
> >  
> > +	rk817-sound {
> > +		compatible = "simple-audio-card";
> > +		simple-audio-card,format = "i2s";
> 
> > +		simple-audio-card,name = "rockchip,rk817-codec";
> 
> "simple-audio-card,name" is an exception to the Heiko's sort rules.
> Move above all other "simple-audio-card" properties.

Will do.

> 
> ===
> 
> "rockchip,rk817-codec" is too long for the "aplay -l" command.
> Maybe keep it in line with other boards
> 
> ?? "Analog" ??
> 

I can do analog if you want, or maybe just rk817-codec? I notice that several
boards (such as the pinebook pro) do have longish names (21 characters versus
20 for this board). Happy to change it though, your call.

> 
> > +		simple-audio-card,mclk-fs = <256>;
> > +		simple-audio-card,widgets =
> > +			"Microphone", "Mic Jack",
> > +			"Headphone", "Headphones",
> > +			"Speaker", "Speaker";
> > +		simple-audio-card,routing =
> > +			"MICL", "Mic Jack",
> > +			"Headphones", "HPOL",
> > +			"Headphones", "HPOR",
> > +			"Speaker", "SPKO";
> > +		simple-audio-card,hp-det-gpio = <&gpio2 RK_PC6 GPIO_ACTIVE_HIGH>;
> 
> Add empty line between nodes.
> 
> > +		simple-audio-card,cpu {
> > +			sound-dai = <&i2s1_2ch>;
> > +		};
> 
> Add empty line between nodes.
> 
> > +		simple-audio-card,codec {
> > +			sound-dai = <&rk817>;
> > +		};
> > +	};
> > +
> >  	vccsys: vccsys {
> >  		compatible = "regulator-fixed";
> >  		regulator-name = "vcc3v8_sys";
> > @@ -265,11 +288,14 @@ rk817: pmic@20 {
> >  		reg = <0x20>;
> >  		interrupt-parent = <&gpio0>;
> >  		interrupts = <RK_PB2 IRQ_TYPE_LEVEL_LOW>;
> > +		clock-output-names = "rk808-clkout1", "xin32k";
> > +		clock-names = "mclk";
> > +		clocks = <&cru SCLK_I2S1_OUT>;
> >  		pinctrl-names = "default";
> > -		pinctrl-0 = <&pmic_int>;
> > +		pinctrl-0 = <&pmic_int>, <&i2s1_2ch_mclk>;
> >  		wakeup-source;
> >  		#clock-cells = <1>;
> > -		clock-output-names = "rk808-clkout1", "xin32k";
> > +		#sound-dai-cells = <0>;
> >  
> >  		vcc1-supply = <&vccsys>;
> >  		vcc2-supply = <&vccsys>;
> > @@ -428,6 +454,10 @@ regulator-state-mem {
> >  				};
> >  			};
> >  		};
> > +
> > +		rk817_codec: codec {
> 
> > +			mic-in-differential;
> 
> This property name might have to change.
> 

Yep, will do.

> > +		};
> >  	};
> >  };
> >  
> > @@ -439,6 +469,8 @@ &i2c1 {
> >  
> >  /* I2S 1 Channel Used */
> >  &i2s1_2ch {
> 
> > +	resets = <&cru SRST_I2S1>, <&cru SRST_I2S1_H>;
> > +	reset-names = "reset-m", "reset-h";
> 
> Remove.
> "resets" and "reset-names" have no support in mainline.
> See rockchip-i2s.yaml
> 

Did not know that, will remove!

> >  	status = "okay";
> >  };
> >  
> > 
> 
