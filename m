Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C443F944A58
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 13:27:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1DA434E0;
	Thu,  1 Aug 2024 13:26:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1DA434E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722511612;
	bh=CbYImhZEIlZiKsrtnBHhWoYSCtRUOfibwlmFEjkc2eA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cUFmAWxSsgp7gsjqtzB6IcRUGS/0TO0+HJdV8KGCh5F0gtN0Z/s4EpWYYz7GZZKi8
	 0UkdVXEH52bkBpD47Q19nqEVV65MLxJfO2QPDSAkaVRMKPqlCFwUukhQNpb8B9lcBZ
	 ObLwABEpTLyA9zlus2Ncc53FCsuoyoB4qq4hGH58=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EAC6EF806A9; Thu,  1 Aug 2024 13:24:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 827A6F806AC;
	Thu,  1 Aug 2024 13:24:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85FFCF802DB; Thu,  1 Aug 2024 13:21:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::600])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 26203F80269;
	Thu,  1 Aug 2024 13:21:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26203F80269
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=u3y8I57o
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HylcjWHw0koJjkY9Q06LfxOG+VR2rQ24R+XyW5lBC+g5qKJlXtGM3iwf2x5X0YyASOwKaT9Ony6R5B6WsiYAKHuqckxD/g52gf1zX19Llm8ct/biuu+sGQOSSp402F2UIZBoNWpGhySDl2IeVbMCGYCgRNBfSllIWfAziHUD7PxDcbMVdcEoVJ50Pos8fVKG6CFRjuEqoG+ZcXjbtYKhHOrrNg8nzRcVjU89YmOxRtm7ZRYLYYixd9Laq0pz/dmahi4151/LrUrQlROafnEV2xf3h19kxpG2eBnAql4ie9EKLp+em0Zl+JVpYqdx3BNq9mvQIa0CdF21IZ+9VZUjYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUsplPx+YA0cFRGB2LqLmG8miLuC4SkwCzhd7b0Wktg=;
 b=ek7duwUiELTXLUUsM5Wccf6J/kAAVy3lwe29dGjDoZ8UdU0cWeNkpF5wAumAloLxWllCQ7eLdUaJVx69Q7V/KW8LY9YI/DJ0F6wrctDYnIolL8uuMRxBsLfzsNrW3pIcklFCz4+mR/clap3DiaVV8ryw5xHBiztkEnJcBcP7Gok8E/nTGAJwIBAzEW0/4GdEVBxVBMNbRf/jvPps2KyGIwq5M7FOM6zhrlN8+8ZADb8GrumVBGxyfB+x4qBHKVR/whQkf6THp+R5tHGhhMSSJifdM6PgEm7nBF/E7nVhINiOL5wuZkcgTlqAPeNyX0XA5OmjXIF+hew0wyC7gX/RdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUsplPx+YA0cFRGB2LqLmG8miLuC4SkwCzhd7b0Wktg=;
 b=u3y8I57oEd15R+q6wmgGY4dfHgZH2G/UQjkeH3gv2GxkGoH0D8P0YKtimeadxHbtOIwJXx09JjW82acStuOxVjUqRRQaISMZN7KQzgIv/BDS5ew5r9R0xVEtGDwXtXvnIpbyukPYhlX07F2c03PYxEJmV64GwtFdxyQHf4g57/g=
