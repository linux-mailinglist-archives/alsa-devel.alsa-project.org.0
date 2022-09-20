Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A53905BEBB1
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 19:14:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CB4F850;
	Tue, 20 Sep 2022 19:13:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CB4F850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663694072;
	bh=w/5Wfrg/D5e74rLNXa11/l4aWqKD85rTTwViF4D+G6o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QABGUJLxqyRwRIrpZ3eka4mi9ZSGLkO8JHgrfDDNbvVwALdHPOd+IRCkAkB9u8k82
	 ohpjp7Ctg0rTTyAWKOMRfpNC1Nt0dJvhg+pzHrXBkwMkaTYeucedHGxY0p5PmnVtwI
	 NQ3bmKW9tJ7JwuXQomWl5e8SVfmHwFh/EsvyH118=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 997F6F800C9;
	Tue, 20 Sep 2022 19:13:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05D0EF8012B; Tue, 20 Sep 2022 19:13:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B07E2F8012B
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 19:13:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B07E2F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="AUlUOu6S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bmCf4P1958zBCFnEsNW9wGSTtx3dkA6u6RKbdNPSnOwdjtjoaIqT6g7cQ3++lOSTJUItGgISLxdR+vYcZXTZinSQ9i0pD3ViWP8pAqoNRONTjFXhhbR/YbfQJPwiCSdQFdhqOZOsJRRSroaC0Vc0JGown14MdTiNcdftiUj8s/vaG4tbn4EHoYkT+gYSEPU0/UTKkgFJlg+gTUBLdHM/rNkwwElZm3rfjOUstqQI5aBlWLDg8ecuakUq5lXbuf0CZlgvrhbWw0GGUnB59QrBxRu9lrLoulnzKqbM6fdaM7qw+MSMlZ0ykjZNlKsSchLEE1nnGBkpoDBZWB0swMX4TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cab2tUb6MIBc5bC4hBUEcxUWcsTD4idGLr6OjCkOz/w=;
 b=GRFmXosur3uxzybDFl4F+XcMPHpCS370QkJra4HheXOQd1ZROmahliPip5O8Fp4yimm5YbPzgjBLbW9m9lcBgeW5fLfFUpL30KXnzS6T52x47ZUnnRMwZTs8Ga709k/bmWwa6ssuvm1iGYDOYkVi0AdNxHbKAdVkOWL8upEU6nzN4+NfEtsoDWMSyv7RflnotOmhwaACuiS9QXrFzQPiIwIp9ANy5soF9Tio08izTMlkk5MmNmm0Y4rK6Q5Yy/kTuUTmbx3j94O9ZbMcIhpDNjJwmMw3ZanVYVwz/M7r7Qly6tYqCYY/zIpJD7MvqSyDCo7Xaqi2Dkn+4+rw+2EzlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cab2tUb6MIBc5bC4hBUEcxUWcsTD4idGLr6OjCkOz/w=;
 b=AUlUOu6S4kjfBCbx1Xn016BsAJALumdMAA7YckJqNmXPtDS0NSqXMEs7S2hdzTBdV98/uSevtdFYftXMjKVHR/46nt0tDbp9uLzyrBgGzmUKcnf0tPARu2u4ky1jR5oknii119d20KqCLFeow9LdUpfdRy92WdC2Hc4nEj8XJlI=
Received: from BN8PR15CA0054.namprd15.prod.outlook.com (2603:10b6:408:80::31)
 by CH3PR12MB7523.namprd12.prod.outlook.com (2603:10b6:610:148::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 17:13:21 +0000
Received: from BN8NAM11FT114.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:80:cafe::d2) by BN8PR15CA0054.outlook.office365.com
 (2603:10b6:408:80::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.14 via Frontend
 Transport; Tue, 20 Sep 2022 17:13:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT114.mail.protection.outlook.com (10.13.177.46) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5632.12 via Frontend Transport; Tue, 20 Sep 2022 17:13:21 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 20 Sep
 2022 12:13:20 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <mario.limonciello@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] ASoC: amd: yc: Add Lenovo Yoga Slim 7 Pro X to quirks table
