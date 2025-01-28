Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E72BDA20481
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jan 2025 07:37:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D44C601D0;
	Tue, 28 Jan 2025 07:37:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D44C601D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738046271;
	bh=rUDS1W7GSY9x3ufKyR5TU335l/+EBtmFCipUhA7YfhE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eNo1Vs1nYXldMXW/9OiEPaWCVnWOK4WLYIC99OKD7BTKLj8UTo7Bl2b29QKAOjDUx
	 eFBQO4VCW6iwgH9dtMIYMiBJFZAusK2eQ+B27qNtNvYOZlis7EiAb9DXQT0p0WMm4O
	 NMzhMggvPafqFJZdve3oQt25DZ4qYT2UXpMhfoCE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A32DF80605; Tue, 28 Jan 2025 07:37:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77184F805FC;
	Tue, 28 Jan 2025 07:37:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A3BCF805C8; Tue, 28 Jan 2025 07:36:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::61e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B0312F805C3
	for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2025 07:36:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0312F805C3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=XhrwgL5A
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eRC24hxY90h9Jj93gR9u3KEShQ1G1W3okN1uTWC9UI024yeL6ka2BhJOdiWwZKq/0qshRTbsADusp5uwDQsDb21kXDk12tB91xOe8JwhLIcs0KQs8IlD6KtMrQXKLRKHPWpvT6uGAvDfPQrZwv5kDklhbirrCotzAvo16MQbmPS69IVdTEpAVIJTc/LKPr/JGuKP3xATR/SG/EoRnFT/LlgrAJs6z49fnU1C2j3paQyVqBOeOf3OO0MwoZ6iZptmouppW1cljPdOjRBpO8O5hLAPxaEgRLss30YE8G9QZL66mOXwIOijilSoGIAJyqta3//LeV9JXXs7n0K4WXMHsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+TII58PpEldSfBplN7Tj5YOOwq3yThcAXWsizYmDV4=;
 b=BvYJ6glw9ncuedopArmxskkCdXWeW8Z5sGL5pLZv4LJnANOLEq9/g8r5s0n3zSywnj7jQmEW4cnictvYlgOFqOAtNYDn6LG//Em+BvNB2zcwxGyP7UMh1QXOmAlNxKZ879JH/dH0q0zyPquS8korGN6VVxvWd5SwJCScqcYX8WWps13sf2c5ngErLpFegfYy813Zx2QzSKKIap9MhHj3HDJg185/1oDIadMqoV4XhP7HpcGC5SHJOvnqPtWwN05POD4ZDXMnW/ipReZ1JYwPdBEbZfG+8B6eSAMVQyJ3SRHWgbOzwwSv+CqaSZIs8lq4u5OB96/MGf3ilPgisD4+cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+TII58PpEldSfBplN7Tj5YOOwq3yThcAXWsizYmDV4=;
 b=XhrwgL5A+Aq8sye3auwUQB1uFeuPllH8c8FM84zfWos51TNobGz/EbLKZMVZCfVzig2WIG/faCZYNrGeNh2BtC84CpGo5kFEQV7WbsKN/WRSaxPL1uoNfyQEC2GLN0SvKLDJB/n0reNC8i18amurMafZBLGgzsHkmmA9MoYKPEg=
