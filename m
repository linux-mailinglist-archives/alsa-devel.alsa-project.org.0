Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 895447E9C3D
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Nov 2023 13:36:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAA03850;
	Mon, 13 Nov 2023 13:35:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAA03850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699878965;
	bh=tC9dlfAED/D/kxIRK3SSd33QJQisP4WonVBGEzFPo/0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VVMJP/5RkKbj+Tnhak5jVY99u3ff3lNg2rHbN4l0EE+Jo78+OkHZ7qVDBQPoxR2gF
	 0IiwgkV4shFRCq3GEQ5da946wYp2SXaDMaGv8+8B5UKIOcyqjbSaRt139yag51c7R6
	 tRKw1IkjOIUcfYaB//1t0iAjp7XVxdqmmOJnDrCU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F6D9F8055B; Mon, 13 Nov 2023 13:34:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F0A6AF80557;
	Mon, 13 Nov 2023 13:34:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18FCEF801D5; Mon, 13 Nov 2023 13:34:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::606])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 156DFF8016E
	for <alsa-devel@alsa-project.org>; Mon, 13 Nov 2023 13:34:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 156DFF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Up+fcCtd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NIIUOD71hpIl5t0twZd2To5FL9/S1Wua4455zYdmIbZXX+s04Y4uJRQbAA2RaTPMlIOHfPNMOqXwpGfY1HhJk+wAqu5KSheYp+gato/8Obg9dl4saXHnZYh2paFIYUz0DURQtcxOPU1FwvrL+cNgmnerdgJWNikAVgcNC2hiz8w44JMHUKwYA2NFC0xYgWyrPBgXgasn89ziWdGfdWqPPPv/jnr2ygUYuhEoS+VHsQtj4bkB0FEy7ZSMLS71RyeBAV47IC4MQQ6L5VPuW6IAo4XjekEneCcOCUQbAVTUSyv8YJ1jzxKGpxNO63vjfQxZ97OPFqRnr9PyESQvuVEBTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2CffOFhm9RNlDoL102Kh1Mp+1iWlfp4u0HViuRPpfo8=;
 b=inq6bfP+br2Jr3z6v4t1jGWbvP3Cpp8vi4ZQP/NYCD6S5JbJNS6I7IKTlBWqyAQnJ3sM3lr+O3SSsic4qtJ3s55vrY+565DWR1rGNnNmnAVl3CRZAcg+58ABEq6oKA1aiaY1XYhgpNAkI4aq4mCJbaAC4Rou392bODQliqDcCtGXZskyiysgZcoKv4VDyqsOMA/Ur1eBAoCOM3/VgcauRgyvS0Tcrv8FJypvRhnLmcnlc5yclLSZVxkxZ4Cqa5b+deBGAWVEBctHMsHXUPLnTWyG+Dh+5VRE9F8DnhLmO5TgWFwUAMi1N0YraotYcTU1+wjYsT5B6+UDFxW04bqMuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CffOFhm9RNlDoL102Kh1Mp+1iWlfp4u0HViuRPpfo8=;
 b=Up+fcCtdFUhLi+D5UjILBZISSoN4Iw4ooIROYeNT4t/0uDxoGjlsX/KDA12daAd0JeVfzJ+ajApypMivIMJSZCcGaAPlpDi7AQGWZ+NPbUuKpy/BJtwRLgGhDZMsjs4P3ldMPaw9QSWAdkfzK9Gku2N0I70sgWiRW0Y6bA5Kdj0=
Received: from BYAPR01CA0030.prod.exchangelabs.com (2603:10b6:a02:80::43) by
 SJ0PR12MB6926.namprd12.prod.outlook.com (2603:10b6:a03:485::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.29; Mon, 13 Nov 2023 12:34:02 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:a02:80:cafe::5c) by BYAPR01CA0030.outlook.office365.com
 (2603:10b6:a02:80::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29 via Frontend
 Transport; Mon, 13 Nov 2023 12:34:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.13 via Frontend Transport; Mon, 13 Nov 2023 12:34:02 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 13 Nov
 2023 06:34:01 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 13 Nov
 2023 06:34:00 -0600
Received: from amd-B450M-DS3H.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Mon, 13 Nov 2023 06:33:56 -0600
From: Syed Saba Kareem <Syed.SabaKareem@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <mario.limonciello@amd.com>,
	<richgong@amd.com>, <posteuca@mutex.one>, Syed Saba Kareem
	<Syed.SabaKareem@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, Nicolas Ferre
	<nicolas.ferre@microchip.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH V2 2/2] ASoC: amd: acp: add pm ops support for renoir platform
