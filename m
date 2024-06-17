Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A4F90A74A
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 09:34:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DD06839;
	Mon, 17 Jun 2024 09:34:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DD06839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718609678;
	bh=vuuDorv5yU9uZ8nmuswUrwf/rhSQ0hb8772xklQuG0w=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sbOn1x9yzinM+n33JcuOobLm6y97tHfV829sK4oVhCkQJdz7DJRDKV3r+LsHOMiMs
	 Z1VAKceFpO56GJ4j2q8V725CK7c/h6AFjxc8oLQuIWaC63bXJ2aWXDzdf2cgwsVcv/
	 C6h358sLTGQ+C/XMHs22Jk6qD8XwqggPcYRZ+4kU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0EB8F80266; Mon, 17 Jun 2024 09:33:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3840EF80621;
	Mon, 17 Jun 2024 09:33:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94CB6F80269; Mon, 17 Jun 2024 09:30:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::60c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E7539F80266
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 09:30:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7539F80266
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=WLaM5Dc6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OCCmaQMORoesPxySth67pKahtY9+IOX+11U/u5bZXX5txFuzgmmAnZ48aLFhbjzyT63yOLwy+ZAiUROkCFK016YtJbj4e0Csc9rBZ+4AU1l+n9NR1QImoC/YQuXKFM8qGnv52gWFbsGzHTLX14toNOA7OHGt9qeFhpZ80w0CT78YZ/cDGHjrRtgCGlu1NLgSYT1CzXhGRw0kqUFGEg4Frz+rVhBHx8LyV2vuXc98nKWHY/651bKNTpIDJrAVDC73Ra/zq8N+/6edh919vThuRgDFWvE1YKrFd9iUt9hkDWb+g4pWPB1BP66BJoxIkJQAs4b2W7pX2+jO6UdOROCwjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4xfCBmWCH2rtX3qmdeu9aouZBkbzPtOIQq7kEbX0YY=;
 b=XA2nPt3KcK9Pf7flhlbtXpQuQ0mNC6pYakIdFbjiyQRMs0HI/JP3e5GS7yxQO0PUeXmLPx6I7tQK/GRrDvQNytvxuphoxLsvqVP26m7zb7LT3F0ztNtEfefcrsHEQS69GukD/yB4xFb6/vjgy2TA8vGd/e49Tj7QeiHOvoZmzk3Uqo5cq2qFu0KRu0Ho4Qc08Xp/VCY9vXO5IUxrdZgF4v4gwLD0EZa319q4X8mwAob6iuY4R7sTr+5EyMr3ia7GlQrO6e8Ww7CzO04XiE3El9IuARrMkuR/eNRGKjkEZN5KMVawh+aakwUvojsIKeKSEK+trzTSk5GRJEMPFpeMPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4xfCBmWCH2rtX3qmdeu9aouZBkbzPtOIQq7kEbX0YY=;
 b=WLaM5Dc6DWhDP3oa3baGkj4DeZMT4NNhZ/h13TvScphzdPOxocOuYmEIfsTKKjrZQ6BAFRwD3tBO71WXRL3Qaeax/QkATVoADQ+F9VnlcuMao2Bc+rLra290wP3My7jR85CHo3Y4zGZ9iAUtafquFozniX9j/kGy6Ph0OYlRFVs=
Received: from SJ0PR13CA0171.namprd13.prod.outlook.com (2603:10b6:a03:2c7::26)
 by SA1PR12MB7411.namprd12.prod.outlook.com (2603:10b6:806:2b1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 07:29:55 +0000
Received: from SJ1PEPF00001CE3.namprd05.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::e8) by SJ0PR13CA0171.outlook.office365.com
 (2603:10b6:a03:2c7::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30 via Frontend
 Transport; Mon, 17 Jun 2024 07:29:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE3.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Mon, 17 Jun 2024 07:29:55 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Jun
 2024 02:29:54 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Mon, 17 Jun 2024 02:29:51 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <venkataprasad.potturu@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Syed Saba
 Kareem" <Syed.SabaKareem@amd.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, "open list:SOUND - SOC LAYER / DYNAMIC
 AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 7/8] ASoC: amd: acp: move i2s clock generation sequence
