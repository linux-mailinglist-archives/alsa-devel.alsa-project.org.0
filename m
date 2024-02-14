Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 476AC85476B
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Feb 2024 11:43:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1A77E7D;
	Wed, 14 Feb 2024 11:43:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1A77E7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707907419;
	bh=SvUkgTi5JfhK1HxO/PAd9xfvyBzsM+QFkYFoGHobaOQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fPX9mJmowFOuo7s2ul/1k+U0nQuY1MK65+Tx38WEwQj0D95ymkQoKNDMs0mfTMneE
	 7pgbqOdWArciB3fGr/pARAtXq/V48+J1H/TAra+Q9RkDj7cuYpfvn73S/YL+ynXl/k
	 NE4f1grmYBL4El/ciqaM9xYUG6gTI/JNt2prIXzQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B05DFF80632; Wed, 14 Feb 2024 11:42:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D22F6F80619;
	Wed, 14 Feb 2024 11:42:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A48B2F80238; Wed, 14 Feb 2024 11:41:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2407::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C005BF8015B
	for <alsa-devel@alsa-project.org>; Wed, 14 Feb 2024 11:41:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C005BF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=1GkmcT8S
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I/nH/85d7eulMWW7z2M75OoqeWTSHPE08QPxNWm3je1tFSqGFaxMMm/YqaWcYVAyQFzzx0j596GAWuMCW8/tA4t/GtFdhiOYS5L3/hQ3TYu+uUmLsiMzka62u0HME02VXodZQdbc4Lnh7zwWz0kMoWBxztv+jqt+H61G8ECipKqK1Brx+gP2ytWQQQopMHkQwSnQ+l/50ShnD44Y6zh+teXRc+j/0XBb4Cnfk5rjuIKmfDOeOjs3dsAk5qqwQXB2Fj9VNeOPp/BO1yXU+54Avf9ci8aAAIc71LMWcjaWQbgcDwM9pXetApa+Qky/f4gEkZOFE9QOnSazH75Zjf+BAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQpQQYT6OrmbToSwagJxnARrdplGpGJeYqq668FVBxo=;
 b=DhXq6uznkkznv+Rd3DiDfmsUlJHGUBjYejZyvmcuQPZKMfZ2txu6k9fkRTi0mr77F8kZqtuCfV1BVSX/50KC+845DvxkvmlTPGpU6yArZht3Gzg1CR7KIFZuaSnOFnrbpFEHP2gOm5pXQS/+SdrOJr+Xt63bYJOzyd7YHvrw8Dr2Hnj4SHLLPX5hXaivjPQtMWN3gdbw2WuPWj4TuBPLFsOohn1cQa7QJXinHZjkr61FqC/7aoIior3QM3oOTgHBMsr7zI50gAp074pIo8+AYyJvtSJDjbm64rT+z9nfUg7VWY5y/raGR49xZj8jpzhbNEHlt5v4gZM1o+p/NhHzYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQpQQYT6OrmbToSwagJxnARrdplGpGJeYqq668FVBxo=;
 b=1GkmcT8StI2Vnjt3XVMu9bulJU7Km7Ufsfxftdsgu0bZDz+I6uD0cJ5MzXp7XZTMGBIu9iv8Mfh4t26+JpYYRsvktbo+OW1/3hHyLbAD0cE+O969FF3l1dOcAHCPQCmrvxAdrUO2OqUOsEFjetKxCQ0O8gGJy2JBE3OpX0qE71Q=
