Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFB678CBA5
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 20:03:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03FFE1E9;
	Tue, 29 Aug 2023 20:02:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03FFE1E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693332195;
	bh=kZwogf6KozcUoQCcYTZHUAXuxhAhkq149uRGgUYj7ek=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i1KBsBSA2Mu5r8NjLujSUoVQ44hdeMzhwlmm2nMS7bTXvw9YBB9Vubct+l7UYZgpB
	 Se0SNvmsSdtxXw3OmE0OzZ/2g11nRT37rQFyqoSB0chr/OqlpsPbiGxaOwtOOjMZvN
	 hs0ng9wHiabyBmoLI4TZUyYB7c+INCAbOBCo52+E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBC57F8032D; Tue, 29 Aug 2023 20:01:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 33D69F80155;
	Tue, 29 Aug 2023 20:01:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C4F5F80158; Tue, 29 Aug 2023 20:01:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20724.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::724])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D9F2EF800D1
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 20:01:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9F2EF800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com
 header.a=rsa-sha256 header.s=selector1 header.b=DtaDo0ZY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=htv0av6eAhdd66NL68h3+45byHMSsji/lro9F6UkojP4h/2e5yXFHESbn0M0NCoPbF9Nn65AAMaYAnufHtOu+jw0vanAy+nPRdjKvPD0Y2AQDxjNy4fuJXGqizv3ky8ry/pBgTo/Bd2OU/HEDuX73CjjNlN8Y1gxnNG+6BiXxQb5XToYb3NfhZRtGe0y40a9UNgyxMX/DAkkEN05zFrsSMRr74rsgxCR8SIsfMHg9jnfrWkri0EUA+tlOQI65pzhxn61euStj1vlM8Kb9Lq9HrJaB2FV8bHmgGLm7DtuxE0Pm3uYkvNjj2kelWbAqryBaENTsNrnFEDiqO3J2PwxVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IM2ihaXicCSOvUs5hoCUSMmsQxOpBc0PXgFCVV5cHnk=;
 b=hmVJ4IojaX5KGvI+FemrjYwGriJ2QUDrs7yaqUfwkkBMwYyeeezBkfbxkgFedI85tQlyf9hmaru4DjjdYdlq/vBPRh2iAlxTfeqVX3RVJ2B1Qxkc+Mp2T8E/iHZ2jrRZmqHKhxyjZBF1FZNmRIFcIw72EzaTJYLJtOEEd6EEc7x3jIH6EMPTf8q7vZne68PKK3JQO7ogRIDgfROBA8RbKG6Wpqwreu11TyRczaZM8x+0/joTk/FmSQVQwpkP6GQStkIXD0Q03izzMQL7MH2Qicv6IP8Ww/ETpuRzJnPTV+TR8NiUjQNSRV4qV0qhB3uabYymdn6xo2Nxanreg1yKdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IM2ihaXicCSOvUs5hoCUSMmsQxOpBc0PXgFCVV5cHnk=;
 b=DtaDo0ZY7cJ6ohGinLztbAoBG+CnyU0KBkEyPptA7GwK+vU9EueBkMVhuXPzZXos924IFqpcYYGj+anD1IJSHHXemes36ZsF9/JB4YpKelF8bM/CPDCKA5o+vz1+lDATHz/05ZF4le54qF/8eptBrM0M0rnTQA4hx+t5PoWrSd0=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB9656.jpnprd01.prod.outlook.com (2603:1096:604:1f0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.18; Tue, 29 Aug
 2023 18:01:35 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%5]) with mapi id 15.20.6745.015; Tue, 29 Aug 2023
 18:01:35 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: James Schulman <james.schulman@cirrus.com>, David Rhodes
	<david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Charles Keepax
	<ckeepax@opensource.cirrus.com>
Subject: RE: [PATCH v2] ASoC: cs42xx8-i2c: Simplify probe()
Thread-Topic: [PATCH v2] ASoC: cs42xx8-i2c: Simplify probe()
Thread-Index: AQHZ2dfvQzPmUdmemUSS3cPp7+gqgLABZL2AgAAtHPA=
Date: Tue, 29 Aug 2023 18:01:35 +0000
Message-ID: 
 <OS0PR01MB592289296A66DD07BF6077B286E7A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230828174856.122559-1-biju.das.jz@bp.renesas.com>
 <ZO4MhWUmamTqJvXd@smile.fi.intel.com>
