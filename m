Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E3BA3939F
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2025 08:00:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64B546036B;
	Tue, 18 Feb 2025 08:00:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64B546036B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739862044;
	bh=9Sh9MNXItfqsY9fFGBe+I02Y1dRucRX72loIT+EOdXs=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gr3RM6vXU1vAqzFSmimWp7jKQ+MqaerAtmXkWctgsST6p/IAp3Sokc2SYrQOi/45P
	 yKQK+VOcFkfT7XDaJkQTyjcT4ZhRizf8OfmeMY7xiusNifbH06PgeMl2Ol8BpPcOVE
	 hNYYsxtvIv8i7Kl682fXD4nvpxgZvy5UyAIoYZ90=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC2CFF80518; Tue, 18 Feb 2025 08:00:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29E49F805BA;
	Tue, 18 Feb 2025 08:00:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3DD4CF80518; Tue, 18 Feb 2025 07:59:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2408::616])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E0E39F8025A
	for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2025 07:59:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0E39F8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=be3uW0DF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dIVhqSuKJ0U35Nkn/093W4EXVvPUdGA8anVGuR910dOJ1GqPsaGJHtBmW9AGto4r42hrIOirFe44cVz+orx8u+Z//6PkLKzysj+t+pZ1fEjsvwan9UrCS9EeQWlXpIqh7DJVEksN9PYT0bng6NR/aRAsVAPYi9TuCqdlHeicP/ZyeUcJNNX7VYQYNXt8lB/5Y5meCmam7Dzspy1TiNhEPPQQqb3jaByVji9KSLbuGf7hqBLkNC9C+2GoNLCLUwln0odzGdbs5m3t0gAiyZa8e7CCVs3cMqrw3onbBf9Ik/d9b0zg6e0Ceyw6bu6g2a4kvZs44c+qnbh8aFdJGJPvzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ABlNev0yPFh5AZgji/sITu9HuRB+rWD757vPVxFwT7w=;
 b=oGwo7qJlz4OgIyhMea2m8HsUcSuXc/rbUgpeeoLGWl4UGsS06h5k9WctrUyIdTGl0Ug6BzUpLjbIVTQf7UnQn2ZnqUd0LJ5V+M61lrbhPJpO2QmY2oEm6IkztzTmvK/60nAhu42ejCN4rd/eGhN/ndZJt4SgDQ2XuJaxatibL3NoipB84vDn82jwxu/JfKW95BnrAVTpwH6lbyF4Y33AaXRdZ6XVjqMMkoZXsreu+gkKze5vzR0PTT6YVF6PBO5Zt5s01GK4Qepbbs/9Z9wsM0jbsxcKDuUhvYemwZpX5HnoMqPZOFJ48WSAh99NUSK5vjH73SHZqUxaPq/TwWyM3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABlNev0yPFh5AZgji/sITu9HuRB+rWD757vPVxFwT7w=;
 b=be3uW0DFeO4BPOICUgXfQC4PGCMCAdTiW5fKxqnBBnWB3jPORZO2oTwwF0w01YExbW/TClkd4icit2uGNDLASpAMWzSinMbvJdOYTaZJBOMcTaLsw2nPEHF7BGPcu3+NwmGxD8K9z0F5ZqtakD0PdJHZxdPG4GSHlfdUkd62adM=
