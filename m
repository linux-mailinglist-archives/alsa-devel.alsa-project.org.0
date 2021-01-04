Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACEC2E9E34
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jan 2021 20:33:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F358167D;
	Mon,  4 Jan 2021 20:32:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F358167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609788789;
	bh=Lrr4TeCmsFovTD39NjZ7prOkxBdZYdLLdbFJ017gKlA=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mrt9ZyLH+5zhpWmuLGEO90icetW/XICB5X5eOHwvJGzbMEvor9hkJ2r40l5pVMF0d
	 op8+u0HBuipX8g4y8vFX6mo+0zAn+hQ91tdEMFZkQnxHLR88Ocx7v59ijCJ1IdhYFp
	 ap5ygWa1dr/c4HgwvqNn2+BJmDg+N+aZG1NXLIX8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3A4DF80167;
	Mon,  4 Jan 2021 20:31:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45DDFF80166; Mon,  4 Jan 2021 20:31:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-00154904.pphosted.com (mx0b-00154904.pphosted.com
 [148.163.137.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38B92F80158
 for <alsa-devel@alsa-project.org>; Mon,  4 Jan 2021 20:31:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38B92F80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com
 header.b="RxdxUrdm"; 
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=Dell.onmicrosoft.com header.i=@Dell.onmicrosoft.com
 header.b="qEJM2TpN"
Received: from pps.filterd (m0170396.ppops.net [127.0.0.1])
 by mx0b-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 104JSLhl017131; Mon, 4 Jan 2021 14:31:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=pfd8/OBRjw4PZlEhzN0C+iwSn2NknCR79mcf2Kw8QTE=;
 b=RxdxUrdmUyLQ7UnWNypUPJtutkjyhPsq8s8oG+tY04OKogMRFx0N+EI8cJlYozroh4qG
 gaW0k1RLsUAPlRei+LnPo/e89VN09rR9P+30VhTe+8lEPThrbgFixKxh/i+VAgoXvLs5
 21d/q78KeC7gUiXBTCOX01bU/F7uNXO64f4w1RNj9S0QX7wVjtQGybGMjcs6xOSlNsqn
 cfbVFJpNXdLFMOZJgB+GwG3Q7TMTCSIrRXXKsKeaDIm6IVPUgfbBKrMAwoiYALUWi9Gg
 E9b43z2/PFjDysezsH7+X8KFPBnGktImlK1Q3E43VIMJYr4ee2CwhF0sf3EAX7XiMl38 7A== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com
 [67.231.149.39])
 by mx0b-00154904.pphosted.com with ESMTP id 35tnj3x3ju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jan 2021 14:31:21 -0500
Received: from pps.filterd (m0142693.ppops.net [127.0.0.1])
 by mx0a-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 104JV2xF075191; Mon, 4 Jan 2021 14:31:20 -0500
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
 by mx0a-00154901.pphosted.com with ESMTP id 35v8r60buk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Jan 2021 14:31:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HuEH83DJEE8tMW+0Uc0/M2zrSO/x47m84DtdJoP7dGFhBpRQ3EsZkjXwOxr6hWQonZ1QsvtmwT5ixqfW+10ojuYCl46WPLIFX881hWExMetA3eL8h7aZHQ3qpktI6KBJQ/YOv2Sl3RfWKyMI65qSbvp+qozJS0dwtbT4d3BAVT+ogIiObAFoChSGoa4a/6uOhXo/BYkU9wr+YT2e7hqy4sZ8+58/7Xk+Itf673W+4wmtPrtqCLRv4YM/9OuPjd1izMm5/kCSJ1mwxLPfVyE7SM3DQ2rA4VekqlXw2OdQSTUQkHn70onvbI0zmA6rhzVuYGWo7aInjablS9gfDtNhOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pfd8/OBRjw4PZlEhzN0C+iwSn2NknCR79mcf2Kw8QTE=;
 b=l/aNVrC3YKC4brmcPp3u0x9o0M41wpKIWmsAO1d34Gg7ow1FUVsrM/XV9vFh193vwh/NeFH+h9vJqDZx2qORS2WLgdtbpIf7Zx/RbiLxBeYpCE0gxavnp669rHT1h3nC8nu3ArKPR6CeMoyEVCebKLFgzFZbcAT3knlpZ0n0XUt+1epnqojz9eM94Q2UOXweS1PAXwAw9Ge6VcLZCep8Wwv8HHVeNIw0KvnT3BZJghTZUFqMbIUGCVC5fyx2bxNyD+E7PzzT+8BO4F9XtXKZ/+5p6KM8ltNkqDZJOZNdOLMi5XfLEDo4c28yVmOgSQOG31ouF/zIiPsJ9U5ts7StLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Dell.onmicrosoft.com; 
 s=selector1-Dell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pfd8/OBRjw4PZlEhzN0C+iwSn2NknCR79mcf2Kw8QTE=;
 b=qEJM2TpNtXVQp1S6Ki/cd48UhhLdQMhBbohDSSZOBK2OBzZdqpQLN4YhEHRCGUhbTGP0zozASlVgciqQrsxj1rddG28+lRfX0dp+ANQtdHW+2MRpUK0yrJ68OS/QCHvhkZ59kUySXYAUmlAVekGilSYFX9mw7bPC94ByqQ2tG7U=
Received: from SA1PR19MB4926.namprd19.prod.outlook.com (2603:10b6:806:1a6::18)
 by SA1PR19MB5183.namprd19.prod.outlook.com (2603:10b6:806:1a2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.22; Mon, 4 Jan
 2021 19:31:19 +0000
Received: from SA1PR19MB4926.namprd19.prod.outlook.com
 ([fe80::e14a:eb33:4847:6cba]) by SA1PR19MB4926.namprd19.prod.outlook.com
 ([fe80::e14a:eb33:4847:6cba%3]) with mapi id 15.20.3721.024; Mon, 4 Jan 2021
 19:31:19 +0000
From: "Limonciello, Mario" <Mario.Limonciello@dell.com>
To: "Yuan, Perry" <Perry.Yuan@dell.com>, Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH v2 2/2] ASoC: rt715:add Mic Mute LED control support
Thread-Topic: [PATCH v2 2/2] ASoC: rt715:add Mic Mute LED control support
Thread-Index: AQHW3R7JM+4Y3CMF4UaqpPGWNyPaH6oOBVuAgAkzNoCAAK0ucA==
Date: Mon, 4 Jan 2021 19:31:19 +0000
Message-ID: <SA1PR19MB4926A0A6E5ACE68DAC8346EDFAD20@SA1PR19MB4926.namprd19.prod.outlook.com>
References: <20201228133831.17464-1-Perry_Yuan@Dell.com>
 <20201229124033.GC4786@sirena.org.uk>
 <SJ0PR19MB4528A021F3C0528ABE5F324984D20@SJ0PR19MB4528.namprd19.prod.outlook.com>
In-Reply-To: <SJ0PR19MB4528A021F3C0528ABE5F324984D20@SJ0PR19MB4528.namprd19.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Mario_Limonciello@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2021-01-04T19:31:19.7293257Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=a5ead022-90a4-4dd1-92d8-5ed693366d6e;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: Dell.com; dkim=none (message not signed)
 header.d=none;Dell.com; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [76.251.167.31]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1f9ca77d-8bd4-47dd-bc1d-08d8b0e74f98
x-ms-traffictypediagnostic: SA1PR19MB5183:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA1PR19MB51837E26756881914E9695BBFAD20@SA1PR19MB5183.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xG+c13AZgmUQ8OtvULsCFd3yN8jH72Blj7LKC44dtcjw74+1IqUvQhHbOQycP9IltOFEs/SrWSCEUqZg/v7m8OyH0y4jQXX9iC51cyL8BRXeepLueBuWMRfNnwxgkCR9BC5FJgm12PhTxNOSHCYD16V0T5WqKMwtoyBiNkcCKNTnLrzshML8OgSraWIZL0BU/lLdhm0VgaBKNXJED8fBOlNRGdSUKaEciN+agpAKy6xGWRUARAHJ+a57a1gqLWINppQWdkHovYcBSLxPhvKEzSkpGYGKww4TzDOLOMxMDtrukcnwFIuzMK+1YPJfLTzkmP4PFl855QBJX2uIZdYEPoaSKzTw3hW9aCXDBGu9OAyTAfJ8lsf7ObxUzQhQl0kl/C2N705oV/UquUjtv4zJTQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR19MB4926.namprd19.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(346002)(396003)(136003)(376002)(316002)(8936002)(26005)(110136005)(54906003)(66946007)(786003)(4326008)(9686003)(55016002)(186003)(86362001)(7696005)(5660300002)(478600001)(83380400001)(6506007)(33656002)(66476007)(53546011)(76116006)(66446008)(66556008)(64756008)(2906002)(8676002)(71200400001)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?aOFFPnaJKA2fVop3t5j+Dy+0MAf5JHBjSbKN6WPPT7PP5toZeDAPo3xBgMxm?=
 =?us-ascii?Q?98yw2miGg+NdbBznAIz7Fe+xqnjIKvGjIPSeJyBEJWB5oH0CA+m7jAlp+zpI?=
 =?us-ascii?Q?D8YRRuY1lDkLmoDvtrdyLxMHVilzsLRw9ur+6meNvRay+mm/GQF/voc4wzMZ?=
 =?us-ascii?Q?0eI+TQG1x9JTbn/dpjr5pQ7aHbOsKdWkReNqPPNWWLSnWx5OiQzWIXNDM8ke?=
 =?us-ascii?Q?O8NGaPkIhisqDaxLdTR+85Yap4dF/t2UANhqQIlqZKHHNRJibey4e2wpZMjQ?=
 =?us-ascii?Q?WkgaiomiVyKL6K5BGJxgmIp088RlOdJ2eI2WZJcYsvbL1BALRHEADBduL7Ax?=
 =?us-ascii?Q?DGhJFn+W/Wn6r/u4sttANOOnEAVmQcQYnbwNGeSfY32QLKZFKxzpxnIkUObb?=
 =?us-ascii?Q?vjaA7SejReGZpv/rMjq5RseUrNSNFE34sEBT/KtVL8UF8/cdo+gwQmkq/uDz?=
 =?us-ascii?Q?5F4oqzpKIRsVyGfVLx7VPVl8ub1YGTiIg1NcUgoYUJXYdd0/rEpfaJ1m9BxY?=
 =?us-ascii?Q?VWh739+RFhIF7Siapd7uCC+6yh7V2cC5zf7KIH2qiLafbcgKQK+akmCH4pZX?=
 =?us-ascii?Q?NlMD7WpInOMv0tt4tKFcA1AXYFy6d/RFvbxZgqHdqxt4NgWeKZP2iR49w5pJ?=
 =?us-ascii?Q?J+VcRpuzwJrxXeTGG9ODh0fKIUYeDeE9Any1M4j/mz2Yq69E/CAdMvIUHKjk?=
 =?us-ascii?Q?9mBOgtL1srllofBnuuDjWAIZC17qgsy4hfqMBmtfi94Fm7lbXR8hHm3RWfp/?=
 =?us-ascii?Q?ZsW0IRVZ3RnoHGpPi9cybhEnFh64OH3/UHnDPTr8jeK5+9OlBM/MwDIPd06Q?=
 =?us-ascii?Q?5AsMCVed76/BPChJrh/a/K2o+HgZLvnTzROkD3njeJYNvQY/ypfHdi9NYFjT?=
 =?us-ascii?Q?hG94nx+f9G17hbL7ju7SuEXYtliUSkvrDB48t5j6znWP4XKlhcb1fJ8qrDZw?=
 =?us-ascii?Q?D4eFj2T9lDyMX3tcbmnP+760fNVFotPx6yEjM2QyjbI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR19MB4926.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f9ca77d-8bd4-47dd-bc1d-08d8b0e74f98
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2021 19:31:19.1004 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EkwGkTFNnGk/aUljGYT/I1UIlf0Nm2eR0ehbQMKAV1x9csi+4UR+KliBXDZmjzNjOyan0ClXQKsnlj5ioTRehbYRMUV9EwgGMdztztv4PNo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB5183
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-04_12:2021-01-04,
 2021-01-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 malwarescore=0 phishscore=0 mlxlogscore=812 bulkscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 mlxscore=0 clxscore=1011
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101040123
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 adultscore=0
 phishscore=0 malwarescore=0 mlxlogscore=924 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101040123
Cc: "oder_chiou@realtek.com" <oder_chiou@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>
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
> From: Yuan, Perry <Perry_Yuan@Dell.com>
> Sent: Monday, January 4, 2021 3:10
> To: Mark Brown
> Cc: oder_chiou@realtek.com; perex@perex.cz; tiwai@suse.com;
> lgirdwood@gmail.com; alsa-devel@alsa-project.org; linux-
> kernel@vger.kernel.org; Limonciello, Mario
> Subject: RE: [PATCH v2 2/2] ASoC: rt715:add Mic Mute LED control support
>=20
> > -----Original Message-----
> > From: Mark Brown <broonie@kernel.org>
> > Sent: Tuesday, December 29, 2020 8:41 PM
> > To: Yuan, Perry
> > Cc: oder_chiou@realtek.com; perex@perex.cz; tiwai@suse.com;
> > lgirdwood@gmail.com; alsa-devel@alsa-project.org; linux-
> > kernel@vger.kernel.org; Limonciello, Mario
> > Subject: Re: [PATCH v2 2/2] ASoC: rt715:add Mic Mute LED control suppor=
t
> >
> > On Mon, Dec 28, 2020 at 09:38:31PM +0800, Perry Yuan wrote:
> > > From: Perry Yuan <perry_yuan@dell.com>
> > >
> > > Some new Dell system is going to support audio internal micphone
> > > privacy setting from hardware level with micmute led state changing
> >
> > I'm missing patch 1 of this series - what's the story with dependencies=
 and
> so
> > on?
>=20
> HI Mark:
> Sorry to make this confused.
> The two patches are not in the same module, I use different cc list for e=
ach
> patch.
> I will send another v3 looping all the cc list and some new improvement.
>=20

Since the patches span subsystems and have a dependency, once reviewers are=
 happy I
think we'll have to get an agreement of which subsystem to bring them throu=
gh.  So
yes, please keep all CC list the same for both patches for now when you sub=
mit v3.
