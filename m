Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB5078EF63
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Aug 2023 16:15:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D04A61FE;
	Thu, 31 Aug 2023 16:14:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D04A61FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693491323;
	bh=UcmkF9iaxxiOU45u+b2T0D8SGtSaz8FLiPg3w5hZTdY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AJz+U2YLw0qYU7SfLnfyonH75eBRtaEC7giYgy+bT7hufsea1PP6se9fnE2ylxGx7
	 y9fzxQjjCtshJB7qSJi2X+vJwQ/bgyJDlgsfexpk2SwHRQyyVxmlAHempfUEdH2t8O
	 RveKZ6m6m+dAxXfaB2h4P01oy2XJ+DnQM2QFn9vg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55AAEF80155; Thu, 31 Aug 2023 16:14:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A8315F800F5;
	Thu, 31 Aug 2023 16:14:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1730AF80155; Thu, 31 Aug 2023 16:14:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20714.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::714])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 45346F80094
	for <alsa-devel@alsa-project.org>; Thu, 31 Aug 2023 16:14:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45346F80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com
 header.a=rsa-sha256 header.s=selector1 header.b=PiTCpNtt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XsFUavamcsCZM4CIzi0L3plAgtOCpsacZZrsPRd0NxeLRsYwGGUbd+SEvDYy7Bebc84On0xpkqTNlUN1lWB9a4msdUzphXg8nVNmooMnMVaTR1SxWcrc0gWwnI6fsk3F76RzHBh1znWBgdrQMAxvP83TZbw2XCPGjUynSNt010YI+0MDxcQ60BC2MKQg/WLW8sxWVmeHhsR2vv823wVmCPU229UAtjhkdlUKR3FZkIFlDttuYB7NcNQXCDyeYLdEGgeLrPw3bP687i4hefzyVBwBcxQ+yo/oEcs1ddVxRVamTK6FQoZUfnGGVRi1ooas+rriJzpoBWUWl8bv2vkm7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=miN9KAF67UGjVzITPnaohPKYR+fp+3frolP/zQc0nf8=;
 b=NW9BLHlYtRuzV7Vhd1Lxt2bRcRreKygGqhSimHJQUHHlcWWXyzbIHRzjhXJxBud/HAGTXb5jmGvHr40en8FC5HBc1oSkp7275VUf81Nv0z+p4O6aMesVJQMCfKRWwPXY55jCDbQ4dUFhlu9OlvIY1l0BZTt853hiVmwpVhvrLYGHaW/u71Xf8iS+uoPw3KoTxPkRfXsgasb9HFhZNVBDO8hcSEAWGPElWTHAMEqt61HyWdjXj/2vdW8b1gAklpFLKtd4uWMVhAJWa+MRKNr6bQhpofCT/yGArqSh3/2C75juxIc80/LoYxuliCAiyBFgc+/TO+lAQewyXOItikHKDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=miN9KAF67UGjVzITPnaohPKYR+fp+3frolP/zQc0nf8=;
 b=PiTCpNttmauWqhdnImtRwEgXzAShjBTdqrS3B31EW0WQxuAGBcI/QjoU/gslx1uBcgubMrHFyJRc92AWzFShxMAQSLQZtJR6Q5zCXskTqr5XvWvy8agAZioZ5xJJJyyFwLLVqX6A8ExGtuvvk9xhBm5yG+hoEvZKYkm5jwkP1lI=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB6094.jpnprd01.prod.outlook.com (2603:1096:400:4a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21; Thu, 31 Aug
 2023 14:13:54 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%5]) with mapi id 15.20.6745.022; Thu, 31 Aug 2023
 14:13:51 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	=?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] ASoC: ak4642: Simplify probe()
Thread-Topic: [PATCH v2] ASoC: ak4642: Simplify probe()
Thread-Index: AQHZ2dl8p/yjHeISC0K+DbA1I4R5vrABZhuAgAAr8TCAAtq6AIAACeSA
Date: Thu, 31 Aug 2023 14:13:50 +0000
Message-ID: 
 <OS0PR01MB592259ECE2542EC0A680B63986E5A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230828180003.127896-1-biju.das.jz@bp.renesas.com>
 <ZO4NrT36gbwc27+0@smile.fi.intel.com>
 <OS0PR01MB5922A08379222B0DF6D0323286E7A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZPCXhDHMVAYHqhFC@smile.fi.intel.com>
