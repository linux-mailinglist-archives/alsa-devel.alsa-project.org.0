Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70236233691
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jul 2020 18:20:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 168B817CD;
	Thu, 30 Jul 2020 18:19:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 168B817CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596126021;
	bh=rje1aDR2YQUY4lykyjphrA73FuefKlMvh4VC5LrhxdQ=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=edt2mUXMMe/KE7m3GCuCBuR7DQPsoBURld+96NCfGNauZKMvl5qrCHSjZRHtZXsoA
	 WV7n49AyEmOJD5Mm0477E9TtIbfEIDJWnmcCNZTl7WVft5FV4qb009BQO62mcVnZl9
	 s2vgik7DRX1NavYt/jmnzLYigAxdl1irkh0/rG5s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B6BFF800C9;
	Thu, 30 Jul 2020 18:19:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCFC3F8021C; Thu, 30 Jul 2020 18:19:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=2.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,PRX_BODY_30,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2070.outbound.protection.outlook.com [40.107.21.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3A9FF800C9
 for <alsa-devel@alsa-project.org>; Thu, 30 Jul 2020 18:19:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3A9FF800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="KCvIA5g4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I+HXcHBNhRAZ24Z8LCwv5k3dxG81cs+wAjMK5WN0/kjBrJt9NfrBHH0L0lsPgfvzGa+zWhmzG48bibuRxBJ0nA/le8TR205G8yeq6e4YvAQd/tYFUngWRa7hCi6j3gykRSNBvsIEYocAc33AlyLJDCTtG60ue9pmfo3yw1FMqBt6ArdUKHV3KkBQlTW0CX+G62gf9SD11lPlCHQp+jO4zH714KJfNOxuQ0tdPLXRvYviRMg2+s/vsgJjUgnhI0Kp3Ahsi9WLbFhLdMo1XC5Tf9ZgUmP/8r1rjLrxQ7juvxSbrJQn6/GoAT+XqF2hl3eXMiH0xs/wP7OqfXYJhssJbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NzliUBbD5zU+VYi+pxZ81xoi3JVcWuglKnkeRqZhoZg=;
 b=FK8s3mOCq0ZamMxHDpmap2PSk4UREoZhoXpNk+2gnChDAoKT9DoV2bzfMZLC/S1yYFAa4aYKG7E7ctn5uuPNGBMuJ3CCzp0GaoiXOVOLiW2Jfb1UMpyvOrWiPFgLxPl/71wTSjb/XUzW4Osu9vnq8EvckXJ9dat/lb303ptBo6a/hz4eCXt1vUHV/6TWhQnvNYXa9lEJGraaNy38KXncZWfNXyJr96vNBOR86aa/qIu8yG5gEPgN/P9DgRS/W7ExIWLwx4rsLO6YNI4z5hD8gPXr1cjAppw3K8uthSVH9b/5vlrBrxNcnGnwZEkbHNWfK2tu1bvnUjOBM9a6CEWMGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NzliUBbD5zU+VYi+pxZ81xoi3JVcWuglKnkeRqZhoZg=;
 b=KCvIA5g4b3KPcGfsG1sCd+FnJzE2M8xrIs+JWujRp3uhSqlq1OJ1SghAhyOCHO1PMOzNKmJ+uQVzPv5W/aW1whmn2HvIabc489xBREQmRvY6GOIaLm3ATPv99FBUOfTie03FOrqOBb+YLO9sIwYLe0dzsic6/eW5offMDXh0s/w=
Received: from AM7PR10MB3640.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:135::13)
 by AM6PR10MB3077.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:e3::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Thu, 30 Jul
 2020 16:19:02 +0000
Received: from AM7PR10MB3640.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7114:8e7f:c0d1:3aad]) by AM7PR10MB3640.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7114:8e7f:c0d1:3aad%5]) with mapi id 15.20.3239.019; Thu, 30 Jul 2020
 16:19:02 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: "Zhi, Yong" <yong.zhi@intel.com>, Adam Thomson
 <Adam.Thomson.Opensource@diasemi.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "broonie@kernel.org" <broonie@kernel.org>
Subject: RE: [PATCH] ASoC: da7219: Fix general protection fault in
 da7219_register_dai_clks
