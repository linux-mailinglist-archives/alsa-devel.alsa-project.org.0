Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E71CA5A300
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Mar 2025 19:34:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84FCE60723;
	Mon, 10 Mar 2025 19:34:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84FCE60723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741631660;
	bh=XxCjuslXCc2ql5URWPDPs8p1GxntprR7ltKe2NTRYO0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tPuJW9waz0t3bh9tfFDBUHXM7EbNTl6g3Rj3Pjavoi59cLx4rlqfD22KVKWrlzowp
	 BxLTURIgX8CLOYQiizkzOyA8UIuE3IWOOp0bRnOQNh6RC/tzAsV/Pyb78QgG8/cJZ1
	 K6+djnXlTmzvAkEfZ9fwBC4uxvDftM194mJ22xMw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86282F8067A; Mon, 10 Mar 2025 19:32:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 734D3F80674;
	Mon, 10 Mar 2025 19:32:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB1BCF80134; Mon, 10 Mar 2025 19:32:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2406::61b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 75CD0F8042F
	for <alsa-devel@alsa-project.org>; Mon, 10 Mar 2025 19:32:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75CD0F8042F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=BfZjungu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EYBM3JlBu/TPuj44VKUdq91WMmHhFawnHLWLKZwW7natvvVh95Ap93vBmieazv8X4Ica1rwAZ5eAY8R0pJg5p7J5IpzRyy6fgYCqkX5rAF9YRpbM1fMA/wnYQt8WBz5+V65rotlqyTYCRtqneLbm3eOjwTwCVZ3x6havFSJn+MhMOGTbL2VStAfRgQCX6hsupBwIbRFY7FcNlsfCrA9UDSqfMVlSPMFZFXdpV/2k0Hl3VAalD1nIS61KSDTK1KubjEU89rUdzMn4vv3BN/cRf7DrI8fseIda+Pa2ZacKklbekdDq8Ta2++W1TUFsXbz8nT3n2kxPrIUxTbEexRMbHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zfPRNCdFcMMSkANBdPgi+1qdzN1XA4svbD3D/V0GteM=;
 b=XdChk8pm5UbV6f0JaUFjYIHo4eSJUq2lxdTp2ZiCPl4ON9ovbJRS0beseayhs9FMugum6Cz2YsMVKTaqSeCrX5C5cE1voGyjAjVa6Sq8tBTdlv1NQ4IyOcWo0dNmchTiTIoeQR+tGbjm0xDuGJjDMdSfWNkTe39AX70QZ5dQ97zZ6R1DGxZLNV9+t+o+lX8OIeCCAAvD3xQZqt/Ap+lRodM3+ludJALWiOyI5yShXjWyEeo7KCqd6ZbqipCW6ZWyQMVNp7O8M9+lL+kl3uKrzeo7ub0zgbOMgmVoBOsHd0e9IzzLsxr89fcrgc42yaG8AyRbtMvtCiXzie8s8UGDmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zfPRNCdFcMMSkANBdPgi+1qdzN1XA4svbD3D/V0GteM=;
 b=BfZjunguFIVOUfd5ycwp6oePoUcpPznF4paz9WUpraGnPsbQfqpQGLyGv8wm/bRNQqYhTTx7TIQyuZqM7xZCuBaJzx763UZEl7xUuZVEZal4YMy1jCQkvNZCcH8O6WESNdlfXrkCNM+21tBFSkxpwuEvDY/UnWKDF51PVN4ByAc=
