Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D60FADC28E
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 12:18:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70ECE168E;
	Fri, 18 Oct 2019 12:17:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70ECE168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571393880;
	bh=JW5gMhRL+58yw7lnom4l9nksbBPa+JPb2l120ubFr28=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QUrhTUCV10vj5cCdbQ2HTNKATZVdCQzVslwP4YTR5/lOEEErquA5s2JTQBOqPs4y9
	 Qt/FIUdYvWn32yyld7s+agyykiel9go5h1bAxhpi5CqKgZFs+7WxU6iZr330sfBMHY
	 ru9C8JaSTDtTSUh4DxPfdnE7heLGCjfJRYJze7r0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F62AF8064C;
	Fri, 18 Oct 2019 12:14:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C7A6F80637; Fri, 18 Oct 2019 12:14:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIM_SIGNED,DKIM_VALID,FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-bn3nam01on0629.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe41::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B504BF80637
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 12:14:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B504BF80637
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="KpAHtxkV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CK/vK5Kx8mrMyfIlDU5ErA3/3iUcSk/4pXRgqn71WTK9Zlavxx4kkANLE2aVyo5eJia4BR1e739poZsiGmn7I2iL2q2mIcf4TOktUIVNj7pzV5eBugVSC/PdT8klgFTd3AkrnrKXKwjO9PR3uQE2yeJy+KHBbPhN2S519M7LlWLyUbFaqM30a1LzH8k2sLt8JrUTc2I2eRlGbs2jg4qk2PauAvuRtv54fj9wZ6gGgOxuRhgid3JTqqg7aRsFKKi64A8lEhDvGm/I5exX0v9IK0xcZMkJvnTqxHxxUsxaMb6Zd/PHv84pjcq7NBmB9RZTRXkJcIWJdNlu6mN0LrEwOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZCKYJoN2HCXCPnEpWoGpXvMuEAVQOEWMN/ynR0iqfrk=;
 b=PYgBzq07vEUK2EBxEpvOqXhgHaPDIYrEuTpBzJySfQasQX76inFS/7ZR8t0p5u2ABLuAxK23sLgJ6KaUmR3gvP7C1u5IJutuZ/bnRZtuuOkPF8edpvSBev8lZgeT60zXOh0NnmoBBE4/Aaq1kmw0oNO6pRuswVK/JbaX+MxUJSaRp7IURSsW8QKBY79+DcZaIQNvQv5W7l3PblZ2AIHJvAEq5OifQzkRLD3hNN6/r1Ef1waeDv56kdU0+5jET1WgdnlgkKMlHAJDzNx3ayII0OyENWbUpc4qyky+A5lS1z3ARIWvcC5DchPZ4HdPuzyE2Rf5zeyef9ggBay9TIgtKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZCKYJoN2HCXCPnEpWoGpXvMuEAVQOEWMN/ynR0iqfrk=;
 b=KpAHtxkVRPgSyTf48KCpajwQsBzzbmswEntC4ga1rETp966LDkR/U0pgTQmggHfS2cUOQ62f0FlOPDUfjOY0zRuEiDIMLa63FD5U0S6qQp0V2NZYCA6MdO2E+2xD1M3vY1ogT58XWbPhNdsWiyuAsHwOtYPZljD4pamq+V941yc=
Received: from BN4PR12CA0003.namprd12.prod.outlook.com (2603:10b6:403:2::13)
 by DM6PR12MB4267.namprd12.prod.outlook.com (2603:10b6:5:21e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.23; Fri, 18 Oct
 2019 10:14:00 +0000
Received: from CO1NAM03FT025.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by BN4PR12CA0003.outlook.office365.com
 (2603:10b6:403:2::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.20 via Frontend
 Transport; Fri, 18 Oct 2019 10:13:59 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM03FT025.mail.protection.outlook.com (10.152.80.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2367.14 via Frontend Transport; Fri, 18 Oct 2019 10:13:59 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 18 Oct
 2019 05:13:58 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 18 Oct
 2019 05:13:58 -0500
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Fri, 18 Oct 2019 05:13:54 -0500
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Sat, 19 Oct 2019 02:35:43 +0530
Message-ID: <1571432760-3008-5-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571432760-3008-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1571432760-3008-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(136003)(39860400002)(428003)(199004)(189003)(54906003)(316002)(2906002)(53416004)(86362001)(76176011)(36756003)(16586007)(486006)(446003)(11346002)(2616005)(305945005)(47776003)(51416003)(7696005)(126002)(476003)(6666004)(426003)(8936002)(336012)(1671002)(81166006)(81156014)(109986005)(26005)(8676002)(478600001)(356004)(50226002)(5660300002)(4326008)(48376002)(50466002)(70586007)(70206006)(186003)(266003)(32563001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4267; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b97823b-5c45-47bf-ce87-08d753b3e4a5
X-MS-TrafficTypeDiagnostic: DM6PR12MB4267:|DM6PR12MB4267:
X-Microsoft-Antispam-PRVS: <DM6PR12MB42675F4E91F98CB9AFD9AA89E76C0@DM6PR12MB4267.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-Forefront-PRVS: 01949FE337
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cf1jVqVHtp5j2/XvXCpKSPJSYk5JMnh+3xxHOwJvm+J1Lzdya3KoA9+ekyloNUGEjDLGusCEhMfCOsO+L9byOjkiOQqc2wVWk5qkR56hkCCXBr6YEXI2jFrnwqETYMf8sYZcqTuJ66oE+vlKBgwjFOazyTEvQjg/YyD+T4qE+xrNHW3NXG/3WIg75SE3F3FqsuQ0aLtdPVqgJKp6JGJQGd/t/+b+TywvSAPIMlRtMAE8F4FeUf2FEBgdT9I1mlXhgwAklGgahCoK3GXV6Pt6VTStlEXFy1BJPc02pFT5NrGN+GFe38HHruvEixtyRZ7Z/3UxVeJbQaBrT/NkQ9AAlzHqCQYrCyzCg7VwlD30XGw7K2NUF1RXVtPUambEyPo+pcWcwatkQAfaMde0UxWS2Piu7a/aA5o44nUAUt6RPow=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2019 10:13:59.4906 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b97823b-5c45-47bf-ce87-08d753b3e4a5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4267
Cc: "moderated list:SOUND - SOC
 LAYER / DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>, Maruthi
 Bayyavarapu <maruthi.bayyavarapu@amd.com>, Kuninori
 Morimoto <kuninori.morimoto.gx@renesas.com>, open
 list <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alexander.Deucher@amd.com, Colin Ian King <colin.king@canonical.com>
Subject: [alsa-devel] [PATCH 5/7] ASoC: amd: handle ACP3x i2s-sp watermark
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

whenever audio data equal to I2S-SP fifo watermark level is
produced/consumed, interrupt is generated.

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
---
 sound/soc/amd/raven/acp3x-pcm-dma.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 4fcef3f..a000ac4 100644
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
