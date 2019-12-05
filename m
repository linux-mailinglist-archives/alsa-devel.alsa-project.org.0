Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A711141CF
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Dec 2019 14:43:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F10141675;
	Thu,  5 Dec 2019 14:43:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F10141675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575553434;
	bh=UjUjUDxWJU/76cLeFfaOsY6As9K6O+9otT+6OOTjPS0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k++oQmhX9C9/tdRq6jnp81Nj0y90+FGcDJQwJIdckByqGWhUXR4DO6XuwuyMwJjY4
	 C4EhXG9GACBMYQlVcZYiT51I4n8lbPVk9uJenZnN7nlKBV0bnoNngBCB/AphN9pw33
	 6gDPj7Fgzadxng3idJ8NjbzeVBEJ7TzkXKLumge8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFC02F8026A;
	Thu,  5 Dec 2019 14:39:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2076F80274; Thu,  5 Dec 2019 14:39:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A890CF8026A
 for <alsa-devel@alsa-project.org>; Thu,  5 Dec 2019 14:39:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A890CF8026A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="x9ZDDzFx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gYdZjBECXYdnU97eOYCooGh+MfW/iXXzOBBN2ozXXoFQGgo7eKHSlaqg2aeRQOZZRLCCsHn8I83PfXeWIiVFkN9YLf9po+qGokG3MlN/F1oLy3vmP9kZWQUYOIaHTtTjBNjb25D43Q50xrC5zpHaZTYpWmi11ElFfG+ikveSQKGCwcNVClvG3sbJ2kBowAzijkKssXRyePEVBW4OoEi2cRyN5RBi08EuQdQw07kx8TMRZ1Mh3AMQrRivVXt8+VzozTutv2/rvrFRcsvtHVZToUBBZOEArMcvChR7xbaawlwwE4HievU8z/tOmD2BvOjkpt05N2PvWlQY8yN2LwG8Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ut0B5CEuA09psSxCpV5btNncQviIbnAjU0/pQKg3nyY=;
 b=QVp1dqZqtRQZjMwncdOrBHq97pPe8uTt9FN9ULOZuD0pQJhkZNrdoLulFjRaOFeGEJtYdGM1lvO1zdG0/33w/u3tHMN+5kRisIQifNQGVmQMmseNeRpSXhpFvsEGYZW/mcml5okazes8TkxKRtuafe2NA7GiRy40NpgwXLK2mYNg8hpAMIjxVF+Oy+wpm0DhaoTkPU3YdziFehag96otCWZWTUFpIRMwCILK0U3EJXJn9U2w7DCi1Q+fs4BXuJcbI2gKg7zcCXI+k5vgBjLLrVpG3EOozCxYyVnnBjGcyh2TYbOF8JJYH7uAaO/NaMMsav1rd9//4uA31WfI5P0QKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ut0B5CEuA09psSxCpV5btNncQviIbnAjU0/pQKg3nyY=;
 b=x9ZDDzFxfOKRxz519jp8wDCd+JICUj73wMECIB2YJPIgQAZsP0DEFnHF+fGrI0iOpkda9+bX0QPaNVMDPiYcDz9E9fKThx2YONylRyU5f1mfAMYvn21r+jClaN+24/xrYpzM7otj6lp+g2NlEJ73vP33t/O0ucuPn5dDl/bqBTI=
Received: from MN2PR12CA0006.namprd12.prod.outlook.com (2603:10b6:208:a8::19)
 by BL0PR12MB2435.namprd12.prod.outlook.com (2603:10b6:207:48::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.14; Thu, 5 Dec
 2019 13:39:42 +0000
Received: from BN8NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::205) by MN2PR12CA0006.outlook.office365.com
 (2603:10b6:208:a8::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2516.14 via Frontend
 Transport; Thu, 5 Dec 2019 13:39:42 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 BN8NAM11FT006.mail.protection.outlook.com (10.13.177.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2451.23 via Frontend Transport; Thu, 5 Dec 2019 13:39:42 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 5 Dec 2019
 07:39:41 -0600
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Thu, 5 Dec 2019 07:39:37 -0600
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Thu, 5 Dec 2019 19:07:30 +0530
Message-ID: <1575553053-18344-6-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575553053-18344-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1575553053-18344-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(346002)(396003)(136003)(428003)(189003)(199004)(53416004)(4326008)(478600001)(36756003)(81166006)(7416002)(51416003)(7696005)(426003)(109986005)(336012)(2906002)(76176011)(2616005)(70586007)(305945005)(6666004)(70206006)(11346002)(186003)(26005)(16586007)(356004)(54906003)(81156014)(48376002)(50466002)(316002)(86362001)(50226002)(8676002)(5660300002)(8936002)(266003)(32563001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2435; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c67bc50-b331-43bd-d922-08d779889526
X-MS-TrafficTypeDiagnostic: BL0PR12MB2435:|BL0PR12MB2435:
X-Microsoft-Antispam-PRVS: <BL0PR12MB24353F8C00B0086DB8AE1678E75C0@BL0PR12MB2435.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-Forefront-PRVS: 02426D11FE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pwoCB/7KsGa4Ghm+X+F3GKYxMzeBY+rDoq/Oy8PENArxUJIUmOs/+uTZED9bQ3bCzZjG/oPQeoF6kkzZNU19VBdpMTi/Qeo20WYTc8XzofXRS4A+du+nlUSlI2Ll0v6lwe4fCqqWWYfHZ8lpwK61u8wacim0jHNR94MNJ76QbwuealHCMfN9B41o4JhG/duYcDgeq6R11ICoXC8JouCiAGvcV9ZSG7h0VD3TqM/TH9ldCzLFuMyArUXbw5aBPwn5IoeT3qdF6QBhMm6YPUjbJoTWbcgN26TCIqHDszcRcuHUbz+aAHRCU/Jkiz4ecJxaoNwoslkFTDkbkWbmhrpatipe9Rl67xCnDzS3yVxevLgtz5pxDsgsow7Cqwk1CMfYg3nXOozz1uvX9o89bR2b0gK09E+fMR/fUM6JCLgKHp0Oq5TrHr3sGyXg0sH+mA5mcEc2VUWM29B0PPZ+O93S7Z0iQAmMvJhc5c3pwlW936MjRx7z0kGLnaMHsV/+Xvl3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2019 13:39:42.0638 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c67bc50-b331-43bd-d922-08d779889526
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2435
Cc: "moderated list:SOUND -
 SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, "Gustavo
 A. R. Silva" <gustavo@embeddedor.com>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, YueHaibing <yuehaibing@huawei.com>,
 pierre-louis.bossart@linux.intel.com, Liam Girdwood <lgirdwood@gmail.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com
Subject: [alsa-devel] [PATCH v14 5/7] ASoC: amd: Handle ACP3x I2S-SP
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
