Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B78042129E
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Oct 2021 17:25:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7512A16C9;
	Mon,  4 Oct 2021 17:24:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7512A16C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633361126;
	bh=STINnrrut8eDPfYPTWMApISfRSgE1O5c9Xruf4+fJPM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N1OFJ1j95Mtbw3TN25KBAFOt+9gCbLG3WZfcj6UX6E4frWUvIu1owM2S9+AX9vx8f
	 5254w0KWjyLWWZIXFxh4rXOkUNPpalGggPA0jTTlzvFY4/SMsnPNDATgIBQ8lX0cjo
	 tpWDD46Re1lfyczsm/JDXCAnMHp5SQvDRFzydhcM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1189EF8051B;
	Mon,  4 Oct 2021 17:22:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 731E4F80511; Mon,  4 Oct 2021 17:22:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130041.outbound.protection.outlook.com [40.107.13.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80AC8F80171;
 Mon,  4 Oct 2021 17:22:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80AC8F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="UYQydg4g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZTL2mIaZ7bGkyKMAOzEmHEJ6gFdC8iaXDYyAf2vY6Co1pPM/nudiRTRkFc9rJlfMmGZnum6YH1D9zSulEPQikA8YoHAbJH/ezoVI9zB/+h6UlTgyTYrTA9o7Xvkv1RRxaxEZRvLh/GH5J99kEpFVq706rkIsrlXmVxaSjMY+pFpOb7QZquONgTJWci1n2w6AXzEH3dt2jRGkO5/qCjkDbZ8heaGjP4TISvrs1/t5nWcBdoSJ9+mcWWC4j960N6fcmZEQR8T+p8EGbhtrC4TvMes0QIY26hs8jEJJsFfP7jJppSSzI5aUcF8slQiTXAuLDwnzm4AAcIhkQl3c4LKGOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=APVOE3kpIW7O/JU/PDptFUx6WJwkJ/iByM3ET1n+FNE=;
 b=GTZdQvjVFabg47uH+kCPGbOC1H3XAc0VckdY5LfKU7zPPXQqi7HZbdsQDuBhpYTJSuP9CJFXw7jNqUMJhNWukasUPUnZLMJsyEbGPt/RuMWeWTVeZk3+j0hOVejoMJbSkzNkpAHOVE5CcEx3kxV91vJytacV3klrhedRMK5JtlCn3IVJxTUGGVzHAvjhlyTJYNRPkFWovpfp418WunHJ7m0UAEYGvfIvViNyzpjFQpRr2HV6QnnxLRULHp53Gcjxqg3csvrzB/6MAhC4PN8inOB2DztZyhVPonRB65pMgGlQsiyDbTLZSU2IWBCeWshhiSUEstEYgAgHwHv8rjx8mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APVOE3kpIW7O/JU/PDptFUx6WJwkJ/iByM3ET1n+FNE=;
 b=UYQydg4gx04LGFW00UlDyk7Iggec1PWjxj4B1BVz7BnJHjhTKTcYDrVIhr+5vbDOWNUjkbv1sN1B8Cra714DfkzFKdXGHbq8ql1xoDsu5Sft2mUmrI37QpS5DPcghn0b0aUP9EHrzpxUI+LVxuq0DV96NV9NH5wvBjrSMoXB07o=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB7069.eurprd04.prod.outlook.com (2603:10a6:800:127::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Mon, 4 Oct
 2021 15:22:20 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::9968:6eca:45c5:8af4]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::9968:6eca:45c5:8af4%7]) with mapi id 15.20.4544.026; Mon, 4 Oct 2021
 15:22:20 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH 4/4] ASoC: SOF: Introduce fragment elapsed notification API
Date: Mon,  4 Oct 2021 18:21:47 +0300
Message-Id: <20211004152147.1268978-5-daniel.baluta@oss.nxp.com>
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
 Transport; Mon, 4 Oct 2021 15:22:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2728263-af19-4f88-616c-08d9874ac0d9
