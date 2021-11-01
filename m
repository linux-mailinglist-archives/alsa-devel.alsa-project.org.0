Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F05B44414B2
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Nov 2021 09:04:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74EA016A4;
	Mon,  1 Nov 2021 09:03:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74EA016A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635753882;
	bh=QIlBLTofvB7/qZLHcAWlWMyLlvlcWEDAwKQRByh9V+I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p2AkwABs/9UqGz4AaaCvmty6MI2+hD3md9BvuoH6d3ukjb0kMcrxsSKrUGkfu1M8r
	 fMlzlnEm0Dzr6QBYZ1porvpb7lfM8gttVmNBSC34YOQeSaAGcJ/blzYTzTasUR42lO
	 XPLS5D3CYcQFh338hjNoP34qUJq9gzeEIHBEt3JA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74EF5F80526;
	Mon,  1 Nov 2021 09:01:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4031BF804FF; Mon,  1 Nov 2021 09:01:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe09::61b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5754EF804E5
 for <alsa-devel@alsa-project.org>; Mon,  1 Nov 2021 09:01:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5754EF804E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="CWr5eVfL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kQw8agy4ZZ3AsGzBYBm+glKt265e0t+VTnPQlisKHixy3EC8462M7RqCX3ofNz7Lz2IbwYrrTiKCRGw4Owx/zTZKTCOZTThqH+9Y92u+sw6JHuUavp1JaEErD0Pglbj2y2zTQgUm/Iutcoril1exKfqPnALE8R0bq19yR0Ddyq2UehoFRG+LBSICv6CZxiYTnTC1f5/hWb4RTIMx9n6BEnHObgjvdnvdp66IIclU5iNTseQJ0c6NXRpW/mfIVyBkxGVqCzDrU0AdxxnwcokJXfvBqGIR/nELAdfS2P4vfbdOscmG7RN5EdVx2+fOGajY+6tfj9fFGvwt5lbijedNHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1q71ZX0OhL93dqzfgutAr7YL9qPpnE4lAhTciqDhHtA=;
 b=OLk8ZlPRcQP2ctavDyCyTo3x39oG/84dB8805GjsWVlV+mHPIVqGPJGMMej8pO/nBSvpP+BgQw+6CJUgpSFDZ4AhECrDn89lBaW4Vv7LPeyH20z56KT7xeQrxI7CzrShTmb2inekPsTJAhW9AaIAX/309NQ/TLAg4zIo6ByDr2AzoBMxcRluEY5fOBAK7EgtCv3XjnbXvQy6B2LRyUDFRPmu4MEyj3fdi22tI7iAeeWRlySk4wcQ64Kb0gfvXUy8FIdD6YRs/5xAbDWNmLKyLMGYiXyEd5uaum2U8Q+ifaNw0Llg2O33YOYL6Nlehky/u3wItJAoC3PMpo16cey04g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1q71ZX0OhL93dqzfgutAr7YL9qPpnE4lAhTciqDhHtA=;
 b=CWr5eVfLgLe2EzoESluDzrj1MbcjhTq2OR8eMii1mw88UO11XTWBgpEN1eWUW27PD3s/VK+32OL6dhZR55tbjgAtdpS4b/nnGkYBbObOjp4g1210ufTk0PVvkm8WfhXrc4ZmksVTxL7gjDOLdlwagsKPFriXbzV/ibgYvrWgQi0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR0401MB2430.eurprd04.prod.outlook.com (2603:10a6:800:2b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Mon, 1 Nov
 2021 08:00:56 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4649.019; Mon, 1 Nov 2021
 08:00:56 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 6/6] ASoC: SOF: mediatek: Add dai driver dsp ops callback for
 mt8195
