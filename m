Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A74DFDD2B
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 13:17:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E70DE167A;
	Fri, 15 Nov 2019 13:16:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E70DE167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573820220;
	bh=Ckyhlp7y3WAtn6w7hlBjOSwbrps4YHKU1ZuLFY0f6VM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N35OBYPGuTDkWkaUQDU4U6u5b6OLW8TWhCCt0ACpmeDwrG6QxO2hkJHEO706Ypck/
	 g3qrM9siOh/b5wTtPU9Iif6xVtappYFSQFDTK0eA0oC+zEIQtoAqWJJ/FEt97ROKIC
	 mv64iwZi+sRV4SfwxmcLiEja4D0GXE9aKzZgfm3o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CFF8F80130;
	Fri, 15 Nov 2019 13:14:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E220F80131; Fri, 15 Nov 2019 13:14:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730070.outbound.protection.outlook.com [40.107.73.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CB26F8012E
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 13:13:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CB26F8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="kzrbx4cp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Puj2AO1fOvauHNUBPKYcOvpN9DPB7p4RKKFvxGOrEUrT6eD9zNBVtKM+0tw3A93yvOK5hmLYDR2p3EnJZ8b9hphwQs6QKmYDdw44kYBaIhfX+SSPIX9gP4uz1n/zuuth1VfnCRM26jCocrUeZf76JIE+TNRrYM+c/pF1p4h8mbL5vgG+UV8M1Z0ThxQUza//lnSKivtOq0Nj1IPL9Ky9qdnCQF/akF7PcV6hXGBFpTTIqGaRXL/xowkagrg0jUOamRg+bOg1u9iT1XwX2OkTunwfcfRY2U8bPr5VIFJlLIWMZKUmD0vRWRUpugQFu+8l7BH3p+MfxsbmlFla3TQElA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8ksuv3DGSdx7l9BO0qQw/vvydn0TNDl5ol3pPHbDyo=;
 b=a8iMhuEfznYXibqZlNHxx2XP1GjMUCaOq2ZNOpzmCMIFNMIYTEq2aohqasLgQsIEfwU2asD6iIpN6JybBFxK/xUYuVoYtD1VOYeTE1Vk+SFvyzmbPZ4047BfBbgw5887/RX7UqsYIIeQTPl+OzEoTt+38KfRKxv9FdCvT5roTtpYwAEWHtG5YLU5bckcVeJ8EAYjNaSDvM95+eMIvweqViqcyi4v6yI5osPfX55Jg/PMiKYIaXBDNhQqVZDvoJjUfDf8BNxfCw3eRRd2oIilOAjskVXjX8nN9RXdgbTTB6xzC44gfK2aOsDuThdfxHRoSDudE1pfjDqZMYHbJ1wpZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8ksuv3DGSdx7l9BO0qQw/vvydn0TNDl5ol3pPHbDyo=;
 b=kzrbx4cpWlZWU+iGqffM8nzJ52N8tkJPrKcw68tzZBC4evZ9E3TzXLKiv/cmG1d/5jmVJiQPBMbYeBA/SkyGhb378A5XFtJvdKRcdxXWFjn2C19nRxmqFVRFcE57kA6RFudu8Uh4c1+M8HRGVPug56VNiaJYUGB/zLkFfpTEJYo=
Received: from CY4PR1201CA0023.namprd12.prod.outlook.com
 (2603:10b6:910:16::33) by MN2PR12MB3182.namprd12.prod.outlook.com
 (2603:10b6:208:107::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.23; Fri, 15 Nov
 2019 12:13:54 +0000
Received: from DM6NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eaa::207) by CY4PR1201CA0023.outlook.office365.com
 (2603:10b6:910:16::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2451.23 via Frontend
 Transport; Fri, 15 Nov 2019 12:13:54 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM6NAM11FT026.mail.protection.outlook.com (10.13.172.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2451.23 via Frontend Transport; Fri, 15 Nov 2019 12:13:53 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 15 Nov
 2019 06:13:53 -0600
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Fri, 15 Nov 2019 06:13:49 -0600
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Fri, 15 Nov 2019 17:40:22 +0530
Message-ID: <1573819823-23731-6-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573819823-23731-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1573819823-23731-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(346002)(396003)(136003)(428003)(199004)(189003)(11346002)(336012)(5660300002)(305945005)(446003)(316002)(7696005)(51416003)(26005)(50466002)(48376002)(486006)(356004)(109986005)(16586007)(50226002)(186003)(6666004)(86362001)(2906002)(2616005)(4326008)(126002)(81156014)(81166006)(1671002)(478600001)(8936002)(70206006)(53416004)(426003)(76176011)(8676002)(70586007)(476003)(54906003)(47776003)(36756003)(266003)(32563001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3182; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4637680b-c233-4857-108e-08d769c5485a
X-MS-TrafficTypeDiagnostic: MN2PR12MB3182:|MN2PR12MB3182:
X-Microsoft-Antispam-PRVS: <MN2PR12MB31827B1E30D3B1E8D323E188E7700@MN2PR12MB3182.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-Forefront-PRVS: 02229A4115
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PzPOBfaZzjt7SZsyuzaCjSTLtV992+PwUhOXVgSGxFu1rggWiZZYiyqXOtTu9nf1Qrrb5LuNcYlbk6+ymyCeOxHqO2SwQdfKt7choEN2SxpvrgGg2KWQ/TpncM6lRtfh9m7VhbC3HvuTmdJQkx0kbd9VKlLjlMzTMlGobkhVr6PByD8XlnHQotJmqWUTos8XvUJCP9bj4Vnmn/y+8cww8Oca06GxWZHCQXHzDvP/vRy/99CbMRx7Vpe+Lonjrc2fBZSvkEl5Loayh4yPbPTu7cNKzda2pUpJqHGETev4VNTbqDTWIv5wBvXdhav3BUJrNRcacGsZOuD6iKAtNLHkS7kSIqYnOXHIHobBDeLEegueCLT6uRxFbs06wlpzJYBrSQwTAEddVC5g/nbRzRBUPlhtK4DQn2sdbWYFTJQpFpgP23HpHvzkenFwjUCrJnZL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2019 12:13:53.8709 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4637680b-c233-4857-108e-08d769c5485a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3182
Cc: "moderated list:SOUND - SOC LAYER /
 DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi
 Iwai <tiwai@suse.com>, YueHaibing <yuehaibing@huawei.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Akshu.Agrawal@amd.com,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 Colin Ian King <colin.king@canonical.com>
Subject: [alsa-devel] [PATCH v6 5/6] ASoC: amd: Handle ACP3x I2S-SP
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
index e2051d1..51ff1c0 100644
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
