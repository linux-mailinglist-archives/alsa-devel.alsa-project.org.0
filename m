Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7637995895A
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2024 16:31:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E21AF844;
	Tue, 20 Aug 2024 16:31:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E21AF844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724164288;
	bh=k4aoYJjULJlLTHN/XMV4z4Znea05DOIYkcGQPJWosoQ=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=SXoKbRbAEXDu5FVfA/2QdqqNvkrBhWKNXzoZkRfiKJolNbSaU/VVTbZ57mochc0BF
	 b4xdcVb2Fh3iswo077EHN4z2/9J+7OwsD9sC7mdctOX1GcTStYBNEw8K+j0PbjuxY2
	 kz1sr54jd7B551e5zQf6OnNbUlVQ5ymk1UoV/JGk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D775F80681; Tue, 20 Aug 2024 16:29:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0837EF8065C;
	Tue, 20 Aug 2024 16:29:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B62DFF80494; Tue, 20 Aug 2024 14:01:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2407::630])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5E825F80107
	for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2024 14:00:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E825F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=h7AU5uRR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=whVDT85AQOq8QasqiQtGIHJuHR/maX+pLST8exVSL13PzGiK3TH3qbuwumzPH4hIHmRSeYqSMpScBJK6n2P+9mCTSVLxaRBpQKd2vyUxLujbi/ZZPRCIFTTqR0A0HaFT9iIQwIIlSDVsEwIAUn/ce8UEFkyEvO9D/1MwHrxkK7amLUDSjIU1cZh9SX/XOxyCz/gIKFFy0247FPb0TLvzmj7rv/IETWdM8PGS1s2wR5Gguxmed8i8WueUQD8dkYuS8+dAlC9KTzjA/rUwzni8Z5PNboX4UUjLoHbwShyFQrOPPo3rK9x2x0e8y5Tm6/Oh9ygxGPTExPqVbY3I+b9CJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ri61+Gnv7FnCFfa08xXs3z13gAvtWeMAckl3DRqWIJQ=;
 b=B+Kbcky/+46j3O99Bi8px5I2LwOBqxOX7f0SCBwUJQyO8/PdVPatcbXRl6RfhaLbgUCIlCq0PUZNZfqS4ekxVvIBX+aej4BC7qlTLUYyyOiS9qTG/wZ0aaS7HO+mB8tQ9aD1DQHL2ijWgiYZ73VnDfTUnVJDwLxk8zMgjP7JrtfxgJnQSsXvNg1oy4KafaVK86Y5OBxHfcEAlqdQRPfmBqQ2vdEJ7mAnTnSShTz4fbAq/1wnRayDJUGHNiQiCkxgfml4ZWOJRGlh87pV+sMjag2aPbIx5MlZtOyN1VqL60rpY0MjccmbxJp16DrJVwOSMdL/1qVXTXJBIRB1gz8GJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ri61+Gnv7FnCFfa08xXs3z13gAvtWeMAckl3DRqWIJQ=;
 b=h7AU5uRRJxiWZzW2HE4K5msJ+IjPEMktgiAYDOVWmzM0Ht3ZrO39OPuQoJn/f05KNLyki7k8y+yeAu+UVzsiRtdqj6+n626s11DHFPS//QOnwNHs05X/Nx4jYk8XHTbve1+H6PiDs2YtkniVs8h+SoECMPXcMPbWDxfh+8KfyVs=