Date: Mon,  1 Nov 2021 10:00:26 +0200
Message-Id: <20211101080026.297360-7-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211101080026.297360-1-daniel.baluta@oss.nxp.com>
References: <20211101080026.297360-1-daniel.baluta@oss.nxp.com>
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
 Transport; Mon, 1 Nov 2021 08:00:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc06250b-86bd-4c82-9f66-08d99d0dbbbf
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2430:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB24301E8B0405C2D7583B3BB0B88A9@VI1PR0401MB2430.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gixH+zPFUGQLFOeNwssajxmTA1CXsBuw6Mon77w2JOxxZ82wBqZsx+/oWq5fVVNhA5jsSh1PhLQfIN3GQ9T5JhZBgi3uPWu37tse0mG5PAlzVsjizDZqx4EjkJQcpOmQJi6d+ztz7Oq3tcOqdKStmDNQSq9xP19uPjjcksZ01DrA9R2+6BbUxfnAs0yP3ieGVstrFpk2IKJs+lOoct1ceCZ/0kOU+iF1nI9thXMjXgA+qc4Vq7hyEvSsPWhu+75zWFR+s7H3TzD/yCBEAf7L2U6V62AAMnhfMQgSWUJTAq90nYB++70I/2GnXSCpZHdCiK2GdgN6WVsHSHZRaZKQp4iIoQjbakRKrgGSTb3PNpjHpoD8xWjExwQg4u7TM/kN62WKOVHNCc8wLXD8F0WC8irFQ/s052ez4S1hD8EuwB3HvkJC+yC+GTdbyGnP+kWX0iHcPHnthPASh4RSfdevdxuptWEhuKG3RDUQrYhoUvxoTJrSpnpO2cBrOUqnSpmIDXENEiHUF5Afr66xfdNpT7rUf5sncdyJ8NTGJijnzZ1FvhE3SeB2jFePkvXYoIULq9tamwE+3EC9Ily/UiRn5v7l/WpKk50yLUQhONHStV/J9tCO/wp8T8gfGxjay+mj+v9pFsah8GCp/0+w4y42NA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(8676002)(508600001)(54906003)(6486002)(8936002)(6506007)(1076003)(5660300002)(52116002)(6666004)(44832011)(6512007)(66476007)(2906002)(7416002)(2616005)(66946007)(38100700002)(186003)(86362001)(66556008)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTJvc1RCOHE4cGFSQTBTOVdIMkRVZ3dmVzhhTlYyZ282eVhGYkxNUWxaenZo?=
 =?utf-8?B?QWZRTlAxbThLOHVKN3Z2TTNwQ0VGSXhmSHFEM1VLbWxZYUhJaU1ZR2xURHZy?=
 =?utf-8?B?cGxJRllpY2lHTlhFZVI0aWFMWURnU1VRZXNlVnd4VjFGNXpNejMyOEJyWUVi?=
 =?utf-8?B?bGdNY3pITzhSbCtRWXMyS1VQRFRYeDJCNXBiYk5BUUNPZ2F0VndYNE4rSjEx?=
 =?utf-8?B?K2VMSmdJR2toN09vOEJCZXh1SzVUaE9UTXZhZ3o2dVpzZnRXencwSmg3YXk4?=
 =?utf-8?B?QmhGK3dtMDdqK3VHOUlYdzJ2Q3hsbFZRQWNtaXVzVWlkaXBGRXdVd2QrWjY5?=
 =?utf-8?B?dEErdXg0NjhBN1k2S0VRVXNpSHRPWDZrNmoxUDJjS2hkY1k4cGZqUGMzeHNa?=
 =?utf-8?B?MmFuMjN1VXJseUhVMFUrU1dPc1hjN1k3K1ZncytacHRpcC9DTUlqUm9yaFFU?=
 =?utf-8?B?RzFMaThQeDA0Z29ha2ZwNHhoVngraWVKQUNQRU9aajVwNXoxT3ZIcUFYYkg0?=
 =?utf-8?B?ZTR4NDlwWXZkNjBOMUsxM1dGOGpVMXorZmUxWFVWdHRaVUFoNzgrVS92RUFK?=
 =?utf-8?B?ODVVL1NoaW84ZWNhbHFqWE9ZN1RSbExvUkErYThqQXpyVUZxR0RZT2s0Sjk4?=
 =?utf-8?B?V0dkaGw3L3paTnVXMmcxNHpyYjRzVFcrZWRGTTZGb1pwQ1lIUzA3Ky9zdXdU?=
 =?utf-8?B?OFN0N3dCWUZhSXZ2cW5ZQUhyTFVBYXFvRHJMSCtSeHVvV1JQUURhY3NmVFBC?=
 =?utf-8?B?QThtZkdVRkdhdHY2dndnY1F6ejhKWDJNN2VKSE14ZThOZlcwNlBrWGVwR3Nr?=
 =?utf-8?B?R1NkQkNlVmhKS2VmamIxR0daVjN0RnZaMlhKQ0JXUktyNkNPQ1c4d3BRQk1O?=
 =?utf-8?B?K3VpdFhJOW9GK2YwMEgxdW5XMUVyRFVrVi9FOXZQUFNDV3k5Y004MGpoSm1m?=
 =?utf-8?B?OU1OSFQrNEVJMGF5WllwOG5YOXVBTDBldVdmRnZRVkNlcGJ1ZjFTbTNzNmdV?=
 =?utf-8?B?RWNCd0JzWTc0Q3V4dHVtdlVPSlpUUWlWZzZ1VnBkTUJ4U3VyTHpORTF4aExG?=
 =?utf-8?B?cEJGdTZHMzZuU1VnT1UvaWNmaXdZYWtHY25qVmR0UXplbEdFRFczdlBXYnZq?=
 =?utf-8?B?VHZiUEtpQ0MvRkVpRUhRSk9YZ0VDQ0NqTVEvMnNFUHVLYzhWSld3R3VFZWtw?=
 =?utf-8?B?NFJNcVJrdVNxYS9JY1g5eVlXRDlyK3JWWWszZU4zekRZSmQ4YzFTdmdpSUpW?=
 =?utf-8?B?VWxYWmVGUGozSDd5NUZqV2MzWFFwQ2FnbUx5cGhrcWZpdUhoeUJUc2pyd2w4?=
 =?utf-8?B?eWtMMitwR2JIYitEalVzQ01sME82SHhtNWFFQ2xrMk9VSUUvY3ZMYXJLOEpR?=
 =?utf-8?B?cnVTODk5QkdtL0VrSm8veEozanNvRUhmZlM3dUJtcnF3MUkxMTRLbHV0Mlls?=
 =?utf-8?B?SVpGNDhlTU9NZVowbHl2bENhTDJsUk9hQVA1em11Qi9Oa3NYa3hSSDlVNE5y?=
 =?utf-8?B?b083NjNudyt4STBvTHhHK2ozR1ltQVBheEtPODNlZ3d2WTE0VWY5SkRjbThm?=
 =?utf-8?B?Z2UzbVgvU2RrcUdsU01RNHJqVlgvMU9tT3JEY2xMOUdDd0NvY3VBZkZ0NS9k?=
 =?utf-8?B?T1hraGFLdGFSWkkxZmNhMWJiQ1dCR3Q3MGRGNXMrSzQvdGwrWVdBanpDQmVC?=
 =?utf-8?B?OEVKaGxERnRJVG5BUjFJc3ZpSlEyZzlkZkhmVWo0MTNsVkhmK3lkcmpqOE51?=
 =?utf-8?B?ZDd4dzNXakptZm9VbVRib2RsbVRZdVA2cEhOMHVmdVdDK1dlWWZGbTE2a1lY?=
 =?utf-8?B?Q1dtTzdzbFV6bkJJbk41anBSZVFrVk4wTWUyRUxMcXhRSnBrOGZURXlTOU9Y?=
 =?utf-8?B?RlpVc0orWmw0d21nNHhXYVlkdWUvM0x5b25heDUxck5rN3ZBS2NLbXpSTWV4?=
 =?utf-8?B?amhzNEdQOG9URFVzbFJFUkV2dnJ5U1YwaGJQQUhPMkFsT3duN2RUc3NmN2lC?=
 =?utf-8?B?QjN6Q010Q0QvZURBNktsaDYwSXY4U29hRHE0VE9ZTXEvOGpyLzlnS0x5NWpF?=
 =?utf-8?B?emFMN3pWbTNCbkNRT2FobHA2bEJNMmppaEM4NzZOcUdzQTdJVnh2TkVNQXps?=
 =?utf-8?B?ZXlBS2RyY0tTT2xZMlZyRDc0cEJpZ2RBWGZEOVN4QTVDOGdqWWpSWGpMOWhT?=
 =?utf-8?B?TVI3RjNzNTZvcjN4WG55MEhVejNEU0RsQmoxb1JteFJHYW5HU2JXYTQ4V1c1?=
 =?utf-8?Q?stz99zmUWUx1lIBO4jYe8lQAzmKEBSy3xASXM+Rm4Y=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc06250b-86bd-4c82-9f66-08d99d0dbbbf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2021 08:00:56.1188 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9CDZbjyQchYSGWQh+7+/B8ZyWuCYltxNZZky2FxEERX51wPBwTVdmfG8pXPddCg/j9dtdCZJ+xYhcHZtR4b4Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2430
