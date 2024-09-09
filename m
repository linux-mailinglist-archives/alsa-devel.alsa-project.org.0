Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B1D977E41
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2024 13:12:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65CDB950;
	Fri, 13 Sep 2024 13:12:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65CDB950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726225957;
	bh=/vOzCtsJYLp+qO9hVgQcUhedMdSevwxsf+PaYzFBg/Q=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XAHpmHQZW/CvojFKqIkruGFOXUh1BUDHLPgJvhIyUau4UjZ8wusypnGiuNWfWmseA
	 lE2sb1nMIEDxughlNbC1awR1Rw9Dlx3JjgqKrokwYlP6Lyqm/6Jbt8Cg9GYzDUBYq0
	 IDKu5rpJQ/y0UFGDKI7nMP8v9ZF9YlnvMRWWhB3M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75856F80618; Fri, 13 Sep 2024 13:11:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C1892F805DF;
	Fri, 13 Sep 2024 13:11:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD2ADF801F5; Mon,  9 Sep 2024 12:05:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20629.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9CA4DF8010B
	for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2024 12:05:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CA4DF8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=QGxmB5eT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aiq4jG4/hjMY5yM40GVlUzXj74H33Rkdhbs+2iARsWlt5GiCHDpkb7k6c8celRCGN5MGHvP+BVqbuAD2Hv4V05rQFErsmfQjLFxpMgMoC0gRg3JfMaBGmpt6AnJ039ENYEkoXClWzxFfQ4zUr1K2RdbdnuDEResy3nds1l4L6CcmataUNWjzAXBVs+pTR/PxqIM+dUGLB3qn0/xbpE7AJJmwodQqvnSOBzgtmtfgzuNB0fWYI5rDzX+cUsWweZWQLq4Tbh5PcDpze8lRXu369UUsM6EaMPj8aJJ7YYaKBGQWfM/DWgYrypNf9nTeU3SWZyDx1nitXdSA9f0oArva8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V05iu1dE/nKRmXL2JKaObwpQBjwdGVhscQaEr4Mq6FA=;
 b=tP0zqy+2A5gSJO9DmQd5z/GR6PZc3PkNJN/G6J2I67AQ3W7R8yR7zwxb+Oi3kZSABeh1IRKabTEZi1L0ysY/gxiWmJphM3r4SCxaYy8nv98PlkY6ObiMzQqol6p4Jg5A5JF8ksFzbMYIiOER3ZbNtnUZTJ2WnhGWMnZOPtQPTpbD6UJLa43+aX2bgW4CPGekTYD2db3G+vUc9eqDCvbk5AKPOgS8AS68b/+WDDGnRUh88QIelzeJBCUiNyjtdyxAe7rAFmnCy1blDnrhz7+7Ce80lnqD/3iKd9N7eiG/1np6TtJS0tA5+IPsA1gDp4n+u3nQeol8MhZLi01bT2/YVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V05iu1dE/nKRmXL2JKaObwpQBjwdGVhscQaEr4Mq6FA=;
 b=QGxmB5eTCalJoqOd2trCFV1g1QE7YBbZrZ4V6KWrEhwBYPuPlb656tbHYzCmX3abzzSHmiUx44mvFZv4F5LQBv773kS23xtxFepZzxjjJV1zM4GIE+f3Yn1J/pp28Iu3CjQeX+TQ6SjapyAt2nWnjmY9dZPWGU8hZ+XU0NHQeeA=
