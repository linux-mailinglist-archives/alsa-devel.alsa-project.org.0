Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FE23EE6C3
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Aug 2021 08:42:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDFBF950;
	Tue, 17 Aug 2021 08:41:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDFBF950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629182563;
	bh=8nUJeFozcQyNR2ZcatKXczn4apIgZ3V0RT8kPaaqBW8=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vHUwkJnV/8/NsdGnGUJHZspzA4UJHyQxy5iSLL0twsN+1AB8d6BU+8DIVWH8C4GYz
	 rEn23VexyQRqfn5TPnQrwdjgOD9QAlwzg9GtDsbrS7G5wSGhL6ZtX7sH38sTdFgyu6
	 eU+usUEawMReUkJkxE58JqRabUwo4I+O3WWtux4Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D958F80163;
	Tue, 17 Aug 2021 08:41:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E363EF80272; Tue, 17 Aug 2021 08:41:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=2.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,PDS_BAD_THREAD_QP_64,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-eopbgr1410115.outbound.protection.outlook.com [40.107.141.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76FECF80163
 for <alsa-devel@alsa-project.org>; Tue, 17 Aug 2021 08:41:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76FECF80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com
 header.i=@renesasgroup.onmicrosoft.com header.b="TAOgptkA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJtbl5brSVpsvLBQsz51JT/OgJXBqsKg2nxZw2nW2wz2jS9kJfQu74KebTcheCl+H3t/h9hIc5Ati2CvApSoMKqo/tJ2hVPw9chv1vcHo5BVOrOiFIbRkNPRsooV7Qre0w5eBK4ffnO7ooTUaq5wSJzk/nkf9Oz4YWsPmu9vVFGcYuYYEmI1UwBdVQmhBYPmBM5OMYpWQfPvs03Ga/QMiPGzw+TYYxcpNBlsXbHK1cPzujIlsW0IwpA3mZeIT3UAT1eLGHq7z4oejful2qADyYQuxZkzkBPYbjXl+v3IQOx8QOFL6I7+S5+ON47M5bHiSQEfbZ4B3wUrP5iP1eMuyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VAbEmHg4zHgoBgkpZBZiy93X2nv+B+TSIWzgasXHaJ8=;
 b=jDzSf1htpqD3i/rStI5gefWv3R3mPzIiGgHI+LE4NstV4QQzxp2lgKvTcnWKzhJC6VFbDyBu8244Vw4IPH0jc3p15elWMk1U0cCzlZlBRLut6a+4bErjpq+cqqOG3n4M9B5ZqQc+Zu8TLjWRwwkCe1irF1ZeM4KjBWv8+zPX5sGZZONBKOnTJKHpsADKbOLejFH/vzVlJZoFgPaQ6VZDvu4qJJg148l200/qXA0OXNS998SPn8crFPe3eC94K0K2qQMVerymOPTiCeUtW8YWzajETqQYdmW/gvkAq8XVfdWJw9/XvUTEbvTohN2mApDkqaKwOUg/Am94IYuyTmSx3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VAbEmHg4zHgoBgkpZBZiy93X2nv+B+TSIWzgasXHaJ8=;
 b=TAOgptkA2mGxhkeT/IOmq/VdBP0sthTvPk1ULp8OGvEv0o1XTwXDYlBWfd/RQLervpYO7v2CF1Y+2DL5uU6OXvmKrShtsLhMZU/CrFi5cXtlnmYGbhtYZlaIaPl0lG2JxcjpNW9B3MvU1snnX3q3ywODn/dOt6TJoIikjI6vmG0=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB6485.jpnprd01.prod.outlook.com (2603:1096:604:e1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Tue, 17 Aug
 2021 06:41:08 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe%9]) with mapi id 15.20.4415.023; Tue, 17 Aug 2021
 06:41:07 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Yang Yingliang <yangyingliang@huawei.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Subject: RE: [PATCH -next] ASoC: sh: rz-ssi: Fix return value check in
 rz_ssi_dma_request()
Thread-Topic: [PATCH -next] ASoC: sh: rz-ssi: Fix return value check in
 rz_ssi_dma_request()