X-MS-TrafficTypeDiagnostic: VI1PR04MB7069:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB7069F84E2FC0F2FB43D19ACEB8AE9@VI1PR04MB7069.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: amn2S082c0Vdv+GDE5n4r1w0vkcHW+WhYW7pmxXagrlM1yTSoMctR9PrW29rw6uqJizNn28i36tTMvmIw5ZxLBhyYfBpI1bWnIxMrjHLxPkvZ1TkBEj34LkMhfj/fIKF/Ifh1j+Cvgxw93pB07nWOfYwx0aOVtN3dwQT5k3GP789NqzKcFmeHamGE9DqZmmbPD64nXRi9jwCRadhAZshKMefgBjB2nBBcZArKwprSE1lRV8hKL8lvdEEK1fWPYXY/Fd5sfb/ZNo5CxeIthPVsIjDMDfgn1m1lzd/75debMO1vjgldGxKP+X5SndvG/E7TiNFNdaEwTECFE2I+BSRO22SmFz32MBdoHhNVvF0C5t+bwG4KHx0zleGfZQ5t+9DAdf/aP7PyJRzlMdd/kjXxUaBTJs+7kNBizPfcckUpSf/Qq2NSs1ySipNgSKGs5Q9O9dXCB9V4j0Dldm56xfssEWpXO01ygNBoEjFQnhzoLCjX8jAw1pmqNx7UsKitBd1MPSoy+c6y7VpXycoQ03bjp6+ldtlG1gztZhqKAanUXxK/3gDh18cMQMG9B8c6PCDhal7hLC3K3uiiqEwwnvvVfH3sv3Xm3fUJo2xnB7MmuUvo+FXmv7t/UVw9mSkgGhp/Hxjp+XFD/byJu6bOB5g5x66y7qhZ04gTtkkeYluwjbDgeitC/bDmHK/jk/kK2fgTKUkHFIOmUVAHtDu98fgJQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(1076003)(186003)(8936002)(38350700002)(86362001)(38100700002)(5660300002)(2616005)(8676002)(956004)(2906002)(508600001)(26005)(6486002)(66476007)(52116002)(7416002)(66946007)(6512007)(6506007)(6916009)(44832011)(83380400001)(316002)(4326008)(66574015)(66556008)(54906003)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U05GSHRzTmloTHlERG9Rbm05MC9ZNXdNTEhPZ3ZJU1A3WkN1NGJsRnk5Y3dz?=
 =?utf-8?B?VE9vT0xTU2lIUVhCMjNDQjJWRkhBOFJsYjhDaG9nR2lGK1kwcGNMdjh1V2c5?=
 =?utf-8?B?cmZ1L0pmd24rbjRUekhuV2o0cTlyUUVJU3pNeVNtWW9FREZGNGE3SlM2dURs?=
 =?utf-8?B?d2tBNkxXaGJwNTNVNnFlU2VialhYTW01akpQc2Zid0FOeGh6RlAvNFJDSU91?=
 =?utf-8?B?TThUV1dFQzBRVGFxOHdBc1ZjMWtNYmJJZGhUc1d4Zld3MEtyWHJaM0tsWDMx?=
 =?utf-8?B?K05ZcG5vZGxEbjkyZ2xOZzVuY3lwcjRnbTVaRUJWc0g4ZTcwZ25UaVh3S3dr?=
 =?utf-8?B?dkx1eGxRSGlaMDdoSlZMNTEySjUvQ3RLRGppREdKaVgzUkRERm0rSFlEQjhO?=
 =?utf-8?B?TGNhUnRiRGhHSStOcFU3MVhFVmc2MG5ZQXdpTk9rRmcvSmVSM1VFRzJmU3JZ?=
 =?utf-8?B?MEY3Y2w3OTF0Ym1JSlYrVTc3QkNEKzBUa2VPRUdLZzRRZkQ1SG1jQUxIQzNo?=
 =?utf-8?B?NjE4amI0QlRzRmtlWXd3bjNCd2ZzQ29GYUNSOStVYjE4aTRuZlhVT2NDbCt3?=
 =?utf-8?B?cU9mdUNZMUV4OHViVjZDZ0dkT3NSVStKVER1VG53dHBtb2ljMUdGZWtTUXdG?=
 =?utf-8?B?YkNianAzQysreCthd0g5aXRidWxTTWRyZjE0bVcwUTdaQVVXTXZsS1NNbTJC?=
 =?utf-8?B?R2tkWExxRnVNU2FYRURCUlJma0JzdTlPWGNTazlEWEJwTHBFUS8rMVBzV0Rw?=
 =?utf-8?B?a1V4d05yMG5hM3phb2EraTNRTzZIUEl6UWtkSFQvMm9MMG5qSVJFakN0TkpC?=
 =?utf-8?B?cElmeUVpcWo2M3liUXo1VnNKZDZFaG1hV2lSenNxSlJUMVBWRlVpMnp0UW1E?=
 =?utf-8?B?OTdaaXpjQ3RoODA4Si9qWkgwdC90ZXBYNlhibjdaWTBSUWg5d3NTV1V0R1lG?=
 =?utf-8?B?ZjBnSVIzUGpUekp1ZW40TDh0MnVob3dIOEpaMEgxdHVGNk5QOWExZmhZWFB4?=
 =?utf-8?B?ZkdWLzdFUXR3RmNZME5JWGJnVkF6TWpMa2ZBb3p3U2Nramk5T1JaZkJ2aklS?=
 =?utf-8?B?Nk1qd2h6WGo4OUd0U1pLdHBHMHh6ZFM1L2tGcXVXTUhwQWJQS1V5b2Y2bUJY?=
 =?utf-8?B?SmVNMS9YU0w0emVEVXdNdDZ0SGRVWGsxb01GTjE4UHR1TkRSWG04Yy80VUlG?=
 =?utf-8?B?cUtxTjZKaWlBWHFROHJxUUYwbnNYQXBpd3FPNlFDSDkrV3UrdjB5anN4clh1?=
 =?utf-8?B?VURJdWhONjc5dmpHZllDc2xZbnBhUWw4TVY0cGxZczJoRm4vdFVIZS9YVU1O?=
 =?utf-8?B?VFJySS9vcnBUTlBCRUw5S2JWVlhUK0x1azArd0ppRHQ5K3c5cFMvKzJ3YnQr?=
 =?utf-8?B?bXBENUc4UGNKVEwxRm5vVnFNMm5IS0VZSjliSHRMcTNqQUpEOVc1Wmh1Qkxp?=
 =?utf-8?B?K001TTMwME50UkNVM1hWK1Qwcm1VZXEvRGRSMnBINU9oaGxIQWMra1hrRTRj?=
 =?utf-8?B?K09XYzYwVlA2WThLSHlUUWxkMGYxb0JlZXJYMmZDMXBaY0lzYU9icjJCYnNw?=
 =?utf-8?B?bWY5QzgxMWR3elNXSU1YdGJWSXZCaENEL1M4cjFlRTVXWjRSRkNWb3BBTTZs?=
 =?utf-8?B?eUN4Zlh0dU5uU0pzVEZmMjhPR3ZUYk1XN1IxQ2VSY1JiRHJBSUNJWHNSaTk3?=
 =?utf-8?B?WDZGOTZyUHkxajdxWHlVc2FwUXRjcUVQMWJIclNtZy9SakkraVF0dWU4T3VG?=
 =?utf-8?Q?aLGpNlLy3UPdgmtr4GanU/vEez/OaAr+h9SXagu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2728263-af19-4f88-616c-08d9874ac0d9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2021 15:22:20.1826 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9vTfEoY1pcIFe1Xq8qZJLfz0Ldw1CyqkWvZe+SdphBGtm0j95D7bbcYrlnuqyVno23bLCJbzcsOgufAjEBSZyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7069
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, budliviu@gmail.com, yang.jie@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 Paul Olaru <paul.olaru@oss.nxp.com>, peter.ujfalusi@linux.intel.com,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
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

