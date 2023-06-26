Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EF673E14D
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 15:59:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECF92E7F;
	Mon, 26 Jun 2023 15:58:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECF92E7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687787946;
	bh=pxVEIZ17WqFcpZY8z1C60Ryv4TgMD+t0u4d7C+kbAQk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LEU6BaSBl8x4MlVRhgCvn2t3MReXf29zLGF/jW7/RabThmcYWICetjiwjT2LdE4a8
	 0qGHtnrllp4pH4fw2i2+bUKRGq0bNXnsLfsHSz6FyhTrKaJbKrjc5dffOIv1kjl1b0
	 22CpmF0d/L88ekrThI6/GsSZrv5YSIIQzBtiTeSE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DC3BF805C2; Mon, 26 Jun 2023 15:57:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CA2CF805BD;
	Mon, 26 Jun 2023 15:57:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1FD9FF8057A; Mon, 26 Jun 2023 15:57:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::604])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DE3E3F8057F
	for <alsa-devel@alsa-project.org>; Mon, 26 Jun 2023 15:57:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE3E3F8057F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ytdCZywe
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NFD3iYK+efdKwRFHPeM0doxbL7aeBHnNAkN1QJTfSxUq36cy9fJadhEBtJSASNYZk47mTOekOzoFSyHu0WduqXEhtjkxAyZsbfn/Drk+q+fr1nd60ZrBgnNUkRc6JfwHvusVA2DIwGXyi/5vCDxSf4yQrf01bi67FXETS8frCZHBwsZ72PLoy3LgiS16lmlIQMgMf0PlSblOLmRONVsCJz7kWDtS2KCl9nOuLQF+UhDeisTypWG6V7+hqIovxGwNodqV6BRHlA6wfRXly73mVtqHUWmodAQV4v+PMRps5zmivxkAkRK+b8o+WRyhrwb3hjq5DxNrUz/jvmTDZ+q1QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iBy8FZtzhflK/O11biPfyMuMDcZU0bVlpYPp66Nv80c=;
 b=bDoAafdjy/TLv/MfekvjxjOekf2u31kOPk/IT6NpQFsAARtw3rV2bYw0rC327DzdiCTPYHPffERt03Vv5S60zMCxoPXlXabCwruYIz++aAVS5csbFa7ZHlrRqI3RcSamJwwcHTvYvzFry6vWPjyvMHWewov0+kfWes4FqI9yGnEzreV7aSWGwPPqeK+3hzd8Fc9kjlUwbmwIRzwwJuEW9KuHP0hqBdOiM20AuT7h5QMg94DRgcuRUJ7ci+5AgdnRiEa+cosh+naXeq0SwGjIXHJCwhdlsQ0YwFb51U0h/R+bRYTefiQ1hfD6FGcZBpQNlvbGl5nxM0NZePhH1AxGsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iBy8FZtzhflK/O11biPfyMuMDcZU0bVlpYPp66Nv80c=;
 b=ytdCZywevSpL9TvBio4cfSl5tL/7sswFpzBBvBfd8NcFRS/7Gf7DPQ14q7KECOci0NvJ/yw8oJ5T9dZ2+02TLjeRkUMQx8GNv1HL5nR45TjfTayZRKb52vjqYxwXeqUYwMyYcoaISGlaz4sRB+Q4CdMsMK7RC+wR6qbGZdGG2ro=
Received: from BN9PR03CA0301.namprd03.prod.outlook.com (2603:10b6:408:112::6)
 by CH2PR12MB4118.namprd12.prod.outlook.com (2603:10b6:610:a4::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Mon, 26 Jun
 2023 13:56:58 +0000
Received: from BN8NAM11FT099.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:112:cafe::ca) by BN9PR03CA0301.outlook.office365.com
 (2603:10b6:408:112::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.33 via Frontend
 Transport; Mon, 26 Jun 2023 13:56:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT099.mail.protection.outlook.com (10.13.177.197) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.47 via Frontend Transport; Mon, 26 Jun 2023 13:56:58 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 26 Jun
 2023 08:56:58 -0500
Received: from amd-B450M-DS3H.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Mon, 26 Jun 2023 08:56:54 -0500
From: Syed Saba Kareem <Syed.SabaKareem@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, V sujith kumar Reddy
	<Vsujithkumar.Reddy@amd.com>, Venkata Prasad Potturu
	<venkataprasad.potturu@amd.com>, Ajit Kumar Pandey
	<AjitKumar.Pandey@amd.com>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 09/10] ASoC: amd: acp: move pdm macros to common header
 file
