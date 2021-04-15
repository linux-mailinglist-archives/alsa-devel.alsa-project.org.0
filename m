Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA6C360FE9
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Apr 2021 18:11:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49ACD1676;
	Thu, 15 Apr 2021 18:10:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49ACD1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618503075;
	bh=7jUlwKq1ur9+hh5LAm1O2XopZP26yvF2C3Y4jIuxHlE=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R8nhkHitSKz83AeMIBj+9eyL1Kjr2kT+H+ALipCQad+YUHj2EUfyrspywOWk4qKAR
	 YhtT1Z1VufYOGsLlZL+emPH5nBtAWvJFS/CUEYcXVJWmb8WspIInGAslQ0niZwWYI6
	 iIRAFInS4EMQrKcdYa6Fv3/I7nRFylsMqP2bsYsU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18579F800ED;
	Thu, 15 Apr 2021 18:09:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F0F8F8022B; Thu, 15 Apr 2021 18:09:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20049.outbound.protection.outlook.com [40.107.2.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6BD1F80128
 for <alsa-devel@alsa-project.org>; Thu, 15 Apr 2021 18:09:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6BD1F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="KTkhPKd+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bvSPerlwyFyBQwtFaLCNZZ9rWyH7muSb+vRArNtMzo1NWkQG2i5uQrC/4nO+prVet51ZVUEHFDkyvRy72uuIPc3vonvFtTcSzYJ7HLGj0AerUjwPXliomDgqL8+K91zMkCoiHjCtcJS8fOR4Sux6K/f3L10YKgNEHTPeCZNRKnui95IUgbv6G/Cad4v/E/1NPAnp/KMezcrEWBauod2hPUFC83SNM4ofA63HQ2sz12W41fl2I/HJNiKxI4TaND/zdtdWVq9rLB28NyPow1REIL7wVde2gcr4aeqH5Meq6Qe/VD8uJPp/aTnql4G5T503qruQFyho6AS7pnYJx2q+pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jUlwKq1ur9+hh5LAm1O2XopZP26yvF2C3Y4jIuxHlE=;
 b=jhrofBMeJECprBucdJqKlMSROfwG4t7/b3Z1XnizKPSHQrntrqnt5boyPK032OQpUWbDbfqe884xV/IRdFr6XXBzEeSBP3L96GevjBGeZPkMT92yzDDuSRyQbFVdcfpiUIBgQeqfLCOYBRB3gDsaSaDgOIc9oIBqCt9gCTceKO+oFL8rTopFV0RUITzP4sRkMfNyVbtUzcJS4VZpthsUeXMZETBBGwuMhJAgJSJiP0bhAsuYafhm5B1b8c3lm5FHC5ZgxepFENajkUzQWQDY8chWRSSe0F+fcEy20NQhBNE6wojNvsisSwkfXYFIlYucPn8PXOIM6tw80tvUA2px1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jUlwKq1ur9+hh5LAm1O2XopZP26yvF2C3Y4jIuxHlE=;
 b=KTkhPKd+/jPWLjYghIVdwqHDpP9Su/FrSnT4Mh35ptUYZ1nOsNhEq3Vv0YXmOj+BLi5KHmtC5irPvLDgnAbzBkonuKQVslbwNea+mZIZwMxRFqPr3SUsyKcMYBF/q5CP0X5BPg8BV3MoC1mJ8/hW37o7XxBQ9mpRnz2SymHL4qM=
Received: from PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:ac::5)
 by PA4PR10MB4557.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:10e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 15 Apr
 2021 16:09:37 +0000
Received: from PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7040:2788:a951:5f6]) by PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7040:2788:a951:5f6%6]) with mapi id 15.20.4020.023; Thu, 15 Apr 2021
 16:09:37 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: Mark Brown <broonie@kernel.org>, Adam Thomson
 <Adam.Thomson.Opensource@diasemi.com>
