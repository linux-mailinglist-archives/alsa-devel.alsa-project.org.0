Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92956233650
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jul 2020 18:08:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0561417BE;
	Thu, 30 Jul 2020 18:07:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0561417BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596125294;
	bh=do9GfLRM7UG28MsSvzky7vKRPNS6rfef6n5/oXUaQ8w=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O03o7WGTZtdVQfyx9cBuS1gnBPNutmlosbazqPPnjVI6v0qHCFkLUZXKO8DBEaOCS
	 q2ZUwOFNGAs8qvkGdhulcY9pKe0kIpy2/cnDpCpDXSRJhXAAD8NKsCTAMC4NE3NCbX
	 7WMS0RkuchIFZC/uy3w42vUJc+jBpifnLh8CMY5o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AC1AF80240;
	Thu, 30 Jul 2020 18:06:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3A75F8021E; Thu, 30 Jul 2020 18:06:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08CACF80111
 for <alsa-devel@alsa-project.org>; Thu, 30 Jul 2020 18:06:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08CACF80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="tcJb6LaY"
IronPort-SDR: xU749Lu+87zRPKmzjlbM07fiy1JJmQPzgauqptsqAoWldQR+xiyRlQb9vAL3/e3hkuESs+zIT6
 IGC89IqgI+ZA==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="216099434"
X-IronPort-AV: E=Sophos;i="5.75,415,1589266800"; d="scan'208";a="216099434"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2020 09:06:11 -0700
IronPort-SDR: WOPFZKWD2NKZUPuP9oKFTf4elPO7NDQjb0TMRKQcaFEJ8YoOFVpzc2n9JKSq1T3s5fRcqwWAQ1
 Bgb115yB9DGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,415,1589266800"; d="scan'208";a="272963147"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by fmsmga007.fm.intel.com with ESMTP; 30 Jul 2020 09:06:11 -0700
Received: from fmsmsx116.amr.corp.intel.com (10.18.116.20) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 30 Jul 2020 09:06:11 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 fmsmsx116.amr.corp.intel.com (10.18.116.20) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 30 Jul 2020 09:06:10 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Thu, 30 Jul 2020 09:06:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WEUk4ZEv4GAaSRdEC4zAz6gxXpkfyo/D0B9av3R3An0n63b1D2QLPUv3W5s8wRs711aGjg2iTqadSGrLzPSUkt+pkWO8lOO4tjReraVK8WcRqpiBCHa8ojI+L+gqOVuUsgmS1HI5v2HDPlz4P9p5YyZ5bmPDiG7/dgfAcyVoZrX8G6Rqo5l6QqB/v9Z8rF5O2n7v7GKq/wSG0yer9hIZqGoWitPGFPr80qTWHUFiz216ZmD6+jpntim3d4ubYtK01UMEddLIMnEViTslzF3/qDXE6gzi1jkiMYjuEn0IMUC96Rk1daFDmZQgbRLXc+SiXb2ye9dtwwtYQGHryewSiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ve5BP53Z2kiEBn4NqEp/YyccPCKgdrllU/lx/sxHoy8=;
 b=Ab0ePAf/Zmr/8+l/3w6JAWSOWkKoR7zTODB3twK56Ql1x7q0LjWFszBkfVLB9AzCYwiwy1DlVbIfpw2HWfYnaDrjQ1H6jDh66bum8CfAw1rXsXGdSkbvim1qsrixJqI8Eh7idhdjrAXnMkxBn/j5eU8F1mI39RYEqX63dIhY8KCs+gNw9wQdseMzEL3ou1Du9VoUsE9m46o6SjqvAN8zRqVYUydiYyCaAVwe/hAK/j4LEOPTXuMoV3+BdGcCejuuUFW+J+4tnVYRqZKglXunM65YhobmW5Bg+n9FvfaVFtE3RqSt3efZlCtxbobXudYOmpxV6GUaZ1ZYtttkag7sIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ve5BP53Z2kiEBn4NqEp/YyccPCKgdrllU/lx/sxHoy8=;
 b=tcJb6LaYLXBVZ+HocPJTJjjFQZC/BwNAdpNNJO4tuSZbfQSA8lWukZZH9f5m3plmU6kzK6QEmFwupHq/M4HwcENP2TwhqjyrNuBByG/KiTXZ40mvP/Ab0K7/GaP353eWVyCJZAafeQxqHf4Uk45WCA1DD2Csv8PM6XpXWMv8IPE=
