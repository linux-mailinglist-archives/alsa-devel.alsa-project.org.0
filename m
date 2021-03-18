Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C7434104A
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 23:21:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CC5E168C;
	Thu, 18 Mar 2021 23:20:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CC5E168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616106086;
	bh=1Bgdfzv1woDaVmeQBt6D9M/AIqX5myd25vtkPmxUdto=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HsfajEgB1drL3BL91HpDoQhh9c3SagzwZxgCH/9mi9XNuhmLnZV8ObnB4P2NSb445
	 IOpv2vPEMR4BOKguRDZNta0nSfu0Rruixtis3U8FvgnvEtMwNIpwcOU5NCoMq3pNKa
	 9DW6o+IVze2SVhMSbkRc9DHBI+CfukHhbnbNx434=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC8B5F80171;
	Thu, 18 Mar 2021 23:19:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FC90F800E0; Thu, 18 Mar 2021 23:19:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10olkn2042.outbound.protection.outlook.com [40.92.42.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 213A0F800E0
 for <alsa-devel@alsa-project.org>; Thu, 18 Mar 2021 23:19:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 213A0F800E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com
 header.b="No/0ez4j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fMZNZdiozULvyh7EQDjgEPYm47cm5m+iaUrvmIo224eDEAVZ55hLUY/amj3fBNCIGJqP4RtxhUb6Is41TKtwmkwqiNRfa0nOG8j0elAxopyXTtWnpX3w0b9K7De5NYATUlVl5SUWtvYaT1Ov8cKul4xZu9tgaMv3iufhJz7bxSG5ZIFCP2NFNjCJ2Tc4DYUPs6p85vZLBgdgxtFYrwkVEEgIGd37z/R1m1HgYc1q9gO8wy2RhUSHsjZYRGMfUpDDohU9qvDyP0vgNWsZkYTdodmLtSB++EVnAVhYFKDCaTmHjaW8qyq4nJVNWTBDmCyAS0JpTXENcKQT+X86b3PuKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HGHA79TxlC8N7wYAW+DB+VHXA1VN1O/Cxu78I5Id1VI=;
 b=f1wPS7fuhzejfjJ42jrKP+UtXad4iTCOy0MCo3XkyWMNT5XYMaiOk/qThdtuRtla8fWzPakA4B+hvGNn9MqN9Kmm1icDEgEnpXd0NEhk4oDj1i8wrZGB5q/HTD0KMXrrSdlObycvQVodNBR+AlgPj9oovpCfapq5weCukhLcdeZtI4m5I9aRZNOTBnnn2lcdNqKyrQLnXNIk4ENhAdMkCXfDTsUtk1R6Mco/G8LldqpCEEnljHYMWQg+MXn5Ir+mqIYqIrBMFnkOdsz1nJaDBlDyw4aIazzLk87ZGP7PAIvTMV19phH1SPxjEqMEPxH7+5nv37P/Vl0RXQiqPP6QcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HGHA79TxlC8N7wYAW+DB+VHXA1VN1O/Cxu78I5Id1VI=;
 b=No/0ez4jqdM/QpZ+v7Wzz3jzDAe6cIxXcCRCYArPGVH58JHQBO+Z5VsJkkfK80ml0al7pD8+yNxU4NWh6NiV4os0zzIF2DXZqqQWbFEpzUSOL7wruBiaZ3ULFRD6/HAhQ0XSvYLdSTTynleUvYsGUzKsVKHKi4ZfxzqOqj6QlTAvhMTwBpCWbz/uCg0jNLH7nxujP0SR+zLC+WLDDaFZ0Eue4WVkuYW6iAXJgrMYDOgIzPdwLyYmNCtQyultZ6JKuqheMhbHVTMieUu76t0+MWe6THygybXFwG6J+kxgwfngwn1wP3SjcKyyYr5kcv4w9Ry4EDNaklb4depzEq1VfA==
Received: from BN7NAM10FT066.eop-nam10.prod.protection.outlook.com
 (2a01:111:e400:7e8f::52) by
 BN7NAM10HT215.eop-nam10.prod.protection.outlook.com (2a01:111:e400:7e8f::179)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 18 Mar
 2021 22:19:39 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 (2a01:111:e400:7e8f::4f) by BN7NAM10FT066.mail.protection.outlook.com
 (2a01:111:e400:7e8f::258) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Thu, 18 Mar 2021 22:19:39 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:BC8EE107CD6B4A88A478E9F7F5019ED695EEF1D4D4D590A05897AFCA5DA3A1F5;
 UpperCasedChecksum:DA23936F377B3B2FF426AEEBE93E17316E435AE530EB3F79F83B1403DAB369EB;
 SizeAsReceived:7644; Count:46
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e%7]) with mapi id 15.20.3955.018; Thu, 18 Mar 2021
 22:19:39 +0000
Date: Thu, 18 Mar 2021 17:19:34 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 1/3] ASoC: Add Rockchip rk817 audio CODEC support
Message-ID: <SN6PR06MB534234153792718C0417BD52A5699@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <SN6PR06MB534267976CCAB77E25EF10A9A56A9@SN6PR06MB5342.namprd06.prod.outlook.com>
 <20210318130610.GF5469@sirena.org.uk>
 <SN6PR06MB534246E83550903553C0C380A5699@SN6PR06MB5342.namprd06.prod.outlook.com>
 <20210318175833.GN5469@sirena.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210318175833.GN5469@sirena.org.uk>
