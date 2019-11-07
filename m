Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2869EF2F67
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Nov 2019 14:30:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4D061693;
	Thu,  7 Nov 2019 14:30:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4D061693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573133458;
	bh=AUIhvc2M4LK0d42r9sNVuaNfHe4pDshOycj95WPfjEI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uySL1tSmWvkXnf2W8ys6mA9MDOmyj1DN/ND1rR4y9wxDfrKKf4TqhbU+OPk4qxz94
	 4DXyfIYzwsJPJTtTaTA3eLrBn3gbP71RIMWuNA6wOIHKu5vhdwOsrqVGr+M7JAZpr2
	 X2TEAaSOhApcShy6vXC0emHk51jisIvbde3kXtJQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0704F8063E;
	Thu,  7 Nov 2019 14:27:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 115BDF8064C; Thu,  7 Nov 2019 14:27:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770079.outbound.protection.outlook.com [40.107.77.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F30D2F80642
 for <alsa-devel@alsa-project.org>; Thu,  7 Nov 2019 14:27:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F30D2F80642
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="ngOUpKMm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DYUUyOqRJUsN6OshetCRW6O0DlzPZyYCOPG/s846EPuimeBFzpnLGlMHIU8MmEhUiINUwdEVk2uiAr/m8/bnjRhVjBayOdLTCMT7ZnmHIxTVqd769VIPeEpr/x7/wj/jUBfh12uftxSVvrl3mfY27go1203iYTYkfaU/cVxPS3TtRUeGy0UZQjuJcsiM87phBRckSWbDWVbhF5jBfHMDLik6Ud8ueub+/8HW9tYJ8VHQbwlR6r8Jp7XqYaLmDX7vGt1V1DF2TQKD/5odqFVaWn7ap6Qd+lnziCtlUGgDboc3+AqC90o1xWlrlu2PpDTCpxWlJKOPQOQJ7cNdyYdYuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XKZUbaZSH17/e9RV772LPLHjWgMfQ56YGLiFF965dys=;
 b=SdC5fLRgO2/3BygW5bBzRRNetPNqFooLvmte/Ph1YYdEsrPVsch72xCftOMgNYRiGNabLvgTg422B2/rj26DuM6Est2twI45m4AIFmyQU8pobQRlAW5GgpoF89FAa7rdBwbG45Aak5e2ndSoXfO1CGAzpYXh5xgiU12+VPx1LrOlyGmV+P5VYlZ0nE5RqzVW/gU+4pHSF++4SNNBEtRVlykaouQOMwVSFrJCVNCc7bDaeBzQW+W6zHodiCx+sdSgAq51O3lbx0M6MGNGZZ09o/YBKXvQiceuYS0z584a/SQ7py+L45K24bqSsYUcR+xGeAxIow7QWoVHaEP5N8BzZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XKZUbaZSH17/e9RV772LPLHjWgMfQ56YGLiFF965dys=;
 b=ngOUpKMm0usVsDJMCAxu3yGseRebxdn6I63FOR2GjuXW249+EareQ+gth5xK7iNRPifvWXiCt6+J8bn1vYTEG9kcSPgLZjbFRXAwpyyHX7mNqk4Zbv5Senm2wmlOf9JQG44ckKDd9JRW+yypPNU7ILtUgwhk69K5B4Ri3RjVTj4=
Received: from CY4PR1201CA0021.namprd12.prod.outlook.com
 (2603:10b6:910:16::31) by DM5PR12MB1945.namprd12.prod.outlook.com
 (2603:10b6:3:10f::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.20; Thu, 7 Nov
 2019 13:27:07 +0000
Received: from DM3NAM03FT019.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::207) by CY4PR1201CA0021.outlook.office365.com
 (2603:10b6:910:16::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.20 via Frontend
 Transport; Thu, 7 Nov 2019 13:27:07 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM3NAM03FT019.mail.protection.outlook.com (10.152.82.197) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2430.20 via Frontend Transport; Thu, 7 Nov 2019 13:27:06 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 7 Nov 2019
 07:27:06 -0600
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Thu, 7 Nov 2019 07:27:02 -0600
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Thu, 7 Nov 2019 18:54:52 +0530
Message-ID: <1573133093-28208-6-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573133093-28208-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1573133093-28208-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(396003)(136003)(346002)(428003)(189003)(199004)(36756003)(50466002)(478600001)(26005)(186003)(86362001)(4326008)(305945005)(76176011)(51416003)(81166006)(81156014)(5660300002)(7696005)(50226002)(1671002)(48376002)(8676002)(356004)(11346002)(109986005)(126002)(53416004)(2616005)(47776003)(486006)(476003)(16586007)(446003)(70206006)(316002)(70586007)(2906002)(426003)(54906003)(6666004)(336012)(8936002)(266003)(32563001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1945; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68e04ea9-bd67-4cd2-135f-08d763862f81
X-MS-TrafficTypeDiagnostic: DM5PR12MB1945:|DM5PR12MB1945:
X-Microsoft-Antispam-PRVS: <DM5PR12MB194565FFBA326A99F4A27655E7780@DM5PR12MB1945.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-Forefront-PRVS: 0214EB3F68
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yq/wd1rTQ4tPFGgLJE22zn7wNrESP5SqvP8wHlnQHsgTmOVxthnDW4iRMrlo9HjXw9QWTeo+DoTDFlLoklDRvcs4cgpJOwtXOkwfRgHXEeGY5whIjM7TYffD4WDuGusghMkLk/Ncjf28L7QHVcR7xGeEPt0Uhh0hbpdOnvTB2mE6UJEcrFgmtgzxSsCuZG3YkWWi4iMErHt0eDKLYx5fwHZpaYRjxNvJ7mmbQlJ/n+uRt6r9gL98hwLN8UV8yVPfGAumGBYkI6OOPdls8CeHxmzHJeavUkSNLR68avO7NZ5RnLxrdBcFZCo0XG9VAnnar5+Fhr0r/YRVFHQdQE+ypwTJczXzsvKwdwcB8+XXx0vkWG5iAxfEffL7w1Twf55nIb6LwFsfOy4B7NqimLYt0hq3GdmDesqyRhmUAnNJdWGwzKJYWqGTUgFWz4n/fo6Z
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2019 13:27:06.9134 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68e04ea9-bd67-4cd2-135f-08d763862f81
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1945
Cc: "moderated list:SOUND - SOC
 LAYER / DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>, Maruthi
 Bayyavarapu <maruthi.bayyavarapu@amd.com>, Kuninori
 Morimoto <kuninori.morimoto.gx@renesas.com>, open
 list <linux-kernel@vger.kernel.org>, Takashi
 Iwai <tiwai@suse.com>, YueHaibing <yuehaibing@huawei.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Akshu.Agrawal@amd.com,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 Colin Ian King <colin.king@canonical.com>
Subject: [alsa-devel] [RESEND PATCH v3 5/6] ASoC: amd: handle ACP3x i2s-sp
	watermark interrupt.
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

whenever audio data equal to I2S-SP fifo watermark level is
produced/consumed, interrupt is generated.

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
---
 sound/soc/amd/raven/acp3x-pcm-dma.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 8fab505..629a32f 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -176,6 +176,13 @@ static irqreturn_t i2s_irq_handler(int irq, void *dev_id)
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
@@ -183,6 +190,13 @@ static irqreturn_t i2s_irq_handler(int irq, void *dev_id)
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
