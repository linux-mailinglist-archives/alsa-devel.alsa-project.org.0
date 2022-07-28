Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DD1583B2E
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Jul 2022 11:25:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D0EC1660;
	Thu, 28 Jul 2022 11:24:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D0EC1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659000342;
	bh=pJnDn3bzKX3a4MPw8iQPRIbIXpeEAnAFPkQv54N3Rng=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h8OeR1v4wEQoZ26juRC0V/T6icX8BUedVVAc9Ij+vB8QttXqSbMiGFUvmJyffsrfz
	 MlGYd5uGXavS/sechbHuZiU3F0wAV8/Jtl9Dy8+/bs92pTQEtY6keO8iglJTDd/UPy
	 ZfC46fFfyt5LTJKy5JRQb+1ZienG1k/rIN2y1Cck=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C46AF80508;
	Thu, 28 Jul 2022 11:24:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBDFEF804EC; Thu, 28 Jul 2022 11:24:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2118.outbound.protection.outlook.com [40.107.113.118])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 194DDF80141
 for <alsa-devel@alsa-project.org>; Thu, 28 Jul 2022 11:24:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 194DDF80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com
 header.b="HubPar/U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zkqnayte443rgJMbXnQf1LnBrlb5oSNfDF+qss260trI4V+pd2oixOjE6Sj/gVIc/ZgXJTeorCUHuCBeTbleKhDVwDzUZoLtuxMyO/dZuszF+pa41BNdm3xm8NGGEWwYPCxctVnLFbFk5tmR8fSsgkp1V1tek4Ve/mvpk54ib0rjqQ44Ty23x+LSslRTvjB4q671lHcjr3MM3JDNaPT2krQ3Tab5BM4hbUDRCz7QgXsfdsireXn6hjUpOvBCAfWzmsQ1rjTbR8MVc/MawgsQWak9iVvLua1dP8vhcDuiu7Smdk93CTigKTVFNsRQrvrw1K9QW3SsjiNVMRnStUW5MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tRSqcrbuuUfe3fb62hnSR2oLDcvF7skXKjNn5NViPiU=;
 b=VXnWxMidJxiUh22kdh9FY4ryCPTwDYq4T8UBYXsB1tUvQwklxxu9ZYH+qvGz6FwwDLtu5V0WgLi9PMHiX4DfZJwIp1YvBjbJy+l9W7mRRQxw4dGOuqh9Ob8jEUZJ98ZwxjR6nZsbiJKfNyjOfKAM/UbCpnE62eFWK0OQeBPPyK2B2oDh+uc9arenFZhK51OKaNrWHhcvBastw1Hlz3JgkKChey3xF1YYHEaW0MQuq331K4gqUtI95x61og2MGKZwB2I2uhNvBJrK8fqlN3+i0rQpUcDe0SpJyFMS40MAppk1Ubx//RmLeZCxNYxaoUKPygEokCLW0FAnDPOBObLwVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tRSqcrbuuUfe3fb62hnSR2oLDcvF7skXKjNn5NViPiU=;
 b=HubPar/Uta0+kvGtE8X7kGdFhfX+f20/Jibthe+tP2/me2sgLYnzJQzNrETF8e4Wi0xJjjC1ICgEkizrNTYxvxq+HmnTg5WBL9KiLSLd2EhdsOHSLTvmtEx89/n9u8R/iM24/rrYSe38YIyv3j6SN8CF4vpJsLEgvpvRdefc9ys=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by OS3PR01MB7382.jpnprd01.prod.outlook.com (2603:1096:604:148::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 28 Jul
 2022 09:24:27 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::440d:b27b:6bbb:3d27]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::440d:b27b:6bbb:3d27%3]) with mapi id 15.20.5458.025; Thu, 28 Jul 2022
 09:24:27 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: RE: [PATCH] ASoC: sh: rz-ssi: Improve error handling in
 rz_ssi_probe() error path
Thread-Topic: [PATCH] ASoC: sh: rz-ssi: Improve error handling in
 rz_ssi_probe() error path
