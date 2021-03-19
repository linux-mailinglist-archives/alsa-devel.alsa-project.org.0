Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE0C341F34
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Mar 2021 15:18:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B91AE1679;
	Fri, 19 Mar 2021 15:17:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B91AE1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616163490;
	bh=jfxnAaw7fdpu+sVccm3bzZRxRevaWmF7PkA6eIvjwMs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=duqE8VFLAPinU0S5nqYTpPK0F5RTJVzRu4HvvhjaehIysHHhfdAsl2fhUOjevykKB
	 XgjdBK9L/5ZwsvcdFFhJn2uZwzbllrGsVXDtT9NWflZLNCUWLOEo8k6I1KhCq1yp3q
	 TEqdPE9EET0TNT4IbeBSe6agWD/bpMO/T3TK97fo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37C7BF800BB;
	Fri, 19 Mar 2021 15:16:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6AD20F8021C; Fri, 19 Mar 2021 15:16:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12olkn2103.outbound.protection.outlook.com [40.92.23.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A4F9F800E0
 for <alsa-devel@alsa-project.org>; Fri, 19 Mar 2021 15:16:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A4F9F800E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com
 header.b="nxy5NJiF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oOp4m+w3hGYJarBYPj0dlcHTXw7UOMT1jGLze/4IyvlPhThMQScSO2aNN/X5yBFxvfdibXUlL4jLiAAHzjjcAqVkFt7FcT9jfKYRkzV5OxDdbdo0VvaQtPTRIctWY0WYk9oYRO4od2yw3dZtt/aQUPkINiUIhddN0qZi/TqyCTlepLdrM3MkIseiOtmZbHhYqig1hQQQGF/8UN50cxVBJvV00o7KB+a0JdCeZo1GfPqLqrCzsg7sA7pFKXZ0hzx4KXuun5RZTonC2R4jxurWscWXSuEh10TqVTjrNt2v1o01yqeYo/m5T9PeH4BSxRF5Fd0+mXx584NTkVY0vH7wTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QBFwbJk4K6clqGlCIW7E85xN6liDMqXYSmfqV4RDfwc=;
 b=Qdz1+8pUe5qi8LIe/E3hK+p18PxhpIFhnqaCSUHlrwjuBYz8uO/2aNJloYY5Bdw2tsseAOB3cT0cJRSE8wbl1j5tnPJGVHfbx582JhrSPVmKtIlfTuNROBpCzfP8hyA0ETtF83Ec8j8OaA9A4Xg46p6o8CWWZEFW6Jkf1eTin71pAB6UG5YTkC1sXI4QPB6T5rzWvFCKhi75cSIUft4kErhiSJ/tMta+FQFMs52M1rnKUSZqM0cOekKwpf7AuKMjmPQ8B7GxMvWBRKesq9fH+LC00NQZJYr3jul+ibZZt0ErM9D4WW6XuXHa+dqGP9lRON8gwNGTO+FI5wfKyvWu/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QBFwbJk4K6clqGlCIW7E85xN6liDMqXYSmfqV4RDfwc=;
 b=nxy5NJiFb6lUaMvOn+XWztlKl2+PNsgRqvkxRmax0InmtdzNZqL8OadW/o08mlg7uG2Z1fEHuwnlYJLBNJANKHsuk3uWp2n4vjCpam1KiPOsw2njSwf20kT0e4/XfXPwRfKPCtdoO/UL9gH21AP9MthN4Ag+Dq4/xcQPndJgKmb1b9po0AIp1ryJU24ajHZ6/EGgl3oWIlqiR0HpLohbiwUZ7E72GZy6TQ2rI6u03E+Waf0Kr52fDsiloG4joyloZOd6W08+qnSPcgFWd5zbR8gn8KVvFqWCgjUR4Gty8blJrTkiJhQe8l3NAtSUTNyxgcedEI9yfv5XMGTRJlkQ/w==
Received: from DM6NAM12FT047.eop-nam12.prod.protection.outlook.com
 (2a01:111:e400:fc64::4a) by
 DM6NAM12HT004.eop-nam12.prod.protection.outlook.com (2a01:111:e400:fc64::374)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.9; Fri, 19 Mar
 2021 14:16:26 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 (2a01:111:e400:fc64::44) by DM6NAM12FT047.mail.protection.outlook.com
 (2a01:111:e400:fc64::319) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.9 via Frontend
 Transport; Fri, 19 Mar 2021 14:16:26 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:EF35EC5E5DC0EA67CEC36ED8DB169A5F58DFBC5B846A68418BB45AFF58E8F746;
 UpperCasedChecksum:0730E405AC151162815145D0E25DDC27A4E1F495153053824E14AF1E0B8980B1;
 SizeAsReceived:7495; Count:46
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e%7]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 14:16:26 +0000
Date: Fri, 19 Mar 2021 09:16:23 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 1/3] ASoC: Add Rockchip rk817 audio CODEC support
Message-ID: <SN6PR06MB53427CA1401DE0FD5D0C8042A5689@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <SN6PR06MB534234153792718C0417BD52A5699@SN6PR06MB5342.namprd06.prod.outlook.com>
 <20210319133010.GE5619@sirena.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210319133010.GE5619@sirena.org.uk>