Received: from IA0PR12MB7699.namprd12.prod.outlook.com (2603:10b6:208:431::7)
 by IA0PR12MB8304.namprd12.prod.outlook.com (2603:10b6:208:3dc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Mon, 9 Sep
 2024 10:05:46 +0000
Received: from IA0PR12MB7699.namprd12.prod.outlook.com
 ([fe80::7ed1:80d:75c:f1aa]) by IA0PR12MB7699.namprd12.prod.outlook.com
 ([fe80::7ed1:80d:75c:f1aa%2]) with mapi id 15.20.7918.024; Mon, 9 Sep 2024
 10:05:45 +0000
From: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, "michael@walle.cc"
	<michael@walle.cc>, "broonie@kernel.org" <broonie@kernel.org>,
	"pratyush@kernel.org" <pratyush@kernel.org>, "richard@nod.at"
	<richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Rob Herring <robh@kernel.org>,
	"cornor+dt@kernel.org" <cornor+dt@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>
CC: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"claudiu.beznea@tuxon.dev" <claudiu.beznea@tuxon.dev>, "Simek, Michal"
	<michal.simek@amd.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "patches@opensource.cirrus.com"
	<patches@opensource.cirrus.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "git (AMD-Xilinx)" <git@amd.com>,
	"amitrkcian2002@gmail.com" <amitrkcian2002@gmail.com>, Conor Dooley
	<conor.dooley@microchip.com>, "beanhuo@micron.com" <beanhuo@micron.com>
Subject: RE: Add stacked and parallel memories support in spi-nor
Thread-Topic: Add stacked and parallel memories support in spi-nor
Thread-Index: Adry+FCFJ+jxyMZCQv67eHESQhM+FQPiIRIg
Date: Mon, 9 Sep 2024 10:05:45 +0000
Message-ID: 
 <IA0PR12MB769942AD967F38F64B461526DC992@IA0PR12MB7699.namprd12.prod.outlook.com>
References: 
 <IA0PR12MB7699B360C7CF59E0A3D095F9DC8D2@IA0PR12MB7699.namprd12.prod.outlook.com>
In-Reply-To: 
 <IA0PR12MB7699B360C7CF59E0A3D095F9DC8D2@IA0PR12MB7699.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB7699:EE_|IA0PR12MB8304:EE_
x-ms-office365-filtering-correlation-id: 3a2059dc-7158-4c16-c3e6-08dcd0b6f8f5
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018|921020;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?dgt2YLwxMzpY3omt+fxeiQ622kCPf9EU12823pYW9RCDT83z1ASG3RXi3jdj?=
 =?us-ascii?Q?+r1HLXxTzJ6fNUk7IH1RN+GNp2xMtmPmas7VX2viEZa86sSXiecrq4MCdXH5?=
 =?us-ascii?Q?wmrc0jgf979D/4spgkapfZEZs7JjMlTqyTHU7ol1N92KTFhON606uj/Wp7Is?=
 =?us-ascii?Q?rweTrrg3CVRe3u8YJoFbZe2q4+gluv29T0sk9HFJPdqSsgP3+Nr40Tb/XCvd?=
 =?us-ascii?Q?vn2rBOvXXXbKW9Q2cEZG643Rs0rEqmifeE2bwl2ljDk/2ofqKm1Q4YvpXka+?=
 =?us-ascii?Q?P5DFXTw2OVV+1qLo1VSxaBl2hVawi7VTkeWQIOFB6yISjS0naf13DSvG8f21?=
 =?us-ascii?Q?voCupsE0ZXLYmB6f6spMfzpKgi638sY/jWBLMIpV/iKUsUBaoLholmCsGrL/?=
 =?us-ascii?Q?NExnqhLXOQjMXVQ91z/JW0D73J8naUAwcE/kvrrrQFQQ9uOhbQsxnAt9mFkX?=
 =?us-ascii?Q?oGHqBA4Thm+8Dy23H+epm7jXkFcGaqcMB6QNcCJyvWJXdTZhbMeqQSmSGgAT?=
 =?us-ascii?Q?Aos7jJVuEpB4zC448uxS0MoxyBu1kvxys0wQl3jLEUGLLJkBbH9EzkVbTxB6?=
 =?us-ascii?Q?ctD2KbRPYpIwlG1lggBJjGvHHeBetwaW9iphPRr3rKi1GOvU8hvVDrHUbe98?=
 =?us-ascii?Q?RJ23cIbXf3sVtVAWzNGpMPXLry6IxtDAvGNDoWFCIh5RDnHsNB/LU2G6phUa?=
 =?us-ascii?Q?U7mYhxb42uvWx6/1chjYL4okAyc9DmuOx85eWIyrzrvwtRignsoholHk3TWS?=
 =?us-ascii?Q?z5lGKGb1SLPorTSEZojx/BnDWpRKpzawZikKHwY1wBYR/LIVwS4acBP7pgvq?=
 =?us-ascii?Q?LI9NAeclYd0Ws8sl29x/D9p6eBTRDzzwZtBcP6mfHYOtMJ2WiwypYbMf+cyi?=
 =?us-ascii?Q?pIvwDkiBb8KX3XHhvdwfZKclMCu0vHmQjOeaTziLfWsVJ0BM4bvcfwo80O2y?=
 =?us-ascii?Q?347UmqVXaj8yqXaREYnTo044oKqLZW+ogbUhcnlTUlt1ywrck97p7sHRvetC?=
 =?us-ascii?Q?YI5N51C4x8OewSNutaK4Nte5xOFozf5rbMbnjD7X8fg9/L7/Y+Yd6z59ub8c?=
 =?us-ascii?Q?nfH2F2tOBM/qfeYgOK3/T4+DPvMk31UMgOqMqRERwczqSTBhCNn32evZmtmd?=
 =?us-ascii?Q?6p39b5ZWdqynRnGB2Wyy8LIRbeHbg42vgdSYbhXMEd2dLkUeUuwPz9UJM5jU?=
 =?us-ascii?Q?sz0RaHAkzCl8IgK+ZwWcLgGAPShnpEGD6YA2OQ9A40wXowHRVCB9Bf44YhoX?=
 =?us-ascii?Q?PgxhmNnaNEjtX4gDl2cKGdCumNADoEwcoxELJIGC0FsPyxDSZ0/x1sc0N8gZ?=
 =?us-ascii?Q?lHQXKV9P69elfScC0eyNXX4bvAfFlaDMY2YNaYz7fTmPE1/i7OQbAdDl/d8X?=
 =?us-ascii?Q?lQMX8FI//MuCrBH7ktb7B2rFtsd4?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB7699.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?4fuj25p9j/Aqcan9+24CaKFhrMisOwvER/w/+jfJm901Vlv1xCz7zzT1vgSv?=
 =?us-ascii?Q?qXSOybWlD4M5DaZ3GaAmxDCcqoMv492dw5zcuzSwz5BUg6j23KoMq/BsAayC?=
 =?us-ascii?Q?mpmT+W+YiXMm+/m+4/lDmM3mVF6WLLtfw0Q3dqa8q3dWMX5+hD9PFSpUDT0K?=
 =?us-ascii?Q?53Fg+EluJ9jgdbroDuxz2nuFxkdXe47unH5kEYJfW0Zmtb1vohcKJFPWu2RG?=
 =?us-ascii?Q?y7Gk1fMPPKnEuvND6ScElOpr2tEQYUIAOKuatjAWJHbM+3rlKOc5fT5WdC8Z?=
 =?us-ascii?Q?i+JDMqP8WJgVPaSb8YIOPrKgffQYiMpxeydj1mTk+ckkaNOVKlPI5M7+1KS9?=
 =?us-ascii?Q?gm+HYNdZdI0/g5o4UWk5CoTtnNIBi9Lh4mQK0hSVCWxyho6VySeDUytbFUkQ?=
 =?us-ascii?Q?YFYIKIYxzOGwLzaNXeT/4ZN4xm6SiVDIaOrfDmTTf89Zes0a1DEPdWRMH+6i?=
 =?us-ascii?Q?HNWC2CPnoXcMRtuXuiOzjDXAiGvSncwBZQHh1z2hr9SHDtEHOhhsUEFNcchj?=
 =?us-ascii?Q?eNakOmTMSgaLL5FNAOiJ6Bm/kA5XWDwHME9xjsDRBIC7yqKsMWuqJ3SngAEi?=
 =?us-ascii?Q?Wik2OsV5CYbsdEUmnU01mwOptNP5ashuhlGybpDU7QoFyWXlVX+nJkPKetlL?=
 =?us-ascii?Q?YVU0uggFNaQKyDAA1c0xHKGDPKvC3bczMJ8DmF2Ae35BWEbpB6b/VgQ972Bq?=
 =?us-ascii?Q?syfVngluOOV/VewTRsf5Zp0qh5QMZVbmFiipHwV1mt56pdi+yEvDUIZr8f2I?=
 =?us-ascii?Q?+0ra/LvclW6O6gmUmBin93n+3odMKjuBl7laEHU2gA3qsdCkBd+pw+07GfFH?=
 =?us-ascii?Q?cyJwxRa6xGA1hG7nygaxVnCDMcGPSCt2F5yIbH4Xr1QYrokqe/lRWvb69wUL?=
 =?us-ascii?Q?KBJwMKg8qzRRYnv/58cPvRWFlx9WXM3El3Nl9DxlN0QcRVQxlTg178B/aXmf?=
 =?us-ascii?Q?zae9pMCxrBvZ79bUs9kcdvcTNvcQmp47GIL93K7tGXXXets6eOsZzW+OtHy9?=
 =?us-ascii?Q?fIa+NwuSBuXFO9Ke0q5eHJrpUh5y+tCYXJX369NyRgpNkKqSP312fJaRONVp?=
 =?us-ascii?Q?vJZSJUHGkZOSDrLPVzaQz673UDS1TToCSq6X+dsVt//ggOSlyYUE0TjfEfEb?=
 =?us-ascii?Q?BuJzgnPJzS7RzMQUDR5rZu/uvc/kBQUf6K/z/I9uuJdpAN8RvYeFFGg1YO5g?=
 =?us-ascii?Q?FbjEyXxZNBUhqP2hFe1WK0MR2xuGVhLv77ewn1TAOBr07CroFRk3r+fZOTyy?=
 =?us-ascii?Q?VyerG9+e9ZKS2o6zec1pKaix62bVLuYRQXP1CDDYgK/HdEqgBYNkCngLLC1y?=
 =?us-ascii?Q?oFQcN9lY8b4v3DcAGx57np4iA3Gq3eC+pGPjVan74qmNIjyDlPqj8qfVzYT+?=
 =?us-ascii?Q?rxCq1PKwDGikfkfDMzn5qDAoV99tsfbIMYn3yITrdBGXfbKnP/fvEueohQ6S?=
 =?us-ascii?Q?O2Z3HPuFT1jFdBFK5AbgJwjWsJJPRlYDqRVrb/AoOGsSAzCFv4snzilZu1ir?=
 =?us-ascii?Q?OTUNZG/Z9ZY1AEigvtH0wvYEPBJPuLraH2C1y8e9zbJ7unmvMCtfY9RazRyV?=
 =?us-ascii?Q?tpBePY0AD7DnOc+uaag=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB7699.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3a2059dc-7158-4c16-c3e6-08dcd0b6f8f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2024 10:05:45.9047
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 16auLA0F9zsGwq7qhC5zrCVFLJBwbRtn72hzcrzp7qCBEpgbWIsLYUx89Ss/CSYSqSvLnw/49yhnfwpjIKxQ9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8304
X-MailFrom: amit.kumar-mahapatra@amd.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: EZBR4VOKLBFJUOXK4WWM32AT2G7HTO6A
X-Message-ID-Hash: EZBR4VOKLBFJUOXK4WWM32AT2G7HTO6A
X-Mailman-Approved-At: Fri, 13 Sep 2024 11:11:33 +0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UGE4WNCULIIO7UKLWTV3LQP3TSHKNJY3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello Tudor, Michael,  Mark, Pratyush, Miquel & Rob,

Please share your feedback and suggestions on the following proposal so we can finalize the architecture and proceed with the implementation.

Regards,
Amit

From: Mahapatra, Amit Kumar
Sent: Tuesday, August 20, 2024 5:31 PM
To: Tudor Ambarus <tudor.ambarus@linaro.org>; michael@walle.cc; broonie@kernel.org; pratyush@kernel.org; richard@nod.at; vigneshr@ti.com; Miquel Raynal <miquel.raynal@bootlin.com>; Rob Herring <robh@kernel.org>; cornor+dt@kernel.org; krzk+dt@kernel.org
Cc: linux-spi@vger.kernel.org; linux-kernel@vger.kernel.org; linux-mtd@lists.infradead.org; nicolas.ferre@microchip.com; alexandre.belloni@bootlin.com; claudiu.beznea@tuxon.dev; Simek, Michal <michal.simek@amd.com>; linux-arm-kernel@lists.infradead.org; alsa-devel@alsa-project.org; patches@opensource.cirrus.com; linux-sound@vger.kernel.org; git (AMD-Xilinx) <git@amd.com>; amitrkcian2002@gmail.com; Conor Dooley <conor.dooley@microchip.com>; beanhuo@micron.com
Subject: Add stacked and parallel memories support in spi-nor

Hello Everyone,

As https://lore.kernel.org/all/20231125092137.2948-8-amit.kumar-mahapatra@amd.com/ thread discussing the addition of stacked and parallel mode support in SPI-NOR has become too long and difficult to follow. Therefore, I'm starting a new email thread to focus on the DT binding changes and the overall implementation architecture for adding stacked and parallel (multi-CS) support in the Kernel. Please share your input on this approach.

Background:

The AMD QSPI controller supports two advanced connection modes(Stacked and Dual Parallel) which allow the controller to treat two different flashes as one storage.



Stacked:

Flashes share the same SPI bus, but different CS line, controller driver asserts the CS of the flash to which it needs to communicate.

Stacked mode is a software abstraction rather than a controller feature or capability. At any given time, the controller communicates with one of the two connected flash devices, as determined by the requested address and data length. If an operation starts on one flash and ends on the other, the core needs to split it into two separate operations and adjust the data length accordingly.



Dual Parallel:

Both the flashes have their separate SPI bus, CS of both the flashes will be asserted/de-asserted at the same time. In this mode data will be split across both the flashes by enabling the STRIPE setting in the controller.

Parallel mode is a controller feature where if the STRIPE bit is set then the controller internally handles the data split during data write to the flashes and while reading data from the flash the controller internally merges data from both the flashes before writing to the controller FIFO. If STRIPE is not enabled, then same data will be sent to both the devices.

In parallel mode both the flashes should be identical.



For more information on the modes please feel free to go through the controller flash interface below https://docs.amd.com/r/en-US/am011-versal-acap-trm/QSPI-Flash-Device-Interface



Mirochip QSPI controller also supports "Dual Parallel 8-bit IO mode", but they call it "Twin Quad Mode".

https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/ProductDocuments/DataSheets/SAMA7G5-Series-Data-Sheet-DS60001765.pdf



Initially in [1] [2] [3] Miquel had tried to extend MTD-CONCAT driver to support Stacked mode, but the bindings were not accepted.

[1] https://lore.kernel.org/all/20191113171505.26128-4-miquel.raynal@bootlin.com/

[2] https://lore.kernel.org/all/20191127105522.31445-5-miquel.raynal@bootlin.com/

[3]https://lore.kernel.org/all/20211112152411.818321-1-miquel.raynal@bootlin.com/



So, the MTD-CONCAT approach was dropped and the DT bindings that got accepted [4] [5] [6] describe the two flash devices as being one.

[4] https://github.com/torvalds/linux/commit/f89504300e94524d5d5846ff8b728592ac72cec4

[5] https://github.com/torvalds/linux/commit/eba5368503b4291db7819512600fa014ea17c5a8

[6] https://github.com/torvalds/linux/commit/e2edd1b64f1c79e8abda365149ed62a2a9a494b4



SPI core changes to support the above bindings were added through the following commit:

https://github.com/torvalds/linux/commit/4d8ff6b0991d5e86b17b235fc46ec62e9195cb9b



While adding the support in SPI-NOR we received some inputs/suggestions from Tudor, based on that I am planning to add a new layer between the SPI-NOR and MTD layers to support stacked and parallel configurations. This new layer will be part of the spi-nor and located in mtd/spi-nor/.



This layer would perform the following tasks:

- During probing, store information from all the connected flashes, whether in stacked or parallel mode, and present it as a single device to the MTD layer.

- Register callbacks and manage MTD device registration within the new layer instead of in spi-nor/core.c

- There will very minimal change in spinor/core.c as the stacked & parallel handling will be managed by the new layer on top of SPI-NOR.

- In stacked mode, the new layer will select the appropriate spi-nor flash based on the address provided by the MTD layer during flash operations.

- Manage flash crossover operations in stacked mode.

- Handle odd byte count requests from the MTD layer during flash operations in parallel mode.



For implementing this the current DT binding[1] [2] [3] need to be updated as follows.



stacked-memories DT changes:

- Flash size information can be retrieved directly from the flash, so it has been removed from the DT binding.

- Each stacked flash will have its own flash node. This approach allows flashes of different makes and sizes to be stacked together, as each flash will be probed individually.

-  Each of the flash node will have its own "reg" property that will contain its physical CS.

- The stacked-memories DT bindings will contain the phandles of the flash nodes connected in stacked mode.

- The first flash node will contain the mtd partition that would have the cross over memory staring at a memory location in the first flash and ending at some memory location of the 2nd flash

 - The new layer will update the mtd->size and other mtd_info parameters after both the flashes are probed and will call mtd_device_register with the combined information.



spi@0 {



  flash@0 {

    compatible = "jedec,spi-nor"

    reg = <0x00>;

    stacked-memories = <&flash@0 &flash@1>;

    spi-max-frequency = <50000000>;

    ...

        partition@0 {

          label = "qspi-0";

          reg = <0x0 0xf00000>;

        };



  }



  flash@1 {

    compatible = "jedec,spi-nor"

              reg = <0x01>;

    spi-max-frequency = <50000000>;

    ...

        partition@0 {

          label = "qspi-1";

          reg = <0x0 0x800000>;

        };

  }

}



parallel-memories DT changes:

- Flash size information can be retrieved directly from the flash, so it has been removed from the DT binding.

- Each flash connected in parallel mode should be identical and will have one flash node for both the flash devices.

- The "reg" prop will contain the physical CS number for both the connected flashes.

- The new layer will double the mtd-> size and register it with the mtd layer.



spi@0 {



  flash@0 {

    compatible = "jedec,spi-nor"

    reg = <0x00 0x01>;

    parallel-memories;

    spi-max-frequency = <50000000>;

    ...

        partition@0 {

          label = "qspi-0";

          reg = <0x0 0xf00000>;

        }

};



}



Regards,

Amit

