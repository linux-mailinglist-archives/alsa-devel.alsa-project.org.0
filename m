Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 726FAB17CF0
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Aug 2025 08:32:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30BFA60270;
	Fri,  1 Aug 2025 08:31:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30BFA60270
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1754029924;
	bh=6d1GEPp29hj3kPkHpnG38QOFJHT5+Yrf2Dysk5q6xqE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VinklHvfpibxOeXJ3a4vMOajbUTIwxLYNvHTk78JFOAi2wTMh81r9CnB8BR7KxS38
	 nm9Ukb1+gAsIQwtqnX9F50ZAFw7PP9GolZbTPm4bjUuVszK9WzDkERX5IWp76rh3AD
	 3qcVwjccDDz3uGhCNpqOjfJegTbs4HEK4rBxiURk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9356FF805EA; Fri,  1 Aug 2025 08:31:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7706F805F2;
	Fri,  1 Aug 2025 08:31:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6919CF80533; Fri,  1 Aug 2025 08:23:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2063.outbound.protection.outlook.com [40.107.223.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7D00BF80086
	for <alsa-devel@alsa-project.org>; Fri,  1 Aug 2025 08:23:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D00BF80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=PIEDuh4i
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WQEc+uav5SzjxqzV7Yn3nHcaDKkLbDIQPAouipa3P5YiNapTvCyFxy9Buc1fnhOcC/j018m8hojFxwEM4XorFLS8maB74DuE+jqmpCIiMjZupI/vozvZnWMVoXgdVN3VIwAlf8zxX0qaOXrPqzSPy85hUEMeVD5s5lTG7dUQvHfoCT7XsZcyD0VOromwB5etz8XQzrpL9GkQwd6/Q3gQ/GxSCMgrqIkbYMxlj0VmiDrN+q1nLkLJi00hgc8fJcrLjEEZMU7LD7G4gaIOXfT8CNChNTPnSZ6zNs9QjeK+s6GSMH4puHyl6ioHrHPP1yEkq/1anZOwEEip6hnNNeLrlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ubTzMiMGm0cxJyahUTs5hMjcQLyN/yW87xQ6Auecr3I=;
 b=tPc1XAakf2lXC2AwamHpLWq4leO5KxS4m9fY356eryPZN/b9TR49Ebt0xSTsaC7enQaqwnmu1AARdeayva9IMGoK30aADSHrn3+Sc8XidsUzTMeGA2wzljSu0EpfQr5J3GgY7DZzf3WDDR+JcRxiVA8V70tkRrPsUzvO4hrAqgNrBudicC5kmmm58XklTHmioyLLmnI92uM+rgCu+Absd+WCN6lnpxTH47dkyF4NnOKyYJzbjIv8UE5dN4eqpXPvskwGwDj2xpVvcE+RXlT2AePSi8o0M31OjTe8rE3AXrRPAlPsw/bjTUaXSrgiBf0rV90Jctbg4mKzzrKdycAsVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ubTzMiMGm0cxJyahUTs5hMjcQLyN/yW87xQ6Auecr3I=;
 b=PIEDuh4ijZIa1HecrhJM/Hd1PlCRqlRL3wataAXYbyNKI5y7vGAKexn6q3JZQ0qkpX/NGEYshxe7r8PeUXf8xYJZ/G/5fzsJdUzdygk2uMh8Y73kZ2FVuDx2eC0IUAZ7YH2EVTa1MDepaZSuRketuaWBykWYRqEOQ396RLeBVys=
Received: from BN9PR03CA0681.namprd03.prod.outlook.com (2603:10b6:408:10e::26)
 by PH7PR12MB8053.namprd12.prod.outlook.com (2603:10b6:510:279::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Fri, 1 Aug
 2025 06:22:42 +0000
Received: from BL02EPF00021F6C.namprd02.prod.outlook.com
 (2603:10b6:408:10e:cafe::76) by BN9PR03CA0681.outlook.office365.com
 (2603:10b6:408:10e::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.14 via Frontend Transport; Fri,
 1 Aug 2025 06:22:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00021F6C.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Fri, 1 Aug 2025 06:22:40 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 1 Aug
 2025 01:22:38 -0500
Received: from r9-mach.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 1 Aug 2025 01:22:33 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <syed.sabakareem@amd.com>, "Venkata Prasad
 Potturu" <venkataprasad.potturu@amd.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Ranjani
 Sridharan <ranjani.sridharan@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>, Peter Zijlstra <peterz@infradead.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>, "open list:SOUND - SOC LAYER
 / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 3/4] ASoC: amd: acp: Add SoundWire legacy machine driver
 support for acp7.2 platform
Date: Fri, 1 Aug 2025 11:51:37 +0530
Message-ID: <20250801062207.579388-4-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250801062207.579388-1-venkataprasad.potturu@amd.com>
References: <20250801062207.579388-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: venkataprasad.potturu@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6C:EE_|PH7PR12MB8053:EE_
X-MS-Office365-Filtering-Correlation-Id: 77b48c0a-4644-4b31-720c-08ddd0c3d165
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5m/JtHYp8CqeyZkcG2tDWxarOmHNppxTXqpKC/0cDK815FbMVYlKzDf1vctS?=
 =?us-ascii?Q?JgvVIulrvc7ATX77bnH5RkYZ2KhYSraUn2Mnp59LgC0taCu/mkBSCuuFgEd2?=
 =?us-ascii?Q?S7g9RQ9U8nF89wt4fLIVjZ7rBG8Vax6MlRDrLWB9DpDIuM9nAgiNvE/txaRN?=
 =?us-ascii?Q?MmeEw3DmbcfuGwlA6flDzPoTyxlnkmcJQzrfVNXB7OTPJsApyYa0Z+rEfpTK?=
 =?us-ascii?Q?ZqCephWvpxCpjEx4uIbs2rn8VRuGzDz4BhfTB4ERGYw2ocY6YTgCiDOan4KE?=
 =?us-ascii?Q?bvQxwK/wXwApygsg9pfou7lnqMnLDDQ1OGLnPbHK75cNcrxYA91vDg7St1Qj?=
 =?us-ascii?Q?TPRtarUeLj93E5UmbZzAmvG6ha7TcErFmnnKxjToF8/85bi9v3yUknldwLOm?=
 =?us-ascii?Q?2PDaj8LR7OJ589ApNBi38xXWy0vSnMsPTBwdO7iel/5E5vRLxPWk8KaC6n9f?=
 =?us-ascii?Q?ciOpsxHvL0XV5oQPDjuPOR9+PSEKWyl+3BH0boqQpK1MPNpVLJ2eUyUYQoq5?=
 =?us-ascii?Q?XjbihY7/2c5TLP/WlXHQfjLasjLc2lkESD+fE1Gx2XoPyJyuRCalulKWCf/T?=
 =?us-ascii?Q?NxxguWK7zn30vcnkmzJHYsj6vpic5e7dX5hCkcyqMYUu333ChkrvPJz94Dy6?=
 =?us-ascii?Q?9lxPWClSUARv0IgJoDU8dRSAgzKzqtOffYGpBXUrduiUBqA1EqoQiezGNBwT?=
 =?us-ascii?Q?tb5vNhVXx5BfSp1k4YCy5YyKPqBEhifauDMX1AbN0olgVY+zUNwDgrXHXMqf?=
 =?us-ascii?Q?9aQ1vQpUp8uvGHZyC3P0henEyFwPkksWVMAa+cBpK2rgIC1g0lV+MIrvb5NN?=
 =?us-ascii?Q?Fyp3QQWVaYxOCrPrrkW9urB1o4yJklBJtGk4qPk5ia2tNUS/ZpnQCU4Jl4r8?=
 =?us-ascii?Q?gOJ2UyoXWhqDptJeZE+wpPtRe+vA1Nunqs2Bn7uUhd6wiOIuTyid9itLRm5S?=
 =?us-ascii?Q?eKbnzK66gLssod4YwOBk0eyablh8wswvFHu2jllJGX4oOr/wJlsME3dIaCM5?=
 =?us-ascii?Q?YlgDXZnwtwsxHqGRx0lUTf8fScqjsvA7nOUPWigAucx3iZJ4gIyGorI01igb?=
 =?us-ascii?Q?A0rZDYHqPpmyyRDus+Yd7ZFZznvhhBjB+xJUP12UhP9HAKxi+1ZZntOWlSll?=
 =?us-ascii?Q?9aAjLewNmE8pJ8WAL7z1j4smd2haq8AMy7kZQuUGdPBsydIyyBkI/+2qLRqO?=
 =?us-ascii?Q?KZzBamdrFrrKFlh8fzNSWx9mSbigefAGVUmSVZNRbj/UAehv0meI970+jWNQ?=
 =?us-ascii?Q?u9OVP63kkae9c2jqUKfor6HyuauhQpnCtvBnOojmerkS5mgMi/DIGWivgF3d?=
 =?us-ascii?Q?qJe6T6r91QwOeJ7OExo3VE0/glvr71xDAavD4YHqrk5leu8ZBKGov1C6+Viw?=
 =?us-ascii?Q?5OjTzhFwH9aQ1bJ1gH1C3c5PWwoqyhY05eidOOBSVrIoSRipVeSnyOyxFsbY?=
 =?us-ascii?Q?Tj8drOVybcBtlhvI8/AcF9OJJJCz1tLbclw0oP/nQGVXZ6232r+ibIN+gubS?=
 =?us-ascii?Q?uEHbOA6ABJIMZjXQEv9DnQ3WbIR2IZgNG0rM?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 06:22:40.6335
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 77b48c0a-4644-4b31-720c-08ddd0c3d165
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F6C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8053
Message-ID-Hash: SXZ6JR3YTL7C5HW2W7EBR5W5I6UDSL37
X-Message-ID-Hash: SXZ6JR3YTL7C5HW2W7EBR5W5I6UDSL37
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SXZ6JR3YTL7C5HW2W7EBR5W5I6UDSL37/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add SoundWire legacy machine driver support for acp7.2 platform.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/acp-sdw-legacy-mach.c | 3 +++
 sound/soc/amd/acp/soc_amd_sdw_common.h  | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/sound/soc/amd/acp/acp-sdw-legacy-mach.c b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
index 6c24f9d8694e..c2197b75a7dd 100644
--- a/sound/soc/amd/acp/acp-sdw-legacy-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
@@ -158,6 +158,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 			break;
 		case ACP70_PCI_REV:
 		case ACP71_PCI_REV:
+		case ACP72_PCI_REV:
 			ret = get_acp70_cpu_pin_id(ffs(soc_end->link_mask - 1),
 						   *be_id, &cpu_pin_id, dev);
 			if (ret)
@@ -264,6 +265,7 @@ static int create_sdw_dailinks(struct snd_soc_card *card,
 	case ACP63_PCI_REV:
 	case ACP70_PCI_REV:
 	case ACP71_PCI_REV:
+	case ACP72_PCI_REV:
 		sdw_platform_component->name = "amd_ps_sdw_dma.0";
 		break;
 	default:
@@ -311,6 +313,7 @@ static int create_dmic_dailinks(struct snd_soc_card *card,
 	case ACP63_PCI_REV:
 	case ACP70_PCI_REV:
 	case ACP71_PCI_REV:
+	case ACP72_PCI_REV:
 		pdm_cpu->name = "acp_ps_pdm_dma.0";
 		pdm_platform->name = "acp_ps_pdm_dma.0";
 		break;
diff --git a/sound/soc/amd/acp/soc_amd_sdw_common.h b/sound/soc/amd/acp/soc_amd_sdw_common.h
index 1f24e0e06487..3930cc46fa58 100644
--- a/sound/soc/amd/acp/soc_amd_sdw_common.h
+++ b/sound/soc/amd/acp/soc_amd_sdw_common.h
@@ -21,6 +21,8 @@
 #define ACP63_PCI_REV			0x63
 #define ACP70_PCI_REV			0x70
 #define ACP71_PCI_REV			0x71
+#define ACP72_PCI_REV			0x72
+
 #define SOC_JACK_JDSRC(quirk)		((quirk) & GENMASK(3, 0))
 #define ASOC_SDW_FOUR_SPK		BIT(4)
 #define ASOC_SDW_ACP_DMIC		BIT(5)
-- 
2.43.0

