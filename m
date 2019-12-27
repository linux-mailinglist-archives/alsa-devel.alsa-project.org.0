Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AD112B4A7
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Dec 2019 13:56:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 157CB1734;
	Fri, 27 Dec 2019 13:55:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 157CB1734
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577451409;
	bh=2j0d5L7bJQb+kex0WmKT0i5aFODoz/6p3lrAAUDNbd0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nKpxv2A2OLAnAQ4pXSvbOJi3A4Tn0z99Yr7lVI+Bu5AU/UoQSCh8mL54wTZl22XAz
	 6JSIpgXKhMjKsBqTFQ0h3FukKA2DtAYHp6Nz9FtvFyiURwQ05KRB6GdglFyyHcFJZM
	 6CQps/c51gKaCyfqshuKUcwgkFEm3+YfrQkm7pWI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45829F80290;
	Fri, 27 Dec 2019 13:53:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12048F8028E; Fri, 27 Dec 2019 13:53:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D8D4F8028A
 for <alsa-devel@alsa-project.org>; Fri, 27 Dec 2019 13:53:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D8D4F8028A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="jldZ5Jie"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gyqN91V/1tuRo7chKLOlaPKMDNv5nRJtLd/nigP9QK+2P3rORHZtddrYp4CSY8Zn0fzv5GJRsl0RQoCVnDnZkRZWNFr6uAWozRojSiEVkZCAJdyfwxtIVwp+a3FMWXhMBpI2z7/Utm5gbc34G+Z70s9gWOwrJEV6aZHWZOf2yGcn6r3Gio1qJ6YL7gouFklNCrJffJSndmp/PGKmosXditjKfBiLDvCAsXkT+AReZekY/aJ1jb1D9GFbsrWH+QwHLCu/j3ZHb69eVoroWisQHo0PAwYL6oc6l4l4d1ysX1TdseXRJl6kL2QVpvh1b89IXF/3IOG5uJmMfGhPubRpBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECbNNe8aGwdPyr+kto+NO+P5cLl0vqt8HRyLjuAv2I8=;
 b=kAVDxIiecW/gq+/UAO5vWfUaBcUD9V0fa+fRSKVvQ+qRipgmXXluqa3yv20EZu7tXGVu5POJv7d7RsoWQOkaAHWichWpsOfKRh/7gSpTF5GzpUtW8i6OulqiuxV3OKgKoROXmUW3R5eM05xYo654PG0QCZ9rDCjqNIQbdUAkA2dJeQxk7vO9V/QS91zDpNvvTlk28mFH1YwPDVAeYuBtXHbaCarhDKB/iM9IuD7QiY5j66O8rIr8tTLePef2hm+pG1BUDCmnsb5IdQLLmp0dF6/E4+JIJtaPjv+YfGGG51xL9TxpL6HwNZJ+LX0OCM7+qRbVs4NpO/E7TKYTr1jaZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECbNNe8aGwdPyr+kto+NO+P5cLl0vqt8HRyLjuAv2I8=;
 b=jldZ5JieD2qCuVc4rIFIZZO7/UctYrDfZ/GusWBKjvnBy9cAXm1an3vfn3lzuN/f7RqnqGCI8rnsvi+rHFF5WwKyy58Bny97V6E6qzaSbwFv+Ay3Qx9GmEu69s0mu3mfD4/sFtK5SfZMTbCLAVhDzcje/4SN+yoTj86H4jQZ5hs=
Received: from BN8PR12CA0028.namprd12.prod.outlook.com (2603:10b6:408:60::41)
 by DM6PR12MB3402.namprd12.prod.outlook.com (2603:10b6:5:3b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11; Fri, 27 Dec
 2019 12:53:16 +0000
Received: from CO1NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::202) by BN8PR12CA0028.outlook.office365.com
 (2603:10b6:408:60::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11 via Frontend
 Transport; Fri, 27 Dec 2019 12:53:16 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT028.mail.protection.outlook.com (10.13.175.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2581.11 via Frontend Transport; Fri, 27 Dec 2019 12:53:15 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 27 Dec
 2019 06:53:15 -0600
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Fri, 27 Dec 2019 06:53:11 -0600
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Fri, 27 Dec 2019 18:20:53 +0530
Message-ID: <1577451055-9182-5-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1577451055-9182-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1577451055-9182-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(39860400002)(376002)(428003)(199004)(189003)(5660300002)(81166006)(81156014)(8676002)(70586007)(70206006)(86362001)(6666004)(109986005)(356004)(7416002)(426003)(186003)(336012)(316002)(2616005)(4326008)(54906003)(2906002)(8936002)(36756003)(478600001)(26005)(7696005)(266003)(32563001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3402; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3baedc4-3790-4e68-3ec0-08d78acbbda4
X-MS-TrafficTypeDiagnostic: DM6PR12MB3402:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3402DE3E9A27D9F6B0012A37E72A0@DM6PR12MB3402.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-Forefront-PRVS: 0264FEA5C3
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2U90hVohUFqeFALDbY/747i8aTrgzgCRemiN1MgdnqbhEoYFeolU+t5MOgfB7iWv7hiRiprbt9VZPQQtcgwoiL3Zw5lOCsboDr7yCIwN5Gr7ymuO2juFK6/3PqtUbi79Cpk4b504sI6Jbz8f6Q0ZFPN/nOY2zlio7KhG/FmI31CuIWAwBlIgoqBDIPMa1bhPx85ugjx30wZjtUpsGci/Pu4u1OMbc4mXaVGB2KyfnC5wBH5gPLOp0v7khJYrqjdjlOBB3Dw1X3IDD+IOHja7HFXo9D1+l95gf97mKo3Bb06p8UKcwD2tjRfDtEnvwwT13EXSoUWstx6p98O+hzm0jthe8nF9tfkJ6DwWhmChwTw6x6OdW8/Ql+TVdAJi0zM5udSmzlwtKK/AGSLMcL6Uf4YJBeDFVqI0jbaltQ0EAuKCbfk7zOOuku/qBFl1t7fF8MWbNIp2dLpFhMNtyTVoJY3cZlgUOboHjjtWPZdJGo2q+xnlgvGVObLcLaTU/U9Q
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2019 12:53:15.9235 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3baedc4-3790-4e68-3ec0-08d78acbbda4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3402
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <alsa-devel@alsa-project.org>, Kuninori
 Morimoto <kuninori.morimoto.gx@renesas.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 pierre-louis.bossart@linux.intel.com, Liam Girdwood <lgirdwood@gmail.com>,
 Ravulapati
 Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>, broonie@kernel.org,
 djkurtz@google.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alexander.Deucher@amd.com
Subject: [alsa-devel] [PATCH 4/6] ASoC: amd: Handle ACP3x I2S-SP Interrupts.
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
index b67aea3..1bd4f76 100644
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
