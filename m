Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EEA66DD47
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 13:14:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 795FC5FB5;
	Tue, 17 Jan 2023 13:13:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 795FC5FB5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673957670;
	bh=ht1XzI/CpPCa26wNFaL6jAjlsei36vjnqy2UhU5uD1s=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=s9IVIW/LA+0bT6E9uIBTjHhYZdTQ4KXlrhMS+9inW2ZRRf9A2DaZ5b7JjE4OkgYN7
	 Y9F6GqcT+IX+JUOA87JAzYaZqnraqD5nN9mufaUazvUi8SiloNyj8wbvjxER8g9/WV
	 xXP3TXYliBLoaYnLGSuUvtCqd4sJqyTp3dYEmDCM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23010F8023A;
	Tue, 17 Jan 2023 13:13:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 244DAF804DE; Tue, 17 Jan 2023 13:13:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2067.outbound.protection.outlook.com [40.107.21.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57FE1F8023A
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 13:13:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57FE1F8023A
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=agcrRbAc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NFUzXhKg8FIj6aPX7XMqjpcRoBo764N8lZ6bRGUJLIfyKDUO0hPgotqHFxPycI/Gr9OtVYx9AE+egNBX+0IYtnURvgHqyo0KPqOnSTEM0vfvsd1CJvqUletxvtZHWxTL4zumS99zWJQVtsiX5UFzPIbH0juNUAtTJ7SBb05gunARZMbnUZt65j/hEG2JtAJw6lvHwz2kN1psDSWWW7JR+rxsAYE/1qEEw7sj02lNf5zduF4nLGACpMrf0BWDAGQwQM5Xq8CYBnGdEZAiUF3vDLGBFNEKpQ4T/lRc/AwRDh4+05i8BfujcOhgkmzMSWrk/QJDRvJpUWxery68+5VMPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ym3tOfme/j3Af/t+Fb5plfcF5ZXvt0rSxk6QJ/3pSJU=;
 b=nHgcqmwfwEgKrnmDoc6SDRggEuaLYrlFDo6HawDjs7ASnbh4FtzNFbgn1bxdq1QiApr49cY0mLoCUsxEThB6C364MXYDWQySrxYbhoALIQPLG0aWzqY9rlF2uy7MbC78uDktsgrNZ1HUD+1Plnz6P5jdYMCyf+6oGtTrnEHQiT2nuVlpgvuGgWIspgZnD4v08Cd0ZdGMdOYvXKdFevK4dcqJwKRw1K+21/1l7vk9fWWmpreCvlaU8aiupGPvBCanRgTAiYW8OgqDfe2pvipH5Y7rv7O71naMliQkJLHnpPfTKAg83QJKW6lX/wwyDLdkx5CQOoscYQO6EXCmdUksHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ym3tOfme/j3Af/t+Fb5plfcF5ZXvt0rSxk6QJ/3pSJU=;
 b=agcrRbAcG4n+qjJcI7q79oal+AZq1xgS4+3rMwMrj1KYOVpOrvf1XviIaHozPhZWc6OkurGnN0FPQLGVhpWQ8XpEvdO7b/k9Uck3FtMItASqsYoe2QrgQrkiwBjWBgwIWrl7OczEr7EweVhHtNbGUAgg2G9YK8NIEoEitYBshGY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by PAXPR04MB9373.eurprd04.prod.outlook.com (2603:10a6:102:2b5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 12:13:23 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::b6f0:fe1d:5509:c226]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::b6f0:fe1d:5509:c226%4]) with mapi id 15.20.6002.013; Tue, 17 Jan 2023
 12:13:23 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH 0/4] Add support to compress API to ipc_msg_data /
 set_stream_data_offset
