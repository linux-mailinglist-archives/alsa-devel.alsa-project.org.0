Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B81604543D6
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 10:39:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BF531865;
	Wed, 17 Nov 2021 10:38:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BF531865
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637141981;
	bh=6ww91ltK6ZhDkrTW7JZQlNmnB3p8dwBqrASVu6CDnVw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XZkedYdHuUMxSwdus1AlpqJVKPCMhBUnMK5K2TZw8LwjjqVzsIUkNfkZTKSZiIq30
	 IMGNiBp63RQ4Rw52VhfnbccN08NuDmyxv+2gKpls3Tsw1/HLLJ6nEbI8cvHMN/AoN4
	 LsggCzUa6PNdhylGLFL+kWhnqgm7TV8CpIj1DRfE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7186F804BB;
	Wed, 17 Nov 2021 10:38:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E635F802A0; Wed, 17 Nov 2021 10:38:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60071.outbound.protection.outlook.com [40.107.6.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64B58F800FA
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 10:38:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64B58F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="hmRPQKlc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NpFiZL2yCfYK9MHaUA+6BrFyzl/pEb9FMQRXYQZeYU7xRcxok3+wV68wRIT0/iktCoJkVtUTUr9HqkpEbkyNzLEKqrxBAZW2GWG1KPP9mIzObG4TxXXpkd1OqawvVJNnHAyucrUaCuUpILcqDyztjVhalVHQvGGCRDdkwBX/XSVT7lMQOsEdTh74JCH/QTodaX4ptdZB3cJgvy5PRS061t0wEPCQP6A6E3eOET4BfVPwk1SEpkAGq53A2rGECI5s0Wqll+ghEnEpm5ozVH1/rn2JXmnIYWu1Qv9erLPjvk7L5rNfbssaltfzaVjeiAyFm56StMIxnz2+8N2W4w53bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vut4y+f3LYXnanVM4rXQ5tujdGZRypjXvVUxolzFSb4=;
 b=m47QDJKwtT2ELHb6Nr9ViA6QxYPZgrnTYaZki3flT5zvCAvDGANM4aCL20Xr0Ob+vDNU65OlWiWEcN/i5eJKdL/z8yL6UO7Lu2551/NMqr850HXw5tqblb60EWjd4inrOqDbjZbWsmcK5NAKTkdEA680+CrZpSt9LTcrohdsGPUl6+MFer/cCwmjE6bX8meIVsJX/qrHkvigUA6xpatZscE3TRRgMebnMmd6tpE3UlMbESoZhcTn4LKzoxU0wLLym1HkcjhzhjntQALct1Wx93pZAWgzv95liFWMsV0+QSGzdvD6W2hDnpFod4Hq40+dWbV52mD95pacJl0cuGcmuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vut4y+f3LYXnanVM4rXQ5tujdGZRypjXvVUxolzFSb4=;
 b=hmRPQKlc7ZQ4VERCfrDeYOibF/YdTOLTxbvbviY2El1PRSkIClEvEEOO7KLsHezic+V5mO9U8dzzB0k7y7i1TA6sfa9/Pto9wQCdgDQJXOnVT0NKiCD9ZWCYjv2V1QIZpI5ugxts+P/B7gZLXmYSstW37uzzp2kO1j11bzqXznQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Wed, 17 Nov
 2021 09:38:03 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 09:38:03 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 00/21] ASoC: SOF: Platform updates for AMD and Mediatek
