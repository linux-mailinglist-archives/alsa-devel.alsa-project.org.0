Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B364C0D47
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 08:27:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 698AB171B;
	Wed, 23 Feb 2022 08:26:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 698AB171B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645601230;
	bh=LnNoBYnTdS05T0G8C80/DXcwlKN1q8t3oAEmDORFxD0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e85Fb0cnlyIUx6BxADiq4BemNe38xPwtqbEviyN2+2pkfoJDPgSscmPc6c9UeJS+p
	 56vgWzKYJM+XHCitdM3a9n4FXs8qqy+UV6ciDHSYQ3pwNQZ3o707t2CDFxq+peOqCJ
	 P9ZnsbY+gLHr8UlXi8gSPi/t9OrEpsMD3eYAUTT4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 240E4F80529;
	Wed, 23 Feb 2022 08:25:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1E02F80528; Wed, 23 Feb 2022 08:25:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::61c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6B40F80524
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 08:25:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6B40F80524
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="g1q+mkG2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YJhxiOo62KmR2uE6Mzz97yYQ+gn8+lyHcjpjRfqnnDd+X+Ob4r2bpjWrhuzbd8lJ4xpqcda6tR/AQ4FWZHIximGe5N1e5zD7DbjghdaYxWpOYpdI8qOQYqYnw9kNGzPM3+M2W7kpbZE/hnwb+uLhVAUDDCXSAhlK3/vKE4MuLvjWdLi1dBBHkmUqaJSR72CqvlYX3uE3Pb1O10Vcqk4FXG45Io5EMnT5N0zsK5urdirD96eCC+wE9Ai7OypKEFJKagiVfDyX+0GI6tiJbuiSY2EspUihrkBU4Z2g8IdCfiNmnKwPEdkSB6eXeW1eK1lWd8y/cYFeSKWM0vQe1go9Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLUY6DlGAwjdwdzQLNA/gt8yUAg6SwxroiCRgpkoduo=;
 b=adskn2u6t9d5i0o7ywVkyUkFNl0mVgaIJeLPmodlzt6HQ6S9K0Yb79qKVfExU5xOMxdx+6dN91efxQ1egy2DIzXLmKSxJ0PAds/6sZGvNXISdwo+xHAZEZggLy4pg/liYymg0xYzn5i3CXFFiaQ7Kd3Sqy24mt90Vl1fxJkO7ylqxs6pd6JIz9WzSGJCldiCvkwdxxv2HUAe/xZiLbjYMCnZgmUA4WhLrpeUY/1fz2vqDSh7anCre+YUHYFR4hfvIho5PVeJJ1QzkzwLoN3dtDiru0nQmUlniFaRjXLOf8RielMgNizyFnYRucfAmBodp2u7ewnNbd/4fb4ty3mAvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLUY6DlGAwjdwdzQLNA/gt8yUAg6SwxroiCRgpkoduo=;
 b=g1q+mkG2kW6chSdzDahgsrVQ1R46Dq24YH0nx3yAQMRCerZPbc6RRq6rA/uL7/fCOQ6LwzjC0D/Ug37MP+ZKxSp4Z11yIXxmjRw2f/J6ihbyODNYeFdYlu4FdMxoxyAVTR4FmI8YIUElbymxBWiv0Gkg3DKounUoK9XU5Uz66Kw=
