Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9C65083AA
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 10:42:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BACF8193D;
	Wed, 20 Apr 2022 10:41:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BACF8193D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650444130;
	bh=8i2/k4SKJYn+RK1BzcyNxy7LDLWN6BiGrXDG9Xur0cI=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rRWx08ef5Vf2fpGOb6BiXglEZAh9FwhTpB/DNHfwRSHxUHI13mrLyupdMTR2gIZgL
	 DMpSQfB+W/e/J+Tr9iVEPLzZ4of38rObnbNRJHgKrRF0PqcS79sNtZosCwkOr4MU4z
	 IhyxyljYMxfY3uz8BP4rOfoTH7X2HkN/66zN5wnw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13BD4F8010B;
	Wed, 20 Apr 2022 10:41:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8CF47F80125; Wed, 20 Apr 2022 10:41:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0d::603])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C96BF800F8
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 10:41:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C96BF800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="E88GfoKG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ThQiKt9tcdz0cfg18BhlmduJ8usNtMQSHfTk8GLr48+wJCscu5V1AUvpAcbHe6oZb77DE/jJ8T2roo9D83N+5VA8oYdm7SVskF/9M97OcZYJC/GlITXKRr/7ayQYR4kwEfnDmqu7vcYZpSxbg5GqAd0CEwOmeZ1JU69SvpUzD2j/Ls3klhAHtUX991auimPlFhU/L0/jSCfUIYXqLYUv4XTmZsln68z9fs3FObV93x2TL/RRyE8UZVJSOJLKW39iYTPm8/0jeH7sMozMWniTl1JgszMfAwWvtP3T6TmSpibfyxN0gK/Vc/ex40rDwCuPMxAozYfqUJcgrq72r6db3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wls895Fz2Upp4B25tEXCE8TU0gGiIjkCkMxeiw42R14=;
 b=chttYtqQDbqspHL+I/qnlipGbCf3dYvOBjDZ+F0YJF3BiHQ+5kVvmeCl9awjs/zwnBp+EACQevBjKZ0KOW9Z2c4ri5BTraqSF4LZgJ9c8jObHxbhVJYOlzJbG2MDdZOwkcnQXZgmOB9JVW8yZmUa3T3LzviirSkcHHiHIMbni2iXHs8by/2sxR5A6GESQfVEYrBmz4ZUW+cl17ZPWzAFgJonhIExhAsI6LK2GfJVdCrAYt2hfaNEl9vMAVe5KJPouFI5vl5sAacaiPAeilcSaPmGtKRFjlptUtC/XxYcO9AMDTsBESF1zUIf60QNPpg1UHr2KNlvuwlevLKZd2I+zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wls895Fz2Upp4B25tEXCE8TU0gGiIjkCkMxeiw42R14=;
 b=E88GfoKGiTmCW+wh+SZzK3M1A2fapRkCJx4e5vwgGqvntFXXhO+W+hn3TOPxDlkPVlm0QTSsjU3PIksJdfA+/7J2tB5tUVjKZputqm+zU7auiABMhxhdqD3VGn09b92xsxqVj7HUREWoc50wJmrZp4RLosTR5Y/2XY2WF5kiau4=
Received: from GV1PR10MB6124.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:98::9)
 by VI1PR10MB2510.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:7e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 08:40:58 +0000
Received: from GV1PR10MB6124.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::492b:803f:c731:623b]) by GV1PR10MB6124.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::492b:803f:c731:623b%4]) with mapi id 15.20.5164.025; Wed, 20 Apr 2022
 08:40:58 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: Mark Brown <broonie@kernel.org>, Support Opensource
 <Support.Opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>
Subject: RE: [PATCH v2] ASoC: da7219: Fix change notifications for tone
 generator frequency
Thread-Topic: [PATCH v2] ASoC: da7219: Fix change notifications for tone
 generator frequency
