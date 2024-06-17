Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 009E390A74E
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 09:34:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2787A4D;
	Mon, 17 Jun 2024 09:34:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2787A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718609690;
	bh=9jwe7o2FYbrJCFK7f0i548cNZjFKc0HU/5eyCZJEwmc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ppec3so8G09cSTHhuCiTPRaj4YsR1gkGP9V2tRirVcLNFJJKb1kl4FlQXDErzqdCj
	 jbSnJLC283mGVloZ7oVkG1gocBrBbkD4OVWbHpfTXBG/IcA7Dop59nneBdhoHfCDNX
	 buwgY7e3NTtzdzM3f4QNAlnR+gpbkJIA5w5fvE4c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B72AAF80652; Mon, 17 Jun 2024 09:33:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C67CF80651;
	Mon, 17 Jun 2024 09:33:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DCEF9F80269; Mon, 17 Jun 2024 09:30:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A2AC3F8023A
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 09:30:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2AC3F8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Myou0GPg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N5A3Mo4HZr93zk/v4JDemUBXeCpCgsUr2ByX2lCYJAWBioIwmkrcniQLJeMHbtbUEAgN9EJT2HilTm85t9ujD2YOTrXys0vUTvmBpxlmXek10UZfpOMK0qJQCsUHmoaxbZGiaqz1DawWNsGqsoDiTzxeQxTsefGzEFhBi/W/jSmRLdaDLR2yKq8jzWM8EG1fIPd5E+d42bhLFk320soQNDh5xIjFP16uuOVR05ZGzRRJR4ZYMkoQEI7I+qsZwgWugEaT1yTKJSCLd6bJexg1iUfmq/AfH+nyrys7eSpWDtSOLUrXtuemAGOzp4bUEgRPSa0s5frcixskduW08n6FzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yGT7Dfnz3JtmMpxBbI0tYAJJaoE9JnQ1eo+oQM1C4XM=;
 b=KKoZRL5ZeRNZG9dPSWQOw7OkjgTrxqcscSEgVBLTM7iVADQF9l3Wu9N9GfSs1oI215tIj5S/BgYTiDDeXsm/kxzw4jj2qLhw8+FTRmYagAUm6Hjm/md2GEAGLN6VvfWLeCBx4NO6dbbJ1ten+Kks/0+ywRhtxoGXWog7vnW6UqxwtDXGEVJCaoUz7bgjVIIz2rOwsndcny4P70MzRHCi1xMjnu5FvSzXdRzO/u9LkwqEg++4/0YeS1CABDkuUMV0yD5rHxzzOsb54NkfPsLHzGWMxXX7WV1ZRf9aKGPpwuT/4ezXIHc4BXs+RWn08D+WKyveFrdXZ6gJ5SaagXiJbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yGT7Dfnz3JtmMpxBbI0tYAJJaoE9JnQ1eo+oQM1C4XM=;
 b=Myou0GPgwhnQb4sVd6rlIfHStGrv8zv4vJNoVakZR22oe7NU+E3Hnvi5ocsvCSu6HYHQGI5jsF4DbK35gyDNDRjPjnZWRwyVQbPD9oL7hyREarG+/Z8djuF6GSp9KqK0ez8zQOdzsNGOvAtB3wprkwMJ4yJfpY8/LkOKru6XHe4=
Received: from BY5PR03CA0022.namprd03.prod.outlook.com (2603:10b6:a03:1e0::32)
 by CYXPR12MB9337.namprd12.prod.outlook.com (2603:10b6:930:d8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 07:30:06 +0000
Received: from SJ1PEPF00001CDF.namprd05.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::a0) by BY5PR03CA0022.outlook.office365.com
 (2603:10b6:a03:1e0::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31 via Frontend
 Transport; Mon, 17 Jun 2024 07:30:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CDF.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Mon, 17 Jun 2024 07:30:05 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Jun
 2024 02:30:00 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Mon, 17 Jun 2024 02:29:57 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <venkataprasad.potturu@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Syed Saba
 Kareem" <Syed.SabaKareem@amd.com>, "open list:SOUND - SOC LAYER / DYNAMIC
 AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 8/8] ASoC: amd: acp: add pcm constraints for buffer size and
 period size
