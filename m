Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AF13EFD0E
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Aug 2021 08:45:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 615D21676;
	Wed, 18 Aug 2021 08:44:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 615D21676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629269115;
	bh=+sJu6lNJuwow1h8D9WhMnONu8y8l4jYSzSpskECjRjo=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OBhFp4d5rbBVF+swJr4bqk0Icwepo1EOu0CQ3xysVP+KSukeP9YGYJQcf7cCUBnaQ
	 DREYU68gjZjEGbpiGnKCALtfljT7IfWA7/aW33R10MXW6TCNb6s89Fjqdqs163VBvZ
	 nB3QiHeEJnfhuDTFV9k6hICDYBuCLGLy8AP7ohOg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F0F4F80259;
	Wed, 18 Aug 2021 08:43:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6935FF80249; Wed, 18 Aug 2021 08:43:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=2.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,PDS_BAD_THREAD_QP_64,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
 (mail-eopbgr1400101.outbound.protection.outlook.com [40.107.140.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80741F80169
 for <alsa-devel@alsa-project.org>; Wed, 18 Aug 2021 08:43:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80741F80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com
 header.i=@renesasgroup.onmicrosoft.com header.b="IizrW+7q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mcw4sbez+3GTPGi0ZWzP18FESIQ/TywOtaunGFsF6MLj9lOUYpvZ500Q1UnL4lUyjVUGgh6EyKHHwWVTKXEWPCc0krIhBwYuZzWrfmA0aO+XlHWl4EbDMFhCO4Vb+fHmsOeVcDBcaTt45KE8wQtPQ6imEYkI11izeapiE/unsfi2IbbmixaRiwKG/cSOhzX+/emm6Nm73LAFOPp3/zTboT245H/CBtqT4SD4lkGhHhYuV9Epc/ACG1BZ18Ug9MFl3lGcKrPxvHO08NLA4pQuHA/+sSs4FlQzhIUkKMLM0aFEuSnqEpZijE/1c9g4D54FeqRW+KE9uO+p7s0mUPbjXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hENU6nXYjQ2rfUF00nTaBpwtAi9lKBKQU8QIZ4PHTBA=;
 b=LqAIKHmXAoestl4FFbAkBIoiBbL3sF8XSeUrJCJ/uKhuGzEnaWFkM69Pp8lZXlq4NtUhzGCVVrzGVR9BgPTIt+KicjHmo69Z6qnq1NKIV2EGv1ygh4n+9EtQ56XhPpPxC5dLXksJYL/PFPkdVYMnyXqZgcCh09zMLH5si+j4m9kX8HvFPUKjH057mUX4uGdHp7nhtl90FQfThwxMEhGBTWQPrQi8PCl55dHptsP1LLWNpVHnsOBKWeHAafWbiE6W3zt0EVQ7m27kAH5iSm8wB4qfeeITlza/+BC6Siojqe50gXgHy6BkLnrXwj3cMIcoSuHyCRWoffnJgurdKPSTxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hENU6nXYjQ2rfUF00nTaBpwtAi9lKBKQU8QIZ4PHTBA=;
 b=IizrW+7qb06qAQ1SwMo3tlfAWA1VTjyrhcYwswrfia3hcDU/wDUxHyxKSqIRFq1oT0TOaq6ibHxkR9Xvpi+S893kCJB9mScjgzl1ds06orFsTdlorgjkDyXdRqK4Z3Ei39XeofeTBN/vw0BGTVDAPxOx+czUNUpDILRf6rGpfT8=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB2936.jpnprd01.prod.outlook.com (2603:1096:604:18::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.20; Wed, 18 Aug
 2021 06:43:36 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe%9]) with mapi id 15.20.4415.024; Wed, 18 Aug 2021
 06:43:36 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Yang Yingliang <yangyingliang@huawei.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Subject: RE: [PATCH -next] ASoC: sh: rz-ssi: Fix return value check in
 rz_ssi_dma_request()
Thread-Topic: [PATCH -next] ASoC: sh: rz-ssi: Fix return value check in
 rz_ssi_dma_request()
Thread-Index: AQHXkxM86qyxelIXFUSoh7N/p/Brr6t3O6JQgAGTTaA=
Date: Wed, 18 Aug 2021 06:43:35 +0000
Message-ID: <OS0PR01MB59222F36C578A214E3DEE41286FF9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210817030027.1462671-1-yangyingliang@huawei.com>
 <OS0PR01MB59229720A7C243A47E7A1F1D86FE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59229720A7C243A47E7A1F1D86FE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9fd1f804-fa5e-4d71-a48e-08d962138122
x-ms-traffictypediagnostic: OSBPR01MB2936:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB2936FCEB8F3EE4376D55CD4486FF9@OSBPR01MB2936.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mjn6irK1hof4iiCdKysHEAuk7Zog6OJIcZGkAgM9oKfuhwT3RiA/wsTKNChvGUff3OPwBz/AcUep0jZM/sl2Qte7D4i69uqdv+E015q0X6Gua8WwOvXH/aAWNH5hRp2kLtX6PFfovJRCeZGc2xyU6rRIjH4nG2r/PIe4FmWcsctP15KJKNau3cBhMlnLNFwwCupUp9Chf+yXBNegbAzwnhFbKfVflJqH0A9E+5Y+Gvg2zuO/F/ia03VhXiZprroZr2mPDPLP+D/rBajqbYwG0/aNyBJYDdoOV6wPtucJvd859hifeFc6Zfz06MI7oN3HBArhpxE+yZXRaaz7y2M6TqZAiWKJPju1y7Jca/c7b6l1QkWAIBRGvBunvxVFQnsxSK4iNrv8e/9p/q2RYuZpa+UP6VIFK4AjrhWlYI9Tbb9iExvpAF+YTicMbtO8IiaNinATfwmsD3dr/m7gCAj9QNEk0/yOprtE8/tsLVOpBv4HVZxjtqolNwpomFbhj3mHKZJNZmmkjcLzrAC74WLjB6pEv+tXZKu2twsTD065v6/SyzaeTCMUFD6GVyukZ7v5xWfLT6yKkOQr3t+46NigsFh/9wL36co9tq0lashl9K/sJl0aVbh1Pg9RK7uXD7+UTzzVzBjFhrxSFbuTUdHC9fO1hKL7Qvu4k3OhOBL/uPdZaE8eihJXcfdhJ6iJBl78ECfjsEyRYh/WEFdE77it+S/HHtiVZFfvTUp7Ef03uCT7bi1gMXH7fL8TUf/qIyiTWmDBeDuDbvGEGuDB29Z0OYbZgnp7G+SoF0bZ/M6mBXk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(39860400002)(366004)(396003)(9686003)(38070700005)(33656002)(86362001)(6506007)(38100700002)(7696005)(316002)(2906002)(54906003)(110136005)(55016002)(83380400001)(71200400001)(122000001)(8936002)(478600001)(966005)(52536014)(8676002)(186003)(64756008)(66446008)(5660300002)(66556008)(53546011)(4326008)(66476007)(76116006)(26005)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pa3PzaOU0W99OcqqYsnBQ9ZG0BYkkxMDcyqeDLwCMpM0PU9MLJvyWrOTMHOh?=
 =?us-ascii?Q?nN7Hp97DwT1Koofz9B004eIdPAFpS7LdXZ/zFqCapfeu3/Dp7S0WsW9417ct?=
 =?us-ascii?Q?oSjc56p6A6cva+0Yc+oZLYBAeFvX2rXdHY5DorG0t8GtMBObVeOJF51ewtOi?=
 =?us-ascii?Q?/i1gKq1NRoa+PA5BZurtX6VakNWLLBtDUMtbKKaNXKUGP18XiMmFlLheKbYO?=
 =?us-ascii?Q?QqNvqkzV5X/j6b+pz3AwclzKs55x2PYfJ6DRPhBh9dNcMicaYLpQh7BFGJN/?=
 =?us-ascii?Q?KGnea+OpgQDD0wb+/CamF+qDo3DZnZMbTvyrExyEJQSqFHqNep7M9oqpAnbV?=
 =?us-ascii?Q?vW1IFBXU32/jIF/dCDtOrS4FbpIumqwQ6ob8dUMHse7xyz61e3u19eeyz0ws?=
 =?us-ascii?Q?IW5YqbAWqa4N4Gg0pjKz4J7KYNjhCiY3PVmiYZbV+TEFOfxAnoVvhxGFAfyq?=
 =?us-ascii?Q?+vZIVG3N76fy31keb6/tx+BTl+92fczgKI3jTIscswPinaCqQR4E5NbQAu1U?=
 =?us-ascii?Q?uxldJ1ibIEDO1tYxupeXRmLWDblTkKmF9IUZ1jW/3+wJOkb2z1VUYtlJY4Xd?=
 =?us-ascii?Q?aVkjDaFKOuc6aMvfE+tKok7hJ1VREBrsw8SO104FduU49laDsi58hwGe4D/I?=
 =?us-ascii?Q?eZKX/OKVD9wOMo3SHd44VnpVblOIoI4EMWksBLwPPCTKMgT8Hb67Qluou6Ky?=
 =?us-ascii?Q?kI9KGtx9MBJLMnp968VtQ5ZmDC3OmeAypSNx325HnxTduDrb4CAzv8zWHkQe?=
 =?us-ascii?Q?hs8bkXYHGg6SMsWKgU6wXXkUVJuN+X9GUVOppNSHNX+9KTtlTDubZjLnfwdq?=
 =?us-ascii?Q?5Pt40Nj527A7jIYNZtv8JRwTtHvpvvMimWAwWrfUrA1cjDiU2HP7+dfaOibj?=
 =?us-ascii?Q?qChxxtbuS/91Wgi1m4bd8wsobXj1wRszmohEyBjIO0zFP6beoe9CHNJJ9dRP?=
 =?us-ascii?Q?hooGrn83MbWRvF3O8WbRNSpyeN3+nYp4xqufMVhvIWmRrV/wwNvr63gBTIGT?=
 =?us-ascii?Q?akwk111Brs1eEui74/X2RcERyCwKFuCcGBLzaflGKNQBiJc8HvHh6upoGyNR?=
 =?us-ascii?Q?IxtN6MKGivclfOsqCtbs0KYG8+fvwpRLOpu2SPejCxtyqDaN0EeFNsM2DLhe?=
 =?us-ascii?Q?HO3Dn1woKdK8foBXe9lob0twj8xvud8qhs/dd5xDIc8RJ/H9RAbZIONgumqc?=
 =?us-ascii?Q?0c0j0APpSKRenhIo2n+t0hobx1Yw2Vyok0A+NkndAStpixrMqRUGPaefxZBg?=
 =?us-ascii?Q?QA/BLrNxA0+SyNRT/vjagCxfYruoyJYyIe11JovBDG8m+lanFKKBE5HgiiQn?=
 =?us-ascii?Q?bHEWSQpITNRDAkC5UfiQ9Lkz?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fd1f804-fa5e-4d71-a48e-08d962138122
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2021 06:43:35.8499 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9Q67rCHAlBQp/iP54gNQLaZ40S884yQA0/Y8rtx+9BOO8oSmlTeQnBMwOpptYICGmt4LW8pDMlvSUM+2R6tUsDOfCg/l+6Sxh+isGPSZ7EY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2936
Cc: "broonie@kernel.org" <broonie@kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>
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

Hi Yang Yingliang,

Still some improvements to be done on this patch.
If one of the dma channel is failed, we should fallback that channel to PIO=
.

Something like below. I will post a new patch after testing this.

ssi->playback.transfer =3D rz_ssi_pio_send;
ssi->capture.transfer =3D rz_ssi_pio_recv;

/* Detect DMA support */
ret =3D rz_ssi_dma_request(ssi, &pdev->dev);
if (ret < 0) {
	dev_warn(&pdev->dev, "DMA not available, using PIO\n");
} else {
	dev_info(&pdev->dev, "DMA enabled");
	if (ssi->playback.dma_ch)
		ssi->playback.transfer =3D rz_ssi_dma_transfer;
	if (ssi->capture.dma_ch)
		ssi->capture.transfer =3D rz_ssi_dma_transfer;
}

Regards,
Biju


> Subject: RE: [PATCH -next] ASoC: sh: rz-ssi: Fix return value check in
> rz_ssi_dma_request()
>=20
> Hi Yang Yingliang,
>=20
> Thanks for your patch.
>=20
> Already I have posted a patch for fixing it.
>=20
> https://patchwork.kernel.org/project/alsa-
> devel/patch/20210814180120.18082-1-biju.das.jz@bp.renesas.com/
>=20
> Since you posted a similar patch as Reported-by: Hulk Robot
> <hulkci@huawei.com>, I am adding my Rb tag for this patch.
>=20
> Regards,
> Biju
>=20
>=20
> > -----Original Message-----
> > From: Yang Yingliang <yangyingliang@huawei.com>
> > Sent: 17 August 2021 04:00
> > To: linux-kernel@vger.kernel.org; alsa-devel@alsa-project.org
> > Cc: broonie@kernel.org; Biju Das <biju.das.jz@bp.renesas.com>;
> > Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>;
> > lgirdwood@gmail.com
> > Subject: [PATCH -next] ASoC: sh: rz-ssi: Fix return value check in
> > rz_ssi_dma_request()
> >
> > In case of error, the function dma_request_chan() returns ERR_PTR()
> > and never returns NULL. Set 'dma_ch' to NULL, if dma_request_chan()
> > returns error, so the code using 'dma_ch' can work correctly.
> >
> > Fixes: 26ac471c5354 ("ASoC: sh: rz-ssi: Add SSI DMAC support")
> > Reported-by: Hulk Robot <hulkci@huawei.com>
> > Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>=20
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> > ---
> >  sound/soc/sh/rz-ssi.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/sound/soc/sh/rz-ssi.c b/sound/soc/sh/rz-ssi.c index
> > ea8d33ede5d2..5ec78fd94d94 100644
> > --- a/sound/soc/sh/rz-ssi.c
> > +++ b/sound/soc/sh/rz-ssi.c
> > @@ -676,11 +676,17 @@ static void rz_ssi_release_dma_channels(struct
> > rz_ssi_priv *ssi)  static int rz_ssi_dma_request(struct rz_ssi_priv
> > *ssi, struct device *dev)  {
> >  	ssi->playback.dma_ch =3D dma_request_chan(dev, "tx");
> > +	if (IS_ERR(ssi->playback.dma_ch))
> > +		ssi->playback.dma_ch =3D NULL;
> >  	ssi->capture.dma_ch =3D dma_request_chan(dev, "rx");
> > +	if (IS_ERR(ssi->capture.dma_ch))
> > +		ssi->capture.dma_ch =3D NULL;
> >  	if (!ssi->playback.dma_ch && !ssi->capture.dma_ch) {
> >  		ssi->playback.dma_ch =3D dma_request_chan(dev, "rt");
> > -		if (!ssi->playback.dma_ch)
> > +		if (IS_ERR(ssi->playback.dma_ch)) {
> > +			ssi->playback.dma_ch =3D NULL;
> >  			goto no_dma;
> > +		}
> >
> >  		ssi->dma_rt =3D true;
> >  	}
> > --
> > 2.25.1