In-Reply-To: <ZO4MhWUmamTqJvXd@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB9656:EE_
x-ms-office365-filtering-correlation-id: 07385c07-e0ed-4694-b0b9-08dba8b9fc3a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 erWJbeVY9HlKZAuVtjzlCd2dlWX10K/RG2mosxh5RhkcFLfFB2Cp2eHlJYaIX0OjXvSK+OfuDCqa4B79toqEGDGEzQoApZ5W/AO6io7IhiMtIDt72AjioUx02g0SPigTCcCtDuwaZVDzzsojr/+g4Pmqrp8NG+tuk0ccOPYXm31CHaR4uEJK1hA55WtvwY3gtDEGpl4Y8EW2ZifjY3E2hI0s3bE351+8KdSOAjEVhy/J2JTDcTv5T+ku45XAW8NurIWcecCdHVwZPz36S7pOARP7vQBJUv/7UGeJ0evLVueDHkfy1vszG8qggxBDJto+bjjH7gDGLXGtbyPC20UaTS4tLqZpYomZRwMPUOyYEWX0opgwavaJ11tGeGcv2+ZtN+SmooLzxPpTqIQ//lU8ivLAwf3MbJ2rCsm4WQCa0znQ0nb1wNHv2Rq3bGOP/WR4z/u1ebBZzibrUeYTBqQljsp/MBBw/VuBOrsDS/WurZh5a9UY+zGfsYymiwaVEEvfSPZ+M5oLF0rV2xV6DY0cjhCfjcxozfFE1JblDTlJ48rIQpjoAGCqVqavY5bMaq6tRFfNJguup19LP1KkX8cTU2eLdGo6kKFaYRwvlzPcL2rxbOVHwjq1RHzFaTuTGial
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(136003)(346002)(376002)(366004)(1800799009)(186009)(451199024)(4744005)(7416002)(2906002)(55016003)(54906003)(33656002)(76116006)(66446008)(66476007)(66556008)(64756008)(66946007)(5660300002)(316002)(6916009)(41300700001)(4326008)(8936002)(8676002)(52536014)(71200400001)(7696005)(6506007)(9686003)(38100700002)(86362001)(38070700005)(122000001)(26005)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Z47naJT/7XjUMBS4YViaNOOt09XkwGBmPxpNs1gd6BkgfZ263prK7AGfv0ra?=
 =?us-ascii?Q?ihvEj53tGrAwnro8j1N0oHLTSeeZsRluIHp/zFdDNObEo4vIm/vJ7oC/FzEd?=
 =?us-ascii?Q?D0OU0FnXpwf3JjKDtQia6MA5N8Dy4symH2hUEtWrDvSqqZ9AOmX3WpCifg/D?=
 =?us-ascii?Q?EHtBuikzTmvQ9+RTkZG7Ip/MMk+16QvZiSUD5jW824iHwe7s84AfHWWWbHVd?=
 =?us-ascii?Q?jA+E+JUcs3arF89bTE70kXakPL7QZvTDOJDnvo/1ZH/nqlp/EOXOVk422MrB?=
 =?us-ascii?Q?esxBcnVCGzeFJEgddxX4BllugTXMJbA1CqUR2UWHw809GcIuZBokMx6GR9I3?=
 =?us-ascii?Q?ZP4pSc2/Ilw2OHNHI1rtf5nxgHzzy0AD3cAKgPzKbJIu6vmicNctKiDl3PQp?=
 =?us-ascii?Q?CHEZaeO0M/4svtsi573WpAnb9pArgklIgkdRMCd0O8uyOjn+gjyH0uV+YTLn?=
 =?us-ascii?Q?Ijuq5JboFqt+JwdyCw9tWc/PywmwuOjYUeegyQDSRD4P2tqTEJID2JC5Ru6p?=
 =?us-ascii?Q?US5627zAyN639jaVhvQyRwaLTEI0jLq1bqEMrPxr2y77JPTlMXZ5EAchLK59?=
 =?us-ascii?Q?2NUQl2eYOD29T+MencJPpQZ0nnkBTqKnTAfoXWnbq5rKJNg5t4HyQY1ZaJY6?=
 =?us-ascii?Q?hdJKywK80jycXIgQNIf/tgqadeyz6wToWKkQsQVJThmvfuT/sqVMmRYsTerr?=
 =?us-ascii?Q?1/quTo1WUM+8ewGmeRvI2B601p3anW6L++D4L/ig5O6j/zannpgvZXw5lsE8?=
 =?us-ascii?Q?v8cNMtDfgnx41RFYSylgVreShdgs0vzC6DoH8gX1nz6N/SKBUkvSY+FycVgu?=
 =?us-ascii?Q?NTfKrQGEiWRc5bQ21nyCf4Wa2npqGMQKuhFVEhAau1R69nXP4ThJIm5h/oXD?=
 =?us-ascii?Q?Y8KLkyjKro1f/ePy8KKmvMWaBHzlvtBAd9tkNCvQTT6WN8quo1vtF+aSm3f9?=
 =?us-ascii?Q?AYX0pMRCzCqBT/sALpBfZtpXiqrYZvzHqgGdMXZ0gNPXB67+QWu8uYGbWS1V?=
 =?us-ascii?Q?yoJ7oGTnwJ9UK+fhoxvO4gvgbhthUA0oe41nUB9hdhPOQj9aUuEdO2zYHOc7?=
 =?us-ascii?Q?4ke16yR1np6qcc5Rbny0GJkxeHt2BnWy13W6gzyKyN2khUgmfBHNdozmsv+x?=
 =?us-ascii?Q?ZhrBGCC22Dn9vgCFM27+kfiiibazTmMryXeL4qd+m00sF3XlAoTv18wI9RQJ?=
 =?us-ascii?Q?Bvs4jzLlnPyBb6WBQGf2qXwM6WPMzwC5zcdvffjXV2C8zyEEf3jJAoBT1z+p?=
 =?us-ascii?Q?kvitQTs1mxXfPJpbK2SoRKjBy/7ZGdEBSb37VhC7IQF3ruNUW8LPZlhpbK/O?=
 =?us-ascii?Q?MrgR5cXL5nXXsNCll3UlLf6zibHoPxNyn4OKizQRebT/xR2H6d4f4MDlrMUo?=
 =?us-ascii?Q?ynOsh3F3HVmcr9rdFl/m3m8mDD1ql47OXBXSNkF2ItonNL7hD0uAftdoWKq9?=
 =?us-ascii?Q?tfAz+yhDdN7XCIS5Wv3giOMCMbO0ZE0uZaIJw1ZPkj7LW3Dm3+ebVByx5XP2?=
 =?us-ascii?Q?9E8FIFT9IllxXlWsCuysaf0Wj7ZVksP1u7dNSNu7L+HmhydGokYnLetPLbeQ?=
 =?us-ascii?Q?vz3Ne6qszHv6ioJMfn3wiz40Ykm8p/heFRnyXB7eCE715Ck+uTPjG2MwtR28?=
 =?us-ascii?Q?cw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 07385c07-e0ed-4694-b0b9-08dba8b9fc3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2023 18:01:35.7068
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 S6l4ZrxeeLKj6mm87x21wvwba0SYN0zN6OzQR0t1CR0qEbkK9fYbfdFipsExV3j7vE+551IpLYa9PRhgExhQJ0mjaq19KzOlnKBZObe5vWQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9656
Message-ID-Hash: NZWFH5QQF7EREPTYPE2N2JLJCVMRKGDP
X-Message-ID-Hash: NZWFH5QQF7EREPTYPE2N2JLJCVMRKGDP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4RML7EJEYR6K76KRSFVNI7NV5ELWACDV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Andy,

