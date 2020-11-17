Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A07B42B6CE7
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Nov 2020 19:19:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2177D1753;
	Tue, 17 Nov 2020 19:18:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2177D1753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605637163;
	bh=FXhh/ShbAe4+YZr9Wid/MaNhPoPbIcm9wNaeqY4RfPY=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DthnxY0RTNJJYfw92OmjFHHlKvyXFB1S73fg40uMoNKVISQnLC5yZ716+s5TMP2XX
	 2y2tZrRrKn59LjugMKeMy6v7552m4BwIDrj+WnEwr1RWtLb18+Oz5oAMsve5HIm3zc
	 w1R54DCNvlic1fOjhTlTMi/XnxPv6P36CtRZi8TA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0B46F801F9;
	Tue, 17 Nov 2020 19:17:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80F3EF801F5; Tue, 17 Nov 2020 19:17:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00048.outbound.protection.outlook.com [40.107.0.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81A79F8010A
 for <alsa-devel@alsa-project.org>; Tue, 17 Nov 2020 19:17:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81A79F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="jtNI5T2O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GOyU3ptl8NIcjv654ZryzXlhp+dX/OMV9Rq5agibrO/gdwm5qGxs250UW14nk5M7JisV8dWSu0BTSVNYaLEL95+cUdjuXgodpejR/y1GeBGN9Xd4tnrkChCRlDDRaBHfUoAHo3zGd1JwkZAnvTkMTHAgITOfqxb7PvynX1tT36T9G35Jqz2Sc6EjeG84lD7ibsI81zJUqmwpMYvdr2TRD7Zv8sE8fsAnlwecVHp21O2teQQcCoMHLUu/sCweLo6ewcD4D2Gy3hacD1TKonCswJNTrdkjs9I9F0heLLgdmIXc4AJB+NOntyBZLt6YBSLkQyr1R95M0puk0g2chHkZAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/FH+1HEPDWslQy4dVl5myFgcETpwETMgQ87HdqWCm0=;
 b=K0SCnCZvjrxRP13F9/1pfdPFG42wlgRxQnIJL6z82cnjkCJJO7FXRTNUNfi5mBF3D0Qd8EXObx0LI6cNGkeU8gXxS5/WyIlOby18VM+KxE28gKKqHmId3mFmVZ8EWI7G/itF9N8SEypaYkTuIkwEbrt4qgkHi3AIEMf0ymWQRwmCZkdQxSJqNZXokKTMyc6Ar6DKp90IAfPL/IAjHKLcdVtmhEn0lFaSiAySyUzm5M6d/nS/1lRbL6xzil789IvdqnszQeoTebivUtP9qCCLE6/zN9Ugox/2fAPaw6FGpiRBWvTZ1070UUdlu66yFqbC7lxKu9uL1CLm1AlV8mtZKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/FH+1HEPDWslQy4dVl5myFgcETpwETMgQ87HdqWCm0=;
 b=jtNI5T2OXbYBJz/IcwRgGG/6RSl1hiKe/CdD7PkXlybT8xOG9Oc0LwwMMOk+QklBhmu6kD9hoQ5p+oQ3N9cLPzSEsZJ00dN+7rK/5C1AfP7R0skJOa7h27/P7MjHc5MIOxVnSdo4JvjKBeCxo6pEKqLdCN46Sx1TLtxnhl8KNmw=
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 (2603:10a6:800:31::12) by VI1PR04MB4543.eurprd04.prod.outlook.com
 (2603:10a6:803:6e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Tue, 17 Nov
 2020 18:17:36 +0000
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::91f8:d96b:f238:7962]) by VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::91f8:d96b:f238:7962%8]) with mapi id 15.20.3564.028; Tue, 17 Nov 2020
 18:17:36 +0000
From: Viorel Suman <viorel.suman@nxp.com>
To: Mark Brown <broonie@kernel.org>, "Viorel Suman (OSS)"
 <viorel.suman@oss.nxp.com>
Subject: RE: [RFC PATCH] ASoC: ak4458: use reset control instead of reset gpio
Thread-Topic: [RFC PATCH] ASoC: ak4458: use reset control instead of reset gpio
Thread-Index: AQHWvGa/ULTQkQTG3EuXXoMLDy7cbKnMmESAgAAFAkA=
Date: Tue, 17 Nov 2020 18:17:36 +0000
Message-ID: <VI1PR0401MB2272061C958E91FCAA239EB892E20@VI1PR0401MB2272.eurprd04.prod.outlook.com>
References: <20201116222036.343635-1-viorel.suman@oss.nxp.com>
 <20201117173901.GH5142@sirena.org.uk>
