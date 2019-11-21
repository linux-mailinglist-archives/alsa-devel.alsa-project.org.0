Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7701051D0
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Nov 2019 12:51:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82D691777;
	Thu, 21 Nov 2019 12:51:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82D691777
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574337110;
	bh=Bhv8XgJu1FL3yqozv/tcg+oV8mF3DUmdljTfuG09XhE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tYJmwG9+2P/zfoLDNR7a/YJeBx31G+6/EV3UXk+BVDvzyzxxFdzc9rEx9WW8qTgqW
	 u9cH6cLVGMM1ijgONzG6VW+9awf/n9q4d4Raf3AvRWI1UkYsrcsSqgL0lWSskcdlMA
	 hI6LboNvh9gq+ryewFBXqT8knijpco6YGtZ5xHCo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D0A9F801F8;
	Thu, 21 Nov 2019 12:48:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED253F80171; Thu, 21 Nov 2019 12:48:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750044.outbound.protection.outlook.com [40.107.75.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B688F8015E
 for <alsa-devel@alsa-project.org>; Thu, 21 Nov 2019 12:48:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B688F8015E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="QM9iec3X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UFu3CIVLS/ZqiO0snElWRB8zIupy0altOFUcOMcfMHpZt81tqNSEZ1BTrTuINTbLYJrNHWlJeVY3XiSGw1vUSMEMxTQBV9/yoVxHbOPUoZGq/7bu2KuOeztVxLEzY2g9d3fhDdEnuBmyc2bwTtjyVDd1rflwv+u3At1NixX6XTSZLxPIexKqkA41sHC0+QyWCVd3Hz6ZXH0MYxFztued+SOfLqQbAV5YFdVGwX3VSFPER0KNicohfV2FrSc+1uuJnZMe3n4IBIbi53oAQdTHFhuFeodMTkUHxXU0ZnshrRGK9aIjJne5FG1QZLzgs4urdxQ/d6HJVBfORwBR97G5ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBc9OJPsrCC+mhZipXl3H5EkdsVz/SKcxKxntZyRPeY=;
 b=Sj8UzeKl2bj4kno2q+mfUUoy5afCja1bQemoZ5oGAZdpZVWPGi0dOzA6hs6jjG2rcMCXW4pjlfU2zPjCm7nyBdIDA8pAE2xzlklPooSOr/ZQxb3UoPltP3+f5qQ+EXGTtz+DGJ12Ttnqs6jzy5Nk56lSr+tqtqffnxIJdka8thnp0HcsEKQD7DRvaR2px2ruEb/CuSioMcjaSpTE5vdyA6tMBbg+m5uZsIypQItde6yjcsNyskS6UXXlepSpFmswu56ry5fdksBYungOunLj/u6NeYlLR3pAsPjcFgQSDqoaDENMCe/IJLyeVWPEIr1w/XMCU1Tb+ZNxVOCjGrvNEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBc9OJPsrCC+mhZipXl3H5EkdsVz/SKcxKxntZyRPeY=;
 b=QM9iec3X8wE8+D2Wc5h29tCZ/IYR2/PGbFA+qljd1i/KbIDZI6ZF6kdaODSqPfTI5uuX4ivhh3PkkEnQ80jQk9w+448fElteP6ZOUGHjNwyd0HLbnGJwRknbL+QiGpxEVlo+TjRKn7mpF4qXuXQMxL9MpDBBj/2qNX4HDibx7JY=
Received: from DM3PR12CA0056.namprd12.prod.outlook.com (2603:10b6:0:56::24) by
 BY5PR12MB4114.namprd12.prod.outlook.com (2603:10b6:a03:20c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.19; Thu, 21 Nov
 2019 11:47:57 +0000
Received: from CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::209) by DM3PR12CA0056.outlook.office365.com
 (2603:10b6:0:56::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.19 via Frontend
 Transport; Thu, 21 Nov 2019 11:47:57 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT057.mail.protection.outlook.com (10.13.174.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2451.23 via Frontend Transport; Thu, 21 Nov 2019 11:47:57 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 21 Nov
 2019 05:47:49 -0600
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Thu, 21 Nov 2019 05:47:45 -0600
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Thu, 21 Nov 2019 17:16:00 +0530
Message-ID: <1574336761-16717-6-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574336761-16717-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1574336761-16717-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(1496009)(396003)(136003)(376002)(346002)(39860400002)(428003)(189003)(199004)(50226002)(53416004)(1671002)(356004)(50466002)(4326008)(48376002)(5660300002)(478600001)(6666004)(54906003)(51416003)(7696005)(186003)(316002)(336012)(16586007)(86362001)(76176011)(26005)(81166006)(81156014)(8676002)(8936002)(70586007)(109986005)(446003)(2616005)(36756003)(70206006)(11346002)(7416002)(426003)(305945005)(47776003)(2906002)(266003)(32563001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR12MB4114; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de3afacd-c046-4305-a282-08d76e78a726
X-MS-TrafficTypeDiagnostic: BY5PR12MB4114:|BY5PR12MB4114:
X-Microsoft-Antispam-PRVS: <BY5PR12MB411485EBCA5DEE6BA10E0C89E74E0@BY5PR12MB4114.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-Forefront-PRVS: 0228DDDDD7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B9O8luXr2IsuR4nt3qca3JrGlOoAdga72C0xaO+qFo7pqAzHAogboC070oPK9nilDluc1zIZ/v2SY6NZQNhdvB+wZMzzIUhcmnRZYIhWpzZNoHx7wIRfFDjM9RuJPBcV2XBq+5I32benzi+EPmotsMkEMtn5VqBfFCVSzvRAL5kUXEsg6aOfrTNR4R+dAmOh1Pzf5Mdd76vYPLUQ0YlCOGuWH12FSJnQDK7kquYyO1FH5w9flsTv+SSrx74nAOihKCKcrIQ74zdRnLJOxFHwwG5vdVol0CWAZ2X9ND5kaDVLkNyAaYIJr/HlM7nm4BO3HSKkomYF6qD3BwKz1f1v+fpZAgOZgnx7QSqsYqd64gq4Qogcq92h/2/V1jQvxjzdCm8zZdIUaBLqWfPW28XgEBEdyuE8zVivTh2hfgyiJDRnWZ8iKDa4jt7yZ6u+Lxcx
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2019 11:47:57.4041 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de3afacd-c046-4305-a282-08d76e78a726
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4114
Cc: "moderated list:SOUND - SOC LAYER /
 DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 YueHaibing <yuehaibing@huawei.com>, Liam Girdwood <lgirdwood@gmail.com>,
 pierre-louis.bossart@linux.intel.com, Ravulapati
 Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 Colin Ian King <colin.king@canonical.com>, Akshu.Agrawal@amd.com
Subject: [alsa-devel] [RESEND PATCH v11 5/6] ASoC: amd: Handle ACP3x I2S-SP
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
index fc16432..e0bac1f 100644
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