Cc: guennadi.liakhovetski@linux.intel.com, daniel.baluta@gmail.com,
 kai.vehmanen@linux.intel.com, Daniel Baluta <daniel.baluta@nxp.com>,
 ranjani.sridharan@linux.intel.com, lgirdwood@gmail.com,
 linux-mediatek@lists.infradead.org, YC Hung <yc.hung@mediatek.com>,
 pierre-louis.bossart@linux.intel.com, peter.ujfalusi@linux.intel.com
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

Add dsp ops callback to register AFE DL2/DL3/UL4/UL5 sof dai's with ALSA

Signed-off-by: YC Hung <yc.hung@mediatek.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/mediatek/mt8195/mt8195.c | 35 ++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 88da6c2de070..99075598a35a 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -299,6 +299,37 @@ static int mt8195_get_bar_index(struct snd_sof_dev *sdev, u32 type)
 	return type;
 }
 
+static struct snd_soc_dai_driver mt8195_dai[] = {
+{
+	.name = "SOF_DL2",
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 2,
+	},
+},
+{
+	.name = "SOF_DL3",
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 2,
+	},
+},
+{
+	.name = "SOF_UL4",
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 2,
+	},
+},
+{
+	.name = "SOF_UL5",
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 2,
+	},
+},
+};
+
 /* mt8195 ops */
 const struct snd_sof_dsp_ops sof_mt8195_ops = {
 	/* probe and remove */
@@ -329,6 +360,10 @@ const struct snd_sof_dsp_ops sof_mt8195_ops = {
 	/* Firmware ops */
 	.dsp_arch_ops = &sof_xtensa_arch_ops,
 
+	/* DAI drivers */
+	.drv = mt8195_dai,
+	.num_drv = ARRAY_SIZE(mt8195_dai),
+
 	/* ALSA HW info flags */
 	.hw_info =	SNDRV_PCM_INFO_MMAP |
 			SNDRV_PCM_INFO_MMAP_VALID |
-- 
2.27.0

