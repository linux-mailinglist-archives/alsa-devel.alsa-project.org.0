Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4391F31A6
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 03:16:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 137E71672;
	Tue,  9 Jun 2020 03:15:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 137E71672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591665397;
	bh=8zakBahHVn5fDMMic82rm8o8fpyzPGFN5fMbj1QmLTM=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EzYVa2eLqVreBhf92k6PcOgHi0Cq9q3119yLiCfAK4spBb8D2KlY0Gg+pMAUHHPTt
	 HMvbgM8zG2tHsAoTuf3XlRPBED86HyZO7BJljrhw8/Gt7L/TYIhXvVmImG01uhsw0g
	 56upXcEeYDz9rQ8/Y+NNnG6FAFio+mP3HBE5H050=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36277F801F7;
	Tue,  9 Jun 2020 03:14:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 973B2F8021C; Tue,  9 Jun 2020 03:14:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2DFAF80125
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 03:14:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2DFAF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="gyyvLYi4"
IronPort-SDR: CJ+G1vXPZUh/aaBnfXIi4LUjPc8vnMRuetiCFtpkX73cWRqWKupqNTHuX2vuPueQyJiRNPS2Ea
 PhPGoHDqmUeg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2020 18:14:40 -0700
IronPort-SDR: J6ipy7jIw+ET+PJOaatSzkc44+77x5oR1qFxQxVDKGRqqdpsWYQ/1Hrcm1gCagxjL08gxHMJ1e
 zgtnIunV/U7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,490,1583222400"; d="scan'208";a="349350840"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
 by orsmga001.jf.intel.com with ESMTP; 08 Jun 2020 18:14:40 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX106.amr.corp.intel.com (10.22.225.133) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 8 Jun 2020 18:14:39 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 8 Jun 2020 18:14:39 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 8 Jun 2020 18:14:39 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 8 Jun 2020 18:14:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z6ytNtN2obfIWO8JXr/KI0MQbpqlPO3g3avBlWKaX7I9EfZ64wd8cf7umK3NIjylmuFBnl/5KBqFZjOIwfsiet69+1u0xfkCC1fVCB5ey5Or6O8fyb82OQP0mDMm0xvzJGj0ztAe57v6KFU4eHprX+ZaOcTxJXzVonUs93quP/LyYsaxKsQ3QnqDZQ2dKqpou6EdlWGHAdYjInIiQt3gZT84CvmSbMCCWgJie6Rj2roMuMNpBbMihzx98jF+YZBd7qKu4vj4qo79/cImisw0vaJ12kaacG3HHDLabCk2fze0fqBrAo4anm1VY3UvmEdmhcMf0MmtcUjxKaKKOf3Ukw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DaJvwFf7ZzM8HJACK+aaVvusC7eursAcuDftE3HhCyk=;
 b=hrqvk8fhmNkP1InOnbAU86IQYOalCKrR/2mBPCLHMsmAdkygAwrZm7ayCKYDvAC6Ypw8hLxZAl5pmbf19jf/SY7OUkWCewA1cYt6FiwonYpGd3Xm7wRkmYiXYDoOzQ+VdYHSrPtKH7kaQj1/dqnJretg1372/DtBXRpzxceM2VodZYHAUH6CpdWTazWFdV1kh5LOFTSBscn95k2UviBWnFw9bZS4GvT6SBHwScYH1TKAo6Bgbe49LDBfHNkrshBskzs8xXCHd4rBSArSnuv2exdcioNAogB5ArD55wqk88BtbFFO3C3GW0UbBY2Pl+cN9QSINkN1JvaYlaSWrao7Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DaJvwFf7ZzM8HJACK+aaVvusC7eursAcuDftE3HhCyk=;
 b=gyyvLYi4d1Fqw1UqqlBzV/aq9XZNExGjAUV4uDXWJigw2HDI6OiOma+YlT16qk49EfGCPgZr5kU2jd5GKfHU+B2T8M6DmU8H+W/inyjyEQAbg+z3gWJdO4+ME0Zz2weQQ7UB/N3ycVBWoEMZyFpwWb4aJkg/bK5WKiS/w/Ng3ac=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by BN6PR11MB4083.namprd11.prod.outlook.com (2603:10b6:405:7a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20; Tue, 9 Jun
 2020 01:14:31 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::55f9:3fed:cc3e:3855]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::55f9:3fed:cc3e:3855%12]) with mapi id 15.20.3066.023; Tue, 9 Jun 2020
 01:14:30 +0000
From: "Sia, Jee Heng" <jee.heng.sia@intel.com>
To: "Shevchenko, Andriy" <andriy.shevchenko@intel.com>
Subject: RE: [PATCH v4 2/3] ASoC: Intel: Add makefiles and kconfig changes for
 KeemBay
Thread-Topic: [PATCH v4 2/3] ASoC: Intel: Add makefiles and kconfig changes
 for KeemBay
