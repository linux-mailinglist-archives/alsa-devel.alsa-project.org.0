Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CA540FA60
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Sep 2021 16:38:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B70717AB;
	Fri, 17 Sep 2021 16:38:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B70717AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631889531;
	bh=cGHcE5YDLvy2AxWutbfBWiK1jpHBOBDGkpLAWf/SJ5I=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TNfwuFXTrWqBPPplR1imZEJ5qIQxbbh5KV0sNw7tTbmNbNlV37dVhKlAff+sCGRfP
	 rnUx7tbwUEhrO0YxA0fEG3yU/ztdzLhAFelqu7DsoTNAai/x6IJK6XUUNFexzgQnhW
	 nE893J1ozhbd4o4WyNEn0fFaxsbnYr2Mh+f4gNvo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93A1BF804CA;
	Fri, 17 Sep 2021 16:37:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16692F804BD; Fri, 17 Sep 2021 16:37:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140047.outbound.protection.outlook.com [40.107.14.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93FF8F80152
 for <alsa-devel@alsa-project.org>; Fri, 17 Sep 2021 16:37:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93FF8F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="H03Ct+uP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FRSy/i83sybYh1OWduRby0S2MpTIZc4git0F1YW5hi7tVT32PiE5wMnQ/ZCwCHn69Z5rc4m1aNnjbxtCS+vUoZH3OkB3Hcsb9CGK+VzVo8EKuffXQEejzrM4BGwxk8HKHrEA8QAt0V3QZjZ1b/6tHXKe9L5dEofFEqPpTLB0SCo149CT0bxXgCBxVp9H0PbtoYTwCL1n1ydbbKx8aATJX+vctlN/5sd/hgt3hPERruVKamkNT/1hqoA7KAekij4bhovm2pxOwXU++CPSTnweygctw50XLI6tYGXKY1PZ/ffbmTebHMcHISCbAtoPH/rzZV/3pUCWMXL0CYrNMOSuXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=DBJdF652ocpAkUSwlKtxkK5ACiD3lYEIu2RMRT1uUGU=;
 b=WwfHbLD2T7NZzL7BWuPhKOHYJF0KvQZRez1k7DmZXfdqNG5xAUqLSpN9gwdsyir7nFRhVrPrSq8FDfxCtvl4K4cTdyxeIFo7yIF/VTeUZHSKv1T+PsS9ek7jH+wU1SemsXL/u3HqrUuKKNGTwddnVE+lgS3cFkNBXiFPo6QuOFyrA4UH+7HVfHDZKOaWu/o528GFsLBOfPE8EjBYlQmbOVrkIVN1HKh2S0gRd+WV3nQe53sihLUEnHTHStvNRRIxeGXtPJCU7h4LMMAl9M5v96xXamWp4JdRgV98epXWWAMbbZ9nElFjk5PZ/N8oNwbfPE0O/EEsrAEXsZXns5Gs3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DBJdF652ocpAkUSwlKtxkK5ACiD3lYEIu2RMRT1uUGU=;
 b=H03Ct+uP86YK7lCYgCP2+LsYWn0mrB6iOLi3ucIIcWdtcIOo9FTf9wCSRoDfqXhB07Wnf13la08d/p3GM0AGMKN7iXs9thSbc+HSRlgYym3awJCmVkbPZ0zTenAYpeeUViVNgJBtxEKpUGNwS55k1k3O2SwDeQlYz87WfigXSWA=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM0PR04MB5140.eurprd04.prod.outlook.com (2603:10a6:208:ca::21)
 by AM8PR04MB7409.eurprd04.prod.outlook.com (2603:10a6:20b:1c5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Fri, 17 Sep
 2021 14:37:19 +0000
Received: from AM0PR04MB5140.eurprd04.prod.outlook.com
 ([fe80::dd84:b996:1c8:705]) by AM0PR04MB5140.eurprd04.prod.outlook.com
 ([fe80::dd84:b996:1c8:705%6]) with mapi id 15.20.4523.016; Fri, 17 Sep 2021
 14:37:19 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH v2 00/12] Add support for on demand pipeline setup/destroy
Date: Fri, 17 Sep 2021 17:36:47 +0300
Message-Id: <20210917143659.401102-1-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P193CA0022.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:bd::32) To AM0PR04MB5140.eurprd04.prod.outlook.com
 (2603:10a6:208:ca::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5708:8600:8372:c747:541d:bbc9)
 by VI1P193CA0022.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:bd::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Fri, 17 Sep 2021 14:37:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85981e5b-f3a3-487b-0b91-08d979e8a6fd
