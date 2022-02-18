Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F94E4BB45E
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Feb 2022 09:37:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F784175C;
	Fri, 18 Feb 2022 09:36:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F784175C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645173442;
	bh=ULns99iNtP2VCBuKrSgSr72hY6Xf/UDEV5sxGYx+Bwg=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tst8mbJYBzs6aZkvsauFSFZf4NfNYmyd1b9Cka5AkJTLCgLW39CtThwCoaRwU4ldH
	 xigd2pQ9PG1l5IZvx2Hm4vthe+HmnkPCUxgJ6bu1Qedk+lXh2wmHwprgE9XOTxQGlq
	 I6kS3+/TPTga0kgnE4WfBci7c0kttO5pjnogqdEA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91704F80154;
	Fri, 18 Feb 2022 09:36:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1772DF8013C; Fri, 18 Feb 2022 09:36:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B01DF800FF;
 Fri, 18 Feb 2022 09:36:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B01DF800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="UKdD2/m9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645173369; x=1676709369;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ULns99iNtP2VCBuKrSgSr72hY6Xf/UDEV5sxGYx+Bwg=;
 b=UKdD2/m9Ux6Njg+6Edeg0zXdWWjwqxcpzDu1fmuABPPlALRQbtq26yRh
 TD3fVSwAyB1vcCx2pjKaj5VIHShFmOxRiSqRqJ/XdmI3OHPws5g0Zjvtp
 UmoWicLnZCVLsW7XzjNgGbsVkBcA/cY3tcB/pk/otDsY0mf10RCeyURFE
 ivD3G5D6pWkXvAmdUfYrxXsZouKcQWbav3Xdav4nz1Cjn3X4FGSwlRWSH
 6wQ0wOqLs3TLUX14ZO4PPHuyOrSljR+DCtU6qu5PMpNO1gIhnA926XWFd
 JPvisUR6iXFoevkWf4acFAzJsPmtnvC8yO/VsGacVd5xqBGkOkdTiD1tI Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="250838955"
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="250838955"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 00:33:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="503922106"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 18 Feb 2022 00:33:28 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 18 Feb 2022 00:33:28 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 18 Feb 2022 00:33:28 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 18 Feb 2022 00:33:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OY0wjbN7apTJrbgGrnAHRxErpE58Bm7WUxoLryO6N0vKHGSX1W+IVqYrijBrzJCNbAVuWW6UdE3LEOV7f1o0mVHVBZJaIVNCOz+5DYwbUK31il61vBnPNN/i1km2TiSSUufSLrIlA5XRfZd8C6LWZ7Ab/hIAzkZRfhIvHtpH+wrGivweQ5E6W7cnVIfmYIr1My0mKLwYDEwHt2Dm5WuXBHHRIpyttvNNghQh+dzIJn3FxaGs32AFvFIfbOcwRto0wSfcz3Rv3Q1IyDCIOPTjg5sZD8jLgGFTA9AmVvUANlCSm9JFOjwrDjwlLutsYE1ExrpNs1LPWdZ5TgOPoIF7/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rCGOyjM+IM38G2O5YjDbBnWgHUe8w/FQTDuyTdh3ON8=;
 b=DTo3KQ4NvsWdfxH3PGtrXOxVzc7Jvu9rNhTtgmSZilUoDMZuaR7jC435nbu5WRoX49/4v1S6Ifad/yqdsze2h2UIVqPgKSMd5nG0Q0QhJ6qPT44b3xUmFHQ2Xavpi2MRihThRgH3ECgzI/1dMLFsERT2qNrHhSLp9ld4YWjBSfqYqGiIWR68PtPgogddA8EgYEzYqGFiyeES16U1N+dKRVC3yFhLs63TnHlL0oawBcPEXxutmj3o3uAY1SdfvTMDHbsqlevHqQyelPTPQmSXuAa22mXx3jgrcRFjuaam0BM1R2+uFqTBWKJzvoHDilSHjEIvWaMXiMOSNnq4ciN01Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SA2PR11MB4891.namprd11.prod.outlook.com (2603:10b6:806:11e::18)
 by SN6PR11MB2829.namprd11.prod.outlook.com (2603:10b6:805:62::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Fri, 18 Feb
 2022 08:33:26 +0000
Received: from SA2PR11MB4891.namprd11.prod.outlook.com
 ([fe80::f437:9b7d:d749:a7]) by SA2PR11MB4891.namprd11.prod.outlook.com
 ([fe80::f437:9b7d:d749:a7%4]) with mapi id 15.20.4975.018; Fri, 18 Feb 2022
 08:33:26 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH] ASoC: SOF: Intel: Add topology overwrite for Felwinter
