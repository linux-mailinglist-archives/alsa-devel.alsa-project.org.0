Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9B940D3F3
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 09:39:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FE9517A3;
	Thu, 16 Sep 2021 09:38:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FE9517A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631777954;
	bh=xH9KlMOGL3Z0J03t21xk+esxjyGX5GusOGRJxXMKVm0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=X+d1uS5gdCvWFxldPhdbQFaVE8amIclLk15xlxQtzS9Gb9n5BTvRp9RuWS0em49L2
	 V8LmYKet7syBOP6yo2DG/lQSgU3iXiIWmCAED0b7WnPV+GsM+olIH0n1O1sp4dyggF
	 mH741RYA+V5xKIe4V/oicXDm7oGcPJGkumTOR9Is=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E256F80271;
	Thu, 16 Sep 2021 09:37:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74CE1F8025E; Thu, 16 Sep 2021 09:37:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140040.outbound.protection.outlook.com [40.107.14.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B0DFF80113
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 09:37:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B0DFF80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="lHdnC6zF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E13SGsKYid0PJa7/nYzx2FpeoS+aYBj/LpQ0AIJ7WQ7CIOlLx30Erzy0JwSifNQ1CquJoeXWXjBiB5a1btkjn9npuGYChSVisygmPoGbTN6pQJxNG0uOAB3+IrbnYtj0tw3GMsOf224b62rxezqey83b085bWjVUelt1EmBP2DdDT44DvdKIFsqyo8mvg+bbwDKKZ5JsMTPu8CYVIxeubi9//hm9eYRSeG21mbcju2Erb49/kxL6it+XCpmkaDKeSk/5BetYaeWq0pjPt44Zv+QjYUV6olpcum/WhmGaM9lI3c5TmtTdfn8SIrHrkpFHEDJFcK+ywMMke4QOxEfO1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=aqCx/CQplLdxK9NZIp3faYRxPhfy4lPnJvblxwalcuM=;
 b=cK6nuA8AWhTJHXKLng2U7i2I1gpTML92fI0aM7tEwdnNKQsapx4rizOza8XD2BhtQND4t8yRrQeHxmXYF7AP/hJ0uGdkx93feWeEAz/w0GoM9Al07T4sHZg3B3z8lyfPraE9m7ojwNmoESkrXCwt/YefLdo0+O4xtz3N8WfiuwQ/e6BZKsGT2wtGyx1K2fNroWUPDChIF0Ztyo8JiAFP1RHD0Wf9bzgX+FmeHFb5iH6Um1XvCD3rLtmVicB5y/cETZUbawqr7g9foEStRHojd2CECXjO2A/dQSAIKl642vn7q785fM9Xm79/g7N+iTgv90R1N4yK1qNtIwDuHjHEoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aqCx/CQplLdxK9NZIp3faYRxPhfy4lPnJvblxwalcuM=;
 b=lHdnC6zFzv8gqtrU/kr4EPZggIHzUwSx7WqQrvmbSCr2mXNttasti7aVi/zzPtGpZNJ4CAO0mqpZfkMdd+7O6DJl4o0mSxtyKy4gDqFbL5Xt+5tZFICSHyZa2kgApKcnRfo6FNxRCrN/5A3i7iXBwObBnEwZFehD95CtBCpnfRM=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB6877.eurprd04.prod.outlook.com (2603:10a6:803:131::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 16 Sep
 2021 07:37:44 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::499b:ba92:db2e:3f28]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::499b:ba92:db2e:3f28%7]) with mapi id 15.20.4500.020; Thu, 16 Sep 2021
 07:37:44 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH] ASoC: SOF: imx8m: add SAI1 info