X-TMN: [Rrcy9fFOSMk4zRT9udD6Le/RTInL/m92]
X-ClientProxiedBy: SN4PR0201CA0044.namprd02.prod.outlook.com
 (2603:10b6:803:2e::30) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20210318221934.GA10888@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wintermute.localdomain (76.183.134.35) by
 SN4PR0201CA0044.namprd02.prod.outlook.com (2603:10b6:803:2e::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Thu, 18 Mar 2021 22:19:37 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 46
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 2b1657e1-4807-4fcf-5df5-08d8ea5beb1c
X-MS-TrafficTypeDiagnostic: BN7NAM10HT215:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HidSBsVCgYVs6upQFE+Z/hVEilObUXJWQ3V/vrsXnRDG7MHbuXpoRKFIrTp0yXyt9raX39yb3c3KcDTRRUecpYfbsnERpe0yplBGg3HTeh/TUUkc/4a1DV3ZbUWiQIpz4EgfjIeaRWxGKPPgh4YUVQQxSFLnWQKhdRJI8awitfYSZzAQon2rudqyg27jOsdkME60gXtykucvbC2jCEsjkNyFyElIogzzeT4uRINYY1QS/1LGFn9tOYUuQH7c8VMzoHq23gnBliS+32LRSAriqcal/e1tQVyMXzen5t4gXtB5KdgRDRQ4gmYWVoM/IfZ+Ddm45JTGeh+oTqqpfxOzSTe8MwavaX+/yJUoBacbxVM4UQF1PFnkMzRjEkOT+N6G1wvHRyhl2cKngtinWTQ1CDfQL9fmtz2qCOwWRRMjLUQ=
X-MS-Exchange-AntiSpam-MessageData: 0IWiTDYFyZ1iC2LKU9JfrKo1fh2Z3auUDWWVdCBZJ6uI1nJGWdF0wu2qvtuLzg9zmSxYBE8aKJ6nYKnP8Urioo/SB5/fY9uWWDRrpU9/51VC099Hfd6JkMLlnbXwY8PS4hboCvPBMHlPLz7UX+JSkw==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b1657e1-4807-4fcf-5df5-08d8ea5beb1c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 22:19:39.1916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: BN7NAM10FT066.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7NAM10HT215
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

On Thu, Mar 18, 2021 at 05:58:33PM +0000, Mark Brown wrote:
> On Thu, Mar 18, 2021 at 10:24:30AM -0500, Chris Morgan wrote:
> > On Thu, Mar 18, 2021 at 01:06:10PM +0000, Mark Brown wrote:
> 
> > > This should really validate freq_in and freq_out, confirming that
> > > they're whatever fixed values this register sequence is for (if you
> > > don't know what freq_out actually is it's more OK to skip that than
> > > freq_in I guess since the constraints on the DAI link should ensure we
> > > end up with a sensible value).
> 
> > Unfortunately I don't know which values I should validate.  While the data
> > sheet has these fields "documented" it doesn't have the units, so I don't know
> > if I'm close in the minimum/maximum range or not.  I will add documentation to
> > the routine for each step of what I'm doing at least though. If better
> > documentation becomes available or a second implementation presents itself we
> > can update this to validate.
> 
> > https://rockchip.fr/RK817%20datasheet%20V1.01.pdf
> 
> I see...  for freq_in and freq_out you shouldn't need to understand any
> of the actual PLL configuration, only what goes in and/or comes out of
> it which isn't super clear from the datasheet - there's no clock tree or
> anything.  It does say the input clock is "main clk" so it could be the
> MCLK pin?  The only other plausible pin I'm seeing is the 32kHz clock.
> If you know the output clock then PLL_OUTDIV will tell you the operating
> frequency of the PLL.

The frequency of the MCLK (when it actually works) is 12MHz, though the
Rockchip driver seems to want to run it at 12.288MHz and it works just fine
as well.  When I move this clock to the main node for the MFD it starts running
at 100MHz, and suffice to say it doesn't work right (high pitched sounds,
screeching after the audio finishes playing until the hardware shuts down,
etc.) According to the schematic of the implementation I'm working with (Odroid
Go Advance) there is also an SCLK(SOC)/BCLK(PMIC) and an LRCLK. I assume these
also run at ~12MHz since it seems they are tied to the parent clock rate in the
clk-px30 driver, just as the MCLK is.  Likewise these also run at 100MHz when
the clock is connected to the PMIC node directly instead of at the codec node
level.

https://dn.odroid.com/ODROID_GO_ADVANCE/ODROID_GO_ADVANCE_rev1.1.pdf

> 
> BTW looking at the driver there's a bunch of other registers so
> shouldn't the regmap be done at the MFD level?

I'm not sure honestly. If you think that's best I can figure out how. I'm
trying to avoid a lot of changes to the mfd driver itself because the rk817
is the only version of this that has a codec, all the other ones supported by
this driver don't. Again though whatever you think is best I'll try to
implement.

Thank you.