Thread-Topic: [PATCH] ASoC: da7219: Fix general protection fault in
 da7219_register_dai_clks
Thread-Index: AQHWZnpiUvyyyDmjcEOw5pxm+8Nvm6kgQlAwgAAHZgCAAAB74A==
Date: Thu, 30 Jul 2020 16:19:01 +0000
Message-ID: <AM7PR10MB3640C50CDF650A4710E7B65680710@AM7PR10MB3640.EURPRD10.PROD.OUTLOOK.COM>
References: <1596117868-3317-1-git-send-email-yong.zhi@intel.com>
 <AM7PR10MB3640075298BCB15AFB22A9D480710@AM7PR10MB3640.EURPRD10.PROD.OUTLOOK.COM>
 <MW3PR11MB4665FA01F552E3BCB69EA2F285710@MW3PR11MB4665.namprd11.prod.outlook.com>
In-Reply-To: <MW3PR11MB4665FA01F552E3BCB69EA2F285710@MW3PR11MB4665.namprd11.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.85]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 284bbd41-78f6-4cef-282d-08d834a445a5
x-ms-traffictypediagnostic: AM6PR10MB3077:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR10MB30770A84258F364EDF0B71CDA7710@AM6PR10MB3077.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9V07T6wKyY7ceumhlCYdxxt98Zx1bfF4V2icCGQeEyxpk9vUogh+WeUHRc9tVYvgqS1Rqy7CBxUxCqGX7Tfg5xbEH2YmOds91WU5MEsuSZ4+KT2OTpDqYyXtrrfi6Bd9hWXFUgeNIfnz9qWDwbsdpzdFUOoFIqAGZobr+VrGn5ky6iFpUtVO8ovWOCTa5Po+LPCyxekqvtf8F2KwpUUbpVYCaneRzwnYV+haIN2rAHU7T44BgjzNF9Y+Wk2Zhexcc7jSIjS+oKVa7N+M53TdvlR9ebzU4BpCrJFZyIyrD6oj7HwLZJQbHobSlW1HKxxSXQoPV9FG+ncX0tjZ8027cQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR10MB3640.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(53546011)(66946007)(66476007)(64756008)(8676002)(66446008)(55236004)(7696005)(86362001)(71200400001)(66556008)(6506007)(4326008)(110136005)(316002)(2906002)(9686003)(55016002)(8936002)(478600001)(76116006)(5660300002)(186003)(52536014)(33656002)(26005)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: huN7LpyxiwjvZIMR5ARfu7X5xEwLXmo+dNfvRaTz/J18NK04CPRE5TgDlVit5m8x2twmkIHu1A2KEMxHDYaUEnl5X95f3hAcerM3pz/j0OXZHm/I6yDGtTi7M5O761KP/LQf+vkTmpskDY0tXPixIxqFXkY5gz5FCdxxKxPWzhCfLHy3zsFEeP8ExUVKjLONxE5JTvz42FN2lWlWErRujPZiSaC6Ugy+JGPWen0rWljc/gxx2mnAsR+1yMPhpa7kGsZ5Gr6qTHMA2ROoq+YFBkinnHccyJr/VbH03II7OXJgkq7X2xxlvTLq5xJYVVnEq+w5VjX65JfaBizp+k6JLJCpm7QRSDlJOyHNdxNTpAj+ejYLATbqtibzEs+jjNiWnz2lKEi/qLmSE2/Nnc9rbuY6OOveEORUbKJSlwh5SIwr1xKIsZo0bx8/Cs9ku7ck9MebMmk3YFCKoCtFkdb4PaX9PCG8m/7rUG0nkyZ3rXD7mdO3W0/2Rw5soSjqPYbMyG5dEqQTbwU66LaNq8OVuSrz/PInnmXKykP9xidFTZ2UNJVFRmmSlb2cVpgzxbchquCecz/klMJfouPpZKC8QD5guZtuuG/3HSoVyKR50e1Bj1UK47y1WkbhHFNwijFCr9RmdkTfGHrzKjo5aIzbPA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR10MB3640.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 284bbd41-78f6-4cef-282d-08d834a445a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2020 16:19:01.9174 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SBecKwTAbQ/mA9d7jIsZfL6dN6Rh9OMBUG1XuhJo3pjaMR0BXRJG7jzgxqggQJ1JccencIV5S9czPTZ5WyUR64l2PPT8SqkwV6OJkop8Sfc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB3077
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

