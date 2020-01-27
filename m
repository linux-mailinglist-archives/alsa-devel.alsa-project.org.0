Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC3314A30C
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jan 2020 12:30:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B032983D;
	Mon, 27 Jan 2020 12:29:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B032983D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580124642;
	bh=KaQl4KonaLElQZr1TUTFhEGe7NtFfr6KN77hze1Xi3M=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JQGQpe2O/gKlnZl5ePUz74y52+K52NoqG7K4z7CM5NK05LEnBprTLXEEThu67f2IE
	 N/ChhNzcj1pAHvlBAFlLDjDoghsxb3tEvMIR0b0yOEXLYPhlbBJwSXkLaDw26YuQxN
	 u6Xfn6tjVBw6RKp+wE+CkZY7eLCmlCXk5822Zxtg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9027FF800C8;
	Mon, 27 Jan 2020 12:29:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF482F8021E; Mon, 27 Jan 2020 12:28:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2063.outbound.protection.outlook.com [40.107.223.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD802F800C8
 for <alsa-devel@alsa-project.org>; Mon, 27 Jan 2020 12:28:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD802F800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="ceiYlsjt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WEOephbBXL4NZMXKR6iScpUCvtWX3nJ118GJtkM2WMUXn1qa+k9TkrNcscatYpGIe/V3Ih5rOvMrKojvsAB5Z1SbHGBehH+BF/PEOP4SbkctIZRqj2r9k0ROAf3lNyJwtCTETalUq0yK8sXhjKnCA74s4KfjAjtLcoa9yLrde89Kxe7dlb62Bsz5LiaxG3oz3oOjMjnj6I5lnbu+yOsusPr8yvml4aRfsB6/Hp5ZuASXuxr64VgTK8UibcMw9+rOqJQwHCL/i1wSZ/M78aTSyQWxZUMCt4wBEGB989cLQL2WCBIHpBl4r3RsQd0oQK2FnfhOtsKlxupyIFz3RnTdWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m2x9/N2p+8jF2vK17XXB4h22BcoFcjkEK1yo28zsUbA=;
 b=BScMs3G8St4ngn8Wb61phbbVe69ZtfThh/mdHacCGC7HaN+2RZECAshkvgEd8qpRvhwh2QesPMphyCi8ODYFvI/GR0hryWiirXhMHeZRbuH4WPsEyKwbX7s5OMDx0VJ39EKHyeCzHKgu3RCpkDQajzM2wq77nX1tf/xN9NFg5RxN6cmBhFOjV1advDMxsUPaZsJf5MMY+0/+ucQS91IGxKO0mPKqrC6256rU4icmdgV/85dsdqMxPm5xaqsyDRmWwSp692zF6EOQ8IWS5/6DgXj0zfSXaWm20VDORxmwbImW7jOscqu90VfIMjEBZaXF8nsKTRfBllFHSM5v32bhHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m2x9/N2p+8jF2vK17XXB4h22BcoFcjkEK1yo28zsUbA=;
 b=ceiYlsjtBk6MpbGzrN6//cIwfwyyp3UByy1pRp3FWpAULJoIJshdlckVYcd53wnOK1IHMEVhRjhVDzrRmjN4uMR+XHFLjen7Rhs76es8h1FfYA8IFfn0hjLGRpnnq9epgOG/nWl7jACBOjAl9TGHkY4hoPbXS0X+kcYuByiMPvc=
Received: from SN1PR12CA0047.namprd12.prod.outlook.com (2603:10b6:802:20::18)
 by DM5PR12MB1468.namprd12.prod.outlook.com (2603:10b6:4:10::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2665.24; Mon, 27 Jan
 2020 11:28:41 +0000
Received: from CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::208) by SN1PR12CA0047.outlook.office365.com
 (2603:10b6:802:20::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.21 via Frontend
 Transport; Mon, 27 Jan 2020 11:28:40 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT057.mail.protection.outlook.com (10.13.174.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2665.18 via Frontend Transport; Mon, 27 Jan 2020 11:28:40 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 27 Jan
 2020 05:28:39 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 27 Jan
 2020 05:28:39 -0600
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Mon, 27 Jan 2020 05:28:35 -0600
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Mon, 27 Jan 2020 16:56:03 +0530
Message-ID: <1580124397-19842-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(396003)(136003)(428003)(189003)(199004)(4326008)(36756003)(26005)(186003)(8936002)(7696005)(8676002)(54906003)(81166006)(81156014)(5660300002)(109986005)(356004)(316002)(6666004)(86362001)(478600001)(70206006)(70586007)(336012)(2906002)(426003)(2616005)(266003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1468; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32bfbfd8-d1d8-4068-da6a-08d7a31c0f3e
X-MS-TrafficTypeDiagnostic: DM5PR12MB1468:
X-Microsoft-Antispam-PRVS: <DM5PR12MB14686A13952F5D6164023029E70B0@DM5PR12MB1468.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-Forefront-PRVS: 02951C14DC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1o2bHrFbRLrf3gHL/mRLo7O7pY00Y7s4PKS26RXjFjDD/uxa+a6xEcZSxWYWR0ezPtVBtapfJZj4khr9FKMs7n26sfNuAJEH4T/+UnMLam//uUxrKb++06wyy9462VZ6gFH+3yTMparuC7iSReRAMGq0BhbPFYmVJg89+RupmZgZWtg50lUfPvB+8xE92kPpk9qCuOKbBcX9Sks7DKu1nrJvh2R3mVn72HB6pTIUc7mFeVIWi5FwTy75ipskKNkrs2ymqGyTDy+itN+7Drnd6M+VRsS+4O7U7DxYeqbA0s3gDzg2a5D68Kz1jB/klZIhjOXhuYXiHnamh/YIQISR7OTa7AEVKtBm1naMxSINNYC+zyf72VT50b5y2IC/LiSm+RCaFyK4SZIQA3+XGotN7LgMZL5tWTmFPbj8GLm1ppBnrumBFjpBw0snONw1EYoOl0Fo1D6V/g1m6Ued6WqkUC6aGDff8TkGSiWcMIOGbUQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2020 11:28:40.4838 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32bfbfd8-d1d8-4068-da6a-08d7a31c0f3e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1468
Cc: "moderated list:SOUND - SOC LAYER /
 DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ravulapati Vishnu
 vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>, broonie@kernel.org,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com
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
 sound/soc/amd/raven/acp3x-pcm-dma.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 5c3ec3c..aecc3c0 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -349,13 +349,6 @@ static int acp3x_dma_close(struct snd_soc_component *component,
 	component = snd_soc_rtdcom_lookup(prtd, DRV_NAME);
 	adata = dev_get_drvdata(component->dev);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		adata->play_stream = NULL;
-		adata->i2ssp_play_stream = NULL;
-	} else {
-		adata->capture_stream = NULL;
-		adata->i2ssp_capture_stream = NULL;
-	}
 
 	/* Disable ACP irq, when the current stream is being closed and
 	 * another stream is also not active.
@@ -363,6 +356,13 @@ static int acp3x_dma_close(struct snd_soc_component *component,
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
