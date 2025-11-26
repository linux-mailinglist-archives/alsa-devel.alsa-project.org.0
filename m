Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82703C8A434
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Nov 2025 15:16:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4F1860212;
	Wed, 26 Nov 2025 15:16:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4F1860212
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1764166618;
	bh=I93a5RqeDu+UDbz8i8Qf73/2q4yFmTKrujAAnIE5pP8=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=dNiLVRn9XoNDXZ6J7DxzmyNwO4/IT5vFhd/WKxHiW92J/eZK3Cb1c7OW1JlpoeO8c
	 21FKPna9qo8dDIJqk/UkzV6hi6o+w0F+YRKoG9NeWLcpfbxqnIvTNnQoEzBxJMTPCX
	 qkJdN6L3sHHYbCggCV4vLhhNNqazTdXtDIQQavdA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19D7FF805F5; Wed, 26 Nov 2025 15:16:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3CD1F805ED;
	Wed, 26 Nov 2025 15:16:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF295F8047D; Wed, 26 Nov 2025 09:18:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,KHOP_HELO_FCRDNS,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011023.outbound.protection.outlook.com [52.101.62.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7DC80F800AE
	for <alsa-devel@alsa-project.org>; Wed, 26 Nov 2025 09:18:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DC80F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=selector1 header.b=eMGVvPOZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jba5G0Zehz/cX4R+jl6b52rbiCdyuAs5sUU/gSSI+34aTiKdPOQhI6OhDvb+j1hOPaBOxJNqe2f8WAghFTfFKpRGjiJU7EM9Ia3R90PzOWLsrQLwj5TPyFhje88k4g1VHwU3YGDa+q7S6AENxIcoPvQmSN7l7ddYhpgfzKf6/9BiMreVEbJrmt2kj6xzi3S3Oc3DHg+H2ifGj4pHDCxVj0fAt5O+b7JTKbORW3DPPH9zAqo98vnMs8bar8lMY9N/YOC0HNICO+tNdg01kJrs6IbmBlqezs4sBicxubgt7XQSWYlAcy23nUxUiw90rdXbCnaUNZt6CI3RcOwuIJY1Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7wAcCuSnHyM9fBS9ozIn9rTBSELq626Ce7DIYn8ZjRk=;
 b=E8jOFEwz82m4dDPCUueEKMFQcZV5GWj3ES/V82MwgYGkT603McSJgErn/RHeAUI+HZxkX+S8sOZjGfmMsCH/asr5pTeC1tdknwu+cJU98l7NMdEEBxL/N3fLuZOSZ8UgZY+zfA05keOyyTVE7Y4WRicWAr0kQqirIWDZQA9WUpaVK5j5CribR6AypF/rw4rTtDG47UDpne6ygDmeRQk3rhFZMce97FOp3fMz/rauO/lW1CZUMdZPdq37zKm/tQKSsGusXGJr7/abxMg1pUDhhjQmHfkmj6mQKexF+GLjE3cSGUQ5cyW4HLx3gRI/+712GLrrWAxFP9UbCk2WPTnyYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=hp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wAcCuSnHyM9fBS9ozIn9rTBSELq626Ce7DIYn8ZjRk=;
 b=eMGVvPOZgRezBmjEgDARg9f3YkRnakmxZaypOgAJnsobfQXnn1RqCeWIt6OhbCLm3/ISuwEYpyPO6Tj8wX7ATj0ySU9fsfbsgPioDhB25RMNM5CZfoLz9JwOP4XW8bCIIylLnJJ27i4FJ1l8Rxx6hHlQ12F4Dp3gYQiSeJr6ex4=
Received: from DS7PR05CA0101.namprd05.prod.outlook.com (2603:10b6:8:56::21) by
 CO1PR10MB4804.namprd10.prod.outlook.com (2603:10b6:303:90::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.13; Wed, 26 Nov 2025 08:18:25 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:8:56:cafe::3b) by DS7PR05CA0101.outlook.office365.com
 (2603:10b6:8:56::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.11 via Frontend Transport; Wed,
 26 Nov 2025 08:18:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Wed, 26 Nov 2025 08:18:23 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 26 Nov
 2025 02:18:20 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 26 Nov
 2025 02:18:20 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 26 Nov 2025 02:18:20 -0600
Received: from lelvem-mr05.itg.ti.com ([10.250.165.138])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AQ8IFG5933432;
	Wed, 26 Nov 2025 02:18:16 -0600
From: Baojun Xu <baojun.xu@ti.com>
To: <tiwai@suse.de>, <hansg@kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <broonie@kernel.org>,
	<andriy.shevchenko@linux.intel.com>, <alsa-devel@alsa-project.org>,
	<shenghao-ding@ti.com>, <13916275206@139.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <baojun.xu@ti.com>, <letitia.tsai@hp.com>
Subject: [PATCH v3 0/1] platform/x86: serial-multi-instantiate: ACPI example
 code
Date: Wed, 26 Nov 2025 16:17:40 +0800
Message-ID: <20251126081741.10588-1-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|CO1PR10MB4804:EE_
X-MS-Office365-Filtering-Correlation-Id: c8895966-4307-4c76-8eb1-08de2cc45e45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Kk52ab74Z0qiETv35vR411nrGc2DREJQ0u/WRBwCpa90WASwigT+9atsIIuh?=
 =?us-ascii?Q?CAwQ3xAKTjC21bDWWICtkJpveESaIXJVFLTWAZVZBPaHHBfxApxg0FSMInO3?=
 =?us-ascii?Q?mhyc0ZHgQ+3ZQnhhi5JXWQIIKbZESqTQbU5nPmTMopresmTJI2OSal5NvMVK?=
 =?us-ascii?Q?2whI2IeWaBZ16ilgntNBOKU0i4c4Es3EAi7EOPS8QIrvdc94lX+K049bSnRr?=
 =?us-ascii?Q?dPmuIBTUUD51JMenMNuXcKhdQJgrsshsOINnmLgNzxdzN1nZ3SiEzkQGZGBR?=
 =?us-ascii?Q?azL9TV6MyDuZZuc49/gV2UQfXUXpiP8UwhVq0rMwNN/1sK6a703DCreqa8XR?=
 =?us-ascii?Q?lYYmFXc1wiUg1aa8OsRQOErb/4MSufMz1BNf2i4xNydBWgiucNAMeDLN440z?=
 =?us-ascii?Q?BqwKA6a5AoJlA8eA4XhkNzyBZ35wl/Le+Xr/NtxQXhrwBF99RfQeA88EyNlJ?=
 =?us-ascii?Q?+SOapVFqxjzLdMyva2h5H1NOkdCwTPjRZl9hUBigSoNFtogkOnhv6BW6UUSA?=
 =?us-ascii?Q?7w/ujtLRExARgAr9hG1nka2zVOmm7MmLpfWuw1/qLvKlohhAugJnA6hPaeTN?=
 =?us-ascii?Q?IOEIA+1qw5A1rnZ9wennPO806N6sa/Rzlmab3E0uE0Ztuo3FQ4VFt8YTNL8d?=
 =?us-ascii?Q?qVYMW4N+XGMSVZDcgYdqietqO+bnWzjPCOT3WesFqI7FuyCrBMRvw5d2QXT5?=
 =?us-ascii?Q?VUSN1h2UZwNj0/YkG+E4IBWGnXJuzTYPImgJqnVhgVbvxWRu2QIKTjHm2la8?=
 =?us-ascii?Q?LdrZgmrDpu4Shj4GkyorMUB5rV1p1MidOR7XCCtjnTilxFoBKe5FbTtNg3Pw?=
 =?us-ascii?Q?EVQRqVOG3ifxO3XcULhH+xHLtPlbAe3l8NnPPjyai2moIeNJGXZEB7VfEKjh?=
 =?us-ascii?Q?HpI+pqAnnlTUleYEUviXiVCyfbDNnqwPMao1LC2+zOlefVSXbXH0V9cCYMAx?=
 =?us-ascii?Q?I0AobqgnxYL7LwHm51Rx0BwIQWtdd2Vozlks5TTPIO7KQaoCimJAtqDJ5N44?=
 =?us-ascii?Q?GBWrFVhe60qB8PXyode64wdIwD4bs7NPTJ5LuZyM7j2qNor2gi4ZFpQL+QO4?=
 =?us-ascii?Q?e8+CkDGgWXO4/+Wd9TI8Uxetel4L9W/yaTdXV2Sg97qR6PuWIfmsu6DQzrlb?=
 =?us-ascii?Q?tyEg6kjsT4MUx90lxd3zsoAs75l1sxQz2kuZZ43nQZEBiPRktjg087vdjMoD?=
 =?us-ascii?Q?+QTzxe+7/IvBG9qUu8MR37EAjQGdXxTCBOdxhIph8zQbACzrN/whm+KeSXzI?=
 =?us-ascii?Q?It0RWFfMDadoOi0JXDi1MhrJwKEhsHuBnAQ3J81SNL7ag/VNbcT/coEenil6?=
 =?us-ascii?Q?zA+YYLX2IY94gUviyCXxJu+bJI3/XxRl33iWBRdVSapRctgh4nH51pnBT4CL?=
 =?us-ascii?Q?J3inyePyXI5S+jNRpI0o4SqOSrUI8HCHbiL/hpB+paExOymzOQDZEzxD4vKO?=
 =?us-ascii?Q?nDguXa87SHMo48nkXBDC9Su3J5kYbdq0XWwa1XL4O93/omFhRK+zI/9tC+59?=
 =?us-ascii?Q?AqOXFieXurZeQP0FVflfJd7SpkpIUt61+Cc/KTDhNMeC9yQYAE51lG/l2jrC?=
 =?us-ascii?Q?zxHkj7e/3fTDBwwh8tk=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 08:18:23.9151
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c8895966-4307-4c76-8eb1-08de2cc45e45
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4804
X-MailFrom: baojun.xu@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: YNM3O2ZKX4IORIAEHX56J3CKV7SHICDH
X-Message-ID-Hash: YNM3O2ZKX4IORIAEHX56J3CKV7SHICDH
X-Mailman-Approved-At: Wed, 26 Nov 2025 14:13:09 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YNM3O2ZKX4IORIAEHX56J3CKV7SHICDH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The tas2781-hda supports multi-projects, In some projects,
GpioInt was dropped due to no IRQ connection.
See the example code below:

But in smi_i2c_probe(), smi_spi_probe() (serial-multi-instantiate.c),
if looking for IRQ by smi_get_irq() fails, it will return an error,
will not add new device, and cause smi_probe to fail.
So need to add an exception case for these situations.
BTW, this patch will take effect on both I2C and SPI devices.

Device (SPKR)
{
    Name (_ADR, One)
    Name (_HID, "TXNW2781")
    Method (_CRS, 0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            I2cSerialBusV2 (0x0038, ...)
            I2cSerialBusV2 (0x0039, ...)
            // GpioInt (Edge, ...) { 0x0000 }
            //"GpioInt (...) {}" was commented out due to no IRQ connection.
        })
        Return (RBUF)
    }
}

Signed-off-by: Baojun Xu <baojun.xu@ti.com>

Baojun Xu (1):
  platform/x86: serial-multi-instantiate: Add IRQ_RESOURCE_OPT for IRQ
    missing projects

 drivers/platform/x86/serial-multi-instantiate.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

-- 
2.25.1

