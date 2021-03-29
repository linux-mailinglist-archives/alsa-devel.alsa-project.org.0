Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7081534C589
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Mar 2021 10:02:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1CD31684;
	Mon, 29 Mar 2021 10:01:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1CD31684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617004965;
	bh=IGQyBX+OB17LuP0ihz3doNVCwH6cik/gkCqtji71T2I=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LAvsoNxhHLTdlkslgYpvSm/PCjHivn3QYaJ7TcGvHbdvzYgMYOnd5h6dqIMZFCetY
	 mV+gH17khygEzL56/k/APo7PRs5i+2bMYDXkexC93IWuWg2pzYDB+siA0gvnmZbA23
	 cpqH/VgFto3y2SjGuTKdL9Hy74bg0QRwWT1EI41k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06133F8032D;
	Mon, 29 Mar 2021 10:01:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5FF0F8032C; Mon, 29 Mar 2021 10:01:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F79BF80260
 for <alsa-devel@alsa-project.org>; Mon, 29 Mar 2021 10:01:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F79BF80260
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="DVED5I/Q"
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12T7w3eO002507; Mon, 29 Mar 2021 10:01:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=SXrRFJi/ILq5aGBoXPVef4yyY9EKWHH1N9sSZnyK0JM=;
 b=DVED5I/Q1mBaULUzuyBwA3YBDPuatzGd7gnSzSLCQ3ypiCXV80pqiQQY9a7UmUoCMVTP
 8bnrkH2vJW2xBTvqaftenJTe2j9x16wX0Jqi0oTLFueYxtijHS5eOyCPZ57CblABSfCL
 BLiI2v3+dnfc/z3GTIgULHeubGOo+CfOh2MFNELHM7DklQh9jYg7emhWxkNKP04AZjN8
 T7/nN6VaKV3zWYokKXFKRWYJ9v+SRlzzdHe4StdG/C2+u3sO1/zE99pMOVNcCa71YMvT
 vv7DTsJfqr7yJsSh4cdeSLrAcLorwe549s62VHU5m49BIV3S59Fy3Q7Gdh/Te3KZEiLq 4Q== 
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50])
 by mx07-00178001.pphosted.com with ESMTP id 37jy132rar-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Mar 2021 10:01:33 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dqV6xIwCi4XCDXuyjfpoHabVFNOVsL+mOoo5yvfISNqEYbmOP7sBi5pJPQHUTkst7R265PbFt9nYwfI0VAtccvIYMxGLzvmm5W/aDEwqsF2Pwt/D/ap8ezHUE7xkvxVR9Z6pi4BB3PJ8nzHsteFATx9IWuk0K0C2VEGheyJpg+jU6BqFXv71lk26o5LOPoeN391RwXk1dlwIi7SnldV3sbMyOhUQqOvxlmN+zUmbrORVdV9eemkX4yThKoiNQ8JVAeYqEJ5vDusPwQ3AWlwj8cE9vxbUlVJ0P0gMxa60WTFpgrBs4sQ+G2XyMik69l+N/u7XWvHKuWvvKwtgPMv59g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SXrRFJi/ILq5aGBoXPVef4yyY9EKWHH1N9sSZnyK0JM=;
 b=OZTApepHNmJvSM1W7aM4EZtASVUdQdWC77JlpI6lRGoveo8SMEp63lfUp427q7/GnSf300tMLWuAXZLely3P/edJJ6ghHo+rtQEeWp+caiEhwQqXDLySr0lLe15EvY/FCkva0YTUE8KL59AtMXZ0zL3LVGgefqgpoj490zNiXazBW5iIIt/LyMxYHpuUbsE0bE5nzFWkW6vD5HW3xrh5nq4st0RNkkCXu3rVqarpqBwlLpzoFautwRd1OrJUSBNm0sW2Boo0P1TkZKwO/mL086BVKJfyZwZsHaM5OsSxAporGTtdtlink80yn9lJOD1IETWnLhMjeovaEPfE+w4WEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=st.com; dmarc=pass action=none header.from=st.com; dkim=pass
 header.d=st.com; arc=none
Received: from DB9PR10MB4746.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:23d::22)
 by DB7PR10MB2521.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Mon, 29 Mar
 2021 08:01:21 +0000
Received: from DB9PR10MB4746.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::81ed:3852:ada8:9b98]) by DB9PR10MB4746.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::81ed:3852:ada8:9b98%6]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 08:01:21 +0000
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH 08/17] ASoC: sti: sti_uniperif: add missing error check
Thread-Topic: [PATCH 08/17] ASoC: sti: sti_uniperif: add missing error check
Thread-Index: AQHXIotrJjpsBNRHWEitvVA/o530dqqaniNg
Date: Mon, 29 Mar 2021 08:01:21 +0000
Message-ID: <DB9PR10MB4746812285B4E6A66546C12FF17E9@DB9PR10MB4746.EURPRD10.PROD.OUTLOOK.COM>
References: <20210326215927.936377-1-pierre-louis.bossart@linux.intel.com>
 <20210326215927.936377-9-pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20210326215927.936377-9-pierre-louis.bossart@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=st.com;
