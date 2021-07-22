Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC293D249F
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jul 2021 15:29:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC3BC16DA;
	Thu, 22 Jul 2021 15:28:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC3BC16DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626960587;
	bh=EPzZtBvDF2XZ6t1wYSHetHd2MoYa5TYUxMuEfs5UA4w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PCxnwI2baT3VnFIOnywBojmwBFdkxOd99W/zgnztqlup4kl2oLcrAMKyevryQLkSd
	 p56e28FOn6P1TzhTiIoQl6qEL90QXqfRDMlbB+IUt80Hs4VAyXRXwjjPQKrCq3tnZw
	 Kf2lsie7UQVIcNsJef/3B2sUTKPTPgF71S1bTuas=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE30AF804DF;
	Thu, 22 Jul 2021 15:28:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00903F804DA; Thu, 22 Jul 2021 15:28:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2081.outbound.protection.outlook.com [40.107.243.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C546DF80423
 for <alsa-devel@alsa-project.org>; Thu, 22 Jul 2021 15:27:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C546DF80423
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="Y1QrO5Ld"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XSR98yxOOTTI3DLdamgc/wKkMRjdTwIchDAYcgzyxXW3MGNC8AOIgSXZSTrpyK1BVpdQkRHYW3VhtrYtiQSA9KS46JwNnAUBKBSoE8W3slr/sm2GRYWO8xBa/C2/YOvfAs3EZqwFMqGEnKXM+WaR2bvXQsYBuAvjCoumv1t9ooho6cEPtxOzBg0ni6IC38Z9jL6iwCNLmpiVkpwAYt9fg7NaBP5xh/0NOArnGQ8bJ5yavtHTCJaSIJIaSPkcC+xpzzZu3mZKzYMhbONyFZBpce7a/LSQDU8S86MedgXn6HkblRDzS2wfBckJYAXt7LAzcr2azDBdT2/Ny54sMs7RpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=adr18D6cQ5PK/DWR1UDQvMj4dyUhVaII/UtUkK7hdyI=;
 b=h4D4QnjEamaeh9gaVq0CevBW2kYou5bG55ZaaOcIs+3R/BZmdXtHqxMaOFZDNT1erqh6T2BToFNppw+Fr+jbKK8HO/ncnN8vnxb4NcOIZKyoCf4ehqnm+l0z5J5Vtt1DozOzjxfsn6JFPKleD0ndjm6nFbc8VXn/Sif8EzYW5vdDIL/C5AEJupD13mq8dmBT6RtrmRYTOKKYe5qE2u6cevtf7XfmsFXXf7DDrDqLJ5C0yJjlQ1YMFlCodz4rDrLIggwJjqdCmU36aggzfyOMFKAQK3S1jvOMnBDCLkXFSA964FKRe8migUBjjM8eyuRyZnJ8AC74423HpsUMi3zRIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=adr18D6cQ5PK/DWR1UDQvMj4dyUhVaII/UtUkK7hdyI=;
 b=Y1QrO5LdZwHcy5xqYX1DkAXS2KEur5RkqlJwpjbWx3Na3CqK7xTXYVWY/LzEAEqs59rh+QJ0iS8cDoPdmUpDi2rrz+Ope09blHHjPhA2ZFB9nyNbmehXaC80BBwM9DFZXhXiBMpAvJ/R7basv5F3h7j9xpTt5crk4xb3+j5ofrc=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8)
 by SA0PR12MB4559.namprd12.prod.outlook.com (2603:10b6:806:9e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Thu, 22 Jul
 2021 13:27:49 +0000
Received: from SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::c05f:7a93:601b:9861]) by SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::c05f:7a93:601b:9861%7]) with mapi id 15.20.4331.034; Thu, 22 Jul 2021
 13:27:49 +0000
