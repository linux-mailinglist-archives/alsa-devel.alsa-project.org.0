Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 792A197B7E0
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2024 08:22:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00160DF6;
	Wed, 18 Sep 2024 08:22:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00160DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726640560;
	bh=hOezVq1+7iN2CEX2zu6ii4h12kDi7pUnqfq+F/a582U=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ur2WVAyHIVmO0rJr4/N/PBZ8iCMLRVNF98YXxWxO+f8HVmhBTx9ODr8lQaUR2AFv8
	 NNH8M6X7pWduf2wvzY2KJf/s2WrGvUkH+PzmZlzoYjx1HCZyv7mrHli+qI6Na0W8b1
	 5l0E6hELlLmwrMPIS4jUEGhehqaJ3p6SLFLWx49U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5776EF805B0; Wed, 18 Sep 2024 08:22:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43BF2F805AC;
	Wed, 18 Sep 2024 08:22:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E6DFF8020D; Wed, 18 Sep 2024 08:22:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20631.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2407::631])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 95202F8010B
	for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2024 08:22:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95202F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=HyrZoeCm
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PdjEk3/BDxtLZAc4OAeiaAvvdK2aCJvp+loNLAqSSL+e0nzcRp4MWzuSEyHKv8R4wXn9I48jEciwxwlMmdnDUN/ODQhoyKN1nduc7S1pi3i26xqjApMtMVFXatP9UT+rmvORl17+K99om/QZnKFXZfuF12FaFu1Nqjfp74oIfhrsgETukDr2jAXI8zTKxdYiy9joXLNSJeAXH6mTbXARfqiwddklq2cpSjS6+sWCUFwwus/frdG+KadPFz6Lt1xr1sesyK+Ea+RUKsQH/ubJAnm/7J+mJhZCE6WDU2XewQinSO8MMaF4/XFhNcEwbii1HQylwQJK3UMORnkIkwjSGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9DbNpM1+Et8OoKgJBCBnOtnExxvpnwQEy2lpYYAnl4c=;
 b=Mz55wS4I92cCrYHL7Gy41CyO+2m2AjXS5xFeumBG0wAR3ZgKiE3rATOvEu4icbRt4ciFt0OLgBUVjdsVVulmR9ipkKmRQqzHxrVeVuYz9pOkMNDFL2EHNHMgSVi+7HiHlKoLmLNR4ZUoBi1d4MAyQJw6FVXm3rBzAFCDUD10Z4StLAuvBC5IcLiLcO6rJA+J5IpvDilPnHZK/nwqjBcc2UCex9/nPV1hdERBjagpJblstkpj0U7tG/Lz1oHmYBFPA4LEz87A0/6isAFLvdPO7QF5IZR+ufNsScy4SsGpx4asiCnDb86XE45u99qZ6JskUwpO4OOLEnxW4eW0BgD1ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9DbNpM1+Et8OoKgJBCBnOtnExxvpnwQEy2lpYYAnl4c=;
 b=HyrZoeCmt2w0Fg3zevUFCASuyx/5y1Nu/b53OYCJWrFpbyQPevOtpZ25OwUpqHw/Fsus+efd0w3NfkccSL3n5jDPlfUmDZqQrd7FjpTZsekdLEQNvTvsAItu1JIV+c0Rjij1rwV41l7GPodV7ooajQPqtxgAN67rWdxdD8Jt7Dw=