Date: Tue, 17 Jan 2023 14:13:03 +0200
Message-Id: <20230117121307.200183-1-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0040.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::9) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5151:EE_|PAXPR04MB9373:EE_
X-MS-Office365-Filtering-Correlation-Id: 746d4b31-1202-49ae-4090-08daf8843ace
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ekf6RqgU0bKPUm4oQkrNykui0XjFNTdkPuRsEj/1VXmQxuPHG23QQk0rwlOh5rBSk8lKQ1R2CfFD4gT2rypCR+VKSG1aroQevDpkz3QzBV7yikOQi6z+VVUxDbMAyysGt3zDfBW/VsV2HBOv4UyMsNoDONkkZJDG4GH/5EXMM/ph0yhghMZM1YBtBlSfndYhffAqjjx2hZRzZ/qL2j4LOcy1usMKHgk8y+3gwGrea19o1SiWU/2TAaCrmfGiZXJEDF83agRbSFYt/JIJwxDVAvcdgI5RiUohkjuYjAKCgIqeDoAEL5rp7J59vEnQmMtKboeBfkCoF3P6IgpLquBfpi3Zqd/Fu+zZs+mNIeek1JHDrDCnfaO/fgMwZ2NiYLO1DWAdtTonqSFUGe4w4eGayBMPApf+6LTJR1A9Mgqq392miyp7REFW6y4MzqBIBaRzpz2zNS0GwgCzR/z6+rZFoyhXmPLg7if+JM4w9e4PcINtKCEJb77sW1Df6QU9hQnImAoUB/NA0rjj5c0SxZqJlTGDkct5JllvX0fyvgNEeQlOrXfntSKGAODMOKIbEhT0wPxsOazuWUAzF3fw6X6ZnBq6ZyC4ueM1rheJLQ5G5eZqkilJBxfA4KHaCQkMINzyxpJ0211ZWYOJXgcN7Iabi3g/YUvSQvPYdSFDhEf+HuChmxG9ReThAvTvLPiAH2sh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(396003)(136003)(366004)(346002)(451199015)(316002)(83380400001)(6916009)(8936002)(5660300002)(66556008)(66476007)(4326008)(41300700001)(66946007)(8676002)(2616005)(38350700002)(1076003)(38100700002)(86362001)(6512007)(6506007)(26005)(186003)(52116002)(6666004)(6486002)(478600001)(2906002)(4744005)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qNa18jl23IlUxbOWXdnUftgsds7JJQi4xXNi9nf4P+15CDXwS4sHugRr92TX?=
 =?us-ascii?Q?jXrNi4lHVPv1mbE8XOyjkT76FxNFvBtJC+8flDDpgSdAzkftmstoQkwMWFyE?=
 =?us-ascii?Q?WIS4BKm0ucte3SOf5BlRr10g1L8I/J1Tw1SCTU92MqyxAlGuJj8g/X0MNGpQ?=
 =?us-ascii?Q?gTWv6xBZbWbaTUxctf8N8pbuP2yNDy4inuUo4d33mmP3/OOqndHwrp+g2Hco?=
 =?us-ascii?Q?wWoIBbluIDXDojunDWqhIjeEC2EyTkr0uXSWbF7Vcx/5az2KCQRoOVC+4QYW?=
 =?us-ascii?Q?3L5am4UNcJbnCLf/8zIbDH/s9e1OFO+47SsL94legGyoFaZh4zuJItMMJ6W7?=
 =?us-ascii?Q?0FkoS5aYb7PHGrxcQr6Riw5n10oJwVJT4dx5pNFiZ6/B9XAmzDfAUyBII97d?=
 =?us-ascii?Q?/gv+o4oMuvWaeNJJkFnTsNP9FX3WYWLvV9xE3v7C+V8NHAOe2wgFDRi5xAQC?=
 =?us-ascii?Q?CwqFc9ya+DP9nTzdmDrjB43R6rRb18t2rb8MOmWcugClCtm065JRNg0OHDiK?=
 =?us-ascii?Q?E/xW66ebhp4zZBEGj//3kxk1huWvJKT2Mj80B5TeWrsUmZXHX0mfUaUkkKvR?=
 =?us-ascii?Q?Ib2+2p0BkHxpkjJML0LjroG81Tn0AZ23PJ29j3s2toGp/hSVPA5TCyWLwae2?=
 =?us-ascii?Q?+SlgsQP1E549m/km9AlG0arAZKy4NenZiRo6m1Bt6jwmZyksZI6XtELvjrdy?=
 =?us-ascii?Q?6Dp/cV3ra6SKHD9eiQoxaRIEk+fDK7349z8kBYVHQUPfl7HDO6vlBi7VM1sJ?=
 =?us-ascii?Q?k5BySl/q78X3WzmG6D+amkghDkQat1vE3CZag5qLTXbwVmq68TWsYqqY1WWJ?=
 =?us-ascii?Q?3qwPHTa8RelAv5ntwbrSpTGypMed7QWfgl/sr9D0AbYIPOBqvgehEQuGpzRq?=
 =?us-ascii?Q?GPzu+kKmUdg+rnLb3n/qviv+OmLB42q3GfUxY64OJAUMSVqeHXCidY+J7daF?=
 =?us-ascii?Q?9LspqE81ZxRRjxACNSa9uA7vxXJCATaO6GANz9KHbPwHrirRXrhkXte0Odth?=
 =?us-ascii?Q?syuIh7K/9FDDQWXF0gW12TsMW+vfUBKrFLA8C61+OKZOLrNzUKSfRnK4yW+G?=
 =?us-ascii?Q?9IaLcPZj5iMfeUQh7blaWwA09oHCv7XOHD+CKqB931bwVpIoKfUYmkpqzOL9?=
 =?us-ascii?Q?vofmcrfxyPeJvLtcsQX2NSJIOm8RGadlDZH7K/eC59xmqVOErIrE5BJpaQOB?=
 =?us-ascii?Q?u5e6eBMWc4aDrzCcK3OsDQiRD+HxHQHPz/5NxSyKRl4uxI7NjQHVqUg0bm/q?=
 =?us-ascii?Q?zLRvXFuA3io2ypj7njbHmicGMHkBMV0kleEB4zkVRyThdloR1QuRh6yuJdIx?=
 =?us-ascii?Q?ctX2rpkNWDQvBnz02LqF2KZZIr+TmWrMNhR/1vdhtA1W7KJZnnNunDzNoVrW?=
 =?us-ascii?Q?vW88w9MHPs3M1CGBhUMo1YZz2NftkZeodTWACSUZlh/YWNouYfCQgQd7wpRy?=
 =?us-ascii?Q?3HBa21sTb46Jl+Xa3xTLoaqVjaOV4fJJ+In/qzePabxTUjudfMBek9WyjZS4?=
 =?us-ascii?Q?ZICQ6zuUn8Zxs6eSoW4EUJ5EeI5AhiGUs/xINGJUAnMTeTpfFdWTtReZRtoE?=
 =?us-ascii?Q?gk1rgv3e4/74S0Fe/zkrK1MYi/8A9USUShOk4g1d?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 746d4b31-1202-49ae-4090-08daf8843ace
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 12:13:23.5750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OV9qYZd7BUEZP4M22Vl9/yX8Y3SBIbycYXCIy/C0b5ckFVWb/39imllABOzvxPbCdLKGCC8g9PftoirDOwVAUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9373
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: kai.vehmanen@linux.intel.com, alsa-devel@alsa-project.org,
 Allen-KH.Cheng@mediatek.com, AjitKumar.Pandey@amd.com, lgirdwood@gmail.com,
 linux-imx@nxp.com, yc.hung@mediatek.com, Vsujithkumar.Reddy@amd.com,
 angelogioacchino.delregno@collabora.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Daniel Baluta <daniel.baluta@nxp.com>

