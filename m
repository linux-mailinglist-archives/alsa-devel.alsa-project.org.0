Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D480273A4FB
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jun 2023 17:29:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E02FB847;
	Thu, 22 Jun 2023 17:28:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E02FB847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687447782;
	bh=aJDIrlpJaogXrlZvww+cNv5yDAT/rm5vPXpBBkSP/G4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WvJXzXrVVnnKBicUNn7dXtwbWdsA/R0cIpGH6I9XEfC7afPnYgTqqipoGIUBoegPp
	 vEx77zOXqlYazIxozkr6yB9oqTWmZZM0bINfUOxh9U0jgFNyPOvgeHFdDBZiMfW8/6
	 vBpXJ4kdfU6+JnFVk+5nSEzyidg3tnwOwvigxrlY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38710F805C3; Thu, 22 Jun 2023 17:27:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EE30F805C3;
	Thu, 22 Jun 2023 17:27:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0076F805AE; Thu, 22 Jun 2023 17:27:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 40616F80141
	for <alsa-devel@alsa-project.org>; Thu, 22 Jun 2023 17:26:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40616F80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=bXxJ1uA7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UNwlF4D1CjahwXloZYuNObgG+5yOAsh6Qhy8ns7kFzZexOSUz12ZekgYHTudkvpKyxoBwVKlgNVpNFeeIRFSB5KHk8qimGIZfKveS+rtV9Ht+E39eCX5vsgYz66EVA3xFvF9FgaF2+o5vS8xWdH2tnFIi3eW9hNNG0uKdcuWrOu8jc4gpxxLevFIyR1Dc2RRMlWvtSubA74D/O9VYU9yjbJhbSNNFUa5YQPAC+CKVaPAw8yLHUOZkTCzugIQHKNeqFioFVEnqNmiADIO8aOf9iQaUyMYb3eGo01jrZpbC3k1Nut5JCU+hOUE8DjwnxJ16eOiq49lHUe8tEH/AJ28bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RuC/p36abO8JEZCdYis01V1LLwMVRik6s9LS9KgnaLE=;
 b=LNKaO6SeawFTKRPZitVsLHzAtgGxZetvG+WIHDJvoW1zdrwbjIWl1SupSi3Apjd9RgDSp8XLu5i+uYL+riTUEUmrXKkdOOWaijbEx0+3UTcGG2uNFzy8925La0iYXSgbNhuG1Fqw78nPfGgncvYyZ8HsxzHfPxi4wRRfvjZhVm+Sev3SltvWHS5s3A15vs81r0NOsdTomuAPsydrxt0B77Ng+hIXcZ+Qk66oId10SyOTwq87tnCQcsC9fh5v5ztULFSrcj5Qvv2t20ytFHG4Hr/n9AefQ9J28rZS8Iu2zk6aafwkA7s2DEpIyUsN7ph1yTBKPNE7j2rppvyI48nT6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RuC/p36abO8JEZCdYis01V1LLwMVRik6s9LS9KgnaLE=;
 b=bXxJ1uA7K6HS1gTJ3AxfFL81n5Kz9IJEoVU8J5NajgVABodJBGUPOqbO9790V/l0HrSjm22bvK6gDTe42SOVv6IbOhcxdVOXOcoK99nQLYZOkA32/Yl3RTpbKmb2oAuKHfAyI/hbza4nThjMLZBzGekhR0mol5jh6lXSOX1Kdtw=