Thread-Index: AQHXkxM86qyxelIXFUSoh7N/p/Brr6t3O6JQ
Date: Tue, 17 Aug 2021 06:41:07 +0000
Message-ID: <OS0PR01MB59229720A7C243A47E7A1F1D86FE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210817030027.1462671-1-yangyingliang@huawei.com>
In-Reply-To: <20210817030027.1462671-1-yangyingliang@huawei.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c5e1de9-58ed-48b2-d9d8-08d96149fe54
x-ms-traffictypediagnostic: OS3PR01MB6485:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OS3PR01MB6485E8E6261A13B8C6DE5F7986FE9@OS3PR01MB6485.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t5hewu76IF4rIdQKMGhRZSeNTBHsBTSk0OEApdO/Jv6Sk8+5Fo6kCNcmyom7l1DggPMHM/G/3RFANcVO72NlPnMkTD+ZLBoY2i/Vq1afx9oQe7zf4N976Btdr/7A3c7VTNb/gkJFrGeR+ADwFxNQpAD+wHtQwy6k0EfRzE1f/MIJLj4S6o4guA1jbD55YS3dQJcPMLWRiR0L9joItS6i/PYKtuReymm4vqMmBcsv+vNtjlx0fNEkff9X02Kux0H+T3BTMYubfWkgbU0mdKRXemiZ4OGvxuEy8o6T43Q6wJFyUc+7FuGW9Ylrg3ndycy0mN/SOcL+gMx7W4FZtIkQFVEItk/tQI1vx3SXaMn/ka6N+uoTfHo0JnJwr26zW/0HCardOqIOLx1OPPjgEMnhgpMykG9nEQ17Kc/Mh59bXg4Ou2UTGJPL0BNfRymfoEVBJ1ztaS3O/Fv6ggQcFW9qdLFTIgtybNJXer4f+rxBA3m3JeU1kRWn8XgMBT7UIc+Zgtkvict+aOXREx8Ug3BCw0ZkVGcm9Lkell0avYH0S8UGqzX3b5GTEcFoMk4ny2BnSownFc/E8ZFbK6Von2yudR+zzsH9OykDIFsVmALr7YtVi9b3KlkGS85G+V8yQv3/rU62/RE9g55rl82MZ2lcKp5wa6BDj+6HkNKJdvOo+CwlUkarUUJDKKD832zXA4gCvuYRso8xrK/3XDOCfx1FEy97gHIOdR8PQvOw9VlW26O8FNR/0kf2E9G/bmdEsG/cFtbHDmy0DoSnl0E4oKkV5d7GzGodzQPljyAZtHYZvPc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(366004)(396003)(39860400002)(7696005)(122000001)(6506007)(38100700002)(8936002)(2906002)(66946007)(76116006)(66476007)(66446008)(66556008)(71200400001)(33656002)(186003)(53546011)(4326008)(8676002)(64756008)(38070700005)(55016002)(316002)(966005)(110136005)(478600001)(9686003)(52536014)(83380400001)(5660300002)(26005)(86362001)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?t9/KN/5VlvQZJSyGlyIbXro3TmIoZn76erPnzhNA27VkvnbQ0sykPQg0LX1+?=
 =?us-ascii?Q?UE5Y+QbxgxU9UXvlcACH7+5P1UMvGLzz9CZWBgyvAKfvt+MkmQvnnVXr0d5e?=
 =?us-ascii?Q?nr9l3N8zaLX5nmQA9ehVChoKeXt6lIo4Cb1eCDSjhVuGUA6ESXXwIp+yyd/B?=
 =?us-ascii?Q?n4Sp6tOR9LV2YG9s2ynVIuZHUXOiHAwsh5X+BEv0SylHFOuf7WRXJ9j097gN?=
 =?us-ascii?Q?f4Yr7wniypn8wrwTzLYONzvHh74HxUNGcoBcr7FtgSBXzgkmAz8Shx/5EKJE?=
 =?us-ascii?Q?TdxtmJ+0GATT4YTaR6i221seq2x4f2N5+ZTlHDsy67sNYwtj9+WevUpKzplQ?=
 =?us-ascii?Q?t+XXiFXsyfaTHpBUyHn0ClxPbx16NbEOTW6apExyCQATNg2p8WKu11MYZJbW?=
 =?us-ascii?Q?J5jYFajB3+2ZxaO1HGkxrIBvu4XTeqqRt0lgSzFEphWzoaoFsZMOJWNxynGl?=
 =?us-ascii?Q?gBwjLJnCorPuFuzd+ES3z+Qvj6qHCFwiMdQM1EdjwJIZ84H5LlHfMo5DLJSQ?=
 =?us-ascii?Q?u/QoqKe4csj90jL+oZ6aJoDKRIck5ki94SxT/HM/T86b5zBaQ5mjsGatt3xj?=
 =?us-ascii?Q?GWFHELZQ8Ojv+8aVUDez2NMqeUqt0OiDa3U2Cp8QSfTm3DpApMTXEa5G2/E2?=
 =?us-ascii?Q?B90lJrNmlMxeIXx7QDvlXDru4pp2Cym0Y52nLhnn6BYpy+qpyEEr4rgxsmVL?=
 =?us-ascii?Q?d7vF+I1XIxvR+k4Z2X5bckr9DBBeIaKmyiAdpaSQ74I15EJ+NzppCJmEWEjx?=
 =?us-ascii?Q?hYIaQNBz9sj6WmtZ6yW0myty1F/pw7lRnAvYrV3Calc0Dlk5BEzr0mIxT9rd?=
 =?us-ascii?Q?iphWWrtl4Cty1LjS9HnUSawOixqShpiayg+XFwl/xocRgRChAmDOFPRIxpnQ?=
 =?us-ascii?Q?NOMMb89hJpNKd0fNLOlRbHHR7AEeSJwbtyo3MvRY1iuwIQSZAoJb71VkUmLZ?=
 =?us-ascii?Q?tny0UZz33hIE6edyElljPCrUwsdU04/wTrlBwHwHBLZo9E9hzhGuKj3XTqmI?=
 =?us-ascii?Q?VUht5Mglo+uZDXZCE73sGTSiNP9LYD8oB6QcKTrl9V9M3g586MPn9GiBpx6u?=
 =?us-ascii?Q?uGfBUt2gRnocvqKFnLihyYhrCcCz9idqr9FQK5n0dOsy+vF9dae+iyypbjWY?=
 =?us-ascii?Q?8sEOGtSa4zIBH5OdN5gHseeFriTAqNeEHLe2lfH7TN1oyHkussL0LPcBll+q?=
 =?us-ascii?Q?l1O99IyqlQlA0veBjwmb6rIIMV2IOhjxzL8lEpQeAwU763Rm5cBZOQhVwDIe?=
 =?us-ascii?Q?YgoupXIXiDY63/mZMeUXc9oLB1QZD/sS/BYLFTSiNXwABLWZE7dl9aNCDGRr?=
 =?us-ascii?Q?Bx/lYZ0V+C04u0op3QOwrQ37?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c5e1de9-58ed-48b2-d9d8-08d96149fe54
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2021 06:41:07.4901 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d+YWBgUa2GMMsE/L9U2v8XqH2btF208dbKdgvh1NaYB2rL2Uiik5PWfq/UVtIxhIE0zW12C9Fc4Mco49/DVkPKOCbJObZ4IKVnd4UIt51iI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6485
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