Thread-Index: AQHYomCDllJVhDPqhUCFAsAr5V09M62Tgjfw
Date: Thu, 28 Jul 2022 09:24:27 +0000
Message-ID: <TYCPR01MB5933A5F57370264C028FF69186969@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20220728090033.2414-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220728090033.2414-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b918a647-3dda-4c7c-5edf-08da707af7de
x-ms-traffictypediagnostic: OS3PR01MB7382:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wJ3mDA4qNwFOxlCGHHhoZ/V/JO+8KWlLePfVEb8q/HA2WsXqRigpsNPYfl48nNRKkeI+aAkfxreNcE5DIKZ0WJ7Qxh4W7AhyiHyqjTCD3nzUjjtgNWbKFbtlDwe0QYDVGduQpCh8wYXUbDbG18KxuhxuvjFyKqRrJqL6e93ovuj+IJkkAwd7LuBaPCdG2P0iovqzP22BaMTTX56i3xmsGVA8e3BuZr2hILaSPW8AIU3MTiIUw61T9dDAuFTh+y6ITnTgg/cbRN9zScPir2AprSSXjUgcf6WEl83j32gJqVC2Lj9z46cfezzmm4bcXUW/Lr5SX/e9LZloTMOqAsysQdaT9Hye9C7pYb8eCkGzoXc6v2QiC/FrgEQTifRcyfpfbBI6J8ywiZG9xkoM5zUquv1T2qMyeLbkSqRHP9OK1VWO6vFIZA1Ar436gfnvA6F2f7MgVt+oQTZhNuE0eG2gtJu5Pui5bOCNjVwIVulOzWaE/U7aVRTtYMTJpyB6XCXuyHxkQn98BQtfS0fE+WCdirU/nsuU19uZgInWELGLrcNrTnohXEkKCOqHWgObgjpTxDcD/7SOiCdJrVmdUSCDboYXm+yRh4ZRfLwuIesUHjkGaNlM4WQKfScGLNJoscMnly465iYCI5ggXWrRXkr4U0jKBXmBZHw3fx2t/rWAoJgHzLbrMkXstiAK4/RbDbYj99QiQDx7UvynoVR0N+5S3LQHjvWr3iEnxa4cV4G8UyhohSyKCvSSBph9NGT3JZxThAtdydrVcTmNmH6fpw8wVQtTm7LORJGEQbMv78/bvBGv5pRwsTCseUSeFTu3l+jH
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB5933.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(346002)(39860400002)(136003)(376002)(396003)(71200400001)(41300700001)(9686003)(38070700005)(8676002)(6506007)(52536014)(4326008)(26005)(478600001)(66476007)(66946007)(66556008)(66446008)(64756008)(8936002)(38100700002)(7696005)(76116006)(83380400001)(86362001)(110136005)(122000001)(316002)(54906003)(2906002)(55016003)(5660300002)(33656002)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?egv8DtJ6oJBEJhtKWbYZIjRtczMltS/Iy4TcPX+W3qYGUZKnS5Nuf2aGEJaA?=
 =?us-ascii?Q?8qUnZVEdQTMQglwq8Q6NTDnwBiz7J2ImED62/pJF/gug2gBB2YRlTaph2SJP?=
 =?us-ascii?Q?jwRkwXXuiMMfoOv41u10PJlr0KZ/Ytzm4Wf9qiWA7cKoGAOecA3qgNjBxouO?=
 =?us-ascii?Q?QErmu1Dpgf8R5xD2p4/7ialARIzL6B2Kt4JwngV4BTQs62SGqB6grwUeULn7?=
 =?us-ascii?Q?/Gd61wmlFXBkij13NHGQQbZFlwHJ/kBEWN4muQQQVDTPw1JF3+BDzUdSEH5z?=
 =?us-ascii?Q?aZE+EvqqVepocIFOs7n1dNeYCEHIfouWpPj1X4OcA09aZfJwz/EcfptZayvy?=
 =?us-ascii?Q?pBvpLCjfOT4+guh76X7ejBXmbXTsq0assUeCYchr/cKAKhnOctBoTr9HIlGv?=
 =?us-ascii?Q?KOmNhN27d8q/sBu1fUMfW9zGJSyWdaX92IfchzhlVhDtSKUwhLoSFG3piI2B?=
 =?us-ascii?Q?MLdpkfKiQfoB3Pfei5IiUo8AplqZGUY3173w6JUIMg5b1RzExFDNrAxI8Su7?=
 =?us-ascii?Q?0zmNbm9Xj9Yma/L0WOdq3jMRg/HstRc1cb2g8Eihh2XLD/EADGQibT5IKrsY?=
 =?us-ascii?Q?vLG+D9w94IB+a/0/cv71Ua7jVK9McfKnretIPqRqMrUgt0/eSUBQwlxxnePk?=
 =?us-ascii?Q?v2pUtk7rtoifYdOT6xHKKF+v84UoYB2jjr6c9yUDGVfzniyhteUhv57oD0kJ?=
 =?us-ascii?Q?a7V3J0Uu0plnFif7quNFQVdtmYRDITkFgFTgdF7rZOsPKu9Auf0visd+iAt0?=
 =?us-ascii?Q?duHzVSRvIZc/ugO5mBS3BOPcJnI4w/4irOTuVahFfan34B6p5Lp2TcrDvTwb?=
 =?us-ascii?Q?a/NVsxGgzYIXsHCK+MuYsruwtTxmKkVfZnkDm6vDcPy5oXOFhTYmhmUDbJy/?=
 =?us-ascii?Q?u69/bMRWYBgXG2nV9Wg+N9u5nAsbQ+7Gm536vCqu4QIRCXghywzNSg8pg/GT?=
 =?us-ascii?Q?iUqZlJoo9kKxZWXruAGoH7rzBk9l7mLp/Eef456WqtzIpnQUPFHG5W8cOvtN?=
 =?us-ascii?Q?Y7ee9VrxMl5nSYD28T5VHY5pd+NtlqpbpJXPT0qvZQkgdGgx8FJWWwPtkmpX?=
 =?us-ascii?Q?8wdezeuAB3HhcJV2mP/F1ltUE/9PLzpIyo7ZMg1vJvfjmQ1aI/AeCc+v6yji?=
 =?us-ascii?Q?TRTTx6pbANG+NC79SiTxz9YqtCHQ1294bejJUdquP9nPJihoHp6RhU+eypKH?=
 =?us-ascii?Q?CtvdR/hVYbXeh8on6fNYl4+Tu9luRlIU29HBFSXyJpc+qU7nRzeAfy0smgnS?=
 =?us-ascii?Q?RKZeTD319PoIxVmX6NZHCSB2KZODGtPLdLVKFf/1wO68W/iC5HlIsHRqdEqQ?=
 =?us-ascii?Q?zIyMVZ10+A89cBW5kn2wKQQGfSCXpv7FJsyezoHOz2G4P8iaoYs3UdMZfQn/?=
 =?us-ascii?Q?I35hmf2/FAVmA/g5EjzuL/ywCss8a4r4T+8o24K0UWwsWy/Yf2JpbEf22QVh?=
 =?us-ascii?Q?3bEUimk2BqZ9vEq4E4vqooLlJKHZirt094EXQ546Vri3RgbS1qdrHIMUg8dK?=
 =?us-ascii?Q?cc3ljU4i5QkXQA1NrNvTpCAJSkAx5vOWMSxFh42iPEQQNTehGp4kLObflDEV?=
 =?us-ascii?Q?pK4UZcYbS0so/0epbESbz27utt4KRrHZ7yvgbFJRGUK/vTT5Tu0Y1DbX9TsD?=
 =?us-ascii?Q?Qg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b918a647-3dda-4c7c-5edf-08da707af7de
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2022 09:24:27.2245 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hQcxcrs9yhWdLfFlHZTXq9gEIPKpi9juPFafUwxuHlwZu3qJaPY1Tj0UHUuKNM5kFrGVzIIEHbvfFL2nLbWZlFJkPfHiWd59O1MqdYQIvtw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7382
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>
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

