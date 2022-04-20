Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 189F8508531
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 11:48:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD46B18C7;
	Wed, 20 Apr 2022 11:47:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD46B18C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650448108;
	bh=4On2B0gCaHLnfc1XHsqghgemjpZa/9dPZouqFiea8wY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rvvLhm4nf1fBHIBIO/r7DCBGPr0DtoSfEvTDm+bCi8FdFMaUxPkkmDENexsrlGfTP
	 mmA0stcNVCEzCIMWSR3N2N3q4gn6WiJWQ5CNc7R9f/a7wkZYnmopjYFOn8eW01ccHn
	 7vdqmxRqRNmtFB0632F5lN3jnpmtBhPYvrjXwU+8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B931F80128;
	Wed, 20 Apr 2022 11:47:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACC1AF800C1; Wed, 20 Apr 2022 11:47:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::62e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B8D0F8010B
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 11:47:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B8D0F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="Hd2rd7vO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QOERUQBsHQhGJ10FcTwIonWNyIrjExuKdvucRCqkJEEyNYHNG7mJuF+UySlUh5kIG04PexOLGE22gyw3dCXn4UW0k7ebYs1suT/N1f2d6gL0zN+UtKpY+QU4S8rYD1Pa7HgpHvzLZt4JmULfI6VFFn11lVbRu5kBp/inuwEk37r/mU5NozIKir0nwGpx4/fF8Gz2an8g/rSBUMqb2/lxbq3AODKBBKq/ZJCmQClfQZfdEoJ/U53u0IBvWWwlXcBhvVHp1ghOxzhY26bSyVNEC+i3srt8RbkyR4Tv5nMUsMNKz24IX871DJoO5Bjey14GYUmU5MFpe3rTIRWkwqNTGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hk7y61S4MYspjU9K0oGnCwieEh5wahxFcWq5rTdnsE8=;
 b=OqokoGwtLmj+BVE7KdCKUxboxJs2ip4cvfYrnFHwpYT7OOFado9k6Ggxuogs8KBSa8A5Xi7qsVQ0Zn83ebMxNvoacTQVRWIrN/bdKxUEse49Hbyn98VGHB2oppDAHr7N+PLjzbR3s8sIuULO74Lb4XDqBrtXoVhDI/D5D2pwj2HCqKwW/m4w2QiXwES7oPS6a+oq5QSK0kXSVfv0X7PlQMg7NKTKIjRe4HTZJ6CjG+7j7/K5aWpxmmeEL7uwHhcGgGxEdfXcSHkkY9ofMlpymMtBCH0HoncB1tHq5y2R13gDtc9rR3a0/kuptZHcoSOvnEVuKR/BisS/YO4Nmk1TYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hk7y61S4MYspjU9K0oGnCwieEh5wahxFcWq5rTdnsE8=;
 b=Hd2rd7vODWl1UhZfCDzzUWQnwdD8ZuarbuUqblP5VZCZoqDCDMaAkUzYj8gZnRoSpLN6lrhVSixKOCIoJGvEGHGzGTqo56RP5VmlWdGCuT7IXK/cRsj3R1Cr3cp8Ec4QZulgtnzp/kqF8dyyuza6G3425ZVfcDMosvWrmKRqF9g=
