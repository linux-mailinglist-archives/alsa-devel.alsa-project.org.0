Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A5E36493A
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Apr 2021 19:52:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36CF61682;
	Mon, 19 Apr 2021 19:52:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36CF61682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618854778;
	bh=5heu7mhxUReIvjc0nYoQeOjN8IAxg3hVOoepolHXbRw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i9cOuHkx5/01ypH4DTHftvPknKe4gCRgVEjDg2+d25CIvSRfjmuNfKqDzhU9HfVWo
	 bIT2MM65Drg8FfyndQXTuWp2c9A5T5b+y2mpaH/IfWI5QQopF+0sZrKAyiCyE4iD67
	 fXw1BKIpYQ6Baki5wintAU8qT7CN8PJGfHPazrJE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CC55F80256;
	Mon, 19 Apr 2021 19:51:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D1FEF80227; Mon, 19 Apr 2021 19:51:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12olkn2045.outbound.protection.outlook.com [40.92.23.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79B3EF8014D
 for <alsa-devel@alsa-project.org>; Mon, 19 Apr 2021 19:51:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79B3EF8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com
 header.b="UWnyIZuq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XrkzjKc7veqOVQrlGSi6QYhIVTKKmxmcsmzNI3/fJ/CpKiz4jLZe5ro0VxDiLrtzuGAGXa8zCXDzlTr5SLpALG+Tv8GGX0nNDkMEIYyvKq/OHYNazArX4HY/TgC27EHNYGKfq0hqz5KOm+6K+zp8MtBK4/UOMg3XcfONhchHrTBGcoFP4CRPVgzjvSR1UUfRtUXuamBImFG8hfEQTKRj4+f/Dx6pJgtIhxSA3w5+U9eqBYzbEYViwH7TVarqYR9ntEjLx0esX/z9r1+by+N+f20ZREXtbXZKIzWjFFzelg952PfRH3ULJtBGoSULj/PvY9m/fsNUF0dz2o57BmyJpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BlkeXtSPvowXnIutjh+j8W5/w8bmuoOVQOqq1uDVsKk=;
 b=JWnZYsXtiaWp+I+x2bGC2Zc2qJepHf05eBBJZBwEf/jN8EAGPTsfqhdIHljkUSim6b0xnreBkHMMoCR6IePOsNvHV2oVvNQCWnnpDO66lKl5jkTdbJFr1BJfWynrDuT1x/Ryzi5UAd+5pEt+wXdYNxlthNxR0Z8glaxgODGhgY3fiXlWSivnSxqFzgTggs0y/d5UBSQDR8SN8gof5sMAZZbNUI66WMvy9LWMAzlg/b3mHgKIn+UKEcHPs38ZXnrh+O1Qzq8gwYmjsDmXlEJ+va7yjIkEu7o/RTQyorXj4FK5WxD9ogEuAhJ+3fHSXncRxVNWEKtQ3XvWNNStpqE/GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BlkeXtSPvowXnIutjh+j8W5/w8bmuoOVQOqq1uDVsKk=;
 b=UWnyIZuqQyzeqK1ESOCl95BTLBvQ46Tjl2BPbzMhp5KnQtNUXKteiqafpd6R/LLXg+a3dF1Ax0xbPSJm6Old+VkWV3gxci3snqLms40pczNF3H1TQGL7uMWKsorXhB0KOqAAfjziDn9b7N7IfmAZzCs065XD8lhwdNfq1BSDVw2/U8ITDZXxZtb/eJwokSQgM9/HWk+XGodllh3rF9l6R+9LMTufP91D2/IaGye7NcaOWqOZMxAqlkOix6JndRdTeMCFRuZsghMiauwlprH8DJpC6RqnztQ70hLp46XwcTz/3VYBMGHboNnLITocQSvdz3IACXGC17i+Sq2Xv4KYIQ==
Received: from DM6NAM12FT020.eop-nam12.prod.protection.outlook.com
 (2a01:111:e400:fc64::43) by
 DM6NAM12HT003.eop-nam12.prod.protection.outlook.com (2a01:111:e400:fc64::81)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.7; Mon, 19 Apr
 2021 17:51:15 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 (2a01:111:e400:fc64::4f) by DM6NAM12FT020.mail.protection.outlook.com
 (2a01:111:e400:fc64::477) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.7 via Frontend
 Transport; Mon, 19 Apr 2021 17:51:15 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:05E40A2F629A017658140987131BC96C834252B9EE480337C8429E96BDD12759;
 UpperCasedChecksum:1CF589E05C1EB96F4ECD69531523B8736EEF2D97DCDF27518027D624B8A04A86;
 SizeAsReceived:7687; Count:46
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e%7]) with mapi id 15.20.4042.024; Mon, 19 Apr 2021
 17:51:15 +0000
