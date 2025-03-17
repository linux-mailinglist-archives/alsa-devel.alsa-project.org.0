Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 851BEA64373
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Mar 2025 08:25:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17BA16035B;
	Mon, 17 Mar 2025 08:25:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17BA16035B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1742196328;
	bh=6mGcPhSg6ORC89SZMicCnNxYy+WQF4rCZ0hGkCQsf3o=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SuwPLXPfuB/+Gi8pUhJjHBzcA5q46vjb77FdE7aA19Tik8BJiIozk+aRXMXA5MXM2
	 W6VD7ulmpgE0HS0Zsj0F9n368BtWH+SREsyzXMpCaIW5ZKNVPs9YqBxphEw/rW+O6S
	 7Jgi8QnhVAZ9sdIkKBT5RDVqKnp+bcPdXvhJeHd4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDBC2F805D8; Mon, 17 Mar 2025 08:24:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 82715F805E3;
	Mon, 17 Mar 2025 08:24:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A46BDF8055B; Mon, 17 Mar 2025 08:24:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::607])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B06CFF80212
	for <alsa-devel@alsa-project.org>; Mon, 17 Mar 2025 08:24:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B06CFF80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=qxWxhIa8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aoaQv6qTvVY9y7LL9G61Rzgcgg5cR+BK+xUtZKLqmhFyRHEjJyluvsAouBIeuALDpEfQUdmMRf+NsJPb2WeEwzKMFjRlTunQ4q4lmJtDBFlm3l6IygzpLOVSVELAovb3mm/+jDRVC2zUbCzVf/Ufb6zrFY8LAclcXSEdVbMr7HJPbiMcIRAeciKamPQJwUZIGAVuzqoOryf8FddUfXO8Bd+HNTtZbHSNgtbEpgWLaFk4Iw6modWd7M/7FHGsx2gRMZFZ5A1flkikx6ChJyogRPYP8wXvqH2hkjY4pSAMivC8nQs6FdccN47PtYfWVvkUR+sHbMo5GeK1jI34yLQdTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IBvcRm1AsjDbfHH6FxFXEb6i1KdA61i2WlXZnRx9aas=;
 b=ARjwkkdiAHOCiHAELe5HXP90toKW9h57XMpEMbapU0RqZxyoeClfS9GO0QWVhJjeqZVx9hJgYv2lAEq7DyxE2Vqf+Iw5qbyeqex9wAdQwPHbKheJOEXDzMPqESj2egoerP98TkwZZseMLpspvBH2Aep6/hCs/Y99OGBVhvDyOU64T5eqxesi7BFOII6Tg++5oLoDxa9OQzNcK0j756kDENM4wIksfe1d+9Bg+hLr0wF15yK4T+WrPS4RaTGev9cDY6TTWwOT50U6hRgVnAK8RttbBfqENS3nzSkLLqqOfi6JuBos3rlG20yKJqI5EyCouOK41c5KH3U3fDLpVWKn+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IBvcRm1AsjDbfHH6FxFXEb6i1KdA61i2WlXZnRx9aas=;
 b=qxWxhIa8Mi7V5A+BL7e8qVg91qENlidDclBIHZ0vXBwx+ytTz46NC+9OFkuCDS5aGM+PsjwuQieg2AZ99avbo5AIrP44gcQ6Id/sbk57TFI/zh7wfUYmSXlJq4jrYj9OPSm+wla+TkjeUEc5uqlyri3Mg75yzNlM08tt73gJSRI=
