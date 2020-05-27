Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 993501E437B
	for <lists+alsa-devel@lfdr.de>; Wed, 27 May 2020 15:22:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48D1617BB;
	Wed, 27 May 2020 15:21:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48D1617BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590585757;
	bh=La4rwsCsW3hpIIy85hVKxTK2jzGqfZBqj62uzdwpJa8=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=btbq/phA017UEV62wtmeUGjhDYiVn1H86YoAK/cXQtyw/QX4jt8qt3tbTkM9XVHHD
	 I9q92WPbgA3R+TsJWxmmvAp6BxJerapOxTOpA1zC1trL1fxA16rxCoHYvye/zmslnY
	 L/maEwNEY+917lxseKNM00sMNwePI5yeNsYtWs6k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BEB6F8014E;
	Wed, 27 May 2020 15:20:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DED08F8014E; Wed, 27 May 2020 15:20:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48686F800FF
 for <alsa-devel@alsa-project.org>; Wed, 27 May 2020 15:20:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48686F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="f0Qem6tX"
IronPort-SDR: mibrigP6pVsMw7np8SgkeO8RMHv1+6AzjtqQR9v3Kg/CNymuxJD1+TsP43uNTpQbDYYF9Lc/hH
 v7mA/VBw7c1A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2020 06:20:43 -0700
IronPort-SDR: 8dfeufRr4p/80RBqAKtcVaph+rFv0t6dI2lCqLOygEfxkKrThYK4QL6yngqINpqXgnmXsSOmlp
 04Jtfvuf8/fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,441,1583222400"; d="scan'208";a="345530004"
Received: from orsmsx105.amr.corp.intel.com ([10.22.225.132])
 by orsmga001.jf.intel.com with ESMTP; 27 May 2020 06:20:43 -0700
Received: from orsmsx157.amr.corp.intel.com (10.22.240.23) by
 ORSMSX105.amr.corp.intel.com (10.22.225.132) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 27 May 2020 06:20:43 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 ORSMSX157.amr.corp.intel.com (10.22.240.23) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 27 May 2020 06:20:42 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 27 May 2020 06:20:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j3bxhoj45KJ7OYP24fgySisr4GyS9tW2qMI6vvc3YW3anbchU4G7YBOuKStgDsz6Toewdf78w7kmoj040VpKDhdfMlUA9rt1R0kpialwM1mJE6ZzBaPN4E2caiRUmQw1qXoGjNVlExOfiwpFZXFpYQEa2btRkmE14sGFNal5w//NWY4K4MJPg6CmNjZCcMXKZhpQ5ivOjSSdJp7cwjwQykHQKl5B1mseZiRna1RN3t81/9Q3HYHPffIO1oOSMuUf0teWXqBhnwqckpAdSI44k8qTbQDc+vAoDrCznZWHJXl+6gjjgPpED/9lxNZUZPPpMbGTnaCww6aoUvDST71D8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=npwo11XiTLLa/QSJ4g9j3JqKRs87CF7b7zafRt0QJDM=;
 b=eIO8CHEFn9du1JYiG3Tgpvx9JRFZlurtngbnQdYZ5uf/LkwfTgoWAU8wNct2Tnn+g7i0fzoR2G5d62ikft8MalfjmSUvoH2if8lw9CUwXwwNVcwXB5mG06X9VS8BCtesP4T7BTdPgH/5Li+3d4Wyt9BTyEj54zosRzdd09yR9o0GpoCmQU5Eoq2R3umvTCpQZ+CoTdieEaG0EkOr5jrtSmuNPQowxVRUwzNP9SMpE6vNn7rpmk031vMtVWelsoqmn1ez7pRI2ExFu2xw15erckW1U2EytRLYve5j0OX1an9dKKJ1xrQawBxV9w+2Dx0JRZDQOjrRNUmX1N07YBJgeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=npwo11XiTLLa/QSJ4g9j3JqKRs87CF7b7zafRt0QJDM=;
 b=f0Qem6tXKkTLw8+uwDGPBkAmUaS+bwyndOA5hHBw2zTvqD7gMoSCKHfQD2+a/zYF0Go7xBC5r2rpoDMRLniqiyNkDQVumDWks124KVLZCVambjW3wpwPyNe7dyH4j9p25H5ZrNe+mN9MABFjYXzb5tJiUmka1sy8+mpL5Hu7At4=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by BN6PR11MB2034.namprd11.prod.outlook.com (2603:10b6:404:43::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Wed, 27 May
 2020 13:20:42 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::55f9:3fed:cc3e:3855]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::55f9:3fed:cc3e:3855%12]) with mapi id 15.20.3021.029; Wed, 27 May
 2020 13:20:41 +0000