Thread-Index: AQHYUpFG7ugoiJIcMkmwoUeZXpSp7az4fi8w
Date: Wed, 20 Apr 2022 08:40:58 +0000
Message-ID: <GV1PR10MB61247C557BBF9A6770A4594080F59@GV1PR10MB6124.EURPRD10.PROD.OUTLOOK.COM>
References: <20220417192733.7382-1-broonie@kernel.org>
In-Reply-To: <20220417192733.7382-1-broonie@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 01d86aef-d198-4941-e420-08da22a97dd6
x-ms-traffictypediagnostic: VI1PR10MB2510:EE_
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-microsoft-antispam-prvs: <VI1PR10MB2510EEE83914BBCD17079FE7A7F59@VI1PR10MB2510.EURPRD10.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: odStudcuLnhh+6Mrg5HMZPEv/721uEhFU3a5xW8EWHHAW7pfsURclWok2sUVTcePMqnmhZi1RJZGcJQtffeQwKf6p4H/0Y2NN//QnmGitoPLgX4Qw7H0oZl6rPivXdoA2xgiwZQfjarN3fQHQwdKUpsjACR2CcFd15vhTf7nfu7mppBi/dOxfnfFAw/3kM+Umqc1RhtQwX2C3z+SUKHVTeGVo1EumZ170CK+PiP1p/Akh1xUyPwN9hI351k9+dUnnNp4jXqfbvRT/bDGo6yOIwx5XGuWipiuz5pZ8yUNxxAaKRSCqH5w3ZnMy4Arnvc25IPaVHDUnl5ZnPDK0i1wscLFzSV3JefOKpt9QY3MTbeuhm2a1UU1QlGKJBgIOeRqmW/5pNiY0l+m8k4UiWouPBmg9C6+FgPNslv49DHqMDFnW0jnFnqph9X9UjOpSuyKbU/nloSQZ0v4F6RIqg2dk9IxMGrsTTU7SQ74ZzKL+dpMocyVEOAjOlSM4e7W6G1uGX3CCGtFiLv7715Z8Radpiv+uyixwlKSRKvf6mTea/sZrVepv++ETTLju4EXHWv3botXt+vVG1vKKVa6wMndqAroiqcmcjutNIsDtgyqa7Q6ID752hwyPtBhOHPINgRYt7KqIp1ULnTZ7JC7evzXPon4GOO5/NlYKA2MQT5lPYEeHMj2aTXTCZZr7d+fk6DI+FkFcu0f5DeG6Y5a6CUYtQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR10MB6124.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(122000001)(8676002)(2906002)(76116006)(55016003)(83380400001)(26005)(7696005)(38100700002)(110136005)(38070700005)(9686003)(6506007)(316002)(66446008)(508600001)(186003)(52536014)(53546011)(66476007)(66946007)(71200400001)(64756008)(5660300002)(66556008)(8936002)(33656002)(4326008)(15650500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TWMOaLBc7W64E4n8vAIGcgT8ust1Xez5twopPMfLUIhI7I1x33/gXpvQqmQA?=
 =?us-ascii?Q?IOppC+79Sx/IxhVyZbTNYh1e0jOIoSQCWj3zELbiitqs+NU7UnGpCmEwKe0+?=
 =?us-ascii?Q?lxozouflqN2iGg3gsXVDPF6IjBFSAtnNgNFqHHNiOR8QxuvQ2aJihqr5B8jF?=
 =?us-ascii?Q?51QfEs7OM8vIS9/n5sHwdPTKWHIstXRPCakCzJsDrpworHtjsaWz/SWI6FJb?=
 =?us-ascii?Q?zB4D+cVhDnaGRZDf3RcCRAbrPAbDyn8OPXpDtiG2x+h1kQgXTcIBOQHHu5yY?=
 =?us-ascii?Q?QHWxlhD4L6sLAHD9o1W4Un7JUwljWUq5PZXB1YKCTUzi7GP50x+kcTB9Q1Oj?=
 =?us-ascii?Q?3tFsUVtIurHZwNnFgpPCGOKOJ+sxatF+r3VOgW6M5OGdf59grbCRhEe7yrrQ?=
 =?us-ascii?Q?KUtxN8eU+eK7waDyw07SK3mh2RhiXuFeXtzrEXNIB3JJ42lfOajb1daNsOp8?=
 =?us-ascii?Q?117+EuP5biYXxXL3TpMy887fbSRBQwRD4qKU1xQ/LHqfhjebWqXRdWctO/vM?=
 =?us-ascii?Q?f2zg3O/X9TRIh5mseWQPZgP5D+0zu4uOqXgxmdOq/kYa6kzcaXBf5GXuTUwo?=
 =?us-ascii?Q?Rs++um9LB1aW7xWtxKlgONz9L41yF4qe3kUkLonGF2wbVAzXeypvG/D03Mcf?=
 =?us-ascii?Q?cXMOfTtcUjXg/InslE2TBS+Jl8bWXQ/wO7umZiBkEgle5q4MRV8r/DklEwWH?=
 =?us-ascii?Q?OLIAk177NBCpt8CuuZcnkQktWf32jfJUCpLemd90Sz4GESprh2p0KF4+soc0?=
 =?us-ascii?Q?wJ1G4JUI4c+h1Ou+i/B29CzkJBDetUyHPGpPCUFb27TKX2erhtpODUcOP5Ic?=
 =?us-ascii?Q?alnAaM7f5gSHjJvvyNTAA9Fgazug9UzYrKpRGQKXkVjOABpQjYIED9zU1DUY?=
 =?us-ascii?Q?/ndFrw6wPdzVTJ5HALYPO61XX5hYT8efPGWwAqkiJoSwq3Bzih9wyu51suGa?=
 =?us-ascii?Q?V5xyk74/zjHMBo6ttRRaIfewQddoEF/YKk0TvV0FGx8KhkbFXAnkEdK8kKrS?=
 =?us-ascii?Q?558z6R1uP93XUPXNwnifw6RYa3brlcZNJCnKpQWP2QigxQ0x70HrQ1q4NNIL?=
 =?us-ascii?Q?7ymgHvlUr9N1mY0DPmkeHDIolCbNDl4fbWZh8R/hPoDaRVQTQYPRq7EsKkH9?=
 =?us-ascii?Q?i06nL7cJpYKdqNKFdZM18Z+smbZyzI9ewsM6mbdR4cQvdjNDKNW2ShduEp9k?=
 =?us-ascii?Q?ZGDhK1/cKxrhL2zI7Sj9zRLJkRUKGL+8EuY9ZblJM4osp0iE8fqnFRnv9xMo?=
 =?us-ascii?Q?/ckB1oiYJcQVN5LoWjWfMiaZZJiQNn5Op12zbf0o9kF6VTHvPkbiXCD78+eD?=
 =?us-ascii?Q?FCVYO8PY1TZb/x1ZM/+qBDTno/MBKv0hDstZ7VbVcG29oflU2iA6oC51wXeC?=
 =?us-ascii?Q?5/UJ9QC6jqMRLEPqBLZcgUycrVqPKaagpD7j2EA+hqpmwQikgZ0+mnOtW0Sj?=
 =?us-ascii?Q?TurRlzZ6GCPHMIxWBczTRRJHK+xRRiJmSqE57+ZpZaCfXkOG9xkU/PGa03nF?=
 =?us-ascii?Q?sosZ8ff1H37TgIrbszKJalafSZGvZQ5IQ6laMYsStMTG2nQzNZ1jEaxulRM3?=
 =?us-ascii?Q?zdh8JM4WWu13WtnmSmPy2EbTBQUqHRMzWu7Yr/29aQ1KushY70+uAroFKEgb?=
 =?us-ascii?Q?oBwtEYJCWhkrKe7lEg/Q7eUCLndetbwo2CuHvw9mp1oh0AJf2pbJX014LKKd?=
 =?us-ascii?Q?3uWGJcZYCctLF/iRzGt9UpDqkHFGEcuRnT3TD2y4gdVsOyA+U+xNyqCreMGl?=
 =?us-ascii?Q?rKoFw3pRmAqak/UGte0AIeo4I1LIn1Q=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR10MB6124.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 01d86aef-d198-4941-e420-08da22a97dd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 08:40:58.1461 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5xYEDmLN8PbOSVz2uBwqnIrdTAhONMA/YvXI4Lvfg4F3cV1DXclj4n8XinYE+lLJF8GTrewQdTylhQOs8QFrM8l9juSXm24HRa+V7DFWtM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB2510
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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

