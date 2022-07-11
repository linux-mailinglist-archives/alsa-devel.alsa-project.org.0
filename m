Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F26356A39B
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 15:28:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFB071652;
	Thu,  7 Jul 2022 15:27:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFB071652
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657200491;
	bh=0i60yfXrhikRaQXF4aDA9i1FXlLVt7WxR9BA82Vn3fY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XTmYzhWPhgyq8T1tH3+EZGiFinGYovmuZD2yldwdmj6bs8s9t6tPhDb+OCwv7e8MU
	 pBRgounN4L/viwue0lXKF0hJ0tZW3DLEO99PlOAIWzERchbk/IMPG76NqhTTvIIu4S
	 YYaxvvefiiAs1r8/pFLk4e08OMyn3ycAjhzjd8bo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FB61F8053A;
	Thu,  7 Jul 2022 15:26:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44467F800DF; Thu,  7 Jul 2022 15:26:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2069.outbound.protection.outlook.com [40.107.244.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D38AF800DF
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 15:26:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D38AF800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="KrzGIycY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZRls503E9VHdNuUg2h/SRsLKp4OBucWi/FwvAVDoIhDfprP4edceFZEmkKzzGu7v5VT1OWiH7dMCJpzf0r48kAgB/EFQpk8+oUOKKlKT7y40L7gG4/h8njB/DTK3wLH8GhlK/hQvDdgIx8KwDzD8yR+hLggx2YckYVSDfkoXe4mfhmjyJXemPWW6uIPVcRAWUaJLHvhFA+knU2lw45QaKtMGvEr4V63lP9tinEtnfDjI75hKQO3lPfs77VyLrSjg56n2AcpFWJx+hO7B1k1FM3jV8XUa44irqf7n1+Fku3rnXCYQtT78hFUjxMa88w2aDsBCpD+6Im6Cbf0Lsia6EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bhmil6JCtg+0pKELb1s1GGnwcvaXXxzIHSln6hCw9Sc=;
 b=gItmz4oYxkW/Ntq0GNAQevXF/GMn9H3tt+ESOYp51QFfeQDchihVRzQp4OeJSZV4nFbWipq0WlUBjJECmA7l5qJBOf6ZEI1qt/6FvKjcSyE7G1+l3m2Qyc0V8BBYkpGBLdOgP5heeWDn8xylwCt7vFM9DqWo2BtfxMfuSvjnUs4kvpEMZDosds65TGr9fuwJEMPPnRfQe5YdB3l59kO7JWRIqjeLZKWj3DuzploSBqKnmim8EOiIDbcpf7TmNXnNNNNkyCfA/MbtpLWRRYMk0aBl4TJelsv6N2XMCZ2YoVHxv6d68LLUzpFGyP0WEtzn6SHpwv5oOOQLUppyOhTjpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bhmil6JCtg+0pKELb1s1GGnwcvaXXxzIHSln6hCw9Sc=;
 b=KrzGIycYA/ly2fw9rDE0AhciM/k1ryRfjlUKhuLVDuB10eGOUiXLtiJL6PVeyVLpI06VxHtxhNo521WfuLhDP+c42uBq1pdB6Fmw1dZYKIwMhVOd02M90ItqcMbAtct1WnzQP9U2+utn7oExekcD66ZbRRk7V+6QcbDl7DSvw3M=
Received: from MW4PR03CA0005.namprd03.prod.outlook.com (2603:10b6:303:8f::10)
 by BN9PR12MB5033.namprd12.prod.outlook.com (2603:10b6:408:132::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Thu, 7 Jul
 2022 13:26:36 +0000
Received: from CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8f:cafe::b6) by MW4PR03CA0005.outlook.office365.com
 (2603:10b6:303:8f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15 via Frontend
 Transport; Thu, 7 Jul 2022 13:26:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT047.mail.protection.outlook.com (10.13.174.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Thu, 7 Jul 2022 13:26:35 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 7 Jul
 2022 08:26:32 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 7 Jul
 2022 08:26:32 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Thu, 7 Jul 2022 08:26:29 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 2/3] ASoC: amd: drop machine driver remove function
Date: Thu, 7 Jul 2022 18:56:09 +0530
Message-ID: <20220707132613.3150931-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707132613.3150931-1-Vijendar.Mukunda@amd.com>
References: <20220707132613.3150931-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d71de9eb-6f76-48ce-045f-08da601c5108
X-MS-TrafficTypeDiagnostic: BN9PR12MB5033:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i71tJPovjM3M1ot0snro3bvFiieGM35+1TjYegkB8UK8jmXyenE6jEfW5RQ2QjmkIAZJHS2ut/3whQkdNma5PniuG7/WmlqQsMXSNbHEAXIqHEiY/fWaw+/O4KaV5/T1CEqnpykw3QLwP5sLZrNeeQcsNPlTg3pcr0cpSW9PU5r44TQuhEvdkYQHaRTxhRoUwcXYtcs7kItoJN8CTDV6ipM3C0XoczrsTllCwQAQbdbO4VKKWSnnZSKdijPrCz1wpxFBJyWEi+iVopOa+AOBRpP4iJY61E37b6IYDY4wc9DYvmS+dFrdhlTfrL1iF9w988dqPNwuKSPDk2a7ChTadxhJvv6raEbjYz8bGSNDmQdCbFUdZFjT0HT5gxE9QJKleLlCoJ3d4ntZlElE5jvFih0txWWm3ZJagoR916LxKBaUoNPnbhyao8baAwnsWtqL/GgkuP2/h9Pmt03HRmSVjTQlyw1fIXDIOwfeyDH7i3BE1UhWhP6sMtwmV2OWMYVJqS/2b5eLA1L3UXoE24WS+vKn1Lre6F4RanurJqq1eguAIZgJSg3d/n1xuYRREqt/rsE+cWmNbNXV+AQDD54Wo766YHg6I2C5I+ejQZ/cdsOwnhJJ9ArGymYXuTF9QwoQWidjBqMd5yUcxoVZmwHEp3zkNWtB9xIGlsKFMaxLuxoLj8zs0pbYMJ/5VzNjZxjIgomWFWKR559Smb1ZP5SRoqCSB+eLrSHG9lrJJ7XlxRmYOAgIFtFZ8nP32B868Cs5KMOc8W8ESYpwt95RXhNmiUQRrBd1ERyc6HoOr2zPeJjpAJ2br/M6VCSpSjg7vN6rfyy0Y+lJ1yjoSLqTu+wvzH2ZjHGkfQGjMxjWiMAdLKy8WTMoJHrT1OdjMasGKN8b
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(376002)(39860400002)(396003)(46966006)(36840700001)(40470700004)(2906002)(26005)(40460700003)(186003)(7696005)(36756003)(47076005)(2616005)(34020700004)(316002)(1076003)(478600001)(336012)(82740400003)(40480700001)(356005)(8676002)(41300700001)(82310400005)(70206006)(83380400001)(5660300002)(8936002)(81166007)(4326008)(426003)(86362001)(110136005)(4744005)(36860700001)(54906003)(6666004)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 13:26:35.9302 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d71de9eb-6f76-48ce-045f-08da601c5108
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5033
Cc: Sunil-kumar.Dommati@amd.com, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, amadeuszx.slawinski@linux.intel.com,
 Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, zhuning@everest-semi.com,
 Takashi Iwai <tiwai@suse.com>
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

Drop machine driver remove() function.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp-es8336.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/amd/acp-es8336.c b/sound/soc/amd/acp-es8336.c
index 8ce26c9b3ead..90f4e5809c72 100644
--- a/sound/soc/amd/acp-es8336.c
+++ b/sound/soc/amd/acp-es8336.c
@@ -293,11 +293,6 @@ static int st_es8336_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int st_es8336_remove(struct platform_device *pdev)
-{
-	return 0;
-}
-
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id st_audio_acpi_match[] = {
 	{"AMDI8336", 0},
@@ -313,7 +308,6 @@ static struct platform_driver st_mach_driver = {
 		.pm = &snd_soc_pm_ops,
 	},
 	.probe = st_es8336_probe,
-	.remove = st_es8336_remove,
 };
 
 module_platform_driver(st_mach_driver);
-- 
2.25.1