Received: from SN6PR01CA0025.prod.exchangelabs.com (2603:10b6:805:b6::38) by
 MN2PR12MB4584.namprd12.prod.outlook.com (2603:10b6:208:24e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 22 Jun
 2023 15:26:52 +0000
Received: from SA2PEPF0000150A.namprd04.prod.outlook.com
 (2603:10b6:805:b6:cafe::29) by SN6PR01CA0025.outlook.office365.com
 (2603:10b6:805:b6::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24 via Frontend
 Transport; Thu, 22 Jun 2023 15:26:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF0000150A.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.17 via Frontend Transport; Thu, 22 Jun 2023 15:26:51 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 22 Jun
 2023 10:26:51 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Thu, 22 Jun
 2023 08:26:50 -0700
Received: from amd-B450M-DS3H.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Thu, 22 Jun 2023 10:26:47 -0500
From: Syed Saba Kareem <Syed.SabaKareem@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, V sujith kumar Reddy
	<Vsujithkumar.Reddy@amd.com>, Venkata Prasad Potturu
	<venkataprasad.potturu@amd.com>, Ajit Kumar Pandey
	<AjitKumar.Pandey@amd.com>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH 09/11] ASoC: amd: acp: store the pdm stream channel mask
Date: Thu, 22 Jun 2023 20:53:55 +0530
Message-ID: <20230622152406.3709231-18-Syed.SabaKareem@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230622152406.3709231-1-Syed.SabaKareem@amd.com>
References: <20230622152406.3709231-1-Syed.SabaKareem@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150A:EE_|MN2PR12MB4584:EE_
X-MS-Office365-Filtering-Correlation-Id: ddc39596-c3f3-4893-39ae-08db73351a75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FGzXHGqs+Z4Q0p/f5r7Nucx14zhPgtwdkiBoxRbWG6sz3aDSppsn9SfHPiqC5VkuS2qngPxuZhggGrZk0GH242Ly230a2VtFsO6J3zcysxRPHdXRfAFK3xoCh2OsBhcaK9Vyh1Sb0KDHB3GMtbyI5htK2BebU661sorxTNO870hwIVRLmsPso3ArvHglxk20vYS/p/FBvjsjJ1cg64AWV5mWj9F4SOAoUuA9tTk2xR/yx86YpZugdFNJwu7IsMGUw5vws356OkQQWRmS0v18U7ITtNkFrPLOAtzx47LmqEVCH4rYygySzc8s3cbCRFnR08k7HzlEKj7FfUXwOqEFW4ugNbhsbbo0QotIMacp1EAJrQagA4FQB0EeH6LfNuMWmOun1XZwl4h3Swk0yMoEgu8OHPOS90UUlFKqZj8RpIXKrEtzpRqEb2FMnycOTODRaCO2rZWrygzr0n7bLC8EA0PaQ6CgAgMVefgndAzdpE+8669UtrXFeN5xnU77v5kv6MSIugxXbG64KtbIsj6h85AQuCM/3+e6GkTymS3LHqOSiBTGu4eRFqUG0lMIouxqCo2ty/APCGnNNL9H2kxkOxfJaadSa3j/A/x/FdUTIwxnp7MCie9QT1qRq42RvSTVU8/4UU6w51+dTpOY0J+89oEsD62qxlEuKGD02OehsatHN72w7oiKvP9UtBKx1dL45IgpVJhqQdBlco+q6bkE73KOx3ziYrg9hCHAjt6D32ZFZVpvyQEgbMvEnA3FPlEURbAFuigpTG7c25ETYbPO+Q==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(39860400002)(396003)(346002)(451199021)(40470700004)(36840700001)(46966006)(40460700003)(110136005)(336012)(2906002)(186003)(2616005)(426003)(54906003)(47076005)(36860700001)(4326008)(316002)(70586007)(7696005)(6666004)(70206006)(478600001)(26005)(8936002)(1076003)(41300700001)(8676002)(5660300002)(40480700001)(356005)(81166007)(36756003)(86362001)(82310400005)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 15:26:51.6783
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ddc39596-c3f3-4893-39ae-08db73351a75
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF0000150A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4584
Message-ID-Hash: E2QMMQYH3BJP72ROIBV2Q5A7SOQQ2CUZ
X-Message-ID-Hash: E2QMMQYH3BJP72ROIBV2Q5A7SOQQ2CUZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E2QMMQYH3BJP72ROIBV2Q5A7SOQQ2CUZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Store the pdm stream channel mask, it will be used during system
level resume.

Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
---
 sound/soc/amd/acp/acp-pdm.c | 1 +
 sound/soc/amd/acp/amd.h     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/sound/soc/amd/acp/acp-pdm.c b/sound/soc/amd/acp/acp-pdm.c
index f8030b79ac17..2833d2b7e596 100644
--- a/sound/soc/amd/acp/acp-pdm.c
+++ b/sound/soc/amd/acp/acp-pdm.c
@@ -135,6 +135,7 @@ static int acp_dmic_hwparams(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
+	adata->ch_mask = ch_mask;
 	if (params_format(hwparams) != SNDRV_PCM_FORMAT_S32_LE) {
 		dev_err(dai->dev, "Invalid format:%d\n", params_format(hwparams));
 		return -EINVAL;
diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
index 38c152c6c8c6..82e0684cb284 100644
--- a/sound/soc/amd/acp/amd.h
+++ b/sound/soc/amd/acp/amd.h
@@ -164,6 +164,7 @@ struct acp_dev_data {
 	u32 lrclk_div;
 
 	struct acp_resource *rsrc;
+	u32 ch_mask;
 	u32 tdm_tx_fmt[3];
 	u32 tdm_rx_fmt[3];
 	u32 xfer_tx_resolution[3];
-- 
2.25.1