Subject: RE: [RFC PATCH 2/2] ASoC: da732x: simplify code
Thread-Topic: [RFC PATCH 2/2] ASoC: da732x: simplify code
Thread-Index: AQHXIo2z1z47S5z30EGys1D2hqxR9Kq1275AgAABFwCAAAFJEA==
Date: Thu, 15 Apr 2021 16:09:37 +0000
Message-ID: <PR3PR10MB41422CAB027515DE2D6F684D804D9@PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM>
References: <20210326221619.949961-1-pierre-louis.bossart@linux.intel.com>
 <20210326221619.949961-3-pierre-louis.bossart@linux.intel.com>
 <PR3PR10MB4142E8DBB9313E751DA52DD0804D9@PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM>
 <20210415160410.GF5514@sirena.org.uk>
In-Reply-To: <20210415160410.GF5514@sirena.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [147.161.166.124]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b0abdba8-12ba-4946-8335-08d90028de36
x-ms-traffictypediagnostic: PA4PR10MB4557:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PA4PR10MB4557568D2A234FE12A0B2C1DA74D9@PA4PR10MB4557.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SOphqcsZ8QiraJ5ZlTvzldvSjzqW4Ev0kZ8por2+CSsLaIyFZEzzzgi3KVkjvLNI5VzpiaJLmJEEhpQVrP3eyqNVWqpvPmP5YyAFz3wdQLvThNSptz7pctoIMY5NvE9OQyd8arBaqEjDEVkFLQDP1lx/UsUpPYt/YnP/o/Zp2hGwJcaZPxTURNEsSTqhm4VWvw9g8wYCIysBpvoCTDowhs0vsJ142anM1G1qEx3KNKfscLeNa1Cv0HCTLcToHtoLIi9Gf/p38+yxumBJUlAqwK19VfJH/EkRB8+zsTsTvHuNZRVT+ZdNgbL8CUu9GeCTN976ReC7xQY7Xw+r2Eb8E0nMgBIAZ59wPKdtGrf6pi5XaJ6z0vHhxXF06Vjkv/LwpqLds1BBdD9wNeH3GCjU6b7fSvbvyr1tJow7wPuIdCxVTvdchb+1g9gITDLbj4tdlEUM9yktSNbin+eGdmcfvekIg/UoCsOmpfmAz8jADHo8RI1fkp2aT6thMdROAh+q3D/C1TgTC3br1g6cufTQqAfoVTTqV2bGuAOON1nQvU2xpWUxGEFQ6SURq/Ivxo8+B9K6ktrcr6gFUsLUbGI6SvPfaOSgSDnlPdE1NGtVkxc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(346002)(366004)(39840400004)(478600001)(8936002)(5660300002)(52536014)(66476007)(4744005)(4326008)(8676002)(66446008)(71200400001)(76116006)(186003)(54906003)(316002)(26005)(110136005)(64756008)(66946007)(66556008)(33656002)(6506007)(86362001)(2906002)(53546011)(122000001)(55016002)(7696005)(9686003)(83380400001)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?RhDiFBSiZ6cSwnazVJId0KsjwGEpx6yJvabTwHlzEQHG+ZL0MUdGatrMPp04?=
 =?us-ascii?Q?W2wP96tBIykAy7CstO1l3tikbpKFNTK4ageUUW1Vp32O5kl3xRsR3zSInse7?=
 =?us-ascii?Q?g02dz/bGkszrnbNzeYutLbVQPEbBGMxm1ygJIIKVw+saK1Zh1VmllEcuu9y0?=
 =?us-ascii?Q?HU/7bQFKK+ICITssO4F7S5B8piA2LHv5gueKj3VfgyERNiPvnMOtydPmVa25?=
 =?us-ascii?Q?hFXpg3MmoagUZGXSkkvzVMvhAY9K9XbOpth5f87y01iNhaTCNQ15Py3AD2Ye?=
 =?us-ascii?Q?nSW4hMd6cuUjhHFmU3lCz601JOBtPfFL+YzpaKFZnMwVmT7BJ/okBG9pm8Uc?=
 =?us-ascii?Q?AlBYPQUWLgzeoivmLZ+avL3sg9HT+JQqde5nMcvG16TLFHcaQHOlWB1bNVV5?=
 =?us-ascii?Q?YFF3+vk6DfOC8whGzW2h3eQztLPAWkA+wi0a9LWG3bjEkD4MR2xhhyUvDSjH?=
 =?us-ascii?Q?JA99a9bPZsHJrAhFQ2YN4FmPOFiLmfFBPiC/ey38YZTwqgeXWs2MONtBNKbV?=
 =?us-ascii?Q?Sr6MzjreZFeOhhRzRLr3XZBEI6gPOFQpPZi2DTCoYaTLa3Rl/tuxlXvb/ltp?=
 =?us-ascii?Q?JeuKzubB8VFDQQJyDeqr9JDt4AUHPT8aBzRD3CTLCbUc6smKeRvdimMRMMoX?=
 =?us-ascii?Q?3GeT7BSjE92FkGKuDgiQt8wKK09Z4KYJRGttWNmAeT5oTQJPMxmACm5wHJde?=
 =?us-ascii?Q?TeSqRwV4GPyPW6eDpHmPAh1uSX/BPFGFozQCYwCy/ELRxJGmVb34bGaXoT6p?=
 =?us-ascii?Q?U5eFXnz84i5GvDbGWR6CHRk2XKO1FcrvWxkN1ZEFQt5JNgdcKrhjgZ9ybvg6?=
 =?us-ascii?Q?C6qOAAXRsOsWwMexmJnxbGMRitGrU/JaFRRKabLUbsGFUpwfe6T4t8qe0MBl?=
 =?us-ascii?Q?93HD6VK8qU5opGfN8FzIrWejGrJig+mCNMvLBsiEHTuw9DYQd7mRUDxxrbgw?=
 =?us-ascii?Q?zssL92lw+6fGP7wSZcyCwY7oiDNYY7dylKCgHEudaxshmmgnjr3ZbrSbxzR8?=
 =?us-ascii?Q?nz393gGif5qYN0W1WUxqQX0dYSwD75f1juyjgEjzZEnTNGOnigZV+02HEd1r?=
 =?us-ascii?Q?5DqU2ftrjVjeAJl4sWx4ibXILKuDqXYUT1ggO+/UdASlXwFVyyGokNgxNhEK?=
 =?us-ascii?Q?uj5UFbw90A68b6MD92aSPchq7oMukk+yVeNQMCM4B02j8arCJ1cD/YZCNMWV?=
 =?us-ascii?Q?V3PTf6LAeWB1/9EMAe/vKawen8POsaSlxZOYGkekdWhrEORSuRx27/4U5lcF?=
 =?us-ascii?Q?OUAHhXbIyxgLlWwEL9tSJJUtH7SKRad0R80dFvlviSJr3TU1LmEK338cumpV?=
 =?us-ascii?Q?V7tN1zMAPHKs48/R10ldaMSn?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b0abdba8-12ba-4946-8335-08d90028de36
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2021 16:09:37.5416 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DWJtX7wnr7ePltK+s4tDh4FfyF5HSJUnr3FCmNlUQjIy72PR2VsiDfT9gBzWLhkw3Z6q7xxgSwZM30AR11AVsy43NmdSb00lj/tTeKAasRk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB4557
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Support Opensource <Support.Opensource@diasemi.com>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

On 15 April 2021 17:04, Mark Brown wrote:

> On Thu, Apr 15, 2021 at 04:00:48PM +0000, Adam Thomson wrote:
> > On 26 March 2021 22:16, Pierre-Louis Bossart wrote:
>=20
> > Apologies for the delay in getting to this. The change looks fine to me=
,
> > although this part was EOL some time back, and I find it hard to believ=
e anyone
> > out there has a board with this on. Wondering if it would make sense to
> remove
> > the driver permanently?
>=20
> Unless it's actually getting in the way it's generally easier to just
> leave the driver than try to figure out if anyone is updating a system
> that uses it.

Fair enough. Just don't want to waste people's time with unnecessary update=
s :)
