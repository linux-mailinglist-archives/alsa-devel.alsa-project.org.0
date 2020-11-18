Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D05C62B732D
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Nov 2020 01:36:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F15017AA;
	Wed, 18 Nov 2020 01:35:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F15017AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605659776;
	bh=TwrUiC7L11EatDCdJsI6V3twwFXJ9uqUcfalg0PcGQk=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pmhi4OTbu1/dVGq8A24QWqjCLvdwAXynWdX7dNH8hHgVOX9A7d8YDdHLokBzXkR2A
	 VMB3Q7JHfyAkKFOaCgXj4j8nHApD7uylcrKuuoBUqHUs4RqljMEJP7t/JvgkDzJBVz
	 ujWMFXZCZX6cp9dJcUQiJdvsOuAd7IdsNexhETu4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8000F801F9;
	Wed, 18 Nov 2020 01:34:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED2EBF801F5; Wed, 18 Nov 2020 01:34:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_65,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FAF1F8010A
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 01:34:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FAF1F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="sTHsUtTF"
IronPort-SDR: 20ewhgxutxQwhenH8i6hqvgYD0vg+GZFGDN0lNFabXwb/eMmF+VHvfRTecHkNo+qYT3HbLgzer
 Wl9Dp36hlBTw==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="158814297"
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="158814297"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 16:34:26 -0800
IronPort-SDR: pnZoA3dmkGRH3kBLCh8rAzuT9vcVyI60g8nvHMWPRgvhqb8s/1cgezX2A0HFGwJetDCGNAT8re
 IhphR7m1iHUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="544272495"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga005.jf.intel.com with ESMTP; 17 Nov 2020 16:34:26 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 17 Nov 2020 16:34:26 -0800
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 17 Nov 2020 16:34:25 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 17 Nov 2020 16:34:25 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 17 Nov 2020 16:34:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZU/luZuATdk0gB6gT/4I5hpotRDJFospgRxuF8UZ0QusJ4YYwuhyjAapGUc5QJNRIhHVf08QvrAskTduplFBXnuDhd1Pva0NU+Vl5yGg4X2vcmFF/d3WCOIOHtSSoaEL1TiwqRbfrL0vIqtVIdQ5Ig9G0CrETZ93tB6m1MNFCo9uf3YEcCifh8n1mog7o88mmmvZzkU6lldbbdW6kE9EHXWZsBPUFBjNIJq1DPC8TWQDUFENL5UbNxaTqhhMJDn8xG0P7YPoMjiyLSeCBakexn13sFBOFirewv6ewl8jXiegzSuJHkD9Dt0T7gW6DNphddjrsWQmpLAb2oSnkKzGcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TwrUiC7L11EatDCdJsI6V3twwFXJ9uqUcfalg0PcGQk=;
 b=aVAgMPeEGNl2hCa+iu72EtHO5O4HpbxMAhiTwNS93h58sXEpj9wbIrnNe4rbkej2+yY2tnQ9smUbbJSXk/+7pDFA73r+eOovEvz5j9cbc0+cOJaFtA+Oqh/FaUL2pjo7xdJhebdvF8UgpRg6dfKDew1Y0u19lwZl6DxzlW4jK8QO27GOWLXpcxW2wD8jKs3CjLeBeXlNxZjXSofUJOZq7TTmaSu8N/yjlDYkf25If3L9KnGccHkg96g1uNjMAXfxjcnKmsqbG6wKcX24ttS6LPVY8yEmoOZIvlu4LZA8PZOC4w9iDld13njjQnq5gotz5l9Algji7la/pOsWuL+3wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TwrUiC7L11EatDCdJsI6V3twwFXJ9uqUcfalg0PcGQk=;
 b=sTHsUtTFXEElczoXpjZxiu7xcXH2fs8fjm5gOrJj89AbHR062YVdlyWRgmS/IavE+DN6k3sw5EZYMWXStyMtN6QszjL7YFoTfloSVpw4afUGD7e1PDmHdBPdn+YMxvX+WQSq3HkbHCZnyTAbfRqzOcuwcJV8iwJgEhsMnUiuZ/E=
