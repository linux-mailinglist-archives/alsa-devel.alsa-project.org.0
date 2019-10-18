Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E47A6DC28A
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 12:17:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81EF51672;
	Fri, 18 Oct 2019 12:16:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81EF51672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571393857;
	bh=BruBzsG4s/5Z+DiDZx5cqVxiuwgS0lBuxpEYEu2+cU0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sgtlJqAPbq6RIj/7VOjDMbzTk9xHZZE6UbBbeWhgp0wOogiJ2ySjzq1dDgFCIzefh
	 jyYJbCCz6RmHzuzvCJyflbjB0hDYOmXqZ7OJHiT2ogv0Ylpk9aFvnOuPHm8BLeCRgv
	 OCr/ObtSu9bkpnBG94wHzN1V4IUcDxAkHHvBKtvM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2115F80637;
	Fri, 18 Oct 2019 12:14:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0733EF80637; Fri, 18 Oct 2019 12:14:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIM_SIGNED,DKIM_VALID,FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam05on061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe51::61d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31FC0F80637
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 12:13:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31FC0F80637
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="r5Clx4kS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MO+N0Hxa7N4vbwq/CBLa6SBV9o1HPQ6Znz0x/5yM441/SsNCtKEYM76tKMBK3Hvg4j9x5aKZgIjOnPwaI3aixzkOzCyBGjpVUMmo89MJrGdINmzwrzA0gaB4qMWCva1cMOYG5I/TayhGpBsVu9PRSNhiKTET0nqX+psadhGDBAbhv9gDN6grH/xPH/qtmjUw4Qn4Q9kSG+nyfltcTFdKEqkLqn7+Z1J+TFX/TfkxIvmkbAfSP/wFT+VG7jjajIm8kgOHpRlYslrmksKzKjd1Ay9AUVjX9yyutXfLxBMAmVbjP3O9qMagc1IxyYLXaJn66KjnItPqiXE4VwiMmmt9JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYpJ9uj1CTfX4AuyoIWMcp1pYYgakrdxNKLujD4LVAU=;
 b=WYcTodfpC+5GkXeocm5SUHLW7edXQFSZu7Qf7mmglQyZz6vCa9lFXbkt8O5EJYi1x6FDG4ZlvCO6clIKcnBl7T0LVs3Yk97NPD/vlhPpz9EHAct9Bvl2k4N9fJ8OSOfvdfrmKajdFqgE3FjYrEbZjFTlv3uMvPU1GDaS1dC1ve9gD6msf+exb1Wl8VRDQM2T/b77GINrdSSdXrgc6qhL+6QELWir/4EjSSgaFkNiW9EzXkT8H03mWp5+0mJ9vjqJQ2cE7GqA1kkGRrBz7tqlpfGz5Zx6zeAB+8SUHb4LRMItBcDAZ6ha2AYUoovFYVUe4BDe4dlicHzKok5Oo9y5Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYpJ9uj1CTfX4AuyoIWMcp1pYYgakrdxNKLujD4LVAU=;
 b=r5Clx4kSqzOwnsH3lHS2M9BBRNJDR5G1KI3nCFr6nXut76XnMKAEu7tXYY7kwy7fKooDhuunDz96i2U+qsBCKmqzPiEX8bV2NGp559koao+Lg2FTnDm0T8Nybt5xCGfJpcgeyB2YkWZ9fSq8Swnpdl6SxcolHY4pje3VB1V3vHo=