Received: from CO2PR04CA0182.namprd04.prod.outlook.com (2603:10b6:104:5::12)
 by BN9PR12MB5067.namprd12.prod.outlook.com (2603:10b6:408:134::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Wed, 23 Feb
 2022 07:25:09 +0000
Received: from CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:5:cafe::61) by CO2PR04CA0182.outlook.office365.com
 (2603:10b6:104:5::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.23 via Frontend
 Transport; Wed, 23 Feb 2022 07:25:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT052.mail.protection.outlook.com (10.13.174.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5017.22 via Frontend Transport; Wed, 23 Feb 2022 07:25:08 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 23 Feb
 2022 01:25:04 -0600
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.18 via Frontend
 Transport; Wed, 23 Feb 2022 01:25:01 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 8/9] ASoC: amd: vg: remove warnings and erros pointed out by
 checkpatch pl
Date: Wed, 23 Feb 2022 12:49:37 +0530
Message-ID: <20220223071959.13539-8-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220223071959.13539-1-Vijendar.Mukunda@amd.com>
References: <20220223071959.13539-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c110a07-c675-4d91-a4f3-08d9f69d9ec5
X-MS-TrafficTypeDiagnostic: BN9PR12MB5067:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB506737CF39A037850DC492E9973C9@BN9PR12MB5067.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l6zeDD2C3xVQkqIWcZcgtZOT7I8w8ZX0KZE9opm/0rbtwXiggH04Dlpbr9uiYUATH1iHyGAlKfA08FXnu3iBeD7JhodJxYe7DDQ0aWJNb7GFwhiwo5yQgAoUJFfl8CVN+qORwgfE3uKX6DVBfGj6hD80nPoFsp4Zr3bikXmeCk3kw1SYyADW7Mc1YvEaCW7WpzGt6ezAC52zUYjktgzwEbDQYO6UOmKmGcaArJ8VXGJgprC2X7/TBWpPN1n6TjAxbO6XE8e6F7pe5it6SSvPHXF9tgyYQJYidkNVE0rEq1Z4pKlD8zvOXT0NgUIgfCj2XKPpMyCLDxazWKui77lXb6XdvV3ZQFUllXAJnzy0FY2ZoG4avnSifFYz2U8Hf1k7c/M+GKPPTfJSAWwJTGGLYajd/4ey4jg5O1u4YO9Vz7FQWGZEvPJRYyadlFVk3Gk34hSZIBnSskqxDRb50HGYZe29xXhpa+rqm9LL7fpU0mdHQYbAEjx7IIKBSPzUHKxdixWBhmBhe560COneddWEtVyhznEW5Fv8nC2gtxH7myhK1gi8TKnJqxViPhfXBruGcSQZ1C+eU2Wf3ixTEzUqyuRFvrg6wON0eSV/hJ/khglz4usbWeX2pafQh/X9qrY2/TqTKqNrpHHRwYEY3kyRuRm+haA7p5yDzI50rrxRyMNpUKJYTjsudJJuzRW5jTe7hFBGgdAO6GIuBqIkebwZgQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(186003)(26005)(36860700001)(70586007)(2616005)(70206006)(7696005)(82310400004)(6666004)(86362001)(54906003)(8676002)(508600001)(110136005)(316002)(1076003)(356005)(81166007)(336012)(83380400001)(426003)(4326008)(47076005)(5660300002)(40460700003)(2906002)(8936002)(36756003)(4744005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 07:25:08.1968 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c110a07-c675-4d91-a4f3-08d9f69d9ec5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5067
Cc: Sunil-kumar.Dommati@amd.com, wtli@nuvoton.com,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 krisman@collabora.com
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

Fix checkpatch pl errors and warnings in vangogh machine driver.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/vangogh/acp5x-mach.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/amd/vangogh/acp5x-mach.c b/sound/soc/amd/vangogh/acp5x-mach.c
index 287efd9282db..c574e80907f0 100644
--- a/sound/soc/amd/vangogh/acp5x-mach.c
+++ b/sound/soc/amd/vangogh/acp5x-mach.c
@@ -341,7 +341,6 @@ static struct snd_soc_card acp5x_card = {
 	.num_controls = ARRAY_SIZE(acp5x_8821_controls),
 };
 
-
 static int acp5x_vg_quirk_cb(const struct dmi_system_id *id)
 {
 	acp5x_machine_id = VG_JUPITER;
@@ -371,7 +370,7 @@ static int acp5x_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	dmi_check_system(acp5x_vg_quirk_table);
-	switch(acp5x_machine_id) {
+	switch (acp5x_machine_id) {
 	case VG_JUPITER:
 		card = &acp5x_card;
 		acp5x_card.dev = &pdev->dev;
-- 
2.17.1

