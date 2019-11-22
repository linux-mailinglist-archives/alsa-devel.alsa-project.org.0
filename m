Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3400106945
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Nov 2019 10:50:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66F0A1805;
	Fri, 22 Nov 2019 10:49:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66F0A1805
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574416219;
	bh=1dVWGJch6RN+sj1UxOH/hFme8cg6Fscqm6kkbZZr0ws=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kWx+Pf/Q1THH0WPjHieEmPpNTTSMcwVQ1pIXfN6t92QKHaOjOlTHR0pq/VVcNDIre
	 9+NSM2RWpoLCL1WSDhGGAOUs0wd/P2KECT0Rvd+YjBixKZmRugc0c67EZP7h4+xZLx
	 +BfZwDIdxMAyCUiJOsATnJduRF8p1h7ks05bGi6M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2B0FF80214;
	Fri, 22 Nov 2019 10:46:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91182F80214; Fri, 22 Nov 2019 10:46:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740057.outbound.protection.outlook.com [40.107.74.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 875D5F80212
 for <alsa-devel@alsa-project.org>; Fri, 22 Nov 2019 10:46:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 875D5F80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="2CRhYQ1y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mqV+Kv7fEM/86Pq95udEFZ8dc73MJb539a+Xj+HrCUZR4f4Z7Is7byWwFZveFOvL7QTrNORfgdhFWS7FTliqYP5L/Ba732iPzaWn8ga2x3slrKYLii0J1ZmX/7ogap+3JjCFNQfwD98Zyj8gsWpN57Cwr8dLb0rod3vEY5e91VEgMsPJBbYjzuJYnyfDbm4xlp8Gj9Pcwbuvt+lFbpy3wXaDt6/O+CST+PTyWOedszJUZBPzaYWrxm8hsRqeqEwxLfKrK0xAA4/TAiQVTWXDOCCuMPCx9OCBIQLjO9Z8gGOZj95dYEqYiobW7RVhtWwan3Zdm97ixsV5Fyg1Y2DqVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Z+ZDYawkk8tBp9HaE+4JIWUBR1HRu6Ii9XK6l4HNMs=;
 b=DF6A+HyqqhU6cwWNy7s8V0uisqfGVhnuMg3HQv3Wd+s1ENTpAIqbVAVjVY0SEv0Cbc54/ORUHUAGXrmIx5H3DRx8d7sFAOiBiaguLYx8j+1nYfoojE6AQaNycW3Z5ylZawa4GNrFYOipOqrG/GTL3EH4EHU3orS1clcm2nk62LquDCCf2TDWJ/Xfg/y6rBUDSNsbpgaDd+vw7aBX7jIuSW9eb3aEy+NIL+CWIZJfMPT4WLgKJ7z/ktf5ZkAVRFjoxtdR9YiNDWysOP8Kv1cPHQj9Kj5zNgT6dwA/XJuQCYtVsz0w/Ir6Ou5IKLkmqXvv8/cjT25rynaSdPqtBGdUHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Z+ZDYawkk8tBp9HaE+4JIWUBR1HRu6Ii9XK6l4HNMs=;
 b=2CRhYQ1yFtdOlYuTFQPm16dyOTxYPRg06uZ+xLFXPFd3YV5whNQbh0hay8OQ3b6vblOViytwvHQfljWrHL+Zj3Ob2igTWpFcB1N6CipAEKSK0WsapNmnsLd5QnCiCqtLsfQdsLPCL4j1PL3keNZdiiWSa+fjFpW0FxLnwt9hlYE=
Received: from SN1PR12CA0052.namprd12.prod.outlook.com (2603:10b6:802:20::23)
 by BYAPR12MB3271.namprd12.prod.outlook.com (2603:10b6:a03:138::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17; Fri, 22 Nov
 2019 09:46:12 +0000
Received: from BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::203) by SN1PR12CA0052.outlook.office365.com
 (2603:10b6:802:20::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17 via Frontend
 Transport; Fri, 22 Nov 2019 09:46:12 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT045.mail.protection.outlook.com (10.13.177.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2451.23 via Frontend Transport; Fri, 22 Nov 2019 09:46:12 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 22 Nov
 2019 03:46:11 -0600
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Fri, 22 Nov 2019 03:46:07 -0600
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Fri, 22 Nov 2019 15:14:25 +0530
Message-ID: <1574415866-29715-6-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574415866-29715-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1574415866-29715-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(1496009)(4636009)(376002)(396003)(136003)(39860400002)(346002)(428003)(199004)(189003)(446003)(86362001)(8936002)(4326008)(50226002)(11346002)(5660300002)(2616005)(26005)(76176011)(48376002)(1671002)(47776003)(186003)(109986005)(51416003)(426003)(70586007)(316002)(7416002)(2906002)(81166006)(53416004)(81156014)(7696005)(478600001)(305945005)(70206006)(50466002)(54906003)(8676002)(6666004)(356004)(16586007)(336012)(36756003)(266003)(32563001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3271; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6bbb11ef-2bf7-452e-b953-08d76f30cf45
X-MS-TrafficTypeDiagnostic: BYAPR12MB3271:|BYAPR12MB3271:
X-Microsoft-Antispam-PRVS: <BYAPR12MB3271AAB563CDE6DE5FC082F0E7490@BYAPR12MB3271.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-Forefront-PRVS: 02296943FF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7XbBls1D/XBVsPnjBkhlSvsWDg5SVY+VsNtpFYEpJg5hEwM6eLHN+CW/DSSAycVIBzYqwq5EC/+aCH8w2LXTXHkUTSz+qx550k8chMqrV1SylcDB1UHshMD0Yd6kOs3Ac2ckCaeUcPhoMHUxZMaE3bz4l9DcAkZRZbnDOLdytaZZQC1Or6DYkxZRyrsR4YeDF5S5tICxj6xDhMMLCycKozJQOVgMlzsoeDx+9Gj8aiPDNuKWpvUviSnfshuaPWzLFeCXVUgAZo+qUFQyxxhL/DEOWVQ9QL3Mse4ZIB+snGz8KLBYpKOapJNVeg6T48jbXR2pDO1U84HOp/pkoT+mZYOR/O/xIWa8q5+SOHEAZJXYFDw80f7jIEVoDEXiHfc2IbRf1Ajq6gBdaimLIJfQishSYXQBc1f/8Kxarep/37PnwCJ3iaSb4C9fT0iRMUfN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2019 09:46:12.2360 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bbb11ef-2bf7-452e-b953-08d76f30cf45
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3271
Cc: "moderated list:SOUND - SOC LAYER /
 DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, "Gustavo A.
 R. Silva" <gustavo@embeddedor.com>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, YueHaibing <yuehaibing@huawei.com>,
 Liam Girdwood <lgirdwood@gmail.com>, pierre-louis.bossart@linux.intel.com,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 Akshu.Agrawal@amd.com
Subject: [alsa-devel] [RESEND PATCH v12 5/6] ASoC: amd: Handle ACP3x I2S-SP
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
index 77f2ed5..a6bc9c1 100644
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
