Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E61B8ABF7F2
	for <lists+alsa-devel@lfdr.de>; Wed, 21 May 2025 16:36:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26139601DB;
	Wed, 21 May 2025 16:36:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26139601DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747838184;
	bh=pM3gMP8FqngddJMEVF/k2/QByPrBLQRHcaT3W/wx92k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UYX+UV6nuhAWVJMGyB0GxALRwukqnt/xfAI84R21IWFX/lgyaZ6tA0vNL8Rn07njp
	 iUSj9rZkaKc3Sea3biESAC7J9yypyy91eCMqacgtoy1SB9g/rOik/hpnY39inTY+0I
	 mzpCQo+Bc2RU6UXYDMmaCmUSZIKVhbt2fGFqPz3E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FCE2F805AA; Wed, 21 May 2025 16:35:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67576F80571;
	Wed, 21 May 2025 16:35:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D3E8F80553; Wed, 21 May 2025 16:35:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::60c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DF80FF80269
	for <alsa-devel@alsa-project.org>; Wed, 21 May 2025 16:35:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF80FF80269
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=TNEcXzR6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SRM7OCcv+Yk7Zj2FD7eMLzhI7iO+Fbe3QzhWkYEPA550yDko+IAAtB+pcs6pVs0wRQTng6aaTj/D2nPEufrrVgaOghEORBKQMV2Wkh0EMaVYfmzyLnI52Bzb6BznFfN69to0lA/zsADPUfkkA1ceXcqNS9sE/8vl1GFjoSJ9IGTOdLFcF/prmeMGw+9qft4MVXKWWFXKTXl7D/90QE/KWtjQwCdxSa4UVCjYwmTJfQ+LQpMjUFiZYzRo9Qr52vhiQD0BLPZ546Ff8FxowZSOrKczDou0Tcc+jkIED+GWmnPbqs+0GKLtERqyC01G4dVSWAhhT4wJlFGgi20egYuz+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YRFyFKJMuNJ4yNkXZxjdeNlTFWUD36AJVuNGVseJUi8=;
 b=pTusDqR4IDjEeYKKdRhwXaQVtGxskAW2hFMym00HPrn47J4lZI0JAOT/iYFHJBd7UcjXznFsIg/rz6eIIYc9WAeOxUeS2URLI26s9bUn2nzfjLNWjX+rdWYfaI3eT/YnZsxKFoWCiyjo/oc4+vvgPxgGLT1efWG4BhkgYqSWLjCbWaeIdBAHzQ2HE2tvArAgcv02X5SGB3AXW/VmEegjODhH7DC8Li6QjFYJy1pxzXjeLUCdrQepZnPXWNsbXgcMydfkgo392AfhARqki0vDe6T9z37FusgA6HisYr2MQNaCFTyHLi0lpHLtxognAl4H1HEpNJZQX4HGpe4k/FPQiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YRFyFKJMuNJ4yNkXZxjdeNlTFWUD36AJVuNGVseJUi8=;
 b=TNEcXzR69ml2lZ4K5S2EzbHPF9xn7Cxr11KG5Vftm3yZgApIOWKIC2dKuJPkxc2LwOhm9h2qrAI02pTkTKehsZKiYbwHgjU5z9SIC0MFfJ7YFlt1LiCkv/TqFZ+1U6W6kl4jofu4SY9RwzfyIIVK0nwB5qXAhIkGwzdZ0PXNUls0jBkdleZijuerxpilh4nHRuWg2cxH7Cc35UKQG8DvS7yAAxf7cu3z5P4x68NWQ8IYdYlkSP/oghOoYlc88DQSOmKMDDca6Wnx9pDSJYL8kRF5Y+BZszeIW6AflvSj5qBLwd1rLkS6XFBcM3ggCtePh9f+kFtNBjHhO46zl8u+sQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8422.namprd12.prod.outlook.com (2603:10b6:208:3de::8)
 by SJ2PR12MB8806.namprd12.prod.outlook.com (2603:10b6:a03:4d0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 14:35:33 +0000
Received: from IA0PR12MB8422.namprd12.prod.outlook.com
 ([fe80::50d8:c62d:5338:5650]) by IA0PR12MB8422.namprd12.prod.outlook.com
 ([fe80::50d8:c62d:5338:5650%4]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 14:35:32 +0000
Date: Wed, 21 May 2025 09:35:29 -0500
From: Daniel Dadap <ddadap@nvidia.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: [PATCH v5] ALSA: hda - Add new driver for HDA controllers listed via
 ACPI
Message-ID: <aC3ksXJUM9DlKiz6@ddadap-lakeline.nvidia.com>
References: <aCXswg1gr6cufyzp@ddadap-lakeline.nvidia.com>
 <87r00qx78f.wl-tiwai@suse.de>
 <aCYMjYrfFIPjN9Fi@ddadap-lakeline.nvidia.com>
 <87zffdvvj6.wl-tiwai@suse.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zffdvvj6.wl-tiwai@suse.de>
X-ClientProxiedBy: DM6PR07CA0109.namprd07.prod.outlook.com
 (2603:10b6:5:330::17) To IA0PR12MB8422.namprd12.prod.outlook.com
 (2603:10b6:208:3de::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8422:EE_|SJ2PR12MB8806:EE_
X-MS-Office365-Filtering-Correlation-Id: b5327ce3-3608-48b7-2b8f-08dd9874bdd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8QdlecIbIA9TH9IUyzYDJTn6K7FmHovtQdn3u0OVfUsleqih8KnAq9EKjp6n?=
 =?us-ascii?Q?8kcUJVujVL17p2LvAVMF90atK51XWvf2AAWL1TtZF7fydYC6FLfhbpiC8PsT?=
 =?us-ascii?Q?a80G3JAsBnp98Q+RPVHmhiyK7MaMKWja2THmJjP8rPg5sJP60vQQ7dzIG12q?=
 =?us-ascii?Q?15k0T6csfvh4y+6Nlb1rlev3pw5A4QhkVhCENZm/eYL6R71ndJJXkbwdOaUC?=
 =?us-ascii?Q?Qm1WgGbJ/LPQ6PBtBTXR0xH4zShDq7rrR7IhMbT/iPNUQm9BL1VQEpYCXZjz?=
 =?us-ascii?Q?AE7jPAj7nbCg5lc6HS0HxOHtyPQ6YIbZJx5r4F5qzn09k1zgX9xQCxsMr7QB?=
 =?us-ascii?Q?2nc3UljkZ5JMP2QJHIkaFl3Cg3aOs0TZgi5GUtba9xxZyEbagsfRh2fbFVfw?=
 =?us-ascii?Q?EjJy+8+/Oflpyyr4Y7uE3cKp+5KDbs/RjCKnPLT3qBUKT/r7h8MUDwO25s7B?=
 =?us-ascii?Q?MPdS1fiTf8zV+9PjqmmxPt9a0E2j0kOLMJCtrDUY9h4QH+pO3vMkC0AbgxqQ?=
 =?us-ascii?Q?LzNm1XaGLCqpHsE2c6BuEYxLJJlahCpYH2mXx5yMjudHDpV32soNUMZgtP5J?=
 =?us-ascii?Q?v/AVeAqZMPopcPRVthzbWoSfAw5q8XoGNZAjk0pnxsAGVLtd6hq6xG7xRtRF?=
 =?us-ascii?Q?KAyK1BdJ4raYdYUtUYewEpzPE6EQi62Q/dQ+bdgJQQ+jzQ+USs+lReCVB1Hj?=
 =?us-ascii?Q?Tp7w5m7Kkbe6Btihg7BcG+H2/sLdaSd7lQU2jFbjrqTX8SAzo79D30appyyg?=
 =?us-ascii?Q?3JeO8+JdrX4HjoMg9Q7I6vX79KLx50nwmp5NX2vXfdEBuOVVrSsuX1ma5lNl?=
 =?us-ascii?Q?SxESR63d8pwCgGk5XpHXOFyCpm6YCLmZklgWrMkE5aSWLqQrTxD3i3O7F07G?=
 =?us-ascii?Q?jUQ1Yw7e3YIgWI4Y64Lhgl4czX0BnqeitZSQlR2uonFhAnDYg76UZ5wgYD16?=
 =?us-ascii?Q?cDRjBZhB9yHsnPR9Aty9wHDGcD4fmOpmwoee5tGKaoQeZS1WyVRI+rO3wfi1?=
 =?us-ascii?Q?Uld+b3K3zbcIG0O6um4MzgRmFSAb8x/SFezb84I+nc6kGpolovrE7FO+wRbD?=
 =?us-ascii?Q?gcMTcIEbluyamhHwsLFfXs7+tFDEiciCZcYx7Q4kOxUKaiv8nEHJJTQkf2lT?=
 =?us-ascii?Q?qWCPJw9MRFLutAKGbxpVhs5afGNUrNkOejFArK99HLkpCI72WiMO2zogY1Vt?=
 =?us-ascii?Q?UqfEtZjIokiazoS7uG0ygmm0PtwW/X7h6GFMY1uCwUNXuvQMn38KOC5/CaQ8?=
 =?us-ascii?Q?phwn86pD4F6EzCFRlS1kSPgJyObVWwrww4cmfY63SPja57SrD0Iju1m8G6+W?=
 =?us-ascii?Q?5eIhPSktI7PCFbtR50ICHVtWOO0wzOimya5uQh6oNAgBgUgkxYHY5NNHL8A7?=
 =?us-ascii?Q?lWVGb8xfdfIv82kE4b//6MPz4wjA2UTfhVG0v9dwqgc9tt/id+uaysphvT+/?=
 =?us-ascii?Q?m6AuxMvwReg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8422.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ifp6FoMDKjXxwtF1mjgXz/59XKza6l72FWOdyTYeN9SZdVCg7iqYy6PYvp4S?=
 =?us-ascii?Q?dmpJapZOokBrJI3W/SYcwVaJQMXB86ovgRmmFUahxtA0TVRIX6swzVXNVTlD?=
 =?us-ascii?Q?eq86hIao5D50+SP3Rabekni9p0yZjcv3B6jbos/ZyFpA95vsAqgoqH/LGLqD?=
 =?us-ascii?Q?BvyMPIAkKXF2tQ2cnDJqubc6OO7IAcaAKWOC4ah1Nuj+qUFkoeA0krUuQyRe?=
 =?us-ascii?Q?bpekXpJsmt21lx5cfNPdybf2TZxpJ1hh2AJpNiF0CP1piHs0kd8IlkSdNC8A?=
 =?us-ascii?Q?6LdSWkEBOpsiy6fGz7IEM+4MSdMG1v6/sC6mbsOpHOreS+dqdOgHq76O9A7S?=
 =?us-ascii?Q?S0GNu/t0vLoirwJ9zTpNif5aIMV8i0ON5T6XeEmdOpYKU2Lt+KVWraHZGjBW?=
 =?us-ascii?Q?hMoIhVXHu5575frIwoW9CZg/eM/fVslNjmfZSeHwIZsfLRKSIa3H7AqabXsG?=
 =?us-ascii?Q?EYPjdxmmZgeaphmWiy4z0TuwnM0bpa/JZVk/vxGwjev/WaNYisASrqYgBoFH?=
 =?us-ascii?Q?N8AEF85ch6HLtOoxA/QNFZhuSSotcfXRhLiwxvjA97UDc0KMooznplvDaK6m?=
 =?us-ascii?Q?2XYkTRxKgLQWDBfsa4YbouX3PwEQ2fBB3azWEI77qGtarE+7w8gjF0d2hhb0?=
 =?us-ascii?Q?ZgqYMgMAhh0QRvFmG3RALTxmwLpY89ADiUo95v/0idFyq/oJlhB3/aHYL0CQ?=
 =?us-ascii?Q?jkZ9KnU22xtm0LDyS14H5Mqsy1uctXQ5pXLNxi0HbZNUg7zcHhSvy7SzsODm?=
 =?us-ascii?Q?hbY15QRlGCnQUHCN1PIeTZTrZwfu/j4J39H97/Cmkls7TKAaNeyxuEB46owv?=
 =?us-ascii?Q?sl9t85b+JEe/v4sLj8puktNS3dYlWHy5t6cz6aHsL2P8ll/e0ZfcOb0xy/rL?=
 =?us-ascii?Q?W5c0jRr6ZHpz6T/rCq7uYxkTA2AeJEukNmO6XVOzZ96PUbNoLEpue1M7TvDK?=
 =?us-ascii?Q?TFidoS3klLe9cskZUt2skrEph0ZJUzKJpGGmENKpAt7PDrVQJkPjT8+HnQjI?=
 =?us-ascii?Q?yIaokQBLAbJtTr9Gn55NbIQZM1OYJ72J607r+G6z+Giwy6ksU4JJLyiFOxvK?=
 =?us-ascii?Q?82gbQ1DaJrA0vRyoYJFaI9/bEj3RL4SggnKGx/H3ZVSiKpSedHE2/ox4Z7Bg?=
 =?us-ascii?Q?AWxBMO3zwSnu518R5N/mXeiJj4EmNZwh9b7czYNBbXdiYmnBBVQgMa700ONX?=
 =?us-ascii?Q?KWK19r1elqLV4blFjZiWswg3zvf4H0F2ZwViqxezqLfQiolQZesenqZnSPIR?=
 =?us-ascii?Q?+ihgo8aqn0ZtbzFLGnM1nlFME6h+dTmlgC4VNohDKxYll6XfsTDRyph6XwBv?=
 =?us-ascii?Q?cT/Ym8+cBQW4WaLjGz4KrnGJtnQx0f/JNmlbRDDc4Z9JhWdijJqcaUDiJQhy?=
 =?us-ascii?Q?JAIbxLwYy/N8yeQUAybZSXe0GnojqJMe1v7RB4R5Sc+FGReoIPt5Tlb0uzzS?=
 =?us-ascii?Q?lHStkyFfRQvFUEfZiXQNvYyENCv++8M0qiZCUw9yrmxgFIv1v3RtKRJwPedR?=
 =?us-ascii?Q?9Yibn9BHQJDNCITvfG2Q6e2lA4HXK9VYPLtMlyVMzwgPvmNPvTPj65tjp1J6?=
 =?us-ascii?Q?EbhoMYZa5RK8hJmGK26QQ1SNM96nzS7VyP2kaLTE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b5327ce3-3608-48b7-2b8f-08dd9874bdd2
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8422.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 14:35:32.6778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 RVM8gyjykX5DqWlGfpBj5y4CA4b7Vnst3zvVQJdRDS09QIYVLFLRMp7GMPFi7Phl23ha4Vki3W1l28HLp6lj9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8806
Message-ID-Hash: UPVBKU5SFTXWIECEYE43NTQY7KJJC2VG
X-Message-ID-Hash: UPVBKU5SFTXWIECEYE43NTQY7KJJC2VG
X-MailFrom: ddadap@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UPVBKU5SFTXWIECEYE43NTQY7KJJC2VG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some systems expose HD-Audio controllers via objects in the ACPI tables
which encapsulate the controller's interrupt and the base address for the
HDA registers in an ACPI _CRS object, for example, as listed in this ACPI
table dump excerpt:

        Device (HDA0)
        {
            Name (_HID, "NVDA2014")  // _HID: Hardware ID
            ...
            Name (_CRS, ResourceTemplate ()
            // _CRS: Current Resource Settings
            {
                Memory32Fixed (ReadWrite,
                    0x36078000,         // Address Base
                    0x00008000,         // Address Length
                    )
                Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive,
                           ,, )
                {
                    0x0000021E,
                }
            })
        }

Add support for HDA controllers discovered through ACPI, including support
for some platforms which expose such HDA controllers on NVIDIA SoCs. This
is done with a new driver which uses existing infrastructure for extracting
resource information from _CRS objects and plumbs the parsed resource
information through to the existing HDA infrastructure to enable HD-Audio
functionality on such devices.

Although this driver is in the sound/pci/hda/ directory, it targets devices
which are not actually enumerated on the PCI bus. This is because it
depends upon the Intel "Azalia" infrastructure which has traditionally been
usedvfor PCI-based devices.

Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
---

Patch history:
v2,3: Remove __maybe_unused, use SYSTEM_SLEEP_PM_OPS (Takashi Iwai)
v4:   Address checkpatch issues (Takashi Iwai), allow NULL match data
v5:   Use two-argument strscpy()

 sound/pci/hda/Kconfig    |  11 ++
 sound/pci/hda/Makefile   |   2 +
 sound/pci/hda/hda_acpi.c | 325 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 338 insertions(+)
 create mode 100644 sound/pci/hda/hda_acpi.c

diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
index 9c427270ff4f..436dfd182a09 100644
--- a/sound/pci/hda/Kconfig
+++ b/sound/pci/hda/Kconfig
@@ -42,6 +42,17 @@ config SND_HDA_TEGRA
 	  To compile this driver as a module, choose M here: the module
 	  will be called snd-hda-tegra.
 
+config SND_HDA_ACPI
+	tristate "HD Audio ACPI"
+	depends on ACPI
+	select SND_HDA
+	help
+	  Say Y here to include support for Azalia-compatible HDA controllers
+	  which are advertised via ACPI objects.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called snd-hda-acpi.
+
 if SND_HDA
 
 config SND_HDA_HWDEP
diff --git a/sound/pci/hda/Makefile b/sound/pci/hda/Makefile
index 210c406dfbc5..7a7c16d705dd 100644
--- a/sound/pci/hda/Makefile
+++ b/sound/pci/hda/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 snd-hda-intel-y := hda_intel.o
 snd-hda-tegra-y := hda_tegra.o
+snd-hda-acpi-y := hda_acpi.o
 
 snd-hda-codec-y := hda_bind.o hda_codec.o hda_jack.o hda_auto_parser.o hda_sysfs.o
 snd-hda-codec-y += hda_controller.o
@@ -80,3 +81,4 @@ obj-$(CONFIG_SND_HDA_SCODEC_TAS2781_SPI) += snd-hda-scodec-tas2781-spi.o
 # when built in kernel
 obj-$(CONFIG_SND_HDA_INTEL) += snd-hda-intel.o
 obj-$(CONFIG_SND_HDA_TEGRA) += snd-hda-tegra.o
+obj-$(CONFIG_SND_HDA_ACPI) += snd-hda-acpi.o
diff --git a/sound/pci/hda/hda_acpi.c b/sound/pci/hda/hda_acpi.c
new file mode 100644
index 000000000000..3303cecddd94
--- /dev/null
+++ b/sound/pci/hda/hda_acpi.c
@@ -0,0 +1,325 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ALSA driver for ACPI-based HDA Controllers.
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/acpi.h>
+
+#include <sound/hda_codec.h>
+
+#include "hda_controller.h"
+
+struct hda_acpi {
+	struct azx azx;
+	struct snd_card *card;
+	struct platform_device *pdev;
+	void __iomem *regs;
+	struct work_struct probe_work;
+	const struct hda_data *data;
+};
+
+/**
+ * struct hda_data - Optional device-specific data
+ * @short_name: Used for the ALSA card name; defaults to KBUILD_MODNAME
+ * @long_name:  Used for longer description; defaults to short_name
+ * @flags:      Passed to &azx->driver_caps
+ *
+ * A pointer to a record of this type may be stored in the
+ * &acpi_device_id->driver_data field of an ACPI match table entry in order to
+ * customize the naming and behavior of a particular device. All fields are
+ * optional and sensible defaults will be selected in their absence.
+ */
+struct hda_data {
+	const char *short_name;
+	const char *long_name;
+	unsigned long flags;
+};
+
+static int hda_acpi_dev_disconnect(struct snd_device *device)
+{
+	struct azx *chip = device->device_data;
+
+	chip->bus.shutdown = 1;
+	return 0;
+}
+
+static int hda_acpi_dev_free(struct snd_device *device)
+{
+	struct azx *azx = device->device_data;
+	struct hda_acpi *hda = container_of(azx, struct hda_acpi, azx);
+
+	cancel_work_sync(&hda->probe_work);
+	if (azx_bus(azx)->chip_init) {
+		azx_stop_all_streams(azx);
+		azx_stop_chip(azx);
+	}
+
+	azx_free_stream_pages(azx);
+	azx_free_streams(azx);
+	snd_hdac_bus_exit(azx_bus(azx));
+
+	return 0;
+}
+
+static int hda_acpi_init(struct hda_acpi *hda)
+{
+	struct hdac_bus *bus = azx_bus(&hda->azx);
+	struct snd_card *card = hda->azx.card;
+	struct device *dev = &hda->pdev->dev;
+	struct azx *azx = &hda->azx;
+	struct resource *res;
+	unsigned short gcap;
+	const char *sname, *lname;
+	int err, irq;
+
+	/* The base address for the HDA registers and the interrupt are wrapped
+	 * in an ACPI _CRS object which can be parsed by platform_get_irq() and
+	 * devm_platform_get_and_ioremap_resource()
+	 */
+
+	irq = platform_get_irq(hda->pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	hda->regs = devm_platform_get_and_ioremap_resource(hda->pdev, 0, &res);
+	if (IS_ERR(hda->regs))
+		return PTR_ERR(hda->regs);
+
+	bus->remap_addr = hda->regs;
+	bus->addr = res->start;
+
+	err = devm_request_irq(dev, irq, azx_interrupt,
+			       IRQF_SHARED, KBUILD_MODNAME, azx);
+	if (err) {
+		dev_err(dev, "unable to request IRQ %d, disabling device\n",
+			irq);
+		return err;
+	}
+	bus->irq = irq;
+	bus->dma_stop_delay = 100;
+	card->sync_irq = bus->irq;
+
+	gcap = azx_readw(azx, GCAP);
+	dev_dbg(dev, "chipset global capabilities = 0x%x\n", gcap);
+
+	azx->align_buffer_size = 1;
+
+	azx->capture_streams = (gcap >> 8) & 0x0f;
+	azx->playback_streams = (gcap >> 12) & 0x0f;
+
+	azx->capture_index_offset = 0;
+	azx->playback_index_offset = azx->capture_streams;
+	azx->num_streams = azx->playback_streams + azx->capture_streams;
+
+	err = azx_init_streams(azx);
+	if (err < 0) {
+		dev_err(dev, "failed to initialize streams: %d\n", err);
+		return err;
+	}
+
+	err = azx_alloc_stream_pages(azx);
+	if (err < 0) {
+		dev_err(dev, "failed to allocate stream pages: %d\n", err);
+		return err;
+	}
+
+	azx_init_chip(azx, 1);
+
+	if (!bus->codec_mask) {
+		dev_err(dev, "no codecs found!\n");
+		return -ENODEV;
+	}
+
+	strscpy(card->driver, "hda-acpi");
+
+	sname = hda->data->short_name ? hda->data->short_name : KBUILD_MODNAME;
+
+	if (strlen(sname) > sizeof(card->shortname))
+		dev_info(dev, "truncating shortname for card %s\n", sname);
+	strscpy(card->shortname, sname);
+
+	lname = hda->data->long_name ? hda->data->long_name : sname;
+
+	snprintf(card->longname, sizeof(card->longname),
+		 "%s at 0x%lx irq %i", lname, bus->addr, bus->irq);
+
+	return 0;
+}
+
+static void hda_acpi_probe_work(struct work_struct *work)
+{
+	struct hda_acpi *hda = container_of(work, struct hda_acpi, probe_work);
+	struct azx *chip = &hda->azx;
+	int err;
+
+	err = hda_acpi_init(hda);
+	if (err < 0)
+		return;
+
+	err = azx_probe_codecs(chip, 8);
+	if (err < 0)
+		return;
+
+	err = azx_codec_configure(chip);
+	if (err < 0)
+		return;
+
+	err = snd_card_register(chip->card);
+	if (err < 0)
+		return;
+
+	chip->running = 1;
+}
+
+static int hda_acpi_create(struct hda_acpi *hda)
+{
+	static const struct snd_device_ops ops = {
+		.dev_disconnect = hda_acpi_dev_disconnect,
+		.dev_free = hda_acpi_dev_free,
+	};
+	static const struct hda_controller_ops null_ops;
+	struct azx *azx = &hda->azx;
+	int err;
+
+	mutex_init(&azx->open_mutex);
+	azx->card = hda->card;
+	INIT_LIST_HEAD(&azx->pcm_list);
+
+	azx->ops = &null_ops;
+	azx->driver_caps = hda->data->flags;
+	azx->driver_type = hda->data->flags & 0xff;
+	azx->codec_probe_mask = -1;
+
+	err = azx_bus_init(azx, NULL);
+	if (err < 0)
+		return err;
+
+	err = snd_device_new(hda->card, SNDRV_DEV_LOWLEVEL, &hda->azx, &ops);
+	if (err < 0) {
+		dev_err(&hda->pdev->dev, "Error creating device\n");
+		return err;
+	}
+
+	return 0;
+}
+
+static int hda_acpi_probe(struct platform_device *pdev)
+{
+	struct hda_acpi *hda;
+	int err;
+
+	hda = devm_kzalloc(&pdev->dev, sizeof(*hda), GFP_KERNEL);
+	if (!hda)
+		return -ENOMEM;
+
+	hda->pdev = pdev;
+	hda->data = acpi_device_get_match_data(&pdev->dev);
+
+	/* Fall back to defaults if the table didn't have a *struct hda_data */
+	if (!hda->data)
+		hda->data = devm_kzalloc(&pdev->dev, sizeof(*hda->data),
+					 GFP_KERNEL);
+	if (!hda->data)
+		return -ENOMEM;
+
+	err = snd_card_new(&pdev->dev, SNDRV_DEFAULT_IDX1, SNDRV_DEFAULT_STR1,
+			   THIS_MODULE, 0, &hda->card);
+	if (err < 0) {
+		dev_err(&pdev->dev, "Error creating card!\n");
+		return err;
+	}
+
+	INIT_WORK(&hda->probe_work, hda_acpi_probe_work);
+
+	err = hda_acpi_create(hda);
+	if (err < 0)
+		goto out_free;
+	hda->card->private_data = &hda->azx;
+
+	dev_set_drvdata(&pdev->dev, hda->card);
+
+	schedule_work(&hda->probe_work);
+
+	return 0;
+
+out_free:
+	snd_card_free(hda->card);
+	return err;
+}
+
+static void hda_acpi_remove(struct platform_device *pdev)
+{
+	snd_card_free(dev_get_drvdata(&pdev->dev));
+}
+
+static void hda_acpi_shutdown(struct platform_device *pdev)
+{
+	struct snd_card *card = dev_get_drvdata(&pdev->dev);
+	struct azx *chip;
+
+	if (!card)
+		return;
+	chip = card->private_data;
+	if (chip && chip->running)
+		azx_stop_chip(chip);
+}
+
+static int hda_acpi_suspend(struct device *dev)
+{
+	struct snd_card *card = dev_get_drvdata(dev);
+	int rc;
+
+	rc = pm_runtime_force_suspend(dev);
+	if (rc < 0)
+		return rc;
+	snd_power_change_state(card, SNDRV_CTL_POWER_D3hot);
+
+	return 0;
+}
+
+static int hda_acpi_resume(struct device *dev)
+{
+	struct snd_card *card = dev_get_drvdata(dev);
+	int rc;
+
+	rc = pm_runtime_force_resume(dev);
+	if (rc < 0)
+		return rc;
+	snd_power_change_state(card, SNDRV_CTL_POWER_D0);
+
+	return 0;
+}
+
+static const struct dev_pm_ops hda_acpi_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(hda_acpi_suspend, hda_acpi_resume)
+};
+
+struct hda_data nvidia_hda_data = {
+	.short_name = "NVIDIA",
+	.long_name = "NVIDIA HDA Controller",
+	.flags = AZX_DCAPS_CORBRP_SELF_CLEAR,
+};
+
+static const struct acpi_device_id hda_acpi_match[] = {
+	{ .id = "NVDA2014", .driver_data = (uintptr_t) &nvidia_hda_data },
+	{ .id = "NVDA2015", .driver_data = (uintptr_t) &nvidia_hda_data },
+	{},
+};
+MODULE_DEVICE_TABLE(acpi, hda_acpi_match);
+
+static struct platform_driver hda_acpi_platform_driver = {
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.pm = &hda_acpi_pm,
+		.acpi_match_table = hda_acpi_match,
+	},
+	.probe = hda_acpi_probe,
+	.remove = hda_acpi_remove,
+	.shutdown = hda_acpi_shutdown,
+};
+module_platform_driver(hda_acpi_platform_driver);
+
+MODULE_DESCRIPTION("Driver for ACPI-based HDA Controllers");
+MODULE_LICENSE("GPL");
-- 
2.39.5

