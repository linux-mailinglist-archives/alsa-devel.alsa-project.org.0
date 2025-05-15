Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE98CAB8B73
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 17:51:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A241601B9;
	Thu, 15 May 2025 17:51:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A241601B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747324298;
	bh=q9Gr6lj1zuZ8oIzKtFy2PNjyWdHK+VqX8o4XFNKcW2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gsdDbUWLk7T9DljCBsj0WpYdiYb3COGuAsHlPEbWRN8LOfKbmusbAzojXWkx8ff8I
	 uHt1+3QuK/SmpBqjfW62EaOhAOtHAKkDUW8Ly2v04BcN13+/Ju3TmMQIj9YbWJEMXf
	 JVFHwjOEh0gTrna2ktaT3Z6oyS1fEwiOoIENpNC4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38CF1F80212; Thu, 15 May 2025 17:51:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15A8CF800D0;
	Thu, 15 May 2025 17:51:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68F47F80075; Thu, 15 May 2025 17:50:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::60d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1CF1F8003A
	for <alsa-devel@alsa-project.org>; Thu, 15 May 2025 17:50:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1CF1F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=lJpQLogd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kMjc8A+H35Lxb1DTc5tmY12EDsYRvUxdJ5gE4kGwnPROQVmaebp6ubWOYTr5DW7jTQ+/kxZ98pgYesjXqP/Zby+o8UKSdvEu4v1LzIM5uc8bvD2BC4kjlbm5pH3bsqqjyL56rv2ZoG+m6SlC4SXPIPokUnRn8IEF9vjIg5KcHvo7K3T9pXH2xh6KxhMRaY+eZFQt4o6hmH7g88aazyTKItvC0cUoGtbJ+cLL4MMFwc8D6W5NXDR2elVST0akxq0O9hQ8Ed+pE1Ncj0iV/waoUUE9vcneYKWrY3guzDz49CZvxVLwZ9g0/LqRm/qpthXVbfcn4Y0eRnda35vCt/aMZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ct2m6hMRTmdBEwu9vJ6ZpHuU1VK56JV8lqgIdijBDb0=;
 b=nSacIybhy2FMbaHaQifJVSLbwTcpaXeoiBXG+RjIgW5sH9u0cIhJbmbzgtFrEZMgQFfgDM4dycMuvEbe3PU6OHCYJvthBoacFqPIWr8uK2m3/4hFwZgD/fzFZz/mTWnQ5k2pSeaRw5rCehWqyN1DPE1EpTXOwiOCHiBC361IuXoPq807/BpcjHLmnOuBCVwJyZiGrzI9zw+5Ce4qSerOllrp5HBen5GYEq3bsIPpRdeTkmG4PqkAqj9uPvV+VKRG5g3Ig5U7LoSzgfOW3R+3cV459aRZcPfuKgsYKRXWfOR/I9oMG47ypnYkrCmz48DQi3w5iwTkT2HrvYouxtoXTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ct2m6hMRTmdBEwu9vJ6ZpHuU1VK56JV8lqgIdijBDb0=;
 b=lJpQLogdShVh1+hMLFHhjk1tJ6+Lr9DBCc4MW4WJRh0lD5rc8B3Iwnb45iMrXUssQSt3tpvURzpwORSNfydowSb8bvOnvMSWEJdPk/OBWFeBU//QvRUDvzPfAOVnQdOjJztbzIoHOKDwSFOtDbGWb3HZefZAYl5zdvRrkKV0LqOxaZAQxbE/5LrNvtMQAJOmz9jsFP6VNPFEG+tdILggUNFLWZum/aWAzlEkvoaEIEQNGWZlQd87fCg8g+/lXPR5JdbnJbSvPiT4GxeNmyX7cl0tZ7X1DmpWs/7t423cc5jRS80F2oiEmlwsU6/hnLKYa8neYh5dB9pC/WWz6+ypBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8422.namprd12.prod.outlook.com (2603:10b6:208:3de::8)
 by PH7PR12MB5880.namprd12.prod.outlook.com (2603:10b6:510:1d8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Thu, 15 May
 2025 15:50:48 +0000
Received: from IA0PR12MB8422.namprd12.prod.outlook.com
 ([fe80::50d8:c62d:5338:5650]) by IA0PR12MB8422.namprd12.prod.outlook.com
 ([fe80::50d8:c62d:5338:5650%4]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 15:50:48 +0000
Date: Thu, 15 May 2025 10:50:44 -0500
From: Daniel Dadap <ddadap@nvidia.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: [PATCH v3] ALSA: hda - Add new driver for HDA controllers listed via
 ACPI
Message-ID: <aCYNVKxktWzGHR2p@ddadap-lakeline.nvidia.com>
References: <aCXswg1gr6cufyzp@ddadap-lakeline.nvidia.com>
 <87r00qx78f.wl-tiwai@suse.de>
 <aCYMjYrfFIPjN9Fi@ddadap-lakeline.nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCYMjYrfFIPjN9Fi@ddadap-lakeline.nvidia.com>
X-ClientProxiedBy: SJ0PR03CA0224.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::19) To IA0PR12MB8422.namprd12.prod.outlook.com
 (2603:10b6:208:3de::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8422:EE_|PH7PR12MB5880:EE_
X-MS-Office365-Filtering-Correlation-Id: 78010976-94e5-4513-6b1b-08dd93c842d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VxtwcfkDr7DyHCUj/VH/q1heVjHvWi02COuaLDcGuYl3BrKsZ8GnUU79lNAb?=
 =?us-ascii?Q?77BT0nDOoe/07R34QpcGEEX9bBqFXDg3y66bDBp4WFEsWAHalDoW5Xx3WpHp?=
 =?us-ascii?Q?Lcp3dQ+VoFbny5tazsMIhPbYh7fXT48EnXiv6G3dNIsgEYAptUHA7TseIhBR?=
 =?us-ascii?Q?KSJvOkFWmutTBucgbs21ZhgeK2Jz5EUHpMLrzuaKD9sNwEsJfX+H2k0E2O5s?=
 =?us-ascii?Q?wg+xcOuFeZL8cVPDy/d0KR69XfpKWHMRcMtPNGesTQA5ohCQqu0FJvcbqHJQ?=
 =?us-ascii?Q?8xbe+x/O7puOQEFhAycVo7uSBub5YC34LY106XYrrGQtaNwBs7IWP7OBlM0r?=
 =?us-ascii?Q?yRZvPcSz70AM3+I/QsiTU+Do4Jdd8QMkCAsb8IoroyYPkCbQvPKlDpQ17vZ4?=
 =?us-ascii?Q?qC1tlmVHFUMBoNnLX1ASfBZutOpkJUkGCpY6pf9QhNZmvUd0PliqloELUIvc?=
 =?us-ascii?Q?tQbba9PCQvSzqcFudBUgWJ2A47O4QtUCJdcJp221Z3bZEt+Y3AHzmEE7RSdE?=
 =?us-ascii?Q?KYIbDXQWp/1tHh1qkqtLUitFX3ECRhkK6uTXNdfRz6tdMb9lM7V689LLlNRK?=
 =?us-ascii?Q?82Xp2iSDIiZnANhSdF8vEzBtiKPlqJJRkeMm9x+f8QcTXlpiyLeKPlV/OkFl?=
 =?us-ascii?Q?kCuOgXZgfNEAqfd9bP0wNm+77V19p1uo9qRPMsz6BFN8wV0pH9lKcq90h+Cw?=
 =?us-ascii?Q?8Ha1DZLp7v8ugev4h8FI9zKmBf6vLF3/TtP8M6XDSIzMnyhEDS4pLlGuvx/L?=
 =?us-ascii?Q?YEvtuCDwH5HnNyiQ04dRgN73xGK9OaJ3Wh7DCUQAuiUrRoJh/A16b4KfTDaO?=
 =?us-ascii?Q?zfmt8RifkzfbCYNb7vZx0Vc7uA4HbD52JHMl696qBa1fRtxQ7HpqYxkRnNQK?=
 =?us-ascii?Q?xUfHH7nq0qUaRNL1MNn043xB36fOjm72QhoE4kO/P6Qfzx7x/Za1+PzU3YOz?=
 =?us-ascii?Q?vsGdCJaB4JyfxiPkB5px73pM9KoxOYwtezYRMewd9MGdmBzzdGGguwasO4E6?=
 =?us-ascii?Q?rjjZXjBU3AielZSu1FBowbVe2bbu+pOmUxSpHHRD/HIyAt4iPFhEw5BnUzC9?=
 =?us-ascii?Q?MBk3++h8eL7tTqHyns0vaFhbfhIKyUtYijyaO4101U/kNB7KSMZyhR11ibCC?=
 =?us-ascii?Q?3bJ+SKS0wWfphLapXTSruT2aRgFjukdicl3mxh7YcDMj7CLX8TwpXzWeKpOR?=
 =?us-ascii?Q?FLQOrkeXX4hklbfXdrNXncJ0Pkh5jrnttBjHrskMVIytUdjQSura58mS5vPZ?=
 =?us-ascii?Q?KkOtXrdZyfqzC1B326L6TCBs1GG9/Lu+qUFIrdFTqHkSNAlP6wmW6T8It9pZ?=
 =?us-ascii?Q?3p7MjuFIgVDl1SxYHrKfxtuQSLgYZUDEh2htA8PyRihzdQm4MbBJn+TwqLnR?=
 =?us-ascii?Q?FNqgTWxH8Qw5c6yrGkaL1LElsRRadM1xTkvDCDGg/NvxwWzvWBwGDpluhnk+?=
 =?us-ascii?Q?BuRE64j5TEI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8422.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CXPUXazeBHoYNtpfXkOJ+hektZUQfN1bl8L21Is12h2rIzHxp+H6gXkC9CIC?=
 =?us-ascii?Q?RL+dNs7WyLwWWGwk/aOA7kPGJ5V1iyJZv/ddWnTI9iKzNkgJe6OaoZDw1osU?=
 =?us-ascii?Q?H872DJQYpBF73nj6s4P1lYRiesBNtfKeqsCoBXf5OlEK/WRKrIpiinPDfr58?=
 =?us-ascii?Q?eg/5NyGU4YMfQo6sH1/sgu5hBmFcFJsSRePnI/Hynp+SNpDSYll8GgCgZEFQ?=
 =?us-ascii?Q?UFOYJY8ss9AagFJfE6ehN6jiF293fjXybD0Io+17RSWCQsZhcLmR0YNe/+Ti?=
 =?us-ascii?Q?Yf51qOct9107R5nvc8jnClkXYcB5zfviFTZ47kxP2yO65BMd0NIAzaOwhFPk?=
 =?us-ascii?Q?JTddaQoiTOOCx0yeHxkGbjO3FF6J31Gynzv4cVRlv3cG6qGjjTrEYCYPf1+I?=
 =?us-ascii?Q?ZMnwfrHwFTR7XEUOlO1hReuQgfRO5bHuKSopI41K7uNjvN4oLN34Gabm8G+B?=
 =?us-ascii?Q?KfhEjLz2fRiIBDjDFsz2BC9R160oWsjnpDDNkwGsh4xjGLYpzazMqh9EWtFl?=
 =?us-ascii?Q?FGDgwjLr9ZRRrLEX3HoDipPYFVol5HYYEGbWT+VZnV0jQzmbKdWkZX+WQtFR?=
 =?us-ascii?Q?7XlBcSt8VubZfhGTH0mwYgw1V4MjZdwnbeG+646rCZB4D2DdReDDLveIZxMm?=
 =?us-ascii?Q?fRpbTKj0H5Fti+yIdmRqYSzAxvo8eAdfdKI91cd7vfJBF3MoKRO/yzL1mbU7?=
 =?us-ascii?Q?pq7ysEX4ysv3AzyN735mL385Rus/7j/xSJTxSdXEQ3WwWC/RwrVeWYAPtH/q?=
 =?us-ascii?Q?T+j03LiytzzWp/N8TYc7nfub72h/hhHzVOvqkBvGyGZuuZFHQmBSmZQFvo3w?=
 =?us-ascii?Q?jIKW3SwJzbCG+kVB/XfqCtoG88qqF24PIA7TQRwRqeX0hV1zqnHiTnBxOzof?=
 =?us-ascii?Q?gau3O6itjFf+N5fUwTPRjD68c5GUHYqfhgeLe2CgVpa1SLGuvCwQ6CHmNMEf?=
 =?us-ascii?Q?CdvLhTB/JB0X5HHbOarQwtQajQ6tvLl5ysaxgCaV6p576kC62+Sk80qoU/zx?=
 =?us-ascii?Q?G75K8gXUBzGGPnPvY9fejTAInuE2rOBiisg30auDPPTIskGUoWGH4OEKgoD8?=
 =?us-ascii?Q?8ElI+nbV+hvcg0p00VPWtgJMajRVHlEJufMbS4rIv8mOdDvV86UZMzHwIunT?=
 =?us-ascii?Q?iwSWhR5i/WTPCTSyQIbLwPwc5N9zPnU1zsErh2rPfXnFWo4v8n9I+o0oySc8?=
 =?us-ascii?Q?xdrgJmeqz+NrrTRLRR1HFEGWCUUsQerblpm6oc2xxbHA0SZJcAv/ekk0aXw7?=
 =?us-ascii?Q?VDTM5ds+MluexJhVoygrWK2PPteSDwEcTsTq7oZCygW9ZcuRO9wYhr2jaLJ4?=
 =?us-ascii?Q?FtPCBRM0kYWPf7ZbNUKsdWJjhBSmyWrfBe1cZSS3DRsscuxYJ/nFGCY9RRbA?=
 =?us-ascii?Q?ODshyoh1Evlp1wMvyJ2THHoNMVX8p3AnpUv+fjXw+LC44d7Fx5s/VoxBece8?=
 =?us-ascii?Q?VWnSlyTfvptXrIM3QPAG3En2P55x1DAcSGCZvMF061VKHkcgUf+1+0zmQQ2A?=
 =?us-ascii?Q?NxG5oOU+6UPXTRHIUSqgNbG3Ne9i8bosFQ0qmOmKwYSUSoCEumCDgXdrm2PH?=
 =?us-ascii?Q?gbSHrLmRs3YKsIZ/bhyKEZQlRiEeE+OTg/Nf3M3A?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 78010976-94e5-4513-6b1b-08dd93c842d6
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8422.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 15:50:48.2209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 E4/9Y61TXRYuhLdGvtM5TDCZlyW+t+/QIs4+PB3lGSxYG7A5k0HHTeyTTUzXyt94gBMhIC5L6ka6osGLpa+z3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5880
Message-ID-Hash: J442Y5UD42FP6BOZWWWA6LNHM6NLAB4R
X-Message-ID-Hash: J442Y5UD42FP6BOZWWWA6LNHM6NLAB4R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J442Y5UD42FP6BOZWWWA6LNHM6NLAB4R/>
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
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                Memory32Fixed (ReadWrite,
                    0x36078000,         // Address Base
                    0x00008000,         // Address Length
                    )
                Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
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
which are not actually enumerated on the PCI bus. This is because it depends
upon the Intel "Azalia" infrastructure which has traditionally been used for
PCI-based devices.

Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
---
 sound/pci/hda/Kconfig    |  11 ++
 sound/pci/hda/Makefile   |   2 +
 sound/pci/hda/hda_acpi.c | 316 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 329 insertions(+)
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
index 000000000000..83b5a5d3baa8
--- /dev/null
+++ b/sound/pci/hda/hda_acpi.c
@@ -0,0 +1,316 @@
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
+	 * devm_platform_get_and_ioremap_resource() */
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
+	                       IRQF_SHARED, KBUILD_MODNAME, azx);
+	if (err) {
+		dev_err(dev, "unable to request IRQ %d, disabling device\n", irq);
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
+	strscpy(card->driver, "hda-acpi", sizeof(card->driver));
+
+	sname = hda->data->short_name ? hda->data->short_name : KBUILD_MODNAME;
+
+	if (strlen(sname) > sizeof(card->shortname))
+		dev_info(dev, "truncating shortname for card %s\n", sname);
+	strscpy(card->shortname, sname, sizeof(card->shortname));
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
+	err = snd_card_new(&pdev->dev, SNDRV_DEFAULT_IDX1, SNDRV_DEFAULT_STR1,
+	                   THIS_MODULE, 0, &hda->card);
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
+	SYSTEM_SLEEP_PM_OPS(hda_acpi_suspend, hda_acpi_resume)
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
+MODULE_LICENSE("GPL v2");
-- 
2.39.5