This patch prepares the introduction of the compress API with SOF.

After each fragment is accepted by the DSP we need to inform
the userspace applications that they can send the next fragment.
This is done via snd_compr_fragment_elapsed.

Similar with the PCM case, in order to avoid sending an IPC before
the previous IPC is handled we need to schedule a delayed work to
call snd_compr_fragment_elapsed().

See snd_sof_pcm_period_elapsed.

To sum up this patch offers the following API to SOF code:
	* snd_sof_compr_init_elapsed_work
	* snd_sof_compr_fragment_elapsed

Note that implementation for compressed function is in a new file
selected via CONFIG_SND_SOC_SOF_COMPRESS invisible config option.
This option is automatically selected for platforms that support
the compress interface. For now only i.MX8 platforms support this.

For symmetry we introduce snd_sof_pcm_init_elapsed_work to setup
the work struct for PCM case.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Bud Liviu-Alexandru <budliviu@gmail.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Paul Olaru <paul.olaru@oss.nxp.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/Kconfig     |  4 +++
 sound/soc/sof/Makefile    |  1 +
 sound/soc/sof/compress.c  | 51 +++++++++++++++++++++++++++++++++++++++
 sound/soc/sof/imx/Kconfig |  2 ++
 sound/soc/sof/ipc.c       |  6 +++--
 sound/soc/sof/pcm.c       |  7 +++++-
 sound/soc/sof/sof-audio.h | 11 ++++++++-
 sound/soc/sof/topology.c  |  6 +++--
 8 files changed, 82 insertions(+), 6 deletions(-)
 create mode 100644 sound/soc/sof/compress.c

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index 94d1a859fedc..6bb4db87af03 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -46,6 +46,10 @@ config SND_SOC_SOF_OF
 	  required to enable i.MX8 devices.
 	  Say Y if you need this option. If unsure select "N".
 