Date: Tue, 20 Sep 2022 12:13:20 -0500
Message-ID: <20220920171320.7776-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT114:EE_|CH3PR12MB7523:EE_
X-MS-Office365-Filtering-Correlation-Id: cc7fc666-baf5-4fd8-3f7d-08da9b2b6b55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K+Kvh+VXznCAQvpGP5ztGAobFzs2+3CFGwNy6+vRFxpO+EdW8NgS7GFscP+MhLtlMuviaqVdkUQ7kQDgUSZnkKwdTkndn/zFnJPNHDMn/5iJxUZMnNw2za1fLwwNXA6O8ELtuWcw1kZw0/g6PjjrqzNStvBkYX+gCdbUYnV4G6WFfrFd/P0m7pm5KLHbrYA+tBz6raf9adzRaxH08FZfyE/NHow6YCwgS5Revk5HCzmpxfZegBqHcHHPIDHl/mEqoeXrWmOUhOQBsgldtEzBQaFJa1oN5swqMAQ0VhP9c4iQqb0qUcR1v5hgI1Z4VisRdz1FwwVX2kKBOZiXICmpqilQ8Qv/kV3jPo+hkFwj0+k8Bh9QxpfL9iqzutnwp4R96XdrtBLgpaNBrNy/YLrCkkuML3PGtW9NzcE6TLktiQo8IWarfO1L3sg9YTi2q72tGL4e2EpIuXqV6VPCJ3JS0FfVRONL2WcQLtYVCuwANGSxua++j48XkG2zFjTztILlKX5SKRbbYZwBcgF5uWD+sF+vGPzACVme627VPVp47SSU72xzHkuof2Wcwm3iChDJU0hz2VUXb5+TqL18+p5A6p/+Q68kK/BChpo/gIitXH9Yh+7BApB/puwu4wm0GP9QrXHPNIM6g5maShBQxKwgAoBCPQ+bInEPZ27w0sdPeLmFREu8UznPxjhKuA1mgzzh5pCX7QTrdA6h/R3sWVXHOSsA4dqtKmHRa62Eoeg9SnVP9NWSE5gVfuapcCNyi609zjF34XrZbBahr5lrbT2VK8WgtkOVx6B0PouACFClyn1UOlhiN0fodVa4+URwSO8QE/1tlhMG83+vi58RTWZh0xlybwr+8iKaimMn2mMAxeVWfy5vSjPRl5LKPeRaTjjw
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(136003)(39860400002)(346002)(451199015)(36840700001)(46966006)(40470700004)(336012)(44832011)(2906002)(5660300002)(70586007)(70206006)(8936002)(8676002)(4326008)(36860700001)(16526019)(966005)(82740400003)(86362001)(40460700003)(54906003)(82310400005)(316002)(356005)(47076005)(426003)(1076003)(110136005)(36756003)(26005)(186003)(41300700001)(7696005)(2616005)(40480700001)(81166007)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 17:13:21.2213 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc7fc666-baf5-4fd8-3f7d-08da9b2b6b55
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT114.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7523
Cc: Travis Glenn Hansen <travisghansen@yahoo.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Xiaoyan Li <lxy.lixiaoyan@gmail.com>, Mark Brown <broonie@kernel.org>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>, Sebastian S <iam@decentr.al>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Lenovo Yoga Slim 7 Pro X has an ACP DMIC that isn't specified in the
ASL or existing quirk list.  Add it to the quirk table to let DMIC
work on these systems.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=216299
Tested-by: Sebastian S <iam@decentr.al>
Reporetd-and-tested-by: Travis Glenn Hansen <travisghansen@yahoo.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
This patch applies on top of the other patch introducing a quirk:
	https://lore.kernel.org/alsa-devel/20220917070847.14346-1-lxy.lixiaoyan@gmail.com/
If either of them need to change, we should roll both into a series.

 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 5eab3baf3573..2cb50d5cf1a9 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -171,6 +171,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "21J6"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "82"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.34.1