Received: from DS7PR03CA0176.namprd03.prod.outlook.com (2603:10b6:5:3b2::31)
 by DM4PR12MB5841.namprd12.prod.outlook.com (2603:10b6:8:64::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 20 Apr
 2022 09:47:15 +0000
Received: from DM6NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b2:cafe::22) by DS7PR03CA0176.outlook.office365.com
 (2603:10b6:5:3b2::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Wed, 20 Apr 2022 09:47:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT022.mail.protection.outlook.com (10.13.172.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5186.14 via Frontend Transport; Wed, 20 Apr 2022 09:47:15 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 20 Apr
 2022 04:47:15 -0500
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Wed, 20 Apr 2022 04:47:11 -0500
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH] ASoC: amd: acp: Add pm ops callback in machine driver
Date: Wed, 20 Apr 2022 15:14:36 +0530
Message-ID: <20220420094442.1352717-1-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fdfd806f-2a1c-4dee-06b4-08da22b2c0b2
X-MS-TrafficTypeDiagnostic: DM4PR12MB5841:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB5841B54B7AFD864445B0C03982F59@DM4PR12MB5841.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p2UC2fpwrTUWkBjS3yz1NaF3zTTRDrmJuyV0JH2ssMVK6QATTd+XKZqqJwvWKIckbSMG+4Lp6SGAvJeOKkFGW9ewHrS2auap/lnqGZ9Saf7jTwtR3+IZK6xHLEZW5mUwxl3DWj/yXed2f50Ho2NlfegTz19ZofxatRaAlndefnTER9dNurE4EqOW0xxP8Z7wHYbgyaIz4BSYnuDhz5iW4bf0OMIrIxo1KdjgEmatUsek8d/GEUZWQ1ShBxX5wzxCgggxbOxYCLsSwCfVXImlCUWv2jMzpuYEsVXZGjnIvFRheCaT4eprWzHy4a3pq2rsTCJNk4v5OjxSvO4E2lNuYtjKKlrxwY7c9/6brfM3dKUxnnxep1HDqBXRAB+Mi+qVvNOgU6Zrw2QWrGmVckKw/EspG/sCeCuryWUxrhdJ4WxBXlzAC/+B6IOhQhoWMDZorz1kUzkJTB+RqxjFPVtx+/4SCgZnTkklcdEAP4TdmTUAs1+yLgUvVC/Z58tVyQi/LI2F+ZQB2B7ZfeyBIaVU9aVd4WFLxwe0HOxL+mcjNkGZ15h8lhrE8PZon6h7A58bCIHSHey1DY//B7+FBnPnzNBiXuJhAdKkn52Bbn06Xb85Lkf+KKnvHpwpHzP+UthA/f+6fNUE7008VER1pyDIEqA5sNkTZV9Ln0zY/K+Uv4tQhP+rdKh+dPwS4ABMWBWyj7EG2bcYLYNroWF8KW+0mA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(70586007)(356005)(40460700003)(4326008)(83380400001)(81166007)(70206006)(8676002)(316002)(36756003)(7696005)(508600001)(6666004)(336012)(426003)(2906002)(2616005)(82310400005)(86362001)(47076005)(54906003)(8936002)(110136005)(26005)(36860700001)(5660300002)(1076003)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 09:47:15.7825 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdfd806f-2a1c-4dee-06b4-08da22b2c0b2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5841
Cc: Sunil-kumar.Dommati@amd.com, Ajit Kumar
 Pandey <AjitKumar.Pandey@amd.com>, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, V sujith
 kumar Reddy <vsujithkumar.reddy@amd.com>, Vijendar.Mukunda@amd.com,
 Alexander.Deucher@amd.com
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

Add alsa snd_soc_pm_ops callback in ACP machine driver to support
suspend and resume operation of sound card components

Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
---
 sound/soc/amd/acp/acp-legacy-mach.c | 1 +
 sound/soc/amd/acp/acp-sof-mach.c    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/sound/soc/amd/acp/acp-legacy-mach.c b/sound/soc/amd/acp/acp-legacy-mach.c
index 5d276365d644..442d5644e0f3 100644
--- a/sound/soc/amd/acp/acp-legacy-mach.c
+++ b/sound/soc/amd/acp/acp-legacy-mach.c
@@ -131,6 +131,7 @@ static const struct platform_device_id board_ids[] = {
 };
 static struct platform_driver acp_asoc_audio = {
 	.driver = {
+		.pm = &snd_soc_pm_ops,
 		.name = "acp_mach",
 	},
 	.probe = acp_asoc_probe,
diff --git a/sound/soc/amd/acp/acp-sof-mach.c b/sound/soc/amd/acp/acp-sof-mach.c
index 3346677949e3..bf61a1726f0e 100644
--- a/sound/soc/amd/acp/acp-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sof-mach.c
@@ -144,6 +144,7 @@ static const struct platform_device_id board_ids[] = {
 static struct platform_driver acp_asoc_audio = {
 	.driver = {
 		.name = "sof_mach",
+		.pm = &snd_soc_pm_ops,
 	},
 	.probe = acp_sof_probe,
 	.id_table = board_ids,
-- 
2.25.1