Date: Mon, 17 Jun 2024 12:58:41 +0530
Message-ID: <20240617072844.871468-8-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDF:EE_|CYXPR12MB9337:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f69f8b8-236b-486b-9463-08dc8e9f4f24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|376011|82310400023|1800799021|36860700010;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NoRVySmQNu41yyN8VgAqa9wjEcV1yMl7IxIT9HiwxMUpXxHTpm8ibqdvnhuJ?=
 =?us-ascii?Q?pEan4K9wM+Y7rIEEM02r1hlxD2HkgxBjdGlEU8vAN+uO+KRgRnmYKhhnl0Ke?=
 =?us-ascii?Q?Hv+YDyMvr3+pTqRDmJvpigPXH3iYfQio/WcGrom1zWwJrGxgkNjTPuGui/l4?=
 =?us-ascii?Q?MazOdMdxI2VULdUrFzWlo1YlaBD5GBrMd137hlfMELJOahe+Ap83uPC/dCtZ?=
 =?us-ascii?Q?CJ4SEMgssQycqTD4xqCCPRImRMeEf9NYIce2ciUpd1pKwkouHVXKYrPPBCmT?=
 =?us-ascii?Q?2RpSxMb7nuIXCZ2OpjrwQmM0t9lMw9VrwbnZ1T94jQ/yqtROwQ5gG7gyQHcx?=
 =?us-ascii?Q?gQnJY6ot/AU7r/dIUjnY07BXbXcyhTygTMtlCzTxUOer31AdCAQq2CbistAo?=
 =?us-ascii?Q?KIemKs671SQsBYzMdGrMCiqU1dGSEYnGwYAJWe4+AtY7SYniYSwUqQoK/bKS?=
 =?us-ascii?Q?OCPG9H7X7xmrq8lHxeLIQENspoMZa9ho+HIWhdu+oLcT0Oh7CJaOForRgONT?=
 =?us-ascii?Q?Yw23Hpl0vT/Vb0znxlbBd8GrVkEXZhHKuYd8Jc24ha5t7OJOe40NAUCGMjls?=
 =?us-ascii?Q?BniTpVCKe9qm9i3+8QbrqssLtZafQtBZvgzt9SmZ7b0Eb2Q5sMPkdANqN+XS?=
 =?us-ascii?Q?CglY7ej5qGDej2svfoe/CNwdh0fkmFAOu/3/AEDscysgQpga1JJkkLuGlDZC?=
 =?us-ascii?Q?jf1s3FHnBR7R3JvVWZIllGCe1Cu5GKx1qe16xgOyNvB4rmo6/daCGB04e4Io?=
 =?us-ascii?Q?Jib9EtvNIBYs3DuIkOmysOEmpV5fIPu0qchfc1mprqDDeYMXLdgqptFjJtCx?=
 =?us-ascii?Q?eHtRA/0dj5v6CAq3qEA1b1+w1vW5hXHeb4PmSM1ZHTogyif8EVJVjKR/Hy0D?=
 =?us-ascii?Q?Ga6gXU2k7nsrtXc/l+6VzbhIArxUVt8YhOYpEsz/zhsHJiotHmZeOZV3nxsv?=
 =?us-ascii?Q?UvqISDVmjNZtEZs/zli3OTBuUWVZBPtyDHPJ4WPW2l4nkrxFz8l4y8z7Vf2t?=
 =?us-ascii?Q?Xl7WkUrqLlsR0KPZGFFuvViCZZZ5t+bpRW+E+HGcPTNEwR+xPszxp5TU+OnE?=
 =?us-ascii?Q?oW/dRV+Fpydtmx+5B9HqDvKsuCaFTdfkqFwFouzQxjAbUwIGcuCa/9pT1BfM?=
 =?us-ascii?Q?cJjMgYJnNGpaAGwm28FuWNrZCic8GxsQdL7VnD5q7CuwFpMjIpEAG9WQ1sk6?=
 =?us-ascii?Q?lPUf9Pof+/8AtXIXf1CqpxNzk54fAlviDzPKCZAMCau6sTkbr51Jcj3byjOh?=
 =?us-ascii?Q?KiiQPntImiVoelnmOsU+NYtQMKNqRbCvizWWgy+xVg81XG9YAn1ztYHNAAhF?=
 =?us-ascii?Q?dI6ExD1aKGrJBKx5SDp0GVAKbVFoE3U2rDxfhtLssOy18Oqgae/PmDQJEcr7?=
 =?us-ascii?Q?xXuD9ZGi37Y9nBepyb/xhUx0YzFHKJQkUF3CR/yTqKikdvgkuQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230037)(376011)(82310400023)(1800799021)(36860700010);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 07:30:05.7571
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2f69f8b8-236b-486b-9463-08dc8e9f4f24
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CDF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9337
Message-ID-Hash: H6C7GSQLIV57YRQO5OJ5W4PFYD2UEN4W
X-Message-ID-Hash: H6C7GSQLIV57YRQO5OJ5W4PFYD2UEN4W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H6C7GSQLIV57YRQO5OJ5W4PFYD2UEN4W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ACP common dma driver has a buffer size and period size restriction
which should be 64 byte aligned. Add pcm constraints for the same.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-platform.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/amd/acp/acp-platform.c b/sound/soc/amd/acp/acp-platform.c
index aaac8aa744cb..4f409cd09c11 100644
--- a/sound/soc/amd/acp/acp-platform.c
+++ b/sound/soc/amd/acp/acp-platform.c
@@ -197,6 +197,20 @@ static int acp_dma_open(struct snd_soc_component *component, struct snd_pcm_subs
 	else
 		runtime->hw = acp_pcm_hardware_capture;
 
+	ret = snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, DMA_SIZE);
+	if (ret) {
+		dev_err(component->dev, "set hw constraint HW_PARAM_PERIOD_BYTES failed\n");
+		kfree(stream);
+		return ret;
+	}
+
+	ret = snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_BYTES, DMA_SIZE);
+	if (ret) {
+		dev_err(component->dev, "set hw constraint HW_PARAM_BUFFER_BYTES failed\n");
+		kfree(stream);
+		return ret;
+	}
+
 	ret = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
 	if (ret < 0) {
 		dev_err(component->dev, "set integer constraint failed\n");
-- 
2.34.1

