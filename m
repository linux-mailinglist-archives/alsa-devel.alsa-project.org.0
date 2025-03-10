Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9BCA5A2F5
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Mar 2025 19:33:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C897560685;
	Mon, 10 Mar 2025 19:33:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C897560685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741631590;
	bh=2BP6YuyeU4WhFXCNvBTr+wMceAJSBSimCl9+O9wmgjU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BRF5e4CcUpkQnhU/LLP7Y6RmwE6qW/bjP2h0T+ERPfB8QAPtIv1PHUh3ez7XzBFhv
	 17E6cQbfRNSyywfieRJUNSvk8aKY/J7BESjl91BVaYqodF2J/ViRFls1L23KCoNcxZ
	 7ua3bBpRw539/oj2syEVfwKrsp8J+GdXa94/gDh0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F3CFF805C3; Mon, 10 Mar 2025 19:32:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 252EEF805BF;
	Mon, 10 Mar 2025 19:32:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 962D0F800ED; Mon, 10 Mar 2025 19:32:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::603])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8BA0F800D2
	for <alsa-devel@alsa-project.org>; Mon, 10 Mar 2025 19:32:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8BA0F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=dgH7G/Vv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uSCkpApqfZBU/wvJUt2c2+OevSxYc6YiNM4zC6wZWzefvgtWwEknxeCmlT9mXX4ahpIDLBRGleUN9v7cr08lysRLYuceZcT2EfGa9uUP0mvZ7gyogcyLbWKnezikT4r7bHEByG+HkG0pk8MA4j0OomP5OP5fKMUJpTdUKsjmsRbJy0rnR7DCnA8oV5BkNB2p9vA5TkKWXpWue9ZOrhmNs8KIEcJ58URCgIhVeFxUuRtPyVDj0KgGnwljwT5q4jYMvOswwvpJJzIJY/6dTqSZTkSHL87iubbL/Igpy1UKy2KqFxUXWeaExywBqTWkhMQOjQMaq/NDqpmmEs6ZcTCvHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V+bLPr6B0TtWHXRNqjxV0TEG4yeJkcpDDbO3jsYEi6E=;
 b=pp0Ogb2AdHOc1hvL+BBhssoSwwmAMf8fmm0yXWeG6kvBNdoOimowLvVATSSUwSr9v53Bm+YJq49W4JW+QHkAyJ9nU9pZc2FUbD5qYT4UADz5TF9ZQRVjoJf6lsai7dCX4F5tYW6jlBM1EthxhLVAJ4IXHoosg7r44Klqo/OoY4b2eE4rBc5OM5hajMPhlxUS1ckTjBSh+JDQ/m1nC//hOmloHjC2fz0FFShAuhuXCu+AX08+A5JkKoCOFEPpZWtdKPApi7YZN67CHHr+qFGycqFbMWQJ5flT7QMneyR0cKZr5iTaijnxg1978qm8/UH38Hc8irWw/P3BWKDp9az0Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+bLPr6B0TtWHXRNqjxV0TEG4yeJkcpDDbO3jsYEi6E=;
 b=dgH7G/VvbFqPVRLwy/TqzYNH/rYI+ZCS3BAotB7U0z1nAFMhswYnTQW1DLeDveNaB5iHu80ek2ILUYUPnEPjJMiSljJ+AYRIPcP2L/1q8VCEU19tTzi/r6KqRaoPu9++oLHeDwTasRCknB8re0uOFbF1VKStv6Z9S4lnKFJgYP0=
