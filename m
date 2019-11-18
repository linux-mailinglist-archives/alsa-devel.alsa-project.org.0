Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B81100710
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Nov 2019 15:09:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A9901695;
	Mon, 18 Nov 2019 15:08:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A9901695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574086176;
	bh=SwTOkbBzHngFIhYpTfKQ7PZ9n5OY3O8GbkJ6e+um4x8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ztnw8Q7u5zILmwZIUhQfAWwLs2A12z4JYlBrUoGWTumZ5KnIF5QI1Fn78y7E8TVht
	 fbYLH6kWPMASKS9hwy5bvk919BDeTZVkSYR959OGbIv2dHRe2P39OpvU8Ir1K0KQSP
	 ZxuZviemLDc3d57+be8PK/KCFLTbLtk7kxcoPnQI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1C05F8015B;
	Mon, 18 Nov 2019 15:06:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4C86F8015B; Mon, 18 Nov 2019 15:06:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on0617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::617])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 878D6F8014E
 for <alsa-devel@alsa-project.org>; Mon, 18 Nov 2019 15:06:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 878D6F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="1+fZ48Zm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DGn6omDn+IGWDZpsTyXAUbKm0YFMjShT5uQ8DeX6J6IymW+wGFblpcfUr7X6wE25/4AN1KIJXa+xYfAG9LYRvIMyrhrnKSNU4g27xWZ/auyldHfcL37yjy/hcI8GSU/qRcL64EVoPRvxvnXZ28HpUU9ixF9Lv3C8SriDVuWb0BK6uiKjeTuoHF6hLU2Co768VSFfXcALNpKeA9xrg9pqtIDTAfLEW+HuIDKZtR3zbX1jmUvaxWaVqk6JhmpZH5AimnxI2ccxE4t4ASDuPPn1h6iXK97OdfGaycfYvpsopeGEMA3wmZ4rqM8bLS+WsTUNOucDrYwMcD5XbYbrEZCqgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=njo88QYWXruJ5fIF9N7xp03t9JpK1JPmoVJ5VuYaYGY=;
 b=J50le0R5NHnf4Jjx8tyzuAeBI6Fd3PSDzmjJjoFgTiE5sbYshmVxsX9ENqmcJTgCvG0fHbcN8JKhmyAG2ddwn0m/UGUrtMTmUmetokgnC/dBp2tFN/l5RRuRlqAsUegtd2wg75rhnZF2rFokczJp9t4FBf1+52kofbI7tzk0C0HJYY/F46e5CY536BBosWagRNknD+BmiIKN2f969+O6O7Ghc6BMq58YwDBk0+ca5rkrvOol3WTi8VeiRXGe62357FiIZdcl2OpJcgL3kG1HkCs6gipAQLBOTQJBXrEUBb9yrzITVR2R6rxD6TXMVHObyPuUar3JbBBOUImVaF4Utw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=njo88QYWXruJ5fIF9N7xp03t9JpK1JPmoVJ5VuYaYGY=;
 b=1+fZ48ZmKPwS2OLGzprJQZEAO33FpqGm2/Lszi4HsGS9vze0iTEjm3YlYDWDwiILGo6y50tYFfy0KfTZ+JoTC8hykYxjP3j6qEiHPZOXD6YG8oGUEOkHyw4qFoCm8JXwc839Pec9HNMzruXeBL0td/xpnIJddO1lkwjGfQHddE8=
