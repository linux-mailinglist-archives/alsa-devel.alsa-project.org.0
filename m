Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 775C7FAACC
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Nov 2019 08:20:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 172221679;
	Wed, 13 Nov 2019 08:19:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 172221679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573629600;
	bh=N9EbsVEIt63sf/UEDmWE2/touJpDFLEVsLWpMmkD6e8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tnucIIbp9aKS+M0o3BEe0JAPSC4CvIADDoJdwXqyGy/yC/PA9z8WAweq4K355T2ck
	 Ym0FYT8IMIJZoyTy9z/VuyN14069io3tMj1WYvIGnQwNu95k9w5Z8kfF2E2tLSIyXy
	 DCRKtQJoTfL4nt47FW5FJ8dJZavdQ4J6CDZI+EhA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8739AF8065D;
	Wed, 13 Nov 2019 08:16:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40187F8065B; Wed, 13 Nov 2019 08:16:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760077.outbound.protection.outlook.com [40.107.76.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6094CF8065A
 for <alsa-devel@alsa-project.org>; Wed, 13 Nov 2019 08:16:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6094CF8065A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="fAFt3biJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jg013APTaH8r7VQLBPItd7Tk+JsvOEHc5nb1+h6nprvhtDZT9YtsZxX/O6tms1UzyUm2y4/KcOZjzLV0HVWFxdg4oVGOQydSTagGGzx7IiUpLuQTnhk67nEcY38rvUXedhlcVcM/S9JM1Z4XaR5HDE5woh+tHKjqwb/pj/xHAHVlzHettMXKf3/mZOp1XceiRfqcciEZ/9HXqNyHTghzRWV/AteQ6enyuscTbB7C/t3Bk6izKmOCbz0Tuz0JKIq+h2bMhF4PeVjU8GcU8of7fGCoy5AG46Q8//uTfpCFrinsRN6GUukJkQEawjLuz07NTPvifwxwwM6O2popXv+1UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H65aaJcfq96vI44D51yul3iAimd3z3yS1JC+9TcHqow=;
 b=B2E4QiQ7xP+zJxiRgaFrKWEnPh+1d2eMqZECR5+9ZpvjwTCYQiStySkiVz3fWpziNmo7hO8IGL6fRnIl69V29kCKcWW8m5P/OsmkJU1cp7UdLrwzS8ljCboAN/L+7qP5GHOikZQT/qyEcJAhwkLBl34rNAgYJg+a3YGiCLkIHNTZznC0sfd23zojyJRIg/C01+POOxuAYZiHq4hgY5V+Hrpks4PN+e1pMpLBL4MVoc6PwWgKSoJKwBrge2Em0PMAYzmhHMsnYDi/Liw69WTAC7qoPldvbHTd2ixkJJRknjgRT2sy1+s0+yeLOLl1YkzsKIR6YpXjjXFjGkRF8iLSMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H65aaJcfq96vI44D51yul3iAimd3z3yS1JC+9TcHqow=;
 b=fAFt3biJFcmfU+JbQEOLgZq6RVL6o6nXvbVT/hUyx2hQTPyaDCsmSkSi1RVEQQCxfwnkF24r+L2QoZmGlydrOUgC5Qk0ZxRHDtmD4NDIYxELnOXC68WqqTDNub/j9f5KeIp4EXO/CzPJ00sEapftStoqFo5WticckARaG1I3nP0=
Received: from BN6PR1201CA0023.namprd12.prod.outlook.com
 (2603:10b6:405:4c::33) by CY4PR12MB1542.namprd12.prod.outlook.com
 (2603:10b6:910:8::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.22; Wed, 13 Nov
 2019 07:16:11 +0000
Received: from BN8NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::201) by BN6PR1201CA0023.outlook.office365.com
 (2603:10b6:405:4c::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2451.22 via Frontend
 Transport; Wed, 13 Nov 2019 07:16:11 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 BN8NAM11FT027.mail.protection.outlook.com (10.13.177.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2451.23 via Frontend Transport; Wed, 13 Nov 2019 07:16:11 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 13 Nov
 2019 01:16:10 -0600
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Wed, 13 Nov 2019 01:16:06 -0600
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Wed, 13 Nov 2019 12:44:08 +0530
Message-ID: <1573629249-13272-6-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573629249-13272-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1573629249-13272-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(136003)(39860400002)(428003)(189003)(199004)(305945005)(81166006)(81156014)(8676002)(16586007)(47776003)(36756003)(48376002)(8936002)(1671002)(50226002)(2906002)(50466002)(53416004)(70586007)(356004)(316002)(186003)(70206006)(478600001)(109986005)(126002)(26005)(446003)(86362001)(76176011)(5660300002)(2616005)(476003)(4326008)(486006)(54906003)(426003)(11346002)(7696005)(336012)(51416003)(266003)(32563001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1542; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1906d3b8-119a-49cf-b40f-08d768095c8d
X-MS-TrafficTypeDiagnostic: CY4PR12MB1542:|CY4PR12MB1542:
X-Microsoft-Antispam-PRVS: <CY4PR12MB154200CE3067A473F5A1EDF5E7760@CY4PR12MB1542.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 0220D4B98D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CKa0YI8raWsRpyFab6uhPPl8qH255TsSxST25kPcfBs7KaoVsjvmsv9tYpADlvz9PjpwH/Qf3D3/fAZnmENCmkeyP9c3/uymHJg62tAvj6FLMRW+u/yIhrnsR3A0XedFCvD5dMStw1+rUeOvp72rOdVYqbaqL0H47eY3SUYrLyZRh0JM6HExqrc6p9ZefGF9CPAMvaNT6iObwUMXGHiCMhR92BU7mo4Qy8SmyhwSQtFZ7JRtOgMm6pi5LPJVMhMqoW/mUfQ2YEpnutMtDXnunDkbCdmOIPhXKkoED502rP4geaK7+ohBM0nwlPdq2gS1jl/NMAbxkPPBJxirHNrkAWzMjSspV8poDKl09WsBM3j/LZozn+43DFbcRjbMi9V3NhA2dchae2WnhBtmQX0zoh6fSpdhKcZA7KGwQzP07JZKGScdcsAUHJkQE6f0U0A9
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2019 07:16:11.2589 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1906d3b8-119a-49cf-b40f-08d768095c8d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1542
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
Subject: [alsa-devel] [RESEND PATCH v5 5/6] ASoC: amd: handle ACP3x i2s-sp
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