Received: from MW3PR11MB4665.namprd11.prod.outlook.com (2603:10b6:303:5d::12)
 by MW3PR11MB4523.namprd11.prod.outlook.com (2603:10b6:303:5b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Thu, 30 Jul
 2020 16:06:09 +0000
Received: from MW3PR11MB4665.namprd11.prod.outlook.com
 ([fe80::18a3:e19c:fd98:f75a]) by MW3PR11MB4665.namprd11.prod.outlook.com
 ([fe80::18a3:e19c:fd98:f75a%9]) with mapi id 15.20.3239.017; Thu, 30 Jul 2020
 16:06:09 +0000
From: "Zhi, Yong" <yong.zhi@intel.com>
To: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "broonie@kernel.org" <broonie@kernel.org>
Subject: RE: [PATCH] ASoC: da7219: Fix general protection fault in
 da7219_register_dai_clks
Thread-Topic: [PATCH] ASoC: da7219: Fix general protection fault in
 da7219_register_dai_clks
Thread-Index: AQHWZnpogeP0BcNIMEC2Z6w66lP9Q6kgRk4AgAAAyfA=
Date: Thu, 30 Jul 2020 16:06:08 +0000
Message-ID: <MW3PR11MB4665FA01F552E3BCB69EA2F285710@MW3PR11MB4665.namprd11.prod.outlook.com>
References: <1596117868-3317-1-git-send-email-yong.zhi@intel.com>
 <AM7PR10MB3640075298BCB15AFB22A9D480710@AM7PR10MB3640.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AM7PR10MB3640075298BCB15AFB22A9D480710@AM7PR10MB3640.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
authentication-results: diasemi.com; dkim=none (message not signed)
 header.d=none;diasemi.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [72.180.71.28]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2830f33c-38ba-4c57-6dfa-08d834a278ef
x-ms-traffictypediagnostic: MW3PR11MB4523:
x-microsoft-antispam-prvs: <MW3PR11MB45238BB78039E2AD927888E085710@MW3PR11MB4523.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K31B5J93U6StYmeHo9jBQ4DV0gZ7bnSV7FdK9ypuT5jDMFpWYxefpPwDMwBuuHrzRMtlns9nNB1ZgQ4h00Kogn8rHAf06YfufAus6PJ7nAHb9zmCSedpVk2K8z8500X78BiJzgfc972/xg+Dw8CddfoTqeOY8E2aGKDP738zezNeyLvTW0rHDFeDwVCFfhWNWxm/96nv6YlGBOsWX75BQ3ISGkHLos6Eprh5Gikl/CCWiIa3fuiDyfRLsMuiQ1/QjFsmOCmql8m6xO6tc71786kWLdnxBTQTd8dfU4YjzxEW1gwMgoir57fIggGIbZ6pce6yJkjtap7PMILQWECG7g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4665.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(376002)(39860400002)(366004)(396003)(136003)(71200400001)(316002)(5660300002)(26005)(33656002)(4326008)(186003)(110136005)(53546011)(6506007)(8936002)(7696005)(478600001)(66446008)(76116006)(86362001)(64756008)(83380400001)(66476007)(66556008)(66946007)(52536014)(55016002)(8676002)(9686003)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: TcR8pRA5eTf78iViftalI1+Nza90SmphKV/oaoMLSWHh9A0cfIA7dLleOMcH+ukbnh5f8QlzJ2LxF9xV6Q6Qm0bzOmlyEwuknxvcIx8AlAePbHhERE4jNI4xI8QuX02Ebtwpf4nsCPrRdtDUQsmdCPduuDGUZ29T1auooi52DfcZBW8uOnZsSfGLMDksDlJKLXB9/j85MVgTXYwR5GofyLtGCuRNiUWz6dlTveeOYM5Dx4PSLMCIF+bTSCtz/bQTLbaFyoPIDOj9a8gf+rQH6/ohO9P3xtTp0gLUJMcJ3JoeOlnqt8bqAM+tAFvbAVq7TC+Z5dGdl8d/uU60jus2N8+dP4UbepDSVa3HxQlLtb2JtiCDuJwSzSwViJMpqsaKXUNa44jEI4sjEysAVqZ3bgr15yzbKLYRK7ynNRv6UvZrFL02K4DcIHbAMwj9ac5qGv12uQ1S4X45KPjKcu+ymLsMGLmwi/l8NLprTHb+qfxUFEEdLBqKfg6r2GM3YRkNKMaw+7k96RIE2K1S9J7PdvOr7fRmUWVJLy44mrFxxMGEpWbQ/3zEC8Td29D/G65NLU4WVLiFWzfnw9MM7djt885EAsCW9QoBF+oaWZ1+OfOIxiaYfgkKx6KsjoB5BUbdLf86uKhVkTATHFmZrsMUpw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4665.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2830f33c-38ba-4c57-6dfa-08d834a278ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2020 16:06:09.0511 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: roDTRlMmAaMdnywO45IWSRIkmVyxwY3SNvUtsTO6tNdrhV+j2b9DAsPrNmh6NEuj/qA5Crpn+uIQ7Aooy9EHtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4523
X-OriginatorOrg: intel.com
Cc: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>
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

Hi, Adam,

> -----Original Message-----
> From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
> Sent: Thursday, July 30, 2020 10:54 AM
> To: Zhi, Yong <yong.zhi@intel.com>; alsa-devel@alsa-project.org;
> broonie@kernel.org
> Cc: pierre-louis.bossart@linux.intel.com; Adam Thomson
> <Adam.Thomson.Opensource@diasemi.com>
> Subject: RE: [PATCH] ASoC: da7219: Fix general protection fault in
> da7219_register_dai_clks
>=20
> On 30 July 2020 15:04, Yong Zhi wrote:
>=20
> > clkdev_drop(cl) does not null the removed cl, if
> > da7219_register_dai_clks() entered again after card removal,
> > devm_clk_register() will return -EEXIST, the goto err to clkdev_drop() =
will
> trigger board reboot.
> >
> > Test commands:
> >    modprobe -r snd_sof_pci
> >    modprobe snd_sof_pci
> >
> > The oops looks like:
> >
> > da7219 i2c-DLGS7219:00: Using default DAI clk names: da7219-dai-wclk,
> > da7219- dai-bclk
> > da7219 i2c-DLGS7219:00: Failed to register da7219-dai-wclk: -17
> > general protection fault: 0000 [#1] PREEMPT SMP NOPTI
> > RIP: 0010:clkdev_drop+0x20/0x52
> > Call Trace:
> >  da7219_probe+0x52e/0x6dc [snd_soc_da7219]
> >  soc_probe_component+0x206/0x3a1
> >  snd_soc_bind_card+0x4ee/0x9a6
> >  devm_snd_soc_register_card+0x48/0x7b
> >  audio_probe+0x1f0/0x221 [snd_soc_sof_da7219_max98373]
> >  platform_drv_probe+0x89/0xa2
> >  really_probe+0x129/0x30d
> >  driver_probe_device+0x59/0xec
> >  ? driver_sysfs_remove+0x55/0x55
> >  bus_for_each_drv+0xa1/0xdc
> >  __device_attach+0xc2/0x146
> >  bus_probe_device+0x32/0x97
> >  device_add+0x311/0x3b4
> >  platform_device_add+0x184/0x1eb
> >
> > Fix by marking (nullifying) the da7219->dai_clks_lookup[i] after
> > clkdev_drop().
> >
> > Signed-off-by: Yong Zhi <yong.zhi@intel.com>
> > ---
> >  sound/soc/codecs/da7219.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
> > index 153ea30b5a8f..54da7cfbb5f4 100644
> > --- a/sound/soc/codecs/da7219.c
> > +++ b/sound/soc/codecs/da7219.c
> > @@ -2369,8 +2369,10 @@ static void da7219_remove(struct
> > snd_soc_component *component)
> >
> >  #ifdef CONFIG_COMMON_CLK
> >  	for (i =3D DA7219_DAI_NUM_CLKS - 1; i >=3D 0; --i) {
> > -		if (da7219->dai_clks_lookup[i])
> > +		if (da7219->dai_clks_lookup[i]) {
> >  			clkdev_drop(da7219->dai_clks_lookup[i]);
> > +			da7219->dai_clks_lookup[i] =3D NULL;
> > +		}
>=20
> It seems to me that devm_* functions should have freed up everything when=
 the
> codec module was removed. I can only assume the codec isn't being removed=
 in
> your test hence devm is never freeing the clock resource and is why you'r=
e
> getting -EEXIST. Is this the case and is your use-case expected behaviour=
? It's
> not something that has been reported previously so am keen to understand
> exactly what's happening here.
>=20
> >  	}
> >  #endif
> >

When the card was uninstalled with modprobe -r, the da7219 codec was not re=
moved, only component da7219_remove() is invoked, do you suggest the compon=
ent driver probe and remove has to happen with da7219_i2_driver probe and r=
emove together? Thanks for the code review. =20

> > --
> > 2.7.4