Received: from BYAPR05CA0018.namprd05.prod.outlook.com (2603:10b6:a03:c0::31)
 by SA3PR12MB8802.namprd12.prod.outlook.com (2603:10b6:806:314::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 07:24:27 +0000
Received: from SJ1PEPF00002323.namprd03.prod.outlook.com
 (2603:10b6:a03:c0:cafe::3a) by BYAPR05CA0018.outlook.office365.com
 (2603:10b6:a03:c0::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.33 via Frontend Transport; Mon,
 17 Mar 2025 07:24:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00002323.mail.protection.outlook.com (10.167.242.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Mon, 17 Mar 2025 07:24:26 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Mar
 2025 02:24:26 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Mar
 2025 02:24:25 -0500
Received: from prasad-lnx-mach.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 17 Mar 2025 02:24:21 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <mario.limonciello@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<syed.sabakareem@amd.com>, <nathan@kernel.org>, Venkata Prasad Potturu
	<venkataprasad.potturu@amd.com>, kernel test robot <lkp@intel.com>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, Peter Zijlstra <peterz@infradead.org>, Greg KH
	<gregkh@linuxfoundation.org>, Jeff Johnson <quic_jjohnson@quicinc.com>, "open
 list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/3] ASoC: amd: acp: Fix acp_resource duplicate symbol error
Date: Mon, 17 Mar 2025 12:54:08 +0530
Message-ID: <20250317072413.88971-2-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250317072413.88971-1-venkataprasad.potturu@amd.com>
References: <20250317072413.88971-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002323:EE_|SA3PR12MB8802:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a3ceb86-9ad3-42e5-8e03-08dd6524c002
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?FP53HJVWDVLaq2Daq3Kq1vowcj8O9Kmj/JFNa68h7WzgwuqGPWCh/WD0PQCI?=
 =?us-ascii?Q?21KLyq5yOvrf160Sr/4ZvMcI2iQYOf9ItJHJPYnfJsKaaVyDaMVHyVtDuDMj?=
 =?us-ascii?Q?2RewxmH0O/HjvwHAJFQeGcZ/f2qtUcMuH1CdhfPJu+m0qudOPWyk4Lo4Lk3/?=
 =?us-ascii?Q?YeoEODZFjEMUcztYIaUH2K7oOylXbcXelXhHonEsg6qk4bG3Wh8POlKjkIHM?=
 =?us-ascii?Q?aZCd1a8+cS1laHKvnx9t6vtX1JsNJoNNV72o7rVR1D08jnphdcAaWjtxyYrz?=
 =?us-ascii?Q?nvJJ7LXyNbDbD3kj4gO8Tl/UiwDZRCspKAMCeVNleBnpopuVD2tbPQyi8+yZ?=
 =?us-ascii?Q?88GQ3Ywqb2dKIO4+Pe9cd3kcpQ4AL62vuc7SzZ3ERml+5V6x3s5Cw39v6ty3?=
 =?us-ascii?Q?uTChEgGQKust7lPyalUR2Z11PIgdA3OG4N1hsf4nV1vxu7KVPKeu9zqNaw31?=
 =?us-ascii?Q?nUxKOyU16hCuewLlzao7T4r0E3g7Z0IvuRc9EuV7XkJfgzocvppmkz6ZStWO?=
 =?us-ascii?Q?upGWUCfi3k5m7MbWuo9rS3CFHq2IOCtZeoTH7ucnjGmNAJFh1DNoZ4OjFrqP?=
 =?us-ascii?Q?FazGyj9kt4qBOvRaLYrtnglCKWMaARakvJCUxc9l+BdpypQSEe4RciZgIGvQ?=
 =?us-ascii?Q?uj8JQT3d5NBlK3Qp/yWx2yVBWda5qHZNSDgs3jEzUlGK684SBvjPsP4IM87/?=
 =?us-ascii?Q?C8bbHy669t0TpEoTYSdhZGHm3oZLpDlyr96k5QIAQj3OuGOtDGEx8EIrrJPF?=
 =?us-ascii?Q?78Bsuty4TDYiH0lAVTR1fafiVxqdxvHzczjTwa4M9xEqSxEdW/1LyUY+NGAr?=
 =?us-ascii?Q?7cHPwT5ttInk9YZLyLezE9IQB9zHpbfiSjZlLR7RbAZdHek3aPySab9qWjjj?=
 =?us-ascii?Q?RvK2SrwVcFNhp8e3+vW58qENookjxA70BbygD+pJ5OO+/xgI7eQ64P0ZHdO4?=
 =?us-ascii?Q?oDgZFLOswVRFYHpaPq51H4QAADwXC+bUZ+tBJa2TjAP97MurrZOazYp6vunD?=
 =?us-ascii?Q?GfH6eXQPMDuwjzZ40B1jjtza4wEMKekYTWiBhaKPDj4BqMAge7Vz8iLwBHrs?=
 =?us-ascii?Q?+6JprjcoxVsCc9cqDhLepvXEVE5c+Fjs7Z0sFbu0Zi6oSYO2hZAmgT28pvHa?=
 =?us-ascii?Q?AHIMsEiBG/6n2ajOxuIn0O5i9GM9nKGGQa+/OC797MTfPROyK7hjgpx6ea+S?=
 =?us-ascii?Q?ZTZP5Gb37rnYSfIgTPl8EK2ge6XpiYdpuJJUYIYq5j7G6xxwAhX3/DF3ZJ/J?=
 =?us-ascii?Q?gVjkquaaHlxggGmJnIn6hRemGlga9Xpz88X6pCz6LHfc4+fZ3joQ3LcxjPcS?=
 =?us-ascii?Q?HhOrtQNIQG5S+NWQT/0IL3y9bq+REzxR/RmldlLdPNH9a8CIcSXIXVM1nWhN?=
 =?us-ascii?Q?FYC23k9E6Ppkka/HOugrIZckSDJ8+CUnvKpRhF1Zr8uJi8n7kqDoc6hWW2/X?=
 =?us-ascii?Q?dNdS3gNBRLjA0Hlc9f9mNo0H/4LTPOPcxXSOnxR9u1VJWK6u80aa91++vrUD?=
 =?us-ascii?Q?LEOnxNySdMLlU7M=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 07:24:26.9693
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6a3ceb86-9ad3-42e5-8e03-08dd6524c002
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002323.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8802
Message-ID-Hash: F2LN222HIYI6VGAZ63ZBABLKDHA6NNL5
X-Message-ID-Hash: F2LN222HIYI6VGAZ63ZBABLKDHA6NNL5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F2LN222HIYI6VGAZ63ZBABLKDHA6NNL5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fix acp_resource structure duplicate defination error by adding
export symbol and extern keyword in header file.

ld.lld: error: duplicate symbol: acp63_rsrc
ld.lld: error: duplicate symbol: acp70_rsrc

Fixes: f8b4f3f525e8 ("ASoC: amd: acp: Refactor acp70 platform resource structure")

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202503160801.yExt0K2E-lkp@intel.com/
Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/acp-legacy-common.c | 43 +++++++++++++++++++++++++++
 sound/soc/amd/acp/amd.h               | 42 +++-----------------------
 2 files changed, 47 insertions(+), 38 deletions(-)

diff --git a/sound/soc/amd/acp/acp-legacy-common.c b/sound/soc/amd/acp/acp-legacy-common.c
index 255f90ca956a..5fad6c4a8d86 100644
--- a/sound/soc/amd/acp/acp-legacy-common.c
+++ b/sound/soc/amd/acp/acp-legacy-common.c
@@ -24,6 +24,49 @@
 #define ACP63_PDM_ADDR		0x02
 #define ACP70_PDM_ADDR		0x02
 
+struct acp_resource rn_rsrc = {
+	.offset = 20,
+	.no_of_ctrls = 1,
+	.irqp_used = 0,
+	.irq_reg_offset = 0x1800,
+	.scratch_reg_offset = 0x12800,
+	.sram_pte_offset = 0x02052800,
+};
+EXPORT_SYMBOL_NS_GPL(rn_rsrc, "SND_SOC_ACP_COMMON");
+
+struct acp_resource rmb_rsrc = {
+	.offset = 0,
+	.no_of_ctrls = 2,
+	.irqp_used = 1,
+	.soc_mclk = true,
+	.irq_reg_offset = 0x1a00,
+	.scratch_reg_offset = 0x12800,
+	.sram_pte_offset = 0x03802800,
+};
+EXPORT_SYMBOL_NS_GPL(rmb_rsrc, "SND_SOC_ACP_COMMON");
+
+struct acp_resource acp63_rsrc = {
+	.offset = 0,
+	.no_of_ctrls = 2,
+	.irqp_used = 1,
+	.soc_mclk = true,
+	.irq_reg_offset = 0x1a00,
+	.scratch_reg_offset = 0x12800,
+	.sram_pte_offset = 0x03802800,
+};
+EXPORT_SYMBOL_NS_GPL(acp63_rsrc, "SND_SOC_ACP_COMMON");
+
+struct acp_resource acp70_rsrc = {
+	.offset = 0,
+	.no_of_ctrls = 2,
+	.irqp_used = 1,
+	.soc_mclk = true,
+	.irq_reg_offset = 0x1a00,
+	.scratch_reg_offset = 0x10000,
+	.sram_pte_offset = 0x03800000,
+};
+EXPORT_SYMBOL_NS_GPL(acp70_rsrc, "SND_SOC_ACP_COMMON");
+
 const struct snd_acp_hw_ops acp_common_hw_ops = {
 	/* ACP hardware initilizations */
 	.acp_init = acp_init,
diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
index 928aa60ab386..863e74fcee43 100644
--- a/sound/soc/amd/acp/amd.h
+++ b/sound/soc/amd/acp/amd.h
@@ -238,44 +238,10 @@ enum acp_config {
 	ACP_CONFIG_20,
 };
 
-struct acp_resource rn_rsrc = {
-	.offset = 20,
-	.no_of_ctrls = 1,
-	.irqp_used = 0,
-	.irq_reg_offset = 0x1800,
-	.scratch_reg_offset = 0x12800,
-	.sram_pte_offset = 0x02052800,
-};
-
-struct acp_resource rmb_rsrc = {
-	.offset = 0,
-	.no_of_ctrls = 2,
-	.irqp_used = 1,
-	.soc_mclk = true,
-	.irq_reg_offset = 0x1a00,
-	.scratch_reg_offset = 0x12800,
-	.sram_pte_offset = 0x03802800,
-};
-
-struct acp_resource acp63_rsrc = {
-	.offset = 0,
-	.no_of_ctrls = 2,
-	.irqp_used = 1,
-	.soc_mclk = true,
-	.irq_reg_offset = 0x1a00,
-	.scratch_reg_offset = 0x12800,
-	.sram_pte_offset = 0x03802800,
-};
-
-struct acp_resource acp70_rsrc = {
-	.offset = 0,
-	.no_of_ctrls = 2,
-	.irqp_used = 1,
-	.soc_mclk = true,
-	.irq_reg_offset = 0x1a00,
-	.scratch_reg_offset = 0x10000,
-	.sram_pte_offset = 0x03800000,
-};
+extern struct acp_resource rn_rsrc;
+extern struct acp_resource rmb_rsrc;
+extern struct acp_resource acp63_rsrc;
+extern struct acp_resource acp70_rsrc;
 
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp_machines;
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_rmb_acp_machines;
-- 
2.39.2

