Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EFC42129D
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Oct 2021 17:25:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B472E16C5;
	Mon,  4 Oct 2021 17:24:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B472E16C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633361103;
	bh=s0LjQpFBtfzzO5rJhiocxBv5A7thuHwG3CliUsFmdlY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gh9MX6QCxjSaH+gtlGlTyCpH/OOHId/bX9HKcAcF/uNUfBEvaAsCF2v2xbKlqASO0
	 pHZEECqAZlNFW8pwfJk0osZtUkWId3vqsJhAkZWbezdNgafmDCoDlfDHN+84VFfPw6
	 QV/Gk5lv8nxKd6b1Q2TDsXwjol/i19wSGYpq1EAQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97B39F80517;
	Mon,  4 Oct 2021 17:22:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D78DF804F1; Mon,  4 Oct 2021 17:22:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130041.outbound.protection.outlook.com [40.107.13.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37879F80229;
 Mon,  4 Oct 2021 17:22:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37879F80229
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="KuFw7bH2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DgLZlrL9z542j3e17TCea7fXTzX7GE1moO8ph/mxXjNItiJh8/od/Ia1lTKZK2bv7ANQecZAKyYe1GAxDIVijuOpjoYYT6qOKR9BkEV5KXL7gEzlO4k6mL+xKD4zGMiO2fc2OgMj9bF21n3l7cdBJONT9hUeW5SKKCb7RjI8/5ZZvCR78grffaAEViSMkguqyQIKU5M+CquTrIdRLe8J8NFT3cGnXVkql51VXLmNau4l63/S5GdpaE0yoaw1XaMVwmyZYWuhZ+XcmSTOvfQ4XD3OfO9Mh0UtlFEHHBKTHVJtR/+9KPM/TitstxRTwXel7x8/BQM+Hz9/brJ1o3Hy8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z5R7jA1eGPzE4fzA4UUe8mybDZMXJChRLgA7/f3GPrI=;
 b=W4Hl83z/FlgcR0Ps8U+95Mn+tv1YhZk7J1hoyk2r8IbuyQi4xRAKrjr1pfNGglils27S802uWYAXzqaU9C9cdR1BSwFvdgPFShuOK1Sfh3N7qxl1P6zJYMl/5UmgX+rY+MDAXswEAKRmWKS7FSN3ycOzTowdknGCXdm3agBrXaUE8Zxi0/iEFJXn+57ElxZw4NbXSHxQ8ly0m2M7Gk6EUI9qLd+1A0QHhcil0gsoC/stuD8MXqP3mw2cIcaeVZXb30famG79L8oTSRLmdLHON+nvivfZNTw0+davF+cqs9YWqZbiSbxHeCaGhFmG/ApXnHMd3m4yvi4JJDUUWuImaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z5R7jA1eGPzE4fzA4UUe8mybDZMXJChRLgA7/f3GPrI=;
 b=KuFw7bH2vgFsw7Vamvi7PiHg2blCCgqPcjJ3E6khLM8LOlzdePUkzzo6pcqW0DXMmkJZEAj3emhkcWShAKO7uto3E8nZ09PCmeEgl+CQihu+6aWyixqklGRkh5aiTD2mTqAZszsGXXUM152dldsXosnN011HxZd3t6wnf1jRyXM=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB7069.eurprd04.prod.outlook.com (2603:10a6:800:127::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Mon, 4 Oct
 2021 15:22:17 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::9968:6eca:45c5:8af4]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::9968:6eca:45c5:8af4%7]) with mapi id 15.20.4544.026; Mon, 4 Oct 2021
 15:22:17 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH 3/4] ASoC: SOF: imx: Use newly introduced generic IPC stream
 ops