Thread-Topic: [PATCH] ASoC: SOF: Intel: Add topology overwrite for Felwinter
Thread-Index: AQHYJKHaUwv5L/YC+U2p0OZj3Ae6BqyY+oNQ
Date: Fri, 18 Feb 2022 08:33:26 +0000
Message-ID: <SA2PR11MB4891A49E88D16FCAFC5D115E97379@SA2PR11MB4891.namprd11.prod.outlook.com>
References: <20220218082741.1707209-1-brent.lu@intel.com>
In-Reply-To: <20220218082741.1707209-1-brent.lu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7d785d5-7684-4645-1730-08d9f2b95558
x-ms-traffictypediagnostic: SN6PR11MB2829:EE_
x-microsoft-antispam-prvs: <SN6PR11MB28292BA526FAD83636A58E4697379@SN6PR11MB2829.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ovGJujWcXXE2NxGSplPm54lmZpfLq91uCXbHb6iYd07VhFqL1AGFBi8p+E+a28J63URHp3P9Jx7wh2ygwdzoqjeSsukZgoxlVFGSkEDM4RbNy6l+3hNRfKIMI8m5yMM/qatMI4g5iCVcWjJ9ZARTde+BOpVQu91QiAG0x8UnouLIhs8xFWB7SdWgowF4rV4fLBhvV/ipLQK4UsG7uHB/+65LN8goVAEWcZm7dvw9ugi3ImyAueRqG2fO0El7/JUV6Kzig/EPg/Z7aOoXqh2QXUZ6ReTAuMrw915JpTsQjvVnbsAtT4bPx5BIzyc0ywtkMjsVNE+9zveW+L3G93ip/He782prfU8cAw6yoYY/uAbryqC/1tXFwzUFtGGUohjzT7v4pyErOOR7wwEvOrdOPinbfRjo/M3b5YDo+iFQEQO+yx7h8SZSdRdsRM4duWW5HesBSxFw8Ma4UNOAKp5/Q/PYz2/IzZ0hpEc0pYb8z/XV+WrHg4hq+cV/K4KErog4drh0i+4sjPEP3TjcT2yCkBC1mohjCerL6jzvEAgBrPAk6e4maIB2RNNKxO68TnOqnql3Fh1+Ob9BuhbRMnIzi7vcLEl7dZ00oUQcHxRWuWCMNxyN63ftKBUjxa7cjLtLcqUXv0PooqGoG8gnHDKZr4+jy8+X8VeS9y0naEmOtLScIKwLL7z/jwvhfWf3CAs6hN/nJ8LvURZ84EMUhMvwnji9D5h1yQm2jNT0pFrPf81mb0XTZm+T//j7MVB5ZEI8M7hd4UeP1HuH2IcRZUD3GC+I5k8wPaFw1rYEOtrScuQFG8o1WQ+quyHh5xGfRQPc
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4891.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(55016003)(2906002)(26005)(186003)(33656002)(122000001)(966005)(86362001)(82960400001)(9686003)(52536014)(7416002)(8936002)(5660300002)(508600001)(66946007)(66556008)(66476007)(66446008)(64756008)(76116006)(38100700002)(8676002)(4326008)(6506007)(71200400001)(7696005)(54906003)(6916009)(316002)(38070700005)(11716005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lJdO1LUiFVnGXn5T54Pmt7YytPh6TaoZLO09b18zd9MO5hX/7sLH51pKev5Y?=
 =?us-ascii?Q?DcKaZQuAoprrsEvbs/ovmg/LlBjtI/0jYWMFw4SmXYlwzXzrE/pGPj0avI3p?=
 =?us-ascii?Q?o5tyV66NxSAn0SCYPEF53nJbgf6hzElT7x4UtXmOFjiK4noTC0KLV7IntTCw?=
 =?us-ascii?Q?3umMI9U0J1XTXEWpvyx/rLTLcN3wHKFak3EiIynBAdLocGILLvERbwZnFoMc?=
 =?us-ascii?Q?ltSX0DpH1rDtOf5wi9Mkl+MWKpWXWUwmiay2rJcj+hGHSK4Bjd16cdVrzyg4?=
 =?us-ascii?Q?6kbxDrARtl3qO8Iizal5j9C0Vl+SG3SXLaXVq1idDHSZoFDD5ItqBqjh3/kk?=
 =?us-ascii?Q?56UdLmsfpipDWHd1PQYm4+KniWgg1+8mY6qp9oRofrWhM4VVGSFKk0ZkUbG+?=
 =?us-ascii?Q?tsyerIjOn/rakIa2YId+UMdBJ2D8rh3pwAa3IrEm49PAJTrpX0ub8cutLqbh?=
 =?us-ascii?Q?AB+yaUhSo4Q3/an6j3U0hOEEGXfsWk7SsMRM5/c9PPV5UtzIZYjMFugECg6c?=
 =?us-ascii?Q?U74rg/wTF7rPEtUS7nL6ztOZIs1i3IscGRZ0SbASI5RWVgS/J/3MlPoeWLjF?=
 =?us-ascii?Q?I+RTIBvmcUkeLtPkQYOivMnMPVltyhlBsJc+mCKRdDu1suDQxbZnNhxdQdWO?=
 =?us-ascii?Q?PH3TzEg7B4n+mJ9qTT4LGhZzIhIEV0ZEQ226+IJLCHPanJf1hIX/J3Bg1MtE?=
 =?us-ascii?Q?1A28aL+0nBiP2CZskifgVuuRtCmtv/Nf1n3pNgR3TRRUg7GbLolp3NL/NKf1?=
 =?us-ascii?Q?tR516KP1jlOOE+3THb51vTr8VCSausppFkrJ/2cVtGhtYcnUDhZCfHkiefzi?=
 =?us-ascii?Q?/R0xri9c5AfKOnbncMIC2jCSqkoCbkkKD304Qa7k0nm1esCJpuDN4jQay9O5?=
 =?us-ascii?Q?T1wNAj8lkOQcSKs8cBzIQtjG/eCTHtCaKXrM2cgE16YPUBQQMz/NIgkyazyl?=
 =?us-ascii?Q?RvdG4dQugQQTwRGqzTZn+91REv9VLz7zwFOjouD2FrrsGzM2yUksqkxi2Hjf?=
 =?us-ascii?Q?J3msbuRrDQnoPNys4nAfa5pLCTe3eqeGnLJpHWWMSxbQVgeSeLKWxjRTx1Qu?=
 =?us-ascii?Q?l1uKr3LAZRRyUgfIjEJAoKWbj43gWB0ULS7xDHrC8lCqkEOdSkIcyq8rtO1C?=
 =?us-ascii?Q?8AgpvcPyQ7u4J+6kld8pP23JdcZ4ac2qkYJmR0JcvIaF49we88Xq40yfe4Rp?=
 =?us-ascii?Q?bKiNoz+YnnHHgnmRjOu6pc631iAeBDoSPfa2xzNSd6n09QAmbaW5DmuFDpZF?=
 =?us-ascii?Q?R0F9/TGdXVwoW9ugX/fY2i/cDzz7aohRZDmB8rCqHgS0CIG7CI3szHzP8XO4?=
 =?us-ascii?Q?+yw5A439KDNfGrcdLczAki2+s84BV/pxNTOY6fGr077s2VhBsZDY+wbIZezb?=
 =?us-ascii?Q?BALAKyPbzoHks+fYpC+7Q9hAfOdurMxkKyriO3nPj5012/qvJNIvgCiiJRE+?=
 =?us-ascii?Q?CV8/DEwWWVDZripTdeFUmSkIzaKbB6A17FABGaZAm06AweEel9APslvBX6IZ?=
 =?us-ascii?Q?j/NxgI8NO3jlPROTxM0pwa8zoI4+Z9buUxC5RH/1DsJtLFfEokkNYIIUJXqf?=
 =?us-ascii?Q?FE4dL1aB5KzDO0vzKVAfo5E3V/cNp8/vV4i1EGdEpXwbEsYqPay1IPYrp8GN?=
 =?us-ascii?Q?2Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4891.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7d785d5-7684-4645-1730-08d9f2b95558
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2022 08:33:26.3875 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /fN3rhPz/pDujf1vcLyZnuFjgMEHlutZ+RIsrsOhrtEXTPW+aKyVXT6A3zX9tnYMI2op6bwN1c3Ludl+InR4uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2829
X-OriginatorOrg: intel.com
Cc: Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 "sound-open-firmware@alsa-project.org" <sound-open-firmware@alsa-project.org>
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

>=20
> The Felwinter uses four max98360a amplifiers on corresponding CH0~CH3.
> There are four amps on the board connecting to headphone to SSP0 port, am=
p
> to SSP1,and the DAI format would be DSP_A,8-slots, 32 bit slot-width.
>=20
> CH0: L(Woofer), CH1:R(Woofer), CH2:L(Tweeter), CH3:R(Tweeter)
>=20
> Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
> Signed-off-by: Brent Lu <brent.lu@intel.com>

Already merged on SOF tree:
https://github.com/thesofproject/linux/pull/3271


> ---
>  sound/soc/sof/sof-pci-dev.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c in=
dex
> 20c6ca37dbc4..61f2afd54c3e 100644
> --- a/sound/soc/sof/sof-pci-dev.c
> +++ b/sound/soc/sof/sof-pci-dev.c
> @@ -67,6 +67,14 @@ static const struct dmi_system_id sof_tplg_table[] =3D=
 {
>  		},
>  		.driver_data =3D "sof-adl-max98390-ssp2-rt5682-ssp0.tplg",
>  	},
> +	{
> +		.callback =3D sof_tplg_cb,
> +		.matches =3D {
> +			DMI_MATCH(DMI_PRODUCT_FAMILY, "Google_Brya"),
> +			DMI_MATCH(DMI_OEM_STRING, "AUDIO_AMP-
> MAX98360_ALC5682VS_I2S_2WAY"),
> +		},
> +		.driver_data =3D "sof-adl-max98360a-rt5682-2way.tplg",
> +	},
>=20
>  	{}
>  };
> --
> 2.25.1