x-originating-ip: [165.225.76.79]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3d90a89a-135f-4c3c-b6df-08d8f288d737
x-ms-traffictypediagnostic: DB7PR10MB2521:
x-microsoft-antispam-prvs: <DB7PR10MB2521BBD6AB19934A6E87AFF8F17E9@DB7PR10MB2521.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5dJlXtfp3j5861GvEPuEHDj0/LCZoN/lPpGrN1IJfcyTWkkxY+7lR0tHMdzssysrcdvMOJQ8o04QnUp80lYi0yTNNDyfmnuQBOxcrEsWFn0tgKWoGOaGcQslsZ2CIdDuEVTWmiXWrcuX9eIw1//38SGX6v8/w+EYxOZ2Wgd+Q7v6XkqB4g685bjlTFiXLNZhDniZwL369MGxetipPhdIcpz5mUrX2486S17rh4zH4somUMfLjGOSGGsrozfKfKvA6vBTbOXP5UPOwTzAqeEXrv/IROed6QVdK/MuFWEHg8lsD2Z+9Im63fexU8eWeX2lcIeaOWyNqwAn6Dl+uzSw+S/vdjOFGMGQIzYC9mndoprLHBz/FtUSoiMU/R0hHVa/7bEK7dgkNrObKfs8OlpW6WlDCJlvPWdS2FSslj9Vu8o+iXX108widaQHGCckxNLClumhO2tJgI4S3Hbil/pvALsU7E1NzCteX9IZoZ8hxlffa6hhVFzNi4KOvA5uv5NUKybA5PFed8qn/LmiMSEQNV7kab3pEPW75/r3vGJgwHfWxhkMhO2W8OW3CjAmW+5QiD8yVHso/mgIEGKxgEi2SOJUVLW6vsJK+qKML2JKXXNcz1YR4WNCyBxbIdGEA0+lq0/yu/J7KgHbOxZS62/zaJyCdVszLHK/65kq0R+peCk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR10MB4746.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(396003)(136003)(366004)(66946007)(66476007)(76116006)(26005)(33656002)(110136005)(55236004)(66556008)(86362001)(53546011)(52536014)(66446008)(64756008)(2906002)(8676002)(186003)(71200400001)(38100700001)(54906003)(8936002)(478600001)(7696005)(55016002)(9686003)(83380400001)(6506007)(316002)(4326008)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?yTPAfiqsXzYoo2ZqIB7UEPsE5TsiQa+9jUvijl5d54JPV/IK0R3imrELKhku?=
 =?us-ascii?Q?oktY5rWMBkpNYLtWXaIsCbd0Lnu5IYxLHkPZHqfq9qpoHTr21/3VXWtV2BJo?=
 =?us-ascii?Q?9enEvsen1KMS2yMJ+iFi3hHHf6Y3xj66YrlGfSy7YPiKGe8/NDYV523z236j?=
 =?us-ascii?Q?rDVVjYFPbA7xgy+OHH3a3c+a73UxcbtmsaPJ9DVuJyb5QX0MhNkd/N6yCOrn?=
 =?us-ascii?Q?42ah7LxEEhKysk50qmRhdMvopEakcoPTa3DBUAXglHa8TRjWeSiY6UP+y9r9?=
 =?us-ascii?Q?vseztEW3+QUyZGcskqajZ/ThKajCI3H3AH1EcpswRinjp5P0mipJ4/pyAMvP?=
 =?us-ascii?Q?Syo55NyLPUTiw7ePpXxmnptLxn9CfnvTPDJm+I9v/JXFFyUMCwjc29c3Mm29?=
 =?us-ascii?Q?DtKJF8jhXcYT2lIcfD3OUBk1m2i+fAE+jsuKgcpERP2mPhXt293J3cWHIAgT?=
 =?us-ascii?Q?V9khxYErbcBBsikno9e4lXK2IUV82qhG8YuyuuN2XP2eEGBXzd5veOwcqwcL?=
 =?us-ascii?Q?QKIxLqWdzj8Zl/+gbm2IXP+9zCw/0R16Z1hihuPdONzdWaXIV6jC9it0c7fi?=
 =?us-ascii?Q?0y8sr/Rn4q5FjMFupSlZTTDSRib1zY/7tj8iG7DopLwbMywRloQ9vtWt/L2Y?=
 =?us-ascii?Q?BwgIeIDxWXS9AujuMyUWzlCAM7kCzN9YMo7nk2x16w/onTso2XAFZWPqxzm3?=
 =?us-ascii?Q?v7dgNimSiUgwIz+uNuN4xRgH3B6RpKiHVSriKeU/IFq0nJMrA1kV4L9AC9KP?=
 =?us-ascii?Q?ZxBRRMySlqv6bXVM2gkkOYWspRLkQFWbJIUqCpzt9c8Y/o6/5js/vjjhVN0y?=
 =?us-ascii?Q?D+HBavrqpn7IuYH6EbBYWqbrkiYaRVW6b4JG00hD6Ml9pSb0zcEvYD1jvZHy?=
 =?us-ascii?Q?AuQ0o0v9xxeRKmQyMmnDoc+ghfxqPOdagnTZI2mlD6pvqgXQHACMB0ws2UB+?=
 =?us-ascii?Q?4A2/OXVdX9ClIpK5QwBQvbgirGt56h2wkScV5RhOnio930szEJlzL1sB/aIv?=
 =?us-ascii?Q?FqvAJ8QtWDEDDQ5y7N57IVJY1TjEG25wypkUw9CX9Ow///kjlw0tk9o/cdfL?=
 =?us-ascii?Q?/ClpdhrpjQbCAnoFtGXCd1KxLtJglnO7cgpGYp+Daaif0/d2k/C34WWzG1g7?=
 =?us-ascii?Q?J+5RjXLGYD56c/Q5z26WAsat6hbo3gF7sgSnJFs6RgDvyhtyUUEz95XXu1tr?=
 =?us-ascii?Q?TKlAHoE606GMjRshuPx6Hg0iHxyTHbothp4922SO7Q8N6oMoeuYVAt1ly1Dq?=
 =?us-ascii?Q?YASbBZZ6NJoFa8FGtwlKS6vPMRr8fd/0Z1ag5mLx9dH8uu8YtM3FY1KEl9on?=
 =?us-ascii?Q?w3Qg7fzlI1OlxfCJg61s6qWI?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: ST.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB4746.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d90a89a-135f-4c3c-b6df-08d8f288d737
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2021 08:01:21.2116 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bKrWhl5SLd97yFuUxdjkMq1tsRKPAdgLE+qB10uX1T6rkvGrQImyTm2zrJTD5rrK2oL9KsCl5A6xqv4NcdZHfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR10MB2521
X-Proofpoint-GUID: zA5LLp1bTZm1o5i_0Ql61EaAp74PUCeA
X-Proofpoint-ORIG-GUID: zA5LLp1bTZm1o5i_0Ql61EaAp74PUCeA
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-29_04:2021-03-26,
 2021-03-29 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103290061