Thread-Index: AQHWOzpHkp5M9VR1EkSbcxnO65AjB6jPf1lA
Date: Tue, 9 Jun 2020 01:14:30 +0000
Message-ID: <BN6PR11MB1953F08FEA36690AFF4ED231DA820@BN6PR11MB1953.namprd11.prod.outlook.com>
References: <1591333737-3231-1-git-send-email-jee.heng.sia@intel.com>
 <1591333737-3231-3-git-send-email-jee.heng.sia@intel.com>
 <20200605130726.GJ2428291@smile.fi.intel.com>
In-Reply-To: <20200605130726.GJ2428291@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.2.0.6
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.197]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 50c44d19-f9fd-42a8-d2cb-08d80c12767d
x-ms-traffictypediagnostic: BN6PR11MB4083:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR11MB40836B15947B4D7244CA6538DA820@BN6PR11MB4083.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:785;
x-forefront-prvs: 042957ACD7
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9A4D70kz2xPbKS/K9o/lCHP+mq3ehzmiMxUFtJqRK3+t8QDFCtYGwyiHiTEJDYOBs7NY347igaUY184f0THkZ2S+o8Iu4BFnn5ti4CduMCxwkygT5amkrj+nSyLHzMHAin2kL587nF3uSguWWwKet2cUNKdob46GBUCmfr4uuGfsG36l0VYrK1ijoNTikrj0fCR0mPOqQ+yYrlOacI8M2fvygrPMhCDjOOhB0s3V/65IxomrSLNIhL7UUi1z8G72SAfiQrrOS8j+Jnd1NrDz5/3Jnvv4iIUkzPlfbTXJq5Nh8g+viB2HrStAs5/kmJhPSyXh45hJ4UtCamhcmWct3Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB1953.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(346002)(376002)(396003)(136003)(366004)(4744005)(4326008)(5660300002)(2906002)(54906003)(66556008)(66476007)(76116006)(52536014)(71200400001)(64756008)(7696005)(66446008)(8936002)(33656002)(8676002)(186003)(6636002)(55016002)(83380400001)(66946007)(53546011)(478600001)(316002)(86362001)(6862004)(26005)(9686003)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: V7chquOFdQucNsDs+yvwvSMoV1OBTe37EUh5FOtN+b92PlqctS72b3e8HhNYumdUyWaCVVOedsgIvMxtV8lH4KYXnWiPYa6mj5yYKLtUD9Bs7l7xO8hYOn0q0CkLvSfZLuBXeDfaBiFUogFP0viOLZkcnTHcxBypQ750zC1MSoCQOrqh7VN+WNEJfgmWAvXZdfxCdNsfONHJdt2g0cOThD46Il5/LW11mqvabL4DxfMWFKDfiJKhbT8MQuxyDN1upeEm29LwxuiPZQ01Yv4zjl+gZgDbsyFpwnlG7TIkZkwduSD8W44SEmDi/HIHgk67JN8cWMHE4DqMV/xj9lEGc5SPGL5wlo2FrIHPEoCYTIOHqueFhsxcXBXX1zqjrj0fqR+mUUu52wkxV8ut7qA9+1xRfYsvAi63BEVVuKnj2zNjCdOulMgcAYP1CtgJI2F8/8Irqhumynz0f9wjOkY9kUuwTQxsJHmvII9n7j4WFgft2jUsfz7rFf2JzZ7rOzwm
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 50c44d19-f9fd-42a8-d2cb-08d80c12767d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2020 01:14:30.8657 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ybBYPrPcN+LNSGA1WKQBUK5Dajypa7litBSwXujLppd6tycmX9p/Nt3B7/IVV5eqNPi0xdYWPVKNIHCDEwie+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4083
X-OriginatorOrg: intel.com
Cc: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>,
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



-----Original Message-----
From: Shevchenko, Andriy <andriy.shevchenko@intel.com>=20
Sent: Friday, June 5, 2020 9:07 PM
To: Sia, Jee Heng <jee.heng.sia@intel.com>
Cc: alsa-devel@alsa-project.org; tiwai@suse.com; broonie@kernel.org; pierre=
-louis.bossart@linux.intel.com; Rojewski, Cezary <cezary.rojewski@intel.com=
>; liam.r.girdwood@linux.intel.com
Subject: Re: [PATCH v4 2/3] ASoC: Intel: Add makefiles and kconfig changes =
for KeemBay

On Fri, Jun 05, 2020 at 01:08:56PM +0800, Sia Jee Heng wrote:
> Add makefile and kconfig changes for Intel KeemBay platform driver.

> +config SND_SOC_INTEL_KEEMBAY
> +	tristate "Keembay Platforms"

> +	depends on OF && (ARM64 || COMPILE_TEST)

You can't compile test w/o OF?
[>>]  Good catch, OF functions are shifted to audio graph card. Will remove=
 it from kconfig
> +	depends on COMMON_CLK
> +	help
> +	  If you have a Intel Keembay platform then enable this option
> +	  by saying Y or m.

--=20
With Best Regards,
Andy Shevchenko


