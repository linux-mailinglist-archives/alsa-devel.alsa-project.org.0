Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6413E89CB67
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Apr 2024 20:03:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E63F23D4;
	Mon,  8 Apr 2024 20:03:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E63F23D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712599432;
	bh=8IC6AsgV+sSctxGk3R4/3Zg85XkOACeyjxZRS4gFavc=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=niVKBCOFGqvk5omfaDV2e90Oh0PKy+POr9PVBU1bL7UFIiphQw28XSnSk2iR+Hbss
	 8Zr+th3WG6O62xfdcbQIaEz22IHEy+oxBTAdDmOqedu8AwUHE+k6mshnP5uZmLYBiU
	 LgGXGj7/8r8pf9lqDLacjBHGh1CCSPU+lFS0BMUU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56FBFF805AA; Mon,  8 Apr 2024 20:03:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84157F8013D;
	Mon,  8 Apr 2024 20:03:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E24E9F8028B; Mon,  8 Apr 2024 20:03:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2409::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 75CE7F8013D
	for <alsa-devel@alsa-project.org>; Mon,  8 Apr 2024 20:02:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75CE7F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=4hd5qruZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nPevfOVFiBNTUaVhO6Pyfhx4djTV3yALIR8AOWo+pXGaySgMKL9Cu/YR5Vnq39fbmpf8ECndrUJX0mkrmyrmP0aeJYWEYT/nYnL4sDf8ApZpDT9IqYygDKyv8EWmbV011/C60kk9Km6i6boO0TF8Xpqz99GyKWS2SYo8LFakXn6VDxJJMES3MtNnnaygjkq0aQvxzwxaL8c6WzXxOS18HpoljDJWdRvGP+hU7mfFArda5shtBiy2SglYgL40Q/EfYMxcPqK0VFsgnLMb8pDXzC1WvGSIR2bnqlrn0aC6njrzB8yQAZu70uA2gxhTxXvgMHEggo7I0fW/2abDzcXjiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i2femoaYcJJamd6wwIdA3to6ZmvP++teISEfbILJZgg=;
 b=AZwlCaojye2w0eVlWTpB7y5fcNPpRUWrVq4VXd9QkQz3nPWIfiJ8PQWiOd8NFHKcYzJJUc0rjhFQlWRppe3CEVMdRIdhIJDCMBI4+sOXjHzhk7Zw2SLg5E/OHXIT8DFaoRDyR2mMxNgAJHqDUnDBQKX3ufEth43ptroCeDK7ahyVoiAqwIM9sCnchSL5EzD/y4W+bs2U8w87xcFm31kPOiXUv23mjC2iBoiDnaBuvQAjkUokpnwkSXYvUT5w/SwnMJULIR7JfJci/f0b+9XmsiXFKJtYnBvgL1wKpofmzYMMJzotHnsKfpulk2R+S3fd9W4a0NgvtN2U2nfPCZ0yRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i2femoaYcJJamd6wwIdA3to6ZmvP++teISEfbILJZgg=;
 b=4hd5qruZ3MJOQ9WPaufQoD2vCrZGD85zMWcCo2MZ7BtFBjDVfVg4WmMIJCr9fwqN794sKoPcWmbdk5J6UwSDRI6EPe82pDh6rPiMq2xJEz4Df2MMRf9YHIAwIYQC41pN+k4UCsoZbkM8BKbwzeUYUVY9YJx0Q1y8SIjFEuG3miM=
