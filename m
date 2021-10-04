Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E98742129A
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Oct 2021 17:24:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA19216AB;
	Mon,  4 Oct 2021 17:23:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA19216AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633361052;
	bh=GfEKgbKDIn9HTMKMneabF8HZ0MhPeLdk4JJ5aVK+IYc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oAOky3CWTPT0FV6k4DLtNteCcSYMAsyDd2/X/6MNfwM9LDSW3vMaRRXU673R6S2Mt
	 Xq+SjniGmRgSOVQ9ISlI/jxs8WcqYmRvGMuHS+LkLopjtBdcfQ2gSfqLlklZcfsnF8
	 pD2HRRPKQ1DxGMtFU/VwEXcI5zAulg2K5gMfh2AU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19F1BF804E5;
	Mon,  4 Oct 2021 17:22:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F07DF802D2; Mon,  4 Oct 2021 17:22:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130041.outbound.protection.outlook.com [40.107.13.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADA55F80240;
 Mon,  4 Oct 2021 17:22:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADA55F80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="ZR0OilMY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZZViova8Li+LKkr0LeOp6GnlmnPxVyN551fmnfVz5r/r3AWQZfRg/8yWbQl8mlnTxD78M/VcXR7WXGpF7q4gnFyolxjfYV1pJPowRzWLNTdVmUy9kVCDiEeIX8LPbfVSUzxIFQBBRYO9i0nJhUk+KHQJYz9VIdwQPsC/Y2rURDodwzPbFXFbgXxLFNvj1jZEEXCWC93wEPhavTa3O4XIxYDFdZgj6mBnWvPSiTUGu7Iv7CTMCpuU1+oxEfEJSqNW5RcHXGV4bRk08JufWZQFdnkSBdFfPQ3ZYFswRUC+yeaXEz2QbUiSzDBQXkHvbH6TNvL2jfgQo9EveNOdO92wBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JVNIshrTpY/QQaECK8nJII10AIO2AOlJOEZxsSDMo8E=;
 b=dr9fMCw4rwRH3hdPDyaDlww6j/Oi+fPnda9vHSs2k3/RgzhFxccKcCdMyDfTpCAHDEIFm9XjGcl1j3mjbYJDYdAytumNacQyHXJnnwqhamLc6WDD0WoKFwyZEMm18WA720/Lvf7A3CdObxGtJu7QXnW43sRpDIR/DMa7xjnwIpSymAgPaAB3tVl2a6+r2vPaAP7FnuwSJf31jOIX2lhzjimGKDZGZxSEX+VnfL0cmxmuT4IhVsRO+w5BAhRq/UOPDK5TJlnEN1b51KIObKlT2RazGDPfGyewIVbuf4+D7xoP7t/zhxfH+hRqVvx5DzFmKAQvhzQwoNISJZziPGWMcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JVNIshrTpY/QQaECK8nJII10AIO2AOlJOEZxsSDMo8E=;
 b=ZR0OilMYoiygaEyQKOYBdOKvS3Z7zVKaNSxMTtRDb+8yT7KIKu9H8E1I78YOvvMWx06pNInnc48hF7N2nkN/mV2HgSrDYHQt2iLUE1Hoz0bM3NFYVvxE4iabpbD61CJTYvWChY8BxkH7+AeKGTekydAKaX7rlkJlBtCSAOiLLWg=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB7069.eurprd04.prod.outlook.com (2603:10a6:800:127::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Mon, 4 Oct
 2021 15:22:15 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::9968:6eca:45c5:8af4]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::9968:6eca:45c5:8af4%7]) with mapi id 15.20.4544.026; Mon, 4 Oct 2021
 15:22:15 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH 1/4] ASoC: SOF: Introduce snd_sof_mailbox_read /
 snd_sof_mailbox_write callbacks
Date: Mon,  4 Oct 2021 18:21:44 +0300
Message-Id: <20211004152147.1268978-2-daniel.baluta@oss.nxp.com>
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
 Transport; Mon, 4 Oct 2021 15:22:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea2f8e40-ed8e-4c6d-368a-08d9874abf1e
