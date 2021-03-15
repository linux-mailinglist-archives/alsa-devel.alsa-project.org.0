Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C11E33B9D3
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Mar 2021 15:09:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 693511713;
	Mon, 15 Mar 2021 15:08:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 693511713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615817361;
	bh=FTBITAeRraWrBY2eVopHhE/fupJ+aZE/kpTu72jO9i0=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ECFDEb0WfBI79s+gnK19SLk6FFhWGPdn6zkAdLetCe520wHRZDbMCkKVlgjXL0Wej
	 Q3F1gid1MJubSizJY4CCkhBcEjMeqWLjnYZyCHpVxq0TC0jhSP2aLdppIm1cyBL8U1
	 LAypfIGxIKkjfowOMQU6rXrjjSL3wVGLpTYi0YSI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA388F801F7;
	Mon, 15 Mar 2021 15:07:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC051F80171; Mon, 15 Mar 2021 15:07:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PDS_BAD_THREAD_QP_64,PRX_BODY_64,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2083.outbound.protection.outlook.com [40.107.93.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5EFD5F8013F
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 15:07:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EFD5F8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="R8hoZIBs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VERh1GivqKsRWEmyG/GKNmCikbFOinFG4R59wxeIoV0i8bHJAGmZsx/Z3QQtXHuRXnfCBzmxB0DfAA7QZJZg82kidcMp8D3zY8hSC6K5p0AWsMDHBpa2WiKY7ZtmVdK3MtzyeqGy+hRdZ9BCVEG6CLLwMod9gpusTVnxH7LPlNVDPzxLZzSLYYFrUSSWTWEXok+diaQko47dND5sQIjv5aPXPfhBTgCI2S/DI63kjNOWmEgLhzpxDNGtYXFelvpBQ314fuoUhmi7EFrd0RIEHRyEjjWlhGKIHKMbbWrx3klU4EvxSPNod3xklzaG5jBiK05fsA+MrVTeRr/fWuHUlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gwCZhgWN1EYmc1d2T0qSojZS8hJmr3EPT5kkyMSAvQ4=;
 b=Rs323ohFVxa0LRMoOQniWqEcSlvJKRd3eu2RGzEdrDb8At/fVeTWM4OFere0yext2wA71u1jEmAxpEbPaYKAJe7v4+FoVWyUa5x4vCvjE6kc5W2kfvcA02FBp+q3jyLoD6FxqrWqYIgJ3G2/GQ3+/YvyyJzuU6nWd07S+lwVAaj0h4epK24ajE6wYbFtTE/g3kipYBHmWU7tKIYQjrtLPVUpaxPJ7A65H9+ca4oDcNaa1HXOPMOdb/FzPixvvWnCf+GBmjsUndyxDICt+duYVpHwAyUg6POEpgce7Ga9VNkAleygIo7puEbOdeMDicHw/D2aA3MJvwF2Kx4HtMI7Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gwCZhgWN1EYmc1d2T0qSojZS8hJmr3EPT5kkyMSAvQ4=;
 b=R8hoZIBslmzbykIN7mp5u248SxLCrgPNasRP7OvCqG8tsgvcD00orxXQ6rBaCbmjYy2LzqrfLHNCAAlGQ+zCthEjG7rA42/G9BzEvRFBVU2ogxSzLzxSYpJa+CSPdGMuNfRlR7rAT2A5yGQoodRZZ05GPdZvL5rEdcTQotRuwKc=
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by MN2PR12MB4341.namprd12.prod.outlook.com (2603:10b6:208:262::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 14:07:31 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::5deb:dba7:1bd4:f39c]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::5deb:dba7:1bd4:f39c%5]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 14:07:31 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Subject: RE: [PATCH v2] ASoC: amd: add support for rt5682 codec in machine
 driver
Thread-Topic: [PATCH v2] ASoC: amd: add support for rt5682 codec in machine
 driver
