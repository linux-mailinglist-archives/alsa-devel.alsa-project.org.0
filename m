Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4934558A9
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 11:09:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECB6E18A4;
	Thu, 18 Nov 2021 11:08:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECB6E18A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637230184;
	bh=BysY5ciO57gKIJldQH+hXllj79A3guqQwaeYorA3Lag=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bpj6u7n4lkrFGsFdtSRyekgZw0+MyxpG68yzVjBtMSx5R29AQaz5dXPpm1NnZuRTa
	 1uqK+vbP5cOTaC8FFzUcZtA117NKzwZqKFLyFqvPPY+S6pG1HwqemQjCw81bYfX1P4
	 tcF9ucKt6efDwF0oRezho0KAcE/10ILcQZJN16sg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 712C9F80423;
	Thu, 18 Nov 2021 11:08:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8734AF804C3; Thu, 18 Nov 2021 11:08:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 KHOP_HELO_FCRDNS,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FED5F8010B
 for <alsa-devel@alsa-project.org>; Thu, 18 Nov 2021 11:08:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FED5F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="VFfXXLmU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oVQTkdTzK/1y8X4thgzaHpgqhpw7FNQI1LRthCSOcNz97GjdsWtDSQ/7gaCTD1Aiqqb1cNwsA1ICeeaaqXgYXRuFOG+NA3Iut+CvCY9ZfPuNQYA+bk0SKdsQT3KgkHWK/9C40rwtBN4QDVg0Icmtq8esTXOyRb8mpXOhoDKjNnHu8bI98o+wKHTCxXO9loJeXkf9Wt6yA+wEdNvSHE+u4jESV54IYSw/S3wq0U80i3yw7OWtjIYSMD7Fa2nUbYRPGfIUhcsQ6aglwZZoNq3OEmNXEgfbC2bVfE7dzCDOKlIrnjZDuC4E5u6RoQJUP6jqMYV1ZknEPWmysXyGlrjk1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXrYwxUn5Cpp/Q2v/9mAKynmdVUfgRtQCNPvcOEa86E=;
 b=Ez/cTRlwoDsRQnFsmFqzoTfwSpjoDfR1CWyf70hTlBrSfHEKushOG2R27WXC5nAseN6ABlyR3T3scf6gxDtGPQCJkgXP1FG6NPiB3FBfO/VXSJ0adrY6wkkh1wzxUjU3A4f7v7GE+yjcR0J4yf2sqkkf0OVVyFX7HhEuXTivSTWQrJ1nsiAE3jAo711RzqRM4H0hYCuxktXwIgDGvL2RJNsCE0bPleBlYZKZrFPotl56SIIY7OpdHW7dhSsPYFcsRwThdFobsMFIYGhk1iQSNhYeCBgOxyRYAl9C29jlO0K5ULXBLki4lvCgq5PUHE7Ol4Zse9brI1XsYxwosBf22w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vXrYwxUn5Cpp/Q2v/9mAKynmdVUfgRtQCNPvcOEa86E=;
 b=VFfXXLmUzqjChinJtfUKkJLGFOLsKsHKZf9q+1mr2sCGTt3fSWmZP08p6RQqFrxM6FgTV+j8kQn/kquo4NFpqExcX9iNkEz84hFxnKrbU9hnwh6M/GcMfhiPUetm/opfH/4RvAHDD42Cw2eGENJA5yTX+dTbAjHO/8nWjWDSUzE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB4285.eurprd04.prod.outlook.com (2603:10a6:803:4a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 18 Nov
 2021 10:08:07 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Thu, 18 Nov 2021
 10:08:06 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH v2 0/8] ASoC: SOF: Add support for Mediatek MT8195