> Subject: Re: [PATCH v2] ASoC: cs42xx8-i2c: Simplify probe()
>=20
> On Mon, Aug 28, 2023 at 06:48:56PM +0100, Biju Das wrote:
> > Simplify probe() by replacing of_match_device->i2c_get_match_data()
> > and extend matching support for ID table. Also replace
> > dev_err()->dev_err_probe() to simplify the code.
>=20
> ...
>=20
> Can also be
>=20
> 	struct device *dev =3D &i2c->dev;
>=20
> >  	int ret;
> >  	struct cs42xx8_driver_data *drvdata;
> > -	const struct of_device_id *of_id;
> > -
> > -	of_id =3D of_match_device(cs42xx8_of_match, &i2c->dev);
> > -	if (!of_id) {
> > -		dev_err(&i2c->dev, "failed to find driver data\n");
> > -		return -EINVAL;
> > -	}
> >
> > -	drvdata =3D (struct cs42xx8_driver_data *)of_id->data;
> > +	drvdata =3D (struct cs42xx8_driver_data *)i2c_get_match_data(i2c);
> > +	if (!drvdata)
>=20
> > +		return dev_err_probe(&i2c->dev, -EINVAL,
> > +				     "failed to find driver data\n");
>=20
> 		return dev_err_probe(dev, -EINVAL, "failed to find driver
> data\n");

True,

Cheers,
Biju
