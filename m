Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9230F7725
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Nov 2019 15:56:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5010A1673;
	Mon, 11 Nov 2019 15:55:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5010A1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573484163;
	bh=N9EbsVEIt63sf/UEDmWE2/touJpDFLEVsLWpMmkD6e8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eJmMz0CtXYZ5OwYxN4oqAA+R+xImRD+gTb6pVeYObelq8/mSWR405G5M5q67XXlL/
	 RCTVJkX2UTR604frKS+jdMjxep1DhA3FwcSqXHqO2/gICfBnCBJRhDqx0CpQe7mEEK
	 bOxISrGUtn6LQzFBKBna2TOLXpS+l8R5XjfMpuHA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3853DF8064C;
	Mon, 11 Nov 2019 15:52:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0B47F80642; Mon, 11 Nov 2019 15:52:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690083.outbound.protection.outlook.com [40.107.69.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76D59F8015C
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 15:52:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76D59F8015C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="Mq9Zugu4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XQh3M7/NL2abihgXxKVRbD4as6DgoOvg1OpB1wYXk+HrzA7R7x7Yxqo81BJIONKYKeETNDRaCOJ1DtUyb9ImDLKfQp2rPeFrQ5hlR5qNhQzXmOS4aZlPQzI4yGQKAqVJsdO86I3Jm+jNesKkkvngJnhzKQ5sjNDV45l5AXF1qkFXDoA8N8cVT8sOuQYb4yx6E8xLogtF9gejZjnPJGauf5uCE2zWmyM1um1BNLN4OBUE3Xdr1pVnenO/EK4qGvYnQeIVRG9QByEcEFxpa0Ec417i9W1OVB5EQWWA0G31Gbcy26iyPXxIQQIVGMsElo1SV7ymQKo/pEhXcG+lHaFUdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H65aaJcfq96vI44D51yul3iAimd3z3yS1JC+9TcHqow=;
 b=nYm5RuEPYqhWScwJulJhP5uyuOVgN9/7HwZIo3qq4xMI1RwJSrFdcLzWjITLlPL1+f/SAy8l5hFP0krBaPoXPz7lSbuoMv4tyssll1q2IyAgh8pF5ykpKjJUWlL+2HDw/LZVq2jhcuhz/xqBvE4s9qWS94qFyQ0fiqaWX30SGd6Fwc1EGhLTd8YrxN62xfBolwYyY+axTwHppuDKeOfR1JQ7l6d6lmcXRqEWpcl9UTbDvz+OeE00wdqdyETyN7ESbASbEKIFj0w1zGedqHSO+fFw3Hoj6n85+4A9TqIsVio9N07u9c/tnmIr6tWNvMoA316ZumDTzfsSvMZ+6atuDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H65aaJcfq96vI44D51yul3iAimd3z3yS1JC+9TcHqow=;
 b=Mq9Zugu4wXANBqM/T0kGYbpFN7yQHFI//BvRccrKlvG91o/4Xqo8j6VomUZ0gv8sNPfvH3HBW9OubbagzGhfgNZbHSzrp8svgfiuUohzIYbnMOnHBzIEvcPbjGuo3dSFPd4Z0hT/aq/9X1fmvR5VYkW74pHwLkTXPQ2awDCaUO8=
Received: from BN6PR12CA0032.namprd12.prod.outlook.com (2603:10b6:405:70::18)
 by MWHPR12MB1870.namprd12.prod.outlook.com (2603:10b6:300:10a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.24; Mon, 11 Nov
 2019 14:52:14 +0000
Received: from CO1NAM03FT012.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::202) by BN6PR12CA0032.outlook.office365.com
 (2603:10b6:405:70::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.22 via Frontend
 Transport; Mon, 11 Nov 2019 14:52:13 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM03FT012.mail.protection.outlook.com (10.152.80.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2430.20 via Frontend Transport; Mon, 11 Nov 2019 14:52:13 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 11 Nov
 2019 08:52:12 -0600
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 11 Nov
 2019 08:52:12 -0600
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Mon, 11 Nov 2019 08:52:08 -0600
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Mon, 11 Nov 2019 20:19:53 +0530
Message-ID: <1573483794-8921-6-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573483794-8921-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1573483794-8921-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(136003)(39860400002)(428003)(189003)(199004)(478600001)(54906003)(26005)(6666004)(356004)(86362001)(50466002)(48376002)(53416004)(36756003)(186003)(316002)(2906002)(47776003)(109986005)(305945005)(126002)(70586007)(70206006)(50226002)(486006)(2616005)(476003)(81156014)(81166006)(8936002)(8676002)(336012)(4326008)(1671002)(11346002)(76176011)(426003)(7696005)(51416003)(446003)(16586007)(5660300002)(266003)(32563001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1870; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aca98503-a43f-4ab8-b5cb-08d766b6bcd4
X-MS-TrafficTypeDiagnostic: MWHPR12MB1870:|MWHPR12MB1870:
X-Microsoft-Antispam-PRVS: <MWHPR12MB18707AFF9D7F240052B784BFE7740@MWHPR12MB1870.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 0218A015FA
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VQE6pwwOzrwdhhhIIBVsV3LCYJt1U7BNAYYvU9JAekh+riR0ByynGPCChbEjCzleGWBhD1e1+F1I1PzFz+deKtd1qABcnbEsasKU8vVh/++9uO3aHSmkJNPGtjwGj9QgNcJNyoxtMBYL0Fn3NX23ZotsUa+mrUeC0XvSWJq+yBCWOHkFlk9QBD13dza/ODnBBMpkXba/Zdfy+2SPu1xdftFtwmYNzGIOlcIqoCsAq4in+r+m5kAQC+ytBtxM4iSM6pVYH1NW03sllkBjIRhu82EThCaEADF2ZRWs5+oqpylj7F1GvghfI473n4sV20Ip+CcYhrXkwoVc6ExP8pBC0Si/609NS+kLaUr18AeN7n4pVoTChy/XvAG36+D0/XHwNN5vNUASWcaBDFEIAkIJ15ZW/GZ0vkht3BH7wrGLfUekSqqA65bF6Jh6zXfOM9sX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2019 14:52:13.2741 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aca98503-a43f-4ab8-b5cb-08d766b6bcd4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1870
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
Subject: [alsa-devel] [PATCH v4 5/6] ASoC: amd: handle ACP3x i2s-sp
	interrupt.
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

Enabled support for handling i2s-sp interrupt.
previous to this,Driver support only BT instance and
interrupt on i2s-sp were not handled.

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
---
 sound/soc/amd/raven/acp3x-pcm-dma.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 6e70fa8..8a8b135 100644
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