Date: Mon, 19 Apr 2021 12:51:12 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [v6 1/3] mfd: Add Rockchip rk817 audio CODEC support
Message-ID: <SN6PR06MB534296C9BA80C56C0AD694FAA5499@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <SN6PR06MB5342B036562B085C95BDAB42A5499@SN6PR06MB5342.namprd06.prod.outlook.com>
 <20210419165116.GE5645@sirena.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210419165116.GE5645@sirena.org.uk>
X-TMN: [qJPUzAm7GWazMbLeSGeB+NQaIm6ePloK]
X-ClientProxiedBy: SN7PR04CA0043.namprd04.prod.outlook.com
 (2603:10b6:806:120::18) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20210419175112.GA26491@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wintermute.localdomain (76.183.134.35) by
 SN7PR04CA0043.namprd04.prod.outlook.com (2603:10b6:806:120::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18 via Frontend
 Transport; Mon, 19 Apr 2021 17:51:13 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 46
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: cf218391-f480-4a16-4f03-08d9035bb9c0
X-MS-TrafficTypeDiagnostic: DM6NAM12HT003:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EZNiFslrXtfU/4CNEOANQVZ2wtx68g2xdmeA5JVZgigDJ0qZgwg6SJnvVpsazADdG4JPNzDQZCanKqW10StxJdi4CogV2YepLAFbYF9W4NukuDifhK8B5xeh8yeDpwU5xLwm3swlRucisZvYrB40D7IECYBpa7PthFYtRVejZeSqH0iYNemnmy8B9D+zO1rTTmzJjMTy/UL6lThh3ltNRVmBLR0CBBZHDpFV+MRiz1kqgHYHYqujWKvr1/ux2khK8/NQnaphR5QD9hdMEKvtChaDiYX0zvktX1ee8/lPOCucvYjz9oMTRI3BMKQ0EUOjat7SWMRoF0ZfWHRxbbwOja/MOgz3Nr85iX8VCcU0DV+I1vRC7MDsimXow6rCCXve
X-MS-Exchange-AntiSpam-MessageData: veNpCVTKZnxR9DKbNIU7r4IAB2EUmMuI83z6wvDcLB1NoEWiqXfucnCFcxtEcuH8+ciesjo2SuQit+9fQL0fIR4FtgXyf0UNqSiKbOOkoPNGs51PtkvTzXRsmI5xEVCnTvWFtYeagDBuXJ+6/SxW+g==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf218391-f480-4a16-4f03-08d9035bb9c0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2021 17:51:14.9847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM12FT020.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6NAM12HT003
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 heiko@sntech.de, devicetree@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 lee.jones@linaro.org
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

On Mon, Apr 19, 2021 at 05:51:16PM +0100, Mark Brown wrote:
> On Mon, Apr 19, 2021 at 10:57:16AM -0500, Chris Morgan wrote:
> 
> > +#ifdef CONFIG_SND_SOC_RK817
> > +	case RK817_CODEC_DTOP_LPT_SRST:
> > +#endif
> 
> The register map of the device isn't going to change based on the kernel
> configuration, I wouldn't expect any ifdefs for it.

You are correct, but I was thinking that I should make the codec bits optional
in the event someone had a RK817 and didn't want to use the codec. If you think
this or the rest of the bits should not be optional please let me know. I still
think it's best that at least the cell be optional so users can build a kernel
without the audio if they so choose (I tested both building this module and
audio codec with no devicetree entry - you get a dmesg log error but nothing
else, and building with the devicetree entry but no driver - nothing happens).

If we enable the regmap bits unconditionally, is there any potential harm?

Thank you.
