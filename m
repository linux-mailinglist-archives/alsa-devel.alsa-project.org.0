Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE48A591AB
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Mar 2025 11:48:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A54DC6074A;
	Mon, 10 Mar 2025 11:48:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A54DC6074A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741603715;
	bh=1LYF/CronFq5oDVZBhIjFOBiLHBbwh6fx6BQAHE1e6s=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gQO833jc45U2TgPG7Eaiprx2KVqBo3BZ6krd+vSJnEMASHBYumH5INGdYWocFQisw
	 T2A12OMRoIqYhBzPgaGXFilyG+KkImCejd9W3HTbQBLHa22iOMaJEW1ek5IesIGSew
	 RKMmEWnWkhaq5lVpGTznzjjIYPtTlVr6W6LKnfdw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 997DFF805BB; Mon, 10 Mar 2025 11:47:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87FEEF805BB;
	Mon, 10 Mar 2025 11:47:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C692F8057A; Mon, 10 Mar 2025 11:47:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::60a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5663F801F5
	for <alsa-devel@alsa-project.org>; Mon, 10 Mar 2025 11:47:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5663F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=uWUsxvQk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G9L/Zpk1mkkv4+0L0hYU0uyGy6jx8/0ye5W7gyNmsoEW/qpSUb+Zs5yHlMy98tEH7FUqL3GzSo1Cf8wY7ybc1CckvC7ZFIQEOQPCH4d1Kn57BBjwiBD3DE35tGSjtteCuM0MT1mahkKpnVZp0996vB14wdNYCRJAbk0oJ38OYUzaObB1pzYXtcJ4QIkZMNewU+TADZW0HFNpFgT1LnA05T1kWK/AUQWsM3hskVnzosano2ZeTn7bjHBQfhq3dALStyz+XuedpqB1CojaM2vuKaeEBIYir2a9S/8C97ato5wrK4326fUxOTkY4oIypbTGFsYT/ERuj00W17rj059UjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mrlBk4VYQiqG2ldRJTofDTELKh7ctotu73/UWkJ0glg=;
 b=SkeDC2zuxeNICdrg5iMVTGabx6iafgKpEf7ZvLxJHCRfhqex1sHBFxAQwz3ZNUdyNrM5MmrCYSt5fvrEnK4nOxzfUNaT0CJg6nokVo4kj44r/+1hmbJzNcNi0LK/QklvEYWwVjaDdg/qBs02uc+D8Ab781QYvpDs4hl7k77po2obhMHRz1Lc3gDbDpkukTpopbxTDpNUCbpdgZEMmUxRujZ7ng9WoDG37H18XC97ZpBo34Xqaq6L0cPHJlwOuuDenOsijd9J8wThes1frTwn7FI1MX/9AO1BvxAA8WyBJ0r4xdYfMyE7S5xXZ8ujZ/xvpFmEtKeDTilRVokzc+pa4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mrlBk4VYQiqG2ldRJTofDTELKh7ctotu73/UWkJ0glg=;
 b=uWUsxvQkmtlU4BI5isukuSsw2zyRUvsr7NJKu2r9TFJrxRtKR9RwCY+5R3WWekNYqy8aAGSQdRIOwsHIHrs8FIUBcpfOgpQEKzS8jcrB8RT6Mowz++7z7OsQLy5YtHSJCfGHfHssuAFY7eWAz6z6ToLsD38nsSplVY4KxM+xOIg=
Received: from CH2PR08CA0009.namprd08.prod.outlook.com (2603:10b6:610:5a::19)
 by DM4PR12MB5722.namprd12.prod.outlook.com (2603:10b6:8:5d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 10:46:54 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::ec) by CH2PR08CA0009.outlook.office365.com
 (2603:10b6:610:5a::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.22 via Frontend Transport; Mon,
 10 Mar 2025 10:46:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Mon, 10 Mar 2025 10:46:54 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 05:46:53 -0500
Received: from prasad-lnx-mach.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 10 Mar 2025 05:46:48 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <mario.limonciello@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<syed.sabakareem@amd.com>, Venkata Prasad Potturu
	<venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Jeff Johnson
	<quic_jjohnson@quicinc.com>, Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>, Peter Zijlstra <peterz@infradead.org>,
	Greg KH <gregkh@linuxfoundation.org>, Muhammad Usama Anjum
	<usama.anjum@collabora.com>, Murad Masimov <m.masimov@maxima.ru>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, "open
 list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH 06/14] ASoC: amd: acp: Add new interrupt handle callbacks in
 acp_common_hw_ops
