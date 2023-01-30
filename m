Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CE5681DBA
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Jan 2023 23:10:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20E3EE0E;
	Mon, 30 Jan 2023 23:09:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20E3EE0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675116606;
	bh=gneaJEkqB4aHYWjxuQig8OCrMZyrRQNKP51dZ/hhJaE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=T5lAiuYpgUQthYPg5P6pX5WandzsOKF3u4ebfle2BbYgcjEqO9/YpQaM1SYr6t51e
	 g7vXSPeszZLEiKiVr5xEQEL+TQ6ivv151hArFRdg9z05EyD+ImhwZXV7r5S1fl4mc4
	 HFLFtfUpkMAGC7CS1qyF2HMo4QXqiDMBebrl3Ytc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA961F80557;
	Mon, 30 Jan 2023 23:08:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A71AF80544; Mon, 30 Jan 2023 23:08:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::603])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3E5EF800A7
 for <alsa-devel@alsa-project.org>; Mon, 30 Jan 2023 23:08:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3E5EF800A7
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=mlGV5BZJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ji+rGmFhK6N+cvVBRGJtmMX84dds583YdSi3YLPoYJRsv5Ip8tLtmluBmhGE1Gr12uD8n51ZrA1NssaoUYjGOwvpfYjrWfduy1qRpun4wz5BiGXS8wE1l1y/GlKKuwTKm79d+AeaATGeaharqnkqO4yBn6OksYhY6NMm4HAUE6hHdFRTwhrcnxdNFnL32ZGQvcumlnmSLcLOAg11ViqCHBNWPL9ZyPuQJUZE+6eNLhXeIW3zJ2BE6VdshR0Sctu62GZXzTVN9k+sx1MIUogt6JqBS6PbZGn9AhZNRB7tozN+BPy3XJT5JMPvKhfnFfUYaFK0sFw4fx77I0+x81NvTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7myppTcR7oW5npvdU5XwvzSX65cR7yfxVbtsMstF1lM=;
 b=PZv6iW1084G/iqMJHozQ83t5yRjyVwa+GMOX2R4ebRJpdUnrOoQSp+coTRj7i7Ze6ScLghS4lfCKUzJ1BidqT5ldxY0LV631+gJA/cp1zGESEW9rcO0MhAVseHU0bfb5nY8QYQ6nCTgx5MbKxVK8AwII74clTChu6Z9ZZBvaLHA7NPKVOB73WOtJb+qc5G1LqrWBL/eB8wtfvFJHpr2ATrRwcCSen/GjeVYyqqG0vA7VvKrnbdRfi/JgTpehb+on7f+NaKaH2uiATFUSpZk91ewCfL3DBNRG7iJoOknepW314kcToxCPpWjqKVEB4GhJwMS90RaKQFEDMQsFqMAMiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7myppTcR7oW5npvdU5XwvzSX65cR7yfxVbtsMstF1lM=;
 b=mlGV5BZJJT84p/jw9nWwRO9jQKWBtgmPmNrELgSetAl3y6XqNKmy5IUZj0j7Y5Xd4eUuyYFN2auXtaZjkBc3K1b9bl3dHM28psQZGH29kgzZ5qaMY6mvdZKJQ5CKxV+nCWSKsvG197d/T9QoHh1m2BoACOF8NmNrDqVtLMtCRjw=