Received: from MW4PR03CA0313.namprd03.prod.outlook.com (2603:10b6:303:dd::18)
 by PH0PR12MB5646.namprd12.prod.outlook.com (2603:10b6:510:143::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.24; Wed, 14 Feb
 2024 10:41:17 +0000
Received: from CO1PEPF000044F1.namprd05.prod.outlook.com
 (2603:10b6:303:dd:cafe::fb) by MW4PR03CA0313.outlook.office365.com
 (2603:10b6:303:dd::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26 via Frontend
 Transport; Wed, 14 Feb 2024 10:41:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F1.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Wed, 14 Feb 2024 10:41:16 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 14 Feb
 2024 04:41:11 -0600
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35
 via Frontend Transport; Wed, 14 Feb 2024 04:41:03 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <Mario.Limonciello@amd.com>,
	<venkataprasad.potturu@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>, "open list:SOUND - SOC LAYER /
 DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 4/5] ASoC: amd: ps: fix for acp pme wake for soundwire
 configuration
Date: Wed, 14 Feb 2024 16:10:04 +0530
Message-ID: <20240214104014.1144668-4-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240214104014.1144668-1-Vijendar.Mukunda@amd.com>
References: <20240214104014.1144668-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F1:EE_|PH0PR12MB5646:EE_
X-MS-Office365-Filtering-Correlation-Id: fe7b4919-e121-48b5-4e62-08dc2d49795b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	S0VZaxBlWsRZkWh9DMLSuNCBJMKZVRSNcYn5FaoLp31VBf0K0DDEf0mcnsFK48DZUZc763xM6ETdL+mrC66ayX4ViqhipWlyA/7373AuA50W3eGecRZhyKQG+eYC0++BydZWOA7i68Fi6AbMeHU1l5E8U56oU+hezXSRWmLIiWUTj8gEz+kdmB88l7JjZJBvrDuoKrveAXa/oFet0Zk/4Edg3HTi7MMaXb7ov3aO/9SIps86QmhmRA0UYIXz17+4CLjNvcSa73yd4wESZ7ZfYiTCOFPBY54Xfrq1AGpNOh3xXQPu+yeiaY5PFHMaT/Pni9zEvx/9bBXbvwgggwK/eysR9YxT9CrYy2+wF4iApmQNL97jxqsm4VnEhA66e8Yrahl6n84H+PQa7VQUm3JnTFdm+HbKkdox/XX+LAE/gp1mDPy9HxECjaV0R4d4/WZ/6tzExGG0DuEq4HU0Q4ZoDHDNisy0tR/2jmYV58UKjDfpc43ZAvOcJ9SotNJzka0MhhsMLmVbBQTe3j4C0ErvOdiaJuvVj41TfYxUeYD7K+7V1tmF1yn9IMnnNnqa7xvTNWPjWXAGwi6plOXSmbxtXA==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(396003)(346002)(39860400002)(230922051799003)(82310400011)(64100799003)(186009)(451199024)(1800799012)(40470700004)(36840700001)(46966006)(2616005)(41300700001)(356005)(26005)(82740400003)(81166007)(336012)(478600001)(4326008)(6916009)(5660300002)(8676002)(8936002)(1076003)(70586007)(426003)(83380400001)(7696005)(2906002)(316002)(54906003)(36756003)(70206006)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 10:41:16.9313
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fe7b4919-e121-48b5-4e62-08dc2d49795b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5646
Message-ID-Hash: 33XRR6WBEENOX2ZPZHEZ4SXGR3ZUVEVD
X-Message-ID-Hash: 33XRR6WBEENOX2ZPZHEZ4SXGR3ZUVEVD
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Consider the below scenario, When ACP and SoundWire managers are in
D3 state and SoundWire manager power off mode is selected and acp and
SoundWire manager instances are in runtime suspended state.

In this case, for the ACP PME wake event, the ACP PCI driver should resume
SoundWire manager devices based on wake enable status set.

Add code for handling ACP PME wake event for runtime suspend scenario
when SoundWire power off mode is selected.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/pci-ps.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index c141397a2cac..c42660245019 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -554,6 +554,19 @@ static bool check_acp_sdw_enable_status(struct acp63_dev_data *adata)
 	return (sdw0_en || sdw1_en);
 }
 
+static void handle_acp63_sdw_pme_event(struct acp63_dev_data *adata)
+{
+	u32 val;
+
+	val = readl(adata->acp63_base + ACP_SW0_WAKE_EN);
+	if (val && adata->sdw->pdev[0])
+		pm_request_resume(&adata->sdw->pdev[0]->dev);
+
+	val = readl(adata->acp63_base + ACP_SW1_WAKE_EN);
+	if (val && adata->sdw->pdev[1])
+		pm_request_resume(&adata->sdw->pdev[1]->dev);
+}
+
 static int __maybe_unused snd_acp63_suspend(struct device *dev)
 {
 	struct acp63_dev_data *adata;
@@ -572,6 +585,26 @@ static int __maybe_unused snd_acp63_suspend(struct device *dev)
 	return ret;
 }
 
+static int __maybe_unused snd_acp63_runtime_resume(struct device *dev)
+{
+	struct acp63_dev_data *adata;
+	int ret;
+
+	adata = dev_get_drvdata(dev);
+	if (adata->sdw_en_stat)
+		return 0;
+
+	ret = acp63_init(adata->acp63_base, dev);
+	if (ret) {
+		dev_err(dev, "ACP init failed\n");
+		return ret;
+	}
+
+	if (!adata->sdw_en_stat)
+		handle_acp63_sdw_pme_event(adata);
+	return 0;
+}
+
 static int __maybe_unused snd_acp63_resume(struct device *dev)
 {
 	struct acp63_dev_data *adata;
@@ -589,7 +622,7 @@ static int __maybe_unused snd_acp63_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops acp63_pm_ops = {
-	SET_RUNTIME_PM_OPS(snd_acp63_suspend, snd_acp63_resume, NULL)
+	SET_RUNTIME_PM_OPS(snd_acp63_suspend, snd_acp63_runtime_resume, NULL)
 	SET_SYSTEM_SLEEP_PM_OPS(snd_acp63_suspend, snd_acp63_resume)
 };
 
-- 
2.34.1

