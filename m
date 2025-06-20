Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81165AE1AA1
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jun 2025 14:11:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30115601BC;
	Fri, 20 Jun 2025 14:10:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30115601BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1750421467;
	bh=/rwkSiPYmwxouAkTdG+MtQ+v5pR8BTbC4HAS+z3vj2s=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KLesAAl/uSMFZ3cRSTmAu1MgkxvT7d0fVezTxnNx/DaLvf/NUcR9Mdv+uN7tE3F1Q
	 qoaI2e3h41kAZkFhTGvjcEJbvFKvRh/2JXUTpSXOZ/DYrN0lVbXJY8hkvsMefULh/v
	 NwJy81QhDguMHQ6hM5nmh4g4e2Jxo8HPOKi7IFpI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24C72F805FF; Fri, 20 Jun 2025 14:10:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1478EF805FF;
	Fri, 20 Jun 2025 14:10:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8084DF805F0; Fri, 20 Jun 2025 14:10:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20622.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::622])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B3BAF805D9;
	Fri, 20 Jun 2025 14:10:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B3BAF805D9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=AGXBo4hG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PcpCv5BDqbyabaMN4MRCP+4nDLl4VTIE83MPYXgvkvtLDySoSYsjISLyUzKXl+4h2ApOo8ZK65czL0gkJ4WjFtSL0/zcMG2sSUfZCIDp/ce6CEs4gr9AeynBHqrS/owK/6HFj9GlhZC63OPBiH0Pp5T31WXdsg1x8GSCYIqoYkc/JcDXXgGI475/kDUuHFV5GWOeZxMEuTb73Kgh7q8PYcSQmrKXPkYNZPRRkkEl0u9rsiyDrowXaH/ssQDqyZVPo+KQbNSBaLuHsm4WnAK6MKrX6pt1eJZa2mI9sgNejwTW4vDWavHUFrFsc8+ZJzQB+sWwkn5qrOdzzZpMZSTxQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HbF9baUPWlMDJKr11Mk7W5aP2tuQgcx4DlEasHqBQJw=;
 b=Ep4a0hh49Btv+f66jE93RmEh+f/OEiuy8qIsQzMxjbcQ3AuqElXCLqbqneP/TePBCVMheouaC94cJUKje5iXODqS1YNDseorSW8f17AlWFTEFXpS95FtF7gD+CPHRWSO0ZwCnF4Zclf5/mTOSCj38Z+olgvLXGy86PYi+4+fP+Sl5O3OyY5OXMdoEa9O6KOciNXS9dkEJSsXbaGp3gHamQdUVJ+Rr445QAXgAVdrXxZcGgNO7zGVFBMBUbtIzO4LRu4bG1JBmmQnjYOWqD4zU919bJ3oOpZQNj2UKJuzvor/iSfvojOI8nmKbQ6cTASMceuKWHbd8stpvoaErCymHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HbF9baUPWlMDJKr11Mk7W5aP2tuQgcx4DlEasHqBQJw=;
 b=AGXBo4hGoR90bXR3uJ5VsuatMuUYI2CcLd2MhlWAqGsQxxMrpPuE5X6kcYGD92pkiOUeJZdSbsjE6HXASespP53N6oT7KICVAGxBJajG8lA6Aofe7nEDljN0O0AMMHUU7Z8wajWe9HCYHj+gmVuqWyRUoG54/UfOex4w+dnw9CA=
