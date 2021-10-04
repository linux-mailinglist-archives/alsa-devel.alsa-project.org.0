Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D8042129B
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Oct 2021 17:24:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6341168D;
	Mon,  4 Oct 2021 17:23:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6341168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633361075;
	bh=VZUxSOkU4y0xvCTljgNWI0B19EWKJt5G6DU676fgvK4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HX3yq5WzOJxs8MP9PX+yPWp+8ENn6yxujtsnnfWnszwyWPjIlRvyvnuiOlTC4BOR4
	 OpV0H7xYTjKYlSumiyBA+IC1mkZIkuHQi+AVK9KDP9LCQsdBAdk42NH+JX0CN0MbYe
	 vfADV0giAjReeVRD7p+IYxJu/etVsGZ5E0uzPkGc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B375F804F3;
	Mon,  4 Oct 2021 17:22:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE5FDF804AC; Mon,  4 Oct 2021 17:22:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130041.outbound.protection.outlook.com [40.107.13.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAA24F80249;
 Mon,  4 Oct 2021 17:22:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAA24F80249
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="KoyKs7Q/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nAxZW7bl5T6TpJLMfWUAFZlwd2liAV5IBF3MBPwrlU5edTjTHxfqRuIiMujw6I0Zgo8MLhFEOgoDU8GhSfGJx0nwpo7irZpCVDSE5Dh2aASWBuEdOFijy4q32rrKv6gbTnKOXiWZRb0vkyo8OlGfyOht3Vi7PUSw1W2fWD9DVl8tUq3ChN/QotYJmzFKzElUV9K9nDzYZEcNEU5wuHxA2VdmQ85dgtqpXwmyngBC8jxF9GUP6srR6Xp6QVCTqy4P8KP4TaXQ+mF2NN04cvXR4s1knvtivQzesbvZ06u1kxIa6puB5hWe6MwqpwpHMMO+cOEM+mRxhpOCAvhzv+bp9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1evrSSMpE3QGDZWh2leyYpyQmz5qlGwZ8UTocQ3twA8=;
 b=A1pA65D5IXiD2HnhI7iZhMBQOtR4okM+raYBQKx49IhSZcRu7NX3vl7ynHhXlf7tTbBb9oif5JlPdqDLvc1cFsQtTVZhnCvjC9ahqtPHzYQJAyVF6iZSFOwRdstqkCyGZxgl0d3zXGwV0I42SD/MVxjcqbwH3nCuKS/pHsLwhHISw7vW0yMC55ZJGXhiaEBCiL/R+/n6pGEImy3kejAm8sRy5Kr3QPAScTJFOWLpDtc995WN9tuM9fGaTxjxBBmwFn7nH4BuObfc/9O5M0YQaBg6aJG87BFwMwetKcvmI13uWJZL3A2L0l09wdSy66aMLbz1phA191N0BlwnWRUQWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1evrSSMpE3QGDZWh2leyYpyQmz5qlGwZ8UTocQ3twA8=;
 b=KoyKs7Q/ANMRp8HJkQ5f5RjaTBwZgKNKJBkT23e/+vau95EuNbDlSBQYtNp/b/asiCZEHOClCvs2M3MDH3atszRsFvefaIVq/UfUSZRR4X2Z2wnJ0/pfQbPf3vUAL3h5UTcKjBYHbuTdwNjE+gmCbF9l+r9Th/ts0GIs9yLJYxk=
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
Subject: [PATCH 2/4] ASoC: SOF: Make Intel IPC stream ops generic
Date: Mon,  4 Oct 2021 18:21:45 +0300
Message-Id: <20211004152147.1268978-3-daniel.baluta@oss.nxp.com>
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
 Transport; Mon, 4 Oct 2021 15:22:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5a1b1ad-3b2f-41c6-9431-08d9874abfb4
X-MS-TrafficTypeDiagnostic: VI1PR04MB7069:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB7069C9AF2AA0D9A80C799B68B8AE9@VI1PR04MB7069.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dn346YTo3Sch0JORbha3cCzsUdVby9sr21WkKuQOrIg522TTAG98OYbzlZAJBVVqXF9Yy+EwPOJmZ1whUXIWzm7uhFUVWlmyxpzo7+6m9LO2FhmpnIQb7sr0u8iItRcpa3HPKUHM0STgf1jnivta8QhJFpx1Y38TQm/FctuSwASLIpMraPlNh8C5XA9992CkkFUG3I2anxGMxODfi1wG5mvDXXF9b1e1dfR5vMHeugcxnR4T012ajcDLEg0j/V8Q6tu0Ag6er3WJrMHTrHpF4TyAS52bQ+vnOaWaDxvhUC4hdB2XNHHXPJT+ODiQetQjk3+d/rjOYJObpzoyE9Q8+CK9oQShvr2vuRAb9S9F+YXwyXBZaE6YFGKcOCA44Tk6YigeeKdxYpearnjodUSv/gp07SCRuI4vGqEG1MhkkbSY8bEzTeMl4P6YmoVZVq716JbfJPO+X8LnU/sEq8dBJ+NMcWtI44v64/vDeXllfljCfZdcoXv1nHXqXy1xckv2OuxOM7jNMpMznwYR65r1hQ39YOgy1MuTiZUeF+JPbzcn+kHIxBhbwmJikvo9x2cZnSnQbs6vnvYl9QnCTRc/go9qbewqsUBymLZqPJTdknp76qLMSAh6Qm1YoItyei2DkmzbFbYO9Fw+xNW/duTBTlCHa521zDdSmzJbzqx82uMW0nUtj2DlE/AY3+n817fhOqq9asIkK+m4Cfbc0U9UrASBcyJ9aDYBWq2NKJ7cutI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(1076003)(186003)(8936002)(38350700002)(86362001)(38100700002)(5660300002)(2616005)(8676002)(956004)(2906002)(508600001)(26005)(6486002)(66476007)(52116002)(7416002)(66946007)(6512007)(30864003)(6506007)(6916009)(44832011)(83380400001)(316002)(4326008)(66574015)(66556008)(54906003)(6666004)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGlMYysxaEZFVHJuZVZHRjVhUVRGMzJOeXVMZzY1QWdINjc1Tnh4RGhXaXlt?=
 =?utf-8?B?eWNtMVdwdFhrTGM4TlhjVVIrS1I2eCtDcnZuSUFCaXBaS1Q4dnZsL1R1NHcx?=
 =?utf-8?B?YnR6N3RvUC8xTkRRa3pjVlFtczM0YVNqSGxaUEdiSHRocTAxQ0dkYjExZWUv?=
 =?utf-8?B?Yi9zcVBJem5JZlNtZDE4WXpNczdGdGJWWTVDNU03WkwwR1lDQVBuSEdDT0Js?=
 =?utf-8?B?THc5eTZ1TG1TOFhXd2tnVFIydVFsa1czTkIyZnF6ZEt4aXZXSEUwUFJxb21i?=
 =?utf-8?B?UFN0L2JzcVhaZldPb0hMWHVEYU44NjlucFZ5c1dCVllVcVFSZlNSdXNvT2VH?=
 =?utf-8?B?WC9nUkVSVVlXSHBHVytNaGlkczdpc0NTajhWNTIxRU1zRUtxaTNYV1RmZ2di?=
 =?utf-8?B?NTNIK0lvUnV3cUVOSzRBVzRiSU1IaUhvUG52bHdRQlpwcWJtUUlHN0IrSFQ3?=
 =?utf-8?B?MHZQeE9BWUFKekhLTUJIUHNOV2NNWWdsS2kzKytGYldRMlgyeENhTlIxbjM5?=
 =?utf-8?B?Mm9xU0JVTEgvblk3QXpZaHcwKy9JWVhnNjVxbm51Ni93L0hYV3V5Y283cG1t?=
 =?utf-8?B?VldleGZRdk9adWtBQjJUOVpYZzNnUnRQQXlieTk3RkljbGtRWnIyQmtNcFk0?=
 =?utf-8?B?ZnJ0eEp1ZzhKUHlGMnVscGFGelk3SDJuWDcxY0dENEtmcE43VkYyNkRWZGV3?=
 =?utf-8?B?OG9PcmRKYi9hTXdrTXQ1Zzh3T29WK1NRRUd1VG83b0d3ak85UWMrZzFZOGlP?=
 =?utf-8?B?dUhqVVpqVU1VeWg1YmVnTEhKb0ZHRFlNOUk5YkpjMWhrWGRMZGRERGJQWWYz?=
 =?utf-8?B?aXFiL2VoTkZoNmh6MEFFa3g4dFFzUjQ4ZHB3dGk1TkRyVmJnY1EvNi9PQy80?=
 =?utf-8?B?UVBRcU1MMzBHY1hDbHlaQlJRTVBJTHRXU0xSZTBsT20vQW4xd1ZrTHk3R0Va?=
 =?utf-8?B?RkhtSlNOUlVicFhueGcxeVRtUWlQazA2ci9uQTRzandwY2pYT3Nmdm5acmti?=
 =?utf-8?B?aGJoT2FIK1Nwa1V2Q0NuSDh2SEp5SHBSMHdHUDBZMGdRQW54MGNRR1oySDJZ?=
 =?utf-8?B?UEJRRjVvTjJtNFFhNi9XcU10eXorOGZqalhUcVlETU4rSTZoVU5pN1lWZmYy?=
 =?utf-8?B?dXhIeUhxK2QwTXlWTU5iUGpjY09BbFIxMlk3eUNFMTJiUU5mZmViZktpQzh6?=
 =?utf-8?B?R3dOd0VCS2xsellqb0ZUc1dtY3pQd2Z1TEZPVmpIa2RpZFVtT3RCTzd3MWNL?=
 =?utf-8?B?QWlDc0NFU0lyajZGMlBKcGFKQnlKeVIyQ3ZiUmhGaU1MRVBSV0ZoYmVwTUFn?=
 =?utf-8?B?eWRzR2RROWhieDQ4anFVWjBNSG5odngxdDlvK1U2L1h0QWVyUjc2TWdMQnlP?=
 =?utf-8?B?ZzFaeGZmVVB3YlJ1VWg0QlQxZE1jckpVSWIxa091cDcxN1lCZ3NlYTdIMFFD?=
 =?utf-8?B?WFlOQUtoTmREbHdIT0FMK1dNV0M3a29SV1VQZjE1WnY1SjdnQzdDVE5yR1h6?=
 =?utf-8?B?QmJTSzlzQXYzaHowQkVxVEM2eGkyMlhPbml4eFNwb1ArR0YveWxJTStuRk83?=
 =?utf-8?B?c3lDTndtY3VZN3lCeEN4VUR4VGpwaHZva0NUczdlYk1iYmJyOFFHT21tSnYz?=
 =?utf-8?B?MW9KcFUxUk9PbU1LVWMzK3o4S0ZsblRlWFl0UlhFOExLN0RZVVhERitUYWVp?=
 =?utf-8?B?ako1SitpYkRwQ1FaVHhlVGJSd1hFUUxNZEVObTUwUWVNSlhPbVlaZHFrTGtY?=
 =?utf-8?Q?foxuvP4pyfy7PNujaocTjpxCu8kkT1F8Rgo+IB3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5a1b1ad-3b2f-41c6-9431-08d9874abfb4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2021 15:22:16.5406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ZsaEyW5cMDk5TgUG15KF0JrHrM9p4Rf391nBswjZx6dd0+WEQh6I0wfU6MviyvDmCSvaccuXDmNLTzeTcQMEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7069
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, budliviu@gmail.com, yang.jie@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 Daniel Baluta <daniel.baluta@gmail.com>, peter.ujfalusi@linux.intel.com,
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

From: Bud Liviu-Alexandru <budliviu@gmail.com>

This operations should be generic as there is nothing Intel
specific. This works well for NXP i.MX8 stream IPC ops.

We start by moving sof/intel/intel-ipc.c into sof/stream-ipc.c and
rename the functions to be generic.

Notice that we use newly introduced snd_sof_dsp_mailbox_read
instead of sof_mailbox_read, to make sure that we are not
bound to existing MMIO memory access, and we allow platform
to implement their own memory access routines.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Bud Liviu-Alexandru <budliviu@gmail.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@gmail.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/Makefile                        |  2 +-
 sound/soc/sof/intel/Makefile                  |  3 --
 sound/soc/sof/intel/bdw.c                     |  8 +--
 sound/soc/sof/intel/byt.c                     | 16 +++---
 sound/soc/sof/intel/pci-tng.c                 |  8 +--
 sound/soc/sof/sof-priv.h                      | 20 ++++----
 .../sof/{intel/intel-ipc.c => stream-ipc.c}   | 50 +++++++++----------
 7 files changed, 52 insertions(+), 55 deletions(-)
 rename sound/soc/sof/{intel/intel-ipc.c => stream-ipc.c} (58%)

diff --git a/sound/soc/sof/Makefile b/sound/soc/sof/Makefile
index bdea0faac117..c5b97c66a9f1 100644
--- a/sound/soc/sof/Makefile
+++ b/sound/soc/sof/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 
 snd-sof-objs := core.o ops.o loader.o ipc.o pcm.o pm.o debug.o topology.o\
-		control.o trace.o utils.o sof-audio.o
+		control.o trace.o utils.o sof-audio.o stream-ipc.o
 
 snd-sof-$(CONFIG_SND_SOC_SOF_DEBUG_PROBES) += sof-probes.o
 
diff --git a/sound/soc/sof/intel/Makefile b/sound/soc/sof/intel/Makefile
index 9635dd47a17d..1f473d4d8416 100644
--- a/sound/soc/sof/intel/Makefile
+++ b/sound/soc/sof/intel/Makefile
@@ -3,8 +3,6 @@
 snd-sof-acpi-intel-byt-objs := byt.o
 snd-sof-acpi-intel-bdw-objs := bdw.o
 
-snd-sof-intel-ipc-objs := intel-ipc.o
-
 snd-sof-intel-hda-common-objs := hda.o hda-loader.o hda-stream.o hda-trace.o \
 				 hda-dsp.o hda-ipc.o hda-ctrl.o hda-pcm.o \
 				 hda-dai.o hda-bus.o \
@@ -18,7 +16,6 @@ snd-sof-intel-atom-objs := atom.o
 obj-$(CONFIG_SND_SOC_SOF_INTEL_ATOM_HIFI_EP) += snd-sof-intel-atom.o
 obj-$(CONFIG_SND_SOC_SOF_BAYTRAIL) += snd-sof-acpi-intel-byt.o
 obj-$(CONFIG_SND_SOC_SOF_BROADWELL) += snd-sof-acpi-intel-bdw.o
-obj-$(CONFIG_SND_SOC_SOF_INTEL_HIFI_EP_IPC) += snd-sof-intel-ipc.o
 obj-$(CONFIG_SND_SOC_SOF_HDA_COMMON) += snd-sof-intel-hda-common.o
 obj-$(CONFIG_SND_SOC_SOF_HDA) += snd-sof-intel-hda.o
 
diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index 9c06b92fcb5e..2c09a523288e 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -626,8 +626,8 @@ static const struct snd_sof_dsp_ops sof_bdw_ops = {
 	.get_mailbox_offset = bdw_get_mailbox_offset,
 	.get_window_offset = bdw_get_window_offset,
 
-	.ipc_msg_data	= intel_ipc_msg_data,
-	.ipc_pcm_params	= intel_ipc_pcm_params,
+	.ipc_msg_data	= sof_ipc_msg_data,
+	.ipc_pcm_params	= sof_ipc_pcm_params,
 
 	/* machine driver */
 	.machine_select = bdw_machine_select,
@@ -642,8 +642,8 @@ static const struct snd_sof_dsp_ops sof_bdw_ops = {
 	.debugfs_add_region_item = snd_sof_debugfs_add_region_item_iomem,
 
 	/* stream callbacks */
-	.pcm_open	= intel_pcm_open,
-	.pcm_close	= intel_pcm_close,
+	.pcm_open	= sof_stream_pcm_open,
+	.pcm_close	= sof_stream_pcm_close,
 
 	/* Module loading */
 	.load_module    = snd_sof_parse_module_memcpy,
diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index 8c500a83babc..e2fa08f1ae74 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -240,8 +240,8 @@ static const struct snd_sof_dsp_ops sof_byt_ops = {
 	.get_mailbox_offset = atom_get_mailbox_offset,
 	.get_window_offset = atom_get_window_offset,
 
-	.ipc_msg_data	= intel_ipc_msg_data,
-	.ipc_pcm_params	= intel_ipc_pcm_params,
+	.ipc_msg_data	= sof_ipc_msg_data,
+	.ipc_pcm_params	= sof_ipc_pcm_params,
 
 	/* machine driver */
 	.machine_select = atom_machine_select,
@@ -256,8 +256,8 @@ static const struct snd_sof_dsp_ops sof_byt_ops = {
 	.debugfs_add_region_item = snd_sof_debugfs_add_region_item_iomem,
 
 	/* stream callbacks */
-	.pcm_open	= intel_pcm_open,
-	.pcm_close	= intel_pcm_close,
+	.pcm_open	= sof_stream_pcm_open,
+	.pcm_close	= sof_stream_pcm_close,
 
 	/* module loading */
 	.load_module	= snd_sof_parse_module_memcpy,
@@ -322,8 +322,8 @@ static const struct snd_sof_dsp_ops sof_cht_ops = {
 	.get_mailbox_offset = atom_get_mailbox_offset,
 	.get_window_offset = atom_get_window_offset,
 
-	.ipc_msg_data	= intel_ipc_msg_data,
-	.ipc_pcm_params	= intel_ipc_pcm_params,
+	.ipc_msg_data	= sof_ipc_msg_data,
+	.ipc_pcm_params	= sof_ipc_pcm_params,
 
 	/* machine driver */
 	.machine_select = atom_machine_select,
@@ -338,8 +338,8 @@ static const struct snd_sof_dsp_ops sof_cht_ops = {
 	.debugfs_add_region_item = snd_sof_debugfs_add_region_item_iomem,
 
 	/* stream callbacks */
-	.pcm_open	= intel_pcm_open,
-	.pcm_close	= intel_pcm_close,
+	.pcm_open	= sof_stream_pcm_open,
+	.pcm_close	= sof_stream_pcm_close,
 
 	/* module loading */
 	.load_module	= snd_sof_parse_module_memcpy,
diff --git a/sound/soc/sof/intel/pci-tng.c b/sound/soc/sof/intel/pci-tng.c
index 8042ac76ec15..18eb41b8a8f4 100644
--- a/sound/soc/sof/intel/pci-tng.c
+++ b/sound/soc/sof/intel/pci-tng.c
@@ -156,8 +156,8 @@ const struct snd_sof_dsp_ops sof_tng_ops = {
 	.get_mailbox_offset = atom_get_mailbox_offset,
 	.get_window_offset = atom_get_window_offset,
 
-	.ipc_msg_data	= intel_ipc_msg_data,
-	.ipc_pcm_params	= intel_ipc_pcm_params,
+	.ipc_msg_data	= sof_ipc_msg_data,
+	.ipc_pcm_params	= sof_ipc_pcm_params,
 
 	/* machine driver */
 	.machine_select = atom_machine_select,
@@ -172,8 +172,8 @@ const struct snd_sof_dsp_ops sof_tng_ops = {
 	.debugfs_add_region_item = snd_sof_debugfs_add_region_item_iomem,
 
 	/* stream callbacks */
-	.pcm_open	= intel_pcm_open,
-	.pcm_close	= intel_pcm_close,
+	.pcm_open	= sof_stream_pcm_open,
+	.pcm_close	= sof_stream_pcm_close,
 
 	/* module loading */
 	.load_module	= snd_sof_parse_module_memcpy,
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 388e71bcacf8..3927015c8a96 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -576,17 +576,17 @@ int sof_block_read(struct snd_sof_dev *sdev, enum snd_sof_fw_blk_type blk_type,
 
 int sof_fw_ready(struct snd_sof_dev *sdev, u32 msg_id);
 
-int intel_ipc_msg_data(struct snd_sof_dev *sdev,
+int sof_ipc_msg_data(struct snd_sof_dev *sdev,
+		     struct snd_pcm_substream *substream,
+		     void *p, size_t sz);
+int sof_ipc_pcm_params(struct snd_sof_dev *sdev,
 		       struct snd_pcm_substream *substream,
-		       void *p, size_t sz);
-int intel_ipc_pcm_params(struct snd_sof_dev *sdev,
-			 struct snd_pcm_substream *substream,
-			 const struct sof_ipc_pcm_params_reply *reply);
-
-int intel_pcm_open(struct snd_sof_dev *sdev,
-		   struct snd_pcm_substream *substream);
-int intel_pcm_close(struct snd_sof_dev *sdev,
-		    struct snd_pcm_substream *substream);
+		       const struct sof_ipc_pcm_params_reply *reply);
+
+int sof_stream_pcm_open(struct snd_sof_dev *sdev,
+			struct snd_pcm_substream *substream);
+int sof_stream_pcm_close(struct snd_sof_dev *sdev,
+			 struct snd_pcm_substream *substream);
 
 int sof_machine_check(struct snd_sof_dev *sdev);
 
diff --git a/sound/soc/sof/intel/intel-ipc.c b/sound/soc/sof/stream-ipc.c
similarity index 58%
rename from sound/soc/sof/intel/intel-ipc.c
rename to sound/soc/sof/stream-ipc.c
index df37187c8427..15a55851faeb 100644
--- a/sound/soc/sof/intel/intel-ipc.c
+++ b/sound/soc/sof/stream-ipc.c
@@ -7,7 +7,7 @@
 //
 // Authors: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
 
-/* Intel-specific SOF IPC code */
+/* Generic SOF IPC code */
 
 #include <linux/device.h>
 #include <linux/export.h>
@@ -17,39 +17,39 @@
 #include <sound/pcm.h>
 #include <sound/sof/stream.h>
 
-#include "../ops.h"
-#include "../sof-priv.h"
+#include "ops.h"
+#include "sof-priv.h"
 
-struct intel_stream {
+struct sof_stream {
 	size_t posn_offset;
 };
 
-/* Mailbox-based Intel IPC implementation */
-int intel_ipc_msg_data(struct snd_sof_dev *sdev,
-		       struct snd_pcm_substream *substream,
-		       void *p, size_t sz)
+/* Mailbox-based Generic IPC implementation */
+int sof_ipc_msg_data(struct snd_sof_dev *sdev,
+		     struct snd_pcm_substream *substream,
+		     void *p, size_t sz)
 {
 	if (!substream || !sdev->stream_box.size) {
-		sof_mailbox_read(sdev, sdev->dsp_box.offset, p, sz);
+		snd_sof_dsp_mailbox_read(sdev, sdev->dsp_box.offset, p, sz);
 	} else {
-		struct intel_stream *stream = substream->runtime->private_data;
+		struct sof_stream *stream = substream->runtime->private_data;
 
 		/* The stream might already be closed */
 		if (!stream)
 			return -ESTRPIPE;
 
-		sof_mailbox_read(sdev, stream->posn_offset, p, sz);
+		snd_sof_dsp_mailbox_read(sdev, stream->posn_offset, p, sz);
 	}
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(intel_ipc_msg_data, SND_SOC_SOF_INTEL_HIFI_EP_IPC);
+EXPORT_SYMBOL(sof_ipc_msg_data);
 
-int intel_ipc_pcm_params(struct snd_sof_dev *sdev,
-			 struct snd_pcm_substream *substream,
-			 const struct sof_ipc_pcm_params_reply *reply)
+int sof_ipc_pcm_params(struct snd_sof_dev *sdev,
+		       struct snd_pcm_substream *substream,
+		       const struct sof_ipc_pcm_params_reply *reply)
 {
-	struct intel_stream *stream = substream->runtime->private_data;
+	struct sof_stream *stream = substream->runtime->private_data;
 	size_t posn_offset = reply->posn_offset;
 
 	/* check if offset is overflow or it is not aligned */
@@ -64,12 +64,12 @@ int intel_ipc_pcm_params(struct snd_sof_dev *sdev,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(intel_ipc_pcm_params, SND_SOC_SOF_INTEL_HIFI_EP_IPC);
+EXPORT_SYMBOL(sof_ipc_pcm_params);
 
-int intel_pcm_open(struct snd_sof_dev *sdev,
-		   struct snd_pcm_substream *substream)
+int sof_stream_pcm_open(struct snd_sof_dev *sdev,
+			struct snd_pcm_substream *substream)
 {
-	struct intel_stream *stream = kmalloc(sizeof(*stream), GFP_KERNEL);
+	struct sof_stream *stream = kmalloc(sizeof(*stream), GFP_KERNEL);
 
 	if (!stream)
 		return -ENOMEM;
@@ -86,18 +86,18 @@ int intel_pcm_open(struct snd_sof_dev *sdev,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(intel_pcm_open, SND_SOC_SOF_INTEL_HIFI_EP_IPC);
+EXPORT_SYMBOL(sof_stream_pcm_open);
 
-int intel_pcm_close(struct snd_sof_dev *sdev,
-		    struct snd_pcm_substream *substream)
+int sof_stream_pcm_close(struct snd_sof_dev *sdev,
+			 struct snd_pcm_substream *substream)
 {
-	struct intel_stream *stream = substream->runtime->private_data;
+	struct sof_stream *stream = substream->runtime->private_data;
 
 	substream->runtime->private_data = NULL;
 	kfree(stream);
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(intel_pcm_close, SND_SOC_SOF_INTEL_HIFI_EP_IPC);
+EXPORT_SYMBOL(sof_stream_pcm_close);
 
 MODULE_LICENSE("Dual BSD/GPL");
-- 
2.27.0