Date: Mon, 26 Jun 2023 19:25:13 +0530
Message-ID: <20230626135515.1252063-10-Syed.SabaKareem@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626135515.1252063-1-Syed.SabaKareem@amd.com>
References: <20230626135515.1252063-1-Syed.SabaKareem@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT099:EE_|CH2PR12MB4118:EE_
X-MS-Office365-Filtering-Correlation-Id: ce468f8f-d0f5-4fd7-34a3-08db764d3592
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GtmOSUB7WGO3mUZS3t23KzfEwP64MXOerAd3ZgsRfuUtMf2X8h3YUC9CbXo44nyOskp13LO0a3OiAo1qSH7CAM0j19s6M0xWdJvjer/1cGUf/NUH9yXUupF6hffG0fJ8/2S9h3dIr1krjkt9l9DC5MJHJwSpA08oYkV99Gq8/mtNR6G3gkDfgFUHAjusEujJ2ShZ/em0E+ADWXuNidRtdp7lfRVPwDGCW+m6WT6Xf108wMftYDAnGL8ntUaY+EdcvFugtJVZEK4blLYsrI2/zWe9Scb0k5e+d5p1HBcj6j935G0RMzjDpz5fcVGiDWEV+sjhIZFcCuzie6XzknHvnZQ3IyGi/4BdzMqmzxeayCd5KRVI/CB9sSu0rCbmhs5w4NBmm9M0HE9fWSgFVrVf9kvYM/ihtUsi5j75do/VcTOL3HYHEBO7YyGRN1lQ80lSdV96yoOv1hokYgiLESwMqIF6YCALUcPtx4fTh2ImZ/l+35KOb+f80aWnSRSBe/SHRTVboHeFyLLZJIDWdnZhbhAj+mO6mYJ1QzxERCryf7ZGXkbegiVZ7AsGx/3a9CWAp3cdRrSJv/ZI0/eVlhCxZX7vSYtzSiGeUv+H2Qtd4/6HCEylUl9qZFREG2r65uUwyfwHao0qgAhg5qzF3zhZ6gdEeYxLeAqdGx6/kXVIkpgqywfc2YERWF8o6DLe8Si7Dds6s9pkXkd8fEFR4fpCin1kZ1NLtt8PjKq+BvYrIvQsYVjJ/KhxvxkTLsyXX0iiUcsyJol6J4wIeytU4pfahg==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(39860400002)(136003)(346002)(451199021)(46966006)(36840700001)(40470700004)(2906002)(186003)(26005)(1076003)(426003)(47076005)(2616005)(81166007)(336012)(356005)(40480700001)(36860700001)(41300700001)(40460700003)(83380400001)(70586007)(70206006)(8936002)(8676002)(36756003)(82740400003)(6666004)(54906003)(7696005)(86362001)(110136005)(478600001)(4326008)(316002)(82310400005)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 13:56:58.5921
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ce468f8f-d0f5-4fd7-34a3-08db764d3592
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN8NAM11FT099.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4118
Message-ID-Hash: BEZVAH7W3GR7Y5QXQACUEKIJXWPRY62J
X-Message-ID-Hash: BEZVAH7W3GR7Y5QXQACUEKIJXWPRY62J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BEZVAH7W3GR7Y5QXQACUEKIJXWPRY62J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move pdm related macros from pdm file to common header file so
that it can be used across different files.

Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
---
 sound/soc/amd/acp/acp-pdm.c | 12 ------------
 sound/soc/amd/acp/amd.h     | 12 ++++++++++++
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/soc/amd/acp/acp-pdm.c b/sound/soc/amd/acp/acp-pdm.c
index 2833d2b7e596..f754bf79b5e3 100644
--- a/sound/soc/amd/acp/acp-pdm.c
+++ b/sound/soc/amd/acp/acp-pdm.c
@@ -25,18 +25,6 @@
 
 #define DRV_NAME "acp-pdm"
 
-#define PDM_DMA_STAT		0x10
-#define PDM_DMA_INTR_MASK	0x10000
-#define PDM_DEC_64		0x2
-#define PDM_CLK_FREQ_MASK	0x07
-#define PDM_MISC_CTRL_MASK	0x10
-#define PDM_ENABLE		0x01
-#define PDM_DISABLE		0x00
-#define DMA_EN_MASK		0x02
-#define DELAY_US		5
-#define PDM_TIMEOUT		1000
-#define ACP_REGION2_OFFSET	0x02000000
-
 static int acp_dmic_prepare(struct snd_pcm_substream *substream,
 			    struct snd_soc_dai *dai)
 {
diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
index 82e0684cb284..8dc663c8d98a 100644
--- a/sound/soc/amd/acp/amd.h
+++ b/sound/soc/amd/acp/amd.h
@@ -111,6 +111,18 @@
 #define ACP_TIMEOUT		500
 #define DELAY_US		5
 
+#define PDM_DMA_STAT            0x10
+#define PDM_DMA_INTR_MASK       0x10000
+#define PDM_DEC_64              0x2
+#define PDM_CLK_FREQ_MASK       0x07
+#define PDM_MISC_CTRL_MASK      0x10
+#define PDM_ENABLE              0x01
+#define PDM_DISABLE             0x00
+#define DMA_EN_MASK             0x02
+#define DELAY_US                5
+#define PDM_TIMEOUT             1000
+#define ACP_REGION2_OFFSET      0x02000000
+
 struct acp_chip_info {
 	char *name;		/* Platform name */
 	unsigned int acp_rev;	/* ACP Revision id */
-- 
2.25.1

