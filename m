Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F0894C433
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2024 20:21:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F0E0BC0;
	Thu,  8 Aug 2024 20:21:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F0E0BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723141280;
	bh=IbvEYfxUpu8uJp6sM8KoJiMvrQ3grjF0UH/yg6pUjIk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c26MH1UwQCYgl/e3EspJxYd4TlTRNP0i20onA3Dhbo68PS0nanvrzp6JmaYEeyqMX
	 +I3AyBD9VIbe3zlzAEkw3MBidgQpx0ULMZR/BdJmizcq/iCI6eL/k9Bi3X7nUD9cQG
	 hx4IKR46A/O9wG+FkjxSqSy0gj+PwSG+4QmYZENk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 441FCF805E0; Thu,  8 Aug 2024 20:20:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 38AB6F805E6;
	Thu,  8 Aug 2024 20:20:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7BD1F800B0; Thu,  8 Aug 2024 18:58:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::614])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B433BF800B0;
	Thu,  8 Aug 2024 18:58:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B433BF800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=SJH3VywQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eRrPUQR0CbI4GgfP0MM1XaCbNPcv1KlkVZ7gdAJu4rbq/1zMMIdHf61zDjPVoBdlMmUev3E2cXfLW2SQYRMN72gK6H2H4s7mzjc7fjk8BTgGZV3M+gOZZ/X1wp6b7jB7SXAWG7c8JOdkT6ZDivLm+6yOw574S8WMWMMvFAvRoqhPmKfV7moqGMY9K1UDME9I0L/HWKFhDsOnQzvO2/xnspAyI7HfIPSWV1Y5dVT+lqMw+it5534zKeUd1pVOnCDv4/0nHPF4/BfQ1cvrWrKrUogRz7xQvAUGVTuEYVb2ENqi4lt7kfLaYMC7vQy0Aq5NH/TXFoPzfjgZ3KRRNh+zIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RTVy/S40reH6dPiVHmQp8KHQmxDvKLVFHwzi2x1SwAE=;
 b=A+sFhjNvKCf9tz6zVuEIAGaOWl87g8zHKgxwmQhYpVnEaOQM/YbePiWRgOnZGhYZ0Uqx82dtbUD87k6bJIEHOIQ61e2EoEoB0vSxmszandJsAHRAPHJM80jhGn61MQlvAOS81fHrTOgIO0CYdH0NG8Pfdi4pIBfFhsnWSr+KHkfojdgbVZS6AS6BTnmDjS38paHqeM3TsWDKNMVbHj/61lqNwNNRLHJ1Su3FKqT9h8eBtDMWfaX6A7vjSRR4eqNqd0o4TFQ06V+EpqjKTp72PD4lEPYpYtiT11WN3f1Xq/K6wAvtzKQ48JaLUwxb0QhCTtxivBlRwd8yETVUakhBlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RTVy/S40reH6dPiVHmQp8KHQmxDvKLVFHwzi2x1SwAE=;
 b=SJH3VywQIbFvUEcciYjs0NHyzlw62A51X1XAuwv890dSf7MKJuvQa6ReCh1gzLq7e00jgOOgxye4XrBBwM0faJQleE3o5VMD6C1cDk7RQKDAJIYrmZ81mtiIeK11mHHivb7uPXKSE5b26VSKxPC6jWnSrHrrYzI913JoVIIjmE4=
