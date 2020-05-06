Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4839D1C7413
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 17:18:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E00361787;
	Wed,  6 May 2020 17:17:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E00361787
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588778295;
	bh=EI9Y/OwRDY2lzypnzAw2R4HC6tNzTK5dFtcZoIxqUmg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vASsRQTIgk2ZF75w82etSkEok4sZ6O+dQFa5Et27Fyd/BBdM5Zo16Jikch2SzHTFP
	 VabOdVV1Dh2ogPV3i6+mP0uDUhBfWJwDix4b+KgeJaoRS7H9HOkojJVjCWoh807ZM0
	 DT+zyAKTnfw1A34TU2CO0oFFFF5aWJn2MfctKHXE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF655F8025E;
	Wed,  6 May 2020 17:16:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B2CFF80259; Wed,  6 May 2020 17:16:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=MSGID_FROM_MTA_HEADER,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-oln040092254047.outbound.protection.outlook.com [40.92.254.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B31F6F800DF
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 17:15:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B31F6F800DF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mr3xND6MI/Am3TP/x+KKG0+cR2hKuGchycm1L4JX2JbuqWRmicWRr8rlwrY72kglGmqGDd7AsIbnGavRh3C2yLGyNWO7pPF9zvzgqCOsOtAkHHIORzdAnY06d+XwnNp5qdBV3ir5RXxVEzOH5ivoiqzsL7F4fDslrcAY2rt81wg+OHbTgAes9uuCARAlqN2u4y9i7rxLN/cFMu30Ai46BGSwStMipfKodfEpLT5/uvK8wGbYavkQuy6eRtih9BJCYjhdkgUjmjJQnLG+eEZa3CxXMf8T0dLm1WgnJFiYdayTXJmje80zu0w1PkiyRsaAyh6/+xjaESoHwaXuSyILrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RI4ZvFeMjLzYlGY1rF1hJ/6aYiLbdudKeutSOZqRRQg=;
 b=lH2EF5cTvwYtGMUab1n67O+1uM3POxnxmolGoLRbQx0u6F1YJy0SU3uuVOOVsj97VEr6x5HQYqVedPdQ9sXYD4JCbRbBXDs50a34voeWarLyoaOzhy9F6cKyo7k0F4QZZMflILS1GAmQa3EQPJqQPIID4ofBXylNOHrSUt69BvWEz+fuSksT7+AFGFNLWtbaHidDzg0CgP3Ys1wnv09CcD1yqcH6xqY2RZJxwXWJQjKPWjk4wL40afPgIdf6CA7xVUTg1Zcdm41rQLfSTnNz7W+5y4DgZw+lcqTEZscH1Dc03cJisvrrqPkvWjncLsoZBduyrInmXtYdA/ZFOIOO2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=outlook.com.au; dmarc=pass action=none
 header.from=outlook.com.au; dkim=pass header.d=outlook.com.au; arc=none
Received: from HK2APC01FT026.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::4b) by
 HK2APC01HT238.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::490)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27; Wed, 6 May
 2020 15:15:47 +0000
Received: from PSXP216MB0438.KORP216.PROD.OUTLOOK.COM (10.152.248.53) by
 HK2APC01FT026.mail.protection.outlook.com (10.152.248.174) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Wed, 6 May 2020 15:15:47 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:700999ACCD16A2AFF04FE910C14BCBEE942B6EEEC7A4D6D4100AA494BB72F075;
 UpperCasedChecksum:34E65D70D797FC91C0465C7C0162B7E24C00D4C5A55E5D55CB9095B1A76B7D04;
 SizeAsReceived:8489; Count:48
Received: from PSXP216MB0438.KORP216.PROD.OUTLOOK.COM
 ([fe80::21f1:20fb:d1f:8e25]) by PSXP216MB0438.KORP216.PROD.OUTLOOK.COM
 ([fe80::21f1:20fb:d1f:8e25%7]) with mapi id 15.20.2979.028; Wed, 6 May 2020
 15:15:46 +0000
Date: Wed, 6 May 2020 23:15:36 +0800
From: Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 0/1] Fiji GPU audio register timeout when in BACO state
Message-ID: <PSXP216MB0438F42EB2405C4215DF0BF280A40@PSXP216MB0438.KORP216.PROD.OUTLOOK.COM>
References: <CADnq5_Mjb_FnNOzjUfJZ7GSDzi-+Cfc1ZTuqm7UWCWVvY6DU_w@mail.gmail.com>
 <s5hwo5xj98v.wl-tiwai@suse.de>
 <PSXP216MB0438FE3E1CA577805BEC23C880AA0@PSXP216MB0438.KORP216.PROD.OUTLOOK.COM>
 <s5hh7x0kiwb.wl-tiwai@suse.de>
 <PSXP216MB04381A30909F66867E6B6BCC80AA0@PSXP216MB0438.KORP216.PROD.OUTLOOK.COM>
 <s5h1ro4kgog.wl-tiwai@suse.de> <s5h7dxuizep.wl-tiwai@suse.de>
 <20200502071728.fn2fcqvt6aies3zu@wunner.de>
 <s5h368iiyos.wl-tiwai@suse.de> <s5hpnbmhcmu.wl-tiwai@suse.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hpnbmhcmu.wl-tiwai@suse.de>