X-MS-TrafficTypeDiagnostic: AM8PR04MB7409:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM8PR04MB74093A3DDD8F92D427123DA4B8DD9@AM8PR04MB7409.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5fMQqzdezgBLWiu+d+kzybzzwJVxW1hMxouhbLtkUTLSISVSr4R3QsK5MaS0FsPY0llLAzGudS/QT7QL6dtpd5yM5/349nzH5C6gOzi56XNrrog0VE2sEsfnqogJC2SGUbniEMDvSkr37v4LTHMXtSY3e1DTLvvozHrvt7trgMlfTClJI+VPH2I0T3h1RtAN+nKILjZmve07EkRrl49D+Ga9wcWU1QJTl8xR779wDgNN+wnrKi/oEWWpqJavl6DYuk2zPSKUiDFJJ/C8oNc5rfrLJyZUrWKdwUmo2mcDd1bqCI2tSRJY5Gs7DIknmDVRn4+DyOyHab1c0+Z6f/v+g1UySmojD/bEgM3xD9AalXG9WBNb31zsJvVCjPSITXpRFwUmLUYAWoBhmhmo+hn+omF5N7/b/Z3Uhny4JjaM2Mo+nW6H0Lr7yc4t2j7vdIwBTp1ARXb0vkqDlCtiFR923+PaKCtl03NC5HW8B1T2YF4kEthZiaCIGdbh5NcWZJN0m4guEusweG99INiJRwLRmxuTp+6zr7dZLSKT4yMKxbJ7JEIAs487uOPMRcBhcHC2Kz11+V24teroZsp48g159yynUAKzJSGiZf5Mux5x03ECY2jeUuvpB6jULudT3TVDWj1tNtNVuCiPVaPFrxPt+j25aPw6SfLrOj4G0ExhE1sKWMq2sihMIWoX1vjXv+vpOOXS8dOA0ZubAjztaMyrdC5ADPzNo8nYls9saIyOeSE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB5140.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(5660300002)(8676002)(2906002)(4326008)(38100700002)(8936002)(66476007)(44832011)(1076003)(6666004)(86362001)(66556008)(6512007)(186003)(478600001)(316002)(966005)(6486002)(2616005)(6506007)(52116002)(6916009)(66946007)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGZYQmI2REdwdmNBNXVySkMxSHpWWlZKNHd3WGpIai9MNFN5MW5EZytaVmho?=
 =?utf-8?B?T3RmTWVzZ1VUd3BuV1Z2NlZ1MTh3M3FjNGNQaUtjdHBPQ0RjUExtM29JaE1n?=
 =?utf-8?B?eEQ3VDZmZDQvZ1BWZ2RyZFVNVkVReW9sNkpzWFJIdWZHbnE0OE8rTWJUTno5?=
 =?utf-8?B?UFZWOFlHYkl6TjZoRjNUWU81MkNiZUx2bGEyZXRrdmM0LzdBN2J5b0xsVVQv?=
 =?utf-8?B?Q09aQzZjVXdRekFIditUYzd2VllVZFZRS3hPb0UxOTc2ZXI0NnFKOUxHZU1r?=
 =?utf-8?B?aDl4MTVBMlVDcHVlYmpJdFJUd1JUYnRwU1R3ZXBqdGlxMmhlMmFTQ1lveGNI?=
 =?utf-8?B?SHNPb0UzSDFUQXM4T1R4clRVc3I1ejFRK0ZiNGRRV0xFKzJrbkJ6cFNLR0c5?=
 =?utf-8?B?MHVCY2Jva3dpd0w4ZlVOMGZQS2xReGRLeTgrN1VheXhVRHl1dVY5dDYweUNS?=
 =?utf-8?B?K0R4VDVPMzREZEliSFBOSWk0bzRna2M2N0s0WG1iTUdsYWkzcjB3RVlqUHFL?=
 =?utf-8?B?Q0FPNkM2cFVuVnk4Z3N5OGRzUVRrd2txQ0t0YTFuRFJsRG9PN0E3K2R1Zm5o?=
 =?utf-8?B?N1JKVzlMT29KWDlTdUIwYStobk1xWm9aWVI0Y2pwNVV5dFR3ZEliQndzdlgr?=
 =?utf-8?B?SHdqNFdYeGdUeTV1YmZvNmYzZ3VVVWFraTl1aG9jdmJZSDZQZk55S2w1aG1n?=
 =?utf-8?B?RVpVeVh4bERQd0hpalA4OTV4akNPYk1TWFhiUWN6ckVmdTg3elAyQXRIaCtl?=
 =?utf-8?B?Z2x5OTlvckRwYXg5ZkRPejNheGdPVEZyOFhSa0xTQk9zME1pZFZWaU1BSmhn?=
 =?utf-8?B?bFRwbFhJM0ZqYTFGL05ZalVCam5LV092enBrc211ZjAwa1cvNTRSNW1RaGNJ?=
 =?utf-8?B?UjQrUXFCME9aR2hNY29BYkswemJQWDIyd09KS2xlNU9rVmxKaVVSVENYMFhx?=
 =?utf-8?B?RXdnY01aazB1T09wVnJEVkFQMi83Y0ZnSjNsVCsvTU9vTGVJUHpObSs1dUNE?=
 =?utf-8?B?UlljOTQ2T1g0a0hoc1dwa3RzUEhVL2dXSDczc2J4bEhUaDR1TE91VFp2Mmxw?=
 =?utf-8?B?RkhzVXJ2RHlyTjZZWSszUVRycDRrY0d6d2NVcUNSS0p5WFdVbUtDNFE2MUhq?=
 =?utf-8?B?UkVHWWVzb1hMbnN6RFJobnN1dzJ0MjR6THRtZTVkOTN0ZENGZlByYTFLVVpG?=
 =?utf-8?B?dzJub2VGd2JMcVk3eFViWE5oZ2FDK0JqTit6bFFiMkpUelRMaWJBdzVWNlhm?=
 =?utf-8?B?SFY1T1pqN21NblR5VFhyRVdpYkZEdkg0b3ZtWVVFQnJtMVd5VGI4T0NxbGtQ?=
 =?utf-8?B?TGRXbDl3eGYyejVBMFVNWW5YbzF3R0RCK0dWQzNrU0FwV1E0YUxpVERlbTFS?=
 =?utf-8?B?ZDgvUjdJU2NYK0dLSTViZXJ6cDg2ZFcveURPaVk0b1loaU9WbXZWZnJRWlVP?=
 =?utf-8?B?bi9jaGtZMm1XYUE5dit1YkFKNkNkYWpIWHY5RkJpd05lK01VSU82dS9uREJn?=
 =?utf-8?B?RENEb0Q1N1R0K1NIREtJNmczWTZXUHF5NVV1UTcrVkNSTzRHNVFaYy96SzJB?=
 =?utf-8?B?MnJ3NEoyVGpDOC9tbzBKUmV0NUpaS3NHY2I0aEdoZU5HeUdDYjJrMnIxcExK?=
 =?utf-8?B?WHJHVFNpZXRJdEVOdG9YVWZYbCtPajVTQXN4dDdyWFpzUzc4ay8wZTMvUThY?=
 =?utf-8?B?bTBRZHJWSnBDV2VZY2FoeWdxeDlDUnA3R1Y5dHorL0owU3JYSUJKMllGYS9l?=
 =?utf-8?B?YmljTEMrdE92WWt0ZlpNdGVZS3QySllad1pjcEtYb0puTFFFWXRZOFhJRjBs?=
 =?utf-8?B?QXY2Y2NNYlJlOXNKQkVheDNKTWE4SHlWOHYxd01DMHZaQVZoUlA0dVVBWFJY?=
 =?utf-8?Q?wcb+gLYhSSrWX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85981e5b-f3a3-487b-0b91-08d979e8a6fd
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5140.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 14:37:19.3019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l+lFgKAs38zluBy2+3hK5DFhGnJRrKVNZ8i5p2NNBoKpYPsYTpacGRLPjbhtJYn5LAriYutmrFpsAzu+WRLGCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7409
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
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

