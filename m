Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3233408C1
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 16:26:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33164169A;
	Thu, 18 Mar 2021 16:25:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33164169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616081187;
	bh=DKtexApAT4xYMW57BILgTDB2KCrw2cbN4oybVrUA7SE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YFtnDZls5KhfcFA3BrjaUj9A6vlynW06W7AtWr3BQqDXX0XPedD4ZAYcOJl/5SzWS
	 DCq/rI2hJHKwpW6ApAksLE8XjVT7Hq12XWxay9o6uYlXrFan2f9KWuNxGP3pHIhzXu
	 rYgmML45/0dLWpRMOLWiEnYdtGxM/w7kLLs5yblw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5E6DF80171;
	Thu, 18 Mar 2021 16:24:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA2C7F80165; Thu, 18 Mar 2021 16:24:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12olkn2027.outbound.protection.outlook.com [40.92.22.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59ABBF800C8
 for <alsa-devel@alsa-project.org>; Thu, 18 Mar 2021 16:24:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59ABBF800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com
 header.b="I7loffI9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yf0iXb05lvUJe5PzOV2dWBl0wnmF36PUJ9uBaIAXIQhLoBq/U2wCsC1N9ETM5qt01kdJq4isbhRVZORh0d5XQSL8PpkpzeiQ+sBWx9htZP5vjP6pEe8b4tMMK0czDlQxIjoGE3Kt1SlD8p0fge92pNdDglWE0RQQuQipK3snOheOOnKUr5b4/60Fo5sVNQq3c5CtRWHyqB7HRDQ2OSjviIeeqhrfqCIC/SdZUmNDxvid8YC1e5t96TnNnLVpWrcV3pUlKprdvE337T6vpXMGr/NvLPz3ROvyjeqlDyi0gLB4qhqCMqX8QBmvqQ1nrSsP2Y4hVV/o/5xBPzV8tjlCmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9EoPdk+XNmqERkYLgpXVdHo7dv6ytDSV78sdXKTEKc=;
 b=b/IGJxUlZ5HpQxKy0N1iWdw/hjeN2D4Xhdc9z+e/tZH1uEEAbIGZWDDKfT1Gm8VN+HOWHwxBAdT2rhK+5DktYDg/p96aOvMD1CGCIUX0Pq4je5LTi/RSBkA8gYfgFMhFlnTZNss/dru/7cogae0eOOKvK8gUuzmDWKSy/slHBJgxKjEK8KJxt5KjA+Q4AY6Pta+gmHF97JBomWqV16JqdOXSywmMJJNN73xxqXqcPIPld5G/dkYh5w20xFYcASiPev7/kSmttc3PwGpWkSnirG5UL6yxTa3fvkihNIEwYdNqDSCQSFuHauDNO6CQs959lMwadS1OPmxsKPptE8oZCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9EoPdk+XNmqERkYLgpXVdHo7dv6ytDSV78sdXKTEKc=;
 b=I7loffI96fI9/8WXZpw48ck7aSYVM1MH2+7xvDOiAom3CAxB8B/YmTHly6JDCe+K6MtWnUPSEKfqBG2iQr7mg4jcPfCYx0HXYUyI6iJ3lgBHcPN0untra9YnRpwJ+nUefj8P+pRP6G27fmeMNioj0pVGV0P61sDYFP3ZmWjr1hKLcTfbiAP25T7sZEO9nOGf/YnjnjlKUYqBxYzPIWLepGuBin16tD0GsN/80LaxKbD/QfbQDWt1RB1HWHVp+Hj1yT/e0M95kWTYTR+DbUhnOHMr9tr5YcmvEDjIzAVZp1ERxhEYFDV6uM1oumbUP6cocutnwhpEEbkMs1/cn+yHOg==
Received: from DM6NAM12FT051.eop-nam12.prod.protection.outlook.com
 (2a01:111:e400:fc64::47) by
 DM6NAM12HT178.eop-nam12.prod.protection.outlook.com (2a01:111:e400:fc64::201)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.9; Thu, 18 Mar
 2021 15:24:35 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 (2a01:111:e400:fc64::48) by DM6NAM12FT051.mail.protection.outlook.com
 (2a01:111:e400:fc64::105) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.9 via Frontend
 Transport; Thu, 18 Mar 2021 15:24:35 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:6B46AB9EF793BF4131CE15E0EB4CD395764C6083F2700A079F923DFE331A99D2;
 UpperCasedChecksum:899024BD154FF74C9991B28F582897A923203268ABFA3D85F09AF217DC55DC2D;
 SizeAsReceived:7537; Count:46
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e%7]) with mapi id 15.20.3955.018; Thu, 18 Mar 2021
 15:24:35 +0000