Date: Thu, 16 Sep 2021 10:37:25 +0300
Message-Id: <20210916073725.359561-1-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR08CA0003.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::16) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5708:8600:b29c:ccfa:a961:8ebd)
 by AM0PR08CA0003.eurprd08.prod.outlook.com (2603:10a6:208:d2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Thu, 16 Sep 2021 07:37:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1027b513-d443-4613-9f8d-08d978e4df2b
X-MS-TrafficTypeDiagnostic: VI1PR04MB6877:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB687730C93459E2FA8EF9C5F9B8DC9@VI1PR04MB6877.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:361;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3eIDva90g+WHceQ5XDsAeyHzLIXKFh514HhN+LYlk5nbiK3/kbR1htBZDLR+4kRzpxE2JpIZtgNMKk4uOWFCW+bOAqfrRRSGkwc2JQuyfYbRBp6amlz9iSEnS6M4uPKlKsDDxdZy51/BNbgk8Wixsq2TErEK38ONnrFSD7Gqkk6lNcZghtmoHpAH/K8h91Szc/7uzLvL9qcSfJr0iGtXw2hxyJVjpcyZDseNylARBg+qHu8JS7peamWQpnxS+v9nmQFejKW2qjGKp2Mw5Lj3qImeewNolPobdeWoxEUkd4NFKpdATwhZSZGcxbGkO9s82ys3qLILE0NJbqJEs+fBUGTZTQ10DWRnvsuF4Vdf3OiOy8Q9ZNLg26H6Ibcdolz63grRb9YdjcyH9TxEQMvdcvTtnN3PXhHM/y0xaRopMbeAzECtbfiLHhycyv7+AYoShHj4Aa0eX8kMA+XBwEUcZj0oMmJqBZj9F6skuwk4VKpYMX/N9ED7eR8P0A+IsRITLoCrmNBs0gZsG21KR1z/ya4bRiNDJSF6KWtPE/KIscn+b0h7N0lM86YExbM0ELtvSWiCmVh8dgB0ndenfdJiS7Pc1nZLIx5wxeVl7Py5dS48hZW+53myNcESFuX+YeVcPjXXU4d86J5bJhn211mYUwetwQ+l3bu1XInXRRYvWJShtuLupsTGrw1XDtOSpVQnvAaJw2QOxilVqDnGNPHrOQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(366004)(136003)(396003)(478600001)(4744005)(6916009)(4326008)(2906002)(1076003)(316002)(54906003)(6506007)(44832011)(2616005)(66556008)(186003)(6486002)(66476007)(38100700002)(66946007)(86362001)(6512007)(6666004)(5660300002)(8936002)(8676002)(52116002)(32563001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UtR5ygJfM6qfAFGl3VPV7LqAGpPA6GMR47sLP54lbxrpg6EvrPZxnhknld6Y?=
 =?us-ascii?Q?eqZU4BTfiWnUqme5HEiSjdZdRYRdUuS7ISe1BPfO54l2zQEq1EX85tpr+o0K?=
 =?us-ascii?Q?QTDbHR1gab/6aPjvUnMqWwf4rizXHJGXlipb1w86MEnz4iepm2KASKpp69ib?=
 =?us-ascii?Q?pCrStxvOpBDPMOONhmAOq0/QF3eKOYVRr+bp3a7CXrYveygDV7tVafbr9Gnh?=
 =?us-ascii?Q?d2lHEVplzqL+jZAhvBnXxJGg1Us8N2UujkE4egHAFl3hP0rz4n9dMZ867Jhf?=
 =?us-ascii?Q?k/55+byLzzgSkedKZawzoHWoacrum5V942RD6eKr3HnKLLHM02aHDVIXLpZc?=
 =?us-ascii?Q?l9is8FqoVgHSEjbxCTTSKe1rUCkWpjRIsmi8TZFgfhWbgF9G5vg+JBb3Dxov?=
 =?us-ascii?Q?qXTsLM8u2Yqk0ww2gsVS2PK7mGLmBe8knVaOF6JgX36TwXJraU8nHZWItbpO?=
 =?us-ascii?Q?tOVqrjrMgXcatc0Yr2PMkAEukgGr/q033BjSJWZP4KMz731j2W6gWce23jzk?=
 =?us-ascii?Q?0Zh2L0o2yPQAvC9CuVnAVTGSTstvf8JrhUHzDhkpUMCH7NPmB0KFk5HggV41?=
 =?us-ascii?Q?yaoakj6man+SaApqNeu/qA/QpKcvIKUAWPtIeL0XZY3aYyQwzdAecDGEIUS7?=
 =?us-ascii?Q?i6EEqZE3Wx775MCtiyoIctrzRv8uICedI4bzlqPqVvQGXbb4UHbLCz37szWv?=
 =?us-ascii?Q?7VAGTev2ztRMtZ58jRYQv2tRJFBeJJ6/voN8q9CLjM+CwJUMQajFA0W8ny8L?=
 =?us-ascii?Q?3oSGMfdrWTzhLniEkOwYaQmwgDp85deqeL0uCucLx+rVGeuKEeBJjGjqN0RL?=
 =?us-ascii?Q?G9KSEfBbvNx0TyesQ/hEDbF706QVhdzTO2nWx4SQYMkz6vMwjsdxCi3QzP/0?=
 =?us-ascii?Q?cMD4DxMbIXHlodbBO8CGIngR3GRNbjJMcJu+zkEOl96Pkv0aYzs2aNIiV+TP?=
 =?us-ascii?Q?WCNb9A0TJD3xysH2smczrt3/OZnuT3zBM+AwgaqB7EZ8GOc/eYrLkrlGnEEm?=
 =?us-ascii?Q?cdGAQy72d2jxpdKE3KjX9T2n+3YT7r0yYMxBGuF4KL0vuuTYVmIBlE57+IwE?=
 =?us-ascii?Q?wgkIalvU7ox0dZEk9zu0k43rTD5u77ftxbDobywT4ByKJg4v80iHjjZB7fHD?=
 =?us-ascii?Q?SajZJnncz4opX+ZexOR8/VFsxVUQQ39GiTAgg9ezqfIYxMPaTzoAioi2lNtY?=
 =?us-ascii?Q?QwKLDO1r3HbgKaIysfUMyywlDtFlr+ndHCsOevB41Jx1hMkxeGjz0ZvCjFRg?=
 =?us-ascii?Q?/ESR91wR+gHUJTfBDBzn5+vH800s4hk8XhOXR/aVqNTcj56neuBQlEL8Bu5q?=
 =?us-ascii?Q?GrebFXcoATAPt/2/I0tuOVPd8VixupTzdDzgTRH3q+NIPaTDWfgDZ5ozARPM?=
 =?us-ascii?Q?/LnmtsqaWdpvU9Wh+6a+HzaORdGF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1027b513-d443-4613-9f8d-08d978e4df2b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 07:37:44.3839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ah2fsRCVc2o0h4aukimCvPObwjsNPNuGDbiMhNzaxZiHXmexDgsj3hrL6DLRzpQN4nUwFH0K1+BBfcjeBU3EhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6877
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 Viorel Suman <viorel.suman@nxp.com>, Paul Olaru <paul.olaru@oss.nxp.com>,
 daniel.baluta@nxp.com
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

From: Viorel Suman <viorel.suman@nxp.com>

Add SAI1 instance to imx8m_dai array.

Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
Reviewed-by: Paul Olaru <paul.olaru@oss.nxp.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/imx/imx8m.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
index b9f8a9e8cc3a..6dad87ed0bc8 100644
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -253,6 +253,17 @@ static int imx8m_ipc_pcm_params(struct snd_sof_dev *sdev,
 }
 
 static struct snd_soc_dai_driver imx8m_dai[] = {
+{
+	.name = "sai1",
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 32,
+	},
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 32,
+	},
+},
 {
 	.name = "sai3",
 	.playback = {
-- 
2.27.0