Received: from IA0PR12MB7699.namprd12.prod.outlook.com (2603:10b6:208:431::7)
 by SJ2PR12MB9192.namprd12.prod.outlook.com (2603:10b6:a03:55d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 12:00:45 +0000
Received: from IA0PR12MB7699.namprd12.prod.outlook.com
 ([fe80::7ed1:80d:75c:f1aa]) by IA0PR12MB7699.namprd12.prod.outlook.com
 ([fe80::7ed1:80d:75c:f1aa%2]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 12:00:45 +0000
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
Subject: Add stacked and parallel memories support in spi-nor
Thread-Topic: Add stacked and parallel memories support in spi-nor
Thread-Index: Adry+FCFJ+jxyMZCQv67eHESQhM+FQ==
Date: Tue, 20 Aug 2024 12:00:45 +0000
Message-ID: 
 <IA0PR12MB7699B360C7CF59E0A3D095F9DC8D2@IA0PR12MB7699.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB7699:EE_|SJ2PR12MB9192:EE_
x-ms-office365-filtering-correlation-id: b474d29d-4d3e-4201-1fe3-08dcc10fb93e
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?MY0pUHvv9BB0yi+L4TN5e8IxeTzqDUIRtgrI9d34GG2/NrzkepO+nsTarnk2?=
 =?us-ascii?Q?4eavqSFQzev3dk6ILfK2KShAk69oxezqEivBWmyrmXRWc311lX6ASZ/bZ3J/?=
 =?us-ascii?Q?NeYq4KPUrxRtUqV53PDWG54xP/+py4ZLp44fPGMQWHyvQpD2E8UZVm4ym9cE?=
 =?us-ascii?Q?0Z3qtvc8tuOZGc1JWbVBBvdbWAQwqaVG6+eo/UWBalmsHVANvIoz8TwCh0/K?=
 =?us-ascii?Q?wkTbvy6bxNFUcVkIxHogmtIMitmARvmoYX2XIjy7DyLjmuJx0V9j0jDmCj7v?=
 =?us-ascii?Q?Z7MmlesINZ1ChwJVEqQJr44O8NB1AD6uJ599Fw5izyJdgICQxmh8NItHwDCa?=
 =?us-ascii?Q?u1lixQe+u7xZ9YSAwHQIz362nqIdHAxDka4RixBTjyqvHkyzkCKtN6aMFHbk?=
 =?us-ascii?Q?k5ttDLVx+Fad0ZvTPWVonoTLKYCIUliiWlRQ+GlelZNtkNEEFaDah+PEVIUl?=
 =?us-ascii?Q?lQOFSsxEXkh4TikDuZJmbH7xEDgU5o5Um8Hp04X+ZEZv6x0TKBR8KId+iGaK?=
 =?us-ascii?Q?cS4v8uZH5UC67gpRfMGooPxy+i7lPgC+GydlUUfZ6IWioURfJwbsCYHbIeNV?=
 =?us-ascii?Q?gWQeICcnX8Ezmr0u1aIMl79vWPDhzU8MtSkfHo0c2cqPEOa8Pg2tlhZL+imw?=
 =?us-ascii?Q?KDi8zzG+eTjKjNIEfK7JSZ66XbLI7gcW5IIYja9vRT7GVcmU1SM8JqOuoFF8?=
 =?us-ascii?Q?x0qyRor3sDWNt3iMOiLt5pp5Vccu1oREOlgscSZzgt3TyJSnb25d6TZa6bZp?=
 =?us-ascii?Q?4qK4P2p7dEWTW68PF9GR62cvZne31wwStK/Nxa4Xr0wvAIDrHeU1aMdx/TMy?=
 =?us-ascii?Q?QOP09ccvfdnk5pW8kJ/p+Md8JZ4XoBydiISamI/nvHtu5F2DhP71GvHg9K6U?=
 =?us-ascii?Q?fgolm0zFml5rH5ckl3R1DhZxbNmKvRk3Y3AIfbn+B+J/WRFxgTfBGUEYFZRa?=
 =?us-ascii?Q?h/d8NO29vAJ9NHeJC+DD6P3EgIuE6QiuVlZv1IVBEeEfraIXl46MKCVawWf6?=
 =?us-ascii?Q?+Rb+9wRj51QOROlrfgaAOljKE9r2SeIuqGQHDiv8tsgMu/oPwKj878EO6Oyw?=
 =?us-ascii?Q?N8jOYmuy/UJgdWq4JrL85uUV2jdeIi5uEA7xFfMprbgrHZu5GDLkFxLWbJiF?=
 =?us-ascii?Q?RI3+o5hYnnwQVz3j///KYtly1JtAFNnupwzOVrU3B3V4X8XgrpaBYLNkU3tj?=
 =?us-ascii?Q?NJRv7Ev/3QkTR9O2N1UoVdvHJ5eECD7lL1ggLjapDZfMgvDM0wf5nPpIauK/?=
 =?us-ascii?Q?XWbqGtqhp2V7g28Lm/0yAfVLMgRlqzKIdFF8kEbBFO/kazPpJ/nkzDGepv+3?=
 =?us-ascii?Q?q36QAdSYNUkrFklSxy2o/JPvy+liCGXehvNh/+7azWOv1x3Sk1fSMWWPquZH?=
 =?us-ascii?Q?QinhM6ZHvyoNt3X2/ydlTx/v2y7Z?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB7699.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?bX0kkM/WAHIDaM/vg85HePqxrcMQBn5rknsWgNuBCUeBDfASd2489H6yONRj?=
 =?us-ascii?Q?JLhCyYwD5MmNmvqZJtYKBtDaPuDNumrt1QN7w+nNhiAHVwxAN9sOUIr0CjCc?=
 =?us-ascii?Q?QgveZZPYnDPgUr7Tuy721/On7/ZWR+MUpsY2aLIxExEMVd0lebg2bMKwfFU4?=
 =?us-ascii?Q?ELNhG+DzSPNSCbQYeIBi16geROKmJTpdnOy2+S23Q+KjRFcgoXVwRDMgsDr2?=
 =?us-ascii?Q?DDeaseqkyHpMzgd2S++XLMcwjRB2JUi196hJopnh9V7G0rbDxvum85BkXxyS?=
 =?us-ascii?Q?lkxvAVQlUpNKDOMZdQCwoOpxXgrG1njGxR7CCQxLw7omruSoqUfk8SVCDm+K?=
 =?us-ascii?Q?P6XZp3ePMmnWKIUWctz18c/lmlS9Rf/fwkMkEpRUgZuRTxEFIAqPUvZdTp9h?=
 =?us-ascii?Q?9/0L11J5lagvJmL7jQQIV5QMYHtBHxhdaKE3coh7oWBE14Exdd8zZ3gx1SGQ?=
 =?us-ascii?Q?363fJ42e8abS1Y8vVGyre0LHJ4MaJjVgkkAqAJeR05qAZjVnnGlwdvS+7fau?=
 =?us-ascii?Q?Gv2we7aEHZ10iG8S2L5T6oq4K0pnuo+LgEUEFnq6lW+V4IEcrt3QAeIQZ+rm?=
 =?us-ascii?Q?1d9l9fPcLr9aGggwylFJ97Tn7vYg7cwNFIAx4FqFy83wsxTPLWtEMY+oSDI5?=
 =?us-ascii?Q?hooqyN8AMXtV4m9uhtyzedFIlJo5DCUxOikv1d1g42mPJ7+QUHb5/JIwQVNf?=
 =?us-ascii?Q?4JShkMdhhsMb/LEO3GTnPlcHVHZ56nPigJQ7QwcBy4o17OILRJramfEA4jHZ?=
 =?us-ascii?Q?uhIKue5l7EhsLm1tBrkFXoUHhnXgKtrRgON1G/ZKWrIN0x1KiTsQxc9QpK1B?=
 =?us-ascii?Q?UuLQ4ecAkjo7ARxw4Tr0ETpr5OJe6qguynqxulMhHjtz0gRiXbckCggHzdJu?=
 =?us-ascii?Q?Cipik8lNtUXD9JOclV5+CuR/bcCBm9dkN9GTmlUBhvIwCsyyPgfNbbo0EX8Q?=
 =?us-ascii?Q?T05C0BQdtSdJLZh7yjK/gqyfG1BHVLqUsIgiyR3+Pnbtlx+lr5q/kDjrzWJr?=
 =?us-ascii?Q?AeojNk0osELvCVaOfGhVvIHs2cx66fjoNbzHqRZxrhJev6Qv/w2F57MYKdTi?=
 =?us-ascii?Q?5jqQy2ywBoHIFiHYm2ahfeIJWACAHGTTFgPAVsKq9FS7IciAZ2KFNZVHaFFL?=
 =?us-ascii?Q?TPyBKD7Rn/P+FylyxHd3daOKnQ97EPoIVp54I1CVmidWQuH6xEoqY+z1U96+?=
 =?us-ascii?Q?Kj/sOFsKRaA7BYnZsAgbaITLICI4cXCFVPK6phEWe3cm0wAdPNNJDgtv6w9a?=
 =?us-ascii?Q?cb6F3dPUQ1GstbtDa2yi/6U7C4b8L+uc0ptkiAvwceeSGcjQRgfQmqBXLrsQ?=
 =?us-ascii?Q?FiqqE03YJoV3lv0dM+zLbHBLEW7js/J/zPZOTLqnQmEsr7SjYkmg4h7m89EM?=
 =?us-ascii?Q?M3pmBPifx/e3VNi6i7xEAwRaskYGvR7mB4TIzn7tUfsEodkBxLCTeIvoSfHl?=
 =?us-ascii?Q?dl2bfB5zUntLbxYF40kOucm8S3igQIDDNBuqt809XsLRHFG8wCxOfYCAi4Pq?=
 =?us-ascii?Q?fHymOyxNugfim3ca7J3LXjvzKImIDyw8XooGx1Ravc56ZZdn8AsnKx6J3ZHl?=
 =?us-ascii?Q?2/gnsL/aeoteik2B3uw=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB7699.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b474d29d-4d3e-4201-1fe3-08dcc10fb93e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2024 12:00:45.5729
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 2lS1/33NhgDzmJWZspNexIPQOiM0Dof4hUVPK/Ks3kCc38sGFo8GlzsIKB5zTyQp+uJsyPGSWb04hQ/ZEvpcWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9192
X-MailFrom: amit.kumar-mahapatra@amd.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 3J7JPSTCMVKYGVKOD5SUZU5GAMLU3DKZ
X-Message-ID-Hash: 3J7JPSTCMVKYGVKOD5SUZU5GAMLU3DKZ
X-Mailman-Approved-At: Tue, 20 Aug 2024 14:26:51 +0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O4BK7GM57ANK2OWMGI6ILLL5LUXUM5AK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

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

