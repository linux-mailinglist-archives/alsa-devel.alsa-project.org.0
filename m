Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63342100714
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Nov 2019 15:10:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEDA7167C;
	Mon, 18 Nov 2019 15:09:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEDA7167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574086219;
	bh=hc1AJWNabcDDX3XA0RW7exUM2uMOjbYDvr9e/FAAw7w=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fb7JjZNxyzitcZGKezM8tIpJoUGRW4AwKnqzA6VN2YI0oA7QHs6DiSHQCe06gq/XS
	 uyS1OOOkZHrwzGdIqvD+tZvcMxHiC+MNtq2NmDZUJv7wAYj9b1O8V8FHa2Ohh2mddN
	 zH3Uz4jrQXxf5pKr4yq4DT7Tg6H900DHeWuoFfTk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D88FF801DA;
	Mon, 18 Nov 2019 15:06:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F72BF801ED; Mon, 18 Nov 2019 15:06:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740045.outbound.protection.outlook.com [40.107.74.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1885BF80160
 for <alsa-devel@alsa-project.org>; Mon, 18 Nov 2019 15:06:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1885BF80160
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="L7316mwJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z+vVg6+9Q9bksGleknDdxp7jUs2GDPUGFmlBsQYsCfK6OfkwpRRIckVnmHnb2PxW14Nh5l1oZDNGYI/NGgUO2rYbcP5nPvaDNKXteop5R2CUnQk0lOYaNQwWEa6n06AWYK9bZ4ucJt3U9EY7xLkGGGUuUed+ZC0G6aLBGqS/kpOj+chcUoCOBEWB4jWr1eIRl1dwrHfS2Zl+Y2mZuCeQcvA0x8viv6jEEwSflzgoW34mQ5ziUHmpYPHvF8DCylV7BCQvon6SIh0cDe1MswJ7bsPIrQ43bEqTGNInX7tljQZi67UZfPyg1RfQQdxl6lylpwdUJXAbhZVSHUFaNUGUsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=llbNa+vbJTWN30dE0PRsoDuekUUX4yTHl6TF7Vn+9VI=;
 b=m4f9w166Bgsmy1PGgx8nyfGFhaNO1lbIFsIwd023M6n5N/j6NGz9S7MeRsNl85RATt8QR53IL993tDRHIYcGtxh2T50FQDoVcrueH5GrUa2rrnv+yX4s1Kr97e3aaeyymL/FRoBaCyu/exYYKhrPVO4dzF658Uuf2XZ941+/0d30Ow3Lw54MTZLgkLb7l9SQSmA/+HbCK8xOIvD3xQa66LrpGbRRO+SXcR0UhSOV2dsUwNrkG8V98IHzSVeWdvjaqgolGPgAvmFnJoO3LNY4CGbFls200Lda50Wt5ZXT3ND9d4mT5RWpPwuorUrOSFzI24nhL1NgmhT3wq9HttZ1Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=llbNa+vbJTWN30dE0PRsoDuekUUX4yTHl6TF7Vn+9VI=;
 b=L7316mwJXxTZ5TkLsXbAWB3uo1k3mb15R45XIBRMro+C1Z5VJeGl554rXbDZCd1wdNPEQl2vuzOthzQ0AKQerDQSBBNJU7vKdhnyQx56HmRSbM8Z4OoJ0uSPRifbLacWCfjdMmmY9WxSnMFjfvXprC/uZ62X+JMZhfs3qxGVKXA=
Received: from DM3PR12CA0114.namprd12.prod.outlook.com (2603:10b6:0:55::34) by
 CY4PR1201MB0152.namprd12.prod.outlook.com (2603:10b6:910:1b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.29; Mon, 18 Nov
 2019 14:06:19 +0000
Received: from CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::207) by DM3PR12CA0114.outlook.office365.com
 (2603:10b6:0:55::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23 via Frontend
 Transport; Mon, 18 Nov 2019 14:06:18 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM11FT022.mail.protection.outlook.com (10.13.175.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2451.23 via Frontend Transport; Mon, 18 Nov 2019 14:06:18 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 18 Nov
 2019 08:06:15 -0600
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Mon, 18 Nov 2019 08:06:12 -0600
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Mon, 18 Nov 2019 19:34:20 +0530
Message-ID: <1574085861-22818-6-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574085861-22818-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1574085861-22818-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(376002)(346002)(428003)(189003)(199004)(16586007)(305945005)(8676002)(51416003)(48376002)(26005)(5660300002)(478600001)(36756003)(54906003)(2906002)(316002)(70206006)(70586007)(86362001)(356004)(426003)(6666004)(2616005)(336012)(446003)(109986005)(76176011)(7696005)(47776003)(1671002)(476003)(486006)(186003)(50466002)(81166006)(8936002)(81156014)(53416004)(11346002)(126002)(50226002)(4326008)(266003)(32563001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0152; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0272b699-c282-41b8-0378-08d76c307bd7
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0152:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB01528A8958364A97E34D49F9E74D0@CY4PR1201MB0152.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-Forefront-PRVS: 0225B0D5BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6rEPnNRwvWTW6v/rchKcdQfBWZTgN2Si74213E9s9bge8Xoewa1cWyf7BwkGUcpa1XAZt9HP74IaWLGH5UqqLWHtvvN3Fz4w5JGwMmB/y8xPfAauFaIS65SOXKW/37FeCDsPSPHSLbL9g//9imqW0YxUg6auZCSPn/OETE+TPIQo7YqiRF04Z/iV77tr2WByA0I1dYTzcJKRExg+UtompmeDpOYwB4Z2Jf4XPHDIOAgfZYc3JhAgCVnID0SOeRcqzaw6Lt3queg4czcfDpYk6mT9hxNzsWwLsiOeyLePySGfVKcb3RZTfSItEM79NJwW3ujUT3L2Dh0pjviyW/zhIfHvKAeG35pmEDJ3OpcUlTPz9ePYpr4AgS9nvlAiMi03uBY5EeZaKouORWtSB5cpjUeRyakctOR1wH7KUhz1CI58zKuD8gztR/TGb/Hniso6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2019 14:06:18.6553 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0272b699-c282-41b8-0378-08d76c307bd7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0152
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi
 Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Akshu.Agrawal@amd.com,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com
Subject: [alsa-devel] [PATCH v7 5/6] ASoC: amd: Handle ACP3x I2S-SP
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
index 1b8b10a..3de2e25 100644
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