This patch series adds compress API support to ipc_msg_data /
set_stream_data_offset callbacks.

Daniel Baluta (4):
  ASoC: SOF: Prepare ipc_msg_data to be used with compress API
  ASoC: SOF: Prepare set_stream_data_offset for compress API
  ASoC: SOF: Add support for compress API for stream data/offset
  ASoC: SOF: compress: Set compress data offset

 sound/soc/sof/amd/acp-ipc.c            |  8 ++--
 sound/soc/sof/amd/acp.h                |  5 ++-
 sound/soc/sof/compress.c               |  9 +++++
 sound/soc/sof/intel/hda-ipc.c          |  8 ++--
 sound/soc/sof/intel/hda.h              |  4 +-
 sound/soc/sof/ipc3-pcm.c               |  3 +-
 sound/soc/sof/ipc3.c                   |  4 +-
 sound/soc/sof/mediatek/mt8186/mt8186.c |  2 +-
 sound/soc/sof/mediatek/mt8195/mt8195.c |  2 +-
 sound/soc/sof/ops.h                    |  8 ++--
 sound/soc/sof/sof-priv.h               | 11 ++++--
 sound/soc/sof/stream-ipc.c             | 53 +++++++++++++++++++-------
 12 files changed, 81 insertions(+), 36 deletions(-)

-- 
2.25.1