Date: Mon,  4 Oct 2021 18:21:46 +0300
Message-Id: <20211004152147.1268978-4-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211004152147.1268978-1-daniel.baluta@oss.nxp.com>
References: <20211004152147.1268978-1-daniel.baluta@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0801CA0068.eurprd08.prod.outlook.com
 (2603:10a6:800:7d::12) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (5.12.247.65) by
 VI1PR0801CA0068.eurprd08.prod.outlook.com (2603:10a6:800:7d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13 via Frontend
 Transport; Mon, 4 Oct 2021 15:22:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af93107c-785f-428d-6c12-08d9874ac040
X-MS-TrafficTypeDiagnostic: VI1PR04MB7069:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB70696AA10460EE821EB1CD3CB8AE9@VI1PR04MB7069.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tuW8maISv1dJCXu+TPSrvj5hcqQcVFWiz6d12sBpM2tfJeTGY7MWUdWRA9pkPQAuk9xm0jsHMsJ1uhpO+mWUK6irFMoSapNVnpE9sEZl13FSODlNvibgme1Ub5cjYZPaEB5id+8J73WgojkKBOtzSsE/M5peg66xSu2lW0K7I3HuVYG40p2kYEGXSOEZ+/QxEu5RAMHpVwxAiO2dnLhWdEGJxAJsaJdjGNjbELDXqrcJfkdcRGyM/Tc0ULjQQ+uZWhTggXqD9GbQB+5ojh1apVOn6opC/YlRw2ZneCH/nn7BbDDmPJ65ut15HXbC5J7vZYyWe0vsZUmpgzrbgbNkHOiVSmv1kxK2YyOthmlRvFrqWLGlg9sZi0W51nqhBryRB/eIa8ZWx1mG2nen5JyLake4nJD4myuJ6dri18dSMNirshVvGjkaXc72hihAWv7nBaFTcpBnh0Ey9GljMU+DR+NikshAL8WBCZD5cqqJCD/Bo4megWKi6wZJZDpVDkSk4wHTCcMW/iZLgxhB4PXOCvF6WX+k2ag4WoufDAIxZ+OVJwjdrxVscOYK/TfQlhIwozu0Vya27pqLfPvibsVY9uqBi0CxLrP8wrw168ITmVTpYV2epEBo79bkujYx/KJE24Iu3QKmKYGrOL2n/CPnY73HdgTH/Lmx3gGXp6w3sEQESel2LYj2Ld2XGKcVmQIWxOPi7nwRfsNKBMKzn/t9unSAeu8oEq+Cuoi5L/8FLJw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(1076003)(186003)(8936002)(38350700002)(86362001)(38100700002)(5660300002)(2616005)(8676002)(956004)(2906002)(508600001)(26005)(6486002)(66476007)(52116002)(7416002)(66946007)(6512007)(6506007)(6916009)(44832011)(83380400001)(316002)(4326008)(66574015)(66556008)(6666004)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlBsbWh0Zy9tamxKZlFnZFlpdDZ4cmFXVzJWMkpaMkhLUGtyQzRhQnE1ZGFn?=
 =?utf-8?B?RzBFbGd1WkZHWURvOEF2RmxuOGh5UTRnaXdPN0ozOHFjTDNuRi9WZFFqT3J1?=
 =?utf-8?B?djErNTNyUzI4R1RaVEhFRUpsaGxDSFF4aCtWT2tYTG5QdzFIZnpGUURNek1q?=
 =?utf-8?B?alpGR21VbnlNSUd3dnUzbzUzZDhSc0syb2Z4Z3M5eTc4MzNNMk8rSG1TMklZ?=
 =?utf-8?B?MEVZSXFzc3NZcGtBZnhqQ1c4c1JKUGlLSEJCWUpRVGNLRThkU3d1WlZ0bnk0?=
 =?utf-8?B?N3ppNGZIUlJhVUhQNkxld25vZTFrOUtITldJazZLdFpVQW1zSWJDZ2FkY0tj?=
 =?utf-8?B?QWxmTWpaOEZEV3VhUUFYbldXRXVhZlBFOWtIWUl2V2xaOUpXUEJtL2JHVGl1?=
 =?utf-8?B?TEVNVEpyUnBXYXE1Q0JQOGM0VitFNU11dFI5c1k4aWZLbk0wQW5qY1orWXp6?=
 =?utf-8?B?VDU5djBwQXJYaDl3eXI4ak5SUyt5Z2dQTGR4ZUNEcGp3a2FNek5vWXNnMmt3?=
 =?utf-8?B?a0dJVEhkU0dBYTkwTG92VmtZUjBiTzZsNU9EYStZZVVlVjc2U2hsUU1hTWxu?=
 =?utf-8?B?RHhzdGhZN1M1MzFsa254VE1nRDdmZTBHS0pBQ1B2K0tPek9Pc20vUVRuMnd5?=
 =?utf-8?B?L3lNRU92SWR5TFFCdlBqWHJxODNKNXlqbUFwZ2NZTC9zREZVcTlNemhZSnl0?=
 =?utf-8?B?RFRZbXlMb0xuS0lJNGZmWmlpbFpYYzUrMEhFMkRDRUVtL1Nza1FSSW5yZWRB?=
 =?utf-8?B?R3g5UmVZRUhOSjAzMGNDMmFvdFpjeml2RXhwRS9SSm54cEFSU1FScE9uTUpB?=
 =?utf-8?B?eGVDSnEwc2dMN0ZwSGYza3I2WnV0eTQ5aW10eFlIbGpaYlRlWDZ6dFBBTGlT?=
 =?utf-8?B?TTRWQTdhMktLVmV0Z2JqZk9hRjRsc2R5NFM0c0FVRjF3RXlnM05jR2JraXMr?=
 =?utf-8?B?TW9rblMraXEzZTFodnNwOWxQdzBHb1p1YUc0SzA5TTFsYkQ4UHJnMkl5OVM5?=
 =?utf-8?B?VEM0SURjZnNUVG4rMzltWlhGZTRWZmtjdm0vdldQM1VRR3pBaXMvWVN4Tmc2?=
 =?utf-8?B?QVV2U0s0aWFhSzdQbmlOREtyVUZTTjR6M0hjSi90VFhNWFl4US82MW5SSUdz?=
 =?utf-8?B?aTZBRmNTMVU0TGMrVHNzb3VXVnk5Uzk2RzNNM2FobnBmRllucS9MdHRZV3hY?=
 =?utf-8?B?aFA2ai9vbEJQMEJ4L2NDbVU2QTJvNDIzWXllZCtMdW8yNGJEL3hSK3ROay9R?=
 =?utf-8?B?M3Bta0phK3d0VG9sMGpwc2I4RUVDclBtcURwMDRMN0lsZ2hYRnBpQytRVWhu?=
 =?utf-8?B?TVZNZlcxbkxCZm5wcmRtbDhaZWVBak1QZDNkeEZYVjNFa0VVNzVyOHZvSjZu?=
 =?utf-8?B?dzJKN1Y4a1gvbElDWFlIdUhHcVdtK2gvR2gvVFJJbnZDbUtGOUVtQWJFMkxT?=
 =?utf-8?B?WVI1V0tCZFY2bjlucmgvRjJFcHgvZVBkMkxhZkFIQkxhMjlpdjNwQXMvNGFV?=
 =?utf-8?B?ZHZzMzJLRDcxeU96TDUyS3AybEphN2wvdzVqc3ZUZE9DbHZUWE5FUG1Jb0lF?=
 =?utf-8?B?WFhQb0xvOTBtbFlxc2RyTjhvMDlGZWFOa3BhUnBhTDRaSklBcXBiS1dMNnJZ?=
 =?utf-8?B?UzZtUlllNmRHRGxzWGlLOFNnUWdrUUxRNkh6aEpOTTlrVEpYU1B4VmVYL0VF?=
 =?utf-8?B?YS9SMU9rS3NHWkkwTzM5S2RzeVVOQ0UzNTlOeWVNSFcxTTJXVTBHMU5GY01q?=
 =?utf-8?Q?M+QV2uMMnXoEFEyq3FFb+v97B0AowlvXdSZtX4P?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af93107c-785f-428d-6c12-08d9874ac040
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2021 15:22:17.4481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4OV7+ajkjv9eeOw0NCwB3DUuea9fa+30TD6IbpHb04leWnMPnXYpBY/Nk7vHnfi5ft+Mz9NLQzCsO2DL26j7Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7069
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, budliviu@gmail.com, yang.jie@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 peter.ujfalusi@linux.intel.com, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
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

From: Daniel Baluta <daniel.baluta@nxp.com>

This makes IMX use the newly introduced generic IPC ops
instead of imx specific ones, and removes the old IMX
ipc ops, as they are no longer needed.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Bud Liviu-Alexandru <budliviu@gmail.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/imx/imx8.c  | 31 ++++++++++++-------------------
 sound/soc/sof/imx/imx8m.c | 22 +++++-----------------
 2 files changed, 17 insertions(+), 36 deletions(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 75baa5209a89..dd59a74480d6 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -376,21 +376,6 @@ static int imx8_get_bar_index(struct snd_sof_dev *sdev, u32 type)
 	}
 }
 
