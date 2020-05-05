Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 908201C549C
	for <lists+alsa-devel@lfdr.de>; Tue,  5 May 2020 13:42:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13E431737;
	Tue,  5 May 2020 13:42:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13E431737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588678974;
	bh=EsL161lKPV5tGkq3bnJWXM1GL1E0D77WlHS4OmwFuaA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=U4J/f5QCfwoeu8mrmY6Hl8o1bQXN2Y+oiaizL1l4ANjdXr6iu7jD/EQZS9fuc/Vft
	 hYZOc7hQXMCOpNpd4Ajm79vwBZV/o+ZgifaXLt4lV/rJBQ5U9s9IcaIY3Rj8xmkhSL
	 RW1PVJrhndbGbR1KcdWrhoDGnrFPPOyXqg53ljzg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B5FBF800EE;
	Tue,  5 May 2020 13:41:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF415F8015F; Tue,  5 May 2020 13:41:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,MSGID_FROM_MTA_HEADER,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2078.outbound.protection.outlook.com [40.107.94.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CB2CF800EE
 for <alsa-devel@alsa-project.org>; Tue,  5 May 2020 13:41:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CB2CF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="ACklc3mI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XJretdBr/Z5mtTK9VyVKuWVz2DSvIWOia+/O8l60SkiMaw9X6f7WyQlLZQ6Qi5regiDIBED2aqPF6W6Pql2ChsOh3oUG8nYLQ+dBisSrc3OFR5uTz9kl8y3heZOrULbHbvJlHzxapZ9QL+Q4yxD9TM4xp2ynS3fsYy+nCU9eGq439o1TcHZfEZmX0wgLqI45AWQiKSXpGDCtKjLPm1jJVcrVk7yJ0ETWYpAaZ7oNfcDCHHe3cWgUc+MNchZYaPLhDSxuLrL0VFqvcBHlOGy8AiRG1DWRAySJfVrvsnt/MR5EStiiJXvLMZlVu+mowfS7i5c3BtWh04J4evW9SBh4Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/cUPb92+AIYMAFpgQxkJ5eiso9nPoYGvHidfwS8w0Y=;
 b=WgtrtKgV85j769xIsYGvyo1sDzSD4XKG7QF7pZW3P/VCW86ra42T75OkCz7PkPLg/Dn+D+SaqmdgfsszBF87EXKLeVKhh8v0sn1BCEKwqgZBEczfYeJvnCiuU11WqXUd0HWU7B8zADmvw2iiXnjtmgMJr7yY1hyzAV35kIiRbZ36kJa9yva++5qzYzw28L49ORLxD+SDv4qX4z5I6Aqu1Tylq/lefzN7RXH6MZdPY51+zDzRbw7/mkitXPKUucWcEAYU6lK4hTLEWnMvMyO4ukEyGVQXrj/pV8Wg4njSJDK0xdgStw7u/VD7DcwbXtV+YePzio2D/z1a/3V8CoetcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/cUPb92+AIYMAFpgQxkJ5eiso9nPoYGvHidfwS8w0Y=;
 b=ACklc3mIHMYX3au/+vHI+pSpbnx5NEThGC6bJACrBvjnXUQF4LnjFPDpC4fpG8uMPzhyfUdDOOOOjxPeUV6/vr/zrLmQU/rGHn/GvSgnKsaatjtpO8cmQEeT2dQyf5/RF2LmDKUbUqKVcUpavmW3qksk6b44NwJqpCI14suR+hw=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1855.namprd12.prod.outlook.com (2603:10b6:300:10e::23)
 by MWHPR12MB1423.namprd12.prod.outlook.com (2603:10b6:300:14::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.29; Tue, 5 May
 2020 11:40:57 +0000
Received: from MWHPR12MB1855.namprd12.prod.outlook.com
 ([fe80::c455:6257:3c8a:7010]) by MWHPR12MB1855.namprd12.prod.outlook.com
 ([fe80::c455:6257:3c8a:7010%3]) with mapi id 15.20.2958.030; Tue, 5 May 2020
 11:40:57 +0000
From: Akshu Agrawal <akshu.agrawal@amd.com>
To: 
Subject: [PATCH] ASoC: amd :High hw_level while simultaneous capture
Date: Tue,  5 May 2020 17:10:20 +0530
Message-Id: <20200505114023.251409-1-akshu.agrawal@amd.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: MA1PR0101CA0033.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:22::19) To MWHPR12MB1855.namprd12.prod.outlook.com
 (2603:10b6:300:10e::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ETHANOL2.amd.com (165.204.156.251) by
 MA1PR0101CA0033.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:22::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend
 Transport; Tue, 5 May 2020 11:40:54 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.156.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ab51b49e-c6cc-4be8-0bf2-08d7f0e92d17
X-MS-TrafficTypeDiagnostic: MWHPR12MB1423:|MWHPR12MB1423:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB1423F75675A1D2A33B718A72F8A70@MWHPR12MB1423.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:466;
X-Forefront-PRVS: 0394259C80
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xliPbxF5ysYV4UTbHGgcR+OtnymlXZZL/Zu3kl9y9S5M+i5mXFBm7M9GSoY1XWK8iPkFypjKqAEB/efYNXZNgGL+rrh3du0ycK+uhxr4rJiaS7lMF4wzmZQ/Wg2Tli8TRx3HSKeAuR2sMQSEHlyhU8AaLSaP6rLPTLfQFn8Y8YkCyIbLMZ2eER00Fe+tcuOhjJul7gFBVLWCE41c7rOGXyWu7MRJ+rGIFfwY/T6KJnED0eRdExvCTWNxKy56Vqhn/C93XvCahwlZYtExXeKVpAICBZZ2DvkaW2kLvfr9CO99U/OfzXCPqzUoYQD0TXXPdQI94kTgTqyoG+6C3Jb3mAW2YlhIKHZB0ecycIP5lNpGmvkzJrStZQ3xPy4YfXpp/kPOijruKDBuRIJIpbEwlf0iS5Uvu9Xd0Dry2gUDwji1LN6aQMHHKRq3eSge7rBSzrDJKTsVolgJbQKs8feYGOHVcrVlJEmqCxsTkEKQnG4g+Bb/jPBrFPgTv8Z27U/lvlOzKJnXgYfqjPFTLLCqAfRpKY3zZgfn7xmT7Ria/Zg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1855.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(366004)(136003)(39860400002)(376002)(346002)(33430700001)(8676002)(478600001)(956004)(36756003)(44832011)(6486002)(2906002)(4326008)(2616005)(109986005)(186003)(66946007)(26005)(16526019)(86362001)(1076003)(6666004)(54906003)(8936002)(7696005)(316002)(52116002)(33440700001)(66556008)(66476007)(5660300002)(266003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 98pRMPbRpbXlwPmFiDMcf/WUwcE+OzZwRr3Z+tFhLRbLGEvhRmjQzW9JsSEK+q3pg9sDBaqz0Kp9Ljui9YlYqELY174jp2KCqQ3T0Erc3J+XATpz4lVOPDUjFLLdsJPMis8J2LnbwBEqJJb7yT/z2lYZ1UCaRqoPr+l7VLerYFkSuC4GmmLSip+jV2WWvnkgMGx5PfC702pyzWxPY20vXnGL2U2eC7/6NaR8IVeabhizezKJOgnm2CyqiaoD+1z+RmeMIkc2/8qEc7Wa6iY3UXbmX32k1NELD+ckk58nb85EvgsDk1jphhx99HrBuXqLuW1A4CcIb67swPONIIJQvJWv7RBAwbmJVuMZe4vI5Orf4pD3QKS52M/Vua2sPQZO7nJilmDTbHbRBnRYw/5XHqr3CygTSVlOUiuBDU/fHu+DywO2XCOKx0cjeusEpaUCGEbeMkZssr+Xg0IjwxKDH95OnaEqmEz2kRtgS4MjjFLZwZt79tdZbaAmENLa5QiG+v9Z9nehE6ni9hEIM0usf0fDcQA/AOK6yPOEf3Spkr5vT+7LPykVG/eSI358hlFY8jSUW0T2QHxQ9JbbDtqbWZt/iTDfcBNK1V3Glldqc8nYdLe9wqGKnQcPMpNwALf/rtXJEOe4yEflnH+/SW1CsIqzLID7jerBRurwv92WEI+INb8p75j4XkF7emxNaXuw2PKPdUgFzn9xbrdZ0oVyuJI7vQIu0ocds3HY/Uh1xF/DoifMgKBZv6N4DfopPPDNvbRKLJDQQUcHxFZ5XnfUWRsFNjMEF7KvyJgbZei48DIpDXGBLX1503gDAfpCRAVu
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab51b49e-c6cc-4be8-0bf2-08d7f0e92d17
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2020 11:40:57.3184 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LUOuvKG09L4wtkMzPTln4qhgH+vqVOPVPWksIOLOCHoLgVbhJeA/yaO1zqci0tsAVfrK2bBGjC5SQBJvJ9//uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1423
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Colin Ian King <colin.king@canonical.com>, akshu.agrawal@amd.com
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>

Simultaneous capture on dmic and headset mic is having
issue with high hw_level being reported.

Issue Can be reproduced by:
arecord -D hw:2,0 -f dat -d 60 /tmp/test0 &
arecord -D hw:2,2 -f dat -d 60 /tmp/test1 &
cat /proc/asound/card2/pcm?c/sub0/status

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
---
 sound/soc/amd/raven/acp3x-pcm-dma.c | 37 +++++++++++++++++++----------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index e362f0bc9e46..a36c5cb848cd 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -241,14 +241,6 @@ static int acp3x_dma_open(struct snd_soc_component *component,
 		adata->i2ssp_play_stream && !adata->i2ssp_capture_stream)
 		rv_writel(1, adata->acp3x_base + mmACP_EXTERNAL_INTR_ENB);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		adata->play_stream = substream;
-		adata->i2ssp_play_stream = substream;
-	} else {
-		adata->capture_stream = substream;
-		adata->i2ssp_capture_stream = substream;
-	}
-
 	i2s_data->acp3x_base = adata->acp3x_base;
 	runtime->private_data = i2s_data;
 	return ret;
@@ -263,23 +255,42 @@ static int acp3x_dma_hw_params(struct snd_soc_component *component,
 	struct snd_soc_pcm_runtime *prtd;
 	struct snd_soc_card *card;
 	struct acp3x_platform_info *pinfo;
+	struct i2s_dev_data *adata;
 	u64 size;
 
 	prtd = substream->private_data;
 	card = prtd->card;
 	pinfo = snd_soc_card_get_drvdata(card);
+	adata = dev_get_drvdata(component->dev);
 	rtd = substream->runtime->private_data;
 	if (!rtd)
 		return -EINVAL;
 
-	if (pinfo)
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (pinfo) {
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 			rtd->i2s_instance = pinfo->play_i2s_instance;
-		else
+			switch (rtd->i2s_instance) {
+			case I2S_BT_INSTANCE:
+				adata->play_stream = substream;
+				break;
+			case I2S_SP_INSTANCE:
+			default:
+				adata->i2ssp_play_stream = substream;
+			}
+		} else {
 			rtd->i2s_instance = pinfo->cap_i2s_instance;
-	else
+			switch (rtd->i2s_instance) {
+			case I2S_BT_INSTANCE:
+				adata->capture_stream = substream;
+				break;
+			case I2S_SP_INSTANCE:
+			default:
+				adata->i2ssp_capture_stream = substream;
+			}
+		}
+	} else {
 		pr_err("pinfo failed\n");
-
+	}
 	size = params_buffer_bytes(params);
 	rtd->dma_addr = substream->dma_buffer.addr;
 	rtd->num_pages = (PAGE_ALIGN(size) >> PAGE_SHIFT);
-- 
2.17.1

