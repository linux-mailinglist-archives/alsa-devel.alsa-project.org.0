Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C087950E76F
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 19:41:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38B6A1685;
	Mon, 25 Apr 2022 19:40:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38B6A1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650908483;
	bh=nNJKVerjIRHxy9m93gn5JDOd2XyLrxXG8sFkO3/KbUQ=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dfzFY3P8e3KcgdkuUn3Hq7Jqs8x2BffGvA16FeICMyBLpnq3hU08rG6JCSIv05Mf8
	 fIsdRprr66pUdtlxJoIxr+D6eLN8ksSDGOgvkorFSuFER9Um+Tb9mkQvyknhezV9an
	 JbmCxZpdVim9TpiDk9GR5S78qtI6O+IKVaSbHWGs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2D05F800CB;
	Mon, 25 Apr 2022 19:40:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD381F8016A; Mon, 25 Apr 2022 19:40:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com
 [148.163.139.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E37E8F800CB
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 19:40:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E37E8F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com
 header.i=@analog.onmicrosoft.com header.b="ehzTnABa"
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
 by mx0b-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23PE7J43011377;
 Mon, 25 Apr 2022 13:40:13 -0400
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
 by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3fmb7bkwr6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Apr 2022 13:40:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BPXnsMf3LlBZRHEj5eV7Wtx1nrNVKBvlRm62h3uOZp3B99adqqjY78/rvXi+khHHB/CFujNsBLUqeHDaZqi4sYIKXx1gmtx7ZxyI95N4gj3moY5DAEM+L53LjozXwP8Ab7oN3FWZ/Lfde5HKAQ2GXpUrsCGqM2e5O7B6GdGfvvtnbXSXppVoz5DIFx1UXMbRYg2fmOsyLctYR/9r9uMCzJs5nGJPhCKFUV4Q/bJe8h/2E1U5o6ySjFK7nEjlapRGBCR4HkJ5RYK9u8pJ5Et4Hw1+B/T6QJsLrhf5IAKgMqdxtvUcaIp2PjO6wtcKm8EyOQq6I/PDPCBMu6ZxmciiNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nNJKVerjIRHxy9m93gn5JDOd2XyLrxXG8sFkO3/KbUQ=;
 b=G0qDnWcAfa80R2Hb3VyRHLQRMFjnMYmDI6shJ5Jgi/HmbriZ1ixToLZzc8FWaTw5t1D1P0xlAnvZZ29MUAiG94M1kTwVtgLWLy2j+rzkcH2i/Lz2Ze6CaID/ea3VnVF/qjFUyQzqa7wcfn5mC4Hwx4HfIYu64U8TgpuWc6Yt1hDBM69YDc4any7qiWVRz+PBmtU5dT+kXBERGINrhCz3HximYxlMb15UhrE124bUS7a1ng90zRLlGF3+SFkI5jRLh2aeMvOoLw2gCIvi45d2g3KTEqRal9dj9oxn68UvPNsnqqZKHp46TC0CuWB9OANkUPmXmAbSVQhb+xnGJWvNfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nNJKVerjIRHxy9m93gn5JDOd2XyLrxXG8sFkO3/KbUQ=;
 b=ehzTnABaJmX4q+wASeAxX5ktYDgcn4b9OBlqPNo5ZkBSVyD0XwhBDCnFNYULcOcnxaoRVdjU9wWomNbCFyNaevXEWKFJsLetF4RrpKqd3Icgxxf4GNzKKqOpGDN8UQJg9iyEx/M7Luby6TSxECRcWbpegUUR8XpZ5asbp5Ljjos=
Received: from SJ0PR03MB6681.namprd03.prod.outlook.com (2603:10b6:a03:400::6)
 by BL0PR03MB4049.namprd03.prod.outlook.com (2603:10b6:208:67::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Mon, 25 Apr
 2022 17:40:11 +0000
Received: from SJ0PR03MB6681.namprd03.prod.outlook.com
 ([fe80::2cd9:31ee:53dd:3187]) by SJ0PR03MB6681.namprd03.prod.outlook.com
 ([fe80::2cd9:31ee:53dd:3187%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 17:40:11 +0000
From: "Lee, RyanS" <RyanS.Lee@analog.com>
To: Mark Brown <broonie@kernel.org>, Ryan Lee <ryan.lee.analog@gmail.com>
Subject: RE: [PATCH V3 2/2] ASoC: max98396: add amplifier driver
Thread-Topic: [PATCH V3 2/2] ASoC: max98396: add amplifier driver
Thread-Index: AQHYVrggdmP+Y6fO7UqT2wRjP+0SsK0AkywAgABVz8A=
Date: Mon, 25 Apr 2022 17:40:11 +0000
Message-ID: <SJ0PR03MB66810FF573B73924FFE58BA98AF89@SJ0PR03MB6681.namprd03.prod.outlook.com>
References: <20220423021558.1773598-1-ryan.lee.analog@gmail.com>
 <YmaUfkvy7YKCSLST@sirena.org.uk>
In-Reply-To: <YmaUfkvy7YKCSLST@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2d217db3-3b68-49e8-af1d-08da26e2a5f4
x-ms-traffictypediagnostic: BL0PR03MB4049:EE_
x-microsoft-antispam-prvs: <BL0PR03MB40493A0E3E34BDA902D01F358AF89@BL0PR03MB4049.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LNdNEwKXi8BluMzASAZB5oxQWCRVPjWSVgcpsLfQxlkttySIWOcupp8EuYEU2Z2mayTWBymXugKgSqVAkH91RHZYSo7qz+AuxBThK2akG2t1T3s2Tfm1j94zxxRmYbuEw23D+XRNGz7vnwK/YdwfYJkppVRFJ7Utsnr1nFvUsOlprpZsN11SMXkR3dF3W2UY2Dv/0CNPZLqbknqWLpPPq9nAQ1zZOkcXugRmqwdB4aWe83fSKilWpoQXfpXrD/VnrOkrG6QPkCT8Kbp/vG5REFgdlBLRaPU4ydTzW+FDxA2e91gBxdH6psMJYvtEoI+5TJ8U+Nvm4y7O254kvz3MBJFWLKgns6c1teWpZ935vUKVxhN9nz4Zw+UGKZvMIgHUEQmdZTcQu0GdUZ2s0yvSR7rAMEIgyPKzXuwdhM/uDjHjpgl6Pg9Pj7ejdWxhjHW4ZSAM1hQAm1BPPmhJKWBqmu0MVoTBFV3D9SrHt0JIKKT4lmW+Hs1y+yRIx5Da90wnEozk5Y5YAEDiVNZL24QZ6BER8oL+pl2tyK46btg4DZ2ih4E52mPk93lKTcKTlgruDRo1/VRR770ZSynXXmklvK5jV94b0bOp3kFE3z4nsYa4nUZMA62q8Aea1wSuXPFDP5IbWuU4KlZkrZNI3Y9LicTQcNv/BEe1hvnajzVAjA43A8IZEwBWO47oj2fBcbUK1l8TvkfmXUuLS2SXWbDI+Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR03MB6681.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(316002)(86362001)(53546011)(66946007)(66556008)(76116006)(38070700005)(38100700002)(110136005)(66446008)(66476007)(64756008)(54906003)(2906002)(52536014)(8936002)(4326008)(5660300002)(7416002)(8676002)(508600001)(71200400001)(26005)(9686003)(122000001)(6506007)(7696005)(55016003)(33656002)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0V+LPnL64jhaS6L7pXXijQlu0PFLQKW6zlFtnXcVJ2LETLT1o4VQ6985tbat?=
 =?us-ascii?Q?Ztx8bHkke48okxc+ZCsdfFj+UhboCiHhkrEI901/WLFMvF+R+6ClUd4LFQN8?=
 =?us-ascii?Q?pOx507CjUYd1C7G+iim8dYMLbao9aG2/+Put9T7WUMNuWpO0BJ0bWzQn9Gx3?=
 =?us-ascii?Q?zn88VFdAWEwWhWBWkL1eCBqgprsOJemXe7RG0anudcKwmLy/SEsKZ2I3COJI?=
 =?us-ascii?Q?PpTDiu6+zWu5YHSjBtRxy/qh/CRpg+endbbAN4MVeza76Vrpb6Bi09yihZuM?=
 =?us-ascii?Q?0QwTuj+qL8FquzPjdV8Hq6zIi5cBLftvS1uBL+e2wcGPME+dj9p0om5jlfD2?=
 =?us-ascii?Q?A14S/J5OSMhEujSNjWZ05IsxIVpH0lqGQaRxPJ+IoJBgRgQHWcNBkrvZB9T1?=
 =?us-ascii?Q?TaVOLR8CizMFcRJa7XgaZv39nm4xcbINscV4XyQoIADJWACzoTb9kIjlggJ2?=
 =?us-ascii?Q?VsZPqInh1AwoY56sdAVK/DBy4LKcLetmvUCAdE4Tx3xejL05lQsV1qUMSKzd?=
 =?us-ascii?Q?02b5FTmlJ88yEPCc7MLvZCV+df+0Dh1rkiNuF37dAnmjY4o7Ie3TZHjzhwxL?=
 =?us-ascii?Q?fvikziyLVdVgP72Mv1HOQiWoq5PcSiCqTb5VbYU1Lixm4j0qcldGnvp7g6bj?=
 =?us-ascii?Q?EGXvf2HjrJdz2gpmOdUmvqNRuLTXb2iH0jN7y/qmvA8FPVeUSnf9j57GUKsY?=
 =?us-ascii?Q?vIlebK9MiM1+6sGB8Js8vOZ+p+TcHqOk4YZm57oks2bbqtFL8oGCsjUSpRtM?=
 =?us-ascii?Q?Ex38/EUz9z9aKJ0dVIQzJITKsCp5GBl+0DKjkZeAHWApbPR50GP7ooQw3rwy?=
 =?us-ascii?Q?X9bgp0bQqXFw6jXHuXv0kx1AbDd4n6cp1RBCOxNcJ9pQCAFHADXQZI6Mdv5A?=
 =?us-ascii?Q?dUCUtNQ8+fiy9jTYytsJgYFSJUcpHgGt/roNdExMy8i52GTO3SwmreYD1sRr?=
 =?us-ascii?Q?jsvOUf1d6WpOspGjbHSZA0ze90dGE4e1qY+UfQJfJ0l60nZkrUjMVOQhmwEp?=
 =?us-ascii?Q?lrl9avIjfUFMnHhRKmUlToxiDtR3UJJdEiaNeAivUxpi5ALLl/iisoUynHhB?=
 =?us-ascii?Q?cTOqf+677UfvugsVLW3sw7IC1qCmuuJyJ+pY7Lzxfgmd8zX2n4M8yiRFSWQm?=
 =?us-ascii?Q?ejIQT6GkYCbZ5tuhd3byx6SHw5UB3Lf6JPnOxRPiV4LwIcZSySMQUwrcF6d9?=
 =?us-ascii?Q?wX0tY10kLCqw81DyLze+vunsUbmI82ZceAhwdbiCr7oETitxf8j9T/XgTo3g?=
 =?us-ascii?Q?kwMoGIP8Z1js1e91RPq498gzSqtcMt9vh75+NUk0pGWqJ1irCWZl2sCHgGuT?=
 =?us-ascii?Q?Sht429bRqkm7Hh8P1/g7W9/6tolG0hO58HmsnqcksCmS8r+4OKxmursEjjPr?=
 =?us-ascii?Q?wU60BhyKPxMUQOPVXKWm+ubErjAc+oaSHgTOZcnG3dgoVmCWTEZaZwX7NXRy?=
 =?us-ascii?Q?xMvVVCnniD3W3J36AM4JWu5x1qvLZpHWNqqMvqyqE5pnHRjg7cE1PHpuBBuw?=
 =?us-ascii?Q?F+E0HZ+TP224Y3vQwTdi3MMFKfA7VQwLcjoZ7rbSl74xJ+tvOBrZH8RAdi+e?=
 =?us-ascii?Q?pD9mm2qr0K3GkVTQ8Fka2GcN+cOOS2Sj42jbq664D7HIkDJedglGdbcEVUcJ?=
 =?us-ascii?Q?Yn66RdLFQWBhnjeg0/y8Zu/wo82c2j0DnWWzUYMBQR16ztyPyVnss6+bcj8x?=
 =?us-ascii?Q?3MyeKgfUJlMVtfsYkp8ekZUS3AsmmxrKxQR8n5q82Nc3qySZkE92pHwZmh/X?=
 =?us-ascii?Q?Ga0gLm8icw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6681.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d217db3-3b68-49e8-af1d-08da26e2a5f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2022 17:40:11.4930 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iWwR6dEtxLcy06ix2EdG+k53i7P/+lRdlMTRxH0NNso8arjz+AnroV1mwEPqQoRVYYP2qbaD95kvuk5cM4jwxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR03MB4049
X-Proofpoint-GUID: UjQbS1edibCQKJryJqAMD_2TMEaoHtPi
X-Proofpoint-ORIG-GUID: UjQbS1edibCQKJryJqAMD_2TMEaoHtPi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-25_10,2022-04-25_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 malwarescore=0 mlxscore=0 impostorscore=0 bulkscore=0 clxscore=1011
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0
 mlxlogscore=264 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204250079
Cc: "drhodes@opensource.cirrus.com" <drhodes@opensource.cirrus.com>,
 "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "stephan@gerhold.net" <stephan@gerhold.net>,
 "tanureal@opensource.cirrus.com" <tanureal@opensource.cirrus.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "cy_huang@richtek.com" <cy_huang@richtek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>,
 "pbrobinson@gmail.com" <pbrobinson@gmail.com>,
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>,
 kernel test robot <lkp@intel.com>
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
> From: Mark Brown <broonie@kernel.org>
> Sent: Monday, April 25, 2022 5:31 AM
> To: Ryan Lee <ryan.lee.analog@gmail.com>
> Cc: lgirdwood@gmail.com; robh+dt@kernel.org; krzk+dt@kernel.org;
> perex@perex.cz; tiwai@suse.com; srinivas.kandagatla@linaro.org;
> ckeepax@opensource.cirrus.com; tanureal@opensource.cirrus.com;
> cy_huang@richtek.com; pierre-louis.bossart@linux.intel.com;
> drhodes@opensource.cirrus.com; pbrobinson@gmail.com;
> hdegoede@redhat.com; lukas.bulwahn@gmail.com;
> stephan@gerhold.net; arnd@arndb.de; alsa-devel@alsa-project.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; Lee,
> RyanS <RyanS.Lee@analog.com>; kernel test robot <lkp@intel.com>
> Subject: Re: [PATCH V3 2/2] ASoC: max98396: add amplifier driver
>=20
> [External]
>=20
> On Fri, Apr 22, 2022 at 07:15:58PM -0700, Ryan Lee wrote:
> > This series of patches adds support for Analog Devices MAX98396
> mono
> > amplifier with IV sense. The device provides a PCM interface for
> audio
> > data and a standard I2C interface for control data communication.
> This
> > driver also supports MAX98397 which is a variant of MAX98396 with
> wide
> > input supply range.
>=20
> I'm missing patch 1 with the DT bindings?
My apology. The patch 1 about the DT bindings was not sent. Sending the pat=
ch 1. Thank you.