From: "Sia, Jee Heng" <jee.heng.sia@intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH v2 1/4] ASoC: Intel: Add KeemBay platform driver
Thread-Topic: [PATCH v2 1/4] ASoC: Intel: Add KeemBay platform driver
Thread-Index: AQHWLTbTNJJhYwCrg0GqRG2mL+iDu6i79xZQ
Date: Wed, 27 May 2020 13:20:41 +0000
Message-ID: <BN6PR11MB19539E4C24D163FB66434D02DAB10@BN6PR11MB1953.namprd11.prod.outlook.com>
References: <1589768242-4594-1-git-send-email-jee.heng.sia@intel.com>
 <1589768242-4594-2-git-send-email-jee.heng.sia@intel.com>
 <20200518170647.GA28178@sirena.org.uk>
In-Reply-To: <20200518170647.GA28178@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.2.0.6
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.207]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 24dc620e-f08f-4bf8-38f0-08d80240c16e
x-ms-traffictypediagnostic: BN6PR11MB2034:
x-microsoft-antispam-prvs: <BN6PR11MB2034532BEF60B8A3E03B5918DAB10@BN6PR11MB2034.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:800;
x-forefront-prvs: 04163EF38A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KLXVBnJ9nuaUOPyI7ny6axXMPw3qLR4NiyBbruB9P+doPiXJnyt6aZ9du3qGF14SCeYjJZQCtIePtQ1JSiDDVPWsFE1zb+GNrXLFaTNDw6Cq1MF2AwQHpRlz5re23tdnBDeRQliyTrS7Sx+puKG6P6KLsvyfTVbrflqrDqJJrSnXAacUVXpJihNVGiSUyVqXkbzXvA947nIFgtdpAzsyUob7ACNwAe74dIyPt5BOwWgD1cjtkCDP91u6Y/LBa+CA5sGysKt+02Z85L+tg7OiHmjtJhv9kQKtTDZofSV8EQquDX6eecESJ4QdAhlAbeBJVtYmmxvjf7OlqMikboUn/Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB1953.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(136003)(346002)(366004)(396003)(39860400002)(52536014)(186003)(8936002)(54906003)(5660300002)(9686003)(66946007)(64756008)(478600001)(6916009)(53546011)(83380400001)(66446008)(71200400001)(33656002)(55016002)(6506007)(76116006)(66476007)(66556008)(7696005)(26005)(316002)(2906002)(4326008)(8676002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: SaHoRdqRq1UtRVY3zMYW0Ol5rk7VZ5tqc59gkghMH9O/IQXwluBI7tMC83eeGXSMsJ10Lf92Jxxli5UYPMzNGDpIZnev+bRNoMCLd05QFcE86c2l13NCbBYg0doXRHAG55yQzBicCAZLMPNr/iNZSAsqu63VOD7WLAw5O5RGQyyWNCCKTClfWdBvPGcG5p8/nW9Ny0KFpXH2wrcYgt1sAsql2IuVVJpp/nYimLVDckG1qiMnKslhWQZorfrTQ8IwJL7SBMdjm/VrYv13tJJM780hpjtkKHI3TDH8vMNU5Ue3CRmv1r823FDZYqL6d0oRpqOoWgX8GibL7N2b+p/Tq+HSMMtJukScHGNfsCrzduO8Wh/743d/yuyEV7BfGk2bC3/NLrvyvTjj1x4txgjPeCLvvEc8do5V6S8qIXf8nFp/Xzclh3eQQ8go9lkbSlKL6dzdUMVINhvFghnAgYNOgwqw0x+D0C/28WE3I01I2BU4x0vUHqWp+83RnoJBNNHb
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 24dc620e-f08f-4bf8-38f0-08d80240c16e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2020 13:20:41.7254 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SCdiO5/NN9p8O5OhuHchMbnqmPLFlbWRQN5IPrLqF8u5e52dcf4JTBnSYA2tlXU/oMy5bVRBQt+rycL38moPsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB2034
X-OriginatorOrg: intel.com
Cc: "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>
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



-----Original Message-----
From: Mark Brown <broonie@kernel.org>=20
Sent: Tuesday, May 19, 2020 1:07 AM
To: Sia, Jee Heng <jee.heng.sia@intel.com>
Cc: alsa-devel@alsa-project.org; tiwai@suse.com; pierre-louis.bossart@linux=
.intel.com; liam.r.girdwood@linux.intel.com
Subject: Re: [PATCH v2 1/4] ASoC: Intel: Add KeemBay platform driver

On Mon, May 18, 2020 at 10:17:19AM +0800, Sia Jee Heng wrote:

> +++ b/sound/soc/intel/keembay/kmb_platform.c
> @@ -0,0 +1,746 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + *  Intel KeemBay Platform driver
> + *
> + *  Copyright (C) 2020 Intel Corporation.

Please keep the entire header C++ style so things look more consistent.
[>>]  Will below format meet the C++ style?
[>>] // SPDX-License-Identifier: GPL-2.0-only
[>>] //  Copyright (C) 2020 Intel Corporation.
[>>] /*
[>>]   *  Intel KeemBay Platform driver
[>>]   */

> +static void pcm_operation(struct kmb_i2s_info *kmb_i2s, bool=20
> +playback)

Please namespace this function, it looks like a core ALSA call.  It'd proba=
bly be better to namespace a bunch of the other functions called i2s_ as we=
ll.
[>>]  OK
> +static inline void i2s_irq_trigger(struct kmb_i2s_info *kmb_i2s, u32 str=
eam,
> +				   int chan_nr, bool trigger)
> +{
> +	u32 i, irq;
> +	u32 flag;
> +
> +	if (stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
> +		flag =3D TX_INT_FLAG;
> +	else
> +		flag =3D RX_INT_FLAG;
> +
> +	for (i =3D 0; i < chan_nr / 2; i++) {
> +		irq =3D readl(kmb_i2s->i2s_base + IMR(i));
> +		irq =3D trigger ? irq & ~flag : irq | flag;

Please write this as a normal if statement to improve legibility.
[>>]  OK
> +static int kmb_configure_dai_by_dt(struct kmb_i2s_info *kmb_i2s,
> +				   struct snd_soc_dai_driver *kmb_i2s_dai) {
> +	u32 comp1 =3D readl(kmb_i2s->i2s_base + I2S_COMP_PARAM_1);
> +
> +	if (COMP1_TX_ENABLED(comp1))
> +		kmb_i2s->capability |=3D DWC_I2S_PLAY;
> +
> +	if (COMP1_RX_ENABLED(comp1))
> +		kmb_i2s->capability |=3D DWC_I2S_RECORD;
> +
> +	return kmb_configure_dai(kmb_i2s, kmb_i2s_dai,
> +		I2S_SAMPLE_RATES);
> +}

This isn't actually reading the DT?

> +static void kmb_disable_clk(void *data) {
> +	clk_disable_unprepare(data);
> +}

This function doesn't seem to be adding anything?
[>>]  It intends to disable the clock during error return.
> +	ret =3D of_property_read_string(dev->of_node, "mode", &i2s_mode);
> +	if (ret < 0) {
> +		dev_err(dev, "Couldn't find the entry\n");
> +		return -EINVAL;
> +	}
> +
> +	dev_dbg(kmb_i2s->dev, "Mode =3D %s", i2s_mode);
> +
> +	ret =3D match_string(i2s_mode_name, ARRAY_SIZE(i2s_mode_name),=20
> +i2s_mode);

This property isn't defined in the DT binding and should be configured by t=
he machine driver through a set_fmt() operation anyway.