Received: from DM3PR12CA0130.namprd12.prod.outlook.com (2603:10b6:0:51::26) by
 DM6PR12MB2778.namprd12.prod.outlook.com (2603:10b6:5:50::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.19; Fri, 18 Oct 2019 10:13:55 +0000
Received: from CO1NAM03FT030.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by DM3PR12CA0130.outlook.office365.com
 (2603:10b6:0:51::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.18 via Frontend
 Transport; Fri, 18 Oct 2019 10:13:55 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM03FT030.mail.protection.outlook.com (10.152.80.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2367.14 via Frontend Transport; Fri, 18 Oct 2019 10:13:55 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 18 Oct
 2019 05:13:52 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 18 Oct
 2019 05:13:51 -0500
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Fri, 18 Oct 2019 05:13:43 -0500
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Sat, 19 Oct 2019 02:35:42 +0530
Message-ID: <1571432760-3008-4-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571432760-3008-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1571432760-3008-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(136003)(396003)(428003)(189003)(199004)(50466002)(36756003)(47776003)(356004)(26005)(86362001)(336012)(305945005)(186003)(70586007)(70206006)(54906003)(1671002)(48376002)(5660300002)(316002)(478600001)(16586007)(76176011)(2906002)(126002)(11346002)(446003)(486006)(476003)(426003)(2616005)(8936002)(51416003)(7696005)(81156014)(53416004)(109986005)(8676002)(4326008)(50226002)(81166006)(266003)(32563001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2778; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4d68600-cb9f-4fb0-d13c-08d753b3e213
X-MS-TrafficTypeDiagnostic: DM6PR12MB2778:
X-Microsoft-Antispam-PRVS: <DM6PR12MB27784699FC1982858493BDD8E76C0@DM6PR12MB2778.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-Forefront-PRVS: 01949FE337
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wVD+2I2lz73YF+uDUozI2BIWwOSU9xHG9V7WO8P1VT0sHUA5sBA7LHymObehBT0r+K5nxu1Oax3ynHecU435yEs53EmDlNqT+IAhPSvYRZdDz5PoCLZe4O3xTbn3HWMZxTS+TKrtrfwwSf1x8wZ+yMKVNgfPH2q4ZFfQ6GyrtfAmvvSAfJ0oZaxmA+8PzjC45wlKVIhaltebOBjgiXL935WtLAxPrbeIK2zboGKt4MXCd6QHJAOyOOgsox59ZYv3CwVwA1HMjGp83BKsCbsYOFs0aK7D0ZSOTDv9uuJxM8/iIMUP/PQpE2oV76PClhptLYlUy4QM/ve+9MwDfy8YE0PQgMvYyxQjtKwXmzOcOPoy4kQAv6XL6gCdvFWDkr1jJ6k8nJWU03gUcPAnviSqtWKEnA2w5MHUhns830LRjw8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2019 10:13:55.1783 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4d68600-cb9f-4fb0-d13c-08d753b3e213
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2778
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC
 AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>, Maruthi
 Srinivas Bayyavarapu <Maruthi.Bayyavarapu@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi
 Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [alsa-devel] [PATCH 4/7] ASoC: amd: add ACP3x TDM mode support
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
 sound/soc/amd/raven/acp3x-i2s.c | 51 +++++++++++++++++++++++++++++++++--------
 sound/soc/amd/raven/acp3x.h     |  2 ++
 2 files changed, 43 insertions(+), 10 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x-i2s.c b/sound/soc/amd/raven/acp3x-i2s.c
index b7f610f..7e22d22 100644
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
 
@@ -64,16 +65,46 @@ static int acp3x_i2s_set_tdm_slot(struct snd_soc_dai *cpu_dai, u32 tx_mask,
 		return -EINVAL;
 	}
 
-	val = rv_readl(adata->acp3x_base + mmACP_BTTDM_ITER);
-	rv_writel((val | 0x2), adata->acp3x_base + mmACP_BTTDM_ITER);
-	val = rv_readl(adata->acp3x_base + mmACP_BTTDM_IRER);
-	rv_writel((val | 0x2), adata->acp3x_base + mmACP_BTTDM_IRER);
+	/* Enable I2S / BT channels TDM and respective
+	 * I2S/BT`s TX/RX Formats frame lengths.
+	 */
+	flen = (FRM_LEN | (slots << 15) | (slot_len << 18));
 
-	val = (FRM_LEN | (slots << 15) | (slot_len << 18));
-	rv_writel(val, adata->acp3x_base + mmACP_BTTDM_TXFRMT);
-	rv_writel(val, adata->acp3x_base + mmACP_BTTDM_RXFRMT);
-
-	adata->tdm_fmt = val;
+	if (adata->substream_type == SNDRV_PCM_STREAM_PLAYBACK) {
+		switch (adata->i2s_instance) {
+		case I2S_BT_INSTANCE:
+			val = rv_readl(adata->acp3x_base + mmACP_BTTDM_ITER);
+			rv_writel((val | 0x2),
+				adata->acp3x_base + mmACP_BTTDM_ITER);
+			rv_writel(flen,
+				adata->acp3x_base + mmACP_BTTDM_TXFRMT);
+		break;
+		case I2S_SP_INSTANCE:
+			val = rv_readl(adata->acp3x_base + mmACP_I2STDM_ITER);
+			rv_writel((val | 0x2),
+				adata->acp3x_base + mmACP_I2STDM_ITER);
+			rv_writel(flen,
+				adata->acp3x_base + mmACP_I2STDM_TXFRMT);
+		}
+	} else {
+		switch (adata->i2s_instance) {
+		case I2S_BT_INSTANCE:
+			val = rv_readl(adata->acp3x_base + mmACP_BTTDM_IRER);
+			rv_writel((val | 0x2),
+				adata->acp3x_base + mmACP_BTTDM_IRER);
+			rv_writel(flen,
+				adata->acp3x_base + mmACP_BTTDM_RXFRMT);
+		break;
+		case I2S_SP_INSTANCE:
+		default:
+			val = rv_readl(adata->acp3x_base + mmACP_I2STDM_IRER);
+			rv_writel((val | 0x2),
+				adata->acp3x_base + mmACP_I2STDM_IRER);
+			rv_writel(flen,
+				adata->acp3x_base + mmACP_I2STDM_RXFRMT);
+		}
+	}
+	adata->tdm_fmt = flen;
 	return 0;
 }
 
diff --git a/sound/soc/amd/raven/acp3x.h b/sound/soc/amd/raven/acp3x.h
index b1990c9..dba7065 100644
--- a/sound/soc/amd/raven/acp3x.h
+++ b/sound/soc/amd/raven/acp3x.h
@@ -76,6 +76,8 @@ struct i2s_dev_data {
 	bool tdm_mode;
 	unsigned int i2s_irq;
 	u32 tdm_fmt;
+	u16 i2s_instance;
+	u32 substream_type;
 	void __iomem *acp3x_base;
 	struct snd_pcm_substream *play_stream;
 	struct snd_pcm_substream *capture_stream;
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