Date: Thu, 18 Mar 2021 10:24:30 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 1/3] ASoC: Add Rockchip rk817 audio CODEC support
Message-ID: <SN6PR06MB534246E83550903553C0C380A5699@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <SN6PR06MB534267976CCAB77E25EF10A9A56A9@SN6PR06MB5342.namprd06.prod.outlook.com>
 <20210318130610.GF5469@sirena.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210318130610.GF5469@sirena.org.uk>
X-TMN: [IY04RJLBGxMtXq+PXJ984ZXtiaLM2txl]
X-ClientProxiedBy: SN4PR0501CA0025.namprd05.prod.outlook.com
 (2603:10b6:803:40::38) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20210318152430.GA12526@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wintermute.localdomain (76.183.134.35) by
 SN4PR0501CA0025.namprd05.prod.outlook.com (2603:10b6:803:40::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.10 via Frontend
 Transport; Thu, 18 Mar 2021 15:24:32 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 46
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 454da535-a570-439d-675a-08d8ea21ee3c
X-MS-TrafficTypeDiagnostic: DM6NAM12HT178:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ilrs3wAO8dM2O76oaPRFOjVc8DtKV5a4xGkeELbePTmeiXkCC46FaTAVJ7YcsyFRRaKlGZNonlpaltIVQEzNfjih12cqDt4UrrCvYOR9nb+Y6y1/WHHwZkMXLSKcbD8xC4LTBVP7mc6L/5y1opnkE6LiuAHhpLBDzQCI+6FVMMLWZIoz7jNVb4D39cVWC5rjnksdgV1NICaB8LMisFqekJ8ofBV+QanQicHQihb/yyHiqdrYvP4US065lPPqP6cAVUcbazZemD4GfLQJSqNnjlK7b5WrvSzC9sVQLXHWyYpSjVBXK5y+uPEQBsGxlKJSW0fQPeejfVl1N1cg/AUN8tqR/BcMOxFjqT3hF+KtwWpUlGCR+/uawA2ruIofLWw5Pcj7kKG/+u9+YaDkcxKnZU+4Tgb+xMWp0m/ha0nee8M=
X-MS-Exchange-AntiSpam-MessageData: 7aJWbDF1juCAFgsocSKFk05YryQmx3LtnqAwxPCvTGrysMotD6DRICxcQrKwUduX0pCqzRe4UehtDPHMAFkkV/nLfUlIRQxyF0Z/i0toGqXO2TG7YEKgtL1Kx4CRhlZf2et1Za0tUnFo09dCkYbSoQ==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 454da535-a570-439d-675a-08d8ea21ee3c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 15:24:34.5349 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM12FT051.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6NAM12HT178
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

On Thu, Mar 18, 2021 at 01:06:10PM +0000, Mark Brown wrote:
> On Wed, Mar 17, 2021 at 03:21:15PM -0500, Chris Morgan wrote:
> > Add support for the Rockchip rk817 audio codec integrated into the
> > rk817 PMIC. This is based on the sources provided by Rockchip from
> > their BSP kernel.
> 
> Modulo the issue with the compatible in the binding this looks good
> apart from a couple of small nits:
> 
> > +static int rk817_set_component_pll(struct snd_soc_component *component,
> > +		int pll_id, int source, unsigned int freq_in,
> > +		unsigned int freq_out)
> > +{
> > +	snd_soc_component_write(component, RK817_CODEC_APLL_CFG1, 0x58);
> 
> This should really validate freq_in and freq_out, confirming that
> they're whatever fixed values this register sequence is for (if you
> don't know what freq_out actually is it's more OK to skip that than
> freq_in I guess since the constraints on the DAI link should ensure we
> end up with a sensible value).

Unfortunately I don't know which values I should validate.  While the data
sheet has these fields "documented" it doesn't have the units, so I don't know
if I'm close in the minimum/maximum range or not.  I will add documentation to
the routine for each step of what I'm doing at least though. If better
documentation becomes available or a second implementation presents itself we
can update this to validate.

https://rockchip.fr/RK817%20datasheet%20V1.01.pdf

> 
> > +	snd_soc_component_write(component, RK817_CODEC_APLL_CFG2, 0x2d);
> > +	snd_soc_component_write(component, RK817_CODEC_APLL_CFG3, 0x0c);
> > +	snd_soc_component_write(component, RK817_CODEC_APLL_CFG4, 0xa5);
> > +
> > +	return 0;
> > +};
> 
> No ; at the end of the function definition.

Acknowledged.