Date: Mon, 17 Jun 2024 12:58:40 +0530
Message-ID: <20240617072844.871468-7-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240617072844.871468-1-Vijendar.Mukunda@amd.com>
References: <20240617072844.871468-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: Vijendar.Mukunda@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE3:EE_|SA1PR12MB7411:EE_
X-MS-Office365-Filtering-Correlation-Id: fb239c52-b150-4a0a-16a0-08dc8e9f48e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|36860700010|376011|1800799021|82310400023;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vvMIv6T+i3mola8in2q6NmY7RDzGKPdACJJAbP3LMxP6c9MhGswzxQa0gwj0?=
 =?us-ascii?Q?C5rN7qfS71FECD+geIi2IhG+L0XVNaDWIHQ7CaSXTx+T6U7AqjaiY+2pWJK6?=
 =?us-ascii?Q?6cOqP25HhGBvucIsin71TJYBKuzWBg0kWaC/6WRlTenblZtVB6aFlDq4wkzb?=
 =?us-ascii?Q?VRoaYj4MknXGTqBxjnwiKRVq+PRBhEikGL4pQhKq5RxyAhFmELn9oK84M9id?=
 =?us-ascii?Q?b/CIpMGAW67qtATN57sIyD69vOHFBRcEl5uZE7yMFUUSUCa/tQzxVeQNsi45?=
 =?us-ascii?Q?2C+f7bQ9TUykD7NIjwILQHseBAimJ6YdLmB4R/bd/IQl11wGECcYCwxllUkG?=
 =?us-ascii?Q?UHrzBBhyQKltY93ASVWFc1nDqlANnhIigU0jPtM0R2xcFlD1Z7VX1xicnBaR?=
 =?us-ascii?Q?hO09n7VnsSnGqs0XT+dIgBz2iate0cyFk0+AT5gwzeZwzPCvWcEVRliBhhbk?=
 =?us-ascii?Q?eDtcR3q/i4A9IpOVGE/P89waRY5T75GuApLY2JlbhhSb88BoAiHUEYY9civf?=
 =?us-ascii?Q?BewBJvdPDxR+Shix9Utzgz5yfmExgpvBM4JfIfiZ0FVdzvze52ZG85mX7h+Q?=
 =?us-ascii?Q?F4RbAs9IDiXC5q/TD3FCGt5oGb4hnr/gk/RpYaa+CDNj7XpfP5XTWk0ubV94?=
 =?us-ascii?Q?b/rr2fC1wJa5DPi16MTqCXVIHw7o5/+Hf1/tMEfwLSDv6c8eGfdUD+5hIEMN?=
 =?us-ascii?Q?AQNfkeS0AFwapgMAeg39fOhvLW4eyuA2rQHM2kn7++lxdJKk26YRE9UOW6tW?=
 =?us-ascii?Q?3C5enqHPx8U2OiE1+R1HMFSCf1m6nHRm97mCOUVNHJdgeh4vsSsdvb2xt6LG?=
 =?us-ascii?Q?vlb5yeeB2gAfXmrv8JYkSgI2J4oL+RvueJK3ZoFAG/+KJ3SB9SaqA3y4exb3?=
 =?us-ascii?Q?q5nY06vMl5kw4CbcxbtQejbuGByF3Sp5S7MsPuIOX9MezBiUwmv5aVGSOgI1?=
 =?us-ascii?Q?u37aJUWFZcW2pU7xrKgyae+iZOIXoEI9WweGmzLIjVuJtApx/GF3PhWpu2Mj?=
 =?us-ascii?Q?+MnUtJ5Qe65537/8NrC1MOG9PRYfjTz/5I8fVGBdUJnM4ip5kvJ1Pi99BGKp?=
 =?us-ascii?Q?c6VabbYYOqgMCuUJizbSZeXWBXH/0M4Txml1W2cpj6FFEbsyZMmWtaWe70z/?=
 =?us-ascii?Q?a+h5WjYjY/BjUBmNccdwD+RUijtNWmCIYrph4vKU4zA0OI2Kj5hgBoUAj3g7?=
 =?us-ascii?Q?p1rXW9XkLRYcwssRaqgH+WuXK10HHixGLgNVLoObxqyWZ/+lFpzV81FjwRuY?=
 =?us-ascii?Q?LPsEXqsmeDgVlBLOOFdNSCzcaP9eKzrXh9zwmu4weUQR46U2smJwQEL7mxJU?=
 =?us-ascii?Q?lveir/3m8rn2JXu1x2mFppSWXCSdhQpYeNtM5Ia0r3jtbw+e91iXta951W8h?=
 =?us-ascii?Q?5BV32ahqh3Dm6rTu8ljwDFPfHh8JQZ//s6LVXdvNdWv8ISZxYw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230037)(36860700010)(376011)(1800799021)(82310400023);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 07:29:55.2541
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fb239c52-b150-4a0a-16a0-08dc8e9f48e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7411
Message-ID-Hash: EDWRYSTWAFYG5BXLPM6ZDFR2D6EQ66EW
X-Message-ID-Hash: EDWRYSTWAFYG5BXLPM6ZDFR2D6EQ66EW
X-MailFrom: Vijendar.Mukunda@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EDWRYSTWAFYG5BXLPM6ZDFR2D6EQ66EW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

I2S clock generation registers should be programmed before starting the I2S
dma when I2S controller is programmed as clock master. Move i2s clock
generation register programming sequence prior to i2s dma start.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/amd/acp/acp-i2s.c b/sound/soc/amd/acp/acp-i2s.c
index 7da414bc3b96..88985e9d318b 100644
--- a/sound/soc/amd/acp/acp-i2s.c
+++ b/sound/soc/amd/acp/acp-i2s.c
@@ -369,12 +369,12 @@ static int acp_i2s_trigger(struct snd_pcm_substream *substream, int cmd, struct
 		}
 		writel(period_bytes, adata->acp_base + water_val);
 		writel(buf_size, adata->acp_base + buf_reg);
+		if (rsrc->soc_mclk)
+			acp_set_i2s_clk(adata, dai->driver->id);
 		val = readl(adata->acp_base + reg_val);
 		val = val | BIT(0);
 		writel(val, adata->acp_base + reg_val);
 		writel(1, adata->acp_base + ier_val);
-		if (rsrc->soc_mclk)
-			acp_set_i2s_clk(adata, dai->driver->id);
 		return 0;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
-- 
2.34.1