Date: Mon, 13 Nov 2023 18:03:43 +0530
Message-ID: <20231113123345.2196504-2-Syed.SabaKareem@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231113123345.2196504-1-Syed.SabaKareem@amd.com>
References: <20231113123345.2196504-1-Syed.SabaKareem@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|SJ0PR12MB6926:EE_
X-MS-Office365-Filtering-Correlation-Id: d401569e-14d5-4480-6336-08dbe444d153
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Qq1jT+iHxFT/B3QRDMRD9/Ug/2B+aQBW8wkRs0vEGyahWW1qERkLktRfRs3/ELfLlwchGGR5AErNRolKEURI/0IiQf66sWK5+5cXL4hn9r6tTvlVVf3xWfGxakSaGnIGjP6qqsbwjNw1lD6o+rsLrvD65RljZftPRXV2QVakZTQRmkfyPW8UFeeIsFOV3GMVcISjM5EbWRv15mOyCGfbL7HC4vkOL/SKCIt+Q6P0Q1TEOPkCYEWXw3Ll6cvp3BXpeiQ2kyplzgziMyWYPC5DoaJjAoGPGjpOd3Wf1yOVzWbk9SXwDpGHM6arJKaobYDOUijEh0oejJaybLXmxnOAq6uZlkZ8DIHkDheP6y9DRsfJfY6Dgs1n2uL+q/5ylrMiUuwq/Ni/Nj0OzOv7FfeZVVnSrLSmzdmD3KmxtEkLWyP5jazwtCWrtKb4uPDMF3PgMORoCRbCYCg2xYjpRGtIiyfT6GojZZfJMgfejmjDe703rxhmnW/TiTgdWU+z0i8xsRJjZXyCT41dVpcdCqhQIyTQWEUVz/E7qO4XntqUQsjFA9LKTCFmwEDI4ODIzWlAn2SA3aupXeWpUbso+7gGXMv0m0dP+2OYGZInE0bbRArJf8AprN8YkbO/HCPr6SrKaxyEDVX1ifQKT2bjVRrJpzY09sYVSMDVcjGeaXSRKVz2Hn6ZR/yIbvCZYFqoxjcawJYKTI9IbTlpLPZLnWEoSTvL9KCR9LK70GIki9cLVqGSp702CiC69wHyqQZmJF1vRu7AP9HNGgDCxcbdZ2eO8A==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(39860400002)(376002)(346002)(230922051799003)(451199024)(1800799009)(186009)(82310400011)(64100799003)(46966006)(40470700004)(36840700001)(40460700003)(336012)(1076003)(26005)(6666004)(7696005)(2616005)(36860700001)(83380400001)(47076005)(5660300002)(7416002)(8676002)(8936002)(41300700001)(4326008)(2906002)(478600001)(316002)(110136005)(54906003)(70206006)(70586007)(86362001)(36756003)(82740400003)(356005)(81166007)(426003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 12:34:02.2150
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d401569e-14d5-4480-6336-08dbe444d153
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6926
Message-ID-Hash: YJLSFH4OZWTU6J2BFUDGXFWNAIHC2G54
X-Message-ID-Hash: YJLSFH4OZWTU6J2BFUDGXFWNAIHC2G54
X-MailFrom: Syed.SabaKareem@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YJLSFH4OZWTU6J2BFUDGXFWNAIHC2G54/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add pm ops for renoir platform.

Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
---
 sound/soc/amd/acp/acp-renoir.c | 38 +++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp/acp-renoir.c b/sound/soc/amd/acp/acp-renoir.c
index a591482a0726..8539fbacdf4c 100644
--- a/sound/soc/amd/acp/acp-renoir.c
+++ b/sound/soc/amd/acp/acp-renoir.c
@@ -20,6 +20,7 @@
 #include <sound/soc.h>
 #include <sound/soc-dai.h>
 #include <linux/dma-mapping.h>
+#include <linux/pm_runtime.h>
 
 #include "amd.h"
 #include "acp-mach.h"
@@ -195,7 +196,11 @@ static int renoir_audio_probe(struct platform_device *pdev)
 	dev_set_drvdata(dev, adata);
 	acp_enable_interrupts(adata);
 	acp_platform_register(dev);
-
+	pm_runtime_set_autosuspend_delay(&pdev->dev, ACP_SUSPEND_DELAY_MS);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_mark_last_busy(&pdev->dev);
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
 	return 0;
 }
 
@@ -208,11 +213,42 @@ static void renoir_audio_remove(struct platform_device *pdev)
 	acp_platform_unregister(dev);
 }
 
+static int __maybe_unused rn_pcm_resume(struct device *dev)
+{
+	struct acp_dev_data *adata = dev_get_drvdata(dev);
+	struct acp_stream *stream;
+	struct snd_pcm_substream *substream;
+	snd_pcm_uframes_t buf_in_frames;
+	u64 buf_size;
+
+	spin_lock(&adata->acp_lock);
+	list_for_each_entry(stream, &adata->stream_list, list) {
+		substream = stream->substream;
+		if (substream && substream->runtime) {
+			buf_in_frames = (substream->runtime->buffer_size);
+			buf_size = frames_to_bytes(substream->runtime, buf_in_frames);
+			config_pte_for_stream(adata, stream);
+			config_acp_dma(adata, stream, buf_size);
+			if (stream->dai_id)
+				restore_acp_i2s_params(substream, adata, stream);
+			else
+				restore_acp_pdm_params(substream, adata);
+		}
+	}
+	spin_unlock(&adata->acp_lock);
+	return 0;
+}
+
+static const struct dev_pm_ops rn_dma_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(NULL, rn_pcm_resume)
+};
+
 static struct platform_driver renoir_driver = {
 	.probe = renoir_audio_probe,
 	.remove_new = renoir_audio_remove,
 	.driver = {
 		.name = "acp_asoc_renoir",
+		.pm = &rn_dma_pm_ops,
 	},
 };
 
-- 
2.25.1