From: Mario Limonciello <mario.limonciello@amd.com>
To: broonie@kernel.org, alsa-devel@alsa-project.org, Vijendar.Mukunda@amd.com
Subject: [PATCH v3 2/2] ASoC: amd: Use dev_probe_err helper
Date: Thu, 22 Jul 2021 08:27:28 -0500
Message-Id: <20210722132731.13264-2-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722132731.13264-1-mario.limonciello@amd.com>
References: <20210722132731.13264-1-mario.limonciello@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0048.namprd04.prod.outlook.com
 (2603:10b6:806:120::23) To SA0PR12MB4510.namprd12.prod.outlook.com
 (2603:10b6:806:94::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from AUS-LX-MLIMONCI.amd.com (76.251.167.31) by
 SN7PR04CA0048.namprd04.prod.outlook.com (2603:10b6:806:120::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24 via Frontend
 Transport; Thu, 22 Jul 2021 13:27:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3274114b-513e-433d-232f-08d94d148058
X-MS-TrafficTypeDiagnostic: SA0PR12MB4559:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4559639154DA047EAFB14E1CE2E49@SA0PR12MB4559.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:580;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NbnC4ylSx5uX3OQvEh6NZuAaRUgV1vlNbIjx5oT/ewaIEcZXOjmrynnLZJ9sVxxX/Zyr8yNKoa7Ppdabe+e4dsbXWJAyvr0XtYmSY85uG0sk9uiGDuxViXcowfoCxZrS40wDSY4Bgfes5zJ6FGkftivcoNx9valvjofx1T86wm7qZMwy1dJG4TLuf9AkiS2uI3hUyQCMcuVVxeOfCIDCwzcNIeNlpbo5gSK/xOoAy/ne18QrN6nCxZSiRiKq+RRNCnWHk1nhN39Jss6Ghb7l98xs2h6DW0xCWpZbAe2/Qx+nUs8y0BmfGh/leQArE+s2jnzPWGG8wvzLRehV01e5EN0VgwF3UQ8J4sq3mBA4Bse69WwmuN3qyaTNBstgMYGSZ/jDVgwWn1FpoTSIypO3X/f7FVwOlhWlbnQU3OrTPVg4/ARCLxtj8Syj7vWns/v5aHm34+M65UsERSiOoDaOlN1j+5MHydo4A0ZpJ75AYSkvPen8sTDlgIr/PAS6UI2Be5SqA0THGmohfgzSQae39g/d1Mb2qtY3FlcbxqPcvY8NePDD9EChu4a/YGQP8f5qU1Az7Yu/JrsgDnf8PsQZQgStkYEZvz6nAqvA0pFZtWfoWvcdQFgAmVEzEktv1K+ETr9lOZY389by40InVHL5cEkIY+Sv7f8k+1YEjkSmi5u65w+/n/Qv25MJfM615+FeRj5z8nK2evQA2sDQr9uwLQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4510.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(6486002)(956004)(508600001)(5660300002)(66556008)(8676002)(7696005)(1076003)(186003)(86362001)(83380400001)(26005)(38350700002)(38100700002)(36756003)(316002)(4326008)(54906003)(6636002)(44832011)(8936002)(52116002)(66946007)(6666004)(2616005)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u7LzaUQnRfjxQFrwQRESnM5hQfPqvXKqsnU2ySSEE29irmabSz2mwXh5cvxz?=
 =?us-ascii?Q?50s0ubhpsc7zs1lkCxHYlsjeTMYpvmpy99b6QkzYUluiB2yK4CJWzdGV1ou/?=
 =?us-ascii?Q?V3jOEEI0PAScEVq+kwkq+KzXg/tAJ9WYWpW4iAf2ixRYYhhl89KqquZW6upR?=
 =?us-ascii?Q?8Tb87bVnN1RDKj9DKl4ypvkCoEkEeXbr1yqqt49ojYprx+vfTIDFm1BpWE5S?=
 =?us-ascii?Q?itBQ2+ybIUKTkEo588IZ8vZQ81iPj68PVkTpJFjjhCLgjY84iMKaa2TB36O/?=
 =?us-ascii?Q?OFh9PiiUDgBLdLV1Pe1INLPXVD3fWGxyD6CBx+0ngy15VPFrQk6pWyzvPBrh?=
 =?us-ascii?Q?bQDBhllsA33wQc5kqFrSS+Cf7h/5Ahx0f0soJszCgH1O8zi7Gq7FyxcQf2hA?=
 =?us-ascii?Q?4i5HSBE00Qo0LulSbc7TTO0oZmLnvflLuDiE0rdT8MSWPhARuHI/pmcPvlbz?=
 =?us-ascii?Q?RcMFjlJM6ZzsT+nCIz5hSOyBp24vvCOKiv5amJkCvVAMBrWRDAVTQlBH6vXk?=
 =?us-ascii?Q?py85OWAH2LzIgjwP7zHdGGki43SRXxMBXy9ETUYaxrpgweKzb8NuQ7yGxbq6?=
 =?us-ascii?Q?ObkopaUi4rY6Qrb63GAE+C4XxQVE1pvOoWNpejUpxjVcDgAJ3nVVTkS9T6XG?=
 =?us-ascii?Q?eDKPK+VkJled9civGPDfs2SM+NiuXPpTU0Pg1bmqOMbff7wx/N4l/rfW8qZO?=
 =?us-ascii?Q?SoWS/WMUeSJtO+IBrDlhHirrMrJhpjl6D5Tuv2K6k1oEYH5Kf/5tJR05r8qt?=
 =?us-ascii?Q?QNitAJUtzRsTUaCX+1C79ASfdD4GL+gr+PURRhoxUcum/uVbknHTehwvLTBl?=
 =?us-ascii?Q?LzBY4rkc7iJmc8fyZpt8QceR9O82Rjm2ymwAzZB0lWmCPpKYlZYAHZPAVs90?=
 =?us-ascii?Q?xpHvEhbe17U4irCn9Q2ZZ581DVNSbxAivTAi6rT6x6TKAyLWxKFCN2OyCyMP?=
 =?us-ascii?Q?s1EPlV1Lc2kMi9DfWrEHFdJslo3LLhxayVmwSjliwYf0PNBc6J1Ox+KC0hzb?=
 =?us-ascii?Q?nCwop1RfJKNdXNWH85P3PMV4JDY2HYZ6PzViNmddtFrf78PqAlWtP6SfuhdH?=
 =?us-ascii?Q?Q8h7vVO8p6CSRRX6N68rqsbQVlhSLahqc/HB/xFTuw3Nu79+KsLfQ0VfK2Vw?=
 =?us-ascii?Q?UEzVW93cIAH7U/XyYFSzYvdSK/luZqz+6b0ekBUAPEic9g6fvDQZMxpn4uHb?=
 =?us-ascii?Q?HOJjK5RwE3I1kc9Ngx8fcJ/UZ7r+HyiAuk3Ka87qHHx+Vabq9mSwtSQNpCn5?=
 =?us-ascii?Q?18q0rILSHSvwtaQ8FazClIx6JpyC6PXuwyFR7/UJsqMOYu/sU1aV6kuIrmG3?=
 =?us-ascii?Q?0jMPKf1gGHK36xRCbd8/Xy8b?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3274114b-513e-433d-232f-08d94d148058
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4510.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2021 13:27:49.8765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GogKlpvXsn7I9FWxtGLtsBZbyTOfI0SD9KSb3SW90t9O0a9YmKAivzYCj50P/QgMFQBix7QLVsFfQpOqAnbi5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4559
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Chuhong Yuan <hslester96@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Tzung-Bi Shih <tzungbi@google.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Akshu Agrawal <akshu.agrawal@amd.com>
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

Replace the pattern of check for err to match -EPROBE_DEFER and only
output errors to use the dev_err_probe helper instead.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 sound/soc/amd/acp-da7219-max98357a.c | 12 +++---------
 sound/soc/amd/acp3x-rt5682-max9836.c | 14 ++++----------
 2 files changed, 7 insertions(+), 19 deletions(-)

diff --git a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-da7219-max98357a.c
index 84e3906abd4f..c130eeb07cdf 100644
--- a/sound/soc/amd/acp-da7219-max98357a.c
+++ b/sound/soc/amd/acp-da7219-max98357a.c
@@ -746,15 +746,9 @@ static int cz_probe(struct platform_device *pdev)
 	snd_soc_card_set_drvdata(card, machine);
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev,
-				"devm_snd_soc_register_card(%s) failed: %d\n",
-				card->name, ret);
-		else
-			dev_dbg(&pdev->dev,
-				"devm_snd_soc_register_card(%s) probe deferred: %d\n",
-				card->name, ret);
-		return ret;
+		return dev_err_probe(&pdev->dev, ret,
+				"devm_snd_soc_register_card(%s) failed\n",
+				card->name);
 	}
 	bt_uart_enable = !device_property_read_bool(&pdev->dev,
 						    "bt-pad-enable");
diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
index d9980aba2910..e561464f7d60 100644
--- a/sound/soc/amd/acp3x-rt5682-max9836.c
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -512,17 +512,11 @@ static int acp3x_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev,
-				"devm_snd_soc_register_card(%s) failed: %d\n",
-				card->name, ret);
-		else
-			dev_dbg(&pdev->dev,
-				"devm_snd_soc_register_card(%s) probe deferred: %d\n",
-				card->name, ret);
+		return dev_err_probe(&pdev->dev, ret,
+				"devm_snd_soc_register_card(%s) failed\n",
+				card->name);
 	}
-
-	return ret;
+	return 0;
 }
 
 static const struct acpi_device_id acp3x_audio_acpi_match[] = {
-- 
2.25.1