This patchseries implements the new feature to setup/teardown pipeline
as needed when a PCM is open/closed.

This only only support single cores, with support for multicore arriving
with a future patchseries.

Review with SOF community at
https://github.com/thesofproject/linux/pull/2794  

Changes since v1:
- added my own Signed-off-by tag.

Ranjani Sridharan (12):
  ASoC: topology: change the complete op in snd_soc_tplg_ops to return
    int
  ASoC: SOF: control: Add access field in struct snd_sof_control
  ASoC: SOF: topology: Add new token for dynamic pipeline
  ASoC: SOF: sof-audio: add helpers for widgets, kcontrols and dai
    config set up
  AsoC: dapm: export a couple of functions
  ASoC: SOF: Add new fields to snd_sof_route
  ASoC: SOF: restore kcontrols for widget during set up
  ASoC: SOF: Don't set up widgets during topology parsing
  ASoC: SOF: Introduce widget use_count
  ASoC: SOF: Intel: hda: make sure DAI widget is set up before IPC
  ASoC: SOF: Add support for dynamic pipelines
  ASoC: SOF: topology: Add kernel parameter for topology verification

 include/sound/soc-dpcm.h               |   1 +
 include/sound/soc-topology.h           |   2 +-
 include/uapi/sound/sof/tokens.h        |   1 +
 sound/soc/intel/skylake/skl-topology.c |   6 +-
 sound/soc/soc-dapm.c                   |   2 +
 sound/soc/soc-pcm.c                    |   4 +-
 sound/soc/soc-topology.c               |  10 +-
 sound/soc/sof/intel/hda-dai.c          | 176 +++---
 sound/soc/sof/intel/hda.c              | 177 ++++--
 sound/soc/sof/intel/hda.h              |   5 +
 sound/soc/sof/ipc.c                    |  22 +
 sound/soc/sof/pcm.c                    |  58 +-
 sound/soc/sof/pm.c                     |   4 +-
 sound/soc/sof/sof-audio.c              | 709 +++++++++++++++++++------
 sound/soc/sof/sof-audio.h              |  32 +-
 sound/soc/sof/sof-priv.h               |   1 +
 sound/soc/sof/topology.c               | 362 +++++--------
 17 files changed, 1034 insertions(+), 538 deletions(-)

-- 
2.27.0