Received: from CYZPR14CA0012.namprd14.prod.outlook.com (2603:10b6:930:8f::7)
 by DS7PR12MB6358.namprd12.prod.outlook.com (2603:10b6:8:95::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.53; Mon, 8 Apr
 2024 18:02:36 +0000
Received: from CY4PEPF0000EE39.namprd03.prod.outlook.com
 (2603:10b6:930:8f:cafe::de) by CYZPR14CA0012.outlook.office365.com
 (2603:10b6:930:8f::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46 via Frontend
 Transport; Mon, 8 Apr 2024 18:02:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE39.mail.protection.outlook.com (10.167.242.13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Mon, 8 Apr 2024 18:02:35 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 8 Apr
 2024 13:02:34 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 8 Apr
 2024 13:02:34 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35
 via Frontend Transport; Mon, 8 Apr 2024 13:02:30 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <Sunil-kumar.Dommati@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <venkataprasad.potturu@amd.com>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>, kernel test robot <lkp@intel.com>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>, Lucas Tanure
	<lucas.tanure@collabora.com>, Cristian Ciocaltea
	<cristian.ciocaltea@collabora.com>, Syed Saba Kareem
	<Syed.SabaKareem@amd.com>, "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER
 MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] ASoC: amd: fix for soundwire build dependencies for legacy
 stack
Date: Mon, 8 Apr 2024 23:32:26 +0530
Message-ID: <20240408180229.3287220-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE39:EE_|DS7PR12MB6358:EE_
X-MS-Office365-Filtering-Correlation-Id: 77f35211-f809-4832-a1ce-08dc57f6126e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eNkKzUykRlJsD/KqLThGVoEKuUANvVHXla9j50Xt1nA1RE18H6YDWn9aiT1BcM+BtMyapm/q+FiQteKwji56xM/NQNbF0ewb/q9uEKvc86JYmOCIwNCIFUU4IE2/iLijYQuwVbKk64VauaXYzSkznWJHwUnWoHaYVkpgBPdWxVPgF8qT4ibD1rH1rYnhqdQojX5rxf6s1Ny3MJlWvynaHxYspB36BU6XtXadtqiOPNJhwPIE69qQJQ4bdQTl5pnK/kdqrdmlTz9Qx6AOrZ8y9V+pDj5rdKSboPPwZ/nIxCeNVMaBWfFxdvi5jnnUDd8aE4cjye/MiVWTG8IGrX12bZl8njRhIjGnI3p+XDdOo6zHlQK/1luuSJF4TFr4nmPjR0E9q820f1VDdUkvZA4tugBPuHzOUScxU5vOhNobERbd7pPEsyNAce+WKPrPGTWAI9GESEXD17gKCYaPLZoqiEiiw48lyHeRFYeBUi7MeV7eRIS/ZkFLv9qjGP3vVV4fdI8FmFpArshOGH/0RoaFoRA/67c67W46PXF/WoLQX01/ZWFnku09ih4xYQGmGJ1yHjVnvT+Noe2KdYVS2gp1X6sGMTchZOogbCGUxmFS4h1/W49w2Y1bFWFVbwYIt6VDbO58dcxDeP8RG8sZs1IKbWngdU2ja/SI7U7UIADFQYWckMDt6MP5oTpgfw+i9BaM
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(376005)(1800799015)(7416005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 18:02:35.9141
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 77f35211-f809-4832-a1ce-08dc57f6126e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE39.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6358
Message-ID-Hash: C2XWTH4TVUPAZYUNYQDJI4DNYUPFDQI2
X-Message-ID-Hash: C2XWTH4TVUPAZYUNYQDJI4DNYUPFDQI2
X-MailFrom: Vijendar.Mukunda@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C2XWTH4TVUPAZYUNYQDJI4DNYUPFDQI2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The SND_SOC_AMD_SOUNDWIRE Kconfig symbol has build dependency on
SOUNDWIRE_AMD. It gets it wrong for a configuration involving
SND_SOC_AMD_SOUNDWIRE_LINK_BASELINE=y,SND_SOC_AMD_PS=y and SOUNDWIRE_AMD=m,
which results in a link failure:

ld: vmlinux.o: in function `amd_sdw_probe':
>> sound/soc/amd/ps/pci-ps.c:271:(.text+0x1d51eff):
	undefined reference to `sdw_amd_probe'
ld: vmlinux.o: in function `acp63_sdw_machine_select':
>> sound/soc/amd/ps/pci-ps.c:294:(.text+0x1d525d5):
	undefined reference to `sdw_amd_get_slave_info'
ld: vmlinux.o: in function `amd_sdw_exit':
>> sound/soc/amd/ps/pci-ps.c:280:(.text+0x1d538ce):
	undefined reference to `sdw_amd_exit'

Add a top level check config that forbids any of the AMD ACP drivers
with version >= 6.3 from being built-in with CONFIG_SOUNDWIRE_AMD=m.
Move SND_AMD_ACP_CONFIG common dependency config to
SND_SOC_AMD_ACP63_TOPLEVEL config.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202404061257.khJml82D-lkp@intel.com/
Fixes: a806793f231e ("ASoC: amd: simplify soundwire dependencies for legacy stack")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/Kconfig | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index 3508f5a96b75..6dec44f516c1 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -132,6 +132,19 @@ config SND_SOC_AMD_RPL_ACP6x
           Say m if you have such a device.
           If unsure select "N".
 
+config SND_SOC_AMD_ACP63_TOPLEVEL
+	tristate "support for AMD platforms with ACP version >= 6.3"
+	default SND_AMD_ACP_CONFIG
+	depends on SND_AMD_ACP_CONFIG
+	depends on SOUNDWIRE_AMD || !SOUNDWIRE_AMD
+	depends on X86 || COMPILE_TEST
+	help
+	  This adds support for AMD platforms with ACP version >= 6.3.
+	  Say Y if you have such a device.
+	  If unsure select "N".
+
+if SND_SOC_AMD_ACP63_TOPLEVEL
+
 config SND_SOC_AMD_SOUNDWIRE_LINK_BASELINE
 	tristate
 	select SND_AMD_SOUNDWIRE_ACPI if ACPI
@@ -149,7 +162,6 @@ config SND_SOC_AMD_SOUNDWIRE
 
 config SND_SOC_AMD_PS
         tristate "AMD Audio Coprocessor-v6.3 Pink Sardine support"
-	select SND_AMD_ACP_CONFIG
 	select SND_SOC_AMD_SOUNDWIRE_LINK_BASELINE
         depends on X86 && PCI && ACPI
         help
@@ -170,3 +182,5 @@ config SND_SOC_AMD_PS_MACH
           DMIC can be connected directly to ACP IP.
           Say m if you have such a device.
           If unsure select "N".
+
+endif
-- 
2.34.1

