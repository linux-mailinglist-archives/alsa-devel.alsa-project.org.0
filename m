Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7FCC22CF
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2019 16:10:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CFC61657;
	Mon, 30 Sep 2019 16:09:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CFC61657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569852619;
	bh=qFxx5snwaEvQyvg85fVGFrwS2bxu69VCEnFzEQPvMJw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bOaMqCcFJBqzGc2088AKtvLRcBS5c89oHw5gNIffyoMt80wkn+xj9FPAIYtTiZxLu
	 JgreZF7YIoVJJvT+R42idxYyxLhL3yp7Qpdo/RO9z16N7P8xu56ikiWNpTxVPyJBg+
	 j/x7R3gUNxmdMvNhR5KSsgrh+9h5JDOtB6gIG5MI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDF28F80638;
	Mon, 30 Sep 2019 16:06:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C76CEF80636; Mon, 30 Sep 2019 16:06:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIM_SIGNED,DKIM_VALID,FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680084.outbound.protection.outlook.com [40.107.68.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0AFCF8060F
 for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2019 16:06:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0AFCF8060F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="VcqA0erf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GWCrzq5v3hOTd5DPcAJVEFC7XkE5Pia33Isk3h0ERmblu0y2uzXKbwpD74ezEutn3jCShwpiMDBpwhbylw8bOMN0QAJmSCK5Pqs/uk8nEo36Co6r5g27fUj+7ZV6oJqArNHRINME5tApKo1fQsT9OoWfd3xPdpgR3beo9+f3v9y4p+eAe7I+CG4rxF24cx/BxR7J7opLmv/brjP9sSEQvqS8e5NjZ4tYX9QUslD1LshOq5nT0prq25PUNyuQU+4DzE/CeBEWK9rYkOPZ/0cS8h6YXo9kokl4rp/4Qiw/oQ+xbMLSQLo2w/foigDJB4qRiqeb4KsFmIKNphcxE6Q0iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HwaZNHJWTn6R628ftR9IqNktaa/JznS0bTzhRXsP08=;
 b=Fdk87rQfiIlthJV99X2jvHkdu7EgvA3ZyEMnb+S1/eOysi1FMV9jGqFR5j/MhDGOsi2NmTBrns2lxySGXefA8cnm/zuNMjFwO/2iHzRAJuFeB3uTQqz1g1T1d2Ozwjt1hRcjq5mJ+RISbDfNAb+5am5QIAiNEtWR5gFSv32T7q9TQGWP+bb/H3G/TCtSPXQnrpb23SR09NopHS34IEyIiuZcvRbHqteLMAzi+XAKL1muSg8mYSVIU1w9Pt4IyDzneUWbVUYDTt+536k7h89Fo2ibVAtfm5BW47w8Uy9hcyvKUhUDw+qveNwqws1WBU+Gzh1FQte/WU8tbVgmrZRZQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HwaZNHJWTn6R628ftR9IqNktaa/JznS0bTzhRXsP08=;
 b=VcqA0erfY/E35fGjI8XrWRf78oCs8E4JoktVlLAKnfQLQispOHT4zWZT/DCdqFD7RDvwjdv1nXthHF/ty0kbill8FQrtJCCr0KDr7SOJyANPPnpr6qkI2VfXVBPeTXGnWbWPk851e1/6etr/ziQIwiLQxkLciiVedU2tRqysi0Y=
Received: from MWHPR1201CA0021.namprd12.prod.outlook.com
 (2603:10b6:301:4a::31) by MWHPR1201MB2477.namprd12.prod.outlook.com
 (2603:10b6:300:e6::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20; Mon, 30 Sep
 2019 14:06:33 +0000
Received: from CO1NAM03FT057.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by MWHPR1201CA0021.outlook.office365.com
 (2603:10b6:301:4a::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.16 via Frontend
 Transport; Mon, 30 Sep 2019 14:06:33 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT057.mail.protection.outlook.com (10.152.81.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Mon, 30 Sep 2019 14:06:33 +0000
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXCHOV01.amd.com (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; 
 Mon, 30 Sep 2019 09:06:31 -0500
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Tue, 1 Oct 2019 06:28:13 +0530
Message-ID: <1569891524-18875-5-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569891524-18875-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1569891524-18875-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(39860400002)(346002)(428003)(199004)(189003)(305945005)(53416004)(26005)(81166006)(50466002)(426003)(336012)(8676002)(50226002)(48376002)(2906002)(1671002)(81156014)(4326008)(186003)(76176011)(5660300002)(47776003)(356004)(316002)(126002)(51416003)(6666004)(16586007)(109986005)(478600001)(2616005)(446003)(11346002)(8936002)(70586007)(70206006)(486006)(54906003)(86362001)(7696005)(36756003)(476003)(266003)(32563001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR1201MB2477; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9bb06db-bd7d-478b-5a83-08d745af6640
X-MS-TrafficTypeDiagnostic: MWHPR1201MB2477:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB247710A8EE155F774C0AA8CEE7820@MWHPR1201MB2477.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-Forefront-PRVS: 01762B0D64
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 35Evd6gJvV6SACGY6pY/6OVTlb8vG3jMUMzQGF/cR6wDsmEdqHS3paejT4u7wFlN3C2myV0w3EcHGlP8EP4q9bQb/PGLsw7yR1AiYiK+mKyL1jZTdRBo2AuUW5eVEPFFRg6VWhAOvsaKPWpV9yHM7MOfLqAQ9cdFCVDFudlIcZ3K7y5VVuokc/PnEtEcnD/w7YHltS5vAHHBxZXThbvpH1J6JPbXBYjgVn9ucl6/jX210lICwt7jKbiZzft0mN/BK9sVmWBmRabHLNfkj7JJR1ZZ8kCg6x7UyQpMXc+bXMpCAQZd9qCugN6z486G5oX8Ij9va/bG7MJcyYiZuf1nPY5akbmDIdVb4K08VvQq8SpWt7r3TvxyFbbp+kMQoE3I2hI1XlfXhVk4zzUhOZdNUumDKUQm5Z+R5phwXM/OLa8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2019 14:06:33.1399 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9bb06db-bd7d-478b-5a83-08d745af6640
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB2477
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>, Takashi
 Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, Alexander.Deucher@amd.com
Subject: [alsa-devel] [PATCH 5/7] ASoC: amd: add ACP3x TDM mode support
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
 sound/soc/amd/raven/acp3x-i2s.c | 36 ++++++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x-i2s.c b/sound/soc/amd/raven/acp3x-i2s.c
index 4511b9b..312207b 100644
--- a/sound/soc/amd/raven/acp3x-i2s.c
+++ b/sound/soc/amd/raven/acp3x-i2s.c
@@ -43,7 +43,8 @@ static int acp3x_i2s_set_tdm_slot(struct snd_soc_dai *cpu_dai, u32 tx_mask,
 		u32 rx_mask, int slots, int slot_width)
 {
 	u32 val = 0;
-	u16 slot_len;
+	u32 mode = 0;
+	u16 slot_len, flen;
 
 	struct i2s_dev_data *adata = snd_soc_dai_get_drvdata(cpu_dai);
 
@@ -64,16 +65,31 @@ static int acp3x_i2s_set_tdm_slot(struct snd_soc_dai *cpu_dai, u32 tx_mask,
 		return -EINVAL;
 	}
 
-	val = rv_readl(adata->acp3x_base + mmACP_BTTDM_ITER);
-	rv_writel((val | 0x2), adata->acp3x_base + mmACP_BTTDM_ITER);
-	val = rv_readl(adata->acp3x_base + mmACP_BTTDM_IRER);
-	rv_writel((val | 0x2), adata->acp3x_base + mmACP_BTTDM_IRER);
-
-	val = (FRM_LEN | (slots << 15) | (slot_len << 18));
-	rv_writel(val, adata->acp3x_base + mmACP_BTTDM_TXFRMT);
-	rv_writel(val, adata->acp3x_base + mmACP_BTTDM_RXFRMT);
+	/* Enable I2S / BT channels TDM and respective
+	 * I2S/BT`s TX/RX Formats frame lengths.
+	 */
+	flen = (FRM_LEN | (slots << 15) | (slot_len << 18));
+
+	mode = rv_readl(adata->acp3x_base + mmACP_BTTDM_IER);
+	if (mode) {
+		val = rv_readl(adata->acp3x_base + mmACP_BTTDM_ITER);
+		rv_writel((val | 0x2), adata->acp3x_base + mmACP_BTTDM_ITER);
+		rv_writel(flen, adata->acp3x_base + mmACP_BTTDM_TXFRMT);
+		val = rv_readl(adata->acp3x_base + mmACP_BTTDM_IRER);
+		rv_writel((val | 0x2), adata->acp3x_base + mmACP_BTTDM_IRER);
+		rv_writel(flen, adata->acp3x_base + mmACP_BTTDM_RXFRMT);
+	}
 
-	adata->tdm_fmt = val;
+	mode = rv_readl(adata->acp3x_base + mmACP_I2STDM_IER);
+	if (mode) {
+		val = rv_readl(adata->acp3x_base + mmACP_I2STDM_ITER);
+		rv_writel((val | 0x2), adata->acp3x_base + mmACP_I2STDM_ITER);
+		rv_writel(flen, adata->acp3x_base + mmACP_I2STDM_TXFRMT);
+		val = rv_readl(adata->acp3x_base + mmACP_I2STDM_IRER);
+		rv_writel((val | 0x2), adata->acp3x_base + mmACP_I2STDM_IRER);
+		rv_writel(flen, adata->acp3x_base + mmACP_I2STDM_RXFRMT);
+	}
+	adata->tdm_fmt = flen;
 	return 0;
 }
 
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