In-Reply-To: <20201117173901.GH5142@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [5.12.106.221]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7effa19d-4876-4d0a-cdc5-08d88b250f83
x-ms-traffictypediagnostic: VI1PR04MB4543:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB454370CD7F4F6448040179D792E20@VI1PR04MB4543.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bjiKswBbzijLn7gimbWwXhJtvwsBFouyxTn61BozVVg5zKWtLvz+4dIC+GidoJhZWR4HRgMnGMZ2Bz1x4NEzx4WbC4jOmkCUVQBsa3/d6iYiNXIG9wce5F+NoEOH+18eh59NIHGoXX2m2SbLKgqYi9vpmVVXjvZsxZLNhtACTbMS6dZwO/1qTlw2oue+BdHXIyOElSmSAbMkrUBkTX7dQJIUef+FzAqZhtOsp8jehN+F+Xj3WfP4+HSLLRGxww5YPnkF/bY63MmyiINnorTY4sE7n/aPsDu45P74KtTK68UDjwfD3tlbC7iTivza7y5HI57Wsu1/qq4JjmTkyLDaxQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0401MB2272.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39850400004)(396003)(376002)(366004)(346002)(7696005)(52536014)(8676002)(66946007)(316002)(8936002)(66446008)(33656002)(76116006)(54906003)(64756008)(4326008)(5660300002)(66556008)(6506007)(110136005)(44832011)(55016002)(66476007)(86362001)(26005)(71200400001)(9686003)(186003)(478600001)(2906002)(7416002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: BHVxhFDbnJAbHBig6J8gDXWEK0zpJQiNRHOfK2IARkBdWoj8KVq1ArD3igxAHdvPzlqaUH2wMQHHMEcal2foauDTscc9qBIBJM0vHyZE4jo9JGh3DXB2ZE6NU9wiQxYeeWzyGayTyPweXk2Taz73sR0jPoTIYG6A0fXq/RZHxZMJwGJk1YDxSLP+/jbrKVB1XkEdDF1taZsGGBdFk9zcmMjI5ZWn0aDPrlTEpAz2eRwbj8NZ20LQTrDzASi+wo6akENa03k6AmzlgSVFHFBp6YPfUVbVAG/0NEo6t+zXYQqmTNftDMVCszHI9jPG2fiBC8hlpFdK0bsgoUgZX0pb8Hur13gGeuQjTetOa1IeHYmL2KA7MEu0/q8CcNASwkr/Gl3ZnYwmdJurBViNpgHZdR27icJtrlSdAAZTcOuarBNaU9qgSQSZnxu1FM4XM8Jjoa6crfkfyB68Hx8N0AAjI6vPLXhGf47h/PJlVJh0UMGDBHjy17DfN0SwWzbZKmDZ+K0XBYXRXZRdDevdAJkxJW6RpYHskLwEV79FE+7IAvNHxuFew3293+LuAKNO+Mmu49Dv+Uc+ZznoRQW3o+8eEotPXkHobWRRNDwe+dwPkVy2HXNlgbaI9XtG4C+ONnRtZByNOvfG7I75a/AbPU3J5w==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2272.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7effa19d-4876-4d0a-cdc5-08d88b250f83
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2020 18:17:36.1962 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cZNw88Z4KuAxZAD0pebbKjKiSa0odc20NV7KBT5H6iCcAT35cPJIQzAxepNgDauA1ckCMUZC0HcCPk+gF58mNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4543
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "S.j. Wang" <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Lee Jones <lee.jones@linaro.org>
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

> On Tue, Nov 17, 2020 at 12:20:36AM +0200, Viorel Suman (OSS) wrote:
>=20
> >  static void ak4458_power_off(struct ak4458_priv *ak4458)  {
> > -	if (ak4458->reset_gpiod) {
> > -		gpiod_set_value_cansleep(ak4458->reset_gpiod, 0);
> > -		usleep_range(1000, 2000);
> > +	if (ak4458->reset) {
> > +		reset_control_assert(ak4458->reset);
> > +		msleep(20);
>=20
> We should really leave the support for doing this via GPIO in place for b=
ackwards
> compatibility I think, we could mark it as deprecated in the binding docu=
ment.
> Otherwise this makes sense to me and solves a real problem we have with t=
he
> handling of resets so we should look into doing this for new bindings.
>=20
> One thing I'm not clear on is if there's some way to ensure that we don't=
 have
> different instances of the device resetting each other without them notic=
ing?
> Shouldn't be an issue in practice for the use here.

The way to ensure that we don't have different instances of the device rese=
tting each
other is to rely on the way the "shared" reset is handled by reset API:=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+	ak4458->reset =3D devm_reset_control_get_optional_shared(ak4458->dev, NUL=
L);
+	if (IS_ERR(ak4458->reset))
+		return PTR_ERR(ak4458->reset);
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

/Viorel