Received: from MN0P220CA0023.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:52e::27)
 by PH7PR12MB5594.namprd12.prod.outlook.com (2603:10b6:510:134::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 18:32:39 +0000
Received: from BL02EPF00021F6B.namprd02.prod.outlook.com
 (2603:10b6:208:52e:cafe::2a) by MN0P220CA0023.outlook.office365.com
 (2603:10b6:208:52e::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.26 via Frontend Transport; Mon,
 10 Mar 2025 18:32:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00021F6B.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Mon, 10 Mar 2025 18:32:39 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 13:32:39 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 13:32:38 -0500
Received: from prasad-lnx-mach.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 10 Mar 2025 13:32:34 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Mario.Limonciello@amd.com>, <Vijendar.Mukunda@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<ssabakar@amd.com>, Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Greg KH <gregkh@linuxfoundation.org>, "Jeff
 Johnson" <quic_jjohnson@quicinc.com>, Peter Zijlstra <peterz@infradead.org>,
	Murad Masimov <m.masimov@maxima.ru>, Muhammad Usama Anjum
	<usama.anjum@collabora.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>, "open list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 05/14] ASoC: amd: acp: Refactor acp machine select
Date: Tue, 11 Mar 2025 00:01:52 +0530
Message-ID: <20250310183201.11979-6-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250310183201.11979-1-venkataprasad.potturu@amd.com>
References: <20250310183201.11979-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6B:EE_|PH7PR12MB5594:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ad3a66e-f4ec-41ab-f5f4-08dd6001f01a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sQXNvODXneXonXRAZdVIO7yjItc1pRMytgvE2JNR4lztgLtLZHfUrhh4trw4?=
 =?us-ascii?Q?NjJKfqawshY8hBtiSaC27ryu5d7ldHCTkCnXiq23BjzdBfn3HsCcyRqwAS/s?=
 =?us-ascii?Q?eHegH8yPQcxultaBX8Qv2CytUo9KNHzenk7bLxgWsk/u7cg1KsvNcGvAf03K?=
 =?us-ascii?Q?X3ihR3PHMThAjnLPPbdFV6Nh+C33J9ofU9fIaqcHzN/zwVSTkX6Cz+h6nEjY?=
 =?us-ascii?Q?o4sGA7mdn0iyrRbVRiJ4ypQ5fhjr0GkdaLBlZT64B1Q4zz2zzNemHNnDpdyV?=
 =?us-ascii?Q?5XTLrfBxE9JfK0tLJQaTfy+J42uxf/P5k0hFcBT1LGQDgSX4YzfLbNfwsHZv?=
 =?us-ascii?Q?3k57eVGaUACXIrul0Ql3TvsifYUKrymFT15xWJqupL59rxAy/30bhHtszkSn?=
 =?us-ascii?Q?VxCxJyAGonaZVvEtuy25/vgGITD9/Jffrvpfve18noyOkrUpiJxypCWyfQ62?=
 =?us-ascii?Q?gA9KwcHcasQ0lXbQzeKGBdSlc/KDJlR7s40+Xp1QaKNqBdIIGD4ptHEbeiu8?=
 =?us-ascii?Q?DQgzvTO8GuCs57MdD0dHJh9/ayjvQL/8xwserTh/AWzIf6tlKbjOS8aoXssO?=
 =?us-ascii?Q?gOwxxlcy1qm2++tXQ9mIEa3eOnZjVCaZOz/o9QhS8BYMkcnNpFNtiPsiJxNv?=
 =?us-ascii?Q?lD3K5XktVwmsJml6QwUD7pkIrhElpUNc5TgtTkCL6DYhCVboBN36ZFm8m7qe?=
 =?us-ascii?Q?E7MbJNrXKueooTHRTiT+QSruTFDRerx1suPlFTVUTQJe2ps/QOjWPzySuoss?=
 =?us-ascii?Q?gVYf1/395Dsf3TcyOTpcO7bV3DbmyMCKRALwrxBOrqKqmnW/DrmSSTqPSGaY?=
 =?us-ascii?Q?OvMMLzG68JGBZQGm0+KF212GE5BFqRLwyqj6Fr/saA/+stCg/zdWEwL2xabO?=
 =?us-ascii?Q?LWkKe7jP3R0BcK8r6iB9Kajwe5jbxUN3sZsOO9NLh5EEw6PLY2mryBSsbtUv?=
 =?us-ascii?Q?SRmZEyUB9QjPQrtFYAi5EgiNpqW93zAOo+z/iRKGzg02V6Z5P36EOhJdH2Op?=
 =?us-ascii?Q?RksPTi4H/WW6CxHyguBOrO0Eg9iQ/4Qe9WeMFjlxiTxryYW1rjd5D5TSj942?=
 =?us-ascii?Q?GZ1D7S+MC4DIMTNSN/4gPvAAaiRvyuvNHL7jqvN0CRdIUczj+CpsMZVQcBPA?=
 =?us-ascii?Q?CIs+fIhyY5sYTjGo8g29maSrIEqZbUmZerjroOwG2mDG5Ty6EJNKMuCmkz8w?=
 =?us-ascii?Q?iV7/WqIubwknM4YWZV9+EktLzRKACBsd/OuiwqMrSf4AmpfkRd8iBVpAudeZ?=
 =?us-ascii?Q?J6zYhXa8WupC/QfyRsUaa81D2nZjwVcYUseagTeuluwQhDrDF7/dJScD/9dz?=
 =?us-ascii?Q?bLU98vjKY8HyXnXKEOAx4ePnH6OZI3NKY48lQDsqE/z6HLBvYMLDPEdfIxqB?=
 =?us-ascii?Q?kNb759OrRdleGlKVV8L0wjiwVPAqHGTMnrKh3s9iOAUfNT8WWQ6LMyI3956U?=
 =?us-ascii?Q?lGOxHEqMJn5cGIwqarR7uoHJ3aS9kB3O9lPlfgVHtMMSIER3upsCKASf3hQ2?=
 =?us-ascii?Q?ZIO4fdC3G1O8IyE=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 18:32:39.5542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3ad3a66e-f4ec-41ab-f5f4-08dd6001f01a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F6B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5594
Message-ID-Hash: 7GI52S226U3VUCEYNX7XZ5HMLAOJMCYP
X-Message-ID-Hash: 7GI52S226U3VUCEYNX7XZ5HMLAOJMCYP
X-MailFrom: venkataprasad.potturu@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7GI52S226U3VUCEYNX7XZ5HMLAOJMCYP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Refactor and move acp machine select function from acp platform
driver to acp pci driver and assign platform specific acpi machines
to chip->machines.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/acp-legacy-common.c | 28 +++++++++
 sound/soc/amd/acp/acp-pci.c           |  7 +++
 sound/soc/amd/acp/acp-platform.c      | 28 ---------
 sound/soc/amd/acp/acp-rembrandt.c     | 32 -----------
 sound/soc/amd/acp/acp-renoir.c        | 42 --------------
 sound/soc/amd/acp/acp63.c             | 10 ----
 sound/soc/amd/acp/acp70.c             | 10 ----
 sound/soc/amd/acp/amd.h               | 81 ++++++++++++++++++++++++++-
 8 files changed, 114 insertions(+), 124 deletions(-)

diff --git a/sound/soc/amd/acp/acp-legacy-common.c b/sound/soc/amd/acp/acp-legacy-common.c
index f87a2da8c641..886615798b93 100644
--- a/sound/soc/amd/acp/acp-legacy-common.c
+++ b/sound/soc/amd/acp/acp-legacy-common.c
@@ -16,6 +16,8 @@
 #include <linux/pci.h>
 #include <linux/export.h>
 
+#include "../mach-config.h"
+
 #define ACP_RENOIR_PDM_ADDR	0x02
 #define ACP_REMBRANDT_PDM_ADDR	0x03
 #define ACP63_PDM_ADDR		0x02
@@ -350,6 +352,32 @@ int acp_deinit(struct acp_chip_info *chip)
 	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(acp_deinit, "SND_SOC_ACP_COMMON");
+int acp_machine_select(struct acp_chip_info *chip)
+{
+	struct snd_soc_acpi_mach *mach;
+	int size, platform;
+
+	if (chip->flag == FLAG_AMD_LEGACY_ONLY_DMIC) {
+		platform = chip->acp_rev;
+		chip->mach_dev = platform_device_register_data(chip->dev, "acp-pdm-mach",
+							       PLATFORM_DEVID_NONE, &platform,
+							       sizeof(platform));
+	} else {
+		size = sizeof(*chip->machines);
+		mach = snd_soc_acpi_find_machine(chip->machines);
+		if (!mach) {
+			dev_err(chip->dev, "warning: No matching ASoC machine driver found\n");
+			return -EINVAL;
+		}
+		mach->mach_params.subsystem_rev = chip->acp_rev;
+		chip->mach_dev = platform_device_register_data(chip->dev, mach->drv_name,
+							       PLATFORM_DEVID_NONE, mach, size);
+	}
+	if (IS_ERR(chip->mach_dev))
+		dev_warn(chip->dev, "Unable to register Machine device\n");
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(acp_machine_select, "SND_SOC_ACP_COMMON");
 
 static void check_acp3x_config(struct acp_chip_info *chip)
 {
diff --git a/sound/soc/amd/acp/acp-pci.c b/sound/soc/amd/acp/acp-pci.c
index 0ffef70ab979..99297a388ed7 100644
--- a/sound/soc/amd/acp/acp-pci.c
+++ b/sound/soc/amd/acp/acp-pci.c
@@ -127,19 +127,23 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 	case 0x01:
 		chip->name = "acp_asoc_renoir";
 		chip->acp_hw_ops_init = acp31_hw_ops_init;
+		chip->machines = snd_soc_acpi_amd_acp_machines;
 		break;
 	case 0x6f:
 		chip->name = "acp_asoc_rembrandt";
 		chip->acp_hw_ops_init = acp6x_hw_ops_init;
+		chip->machines = snd_soc_acpi_amd_rmb_acp_machines;
 		break;
 	case 0x63:
 		chip->name = "acp_asoc_acp63";
 		chip->acp_hw_ops_init = acp63_hw_ops_init;
+		chip->machines = snd_soc_acpi_amd_acp63_acp_machines;
 		break;
 	case 0x70:
 	case 0x71:
 		chip->name = "acp_asoc_acp70";
 		chip->acp_hw_ops_init = acp70_hw_ops_init;
+		chip->machines = snd_soc_acpi_amd_acp70_acp_machines;
 		break;
 	default:
 		dev_err(dev, "Unsupported device revision:0x%x\n", pci->revision);
@@ -175,6 +179,7 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 	chip->chip_pdev = chip->acp_plat_dev;
 	chip->dev = &chip->acp_plat_dev->dev;
 
+	acp_machine_select(chip);
 skip_pdev_creation:
 	dev_set_drvdata(&pci->dev, chip);
 	pm_runtime_set_autosuspend_delay(&pci->dev, 2000);
@@ -242,6 +247,8 @@ static void acp_pci_remove(struct pci_dev *pci)
 		platform_device_unregister(chip->dmic_codec_dev);
 	if (chip->acp_plat_dev)
 		platform_device_unregister(chip->acp_plat_dev);
+	if (chip->mach_dev)
+		platform_device_unregister(chip->mach_dev);
 
 	ret = acp_hw_deinit(chip);
 	if (ret)
diff --git a/sound/soc/amd/acp/acp-platform.c b/sound/soc/amd/acp/acp-platform.c
index aa330aeeb301..7d6abff28b23 100644
--- a/sound/soc/amd/acp/acp-platform.c
+++ b/sound/soc/amd/acp/acp-platform.c
@@ -21,7 +21,6 @@
 #include <linux/dma-mapping.h>
 
 #include "amd.h"
-#include "../mach-config.h"
 #include "acp-mach.h"
 
 #define DRV_NAME "acp_i2s_dma"
@@ -108,33 +107,6 @@ static const struct snd_pcm_hardware acp6x_pcm_hardware_capture = {
 	.periods_max = CAPTURE_MAX_NUM_PERIODS,
 };
 
-int acp_machine_select(struct acp_dev_data *adata)
-{
-	struct snd_soc_acpi_mach *mach;
-	int size, platform;
-
-	if (adata->flag == FLAG_AMD_LEGACY_ONLY_DMIC) {
-		platform = adata->acp_rev;
-		adata->mach_dev = platform_device_register_data(adata->dev, "acp-pdm-mach",
-								PLATFORM_DEVID_NONE, &platform,
-								sizeof(platform));
-	} else {
-		size = sizeof(*adata->machines);
-		mach = snd_soc_acpi_find_machine(adata->machines);
-		if (!mach) {
-			dev_err(adata->dev, "warning: No matching ASoC machine driver found\n");
-			return -EINVAL;
-		}
-		mach->mach_params.subsystem_rev = adata->acp_rev;
-		adata->mach_dev = platform_device_register_data(adata->dev, mach->drv_name,
-								PLATFORM_DEVID_NONE, mach, size);
-	}
-	if (IS_ERR(adata->mach_dev))
-		dev_warn(adata->dev, "Unable to register Machine device\n");
-	return 0;
-}
-EXPORT_SYMBOL_NS_GPL(acp_machine_select, "SND_SOC_ACP_COMMON");
-
 static irqreturn_t i2s_irq_handler(int irq, void *data)
 {
 	struct acp_dev_data *adata = data;
diff --git a/sound/soc/amd/acp/acp-rembrandt.c b/sound/soc/amd/acp/acp-rembrandt.c
index e727754a8231..eb09878c0d5c 100644
--- a/sound/soc/amd/acp/acp-rembrandt.c
+++ b/sound/soc/amd/acp/acp-rembrandt.c
@@ -44,36 +44,6 @@ static struct acp_resource rsrc = {
 	.sram_pte_offset = 0x03802800,
 };
 
-static struct snd_soc_acpi_codecs amp_rt1019 = {
-	.num_codecs = 1,
-	.codecs = {"10EC1019"}
-};
-
-static struct snd_soc_acpi_codecs amp_max = {
-	.num_codecs = 1,
-	.codecs = {"MX98360A"}
-};
-
-static struct snd_soc_acpi_mach snd_soc_acpi_amd_rmb_acp_machines[] = {
-	{
-		.id = "10508825",
-		.drv_name = "rmb-nau8825-max",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &amp_max,
-	},
-	{
-		.id = "AMDI0007",
-		.drv_name = "rembrandt-acp",
-	},
-	{
-		.id = "RTL5682",
-		.drv_name = "rmb-rt5682s-rt1019",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &amp_rt1019,
-	},
-	{},
-};
-
 static struct snd_soc_dai_driver acp_rmb_dai[] = {
 {
 	.name = "acp-i2s-sp",
@@ -230,8 +200,6 @@ static int rembrandt_audio_probe(struct platform_device *pdev)
 	adata->acp_rev = chip->acp_rev;
 	adata->flag = chip->flag;
 	adata->is_i2s_config = chip->is_i2s_config;
-	adata->machines = snd_soc_acpi_amd_rmb_acp_machines;
-	acp_machine_select(adata);
 
 	dev_set_drvdata(dev, adata);
 
diff --git a/sound/soc/amd/acp/acp-renoir.c b/sound/soc/amd/acp/acp-renoir.c
index ca2b74283d8f..2b47c6bfc9e7 100644
--- a/sound/soc/amd/acp/acp-renoir.c
+++ b/sound/soc/amd/acp/acp-renoir.c
@@ -36,45 +36,6 @@ static struct acp_resource rsrc = {
 	.sram_pte_offset = 0x02052800,
 };
 
-static struct snd_soc_acpi_codecs amp_rt1019 = {
-	.num_codecs = 1,
-	.codecs = {"10EC1019"}
-};
-
-static struct snd_soc_acpi_codecs amp_max = {
-	.num_codecs = 1,
-	.codecs = {"MX98360A"}
-};
-
-static struct snd_soc_acpi_mach snd_soc_acpi_amd_acp_machines[] = {
-	{
-		.id = "10EC5682",
-		.drv_name = "acp3xalc56821019",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &amp_rt1019,
-	},
-	{
-		.id = "RTL5682",
-		.drv_name = "acp3xalc5682sm98360",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &amp_max,
-	},
-	{
-		.id = "RTL5682",
-		.drv_name = "acp3xalc5682s1019",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &amp_rt1019,
-	},
-	{
-		.id = "AMDI1019",
-		.drv_name = "renoir-acp",
-	},
-	{
-		.id = "ESSX8336",
-		.drv_name = "acp3x-es83xx",
-	},
-	{},
-};
 
 static struct snd_soc_dai_driver acp_renoir_dai[] = {
 {
@@ -188,9 +149,6 @@ static int renoir_audio_probe(struct platform_device *pdev)
 	adata->acp_rev = chip->acp_rev;
 	adata->flag = chip->flag;
 
-	adata->machines = snd_soc_acpi_amd_acp_machines;
-	acp_machine_select(adata);
-
 	dev_set_drvdata(dev, adata);
 	acp_enable_interrupts(adata);
 	acp_platform_register(dev);
diff --git a/sound/soc/amd/acp/acp63.c b/sound/soc/amd/acp/acp63.c
index 4187a8968de7..76a26b82e3ad 100644
--- a/sound/soc/amd/acp/acp63.c
+++ b/sound/soc/amd/acp/acp63.c
@@ -62,14 +62,6 @@ static struct acp_resource rsrc = {
 	.sram_pte_offset = 0x03802800,
 };
 
-static struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_acp_machines[] = {
-	{
-		.id = "AMDI0052",
-		.drv_name = "acp63-acp",
-	},
-	{},
-};
-
 static struct snd_soc_dai_driver acp63_dai[] = {
 {
 	.name = "acp-i2s-sp",
@@ -259,8 +251,6 @@ static int acp63_audio_probe(struct platform_device *pdev)
 	adata->acp_rev = chip->acp_rev;
 	adata->flag = chip->flag;
 	adata->is_i2s_config = chip->is_i2s_config;
-	adata->machines = snd_soc_acpi_amd_acp63_acp_machines;
-	acp_machine_select(adata);
 	dev_set_drvdata(dev, adata);
 
 	if (chip->is_i2s_config && rsrc.soc_mclk) {
diff --git a/sound/soc/amd/acp/acp70.c b/sound/soc/amd/acp/acp70.c
index 7f4ec3bfaeab..3e603c5f736a 100644
--- a/sound/soc/amd/acp/acp70.c
+++ b/sound/soc/amd/acp/acp70.c
@@ -40,14 +40,6 @@ static struct acp_resource rsrc = {
 	.sram_pte_offset = 0x03800000,
 };
 
-static struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_acp_machines[] = {
-	{
-		.id = "AMDI0029",
-		.drv_name = "acp70-acp",
-	},
-	{},
-};
-
 static struct snd_soc_dai_driver acp70_dai[] = {
 {
 	.name = "acp-i2s-sp",
@@ -187,10 +179,8 @@ static int acp_acp70_audio_probe(struct platform_device *pdev)
 	adata->dai_driver = acp70_dai;
 	adata->num_dai = ARRAY_SIZE(acp70_dai);
 	adata->rsrc = &rsrc;
-	adata->machines = snd_soc_acpi_amd_acp70_acp_machines;
 	adata->acp_rev = chip->acp_rev;
 	adata->flag = chip->flag;
-	acp_machine_select(adata);
 
 	dev_set_drvdata(dev, adata);
 
diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
index be1aa405a14a..b7a1b4aa8fef 100644
--- a/sound/soc/amd/acp/amd.h
+++ b/sound/soc/amd/acp/amd.h
@@ -149,6 +149,8 @@ struct acp_chip_info {
 	struct platform_device *chip_pdev;
 	struct platform_device *dmic_codec_dev;
 	struct platform_device *acp_plat_dev;
+	struct platform_device *mach_dev;
+	struct snd_soc_acpi_mach *machines;
 	u32 addr;
 	unsigned int flag;	/* Distinguish b/w Legacy or Only PDM */
 	bool is_pdm_dev;	/* flag set to true when ACP PDM controller exists */
@@ -195,7 +197,6 @@ struct acp_dev_data {
 	struct list_head stream_list;
 	spinlock_t acp_lock;
 
-	struct snd_soc_acpi_mach *machines;
 	struct platform_device *mach_dev;
 
 	u32 bclk_div;
@@ -245,13 +246,89 @@ enum acp_config {
 	ACP_CONFIG_20,
 };
 
+struct snd_soc_acpi_codecs amp_rt1019 = {
+	.num_codecs = 1,
+	.codecs = {"10EC1019"}
+};
+
+struct snd_soc_acpi_codecs amp_max = {
+	.num_codecs = 1,
+	.codecs = {"MX98360A"}
+};
+
+struct snd_soc_acpi_mach snd_soc_acpi_amd_acp_machines[] = {
+	{
+		.id = "10EC5682",
+		.drv_name = "acp3xalc56821019",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &amp_rt1019,
+	},
+	{
+		.id = "RTL5682",
+		.drv_name = "acp3xalc5682sm98360",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &amp_max,
+	},
+	{
+		.id = "RTL5682",
+		.drv_name = "acp3xalc5682s1019",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &amp_rt1019,
+	},
+	{
+		.id = "AMDI1019",
+		.drv_name = "renoir-acp",
+	},
+	{
+		.id = "ESSX8336",
+		.drv_name = "acp3x-es83xx",
+	},
+	{},
+};
+
+struct snd_soc_acpi_mach snd_soc_acpi_amd_rmb_acp_machines[] = {
+	{
+		.id = "10508825",
+		.drv_name = "rmb-nau8825-max",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &amp_max,
+	},
+	{
+		.id = "AMDI0007",
+		.drv_name = "rembrandt-acp",
+	},
+	{
+		.id = "RTL5682",
+		.drv_name = "rmb-rt5682s-rt1019",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &amp_rt1019,
+	},
+	{},
+};
+
+struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_acp_machines[] = {
+	{
+		.id = "AMDI0052",
+		.drv_name = "acp63-acp",
+	},
+	{},
+};
+
+struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_acp_machines[] = {
+	{
+		.id = "AMDI0029",
+		.drv_name = "acp70-acp",
+	},
+	{},
+};
+
 extern const struct snd_soc_dai_ops asoc_acp_cpu_dai_ops;
 extern const struct snd_soc_dai_ops acp_dmic_dai_ops;
 
 int acp_platform_register(struct device *dev);
 int acp_platform_unregister(struct device *dev);
 
-int acp_machine_select(struct acp_dev_data *adata);
+int acp_machine_select(struct acp_chip_info *chip);
 
 int acp_init(struct acp_chip_info *chip);
 int acp_deinit(struct acp_chip_info *chip);
-- 
2.39.2

