Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EB39E16D0
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Dec 2024 10:11:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B59E3F54;
	Tue,  3 Dec 2024 10:11:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B59E3F54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733217079;
	bh=JCArq2paes462V82FvolIinFT9U/GeOLXOi2cG53vD4=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=NSnDhXFPudPBFWzoN6dwDcjJyfFKQ6lLchAsbLQR96X4buju9mQb9fx6QupIiGwZt
	 KlKOY1gpBw1r6tAE3caiVzhDuLY4BucecH7Tfyn71uKO6wvXATxysucz48tuZvQEMQ
	 fsgk+MBlreHP81sv3ZmDeZ32O+Zd87Y5QzXGRhog=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B75C7F805B2; Tue,  3 Dec 2024 10:10:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 497C9F805AE;
	Tue,  3 Dec 2024 10:10:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C1CBF80272; Tue,  3 Dec 2024 10:10:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 25C12F80073
	for <alsa-devel@alsa-project.org>; Tue,  3 Dec 2024 10:10:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25C12F80073
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=lx3Fv9N5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QJk19gHjTfCZENOu5adI62XAtORpT4NRxxVxF/EEZ+bpIaYIemDvUaWRqGwnIIjEdWGTeYC1h7PAqiOasmwIZ2n/y6vokX5h4wDzCM/dWlkE+XTE9V1p7Xhat/hV0WAu2QXvCWoFTA3A0PS6dDE9izSrZgqQsSbWTPqIZbiogwoqoJzWE8lmXQuGKfPCp6yCCmd7Vi74xMm0SLw/oJ3s/fbZ9DuO3wut+4PxXT54pWlOrBBLxHFHiSiSHVHg9s4IJ9v6iiz370C6WpCrGaGZUbRs1qjZQmtSvdGp+kMriJ4jvbB7DFpybE5YgtQ7XqKzkfc0jfzzlCKwS43p9VxPJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/tB/zHa4I0nkrecKYF8loAUxBra6/AwysO5/gHTQRL4=;
 b=hyJL3pWlsDHTVmDNTyFtlbAoM/EgcwG4rBBOt8amp5sCWXHPGgGWtQh6PoZrdrGMq4utnaW1gKsg46aahcYfO48tXNtb4JzRq/9Jb5f3xDOEH/+aHwypRD14pBr3xWFPlGmegozfxocmj4Y3xG79CNwVKX3g1Q5ZKNCYXQEXNYEdr5dRL3M0+gquyPWyE8OdWcgeBPLlqDJZjopHlXDo9vZfFnoL1SuHSykMKQGyUX/TF2TToN3SelQzebC9agtWAwLXjK/jU7EU1RkfGY8f4Rfq6M01yunOLf581Yvi5NbOK1tnigc+Y5VE6sRFFNCqXuiTforzEodRoMfpWe10pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/tB/zHa4I0nkrecKYF8loAUxBra6/AwysO5/gHTQRL4=;
 b=lx3Fv9N5YcRus0EXi9vWE1kTAjh5NfghAwPSa+dvJ3yqf01MITliSxIThgqvfR6XXxWgHWMhIUZRW6HRZMLxDyomR5xB8xdP4+X6TB33Mu+PPD27cVTQORV75GeUkyNBgyPEE+f+IhYEoep7i0Rh9NCcWV29b2yKNEwQm0BFYs0=