Received: from BL1PR13CA0329.namprd13.prod.outlook.com (2603:10b6:208:2c1::34)
 by PH7PR12MB8037.namprd12.prod.outlook.com (2603:10b6:510:27d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Thu, 1 Aug
 2024 11:20:57 +0000
Received: from BL6PEPF00022572.namprd02.prod.outlook.com
 (2603:10b6:208:2c1:cafe::ba) by BL1PR13CA0329.outlook.office365.com
 (2603:10b6:208:2c1::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.6 via Frontend
 Transport; Thu, 1 Aug 2024 11:20:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00022572.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 11:20:56 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 06:20:56 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 06:20:56 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 06:20:46 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <vijendar.mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <alsa-devel@alsa-project.org>,
	<pierre-louis.bossart@linux.intel.com>, <venkataprasad.potturu@amd.com>,
	<yung-chuan.liao@linux.intel.com>, <linux-sound@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "moderated list:SOUND -
 SOUND OPEN FIRMWARE (SOF) DRIVERS" <sound-open-firmware@alsa-project.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND 29/31] ASoC: SOF: amd: add alternate machines for
 acp6.3 based platform
Date: Thu, 1 Aug 2024 16:48:15 +0530
Message-ID: <20240801111821.18076-9-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240801111821.18076-1-Vijendar.Mukunda@amd.com>
References: <20240801091446.10457-1-Vijendar.Mukunda@amd.com>
 <20240801111821.18076-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022572:EE_|PH7PR12MB8037:EE_
X-MS-Office365-Filtering-Correlation-Id: ce8b3f57-c999-43b7-b9c3-08dcb21c03af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?KWKUfMh2avv5O2gajfYayy7nIx8r50hoFKPDSIxTmzMxQ9wCyq3ZNlzl2jOx?=
 =?us-ascii?Q?ZLEplKCdDmP+9eg706UvnsaY6jL6NzrgpEMFKWVxaKV0PysPoL1ctbCMvwYU?=
 =?us-ascii?Q?iYHJhXdEQYKK4Ul8WTjGLXUQkYbMS+swae6BCRRXlVjhRMenTPqt+qaInyEY?=
 =?us-ascii?Q?WvVM3b+MBJ+2lKv5FUL/C2ZXD/lfnO82+7Y+Ko5wnz+/OBSMGGF9+u55da8V?=
 =?us-ascii?Q?fZgyxe/+0IgNyRj3eQ9uqjr9Qsy0FKk4C7HfLQYN0/07kPeRxC15rkoSle2J?=
 =?us-ascii?Q?Gp3MAe12NSeQTIWIR6fbXaeRIKwucCwLshlBKXDMhmGMFHZnvs6E5D2sinJu?=
 =?us-ascii?Q?Odt147stGbcHR8neRE+YTbmsAC2MDMNy7ZUAOyExQImOP9ra9tITxtWemO2x?=
 =?us-ascii?Q?SFe9k5WL/jne4U1dBrFMEQ1Qf8TVtuZtlslXN1KK4z5A9BN+UnTB0NuGe4ZJ?=
 =?us-ascii?Q?8pZeGOvpzLQioZ2EPoM3LdCU5WX0Ue/hkLj39ggVhVEOkLc90FxSZLGtIK63?=
 =?us-ascii?Q?YYkczPqrbpTBiTCictdN6KAskFhPtiLNPgIQ5jR7wCfY7kwUQq6UmZp0JuC0?=
 =?us-ascii?Q?CtNE/2gmMzEPPz2YHRzGVulmHs8VjZbtWXfDG7dRIJiAcKHrnkSv0DHk4IXk?=
 =?us-ascii?Q?644HtuuIwObwr8evnd+hdWU7NUcyuLFg0kYSbYDbP81ECqBfX3XfyDRW0eBL?=
 =?us-ascii?Q?eUAFpG0i3eT/qLzInjQKayZ541oMdkfv9Nuq/cQH/yGQcn670+Fj0AgFXHwk?=
 =?us-ascii?Q?hrbwjG6TObqtIcQJBKS6lIeXgQdE3iR6BYT7+nqvfTkXxZ8hSUii7z2pxKdT?=
 =?us-ascii?Q?tTDpJnum3A/WDOJJS5Zp68lU0lOGgXgn0X+Z23JmSCp16INfvfZv9wqe5dBs?=
 =?us-ascii?Q?X9+YS7f3X6YfnpnT4bTQDNC84cPejYxSgf9VtsNEuS2PjN10OIDco+MpMRBf?=
 =?us-ascii?Q?+oKtg+u84w8sipYzK5/kWo0H7iADhdtkX+BwdP2tt9agQ9BHDlygVgDW1zqW?=
 =?us-ascii?Q?a6ehCML/lbULt3BZSQ6ax/fcrgti+7Y6tMhFmV45Nvz8CPXqePJiiY+x82mF?=
 =?us-ascii?Q?upS0bwSHxADqxHmsTnUk4pPUXIl0zNC9pSKamydBirBZl7aPNbfnVndk0Res?=
 =?us-ascii?Q?8XKBQwZqZWuWMH9DCiqVWO/TmHucCk8OlJ1rWzCtcoFLMG5gh73hgUqUHaoB?=
 =?us-ascii?Q?MU8ipfdLwZHTkF74QB+x8Ma3UdX0LL6KSdguldcueV7wupQIjiAf470RbxIG?=
 =?us-ascii?Q?2MVcJpDuczC4tiVncVov81tgIa6XEEC53yPhwGjofQIzfoURK3SbC+hkwI+u?=
 =?us-ascii?Q?fQZY8jEed2RY5HlhQcfScpEmZ3PAKlcnmvXlW9ar9Fr/jdAXZb1VzaAuNDLJ?=
 =?us-ascii?Q?ingKdqO7Y/2XNi2mzqgl1CXGF0O8KAdPkQxblwwy3fK/Ki7AaA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 11:20:56.9662
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ce8b3f57-c999-43b7-b9c3-08dcb21c03af
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00022572.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8037
Message-ID-Hash: ALCFBKW4BD7AREMZBH3X2M6I2ZSBRLYM
X-Message-ID-Hash: ALCFBKW4BD7AREMZBH3X2M6I2ZSBRLYM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ALCFBKW4BD7AREMZBH3X2M6I2ZSBRLYM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add SoundWire machines as alternate machines for acp6.3 based platform.

Link: https://github.com/thesofproject/linux/pull/5068
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/amd/pci-acp63.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/amd/pci-acp63.c b/sound/soc/sof/amd/pci-acp63.c
index fc8984447365..54d42f83ce9e 100644
--- a/sound/soc/sof/amd/pci-acp63.c
+++ b/sound/soc/sof/amd/pci-acp63.c
@@ -48,6 +48,7 @@ static const struct sof_amd_acp_desc acp63_chip_info = {
 
 static const struct sof_dev_desc acp63_desc = {
 	.machines		= snd_soc_acpi_amd_acp63_sof_machines,
+	.alt_machines           = snd_soc_acpi_amd_acp63_sof_sdw_machines,
 	.resindex_lpe_base	= 0,
 	.resindex_pcicfg_base	= -1,
 	.resindex_imr_base	= -1,
-- 
2.34.1

