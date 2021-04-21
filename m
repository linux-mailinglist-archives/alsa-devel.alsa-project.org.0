Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D15C336712B
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Apr 2021 19:18:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 610D11679;
	Wed, 21 Apr 2021 19:17:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 610D11679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619025523;
	bh=RedYY8gc33FBq7S5HCqZ4zdb8cpqN8Gy+refygH1lEw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N4k5XtKbfG1Qc6kw5qgJznImAvoIvANjbmO8rqmpOK+Xd6SZu17K5Lq9DEHyhkq8+
	 wM9X6Bfcg9RJ5GB83wOD+i4vC88uovFyTANpTbQHO5VLbbrGb/Hv2jqOe6DC9IJL+E
	 0w0bvecexxyuLIpPQp+LRGJmKdFayF6Aw1E+ao9w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE69CF800E8;
	Wed, 21 Apr 2021 19:17:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B26DEF80227; Wed, 21 Apr 2021 19:17:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11olkn2059.outbound.protection.outlook.com [40.92.18.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA335F800FE
 for <alsa-devel@alsa-project.org>; Wed, 21 Apr 2021 19:17:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA335F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com
 header.b="sHHctoLK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mi+ZPRFjnrbv8gxZ+5vIhssyYAD/7PzGf4eL3RLyRIg/vT7gKytaNNUmZgKPYSQ5yz3mWpeDsu75/NIQ0C7w4OIkcuq7/LoR8ByJUBnov918JCRg6G0wVya7ZzSCULObWCbNIGcVg0uBkJ8p/1HFba1atXiwIo9hNq1t7o3bq7Doo5NChHDnTlCvK1eU9Vx01UvcZRhlw9EVR7VZ8Z8QshHFR13OtcQ3nnAC8CipC7oeC0A4RyHfrNgzLHWWO03aJO7W/QFOY2hIklFxK7rnsNPhKrhvoRrTIfWzNvTgGc25cPAXBpQKTuStASJ1ov5liJ5RXl1cg9P3eqYL35Q70A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5unh9pPs0pJCKIpNHQLcmKwQsGSh9zXNfiouygoEHF4=;
 b=Lt7nUMBTzDrR39VSttNbM2afUmplKjrhglHJ1axUhGY0eP2ZsdV0ZLgTjFS6LtsRt5xHWMwmR6Ka7fwXNctybtqqZfGWgdi0pEfRAVnjo6oeGalcVUiaaHU1rnHp9ne9q4hrJ+ees0/BQVmihftA89X0Xl9H52aD35vdNLishH23UobtKQEc0E1t5ghTBsUstL9X6Xs9vqFI9eiNAa0/9A9TuNNPnHDe9RWbXx70IM7VYCJdy8ixaDNDvqOXjhROEJiOX8A6kX8pCR1NrMmnp7M38NX3rWLc7tRUp8aHBFLTnnTnDoL9ay0mUoWlwPekCdoGRk+aPa7gHBN/H6rFMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5unh9pPs0pJCKIpNHQLcmKwQsGSh9zXNfiouygoEHF4=;
 b=sHHctoLKiNDN5S9wHjwXD5467aDO4KCjW7pXN8bAMru0YNAA0RM3lpCryr9w2lXVG1x7ljnDiDTcGIfUk1LmLj0e0IEcZ/JDnazeEYGoKrDCrW9yWqgq7ayUyRzUWsRvR+NiQipEXAQaiPgsWoxVW7hyHUWGutIaDoTakCFH+G/Z7O7amdAeDsFgs+q2iQ7817tLhcZkDJCJH3iFOEMRTeaMfRG48Y/jKZ572ZlGCmcOHOdqIPujvBSWCF6WTXwniA4p0MLRMoGZW2PHzNq/U6nDyRg1WunnD7XP2SxnQCkSVfGQ+kICu0oNOAdnu+m1aDSOkiBwv5PxJOduODlvYA==
Received: from DM6NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:fc4d::4f) by
 DM6NAM11HT195.eop-nam11.prod.protection.outlook.com (2a01:111:e400:fc4d::78)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Wed, 21 Apr
 2021 17:16:55 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 (2a01:111:e400:fc4d::4e) by DM6NAM11FT036.mail.protection.outlook.com
 (2a01:111:e400:fc4d::64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21 via Frontend
 Transport; Wed, 21 Apr 2021 17:16:54 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:2372569B72899EC2CDD9F766BEFB6B0DE820BE2FF17133B1745BD6F30D44668C;
 UpperCasedChecksum:F678E2B8C45D54A112544C046D150E5375AC09FCDAFE3E64E4559AD35E81DFFA;
 SizeAsReceived:7804; Count:46
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e%7]) with mapi id 15.20.4042.024; Wed, 21 Apr 2021
 17:16:54 +0000
