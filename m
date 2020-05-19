Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3628F1D9A08
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 16:36:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF9881780;
	Tue, 19 May 2020 16:36:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF9881780
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589899014;
	bh=5zq728ZJV6eCyVD31I23xaHIb1to1LqEGPxyB7LPNKo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rH7yJeahUAwLSo5opiE2j64JuP5fvXoOtsuziEmpYN9Gwj00LSqnc7z/DpCV16ubV
	 iVC8WGIKAowEZfdL4GE1GcXQ4vNbjo5DgqBkpYxNUA1C4YhaSV7Oe9WxMNxUHQcq6x
	 nlV1KjZEEPOE9yBTg/ksTswpTdewE+srQaCx4hf8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B5AFF8025E;
	Tue, 19 May 2020 16:34:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 279AAF80274; Tue, 19 May 2020 16:34:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C8DDF80132
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 16:34:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C8DDF80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="S2oUXP0U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+fhzvIxBYFDDgIyxqKAiajoblzpKaUyadqf/JLOuTDrIVbT8yvt/rrX4dcxgCvl0ZRu1ztn3cM7RtONh6YSmcjUMCX2CSCvcXUTtVRYXqp8QYKtGK1HMn/yDXElkeovurEcsTgxIRMnqOgDI8eJgyknt+XNMq6ohf5bhfMCfJQAVPHbRpngPM8s/fs4IFQJ1QzkUVAu63c0alryfNqAsXVxq8gVwn7aW1Es5Lwfi9aVZiIPaC7yq/SWBK61kXkwmSywd1pIvAn2tZGKRdojJtQ3Biihn+KZxb3LXY+D7KFgdWhxtr8wyHq3ixhbbVxzFRGg2gzX5626rvAek9uadw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=65EJ+LS6E2tMFYhiIfl2qPreF5KMA1DrWaw95vuZ1xk=;
 b=HjxsRayF9TDk3uH6N0KeJxxtLqy4THLCRfXrc0sOUnkruRmxm/mVfz7J2e3x/GH6lUMvvoiZCMRn+40SmFYZyPbbDzWS78jDHvyVoj9/yBNsIm/nLk/al3WKQBm5nTgveYS00CfYmazY6E+9JFoVVsUt2dNPnwz4oU3w+GjvtQseEmWRE2m8uuWhLI2Tp9mwMt39whQVJr150bGodAHEgqk9NmkeKAEK9RmYG9X8KQg03iSYaC69z0IRJI07yiiWeAC/CjJ1ft7At/6EZyIffskZqaOAaE/4YjTp7THbl4dS800ZxAHq0PrSAquhGa32ZvRxISVnBukIp7YpRrnocQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=65EJ+LS6E2tMFYhiIfl2qPreF5KMA1DrWaw95vuZ1xk=;
 b=S2oUXP0U11lrfVBoD5C65D3q/1NnYNFaoeHeituwPxZFNCeAULL95aVzDdfyFMAmS2W+phTU2Ubo/2CC1jrD6xQDxg1Yl2X1imDYfi3VkbziQaN4TwuobJRHAGga8qII+56jzoYebCDyVK7iCkFb8i0a9eflg+Qp75lEKCmpzzY=