Received: from CH2PR14CA0002.namprd14.prod.outlook.com (2603:10b6:610:60::12)
 by MW5PR12MB5684.namprd12.prod.outlook.com (2603:10b6:303:1a1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 09:10:23 +0000
Received: from DS3PEPF000099D5.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::68) by CH2PR14CA0002.outlook.office365.com
 (2603:10b6:610:60::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.19 via Frontend Transport; Tue,
 3 Dec 2024 09:10:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D5.mail.protection.outlook.com (10.167.17.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Tue, 3 Dec 2024 09:10:23 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 03:10:19 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<sanyog.r.kale@intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH RESEND] soundwire: amd: clear wake enable register for 
Date: Tue, 3 Dec 2024 14:40:06 +0530
Message-ID: <20241203091006.4096890-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D5:EE_|MW5PR12MB5684:EE_
X-MS-Office365-Filtering-Correlation-Id: 7491883e-82a6-4e38-0a96-08dd137a51a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MwRYSoXh+yF6LJLQS4xVI/4uT5AxdDlBje+CDFUM6BHmYO8XBJzD1Quf+zyF?=
 =?us-ascii?Q?y9pbAJ4X+wrJQnCkOD4tBp46oNTFwG+0ZjNQ3jQiklyVTuyePW1m34FaUXe5?=
 =?us-ascii?Q?fh1voJMHeEh9Kljdlo0REh2oGrNPUiPP0MjK3kUnZA6IhSJyc8PrvizfuuGy?=
 =?us-ascii?Q?QecvzhyndJUpgzGOZ68DMe0mS835FJyB2+eoAaYhBOWmno6Bg+tLE31aqZtA?=
 =?us-ascii?Q?uBTEMc+oaWMxN5hzE6yxUDotdt1ge+YBs3cJbckAgJBrAyv+SGejaefilhS6?=
 =?us-ascii?Q?NLLx3PPB1OjCVd3IDq+OeNgr6R5AhWURuy/ByEQBrDqgmQmkORcft2kdhY9h?=
 =?us-ascii?Q?AJki2YcPW1kC2oJPfA9AAxX1iUvLvOs8vtsytqu2vOo0x65AY/36SmsiZuor?=
 =?us-ascii?Q?BKPXL1+zP+6XWSSBsLGoAhOOhfG+dKkBJJ1lK+o51KYblz1H68CB3BIzODLq?=
 =?us-ascii?Q?uz47+ijcR3bsavElWlNkesrr6uO0BmenKdnGTGfZVtLOhZWO3yXaqideOhnQ?=
 =?us-ascii?Q?Z+EPAsGaVYSHIUpvEXr1L76xupbxImZD9whf6374y/4dyAOZESk6dW0FrZ0F?=
 =?us-ascii?Q?MKjPDdhnviiOUSuP/zO04Vnyv+4B2v0S+GAFJKIME6so0xKBl+vHrMlkzI/T?=
 =?us-ascii?Q?hbKTlZIv8Vi2cVACV5q1fI9j821MPlYhlzJ23oeh/Sq+8xPtcnd2RwxoBhe9?=
 =?us-ascii?Q?oIZkw3NqG6TRjHorFaAmOAzhmbS6e192f6TS2RstKivRuMs0p9oqk8LOOuDy?=
 =?us-ascii?Q?tmF9u22EiAUGgfn9jDpql3WEH0BT8cii/aD6w4VsDmuaONSXI5DalMZXmYgS?=
 =?us-ascii?Q?2jl89nvQfxtNDh4TKxUy3wDaz97yinDjP3ZG+27NRiKJHdDhbQeGJakP3rei?=
 =?us-ascii?Q?TZISItyCydr7mqZablTdwFlYjVnm79RImgl2CDeCMc3BsOf2vvTqnKnnt+TC?=
 =?us-ascii?Q?W/8d3xk9ex2cOWHhSLEcwSGGc+QYMSrTN5BpPKmDUNBhL7UBvxWYZh+KQYr8?=
 =?us-ascii?Q?k/MtpoL+XDwTmdiC3L9rx9D94YA/5dzTMTWFzFQflQrBBRSeLJ58ZYPVYQpR?=
 =?us-ascii?Q?h62tcbBtRKbw4j3QUJL6G5pHTtIoPOvtlNo9CkeuCV8xA5ISM/sPfUkwt/xb?=
 =?us-ascii?Q?LF0VhL3Zsk/0juGUI2tnSKhh+bfBLOhHkxH49AsR4NHTXwr5NAevNC1Zg6Ep?=
 =?us-ascii?Q?SZCqstmbvkbf/A0lay8QOoKTmi4pcdG4QQM+q8z+UfH+whlib6MD/6fXNG5C?=
 =?us-ascii?Q?21tiWP7+8tdq6ukY5AR0iOvB/IpUqJjHtprqbdQ0/DQSql43TEnaGJBjWS2a?=
 =?us-ascii?Q?vEGeZyd1X5AUsHYRaqPuN1yDbMWcnQpxlmP5/KhZBHZrQ4iqifljxqX1aReL?=
 =?us-ascii?Q?AGnSjzwpUOnsUDRnuck1xkm94gynUsNle8vF7Lp+1n5kVieuseAFFJ1In3wd?=
 =?us-ascii?Q?LEdb2WxZ5ehYuz2Eek4duLa9wCK5nTF8?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 09:10:23.2158
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7491883e-82a6-4e38-0a96-08dd137a51a6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099D5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5684
Message-ID-Hash: CAVEIX3MRRKXOJAMPR2WGULNIK66SCKR
X-Message-ID-Hash: CAVEIX3MRRKXOJAMPR2WGULNIK66SCKR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CAVEIX3MRRKXOJAMPR2WGULNIK66SCKR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

As per design for power off mode, clear the wake enable register during
resume sequence.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 5a4bfaef65fb..96a3aa6da711 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1190,6 +1190,7 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
 		return amd_sdw_clock_stop_exit(amd_manager);
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
+		writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
 		val = readl(amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL);
 		if (val) {
 			val |= AMD_SDW_CLK_RESUME_REQ;
-- 
2.34.1

