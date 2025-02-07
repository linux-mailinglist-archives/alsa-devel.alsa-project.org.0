Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA3CA2BBEA
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2025 08:00:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B312602AD;
	Fri,  7 Feb 2025 07:59:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B312602AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738911599;
	bh=zM2zh0uJM8rvEjfNegpihH264PTE4XAZU4iWLdI353Q=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EI7gGs1f61r459LYb5AyLudh+UGC9UYOvFGZLxK5g8RJE6H6ZNHulePffw7gPcaG3
	 jhJ4CIeYVX6IMsl5OZHHdmUM7PIGHftTF3/NjemJTcC/+qd8RhbDludNFNrgO4zVsb
	 4QCD0dceTpb9zzGvEmqgsTy8awJMxCcjrTw9TqYI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD9FBF805EA; Fri,  7 Feb 2025 07:59:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A1C35F805E0;
	Fri,  7 Feb 2025 07:59:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2780EF805CA; Fri,  7 Feb 2025 07:59:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::61c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 765CBF805C2
	for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2025 07:59:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 765CBF805C2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=XJIvaGir
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hQMsfDFCad3Jf6d00rWsAEqwJcDigXcB07Ows+bxcQnAqjNOaFjWuabwQFIrx4mzaDs72pd2ke401J4CODy9Lx/XQouwC7g2En9dK8Mhd1ALxfpk96lmwKnNHg8znEWDiPomBqpGZ52X7C03aZFc+Q6cENlT0QpNb8WVaPYaYk31aO4iXAxjxZUawtZC4N2FRBspNK+ck3UxShbA/co75KEA/toy/D/AYzqlBkDlepVL007drvNHh+C4MqQTHeXhlZ1iVi4HQpt67Dz2ZiL69iRgplP5fKQ7HC2QnYXrKI4FM+lfJ75gosS3w0IoiP+7pVlbkJ9YVO8I5Y1a9KfXlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PLKy6dTIYcrqkT+OBBEkmVnloXRQGYN6kFXV5rWHDsk=;
 b=Zex2wTzjqpaORXg7OaVS3pbqFBXoyW1YlB1G6+DwXLa3Sea1TplWLRVZN1lTJYpomMH57RgM6fw+Ea66DOtNr0F/q9EwZg0FeN3r3qoAfdRZaOEkiv9jF7k4YdSfh7e8zIeviszB47cQNkKb9X9TJ13ooLKHM4B7Zye5a8yEX4eTRXrHg/s9yi666glqtwd0wqmwemkrveJSrQtl6St41PCPo3vqh7pwgbN+ke9ti5dL1I4wtbm++v1wNUFIjW1jnW8VL3cyp0PCTWmQIC4MByYttYdhZMRlf7WLf5DMxcJjDflkVde2YNzTbdCvwJWECCjNvx3QkEQpQ6PlKvoX2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PLKy6dTIYcrqkT+OBBEkmVnloXRQGYN6kFXV5rWHDsk=;
 b=XJIvaGirEqdQu1O6HhAUV0ttI+cgabeq2VNTiJx0FWN1mSvyOqW0KhBjKkSCV4o/riHhfbsIJnKE/eUJqK6l+++QBKoSnoHcilzWuz/U8/0vnGMgLJFSYcyOlwQH1dUC0plpgVi4VX+qVppyXR0kfJkzfybzs6t0mmrRkZJEN/o=
Received: from SJ0PR03CA0093.namprd03.prod.outlook.com (2603:10b6:a03:333::8)
 by SA1PR12MB7040.namprd12.prod.outlook.com (2603:10b6:806:24f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 06:59:04 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:a03:333:cafe::ad) by SJ0PR03CA0093.outlook.office365.com
 (2603:10b6:a03:333::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.29 via Frontend Transport; Fri,
 7 Feb 2025 06:59:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 06:59:03 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Feb 2025 00:58:58 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <sanyog.r.kale@intel.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Mario.Limonciello@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH V4 1/6] soundwire: amd: change the soundwire wake
 enable/disable sequence