X-MS-TrafficTypeDiagnostic: VI1PR04MB7069:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB7069BFA218639A973CCCB7FFB8AE9@VI1PR04MB7069.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3Ww2wsDfyPbyWHdOP8ZHw4/bolWUSvtiVKgwjaIJCiec5iCOak1qu3r29O0li+Zo/qchc7v1CNiFnmqAudBAY99PW/wium8utdAKW7igsiYHs6L7bZn1uJSdotk9O6FiGkPnwFtU2EmtW1ao1cdU+RZ2b4kbZBCfG3r5FDnmOjDbosy4prRP79l7b3MslzgkA65DYpDDikadfLgIPSckFME5ZFqd0r1v2a6KWK7gDE2ZtyR7SjOypTBQXl6PMA1RVRcWotKU3Mw18jNA+vmyuzhi8W3uZipRO4FFFTpIkNx4hP33SD2ZADDDUs7w9xXMM+bqnsRRMVnKrbjXYt9G+ST8pQwsuVqx/QtLqQF8o+GIuJcOEaV/0i9m1TMSH08ZbZm7HPiAVtwsyLzAFBnfZmLou9PT8QwhDPt8caHe3jJu5kuikvqrCzBEiROg+lryDhWytKWCSPfWE3pp7PimG+Il4GLhD/kX8jZniLsQdVgc23WZGKcB8ywYNGGdLXKS8CdGOCtrxQFPMlTRTM+XvknuuIA6M9CdSaI4mp3HU7CpcNC2rNSF7vhbeJ7Iu0o932lNLzmKht6zaKNH8oDBRKr5O60koyfWY8ay3Ns+SBiXmIKjqY5jxuFjG145RAXo9FSSKHxpP0SvDFFqF8Nsf5pAUQ+5dEpHoIJBp5JyA4i8+zo5fMW0Eo+k6GR1wViAtAdlax/JIOqWIQRY1ecboQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(1076003)(186003)(8936002)(38350700002)(86362001)(38100700002)(5660300002)(2616005)(8676002)(956004)(2906002)(508600001)(26005)(6486002)(66476007)(52116002)(7416002)(66946007)(6512007)(6506007)(6916009)(44832011)(83380400001)(316002)(4326008)(66574015)(66556008)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlgxOE8xQkd1NGtpcHR3NS9CRTg3eHpwLzgxWXlJWHZDVFFKN0ZNUlpCZjRV?=
 =?utf-8?B?eFhHMWhyNWtlQTlEd3BTM2Y1WllvWHErUlNMRm9ZVHJWaGppZmdpNDlxNmQ5?=
 =?utf-8?B?eVJ6Qzl2bksvTVZldE8weWp0NjZrN0Q5dll1WWs2WUVSai9xN25qS2htYXpZ?=
 =?utf-8?B?OE1WTjZDdUJtU0pPV1YyMk1GZEdxanVXdzdDVTFlbW1VZCtKYmF1MjNyc21J?=
 =?utf-8?B?dEQyMWdOclZ4ckswVUZIM0tHMnAvNW1oMTRYejNEQnNmaFRwa2d0Qmd5eVNk?=
 =?utf-8?B?U0ZrWU8yQ0pKOGZUNHhpZjJoSE4yWE9pa0ZFZElFQVVwQkdvOS9qMHBlNG94?=
 =?utf-8?B?NmFpYmI3WXFFWk9KRG1pdTVKdnlTVGl4a3pRSXJQVmVaeFV1bFh2eTNDU1ZH?=
 =?utf-8?B?VWxqck5mRGhYMXJlZjk4YmVkRVRQNHo1TS96NHpQdjUrb3JDUHptQk5OdXY5?=
 =?utf-8?B?V0ZOV3VPSFhMUlcrRnloUGdHTXdlNU1HOEtNMlU2dUlpRnBxakFyem9FRXN2?=
 =?utf-8?B?eGhMYkdKOUwxakxIMU1Sbm5LaldLOUh3TFJONCtHN1JTVEVWSy9PeDFSQVYw?=
 =?utf-8?B?QUxjRitsQzRtQXdJRDlLY25rR09MdytHcXpPYkpaRzU5alEyYmNOSTNRZXpu?=
 =?utf-8?B?Y1lwcU53OUZHTDE4YTN4QlRYNjVKWHF6ZE4yWXptVnZ4eCs0NkZEalovNDdz?=
 =?utf-8?B?Z0gyeThCaVpsQlI1NlFkaHZpaUU5djlTSTRvMWptT0pia3VYUnBKREpKcWk5?=
 =?utf-8?B?b0VOMysrWU1Sd3YxMEs0NURCVmk2c3RvY3NsVUlnRUJzdzM5RFNUd0Fab3Fw?=
 =?utf-8?B?RzcyQXlpbFdyZXo1K3d6bkhoVW9YTUYrRzBpR1dodXMzWGJFNk5SZFFhRUsv?=
 =?utf-8?B?WDRXdWFQNStNZG5ocS90b0xEOVZwUlhlUm9NSjlONytKM21VTHhqeEtZT2Uz?=
 =?utf-8?B?OENQSlVhQ1dLSE5BOU5rQlQrTkgvb2VHU3ErcmZNcGNSUlpUR09yblcxdWdo?=
 =?utf-8?B?YVk3NzBXLy9YRzl4bjI5aThRTmtBSnhLNUZsL3pRdnY5THh2WWplYWI3SlUv?=
 =?utf-8?B?aDJ2bjROaDdadGNGbXdNRlZZTUJPbkFsRnd6VTY3U1JCeldxaHZyVFNVcnNO?=
 =?utf-8?B?SU55TDNMVTJPWDArYmZQR2djbTVDeDAzdGRIUlNmRTl4dnl6eVQyekJuMWM3?=
 =?utf-8?B?clB6cnlNZ1h2czBHekdueXMzMmdWNmxhS2ZwQVFTcy9rZ010cEI0aGhFdFBW?=
 =?utf-8?B?NW82K01Gd2xkNEhBTkVkcTNWZVQrTEpsYVZRM0ZMV1FtcWN6Vjk1SGxkRnNt?=
 =?utf-8?B?WXVuaDZNWFhPbkEySm4yNWZLNnhJa0d3Y2ZKQUhva2RpdUlZaW42d2tZa3Rt?=
 =?utf-8?B?Mm01SEtKMGl4MHhsYVZiYXFvSWtYRmlnYkh0VTd5OUJUdmRCZzlRYzlUbHpk?=
 =?utf-8?B?NE1wejgrREljSUozMUIySEdFYXEwQVlIR2FXNmVEMVNQVkxXTm5qWVZicGh6?=
 =?utf-8?B?ajFVYUl1OHNwbFNnNHFLMVZyenFZTUk4aDh0UFhwTVZyNE1hSlJuc3pwOTZN?=
 =?utf-8?B?T05KTzlrUW92bU5KNmt4amJsUUNVbmlDS050R2NnczQyVFNQT0p6aVRhL3Vo?=
 =?utf-8?B?LzFKaTdMZWl1cVBGME9HSUtFbFZuL1YwWUE0SVVXT2VkbUZLVmQ5SmUvNTdo?=
 =?utf-8?B?OEdYYXhRVTVzUCtGdkFxZVVrekRKT3VPQWVMMHB0YjI1NHJjRUcrVmJTYnJ2?=
 =?utf-8?Q?+E8vsPU/1Ncn1EUCJ8a4eYtq6MkYwuRPDhLB5Vb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea2f8e40-ed8e-4c6d-368a-08d9874abf1e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2021 15:22:15.4842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xyFuyKhm/6N/aXex5U7LVeY6+0snMGHBxuGul82lD7oLyqj3NpD5d6FqfZdEuegmpj+qyUAsTON9i76NonqEJQ==
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

