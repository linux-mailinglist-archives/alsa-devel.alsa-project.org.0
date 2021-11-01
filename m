Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C50441491
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Nov 2021 09:02:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10A3A16B9;
	Mon,  1 Nov 2021 09:01:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10A3A16B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635753742;
	bh=8bHQ+r+hn58gW4q7mGQk5nYeHTwPmr/BEwAiYltJ14A=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dQTMbsVRXsFTnYP3fkyw+/IwP1Ns7BMVuhRzag1RenIQx2Ajxu29x4sxLGgkZoxIy
	 8biNZ8Z4OSMwdRiFu6nrBcfcc/3EnBrFrWIjjUk1JcoxJ5QM41y+nHw3f7e3Lato68
	 8rU9cNvNw1U655clgEsYSmevLjZbxyWeSZPU3gIc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BC9FF804C3;
	Mon,  1 Nov 2021 09:01:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AFB5F8026A; Mon,  1 Nov 2021 09:00:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2076.outbound.protection.outlook.com [40.107.21.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19F5AF8010A
 for <alsa-devel@alsa-project.org>; Mon,  1 Nov 2021 09:00:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19F5AF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="kIjhpMon"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZFMzsweobaow26yULsKzdYcpZCZkVaC3CPooCv4Z4GBMb4zmd8UuwtuLqC/nr6NFMqCqQ/C7F/1JK0LyhyEeumqrfte/bAng7Zv7raKEsuu+tLek/tWH9mkvEic62LrMj5OrcNDKgnLTcd/GfViEPkIqtUUOD1oFInRge1Xxn07nOP7Om6PUFe3SWrU18FQxYHT9T7RhuFwUYj1VOEdUudmgu/sAo6n6Vb/SjWxZj23EYCme3PEdhFMYIHVFzLyPRkDvqhATQUmkEfslGE9T9danb1IxwQZB8JoIHrLw2vZmCjOo9pxYxEXWDpvGrZctQWsqnnGFAupAv6wp02tAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yvSWYqdYEFYFk0YC1o266mfvxOUVtnxxmVLSoIru8is=;
 b=JfTiXSDgfYo5Kj6HVsW81XpVYCGj7TE+7jRFw56uotM3nAP7VmfsclXQ4TaSteqaebEV7rFlsVTjyaft5A/r2mLNwPBHSxtU6cStuAHcCHLj67bhkxblCGjJn4Dw5PiitzULGxAJxNFUP3ph2DdrwTawX1BUuGMoq87T/QpNtwHl0EHlbPCqPrePAAB/B5EZYKkEI9tDpyODntwB7dCXY7IWEh46HFeHOJpOtem37CumqEau2lM9ITDi3xGdfHeYfGQggTZ6C+GEknQWpOenjaWDkHegrYo8QoFJzbugCGYlv6RpjCHd421UItAN45KhxyX2wC5fS/IzHcb5fH6DSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yvSWYqdYEFYFk0YC1o266mfvxOUVtnxxmVLSoIru8is=;
 b=kIjhpMonERY6ezXxRsIyN3i6UPVMIslk2QzHjCa8Qo3Z37kv56dWimVBTyfLYqbjBdCBCCRWG2bin6HH7NIGeeZI5B1C5FcoUs78xSXhWQqNyxYK+VS4H3aeCC3DPEusfjrGYWRnNWBVRzpSCxgBmM9C4YNhLOq+MpkVPArse/0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR0402MB3664.eurprd04.prod.outlook.com (2603:10a6:803:1e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Mon, 1 Nov
 2021 08:00:44 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4649.019; Mon, 1 Nov 2021
 08:00:44 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 0/6] ASoC: SOF: Add support for Mediatek MT8195
Date: Mon,  1 Nov 2021 10:00:20 +0200
Message-Id: <20211101080026.297360-1-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM3PR07CA0070.eurprd07.prod.outlook.com
 (2603:10a6:207:4::28) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5719:1500:cdb2:376b:257c:429a)
 by AM3PR07CA0070.eurprd07.prod.outlook.com (2603:10a6:207:4::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.9 via Frontend
 Transport; Mon, 1 Nov 2021 08:00:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ee20845-be57-4853-047f-08d99d0db4a0
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3664:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB36642B2E9E2F888DE73E3A64B88A9@VI1PR0402MB3664.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9cEJMtOhZrkojPomyNsj2GsZS6AeEG/dnF9Ne/bA+Ot5e6ovu1uclW4qa9FroN3R2mHtIn006oeNCnCRBYA7WyvKh6ohAa1q+qcOAi0hitRAOd745ieRxh63xtt7GvwA1uSpiBj48eTk9aD0O1PdhZyPQL6dOxdWdnuZv6jZUZwrMTcbKY5hP1Z99eZq/5rfsm8RUVyJ+yYffBlP8uiSDmQgS/ByezrYJHqqzFsL18vBmJyV7zSv0Ex7P4cKUXX7Wx3AhDlAImcT/j1+0tcsWNsAZDVF1mNESA6k186M601Ep/M7cATDJOdl1KgK7rgvmnuI425Z/vtb55nmxE6FLqt9+YNFZjODjQl3eRMa1rIWPrfEuoETH/l4ojpr5g01leWrUJqPKAL5/7p02+O1L0i2znx2X8SNceif5puaMXqV56WRW3i8PMMqDdGDPVHYgBaEVVQwmcWscyb9SIifJiWGPBSqEohxkCo1avYE1E/ldFi7Taa6ybb8RCTo45yT7qjSxIFf77wNCOKbIaU6CaAqFCLbzgm84wevz882g48704Zytaj7utecFE4X0xvsoMDoTRML5YOGq49V1Q8X2pptiinqp5DF61It/MNmZQKB0X4GM9rZpWODlRtqa2F123BeNnEXT5C4GrgVC0xj5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(6666004)(7416002)(6512007)(316002)(186003)(52116002)(508600001)(5660300002)(4326008)(2616005)(1076003)(66946007)(66476007)(66556008)(6486002)(6506007)(8676002)(8936002)(38100700002)(2906002)(83380400001)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlVlNFU1UWczamMxMnRsTmlyQ3dCWWdtQzBPV2RIc25VV3FqaFpuQlNPNHBB?=
 =?utf-8?B?dUNSVmRZVVRvSXQzdFlFOGk1TEFiL29FMCtmWXM5dGQ2K1JBZ3RSZGNlWXRi?=
 =?utf-8?B?aVR5NEsycWoyRHBsUUl0anhHTFZUTVRCaWhESFViZ2lIajk0MlJSRFVJREhI?=
 =?utf-8?B?R0g3TE02T1B5K3BLNzdKc2IvQ1FWc2J4SnRubFpOL01PYm42OUczeUJGUW9u?=
 =?utf-8?B?b3pqVkZBMDZoRjhxUTE1NDRxdXpVYm5VMVRsNE1tMTZjSXNrb0ozdUxrU0ZB?=
 =?utf-8?B?dlYrMUI2NW1xWFdEVFpqT2VMdURiYWVhYlRnaTFDc1pCVUFLSUh4SmF0MDB5?=
 =?utf-8?B?WmhjNWI1YisvTUZINTRnTVpFTHpwK3lZY0oyV0JlMzVkMm9HcnI4LzJhY2Ns?=
 =?utf-8?B?MVgzMUhEOVpmMEhQMWF6OUZEN0JkVXlDenBOUWlUNy9uODcrd29ueFJvbmdW?=
 =?utf-8?B?eHluVUhLcFZSR0FGdkF4aktHSGY1bStMeWZESkY5SmswMEJqTkNEaDBVZGJz?=
 =?utf-8?B?TndXOGRLaXBRRnJjaW13N2dMcm9FQ1M5NDhITWs5Rko3Nk1EeGlrR0ZrWk94?=
 =?utf-8?B?cGdMNlFyeHBLOFUvdXIwdkNiNFB0dHR5ZjFkVWoyRlZKdVIrRno1bnlKVjY1?=
 =?utf-8?B?a3lDci9HL2RsU0ZwcXBkRXByLzlrODNQbXliVVhPeE9URUxNZkswTVc4S2I1?=
 =?utf-8?B?MmdxRkZYS1NJQ1I5OU9MRUt6MzUxbnpRQVNiekwxcFpzWE40NDNtUHNJMy9m?=
 =?utf-8?B?RE5vaWJMTjcwNzBZS3hSTy9rR0Z4d2pxaFhRcVFwdDdnaTZOY3FxSGgzc3dC?=
 =?utf-8?B?T2tEam1CdEtCanZZVXpWUzl0cCtFb3FIRU9DVUdLc2t5ek1rTWVuRUorZEMz?=
 =?utf-8?B?cEdrWEpmNmtTREV2TVVIcEpyWTFSTVl5Y0labGJxMGJOOThCM2RSQkdpTkVt?=
 =?utf-8?B?RmdhTis2d0ZRNFlSdWFaQlZwZm9EVmJNSnlJcC9OZ0wwM09EOWpoR2pFd0RM?=
 =?utf-8?B?VE5DSXJvN3cxaHBYd1p6R0dvcTZ2Si9RdHlTVkpyWGhvM25UMjQ4SHRQUGwy?=
 =?utf-8?B?S0hyN3BHdTBvNk1tVG4zZ3JmWUwrMUZISFdxVzhYdHQzV0VzdjNXZXMrNm4x?=
 =?utf-8?B?b1FmTHkrSnFMUW95dVBrQy9CMGRrMThwTEs4cy9ScFBSUHJhOXZtMm1kdm9N?=
 =?utf-8?B?anlhZWJTK2x1SFRPTUYyNkxqYkZib2Q4UlUzSGZCLzRPVGlhVHhPdnNOS2FW?=
 =?utf-8?B?YzA3dnlmUTVyTFhKZTBvcUlGM1lIQXFsUEE1WDN4a04wN3QrMXFveFVoMXhN?=
 =?utf-8?B?VzhXeTU4UWd6WWwzVWpFNUxQdis2Zm5TcnJ3MXV4UkJMT0tFSCtIaDgwTVR1?=
 =?utf-8?B?RHhJSnpVaHB6dHBxRTcrc2NnR2c1bXJKbjZzMm5UYWdnRkdIcE05UjRiakVC?=
 =?utf-8?B?emNqMDFMSFRuWEtNWk9BL1o1MXJTMk5Xc21aK2RWeW4xRUhuTUNTU3MzOERk?=
 =?utf-8?B?NHVoT2xGTWZWbzNEeWo0NUFXblpuRmRaaFZEbVZyY0RtU0Q2Y1lzVG1tcjJu?=
 =?utf-8?B?a3hWUUlobHZrR2RpdWc0OC9pS2d3MjlxbG9MU3EzUjRNNmZILzA1SzM3RDg4?=
 =?utf-8?B?bjVoam1sbU1sZkNsZVloaUVIOVRuRlhmOUdzOVMva1BYTXJ0clF4Mk8zZi9P?=
 =?utf-8?B?cTdqU29YK3BsMldvdkpZc1g2aXo4YzhhWGFnRERxOE9oajZXcFZYbmNDK0Rt?=
 =?utf-8?B?bTkxeFhsajBXb1J3czlXOFV4M0VqUnY5djdjM1llZDY0Yi9DVXdIUFQzR1da?=
 =?utf-8?B?bkl5aDk2a214aGVHT2dDMlluK3VhQ044QjZhenBCMHVyMDZ0bjZvbitYdnJx?=
 =?utf-8?B?ak0ybW9BQlBLeEYyWDd1ZjJyNnJaUzBxdEJOMVFRaVVzSTNobHRUejN4eHJs?=
 =?utf-8?B?alorWHFHNk9qTm9Nb2czNUI0cmtxSzZOcE1tcm4wTW5ZRUs1TnZ3UUQ5M1BQ?=
 =?utf-8?B?QStGbXFLS1h0RlczTnhqakdaSitreGRkMHdaSHk0c1ZTQWlmd21oMFlWMVRs?=
 =?utf-8?B?M0kzZmh5aWNzVG8wQ0xIMEhWUEV4T3U2RUNNNXdxWUdtYlRvL2NQS3NCdXFw?=
 =?utf-8?B?ZEtNK0tuSWRhb2psMVBDNmY3bXRDWVdKemxhYytEWURFVG1BTm9mOUN2MUll?=
 =?utf-8?B?SG5MeWIxRXVBYStDTCtmU1VVdnNYM1JxNWZHYmJUblF1MEQzSXJLeEpqMUhl?=
 =?utf-8?Q?3B2/PV86MLAH1u+uZV7LBmfHSFwcBAuHSbedFP+bTU=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ee20845-be57-4853-047f-08d99d0db4a0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2021 08:00:44.2685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rsahZl1HFc6/asO6B5CVAJMjI88qbzYz7TRA6EDnaC3XPOaj3q/absmx7zhglcVFtbO2/BSP4jiLgHg4igbi+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3664
Cc: guennadi.liakhovetski@linux.intel.com, daniel.baluta@gmail.com,
 kai.vehmanen@linux.intel.com, Daniel Baluta <daniel.baluta@nxp.com>,
 ranjani.sridharan@linux.intel.com, lgirdwood@gmail.com,
 linux-mediatek@lists.infradead.org, pierre-louis.bossart@linux.intel.com,
 peter.ujfalusi@linux.intel.com
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


This patch series adds initial SOF support on Mediatek mt8195 platform.
MT8195 has four Cortex A78 cores paired with four Cortex A55 cores.
It also has Cadence HiFi-4 DSP single core. There are shared DRAM and
mailbox interrupt between AP and DSP to use for IPC communication.

YC Hung (6):
  ASoC: SOF: mediatek: Add mt8195 hardware support
  ASoC: SOF: tokens: add token for Mediatek AFE
  ASoC: SOF: topology: Add support for Mediatek AFE DAI
  ASoC: SOF: mediatek: Add fw loader and mt8195 dsp ops to load firmware
  ASoC: SOF: Add mt8195 device descriptor
  ASoC: SOF: mediatek: Add dai driver dsp ops callback for mt8195

 include/sound/sof/dai-mediatek.h              |  23 ++
 include/sound/sof/dai.h                       |   3 +
 include/uapi/sound/sof/tokens.h               |   5 +
 sound/soc/sof/Kconfig                         |   3 +-
 sound/soc/sof/Makefile                        |   1 +
 sound/soc/sof/mediatek/Kconfig                |  33 ++
 sound/soc/sof/mediatek/Makefile               |   2 +
 sound/soc/sof/mediatek/adsp_helper.h          |  49 +++
 sound/soc/sof/mediatek/mediatek-ops.h         |   8 +
 sound/soc/sof/mediatek/mt8195/Makefile        |   4 +
 sound/soc/sof/mediatek/mt8195/mt8195-loader.c |  56 +++
 sound/soc/sof/mediatek/mt8195/mt8195.c        | 377 ++++++++++++++++++
 sound/soc/sof/mediatek/mt8195/mt8195.h        | 158 ++++++++
 sound/soc/sof/pcm.c                           |  12 +
 sound/soc/sof/sof-of-dev.c                    |  13 +
 sound/soc/sof/topology.c                      |  59 +++
 16 files changed, 805 insertions(+), 1 deletion(-)
 create mode 100644 include/sound/sof/dai-mediatek.h
 create mode 100644 sound/soc/sof/mediatek/Kconfig
 create mode 100644 sound/soc/sof/mediatek/Makefile
 create mode 100644 sound/soc/sof/mediatek/adsp_helper.h
 create mode 100644 sound/soc/sof/mediatek/mediatek-ops.h
 create mode 100644 sound/soc/sof/mediatek/mt8195/Makefile
 create mode 100644 sound/soc/sof/mediatek/mt8195/mt8195-loader.c
 create mode 100644 sound/soc/sof/mediatek/mt8195/mt8195.c
 create mode 100644 sound/soc/sof/mediatek/mt8195/mt8195.h

-- 
2.27.0

