Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6DF8148AE
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Dec 2023 14:04:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C620DF3;
	Fri, 15 Dec 2023 14:04:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C620DF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702645474;
	bh=3dInxHm/AY/uDAcKgdISB/rXh73ZfRvxbK+33GxnxR8=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=OfW0yyxLW27UK4DOoFyl1rwaHjSq44pKCsJojcYPKk3q4nEj5YnmDr7idCRZ5dyus
	 BXfrQ1+bx0VEwttmoY/oA+3DkrqBHiNk0U8+daHHNRbtVdNpSlxA2gLq2TzrmeeVhQ
	 JQ8+Ig97RSj7nZkkygQsM3T4LV66HwJX3KIKRW3o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C345CF80587; Fri, 15 Dec 2023 14:04:02 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 085B1F8025F;
	Fri, 15 Dec 2023 14:04:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CCEBF8016A; Fri, 15 Dec 2023 14:03:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::60f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8B71BF800D2
	for <alsa-devel@alsa-project.org>; Fri, 15 Dec 2023 14:03:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B71BF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=OyqkOq1t
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DcSen+n4LZ9Jtv7YQH00QvAch2fUBZ3jl+TN/ffYqzQuD6pbJO/Mny0oOCFrLrJFzVx5z7rB0r9mLeMdsrIm+S04UcQAdhfEiE2Y0N/Pil4/sdWAP7kSzwF+wRsY6pJAUP1NRjeH0InkVqrzn57Y5JSrkW8rLkRJrxDdpECXn5DvZGsbhwsvonwpH5syAnXuoE5ZwjAnk1whdJ/PqdZ4FlF3Ons8Xb4/By+T2o3H7mM7cueieR9EM+4k+B3swMej+D3/F+/os5NN9j4UzkocFpkLotavVaAyrv7Yw5pvPckZdAb24SeBD1DtKdUATXJ3GUDqwbgLyzU8zWEtbWCztA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WT+j2wqW/88Zx7q4M6l3IyxbtUO4IUc0tPi6gfAMLy4=;
 b=IdRfiqR762npydXhdkgckLjR8HFk6CEUZY+nyTrN7as9xJHNCosS3jK1NcHTX/q5TPwx4jxx4chHvrLVKPRh7z5iMwbCEZ6RkZZz0WyamnjtEcZQOQk2aEdHHc7TL0WxudLUtCJr+ZA8pdWNjIMmwcgrbzi+UVe5LvUyXOM1kOnM7A1EegtT0frY/FTGGeQMJAKIRqr9sPJIc5qiW0WTHspRNQ8ENnBuQFVEwk8dB9M+eriekYNh3AqE8NBfxmYwf6msrfUHtrkE48TZ5Yq7dJK04vRBbkrujzRB9HgXTlrfKXtcTFYTIP2ktt21d9M/6xbOwwnj2NsLp6gSNpLPgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WT+j2wqW/88Zx7q4M6l3IyxbtUO4IUc0tPi6gfAMLy4=;
 b=OyqkOq1tM/UUgaXnA+E9+QraNGziOnWOF5O5sbvso9m07JssWdD4E6l84tOGCCT8ObWe38TFGre7Fm4UPHXooNU6J7nRB1BAfp/7cA/7WSCIeI8o2eK8K8eOGfjt8CPAmgmiGOv7fCHHZVsTxqtrDHsTecVlUGPxafCpMAUzAwg=