Received: from PH7P221CA0024.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::31)
 by MW4PR12MB5604.namprd12.prod.outlook.com (2603:10b6:303:18d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Tue, 18 Feb
 2025 06:59:46 +0000
Received: from SN1PEPF0002529F.namprd05.prod.outlook.com
 (2603:10b6:510:32a:cafe::2d) by PH7P221CA0024.outlook.office365.com
 (2603:10b6:510:32a::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.19 via Frontend Transport; Tue,
 18 Feb 2025 06:59:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002529F.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Tue, 18 Feb 2025 06:59:43 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 18 Feb 2025 00:59:39 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH] soundwire: amd: change the log level for command response log
Date: Tue, 18 Feb 2025 12:29:24 +0530
Message-ID: <20250218065924.917915-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529F:EE_|MW4PR12MB5604:EE_
X-MS-Office365-Filtering-Correlation-Id: bfa3dc47-7b1e-4968-d20a-08dd4fe9d2a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EpdbfJBJZB8BtpMC5ApNJyb5Lpxa5ul7vAzM6WnVpdmqtoKYyFciTjE07lmv?=
 =?us-ascii?Q?yI8trfc4oSKf5ayEH/n55kJSe7vGD2iUcZWVc/x5BL3+F3iSfj7XfBq2SQpE?=
 =?us-ascii?Q?sA79sdAHBUzSabf+Es4rmF601xYeT+/M3VIRwq8nhbvZs9DNXW6ce2Qyf1kh?=
 =?us-ascii?Q?z8p7pOOgrSTPp38gCC1eTneVJtBBlRqGRBOU8JHOgNxwNOzMkHUnhio5R9KW?=
 =?us-ascii?Q?tpTqA9xBXjBj2yuWZxo9nlLwBSEzBQPaenjxcjI8bK+yUytS07/uCI08fLop?=
 =?us-ascii?Q?JZqRJ4h8561rXT5rJGMUd+rD/DpNaGvKBsvFOZzxh7N+8wKZDF66Q0YcN4pl?=
 =?us-ascii?Q?K69tOKDGgWgZpGS1hwB9UbWPWTRxIXk5MfTisjsDePcW6mknrAJIjvuMBE7s?=
 =?us-ascii?Q?fBi6KHsbh6lJI3Nl83VPIIaZ7k3UkNxQ8YQYlhoZZANMkF9S8qAqMZYtHtJs?=
 =?us-ascii?Q?1/7eTka7pmV7QXpmEKOplRj1fktEO1fK89rIOv4ScMB3fL5Ed62O63P1bkwq?=
 =?us-ascii?Q?3hwyipF5PZ/jLWgEFHj3eW1qYVq65//ObQu5EEHyICCUFbsZrSwJgYt9Qj3Q?=
 =?us-ascii?Q?hBMC/mRgbaTS0an59YEY2fZyCzlXGOho66j6Pzslkrqu0fz47bgSJbpnHlSg?=
 =?us-ascii?Q?8VRMhhHJ7qa//yGUABcG5xUFQQqZExZCmDJ1gexqNdhR+pr8tuTn86oQauYr?=
 =?us-ascii?Q?Ly/OHJq3Wbl1g7uGbw0k6cJgyFZLRXD/UDnjY4kakFq6RYxFv0cPCf3EJEGf?=
 =?us-ascii?Q?fZMI9WsLHziZqekOBxjAo9K7DLiIOKISAaE120884M7JsU/R6KWGzU+Zr3oz?=
 =?us-ascii?Q?chcBQIzGl1qFiBEd3rC1+C/WKC0FFYBtGhOuUA1P/60jW3Z/Nqb2byLzJLJW?=
 =?us-ascii?Q?N2oNRMWT1SrGf7TsJanstxtV51DuppqABxkiJ/ejv5vNSc2G6mPT273JlYLY?=
 =?us-ascii?Q?UxixKJRHWyKrQrk1JfGDB0Vbq8+Gn1XQu4t0hhnNLPVuELC+Xt6KiyvKriHU?=
 =?us-ascii?Q?uWLEvj5CXqrfI9kef+y2K+BMblk7F6MmyL/J949vDbgob1UilY7d8dDiqqKn?=
 =?us-ascii?Q?Fxb1Vy4nnt2AoKDpReYTomlj78REEi4g+2ASQY835tdrCOX9HJayjI4dJ6Gv?=
 =?us-ascii?Q?XXNM+OaBdSecsbpZYXfgc2SnvZLcuWsTPJ9RHng2rkMcDy/CisTxBrtm4PO2?=
 =?us-ascii?Q?Z6v358WZa9sAUwDZz/QhsY7hur67rJXbAXGVJeis2vJGMppZxQQXT80BBHK0?=
 =?us-ascii?Q?+GjjX7ixsDHfrHK3+mGmIZhdMB88jTLqKX1yhmCsPy7AzM1A9YEcPhifd0XL?=
 =?us-ascii?Q?Bm87iCKzowG6pNvdNn+Cbdm7qSpo2uXjmS7Bxrh0T6IdNBdluVP1nAHmOZ0R?=
 =?us-ascii?Q?hWMUvm3cF5PJuXe4k1gXuOgO7R7t3watnsWz5eMMBrNB2JFjHeTihi7z8F4J?=
 =?us-ascii?Q?2yng+xYdza93c8NZh2ZSvp5qC2W8X2zFXKScQFFfmBNiu1XQIrcboJs8a6EX?=
 =?us-ascii?Q?sJG2bl8CS+N6ziI=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 06:59:43.5426
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bfa3dc47-7b1e-4968-d20a-08dd4fe9d2a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002529F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5604
Message-ID-Hash: QMV3IEZE22VXVO4ZBCIPSSYUGUBTUYUI
X-Message-ID-Hash: QMV3IEZE22VXVO4ZBCIPSSYUGUBTUYUI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QMV3IEZE22VXVO4ZBCIPSSYUGUBTUYUI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Change log level for command response log to dev_dbg_ratelimited when
command is ignored.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index dcf85f94950a..a12c68b93b1c 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -346,7 +346,7 @@ static enum sdw_command_response amd_sdw_fill_msg_resp(struct amd_sdw_manager *a
 					    msg->dev_num);
 			return SDW_CMD_FAIL;
 		}
-		dev_err_ratelimited(amd_manager->dev, "command is ignored for Slave %d\n",
+		dev_dbg_ratelimited(amd_manager->dev, "command is ignored for Slave %d\n",
 				    msg->dev_num);
 		return SDW_CMD_IGNORED;
 	}
-- 
2.34.1

