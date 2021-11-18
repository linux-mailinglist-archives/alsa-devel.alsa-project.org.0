Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9244558AA
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 11:10:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 504B418A2;
	Thu, 18 Nov 2021 11:09:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 504B418A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637230207;
	bh=R7QdvbemoHPxTVC3BAHaYtpmhOHWcWxkzyxaNftctrE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QsP7xlc2hXDBHYjOUyest8r4/hfoPcWdqoYXtWatGJC4QMPCdNkEG4hbw8A7VuM5B
	 iKXc6mDF8lb+CDNJB56nkdMNDI2xTi+1KNK3qr1LKPhaw1aiNEFbu05t37IW2YSVdu
	 O5/vrS2wdTKCJNkJT1ctexk1FxBY13RXaKHbAoKE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14625F804F1;
	Thu, 18 Nov 2021 11:08:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A89CF804EB; Thu, 18 Nov 2021 11:08:25 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id C502FF800FA
 for <alsa-devel@alsa-project.org>; Thu, 18 Nov 2021 11:08:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C502FF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="anS59bXq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=daJEghK/B1xdGVjo6xP2qMv3ujyu7bI69nCQ/EG9zW0PDp5+J2B3KgmdprhH8D0QP2icjRlys4t5eFfMHuW4SMo3iVuQHv7AY3AfMw9BJ+r8oMEQ3LIb54jd/RX2U2vnSY0ODacDrKa7zQRH5hJKkvzvmjlrC2CCaLTvyuaNbPn6fHBQt2Bx3kOmCV7tb7pH+PWUqFh9MB8JyIa1NyElvAdS0gD1lo00fqpYYXYcmbGIav2ukcISE7YThN78LCjHl3YnVPnX/Dpvoz/5lvqoqYtquvLgZs3hKMXy2neZ0GaJ3lVsjTxqHHRVl8Q0OOqBa6rmP9S4Czms4/5KNg8JxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tzBpeubrHaTfs7zw/gsEqVPBQvxYJ8CxPUEGkhsIObE=;
 b=MOWGKUyOCYNugvO+hbgHPJckuWy+5D5J5/GWpWHWSoNjyVdS15Pz90KHwah+pNuBvCxTaaQQ+jipKWz4Ro9COF41/aNvfQWZfNSB69u3Ulrr91WsIDE3D/QWSVPZ3kVooXxVi9epx8iUT+mumuQABZ3Ypoqh9XdU0otfSC7kBrkRNdmmHrwuVCyDeTBxQICl7kCNr0NV2mQ6dDBqguzBmT8/ZM4xMj/kRPSfF286sAd+2hlm09+gHMma4Bw9VlZbo7XobfhOo6gfXKWcGeUpJ3ybVTJLGpsDEPJOsrF6KMi8pFTwqGkQN3d8SZhWV5N4ZTWyAN1Ap1+4g5Yd9wwCxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tzBpeubrHaTfs7zw/gsEqVPBQvxYJ8CxPUEGkhsIObE=;
 b=anS59bXqsK/58S2OFATCVzrK8YnbK/N8FZapIDWvMftub6tw7ttk+ParG/oISKwK9mQzF8Mvbr+zELpJRVoD57aSvyjHqXSmpmsTbIsS9T1U+mR8OILKIXqOeWA1lJrqXMm9iIYljEfXp2DmxltGJ7Hka54r7GT4blqCjbIfLGo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB4285.eurprd04.prod.outlook.com (2603:10a6:803:4a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 18 Nov
 2021 10:08:10 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Thu, 18 Nov 2021
 10:08:10 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH v2 1/8] ASoC: SOF: mediatek: Add mt8195 hardware support
Date: Thu, 18 Nov 2021 12:07:42 +0200
Message-Id: <20211118100749.54628-2-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211118100749.54628-1-daniel.baluta@oss.nxp.com>
References: <20211118100749.54628-1-daniel.baluta@oss.nxp.com>
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
 Transport; Thu, 18 Nov 2021 10:08:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87604036-8ea0-48df-8d63-08d9aa7b5285
