Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DD110EB5F
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Dec 2019 15:11:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70A641666;
	Mon,  2 Dec 2019 15:11:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70A641666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575295919;
	bh=UjUjUDxWJU/76cLeFfaOsY6As9K6O+9otT+6OOTjPS0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EdM3I1Fv3+dBuROmgPIlxkdTgiGn58opnBgJDKUoz7EZja24TTJn+vjZbsMphSLiE
	 Sr6iycy8Emz2GeB3524/4stT9cBwjiaF2w60h2hOc9akAPiX7VzGh/VuZ4/T2IP37P
	 TurPJO3SStT+6ubqe/MjRoDRg6I2dY7vzawMsAfI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64116F8027C;
	Mon,  2 Dec 2019 15:07:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F8D0F80272; Mon,  2 Dec 2019 15:07:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820044.outbound.protection.outlook.com [40.107.82.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 191FEF8025F
 for <alsa-devel@alsa-project.org>; Mon,  2 Dec 2019 15:07:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 191FEF8025F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="4gCJny6t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bvgZIH3OCVN2xrpt2C8QG83YeZLQ0+e1vWBRwg5sssA5tHeiTVyxosCejBa55l29EGjIkh90SJzMiutg5bjjn9WyslUT2ddp47sSa9TVx+MiI1Dwx3XWpT87re3/ohBpK41DYVmkeYUYUlydudYjpOEBg5SaCJrEdojdg0BGbGW+16sgyHzyoEu7HbTDcGjFLhTwuT2A8/2KnBJ9NIXGkaocJfb1zXG/LlBHXtVUYtQWyrvgzKY1Tr2ceAhlX2gQVygOWp+iVRIEAHLeLm45RP6VsXGzMfeQaKbbvqxuwFa3htCfb6vl380y2cZGd03V4/tkp8238yK64DU5yrWiZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ut0B5CEuA09psSxCpV5btNncQviIbnAjU0/pQKg3nyY=;
 b=NexUbqZNtJczCXb3R88C/oq7ffTFQgst1yDTDnKAX7h6OuruqGoFXS3hfp67tgflfLiq1IQyVgbOIcH9nqtXUVDI/Jx7eDO7FpbWPDYwfpElDyAFWRxFL1I4+ikGIX/hD7AWQEL10EE4c7rZ2lFY/90CWYzGURyYB/L/5oI9QXTM68Rs/hSRKqDQleZnCJmYeams7MmonYGrhB3U9mSMHdbzLO7OGzBvSl1J+A3YBu7ZBJYVENlDq9YQcSon+KlH44FX/mgxjv62bpudY867SMIAYNfz9C6WlZpNWIX70pR5EmmzQskZyHxYXZxeG+enBCK+K+vqjPzvkTOwhl+Mmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ut0B5CEuA09psSxCpV5btNncQviIbnAjU0/pQKg3nyY=;
 b=4gCJny6tPY4lU9LcmkUIaVmBumyGRWXDN/rDdWveGRDN4h9/ksXTOYosMOM3h7Pfib7dUmCgwmOwpX/abTPj7bMBBT/PRa1t2a9qoOEZwPWCM1yvAy4QIpD7eQcqa9g1C2iipHiUUe7FrETNiC8HwRerLXYEnVJVdXKvxPZ/I9k=
Received: from MWHPR1201CA0022.namprd12.prod.outlook.com
 (2603:10b6:301:4a::32) by BN6PR12MB1681.namprd12.prod.outlook.com
 (2603:10b6:405:7::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.20; Mon, 2 Dec
 2019 14:07:01 +0000
Received: from DM6NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eaa::205) by MWHPR1201CA0022.outlook.office365.com
 (2603:10b6:301:4a::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2495.19 via Frontend
 Transport; Mon, 2 Dec 2019 14:07:01 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT066.mail.protection.outlook.com (10.13.173.179) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2451.23 via Frontend Transport; Mon, 2 Dec 2019 14:07:01 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 2 Dec 2019
 08:06:45 -0600
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Mon, 2 Dec 2019 08:06:41 -0600
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Mon, 2 Dec 2019 19:34:39 +0530
Message-ID: <1575295481-9076-6-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575295481-9076-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1575295481-9076-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(136003)(346002)(428003)(199004)(189003)(81156014)(81166006)(8936002)(54906003)(50226002)(356004)(8676002)(7416002)(305945005)(4326008)(109986005)(2906002)(478600001)(47776003)(26005)(316002)(2616005)(36756003)(16586007)(11346002)(426003)(446003)(186003)(53416004)(336012)(51416003)(76176011)(7696005)(86362001)(70206006)(50466002)(48376002)(1671002)(70586007)(5660300002)(266003)(32563001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1681; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: caf28011-9adf-42f1-33dd-08d77730e6d6
X-MS-TrafficTypeDiagnostic: BN6PR12MB1681:
X-Microsoft-Antispam-PRVS: <BN6PR12MB168114303501B3E858EC061BE7430@BN6PR12MB1681.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-Forefront-PRVS: 0239D46DB6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q1/jCyKurYx66mDd519wmD2asWWKvnuj1/wzCSgUBf+C0ntNx5bYhpH194pYk99nhID0aND2EeYaEpywwKlIjRCca7TI7mRYnsHKZkF8pNmzkejRHOo5vsbElxKyBkc8SshHR5B0Gbr+wpCdhz9Xe6DPN4J1EAoJPm5ggsNYZ3WUsJx3LwrXXT8Hohnc6fi3UEA3IT1bOFkCE7b5rg84g+j3qNJVb6YhWMHCMonrm11c8zBFvAUGDeyBqFxEV84TnhfpWwCyOLU3NP4t2MYtduDvuOgAASSLGK1bKQuyviplzLBvQbEyOoZUyTZDLjSTvhvTC1KYdYC6NC4rjnfs9AWGIzJo7/2+rtzapHFvUXpXpEDwepiTRqU/26XLl+0ZGp47tT3A1x1gCINAB6ECjbKsW1abHDvUR794Pu1DcOqM3UtsbZRoZKVlB/R5zlur
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2019 14:07:01.0297 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: caf28011-9adf-42f1-33dd-08d77730e6d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1681
Cc: "moderated list:SOUND - SOC LAYER /
 DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, "Gustavo
 A. R. Silva" <gustavo@embeddedor.com>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, pierre-louis.bossart@linux.intel.com,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com
Subject: [alsa-devel] [PATCH v13 5/7] ASoC: amd: Handle ACP3x I2S-SP
	Interrupts.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Enabled support for I2S-SP interrupt handling.
Previous to this implementation, driver supports only interrupts
on BT instance.

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
---
 sound/soc/amd/raven/acp3x-pcm-dma.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 14ef38e..7a107ea 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -177,6 +177,13 @@ static irqreturn_t i2s_irq_handler(int irq, void *dev_id)
 		snd_pcm_period_elapsed(rv_i2s_data->play_stream);
 		play_flag = 1;
 	}
+	if ((val & BIT(I2S_TX_THRESHOLD)) &&
+				rv_i2s_data->i2ssp_play_stream) {
+		rv_writel(BIT(I2S_TX_THRESHOLD),
+			rv_i2s_data->acp3x_base	+ mmACP_EXTERNAL_INTR_STAT);
+		snd_pcm_period_elapsed(rv_i2s_data->i2ssp_play_stream);
+		play_flag = 1;
+	}
 
 	if ((val & BIT(BT_RX_THRESHOLD)) && rv_i2s_data->capture_stream) {
 		rv_writel(BIT(BT_RX_THRESHOLD), rv_i2s_data->acp3x_base +
@@ -184,6 +191,13 @@ static irqreturn_t i2s_irq_handler(int irq, void *dev_id)
 		snd_pcm_period_elapsed(rv_i2s_data->capture_stream);
 		cap_flag = 1;
 	}
+	if ((val & BIT(I2S_RX_THRESHOLD)) &&
+				rv_i2s_data->i2ssp_capture_stream) {
+		rv_writel(BIT(I2S_RX_THRESHOLD),
+			 rv_i2s_data->acp3x_base + mmACP_EXTERNAL_INTR_STAT);
+		snd_pcm_period_elapsed(rv_i2s_data->i2ssp_capture_stream);
+		cap_flag = 1;
+	}
 
 	if (play_flag | cap_flag)
 		return IRQ_HANDLED;
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