Received: from BN0PR04CA0139.namprd04.prod.outlook.com (2603:10b6:408:ed::24)
 by CH3PR12MB8187.namprd12.prod.outlook.com (2603:10b6:610:125::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Mon, 10 Mar
 2025 18:32:10 +0000
Received: from BL02EPF00021F69.namprd02.prod.outlook.com
 (2603:10b6:408:ed:cafe::72) by BN0PR04CA0139.outlook.office365.com
 (2603:10b6:408:ed::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.26 via Frontend Transport; Mon,
 10 Mar 2025 18:32:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00021F69.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Mon, 10 Mar 2025 18:32:10 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 13:32:09 -0500
Received: from prasad-lnx-mach.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 10 Mar 2025 13:32:06 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Mario.Limonciello@amd.com>, <Vijendar.Mukunda@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<ssabakar@amd.com>, Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Greg KH <gregkh@linuxfoundation.org>, "Peter
 Zijlstra" <peterz@infradead.org>, Jeff Johnson <quic_jjohnson@quicinc.com>,
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 01/14] ASoC: amd: acp: Remove redundant acp70 chip->name
Date: Tue, 11 Mar 2025 00:01:48 +0530
Message-ID: <20250310183201.11979-2-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250310183201.11979-1-venkataprasad.potturu@amd.com>
References: <20250310183201.11979-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: venkataprasad.potturu@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F69:EE_|CH3PR12MB8187:EE_
X-MS-Office365-Filtering-Correlation-Id: 83c0128c-601b-4581-b3b2-08dd6001ded3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sGluWTd8bVYvkN56oSd3z7OsYGdlatprQ29oHnUBG3QbV0VksuPwMvE2c+wR?=
 =?us-ascii?Q?JPNG4niFfWdyOqacY43HJKJrL1bJS/69GtjwzauZuC0znlIRcmcareeF+BH+?=
 =?us-ascii?Q?OlHUHztsx2EM/0G68R/bedYxOVMvvIwOOkIO6IJ9ksBtdiL/lX69Z90VTkRo?=
 =?us-ascii?Q?mTU/RU8QF8hnKBE5ca2rKWnUrnXF5OTRsXvVgh16/suUSNgoxixYCHdWgeTM?=
 =?us-ascii?Q?YNNIrq5QUX8OxcAHt72Z330D1DVwCwZv6NkrwuLZDhw2FfQVX+/EmUjwwOS+?=
 =?us-ascii?Q?744CtKqoaaXu+cttI22w2BJITRzn11JG1m8zVsh1dvpJdF0o4ORxgRLfCZ8J?=
 =?us-ascii?Q?ndz2lGmZ89Q5pBoxM1gfCF5maxHWK+Ee3uiOnpBpNc6w9ai6thUj7h+9D7jU?=
 =?us-ascii?Q?eiHDgCAEeCDsFD8c+VdRAspVJOoaWnqHv3a4ByAOny4tlISvQjoSQoY9vvF5?=
 =?us-ascii?Q?JWPQ7Ad1IRmpc6pI8HrGTMBRk7P+kC8bMFFr8E9Qp/aF9Jm/m5lN5F99Tsg9?=
 =?us-ascii?Q?AJN2vxTVsTYUFIj/QziFq8OnvmqpSQFeiF1KWez6P0/Ab2cCLeShvQB51nmG?=
 =?us-ascii?Q?c3IzTrxns3afRUX0gnMuUviHxQ3vQeCHYgIW2tWjIu3YNu8lp44Oiy257OKh?=
 =?us-ascii?Q?AOItc8EPo9pAfKUyFOYjxzBKVr45FLdvLFKEc/xRlGI9TFBZefB7+dnF/keD?=
 =?us-ascii?Q?xJIe4ceASP8uu4jiGSo71w/7A2yTQGBqcY5ht+y6spZxvpvmNh7u7xb78CIy?=
 =?us-ascii?Q?SO0npp930KEVn7e6rpiReEFwfQk58YAsw5WJ+i3U/AWCoGrniZuxkBGCAaYy?=
 =?us-ascii?Q?0an88bb1y5urOfjKkNilK7U8LAvc0Iwd+jIHLTdUDmbpT1VOgIx83D0r0wM+?=
 =?us-ascii?Q?BC6qhpQki/csCUEBEq71JCxzhfqC1eJ1dotevYZA4Q0cWaDuUGqXjhiqO96Y?=
 =?us-ascii?Q?pKG1xKAs1ZCs87opLO911fwuFZOx17Vuy5WvoYBII9KuES2sj/edH8ByS+5T?=
 =?us-ascii?Q?/rSEFJVXAj8qbUUZAcogG/nFinTgQQ5MtiGaoNV+BEF/1P7B4VrAZKPg/ama?=
 =?us-ascii?Q?1MX0w40vMWuk8AtDVeNo1NcQi2Ts8+SqnLMB7bVUGvC6kMk2ODr8YJlQpBzh?=
 =?us-ascii?Q?66pxzJwY+7xZznMUnQ6msNErSqx58N+JUC0k8AvGtJIEnAPWhZuUznjXX2aJ?=
 =?us-ascii?Q?4eDz8e2T4gDXQx2eiqH1GMMl2qrjLdN09IP/7W1o+8kNMs+QDc1R8NzGorZ5?=
 =?us-ascii?Q?pVkTOJoDtWBMtoK42bvE4T9+MZjsA0EUX9yff8V0B3GIA7dSjJM+QvfcBZ39?=
 =?us-ascii?Q?wOXwC68V9ZTIrcZBkTkvxPsYRFYwPuW9Dn8jopN3Z21WmF5oQ36dJ1p38AJN?=
 =?us-ascii?Q?05HlecvuIbHreISMiw1D08hmnrhoLkhl7BVcRP4jYBnOeSqs5DUia9Q45sFD?=
 =?us-ascii?Q?dDMz+CzT11TjiDJOdM27qoRL/bNo58p5vDfW3pHYW+Y3mfwiN8qBtzp7OqJC?=
 =?us-ascii?Q?SMSQSW3cXh99/II=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 18:32:10.5815
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 83c0128c-601b-4581-b3b2-08dd6001ded3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F69.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8187
Message-ID-Hash: W3SCOFKPYTOSS35ZHRI3S3WNUSLLG3BR
X-Message-ID-Hash: W3SCOFKPYTOSS35ZHRI3S3WNUSLLG3BR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W3SCOFKPYTOSS35ZHRI3S3WNUSLLG3BR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

As acp71 platform driver uses acp70 platform driver, remove the
redundant chip->name.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/acp-pci.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/amd/acp/acp-pci.c b/sound/soc/amd/acp/acp-pci.c
index e0fc42d939d3..dcd92d716e78 100644
--- a/sound/soc/amd/acp/acp-pci.c
+++ b/sound/soc/amd/acp/acp-pci.c
@@ -89,8 +89,6 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 		chip->name = "acp_asoc_acp63";
 		break;
 	case 0x70:
-		chip->name = "acp_asoc_acp70";
-		break;
 	case 0x71:
 		chip->name = "acp_asoc_acp70";
 		break;
-- 
2.39.2