X-ClientProxiedBy: SYAPR01CA0034.ausprd01.prod.outlook.com (2603:10c6:1:1::22)
 To PSXP216MB0438.KORP216.PROD.OUTLOOK.COM
 (2603:1096:300:d::20)
X-Microsoft-Original-Message-ID: <20200506151536.GA4636@nicholas-dell-linux>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nicholas-dell-linux (2001:44b8:605f:11:45ec:d37e:a989:bf24) by
 SYAPR01CA0034.ausprd01.prod.outlook.com (2603:10c6:1:1::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.26 via Frontend Transport; Wed, 6 May 2020 15:15:42 +0000
X-Microsoft-Original-Message-ID: <20200506151536.GA4636@nicholas-dell-linux>
X-TMN: [ZFrRSr9vjLRyEvwVgo3i/0Zmw7a1m9PV7o4xUgDwV/s2y3VWHBIesyYDYIIOArlX]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 03fab1b8-c161-455e-05e3-08d7f1d0592c
X-MS-TrafficTypeDiagnostic: HK2APC01HT238:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YFzYRAoBbjotzjAlpBV/qB1xfckF1pztQsz+6mgOuEc7L0PkkGca/inFo3/AzjPrSi+szvPbO1O9YFo3Sha/qGI6UH4k5YBnUhWE63bLpNsqfX2tzNndFYuc5co/u4ePN/Xls5SlfZMGZjIokqvUGYW1H1+F0VC1Q55W33kxdE+FAkONYYaMJlNdl+qlw0glYyft6Y88Kyi7/IVlN/r7Jw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:PSXP216MB0438.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
X-MS-Exchange-AntiSpam-MessageData: H+qiLUzndFozG4cbIahV27ULRI5oAOHjUib5yboapRrMuugOUHkgbSa3HUuCKYPPYCKoptmL5wWb8Ol6Nu95YJw6uxUgzkkyRKjob8IPhhLjSfNEGk5+GuAvHNNQIMODV5ex6TCdAsG6oMyLozZtpLOljl2W//vTcQfOEg2mXrgCqooPsHzFnqib5GFB7GRAXPCgzTiMARL9uZNz231Lcg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03fab1b8-c161-455e-05e3-08d7f1d0592c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2020 15:15:46.5255 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT238
Cc: "Zhou, David\(ChunMing\)" <David1.Zhou@amd.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Takashi Iwai <tiwai@suse.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Lukas Wunner <lukas@wunner.de>,
 Alex Deucher <alexdeucher@gmail.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
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

On Sat, May 02, 2020 at 12:09:13PM +0200, Takashi Iwai wrote:
> On Sat, 02 May 2020 09:27:31 +0200,
> Takashi Iwai wrote:
> > 
> > On Sat, 02 May 2020 09:17:28 +0200,
> > Lukas Wunner wrote:
> > > 
> > > On Sat, May 02, 2020 at 09:11:58AM +0200, Takashi Iwai wrote:
> > > > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > > @@ -673,6 +673,12 @@ static int amdgpu_dm_audio_component_bind(struct device *kdev,
> > > >  	struct amdgpu_device *adev = dev->dev_private;
> > > >  	struct drm_audio_component *acomp = data;
> > > >  
> > > > +	if (!device_link_add(hda_kdev, kdev, DL_FLAG_STATELESS |
> > > > +			     DL_FLAG_PM_RUNTIME)) {
> > > > +		DRM_ERROR("DM: cannot add device link to audio device\n");
> > > > +		return -ENOMEM;
> > > > +	}
> > > > +
> > > 
> > > Doesn't this duplicate drivers/pci/quirks.c:quirk_gpu_hda() ?
> > 
> > Gah, you're right, that was the place I overlooked.
> > It was a typical "false Eureka right-after-wakeup" phenomenon :)
> > Need a vaccine aka coffee...
> > 
> > So the runtime PM dependency must be already placed there, and the
> > problem is not the lack of the dependency tree but the really other
> > timing issue.  Back to square.
> 
> One interesting test is to open the stream while the mode isn't set
> yet and see whether the same problem appears.
> Namely, after the monitor is connected but no mode is set, run
> directly like
>    aplay -Dhdmi:1,0 foo.wav
> You might need to wrap the command with pasuspender if PA is active.
I could not figure out how to get the interface for aplay set other than 
not specifying it and having it find the default device (which can 
change). I even used aplay -L and aplay -l to show devices. I could not 
get it working.

Is there anything else I can try? I did not apply the last patch when it 
was pointed out that it is already a quirk.

Regards,
Nicholas
> 
> 
> Takashi