Thread-Index: AQHXF8Wg8LPaCELmjkS0kb8pYHbKgKqFGPbA
Date: Mon, 15 Mar 2021 14:07:30 +0000
Message-ID: <MN2PR12MB44885C5FD095830CEA62EF02F76C9@MN2PR12MB4488.namprd12.prod.outlook.com>
References: <1615612589-5084-1-git-send-email-Vijendar.Mukunda@amd.com>
In-Reply-To: <1615612589-5084-1-git-send-email-Vijendar.Mukunda@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2021-03-15T14:07:25Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=8f784abe-6aa7-444d-bd7d-b804d6fa3c47;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [192.161.79.247]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 70033561-9b31-415a-9045-08d8e7bbac68
x-ms-traffictypediagnostic: MN2PR12MB4341:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB43416874CC790E8D65EE89F5F76C9@MN2PR12MB4341.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:161;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G5ikkaEh2QryROOtTydp3X7ZIUMZ0aYfnpScQXJ65cFv44Dc9vR5AwOnEvslj1sXOs9V3EPtxB3tXXgdiJ1n30YnFkWC2/ZtV20vFLU/uEaiBz7Kv49RNhRrknilLjIkiJmF4hg4Z2hv7d8Yv1+rFx+2zwXS+s6Nr7DPayKL80XtN7+SAL8hLtNuCp9u9bSXpuc3lKTfZQLIIHdPruJBlZIUKS6kvTXyB/1Dp3YGyhq60v8YqB2Qq05twUdjAXh2+arXzwP5NKWR9PgHtbvE9Q9wMtpKDCGOlLUPRsv2aKjlB3eVQXPbDoDoMJRcACv9374z4okr6ssP5R0C57uQ9UX5SV0e6EvqSkyx8R8FYdspHIv/S9CClPm/0/Oy6fEmWNL3gOMljlrXNRosXSl9wytZSE8TFDRoh78PX9bNuO5jJSsVNP0SLp7pGSfXy03pjVVbwTsA6x4+XM2eoxXmXg65wT1kZCbpJJU6X551BG2qVaEJI3Mn9AMrsjCVJVhlQoyjZvgvLvQLD5a6aPb+XSG9EumGtJnhqYKXRiK87jR6SkeFNi9ZLDJKXOqYrPrZ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(110136005)(4326008)(5660300002)(83380400001)(316002)(53546011)(26005)(54906003)(55016002)(33656002)(66446008)(2906002)(186003)(7416002)(86362001)(71200400001)(30864003)(64756008)(52536014)(7696005)(8676002)(76116006)(66476007)(478600001)(66946007)(66556008)(8936002)(9686003)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?BCQzaJacyOPdoXuWP/ogVtiQi6/h5VcUlKC7Xs9mR+1xtnIKsXl6Ok/TiaQs?=
 =?us-ascii?Q?ubipn1CivJJoE8bDnkd4ICg7AWQIl/JGaXdU9RnlGml+7C7767VbnhuZE8fp?=
 =?us-ascii?Q?c65DHgJ/Fjvn6/G37g9/u+1/n9QRUL2nuM+JooQQdNb7blli/Med3SxQCe4Y?=
 =?us-ascii?Q?bJGRA02g7K07busKDBzpjcZzBWM9CT2zEQRdgNcykuIR+7H9Oe2+3ngjhKpv?=
 =?us-ascii?Q?v5K4NagxfsLEM2kwuDqiAUneYYcnjzyFIzXLwSmbaDSEZkqRX4J0bijX/j+A?=
 =?us-ascii?Q?cXcOaATQ0FyeihORR1uCNY/dUWz1qzo+OynbyV1X2hIERj5JErAMbbtjFSpC?=
 =?us-ascii?Q?Kjg0XX2y9BpmaAo9vQeO1ekGbFHwH1lpZ7YZN/uBmYqQ07fzyf++uXhP5PP2?=
 =?us-ascii?Q?Ti6/mi6qFD8M9l310NDcsdajKITyZPOHoMN0sxsZCSqe6ilFZNZf7b9KwgnM?=
 =?us-ascii?Q?jHICrYD/YUI7Qa+vcajCodQo9vDkQUg42T3UzYP5TbRfsPnhyFRtH3UYErah?=
 =?us-ascii?Q?QMwaRxHFmLKODFV7mTQOymH5XaPeZ0X/+/NHcmyMUBAHx09lkNq97c3Jd4dK?=
 =?us-ascii?Q?xyUt9/+j5S+wleH+LuI6FGFBA+4nEi9I7Kztspk+atq/STyPnTMlGRMLGvER?=
 =?us-ascii?Q?annusTiwHvW+zHdn6EMLIPQ/QZZ50pixEGeOWr5uxjsvUd5RAth/IOg8jY6j?=
 =?us-ascii?Q?OFhz0SB5t/qxbI5rZJEfr3dQtrBDGQOzOVRIHTtJOOxaZhkrTzDwa5PR/Nlz?=
 =?us-ascii?Q?heM9bDRnwSk5Din1j5zM902XKOH4msufoFFLnSNxsSTG4rGh88L5R7Z2UWSU?=
 =?us-ascii?Q?EG+ejL0muff0LEG0juHNdhvWWrtUrVpJnkPTSBXaYQybuU+DJunzGJFyY1sK?=
 =?us-ascii?Q?N/r3PdO8BJGgeTMQI4IRKEFXmoKQpTWwxKeW9YrGAxwqh8g77SB1TilbS1u1?=
 =?us-ascii?Q?fpBfepisJ194c95KQ9nFmckQIrHzdSwHoqzTjtz++Z2Pty0soflqv8lcpLzP?=
 =?us-ascii?Q?w5zU4dKjVzgj+djng4d+A8sRclymATsAXbxNafh/n1B5jaduW6Y0WT1OU7wE?=
 =?us-ascii?Q?A66edY8ZvjDQz8pjqAdNSXAUDAabq72qXMFaIpNekyCxX6DEp8n1uLUqbBhC?=
 =?us-ascii?Q?+tHNgPkXbRqXbCDXzJ1abrJQFXl+U29HN9AOFB75qvNGLiEHRXHLsl4wvaya?=
 =?us-ascii?Q?tjtNYQVtAjPkpPuviIfxHH//AxIrw58NguuENjZvQYkHCL7ioMk9CFJ4Zp3X?=
 =?us-ascii?Q?8iapCS7cy0yEAPa3+dxEEUbiq/NNUEtzgWuFWIhLwboGpmDF73ki0k+bf09t?=
 =?us-ascii?Q?565okisYvXFWDV/Ei7a+iTuU?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4488.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70033561-9b31-415a-9045-08d8e7bbac68
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2021 14:07:30.8298 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4yjrT1sXyJojXL+by4VaxSgU+XswV/X81lmq4J4DEKOdelE7CPex3vHXfWnvZrBcaT9r2y6NwUSNeUOf7/4soA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4341
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Arnd Bergmann <arnd@arndb.de>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Chuhong Yuan <hslester96@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, "Liang, Prike" <Prike.Liang@amd.com>,
 "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>, "RAVULAPATI,
 VISHNU VARDHAN RAO" <Vishnuvardhanrao.Ravulapati@amd.com>, "Arya,
 Virendra-Pratap" <Virendra-Pratap.Arya@amd.com>, "Vemuri,
 Murali-krishna" <Murali-krishna.Vemuri@amd.com>
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