Received: from BY5PR16CA0014.namprd16.prod.outlook.com (2603:10b6:a03:1a0::27)
 by CY8PR12MB8241.namprd12.prod.outlook.com (2603:10b6:930:76::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 06:36:47 +0000
Received: from SJ1PEPF00001CE3.namprd05.prod.outlook.com
 (2603:10b6:a03:1a0:cafe::49) by BY5PR16CA0014.outlook.office365.com
 (2603:10b6:a03:1a0::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.20 via Frontend Transport; Tue,
 28 Jan 2025 06:36:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE3.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Tue, 28 Jan 2025 06:36:47 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 Jan 2025 00:36:43 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <sanyog.r.kale@intel.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Mario.Limonciello@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH V3 2/6] soundwire: amd: add debug log for soundwire wake event
Date: Tue, 28 Jan 2025 12:06:20 +0530
Message-ID: <20250128063624.1922470-3-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128063624.1922470-1-Vijendar.Mukunda@amd.com>
References: <20250128063624.1922470-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE3:EE_|CY8PR12MB8241:EE_
X-MS-Office365-Filtering-Correlation-Id: ea1e19b4-b922-4bb6-4dbe-08dd3f6623d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PQPuDmEP/qo8Qtc46AfyZHE9EMwjL6TUxuDdIlqPn/AC+cl64hFG8zjOVxBs?=
 =?us-ascii?Q?+tUdLJ+EBNNLxJ1Ty2+FF/HzgYsZ5btjHGsl6IZn9YSR83lYGGDMxb62ZVEJ?=
 =?us-ascii?Q?J69WRLCi+KYWjoidDO8o5aLh5pQVXSLuY7HQ6iPpeWXdarQHalTZhotyGaMC?=
 =?us-ascii?Q?P1PFcHGRQ67TsXXOKcrv4LWF7GGYmG1W26P8eWepEgPayx+/KTskqKu4RdCB?=
 =?us-ascii?Q?RMqYuYpm/qK+7CJB/oVl04FBgnQSt4bFTjrj1HkmBiKD9Feu0h5VVOGNcUZE?=
 =?us-ascii?Q?xiEHY2g5IsjTodhB7/LV0kb7pLHALjDG+9fsGqVnr+p0XwTsfS14N+zFFwQQ?=
 =?us-ascii?Q?fS2xjPVCBd7UOGtAta6VV09z+t/MSYOKAkMzgfmKFifwjyzmLWp/sg+9OEQ9?=
 =?us-ascii?Q?2nbqeRLveAhVTqFgUu3H6si5DBWTAvY5LsMJqcZGoYYJlTQZgJ8fiWYOLTSz?=
 =?us-ascii?Q?x3sKPUWT2+T3aQ7URzPs9DjbHLIez/BAIzvQ4TKYsDQunxyrpgFHd7XC+ppY?=
 =?us-ascii?Q?mX73t3NUyeK+8vNvFY9JowtYm5meNOtKs5gudXQvJOmloUYuVBCwAOL5/Hl4?=
 =?us-ascii?Q?VZd/pCGLupFbgb23igfqUe7jH86hHcqHm+3VTp4EKBpJoEXc1mTTs3DTbnv8?=
 =?us-ascii?Q?qO4TRlaZa7x7Sb7XYz8DxJZhAvt7X0fYGb5ncpPwtpQexdgVi+EXkASn74+F?=
 =?us-ascii?Q?J3Z7lnmBf40KH6hY19Rz2xMJ7twVllD+zGDE2TkkjF9j590IZnOkxTB2BcEu?=
 =?us-ascii?Q?tdbZWMNzfy3XqWyl2nVSg0k7gy46iKKdKrjK9bSifaB4cW2aeCk25pbRNpXh?=
 =?us-ascii?Q?eAeatx2aMltMiRgQBYeKLKPUwcJuP+o2a7imqLA/86FlQjiOPT61XdQe74er?=
 =?us-ascii?Q?LaBY0KmUQsH7IrYmFOWsGWuB9nLaLys2D5K6WDF9H6pW0wIyExKn2w9oBVXS?=
 =?us-ascii?Q?9wR0r2vPXkQ2ScFUD/+rogtdaFN/Je0d80Wi3VuMYXXaAz7PvDgBIcnC9iBV?=
 =?us-ascii?Q?VLjqgEa+lyJ0SHu6bHm0qq6v1W4qnMr/OH4aL5uTko8V3PICvB44vZk/6ODk?=
 =?us-ascii?Q?CQ3wTrbr6wh8oCSQjg8LjWVMg1hNNrqb31rafjIb/W4XqOk7R4Xa5CryztGd?=
 =?us-ascii?Q?l+XXuAjy5Zmtbm8Hy6I/TktADAK6wmydUzIDcdMsueXbzeLL4HWyHudu8zzP?=
 =?us-ascii?Q?chE2NRdY3+u/Cb21VMlXljKQMLXnYYV6z+f5cCgqkxt0x1m6yWKUEBjaRj2j?=
 =?us-ascii?Q?3MxQVQq41f2ox+1oPEI0EKFsWXXpsmEnDl4R9L32dGgJCMhcZI8hxNEI8POw?=
 =?us-ascii?Q?WRxCJNGsoQjmDmIqZyinK4b7qHrR36+iZjqwlu/bW47Nd9P4+XTPNXuNsP0v?=
 =?us-ascii?Q?FfLtHZ5WTBiG4DCmlY/j6j07ZDToJTkFxjrZLoRZHvrOASUo+1HZy1jjuPRL?=
 =?us-ascii?Q?2xxSDVLUmlCstLdsCgYTqB0P0xyTMnHXKZJM1jAYybzznZPVZ5SLysJjkXhZ?=
 =?us-ascii?Q?IsbZwDDghMUIOI8=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 06:36:47.5049
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ea1e19b4-b922-4bb6-4dbe-08dd3f6623d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8241
Message-ID-Hash: WBFY6DMSGN4JPK7PG52TD4EV56UMF3WD
X-Message-ID-Hash: WBFY6DMSGN4JPK7PG52TD4EV56UMF3WD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WBFY6DMSGN4JPK7PG52TD4EV56UMF3WD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add debug log in amd_sdw_process_wake_event() function.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 187006e68ad6..60be5805715e 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -849,6 +849,7 @@ static void amd_sdw_update_slave_status(u32 status_change_0to7, u32 status_chang
 
 static void amd_sdw_process_wake_event(struct amd_sdw_manager *amd_manager)
 {
+	dev_dbg(amd_manager->dev, "SoundWire Wake event reported\n");
 	pm_request_resume(amd_manager->dev);
 	writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
 	writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_8TO11);
-- 
2.34.1