We need to introduce snd_sof_mailbox_{read/write} in order to provide
a generic way for mailbox access. These routines are optional, each
platform can implement their own specific routines.

So far, all platforms use mmapped I/O thus they can use custom made
routines sof_mailbox_read / sof_mailbox_write that use MMIO.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Bud Liviu-Alexandru <budliviu@gmail.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/imx/imx8.c      |  8 ++++++++
 sound/soc/sof/imx/imx8m.c     |  4 ++++
 sound/soc/sof/intel/apl.c     |  4 ++++
 sound/soc/sof/intel/bdw.c     |  4 ++++
 sound/soc/sof/intel/byt.c     |  8 ++++++++
 sound/soc/sof/intel/cnl.c     |  4 ++++
 sound/soc/sof/intel/icl.c     |  4 ++++
 sound/soc/sof/intel/pci-tng.c |  4 ++++
 sound/soc/sof/intel/tgl.c     |  4 ++++
 sound/soc/sof/ops.h           | 15 +++++++++++++++
 sound/soc/sof/sof-priv.h      |  8 ++++++++
 11 files changed, 67 insertions(+)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 0247806be8d7..75baa5209a89 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -428,6 +428,10 @@ struct snd_sof_dsp_ops sof_imx8_ops = {
 	.block_read	= sof_block_read,
 	.block_write	= sof_block_write,
 
+	/* Mailbox IO */
+	.mailbox_read	= sof_mailbox_read,
+	.mailbox_write	= sof_mailbox_write,
+
 	/* ipc */
 	.send_msg	= imx8_send_msg,
 	.fw_ready	= sof_fw_ready,
@@ -475,6 +479,10 @@ struct snd_sof_dsp_ops sof_imx8x_ops = {
 	.block_read	= sof_block_read,
 	.block_write	= sof_block_write,
 
+	/* Mailbox IO */
+	.mailbox_read	= sof_mailbox_read,
+	.mailbox_write	= sof_mailbox_write,
+
 	/* ipc */
 	.send_msg	= imx8_send_msg,
 	.fw_ready	= sof_fw_ready,
diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
index 08d29f095d51..c7d3d898d5a4 100644
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -291,6 +291,10 @@ struct snd_sof_dsp_ops sof_imx8m_ops = {
 	.block_read	= sof_block_read,
 	.block_write	= sof_block_write,
 
+	/* Mailbox IO */
+	.mailbox_read	= sof_mailbox_read,
+	.mailbox_write	= sof_mailbox_write,
+
 	/* ipc */
 	.send_msg	= imx8m_send_msg,
 	.fw_ready	= sof_fw_ready,
diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index e6a1f6532547..917f78cf6daf 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -42,6 +42,10 @@ const struct snd_sof_dsp_ops sof_apl_ops = {
 	.block_read	= sof_block_read,
 	.block_write	= sof_block_write,
 
+	/* Mailbox IO */
+	.mailbox_read	= sof_mailbox_read,
+	.mailbox_write	= sof_mailbox_write,
+
 	/* doorbell */
 	.irq_thread	= hda_dsp_ipc_irq_thread,
 
diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index d09275417749..9c06b92fcb5e 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -616,6 +616,10 @@ static const struct snd_sof_dsp_ops sof_bdw_ops = {
 	.block_read	= sof_block_read,
 	.block_write	= sof_block_write,
 
+	/* Mailbox IO */
+	.mailbox_read	= sof_mailbox_read,
+	.mailbox_write	= sof_mailbox_write,
+
 	/* ipc */
 	.send_msg	= bdw_send_msg,
 	.fw_ready	= sof_fw_ready,
diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index 8f60c72fee7e..8c500a83babc 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -226,6 +226,10 @@ static const struct snd_sof_dsp_ops sof_byt_ops = {
 	.block_read	= sof_block_read,
 	.block_write	= sof_block_write,
 
+	/* Mailbox IO */
+	.mailbox_read	= sof_mailbox_read,
+	.mailbox_write	= sof_mailbox_write,
+
 	/* doorbell */
 	.irq_handler	= atom_irq_handler,
 	.irq_thread	= atom_irq_thread,
@@ -304,6 +308,10 @@ static const struct snd_sof_dsp_ops sof_cht_ops = {
 	.block_read	= sof_block_read,
 	.block_write	= sof_block_write,
 
+	/* Mailbox IO */
+	.mailbox_read	= sof_mailbox_read,
+	.mailbox_write	= sof_mailbox_write,
+
 	/* doorbell */
 	.irq_handler	= atom_irq_handler,
 	.irq_thread	= atom_irq_thread,
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 430a268e6b26..3957e2b3db32 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -247,6 +247,10 @@ const struct snd_sof_dsp_ops sof_cnl_ops = {
 	.block_read	= sof_block_read,
 	.block_write	= sof_block_write,
 
+	/* Mailbox IO */
+	.mailbox_read	= sof_mailbox_read,
+	.mailbox_write	= sof_mailbox_write,
+
 	/* doorbell */
 	.irq_thread	= cnl_ipc_irq_thread,
 
diff --git a/sound/soc/sof/intel/icl.c b/sound/soc/sof/intel/icl.c
index 38a40c03c9da..0b2cc331d55b 100644
--- a/sound/soc/sof/intel/icl.c
+++ b/sound/soc/sof/intel/icl.c
@@ -41,6 +41,10 @@ const struct snd_sof_dsp_ops sof_icl_ops = {
 	.block_read	= sof_block_read,
 	.block_write	= sof_block_write,
 
+	/* Mailbox IO */
+	.mailbox_read	= sof_mailbox_read,
+	.mailbox_write	= sof_mailbox_write,
+
 	/* doorbell */
 	.irq_thread	= cnl_ipc_irq_thread,
 
diff --git a/sound/soc/sof/intel/pci-tng.c b/sound/soc/sof/intel/pci-tng.c
index 3d6d013844d7..8042ac76ec15 100644
--- a/sound/soc/sof/intel/pci-tng.c
+++ b/sound/soc/sof/intel/pci-tng.c
@@ -142,6 +142,10 @@ const struct snd_sof_dsp_ops sof_tng_ops = {
 	.block_read	= sof_block_read,
 	.block_write	= sof_block_write,
 
+	/* Mailbox IO */
+	.mailbox_read	= sof_mailbox_read,
+	.mailbox_write	= sof_mailbox_write,
+
 	/* doorbell */
 	.irq_handler	= atom_irq_handler,
 	.irq_thread	= atom_irq_thread,
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index 664a11aaada2..48da8e7a67bc 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -37,6 +37,10 @@ const struct snd_sof_dsp_ops sof_tgl_ops = {
 	.block_read	= sof_block_read,
 	.block_write	= sof_block_write,
 
+	/* Mailbox IO */
+	.mailbox_read	= sof_mailbox_read,
+	.mailbox_write	= sof_mailbox_write,
+
 	/* doorbell */
 	.irq_thread	= cnl_ipc_irq_thread,
 
diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index a93aa5b943b2..1a5cc8ad4aca 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -322,6 +322,21 @@ static inline int snd_sof_dsp_block_write(struct snd_sof_dev *sdev,
 	return sof_ops(sdev)->block_write(sdev, blk_type, offset, src, bytes);
 }
 
+/* mailbox IO */
+static inline void snd_sof_dsp_mailbox_read(struct snd_sof_dev *sdev,
+					    u32 offset, void *dest, size_t bytes)
+{
+	if (sof_ops(sdev)->mailbox_read)
+		sof_ops(sdev)->mailbox_read(sdev, offset, dest, bytes);
+}
+
+static inline void snd_sof_dsp_mailbox_write(struct snd_sof_dev *sdev,
+					     u32 offset, void *src, size_t bytes)
+{
+	if (sof_ops(sdev)->mailbox_write)
+		sof_ops(sdev)->mailbox_write(sdev, offset, src, bytes);
+}
+
 /* ipc */
 static inline int snd_sof_dsp_send_msg(struct snd_sof_dev *sdev,
 				       struct snd_sof_ipc_msg *msg)
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 1289e2efeb62..388e71bcacf8 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -145,6 +145,14 @@ struct snd_sof_dsp_ops {
 			   enum snd_sof_fw_blk_type type, u32 offset,
 			   void *src, size_t size); /* mandatory */
 
+	/* Mailbox IO */
+	void (*mailbox_read)(struct snd_sof_dev *sof_dev,
+			     u32 offset, void *dest,
+			     size_t size); /* optional */
+	void (*mailbox_write)(struct snd_sof_dev *sof_dev,
+			      u32 offset, void *src,
+			      size_t size); /* optional */
+
 	/* doorbell */
 	irqreturn_t (*irq_handler)(int irq, void *context); /* optional */
 	irqreturn_t (*irq_thread)(int irq, void *context); /* optional */
-- 
2.27.0