X-TMN: [vV6buseNcbzWvCWSMqDBpx5xnc1Gziqs]
X-ClientProxiedBy: SN4PR0401CA0039.namprd04.prod.outlook.com
 (2603:10b6:803:2a::25) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20210319141623.GA587@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wintermute.localdomain (76.183.134.35) by
 SN4PR0401CA0039.namprd04.prod.outlook.com (2603:10b6:803:2a::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Fri, 19 Mar 2021 14:16:25 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 46
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 403a545e-1beb-4ae9-4223-08d8eae194f0
X-MS-TrafficTypeDiagnostic: DM6NAM12HT004:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6CZ1s66SY0Zb2Zh/1r3u5coXDqUbH+rR/268V0mpXAA60tZ7pKFBOOekg8kzcXsJaozp1swOdbI8jikWA9Y5CMeVtt25/evflDo/Z/puCOp55arkEoU9JpE2TvzQA3ODefoHXU9zQUQKRaoB9HCLLvCyxDGdGfEf2xfsWMh9oeu7Yg/G162CBGjzMdYqqIDXnNa+zpaMYkH3abCzzlkxAx5ZUQZCtgWssG+PVvDDzG0Rkhf4iDVWj/7WeCs3OPTcmMTB7oLyy16+CL8uSAAOAAIIZweIhApi/gdh+t7yEaUeoujsXC5OTR9qcRYAkzMIfOyOgpOTt7MXEiRpuwQ1z5Ge8ZZU5rGx/luL+liaNSydszxwENzsOHs8XOPQf1xGRujzXDC4tMUbtqGCCP33lg==
X-MS-Exchange-AntiSpam-MessageData: f1KOsWbMfb4Tdqf08Wd0Rsi7yUacuzPBI7efextBy+cJAFkP76s/5Kd9aulwexYoL1/o3bluTB5yJsyemcJu48xOsOAJzOP5L1JRkCZBkom0VAITMCos99t/JEA3n+s18VLVktDkHXlUwIl/J58N1A==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 403a545e-1beb-4ae9-4223-08d8eae194f0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 14:16:26.6306 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM12FT047.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6NAM12HT004
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com
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

On Fri, Mar 19, 2021 at 01:30:10PM +0000, Mark Brown wrote:
> On Thu, Mar 18, 2021 at 05:19:34PM -0500, Chris Morgan wrote:
> 
> > The frequency of the MCLK (when it actually works) is 12MHz, though the
> > Rockchip driver seems to want to run it at 12.288MHz and it works just fine
> > as well.  When I move this clock to the main node for the MFD it starts running
> 
> 12.288MHz would be a more normal audio clock, it's a nice multiple of
> 8kHz (though with a PLL it doesn't really matter unless the device on
> the other end of the link is also clocking its audio stuff off it since
> the PLL exists to transform the clock rate into one that's more useful).
> 
> > at 100MHz, and suffice to say it doesn't work right (high pitched sounds,
> > screeching after the audio finishes playing until the hardware shuts down,
> 
> That's...  surprising.  :/  I can't think what'd cause that.

I moved the pinctrl for the clock pin to the PMIC node and that fixed it.
Clock frequency is back to what I expect in the 12MHz range and no more
screeching.

So based on the values how do you propose I validate the input of the
frequencies, or if that's necessary at all given this PMIC seems to only
exist implemented with the Rockchip PX30 (on which all these values were
based).

> 
> > etc.) According to the schematic of the implementation I'm working with (Odroid
> > Go Advance) there is also an SCLK(SOC)/BCLK(PMIC) and an LRCLK. I assume these
> > also run at ~12MHz since it seems they are tied to the parent clock rate in the
> > clk-px30 driver, just as the MCLK is.  Likewise these also run at 100MHz when
> > the clock is connected to the PMIC node directly instead of at the codec node
> > level.
> 
> LRCLK should run at the sample rate, and BCLK at a rate fast enough to
> clock out all the bits required for the data.  MCLK is usually faster
> than those and intended to be a reference clock for them.
> 
> > > BTW looking at the driver there's a bunch of other registers so
> > > shouldn't the regmap be done at the MFD level?
> 
> > I'm not sure honestly. If you think that's best I can figure out how. I'm
> > trying to avoid a lot of changes to the mfd driver itself because the rk817
> > is the only version of this that has a codec, all the other ones supported by
> > this driver don't. Again though whatever you think is best I'll try to
> > implement.
> 
> It's really what I'd expect, two regmaps for the same device is weird.
> Looking at the MFD driver it seems to already have separate regmap
> configs per device supported so it shouldn't be too intrusive, just more
> detailed data for the device - the main difference is that you've
> explicitly listed all the valid registers whereas the driver didn't
> bother for anything so far.

I can add them to the regmap for the mfd then.  I assume when I tried to
reference the MFD's regmap earlier and I got a kernel panic its because
I was trying to write to registers that weren't defined?