Date: Wed, 17 Nov 2021 11:37:13 +0200
Message-Id: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM3PR03CA0060.eurprd03.prod.outlook.com
 (2603:10a6:207:5::18) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5706:b700:22bb:b216:ffff:73e1)
 by AM3PR03CA0060.eurprd03.prod.outlook.com (2603:10a6:207:5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19 via Frontend
 Transport; Wed, 17 Nov 2021 09:38:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7815bdc1-71dc-4618-135e-08d9a9adf396
X-MS-TrafficTypeDiagnostic: VI1PR04MB5807:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB5807B4ECB1E02B8A9F39D89EB89A9@VI1PR04MB5807.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KxHcQDuwVgIdk6o4Oi9uk6zK1MWw2jPpn+6JN9QH57Q7bhgZaOhroe5cny54h3QYtie8Cil6AI3v7z+HVJrWSQpfo+IO05yS2aS+m3bVwSub7N6oh6zxoDeDvbr+QOHiW4QxhzEILcD+z8e7V+CqiVA9Gpq8NPCAjlf6Aw3pIspliSfl2/4Eairc1nd0y9O+jPN9RBJf2QhaZac43eq7ZZCBgqom6fEUknY2n2AwsHgqIPHbYoRt1KAtuD/59Vy4dcArNtO9/86YlNvqC99e3/9imbyodC7llUQgp1/tQcygDNoFs/IMrNer4EBFw8FInhDsEILPF5kwRu1v6LwglwF19kYjVpRcC4/2hmu3SP9cdk5iJwaDQdz6DiO77U94JahLagekE3A7JZGiSKv/t+1GJs83Xv2cVuA7GlMhpr6FQwxta9Qsmn2YCxk7zECcWq54LrCoCp8WG9GHyPJf679/+3jIXTAMN8y0yE7w44HRzB9ALNYsp4DoIvgcF8Gj7Imlh7Kq8HLzOYtjFo8GTbCkQjPDqcctuOet/BCy4exTU8PIn4rWKYlPgFjowewFaQFsv5q6sKaH3SddjxCGJ9JhCbbE5BnCjzVGAuOXUlDusNHLA6MWM6ACGb9WBFYz3bUVZO2VjNY2iAkdzx4KYw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(5660300002)(508600001)(52116002)(86362001)(8676002)(8936002)(66946007)(186003)(6512007)(2906002)(6666004)(6486002)(7416002)(6506007)(1076003)(2616005)(66556008)(66476007)(44832011)(83380400001)(38100700002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1pROWo3UkJndWlKWk5nSlc1Q2RjRzI1cUU0YXY2V3NTRzNVZ1NxNzdwUFNN?=
 =?utf-8?B?c1RlRFJ2RVJhQjlwaWtzLzZ0aDFYOTFlZk1pei9aaDNTcWI5YlkrZk5EV2ZK?=
 =?utf-8?B?SmdYMmsvQkhYZ0RUTHRHV3dBV3NDOXN2cXI1S1RIQkV2WHZUNENUL3U3M3Iv?=
 =?utf-8?B?aFJTS1JZcmltYUsvRUpnai9aUWQwOVFaUm5wRjg4aDd6dVpVZG1mU0hmSlRE?=
 =?utf-8?B?azRrcW53ODJIaXpuY0FJSyt2aTRjMHM0M1VkYlU0aU9zalJxZlliRkJudkVF?=
 =?utf-8?B?RHYya1l3TDhJUWIraDRBK2ZUTWIyQVdsU2xvbW84eEpNRVZ5YmE1SUFNZndC?=
 =?utf-8?B?aU5TdkNSQy9MdlpqWkpkenA5TDVuN1pqcVVpaWdDa0JkcHFzaWFnTjVKOGwz?=
 =?utf-8?B?WXZhQWtmWTB0dWFlZDRVR3JzQ08wcHBwZTJHZG53Ym81M25wVmVMMmdnWGxZ?=
 =?utf-8?B?Qkw0OU1adExpS3JnM0pWYUl1dWQ1RGh6RC90RExjTVE2c0ltRit2ay81UFdM?=
 =?utf-8?B?dTNQZUl5UkY1NERWMHJ5U2NnVGpNK0hWYSs1MGZmZU5PcHRPRmxHWTZHNEpX?=
 =?utf-8?B?YVc1SUMxMUJxV0ZhQ1FMMEl6emZuY0tSYnhCV3l6L284dGwyNVovd1hGVUV6?=
 =?utf-8?B?dVNLQVFuTHIyYmovc0lJSUtqUzJFU3M4MklneDduT0lUblYrcHcxcC9DODU5?=
 =?utf-8?B?SWJuM0kzOStzbXJBMnpHZUxOR1RNTWZvTnVpbzdpYUpJaFBkcFJUdFZYQldw?=
 =?utf-8?B?NCtaYTFoeXRKS2R4RzE5OEd3RHJETWFiS3BsaXc1d0FweGRsZm1EYVNWSzYz?=
 =?utf-8?B?ZDhpTFFkK1pGc1ZWTCtqclk2dW1oVXY4TWFwd2VVOVZTSHJGemZKTENOcFRr?=
 =?utf-8?B?YlNRSGRvK2hKSzZNMVJyZXpLcTNoaVQxdWFjendKOU9Tc2VpL1hicjZReGlX?=
 =?utf-8?B?NGFWT0tHQkVRSEpWTlgwODBlMXpVcVNMSlcraUhVbUFpMmpuVWp1bGhDd284?=
 =?utf-8?B?QlBweXRhS2xtVEVJa01UUWtGNTlFaStOUk1XbUdUUzJUWGxyV3k4eVNHaURw?=
 =?utf-8?B?SlpZNmZGdkpidEZoWGNNcWRiNU1CajVqNTREaUFJRFcxc3B4dmFNR2d3SmZy?=
 =?utf-8?B?emdkRDVIWG5zd1ZVcUM1MDV1TXBia3VKeEFxTzlmYVd3ZTFadWJ2SlVSdEdS?=
 =?utf-8?B?cHJpY05YV0FQZ0FSMW5QRkJEL3MrWlpXUU05d0gySlBYQ1VmUStEM3ZOODk3?=
 =?utf-8?B?RDUrajhKdDdlNGlRTzE4YnB2cWxhNTVBci9YcHJrYUFxdG0zcDNmT1JndnBl?=
 =?utf-8?B?eVFtWUw1TktMejJOMy9jbVpQdW0zSy8xTlZIMlV3bHhYWC9RTWJUSzduTGZU?=
 =?utf-8?B?N011bHc5b3Uxb0R1WThKVWZOTm1RYS82OENDSm9jKzBhSG1mRmF6Z21SUXFm?=
 =?utf-8?B?dXJLMzhWSnBTZzBnVE1NdVR6MkREOTlmeDlCSEpzcEF1dGIzd1k1dDRwZHI3?=
 =?utf-8?B?NUI5bnN1NTBRVXJ2U0N0b2tMYXZhQ0M2Mm82bHl0TS9YZ3VVdTNYT0dWMEhm?=
 =?utf-8?B?Tzg0ZnRVRUxtUDBVdjdxWU8vV1hPOHEzVVdKcFR4alkrT0tWRm91Qk1NUkti?=
 =?utf-8?B?WEdJZVdWSEdOT1VHNHFIM29mQndsWmFPUXUvcXIxaWEwa20zWEc3VTYxQ1dy?=
 =?utf-8?B?V1p0R2RodFdrQlRQb1NZaEl6YzU4WUZTblBHTkRiR21LajZ4QThPTmlLRHNu?=
 =?utf-8?B?Rnd6cmhlWTBNRklvMnRJL21DTFU3TmpBdDZmTmJCTDVLOGpVN215SVBJSCtD?=
 =?utf-8?B?R2dibFRLWkh3QkU5UEFrMC9aeEJYWVBPSEU2dEtNYWdDdEVJMEIzeDdsa1RF?=
 =?utf-8?B?YzNaVGE3aGY1a1UvVXJPZGw5bFdyRFFlcUNBYkJZRElmbDE4SXdBdllMSWNn?=
 =?utf-8?B?NWwzeFJNWUdxTTJDc2lxMkNqdUZKcTBzYnZJa2xQZEpHd2Y3YjhSQVN1eHF2?=
 =?utf-8?B?LzJxQ3VzQ0wyRGdoMDcrQk1hSE1CWnBDc0ZNL1UzbEVQQjdxbm5KREZMMW1t?=
 =?utf-8?B?a0svSEFFTVdHWWtQM0txTHlpakRqdkpNR0FmMmhyWmxiYTRKMTFTbkFpQm1z?=
 =?utf-8?B?RDNDTW9MNnBNeTFwc2dRcWE2K0NJbWJjUEh5d2tiUEY4TVBJNlJ1OCtDbU43?=
 =?utf-8?B?MGhnck1sb2luTnMzbFBkRWRsejZjam1DVlRWMko2MVE5OU1aNFFHQ1NiMmJF?=
 =?utf-8?B?ZjhmdUNrQ2JoM0IyV3JoY2s1YnNYeEEzUWZvSHUreWJ5TGl0N0NwdUFLVkFj?=
 =?utf-8?Q?banvULtqyggXHgJ7hB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7815bdc1-71dc-4618-135e-08d9a9adf396
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 09:38:03.3149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MuEQlntWWXZAITxpBbmQ2ChXQulFLcim3i1uBDADmZK9L256QEzSfGcu0OyuzsqcCOFPL7CmBkrdg9njYyJuoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5807
Cc: daniel.baluta@gmail.com, AjitKumar.Pandey@amd.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 lgirdwood@gmail.com, Julian.Schroeder@amd.com,
 linux-mediatek@lists.infradead.org, Balakishore.pati@amd.com,
 yc.hung@mediatek.com, vishnuvardhanrao.ravulapati@amd.com, vsreddy@amd.com,
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

From: Daniel Baluta <daniel.baluta@nxp.com>

This patchseries adds Renoir ACP HW support and Mediatek MT8195
platform.

Notes:
- I first send the meditatek support in a previous emails but it failed
  to apply because there are some dependencies on AMD patches related to
  DAI ids.

Ajit Kumar Pandey (12):
  ASoC: SOF: amd: Add Renoir ACP HW support
  ASoC: SOF: amd: Add helper callbacks for ACP's DMA configuration
  ASoC: SOF: amd: Add fw loader and renoir dsp ops to load firmware
  ASoC: SOF: amd: Add IPC support for ACP IP block
  ASoC: SOF: amd: Add dai driver dsp ops callback for Renoir
  ASoC: SOF: amd: Add PCM stream callback for Renoir dai's
  ASoC: amd: Add module to determine ACP configuration
  ASoC: SOF: amd: Add machine driver dsp ops for Renoir platform
  ASoC: SOF: amd: Add Renoir PCI driver interface
  ASoC: amd: acp-config: Remove legacy acpi based machine struct
  ASoC: SOF: topology: Add support for AMD ACP DAIs
  ASoC: SOF: amd: Add support for SOF firmware authentication

V sujith kumar Reddy (1):
  ASoC: SOF: amd: Add trace logger support

YC Hung (8):
  ASoC: SOF: mediatek: Add mt8195 hardware support
  ASoC: SOF: tokens: add token for Mediatek AFE
  ASoC: SOF: topology: Add support for Mediatek AFE DAI
  ASoC: SOF: mediatek: Add fw loader and mt8195 dsp ops to load firmware
  ASoC: SOF: Add mt8195 device descriptor
  ASoC: SOF: mediatek: Add dai driver dsp ops callback for mt8195
  ASoC: SOF: mediatek: Add mt8195 dsp clock support
  ASoC: SOF: mediatek: Add DSP system PM callback for mt8195

 include/sound/sof/dai-amd.h                   |  21 +
 include/sound/sof/dai-mediatek.h              |  23 +
 include/sound/sof/dai.h                       |  10 +
 include/uapi/sound/sof/tokens.h               |   5 +
 sound/soc/amd/Kconfig                         |   6 +
 sound/soc/amd/Makefile                        |   2 +
 sound/soc/amd/acp-config.c                    |  71 +++
 sound/soc/amd/mach-config.h                   |  28 ++
 sound/soc/sof/Kconfig                         |   4 +-
 sound/soc/sof/Makefile                        |   2 +
 sound/soc/sof/amd/Kconfig                     |  33 ++
 sound/soc/sof/amd/Makefile                    |  11 +
 sound/soc/sof/amd/acp-dsp-offset.h            |  78 +++
 sound/soc/sof/amd/acp-ipc.c                   | 187 ++++++++
 sound/soc/sof/amd/acp-loader.c                | 199 ++++++++
 sound/soc/sof/amd/acp-pcm.c                   |  82 ++++
 sound/soc/sof/amd/acp-stream.c                | 181 +++++++
 sound/soc/sof/amd/acp-trace.c                 |  84 ++++
 sound/soc/sof/amd/acp.c                       | 446 ++++++++++++++++++
 sound/soc/sof/amd/acp.h                       | 226 +++++++++
 sound/soc/sof/amd/pci-rn.c                    | 165 +++++++
 sound/soc/sof/amd/renoir.c                    | 185 ++++++++
 sound/soc/sof/mediatek/Kconfig                |  33 ++
 sound/soc/sof/mediatek/Makefile               |   2 +
 sound/soc/sof/mediatek/adsp_helper.h          |  49 ++
 sound/soc/sof/mediatek/mediatek-ops.h         |   8 +
 sound/soc/sof/mediatek/mt8195/Makefile        |   3 +
 sound/soc/sof/mediatek/mt8195/mt8195-clk.c    | 158 +++++++
 sound/soc/sof/mediatek/mt8195/mt8195-clk.h    |  28 ++
 sound/soc/sof/mediatek/mt8195/mt8195-loader.c |  56 +++
 sound/soc/sof/mediatek/mt8195/mt8195.c        | 437 +++++++++++++++++
 sound/soc/sof/mediatek/mt8195/mt8195.h        | 158 +++++++
 sound/soc/sof/pcm.c                           |  48 ++
 sound/soc/sof/sof-of-dev.c                    |  13 +
 sound/soc/sof/topology.c                      | 168 +++++++
 35 files changed, 3209 insertions(+), 1 deletion(-)
 create mode 100644 include/sound/sof/dai-amd.h
 create mode 100644 include/sound/sof/dai-mediatek.h
 create mode 100644 sound/soc/amd/acp-config.c
 create mode 100644 sound/soc/amd/mach-config.h
 create mode 100644 sound/soc/sof/amd/Kconfig
 create mode 100644 sound/soc/sof/amd/Makefile
 create mode 100644 sound/soc/sof/amd/acp-dsp-offset.h
 create mode 100644 sound/soc/sof/amd/acp-ipc.c
 create mode 100644 sound/soc/sof/amd/acp-loader.c
 create mode 100644 sound/soc/sof/amd/acp-pcm.c
 create mode 100644 sound/soc/sof/amd/acp-stream.c
 create mode 100644 sound/soc/sof/amd/acp-trace.c
 create mode 100644 sound/soc/sof/amd/acp.c
 create mode 100644 sound/soc/sof/amd/acp.h
 create mode 100644 sound/soc/sof/amd/pci-rn.c
 create mode 100644 sound/soc/sof/amd/renoir.c
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