On 17 April 2022 20:28, Mark Brown wrote:

> The tone generator frequency control just returns 0 on successful write,
> not a boolean value indicating if there was a change or not.  Compare
> what was written with the value that was there previously so that
> notifications are generated appropraitely when the value changes.

s/appropraitely/appropriately/

Thanks for the update. Good spot.

>=20
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  sound/soc/codecs/da7219.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>=20
> diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
> index a28d3601b932..c08e15830cec 100644
> --- a/sound/soc/codecs/da7219.c
> +++ b/sound/soc/codecs/da7219.c
> @@ -446,7 +446,7 @@ static int da7219_tonegen_freq_put(struct snd_kcontro=
l
> *kcontrol,
>  	struct soc_mixer_control *mixer_ctrl =3D
>  		(struct soc_mixer_control *) kcontrol->private_value;
>  	unsigned int reg =3D mixer_ctrl->reg;
> -	__le16 val;
> +	__le16 val_new, val_old;
>  	int ret;
>=20
>  	/*
> @@ -454,13 +454,19 @@ static int da7219_tonegen_freq_put(struct
> snd_kcontrol *kcontrol,
>  	 * Therefore we need to convert to little endian here to align with
>  	 * HW registers.
>  	 */
> -	val =3D cpu_to_le16(ucontrol->value.integer.value[0]);
> +	val_new =3D cpu_to_le16(ucontrol->value.integer.value[0]);
>=20
>  	mutex_lock(&da7219->ctrl_lock);
> -	ret =3D regmap_raw_write(da7219->regmap, reg, &val, sizeof(val));
> +	ret =3D regmap_raw_read(da7219->regmap, reg, &val_old, sizeof(val_old))=
;
> +	if (ret =3D=3D 0)

Wouldn't it make sense here to only perform the write if the values weren't=
 the
same?

> +		ret =3D regmap_raw_write(da7219->regmap, reg,
> +				&val_new, sizeof(val_new));
>  	mutex_unlock(&da7219->ctrl_lock);
>=20
> -	return ret;
> +	if (ret < 0)
> +		return ret;
> +
> +	return val_old !=3D val_new;
>  }
>=20
>=20
> --
> 2.30.2