Received: from BN4PR12CA0018.namprd12.prod.outlook.com (2603:10b6:403:2::28)
 by DM5PR12MB1177.namprd12.prod.outlook.com (2603:10b6:3:6d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23; Mon, 18 Nov
 2019 14:06:12 +0000
Received: from CO1NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::203) by BN4PR12CA0018.outlook.office365.com
 (2603:10b6:403:2::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.27 via Frontend
 Transport; Mon, 18 Nov 2019 14:06:12 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM11FT026.mail.protection.outlook.com (10.13.175.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2451.23 via Frontend Transport; Mon, 18 Nov 2019 14:06:11 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 18 Nov
 2019 08:06:10 -0600
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Mon, 18 Nov 2019 08:06:08 -0600
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Mon, 18 Nov 2019 19:34:19 +0530
Message-ID: <1574085861-22818-5-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574085861-22818-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1574085861-22818-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(346002)(396003)(428003)(199004)(189003)(50466002)(16586007)(54906003)(1671002)(316002)(186003)(53416004)(48376002)(7696005)(2906002)(76176011)(51416003)(26005)(4326008)(70206006)(109986005)(36756003)(70586007)(5660300002)(86362001)(356004)(6666004)(2616005)(8936002)(426003)(446003)(11346002)(50226002)(336012)(8676002)(305945005)(486006)(476003)(478600001)(126002)(81166006)(81156014)(47776003)(266003)(32563001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1177; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 432f70f6-beb7-4aa5-9eb0-08d76c3077be
X-MS-TrafficTypeDiagnostic: DM5PR12MB1177:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1177799777CED9C4A38BCE62E74D0@DM5PR12MB1177.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-Forefront-PRVS: 0225B0D5BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1LGr098bXgl4GuG6Y0UfLLeGh4gMy2vs03Rzgv3z422TMlR1ahXUWwsrzM1H6DkpMVRXy0G6NUU8q47GkTt53plB1YNVuIZxCP/MtAQBvFwVLpJv4st2JTHcspkxOq94r2N1DW1/dIaQv8rUoZAXo5O2CsbfeJaHZokUkPOaZb7OcLbKBLht3Dbay0JrePlOYfTrr4YAnPpwQZHHti+lQkG/CaLy5A5E/phWqKcpFgp3aW7QjscZVDgHc+JJ7w27O71ZnmHkIi3muLF+ygclkDAe/sgpm5B5QeOi0i6GPd0xB2c/fK6XH/v/iDSy/+QA8/HaaUGSz7+H2rNN+xyR3yFIsLtwcnBa2W41rJhNULZ1qjYV9KTt2pNuz3JdHSBYaOhp/YKbnqpEQgVxzCCYwBvEOzwiPYyqS5zaqDgUq7g+4+idPmYM4irS5dzz9cXP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2019 14:06:11.7804 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 432f70f6-beb7-4aa5-9eb0-08d76c3077be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1177
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>, Takashi
 Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Akshu.Agrawal@amd.com,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com, Alexander.Deucher@amd.com
Subject: [alsa-devel] [PATCH v7 4/6] ASoC: amd: add ACP3x TDM mode support
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
 sound/soc/amd/raven/acp3x-i2s.c | 42 +++++++++++++++++++++++++++++++----------
 sound/soc/amd/raven/acp3x.h     |  2 ++
 2 files changed, 34 insertions(+), 10 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x-i2s.c b/sound/soc/amd/raven/acp3x-i2s.c
index e97e602..23e4b01 100644
--- a/sound/soc/amd/raven/acp3x-i2s.c
+++ b/sound/soc/amd/raven/acp3x-i2s.c
@@ -44,8 +44,8 @@ static int acp3x_i2s_set_tdm_slot(struct snd_soc_dai *cpu_dai, u32 tx_mask,
 		u32 rx_mask, int slots, int slot_width)
 {
 	struct i2s_dev_data *adata;
-	u32 val;
 	u16 slot_len;
+	u32 val, flen, reg_val, frmt_reg;
 
 	adata = snd_soc_dai_get_drvdata(cpu_dai);
 
@@ -68,16 +68,38 @@ static int acp3x_i2s_set_tdm_slot(struct snd_soc_dai *cpu_dai, u32 tx_mask,
 		return -EINVAL;
 	}
 
-	val = rv_readl(adata->acp3x_base + mmACP_BTTDM_ITER);
-	rv_writel(val | 0x2, adata->acp3x_base + mmACP_BTTDM_ITER);
-	val = rv_readl(adata->acp3x_base + mmACP_BTTDM_IRER);
-	rv_writel(val | 0x2, adata->acp3x_base + mmACP_BTTDM_IRER);
-
-	val = FRM_LEN | (slots << 15) | (slot_len << 18);
-	rv_writel(val, adata->acp3x_base + mmACP_BTTDM_TXFRMT);
-	rv_writel(val, adata->acp3x_base + mmACP_BTTDM_RXFRMT);
+	/* Enable I2S / BT channels TDM and respective
+	 * I2S/BT`s TX/RX Formats frame lengths.
+	 */
+	flen = FRM_LEN | (slots << 15) | (slot_len << 18);
 
-	adata->tdm_fmt = val;
+	if (adata->substream_type == SNDRV_PCM_STREAM_PLAYBACK) {
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
+	} else {
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
+	}
+	val = rv_readl(adata->acp3x_base + reg_val);
+	rv_writel(val | 0x2, adata->acp3x_base + reg_val);
+	rv_writel(flen,	adata->acp3x_base + frmt_reg);
+	adata->tdm_fmt = flen;
 	return 0;
 }
 
diff --git a/sound/soc/amd/raven/acp3x.h b/sound/soc/amd/raven/acp3x.h
index c071477..01b283a 100644
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