Received: from BLAP220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::7)
 by MW4PR12MB5601.namprd12.prod.outlook.com (2603:10b6:303:168::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Thu, 8 Aug
 2024 16:58:33 +0000
Received: from BL6PEPF0001AB52.namprd02.prod.outlook.com
 (2603:10b6:208:32c:cafe::f) by BLAP220CA0002.outlook.office365.com
 (2603:10b6:208:32c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.15 via Frontend
 Transport; Thu, 8 Aug 2024 16:58:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB52.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Thu, 8 Aug 2024 16:58:32 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 11:58:27 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <sound-open-firmware@alsa-project.org>,
	<linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<pierre-louis.bossart@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<lgirdwood@gmail.com>, <kai.vehmanen@linux.intel.com>,
	<daniel.baluta@nxp.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<cristian.ciocaltea@collabora.com>, Vijendar Mukunda
	<Vijendar.Mukunda@amd.com>
Subject: [PATCH RESEND 4/8] ASoC: SOF: amd: fix for acp init sequence
Date: Thu, 8 Aug 2024 22:27:49 +0530
Message-ID: <20240808165753.3414464-5-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240808165753.3414464-1-Vijendar.Mukunda@amd.com>
References: <20240808165753.3414464-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB52:EE_|MW4PR12MB5601:EE_
X-MS-Office365-Filtering-Correlation-Id: 6232405f-2c7b-4a34-33f8-08dcb7cb55f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?biatN/QS/OMH8rrO7augVO1rfvhrYjxju2VDSW4rj1xWnpeq3SrBrgI6A2VP?=
 =?us-ascii?Q?Khn540yiJqU2zX1n2a6R/xjlFHTk42+hOHz2YRllf6toOCaGhetP7I52RKiV?=
 =?us-ascii?Q?Bnwo0R+XjKsXylCs7kVV8YMN7QY6azpwpJyWJe26Qcm5Now7XN0bBXqIBZWc?=
 =?us-ascii?Q?Q/V68D35V0mMAaDZabwk3yGnFvsHeECrJeEi1lXV7AbnNsxmncMO6vgu3ErG?=
 =?us-ascii?Q?DPZzLK3fzbgy750igYsA5UUjlbGfsNiOGSSl1Ymbi5iCW0L2lKD4J/bEOUcy?=
 =?us-ascii?Q?Ho6+7MITH271zvI3DVetf4eLKo3kjm1tYC1JmFOp73CrwijrpkGCuQA7Naw0?=
 =?us-ascii?Q?xQ1m8exjto/YKKoL3GGScGDZXqRN763GZ2QBUplyWKAYg4I8efF2rNz1Jcdg?=
 =?us-ascii?Q?Y6Oead2c06PyR+Pa+AgZtFLeRPGNaN3xk+GHySwTa2DgwhgHXAzb4ZsthnRN?=
 =?us-ascii?Q?2tCEOnL8wiNmsBVc4SpTzwoIOM0A8JLqwX4Lm5n6lmFSmYfnw2ASC66Ou7uw?=
 =?us-ascii?Q?XFIp65N1nw3/hVoNMNrUBs2V1zrtNU39l5hGwEwDTAYBEu9yBMcs52nWHYh8?=
 =?us-ascii?Q?h7kiMNICnqW8PYX4qoaSWw42eXbUQEW2TlJzuTl+zAdFSgOOhayppYQM6lyh?=
 =?us-ascii?Q?M4ckl/ZTJpHGCqpx9Wy23UEPLPUIZWVnSu60r7AwJ4nK8r5AeJpMk/GSalXO?=
 =?us-ascii?Q?Dnwhrm71pz2tgmCCoXLHyVo0t3iccS30W1qkgWrBjPyNtCDnR9BJXHfaq+WO?=
 =?us-ascii?Q?aQSYmM5p6jvrTK6iOH9Jz6wm0Cp4Mm+KIjEUbC3OzOYdakA0QNBQvY1pKAFZ?=
 =?us-ascii?Q?cyZYm7ks2FE+9jyvhCt8oR6FPCQ4duBbUYPPvNcvNSuJruGyaKw72N+mDmUO?=
 =?us-ascii?Q?HrrvdApcB8XKDzz6hB1rV7p792AsOVFzqLuF1xuLn+Gmu4z5aOjnc9DwYeRJ?=
 =?us-ascii?Q?TVDLRSITKxMyP2jVIqmCWr4VSU8mbJbapDtLpQHlfb5oYGJajI1S2QhRrSWQ?=
 =?us-ascii?Q?ju29idDL1QoFOc309LPtwsJGzhkyENhsnK2P04km3qdmsPM214IXQPIYVRhZ?=
 =?us-ascii?Q?nq7B9tWoEug8HR8C5cJGih5jSot9oWMxChraQJntA4f4mBqh0eM9pdeeYHHV?=
 =?us-ascii?Q?nJSpdhAZUvNK63GXv5qn2jYiFSUZasTBKnTgbsdVH9DbSEuZyaQRAErsKH3p?=
 =?us-ascii?Q?bKHbiSRUb7/Q2h4V/PA/IfAHBAgOCrojHfOomZ9Wij1A6eIXMxWBKPYj1dw5?=
 =?us-ascii?Q?5yAYEdKgX0ukO2FE4BWAMd9w4K1RP/YjJEE0bLJaPAOWIEsfZqIlDzrtHWsl?=
 =?us-ascii?Q?fvwjcGqxrMQkQ12NLNaiDeWjJLt4tCW7hIpH11ZS1BYxQFzV9OR2ATdMd82r?=
 =?us-ascii?Q?h7dVMDe783KzhbQ7aW1HjW8aKQ3tCPJXs+rCkCJDGJdW9Ec0vN4qULCuKA4j?=
 =?us-ascii?Q?ffUyeB6xPv6Y2zMf31Z9wzrB1xtysgOk?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 16:58:32.7429
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6232405f-2c7b-4a34-33f8-08dcb7cb55f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB52.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5601
Message-ID-Hash: JDHSE43AX2GK5DVKDZU7NEV7NG2Q45ZP
X-Message-ID-Hash: JDHSE43AX2GK5DVKDZU7NEV7NG2Q45ZP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JDHSE43AX2GK5DVKDZU7NEV7NG2Q45ZP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When ACP is not powered on by default, acp power on sequence explicitly
invoked by programming pgfsm control mask. Update ACP pgfsm control mask
and status mask based on ACP variant.

Fixes: 846aef1d7cc0 ("ASoC: SOF: amd: Add Renoir ACP HW support")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/amd/acp.c | 21 +++++++++++++++++++--
 sound/soc/sof/amd/acp.h |  7 +++++--
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index d0ba641ba28c..a9f32983b3af 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -430,8 +430,10 @@ static irqreturn_t acp_irq_handler(int irq, void *dev_id)
 static int acp_power_on(struct snd_sof_dev *sdev)
 {
 	const struct sof_amd_acp_desc *desc = get_chip_info(sdev->pdata);
+	struct acp_dev_data *adata = sdev->pdata->hw_pdata;
 	unsigned int base = desc->pgfsm_base;
 	unsigned int val;
+	unsigned int acp_pgfsm_status_mask, acp_pgfsm_cntl_mask;
 	int ret;
 
 	val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, base + PGFSM_STATUS_OFFSET);
@@ -439,9 +441,24 @@ static int acp_power_on(struct snd_sof_dev *sdev)
 	if (val == ACP_POWERED_ON)
 		return 0;
 
-	if (val & ACP_PGFSM_STATUS_MASK)
+	switch (adata->pci_rev) {
+	case ACP_RN_PCI_ID:
+	case ACP_VANGOGH_PCI_ID:
+		acp_pgfsm_status_mask = ACP3X_PGFSM_STATUS_MASK;
+		acp_pgfsm_cntl_mask = ACP3X_PGFSM_CNTL_POWER_ON_MASK;
+		break;
+	case ACP_RMB_PCI_ID:
+	case ACP63_PCI_ID:
+		acp_pgfsm_status_mask = ACP6X_PGFSM_STATUS_MASK;
+		acp_pgfsm_cntl_mask = ACP6X_PGFSM_CNTL_POWER_ON_MASK;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (val & acp_pgfsm_status_mask)
 		snd_sof_dsp_write(sdev, ACP_DSP_BAR, base + PGFSM_CONTROL_OFFSET,
-				  ACP_PGFSM_CNTL_POWER_ON_MASK);
+				  acp_pgfsm_cntl_mask);
 
 	ret = snd_sof_dsp_read_poll_timeout(sdev, ACP_DSP_BAR, base + PGFSM_STATUS_OFFSET, val,
 					    !val, ACP_REG_POLL_INTERVAL, ACP_REG_POLL_TIMEOUT_US);
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index f6f0fcfeb691..321c40cc6d50 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -25,8 +25,11 @@
 #define ACP_REG_POLL_TIMEOUT_US                 2000
 #define ACP_DMA_COMPLETE_TIMEOUT_US		5000
 
-#define ACP_PGFSM_CNTL_POWER_ON_MASK		0x01
-#define ACP_PGFSM_STATUS_MASK			0x03
+#define ACP3X_PGFSM_CNTL_POWER_ON_MASK		0x01
+#define ACP3X_PGFSM_STATUS_MASK			0x03
+#define ACP6X_PGFSM_CNTL_POWER_ON_MASK		0x07
+#define ACP6X_PGFSM_STATUS_MASK			0x0F
+
 #define ACP_POWERED_ON				0x00
 #define ACP_ASSERT_RESET			0x01
 #define ACP_RELEASE_RESET			0x00
-- 
2.34.1