Received: from BN9PR03CA0523.namprd03.prod.outlook.com (2603:10b6:408:131::18)
 by PH7PR12MB9150.namprd12.prod.outlook.com (2603:10b6:510:2eb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Wed, 18 Sep
 2024 06:21:53 +0000
Received: from BN1PEPF00004681.namprd03.prod.outlook.com
 (2603:10b6:408:131:cafe::69) by BN9PR03CA0523.outlook.office365.com
 (2603:10b6:408:131::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Wed, 18 Sep 2024 06:21:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004681.mail.protection.outlook.com (10.167.243.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 18 Sep 2024 06:21:53 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 01:19:21 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 5/8] ASoC: amd: acp: pass acp pci revision id as platform data
Date: Wed, 18 Sep 2024 11:45:37 +0530
Message-ID: <20240918061540.685579-6-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240918061540.685579-1-Vijendar.Mukunda@amd.com>
References: <20240918061540.685579-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004681:EE_|PH7PR12MB9150:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e8a6438-b89a-4f56-7ef9-08dcd7aa304b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hOeKxHs3bBZ99W+lEZ0G7cehIkI7N3C+RZmQe0sxgAEzOZZPAja49FXU9eCA?=
 =?us-ascii?Q?7krQEPPL2YGJcAorrw7vVbag/zQJrR3pdYxnRLhhAB4sQX1kCz1CBitqqBBT?=
 =?us-ascii?Q?VJdIsECaw2Fxl4cDXlRLhjnuu8dsbK5WVHTTfI0URyo+ChhobeEShKf0yd2u?=
 =?us-ascii?Q?XH0S6GzvJzfmkkave9wyD5W2SJyktTdutDLPRlsnM26MZBL8W7/S8w90kqmD?=
 =?us-ascii?Q?qFpwEor6hX4Y1o8Hai25RUQk3K6V/Hq1kogPf8nZTUiP3w1xUjTf3XqRT2Lf?=
 =?us-ascii?Q?/vLhYG+1T+WKk76q76JZ4LnKxXy+oD3GyXeSlLulU+5uAjfxYkL1ObvNKxbg?=
 =?us-ascii?Q?ux+Hchqr3wK2A5G96nSXN6H+D4USE34SFI6ecvcXT2sSVStZRN6gUvbR+VAX?=
 =?us-ascii?Q?OrW9n8SWvHwDliFsz8XMCTXcIMpSJRDnlfxUzTI+koNqqA6knr0bYt9BpGQx?=
 =?us-ascii?Q?ONAzC8NW/jEYhOZ9gUzDDeeFZCZKgf5vU+8/FLVFiHr8B8mKMQH3PHOOXRm+?=
 =?us-ascii?Q?phCCqgl2Ybltg5LsWZf45XJ+9L3b/xHLkhb93yrRI8DNqqqxXDvP8eyoE+M0?=
 =?us-ascii?Q?9MZo3LdLGVVgjQUspyYLfqDeWCWc4XvEohM59pvRPiSzD4xKuug4p11Osd5U?=
 =?us-ascii?Q?RmvIsWD9/q20GI/vWnjhv217392bOZVnE4DEcIqaq2Z3r6w2w2RmInpc5GD2?=
 =?us-ascii?Q?vjfR8GHYAQJOeSIwxKt8HqL1ZKCF/wfIHm0e2yyERc6hzMlfy4WuN4OCKARm?=
 =?us-ascii?Q?lT5gf+PEewBc/hKEJYBTX8mmtCuttvV0PDohiBleZ6Ih1qBdWJEdlya7Q0sa?=
 =?us-ascii?Q?8NgUKoBBYh9AxxeTnMgPD9h0IQr5M88OZu+GPwfndROpJPngyGr7Iokcvrsj?=
 =?us-ascii?Q?Yn43azWsyaCz30FZElWx/OfGjgEpIObNuOjvrHLv9Ryl+S477ZcviYPH/gbs?=
 =?us-ascii?Q?sqF0S7Hp6WdBcQxK0Ap7NOzKjh+Rf8WP8iFODoYgK7XEdACm8seyWTLJP97D?=
 =?us-ascii?Q?Tb7tqmwHoIEY5FTRFr/cHENCSXOA4hRx/VmT9yNFfNvkJpLDQlvSRPx5m9XE?=
 =?us-ascii?Q?xOEs43K4gaYJFnHegHTn1Z/tr2pTVOfx0nLzG3VbZpf1fNHXnpWL/pxcp/r4?=
 =?us-ascii?Q?E6kkGGF/OoaE+2SSNveJBjngJfJuMzTmHiyO1QNYVCfC199Rm3Gzg0JVQs+F?=
 =?us-ascii?Q?UAGcsNk7QNASNivG7wgWhtYYMMPS2henigy3KUDjzhHbTbGNN/hCXxQ44Hqp?=
 =?us-ascii?Q?ntVC4yi7eIP0GoIMkFAHq7t/J3ft+sRVjfPpI3gWEqr0GrHExCKFPxlpp8wo?=
 =?us-ascii?Q?1LnwuvTAoE3GQ8PEcAs+1mns66gNfDDw691EHb4S+3ul/L69bCwmLovsWNwB?=
 =?us-ascii?Q?9jtPMvrmyC27qSdm73ywaMhJDfUyPEu5kxW+evXT0H89Ft0TtkBA4+VXqCIL?=
 =?us-ascii?Q?soDsA0KA7RJ+iPEf9UpeolptFYV/bdJI?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 06:21:53.3809
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8e8a6438-b89a-4f56-7ef9-08dcd7aa304b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00004681.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9150
Message-ID-Hash: F5ODCXSD3NDO2VTA2TUGKHS6LLOE24SY
X-Message-ID-Hash: F5ODCXSD3NDO2VTA2TUGKHS6LLOE24SY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F5ODCXSD3NDO2VTA2TUGKHS6LLOE24SY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Pass acp pci revision id as platform data to machine driver instead of
'platform' variable when ACP PDM configuration is selected. 'acp_rev'
should be retrieved from mach params revision id for other configuration.
Modify the conditional check for the same.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-legacy-mach.c | 5 +++--
 sound/soc/amd/acp/acp-platform.c    | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/amd/acp/acp-legacy-mach.c b/sound/soc/amd/acp/acp-legacy-mach.c
index 2a59f7916e15..3526fbe2c84d 100644
--- a/sound/soc/amd/acp/acp-legacy-mach.c
+++ b/sound/soc/amd/acp/acp-legacy-mach.c
@@ -172,9 +172,10 @@ static int acp_asoc_probe(struct platform_device *pdev)
 		goto out;
 	}
 	if (!strcmp(pdev->name, "acp-pdm-mach"))
-		acp_card_drvdata->platform =  *((int *)dev->platform_data);
+		acp_card_drvdata->acp_rev =  *((int *)dev->platform_data);
+	else
+		acp_card_drvdata->acp_rev = mach->mach_params.subsystem_rev;
 
-	acp_card_drvdata->acp_rev = mach->mach_params.subsystem_rev;
 	dmi_id = dmi_first_match(acp_quirk_table);
 	if (dmi_id && dmi_id->driver_data)
 		acp_card_drvdata->tdm_mode = dmi_id->driver_data;
diff --git a/sound/soc/amd/acp/acp-platform.c b/sound/soc/amd/acp/acp-platform.c
index c772520227c7..a6e5cb263377 100644
--- a/sound/soc/amd/acp/acp-platform.c
+++ b/sound/soc/amd/acp/acp-platform.c
@@ -114,7 +114,7 @@ int acp_machine_select(struct acp_dev_data *adata)
 	int size, platform;
 
 	if (adata->flag == FLAG_AMD_LEGACY_ONLY_DMIC) {
-		platform = adata->platform;
+		platform = adata->acp_rev;
 		adata->mach_dev = platform_device_register_data(adata->dev, "acp-pdm-mach",
 								PLATFORM_DEVID_NONE, &platform,
 								sizeof(platform));
-- 
2.34.1