[AMD Public Use]



> -----Original Message-----
> From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> Sent: Saturday, March 13, 2021 12:16 AM
> To: broonie@kernel.org; alsa-devel@alsa-project.org
> Cc: Liang, Prike <Prike.Liang@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Vemuri, Murali-krishna <Murali-
> krishna.Vemuri@amd.com>; Arya, Virendra-Pratap <Virendra-
> Pratap.Arya@amd.com>; Mukunda, Vijendar
> <Vijendar.Mukunda@amd.com>; Liam Girdwood <lgirdwood@gmail.com>;
> Jaroslav Kysela <perex@perex.cz>; Takashi Iwai <tiwai@suse.com>; Pierre-
> Louis Bossart <pierre-louis.bossart@linux.intel.com>; Arnd Bergmann
> <arnd@arndb.de>; RAVULAPATI, VISHNU VARDHAN RAO
> <Vishnuvardhanrao.Ravulapati@amd.com>; Kuninori Morimoto
> <kuninori.morimoto.gx@renesas.com>; Chuhong Yuan
> <hslester96@gmail.com>; open list <linux-kernel@vger.kernel.org>
> Subject: [PATCH v2] ASoC: amd: add support for rt5682 codec in machine
> driver
>=20
> Add support for RT5682 codec in machine driver.
>=20
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
> v1->v2 : updated kconfig, spdx license, removed unnecessary
> v1->initialization and
> updated comment
>  sound/soc/amd/Kconfig                |   5 +-
>  sound/soc/amd/acp-da7219-max98357a.c | 380
> +++++++++++++++++++++++++++++++----
>  2 files changed, 343 insertions(+), 42 deletions(-)
>=20
> diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig index
> a6ce000..43f5d29 100644
> --- a/sound/soc/amd/Kconfig
> +++ b/sound/soc/amd/Kconfig
> @@ -5,14 +5,15 @@ config SND_SOC_AMD_ACP
>  	 This option enables ACP DMA support on AMD platform.
>=20
>  config SND_SOC_AMD_CZ_DA7219MX98357_MACH
> -	tristate "AMD CZ support for DA7219 and MAX9835"
> +	tristate "AMD CZ support for DA7219, RT5682 and MAX9835"
>  	select SND_SOC_DA7219
> +	select SND_SOC_RT5682_I2C
>  	select SND_SOC_MAX98357A
>  	select SND_SOC_ADAU7002
>  	select REGULATOR
>  	depends on SND_SOC_AMD_ACP && I2C && GPIOLIB
>  	help
> -	 This option enables machine driver for DA7219 and MAX9835.
> +	 This option enables machine driver for DA7219, RT5682 and
> MAX9835.
>=20
>  config SND_SOC_AMD_CZ_RT5645_MACH
>  	tristate "AMD CZ support for RT5645"
> diff --git a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-
> da7219-max98357a.c
> index 849288d..9b3520e 100644
> --- a/sound/soc/amd/acp-da7219-max98357a.c
> +++ b/sound/soc/amd/acp-da7219-max98357a.c
> @@ -1,27 +1,8 @@
> -/*
> - * Machine driver for AMD ACP Audio engine using DA7219 & MAX98357
> codec
> - *
> - * Copyright 2017 Advanced Micro Devices, Inc.
> - *
> - * Permission is hereby granted, free of charge, to any person obtaining=
 a
> - * copy of this software and associated documentation files (the
> "Software"),
> - * to deal in the Software without restriction, including without limita=
tion
> - * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> - * and/or sell copies of the Software, and to permit persons to whom the
> - * Software is furnished to do so, subject to the following conditions:
> - *
> - * The above copyright notice and this permission notice shall be includ=
ed in
> - * all copies or substantial portions of the Software.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO
> EVENT SHALL
> - * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM,
> DAMAGES OR
> - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> OTHERWISE,
> - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR
> THE USE OR
> - * OTHER DEALINGS IN THE SOFTWARE.
> - *
> - */
> +// SPDX-License-Identifier: GPL-2.0+