Date: Thu, 18 Nov 2021 12:07:41 +0200
Message-Id: <20211118100749.54628-1-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM4PR0902CA0008.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::18) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5706:b700:863d:d4f3:969f:6fa)
 by AM4PR0902CA0008.eurprd09.prod.outlook.com (2603:10a6:200:9b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Thu, 18 Nov 2021 10:08:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df8776bb-2256-4cf8-bf48-08d9aa7b5075
X-MS-TrafficTypeDiagnostic: VI1PR04MB4285:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4285CD38EC8FAE38E048269CB89B9@VI1PR04MB4285.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VB1n2NeA6BPWaEye+QhLGl/6+yr54iLTfLxY1fh6objDytjXQTfmMynZ8xZhmWJ/DFGswwT8GQ7uDOKgBMB9E6zVSWFEuod6vAYTBqcpR4FhVjzvo+O07utckCNkfwS0MM6mgXZHliHXS5FHZ4l49V/NXnggGrxAQhM8yizp/CX1unYLLth14Mb3U9ufKdAAkFPohjj/RTdNMmdItD5brMFeaG/D7AGldQEqTkdHusKrLlhqa3KQjO7LxlUkrrk1igw6zYgoKhxqG+zlvN1ZIRNsh4tYh3M/uecB2I1vZj0sqixVg+S3l8v5fzIu8cZsSb0tQcsmA52vRYLV0dWDcNhBlssvz9SUPedzBQxRQY2Kxm7/p1HNAb765yXyYfomRM+8TxkdTedeOJ9T5hN36MI13B7f99TaqMHT2Aot/9L/RSbuN/KVMnqu8+61tg+B+/VA7es/YgRyDEqGnAcia+cjYHdTnMkjTqic5fBpx9YPmidZM/3MR8PhVYwvxYP66ACQcZJ8jtU/8vDUWbmB0h7VEC87dahoQT5XRW+F+3ddey58Kea32Kr5cpYuVaVrPggo5poE01z7AYWTWfKGsauR9k1+TVSURN40RhHrXPM8ijPkMHmCeRgUHigjg4BUx7fGzOQpa1l5bB4xtM4X5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(8676002)(2616005)(4326008)(44832011)(86362001)(38100700002)(316002)(508600001)(2906002)(52116002)(6506007)(6486002)(1076003)(6666004)(66556008)(8936002)(83380400001)(66946007)(66476007)(5660300002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXRTL2lpcUdxOGxCZTJzdVNsbHl2aUdvUC9sQnNOaTJlZ1JaRWF6bTRSbFFU?=
 =?utf-8?B?WUhvNUIwOUNLbXRXbUN1YURoUEFldHZMQXF3Nm5ITkk5dm5OSmR3cHVTaGpT?=
 =?utf-8?B?U2xBRzluRzhINjdzaGhmc0hMVDl3Z2dlLzB3Vnhxei9KbEt1SzFCbUtvWm9O?=
 =?utf-8?B?WDlUMStScXNCREk2Y2JnSVM3aVc0Wk9mYkdqdTB3VW1rdzZkbVE1RzVrRW5Q?=
 =?utf-8?B?OFdtQ00wRTFrUlNnMVlYSmtzeVJhNFdDWnFJSUdJQ3hxbmNnYXdnUjVBVjJ3?=
 =?utf-8?B?VTJ2M2kwUTJKa2pjQ3NkV1gva3NrZnJUcXAwNnN0cXlwUVo0RFpZaW1LamVo?=
 =?utf-8?B?bTZsNXlsd2kvY2RTTWw1Q01zUmRSeStSV1hUeFc4Mk9XWDVsSnNIYzZvTDVo?=
 =?utf-8?B?ZmVFTnZKNFZiNUc1QXBkRTNNc0JHdHFOZ0syWTFQOFpQS29xbTR1UjJiYjdZ?=
 =?utf-8?B?NjNjcjVyQXg1V0pCZnpkMDg4S0ZPcWJ4SzloTjVDUXBhQkNOY0pHeTcvL2Fh?=
 =?utf-8?B?RCtGbTgxaGFLWTdVOHVYQTNZcE9zc1RISmx5QkRpK1hvbEtkWDQweGlDQ2pw?=
 =?utf-8?B?bWFCV1VpVzAwODNNTHVPN2UwK09oQVNxb1cva25iUjlSdzUxRlBOeUxEeTRF?=
 =?utf-8?B?TzdRRjR4YWw4eXROOEtzSktvM0ovRi8raDhXNUtOMUFUN2hYTmgxMGxuQUlN?=
 =?utf-8?B?V3c0VlZHTEI4bHIyZXJKMU9EN3ZCanFrK0xYQ3RrWGNHZ0RnWEwwR21oZFA4?=
 =?utf-8?B?Y0xXaEh4MENzU08zOGU5NGtJYVIvbTFZSEZQMGxoYkNoUFljcWZoc2FzcEUv?=
 =?utf-8?B?YmR6a0FQaFl5UVRXTUJ0TnJ2cGswVm02ZlpJQXhpTDUvZlg4VFhOVEh1SXI3?=
 =?utf-8?B?Z2puNWpjTFpaeGF5aEZ5R2xERHNiRUVWNW81WEpEQXYrOFhybENPZ0lOUTdy?=
 =?utf-8?B?eXlJUmZwejJLRTdDTkM3cXFFL3RYTmVaNGNoeE9kZ1I2NVVyVW91MG5CZGNI?=
 =?utf-8?B?UTE2bGZEc0RiSUx1ZUZBWHBEQTduT1QwZ0RqcWhyTW1vVkNSdVhrQ09EWjQ5?=
 =?utf-8?B?RERuNnJPNEVVY2pXTy9OMzlpQmdycE15MmN2b0Vkcmg1VkZoUFFkNm9ERERp?=
 =?utf-8?B?dk9LcmxadG5GTitDcE1Cb1JuTFNoZTRvd3g2bi8zdEk3SWlXV3owbTlXalV1?=
 =?utf-8?B?U0JSL09IUFQ3Q080MXBWUlcwRGp2bHlaN0RtdjdmSFI4QzZac09yeFVSWjZy?=
 =?utf-8?B?NUllaUFiNzFjbGlhRkNXMjZWT1haRDdIZ29MSzU2em9EWjFGZTEyWjFUajd4?=
 =?utf-8?B?TjMyZ0g4RjNuLy9ReFZkNlpJVXd6dmVEMVUzM3lmQnQ1RDVQTXc1VEdSaFdh?=
 =?utf-8?B?QjZzVlI4REUxaWw5dUVLWlhNZmRHWWZYQXpMbDMyOUlwQzFuVWt5RlJZdDBp?=
 =?utf-8?B?aU92elpHUndKZ3Vsc2FyTnVhRGtPZWVsY2FSQmh0QUFPZnhHUEI3djNGaE9W?=
 =?utf-8?B?aXBhck5NQ2Nxck9zM04wL3hHV2tXRWZiN1Y4bVcycnk4ZzdScTMxam4zc25J?=
 =?utf-8?B?am1rMTM0SjkvaWxhb0plZm1SSGVVdURCMkRNc0dDbkJzMTFRM3MxcUtFSERL?=
 =?utf-8?B?Wm5rYm43eXJ5L0NUUkpiQVRGYWdOam03NXpMVStjTzFzWmtrYWNET0V5QUVr?=
 =?utf-8?B?Y05zdmxCVzR5b3VCMlBWYzdWSjFzd01lSDJIS05Bbi8zNEVZdnV6dUNJalZ6?=
 =?utf-8?B?b2FRMnEvZ2JXTjR3YTBTY0JXNlJManIwOXJyckdTcDF1VHNLSC9MMjRGaDZ6?=
 =?utf-8?B?MklQU3YyQXgwQTUwVkJMQkdzTGN6NmxnWlFmQXlsZzRXU3RKZkVURXZDMUFW?=
 =?utf-8?B?aHRBcWJJaEtxTERIQmlibTFFV1YvZXU5RlJld0FXVlBjbzE4SXM5eTVjS1p2?=
 =?utf-8?B?cmVsVGlOQ085aitvUUNqL0ZzY0tURitUY3g3bUJoQXg5Zkp0WU52enpMTjRz?=
 =?utf-8?B?UmR6UmNwSllKMVFDblovMzZVZHV0QTdmekQwaU9qdnJnWnk2c1dkeFppRG5U?=
 =?utf-8?B?ZW1vMkRsMEdOTUt4VzRLOFR4dG9FM21PQURJanhkQkVWOWlIVmJtMzBxeVFu?=
 =?utf-8?B?SjQ2MzJZUGIyMERXZWptTzFiQVVnRGdzbkkxOEY3ODBJUXZJMnVtWkNOc2ZK?=
 =?utf-8?B?N05HSGpOM1ZRd3VBTU1FbHFqL3EyWk56UTdmblZEMVA3aEdhWmswTkkyYzc3?=
 =?utf-8?Q?dXLcJUyMZsOysOvj5lWjnAQzhsjZYcNOmBYsc+I9sE=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df8776bb-2256-4cf8-bf48-08d9aa7b5075
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 10:08:06.8132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bic/OuEW4MjcThp/GLcr252qnXbUE7bO34jKf6+D24QtTqmi1OZcmWEnHTr4m1JGkoxIZFl5BROsCCrzPlEN1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4285
Cc: daniel.baluta@gmail.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, linux-mediatek@lists.infradead.org,
 yc.hung@mediatek.com, daniel.baluta@nxp.com
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

This adds sound open firmware driver support for MT8915 platform.

Changes since v1:
- removed AMD patches since they were already applied
- fixed compilation error reported by Mark, generated by the fact that
  mt8195_run was declared too early in the series.

YC Hung (8):
  ASoC: SOF: mediatek: Add mt8195 hardware support
  ASoC: SOF: tokens: add token for Mediatek AFE
  ASoC: SOF: topology: Add support for Mediatek AFE DAI
  ASoC: SOF: mediatek: Add fw loader and mt8195 dsp ops to load firmware
  ASoC: SOF: Add mt8195 device descriptor
  ASoC: SOF: mediatek: Add dai driver dsp ops callback for mt8195
  ASoC: SOF: mediatek: Add mt8195 dsp clock support
  ASoC: SOF: mediatek: Add DSP system PM callback for mt8195

 include/sound/sof/dai-mediatek.h              |  23 +
 include/sound/sof/dai.h                       |   3 +
 include/uapi/sound/sof/tokens.h               |   5 +
 sound/soc/sof/Kconfig                         |   3 +-
 sound/soc/sof/Makefile                        |   1 +
 sound/soc/sof/mediatek/Kconfig                |  33 ++
 sound/soc/sof/mediatek/Makefile               |   2 +
 sound/soc/sof/mediatek/adsp_helper.h          |  49 ++
 sound/soc/sof/mediatek/mediatek-ops.h         |   8 +
 sound/soc/sof/mediatek/mt8195/Makefile        |   3 +
 sound/soc/sof/mediatek/mt8195/mt8195-clk.c    | 158 +++++++
 sound/soc/sof/mediatek/mt8195/mt8195-clk.h    |  28 ++
 sound/soc/sof/mediatek/mt8195/mt8195-loader.c |  56 +++
 sound/soc/sof/mediatek/mt8195/mt8195.c        | 437 ++++++++++++++++++
 sound/soc/sof/mediatek/mt8195/mt8195.h        | 158 +++++++
 sound/soc/sof/pcm.c                           |  12 +
 sound/soc/sof/sof-of-dev.c                    |  13 +
 sound/soc/sof/topology.c                      |  59 +++
 18 files changed, 1050 insertions(+), 1 deletion(-)
 create mode 100644 include/sound/sof/dai-mediatek.h
 create mode 100644 sound/soc/sof/mediatek/Kconfig
 create mode 100644 sound/soc/sof/mediatek/Makefile
 create mode 100644 sound/soc/sof/mediatek/adsp_helper.h
 create mode 100644 sound/soc/sof/mediatek/mediatek-ops.h
 create mode 100644 sound/soc/sof/mediatek/mt8195/Makefile
 create mode 100644 sound/soc/sof/mediatek/mt8195/mt8195-clk.c
 create mode 100644 sound/soc/sof/mediatek/mt8195/mt8195-clk.h
 create mode 100644 sound/soc/sof/mediatek/mt8195/mt8195-loader.c
 create mode 100644 sound/soc/sof/mediatek/mt8195/mt8195.c
 create mode 100644 sound/soc/sof/mediatek/mt8195/mt8195.h

-- 
2.27.0