+config SND_SOC_SOF_COMPRESS
+	tristate
+	select SND_SOC_COMPRESS
+
 config SND_SOC_SOF_DEBUG_PROBES
 	bool "SOF enable data probing"
 	select SND_SOC_COMPRESS
diff --git a/sound/soc/sof/Makefile b/sound/soc/sof/Makefile
index c5b97c66a9f1..06e5f49f7ee8 100644
--- a/sound/soc/sof/Makefile
+++ b/sound/soc/sof/Makefile
@@ -4,6 +4,7 @@ snd-sof-objs := core.o ops.o loader.o ipc.o pcm.o pm.o debug.o topology.o\
 		control.o trace.o utils.o sof-audio.o stream-ipc.o
 
 snd-sof-$(CONFIG_SND_SOC_SOF_DEBUG_PROBES) += sof-probes.o
+snd-sof-$(CONFIG_SND_SOC_SOF_COMPRESS) += compress.o
 
 snd-sof-pci-objs := sof-pci-dev.o
 snd-sof-acpi-objs := sof-acpi-dev.o
diff --git a/sound/soc/sof/compress.c b/sound/soc/sof/compress.c
new file mode 100644
index 000000000000..01ca85f0b87f
--- /dev/null
+++ b/sound/soc/sof/compress.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// Copyright 2021 NXP
+//
+// Author: Daniel Baluta <daniel.baluta@nxp.com>
+
+#include <sound/soc.h>
+#include <sound/sof.h>
+#include <sound/compress_driver.h>
+#include "sof-audio.h"
+#include "sof-priv.h"
+
+static void snd_sof_compr_fragment_elapsed_work(struct work_struct *work)
+{
+	struct snd_sof_pcm_stream *sps =
+		container_of(work, struct snd_sof_pcm_stream,
+			     period_elapsed_work);
+
+	snd_compr_fragment_elapsed(sps->cstream);
+}
+
+void snd_sof_compr_init_elapsed_work(struct work_struct *work)
+{
+	INIT_WORK(work, snd_sof_compr_fragment_elapsed_work);
+}
+
+/*
+ * sof compr fragment elapse, this could be called in irq thread context
+ */
+void snd_sof_compr_fragment_elapsed(struct snd_compr_stream *cstream)
+{
+	struct snd_soc_component *component;
+	struct snd_soc_pcm_runtime *rtd;
+	struct snd_sof_pcm *spcm;
+
+	if (!cstream)
+		return;
+
+	rtd = cstream->private_data;
+	component = snd_soc_rtdcom_lookup(rtd, SOF_AUDIO_PCM_DRV_NAME);
+
+	spcm = snd_sof_find_spcm_dai(component, rtd);
+	if (!spcm) {
+		dev_err(component->dev,
+			"fragment elapsed called for unknown stream!\n");
+		return;
+	}
+
+	/* use the same workqueue-based solution as for PCM, cf. snd_sof_pcm_elapsed */
+	schedule_work(&spcm->stream[cstream->direction].period_elapsed_work);
+}
diff --git a/sound/soc/sof/imx/Kconfig b/sound/soc/sof/imx/Kconfig
index 49d605cb09a5..34cf228c188f 100644
--- a/sound/soc/sof/imx/Kconfig
+++ b/sound/soc/sof/imx/Kconfig
@@ -38,6 +38,7 @@ config SND_SOC_SOF_IMX8
 	tristate
 	select SND_SOC_SOF_IMX_COMMON
 	select SND_SOC_SOF_XTENSA
