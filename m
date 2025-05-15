Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC62BAB8B46
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 17:48:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28F76601A8;
	Thu, 15 May 2025 17:48:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28F76601A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747324095;
	bh=98NOJWxTmrFlffVEfpC3MDmJukfawyfKokjYnuXbJWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pdsG5+mF/yWtAkfbj2AYkLC/Bc3M1VQrwTxmtB7J8s8OKhZKwbui1Kbn2M7zshRHU
	 OVbJsgkDk4VXYGtcugLpdM6/kuq4teda/Gqti0JahGdMOQOE8Az4m2ONR4Ags8XK9D
	 7Ef9ISm1+Wp+wlpEhhwtRR20j54YIjMDXV4lFz5s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 506EFF80154; Thu, 15 May 2025 17:47:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B94CF80149;
	Thu, 15 May 2025 17:47:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2509F80075; Thu, 15 May 2025 17:47:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20618.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::618])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 966A4F80027
	for <alsa-devel@alsa-project.org>; Thu, 15 May 2025 17:47:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 966A4F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=NSN6tcQx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NA6DG6u/41ScJkQJuVPPENmXBJF1Q9xYkQ8fD0syqm2LjlDFZxl2vrMndyfUctLd0Ik/FGRxzfLL/cD6g7yRs9qZ5JW29GjOFZSUaFzqHas5wSeEyhllBnGQ82GW90GP1LStE5kf2+0Xu/ohrfEkyGtjJXsJsDgD514Qkr3H95cNEQ3hRBw4gBWihDpOt9QfHyKw1aAefm3audrHHp6QHBVG4+/jrAic9hTlJUM6MBMH7dFy/uvt3YMDf8FZ/msmP2T8whL48W9Hn6r0Pg6UPk2I6BihLhx0RP5vZ5e38qpW9FWh7aIhc5VmNpU/CgeS0FKLls7oAFbSuCWHzHcFSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hO8U7L4s9cU3ACLCRLmh0spN1z2yfXmG7ZAVTFC+EP0=;
 b=rijQ+9lzR6N4DIdCpGF+xiJSOlphRjPYumfsk9yhuLX9HIuMY8pGT6mqTyX3f53qlfAsQptaKiG0iVJVhJ2XIn/4mPWCTTGfpfBKSwlMg5cPU2bZNvzFo7uudyH1UoNNJBIsopO75RG7lzkO5Y2nBzis2/CNbw6Qkf0Ntvcgw1hNMB0SMx+o58CelvpiL4ZjYnEhHAjB3CvBx4LlLjRQuMNYVJT2pehoXwtgvHEYlvACbiXwSAyyCEigqh18w5VoV5b7PIiMjSgu1PaATWPMM3k0qq+p0wPZoLLhE9i0qoc4vS33igGFgE1HADmspljBu7EHZi7j7a/dGf5WC1tLPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hO8U7L4s9cU3ACLCRLmh0spN1z2yfXmG7ZAVTFC+EP0=;
 b=NSN6tcQxOSp1WbMnMV1GXqGLLVFsThUFGSPc7tStYrSbHRGL3Y/2NuG5DF8vx3i3WZBiVYA6id9yDCSOdnP7inJ1aGfZ6CW+lw5enseNTHfY/9qywU9alS2jL6PB8zejCCFsPALUmW745OFPwTKE9Mr6WH7E1roa5A5VWNouMAPdIaEmTa5dPDjRxWY27JrRu581nI+QtIAflpKL1I3hStD/MzKhMEYM4hUHnCyBB/fP6zj5ZrKRFuC3tT2h7gVKeEvdqNxT/+ffYmkFYOynkowgbxrvrEaIQu259pA1Upsh9jPNXQsz+Yov2eA32O88KPQ6pfd2AEFKfOSOHcwITg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8422.namprd12.prod.outlook.com (2603:10b6:208:3de::8)
 by PH8PR12MB6724.namprd12.prod.outlook.com (2603:10b6:510:1cf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 15 May
 2025 15:47:28 +0000
Received: from IA0PR12MB8422.namprd12.prod.outlook.com
 ([fe80::50d8:c62d:5338:5650]) by IA0PR12MB8422.namprd12.prod.outlook.com
 ([fe80::50d8:c62d:5338:5650%4]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 15:47:28 +0000
Date: Thu, 15 May 2025 10:47:25 -0500
From: Daniel Dadap <ddadap@nvidia.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: [PATCH v2] ALSA: hda - Add new driver for HDA controllers listed via
 ACPI
Message-ID: <aCYMjYrfFIPjN9Fi@ddadap-lakeline.nvidia.com>
References: <aCXswg1gr6cufyzp@ddadap-lakeline.nvidia.com>
 <87r00qx78f.wl-tiwai@suse.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r00qx78f.wl-tiwai@suse.de>
X-ClientProxiedBy: BYAPR08CA0017.namprd08.prod.outlook.com
 (2603:10b6:a03:100::30) To IA0PR12MB8422.namprd12.prod.outlook.com
 (2603:10b6:208:3de::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8422:EE_|PH8PR12MB6724:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ee4c922-93dd-4325-a5b1-08dd93c7cb8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9I/N+3eFT7cKClmPO8BF6b8ea+/RqQe1ilFkR70U66XZAvSotlSkwvaSMCIa?=
 =?us-ascii?Q?A236/TacTpWu7fvf06b3lw5F1NKpjFH7c7zvq7HarxYUTHmn/Dtbk/zdSzsC?=
 =?us-ascii?Q?apgkg2tKawcee7oeTbOyvr6uYS4DuRzFx+1dEadj6+41n2eP9mS3G6aDbTh8?=
 =?us-ascii?Q?8Wsi+Q85dqu/DhbefMGtaPoE6sxwdY2RvAysYS2uhLdaJIlnhdfWhkVRTuEo?=
 =?us-ascii?Q?qOVT1ZI8UQczV/yMH5j2tzYcJI8gTzKc8XDKu2B2D/CXD/8MYJdn+yhax9kN?=
 =?us-ascii?Q?NR9jaPMFeBq8w9XpRr8tJJZukDuvVBpjvExLAuxp66StdBsi7MOeAufi6Jnr?=
 =?us-ascii?Q?0OIx6KhVZLT3/eMmroLTBdTwb73EJ6UtFVyjiZQ7vDSNQNSydwPJRzELixxK?=
 =?us-ascii?Q?AMfFnqlaO6aPg+QO/26hhr6v/fGMkmofLJp8p0HejDAyxxCU97whxj3528TC?=
 =?us-ascii?Q?YW/5K/LKVHrnUo6o3HfuqvE3TzmYBaKVZWw1torV2cme5V41AKO7RWjFk5mh?=
 =?us-ascii?Q?egFUn0FJICJ7/lvkB8ijeCG8zvIMx5X56LlP+08mv3rFXgeeyH0UPAgL/ai8?=
 =?us-ascii?Q?IAaROwxj98eaEJOJlPRMb436VctCtVsTLQizN6EE1qsl4cGrC259WE+l3q5C?=
 =?us-ascii?Q?sY7JREzQLvRmbJP6LbaVAsLMLE7kGitEEFr1GEYm/9XdIan8zbiCf9UJI7t8?=
 =?us-ascii?Q?NRnX5ZkmAMItvv1NnWpsZuKO6h6rYiFzpxsMiE8QLTkviqfvTeD/JuNsqFpi?=
 =?us-ascii?Q?9YE/eOe6vIMVvkb3zIlC4n2bqMt5DNyHfKVwBgZWTENVl6i0y0hwj82TQ5hm?=
 =?us-ascii?Q?AdPBiYYuITZK95NxEYV3tdHglf4oq3ZQ3jDexaFQDrqJ8ujAQcKJ2dyZ4dRa?=
 =?us-ascii?Q?8PMMJRIpCvZGBmbKiMJyNkhKgwHC6P4vQOxdJQBdAN90LdCbdgAfocLB2j8I?=
 =?us-ascii?Q?sfx37+9+UjceMvG2pXEA/tWvMZOuVp11I+nFIxpLZeNZEYMjZIWN60j1mVbS?=
 =?us-ascii?Q?ojdlGZnf/QVLHuVpPzSO0q+YtRfdz4kANGCzzggiWQLe8710cITRnKo+K/B8?=
 =?us-ascii?Q?td9g3BYg7RW6JNNLqzqrA9r2KFbxyHifu/I8qn276ZcvT2JEU2GkeajzBtWX?=
 =?us-ascii?Q?HJvht0BYrbjwg9gXPVu6WW8XDCsVHYzE4tBvSIgDllzMXwQlvsNxawDHlHE3?=
 =?us-ascii?Q?ZY08GL3ZNrxsHTWKNLAkTnAizw2pydP9gGp6kKSwksuwdqSLYjduljGAEvWq?=
 =?us-ascii?Q?ZGBD0kcdX0Nmi+2+pIUxTqpsi1gzbgpyPSrvQjn3rxSIFdJZm84JS5GhsJ78?=
 =?us-ascii?Q?aaGxFQ2ds2mkmnsvEeHzqMe2mGzmYUQmacTdgtTYQ+w1gL0thNB6pveTNCPv?=
 =?us-ascii?Q?pRDWxhHauigXsdfxNWa/z63W0mNtj7UnfIumnXUqtH2jd/oFcBcxFh7hblew?=
 =?us-ascii?Q?lE7kaVkl2Us=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8422.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jBXrGXZbvwMy25QXx7KN13skxFh3a7RG8ko84yRQCaRPwY6YnUhvPUsoFgvn?=
 =?us-ascii?Q?EujMVL2uDF7d+/LuwKTSxDmjCNOpc5j6HWQC0NGtAd7DB0CVqy7xySaoVlTt?=
 =?us-ascii?Q?qqS3cxWhH872ti9V1skn0ShodKkBSw4013Lva0BNyJ3KZHjWvGUxXfLs9JT9?=
 =?us-ascii?Q?mN2zyb+QfFxnS7jPzLKWeHRAMmewZdIcC2GtA4wgvmln45si7m08A7SL6gFr?=
 =?us-ascii?Q?xQWL4DPW6KBkcKvK/ZhlST9Im2U9rzA1UbiO9+O6CEwOFOSBwhSuaLQ6XGX1?=
 =?us-ascii?Q?VjbRtbXDLc847+O1eRdjixPiLrvqzU8E6NjUKpVYlxFsh9hxGTSfaYFJoDdy?=
 =?us-ascii?Q?XYGi8AONzYNpJ1dqTUrzad+ELwii9uhuHpGbAxxVsXG7FB09hT2fGs3k3xYt?=
 =?us-ascii?Q?X4isi3v9sKaGO0Tyjs6y0xuP0BzIRlJMGOmSiRJWZpMBRFdOdtIIvz4Qp6i0?=
 =?us-ascii?Q?cve+R0z3J1cMa8IBCumSZHKUaQnhLRnHVqGutwrKQnMC2+rOahQBZ0W7v+t/?=
 =?us-ascii?Q?nfgw8oXYytBTlSpHofDSxD5eXFSN1pWDpkHEt/pPz2Xbs+n1104XhBL6ID8c?=
 =?us-ascii?Q?KZqrtnBIGeQZmhJ9eQ9/k4X2W3SUejo7hDanNY5RCzmvfwskkaVexPBPrVb+?=
 =?us-ascii?Q?xHdKLZmH60VDTt51DLOTZBdHQ7GJso8dN6U6iaTw//drvXuVMSuZ5d3ZvuL9?=
 =?us-ascii?Q?KVN0SjXpLZNDEk2qk7/zeui8gbUHnN9GAsSGeF0hY/sggkC2Zp4yuJ/Mvgbh?=
 =?us-ascii?Q?0BM0lW55ZtYt0sfZElnmHgNaY5UddoSDJzwwBMT83b+fNw1Hzy2wEJJSYqDe?=
 =?us-ascii?Q?ScrSc258sQ67KrT7HHNdU4s97XSyMX01iQnurzHmVyzvdSnjiYuI7xj+Cyze?=
 =?us-ascii?Q?Gjv1gkSHbxWjutqzKCilW2VP8sSX7JIcl38avHjbvHwv8AOYYoUIZLhMjj+Y?=
 =?us-ascii?Q?cLEzKxmz5YVb/utNaJ1Iq35ZBAU6lRrU4ukCszHCDmq5jHIaBpUOP2QIvvLS?=
 =?us-ascii?Q?cBcPDLto7KRd3+ckXdJrsyp/b3hfD6PkTeVrBtVhObX75W7/RV1HfjPb37u8?=
 =?us-ascii?Q?XVHPnqYRt9dzN/buEAeoqM8tQjj91KdMRNv3GNPzMX7TuIhjrNQ8dGkyk7Th?=
 =?us-ascii?Q?tA1pGid7P9Y47TEnqnu7yhWuLLYnsxuLorLRf2eJBcrsW5KHgGdcPFpROUF8?=
 =?us-ascii?Q?TIgnnH1NO40X+bMu03lI6s0tuhU8B39zwigVsITqoEO1HM/LiyfykMRM1PwQ?=
 =?us-ascii?Q?s+JwcO/pk7LlC5xvxhq6ZpLLrYm+C/Lu+UhgT1sQcW6UfhfBp7PRR6wqeLHT?=
 =?us-ascii?Q?ccXJDT6JCptaABdALJQESQghTeg1Pfe0ZFlKgtFWe+xb6zD9J1Vcw2X4FqQ4?=
 =?us-ascii?Q?RRh1lfTOiKffZfRMccOVd2XEcD4Z4Wt7bgdJP+x3/Kq++AmNFZgQrv+h9snR?=
 =?us-ascii?Q?KpSh6gp++gu+0ltbpBTbjueeIKms6oIrAB0gMuLydKAuGLjhCO0oKtbE0I0F?=
 =?us-ascii?Q?YnaJrTowF4aypcQ4zhED3QdYKbDgjl7pUDffejH8EspJXVpDRHNzr3esRphn?=
 =?us-ascii?Q?EkbE8O6kPdm6my+skHqw3jnXld33EmDKz5aMX3jj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1ee4c922-93dd-4325-a5b1-08dd93c7cb8a
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8422.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 15:47:28.1244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 3sN0B+E/NYr/jKqpYDxNqYPaRN4NqUm5gRKLdC07Vp9BFeHJ45HlkHjx7lHVTgJiybmD1q/PqLm8i4COJLYRFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6724
Message-ID-Hash: G4CJPK3D5NPUEH2TUCNAAY2FYJ5AFSED
X-Message-ID-Hash: G4CJPK3D5NPUEH2TUCNAAY2FYJ5AFSED
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G4CJPK3D5NPUEH2TUCNAAY2FYJ5AFSED/>
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
+MODULE_LICENSE("GPL v2");
-- 
2.39.5