Received: from CO1PR11MB5026.namprd11.prod.outlook.com (2603:10b6:303:9c::13)
 by MW3PR11MB4665.namprd11.prod.outlook.com (2603:10b6:303:5d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Wed, 18 Nov
 2020 00:34:22 +0000
Received: from CO1PR11MB5026.namprd11.prod.outlook.com
 ([fe80::4820:6e90:3d0e:3b5f]) by CO1PR11MB5026.namprd11.prod.outlook.com
 ([fe80::4820:6e90:3d0e:3b5f%4]) with mapi id 15.20.3564.028; Wed, 18 Nov 2020
 00:34:22 +0000
From: "Sia, Jee Heng" <jee.heng.sia@intel.com>
To: "Shevchenko, Andriy" <andriy.shevchenko@intel.com>, "Sit, Michael Wei
 Hong" <michael.wei.hong.sit@intel.com>
Subject: RE: [RFC PATCH 2/4] ASoC: soc-generic-dmaengine-pcm: Add custom
 prepare and submit function
Thread-Topic: [RFC PATCH 2/4] ASoC: soc-generic-dmaengine-pcm: Add custom
 prepare and submit function
Thread-Index: AQHWvLkz/K4udK7YCEaiWD6EQ6aik6nMeVcAgACNiCA=
Date: Wed, 18 Nov 2020 00:34:22 +0000
Message-ID: <CO1PR11MB50269CF832CD14BA2D2A883CDAE10@CO1PR11MB5026.namprd11.prod.outlook.com>
References: <20201117080354.4309-1-michael.wei.hong.sit@intel.com>
 <20201117080354.4309-4-michael.wei.hong.sit@intel.com>
 <20201117155038.GO4077@smile.fi.intel.com>
In-Reply-To: <20201117155038.GO4077@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [218.111.111.46]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 21061a0d-4551-4d3a-3b90-08d88b59b1da
x-ms-traffictypediagnostic: MW3PR11MB4665:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW3PR11MB466588A31B1394E802FC3FB7DAE10@MW3PR11MB4665.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aV4PSrwbDnyaRT5kTI/LfOYdIf93Z9FDPve/8euWvZp+BVbN9G/OJg9Gbt2J5kas4ftq/g9vtcrdAtxh0AnOCkXuwgtR5fpyJFS8Wy9SU8CrLYrvZKCnYqMfNv/ZozWiPRo261dhIu16qsf0kkEeJaABXMzp1yYmfwV2Flq3mRuswGkCYtAWgAvrG1cTwp6IHnLL7XzAOgUeFKsifI2ArILWEHbgyEPsY7qBuF9iU5JB0ff7qwwT26zuOpECHNCSgpfOSzmn0s/mj5Bxf8pGlnNvT/XNMHfSX+mMsflN3LTIE5BK7AguMZRu/MFq4cinfp0gtln1nn2J3TKht3FRfudZtjJjz2V5eYzMvWquDGafvIrZ2xLTG0vpIuSzo13NWQekuY6F7DMaR4vcujA8vB3go443sviqr/ygi/jMhOVR0JdqYZH187HIG7g/682W7NezPlwPq8Tj+t/g93WCDQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5026.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(6636002)(71200400001)(52536014)(4326008)(498600001)(83380400001)(7696005)(966005)(5660300002)(110136005)(6506007)(66556008)(2906002)(55016002)(66946007)(66476007)(64756008)(186003)(86362001)(9686003)(66446008)(8936002)(76116006)(33656002)(53546011)(26005)(54906003)(41533002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: XgqnDk4xsxYlV2Q7Aqg4KuS5qv3D3psXOW1QOv9HOpQbEvHc0vy+CRQgQ4Gw02IcO2pXbV4/n6jEOGDTdMdwy7F1ZLKcvpo/7N+JsNy5IP3oo0XlVH3Tj18jCUt5FTC4xgfZBP7daU07Osqcbh41159D7/WuXMWXtFiel7+TnGNengy7tpbjadxTX4+GrR5YnY8JlI2D4A9gDFgi9jAodEPY44byXDMlf+Uvm7EZy5+giK/bVKGJUBynxz6F7h5hf59recYJxXIZPvB+dUciQNF9O/bD4urq4APE2xRuzVodrbgtwKjJIScuNq0akLeGlsd3iH7+jhgfa71P/SriQ4eqMmGv+0v6wFlD4vblF+pQBRoReHk4R5ixea7RnuFYA6hoUMTWVLDvO0H/jRGOY4sCL3lwTRZzBNyroqFaOx7Q+HJuNIcOaXRew3O0WWq40+W9hxuhOpSqkLvhDHm5K06HDofoVhstUg5iwvqaT4rXUFeQviAvxS4jHr/IKQD9Oic2ia9PPoPJ9VcXYJcDrj5s9N8XDa6ihinMI/s51qnvbM27MfMPaP1lZ1lHKgG9ZEJeF48Uy04Kpy0I4OiGyG7GVZMrLMxce+vDd53sW3gk9OrDA45YdkQUBCBLPM+dV4IsxoXTCEDIQYQPS9uKm3cWJRAtaB0I3SeXqek0bVofnZXzHVdKn1z2SPAXBPewTWILYRKRzUcuSKino2TCq81gR6ntDBl32nje1gSr23BDdlzAKlFFId2icClFqiNHuTyWshOkCxX+ie3vf2DzDVExJTR4DQrCWJKw6kRmwQUHonaZS5hYshUjz0XkhHpXkfNOTXDAq2eDQu+humdZc3BBNfc00TQ7gSHyyfH2oJY4gLAAxOWeB7E2cAZLm+9QpteK6Sn2yAkM+8jGHRm/2Q==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5026.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21061a0d-4551-4d3a-3b90-08d88b59b1da
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2020 00:34:22.4248 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q+Kh4bSTgNadLmZ9N6TL0//S572bjT/gMFogO1JGG84L0ETWCCqFE5gfglOJ+PxmTzZliQJUsC+EW3/3ruEErQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4665
X-OriginatorOrg: intel.com
Cc: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>, "lars@metafoo.de" <lars@metafoo.de>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>
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



> -----Original Message-----
> From: Andy Shevchenko <andriy.shevchenko@intel.com>
> Sent: 17 November 2020 11:51 PM
> To: Sit, Michael Wei Hong <michael.wei.hong.sit@intel.com>
> Cc: alsa-devel@alsa-project.org; tiwai@suse.com; broonie@kernel.org; pier=
re-
> louis.bossart@linux.intel.com; Rojewski, Cezary <cezary.rojewski@intel.co=
m>;
> liam.r.girdwood@linux.intel.com; Sia, Jee Heng <jee.heng.sia@intel.com>;
> vkoul@kernel.org; lars@metafoo.de
> Subject: Re: [RFC PATCH 2/4] ASoC: soc-generic-dmaengine-pcm: Add custom
> prepare and submit function
>=20
> On Tue, Nov 17, 2020 at 04:03:48PM +0800, Michael Sit Wei Hong wrote:
> > Enabling custom prepare and submit function to overcome DMA limitation.
> >
> > In the Intel KeemBay solution, the DW AXI-based DMA has a limitation
> > on the number of DMA blocks per transfer. In the case of 16 bit audio
> > ASoC would allocate blocks exceeding the DMA block limitation.
>=20
> I'm still not sure the hardware has such a limitation.
>=20
> The Synopsys IP supports linked list (LLI) transfers and I hardly can ima=
gine the
> list has any limitation. Even though, one can always emulate LLI in softw=
are how
> it's done in the DesignWare AHB DMA driver.
>=20
> I have briefly read chapter 4.6 "AXI_DMA" of Keem Bay TRM and didn't find=
 any
> errata or limits like this.
[>>] Intel KeemBay datasheet can be found at below link:
https://www.intel.com/content/www/us/en/secure/design/confidential/products=
-and-solutions/processors-and-chipsets/keem-bay/technical-library.html?grou=
ping=3DEMT_Content%20Type&sort=3Dtitle:asc
Pg783, "Programmable transfer length (block length), max 1024". Sub-list ca=
n't exceed 1024 blocks.
BTW, I think the 16bits audio could be a confusion because it is not about =
the number of bits, but rather the constraint of the block length. Base on =
my understanding, Audio needs a period larger than 10ms, regardless of the =
bit depth.
The questions here are:
1. Should DMAEngine expose a new API to constraint the block_length (instea=
d of size in bytes)?
2. Should DMA client re-split the linked-list before passing the linked-lis=
t to DMAEngine.
3. Should DMA controller driver re-split the linked-list before execution.
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

