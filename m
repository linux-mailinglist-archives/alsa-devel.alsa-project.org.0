Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A95AAF105C
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Jul 2025 11:45:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 654FB601F6;
	Wed,  2 Jul 2025 11:45:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 654FB601F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751449555;
	bh=r4XpBy2L8ItiGNLUvRRkn5PJgQUKmyuAvpklO8JJEto=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ko+Dat+usl31CPwE5V+GLnVQ91kWuEsvmO/Rbx62ZuVNSJpNjvLThr18NyIpabUZH
	 rcU0Og/3BOd+L4H9apIKkl0tBxi8P1ffhGUMA6xpNxe+Yp9H0YNl64Ae5w+pFcCSN0
	 l1SV5pK0xlr4mz4/ZnEaLqawKL3xwWrCou+FAwzM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 944B5F80604; Wed,  2 Jul 2025 11:44:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C46BF80616;
	Wed,  2 Jul 2025 11:44:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68D46F804FF; Wed,  2 Jul 2025 11:44:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2407::61a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7CDF6F80601
	for <alsa-devel@alsa-project.org>; Wed,  2 Jul 2025 11:44:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CDF6F80601
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=whms5Dme
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Icb6Qp9a6D9VJaolr1RMeHF4xRQhfIw1ttgKP6bKvrm836JFAXbgaDj6ohh94g8gjrAQkV3mrcWsLeK3eePzRMkZf3mJq8G8SBMLenxS/KfgQk8JHA+USeLCKPqUDBgvnam70msjEn+agsRGPxdWRpEmNUqLjaGRDZ1cRMrxg8YhPFKqA51iDm2hgzjUZIT4gW+mYKQXL6A6CJVdVMqktwz391yuxRGLxl7+Y/V88xRaVZJL8vZE+SC486YADAT1EpmskvEtdNLnzd45aIWZ7VfiZ3uYB3pPmWUfLOBpYG4xOj/2jgq6DTLo2eZmlH6pluxWnFvipsovdLeHTsY2Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1qnNw5s/gOlWiSrI3GbkQsHhTSCsPwcd3TLAo28DI5I=;
 b=y/y3V4lDIAYqY6FcVWzPDgZbK2spDyhWxIvbSvE0AgH9CsGYrb9oTHIfbj9WK/STXwvpVYbFP3++i0lOpbwN6mkG+UJ8dRFPaB15HYaFe+Vx9qwc3it9V4tmJ4iuiX4jCCWsqKBVrXTaxp9++RYj3+7iKdvZUcr3S4Co+F06WwuoTXwJlS/eteobJMf6yVFyQPU3SP5ytAyIPaMN1ih004JgFeKx0mkhFi+2ZxQvoFBxQvEKqSsW9/H7kxhtzEpU/0OTEhb0Ti9vciq7ukxk3CBUyQQP6qAmR93gi8TUclw0K1ZuSRBp6JCt6yH7NQ7ZxhXViVpgM+gxxFt8UeJu1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1qnNw5s/gOlWiSrI3GbkQsHhTSCsPwcd3TLAo28DI5I=;
 b=whms5Dme5Gyr2C6ghkOgtYPXf/iVRc160kzIPAjNAvDsMK8PqVl56D+mPpar8qnWjvo5rMLKU5VhGnBKNQhUtWn31Xgm1iSWsPJFKJz1MBvYpkUXK8jisvK6SoNagD5IZAjQTvUu8cQqhakmCBxr0L6MffV3h64XGPfFbAyy7Hc=
