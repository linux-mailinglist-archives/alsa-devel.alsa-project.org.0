Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E41E1020DA
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Nov 2019 10:38:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13D4616A3;
	Tue, 19 Nov 2019 10:37:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13D4616A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574156328;
	bh=mgD8UJq1qElmaQr7EDDp/0PtZp7CDfPgJ8KTjxR7a/s=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tJ2hwfAQMF9mIGKHNaYJirCEChn9oZ6MHody+BtuPF8TuVo8FqPkAU9FzALkjtGmO
	 vMdO98Vx6CpLrGKQ5WiURWqfRrEsCe49KCuw+vUYgCbgi0Po+GsnCVyMRCSGtHZHUE
	 yffV+Q63HWrqdYMErbhnDRpO3wsHgBYVlCMpHbFg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04C6FF801F7;
	Tue, 19 Nov 2019 10:34:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A9CEF801F4; Tue, 19 Nov 2019 10:34:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750051.outbound.protection.outlook.com [40.107.75.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 925A1F801ED
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 10:34:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 925A1F801ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="gkMKm1ft"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=adX+aVMuQY5PcFW/gDSVq3cELcHPoPDxIBteqZXPLqF8qrMC7uzSMCvwsUVZkqU3r0/obYAb7TqbsWK7MGXZcd/POSY7zzX6jsMcOAWAw5ys/h4usXekXdZG/lnwg3WCE+J+Gk+X3svATb7r+Df2V6ZMLCjtIKhCdZ5aU+QxnAHpPrFFKrhzyENQtkVKtjBa19vNZj6GvPHV863Z87bjb4onc/ojvkEmcwQyyYqEpdXE8cY4vnihFkD6OTUvt3d1oLYrFJZMEk0CRjhCn/rd8QAcIKwk2LAI7OBPPLNsPelXEa5ZIparbFGnfA1A19EEeCLN4mfC+O7yzmUWJ/tWTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bF3ObpMDNGS6u6mbWRwaVQmx6sADTc0lqCjP4+6OrHc=;
 b=CkQk7AJtJOP67EySjgDyHY3SHDn1a+mN7E3KMMGX5brlSWejmniSJfFen/iR8LULZlcIWl3hBkEgjpk6OsHw+W0IFhd8TnWqjQUGuhSV6DJlcKh1bpk4tNam5IkBTqtwOFmSwEtZbiNVIFV6A0vBPwXNanoWVW5oSOqWIq2gH4gTPP2OstO6m5ol8dNsd7hGIotfON2xDpVoPFHM8TAduGRvJuOwmtLffcRK5QAq86Efg7O/lOARpsNTV2HGMrucaFvx4YY/QhmTpTfUxMZC1NCC3BduzK87buGal7xfGB5YcX5BY99YdFYX/qxQCtb60LXn861q1ZHdkCofYJv3fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bF3ObpMDNGS6u6mbWRwaVQmx6sADTc0lqCjP4+6OrHc=;
 b=gkMKm1ftSOJmGxTileQrHZf0xU/SPZ0x4duHbTUSwZP2fYF+CCLGbJeReqBpKtJd2yqfIEeHiBj3YHroNzzBdXYyFL8hgVH7Kyl9++rAZE8ihEZFrWI1y5SNDCnkURWFAI8h8QXOLwMbPaDemzpTkphZ41Y0bpSh5iZzM03E9lo=
Received: from SN1PR12CA0060.namprd12.prod.outlook.com (2603:10b6:802:20::31)
 by MN2PR12MB4141.namprd12.prod.outlook.com (2603:10b6:208:1d5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.28; Tue, 19 Nov
 2019 09:34:45 +0000
Received: from CO1NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::208) by SN1PR12CA0060.outlook.office365.com
 (2603:10b6:802:20::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2474.16 via Frontend
 Transport; Tue, 19 Nov 2019 09:34:45 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM11FT010.mail.protection.outlook.com (10.13.175.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2451.23 via Frontend Transport; Tue, 19 Nov 2019 09:34:45 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 19 Nov
 2019 03:34:43 -0600
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Tue, 19 Nov 2019 03:34:39 -0600
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Tue, 19 Nov 2019 15:02:46 +0530
Message-ID: <1574155967-1315-6-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574155967-1315-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1574155967-1315-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(1496009)(376002)(396003)(346002)(39860400002)(136003)(428003)(189003)(199004)(16586007)(316002)(336012)(6666004)(356004)(7416002)(305945005)(11346002)(478600001)(4326008)(2906002)(70206006)(70586007)(8676002)(54906003)(47776003)(81166006)(81156014)(86362001)(36756003)(76176011)(26005)(51416003)(7696005)(446003)(126002)(476003)(2616005)(8936002)(50226002)(486006)(5660300002)(186003)(1671002)(50466002)(426003)(48376002)(53416004)(109986005)(266003)(32563001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4141; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4153cee-b145-4ecb-dcb0-08d76cd3b6a1
X-MS-TrafficTypeDiagnostic: MN2PR12MB4141:|MN2PR12MB4141:
X-Microsoft-Antispam-PRVS: <MN2PR12MB414147B06BBE15194D5672DBE74C0@MN2PR12MB4141.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-Forefront-PRVS: 022649CC2C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MCyTHYB/C4gaokFoeNdoOYN1HGpEUJJcMls6TE7frgn5YyeqFGgP60wZVMjMHPoK55dtJfFLLQj5+Lby6Fgws55fqusDVQ/eC7tR0bqemLsACF/W1LaTVpzRwRpVaFzwAal8FfEUG8puycc8IY3VcEwtx4KA1DAJGQYKxRUlX/pb0hfubLfLdfIkQcBxd99tqAJzVqCNxNUnRNYDesO6vwRFPnnLwzZopUqoLY7yoIL5nG9lMOIhVY9el0jcaN8f6M6Fw8XSQASCvHSrP93RsNryKkphPRQJYli1YNUmrLHRHHPmSZ2eqDkmNB/QGxh/iwYoXjGEaj4OKepkqC4y0WoikT4deOMuRrldf+AOCZFA52vAJtoa+Zjz6ikHxa/UjON7RixKbhjEqzjmg4IO3/q0hyLoVqCdJ8ObybH3/wyluJh62bcXR8ESZbO/IYC0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2019 09:34:45.2538 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4153cee-b145-4ecb-dcb0-08d76cd3b6a1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4141
Cc: "moderated list:SOUND -
 SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi
 Iwai <tiwai@suse.com>, YueHaibing <yuehaibing@huawei.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Akshu.Agrawal@amd.com,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 Colin Ian King <colin.king@canonical.com>
Subject: [alsa-devel] [PATCH v8 5/6] ASoC: amd: Handle ACP3x I2S-SP
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
index 4fd3fc8..819ec3a 100644
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