Date: Mon, 10 Mar 2025 16:15:53 +0530
Message-ID: <20250310104601.7325-7-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250310104601.7325-1-venkataprasad.potturu@amd.com>
References: <20250310104601.7325-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: venkataprasad.potturu@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|DM4PR12MB5722:EE_
X-MS-Office365-Filtering-Correlation-Id: 595f6e82-761b-4141-c9d0-08dd5fc0df92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CK/0YsIC4J+1PSuaNjSYvsPk1TWrY3kmD/q5xybmDYi6HTWsw0NgEsP6eMGY?=
 =?us-ascii?Q?X2AtnkZeuXaazjTfr/fcy0Qwgh8fixxvArmz09jWsycbnNaOBkeBAHhy3B19?=
 =?us-ascii?Q?fAjD2EpBMxfVUeGiWc/PT3b6O+EQorDfOmhZrehBU0R0eibTOeh7dO9MYV+z?=
 =?us-ascii?Q?5e04Mpy+wS6J42LVG00xlzC9HU5nws3d2a2s7FUzxk4kshVmGkDmBhM4Todr?=
 =?us-ascii?Q?rov+9RrmndCX4h9iDf2ybs5rwjQIYEjAvK04ksXd84WSHXlYXzDFBScydA7B?=
 =?us-ascii?Q?GM7lcfS/DDAHha5kvQtEeLStqqFAK0dQVamP2AdYKxo6ikmC/6PxExlJGCPl?=
 =?us-ascii?Q?sFWbotqSRId8O3HaMJc+ajggTrWW32mB8Try3VB61+oxnoMAB6hGJ/trG+6x?=
 =?us-ascii?Q?L0aQ/h8KwNrqZXoCwFUZs2R6ydCxdX1Z93z+GCFoTL2IxDzq9s1d/co8Tpdt?=
 =?us-ascii?Q?p0qEFRmziXwYil9kZ9HsOSNF9RXhP+9waRD4vsze4NmWQbBn6ZJlQ9MZ0YOK?=
 =?us-ascii?Q?m260Akdb9syELLmHXFfVZgUd2GeTgWNqzRCNyEY1V0adqwr4dLbyV1E7h5LU?=
 =?us-ascii?Q?NkaOXucjy0KGNXjDlCOToY4+8mXjnH2HywqWU2x007E0wGXJG7Jwty8zcgcl?=
 =?us-ascii?Q?1rHIgRBBiKS7VzR32G7WxpO3PPUEkFnM2qjA14FRihFTgPK12l1soVgjMW0N?=
 =?us-ascii?Q?KM+aHTfQVvrGTm0W6IfW9gz1DIROrle7uTsKbQ8pWzGfYOdou9r0b1DIlDvF?=
 =?us-ascii?Q?O3fF8ZpIPv5t4H5mStOemFKfmIuxAkbDzUBCMMfzsy/Shw2zkJ+ZYiT97IMx?=
 =?us-ascii?Q?J+0Rk2s2SZOkgE7d30YBBBRfCELYgH/lx3klAPoJH4EhUt1iwnf8qSC7fww6?=
 =?us-ascii?Q?GB8acL8/V1QdO1K4n8EfBxOss4o5/QwO6h1C3a7oPIFpPtp38wv6p/Mi4HFk?=
 =?us-ascii?Q?i8JUQh37uGiCqvjfTWDp3ERzLTXL5eHwnSP9KNnVOAVgmldMr75JrJ9+OaCZ?=
 =?us-ascii?Q?RSrgZKunsJs6L14wSdo3EUKGjtz57oGoKlrXGbbSuFTQqvBLc8D6I09WDvun?=
 =?us-ascii?Q?sN2sDEOswN7kpq0UetBpn3R7Hm8EwVV4BDm7QA8YR4Xc4ynfcjB3xaZDAGwi?=
 =?us-ascii?Q?62FsnPJ0hfhGSWJlS+iwGIn+6TmLWzY6G88oFDqRSpJG+MR1J5wkSJ0NTe8k?=
 =?us-ascii?Q?9pDwsYoITx0HW6cQvwNpfl2VBYCbUXOkWYotbyU4n/7mXsqJyHCkHjX0vL2z?=
 =?us-ascii?Q?RF367C/teRKYg8yQkMMwv11f4jwjEjR1vpHipCk55QJXOPZYWdGG+AReyI1j?=
 =?us-ascii?Q?IFRBvPbTIG9ApZy60gpBYa2OoSUNYzhE06flarrYlAcMj+fdRw2yd3zekelk?=
 =?us-ascii?Q?JXY3spsUZDp/Mfizuvi2TvOdVfzu348nTS0Fh6Qt1O1zo5xt5wzOixFtnoFJ?=
 =?us-ascii?Q?ccU8MAp/CmmHrJcikSSv7gO6yuaa0SvK3HaisIcmLg0C2b6ALqVyjA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 10:46:54.4995
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 595f6e82-761b-4141-c9d0-08dd5fc0df92
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5722
Message-ID-Hash: 7VIDOHMKHZ4XLEBUGN2BH2TTGUTQ3Y3W
X-Message-ID-Hash: 7VIDOHMKHZ4XLEBUGN2BH2TTGUTQ3Y3W
X-MailFrom: venkataprasad.potturu@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7VIDOHMKHZ4XLEBUGN2BH2TTGUTQ3Y3W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add new interrupt handle callbacks in acp_common_hw_ops.
Refactor and move interrupt handler registration form platform
driver to pci driver.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/acp-i2s.c           |  4 +-
 sound/soc/amd/acp/acp-legacy-common.c | 79 +++++++++++++++++++++++----
 sound/soc/amd/acp/acp-pci.c           | 29 +++++++---
 sound/soc/amd/acp/acp-pdm.c           | 12 ++--
 sound/soc/amd/acp/acp-platform.c      | 50 +++--------------
 sound/soc/amd/acp/acp-rembrandt.c     | 15 ++++-
 sound/soc/amd/acp/acp-renoir.c        | 15 ++++-
 sound/soc/amd/acp/acp63.c             | 15 ++++-
 sound/soc/amd/acp/acp70.c             | 15 ++++-
 sound/soc/amd/acp/amd.h               | 29 +++++++++-
 sound/soc/amd/acp/chip_offset_byte.h  | 12 ++--
 11 files changed, 184 insertions(+), 91 deletions(-)