Thanks for your patch.

Already I have posted a patch for fixing it.

https://patchwork.kernel.org/project/alsa-devel/patch/20210814180120.18082-=
1-biju.das.jz@bp.renesas.com/

Since you posted a similar patch as Reported-by: Hulk Robot <hulkci@huawei.=
com>,
I am adding my Rb tag for this patch.

Regards,
Biju


> -----Original Message-----
> From: Yang Yingliang <yangyingliang@huawei.com>
> Sent: 17 August 2021 04:00
> To: linux-kernel@vger.kernel.org; alsa-devel@alsa-project.org
> Cc: broonie@kernel.org; Biju Das <biju.das.jz@bp.renesas.com>; Prabhakar
> Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>; lgirdwood@gmail.co=
m
> Subject: [PATCH -next] ASoC: sh: rz-ssi: Fix return value check in
> rz_ssi_dma_request()
>=20
> In case of error, the function dma_request_chan() returns ERR_PTR() and
> never returns NULL. Set 'dma_ch' to NULL, if dma_request_chan() returns
> error, so the code using 'dma_ch' can work correctly.
>=20
> Fixes: 26ac471c5354 ("ASoC: sh: rz-ssi: Add SSI DMAC support")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

> ---
>  sound/soc/sh/rz-ssi.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/sound/soc/sh/rz-ssi.c b/sound/soc/sh/rz-ssi.c index
> ea8d33ede5d2..5ec78fd94d94 100644
> --- a/sound/soc/sh/rz-ssi.c
> +++ b/sound/soc/sh/rz-ssi.c
> @@ -676,11 +676,17 @@ static void rz_ssi_release_dma_channels(struct
> rz_ssi_priv *ssi)  static int rz_ssi_dma_request(struct rz_ssi_priv *ssi,
> struct device *dev)  {
>  	ssi->playback.dma_ch =3D dma_request_chan(dev, "tx");
> +	if (IS_ERR(ssi->playback.dma_ch))
> +		ssi->playback.dma_ch =3D NULL;
>  	ssi->capture.dma_ch =3D dma_request_chan(dev, "rx");
> +	if (IS_ERR(ssi->capture.dma_ch))
> +		ssi->capture.dma_ch =3D NULL;
>  	if (!ssi->playback.dma_ch && !ssi->capture.dma_ch) {
>  		ssi->playback.dma_ch =3D dma_request_chan(dev, "rt");
> -		if (!ssi->playback.dma_ch)
> +		if (IS_ERR(ssi->playback.dma_ch)) {
> +			ssi->playback.dma_ch =3D NULL;
>  			goto no_dma;
> +		}
>=20
>  		ssi->dma_rt =3D true;
>  	}
> --
> 2.25.1

