Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BBA143B5A
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jan 2020 11:47:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8CFC1680;
	Tue, 21 Jan 2020 11:46:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8CFC1680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579603659;
	bh=KBPQ7+yARMufLu6SoClkqNxIgmt3SwM2H2pNEskh9lc=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IliEQFs+Q7WjkJDcmEeQ74R+bi+213qDHXdqAXcMNfphJdEbuSdtUJ2mCwfk2AcUe
	 S+VBtEL7ICu9OVeGJHTl81YOa+L2L7MnLSBnImHifUYGFGtNIGWHcVvISoM02ZHnID
	 NsZcmOMD2feLRcIYYvBRMIicT9GzmKCKRyTWTdtQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44B60F8015B;
	Tue, 21 Jan 2020 11:45:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71265F801D9; Tue, 21 Jan 2020 11:45:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2051.outbound.protection.outlook.com [40.107.236.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A7EAF800CB
 for <alsa-devel@alsa-project.org>; Tue, 21 Jan 2020 11:45:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A7EAF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="yjfJizql"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bKEW2BLo3FqupHoGsrViGZ7m5OBazr2+4CotKRXkazitkoDP02fsm+woVyFUOSTX1egtS3zEATqvA5BmSeVxAgOeBH1pwKw45w5d4X87c6aMWBK/iLxh0pE7gP30u5yEIKKqulD8m5JLhBIkt89soBjvWdckflxsqHhC+M2ikQ04zw6X/F0R+9iWhUmAZ2Z5qfYEqPlpzYhI/deH8rsTfADCCtbo945J0AWze+3Fv+O493JhSyKxltfNZomq/q72ncwRRBc3b5B0lGSJPlKzPTr2MV35RpBHAtaaxRzNO/Reyi/9Tg9rremxXmvbpCPBRY5f0it6AIg6Z//XI4iNTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gsxLewS2dixLfjG50YVYM/MuaQAk7d0HQnNIliQqXg0=;
 b=iIwIUBYvbNAv9WivVP2DgcHIpHKwLuMmD5hPNx5POBPPRP/rjbe28TIsANU1tV/3Vp80zsCYF7qKkkxDs3c8i1MG64WVZKuC0CT+8WKksc9oTevLS4MvkRQsjtYM4FsHONffEN0EYUgxOqDEGdctX7hXgijCeXiprf2RMyCUp5jfRrb4vFSHfcxdH9vbeKth58PmxyhooE25ymPv1G/0OdWyPG7gI9JDuxD5o5/WipbFRLEnp4IZ33GkZkSodDT0sHMwbKL2loAtEWb1ti4Ee0AwI5sPH+CAW5qp2ayK49HEv1dlWtSQyPKdB2AqM0zzPVnN2liVgDuKyNQx8mr5gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gsxLewS2dixLfjG50YVYM/MuaQAk7d0HQnNIliQqXg0=;
 b=yjfJizqlLk9240sV8PAoTN6hZgdGXRntScmVkdDfeBRPGL9am5FNw4aaE77enASqk1utPbeAi10D/LrS9VzDrWFQKJ4IBtJCP8Tr/w8bSWM3FoLupIKqUYNHXKwGfOmbTWqtuCxG0Ig1whC0K4ejzY9sk4gWaNsQR+60Be6+PZA=
Received: from BN6PR1201CA0019.namprd12.prod.outlook.com
 (2603:10b6:405:4c::29) by MN2PR12MB3277.namprd12.prod.outlook.com
 (2603:10b6:208:103::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.20; Tue, 21 Jan
 2020 10:45:40 +0000
Received: from DM6NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eaa::206) by BN6PR1201CA0019.outlook.office365.com
 (2603:10b6:405:4c::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.18 via Frontend
 Transport; Tue, 21 Jan 2020 10:45:40 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT049.mail.protection.outlook.com (10.13.172.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2644.19 via Frontend Transport; Tue, 21 Jan 2020 10:45:39 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 21 Jan
 2020 04:45:37 -0600
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Tue, 21 Jan 2020 04:45:33 -0600
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Tue, 21 Jan 2020 16:13:35 +0530
Message-ID: <1579603421-24571-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(346002)(376002)(428003)(199004)(189003)(426003)(26005)(316002)(54906003)(2906002)(86362001)(7696005)(8936002)(81156014)(81166006)(36756003)(186003)(8676002)(5660300002)(70586007)(70206006)(2616005)(4326008)(109986005)(478600001)(336012)(356004)(266003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3277; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fe5831a-755b-46b9-457b-08d79e5f0e59
X-MS-TrafficTypeDiagnostic: MN2PR12MB3277:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3277025A325CBC020C7DAB32E70D0@MN2PR12MB3277.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-Forefront-PRVS: 0289B6431E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ckclESf3GrC4g5SiRonl4XQl90JDNW5BqPh6w3YsHLizPkgTuV8ih3o7YVDiJ+Bri0mqAAJuQWyeqMgGmaicrq/uFJ/h31QD1HKGm9ayYPN9m45+vgrR8STyTUVcat2Dvo9HFHznt6qTRkWocdYx3iafqI5GmbbGMPTPRNw2EtaYYdsnHhZoqtpCNvP7DC1qCSBbVonvpL3o+JkSWpL7B+2Nvm5WaI5SAVVuB59nWOrrsLuB2It4qx6xGbSVNIoZfkcXI8RouBEa/RjFer2R25SVZeDWrblvK1lmHCxO10vGQ99xWg5Lo9AO+Yno6Rl4fwCLj3jdJO4s5clFem3on3HKDfDz43Dli3Pg93DYqRfBsIsEe1KW+HvIyItmBZtWWidZ366I7SHPF6flcjJWWam6fK0ZAuZtLP6XV+YWDB2uzRWN/UaBCyGqmJMXaoQVFwAx2dzS1rC3ZA9GyvzBRGnkWduNqCTfa38L06xjkb8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2020 10:45:39.5045 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fe5831a-755b-46b9-457b-08d79e5f0e59
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3277
Cc: "moderated list:SOUND - SOC
 LAYER / DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>, Kuninori
 Morimoto <kuninori.morimoto.gx@renesas.com>, open
 list <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ravulapati Vishnu
 vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>, broonie@kernel.org,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 Colin Ian King <colin.king@canonical.com>
Subject: [alsa-devel] [PATCH] ASoC: amd: Fix for Subsequent Playback issue.
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

If we play audio back to back, which kills one playback
and immediately start another, we can hear clicks.
This patch fixes the issue.

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
---
 sound/soc/amd/raven/acp3x-pcm-dma.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 5c3ec3c..916649a 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -344,25 +344,28 @@ static int acp3x_dma_close(struct snd_soc_component *component,
 {
 	struct snd_soc_pcm_runtime *prtd;
 	struct i2s_dev_data *adata;
+	struct i2s_stream_instance *rtd;
 
 	prtd = substream->private_data;
 	component = snd_soc_rtdcom_lookup(prtd, DRV_NAME);
 	adata = dev_get_drvdata(component->dev);
+	rtd = substream->runtime->private_data;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		adata->play_stream = NULL;
-		adata->i2ssp_play_stream = NULL;
-	} else {
-		adata->capture_stream = NULL;
-		adata->i2ssp_capture_stream = NULL;
-	}
 
 	/* Disable ACP irq, when the current stream is being closed and
 	 * another stream is also not active.
 	 */
+	kfree(rtd);
 	if (!adata->play_stream && !adata->capture_stream &&
 		!adata->i2ssp_play_stream && !adata->i2ssp_capture_stream)
 		rv_writel(0, adata->acp3x_base + mmACP_EXTERNAL_INTR_ENB);
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		adata->play_stream = NULL;
+		adata->i2ssp_play_stream = NULL;
+	} else {
+		adata->capture_stream = NULL;
+		adata->i2ssp_capture_stream = NULL;
+	}
 	return 0;
 }
 
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