Received: from SJ0PR13CA0055.namprd13.prod.outlook.com (2603:10b6:a03:2c2::30)
 by CH8PR12MB9765.namprd12.prod.outlook.com (2603:10b6:610:264::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Fri, 20 Jun
 2025 12:10:06 +0000
Received: from SJ5PEPF000001ED.namprd05.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::1a) by SJ0PR13CA0055.outlook.office365.com
 (2603:10b6:a03:2c2::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.10 via Frontend Transport; Fri,
 20 Jun 2025 12:10:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001ED.mail.protection.outlook.com (10.167.242.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Fri, 20 Jun 2025 12:10:05 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Jun
 2025 07:09:58 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<perex@perex.cz>, <tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<mario.limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <sound-open-firmware@alsa-project.org>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 1/2] ASoC: amd: acp: add soundwire machine for ACP7.0 and
 ACP7.1 sof stack
Date: Fri, 20 Jun 2025 17:38:42 +0530
Message-ID: <20250620120942.1168827-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250620120942.1168827-1-Vijendar.Mukunda@amd.com>
References: <20250620120942.1168827-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001ED:EE_|CH8PR12MB9765:EE_
X-MS-Office365-Filtering-Correlation-Id: 433fd4f2-c55e-4f9d-5960-08ddaff364e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|7416014|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/BvgWZbvSnvhX/nug3DhYeY/P1IXpRkDe3SoOmj5DGxgvYugB1oYR4FD+QtL?=
 =?us-ascii?Q?v4/yhl+v9ElhGOpgEfvUiHFMW4Ao0HSgmsmUF9LFWziWeLX6V+8Ouj/N8xuL?=
 =?us-ascii?Q?P2gBw1fOFN0tyv+zM+fX4ox320hwaieO9xm9ZR/IEtA6lWQaIYNyz9arEN7o?=
 =?us-ascii?Q?mbjNkRl7vLt8UNl/zZLdjGDwObtN4ryaL1D8jQ3mevLoW4xOFeqjDk177eqD?=
 =?us-ascii?Q?gZo5vJGM1m+CnFuLHoUPXE9xd9i+7+7kSB3IvQbbDncFvmGtv3V/VdUUe6mZ?=
 =?us-ascii?Q?dqofM7JMX9i7BB5oPB2z2zfFtrfZ9az/Xo0h7zEqL9zla1Kdhx+w79LuKS5s?=
 =?us-ascii?Q?YhNL7fOvHffiEMAXq1/CnpesKMansHDOoljGp56pGIB8zhl3j+6vJwLG9j5z?=
 =?us-ascii?Q?pKFsH2G72+iwj79fW87otf+6fBP909LpWCycNWjHQCp9NBwZwCp6n2v9hKNS?=
 =?us-ascii?Q?ZJuYTuk7Y2GJUlVgXK1B3rEr+7idxP1G9AogtBDHinr3FxbdVaxvPBX7AtW8?=
 =?us-ascii?Q?bdMpEyzfsLi+16So+wfuVCnGWb6YPKQCIQUuQTng+ahNDnLgj5ONRoel8wYJ?=
 =?us-ascii?Q?YPrwiWpHPHlkt6hzunt50UFQjQtqwL7wfb47XWMQn97i2j1cZf2Jesqi3vq1?=
 =?us-ascii?Q?1cNzFdN4FPXkW0O3r6nuTfFa8orz92ri/Tf5j3fNT3fxpxGInK/iaLBtRb93?=
 =?us-ascii?Q?5quJSU63D4FNR3QGE0Zi2lT+19B5Gz9pHeznciHOzyvs6iTGv+eq6REdJwKf?=
 =?us-ascii?Q?Cl43jCpVbq9EhfyNvChErndy1nx59e1E3kZ1Inykxqp+j4S7ZPscKyt3WmRB?=
 =?us-ascii?Q?L/ilLiP+QSXKRaFNF1nfHfdKFXYwZIPUTTgC0PtEqE6jtGjUCRXARyoYxmF2?=
 =?us-ascii?Q?vSGRET0Ksc3Ls5y/Q11JyxCZEf6VSFIzVMtWJbGVq7Je0FkI8w44qvBiuPeC?=
 =?us-ascii?Q?BipAdeEqCmfzJLh46wTX/enzyAC2FrAxotSFM/rfThBCLQyjgz0bbr7sQHCR?=
 =?us-ascii?Q?oXTucm0N19HaAhaot7/TC3somVZgLATzaroqPviaOfjCDjyuENUv6S2UZJp9?=
 =?us-ascii?Q?E0AKu7gmC3r3LIgYEB31MOWpqziUqSq7/nUq/2MQI0r+afOy5BHfizfbG6jd?=
 =?us-ascii?Q?8uJIudBJwdFJBvT4yQ/8Xa58xEX8sR5/4xGTbGh7tqdsIUM5UdN7lDbxM9nY?=
 =?us-ascii?Q?04aYuLTf+Be/Oj043gjzWYExRt+/PyvTDfpAxArriEw5eFBK7tXuOqRyYOty?=
 =?us-ascii?Q?awzPxSsBnOTZ6REo+Qo4yo4NIBOgTxzP1/IL6xe4tzQfsXS3OqhYfqbSEJs2?=
 =?us-ascii?Q?v8iWoB66m0YNdMGuV0by9+NoQQ5iNAmqgvuoRWtcvusiVYhDpXCDpd4/g8UR?=
 =?us-ascii?Q?OAmDh74Yj7FZHVgxyNSEFMEm+LGZbFydGSN6tG3IpABHjmFBPckhQ9ch4x6i?=
 =?us-ascii?Q?tPJjOgvULWvPPf0cnihzS81WtHIUXK1C0XkkUMK+L998YgAjhwSHd8iqdfdS?=
 =?us-ascii?Q?HXA/CH3wYJivrRQcxeJLuuL5YDpZEvc4pqwB?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 12:10:05.9872
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 433fd4f2-c55e-4f9d-5960-08ddaff364e8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9765
Message-ID-Hash: RELKMVPHDDJYZN2UWPS5TXQDNHTAPGG6
X-Message-ID-Hash: RELKMVPHDDJYZN2UWPS5TXQDNHTAPGG6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RELKMVPHDDJYZN2UWPS5TXQDNHTAPGG6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add SoundWire machine with RT722 multi functional codec support for ACP7.0
and ACP7.1 platforms at sdw link0 for sof stack.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/Kconfig                |  1 +
 sound/soc/amd/acp/amd-acp70-acpi-match.c | 12 ++++++++++++
 sound/soc/amd/mach-config.h              |  1 +
 3 files changed, 14 insertions(+)

diff --git a/sound/soc/amd/acp/Kconfig b/sound/soc/amd/acp/Kconfig
index b9432052c638..c2a60bc80ee6 100644
--- a/sound/soc/amd/acp/Kconfig
+++ b/sound/soc/amd/acp/Kconfig
@@ -148,6 +148,7 @@ config SND_SOC_AMD_SOF_SDW_MACH
 	select SND_SOC_RT1316_SDW
 	select SND_SOC_RT715_SDW
 	select SND_SOC_RT715_SDCA_SDW
+	select SND_SOC_RT722_SDCA_SDW
 	help
 	  This option enables SOF sound card support for SoundWire enabled
 	  AMD platforms along with ACP PDM controller.
diff --git a/sound/soc/amd/acp/amd-acp70-acpi-match.c b/sound/soc/amd/acp/amd-acp70-acpi-match.c
index e87ccfeee5bd..dcecac792e6d 100644
--- a/sound/soc/amd/acp/amd-acp70-acpi-match.c
+++ b/sound/soc/amd/acp/amd-acp70-acpi-match.c
@@ -155,6 +155,18 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sdw_machines[] = {
 };
 EXPORT_SYMBOL(snd_soc_acpi_amd_acp70_sdw_machines);
 
+struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sof_sdw_machines[] = {
+	{
+		.link_mask = BIT(0),
+		.links = acp70_rt722_only,
+		.drv_name = "amd_sof_sdw",
+		.sof_tplg_filename = "sof-acp_7_0-rt722-l0.tplg",
+		.fw_filename = "sof-acp_7_0.ri",
+	},
+	{},
+};
+EXPORT_SYMBOL(snd_soc_acpi_amd_acp70_sof_sdw_machines);
+
 MODULE_DESCRIPTION("AMD ACP7.0 & ACP7.1 tables and support for ACPI enumeration");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
diff --git a/sound/soc/amd/mach-config.h b/sound/soc/amd/mach-config.h
index fdf016a64bbf..5b6362103ca0 100644
--- a/sound/soc/amd/mach-config.h
+++ b/sound/soc/amd/mach-config.h
@@ -27,6 +27,7 @@ extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_sdw_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_sof_sdw_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sof_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sdw_machines[];
+extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sof_sdw_machines[];
 
 struct config_entry {
 	u32 flags;
-- 
2.45.2