In-Reply-To: <ZPCXhDHMVAYHqhFC@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB6094:EE_
x-ms-office365-filtering-correlation-id: fc9bf303-c438-4514-0fb2-08dbaa2c8041
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 nA0DwQiXmJHLGsu3xmDTGIhud7plx2EUQkXzxwicj/4KPFrWXWhBK9OPcx6IvNjNNLxGuUPGTqtBon4BgFV5Z/1ihIktO/pYIvZeLNIMrusqdTU8fwSy5YBQXhtwof2+fkDR9nQwyIPvjh20chtqpx6CEV5snlybVs58UzO9x4f1J4uJNi03JUL/5SDEDvCcMGlOelrwiL3GL53wfQ0T4++PzfV2gSAEkJ5TCObuJwhKzWkO6+wBuk97m+tX3Abl1ISQSwp/+kIvVwyFVgiKbjMNRDkfPhNp46rdZxcCdZVMFQsDH57AsqgI3qzfhtRqS6r4huQE/1Hxw0UoNb7LNEHXlq3+lZ1Rh3HyN4VW5/7XGzs+Qo0p3ruPR1dVTutq94TXSfVRj1vvt6Z4psdNqrE5rvPH5VMr/UxV6JneCjenCkVATLU8KMf5QEJ2VJjiihxphHUPBIAqfUe0JdAqHfM7BibqeWRZOkW4U0MjHg+IPupiWNIl2XJ2kE1NWIB+WL1wrAqYORHbMsL0QIoVzC1MrYpKFNhYkaW2v/OY/HZU0RTEA6L2m2cgYaH30HLX4JoretMpAtlOCrtEg3MbxrYGwwT/echr056BdhP08qwOvsfTfOK3oIkJi9odsDjh
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(136003)(366004)(39860400002)(1800799009)(186009)(451199024)(66556008)(6506007)(9686003)(7696005)(71200400001)(33656002)(122000001)(38070700005)(38100700002)(86362001)(55016003)(4744005)(2906002)(478600001)(76116006)(52536014)(5660300002)(8676002)(8936002)(4326008)(66946007)(66476007)(66446008)(6916009)(316002)(54906003)(41300700001)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?tuowBleZ6msLy+QvqaI3aEHT/OTuZZ+D8JpBOrYHcMMgqZpEfpuuDJgkWx?=
 =?iso-8859-1?Q?VJlO5IP+7DiHymVZo/TgBKhx257M8E7FNqsz0UJatGURAeqk4p42yArBm2?=
 =?iso-8859-1?Q?RIiHlcUkviqFELKK/fzdEUeHMxchsKUXst5Gta02++0RjnGzBAHEiEcDi+?=
 =?iso-8859-1?Q?wc/wUuZBE3yXpB6Z7URrz5stLWbr5k0wUj4mVVTd84Z3r8Sz2z0uvbR1FX?=
 =?iso-8859-1?Q?W9jTpGzry0Roj73K5g8dfL4pqKFh/Ry+S3x65xe8YJ1QeMI0LN2CLJ2b8k?=
 =?iso-8859-1?Q?EXfcFkFXHiX6howRswjjtSNVcN34r30DDTsO8JiqLTgQxlebNrTRiB/YHf?=
 =?iso-8859-1?Q?WHabjDdsqtGek31w5GoRllHk7OdoffzSLvpwIjOcwp+2mLw8ZcEOF8VJ3/?=
 =?iso-8859-1?Q?M9FWsYZ6+0A94GeCnX33o602GOxELeyuj9bU9r/N0t24SjnLEyGXoezFjm?=
 =?iso-8859-1?Q?6T26pMRIaM8gKZ/Plb+z0liA4H4bjLGGXt5DrbAvLhxcJF9Ai+gOgANhut?=
 =?iso-8859-1?Q?aF+6fLYzbg7MtJ/npG/Lys67hXC6Cb1HcNXaTtcLixVnH7YwmZjaRMqqxx?=
 =?iso-8859-1?Q?dRnD6jP9ab5YlVBnDxVTPDs+/l65NK2e7rfAwv9QtyQXu0C8Ai0SeALO5R?=
 =?iso-8859-1?Q?rYGNN+X01rmUWqx++QzFWwvxesmPv6Cu/BaFK5vypTDYAD/5u6uGcWZq1w?=
 =?iso-8859-1?Q?tVp7Z7SkFGxaz6D0sXcTIbKA4H/wGEX453E4R1hh3LUyx6aTWWIxwqd1RC?=
 =?iso-8859-1?Q?T5Zk1ypLiDN9Nr/7H/Hs9YjfbPmh/W5/x47Yc10yT18oJ1LPaSECNqtBHZ?=
 =?iso-8859-1?Q?9be0edqOC48Qcavs4wKA4meq3wM28VaBHplS1tRxqeGxhKcIGLd59Q9t2m?=
 =?iso-8859-1?Q?szVReH4aM0SSHgzgdlGhJJ6xqwacCuWaybCqstHCAmDIip8yFHBkdUaAXk?=
 =?iso-8859-1?Q?5mhuvpq7iFqyFhmYN9qVROn/r5LfxK/vAhQIOfupMY1RPaqSse/DZnDyAu?=
 =?iso-8859-1?Q?LstwAJgRu9kmGTjCgr88EfbLOsm4uMPfg4jTFlFcH3qX6zWyWxkG+y41h6?=
 =?iso-8859-1?Q?x+y886RF+5yFycu+Dbkoep79i0LOR8xow5xrrkLUozeDvbvslbFkm4MPca?=
 =?iso-8859-1?Q?grcLWVZ9G5kzjj56vkiWceu4Im7zDRH8RRnnEKGEEMS6PYHZzfOvfxysyP?=
 =?iso-8859-1?Q?ucdeUIEHn3ZtnsN7IpuQ+5MMn/i1ccKzSFKoDo22JiGRy+dIP7MSLm0Co+?=
 =?iso-8859-1?Q?oP53Sa9/lFiZ0vUbHgYZ0eCE35Hdla3ts2nwHx2lGMwmBPBr3lSeWQN2KS?=
 =?iso-8859-1?Q?X0G1UWfJPX1dLOdUZmM9cWFMkZh0CvRkYP8qpAy0Kx3TFxoh8svpLg30uj?=
 =?iso-8859-1?Q?uiYkuxn4t/RnXueSqEdGHaYBnxdzE3nWUcNqpJEpQdLIgQfnrohxxeTTho?=
 =?iso-8859-1?Q?UG1wLqb4ywKkSjwiIKd4qyv//4lNJdPP5Wwzxl/nUg9bwOwHxXpFiBPEUz?=
 =?iso-8859-1?Q?SGLbCmTwvMnLznKgC+L3gBSbfjijQyXo0A87BNBkBz3BDWhokvqCunZNbo?=
 =?iso-8859-1?Q?/J0/913QuuKR3RJfewOiyRoDWifyWOdcqXbxsGtF9qhz5lT+uXLg+M4B9A?=
 =?iso-8859-1?Q?RcKH/6KaBT0qw=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fc9bf303-c438-4514-0fb2-08dbaa2c8041
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2023 14:13:50.9896
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 6s90kIL0yP+mY2M3MCnJc8+udCmhyULNVbtJyH1DuP301rnifej2FSJxRebpj3P6lhK3M5cIvAQqnUekzDPyNPVTXumASZvMESItVGCGcbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6094
Message-ID-Hash: NEUGEVFDAYGBIJ3GUL4PNOPNXVK6ZWC7
X-Message-ID-Hash: NEUGEVFDAYGBIJ3GUL4PNOPNXVK6ZWC7
X-MailFrom: biju.das.jz@bp.renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QLJHIQJRXX3OSMTMFPCDFY7QID7B6TXT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Andy,

> Subject: Re: [PATCH v2] ASoC: ak4642: Simplify probe()
>=20
> On Tue, Aug 29, 2023 at 06:02:51PM +0000, Biju Das wrote:
> > > On Mon, Aug 28, 2023 at 07:00:03PM +0100, Biju Das wrote:
>=20
> ...
>=20
> > > > -	if (np) {
> > > > -		const struct of_device_id *of_id;
> > > > -
> > >
> > > > +	if (dev_fwnode(dev)) {
> > >
> > > Why do we need this at all?
> > It is replacement for np.
>=20
> I am questioning it's necessity to begin with (even before your patch).

OK, I will make separate patch as precursor to this one

	if (dev_fwnode(dev)) {
		mcko =3D ak4642_of_parse_mcko(dev);
		if (IS_ERR(mcko))
			mcko =3D NULL;
	}

Cheers,
Biju

>=20
> > > >  		mcko =3D ak4642_of_parse_mcko(dev);
> > > >  		if (IS_ERR(mcko))
> > > >  			mcko =3D NULL;
> > >
> > > This can suffice on its own, right?
> > >
> > > Can be done in a separate change as a precursor to this one.
> >
> > Agreed.
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