X-MS-TrafficTypeDiagnostic: VI1PR04MB4285:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4285D000055614975DF575A2B89B9@VI1PR04MB4285.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a5IH7dRKDCThjPHliOixhzsEAcluVMqTFFISFrFLf8FmmbDGgAZg7P9SV5MHNx6f4zdbe6Aqn/2EtgSLQk3DHhGZ7atK2fUKJCU21eHE8PnxgSVWpfBb4eSUUghXTZI/XofHXoLiShmuOdpj8Ba7BUI0maDaS6EVuik9R53uYRA6n+WvvS0yid5uYC5kYAkwuuC8TBX3fDDDrUdeSUs9NgZ7Ok7+Ob1SwCTIrPVgoAQHXDjHiVsZa2cSKRS2WMrj5U/K6TykPOAt+/qM1D/0h+mHCIoyvgrAX02j4l1R/NYpHb0cDHfrPFnPtKeIgKrfX1RYBmPLEODOXwTlDUTPQlvnL9EIgc+L8Ew5F4dPq/9a0bWUKktM86/Xvh69Q6vEXKNGu2l29nM9Jo5KHHIzkEJcC61XQ04MDcH3pIBx67vDY0xB/K7a6y3LemtBurImUseVRnVRNleE8e9Ra1S0Pl6lGXA6w6bx1HUT/KxwHsUWqHnoZWxX6BaLbKda4HqVVaHibC24JZtrgKVg/OUZja20+FAlIPjzn0w6iuCw0eb8TINUbbu+EO8gkMfj/GC6YA1FK61YoShxuIdoYha99uFsygi5/kSrhT2rozwTSBHy+LUNa6Li+SCsaWLM2OJ/8Q+u21uQcNTLauYafkOXqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(30864003)(54906003)(8676002)(2616005)(4326008)(44832011)(86362001)(7416002)(38100700002)(316002)(508600001)(2906002)(52116002)(6506007)(6486002)(1076003)(6666004)(66556008)(8936002)(83380400001)(66946007)(66574015)(66476007)(5660300002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnJTYkZtcDFmSS9CdjAwc3FDaVBsSTV5YWJtZ1RyTy9wdUJOMlRrLzlIOGZs?=
 =?utf-8?B?Zk1YbjVJRUpmMnMwbFdzaWhBRkxRckJSR3BrU2J5K1REZmVObitwQjlJV04x?=
 =?utf-8?B?OExmUVRkdXJxakRIbFFBNjFCUEFVT0FNNVY4NHF1NC8xRmppRzZOTjhRUGE0?=
 =?utf-8?B?Y0hCcXFBVHVQR1RycXI5T215ZTQ1T3o1L2JXa05kVWJYY3RYM2dBeTJIM2xw?=
 =?utf-8?B?N3R5aDFRQUxPc0tYQ0xKVndqTGNCRkZTZU9zQVpObkxYZFgxM2hsM2MxMUU4?=
 =?utf-8?B?cTBmZDBGVUZaK3F2NkNpUUJvUE00M0FFdWtHS0hQdU5kR1F1eTZhcFJWWHI0?=
 =?utf-8?B?dC9zUHRHN1dHSDFzWUJtMmorQ09BWnNjay9rOUVGUWo3c1JoWkZEUG9hWE9w?=
 =?utf-8?B?dUZaVzRXQ2s0SEVSTWVNN0NVUGZ3RVJtb1kvc055OEZTVDMyWFJCdXB4cWtJ?=
 =?utf-8?B?SGRuYUp6QTM3djBzVE1naEFJWlFhNGxobjhGd3ltYmhsL0hQZEZiQ0l3V1BL?=
 =?utf-8?B?TzBYZU9XZm5haVZ6Qnl4MU5LUWF6MEVWRStLSTRZb2N6RnNlSy9tWmxGS1hV?=
 =?utf-8?B?Q0JrYUVyZ01zWW4zbG5YdURpaDVqZ0tTN1BWdmY4YzZQN1FYVFk3K1p0WWlH?=
 =?utf-8?B?ZnNkeDk4OFVhZ3pvMTVJQmxNRGxLSDlBZHNPdk5qYUdvV1NMODY3c3RPNm1X?=
 =?utf-8?B?MVhXZ3U0Ri9vT2t0MDIyNUMxNU5QR2pQUE9WckFVRjJUR2orK3gzQTlKYmcz?=
 =?utf-8?B?L2dVbHE5am1QdGMxQXVZeTFKdk85cXRkRHFWeXdHSWpmSmZ4NTErei9CSUFz?=
 =?utf-8?B?TW9idFJLRktZeFc4UTN3NHdrZ0ZoK1l4YkR0ZHN0bW5hdXIvajlPNm50dVZa?=
 =?utf-8?B?Z3NhaDhXTFBVVEpUTllBZzdPdFlhakRSLzZZRW13ZDR1T3YzcW1Ua0RkOEVz?=
 =?utf-8?B?OWdtaHZZSXFDWldQQ1pYbitRaTYyc0pOZHpONWpPRUl4LzgvNTBiSHVRS015?=
 =?utf-8?B?cnd2Tk9vRG5hZTY0ems3VlZ2Y2ZMa1NlcVdDdkhhQWdLUGJZR2t1bVd4Ulhp?=
 =?utf-8?B?SUFCSVlnaXFIejFuK3ZHNDkyQ0dEUkEzckNKUGZYa0FnSnRtQXVKWHFXSXRD?=
 =?utf-8?B?QWY2SkpkNFZzNnI3MURzdVZITStCdTY2T0JLOU9OMTQ2TDhYSUQvZWZsaHB3?=
 =?utf-8?B?SDk2MjFTcXRobTRCRnhjYXladHd4WkxkMFZNZk5na1hSL0tVUkZpRjdXRk1F?=
 =?utf-8?B?ZFJmS2M2dk15WnZTa212YTVpcUlyeStPai9rS2xmUnFEd3FaVHAxSER6TFRU?=
 =?utf-8?B?SVZsV1RmTHJvVEhXY2dDTG8yaVcxQWpzRjBiaVRkazNuKzByeDE3NXY2YWNR?=
 =?utf-8?B?RmM2cG5ITm5xT3Q1WXQwL2xvamtVQlhTWmhJRXBNR080UTFVT1VDbkgxd1Z2?=
 =?utf-8?B?SEVDMGg1MG9hT0lTTDZTZGtlcjd0RWxZWitheUtLUnFwUE1tcFJySmlyMzYz?=
 =?utf-8?B?RTIzbnFXRjduajhiRzk4N2NIclJCTE9EK01oV29jSmRhandwY1dyenVMbWJ0?=
 =?utf-8?B?UGUzZzhQV3pEaTBoQW00SUVIMlhkamFyWGE1VFBCZmt0SkRrd2pHbG5sVDIy?=
 =?utf-8?B?UWdWRCtHNTh5V3d6TlZRZzFjQVZuekYxQXVrNHRuT3VOMTNhTmFjZFo4UXEy?=
 =?utf-8?B?UEJpQ0ZVdE9GdTc2N2ZuenNWem9oWm5Memgxa0ZIS0ZxcUw4TmJ2WDJjeWlN?=
 =?utf-8?B?YlA1c0dLV0ZhbHBIdkllS1VqWUxDSGhIaVZTVG9XUXZCOTB2bDNPeXIyM3hH?=
 =?utf-8?B?Ri91WEg1T3RzRVA4cUdNenpmbEtYaEtCdWdncGtCZUR2TDhGVXhtNWFDRFlX?=
 =?utf-8?B?eXFvd3F6em5pcE9URlhXZ3p0dXo5Q2g0N0tES2IvQ0h6LzVhK0R2Y0ptY0ZW?=
 =?utf-8?B?MWUwQVc3RUlpOWZaa2V4S050Ty9uTEw1UGoyd3lWQ09TSTVaeEZ6UVRuSVpj?=
 =?utf-8?B?akxlYnU2YjV4S1EyeXY0am5PanBDY0M0ME03cmh0c2N0MVhOU2RFSEszaGx2?=
 =?utf-8?B?d2Iya0NMZmR3K1BqeENqNWd1V1YzMytlOEttUzdycUdpWFpIT1gxalJYbUZF?=
 =?utf-8?B?a2tRQlZLTVhIUFlIa3ZESXJoa1F6aW9BcUl0NzdrWHdHbXk2THYvczZFa0N0?=
 =?utf-8?B?SDFXS0JtdWdEMVZRVVdLQy9Gc1VuRFcrenZpQ2UzS0dkSm9OOXdCMVAzbURk?=
 =?utf-8?Q?Fvs4R6igdYktyhjSZ6PsBQGatgj9jy81XapFEAsciw=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87604036-8ea0-48df-8d63-08d9aa7b5285
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 10:08:09.7616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JcJuq/6FAMGrO8l1MfnHHROyTKW8gr8wjF7vKoBaylKJfl3HHsFsswihplezuH/Uaw8FZgtmw3OfVwmLn5V/8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4285
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 daniel.baluta@gmail.com, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 lgirdwood@gmail.com,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 linux-mediatek@lists.infradead.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, yc.hung@mediatek.com,
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
 sound/soc/sof/mediatek/mt8195/mt8195.c | 323 +++++++++++++++++++++++++
 sound/soc/sof/mediatek/mt8195/mt8195.h | 155 ++++++++++++
 9 files changed, 575 insertions(+)
 create mode 100644 sound/soc/sof/mediatek/Kconfig
 create mode 100644 sound/soc/sof/mediatek/Makefile
 create mode 100644 sound/soc/sof/mediatek/adsp_helper.h
 create mode 100644 sound/soc/sof/mediatek/mediatek-ops.h
 create mode 100644 sound/soc/sof/mediatek/mt8195/Makefile
 create mode 100644 sound/soc/sof/mediatek/mt8195/mt8195.c
 create mode 100644 sound/soc/sof/mediatek/mt8195/mt8195.h

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index 0e5473e899cd..b0cdabcfdde7 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -236,6 +236,7 @@ config SND_SOC_SOF_PROBE_WORK_QUEUE
 source "sound/soc/sof/amd/Kconfig"
 source "sound/soc/sof/imx/Kconfig"
 source "sound/soc/sof/intel/Kconfig"
+source "sound/soc/sof/mediatek/Kconfig"
 source "sound/soc/sof/xtensa/Kconfig"
 
 endif
diff --git a/sound/soc/sof/Makefile b/sound/soc/sof/Makefile
index 81ad8cb666e3..964b429146be 100644
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
index 000000000000..966b8660e21c
--- /dev/null
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -0,0 +1,323 @@
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