Received: from CY5PR13CA0062.namprd13.prod.outlook.com (2603:10b6:930:a::13)
 by SN7PR12MB6930.namprd12.prod.outlook.com (2603:10b6:806:262::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Fri, 15 Dec
 2023 13:03:46 +0000
Received: from CY4PEPF0000E9D4.namprd03.prod.outlook.com
 (2603:10b6:930:a:cafe::e2) by CY5PR13CA0062.outlook.office365.com
 (2603:10b6:930:a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.12 via Frontend
 Transport; Fri, 15 Dec 2023 13:03:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D4.mail.protection.outlook.com (10.167.241.147) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.14 via Frontend Transport; Fri, 15 Dec 2023 13:03:46 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 15 Dec
 2023 07:03:10 -0600
Received: from amd-B450M-DS3H.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Fri, 15 Dec 2023 07:03:06 -0600
From: Syed Saba Kareem <Syed.SabaKareem@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <mario.limonciello@amd.com>,
	<posteuca@mutex.one>, <bagasdotme@gmail.com>,
	<venkataprasad.potturu@amd.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>, Nicolas Ferre
	<nicolas.ferre@microchip.com>, "open list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [RESEND] ASoC: amd: acp: add pm ops support for renoir platform.
Date: Fri, 15 Dec 2023 18:32:42 +0530
Message-ID: <20231215130300.1247475-1-Syed.SabaKareem@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D4:EE_|SN7PR12MB6930:EE_
X-MS-Office365-Filtering-Correlation-Id: d521bd10-ed5a-4044-024d-08dbfd6e45f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yPLdiK5iavX5BURgKKWbFziBD6iq0+jYLiqfbqKb7yVtvU8/r0zj9KikiAAt8a+/8w0xhLqPmv4EHzUQ/MsDjagSA/eWyNyykw/7nQ83j5QxchopDaPDtoh5e6IpUW2iPEVGXeKcog58QvfGrgr2byy2d5xErDrEzTU6WIki5mst8P8pA+4ksVLq3/IS9mU6bO5v3dy4DfKir54wMWbd6NTjSJigN/u1r1wXglTImcJqgui1Cxir1ixDR6sJtnFTHC6tFPZGmeAsR9+TTbWmyShxg96/gQUKEYcw/G3gMfTqQK7wPO1rnQwVjQ3XtJMlgkFGsfqvB+LUyRa7hr67WkhYBtaq6YTL+J1h2IkF812O9YEogzbZn41PZnHLSPL98kfQTPlPpcgsjfi2yn9NR8Epf9x3dQl9w+Z6r3WUq1lKjz4e2f57H+HnROjoGlIbb5Ei/tnTwMFl5ZRzk23KOzxzkRJDM/6ZfAjyXx/N864jOu0BAEup0fD1nVasohdQvuLq/LaOOAi11LNNsBM45pBUDyUO+1oQyLXqxawEB/EYlwfyLwEldJTS65mAEjB6xiU713s5D+Hlc8udA4+hso7Cy6jvsbX08T3I0zwRNL2M0UMWOBm42vIHEjcp0JFzSv4cDq5QXACKqX8/PC1lZiN7LhjgAFJD1nU4F+6KzkDztex6C5fMfRdQaTfNuZPNROX+5RT3VNRMNi46Q1GV9ZZBkaUmrFz4emQXKciti4mckHW44ZVSETtWBhy0Q7wiMCfB4uQR0EUCPu4oumhi4g==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(39860400002)(346002)(396003)(230922051799003)(451199024)(82310400011)(64100799003)(1800799012)(186009)(40470700004)(46966006)(36840700001)(4326008)(36756003)(70206006)(54906003)(70586007)(110136005)(316002)(426003)(1076003)(2616005)(336012)(26005)(478600001)(7696005)(6666004)(41300700001)(8676002)(8936002)(5660300002)(2906002)(7416002)(356005)(40460700003)(47076005)(86362001)(40480700001)(81166007)(36860700001)(82740400003)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 13:03:46.4009
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d521bd10-ed5a-4044-024d-08dbfd6e45f7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9D4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6930
Message-ID-Hash: MERICAT5S6YBDW3ZNQE2X3QQ22JXGTDF
X-Message-ID-Hash: MERICAT5S6YBDW3ZNQE2X3QQ22JXGTDF
X-MailFrom: Syed.SabaKareem@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MERICAT5S6YBDW3ZNQE2X3QQ22JXGTDF/>
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
 sound/soc/amd/acp/acp-renoir.c | 37 ++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/sound/soc/amd/acp/acp-renoir.c b/sound/soc/amd/acp/acp-renoir.c
index a591482a0726..b0e181c9a733 100644
--- a/sound/soc/amd/acp/acp-renoir.c
+++ b/sound/soc/amd/acp/acp-renoir.c
@@ -20,6 +20,7 @@
 #include <sound/soc.h>
 #include <sound/soc-dai.h>
 #include <linux/dma-mapping.h>
+#include <linux/pm_runtime.h>
 
 #include "amd.h"
 #include "acp-mach.h"
@@ -196,6 +197,11 @@ static int renoir_audio_probe(struct platform_device *pdev)
 	acp_enable_interrupts(adata);
 	acp_platform_register(dev);
 
+	pm_runtime_set_autosuspend_delay(&pdev->dev, ACP_SUSPEND_DELAY_MS);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_mark_last_busy(&pdev->dev);
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
 	return 0;
 }
 
@@ -208,11 +214,42 @@ static void renoir_audio_remove(struct platform_device *pdev)
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