diff --git a/sound/soc/amd/acp/acp-i2s.c b/sound/soc/amd/acp/acp-i2s.c
index 89e99ed4275a..2f458c76f9fc 100644
--- a/sound/soc/amd/acp/acp-i2s.c
+++ b/sound/soc/amd/acp/acp-i2s.c
@@ -617,7 +617,7 @@ static int acp_i2s_prepare(struct snd_pcm_substream *substream, struct snd_soc_d
 	writel(acp_fifo_addr, adata->acp_base + reg_fifo_addr);
 	writel(FIFO_SIZE, adata->acp_base + reg_fifo_size);
 
-	ext_int_ctrl = readl(ACP_EXTERNAL_INTR_CNTL(adata, rsrc->irqp_used));
+	ext_int_ctrl = readl(ACP_EXTERNAL_INTR_CNTL(chip, rsrc->irqp_used));
 	ext_int_ctrl |= BIT(I2S_RX_THRESHOLD(rsrc->offset)) |
 			BIT(BT_RX_THRESHOLD(rsrc->offset)) |
 			BIT(I2S_TX_THRESHOLD(rsrc->offset)) |
@@ -625,7 +625,7 @@ static int acp_i2s_prepare(struct snd_pcm_substream *substream, struct snd_soc_d
 			BIT(HS_RX_THRESHOLD(rsrc->offset)) |
 			BIT(HS_TX_THRESHOLD(rsrc->offset));
 
-	writel(ext_int_ctrl, ACP_EXTERNAL_INTR_CNTL(adata, rsrc->irqp_used));
+	writel(ext_int_ctrl, ACP_EXTERNAL_INTR_CNTL(chip, rsrc->irqp_used));
 
 	return 0;
 }
diff --git a/sound/soc/amd/acp/acp-legacy-common.c b/sound/soc/amd/acp/acp-legacy-common.c
index 886615798b93..13fddce8df56 100644
--- a/sound/soc/amd/acp/acp-legacy-common.c
+++ b/sound/soc/amd/acp/acp-legacy-common.c
@@ -27,26 +27,76 @@ const struct snd_acp_hw_ops acp_common_hw_ops = {
 	/* ACP hardware initilizations */
 	.acp_init = acp_init,
 	.acp_deinit = acp_deinit,
+
+	/* ACP Interrupts*/
+	.irq = acp_irq_handler,
+	.en_interrupts = acp_enable_interrupts,
+	.dis_interrupts = acp_disable_interrupts,
 };
 EXPORT_SYMBOL_NS_GPL(acp_common_hw_ops, "SND_SOC_ACP_COMMON");
-void acp_enable_interrupts(struct acp_dev_data *adata)
+
+irqreturn_t acp_irq_handler(int irq, void *data)
 {
+	struct acp_chip_info *chip = data;
+	struct acp_dev_data *adata = chip->adata;
 	struct acp_resource *rsrc = adata->rsrc;
+	struct acp_stream *stream;
+	u16 i2s_flag = 0;
+	u32 ext_intr_stat, ext_intr_stat1;
+
+	if (adata->rsrc->no_of_ctrls == 2)
+		ext_intr_stat1 = readl(ACP_EXTERNAL_INTR_STAT(chip, (rsrc->irqp_used - 1)));
+
+	ext_intr_stat = readl(ACP_EXTERNAL_INTR_STAT(chip, rsrc->irqp_used));
+
+	spin_lock(&adata->acp_lock);
+	list_for_each_entry(stream, &adata->stream_list, list) {
+		if (ext_intr_stat & stream->irq_bit) {
+			writel(stream->irq_bit,
+			       ACP_EXTERNAL_INTR_STAT(chip, rsrc->irqp_used));
+			snd_pcm_period_elapsed(stream->substream);
+			i2s_flag = 1;
+		}
+		if (adata->rsrc->no_of_ctrls == 2) {
+			if (ext_intr_stat1 & stream->irq_bit) {
+				writel(stream->irq_bit, ACP_EXTERNAL_INTR_STAT(chip,
+				       (rsrc->irqp_used - 1)));
+				snd_pcm_period_elapsed(stream->substream);
+				i2s_flag = 1;
+			}
+		}
+	}
+	spin_unlock(&adata->acp_lock);
+	if (i2s_flag)
+		return IRQ_HANDLED;
+
+	return IRQ_NONE;
+}
+
+int acp_enable_interrupts(struct acp_chip_info *chip)
+{
+	struct acp_resource *rsrc;
 	u32 ext_intr_ctrl;
 
-	writel(0x01, ACP_EXTERNAL_INTR_ENB(adata));
-	ext_intr_ctrl = readl(ACP_EXTERNAL_INTR_CNTL(adata, rsrc->irqp_used));
+	rsrc = chip->rsrc;
+	writel(0x01, ACP_EXTERNAL_INTR_ENB(chip));
+	ext_intr_ctrl = readl(ACP_EXTERNAL_INTR_CNTL(chip, rsrc->irqp_used));
 	ext_intr_ctrl |= ACP_ERROR_MASK;
-	writel(ext_intr_ctrl, ACP_EXTERNAL_INTR_CNTL(adata, rsrc->irqp_used));
+	writel(ext_intr_ctrl, ACP_EXTERNAL_INTR_CNTL(chip, rsrc->irqp_used));
+
+	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(acp_enable_interrupts, "SND_SOC_ACP_COMMON");
 
-void acp_disable_interrupts(struct acp_dev_data *adata)
+int acp_disable_interrupts(struct acp_chip_info *chip)
 {
-	struct acp_resource *rsrc = adata->rsrc;
+	struct acp_resource *rsrc;
+
+	rsrc = chip->rsrc;
+	writel(ACP_EXT_INTR_STAT_CLEAR_MASK, ACP_EXTERNAL_INTR_STAT(chip, rsrc->irqp_used));
+	writel(0x00, ACP_EXTERNAL_INTR_ENB(chip));
 
-	writel(ACP_EXT_INTR_STAT_CLEAR_MASK, ACP_EXTERNAL_INTR_STAT(adata, rsrc->irqp_used));
-	writel(0x00, ACP_EXTERNAL_INTR_ENB(adata));
+	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(acp_disable_interrupts, "SND_SOC_ACP_COMMON");
 
@@ -90,19 +140,23 @@ void restore_acp_pdm_params(struct snd_pcm_substream *substream,
 			    struct acp_dev_data *adata)
 {
 	struct snd_soc_dai *dai;
+	struct device *dev;
+	struct acp_chip_info *chip;
 	struct snd_soc_pcm_runtime *soc_runtime;
 	u32 ext_int_ctrl;
 
 	soc_runtime = snd_soc_substream_to_rtd(substream);
 	dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
+	dev = dai->component->dev;
+	chip = dev_get_platdata(dev);
 	/* Programming channel mask and sampling rate */
 	writel(adata->ch_mask, adata->acp_base + ACP_WOV_PDM_NO_OF_CHANNELS);
 	writel(PDM_DEC_64, adata->acp_base + ACP_WOV_PDM_DECIMATION_FACTOR);
 
 	/* Enabling ACP Pdm interuppts */
-	ext_int_ctrl = readl(ACP_EXTERNAL_INTR_CNTL(adata, 0));
+	ext_int_ctrl = readl(ACP_EXTERNAL_INTR_CNTL(chip, 0));
 	ext_int_ctrl |= PDM_DMA_INTR_MASK;
-	writel(ext_int_ctrl, ACP_EXTERNAL_INTR_CNTL(adata, 0));
+	writel(ext_int_ctrl, ACP_EXTERNAL_INTR_CNTL(chip, 0));
 	set_acp_pdm_clk(substream, dai);
 }
 EXPORT_SYMBOL_NS_GPL(restore_acp_pdm_params, "SND_SOC_ACP_COMMON");
@@ -113,6 +167,7 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream *substream,
 	struct device *dev = dai->component->dev;
 	struct acp_dev_data *adata = dev_get_drvdata(dev);
 	struct acp_resource *rsrc = adata->rsrc;
+	struct acp_chip_info *chip = dev_get_platdata(dev);
 	struct acp_stream *stream = substream->runtime->private_data;
 	u32 reg_dma_size, reg_fifo_size, reg_fifo_addr;
 	u32 phy_addr, acp_fifo_addr, ext_int_ctrl;
@@ -185,7 +240,7 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream *substream,
 	writel(acp_fifo_addr, adata->acp_base + reg_fifo_addr);
 	writel(FIFO_SIZE, adata->acp_base + reg_fifo_size);
 
-	ext_int_ctrl = readl(ACP_EXTERNAL_INTR_CNTL(adata, rsrc->irqp_used));
+	ext_int_ctrl = readl(ACP_EXTERNAL_INTR_CNTL(chip, rsrc->irqp_used));
 	ext_int_ctrl |= BIT(I2S_RX_THRESHOLD(rsrc->offset)) |
 			BIT(BT_RX_THRESHOLD(rsrc->offset)) |
 			BIT(I2S_TX_THRESHOLD(rsrc->offset)) |
@@ -193,7 +248,7 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream *substream,
 			BIT(HS_RX_THRESHOLD(rsrc->offset)) |
 			BIT(HS_TX_THRESHOLD(rsrc->offset));
 
-	writel(ext_int_ctrl, ACP_EXTERNAL_INTR_CNTL(adata, rsrc->irqp_used));
+	writel(ext_int_ctrl, ACP_EXTERNAL_INTR_CNTL(chip, rsrc->irqp_used));
 	return 0;
 }
 
diff --git a/sound/soc/amd/acp/acp-pci.c b/sound/soc/amd/acp/acp-pci.c
index fc2925931f7c..8c47a5e1bb0a 100644
--- a/sound/soc/amd/acp/acp-pci.c
+++ b/sound/soc/amd/acp/acp-pci.c
@@ -26,6 +26,15 @@
 #define ACP3x_REG_START	0x1240000
 #define ACP3x_REG_END	0x125C000
 
+static irqreturn_t irq_handler(int irq, void *data)
+{
+	struct acp_chip_info *chip = data;
+
+	if (chip && chip->acp_hw_ops && chip->acp_hw_ops->irq)
+		return chip->acp_hw_ops->irq(irq, chip);
+
+	return IRQ_NONE;
+}
 static void acp_fill_platform_dev_info(struct platform_device_info *pdevinfo,
 				       struct device *parent,
 				       struct fwnode_handle *fw_node,
@@ -166,6 +175,13 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 	if (ret)
 		goto release_regions;
 
+	ret = devm_request_irq(dev, pci->irq, irq_handler,
+			       IRQF_SHARED, "ACP_I2S_IRQ", chip);
+	if (ret) {
+		dev_err(&pci->dev, "ACP I2S IRQ request failed %d\n", ret);
+		return ret;
+	}
+
 	check_acp_config(pci, chip);
 	if (!chip->is_pdm_dev && !chip->is_i2s_config)
 		goto skip_pdev_creation;
@@ -213,20 +229,17 @@ static int __maybe_unused snd_acp_suspend(struct device *dev)
 static int __maybe_unused snd_acp_resume(struct device *dev)
 {
 	struct acp_chip_info *chip;
-	struct acp_dev_data *adata;
-	struct device child;
 	int ret;
 
 	chip = dev_get_drvdata(dev);
 	ret = acp_hw_init(chip);
 	if (ret)
 		dev_err(dev, "ACP init failed\n");
-	if (chip->chip_pdev) {
-		child = chip->chip_pdev->dev;
-		adata = dev_get_drvdata(&child);
-		if (adata)
-			acp_enable_interrupts(adata);
-	}
+
+	ret = acp_hw_en_interrupts(chip);
+	if (ret)
+		dev_err(dev, "ACP en-interrupts failed\n");
+
 	return ret;
 }
 
diff --git a/sound/soc/amd/acp/acp-pdm.c b/sound/soc/amd/acp/acp-pdm.c
index d4855da05b6a..9a820ef3bf46 100644
--- a/sound/soc/amd/acp/acp-pdm.c
+++ b/sound/soc/amd/acp/acp-pdm.c
@@ -145,7 +145,7 @@ static int acp_dmic_dai_startup(struct snd_pcm_substream *substream,
 {
 	struct acp_stream *stream = substream->runtime->private_data;
 	struct device *dev = dai->component->dev;
-	struct acp_dev_data *adata = dev_get_drvdata(dev);
+	struct acp_chip_info *chip = dev_get_platdata(dev);
 	u32 ext_int_ctrl;
 
 	stream->dai_id = DMIC_INSTANCE;
@@ -154,9 +154,9 @@ static int acp_dmic_dai_startup(struct snd_pcm_substream *substream,
 	stream->reg_offset = ACP_REGION2_OFFSET;
 
 	/* Enable DMIC Interrupts */
-	ext_int_ctrl = readl(ACP_EXTERNAL_INTR_CNTL(adata, 0));
+	ext_int_ctrl = readl(ACP_EXTERNAL_INTR_CNTL(chip, 0));
 	ext_int_ctrl |= PDM_DMA_INTR_MASK;
-	writel(ext_int_ctrl, ACP_EXTERNAL_INTR_CNTL(adata, 0));
+	writel(ext_int_ctrl, ACP_EXTERNAL_INTR_CNTL(chip, 0));
 
 	return 0;
 }
@@ -165,13 +165,13 @@ static void acp_dmic_dai_shutdown(struct snd_pcm_substream *substream,
 				  struct snd_soc_dai *dai)
 {
 	struct device *dev = dai->component->dev;
-	struct acp_dev_data *adata = dev_get_drvdata(dev);
+	struct acp_chip_info *chip = dev_get_platdata(dev);
 	u32 ext_int_ctrl;
 
 	/* Disable DMIC interrupts */
-	ext_int_ctrl = readl(ACP_EXTERNAL_INTR_CNTL(adata, 0));
+	ext_int_ctrl = readl(ACP_EXTERNAL_INTR_CNTL(chip, 0));
 	ext_int_ctrl &= ~PDM_DMA_INTR_MASK;
-	writel(ext_int_ctrl, ACP_EXTERNAL_INTR_CNTL(adata, 0));
+	writel(ext_int_ctrl, ACP_EXTERNAL_INTR_CNTL(chip, 0));
 }
 
 const struct snd_soc_dai_ops acp_dmic_dai_ops = {
diff --git a/sound/soc/amd/acp/acp-platform.c b/sound/soc/amd/acp/acp-platform.c
index 7d6abff28b23..9b181fb5861c 100644
--- a/sound/soc/amd/acp/acp-platform.c
+++ b/sound/soc/amd/acp/acp-platform.c
@@ -107,43 +107,6 @@ static const struct snd_pcm_hardware acp6x_pcm_hardware_capture = {
 	.periods_max = CAPTURE_MAX_NUM_PERIODS,
 };
 
-static irqreturn_t i2s_irq_handler(int irq, void *data)
-{
-	struct acp_dev_data *adata = data;
-	struct acp_resource *rsrc = adata->rsrc;
-	struct acp_stream *stream;
-	u16 i2s_flag = 0;
-	u32 ext_intr_stat, ext_intr_stat1;
-
-	if (adata->rsrc->no_of_ctrls == 2)
-		ext_intr_stat1 = readl(ACP_EXTERNAL_INTR_STAT(adata, (rsrc->irqp_used - 1)));
-
-	ext_intr_stat = readl(ACP_EXTERNAL_INTR_STAT(adata, rsrc->irqp_used));
-
-	spin_lock(&adata->acp_lock);
-	list_for_each_entry(stream, &adata->stream_list, list) {
-		if (ext_intr_stat & stream->irq_bit) {
-			writel(stream->irq_bit,
-			       ACP_EXTERNAL_INTR_STAT(adata, rsrc->irqp_used));
-			snd_pcm_period_elapsed(stream->substream);
-			i2s_flag = 1;
-		}
-		if (adata->rsrc->no_of_ctrls == 2) {
-			if (ext_intr_stat1 & stream->irq_bit) {
-				writel(stream->irq_bit, ACP_EXTERNAL_INTR_STAT(adata,
-				       (rsrc->irqp_used - 1)));
-				snd_pcm_period_elapsed(stream->substream);
-				i2s_flag = 1;
-			}
-		}
-	}
-	spin_unlock(&adata->acp_lock);
-	if (i2s_flag)
-		return IRQ_HANDLED;
-
-	return IRQ_NONE;
-}
-
 void config_pte_for_stream(struct acp_dev_data *adata, struct acp_stream *stream)
 {
 	struct acp_resource *rsrc = adata->rsrc;
@@ -278,7 +241,7 @@ static int acp_dma_open(struct snd_soc_component *component, struct snd_pcm_subs
 	}
 	runtime->private_data = stream;
 
-	writel(1, ACP_EXTERNAL_INTR_ENB(adata));
+	writel(1, ACP_EXTERNAL_INTR_ENB(chip));
 
 	spin_lock_irq(&adata->acp_lock);
 	list_add_tail(&stream->list, &adata->stream_list);
@@ -363,16 +326,17 @@ static const struct snd_soc_component_driver acp_pcm_component = {
 int acp_platform_register(struct device *dev)
 {
 	struct acp_dev_data *adata = dev_get_drvdata(dev);
+	struct acp_chip_info *chip;
 	struct snd_soc_dai_driver;
 	unsigned int status;
 
-	status = devm_request_irq(dev, adata->i2s_irq, i2s_irq_handler,
-				  IRQF_SHARED, "ACP_I2S_IRQ", adata);
-	if (status) {
-		dev_err(dev, "ACP I2S IRQ request failed\n");
-		return status;
+	chip = dev_get_platdata(dev);
+	if (!chip || !chip->base) {
+		dev_err(dev, "ACP chip data is NULL\n");
+		return -ENODEV;
 	}
 
+	chip->adata = adata;
 	status = devm_snd_soc_register_component(dev, &acp_pcm_component,
 						 adata->dai_driver,
 						 adata->num_dai);
diff --git a/sound/soc/amd/acp/acp-rembrandt.c b/sound/soc/amd/acp/acp-rembrandt.c
index eb09878c0d5c..13633b3f3730 100644
--- a/sound/soc/amd/acp/acp-rembrandt.c
+++ b/sound/soc/amd/acp/acp-rembrandt.c
@@ -192,6 +192,7 @@ static int rembrandt_audio_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	chip->rsrc = &rsrc;
 	adata->i2s_irq = res->start;
 	adata->dev = dev;
 	adata->dai_driver = acp_rmb_dai;
@@ -208,7 +209,11 @@ static int rembrandt_audio_probe(struct platform_device *pdev)
 		if (ret)
 			return ret;
 	}
-	acp_enable_interrupts(adata);
+	ret = acp_hw_en_interrupts(chip);
+	if (ret) {
+		dev_err(dev, "ACP en-interrupts failed\n");
+		return ret;
+	}
 	acp_platform_register(dev);
 	pm_runtime_set_autosuspend_delay(&pdev->dev, ACP_SUSPEND_DELAY_MS);
 	pm_runtime_use_autosuspend(&pdev->dev);
@@ -221,9 +226,13 @@ static int rembrandt_audio_probe(struct platform_device *pdev)
 static void rembrandt_audio_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct acp_dev_data *adata = dev_get_drvdata(dev);
+	struct acp_chip_info *chip = dev_get_platdata(dev);
+	int ret;
+
+	ret = acp_hw_dis_interrupts(chip);
+	if (ret)
+		dev_err(dev, "ACP dis-interrupts failed\n");
 
-	acp_disable_interrupts(adata);
 	acp_platform_unregister(dev);
 	pm_runtime_disable(&pdev->dev);
 }
diff --git a/sound/soc/amd/acp/acp-renoir.c b/sound/soc/amd/acp/acp-renoir.c
index 2b47c6bfc9e7..94ecb17684b7 100644
--- a/sound/soc/amd/acp/acp-renoir.c
+++ b/sound/soc/amd/acp/acp-renoir.c
@@ -142,6 +142,7 @@ static int renoir_audio_probe(struct platform_device *pdev)
 		return ret;
 	adata->i2s_irq = ret;
 
+	chip->rsrc = &rsrc;
 	adata->dev = dev;
 	adata->dai_driver = acp_renoir_dai;
 	adata->num_dai = ARRAY_SIZE(acp_renoir_dai);
@@ -150,7 +151,11 @@ static int renoir_audio_probe(struct platform_device *pdev)
 	adata->flag = chip->flag;
 
 	dev_set_drvdata(dev, adata);
-	acp_enable_interrupts(adata);
+	ret = acp_hw_en_interrupts(chip);
+	if (ret) {
+		dev_err(dev, "ACP en-interrupts failed\n");
+		return ret;
+	}
 	acp_platform_register(dev);
 
 	pm_runtime_set_autosuspend_delay(&pdev->dev, ACP_SUSPEND_DELAY_MS);
@@ -164,9 +169,13 @@ static int renoir_audio_probe(struct platform_device *pdev)
 static void renoir_audio_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct acp_dev_data *adata = dev_get_drvdata(dev);
+	struct acp_chip_info *chip = dev_get_platdata(dev);
+	int ret;
+
+	ret = acp_hw_dis_interrupts(chip);
+	if (ret)
+		dev_err(dev, "ACP dis-interrupts failed\n");
 
-	acp_disable_interrupts(adata);
 	acp_platform_unregister(dev);
 }
 
diff --git a/sound/soc/amd/acp/acp63.c b/sound/soc/amd/acp/acp63.c
index 76a26b82e3ad..e38ad9f7fb48 100644
--- a/sound/soc/amd/acp/acp63.c
+++ b/sound/soc/amd/acp/acp63.c
@@ -243,6 +243,7 @@ static int acp63_audio_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	chip->rsrc = &rsrc;
 	adata->i2s_irq = res->start;
 	adata->dev = dev;
 	adata->dai_driver = acp63_dai;
@@ -258,7 +259,11 @@ static int acp63_audio_probe(struct platform_device *pdev)
 		if (ret)
 			return ret;
 	}
-	acp_enable_interrupts(adata);
+	ret = acp_hw_en_interrupts(chip);
+	if (ret) {
+		dev_err(dev, "ACP en-interrupts failed\n");
+		return ret;
+	}
 	acp_platform_register(dev);
 	pm_runtime_set_autosuspend_delay(&pdev->dev, ACP_SUSPEND_DELAY_MS);
 	pm_runtime_use_autosuspend(&pdev->dev);
@@ -271,9 +276,13 @@ static int acp63_audio_probe(struct platform_device *pdev)
 static void acp63_audio_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct acp_dev_data *adata = dev_get_drvdata(dev);
+	struct acp_chip_info *chip = dev_get_platdata(dev);
+	int ret;
+
+	ret = acp_hw_dis_interrupts(chip);
+	if (ret)
+		dev_err(dev, "ACP dis-interrupts failed\n");
 
-	acp_disable_interrupts(adata);
 	acp_platform_unregister(dev);
 	pm_runtime_disable(&pdev->dev);
 }
diff --git a/sound/soc/amd/acp/acp70.c b/sound/soc/amd/acp/acp70.c
index 4ed446990cdb..aea6e9d796ec 100644
--- a/sound/soc/amd/acp/acp70.c
+++ b/sound/soc/amd/acp/acp70.c
@@ -174,6 +174,7 @@ static int acp_acp70_audio_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	chip->rsrc = &rsrc;
 	adata->i2s_irq = res->start;
 	adata->dev = dev;
 	adata->dai_driver = acp70_dai;
@@ -190,7 +191,11 @@ static int acp_acp70_audio_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "Failed to set I2S master clock as 196.608MHz\n");
 		return ret;
 	}
-	acp_enable_interrupts(adata);
+	ret = acp_hw_en_interrupts(chip);
+	if (ret) {
+		dev_err(dev, "ACP en-interrupts failed\n");
+		return ret;
+	}
 	acp_platform_register(dev);
 	pm_runtime_set_autosuspend_delay(&pdev->dev, ACP_SUSPEND_DELAY_MS);
 	pm_runtime_use_autosuspend(&pdev->dev);
@@ -203,9 +208,13 @@ static int acp_acp70_audio_probe(struct platform_device *pdev)
 static void acp_acp70_audio_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct acp_dev_data *adata = dev_get_drvdata(dev);
+	struct acp_chip_info *chip = dev_get_platdata(dev);
+	int ret;
+
+	ret = acp_hw_dis_interrupts(chip);
+	if (ret)
+		dev_err(dev, "ACP dis-interrupts failed\n");
 
-	acp_disable_interrupts(adata);
 	acp_platform_unregister(dev);
 	pm_runtime_disable(&pdev->dev);
 }
diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
index 4d6a71cff17d..b2bd26730dbf 100644
--- a/sound/soc/amd/acp/amd.h
+++ b/sound/soc/amd/acp/amd.h
@@ -147,10 +147,12 @@ struct acp_chip_info {
 	struct snd_acp_hw_ops *acp_hw_ops;
 	int (*acp_hw_ops_init)(struct acp_chip_info *chip);
 	struct platform_device *chip_pdev;
+	struct acp_resource *rsrc; /* Platform specific resources*/
 	struct platform_device *dmic_codec_dev;
 	struct platform_device *acp_plat_dev;
 	struct platform_device *mach_dev;
 	struct snd_soc_acpi_mach *machines;
+	struct acp_dev_data *adata;
 	u32 addr;
 	unsigned int flag;	/* Distinguish b/w Legacy or Only PDM */
 	bool is_pdm_dev;	/* flag set to true when ACP PDM controller exists */
@@ -215,11 +217,19 @@ struct acp_dev_data {
  * struct snd_acp_hw_ops - ACP PCI driver platform specific ops
  * @acp_init: ACP initialization
  * @acp_deinit: ACP de-initialization
+ * @irq: ACP irq handler
+ * @en_interrupts: ACP enable interrupts
+ * @dis_interrupts: ACP disable interrupts
  */
 struct snd_acp_hw_ops {
 	/* ACP hardware initilizations */
 	int (*acp_init)(struct acp_chip_info *chip);
 	int (*acp_deinit)(struct acp_chip_info *chip);
+
+	/* ACP Interrupts*/
+	irqreturn_t (*irq)(int irq, void *data);
+	int (*en_interrupts)(struct acp_chip_info *chip);
+	int (*dis_interrupts)(struct acp_chip_info *chip);
 };
 
 enum acp_config {
@@ -332,8 +342,9 @@ int acp_machine_select(struct acp_chip_info *chip);
 
 int acp_init(struct acp_chip_info *chip);
 int acp_deinit(struct acp_chip_info *chip);
-void acp_enable_interrupts(struct acp_dev_data *adata);
-void acp_disable_interrupts(struct acp_dev_data *adata);
+int acp_enable_interrupts(struct acp_chip_info *chip);
+int acp_disable_interrupts(struct acp_chip_info *chip);
+irqreturn_t acp_irq_handler(int irq, void *data);
 
 extern struct snd_acp_hw_ops acp31_common_hw_ops;
 extern struct snd_acp_hw_ops acp6x_common_hw_ops;
@@ -370,6 +381,20 @@ static inline int acp_hw_deinit(struct acp_chip_info *chip)
 	return -EOPNOTSUPP;
 }
 
+static inline int acp_hw_en_interrupts(struct acp_chip_info *chip)
+{
+	if (chip && chip->acp_hw_ops && chip->acp_hw_ops->en_interrupts)
+		return chip->acp_hw_ops->en_interrupts(chip);
+	return -EOPNOTSUPP;
+}
+
+static inline int acp_hw_dis_interrupts(struct acp_chip_info *chip)
+{
+	if (chip && chip->acp_hw_ops && chip->acp_hw_ops->dis_interrupts)
+		chip->acp_hw_ops->dis_interrupts(chip);
+	return -EOPNOTSUPP;
+}
+
 static inline u64 acp_get_byte_count(struct acp_dev_data *adata, int dai_id, int direction)
 {
 	u64 byte_count = 0, low = 0, high = 0;
diff --git a/sound/soc/amd/acp/chip_offset_byte.h b/sound/soc/amd/acp/chip_offset_byte.h
index 117ea63e85c6..82275c9de53a 100644
--- a/sound/soc/amd/acp/chip_offset_byte.h
+++ b/sound/soc/amd/acp/chip_offset_byte.h
@@ -29,13 +29,13 @@
 #define ACP_PIN_CONFIG				0x1440
 #define ACP3X_PIN_CONFIG			0x1400
 
-#define ACP_EXTERNAL_INTR_REG_ADDR(adata, offset, ctrl) \
-	(adata->acp_base + adata->rsrc->irq_reg_offset + offset + (ctrl * 0x04))
+#define ACP_EXTERNAL_INTR_REG_ADDR(chip, offset, ctrl) \
+	(chip->base + chip->rsrc->irq_reg_offset + offset + (ctrl * 0x04))
 
-#define ACP_EXTERNAL_INTR_ENB(adata) ACP_EXTERNAL_INTR_REG_ADDR(adata, 0x0, 0x0)
-#define ACP_EXTERNAL_INTR_CNTL(adata, ctrl) ACP_EXTERNAL_INTR_REG_ADDR(adata, 0x4, ctrl)
-#define ACP_EXTERNAL_INTR_STAT(adata, ctrl) ACP_EXTERNAL_INTR_REG_ADDR(adata, \
-	(0x4 + (adata->rsrc->no_of_ctrls * 0x04)), ctrl)
+#define ACP_EXTERNAL_INTR_ENB(chip) ACP_EXTERNAL_INTR_REG_ADDR(chip, 0x0, 0x0)
+#define ACP_EXTERNAL_INTR_CNTL(chip, ctrl) ACP_EXTERNAL_INTR_REG_ADDR(chip, 0x4, ctrl)
+#define ACP_EXTERNAL_INTR_STAT(chip, ctrl) ACP_EXTERNAL_INTR_REG_ADDR(chip, \
+	(0x4 + (chip->rsrc->no_of_ctrls * 0x04)), ctrl)
 
 /* Registers from ACP_AUDIO_BUFFERS block */
 
-- 
2.39.2

