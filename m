Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A7241A339
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Sep 2021 00:44:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF13116A6;
	Tue, 28 Sep 2021 00:43:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF13116A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632782676;
	bh=tzaKi0GavlLpL14t56eZgHwrrovSKGCJiDwz8RfhdsA=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kt+X1jSvHA1rNYypxPiT1+nmYiWxbiJmuBd3AWPCH5a88h3hbnxV1iRKosi0ZH7kY
	 z32l4cYk6/udpbZa686s53Aou0A1UbdsMAb5eXaJ+6UZxrMS0+oExZxZaLRgN1u2d9
	 iKRr+Ux3ovZr5gjU7pE4797LG8Ih+u29G9nkUwoM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 276D5F8026D;
	Tue, 28 Sep 2021 00:43:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08E2FF80227; Tue, 28 Sep 2021 00:43:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2119.outbound.protection.outlook.com [40.107.94.119])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54C72F80147
 for <alsa-devel@alsa-project.org>; Tue, 28 Sep 2021 00:43:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54C72F80147
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=maximintegrated.onmicrosoft.com
 header.i=@maximintegrated.onmicrosoft.com header.b="MKH0vgwb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JtefLIfBHz2QgtrRVy9uqUyrbcf2M5rjt4kj3W/ClYP4mukEkX6wzzwfjd+uYyiiMMhwSkFidNDDOzuGwCodHx+t+P4GdbF9dv+8mjCmwmBvDMNEgneikqVDOTodwIwk81CCt93A5ptIiJeu0suwnKu93qIJWjCQcB3YhtjLpedVwqc9URW8sm9hURUC1EwO46qRUoPiwOb7Ia4UIP97rWgdsER5gGURCpbldq53J/MTq87cubzV/vkOhz61hhhhJ8gjSlifvqwUjjnIi4Wx+ePNp50EU7xfUaBz28ovsDpfEi7yRf7uhmM86iss5wVxvA/8Kzoyv6F4GSteoVJXXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=FMnBKJZGeZM8SWOYzf5ugCtif7sDrXef+dx0JnGuAmo=;
 b=fZiJK9d91BFcGiHwQRdt9gQvhQXnTmcii1eOBAjeXsk9aO2UTK89q6t+UvlqS55y0JYn0GYbXlEOp9bfQ8cm7aL3FuiemWsw1SC3pPK4EwiKkj2mJ0iEL1NFL/cH0LMxa8jf438Wf7ii3faiCxgDes2tS12AY3yuQnB28wqlKYCDflLIsu415ZFiWUeb/MBMpwrrojxaP+gPH0K41PneMZMm8kP0Y0XJOkjhy2kAjyxpB6txlrhSJzeE3w/CUZi7YwbDpMTcCrykiwl6IAKY920eyx+kttXXd9ow5WaKYrdPPi1yiRVNoL4KDArFWON9a8sspJKa5x3p4HN0+DwOiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=maximintegrated.com; dmarc=pass action=none
 header.from=maximintegrated.com; dkim=pass header.d=maximintegrated.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maximintegrated.onmicrosoft.com;
 s=selector2-maximintegrated-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMnBKJZGeZM8SWOYzf5ugCtif7sDrXef+dx0JnGuAmo=;
 b=MKH0vgwbITsvDO9vMQj7LfTACn0YztleIymKKxQP7rLxgq2ZkGOVe+uP09BlUQd2lWx1Br28i8pCwvfd3RLUf61+UAw4DSFHHPQeW1zuscVcVo0ZiODFPkSi9pFL0hhTJD0WcuGdvHz9tRQDC+DBpmptnCo86EjE7rPbSiJtQOs=
