Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8C8C22D0
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2019 16:11:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFCF51684;
	Mon, 30 Sep 2019 16:10:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFCF51684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569852668;
	bh=f/DjAdWUXM57mabfd6K0u9o0SwhyjqqlH5OLgf/sAfg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rzpPOP6I4MfHHSULRpqIRjp8QmDz+TUSRCZ96nYmGvoAZJnBdQwM3Yk7B/ZGdifBX
	 ccrEosI8EFGDIndztuV8kZsO/icuiORwie1F92On/xF18HsUQTwSpsBxlV9O3z6h/6
	 f1KUFSUFxhXOTXYRlnhOOy1iBZy5/NH/CUKXJBaE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60BEAF800DE;
	Mon, 30 Sep 2019 16:06:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D359F80642; Mon, 30 Sep 2019 16:06:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIM_SIGNED,DKIM_VALID,FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750058.outbound.protection.outlook.com [40.107.75.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36262F800DE
 for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2019 16:06:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36262F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="SCsjOXPW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rkbhhxlnjv0HcXHgU5mGSuDr7QnDk+X7zwy/i0pbCp3HFArxge8DZixPAim0fziWt0BKb7gnlBDqulOyxJ38Tqb3tJpm42kxiqSVpRK1dAgfLng/pl+bmh3x3Ngrz7+cble/v2K41ANh1nsJqe6M1P0eYFIjaMxlKlxh3YApiMMn590C3DsGeCvLZAjkw0Q79RwoQYWpDD7Gr71+1esUs3jlChILoYtVBVHnbRuopFmqZi/X5kSqlcD8+s4BA9SrliVsrtZ2ki2aFcdO7RhaOq72JNMWGYrSpGOsQlAiVXXerOt5FJUDEDo4VeekcGdC4qfuSxeUk4CzuuRg1wu5yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z72Gb8xh+zH2VaK2bqc1+WBNdSjmEIiqOhkNjFaB6Zk=;
 b=gUAqrS/xZz26hA/T4/NrFe4zLwtCJAo3p1JTks6gN3I970Bf5e+dqaRjkiGuUl9AWjNxszys+sQI34keBQY5VsUxQGiPKPVZvZU3lPZsihklF6a5On9RZDvNj+IL/Gz82WGTPbYyBznC6cBovBjRTMGiZ+P6YESlnbdciVPCst1kLXhu0tkl1/vF48gqsd+zsRqO9Fnige1EwjIlI/d0BbpSfPTepTDgMRGvXSF+0quLuYKdZWAr/BPsn6eOvXKAHfDhC7mKPwfTE/i1VQXT42K3WHYzA8U/m9up6PA89+uvXdAOfg0/ddIuM+REWLA40oKEJ7K9G6M70WSYMa3kQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=huawei.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z72Gb8xh+zH2VaK2bqc1+WBNdSjmEIiqOhkNjFaB6Zk=;
 b=SCsjOXPW2L9nNQhouBEf430p2w2WW8NgjkK9EFG8GWKhIhCHyLnHHKvGnuR5yyjMZIx/4qahVJQe+hcZ337pYN+IXKasYbyf9zjSDcAieBPahSdQLEVpyxkVrrMplgh4uycdnAusr6YKeWy+/eDYBCYLpEb3poMH4jJafTD9ehE=
Received: from SN1PR12CA0106.namprd12.prod.outlook.com (2603:10b6:802:21::41)
 by DM6PR12MB3996.namprd12.prod.outlook.com (2603:10b6:5:1cd::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.17; Mon, 30 Sep
 2019 14:06:44 +0000
Received: from CO1NAM03FT046.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::204) by SN1PR12CA0106.outlook.office365.com
 (2603:10b6:802:21::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.18 via Frontend
 Transport; Mon, 30 Sep 2019 14:06:44 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT046.mail.protection.outlook.com (10.152.81.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Mon, 30 Sep 2019 14:06:44 +0000
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXCHOV01.amd.com (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; 
 Mon, 30 Sep 2019 09:06:38 -0500
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Tue, 1 Oct 2019 06:28:14 +0530
Message-ID: <1569891524-18875-6-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569891524-18875-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1569891524-18875-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(136003)(346002)(376002)(428003)(189003)(199004)(53416004)(336012)(426003)(4326008)(54906003)(50466002)(11346002)(446003)(70206006)(16586007)(36756003)(70586007)(2616005)(476003)(126002)(486006)(109986005)(478600001)(5660300002)(6666004)(8676002)(81156014)(81166006)(356004)(47776003)(51416003)(2906002)(305945005)(186003)(86362001)(1671002)(26005)(8936002)(50226002)(76176011)(7696005)(48376002)(316002)(266003)(32563001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3996; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58d9eeb4-755c-41ab-0cbc-08d745af6cc9
X-MS-TrafficTypeDiagnostic: DM6PR12MB3996:|DM6PR12MB3996:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3996430E01A0983220E84B0DE7820@DM6PR12MB3996.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-Forefront-PRVS: 01762B0D64
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: paQ45teMZu+AGLgfwsy2fikhBQz37tbRo0LzPQV5u3gIuSVOsoZP+zySWZP7glP/BuKUkyWuO7Cs3Hb14H94MMm5/5yXtQ04O6YTB4NTuOsAz4Yvmwx3tYCUaRqTeIfocy+6tzcKztQCTguh2odAjhUVOAcd4NzI8dikeDtgM3uIW9LiDoXOSVPC+gD4mkFC1grYCZ2DLlYzvgQrwI8f365rjtbpXHUoWSX6UWc0o0Ek4OFJJgxDEoxA29xavn8QezF4rhPzrURmDtE9P1iavnxcRqePdlc2Rk37EJdp/LTPWw8WDyvAyhwzYkapjAi27PUcJJI04ocAWQF9OM8sERqg39Nb7u6m/mgyZGz+glpdjbRXpCN71kYuZ2WHwidNqH3l87BpT3aNWkRkQWD8V8TJtA3lKjsZnT+5W7P+6sk=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2019 14:06:44.1001 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58d9eeb4-755c-41ab-0cbc-08d745af6cc9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3996
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 Maruthi Bayyavarapu <maruthi.bayyavarapu@amd.com>,
 open list <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alexander.Deucher@amd.com
Subject: [alsa-devel] [PATCH 6/7] ASoC: AMD: handle ACP3x i2s-sp watermark
	interrupt
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

Whenever audio data equal to I2S-SP fifo watermark level is
produced/consumed, interrupt is generated.

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
---
 sound/soc/amd/raven/acp3x-pcm-dma.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 6fa892a..49f640f 100644
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