+	select SND_SOC_SOF_COMPRESS
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level.
@@ -54,6 +55,7 @@ config SND_SOC_SOF_IMX8M
 	tristate
 	select SND_SOC_SOF_IMX_COMMON
 	select SND_SOC_SOF_XTENSA
+	select SND_SOC_SOF_COMPRESS
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level.
diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 53593df95155..1efc2c395c54 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -539,8 +539,10 @@ static void ipc_period_elapsed(struct snd_sof_dev *sdev, u32 msg_id)
 
 	memcpy(&stream->posn, &posn, sizeof(posn));
 
-	/* only inform ALSA for period_wakeup mode */
-	if (!stream->substream->runtime->no_period_wakeup)
+	if (spcm->pcm.compress)
+		snd_sof_compr_fragment_elapsed(stream->cstream);
+	else if (!stream->substream->runtime->no_period_wakeup)
+		/* only inform ALSA for period_wakeup mode */
 		snd_sof_pcm_period_elapsed(stream->substream);
 }
 
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 374df2dfa816..fa0bfcd2474e 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -57,7 +57,7 @@ static int sof_pcm_dsp_params(struct snd_sof_pcm *spcm, struct snd_pcm_substream
 /*
  * sof pcm period elapse work
  */
-void snd_sof_pcm_period_elapsed_work(struct work_struct *work)
+static void snd_sof_pcm_period_elapsed_work(struct work_struct *work)
 {
 	struct snd_sof_pcm_stream *sps =
 		container_of(work, struct snd_sof_pcm_stream,
@@ -66,6 +66,11 @@ void snd_sof_pcm_period_elapsed_work(struct work_struct *work)
 	snd_pcm_period_elapsed(sps->substream);
 }
 
+void snd_sof_pcm_init_elapsed_work(struct work_struct *work)
+{
+	 INIT_WORK(work, snd_sof_pcm_period_elapsed_work);
+}
+
 /*
  * sof pcm period elapse, this could be called at irq thread context.
  */
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 149b3dbcddd1..3f16611fbca7 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -36,6 +36,7 @@ struct snd_sof_pcm_stream {
 	struct snd_dma_buffer page_table;
 	struct sof_ipc_stream_posn posn;
 	struct snd_pcm_substream *substream;
+	struct snd_compr_stream *cstream;
 	struct work_struct period_elapsed_work;
 	struct snd_soc_dapm_widget_list *list; /* list of connected DAPM widgets */
 	bool d0i3_compatible; /* DSP can be in D0I3 when this pcm is opened */
@@ -231,7 +232,15 @@ struct snd_sof_pcm *snd_sof_find_spcm_pcm_id(struct snd_soc_component *scomp,
 const struct sof_ipc_pipe_new *snd_sof_pipeline_find(struct snd_sof_dev *sdev,
 						     int pipeline_id);
 void snd_sof_pcm_period_elapsed(struct snd_pcm_substream *substream);
-void snd_sof_pcm_period_elapsed_work(struct work_struct *work);
+void snd_sof_pcm_init_elapsed_work(struct work_struct *work);
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMPRESS)
+void snd_sof_compr_fragment_elapsed(struct snd_compr_stream *cstream);
+void snd_sof_compr_init_elapsed_work(struct work_struct *work);
+#else
+static inline void snd_sof_compr_fragment_elapsed(struct snd_compr_stream *cstream) { }
+static inline void snd_sof_compr_init_elapsed_work(struct work_struct *work) { }
+#endif
 
 /*
  * Mixer IPC
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 44d60081bc26..43bd2f18c1c2 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2581,8 +2581,10 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
 
 	for_each_pcm_streams(stream) {
 		spcm->stream[stream].comp_id = COMP_ID_UNASSIGNED;
-		INIT_WORK(&spcm->stream[stream].period_elapsed_work,
-			  snd_sof_pcm_period_elapsed_work);
+		if (pcm->compress)
+			snd_sof_compr_init_elapsed_work(&spcm->stream[stream].period_elapsed_work);
+		else
+			snd_sof_pcm_init_elapsed_work(&spcm->stream[stream].period_elapsed_work);
 	}
 
 	spcm->pcm = *pcm;
-- 
2.27.0