-static int imx8_ipc_msg_data(struct snd_sof_dev *sdev,
-			     struct snd_pcm_substream *substream,
-			     void *p, size_t sz)
-{
-	sof_mailbox_read(sdev, sdev->dsp_box.offset, p, sz);
-	return 0;
-}
-
-static int imx8_ipc_pcm_params(struct snd_sof_dev *sdev,
-			       struct snd_pcm_substream *substream,
-			       const struct sof_ipc_pcm_params_reply *reply)
-{
-	return 0;
-}
-
 static struct snd_soc_dai_driver imx8_dai[] = {
 {
 	.name = "esai0",
@@ -438,8 +423,8 @@ struct snd_sof_dsp_ops sof_imx8_ops = {
 	.get_mailbox_offset	= imx8_get_mailbox_offset,
 	.get_window_offset	= imx8_get_window_offset,
 
-	.ipc_msg_data	= imx8_ipc_msg_data,
-	.ipc_pcm_params	= imx8_ipc_pcm_params,
+	.ipc_msg_data	= sof_ipc_msg_data,
+	.ipc_pcm_params	= sof_ipc_pcm_params,
 
 	/* module loading */
 	.load_module	= snd_sof_parse_module_memcpy,
@@ -451,6 +436,10 @@ struct snd_sof_dsp_ops sof_imx8_ops = {
 	.dbg_dump = imx8_dump,
 	.debugfs_add_region_item = snd_sof_debugfs_add_region_item_iomem,
 
+	/* stream callbacks */
+	.pcm_open = sof_stream_pcm_open,
+	.pcm_close = sof_stream_pcm_close,
+
 	/* Firmware ops */
 	.dsp_arch_ops = &sof_xtensa_arch_ops,
 
@@ -489,8 +478,8 @@ struct snd_sof_dsp_ops sof_imx8x_ops = {
 	.get_mailbox_offset	= imx8_get_mailbox_offset,
 	.get_window_offset	= imx8_get_window_offset,
 
-	.ipc_msg_data	= imx8_ipc_msg_data,
-	.ipc_pcm_params	= imx8_ipc_pcm_params,
+	.ipc_msg_data	= sof_ipc_msg_data,
+	.ipc_pcm_params	= sof_ipc_pcm_params,
 
 	/* module loading */
 	.load_module	= snd_sof_parse_module_memcpy,
@@ -502,6 +491,10 @@ struct snd_sof_dsp_ops sof_imx8x_ops = {
 	.dbg_dump = imx8_dump,
 	.debugfs_add_region_item = snd_sof_debugfs_add_region_item_iomem,
 
+	/* stream callbacks */
+	.pcm_open = sof_stream_pcm_open,
+	.pcm_close = sof_stream_pcm_close,
+
 	/* Firmware ops */
 	.dsp_arch_ops = &sof_xtensa_arch_ops,
 
diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
index c7d3d898d5a4..e4618980cf8b 100644
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -239,21 +239,6 @@ static int imx8m_get_bar_index(struct snd_sof_dev *sdev, u32 type)
 	}
 }
 
-static int imx8m_ipc_msg_data(struct snd_sof_dev *sdev,
-			      struct snd_pcm_substream *substream,
-			      void *p, size_t sz)
-{
-	sof_mailbox_read(sdev, sdev->dsp_box.offset, p, sz);
-	return 0;
-}
-
-static int imx8m_ipc_pcm_params(struct snd_sof_dev *sdev,
-				struct snd_pcm_substream *substream,
-				const struct sof_ipc_pcm_params_reply *reply)
-{
-	return 0;
-}
-
 static struct snd_soc_dai_driver imx8m_dai[] = {
 {
 	.name = "sai1",
@@ -301,8 +286,8 @@ struct snd_sof_dsp_ops sof_imx8m_ops = {
 	.get_mailbox_offset	= imx8m_get_mailbox_offset,
 	.get_window_offset	= imx8m_get_window_offset,
 
-	.ipc_msg_data	= imx8m_ipc_msg_data,
-	.ipc_pcm_params	= imx8m_ipc_pcm_params,
+	.ipc_msg_data	= sof_ipc_msg_data,
+	.ipc_pcm_params	= sof_ipc_pcm_params,
 
 	/* module loading */
 	.load_module	= snd_sof_parse_module_memcpy,
@@ -314,6 +299,9 @@ struct snd_sof_dsp_ops sof_imx8m_ops = {
 	.dbg_dump = imx8_dump,
 	.debugfs_add_region_item = snd_sof_debugfs_add_region_item_iomem,
 
+	/* stream callbacks */
+	.pcm_open	= sof_stream_pcm_open,
+	.pcm_close	= sof_stream_pcm_close,
 	/* Firmware ops */
 	.dsp_arch_ops = &sof_xtensa_arch_ops,
 
-- 
2.27.0

