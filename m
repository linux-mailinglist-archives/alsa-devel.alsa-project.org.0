Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBHoGNOZlWk1SgIAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Feb 2026 11:52:03 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16624155AB1
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Feb 2026 11:52:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89730601A9;
	Wed, 18 Feb 2026 11:51:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89730601A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1771411922;
	bh=cBXvFK/mxp6mdswYH4cgs060Cw3GNyKZv0ev1oK24Yc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CCLBnuk3VvgBRKso7E6TIUPMWzKt/4/dA3DhTb4GcULW1+j9+DuPBnFNDUrUY7Cs7
	 WSXWJzVty/ghrb2WKntJ+jbF0lWCOlhgrAnCI+sywNCYOaGONxKrYLmJUidP+hRp1v
	 ePgMv3vsdyQPOxjooEuydDnOeN8hfmueR+NDoomM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D84E2F805F3; Wed, 18 Feb 2026 11:51:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F165F805EF;
	Wed, 18 Feb 2026 11:51:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0CACF80525; Wed, 18 Feb 2026 11:48:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,KHOP_HELO_FCRDNS,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_DBL_BLOCKED_OPENDNS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013030.outbound.protection.outlook.com
 [40.107.201.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7FF1EF8045D
	for <alsa-devel@alsa-project.org>; Wed, 18 Feb 2026 11:47:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FF1EF8045D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=0MXfpajp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kK0kvkiyhiQcygy5yq50WCdQFDQwq0QNA8AHB2L8Aa5H9iFLKFaXv/n0WrfyibgsB0tyH16GNFSjAeXnBtUBJ3HXXfqkvnhOYROj1u5crvoZ7yFXLy8AWGgl5EbQaBUk7wT8apZWC/lQYo/5xG7u6wPom+AwZ2BRhMJEgb7o/zVf7qWrgsBB/duzOdKnknOdOsUNaKx2bWcvBQhhgW8VXdSHjhNBufZGVm2vPgrfbqTkyvZ4wnlTsyLVxnSgLHOZQCuyQFAcHff124FDZ58en9i98uGbwHlKcYaYqtP1D/eIUeiZIRzL87MJoi2Po19mFNHetcJFH6FyqG9TUTV2gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7jECJ96pbFO/rVWx7EVBIxOjhkIKJ1yqhQ0bgXUTUoQ=;
 b=YYHHuRltCSxkZ7P2z17GD8tS4G2hRu1OLoeSFV7PXtLqFShZ2dYCEYnKysCRZkaCA5lHRYlI+1WGKufD63LQQLae74PozWdubk/2VCuQAyDYIBSL3Ovw0qafqzNWI7GtgS5tXYX82BWBYC+DBlsloVC5GPWVqUo+PuWuiPsRsbyCD8Zxuu9aAvas+YRw0X7oUtIA3fOfnZBul9hpM41YfUHyrQhxRcMfgj90JC5H6fwOaP5JVWCN59dCHkq8/q7WvmespNi8TGO8e1VcOfVW8e5CnmSd6E6WVhBnNT5A+V18QjLdV0jLrXc1E+RLwUSP6OGiqi1QcPZv1kRdC2NMxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jECJ96pbFO/rVWx7EVBIxOjhkIKJ1yqhQ0bgXUTUoQ=;
 b=0MXfpajpMHZ9vqiFvYivqlZ7BjZ6GArqc5RVGx2mZPzsXD7y0tzo8YVXnuaF9+wg+BOU6iwh//GdcjxzcbYxobMKsbw4jMgY7vOCife9m23lXYPDTf2hmAO0DIDX48eC59NXG1QiOUbUEkqW7k46J6dX4veEnHXb2+TVQMSf5f0=
Received: from BN9PR03CA0407.namprd03.prod.outlook.com (2603:10b6:408:111::22)
 by DS4PR12MB9747.namprd12.prod.outlook.com (2603:10b6:8:2a5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Wed, 18 Feb
 2026 10:47:54 +0000
Received: from BN2PEPF000044A4.namprd02.prod.outlook.com
 (2603:10b6:408:111:cafe::1e) by BN9PR03CA0407.outlook.office365.com
 (2603:10b6:408:111::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.14 via Frontend Transport; Wed,
 18 Feb 2026 10:47:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044A4.mail.protection.outlook.com (10.167.243.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 10:47:54 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 18 Feb
 2026 04:47:50 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <mario.limonciello@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 1/2] ASoC: amd: acp: Add ACP7.0 match entries for Realtek
 parts
Date: Wed, 18 Feb 2026 16:15:33 +0530
Message-ID: <20260218104734.3641481-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260218104734.3641481-1-Vijendar.Mukunda@amd.com>
References: <20260218104734.3641481-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A4:EE_|DS4PR12MB9747:EE_
X-MS-Office365-Filtering-Correlation-Id: 8112c8dd-fc4f-4514-94d5-08de6edb2b92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ovDykFoLFn9yIB2ic2ZFqsy+eBk2Xg2YTnHmfnm3Sc6tufFZxSS/WkU+R+Hn?=
 =?us-ascii?Q?ykLgy5oLFknJj122iXNIoTJX3y5aq5zhM6UK9GlP26LHnDMFLJij2X8cswbh?=
 =?us-ascii?Q?AnmR4P0QbwrQUK1j/JvOLUFcqwfFu6uKsBtNcZjnTpYlRMi4RnkAl3Gm45S9?=
 =?us-ascii?Q?vIPnXG0uF10NMAx1JrtlQR7KW9pkK5jKFb9kXdZsq7YgktSoqNXq+glp+Iqe?=
 =?us-ascii?Q?Qe+QHKv+zvM0tU3GohQfr5lZ1R62tjT/L6f+W49VC236PwDXsj2BRExxpApC?=
 =?us-ascii?Q?FVDJBL2rbbuJlqWnpKC2LNKZoyXeEzgucbGIMlBelbU6KX/aGpZ+WhwwyAZd?=
 =?us-ascii?Q?cCPuOimsoVeeF4BXSnopBgXykTCzz05mGORwv3uN7q3z6zKsr2ilqiIK3Ibt?=
 =?us-ascii?Q?w6SpwhK/Y5XlxsPlXbkVNLWMK1rsMWrE3/pgiIDOA8aoSCrKyOQE4gZmhUe0?=
 =?us-ascii?Q?8y5NIEBlDv0XyDWGzSIrcGEde0MVWmqzRk6WqKDtlgxBj7e6fnHr6phYIkMz?=
 =?us-ascii?Q?EZQ+I6EWGcACnP62KViY2D6JY4c5u4jEKy7FLc5qVtiUQoZzsYLhNte0JqM5?=
 =?us-ascii?Q?nxMTdfTwF143Y4BBjDmXp6A7p+8sB3iBMbKoUrBB7cGHgbBOG7vlG6SpFb15?=
 =?us-ascii?Q?riEUk64GQ0tGMOts3N4btj/RVS4i/6GSle7/1vrEPUv3fPQk3+acllw5Oa9P?=
 =?us-ascii?Q?WgqW/RseoBNeXN8f0bp6p5AVGGEgzuljzKKVeR0CH+f7+vqa0QQvW/R0UZft?=
 =?us-ascii?Q?WITuWXbHZ1VWilqx9h0DXB7+eTru2BJ1HTn28Yswoql14xM/peFFsXmEs1zl?=
 =?us-ascii?Q?fCyybZIHV4OPTrV6gihV6fb25xon+gChZPh7oA+tYAD5jn2JIcTw+ANpXmiy?=
 =?us-ascii?Q?EJkCfiVi+psN0atUhpv/54CTDMDeLIgykQpuYqb8WE2M/geM9MsxtPLY/OVX?=
 =?us-ascii?Q?xZTP68VkEXrB0LRF0y0AjXVO84WrcYa8XeAYjMZhy4yNV8ko+6d34D7CGsl3?=
 =?us-ascii?Q?YJarSaruXI72ZE6ohvbH+taj8hrv8AThOWHxSmXywmr9hwL174zSmEJOTMK1?=
 =?us-ascii?Q?J/cyt6RfGbeMMx7/wT7zwGhmNOP1dyuImDFM0EuAc7/QiJBoUL2aAjRbO0MH?=
 =?us-ascii?Q?MEIrQmlq0lMdw8huY7cdAtj76c81qqJ3zXBbllJtxTMi/rmGbudCRWUWf6Kx?=
 =?us-ascii?Q?drQwrSWRp8CjCFthv22v+rcVTDKAw91Jm6m3j/8lb+3WuWJ+HjSoIuWSwlDN?=
 =?us-ascii?Q?vnYBNo4LVO7Xm94ohESY7wUUa/ks4mEkFF4QDRSu4rHuDoVvOt7RLLQOll0j?=
 =?us-ascii?Q?I30sQ7uknaBbnCGAX81zOEuv68GHp+7dDgiHk1ZN5rT/qsX1WTEHOlzfoS11?=
 =?us-ascii?Q?UodFZiuTjz6I+s2/yK/ooZil778qwm2+OllM3QF0bvDsBGGa0Ng2UL+LEhs0?=
 =?us-ascii?Q?0u4scERq/x+Rpaj4EBr3dtAXuj6dr7QXUyWNw7tX39lat48I7iqgUg4DA4Q1?=
 =?us-ascii?Q?Jgo72EVfG3c7QJuR8LW/72K5Lo/JkdppDvBsoPZBwkvHDGxHr7LkPzNkE+kJ?=
 =?us-ascii?Q?hjz/P9yxKgTVoL+5z3O5GaXVHwBHQsT0K1lpEHxfSZY2iuQKCIFCWp3xxx7w?=
 =?us-ascii?Q?Ggxhiocy34mCUWzSg5EZMc0RfLAyN4eySvSfbVrSVEJ57v251yKHszdXmmEd?=
 =?us-ascii?Q?e00Pjg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	S5sUbm8XldswWUZMv9QsE50FiPEw4NlArScFlRRmYGX7OFN7xY7F6N5GPg4zIXtV3z0oen9J+FD4JwYPiRhT+QAQgGCfHqURPsWEAkZg1Yj+m7+F1f1/bih0Z1F9jN9QrRCNf5AFw/5tUO8w29oq0X46q51mG4LwNjI0MgvFedHS3v3xckbBTXSc+YrHICXtzHqCqjckgdl7v9cOtR1GgCQjopDeXhdb3bRmIPGGthh3Rmhc77n4GVaVIO9+AKFDujkAVEYPv0LXz/tOCmJMGNNUeXCkJHSJ3XgN0WiCYqOQYsWwoOk5yn4mfFpedSQToOKAF8tkZUb1cNjXbNxUPj0PP3wbtBk1ReAr5dYu3jKuRVVqiHm8cR5DXZlpSXeQsJtUUy8P6UUx1lT1keyQCkTYUughOVbprC693S9K5cixQ+AT3tyCmQQ8u8qiAU5D
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 10:47:54.0697
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8112c8dd-fc4f-4514-94d5-08de6edb2b92
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044A4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9747
Message-ID-Hash: 6TXNNPFWL5JI4GRL5EY7SHZUNUAWJ3AR
X-Message-ID-Hash: 6TXNNPFWL5JI4GRL5EY7SHZUNUAWJ3AR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6TXNNPFWL5JI4GRL5EY7SHZUNUAWJ3AR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default,amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[alsa-devel@alsa-project.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[alsa-project.org,gmail.com,perex.cz,suse.com,amd.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:alsa-devel@alsa-project.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:Sunil-kumar.Dommati@amd.com,m:venkataprasad.potturu@amd.com,m:mario.limonciello@amd.com,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:Vijendar.Mukunda@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Vijendar.Mukunda@amd.com,alsa-devel-bounces@alsa-project.org];
	DKIM_TRACE(0.00)[alsa-project.org:+,amd.com:+];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email];
	FROM_NEQ_ENVFROM(0.00)[Vijendar.Mukunda@amd.com,alsa-devel-bounces@alsa-project.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[alsa-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 16624155AB1
X-Rspamd-Action: no action

This patch adds below machine configuration for the ACP7.0 & ACP7.1
platforms.

Link 0: RT1320 amplifier
Link 1: RT722 codec with three endpoints: Headset, Speaker, and DMIC.

Note:
The Speaker endpoint on the RT722 codec is not used.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/amd-acp70-acpi-match.c | 37 ++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/sound/soc/amd/acp/amd-acp70-acpi-match.c b/sound/soc/amd/acp/amd-acp70-acpi-match.c
index dd2b010efdaa..7a567ba02292 100644
--- a/sound/soc/amd/acp/amd-acp70-acpi-match.c
+++ b/sound/soc/amd/acp/amd-acp70-acpi-match.c
@@ -531,7 +531,44 @@ static const struct snd_soc_acpi_link_adr acp70_rt722_l0_rt1320_l1[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_adr_device rt1320_0_single_adr[] = {
+	{
+		.adr = 0x000030025D132001ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt1320-1"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt722_1_single_adr[] = {
+	{
+		.adr = 0x000130025d072201ull,
+		.num_endpoints = ARRAY_SIZE(rt722_endpoints),
+		.endpoints = rt722_endpoints,
+		.name_prefix = "rt722"
+	}
+};
+
+static const struct snd_soc_acpi_link_adr acp70_rt1320_l0_rt722_l1[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt1320_0_single_adr),
+		.adr_d = rt1320_0_single_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt722_1_single_adr),
+		.adr_d = rt722_1_single_adr,
+	},
+	{}
+};
+
 struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sdw_machines[] = {
+	{
+		.link_mask = BIT(0) | BIT(1),
+		.links = acp70_rt1320_l0_rt722_l1,
+		.drv_name = "amd_sdw",
+	},
 	{
 		.link_mask = BIT(0) | BIT(1),
 		.links = acp70_rt722_l0_rt1320_l1,
-- 
2.45.2

