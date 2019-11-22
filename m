Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28029106943
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Nov 2019 10:49:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B246817F3;
	Fri, 22 Nov 2019 10:48:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B246817F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574416176;
	bh=clH6UG6xCktWicASf25y022iX4uOmqqk5N8XHJjKdko=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=txNjQatzWBOI71YcyAZdycMZUsY1/pbBpWyWmkyehV4j0AdXFN0FqmrrzPg2a0QbC
	 SXtFP3f5zmQD24EILAfbQyme/TfCVw7zk6rCTd9k/GK3j5AoWZtqan2/kugU8LCZMs
	 sWpbOSl+dW0U0XQUmH5wDMaGFybKuHM7kUYgdW7k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C1C7F801F5;
	Fri, 22 Nov 2019 10:46:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18F46F80162; Fri, 22 Nov 2019 10:46:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820085.outbound.protection.outlook.com [40.107.82.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9A48F80162
 for <alsa-devel@alsa-project.org>; Fri, 22 Nov 2019 10:46:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9A48F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="4PV7O2xI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c/zkyiPffchDQqZTdRX3qsAGiTDiVFdd8Hntb+h0G5xt6SD3scRZmnSwKrkG3HLt5rqmyEEHM6KNUFYW8ZZFxwRFloD0RptSoa3YCJ2LXeIe9frgkEhN3LlMvHum8S6+KKN//pmgr6dHzlHaqYgVnoZjsJdk0UlKmWE9YAP03Ob5LXkMS7TMDp/eLYXE/DXM5Ju26SnQaYFdfmWRlGSpj3gesgrqir4VLDvlOGVSiykxxo09OHqU+dyZE8T4XK5SKop9+4TJZfE/sef1ndaBzo2FTR3Ce0YOGpaM7uKMzl9wyv3r24FiwNd3UqUCz+9caRPdvrYOPyLKW9aGTbiCXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mn47bwPpuwfRtPF1wOQvW1Z98oETzTmK8xV3skX2Q38=;
 b=kC8LbPauP1isq50uogbW+XPpuAX3jcG0spqzP+XiLRkXpa0TJpjTPV3wFIEjaQtqz3huRGeEiWDZY7xgLYmYl4/Lr4Y8x6mzrlTlwnVzZCMANnQ3ls4HrgqEUXGjDBdfJlGtXEdkb54RU3ADiOu0ojf3T8mo+tC1enO/zdFPKRyeBIthFVlc1Z1BiIREtIAhLEZH0h0PoTwDbVGm3OtbZ29UoH9uRq5anmYEUJCGN4O+Y9b7DZdbhsxkCI8PM/+sDJzIKGCK6GquowdziZCsp+rYVL9M5VyCZS8r6RH5ubd1Ig1kuiqL1LlSqC8JsaFYMjhu++RLY2Be+WqqRdMwsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mn47bwPpuwfRtPF1wOQvW1Z98oETzTmK8xV3skX2Q38=;
 b=4PV7O2xIC1Is3kHeeciSccWchYQndaUtLLcPNdLeqnYjVmkGSFBYO/FCz36o3ua1RDV/fT/b7ERv44BAKALj6BsXOocECa/s4G6yraiCvz2Ai6pLRQhEJ8TQS0ka1/4AAmPiUUWwSG7Q/fViec7cNWKnjmo+YBN508bXtyuH48Q=
Received: from MWHPR12CA0039.namprd12.prod.outlook.com (2603:10b6:301:2::25)
 by SN1PR12MB2397.namprd12.prod.outlook.com (2603:10b6:802:26::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.21; Fri, 22 Nov
 2019 09:46:07 +0000
Received: from BN8NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::208) by MWHPR12CA0039.outlook.office365.com
 (2603:10b6:301:2::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2474.16 via Frontend
 Transport; Fri, 22 Nov 2019 09:46:07 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT006.mail.protection.outlook.com (10.13.177.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2451.23 via Frontend Transport; Fri, 22 Nov 2019 09:46:06 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 22 Nov
 2019 03:46:06 -0600
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Fri, 22 Nov 2019 03:46:03 -0600
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Fri, 22 Nov 2019 15:14:24 +0530
Message-ID: <1574415866-29715-5-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574415866-29715-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1574415866-29715-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(376002)(396003)(136003)(428003)(189003)(199004)(109986005)(1671002)(48376002)(47776003)(7696005)(76176011)(2616005)(446003)(426003)(26005)(186003)(50466002)(86362001)(11346002)(51416003)(336012)(36756003)(2906002)(4326008)(70206006)(305945005)(316002)(16586007)(70586007)(54906003)(53416004)(50226002)(356004)(6666004)(478600001)(8936002)(81166006)(8676002)(81156014)(5660300002)(266003)(32563001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR12MB2397; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae62920f-c2d8-42ec-3a9f-08d76f30cc17
X-MS-TrafficTypeDiagnostic: SN1PR12MB2397:
X-Microsoft-Antispam-PRVS: <SN1PR12MB2397E6BFA143E96BE607F687E7490@SN1PR12MB2397.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-Forefront-PRVS: 02296943FF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MmtirQw6YzxkqW5rW3rVc0c7snPJz9+NjStA66TflbcK38zZsqJ++ftdatJGW0aqFS7L+KS/WhSWgLrrj+ZW8NiUd2gWZZO8lqHzz1q1bv/FSUItrDEo53PoMi7Rz3leYE4qgVV7RntzeoVRD3mNsHwHcCY5RgTdA8gEI5MUSd0Bhvv7eQ6tXipoZaykAbEiOEVAJYFlhjYArwK4oMTZdHHJT6Q9Kpz8H9Iy1JdIHsZZSgqHIFhsk/e9WRe+EcuWVZbNGBKXq4T4/TalHmdyqa7LTX5odJDp23/YAfxOVj8z6+C2NsEgA836BLnUafw5FyhwIeM/g9yPt6lqe2RYzSrhL8fg1ASjFbInRpgUwglDGdH11oxSuDv11sx0ws6pJacDvqOJ7XLIsAj73Gi0yosxJRXkTassSjnu3aPIfLegzUrhxLtznEYvkXmxBT8M
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2019 09:46:06.8981 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae62920f-c2d8-42ec-3a9f-08d76f30cc17
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2397
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, pierre-louis.bossart@linux.intel.com,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com, Alexander.Deucher@amd.com,
 Akshu.Agrawal@amd.com, Dan Carpenter <dan.carpenter@oracle.com>
Subject: [alsa-devel] [RESEND PATCH v12 4/6] ASoC: amd: add ACP3x TDM mode
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
index 7f05782..cea7311 100644
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
index ed1acbc..3c28644 100644
--- a/sound/soc/amd/raven/acp3x.h
+++ b/sound/soc/amd/raven/acp3x.h
@@ -78,6 +78,7 @@ struct acp3x_platform_info {
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