You are changing the license here.  The original license was MIT.  This sho=
uld be:
SPDX-License-Identifier: MIT

Alex

> +//
> +// Machine driver for AMD ACP Audio engine using DA7219, RT5682 &
> +MAX98357 codec // //Copyright 2017-2021 Advanced Micro Devices, Inc.
>=20
>  #include <sound/core.h>
>  #include <sound/soc.h>
> @@ -41,14 +22,19 @@
>  #include "acp.h"
>  #include "../codecs/da7219.h"
>  #include "../codecs/da7219-aad.h"
> +#include "../codecs/rt5682.h"
>=20
>  #define CZ_PLAT_CLK 48000000
>  #define DUAL_CHANNEL		2
> +#define RT5682_PLL_FREQ (48000 * 512)
>=20
>  static struct snd_soc_jack cz_jack;
>  static struct clk *da7219_dai_wclk;
>  static struct clk *da7219_dai_bclk;
> -extern bool bt_uart_enable;
> +static struct clk *rt5682_dai_wclk;
> +static struct clk *rt5682_dai_bclk;
> +extern int bt_uart_enable;
> +void *soc_is_rltk_max(struct device *dev);
>=20
>  static int cz_da7219_init(struct snd_soc_pcm_runtime *rtd)  { @@ -128,6
> +114,88 @@ static void da7219_clk_disable(void)
>  	clk_disable_unprepare(da7219_dai_bclk);
>  }
>=20
> +static int cz_rt5682_init(struct snd_soc_pcm_runtime *rtd) {
> +	int ret;
> +	struct snd_soc_card *card =3D rtd->card;
> +	struct snd_soc_dai *codec_dai =3D asoc_rtd_to_codec(rtd, 0);
> +	struct snd_soc_component *component =3D codec_dai->component;
> +
> +	dev_info(codec_dai->dev, "codec dai name =3D %s\n", codec_dai-
> >name);
> +
> +	/* Set codec sysclk */
> +	ret =3D snd_soc_dai_set_sysclk(codec_dai, RT5682_SCLK_S_PLL2,
> +				     RT5682_PLL_FREQ, SND_SOC_CLOCK_IN);
> +	if (ret < 0) {
> +		dev_err(codec_dai->dev,
> +			"Failed to set rt5682 SYSCLK: %d\n", ret);
> +		return ret;
> +	}
> +	/* set codec PLL */
> +	ret =3D snd_soc_dai_set_pll(codec_dai, RT5682_PLL2,
> RT5682_PLL2_S_MCLK,
> +				  CZ_PLAT_CLK, RT5682_PLL_FREQ);
> +	if (ret < 0) {
> +		dev_err(codec_dai->dev, "can't set rt5682 PLL: %d\n", ret);
> +		return ret;
> +	}
> +
> +	rt5682_dai_wclk =3D devm_clk_get(component->dev, "rt5682-dai-
> wclk");
> +	if (IS_ERR(rt5682_dai_wclk))
> +		return PTR_ERR(rt5682_dai_wclk);
> +
> +	rt5682_dai_bclk =3D devm_clk_get(component->dev, "rt5682-dai-
> bclk");
> +	if (IS_ERR(rt5682_dai_bclk))
> +		return PTR_ERR(rt5682_dai_bclk);
> +
> +	ret =3D snd_soc_card_jack_new(card, "Headset Jack",
> +				    SND_JACK_HEADSET | SND_JACK_LINEOUT
> |
> +				    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
> +				    SND_JACK_BTN_2 | SND_JACK_BTN_3,
> +				    &cz_jack, NULL, 0);
> +	if (ret) {
> +		dev_err(card->dev, "HP jack creation failed %d\n", ret);
> +		return ret;
> +	}
> +
> +	snd_jack_set_key(cz_jack.jack, SND_JACK_BTN_0,
> KEY_PLAYPAUSE);
> +	snd_jack_set_key(cz_jack.jack, SND_JACK_BTN_1,
> KEY_VOLUMEUP);
> +	snd_jack_set_key(cz_jack.jack, SND_JACK_BTN_2,
> KEY_VOLUMEDOWN);
> +	snd_jack_set_key(cz_jack.jack, SND_JACK_BTN_3,
> KEY_VOICECOMMAND);
> +
> +	ret =3D snd_soc_component_set_jack(component, &cz_jack, NULL);
> +	if (ret) {
> +		dev_err(rtd->dev, "Headset Jack call-back failed: %d\n", ret);
> +		return ret;
> +	}
> +	return 0;
> +}
> +
> +static int rt5682_clk_enable(struct snd_pcm_substream *substream) {
> +	int ret;
> +	struct snd_soc_pcm_runtime *rtd =3D
> asoc_substream_to_rtd(substream);
> +
> +	/*
> +	 * Set wclk to 48000 because the rate constraint of this driver is
> +	 * 48000. ADAU7002 spec: "The ADAU7002 requires a BCLK rate that is
> +	 * minimum of 64x the LRCLK sample rate." RT5682 is the only clk
> +	 * source so for all codecs we have to limit bclk to 64X lrclk.
> +	 */
> +	clk_set_rate(rt5682_dai_wclk, 48000);
> +	clk_set_rate(rt5682_dai_bclk, 48000 * 64);
> +	ret =3D clk_prepare_enable(rt5682_dai_bclk);
> +	if (ret < 0) {
> +		dev_err(rtd->dev, "can't enable master clock %d\n", ret);
> +		return ret;
> +	}
> +	return ret;
> +}
> +
> +static void rt5682_clk_disable(void)
> +{
> +	clk_disable_unprepare(rt5682_dai_bclk);
> +}
> +
>  static const unsigned int channels[] =3D {
>  	DUAL_CHANNEL,
>  };
> @@ -260,6 +328,118 @@ static void cz_da7219_shutdown(struct
> snd_pcm_substream *substream)
>  	da7219_clk_disable();
>  }
>=20
> +static int cz_rt5682_play_startup(struct snd_pcm_substream *substream)
> +{
> +	struct snd_pcm_runtime *runtime =3D substream->runtime;
> +	struct snd_soc_pcm_runtime *rtd =3D
> asoc_substream_to_rtd(substream);
> +	struct snd_soc_card *card =3D rtd->card;
> +	struct acp_platform_info *machine =3D
> snd_soc_card_get_drvdata(card);
> +
> +	/*
> +	 * On this platform for PCM device we support stereo
> +	 */
> +
> +	runtime->hw.channels_max =3D DUAL_CHANNEL;
> +	snd_pcm_hw_constraint_list(runtime, 0,
> SNDRV_PCM_HW_PARAM_CHANNELS,
> +				   &constraints_channels);
> +	snd_pcm_hw_constraint_list(runtime, 0,
> SNDRV_PCM_HW_PARAM_RATE,
> +				   &constraints_rates);
> +
> +	machine->play_i2s_instance =3D I2S_SP_INSTANCE;
> +	return rt5682_clk_enable(substream);
> +}
> +
> +static int cz_rt5682_cap_startup(struct snd_pcm_substream *substream) {
> +	struct snd_pcm_runtime *runtime =3D substream->runtime;
> +	struct snd_soc_pcm_runtime *rtd =3D
> asoc_substream_to_rtd(substream);
> +	struct snd_soc_card *card =3D rtd->card;
> +	struct acp_platform_info *machine =3D
> snd_soc_card_get_drvdata(card);
> +
> +	/*
> +	 * On this platform for PCM device we support stereo
> +	 */
> +
> +	runtime->hw.channels_max =3D DUAL_CHANNEL;
> +	snd_pcm_hw_constraint_list(runtime, 0,
> SNDRV_PCM_HW_PARAM_CHANNELS,
> +				   &constraints_channels);
> +	snd_pcm_hw_constraint_list(runtime, 0,
> SNDRV_PCM_HW_PARAM_RATE,
> +				   &constraints_rates);
> +
> +	machine->cap_i2s_instance =3D I2S_SP_INSTANCE;
> +	machine->capture_channel =3D CAP_CHANNEL1;
> +	return rt5682_clk_enable(substream);
> +}
> +
> +static int cz_rt5682_max_startup(struct snd_pcm_substream *substream) {
> +	struct snd_pcm_runtime *runtime =3D substream->runtime;
> +	struct snd_soc_pcm_runtime *rtd =3D
> asoc_substream_to_rtd(substream);
> +	struct snd_soc_card *card =3D rtd->card;
> +	struct acp_platform_info *machine =3D
> snd_soc_card_get_drvdata(card);
> +
> +	/*
> +	 * On this platform for PCM device we support stereo
> +	 */
> +
> +	runtime->hw.channels_max =3D DUAL_CHANNEL;
> +	snd_pcm_hw_constraint_list(runtime, 0,
> SNDRV_PCM_HW_PARAM_CHANNELS,
> +				   &constraints_channels);
> +	snd_pcm_hw_constraint_list(runtime, 0,
> SNDRV_PCM_HW_PARAM_RATE,
> +				   &constraints_rates);
> +
> +	machine->play_i2s_instance =3D I2S_BT_INSTANCE;
> +	return rt5682_clk_enable(substream);
> +}
> +
> +static int cz_rt5682_dmic0_startup(struct snd_pcm_substream *substream)
> +{
> +	struct snd_pcm_runtime *runtime =3D substream->runtime;
> +	struct snd_soc_pcm_runtime *rtd =3D
> asoc_substream_to_rtd(substream);
> +	struct snd_soc_card *card =3D rtd->card;
> +	struct acp_platform_info *machine =3D
> snd_soc_card_get_drvdata(card);
> +
> +	/*
> +	 * On this platform for PCM device we support stereo
> +	 */
> +
> +	runtime->hw.channels_max =3D DUAL_CHANNEL;
> +	snd_pcm_hw_constraint_list(runtime, 0,
> SNDRV_PCM_HW_PARAM_CHANNELS,
> +				   &constraints_channels);
> +	snd_pcm_hw_constraint_list(runtime, 0,
> SNDRV_PCM_HW_PARAM_RATE,
> +				   &constraints_rates);
> +
> +	machine->cap_i2s_instance =3D I2S_BT_INSTANCE;
> +	return rt5682_clk_enable(substream);
> +}
> +
> +static int cz_rt5682_dmic1_startup(struct snd_pcm_substream *substream)
> +{
> +	struct snd_pcm_runtime *runtime =3D substream->runtime;
> +	struct snd_soc_pcm_runtime *rtd =3D
> asoc_substream_to_rtd(substream);
> +	struct snd_soc_card *card =3D rtd->card;
> +	struct acp_platform_info *machine =3D
> snd_soc_card_get_drvdata(card);
> +
> +	/*
> +	 * On this platform for PCM device we support stereo
> +	 */
> +
> +	runtime->hw.channels_max =3D DUAL_CHANNEL;
> +	snd_pcm_hw_constraint_list(runtime, 0,
> SNDRV_PCM_HW_PARAM_CHANNELS,
> +				   &constraints_channels);
> +	snd_pcm_hw_constraint_list(runtime, 0,
> SNDRV_PCM_HW_PARAM_RATE,
> +				   &constraints_rates);
> +
> +	machine->cap_i2s_instance =3D I2S_SP_INSTANCE;
> +	machine->capture_channel =3D CAP_CHANNEL0;
> +	return rt5682_clk_enable(substream);
> +}
> +
> +static void cz_rt5682_shutdown(struct snd_pcm_substream *substream) {
> +	rt5682_clk_disable();
> +}
> +
>  static const struct snd_soc_ops cz_da7219_play_ops =3D {
>  	.startup =3D cz_da7219_play_startup,
>  	.shutdown =3D cz_da7219_shutdown,
> @@ -285,6 +465,31 @@ static const struct snd_soc_ops cz_dmic1_cap_ops =3D
> {
>  	.shutdown =3D cz_da7219_shutdown,
>  };
>=20
> +static const struct snd_soc_ops cz_rt5682_play_ops =3D {
> +	.startup =3D cz_rt5682_play_startup,
> +	.shutdown =3D cz_rt5682_shutdown,
> +};
> +
> +static const struct snd_soc_ops cz_rt5682_cap_ops =3D {
> +	.startup =3D cz_rt5682_cap_startup,
> +	.shutdown =3D cz_rt5682_shutdown,
> +};
> +
> +static const struct snd_soc_ops cz_rt5682_max_play_ops =3D {
> +	.startup =3D cz_rt5682_max_startup,
> +	.shutdown =3D cz_rt5682_shutdown,
> +};
> +
> +static const struct snd_soc_ops cz_rt5682_dmic0_cap_ops =3D {
> +	.startup =3D cz_rt5682_dmic0_startup,
> +	.shutdown =3D cz_rt5682_shutdown,
> +};
> +
> +static const struct snd_soc_ops cz_rt5682_dmic1_cap_ops =3D {
> +	.startup =3D cz_rt5682_dmic1_startup,
> +	.shutdown =3D cz_rt5682_shutdown,
> +};
> +
>  SND_SOC_DAILINK_DEF(designware1,
>  	DAILINK_COMP_ARRAY(COMP_CPU("designware-i2s.1.auto")));
>  SND_SOC_DAILINK_DEF(designware2,
> @@ -294,6 +499,8 @@ SND_SOC_DAILINK_DEF(designware3,
>=20
>  SND_SOC_DAILINK_DEF(dlgs,
>  	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-DLGS7219:00", "da7219-
> hifi")));
> +SND_SOC_DAILINK_DEF(rt5682,
> +	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-10EC5682:00", "rt5682-
> aif1")));
>  SND_SOC_DAILINK_DEF(mx,
>  	DAILINK_COMP_ARRAY(COMP_CODEC("MX98357A:00", "HiFi")));
> SND_SOC_DAILINK_DEF(adau, @@ -353,6 +560,57 @@ static struct
> snd_soc_dai_link cz_dai_7219_98357[] =3D {
>  	},
>  };
>=20
> +static struct snd_soc_dai_link cz_dai_5682_98357[] =3D {
> +	{
> +		.name =3D "amd-rt5682-play",
> +		.stream_name =3D "Playback",
> +		.dai_fmt =3D SND_SOC_DAIFMT_I2S |
> SND_SOC_DAIFMT_NB_NF
> +				| SND_SOC_DAIFMT_CBM_CFM,
> +		.init =3D cz_rt5682_init,
> +		.dpcm_playback =3D 1,
> +		.ops =3D &cz_rt5682_play_ops,
> +		SND_SOC_DAILINK_REG(designware1, rt5682, platform),
> +	},
> +	{
> +		.name =3D "amd-rt5682-cap",
> +		.stream_name =3D "Capture",
> +		.dai_fmt =3D SND_SOC_DAIFMT_I2S |
> SND_SOC_DAIFMT_NB_NF
> +				| SND_SOC_DAIFMT_CBM_CFM,
> +		.dpcm_capture =3D 1,
> +		.ops =3D &cz_rt5682_cap_ops,
> +		SND_SOC_DAILINK_REG(designware2, rt5682, platform),
> +	},
> +	{
> +		.name =3D "amd-max98357-play",
> +		.stream_name =3D "HiFi Playback",
> +		.dai_fmt =3D SND_SOC_DAIFMT_I2S |
> SND_SOC_DAIFMT_NB_NF
> +				| SND_SOC_DAIFMT_CBM_CFM,
> +		.dpcm_playback =3D 1,
> +		.ops =3D &cz_rt5682_max_play_ops,
> +		SND_SOC_DAILINK_REG(designware3, mx, platform),
> +	},
> +	{
> +		/* C panel DMIC */
> +		.name =3D "dmic0",
> +		.stream_name =3D "DMIC0 Capture",
> +		.dai_fmt =3D SND_SOC_DAIFMT_I2S |
> SND_SOC_DAIFMT_NB_NF
> +				| SND_SOC_DAIFMT_CBM_CFM,
> +		.dpcm_capture =3D 1,
> +		.ops =3D &cz_rt5682_dmic0_cap_ops,
> +		SND_SOC_DAILINK_REG(designware3, adau, platform),
> +	},
> +	{
> +		/* A/B panel DMIC */
> +		.name =3D "dmic1",
> +		.stream_name =3D "DMIC1 Capture",
> +		.dai_fmt =3D SND_SOC_DAIFMT_I2S |
> SND_SOC_DAIFMT_NB_NF
> +				| SND_SOC_DAIFMT_CBM_CFM,
> +		.dpcm_capture =3D 1,
> +		.ops =3D &cz_rt5682_dmic1_cap_ops,
> +		SND_SOC_DAILINK_REG(designware2, adau, platform),
> +	},
> +};
> +
>  static const struct snd_soc_dapm_widget cz_widgets[] =3D {
>  	SND_SOC_DAPM_HP("Headphones", NULL),
>  	SND_SOC_DAPM_SPK("Speakers", NULL),
> @@ -368,6 +626,14 @@ static const struct snd_soc_dapm_route
> cz_audio_route[] =3D {
>  	{"PDM_DAT", NULL, "Int Mic"},
>  };
>=20
> +static const struct snd_soc_dapm_route cz_rt5682_audio_route[] =3D {
> +	{"Headphones", NULL, "HPOL"},
> +	{"Headphones", NULL, "HPOR"},
> +	{"IN1P", NULL, "Headset Mic"},
> +	{"Speakers", NULL, "Speaker"},
> +	{"PDM_DAT", NULL, "Int Mic"},
> +};
> +
>  static const struct snd_kcontrol_new cz_mc_controls[] =3D {
>  	SOC_DAPM_PIN_SWITCH("Headphones"),
>  	SOC_DAPM_PIN_SWITCH("Speakers"),
> @@ -388,6 +654,28 @@ static struct snd_soc_card cz_card =3D {
>  	.num_controls =3D ARRAY_SIZE(cz_mc_controls),  };
>=20
> +static struct snd_soc_card cz_rt5682_card =3D {
> +	.name =3D "acpr5682m98357",
> +	.owner =3D THIS_MODULE,
> +	.dai_link =3D cz_dai_5682_98357,
> +	.num_links =3D ARRAY_SIZE(cz_dai_5682_98357),
> +	.dapm_widgets =3D cz_widgets,
> +	.num_dapm_widgets =3D ARRAY_SIZE(cz_widgets),
> +	.dapm_routes =3D cz_rt5682_audio_route,
> +	.controls =3D cz_mc_controls,
> +	.num_controls =3D ARRAY_SIZE(cz_mc_controls), };
> +
> +void *soc_is_rltk_max(struct device *dev) {
> +	const struct acpi_device_id *match;
> +
> +	match =3D acpi_match_device(dev->driver->acpi_match_table, dev);
> +	if (!match)
> +		return NULL;
> +	return (void *)match->driver_data;
> +}
> +
>  static struct regulator_consumer_supply acp_da7219_supplies[] =3D {
>  	REGULATOR_SUPPLY("VDD", "i2c-DLGS7219:00"),
>  	REGULATOR_SUPPLY("VDDMIC", "i2c-DLGS7219:00"), @@ -425,29
> +713,39 @@ static int cz_probe(struct platform_device *pdev)
>  	struct snd_soc_card *card;
>  	struct acp_platform_info *machine;
>  	struct regulator_dev *rdev;
> -
> -	acp_da7219_cfg.dev =3D &pdev->dev;
> -	rdev =3D devm_regulator_register(&pdev->dev, &acp_da7219_desc,
> -				       &acp_da7219_cfg);
> -	if (IS_ERR(rdev)) {
> -		dev_err(&pdev->dev, "Failed to register regulator: %d\n",
> -			(int)PTR_ERR(rdev));
> -		return -EINVAL;
> +	struct device *dev =3D &pdev->dev;
> +
> +	card =3D (struct snd_soc_card *)soc_is_rltk_max(dev);
> +	if (!card)
> +		return -ENODEV;
> +	if (!strcmp(card->name, "acpd7219m98357")) {
> +		acp_da7219_cfg.dev =3D &pdev->dev;
> +		rdev =3D devm_regulator_register(&pdev->dev,
> &acp_da7219_desc,
> +					       &acp_da7219_cfg);
> +		if (IS_ERR(rdev)) {
> +			dev_err(&pdev->dev, "Failed to register regulator:
> %d\n",
> +				(int)PTR_ERR(rdev));
> +			return -EINVAL;
> +		}
>  	}
>=20
>  	machine =3D devm_kzalloc(&pdev->dev, sizeof(struct
> acp_platform_info),
>  			       GFP_KERNEL);
>  	if (!machine)
>  		return -ENOMEM;
> -	card =3D &cz_card;
> -	cz_card.dev =3D &pdev->dev;
> +	card->dev =3D &pdev->dev;
>  	platform_set_drvdata(pdev, card);
>  	snd_soc_card_set_drvdata(card, machine);
> -	ret =3D devm_snd_soc_register_card(&pdev->dev, &cz_card);
> +	ret =3D devm_snd_soc_register_card(&pdev->dev, card);
>  	if (ret) {
> -		dev_err(&pdev->dev,
> +		if (ret !=3D -EPROBE_DEFER)
> +			dev_err(&pdev->dev,
>  				"devm_snd_soc_register_card(%s) failed:
> %d\n",
> -				cz_card.name, ret);
> +				card->name, ret);
> +		else
> +			dev_dbg(&pdev->dev,
> +				"devm_snd_soc_register_card(%s) probe
> deferred: %d\n",
> +				card->name, ret);
>  		return ret;
>  	}
>  	bt_uart_enable =3D !device_property_read_bool(&pdev->dev,
> @@ -457,7 +755,8 @@ static int cz_probe(struct platform_device *pdev)
>=20
>  #ifdef CONFIG_ACPI
>  static const struct acpi_device_id cz_audio_acpi_match[] =3D {
> -	{ "AMD7219", 0 },
> +	{ "AMD7219", (unsigned long)&cz_card },
> +	{ "AMDI5682", (unsigned long)&cz_rt5682_card},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(acpi, cz_audio_acpi_match); @@ -475,5 +774,6
> @@ static struct platform_driver cz_pcm_driver =3D {
> module_platform_driver(cz_pcm_driver);
>=20
>  MODULE_AUTHOR("akshu.agrawal@amd.com");
> -MODULE_DESCRIPTION("DA7219 & MAX98357A audio support");
> +MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
> +MODULE_DESCRIPTION("DA7219, RT5682 & MAX98357A audio support");
>  MODULE_LICENSE("GPL v2");
> --
> 2.7.4
