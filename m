Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAC54C4F00
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 20:36:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB06F1EFF;
	Fri, 25 Feb 2022 20:36:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB06F1EFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645817811;
	bh=7K1dBeIF0M4dMEVqDLl5D9gUvJ2I7OzzqZeCH2TZEnw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dv3+/4CP09QjM1+bJ1985uaerncl4Y64xj6nM+7H2blVyqExjEiDOu1AKQF97l68K
	 193s+cg1ZxqZ4JNmQyrjBMA6LZMbJh/TpT1bd/7jMoP/J1m7KoiENoIcg+9GMpKCcQ
	 BsjF8Y444nh24HzPMAUGKgS15hHFL1CVIuMuA4bg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5466F80519;
	Fri, 25 Feb 2022 20:35:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DB76F8051B; Fri, 25 Feb 2022 20:35:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::608])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E4C8F80519
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 20:35:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E4C8F80519
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="q8afhGUR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WE3NJQCPyf6gGt8PnBdhmTjQ1VNN3HeeL/mNlCqjXpSx/R1N0Bt0NgNU4znH101vV0ipWyKoOC/Gu72aWwPL1iCUSkv0VZC+lPQKwlco0vcyS4oC/Qsjup0hQltyDW7r8/CNncBbrMfMGPpwsyPk1Lsd1p8jM9C1KQHzLCVHvM7PUBvrVvOKHgxzyb6Et6ZKNLrrIgLOh19EKZE3uUvWp9d3qrR1XD5+WNvt61kKghKccxozHkSFPis+DLe7vC7STZh3tzujnTGRARNHyvzR1g5wcCI1VY6BQyyMjKFQIUCmmHuZMYV9Z0GfLUVQ4KipRBRoTpP8ICND2gLW2Rf2YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HC4ndKkpKXKWwiRAMnVGzBo7zxZ8TlguMupPQfnxF50=;
 b=YzV2YoLwZrDQu79NHYuZV2d5UGpanl8i0ChFjyDgK4MGDXYNWOuBKSD5eHFWiumA9RZwySpkpR+Y5uf0okMGG80RdevW27dKFMc/fyaNdnOB8XURmUJfsFOG7z5HbFWYlBDdiDOX2HD/iTgyoTjHmkcMl6ri7N2lb77v/KQntulYTwJAWXDqPvaXxlqX3kNlpRpVVxk+OTvwkG/rXO434XQuo7ryj/bNdIuEvtwyWQtlGzT9VmxCTMSTDjy9zbvAIrinqpWT9h+1ZFhJA7EkYrGpC/cOYmOTw3XKScoCWbpLxM71Q3RJowUoalRJ8G8QlShnutoVy9HcWzCJBsQalw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HC4ndKkpKXKWwiRAMnVGzBo7zxZ8TlguMupPQfnxF50=;
 b=q8afhGURvCTUKVblauuyjTxsH9Gi0a4Yr6AZIMfxYAO78S9tAXUVtZPTsfbW0K+SX+gXDPWUmR48SRNQbufJkgsiPpEPWn+3ByfF8SwyhNMQ5x7ksxrDd+cDC1YsssbWxQaQtTJ2rTzJ+j+FsjPQU8yLkNYnulGNs253+4hX+Hk=
Received: from BN8PR15CA0039.namprd15.prod.outlook.com (2603:10b6:408:80::16)
 by MWHPR12MB1375.namprd12.prod.outlook.com (2603:10b6:300:10::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Fri, 25 Feb
 2022 19:35:03 +0000
Received: from BN8NAM11FT062.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:80:cafe::8) by BN8PR15CA0039.outlook.office365.com
 (2603:10b6:408:80::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26 via Frontend
 Transport; Fri, 25 Feb 2022 19:35:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT062.mail.protection.outlook.com (10.13.177.34) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5017.22 via Frontend Transport; Fri, 25 Feb 2022 19:35:01 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 25 Feb
 2022 13:35:01 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 25 Feb
 2022 13:35:00 -0600
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.18 via Frontend
 Transport; Fri, 25 Feb 2022 13:34:57 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH V2 4/4] ASoC: amd: vangogh: fix uninitialized symbol warning
 in machine driver
