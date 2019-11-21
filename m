Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 772C01051CE
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Nov 2019 12:51:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13376176F;
	Thu, 21 Nov 2019 12:50:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13376176F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574337077;
	bh=qEUctWakgUbhN9mdrdA6L7rIiFuhs8uoa0pD7QasDXc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T2fbid8d98/PGI6+bfySy+b9vDIhcyOFyiEyjqW+MYAczGI+bVhZ1UFqr4Jnin8Dd
	 ooC7cXH3AeJ5mU5ob1dh0wQeYFDehP0/z1dMLi7sHE58/4ekcPqCCIX4NzVWdZMoJ+
	 9gtliynNIuWARB13O3gyJIvqOAByysz+fcR7lYKs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D063F8019B;
	Thu, 21 Nov 2019 12:48:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 562ECF80162; Thu, 21 Nov 2019 12:48:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730056.outbound.protection.outlook.com [40.107.73.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2583CF8015F
 for <alsa-devel@alsa-project.org>; Thu, 21 Nov 2019 12:47:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2583CF8015F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="kiplqxM4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GYD3IBJ/6S3L7DJ0p7VFKOqQQyS9BvUcmg9Isfy5yfE4jnI7z0JwarrB5Li3cNJRMVq5hEzksRnn7qhJRxCu5Oky0FcIm1lCm0Te/zdv1aRpDPt9u8ogF2au9pOpzvnO2WIdy3FoU2vV94IIbCFZ/PwGdjIiAyt//M1ArES6SD8DQEdMa97YCKFkLb95bRk85TUK7LR/EwgzJU+P1e2OyVJazE6r8dSlKgUBvsz/bdZlgXPaUcmyf0v30A3I6FXowYMhchJSu3w3xjLkTEVEVqGMolH8p9QUkPvWO0vxvfCU+aZErH4AcNiEznOatyrHzCrFEo/WQrLWprltD7dheA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pXAvRQ+AVPnWXVhDq0aWH8Wt/V7M1Kh1Cy2rd2jnZYs=;
 b=RWQx/ty6zN1N7EFJAEGLvSkyRMsKPlIPznhA+rTbN73uJ+7zT3yLQBJK22D/obGRHfsV53vvBSGqxkDa7U4yoXQfqRuTw6G/mPdwalh7hUEmVszpHXoWYgofZ0VvxK6m3zN/1UVJ3KYM6HDQ7FW1Udld26Y23TNkK4LpLx35VkcSKz0gvIcpkIH3EJn4HQKlZ4V/qCGUGty7FxnambKCZJ8dKvMi6UEcAKBD67dw2NZA0opUQUB4fFbfyV76NpIC3Xo2SBswNico9OIdV8V4pSY48abal6jFCnrRcBp1ATMwkssGnQeJmmFCvGULpZ/A0LQPiwDpDCGxyVAWkzNueg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pXAvRQ+AVPnWXVhDq0aWH8Wt/V7M1Kh1Cy2rd2jnZYs=;
 b=kiplqxM4yWVrYHpxpPG9Jk2taGfztOmoZWEB+qIZWHA07AeGMePLHgw5LBTtoqPimTEj8yP6pT+TLgm7gLX2/T6UoipoKT01yyz9ut6KETI9VhpfSSuh2F4faaLRcqffD3jV8qYbuSZ4NTCvbUqUKIJPHsZoy6o29JCMz0YWCDM=
Received: from SN1PR12CA0052.namprd12.prod.outlook.com (2603:10b6:802:20::23)
 by MWHPR12MB1678.namprd12.prod.outlook.com (2603:10b6:301:b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.19; Thu, 21 Nov
 2019 11:47:56 +0000
Received: from CO1NAM11FT008.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::209) by SN1PR12CA0052.outlook.office365.com
 (2603:10b6:802:20::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2474.17 via Frontend
 Transport; Thu, 21 Nov 2019 11:47:56 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT008.mail.protection.outlook.com (10.13.175.191) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2451.23 via Frontend Transport; Thu, 21 Nov 2019 11:47:55 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 21 Nov
 2019 05:47:44 -0600
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Thu, 21 Nov 2019 05:47:40 -0600
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Thu, 21 Nov 2019 17:15:59 +0530
Message-ID: <1574336761-16717-5-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574336761-16717-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1574336761-16717-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(39860400002)(136003)(428003)(199004)(189003)(16586007)(54906003)(316002)(8676002)(8936002)(50226002)(81156014)(81166006)(47776003)(356004)(6666004)(2906002)(1671002)(53416004)(109986005)(4326008)(50466002)(48376002)(336012)(36756003)(2616005)(5660300002)(26005)(86362001)(186003)(11346002)(446003)(426003)(76176011)(51416003)(70206006)(305945005)(70586007)(478600001)(7696005)(266003)(32563001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1678; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd36416e-1fde-41d4-b48f-08d76e78a629
X-MS-TrafficTypeDiagnostic: MWHPR12MB1678:
X-Microsoft-Antispam-PRVS: <MWHPR12MB16784CC30546387EF9449871E74E0@MWHPR12MB1678.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-Forefront-PRVS: 0228DDDDD7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f+dM2b4hIMIAaf3wEmTCjvSjHz+b7QPMbbUcxcawAD68k49hamQfYjTg+sAhzFYv8/f60Rfl3wgN4xn3uQAGefJEO8kdeeg5QRr/xXYdxRYwBk1DZrHizGYH/ply19yUmiu/FfU4i9SA5N2eSw1UznWFSwFb2NJBbLUo5O/lbzGsr3rRhhNDmi0QtVSWLrfqecT0c3uANHTUTxhqxH4Bodj7sNdGz+a05MxsMh8zCo2ttLWkS9QrIqbMeASw2sQVK1pz8vfcujfcnEoGoOsIDmHqji4DrvXAmjYtf4mnJ6Qw/Y+WfeQikAgHnm06HDi0/wZuMA6lw3LRMfNh3GfC9sPoLGxW2cqwoKTIw1thUSNYGi2cyc/ETeyzkiFnjylZWZcyAFsAi7ald1asKHhxlctjy9YAjRrz/p3eP6witHP47r85pIBD09kyYQh6316X
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2019 11:47:55.7445 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd36416e-1fde-41d4-b48f-08d76e78a629
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1678
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, pierre-louis.bossart@linux.intel.com,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com, Alexander.Deucher@amd.com,
 Akshu.Agrawal@amd.com, Dan Carpenter <dan.carpenter@oracle.com>
Subject: [alsa-devel] [RESEND PATCH v11 4/6] ASoC: amd: add ACP3x TDM mode
	support
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

ACP3x I2S (CPU DAI) can act in normal I2S and TDM modes. Added support
for TDM mode. Desired mode can be selected from ASoC machine driver.

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
---
 sound/soc/amd/raven/acp3x-i2s.c | 24 ++++++++++++++++++++----
 sound/soc/amd/raven/acp3x.h     |  1 +
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x-i2s.c b/sound/soc/amd/raven/acp3x-i2s.c
index 246eac4..9a6f0269 100644
--- a/sound/soc/amd/raven/acp3x-i2s.c
+++ b/sound/soc/amd/raven/acp3x-i2s.c
@@ -70,11 +70,27 @@ static int acp3x_i2s_set_tdm_slot(struct snd_soc_dai *cpu_dai,
 
 	frm_len = FRM_LEN | (slots << 15) | (slot_len << 18);
 	if (adata->substream_type == SNDRV_PCM_STREAM_PLAYBACK) {
-		reg_val = mmACP_BTTDM_ITER;
-		frmt_val = mmACP_BTTDM_TXFRMT;
+		switch (adata->i2s_instance) {
+		case I2S_BT_INSTANCE:
+			reg_val = mmACP_BTTDM_ITER;
+			frmt_reg = mmACP_BTTDM_TXFRMT;
+			break;
+		case I2S_SP_INSTANCE:
+		default:
+			reg_val = mmACP_I2STDM_ITER;
+			frmt_reg = mmACP_I2STDM_TXFRMT;
+		}
 	} else {
-		reg_val = mmACP_BTTDM_IRER;
-		frmt_val = mmACP_BTTDM_RXFRMT;
+		switch (adata->i2s_instance) {
+		case I2S_BT_INSTANCE:
+			reg_val = mmACP_BTTDM_IRER;
+			frmt_reg = mmACP_BTTDM_RXFRMT;
+			break;
+		case I2S_SP_INSTANCE:
+		default:
+			reg_val = mmACP_I2STDM_IRER;
+			frmt_reg = mmACP_I2STDM_RXFRMT;
+		}
 	}
 	val = rv_readl(adata->acp3x_base + reg_val);
 	rv_writel(val | 0x2, adata->acp3x_base + reg_val);
diff --git a/sound/soc/amd/raven/acp3x.h b/sound/soc/amd/raven/acp3x.h
index a82d2c5..bf0a683 100644
--- a/sound/soc/amd/raven/acp3x.h
+++ b/sound/soc/amd/raven/acp3x.h
@@ -75,6 +75,7 @@ struct acp3x_platform_info {
 struct i2s_dev_data {
 	bool tdm_mode;
 	unsigned int i2s_irq;
+	u16 i2s_instance;
 	u32 tdm_fmt;
 	u32 substream_type;
 	void __iomem *acp3x_base;
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