Received: from MWHPR11CA0013.namprd11.prod.outlook.com (2603:10b6:301:1::23)
 by BY5PR12MB4291.namprd12.prod.outlook.com (2603:10b6:a03:20c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20; Tue, 19 May
 2020 14:34:16 +0000
Received: from CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:1:cafe::2) by MWHPR11CA0013.outlook.office365.com
 (2603:10b6:301:1::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend
 Transport; Tue, 19 May 2020 14:34:16 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM11FT050.mail.protection.outlook.com (10.13.174.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3000.19 via Frontend Transport; Tue, 19 May 2020 14:34:14 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 19 May
 2020 09:34:13 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 19 May
 2020 09:34:13 -0500
Received: from atgasia02.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Tue, 19 May 2020 09:34:12 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <alsa-devel@alsa-project.org>, <broonie@kernel.org>, <tiwai@suse.de>
Subject: [PATCH 2/3] ASoC: amd: refactoring dai_hw_params() callback
Date: Tue, 19 May 2020 22:34:21 +0800
Message-ID: <20200519143422.18255-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519143422.18255-1-Vijendar.Mukunda@amd.com>
References: <20200519143422.18255-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(136003)(396003)(346002)(376002)(46966005)(2616005)(26005)(8676002)(70206006)(70586007)(478600001)(426003)(2906002)(336012)(36756003)(6666004)(4326008)(86362001)(47076004)(5660300002)(82740400003)(1076003)(7696005)(54906003)(110136005)(82310400002)(356005)(81166007)(316002)(8936002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6745f6b3-8b10-4687-2443-08d7fc01b44f
X-MS-TrafficTypeDiagnostic: BY5PR12MB4291:
X-Microsoft-Antispam-PRVS: <BY5PR12MB4291B53FB888669D140BB37797B90@BY5PR12MB4291.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:469;
X-Forefront-PRVS: 040866B734
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w85ZwDC64Vf+ifPKGT98NiP5cxPMWCmuuABlah0eUFZ8N7aelz9nnkX8L7PZSPSB8vpQI6NjyiovU8K1+AFvsqdLf82PxaNQbkkMdyij9+3vccGHK7yyHkeow8e7go9V6brx1LI6r5X9auEBjvFrkvNp5dZdJD31qo7jkYNKr3sXpuqIscW3jg51WzpHagdXd2bzHlPzjlBalje5o6XuqLVe9xoSEqJL1GdI5WImW7pefDe87WdAX3SkJa5BArH1pSvLIRWqeuMgnBbSXcstWWNDJsQpYeaMwYNFgU59ebx22y2DSXpGJP3JjfTe9DH9eHnZ8Usw1R3jXEf/nQw+jtKH4xFIem14xeYlzufoSHn7VDogPlx2n449c5pmQpSjjyXiVWHGGm8nIqTL1RobVZbdTRnEsTPFS/JS7gvVYRX3ZyLErYzYr/tf/7SNvVipbhEy43RiVkSDJSLMCUfQa1c+ZUkXvK4ncmQQVW1snan/2OEC11YkFqpv2b3ycWeFZcuycm+1hpIkM0NNMzn6EA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2020 14:34:14.4727 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6745f6b3-8b10-4687-2443-08d7fc01b44f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4291
Cc: Alexander.Deucher@amd.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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

Removed api config_pdm_stream_params().
Modified switch case for channel check.
Default case should return -EINVAL.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/renoir/acp3x-pdm-dma.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c b/sound/soc/amd/renoir/acp3x-pdm-dma.c
index b33c7aec7481..623dfd3ea705 100644
--- a/sound/soc/amd/renoir/acp3x-pdm-dma.c
+++ b/sound/soc/amd/renoir/acp3x-pdm-dma.c
@@ -72,14 +72,6 @@ static void init_pdm_ring_buffer(u32 physical_addr,
 	rn_writel(0x01, acp_base + ACPAXI2AXI_ATU_CTRL);
 }
 
-static void config_pdm_stream_params(unsigned int ch_mask,
-				     void __iomem *acp_base)
-{
-	rn_writel(ch_mask, acp_base + ACP_WOV_PDM_NO_OF_CHANNELS);
-	rn_writel(PDM_DECIMATION_FACTOR, acp_base +
-		  ACP_WOV_PDM_DECIMATION_FACTOR);
-}
-
 static void enable_pdm_clock(void __iomem *acp_base)
 {
 	u32 pdm_clk_enable, pdm_ctrl;
@@ -332,11 +324,14 @@ static int acp_pdm_dai_hw_params(struct snd_pcm_substream *substream,
 	rtd = substream->runtime->private_data;
 	switch (params_channels(params)) {
 	case TWO_CH:
-	default:
 		ch_mask = 0x00;
 		break;
+	default:
+		return -EINVAL;
 	}
-	config_pdm_stream_params(ch_mask, rtd->acp_base);
+	rn_writel(ch_mask, rtd->acp_base + ACP_WOV_PDM_NO_OF_CHANNELS);
+	rn_writel(PDM_DECIMATION_FACTOR, rtd->acp_base +
+		  ACP_WOV_PDM_DECIMATION_FACTOR);
 	return 0;
 }
 
-- 
2.26.2