Received: from DM6PR17CA0026.namprd17.prod.outlook.com (2603:10b6:5:1b3::39)
 by DM4PR12MB6133.namprd12.prod.outlook.com (2603:10b6:8:ae::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.36; Mon, 30 Jan 2023 22:08:12 +0000
Received: from DM6NAM11FT102.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1b3:cafe::9e) by DM6PR17CA0026.outlook.office365.com
 (2603:10b6:5:1b3::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36 via Frontend
 Transport; Mon, 30 Jan 2023 22:08:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT102.mail.protection.outlook.com (10.13.173.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.36 via Frontend Transport; Mon, 30 Jan 2023 22:08:12 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 30 Jan
 2023 16:08:11 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Jaroslav Kysela <jkysela@redhat.com>, Mukunda Vijendar
 <Vijendar.Mukunda@amd.com>, Saba Kareem Syed <Syed.SabaKareem@amd.com>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 5/6] ASoC: amd: ps: Adjust the gain for PDM DMIC
Date: Mon, 30 Jan 2023 16:07:53 -0600
Message-ID: <20230130220754.8379-6-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230130220754.8379-1-mario.limonciello@amd.com>
References: <20230130220754.8379-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT102:EE_|DM4PR12MB6133:EE_
X-MS-Office365-Filtering-Correlation-Id: 406f0b7f-c0d1-41dc-7c5e-08db030e7ad2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hLDCKK0AaeHaf6Q7hAKw4pENjvqbJ6zSMwrYCETAcyJpbs1fxU7/oQcvVsD5iSAMJJXROmuvYmu9Wa8g6+Bs7dKcjTX5nf7JdngYcnO+0DdeZCfbc8F0DaB4vuyG9sl6vo2PAtoZeMSeJuqWDZbhucqi99WNinpGfV5Bv/VIIvIjrmISHg9TNuHTrhYerkHrKtyJN4IDmGNK594iJntZ9jbWZ8CGSthyhrq8+VqDa+5k5Pnj0ZsobTGcakMnJquQWdYTL70BDIjMTUQtunyLodirfKtMitQkUBxlPTloKcWgTUu6EKgRfb3NXikKTWhzW6p7/K6cFvfOJeESlJ0pE4TkncxbvxyvMGJASaZ8MdXzEh/3r7WTIytfwjDTfkM13NJaFurS7I2aE5eaycczbY5JYsUBoiFJ8pRrvCeqJ/Y9kdOOKPppaRPotDjlq0JSDnZYTtHXxC0EQvHa993a4lGfuW27mteOcaPYVNLtjlXFcZxGJXNDMHnB/d486G6OE041IWidRgNnImueTgAIAcyQp6zRSdKqWfOcX2XEKkaJAGmLgN35veBfwtg0eqg6TKWHGugg0t3UtHx1/51+WhDsvDW+koiZECqGrqZhjG81BdTtX5g5TW/hfnlLfUiHjz9SHuMPgCCWwLVIZnfdfGYcVvn2zJfBjWKAMJycmo+6W99F7BurL3fnOXVy6VfUfMoCo/1pt9gP3ue23V9+UegDn60795YqzFWIwy+riDw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(39860400002)(346002)(396003)(376002)(451199018)(36840700001)(40470700004)(46966006)(82310400005)(2906002)(5660300002)(86362001)(44832011)(4744005)(47076005)(336012)(426003)(83380400001)(81166007)(8936002)(40460700003)(41300700001)(356005)(36756003)(478600001)(26005)(1076003)(7696005)(6666004)(186003)(82740400003)(2616005)(36860700001)(110136005)(54906003)(4326008)(70206006)(8676002)(40480700001)(70586007)(316002)(16526019)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 22:08:12.7316 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 406f0b7f-c0d1-41dc-7c5e-08db030e7ad2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT102.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6133
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org,
 Pananchikkal Renjith <Renjith.Pananchikkal@amd.com>,
 Takashi Iwai <tiwai@suse.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Mark Pearson <mpearson@lenovo.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

No issues have been reported yet for DMIC audio level on ps platforms,
but as problems were found both on YC (Rembrandt) and Renoir based
designs it's very likely they happen on ps too.

Increase the PDM gain to solve this problem.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 sound/soc/amd/ps/acp63.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/ps/acp63.h b/sound/soc/amd/ps/acp63.h
index 5e7f9c1c1b0e8..bae8288d8231c 100644
--- a/sound/soc/amd/ps/acp63.h
+++ b/sound/soc/amd/ps/acp63.h
@@ -30,7 +30,7 @@
 #define ACP_ERROR_STAT	29
 #define PDM_DECIMATION_FACTOR	2
 #define ACP_PDM_CLK_FREQ_MASK	7
-#define ACP_WOV_MISC_CTRL_MASK	0x10
+#define ACP_WOV_MISC_CTRL_MASK	0x18
 #define ACP_PDM_ENABLE		1
 #define ACP_PDM_DISABLE		0
 #define ACP_PDM_DMA_EN_STATUS	2
-- 
2.34.1