Cc: Liam Girdwood <lgirdwood@gmail.com>, "tiwai@suse.de" <tiwai@suse.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, "broonie@kernel.org" <broonie@kernel.org>
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
> Sent: vendredi 26 mars 2021 22:59
> To: alsa-devel@alsa-project.org
> Cc: tiwai@suse.de; broonie@kernel.org; linux-kernel@vger.kernel.org; Pier=
re-
> Louis Bossart <pierre-louis.bossart@linux.intel.com>; Arnaud POULIQUEN
> <arnaud.pouliquen@st.com>; Liam Girdwood <lgirdwood@gmail.com>;
> Jaroslav Kysela <perex@perex.cz>; Takashi Iwai <tiwai@suse.com>
> Subject: [PATCH 08/17] ASoC: sti: sti_uniperif: add missing error check
>=20
> cppcheck warning:
>=20
> sound/soc/sti/sti_uniperif.c:490:6: style: Variable 'ret' is reassigned a=
 value
> before the old one has been used. [redundantAssignment]  ret =3D
> devm_snd_soc_register_component(&pdev->dev,
>      ^
> sound/soc/sti/sti_uniperif.c:486:6: note: ret is assigned  ret =3D
> sti_uniperiph_cpu_dai_of(node, priv);
>      ^
> sound/soc/sti/sti_uniperif.c:490:6: note: ret is overwritten  ret =3D
> devm_snd_soc_register_component(&pdev->dev,
>      ^
>=20
> sti_uniperiph_cpu_dai_of() can return -EINVAL which seems like a good-eno=
ugh
> reason to bail.
>=20
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com=
>

Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Thanks
Arnaud

> ---
>  sound/soc/sti/sti_uniperif.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/sound/soc/sti/sti_uniperif.c b/sound/soc/sti/sti_uniperif.c =
index
> 7b9169f04d6e..67315d9b352d 100644
> --- a/sound/soc/sti/sti_uniperif.c
> +++ b/sound/soc/sti/sti_uniperif.c
> @@ -484,6 +484,8 @@ static int sti_uniperiph_probe(struct platform_device
> *pdev)
>  	priv->pdev =3D pdev;
>=20
>  	ret =3D sti_uniperiph_cpu_dai_of(node, priv);
> +	if (ret < 0)
> +		return ret;
>=20
>  	dev_set_drvdata(&pdev->dev, priv);
>=20
> --
> 2.25.1