Hi All,

> Biju Das <biju.das@bp.renesas.com>; linux-renesas-soc@vger.kernel.org;
> Pavel Machek <pavel@denx.de>
> Subject: [PATCH] ASoC: sh: rz-ssi: Improve error handling in
> rz_ssi_probe() error path
>=20
> We usually do cleanup in reverse order of init. Currently in case of
> error rz_ssi_release_dma_channels() done in the reverse order. This
> patch improves error handling in rz_ssi_probe() error path.
>=20
> While at it, use "goto cleanup" style to reduce code duplication.
>=20
> Reported-by: Pavel Machek <pavel@denx.de>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  sound/soc/sh/rz-ssi.c | 26 +++++++++++++++-----------
>  1 file changed, 15 insertions(+), 11 deletions(-)
>=20
> diff --git a/sound/soc/sh/rz-ssi.c b/sound/soc/sh/rz-ssi.c index
> 0d0594a0e4f6..c08ef317e3e3 100644
> --- a/sound/soc/sh/rz-ssi.c
> +++ b/sound/soc/sh/rz-ssi.c
> @@ -1017,32 +1017,36 @@ static int rz_ssi_probe(struct platform_device
> *pdev)
>=20
>  	ssi->rstc =3D devm_reset_control_get_exclusive(&pdev->dev, NULL);
>  	if (IS_ERR(ssi->rstc)) {
> -		rz_ssi_release_dma_channels(ssi);
> -		return PTR_ERR(ssi->rstc);
> +		ret =3D PTR_ERR(ssi->rstc);
> +		goto err_dma;

This label needs to be changed to err_reset.
Will send V2.

Cheers,
Biju