Received: from SJ0PR11MB5661.namprd11.prod.outlook.com (2603:10b6:a03:3b9::5)
 by SJ0PR11MB5661.namprd11.prod.outlook.com (2603:10b6:a03:3b9::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Mon, 27 Sep
 2021 22:43:08 +0000
Received: from SJ0PR11MB5661.namprd11.prod.outlook.com
 ([fe80::31bb:4f91:1eb5:7178]) by SJ0PR11MB5661.namprd11.prod.outlook.com
 ([fe80::31bb:4f91:1eb5:7178%7]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 22:43:08 +0000
From: Ryan Lee <RyanS.Lee@maximintegrated.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Mark Brown
 <broonie@kernel.org>
Subject: RE: [EXTERNAL] Re: [PATCH] ASoC: max98373: Mark cache dirty before
 entering sleep
Thread-Topic: [EXTERNAL] Re: [PATCH] ASoC: max98373: Mark cache dirty before
 entering sleep
Thread-Index: AQHXsZF45/jZbOMADUKIjx+r35kUIKu3/BEAgAAPiFCAAAR+AIAAC+UAgAAIKhCAACX/gIAAEdyQ
Date: Mon, 27 Sep 2021 22:43:07 +0000
Message-ID: <SJ0PR11MB56614118CDE45D205ACD3C12E7A79@SJ0PR11MB5661.namprd11.prod.outlook.com>
References: <20210924221305.17886-1-ryans.lee@maximintegrated.com>
 <1b21bbf1-12c7-726d-bff8-76ec88ff8635@linux.intel.com>
 <SJ0PR11MB566107A6AB3D18ABDEDCF245E7A79@SJ0PR11MB5661.namprd11.prod.outlook.com>
 <20210927160622.GE4199@sirena.org.uk>
 <7b8c3875-3f12-f3cb-7da8-4e850e59ee2b@linux.intel.com>
 <SJ0PR11MB5661814BCC6B79EDE1B0967AE7A79@SJ0PR11MB5661.namprd11.prod.outlook.com>
 <c5031731-dd58-ff7a-857e-b9e1b748d3b2@linux.intel.com>
In-Reply-To: <c5031731-dd58-ff7a-857e-b9e1b748d3b2@linux.intel.com>
Accept-Language: en-US, ko-KR
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=maximintegrated.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ec4941b7-fcab-4104-e25c-08d982082d51
x-ms-traffictypediagnostic: SJ0PR11MB5661:
x-microsoft-antispam-prvs: <SJ0PR11MB56610B35E52C401C33A7BE81E7A79@SJ0PR11MB5661.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oC4c2aCqv589whG1ODP9jAHcFYMTAzN9hFxPuuPLen1qQahmsPFIR7/B1sN3iDpAk0qy/8NjB+n7A81Xpzj9bdIGVVR3AF+qhTvlMZTlZymIAXgiZWtty2n5f5er2qiINUzvUe4WuynJAQycbQ3gm7fd1hflP42t6NFQ9SmlvJD3A/NtJpRmvEMH+5/tgXNROG9UWPIEsc+C2sKSSM6l+m7zNJ1u0eRlr9Bc50wfrB9T5qO3uDVD4uC2OMgPH+ZSep9yYLNzTS5vcIWhXLQipSThPTCWWZrjG7ojieY8m0v03FQJK9KJJMef6UZUBjGGoKiQK86szMb2mPOO4THAbi6Rhizh4j+oLtDjbc7hQYAMtP2TveoghHwqnYHw12gnZ0Q7lSgHaSj4bF2f/C6ip9dFcfECjZE3hMnsEI4aPoGjBOYLUGv5QuNBMvJMPoGj+eEe069QPnRTaBkYKd7AgCWvXCFiqQtlajyQNYypVMeTuOC7BX+UdE0H4NebbqhK1CqvJT35bQfFBSxStcDIIdjY+f7hOCjFSbRx6OrVMaOFiqfCLmDjFiS6WD/NQ4Lxo85u0rDy3JNFrVrP3mBV7DnGAyyWi29Abg/NQLr9GkAkTBzi3TOMLbfoKQdOoLSD6Z1bD3f2Y6zj3qCBVgR7Fsk1EeNuBCTGGhfJHgT6vOzyq5namO3Bgzkz/FyqVi8WysnenzTfJ+73UO9jHFv6mpAN9Sbo2jRmsUAH6kpJtTknVRUFskVtSS2R7/+FEQ1/nQLAju7ucVisf6ka30paG0274zxo2ZsABlgjFRQN6GQrJh0ftIMGuPd61QnNbbxo
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5661.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(316002)(71200400001)(7696005)(53546011)(6506007)(508600001)(966005)(45080400002)(26005)(186003)(33656002)(54906003)(66446008)(64756008)(38070700005)(110136005)(4326008)(5660300002)(66946007)(122000001)(8676002)(55016002)(7416002)(9686003)(2906002)(86362001)(8936002)(52536014)(66476007)(66556008)(38100700002)(76116006)(14143004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/jg/v3FetDVsQPcDvWfPWgBvAs7pPykJfTa2BYjnU8DV/LmEExcaAy01aoLf?=
 =?us-ascii?Q?q+k1jBwPnr01O8HtOjhY7iwY8mXspU0qwwIbv1LVwxxwvyBzJDZSHehl2iZ3?=
 =?us-ascii?Q?awotReAPcy6SiZIT6WY+Vmdybr2UcP1nd43+Qh+cBh5o2UKN73nBrAFYLAnW?=
 =?us-ascii?Q?C37LLpNaYE/W7ZfpIzTBZ1hW0/Xzgz/fuf8gpdWQSUB6RN+9fUMEgh9DB0Fm?=
 =?us-ascii?Q?Fmx0V/t2NrlsXOMPaeR2nHuLb6VIbSmG1BoAkIXXUxAvjm8keQOc4DsHKpam?=
 =?us-ascii?Q?vKtcd42Oj/u/rDRxsEM4iuxfoxt7oXxPIkvKWfKRg9UFRyFLW5jJ5e7yBE5D?=
 =?us-ascii?Q?6EePi4VBV3Htt0wekQYwOlytgcfM/myM6+6TmUhrgKBtnvddaI/lFvHYbZn9?=
 =?us-ascii?Q?o56ZLqId2La8Zp8/bOXzg0gfW4H9gJA4N3B9cvPFIR0cwt3+PW1oeWrQKnjV?=
 =?us-ascii?Q?KAIHLqlE4hc65onx0BF2kQLwjCWn33Ji6EZL+CFSeD1MGd1LrjzhXfYZU7ip?=
 =?us-ascii?Q?berEUAf+BUvI6PoOtPIbybmjhuQwp2qJ7cK1RduNZBgLJ6wP6iYLjcqnfQxK?=
 =?us-ascii?Q?NPGMjS576rl7uXdNDC367f5vk/2ehMIq8pvRY6aB8Zxcaju30oM8jHFbxgSq?=
 =?us-ascii?Q?RsvTwrgw8OeXRIZfm/COHoSd/AyRv6eKnU6N8o2Ph99ZP7+fOQ2wWkWXFFaX?=
 =?us-ascii?Q?0iLD+hCm2FDBedel4h3lOsIfDtpDAVr6AwFRlSETDOLgwJFHKKSqXvpMIJTH?=
 =?us-ascii?Q?EGlkG7YGFFiW7SRK0Fa+Vvr4hApqG4XwUXUR5XO+hZtTLe6dmBYnYkvk7YIw?=
 =?us-ascii?Q?OZ/fZRonPWJS/+1NKs+no1hYmbSx4WQCRcOQJLGTZq129OGAtz6e0sDGS3r9?=
 =?us-ascii?Q?GhQgtTh3EEkuxejoRgh3ExqD0o3wr+uVfFVoUiv3aZTMhVXn7wdS4mScNOlT?=
 =?us-ascii?Q?DkDwoDQaEZNuNPOc2pajWyEC/8W2GwlwBuEyzb0LY49wgTn/2Ktu8c4eVVGO?=
 =?us-ascii?Q?BWWX8WegMG+o55jRpTnVR1irWCLMghSfB0IzaD7V7XKMjOJKySz5TQkf4Aft?=
 =?us-ascii?Q?4FXSxf9OTC1IbBMNoncnrj1/KUrqj4kRk9tGR/hF5v3hCo/7bNymAyJMatww?=
 =?us-ascii?Q?t6g9cFMtkGr84d78Bwg7DZt9Xne8MAdC7cK04yjaPUmm/30TDGnHO3gJedJS?=
 =?us-ascii?Q?jwmXwDwHYPBCSW/GurAb3003agG+/1S9YQ1u/zQcSbFhQvd3bN9b/shA4m08?=
 =?us-ascii?Q?EOs645b3C+WaZcQh0gPsr8vr+JlspgiITmFgyiL8ymJag62dt5weQTBjVV1J?=
 =?us-ascii?Q?/j1Z63BshyIUusW+/6tdfvNX?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: maximintegrated.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5661.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec4941b7-fcab-4104-e25c-08d982082d51
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2021 22:43:07.9713 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd909df-ea69-4788-a554-f24b7854ad03
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0ZpAaboe3Kecs5gLcR7KRjcwdjWlCgmUFzUQ+cwpboxS4x2Lw1nNJ/WpSKrMb9K40wSYQ0wLz5pbWsMazySdRDDnDu5GZARJ4KW3ChGtJvk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5661
Cc: "guennadi.liakhovetski@linux.intel.com"
 <guennadi.liakhovetski@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "ryan.lee.maxim@gmail.com" <ryan.lee.maxim@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "sathya.prakash.m.r@intel.com" <sathya.prakash.m.r@intel.com>,
 "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>
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
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Sent: Monday, September 27, 2021 12:34 PM
> To: Ryan Lee <RyanS.Lee@maximintegrated.com>; Mark Brown
> <broonie@kernel.org>
> Cc: lgirdwood@gmail.com; perex@perex.cz; tiwai@suse.com; yung-
> chuan.liao@linux.intel.com; guennadi.liakhovetski@linux.intel.com; alsa-
> devel@alsa-project.org; linux-kernel@vger.kernel.org;
> sathya.prakash.m.r@intel.com; ryan.lee.maxim@gmail.com
> Subject: Re: [EXTERNAL] Re: [PATCH] ASoC: max98373: Mark cache dirty
> before entering sleep
>=20
> EXTERNAL EMAIL
>=20
>=20
>=20
> >> Instead of changing the suspend sequence, can we please try to modify
> >> the
> >> max98373_io_init() routine to unconditionally flag the cache as
> >> dirty, maybe this points to a problem with the management of the
> >> max98373->first_hw_init flag.
> >
> > max98373_io_init() is not called because ' sdw_slave_status' remains '
> > SDW_SLAVE_ATTACHED' and 'max98373->hw_init' is already true.
> > Removing 'if (max98373->hw_init || status !=3D SDW_SLAVE_ATTACHED)'
> > condition in max98373_update_status() function instead of adding
> > regcache_mark_dirty() into max98373_suspend() can be an alternative way=
.
> > I think it is all about where regcache_mark_dirty() is called from.
> > The difference is that max98373_io_init() really do the software reset
> > and do amp initialization again which could be an overhead.
>=20
> that description is aligned with my analysis that there's something very
> wrong happening here, it's not just a simple miss in the regmap handling =
but
> a major conceptual bug or misunderstanding in the way reset is handled.
>=20
> First, there's the spec: on a reset initiated by the host or if the devic=
e loses
> sync for ANY reason, its status cannot remain ATTACHED.
> There's got to be a 16-frame period at least where the device has to moni=
tor
> the sync pattern and cannot drive anything on the bus.
>=20
> Then there's the hardware behavior on resume: on resume by default the
> Intel host will toggle the data pin for at least 4096 frames, which by sp=
ec
> means severe reset.
>=20
> And last, there's the software init: we also force the status as UNATTACH=
ED
> in drivers/soundwire/intel.c:
>=20
>         /*
>          * make sure all Slaves are tagged as UNATTACHED and provide
>          * reason for reinitialization
>          */
>         sdw_clear_slave_status(bus,
> SDW_UNATTACH_REQUEST_MASTER_RESET);
>=20
> But we've also seen the opposite effect of an amplifier reporting attache=
d
> but losing sync immediately after the end of enumeration and never coming
> back on the bus, see issue
> https://nam02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgith
> ub.com%2Fthesofproject%2Flinux%2Fissues%2F3063&amp;data=3D04%7C01%
> 7Cryans.lee%40maximintegrated.com%7Cb9f84a1267ec4f50b7a008d981edc
> c46%7Cfbd909dfea694788a554f24b7854ad03%7C0%7C0%7C637683680607
> 026027%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2
> luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DrARkwTSB3
> DN%2BCYxGaehOhtCGEj1eLBl6Mk7QhynQSY8%3D&amp;reserved=3D0
>=20
> In other words, we need to check what really happens on resume and why
> the amplifier keeps reporting its status as ATTACHED despite the spec
> requirements and software init, or loses this status after
> enumeration....Something really does not add-up, again it's not just a
> regmap management issue.
>=20

I agree that the fix is not necessary if the reset issue was not occurred.
Thanks for your input about the status check on Intel driver, too.
I will continue to find the culprit who cause the amp reset, but this is no=
t simple
because it is not only related to Maxim driver but also other things
on both hardware and software side.
I think making the amp driver code more conservative by adding
regcache_mark_dirty() can make the system robust from the glitches between
suspend and resume. This is what I can do from the amp driver side and
the code I added is not new but a proven way on existing drivers as we all =
know.
I just wonder why the issue was not observed when the code is removed.
This probably means there is an external reason which was not exist before.

>=20
>=20

