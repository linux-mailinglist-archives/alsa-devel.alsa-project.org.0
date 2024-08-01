Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E711C944A39
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 13:20:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80C4A3D0B;
	Thu,  1 Aug 2024 13:19:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80C4A3D0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722511193;
	bh=ejSREmtKpPlCZKf7CubmMFc5YO60GeQkUhyI5h1+gts=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gWeSdcrgyRY6d/ZJ/zSZmywzKjsVsr3iPApmcwtSi24eXaSXJPK9h7s1PxhQbtdv6
	 QVa3DSK2CabBjlW0La56D40YxFczO4wkKjEL+kFsWynYOMcycIMSs8wcwKrHBLeI9D
	 C76CKiewzl2kjzdvfBT8lZPLvG+hnzpigxzI9q7M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 260EEF805B1; Thu,  1 Aug 2024 13:19:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A42FF805DF;
	Thu,  1 Aug 2024 13:19:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4503F8026A; Thu,  1 Aug 2024 13:18:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::607])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AB139F8007E
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 13:18:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB139F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=vo8OClad
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UPw9dnLttljYBFCGpHDINA3OxNRpmPAuhk61imWDF4mU7a5ppE4s4HjGqyOm1v1BELRaORzrwavZIqB+GsVs0tHeNqMWzZvb2ZPMJrc4wmfruduf5uaG3zL8rEjzz+RaexJvFy3U6XnP1G+vp87ojMUCj9hdL8nn2tsz7qv12GUsZynaM3uLIkZmutL0ityIe13DvguJLe1xBfWb01ZzCwiv0jMyD6955NIs8jLOxsT2hg46S8Cl08Wgq45Fsb7m/FiK//m/XU1ZLGHquiiSLgaPMr4MoJYJT7sTAyo3MNgnMJO5EHxZ1fv4zLmNKY611fQz24HW6KZxLVRhp6gu7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EbMz4R/5/iajlF1Nq6AdxmjB/86P3UNZcteCeMvd0o8=;
 b=BTJt+hqM8PBM/1Y7fw4gSwSLYlsFiUpd2+TSqp4jCVGClo7D2wWZbHaklbg5i1GShdNCWtjV3DlRYpJWtYaFIBbwoUbMgLBLoFfRP0bPj84xnwG6omqBHxAuKWpMqAtRC6KKVADZee3ulR5SiQ5NlqPvieYgsdUNZ66scxQx+Hh1dqGD8fqn4KC15rYVSmRhNinDEpFoNlmnZtrU6PvmuE5/4eIlmS0bejmhRciDSUowdATl8rof5j67iMZ2iZjY+Hnp/Xtd4KJf5NTVQiWGGNtBSooxFEAKMge5K0pol/d1rB0gIJ7v0ms566PU80nKQ+m+YcAIp0cENdEeHLY6PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbMz4R/5/iajlF1Nq6AdxmjB/86P3UNZcteCeMvd0o8=;
 b=vo8OClade3mI5xFQQdToUiqGLgxyWK/hTQobGzJ8OUOcJi8EVamc+iEqsVq5qS9bGhlpwE4RpnJTgIKDmTusTY1aNCs48w7HwIJ7YcaQUWkv6bTLgWv2Pf6EB4n10LcwSmkjhdb8ipQBe6w8bG33jU+NapROs9HrMpj89lduPiE=