Date: Wed, 21 Apr 2021 12:16:52 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [v7 3/4] dt-bindings: Add Rockchip rk817 audio CODEC support
Message-ID: <SN6PR06MB53421B47D52055B391BF0D49A5479@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20210420160747.22942-1-macroalpha82@gmail.com>
 <20210420160747.22942-3-macroalpha82@gmail.com>
 <375b3145-70cc-9351-76f5-b9a159dc244f@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <375b3145-70cc-9351-76f5-b9a159dc244f@gmail.com>
X-TMN: [++ub+KGBcKw5u9R1NQEd1KAXUh2XaAo2]
X-ClientProxiedBy: SA0PR13CA0020.namprd13.prod.outlook.com
 (2603:10b6:806:130::25) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20210421171652.GA1713@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wintermute.localdomain (76.183.134.35) by
 SA0PR13CA0020.namprd13.prod.outlook.com (2603:10b6:806:130::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.15 via Frontend
 Transport; Wed, 21 Apr 2021 17:16:53 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 46
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 80250e50-2e48-4521-54a1-08d904e94288
X-MS-TrafficTypeDiagnostic: DM6NAM11HT195:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nvdxj0DQQfsz9o2o7h36c2cY1xqtMZUNzEBZ3U9Pyjk8bkv091653XpSrHi301exVqEaBjN5MrRkIGTSAFxep5vlKY5Xx7N8FHvTZ9cIOrdXWzr/tJEmY0KEDYJKNvIPVGCNeVsJfDIlXG454tTTqnnRd660DqlQ1gKsE0FRvUCrwEL9Ilv2h0c9rnn+bj8R7q0v+tWmlhmRcTwBIJ99eNjwR9heRsoiIfc39bw2O5GFcjOSCsiRr218iH/1cn/u7vEvo+5WI2lCb8jddIVS+djLxBNrzCK0WQoYG0+Tg56Y3OS2vfG4TGk7w0kRHw7LRAtZPvHEvhtihfTNfdvdZ/k63U5wgWtcLWqURdqMebPpFxZpS0U0n/FmIXJv7gxiyDsznpIEoJHbtPtHyq2Qow==
X-MS-Exchange-AntiSpam-MessageData: w0PSVXLB2fAXaR04ulGYVwd/SYw2UYL7Olfi2xnp1sBegEqKKLerEH2QnPKS4BVcxGaOkjmvO3SHVnGc6NgRPGPOtpxEXHCknI2XWtNUX8eDwCqknCdKv1A2oRE+6cBKbZ23OsPaK4wa3yJbufwWpA==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80250e50-2e48-4521-54a1-08d904e94288
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 17:16:54.5234 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6NAM11HT195
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

On Tue, Apr 20, 2021 at 09:56:35PM +0200, Johan Jonker wrote:
> Hi Chris,
> 
> Some comments. Have a look if they are useful.
> 
> On 4/20/21 6:07 PM, Chris Morgan wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > Create dt-binding documentation to document rk817 codec.
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
> >  .../devicetree/bindings/mfd/rk808.txt         | 181 ++++++++++++++++++
> >  1 file changed, 181 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/rk808.txt b/Documentation/devicetree/bindings/mfd/rk808.txt
> > index 04df07f6f793..31eaabd2e179 100644
> > --- a/Documentation/devicetree/bindings/mfd/rk808.txt
> > +++ b/Documentation/devicetree/bindings/mfd/rk808.txt
> > @@ -63,6 +63,11 @@ Optional RK809 properties:
> >  - vcc9-supply:  The input supply for DCDC_REG5, SWITCH_REG2
> >  
> >  Optional RK817 properties:
> > +- clocks:	The input clock for the audio codec
> > +- clock-names:	The clock name for the codec clock. Should be "mclk".
> 
> #sound-dai-cells:
> 
> Needed for the interpretation of sound dais.
> Should be 0.

Will add, thank you.

> 
> Add empty line
> 
> > +- codec:	The child node for the codec to hold additional properties.
> 
> This is a nodename and not a property. Add below "vcc9-supply".
> 

Will change, thank you.

> > +- mic-in-differential: Telling if the microphone uses differential mode. Should
> > +		       be under the codec child node.
> 
> This goes in a subnode. Maybe add indent a bit?
> "mic-in-differential" is a property specific for Rockchip.
> 

I've moved it after the codec description to hopefully clarify that its
position.

> Ask rob+dt for exact name.
> Maybe this has to change to "rockchip,mic-in-differential"
> Update code as well!
> 

Will do.

> Add new added property names explicit in your commit message, so rob+dt
> can review more easy.
> 
> 
> >  - vcc8-supply:  The input supply for BOOST
> >  - vcc9-supply:  The input supply for OTG_SWITCH
> >  
> > @@ -275,3 +280,179 @@ Example:
> >  			};
> >  		};
> >  	};
> 
> Maybe add separator/title?
> 
> > +
> > +	rk817: pmic@20 {
> > +		compatible = "rockchip,rk817";
> > +		reg = <0x20>;
> 
> > +		interrupt-parent = <&gpio0>;
> 
> Missing in properties.
> 

This one was tricky; I honestly am not 100% sure but I think it's a required
property. I added it to the required properties as I see it used on every
implementation for this chip.

> > +		interrupts = <RK_PB2 IRQ_TYPE_LEVEL_LOW>;
> > +		clock-output-names = "rk808-clkout1", "xin32k";
> > +		clock-names = "mclk";
> > +		clocks = <&cru SCLK_I2S1_OUT>;
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pmic_int>, <&i2s1_2ch_mclk>;
> 
> > +		wakeup-source;
> 
> Missing in properties.
> Is this common for all rkXXX?
> 

I don't think this is common for all, I believe it is optional for some. If I
am not mistaken this is because there is a button connected to the PMIC that
is used to wake/suspend/poweron/poweroff the device. I put it under optional
for now as I'm not sure if every device has this or not.

> > +		#clock-cells = <1>;
> 
> > +		#sound-dai-cells = <0>;
> 
> Missing in properties.

Will fix.

> 
> > +
> > +		vcc1-supply = <&vccsys>;
> > +		vcc2-supply = <&vccsys>;
> > +		vcc3-supply = <&vccsys>;
> > +		vcc4-supply = <&vccsys>;
> > +		vcc5-supply = <&vccsys>;
> > +		vcc6-supply = <&vccsys>;
> > +		vcc7-supply = <&vccsys>;
> > +
> > +		regulators {
> > +			vdd_logic: DCDC_REG1 {
> > +				regulator-name = "vdd_logic";
> > +				regulator-min-microvolt = <950000>;
> > +				regulator-max-microvolt = <1150000>;
> > +				regulator-ramp-delay = <6001>;
> > +				regulator-always-on;
> > +				regulator-boot-on;
> > +
> > +				regulator-state-mem {
> > +					regulator-on-in-suspend;
> > +					regulator-suspend-microvolt = <950000>;
> > +				};
> > +			};
> > +
> > +			vdd_arm: DCDC_REG2 {
> > +				regulator-name = "vdd_arm";
> > +				regulator-min-microvolt = <950000>;
> > +				regulator-max-microvolt = <1350000>;
> > +				regulator-ramp-delay = <6001>;
> > +				regulator-always-on;
> > +				regulator-boot-on;
> > +
> > +				regulator-state-mem {
> > +					regulator-off-in-suspend;
> > +					regulator-suspend-microvolt = <950000>;
> > +				};
> > +			};
> > +
> > +			vcc_ddr: DCDC_REG3 {
> > +				regulator-name = "vcc_ddr";
> > +				regulator-always-on;
> > +				regulator-boot-on;
> > +
> > +				regulator-state-mem {
> > +					regulator-on-in-suspend;
> > +				};
> > +			};
> > +
> > +			vcc_3v3: DCDC_REG4 {
> > +				regulator-name = "vcc_3v3";
> > +				regulator-min-microvolt = <3300000>;
> > +				regulator-max-microvolt = <3300000>;
> > +				regulator-always-on;
> > +				regulator-boot-on;
> > +
> > +				regulator-state-mem {
> > +					regulator-off-in-suspend;
> > +					regulator-suspend-microvolt = <3300000>;
> > +				};
> > +			};
> > +
> > +			vcc_1v8: LDO_REG2 {
> > +				regulator-name = "vcc_1v8";
> > +				regulator-min-microvolt = <1800000>;
> > +				regulator-max-microvolt = <1800000>;
> > +				regulator-always-on;
> > +				regulator-boot-on;
> > +
> > +				regulator-state-mem {
> > +					regulator-on-in-suspend;
> > +					regulator-suspend-microvolt = <1800000>;
> > +				};
> > +			};
> > +
> > +			vdd_1v0: LDO_REG3 {
> > +				regulator-name = "vdd_1v0";
> > +				regulator-min-microvolt = <1000000>;
> > +				regulator-max-microvolt = <1000000>;
> > +				regulator-always-on;
> > +				regulator-boot-on;
> > +
> > +				regulator-state-mem {
> > +					regulator-on-in-suspend;
> > +					regulator-suspend-microvolt = <1000000>;
> > +				};
> > +			};
> > +
> > +			vcc3v3_pmu: LDO_REG4 {
> > +				regulator-name = "vcc3v3_pmu";
> > +				regulator-min-microvolt = <3300000>;
> > +				regulator-max-microvolt = <3300000>;
> > +				regulator-always-on;
> > +				regulator-boot-on;
> > +
> > +				regulator-state-mem {
> > +					regulator-on-in-suspend;
> > +					regulator-suspend-microvolt = <3300000>;
> > +				};
> > +			};
> > +
> > +			vccio_sd: LDO_REG5 {
> > +				regulator-name = "vccio_sd";
> > +				regulator-min-microvolt = <1800000>;
> > +				regulator-max-microvolt = <3300000>;
> > +				regulator-always-on;
> > +				regulator-boot-on;
> > +
> > +				regulator-state-mem {
> > +					regulator-on-in-suspend;
> > +					regulator-suspend-microvolt = <3300000>;
> > +				};
> > +			};
> > +
> > +			vcc_sd: LDO_REG6 {
> > +				regulator-name = "vcc_sd";
> > +				regulator-min-microvolt = <3300000>;
> > +				regulator-max-microvolt = <3300000>;
> > +				regulator-boot-on;
> > +
> > +				regulator-state-mem {
> > +					regulator-on-in-suspend;
> > +					regulator-suspend-microvolt = <3300000>;
> > +				};
> > +			};
> > +
> > +			vcc_bl: LDO_REG7 {
> > +				regulator-name = "vcc_bl";
> > +				regulator-min-microvolt = <3300000>;
> > +				regulator-max-microvolt = <3300000>;
> > +
> > +				regulator-state-mem {
> > +					regulator-off-in-suspend;
> > +					regulator-suspend-microvolt = <3300000>;
> > +				};
> > +			};
> > +
> > +			vcc_lcd: LDO_REG8 {
> > +				regulator-name = "vcc_lcd";
> > +				regulator-min-microvolt = <2800000>;
> > +				regulator-max-microvolt = <2800000>;
> > +
> > +				regulator-state-mem {
> > +					regulator-off-in-suspend;
> > +					regulator-suspend-microvolt = <2800000>;
> > +				};
> > +			};
> > +
> > +			vcc_cam: LDO_REG9 {
> > +				regulator-name = "vcc_cam";
> > +				regulator-min-microvolt = <3000000>;
> > +				regulator-max-microvolt = <3000000>;
> > +
> > +				regulator-state-mem {
> > +					regulator-off-in-suspend;
> > +					regulator-suspend-microvolt = <3000000>;
> > +				};
> > +			};
> > +		};
> 
> Add empty line, like the rest.
> 

My mistake, will fix.

> > +		rk817_codec: codec {
> 
> > +			mic-in-differential;
> 
> See comment above.
> rockchip,mic-in-differential ??
> 
> > +		};
> > +	};
> > 
> 