Received: from MN2PR20CA0054.namprd20.prod.outlook.com (2603:10b6:208:235::23)
 by MW4PR12MB7029.namprd12.prod.outlook.com (2603:10b6:303:1eb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Wed, 2 Jul
 2025 09:44:48 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:208:235:cafe::b2) by MN2PR20CA0054.outlook.office365.com
 (2603:10b6:208:235::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Wed,
 2 Jul 2025 09:44:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Wed, 2 Jul 2025 09:44:48 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 04:44:47 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 04:44:47 -0500
Received: from r9-mach.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 2 Jul 2025 04:44:43 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <syed.sabakareem@amd.com>, "Venkata Prasad
 Potturu" <venkataprasad.potturu@amd.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, "Ranjani
 Sridharan" <ranjani.sridharan@linux.intel.com>, Daniel Baluta
	<daniel.baluta@nxp.com>, Peter Zijlstra <peterz@infradead.org>, "open
 list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/3] ASoC: amd: acp: Enable I2S support for acp7.2 based
 platforms
Date: Wed, 2 Jul 2025 15:14:11 +0530
Message-ID: <20250702094425.155185-3-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702094425.155185-1-venkataprasad.potturu@amd.com>
References: <20250702094425.155185-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: venkataprasad.potturu@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|MW4PR12MB7029:EE_
X-MS-Office365-Filtering-Correlation-Id: d7acfcdc-0297-4ecf-8e2f-08ddb94d159b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PGnRffHRW8kIIsszaILRtFpreghcEE7RaTaKEhXURtzd1W1XQCvFGVq12c/Z?=
 =?us-ascii?Q?fwcKZkg3fHxJmmPkVmFDNYpUH7w1VwosyM1WglXfnjEvVOiP85nqBeHCbsho?=
 =?us-ascii?Q?CMaW46u5zYdz9fBJ7J+j3YZbPw3Uy2WsjzxwKBTFoXf6rKBC21QSSAPvNBZf?=
 =?us-ascii?Q?5dXQYsZuR+fr2l8vEEQkgHo3SVg5Dfwklh0uggHu66f08lq12OJmXYcw+O+P?=
 =?us-ascii?Q?fxw3ZZ+urgzDfzPotxaJkqxtwJ6eKuEmQCjKuA1ep558omYpAWADDIG6qt3a?=
 =?us-ascii?Q?L8CDwh4vfCgHAfjCwLPi0G6gCQG5ibJPVyi1zSJV/eh5g8pcLrN8LWlVDfs4?=
 =?us-ascii?Q?J8VWBvwzcRMVaiOZx7QX84t17Pi/3OTpXgoPP6PZGFToGpaSh1MM69ZixENw?=
 =?us-ascii?Q?yJ/UzI+qEcRKqLD5zHn97dpjTOwwcX7DNwZMuxkQ89yTwgGNFd0niCUhATvf?=
 =?us-ascii?Q?pzmUeJPILlVHXrYfyhgm5DNT1SZGjq5RBQczCtUSKabp8F9rHUdrrQoSTacS?=
 =?us-ascii?Q?s8tsdf++aKxjvnidHQ33VAHpi5FHXr1bPEc1aJKF81e/IpCjDtI+ygAbv7Fd?=
 =?us-ascii?Q?UtwiHJYfyDUskWTPlYpKGQ0sGVu4aeRBkR2uwOvT6Biv0DqGMI9EZZPQfQT/?=
 =?us-ascii?Q?S6/lf9N8TRB0A+6Hj9fk/4OPtFZj3wj4XW2L2Xk1QW24ceeAp6MzA+I9SxmC?=
 =?us-ascii?Q?SubeNBWx+YdXp3gpfE6az0NOzcd9EVLXMorq4/+V07yPT753mIhOEkhPWh+b?=
 =?us-ascii?Q?x0Violri6MdiPXpNIbN3o1MK1s9nK3z+dGKzksXBJ9t2YglPv8bt5ypDH1Xm?=
 =?us-ascii?Q?k3mj9U0oIHjMtoZsHN7jhehSzPGMQP74pM5ZdNHJOmhKpTor0WEbji98iyQd?=
 =?us-ascii?Q?G9F4SvVCxDzZpsFveRcUSCAij2yB5/etemzFfmXDmK1irrx5OereQKXGiNZu?=
 =?us-ascii?Q?k1yeSDtNn9KBGnVQL52YjjAa2kuBwgklEHtL4id68889oY3K7pAPE0xirbYK?=
 =?us-ascii?Q?uNZ6ex6A/2VbY2D6lV3ysB6oP5I2W+5PcWXn1pAV7X52F1XaB6WObKec6sR3?=
 =?us-ascii?Q?ff4HOsCu3MdR9IBzmYHyja5/QUja7n2DpmE3rbUflWZmeSy/+pF5glvM/nEQ?=
 =?us-ascii?Q?R/JxzEbd3JaBppJQGAnkXdMwxwRdhrBPfCS8ZSCO4C98OwQOUaWAaPEMEmTf?=
 =?us-ascii?Q?a7tH4VkwxBO3jpvHonUgCka/fftTpeKwPW17HETbRBbl7r4o6UaBRif8Pa6s?=
 =?us-ascii?Q?eNk423MJ8zdakPeNNSF+jQVjrHAb1lu8smBh0FtzlDg467/c+UKMEeZTgD+G?=
 =?us-ascii?Q?IOZt33WGmF3pe5GU8VdzK9hIjgDzWnfQZipRlSR49346DdV080wce4+vQfcc?=
 =?us-ascii?Q?MZP5g/e5eqqjaDDrCmJTwN9XWFlsKDpAJEeXp+TeaEokqZ9DrOcGUHxym3xv?=
 =?us-ascii?Q?O+172X0yOyuI87y+MbP17qRR/ukHVoiTlm4PmmfrZpon20WHI99PnqVmFtya?=
 =?us-ascii?Q?6c7CyQIeOsQNVdxOjJr9HNQzlyOHaF9YIZzI?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 09:44:48.2154
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d7acfcdc-0297-4ecf-8e2f-08ddb94d159b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7029
Message-ID-Hash: DQR25PC25KJI2NAR47LUJWFC3WZHLIXF
X-Message-ID-Hash: DQR25PC25KJI2NAR47LUJWFC3WZHLIXF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DQR25PC25KJI2NAR47LUJWFC3WZHLIXF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Enable I2S dai driver support for acp7.2 based platforms.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/acp-i2s.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/amd/acp/acp-i2s.c b/sound/soc/amd/acp/acp-i2s.c
index 70fa54d568ef..617690362ad7 100644
--- a/sound/soc/amd/acp/acp-i2s.c
+++ b/sound/soc/amd/acp/acp-i2s.c
@@ -58,6 +58,7 @@ static inline void acp_set_i2s_clk(struct acp_chip_info *chip, int dai_id)
 	case ACP63_PCI_ID:
 	case ACP70_PCI_ID:
 	case ACP71_PCI_ID:
+	case ACP72_PCI_ID:
 		val |= FIELD_PREP(ACP63_LRCLK_DIV_FIELD, chip->lrclk_div);
 		val |= FIELD_PREP(ACP63_BCLK_DIV_FIELD, chip->bclk_div);
 		break;
@@ -134,6 +135,7 @@ static int acp_i2s_set_tdm_slot(struct snd_soc_dai *dai, u32 tx_mask, u32 rx_mas
 	case ACP63_PCI_ID:
 	case ACP70_PCI_ID:
 	case ACP71_PCI_ID:
+	case ACP72_PCI_ID:
 		switch (slots) {
 		case 1 ... 31:
 			no_of_slots = slots;
@@ -168,6 +170,7 @@ static int acp_i2s_set_tdm_slot(struct snd_soc_dai *dai, u32 tx_mask, u32 rx_mas
 		case ACP63_PCI_ID:
 		case ACP70_PCI_ID:
 		case ACP71_PCI_ID:
+		case ACP72_PCI_ID:
 			if (tx_mask && stream->dir == SNDRV_PCM_STREAM_PLAYBACK)
 				chip->tdm_tx_fmt[stream->dai_id - 1] =
 						FRM_LEN | (slots << 13) | (slot_len << 18);
-- 
2.43.0