On 30 July 2020 17:06, Yong Zhi wrote:
> >
> > > clkdev_drop(cl) does not null the removed cl, if
> > > da7219_register_dai_clks() entered again after card removal,
> > > devm_clk_register() will return -EEXIST, the goto err to clkdev_drop(=
) will
> > trigger board reboot.
> > >
> > > Test commands:
> > >    modprobe -r snd_sof_pci
> > >    modprobe snd_sof_pci
> > >
> > > The oops looks like:
> > >
> > > da7219 i2c-DLGS7219:00: Using default DAI clk names: da7219-dai-wclk,
> > > da7219- dai-bclk
> > > da7219 i2c-DLGS7219:00: Failed to register da7219-dai-wclk: -17
> > > general protection fault: 0000 [#1] PREEMPT SMP NOPTI
> > > RIP: 0010:clkdev_drop+0x20/0x52
> > > Call Trace:
> > >  da7219_probe+0x52e/0x6dc [snd_soc_da7219]
> > >  soc_probe_component+0x206/0x3a1
> > >  snd_soc_bind_card+0x4ee/0x9a6
> > >  devm_snd_soc_register_card+0x48/0x7b
> > >  audio_probe+0x1f0/0x221 [snd_soc_sof_da7219_max98373]
> > >  platform_drv_probe+0x89/0xa2
> > >  really_probe+0x129/0x30d
> > >  driver_probe_device+0x59/0xec
> > >  ? driver_sysfs_remove+0x55/0x55
> > >  bus_for_each_drv+0xa1/0xdc
> > >  __device_attach+0xc2/0x146
> > >  bus_probe_device+0x32/0x97
> > >  device_add+0x311/0x3b4
> > >  platform_device_add+0x184/0x1eb
> > >
> > > Fix by marking (nullifying) the da7219->dai_clks_lookup[i] after
> > > clkdev_drop().
> > >
> > > Signed-off-by: Yong Zhi <yong.zhi@intel.com>
> > > ---
> > >  sound/soc/codecs/da7219.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
> > > index 153ea30b5a8f..54da7cfbb5f4 100644
> > > --- a/sound/soc/codecs/da7219.c
> > > +++ b/sound/soc/codecs/da7219.c
> > > @@ -2369,8 +2369,10 @@ static void da7219_remove(struct
> > > snd_soc_component *component)
> > >
> > >  #ifdef CONFIG_COMMON_CLK
> > >  	for (i =3D DA7219_DAI_NUM_CLKS - 1; i >=3D 0; --i) {
> > > -		if (da7219->dai_clks_lookup[i])
> > > +		if (da7219->dai_clks_lookup[i]) {
> > >  			clkdev_drop(da7219->dai_clks_lookup[i]);
> > > +			da7219->dai_clks_lookup[i] =3D NULL;
> > > +		}
> >
> > It seems to me that devm_* functions should have freed up everything wh=
en
> the
> > codec module was removed. I can only assume the codec isn't being remov=
ed
> in
> > your test hence devm is never freeing the clock resource and is why you=
're
> > getting -EEXIST. Is this the case and is your use-case expected behavio=
ur? It's
> > not something that has been reported previously so am keen to understan=
d
> > exactly what's happening here.
> >
> > >  	}
> > >  #endif
> > >
>=20
> When the card was uninstalled with modprobe -r, the da7219 codec was not
> removed, only component da7219_remove() is invoked, do you suggest the
> component driver probe and remove has to happen with da7219_i2_driver pro=
be
> and remove together? Thanks for the code review.

Well as far as I understand it the the devm_* allocated resources are tied =
to
the i2c dev. If I'm correct then unless that's removed then those resources
won't be freed. If this is a valid scenario then we would probably have to =
look
at avoiding all devm_ calls in the da7219_probe() code as they wouldn't be
released when doing what you are here.

Mark, what's your take on this? Am I missing something obvious?
