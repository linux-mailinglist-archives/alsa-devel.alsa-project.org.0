Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2D8AB8805
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 15:32:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08A1B6018F;
	Thu, 15 May 2025 15:32:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08A1B6018F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747315957;
	bh=RlXdQcbWEohjskl0/4v+tfl/SFDH1BDXeOG+VSHbAr4=;
	h=Date:From:To:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=s4h3xRgyAqSOdaiHTjV6Vpi0upDUsWVkCBcMRptmYJ6BDwK567I/GvLRLBzYb622a
	 nYdtQL2GIZnYB8QKZA6BeU+u/ijzUt3+t5885gj/mfekQHB3f0p9AXrJ+UfETuzutV
	 Klm59HYh77bSdEJmAJLYJjhI9I5BKJPDCazNEGTI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BAE3F80154; Thu, 15 May 2025 15:32:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F0A88F80171;
	Thu, 15 May 2025 15:32:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11D6EF80075; Thu, 15 May 2025 15:31:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::610])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A40FFF80027
	for <alsa-devel@alsa-project.org>; Thu, 15 May 2025 15:31:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A40FFF80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=PgjWgOrx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E6d8Uq5QS/wYhGsx1Ovh6R9KnQa+k1ZAoTIDxVUCNqHofwAHoUU6MXMhfR6FaE7BOa8TfjbOoaZ/jIaFTSMtet6epyJFfkQoHmlPamddXu+WKD/hrfH1QGL6NvRHaJZ7Xtxjk4luYFfnIXyohMmQ4RgKQrwBWxi0iGGJ2Gk3DCTAE5GJ9u8mRmqP1hJOCrT9nPGNIy7kMi5Isrig0EDlTKHUaV7aSsjNAVsNEsYT214esSpEKKOgg0dYjcW5762UZRSGh+wBEGPqrcyxnvo6tcx1Q3gUtdQhxQ7aQS1wEV8PTrPTplnkZ3NzqSeixHgI6yGk+vCjKddJyMGBf8Jd/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNCDoiv8R5h09pTGCtsCSRU8hj1+lajarMq/MCe6uHs=;
 b=m3KVzdTclNjtkIQps+wA/czI/Hqh8WOH3mMbgrD/oicxX8ZYvUSxVFA8UTj5qIEIfWCHOtKtZNjRXAJQVReN8JE4KlZLXCMnzxmnm8rvLsaZgSSkyLi+/Sg60ZhLyKCOmEEruv6ZPTpxvvUB0w15yR+PMaE6A8USdQWYY7oJZRLb/xdiT0xsoYpUeK1YBmuVmW3mKEdc78pcD0oEsKyv7MFFdHm/DqeSWtbZp58dCiXdRSFWtl+uV1XrKKnezVhx2xiKf1DIdWOpveJCvgvmg13/TTic7Vj4uqSifath22c0eVqR4Uf5peMEDtNYOQbKN0IziOaqwB9wPSPTESeZyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNCDoiv8R5h09pTGCtsCSRU8hj1+lajarMq/MCe6uHs=;
 b=PgjWgOrxDoruWRIv+eolfG0Ye9cr0Fr4mrWnUtQPi75WDUT5ZZhZCPBOqhBJlmZ804XLYyXFo+3yj4sVZpr9FQ1wpKWKyzm7NRC4WCj1vj8zJpx23eOgNQioYuBaO3IA5cKLIQQpxN7IZzgfXRuIUD2osuTFTNWvb7/tIJip+V0EKXgb59yRZtbYosvqATdQ1Hm/RKTJyQZRMvqk9kSZ25Hb6Wk77G/jR1v5b0hSSIFmRWl1F4ySMPpj2LjXvvSDYd1iMiSakDjXZpMdgxlP5gt64WZ9MBff8Yt+ZMcBd3mVcHNeIda/RiVz/XXuUdoi8z1141XLgjKhNdO35e1cEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8422.namprd12.prod.outlook.com (2603:10b6:208:3de::8)
 by DS7PR12MB8347.namprd12.prod.outlook.com (2603:10b6:8:e5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Thu, 15 May
 2025 13:31:49 +0000
Received: from IA0PR12MB8422.namprd12.prod.outlook.com
 ([fe80::50d8:c62d:5338:5650]) by IA0PR12MB8422.namprd12.prod.outlook.com
 ([fe80::50d8:c62d:5338:5650%4]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 13:31:49 +0000
Date: Thu, 15 May 2025 08:31:46 -0500
From: Daniel Dadap <ddadap@nvidia.com>
To: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda - Add new driver for HDA controllers listed via
 ACPI
Message-ID: <aCXswg1gr6cufyzp@ddadap-lakeline.nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: SA0PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:806:130::13) To IA0PR12MB8422.namprd12.prod.outlook.com
 (2603:10b6:208:3de::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8422:EE_|DS7PR12MB8347:EE_
X-MS-Office365-Filtering-Correlation-Id: 17aebd85-965c-4a6f-5e38-08dd93b4d854
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?559+W1/iCwo5cR8ZfCY/4JCcwHGWRg6o42UItXd8ZfrJI5ASbDTZsHjTvzQC?=
 =?us-ascii?Q?4dcVZUbnPpP+vjLKX3brXXjCLcC/my6Ia1pEhEIsrh5KEaookWbXqVVK8vGh?=
 =?us-ascii?Q?qluPFEpwBO42IHnbhc9cAJDfjObo3031yFKIJTzZwCVff9dXylDOmd69idQ7?=
 =?us-ascii?Q?t5lKLZntevtPM8yWcKW80v3XsXh50frctSCUc9pKo1VQjuuEnkx5qJ7qroXv?=
 =?us-ascii?Q?5F0Ju99uQj/pVy2fiMt1FWxcDHR1UYCu/YeWKqQIOShZfpQ13TCzHJrpX4UU?=
 =?us-ascii?Q?rMt6OI8/rG6PHsG+v6r/BouD1G00tRQhp13qZyWv5NJHrsPLL747l+9J5Mg9?=
 =?us-ascii?Q?ei/DnWfuSnz7Jys1yQawRtVRUqCvq3dRJVqO3EA3eCZMEAQyd8uf6P9auwaP?=
 =?us-ascii?Q?+oo70qimonrjTbQkUroA0XNKhwdeUbZ8Fe2Y+R4CTSMXG4fzLzZUuxx9E5rp?=
 =?us-ascii?Q?Drmqa5js+oHEFOj4JndB810pC/GgmMlkH+nOoWUK7TY6jPNqsJKjNAwq+nVW?=
 =?us-ascii?Q?3Qrh2E8FeVYQ9EAmTUL/rqhy5o+dLHzfvjpuUQVuIQeI8xqZ1cEhr2Fs6c16?=
 =?us-ascii?Q?KbUdWwfk2XSNT/ZX9BuQeSh/kA2qUV2dOxr7XwlWg2tqeGnwaUQaRE86+ezR?=
 =?us-ascii?Q?IOU3y2I2E5Dqn0FIbCVUTfjTSwXhhYJE8fyPBgQJsXY+z8wdO70xqf2LlYfm?=
 =?us-ascii?Q?1yOBJ5WHKFG4eq7revPMp8QCPBsuTsJ+OrKFMTnzpR+kbOZOzDxcDyC45ghN?=
 =?us-ascii?Q?3S2dP4cTIQg9Zf3JmTnk/X1Tkns5kfmw6BG/V5nuIUvF+XOA6HmATeD0KoC6?=
 =?us-ascii?Q?LYSu/GueYJhxb+aPM9Lip/TLS5IQteAs4E9OYMZhKHfXcpJnnmq1uFPjrVkZ?=
 =?us-ascii?Q?Olf875ea2CSwFYsld1iZoN051gW44mvp0F50Tq8A5JZ7gr7x2TKdF64WW13P?=
 =?us-ascii?Q?7fs2EcK8g3ISTmvSoXjBIOqDcWRZFFbn6yIpNF2DD3wOIrkhV0IjO0G79AE0?=
 =?us-ascii?Q?EDbFOIOQnLswd+CI4Qr372SZV3PUpnsm34UNb98S0Mwzi67X2fZwJcmYuk3E?=
 =?us-ascii?Q?pMq32VvYMUb8BNjeylM8jAyJJaxDyK+nw1MC/7r/5lMA3aL02G1MXV2faS14?=
 =?us-ascii?Q?JE2awW3OTZRE5OCj413bx/2KfsNq+tkQewYketA1iOZBtSFlIxyCAIAuGJqe?=
 =?us-ascii?Q?doX0PXux/8F5FYrUqI3Yb0gIi0LesPozIcNxiydLcrHvCjxnr9n8+K3roXQk?=
 =?us-ascii?Q?r8DwqsgPLUfXORetUqwUSvlPMxmq6hVvpgrqarsPYXbu+4r7dX+lBenOXvog?=
 =?us-ascii?Q?zodSKN7eFW/oHK/zG+LheVjdWSMVrW0afMTs7hjOWHqSR23+ILW3P16G9RXa?=
 =?us-ascii?Q?7I5mISzzbThtcGwK/QXDTsPqxJmZggjrYvixCmvwzdUNrwV07yfC3WA80zLk?=
 =?us-ascii?Q?i6b3WYSaeXQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8422.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+Kk8fIIgL77Xccz16648rCOc23lw/hJw5z6ae3MVaFuSlwSgIxZPHFBOvaC0?=
 =?us-ascii?Q?I90NokpfbkL1iPKsl/km2foa2T6SDgChHG7p1Hnh/qcC5I1KdWs2TPe9nkAQ?=
 =?us-ascii?Q?3Bb904pF+FMGBjBVxnPqyb+rtYqGTcecSKnNJB0ReneUwyg/beurtNy+WCFN?=
 =?us-ascii?Q?dmmcDd73msUgQm2TV0AdDt/Gii6HfMjz15F84qKOtnmfDF5If8bRJWioiMEE?=
 =?us-ascii?Q?YFlTw7t1D3hFxlG8X6ZW7EWnG4nPC4aDzy+ahfdKtH2ORo/xssUAcijXQ5aD?=
 =?us-ascii?Q?bCkMLZtXxqA6dyrIowp1SOBt36Z2iL8FoZ88SAWEth1l36W5dwkJ6rMLr81K?=
 =?us-ascii?Q?HgDtW+bQdqoSENOajobptEZlZOtzDNjhN/ll9VWofz9InVx7KxFmxaYZg0Pk?=
 =?us-ascii?Q?5vEJgC4jIXT/3HUTNQcYxfrRXu6j2LSBk2iaX4bl4lrRwpa1CmVlYx5TmtFT?=
 =?us-ascii?Q?9DQP1uBQgI3Nmrzt0ezqK1orJQrsZ90kzmVTTaTcRTACTjDHCbtk2GHOFw7M?=
 =?us-ascii?Q?wOcE3fvtyd5hsimRSIgPTBF2bwIK15glCK0MhaRbHmlvkarT3kmznSa2KI+p?=
 =?us-ascii?Q?fjknOQTgodDTnkFF0GTgE9K1/Jc+/Vd5z+nd2LerbFKfpeFN3HOChKGIoDE2?=
 =?us-ascii?Q?Boxd2LLYqRPvsc2WAsbHRWWqzUL2CJ9dnzahagfoR4ajAB//8Nuaz45zRRxO?=
 =?us-ascii?Q?wEMHOyLq010yCTt1TFqhgBDr+jzu0QTRptIQO9A6zmMrnIavNNDEphbOaXYg?=
 =?us-ascii?Q?Rv/TvlLUB/C9gUbXJnfFHg+sALjzj0/0zoJhYt+DLhvSAOz9k4nzU891bshk?=
 =?us-ascii?Q?+MT6uQm6Sv/luA2UCxiYuXQnopGsg2hrLeeLGwAwWTTZXrM4JsI9nYgoe4aB?=
 =?us-ascii?Q?bPlcoNA2Af0VGSt8gygGeC5+B8zcw53KPmEHfVlI+jBpvxNnEBtxD50FMcUY?=
 =?us-ascii?Q?mhxmAiSDq7a9Wl/3d4C9OHbYBlnw8y/yttpKJgWDB98mTzjFJ4Ul2LcC4rqt?=
 =?us-ascii?Q?VmH+r0cVZXm2AeTXjh1vCJ/l7aLRx1GuVh9ghgrRhsQRTNCYsdYTdbVKdyCS?=
 =?us-ascii?Q?t4cpxEW9gCDtauD87Q6CDwJUGkZuAZmTqjvjBRjVZ4vTGyFC3gE5HnApqy0Y?=
 =?us-ascii?Q?aJnZqJC9mdNNzwHsEvO1l0qOynjPxoyg0HDwLhZlngYkDcEFTVMC7SphJzAs?=
 =?us-ascii?Q?NwvTYeJGvoQBf0CN1RodzHqD6XSZuynRf+rx0kkFk7YjGgJgLYDDsXWyTXgF?=
 =?us-ascii?Q?2OF4/hNqUHC8JZaVeeFofszKVe3Kz2sSzpG7Yt03npYhsXnATn2x4Cd8U25c?=
 =?us-ascii?Q?u/a5w3pmWEhYZIrIdL/dAcOW3R4wMG6RugiC3RJ1qFY15SuzOyFqEPmJ1dos?=
 =?us-ascii?Q?/Jexz7XCFT6QhbsYBlLF920tYqGqE0r/pBr0IKJa2aGWSrK78grHsZlUV31p?=
 =?us-ascii?Q?MZSN5Gs4nmpnJr1P9kqG/zmy4lbATbS5wAZSFsfbYMI0g62QGIAG5qCwI1Tx?=
 =?us-ascii?Q?GaYnR0+QdkFJBfDRvf0ihbA5XljH6dXpBYcQnPO8dyuWykAA8X8yxjusURcB?=
 =?us-ascii?Q?ynFz/LS7K8KbT9by7milXB5iskPjOB6vZ5uhC+jC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 17aebd85-965c-4a6f-5e38-08dd93b4d854
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8422.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 13:31:49.2004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 TlpvoPRxkojnaBzJzZ11ly+jKQaAv4PhnDdIQf7Ba4gPAYvYzSm11OaBNcxYQGuG8i2SeWvCdEylAxgYRo919w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8347
Message-ID-Hash: MVJ2NQRZ3IDZSKDXOLHMARVVA5APYAF3
X-Message-ID-Hash: MVJ2NQRZ3IDZSKDXOLHMARVVA5APYAF3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MVJ2NQRZ3IDZSKDXOLHMARVVA5APYAF3/>
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
index 000000000000..736eac59eaa0
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
+static int __maybe_unused hda_acpi_suspend(struct device *dev)
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
+static int __maybe_unused hda_acpi_resume(struct device *dev)
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