Received: from MN2PR15CA0030.namprd15.prod.outlook.com (2603:10b6:208:1b4::43)
 by SN7PR12MB6766.namprd12.prod.outlook.com (2603:10b6:806:26a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Thu, 1 Aug
 2024 11:18:47 +0000
Received: from BL6PEPF00022570.namprd02.prod.outlook.com
 (2603:10b6:208:1b4:cafe::e4) by MN2PR15CA0030.outlook.office365.com
 (2603:10b6:208:1b4::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29 via Frontend
 Transport; Thu, 1 Aug 2024 11:18:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00022570.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 11:18:47 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 06:18:46 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 06:18:46 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 06:18:36 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <vijendar.mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <alsa-devel@alsa-project.org>,
	<pierre-louis.bossart@linux.intel.com>, <venkataprasad.potturu@amd.com>,
	<yung-chuan.liao@linux.intel.com>, <linux-sound@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Cezary
 Rojewski" <cezary.rojewski@intel.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Charles Keepax
	<ckeepax@opensource.cirrus.com>, Maciej Strozek
	<mstrozek@opensource.cirrus.com>, Chao Song <chao.song@linux.intel.com>, open
 list <linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND 22/31] ASoC: intel/sdw_utils: move soundwire dai type
 macros
Date: Thu, 1 Aug 2024 16:48:08 +0530
Message-ID: <20240801111821.18076-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240801111821.18076-1-Vijendar.Mukunda@amd.com>
References: <20240801091446.10457-1-Vijendar.Mukunda@amd.com>
 <20240801111821.18076-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: Vijendar.Mukunda@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022570:EE_|SN7PR12MB6766:EE_
X-MS-Office365-Filtering-Correlation-Id: 67387462-b36e-40a6-13ac-08dcb21bb659
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lcdp5SBWg0j5b5Pe2kgVBrCx/OyK1wX5Am0UshZd1A1n03yCByfwO+jjHJbw?=
 =?us-ascii?Q?PnSqYPScIv9JwvnWFzbF38nBGz89NF5t0euzolrux7Y8DTiUpvz8EuOO2+l1?=
 =?us-ascii?Q?jnnfkaE+mwxqENVBHLzU8Vuz/nsmoxpPNf9fJggkOltvN1+kCUREtVoPAdQO?=
 =?us-ascii?Q?VLzjWjDs1kDCiIDPySYZ8kcfyCqjBdow3DLt3MbuqkpkvV6hWdHXBBpGNLfb?=
 =?us-ascii?Q?iecWoktBZxP/E/XBsEpgdwgItrF2+I4V/bxriCyd8a/Fa375ZyNViloNR+G1?=
 =?us-ascii?Q?dilzvcn84pOkCXSt0tBxlSTR9OAUbx2B9JQVTLVe2JVmNN/fzZmwoAuPXj3B?=
 =?us-ascii?Q?PUU4FY4aZ/xwKF8xl5xQHTBg+/4Fqaani91vce2slN0ZlD1m2an5voJsydEc?=
 =?us-ascii?Q?yLM6E9xr7OvfY/53UnCyWbggL/0ofeEC114f23JyB5hkKoDz5gF5tA5xx4eT?=
 =?us-ascii?Q?SFbmfij4vMuqZPvyQgxRIRMacgMcOIbU0df9sLgnrRLEqcQEevHF3ZF0O2Q4?=
 =?us-ascii?Q?fxGIcXi03LB+OB8H4TI4GOTstRI1iyfgZHa7RG0m68uNE/wKZ75VppoCJfDL?=
 =?us-ascii?Q?cXzcKLvXVqEbDL/b7IZU82IyRE6BL9i4JKkJ6plki8gyfKWbFMIpyc/7NkMM?=
 =?us-ascii?Q?bIZg+lldDXfdEN8LosXL6RWc/daaSG3N4pdqTLwFZ0B+vCwBiWxvRVDvCS26?=
 =?us-ascii?Q?4lh5iIPd7ZYTFLbZXOxKfnvkSENE5/CiNXuhSfpY4lLLNfVZEi/lTNXttlJp?=
 =?us-ascii?Q?TYaxUKuNbhblIaMJAVU7XFB1jk6vEYKJjPMtVQ3OXdGCGzc2mMifPLPehhd4?=
 =?us-ascii?Q?YxrbiIzfIhrgdJ6CH8jxjAhDeJZ3P3UYXfwPAWFi3MtY9KYHAV689beb+is2?=
 =?us-ascii?Q?bu1NR0Je6VUgVuT0N1gdNUQcarxPFPCjoBx/eboJB4/HXeyKAK5OlZrgRgZh?=
 =?us-ascii?Q?6ieceUbGFC3GDeg7BQf+G4EBYyVurqTVl6bzWCvBP7qhwoWjOw+LfvbOuMVb?=
 =?us-ascii?Q?6Ao+eNJyGu2X63y0vzYkkW8Bh0qaFXLJ9nz9dCKB2gPWP9sSRZMwW80Jpo+e?=
 =?us-ascii?Q?gfSentccJxpMm9koyBVIMXS9kUlWl1h1gYkqP0tgV0NbEomi+fu3zj1ueLSW?=
 =?us-ascii?Q?Yr3s14AaV05GcPol9fayg7MdVQBZygfAZYW3Z+zYZPas/wniIiBLv0uxeetR?=
 =?us-ascii?Q?t1zdlJht4b+DFXWx6zblI9FONs2ujZSYH/i+XdFwSagb5oEluRsQA32BeikG?=
 =?us-ascii?Q?fzI2sL3oRgCXGbjAbeOIo3YTYbX+IxuJMG9F+uDxCnXS6l2Yu6cHW9ANl/9H?=
 =?us-ascii?Q?4IbsAexKHVNdxTE/GYOrGmMMhD3enPlRBLvyX1PU4GYnLWF3d0GZWXcd/Q4b?=
 =?us-ascii?Q?OSJf8A3tFwNAg0ti8gGDuytRFYJx3y7laOE497D6FUIw3rTjSg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 11:18:47.2294
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 67387462-b36e-40a6-13ac-08dcb21bb659
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00022570.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6766
Message-ID-Hash: SJPIB3RASA4XQADNCMNIIPQ2KH5PFMNZ
X-Message-ID-Hash: SJPIB3RASA4XQADNCMNIIPQ2KH5PFMNZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SJPIB3RASA4XQADNCMNIIPQ2KH5PFMNZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move SoundWire dai type macros to common header file(soc_sdw_util.h).
So that these macros will be used by other platform machine driver.

Link: https://github.com/thesofproject/linux/pull/5068
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/soc_sdw_utils.h           | 4 ++++
 sound/soc/intel/boards/sof_sdw_common.h | 4 ----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index 13941ddd24c8..7912ff7d2bb9 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -36,6 +36,10 @@
 #define SOC_SDW_AMP_IN_DAI_ID		3
 #define SOC_SDW_DMIC_DAI_ID		4
 
+#define SOC_SDW_DAI_TYPE_JACK		0
+#define SOC_SDW_DAI_TYPE_AMP		1
+#define SOC_SDW_DAI_TYPE_MIC		2
+
 struct asoc_sdw_codec_info;
 
 struct asoc_sdw_dai_info {
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 8bfdffde16a3..02f3eebd019d 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -54,10 +54,6 @@ enum {
 	(((quirk) << SOF_BT_OFFLOAD_SSP_SHIFT) & SOF_BT_OFFLOAD_SSP_MASK)
 #define SOF_SSP_BT_OFFLOAD_PRESENT	BIT(18)
 
-#define SOC_SDW_DAI_TYPE_JACK		0
-#define SOC_SDW_DAI_TYPE_AMP		1
-#define SOC_SDW_DAI_TYPE_MIC		2
-
 struct intel_mc_ctx {
 	struct sof_hdmi_private hdmi;
 	/* To store SDW Pin index for each SoundWire link */
-- 
2.34.1