Date: Fri, 7 Feb 2025 12:28:36 +0530
Message-ID: <20250207065841.4718-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207065841.4718-1-Vijendar.Mukunda@amd.com>
References: <20250207065841.4718-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|SA1PR12MB7040:EE_
X-MS-Office365-Filtering-Correlation-Id: 87b0a815-51ec-41ef-61e6-08dd4744e826
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GWI2r8IxwzBmBeKDHEz3OuOs8BTx0l1C4YKIrtMB0YfdjaJ1NG2ezhX1Jqrl?=
 =?us-ascii?Q?uquR3wnGfZiEdx2klVZBKtHn2rt0W+96+7WqwlYaFU7sUxkV1qob7J9+2zcz?=
 =?us-ascii?Q?IYDbkbgOOXCK61srM+RfsCxqwheHQ3bZEb4Ek3hQKjz4Eh3ezyTQZqxesU2q?=
 =?us-ascii?Q?ZSGgde+oQOasYF4n/C3jUZwyw5xbpKaY/9kn3CVj3SYnL768uaIRqbZ3H7/5?=
 =?us-ascii?Q?u4GPpEB5yZDal+cG90mwn1V6z0jxEtDM/vNNgAt5T9yVWaPZ5MREokBp9mMQ?=
 =?us-ascii?Q?/u/Fisz+uQXH1dVkleSRBuddS8VUOKnaVqfndClZh6cVQZi1q5+0DwxeZBpb?=
 =?us-ascii?Q?v9zMU8aIfPF4zfsxmnOQavQQvipgMv/q4Jbi0Gln70niqX1+BFm+D2LgCmhr?=
 =?us-ascii?Q?NgcXYzQfeqVqB9uy/NH9xnmZETpVLhlTXx3lkFsjkMY4hmJbG/VNHTsTk+0C?=
 =?us-ascii?Q?LviAcXFhyLXUEfpYrfPho6Y+90Rao/wEqr1Wbdjy97za/2J0eVatOp73jz+0?=
 =?us-ascii?Q?Z43M3geaUFsKEO2kDjDRSpIe0MqBJjVyb7AYfUW3vfIzM8mkNUNpcNZ1Mz9x?=
 =?us-ascii?Q?10t1OPVWEkfKm8qaVP92gpaz4+vRa5SUvQQO+TnwWi/HbsSLpXP/Dr8P2yQY?=
 =?us-ascii?Q?9Q5PyzKHSo1oKYgvj1bhvTbJA+9QTLE4Ao0WHkXB8kUnycovF+D4LQ3kPH/b?=
 =?us-ascii?Q?/o5VKHTZJ6ZXfK1F3DgvqiFSPol1QC+GJQp9P2wAwE778MJf3un7dSQZhYxx?=
 =?us-ascii?Q?SqJncuuqya0JQZ5i6XNOgpwBnuZeGUApMgPonvMh9bPJYZu5UfTneO39Ma3U?=
 =?us-ascii?Q?X4OqRC/tfYLuItjo+A4Pd+eJ/6JNRN4W1DmsOVMObxFpUYS3+UPraQkiF/pp?=
 =?us-ascii?Q?t9SuJ0GcNyOlko6aIq8gCMJnDQlwBTcy6yE32h1uOfc2PTEh1ukhr+naQ7J7?=
 =?us-ascii?Q?9Yr+ximx0L2yYN12fPjERCaEKGfOuju58K3wx8H9Q7v5WtwBvdEpbVaQiVlU?=
 =?us-ascii?Q?ElAH48muWgdwSxRWQceLBYRm2dyxea2MiYnI9rQ2FzR0TvbkDjSohJgK0bss?=
 =?us-ascii?Q?DgN9EmQF4s8V51utqokSo8tqPY+YP1SCkihFNtldfB/JLVFWGEwWcvMXp9fM?=
 =?us-ascii?Q?KLDapFTWoFIGv6CWVWG+R2svS1tbtNaWdRZd0wbcb+3D2/LE1eRSmg0ezOeA?=
 =?us-ascii?Q?wP1nyGsIWwvXOp0ZKlYoZ2iezz9RA4/yTtfCKJcLGUEmMgavKOSNfSWE6LZ1?=
 =?us-ascii?Q?ReFmUnpzZist8dfiEsJkHYSXk7YpJMLbbDGbm6zVN2d6fMFXqaypqZzz96m4?=
 =?us-ascii?Q?xnzPY2/h/xGwLYFh2UzYcmYo+UK5Pvh1/fB7yILmGP0x5p/88UTT1BXPAj+B?=
 =?us-ascii?Q?a8IoB+bT97JFNIpwsyd+RtG2HQAPusSDYlKH2Cl/TateBXBXZ+1AYDYJzfgy?=
 =?us-ascii?Q?K824oWTxUimIPwtOac/dEzi1aFwdXC4vMCrzn6TNUYeD+P9G2hYJA5YKld8c?=
 =?us-ascii?Q?E631qqMckorR/CI=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 06:59:03.3093
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 87b0a815-51ec-41ef-61e6-08dd4744e826
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7040
Message-ID-Hash: LPGZRINE5XIAAOPDSROERQBRLZPNM46Q
X-Message-ID-Hash: LPGZRINE5XIAAOPDSROERQBRLZPNM46Q
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LPGZRINE5XIAAOPDSROERQBRLZPNM46Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

During runtime suspend scenario, SoundWire wake should be enabled and
during system level suspend scenario SoundWire wake should be disabled.

Implement the SoundWire wake enable/disable sequence as per design flow
for SoundWire poweroff mode.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 71b3cf2df89d..187006e68ad6 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1139,6 +1139,7 @@ static int __maybe_unused amd_suspend(struct device *dev)
 		amd_sdw_wake_enable(amd_manager, false);
 		return amd_sdw_clock_stop(amd_manager);
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
+		amd_sdw_wake_enable(amd_manager, false);
 		/*
 		 * As per hardware programming sequence on AMD platforms,
 		 * clock stop should be invoked first before powering-off
@@ -1166,6 +1167,7 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 		amd_sdw_wake_enable(amd_manager, true);
 		return amd_sdw_clock_stop(amd_manager);
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
+		amd_sdw_wake_enable(amd_manager, true);
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
-- 
2.34.1