Date: Sat, 26 Feb 2022 01:00:25 +0530
Message-ID: <20220225193054.24916-4-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220225193054.24916-1-Vijendar.Mukunda@amd.com>
References: <20220225193054.24916-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1b923c0-100b-4ca3-f099-08d9f895ea63
X-MS-TrafficTypeDiagnostic: MWHPR12MB1375:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB13753995F049DE21377FC64E973E9@MWHPR12MB1375.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n8bZc+HLdk2ZszupwZE52TEbGpz9ZKYOOvqRyK1nAV7k0VRG7WulscfGPkCkfrCli6hRpCHOOyqbPPhrT9M9OZkEaWqjytK6bDkk606NqLgGIBARjuiwC0D3dgQ4Ach8geg0jup74/XWlf+ddCeMeq91Lk4skc1aoNzVAJGVMWRG/9NiJtSrlF1DuxSw1pg1gkyRwz2JsbDjLPBUmc3P/5V/Qgqg6062FcoN5DjGqjH4Z0ovQJzOUMn0bql3e4vXdrH2xyWizxedpN4ZGnR+FUxmwCP2bL5MJgh+ovv/btF6YsyYzuHSIvvV+P/vyp+HfZAYyuP7KqcwINdDlqM7p5z95mRlLOI/Z5HpimWhgLUGcyzP7Xr7F9IyZWXKt75X8eFvvwmf/ZFFBXlxYS6l/xIu8d/TpopNI1zAKXXiKFdVFMhyNfe7WpE4anZLa3N+CdjmT2J8Gm5ezmHvrQJJ40LCou8SbtmvugijOhwDYWcAonj4GWjb9k6KLIJiEJPz15+yIZSZRFgdDyYVIEMBl6ET9lkEmMmuEvEHjSCHvCqudOObB1RzXjAnBAxgOj+uPiVXKSdPztcht2ZQJC0gV24AunVJ6zt5ELgRK6eT3HAiYUP1OtmBedStPON6S3ezjS0lPN+TaMMFD4A6CnO4JarpRTQZ7i9lRVf3YDDIi+0jLzR0gXD1PyhAhl6WQNFpDGOmnhH0ZWAQ4X/V/wjXlw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(70586007)(70206006)(36860700001)(26005)(1076003)(82310400004)(7696005)(4326008)(8676002)(4744005)(2616005)(47076005)(2906002)(40460700003)(8936002)(356005)(316002)(81166007)(86362001)(6666004)(5660300002)(508600001)(426003)(186003)(336012)(110136005)(54906003)(36756003)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 19:35:01.5088 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1b923c0-100b-4ca3-f099-08d9f895ea63
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT062.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1375
Cc: Sunil-kumar.Dommati@amd.com, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 krisman@collabora.com, dan.carpenter@oracle.com
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

Fixed below smatch static checker warning.
sound/soc/amd/vangogh/acp5x-mach.c:190 acp5x_cs35l41_hw_params()
error: uninitialized symbol 'ret'.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/vangogh/acp5x-mach.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/amd/vangogh/acp5x-mach.c b/sound/soc/amd/vangogh/acp5x-mach.c
index c574e80907f0..5ae3de76283e 100644
--- a/sound/soc/amd/vangogh/acp5x-mach.c
+++ b/sound/soc/amd/vangogh/acp5x-mach.c
@@ -177,6 +177,7 @@ static int acp5x_cs35l41_hw_params(struct snd_pcm_substream *substream,
 	unsigned int num_codecs = rtd->num_codecs;
 	unsigned int bclk_val;
 
+	ret = 0;
 	for (i = 0; i < num_codecs; i++) {
 		codec_dai = asoc_rtd_to_codec(rtd, i);
 		if ((strcmp(codec_dai->name, "spi-VLV1776:00") == 0) ||
-- 
2.17.1

