Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3432E5BEE01
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 21:48:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1911E0F;
	Tue, 20 Sep 2022 21:47:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1911E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663703296;
	bh=rFAY7xwh5KQpgJQLWpqFQ7dhccyYmzMLvmc4R10MbjU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KRaZ9M+FMO+6C6EX+2iKsff+bDJ3EuMaDIgwAhwPnsQR0a3dJ/1x/xJ5+Fs/2aA3G
	 67UTe8jzWHZYd2pCuSzIE85TTQA1TUxIARUGLHz8OICXeRxbHLc0TGfXLT1LdELtcr
	 a06WXzSBKkU6r5sdxMdYHYs/WeCX6f7XF+0cKatc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEF0BF8053A;
	Tue, 20 Sep 2022 21:46:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72A17F80539; Tue, 20 Sep 2022 21:46:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2050.outbound.protection.outlook.com [40.107.95.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 533A8F80155
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 21:46:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 533A8F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="cst7D0GB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HVnLM9Ybng14O8MxFqcKDwQYs3dDU+csz+zuSD81Ti2fR1bPt9YT0iVzRgXPzzbKsVC4cnUaD4zKgPf4c5XK7DpHXFpOwmqGQQGNNbS5VbTUZ2M9da52rpnvDGv4jB4jWxmJKwvfukDdu1rmE6+I7emf0kCXMgyNq4PrLx8uu4B/28+YgHo5q0J+OKz64TX9xe7jjpfjUxLzeSBpU0ftYe96gBYQUjyFKnoeDmGeEuib84+B0BaFr20DcwBW4oDzRoDl+Ca+Ogkas9aPNKydrmZsjiCrMdLDj4LgFuQJ8xvcqucLQ4bnBk2ee7OLY0xCmYGxvnk83TeDx5CO/wWeKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rJ3sNGeSi2CiODjEOTLym8GZM3kHeZ7oqJNIfNhJhQ=;
 b=RGmxufBcPbszsNC0Td3GjIfusGGC7rDoNJfeY1yqpGa7vN+rprkssDhSH8h/tibqrKW56Na2g/D0x4r23IPdoVBHzYVXCDADKhxB/ilf6IV4osmi7hsPYUjm7sKzTOEamcaWBcPCgP8JOzEDoOkrSKwKZrW/aaMncMeRzzpq0A6foFElw8XqJEFg4fSllNZxkdrIMGjb2Ue4QxLcvczoL4A833CTqbCWw6b6i5IoR6almviVFeNZdvTevY+Td+sSB4cRwEvCqrG1UyjqZ9ahXsiNkxVBnzWs/zuCTwjkW7STwUfnJR1g5aHGCoaHwPcfBN55La3pIkkGr09RGOTdlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3rJ3sNGeSi2CiODjEOTLym8GZM3kHeZ7oqJNIfNhJhQ=;
 b=cst7D0GBDCKTf62DR4UxDG0z6pGUNQnptqAdYtpz7VxRcnOwEAUZKZ1iABbkWnFneOGsPDEw7XNqWhvoXm6oCdHrwm1VTUtJx6+q0IB71psnhcKk8CNEi/k3wIZksX8DjOa0wAgWfyIIlzJTRQsuV/HvnpXcn3wZUbiWesXWWak=
Received: from MW4PR03CA0078.namprd03.prod.outlook.com (2603:10b6:303:b6::23)
 by MN0PR12MB6030.namprd12.prod.outlook.com (2603:10b6:208:3ce::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.18; Tue, 20 Sep
 2022 19:46:26 +0000
Received: from CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b6:cafe::f5) by MW4PR03CA0078.outlook.office365.com
 (2603:10b6:303:b6::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.14 via Frontend
 Transport; Tue, 20 Sep 2022 19:46:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT032.mail.protection.outlook.com (10.13.174.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Tue, 20 Sep 2022 19:46:26 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 20 Sep
 2022 14:46:25 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: Mark Brown <broonie@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/2] ASoC: amd: yc: Add Lenovo Yoga Slim 7 Pro X to quirks
 table
Date: Tue, 20 Sep 2022 14:46:21 -0500
Message-ID: <20220920194621.19457-3-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920194621.19457-1-mario.limonciello@amd.com>
References: <20220920194621.19457-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT032:EE_|MN0PR12MB6030:EE_
X-MS-Office365-Filtering-Correlation-Id: f3a357f6-1fae-4c3b-fd78-08da9b40ce34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gc1cyZrlpH2ZxBlKkieZklw2wvrtjjCuwluME0bBEU61SVfsLDHQJautM+pxJ4jZRcFOAkFW7jASTJVWQiUfoVc5NAnw5Uol3wOll/+jBe4GPtwYwznVH20ovfoLbrPCwpUNYb8kfjzAbHKcFHkYlUXOIsXaWP93ya4fBFMkWh63q9YJXb8D8yoidmOCvvy6BAu14Si2bEvTRACli5kto04egD4lIZe45wZOo5RS1OxgnDQW2xTBA3/uQuOrKdIhy673atMUMVWwHKu/7Wk3GAlrw768rOX/hLgICLCriLjxsKP3C/fylsYDLWxvTvPCNWunkcZfx3bpFHHHTBGl49N3Qwgc44sZDYsqu7JpeDO0jmsvCVs6tsrDdKRu+bksB6bDnswcVzH7j4GN0vDs2NNVbxcCiLcAZy6unXS9Hzi82cZ8Wo/MjrBYFFw+A2rayglsMdxWwk2zRFbMcoE8MTISndCly16BzfwR44z7CVfKMc43FeT63syso6GX7xycja+HyDnnqzk31TFHcc0hZX34xLKzXlKFyWzZmToB/XXarNYCrLlEnhPauf40l1hXACQS2Um7f50WboGdKDHirvq8aOK4L6h7sPkIQTWK4R+C5f2eEaaunlLJO5Fm8Jcrw8suXys0GnHPhB8t5p2gUn3J+BalMtHiCIXP2Qcy0NzGmvkvLkOYNI5/vLJUG5jSeqCJ4IfPkdMDcgszcYFWoB7fAs3ImW8Mi15HyvxPw86eThvcE3x9NCQwDJSC2uRK6qJmm0PFh7M46qVAjjHpSxoQJvsHMB9xc+jalfsNNreo5qYz9Rizvbo1Aim3L1cDoy3cgk4Kn72m18H5ZH498g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(396003)(39860400002)(346002)(451199015)(40470700004)(46966006)(36840700001)(40460700003)(86362001)(36756003)(81166007)(40480700001)(5660300002)(316002)(54906003)(110136005)(478600001)(82740400003)(966005)(36860700001)(8936002)(47076005)(4744005)(70586007)(44832011)(4326008)(70206006)(2906002)(8676002)(82310400005)(7696005)(26005)(41300700001)(6666004)(356005)(16526019)(336012)(186003)(2616005)(1076003)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 19:46:26.4263 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3a357f6-1fae-4c3b-fd78-08da9b40ce34
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6030
Cc: Travis Glenn Hansen <travisghansen@yahoo.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Xiaoyan Li <lxy.lixiaoyan@gmail.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Sebastian S <iam@decentr.al>,
 Saba Kareem Syed <Syed.SabaKareem@amd.com>
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
Reported-and-tested-by: Travis Glenn Hansen <travisghansen@yahoo.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
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

