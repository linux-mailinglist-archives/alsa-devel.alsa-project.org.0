Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E343454413
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 10:45:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3095E1877;
	Wed, 17 Nov 2021 10:44:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3095E1877
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637142318;
	bh=AxOiCrIkGcO9YuFIHbBRqLbAsPKXvFIkqlCP748Ieik=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FJ1yvt4FyvFGCxMwWHk6zwRoksvdmPctK6PXLkfOyLYy9hHJYu1bB1RKgN1siLQFc
	 abEIzUsIVBGDKt38FuRKy7xvm2roLk2ISl5KSUVcZwPMsGWCqFXMrWbFOdvmvHLT74
	 CDBelhjn4U62D86eIhVaIfx0lChiO4R87dSBd4Ds=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82EFEF805AD;
	Wed, 17 Nov 2021 10:38:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 513F7F8027D; Wed, 17 Nov 2021 10:38:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80073.outbound.protection.outlook.com [40.107.8.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3946F8027D
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 10:38:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3946F8027D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="HlfexXBh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=esCIdA5866qzwlkwcU4XIFoXlq2pAlFvJICtnmgouu73Zooy+c6YpyCjNfCMEC0zFE5G+NUzIEGn7Z1/Cf8hICAnFkY10wLwB8g90wo9YxbS7pMhdZ1ETQ1BOYzU5fmxHbUSieGO6SFFvg12cQGtmTuAGEtiVSI/JjLXvf9/aZbfqP8e7QdSfSxZgdLjf6XFZuZlosomeU9kmJwPrU7w9TsQcck54z2sxaHS2SmJz8c1E+tJTei/S0erWzRtC9nL+Wz8DM0JX1r1RrXVaEBpWjFFiaymXE9GGGfNZQo2AznBiHO0FHmxn8UYcZGwrrU+WSJHHxI5xv4/MO2lRoLM0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QEyodSSXpiFwxTss4bYtelmKfUBGZPhVh6u0ejx8XW0=;
 b=BYr4W9SOkdZLJOe6C6L7XrFjVundReppxeEl1LVLX5Xo5ApNptCP60AYfRY9FGPufa4Ew1i/MAbU+RmMPVk4CmlORdQmP/BIuRWV0KmfVbQQRzcCJjxPZ07taRy5aZUj/GkegdeTaXtm/Lup6llxm3FiWAvnSGEmNakvJTx0Ul2ZJiIJOp7Clr34k2EFluT6YEYa3A7Ko4gnELaP8PA3iBjkOU8dYQbolDV78ljxIloxNHREaUYCvjVoZO/eXZKhAGBT9IXk1/XtgsBviTYoaS7aXOaOcQA63jLaliWAGBgU1WIU4LIkd09Qi891chN+7dFYC/GopO0LGienMY16dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QEyodSSXpiFwxTss4bYtelmKfUBGZPhVh6u0ejx8XW0=;
 b=HlfexXBhxwk/CoLi3Kl0/i+0H+BJKXsDQpCwKy6R+w+7bd2uO75hM4H+tyKz1zasIVvTmqHnke92H3D1HK1p6RU7NTbMSMb69XqfKLASd7L1motY5erHeBEaKFCwmXMENcBYvBdkGSuc93KIT36wefUpDeK6j5HGT0UWuFrOeLg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VE1PR04MB6623.eurprd04.prod.outlook.com (2603:10a6:803:125::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Wed, 17 Nov
 2021 09:38:30 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 09:38:30 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 14/21] ASoC: SOF: mediatek: Add mt8195 hardware support
Date: Wed, 17 Nov 2021 11:37:27 +0200
Message-Id: <20211117093734.17407-15-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
References: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
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
 Transport; Wed, 17 Nov 2021 09:38:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d97023a-4f48-48f0-2bfe-08d9a9ae036a
X-MS-TrafficTypeDiagnostic: VE1PR04MB6623:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB6623F35B723CD14435F0AAF4B89A9@VE1PR04MB6623.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /jaD6MCZq64S1zY/rrBOXM4wJUjorQXmqmyEsGUB26DvCeb/6+tJFNb0q1eA7aP8A0WF+i7ahM1kmcBN6kErXjMozjwF3IGpkxJbo6CCr60iqSCW7S4/Y4MqS0WKTwtlVZ5ks8GbWT1TZEqT31Rf+KxZoH9H/Fqx00VtkqpTjsTeH23p8CVEg6vljEef9ZgmEyyVDGBoqaj52zyTGXgmVs0RXqizfOBBVuWwdqf0j8ANcawskob8N1SvVNBHUUjrIYckOW8R+344XslUbCz11OVFvcttOTqEEn+b/MUzkwZRk5YbIr4kGXW0w6omcevfZhmnMZfUCtRuc9ZZHK9vQF3FZ9iKf+VUFXe8Jg8Or2U6fuHYtCrTkazx0VIk3bOxI1OgngiHWMKe6Oc7vMDbyThLLkM3xybANhX2l2/mHR7xn5slBFQKwlcEeruseoc4kizOBKFOF6pqzp9SCFnqOtwcoeQK2RWW9/ev5q4YQ5vwxOIESesqu0OSUWLpdfTqY1oT5Rjl9PhhhiaQ7Fqn3dLXlZqmkUDLSYyg1618lh47w2kbQeWvhmSMsQ1COdwbXiNhmoFSs4bq4uusG+PRUB9T5oKYiD5/OFu1YoB1Re4Zg3yz5oUcF9NEOMG1ZAGCOGKdLH1kxmApP06jCsTVuA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(30864003)(1076003)(52116002)(6506007)(5660300002)(54906003)(8676002)(508600001)(186003)(86362001)(2616005)(6512007)(7416002)(83380400001)(66574015)(44832011)(66556008)(66476007)(4326008)(66946007)(316002)(38100700002)(6486002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z05XTkNIallBZkh4UlNQTThGeVhoTG9aR0JyZ2M1NEV4dzZ1MDFVWFdWTWxm?=
 =?utf-8?B?SlljV2JUVFVFK0hqcG9ISnN2MXV6RzNXSVM3M05QY1Y5L1FPWWNNbjFoeXZp?=
 =?utf-8?B?Ym1DeU94ekZTN1NGQlhwUk14amhnMTRHdkJLV3Z1VnVsWnhLL1BPT25yay8y?=
 =?utf-8?B?WmxUSmg0NVVhYXFxejlLVTUzVmVyQmtLSFB2WjgwQStLWlhsZzR2ZDZlUXIr?=
 =?utf-8?B?cm9WRjVOTFg1QXR6ZVRLNXVFVHh4VjdYUUU2VC9Ld1JUYkthSlo5V2czOXlQ?=
 =?utf-8?B?eHZQYVduZWpyd0llOEZsWTcxOC9GcVkzL25VRjJmTnNpQ0RwYVR3bjhsK3Zl?=
 =?utf-8?B?UFAvSmFVcCtkOUphdW1Ta0taTm9uelhUOVV5RWgvbHJucDltNFNwUW0vbzI2?=
 =?utf-8?B?aktxc0c2cmQyNWp3NDU2Q1prMmM0eVpnaFpKTzdJbGVzd01nMm1oUVM4Qkhq?=
 =?utf-8?B?T1VHY1BFMjNHSm9lWWpRYm5pZGY4MUFWdE9HdjFDbVhtUG5NZmMvbDlVTzF1?=
 =?utf-8?B?cFR4ZTVHSWZxaUpHeWJaTUl4ZUN5dzY5M29NOXpkRmZ4RDVncXpTVU9rK2tD?=
 =?utf-8?B?TDZMSUdiKzdjdk01KzZPUkxZNGg4dC81UTF6NGRQZUR6R1hWc1ZTcnpBMUFF?=
 =?utf-8?B?bnVIZkh6YnZ6NzVrR0xpOU8xVFdVRE92NXhheVo2SFU4MjU3VmdWbFhGbzVO?=
 =?utf-8?B?eklqdzgzVjJnM0tuSTJ0RlBPUEFRdEErbXdId0FLa2xQTmxMNk9VYS82Y2w0?=
 =?utf-8?B?cE80U3IzWk1KTEdPc01lb08ydThjS0hLNitSekRXOWNHK2sycHN6Tkp4c0Js?=
 =?utf-8?B?bDVrcVRhSWJxSTdEYnY5NFkyWFBEbEs1STNCQnd1ZDA1NDBPb0o1Y1o5WHBG?=
 =?utf-8?B?dmRQb25pRUhTK2E1aFF5c3l6U0dBZUdDSVhRT2dxWXc1Rko3bUhSeHNoWklo?=
 =?utf-8?B?TDRwMkFJZjNyRTNnaS9naE9QcnNTSlZyR2YxLytTejRNbWdsUUpPczVudlZ1?=
 =?utf-8?B?aXJSbm5jTExzNVBRQ0tiMXlCdlhOUkFQdURBRGNhQUdiL3VaU0xCUldxby9m?=
 =?utf-8?B?ZE9PZ1V6RlhPc0thclRuaGdvMlJkN09jcENkNk8wZnpPek11Yjd6Tmt2WmVh?=
 =?utf-8?B?NFo0WjFoMGpvQXZzUjNjMWlxa2UvSURZYWJhb3VhZWxnMENBTmlEWWtyU0pV?=
 =?utf-8?B?ejBvTi9hanlYYWZQcVNKMWVBUDRzOHJXYTdGbmZ0S2FVYlpjZlpuR0V4WXZt?=
 =?utf-8?B?MTdiRG5LMWIrTXM2WnhQL0RwTHBtcjNQSmFHNktVVm9rYllJNHVodzc5bjJq?=
 =?utf-8?B?SHRIc1ZpUXdPKzZQSlVtWm1XYlNjR0dCaHZyeEdnWHBIRGgrZHJIUHZieWdt?=
 =?utf-8?B?Q2ZYL1NGYlRGb3V6UmtPOW9WRTBQRm1ZM0lXaGZ1bVZwUENMb29QeUhBQUp5?=
 =?utf-8?B?cGg4WWdVd0NMaHFqdzdOK1podzhhOEhkRmk1aW9LclhVMUM3V21MaXhmakM3?=
 =?utf-8?B?bnYzNFNCT2NyMjdLMzIrRmRWczJzcFliRmxSSmk4aVhCVUNUdGNGYTFiakpQ?=
 =?utf-8?B?TmlsQU5PL0ZNVHdDV2RJclAvM0pQc2VNeUpZVytlcjBDdzRmVkxINkxxNGVr?=
 =?utf-8?B?d2Fkc0FKOUJ6Rk0rbndsK0tOaXJ3eUUwcFRMUVoyanNnejl4NFBzYm5pN214?=
 =?utf-8?B?VmlHcmk0NEtWSFF3QXp5akptc0JlZnJvTTRiL1hRVTdBb3R1cys5RUNlWDd3?=
 =?utf-8?B?cFk4OWQ3UFEyWDFFMkxFbE41QzVhYWFNQ3N3VUtxYStIcnlLaFl2WGdHWjUx?=
 =?utf-8?B?ME1WVGdVaHN2cTl2R1A4R3c0MGpTcHM4eHY0aG5iSS9mZlArWWUxY29kTXpH?=
 =?utf-8?B?TFRsbVJrLzZDdEs1SnVoR3kzQTJqc1J3aWdFUEVsR1k1dldOOWlHUE95d3VG?=
 =?utf-8?B?YjF6ZzVqanVmR3kvajdqaU5TajdWeTdsM0NWVGpLdnBzTFpFTlZKd3p3dXlh?=
 =?utf-8?B?SW84VTROVUNsOHFiSmVjQlFxNW9xcjUvL08xcHg0UUNqaEE5aEl1OWhEa201?=
 =?utf-8?B?ZFZ0N3liYi9uSktZL2F6RTU0eG5mbUd1bWN4OThFZjVXUGhoWnFjd2s5Q2Yr?=
 =?utf-8?B?NTRacW1xVElJbjJjeVZTeFFKTEpXU1d1Y2tzeWlXWTNKZ3hvOUpwUHFDR044?=
 =?utf-8?B?VGxYUkQ1M3J4Mm1EMU1wZHFSdDhZOTdiWDVVaFF3Wkw0MTBUeDNkcE42Tzhl?=
 =?utf-8?B?VE5xajE2ODhMWlczVGtEdlY3MngybzhoaFVqbVR4VFFlNFlCVFJJdHA1QU13?=
 =?utf-8?Q?ZmpEkZmUOAGvg67BIe?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d97023a-4f48-48f0-2bfe-08d9a9ae036a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 09:38:30.0206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ouTQJjAzfcJJP+sqVo7M320ymGEmYfLGirW31RV+tUS0KqBDAERgpVG1zXXNIVaN4Mz1+P1n0iXEHAMg6EWJzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6623
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 daniel.baluta@gmail.com, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 AjitKumar.Pandey@amd.com, linux-kernel@vger.kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 Julian.Schroeder@amd.com, linux-mediatek@lists.infradead.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Balakishore.pati@amd.com, yc.hung@mediatek.com,
 vishnuvardhanrao.ravulapati@amd.com, vsreddy@amd.com, daniel.baluta@nxp.com
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

From: YC Hung <yc.hung@mediatek.com>

This patch initialize to support SOF on Mediatek mt8195 platform.
MT8195 has four Cortex A78 cores paired with four Cortex A55 cores.
It also has Cadence HiFi-4 DSP single core. There are shared DRAM and
mailbox interrupt between AP and DSP to use for IPC communication.

Signed-off-by: YC Hung <yc.hung@mediatek.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/Kconfig                  |   1 +
 sound/soc/sof/Makefile                 |   1 +
 sound/soc/sof/mediatek/Kconfig         |  33 +++
 sound/soc/sof/mediatek/Makefile        |   2 +
 sound/soc/sof/mediatek/adsp_helper.h   |  49 ++++
 sound/soc/sof/mediatek/mediatek-ops.h  |   8 +
 sound/soc/sof/mediatek/mt8195/Makefile |   3 +
 sound/soc/sof/mediatek/mt8195/mt8195.c | 334 +++++++++++++++++++++++++
 sound/soc/sof/mediatek/mt8195/mt8195.h | 155 ++++++++++++
 9 files changed, 586 insertions(+)
 create mode 100644 sound/soc/sof/mediatek/Kconfig
 create mode 100644 sound/soc/sof/mediatek/Makefile
 create mode 100644 sound/soc/sof/mediatek/adsp_helper.h
 create mode 100644 sound/soc/sof/mediatek/mediatek-ops.h
 create mode 100644 sound/soc/sof/mediatek/mt8195/Makefile
 create mode 100644 sound/soc/sof/mediatek/mt8195/mt8195.c
 create mode 100644 sound/soc/sof/mediatek/mt8195/mt8195.h

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index 68571bf2585e..41f97c6cb4c1 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -226,6 +226,7 @@ config SND_SOC_SOF_PROBE_WORK_QUEUE
 source "sound/soc/sof/amd/Kconfig"
 source "sound/soc/sof/imx/Kconfig"
 source "sound/soc/sof/intel/Kconfig"
+source "sound/soc/sof/mediatek/Kconfig"
 source "sound/soc/sof/xtensa/Kconfig"
 
 endif
diff --git a/sound/soc/sof/Makefile b/sound/soc/sof/Makefile
index 011abfa0fd82..43a983376976 100644
--- a/sound/soc/sof/Makefile
+++ b/sound/soc/sof/Makefile
@@ -24,3 +24,4 @@ obj-$(CONFIG_SND_SOC_SOF_INTEL_TOPLEVEL) += intel/
 obj-$(CONFIG_SND_SOC_SOF_IMX_TOPLEVEL) += imx/
 obj-$(CONFIG_SND_SOC_SOF_AMD_TOPLEVEL) += amd/
 obj-$(CONFIG_SND_SOC_SOF_XTENSA) += xtensa/
+obj-$(CONFIG_SND_SOC_SOF_MTK_TOPLEVEL) += mediatek/
diff --git a/sound/soc/sof/mediatek/Kconfig b/sound/soc/sof/mediatek/Kconfig
new file mode 100644
index 000000000000..aeacf0e5bfbb
--- /dev/null
+++ b/sound/soc/sof/mediatek/Kconfig
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+
+config SND_SOC_SOF_MTK_TOPLEVEL
+	bool "SOF support for MTK audio DSPs"
+	depends on ARM64 || COMPILE_TEST
+	depends on SND_SOC_SOF_OF
+	help
+	  This adds support for Sound Open Firmware for Mediatek platforms.
+	  It is top level for all mediatek platforms.
+	  Say Y if you have such a device.
+	  If unsure select "N".
+
+if SND_SOC_SOF_MTK_TOPLEVEL
+config SND_SOC_SOF_MTK_COMMON
+	tristate
+	select SND_SOC_SOF_OF_DEV
+	select SND_SOC_SOF
+	select SND_SOC_SOF_XTENSA
+	select SND_SOC_SOF_COMPRESS
+	help
+	  This option is not user-selectable but automagically handled by
+	  'select' statements at a higher level
+
+config SND_SOC_SOF_MT8195
+	tristate "SOF support for MT8195 audio DSP"
+	select SND_SOC_SOF_MTK_COMMON
+	help
+	  This adds support for Sound Open Firmware for Mediatek platforms
+	  using the mt8195 processors.
+	  Say Y if you have such a device.
+	  If unsure select "N".
+
+endif ## SND_SOC_SOF_MTK_TOPLEVEL
diff --git a/sound/soc/sof/mediatek/Makefile b/sound/soc/sof/mediatek/Makefile
new file mode 100644
index 000000000000..e8ec6da981de
--- /dev/null
+++ b/sound/soc/sof/mediatek/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+obj-$(CONFIG_SND_SOC_SOF_MT8195) += mt8195/
diff --git a/sound/soc/sof/mediatek/adsp_helper.h b/sound/soc/sof/mediatek/adsp_helper.h
new file mode 100644
index 000000000000..346953dd22db
--- /dev/null
+++ b/sound/soc/sof/mediatek/adsp_helper.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/*
+ * Copyright (c) 2021 MediaTek Corporation. All rights reserved.
+ */
+
+#ifndef __MTK_ADSP_HELPER_H__
+#define __MTK_ADSP_HELPER_H__
+
+/*
+ * Global important adsp data structure.
+ */
+#define DSP_MBOX_NUM	3
+
+struct mtk_adsp_chip_info {
+	phys_addr_t pa_sram;
+	phys_addr_t pa_dram; /* adsp dram physical base */
+	phys_addr_t pa_shared_dram; /* adsp dram physical base */
+	phys_addr_t pa_cfgreg;
+	phys_addr_t pa_mboxreg[DSP_MBOX_NUM];
+	u32 sramsize;
+	u32 dramsize;
+	u32 cfgregsize;
+	void __iomem *va_sram; /* corresponding to pa_sram */
+	void __iomem *va_dram; /* corresponding to pa_dram */
+	void __iomem *va_cfgreg;
+	void __iomem *va_mboxreg[DSP_MBOX_NUM];
+	void __iomem *shared_sram; /* part of  va_sram */
+	void __iomem *shared_dram; /* part of  va_dram */
+	phys_addr_t adsp_bootup_addr;
+	int dram_offset; /*dram offset between system and dsp view*/
+};
+
+struct adsp_priv {
+	struct device *dev;
+	struct snd_sof_dev *sdev;
+
+	/* DSP IPC handler */
+	struct mbox_controller *adsp_mbox;
+
+	struct mtk_adsp_chip_info *adsp;
+
+	u32 (*ap2adsp_addr)(u32 addr, void *data);
+	u32 (*adsp2ap_addr)(u32 addr, void *data);
+
+	void *private_data;
+};
+
+#endif
diff --git a/sound/soc/sof/mediatek/mediatek-ops.h b/sound/soc/sof/mediatek/mediatek-ops.h
new file mode 100644
index 000000000000..e0ffa69ecb0c
--- /dev/null
+++ b/sound/soc/sof/mediatek/mediatek-ops.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+
+#ifndef __MEDIATEK_OPS_H__
+#define __MEDIATEK_OPS_H__
+
+extern const struct snd_sof_dsp_ops sof_mt8195_ops;
+
+#endif
diff --git a/sound/soc/sof/mediatek/mt8195/Makefile b/sound/soc/sof/mediatek/mt8195/Makefile
new file mode 100644
index 000000000000..dd2b6e4affc9
--- /dev/null
+++ b/sound/soc/sof/mediatek/mt8195/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+snd-sof-mt8195-objs := mt8195.o
+obj-$(CONFIG_SND_SOC_SOF_MT8195) += snd-sof-mt8195.o
diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
new file mode 100644
index 000000000000..945601a0dc37
--- /dev/null
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -0,0 +1,334 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// Copyright(c) 2021 Mediatek Inc. All rights reserved.
+//
+// Author: YC Hung <yc.hung@mediatek.com>
+//
+
+/*
+ * Hardware interface for audio DSP on mt8195
+ */
+
+#include <linux/delay.h>
+#include <linux/firmware.h>
+#include <linux/io.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/of_platform.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/module.h>
+
+#include <sound/sof.h>
+#include <sound/sof/xtensa.h>
+#include "../../ops.h"
+#include "../../sof-audio.h"
+#include "../adsp_helper.h"
+#include "../mediatek-ops.h"
+#include "mt8195.h"
+
+static int platform_parse_resource(struct platform_device *pdev, void *data)
+{
+	struct resource *mmio;
+	struct resource res;
+	struct device_node *mem_region;
+	struct device *dev = &pdev->dev;
+	struct mtk_adsp_chip_info *adsp = data;
+	int ret;
+
+	mem_region = of_parse_phandle(dev->of_node, "memory-region", 0);
+	if (!mem_region) {
+		dev_err(dev, "no dma memory-region phandle\n");
+		return -ENODEV;
+	}
+
+	ret = of_address_to_resource(mem_region, 0, &res);
+	if (ret) {
+		dev_err(dev, "of_address_to_resource dma failed\n");
+		return ret;
+	}
+
+	dev_dbg(dev, "DMA pbase=0x%llx, size=0x%llx\n",
+		(phys_addr_t)res.start, resource_size(&res));
+
+	ret = of_reserved_mem_device_init(dev);
+	if (ret) {
+		dev_err(dev, "of_reserved_mem_device_init failed\n");
+		return ret;
+	}
+
+	mem_region = of_parse_phandle(dev->of_node, "memory-region", 1);
+	if (!mem_region) {
+		dev_err(dev, "no memory-region sysmem phandle\n");
+		return -ENODEV;
+	}
+
+	ret = of_address_to_resource(mem_region, 0, &res);
+	if (ret) {
+		dev_err(dev, "of_address_to_resource sysmem failed\n");
+		return ret;
+	}
+
+	adsp->pa_dram = (phys_addr_t)res.start;
+	adsp->dramsize = resource_size(&res);
+	if (adsp->pa_dram & DRAM_REMAP_MASK) {
+		dev_err(dev, "adsp memory(%#x) is not 4K-aligned\n",
+			(u32)adsp->pa_dram);
+		return -EINVAL;
+	}
+
+	if (adsp->dramsize < TOTAL_SIZE_SHARED_DRAM_FROM_TAIL) {
+		dev_err(dev, "adsp memory(%#x) is not enough for share\n",
+			adsp->dramsize);
+		return -EINVAL;
+	}
+
+	dev_dbg(dev, "dram pbase=%pa, dramsize=%#x\n",
+		&adsp->pa_dram, adsp->dramsize);
+
+	/* Parse CFG base */
+	mmio = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cfg");
+	if (!mmio) {
+		dev_err(dev, "no ADSP-CFG register resource\n");
+		return -ENXIO;
+	}
+	/* remap for DSP register accessing */
+	adsp->va_cfgreg = devm_ioremap_resource(dev, mmio);
+	if (IS_ERR(adsp->va_cfgreg))
+		return PTR_ERR(adsp->va_cfgreg);
+
+	adsp->pa_cfgreg = (phys_addr_t)mmio->start;
+	adsp->cfgregsize = resource_size(mmio);
+
+	dev_dbg(dev, "cfgreg-vbase=%p, cfgregsize=%#x\n",
+		adsp->va_cfgreg, adsp->cfgregsize);
+
+	/* Parse SRAM */
+	mmio = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sram");
+	if (!mmio) {
+		dev_err(dev, "no SRAM resource\n");
+		return -ENXIO;
+	}
+
+	adsp->pa_sram = (phys_addr_t)mmio->start;
+	adsp->sramsize = resource_size(mmio);
+	if (adsp->sramsize < TOTAL_SIZE_SHARED_SRAM_FROM_TAIL) {
+		dev_err(dev, "adsp SRAM(%#x) is not enough for share\n",
+			adsp->sramsize);
+		return -EINVAL;
+	}
+
+	dev_dbg(dev, "sram pbase=%pa,%#x\n", &adsp->pa_sram, adsp->sramsize);
+
+	return ret;
+}
+
+static int adsp_sram_power_on(struct device *dev, bool on)
+{
+	void __iomem *va_dspsysreg;
+	u32 srampool_con;
+
+	va_dspsysreg = ioremap(ADSP_SRAM_POOL_CON, 0x4);
+	if (!va_dspsysreg) {
+		dev_err(dev, "failed to ioremap sram pool base %#x\n",
+			ADSP_SRAM_POOL_CON);
+		return -ENOMEM;
+	}
+
+	srampool_con = readl(va_dspsysreg);
+	if (on)
+		writel(srampool_con & ~DSP_SRAM_POOL_PD_MASK, va_dspsysreg);
+	else
+		writel(srampool_con | DSP_SRAM_POOL_PD_MASK, va_dspsysreg);
+
+	iounmap(va_dspsysreg);
+	return 0;
+}
+
+/*  Init the basic DSP DRAM address */
+static int adsp_memory_remap_init(struct device *dev, struct mtk_adsp_chip_info *adsp)
+{
+	void __iomem *vaddr_emi_map;
+	int offset;
+
+	if (!adsp)
+		return -ENXIO;
+
+	vaddr_emi_map = devm_ioremap(dev, DSP_EMI_MAP_ADDR, 0x4);
+	if (!vaddr_emi_map) {
+		dev_err(dev, "failed to ioremap emi map base %#x\n",
+			DSP_EMI_MAP_ADDR);
+		return -ENOMEM;
+	}
+
+	offset = adsp->pa_dram - DRAM_PHYS_BASE_FROM_DSP_VIEW;
+	adsp->dram_offset = offset;
+	offset >>= DRAM_REMAP_SHIFT;
+	dev_dbg(dev, "adsp->pa_dram %llx, offset %#x\n", adsp->pa_dram, offset);
+	writel(offset, vaddr_emi_map);
+	if (offset != readl(vaddr_emi_map)) {
+		dev_err(dev, "write emi map fail : %#x\n", readl(vaddr_emi_map));
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int adsp_shared_base_ioremap(struct platform_device *pdev, void *data)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_adsp_chip_info *adsp = data;
+	u32 shared_size;
+
+	/* remap shared-dram base to be non-cachable */
+	shared_size = TOTAL_SIZE_SHARED_DRAM_FROM_TAIL;
+	adsp->pa_shared_dram = adsp->pa_dram + adsp->dramsize - shared_size;
+	if (adsp->va_dram) {
+		adsp->shared_dram = adsp->va_dram + DSP_DRAM_SIZE - shared_size;
+	} else {
+		adsp->shared_dram = devm_ioremap(dev, adsp->pa_shared_dram,
+						 shared_size);
+		if (!adsp->shared_dram) {
+			dev_err(dev, "ioremap failed for shared DRAM\n");
+			return -ENOMEM;
+		}
+	}
+	dev_dbg(dev, "shared-dram vbase=%p, phy addr :%llx,  size=%#x\n",
+		adsp->shared_dram, adsp->pa_shared_dram, shared_size);
+
+	return 0;
+}
+
+static int mt8195_run(struct snd_sof_dev *sdev)
+{
+	u32 adsp_bootup_addr;
+
+	adsp_bootup_addr = SRAM_PHYS_BASE_FROM_DSP_VIEW;
+	dev_dbg(sdev->dev, "HIFIxDSP boot from base : 0x%08X\n", adsp_bootup_addr);
+	sof_hifixdsp_boot_sequence(sdev, adsp_bootup_addr);
+
+	return 0;
+}
+
+static int mt8195_dsp_probe(struct snd_sof_dev *sdev)
+{
+	struct platform_device *pdev = container_of(sdev->dev, struct platform_device, dev);
+	struct adsp_priv *priv;
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	sdev->pdata->hw_pdata = priv;
+	priv->dev = sdev->dev;
+	priv->sdev = sdev;
+
+	priv->adsp = devm_kzalloc(&pdev->dev, sizeof(struct mtk_adsp_chip_info), GFP_KERNEL);
+	if (!priv->adsp)
+		return -ENOMEM;
+
+	ret = platform_parse_resource(pdev, priv->adsp);
+	if (ret)
+		return ret;
+
+	ret = adsp_sram_power_on(sdev->dev, true);
+	if (ret) {
+		dev_err(sdev->dev, "adsp_sram_power_on fail!\n");
+		return ret;
+	}
+
+	ret = adsp_memory_remap_init(&pdev->dev, priv->adsp);
+	if (ret) {
+		dev_err(sdev->dev, "adsp_memory_remap_init fail!\n");
+		goto err_adsp_sram_power_off;
+	}
+
+	sdev->bar[SOF_FW_BLK_TYPE_IRAM] = devm_ioremap(sdev->dev,
+						       priv->adsp->pa_sram,
+						       priv->adsp->sramsize);
+	if (!sdev->bar[SOF_FW_BLK_TYPE_IRAM]) {
+		dev_err(sdev->dev, "failed to ioremap base %pa size %#x\n",
+			&priv->adsp->pa_sram, priv->adsp->sramsize);
+		ret = -EINVAL;
+		goto err_adsp_sram_power_off;
+	}
+
+	sdev->bar[SOF_FW_BLK_TYPE_SRAM] = devm_ioremap_wc(sdev->dev,
+							  priv->adsp->pa_dram,
+							  priv->adsp->dramsize);
+	if (!sdev->bar[SOF_FW_BLK_TYPE_SRAM]) {
+		dev_err(sdev->dev, "failed to ioremap base %pa size %#x\n",
+			&priv->adsp->pa_dram, priv->adsp->dramsize);
+		ret = -EINVAL;
+		goto err_adsp_sram_power_off;
+	}
+	priv->adsp->va_dram = sdev->bar[SOF_FW_BLK_TYPE_SRAM];
+
+	ret = adsp_shared_base_ioremap(pdev, priv->adsp);
+	if (ret) {
+		dev_err(sdev->dev, "adsp_shared_base_ioremap fail!\n");
+		goto err_adsp_sram_power_off;
+	}
+
+	sdev->bar[DSP_REG_BAR] = priv->adsp->va_cfgreg;
+	sdev->bar[DSP_MBOX0_BAR] =  priv->adsp->va_mboxreg[0];
+	sdev->bar[DSP_MBOX1_BAR] =  priv->adsp->va_mboxreg[1];
+	sdev->bar[DSP_MBOX2_BAR] =  priv->adsp->va_mboxreg[2];
+
+	sdev->mmio_bar = SOF_FW_BLK_TYPE_SRAM;
+	sdev->mailbox_bar = SOF_FW_BLK_TYPE_SRAM;
+
+	return 0;
+
+err_adsp_sram_power_off:
+	adsp_sram_power_on(&pdev->dev, false);
+
+	return ret;
+}
+
+static int mt8195_dsp_remove(struct snd_sof_dev *sdev)
+{
+	struct platform_device *pdev = container_of(sdev->dev, struct platform_device, dev);
+
+	return adsp_sram_power_on(&pdev->dev, false);
+}
+
+/* on mt8195 there is 1 to 1 match between type and BAR idx */
+static int mt8195_get_bar_index(struct snd_sof_dev *sdev, u32 type)
+{
+	return type;
+}
+
+/* mt8195 ops */
+const struct snd_sof_dsp_ops sof_mt8195_ops = {
+	/* probe and remove */
+	.probe		= mt8195_dsp_probe,
+	.remove		= mt8195_dsp_remove,
+
+	/* Block IO */
+	.block_read	= sof_block_read,
+	.block_write	= sof_block_write,
+
+	/* Register IO */
+	.write		= sof_io_write,
+	.read		= sof_io_read,
+	.write64	= sof_io_write64,
+	.read64		= sof_io_read64,
+
+	/* misc */
+	.get_bar_index	= mt8195_get_bar_index,
+
+	/* Firmware ops */
+	.dsp_arch_ops = &sof_xtensa_arch_ops,
+
+	/* ALSA HW info flags */
+	.hw_info =	SNDRV_PCM_INFO_MMAP |
+			SNDRV_PCM_INFO_MMAP_VALID |
+			SNDRV_PCM_INFO_INTERLEAVED |
+			SNDRV_PCM_INFO_PAUSE |
+			SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
+};
+EXPORT_SYMBOL(sof_mt8195_ops);
+
+MODULE_IMPORT_NS(SND_SOC_SOF_XTENSA);
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.h b/sound/soc/sof/mediatek/mt8195/mt8195.h
new file mode 100644
index 000000000000..48cbbb5aacb5
--- /dev/null
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.h
@@ -0,0 +1,155 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/*
+ * Copyright (c) 2021 MediaTek Corporation. All rights reserved.
+ *
+ *  Header file for the mt8195 DSP register definition
+ */
+
+#ifndef __MT8195_H
+#define __MT8195_H
+
+struct mtk_adsp_chip_info;
+
+#define DSP_REG_BASE			0x10803000
+#define SCP_CFGREG_BASE			0x10724000
+#define DSP_SYSAO_BASE			0x1080C000
+
+/*****************************************************************************
+ *                  R E G I S T E R       TABLE
+ *****************************************************************************/
+#define DSP_JTAGMUX			0x0000
+#define DSP_ALTRESETVEC			0x0004
+#define DSP_PDEBUGDATA			0x0008
+#define DSP_PDEBUGBUS0			0x000c
+#define PDEBUG_ENABLE			BIT(0)
+#define DSP_PDEBUGBUS1			0x0010
+#define DSP_PDEBUGINST			0x0014
+#define DSP_PDEBUGLS0STAT		0x0018
+#define DSP_PDEBUGLS1STAT		0x001c
+#define DSP_PDEBUGPC			0x0020
+#define DSP_RESET_SW			0x0024 /*reset sw*/
+#define ADSP_BRESET_SW			BIT(0)
+#define ADSP_DRESET_SW			BIT(1)
+#define ADSP_RUNSTALL			BIT(3)
+#define STATVECTOR_SEL			BIT(4)
+#define DSP_PFAULTBUS			0x0028
+#define DSP_PFAULTINFO			0x002c
+#define DSP_GPR00			0x0030
+#define DSP_GPR01			0x0034
+#define DSP_GPR02			0x0038
+#define DSP_GPR03			0x003c
+#define DSP_GPR04			0x0040
+#define DSP_GPR05			0x0044
+#define DSP_GPR06			0x0048
+#define DSP_GPR07			0x004c
+#define DSP_GPR08			0x0050
+#define DSP_GPR09			0x0054
+#define DSP_GPR0A			0x0058
+#define DSP_GPR0B			0x005c
+#define DSP_GPR0C			0x0060
+#define DSP_GPR0D			0x0064
+#define DSP_GPR0E			0x0068
+#define DSP_GPR0F			0x006c
+#define DSP_GPR10			0x0070
+#define DSP_GPR11			0x0074
+#define DSP_GPR12			0x0078
+#define DSP_GPR13			0x007c
+#define DSP_GPR14			0x0080
+#define DSP_GPR15			0x0084
+#define DSP_GPR16			0x0088
+#define DSP_GPR17			0x008c
+#define DSP_GPR18			0x0090
+#define DSP_GPR19			0x0094
+#define DSP_GPR1A			0x0098
+#define DSP_GPR1B			0x009c
+#define DSP_GPR1C			0x00a0
+#define DSP_GPR1D			0x00a4
+#define DSP_GPR1E			0x00a8
+#define DSP_GPR1F			0x00ac
+#define DSP_TCM_OFFSET			0x00b0    /* not used */
+#define DSP_DDR_OFFSET			0x00b4    /* not used */
+#define DSP_INTFDSP			0x00d0
+#define DSP_INTFDSP_CLR			0x00d4
+#define DSP_SRAM_PD_SW1			0x00d8
+#define DSP_SRAM_PD_SW2			0x00dc
+#define DSP_OCD				0x00e0
+#define DSP_RG_DSP_IRQ_POL		0x00f0    /* not used */
+#define DSP_DSP_IRQ_EN			0x00f4    /* not used */
+#define DSP_DSP_IRQ_LEVEL		0x00f8    /* not used */
+#define DSP_DSP_IRQ_STATUS		0x00fc    /* not used */
+#define DSP_RG_INT2CIRQ			0x0114
+#define DSP_RG_INT_POL_CTL0		0x0120
+#define DSP_RG_INT_EN_CTL0		0x0130
+#define DSP_RG_INT_LV_CTL0		0x0140
+#define DSP_RG_INT_STATUS0		0x0150
+#define DSP_PDEBUGSTATUS0		0x0200
+#define DSP_PDEBUGSTATUS1		0x0204
+#define DSP_PDEBUGSTATUS2		0x0208
+#define DSP_PDEBUGSTATUS3		0x020c
+#define DSP_PDEBUGSTATUS4		0x0210
+#define DSP_PDEBUGSTATUS5		0x0214
+#define DSP_PDEBUGSTATUS6		0x0218
+#define DSP_PDEBUGSTATUS7		0x021c
+#define DSP_DSP2PSRAM_PRIORITY		0x0220  /* not used */
+#define DSP_AUDIO_DSP2SPM_INT		0x0224
+#define DSP_AUDIO_DSP2SPM_INT_ACK	0x0228
+#define DSP_AUDIO_DSP_DEBUG_SEL		0x022C
+#define DSP_AUDIO_DSP_EMI_BASE_ADDR	0x02E0  /* not used */
+#define DSP_AUDIO_DSP_SHARED_IRAM	0x02E4
+#define DSP_AUDIO_DSP_CKCTRL_P2P_CK_CON	0x02F0
+#define DSP_RG_SEMAPHORE00		0x0300
+#define DSP_RG_SEMAPHORE01		0x0304
+#define DSP_RG_SEMAPHORE02		0x0308
+#define DSP_RG_SEMAPHORE03		0x030C
+#define DSP_RG_SEMAPHORE04		0x0310
+#define DSP_RG_SEMAPHORE05		0x0314
+#define DSP_RG_SEMAPHORE06		0x0318
+#define DSP_RG_SEMAPHORE07		0x031C
+#define DSP_RESERVED_0			0x03F0
+#define DSP_RESERVED_1			0x03F4
+
+/* dsp wdt */
+#define DSP_WDT_MODE			0x0400
+
+/* dsp mbox */
+#define DSP_MBOX_IN_CMD			0x00
+#define DSP_MBOX_IN_CMD_CLR		0x04
+#define DSP_MBOX_OUT_CMD		0x1c
+#define DSP_MBOX_OUT_CMD_CLR		0x20
+#define DSP_MBOX_IN_MSG0		0x08
+#define DSP_MBOX_IN_MSG1		0x0C
+#define DSP_MBOX_OUT_MSG0		0x24
+#define DSP_MBOX_OUT_MSG1		0x28
+
+/*dsp sys ao*/
+#define ADSP_SRAM_POOL_CON		(DSP_SYSAO_BASE + 0x30)
+#define DSP_SRAM_POOL_PD_MASK		0xf
+#define DSP_EMI_MAP_ADDR		(DSP_SYSAO_BASE + 0x81c)
+
+/* DSP memories */
+#define MBOX_OFFSET	0x800000 /* DRAM */
+#define MBOX_SIZE	0x1000 /* consistent with which in memory.h of sof fw */
+#define DSP_DRAM_SIZE	0x1000000 /* 16M */
+
+#define DSP_REG_BAR	4
+#define DSP_MBOX0_BAR	5
+#define DSP_MBOX1_BAR	6
+#define DSP_MBOX2_BAR	7
+
+#define TOTAL_SIZE_SHARED_SRAM_FROM_TAIL  0x0
+
+#define SIZE_SHARED_DRAM_DL 0x40000 /*Shared buffer for Downlink*/
+#define SIZE_SHARED_DRAM_UL 0x40000 /*Shared buffer for Uplink*/
+
+#define TOTAL_SIZE_SHARED_DRAM_FROM_TAIL  \
+	(SIZE_SHARED_DRAM_DL + SIZE_SHARED_DRAM_UL)
+
+#define SRAM_PHYS_BASE_FROM_DSP_VIEW	0x40000000 /* MT8195 DSP view */
+#define DRAM_PHYS_BASE_FROM_DSP_VIEW	0x60000000 /* MT8195 DSP view */
+
+/*remap dram between AP and DSP view, 4KB aligned*/
+#define DRAM_REMAP_SHIFT	12
+#define DRAM_REMAP_MASK		(BIT(DRAM_REMAP_SHIFT) - 1)
+
+#endif
-- 
2.27.0

