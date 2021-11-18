Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 826854558C1
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 11:11:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5B44189F;
	Thu, 18 Nov 2021 11:11:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5B44189F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637230315;
	bh=uRywt/6Kyw3A59jrRjOw0vqU/slQPz8+odzpqxuhGVY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EEw1ZR8ksb5p28z5NhTuBB2I65zeZ7gge5JzrZ+0BsaRXGYAUDGUVDVhnA71jZ3Sp
	 xC01Cebv2L7SMvyc0FaM1pkFVCqtmuaPINL1arnmCUHOrtiZ3DxBjcMNjziY/9K1do
	 WHPS3pjinbFPU+169ePxGkQ85vkgyQYOrl61hrcY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C705FF8051F;
	Thu, 18 Nov 2021 11:08:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F4144F804FE; Thu, 18 Nov 2021 11:08:33 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id C0F03F804D6
 for <alsa-devel@alsa-project.org>; Thu, 18 Nov 2021 11:08:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0F03F804D6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="Is3xwVFx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f/cCkFYZhxwMpBjlCDJQek8r7PjE8dSQ+pb1AaRsKO8kGWkfC3cdDcsGVCpjnqZAd1xqMZoEWgH6VBfIaBfZMc+vXr56JI0VfHJNLF159Qa3r4h8yOPQCNozDQF6xY6ic2HDZyWLoUHZgN6Kk/eRrcFe2mB6+MkP30sejej5XnUlyTo2WUb9vVOzU1GKDXusee3Hen9ZD1gfyFW0reRdwuZa9ACsT4TNFE555GMDuPaU/Olto9f88q8SGiwq0ZRx/E5FaDGByGltg2QUhzfje2OwKkUzrj142FLTwSqh2+2GfDV1bGajQuumiwBMeuo5DmTPzxvTnIlw2vu2erhCfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LfCMsRTQHWceFWu6tp44o22ZVYte66A8Zl2PxavSv3g=;
 b=T0/1DSjlz42/HgEmbsZsbifvkEfb5eOr+VcJtp0tA6YatDZMp5u6sUlmSQvdsOc0fo48EoT+igwzGDGneb8W+U1BrElyUioJgnXyVvdr4JAZTLLfl/D3yzlTZEmwkP0OE5flHJLil04KMoWG6xwsasS7dvOCk9ZObGacibcvBzeshLKs0R9zww4LK/Ne/eDiqqhwr6S9a3Bdd9c+H75kTS+pWW1V+hlnAe+2H566bvR2JKuau2ZkuIrAozYVRFs1SWzjOXXuqIBZBPnOYND/+VwBVCD3uoy4d9gtebIGxn2/wPRWw2w8LPVj3SpeAINt7qwjcFLqoTBJZAhIIQD/DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LfCMsRTQHWceFWu6tp44o22ZVYte66A8Zl2PxavSv3g=;
 b=Is3xwVFxiEU1h8vp0fsYjjleJNIonUKyg9/cFhc/5GNh/pfT6jRgW97tlFhA7nfBtZMxyZWREABNgDRo6fntl+WcF8Cbg8mXrdxjT1bWAqaElSvkKtvSTqKSXcaPCj+2Y5gEDVqYDKyRVL8ehlWBCGkD5l0W484XyQeLPB5NHCo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB4285.eurprd04.prod.outlook.com (2603:10a6:803:4a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 18 Nov
 2021 10:08:19 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Thu, 18 Nov 2021
 10:08:19 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH v2 6/8] ASoC: SOF: mediatek: Add dai driver dsp ops callback
 for mt8195
Date: Thu, 18 Nov 2021 12:07:47 +0200
Message-Id: <20211118100749.54628-7-daniel.baluta@oss.nxp.com>
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
 Transport; Thu, 18 Nov 2021 10:08:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fa336a2-d635-4222-2cd5-08d9aa7b5869
X-MS-TrafficTypeDiagnostic: VI1PR04MB4285:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB42859A99B6049BDEC431FF36B89B9@VI1PR04MB4285.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ugQn4vJJfLzhVzXIj+7ZDCJrFPMNt4UrrzWEYEPouYlOy0ATC0je/I/+98DOF2v+Q8lhRXwzyx2btY2DrHYFGHDgaqopYiTixeMDxnu1RhG6Hpaf0yYgEABVWXwusZZ+kmATHz3JzZ6v1eDpI2cu1HP+r4y3+EjVsy2FxTAGxu/KszsDVOBPN4Xtph6HmGJOGcpe8z9jmuH/6vAHyqK5DpzCB6BZ51hlHhYRsf/LsBjqCBq0a2tCS4l5lk1gUGIYeHF7SjZyK60FFMZXlJtbmJLq/fBQA6scKliCe8bmbCdjy70YG0N1vJPJLFZlT+V0B5SSp3P2vjCMJH2yPkE0RCiuJjxkG2INbd/W5qfoSFFLla8QHOuZ/yLhrjJd33NKNfJFQ8Iu0GyYfuLxbp6vgYdISmqPfrPOzp5A9aqfDTqObwhOaTG3E1Ig1g9XJ7+7loDrCHK1cgZJ9uVTrRvS2y8tLbUE3Oey6WRDceTWleoisOFJrf63NhmQYJAl2wBNW1XajpFPZ7ebQsO4Rb6MAbrzXwRqJgtCH+R8SvIPGCE8CdqtqDeY/fmVQoPgY6MK5nqx5CYCapHrB81QDS9lWhViGBS5yLTavvzUFbsfK7F9hKpYi7HRT8BsQNBrux77NWdwg4DchSdRXg1xPbNFyw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(54906003)(8676002)(2616005)(4326008)(44832011)(86362001)(7416002)(38100700002)(316002)(508600001)(2906002)(52116002)(6506007)(6486002)(1076003)(6666004)(66556008)(8936002)(66946007)(66476007)(5660300002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0FDNU1VSGdMcmROdUdLU3NlcFhaZEtsVDFoVThvL1hNVnVjZTdtOTZQVjBB?=
 =?utf-8?B?Z1Y4MlVSTzlMT0E0TkF6V0hwdGF0c1BhN0hLeCtKSzhLRFhla1JNQ1RVcFNR?=
 =?utf-8?B?d0VaaElsZjV2OFJXN1Q1YytCT05teFFsVjAxaGo4eURGZExLUE9QV1lLWTRa?=
 =?utf-8?B?bHl3VlBybGt5ZGlNclBzL3pOV1NuZEhFcUd3aE1OZ3RjbFRNUTZueVdLY21m?=
 =?utf-8?B?R2lKWExZTGVpZ1ZjQ2FtVitWZnNhbVRscHdJejNPblpDVHdxL3Bwc3lXU0Vw?=
 =?utf-8?B?MUhSR0NGcjYrTWFrejhtQVRlUkdzM0pEY1FUdUM2RndtNE80aFFBaWhHWkQ5?=
 =?utf-8?B?QnZTYjJaU3BZWnM3ZE81UEVmdmJ0M01iZlBsbG43bDduckZBTkFha2c5aGE5?=
 =?utf-8?B?VzY0S21jVU4rVW54aVNicTRiM1Z1aXM5andscHowaFVSSjJTckk2MVlaNlF1?=
 =?utf-8?B?U0hrSFJITFo1RnJYM1VQUmIwanM3M3VaQXB1empvQVlMNTYxd2lFRGsvZVN2?=
 =?utf-8?B?cjQvZW9uMVNUQ2hiU1ZBRVpoWkIwVmZHdGZ5dnlCR2Yra2xuUXBGOGl5WEtl?=
 =?utf-8?B?ZUZkekxwSjhLaU1keHJXQWRQSWpyUi95KzdWUlRSdG9aUHdBZnIydmxRQTk3?=
 =?utf-8?B?QUI2aWJZNlJoWXQrcXhKYm5IRUVQMlBwUVhsaHBMWWlhTm9YYkVZc0RiV3Er?=
 =?utf-8?B?Rlc3RUZxZnc0T1Y2K1RFN0x2WEE3bmVRYTlBR2xDREYwbS9uN0YvVkVmVW5O?=
 =?utf-8?B?VGVjOWdSaWZIQTdRbmhPZWhkSUV5T2xZSjZibHpjNS9zWEEzS2lURjY5U0Nn?=
 =?utf-8?B?TDc4em9aSXZVQVRmdm9odmdlQ1JOamtTaDRSSHIvMlpqSitNUGIxbE9rTVpH?=
 =?utf-8?B?cmg3VHQxQWkrUTFVWFhTZ1MyQ3lBQUJ4OURWbnpCZ2NUVDFSbWdmbFlySmpa?=
 =?utf-8?B?M0dZcnc4Y2tJOGNIY29TdkJqcXlOYTk3ZXMzamhRd0NSb3R1elhaMmRsaGl4?=
 =?utf-8?B?UWVvQUJGYkZWVnR3RHFlOVd0TGkyOVNiazBjMmpmWGZheEVBa1lWOW5iUkMv?=
 =?utf-8?B?ZjFzU1VveTJuaGVQcFc2VzQwRzNrSyt1clpvNkhhVFhOc0s5V3kwblFsZkJP?=
 =?utf-8?B?K3B3dGNud2V3SEZLRHhsNjNvUE83ZEFLNjl4cnZVSWc5Y3JqU3QwYU85T3A5?=
 =?utf-8?B?SXpqSkhKM3VXejR1Ykc1ZktnTENoa3Nsc2NIb0pkSnlxK0loV1VpbGMvYnNu?=
 =?utf-8?B?WlRkUW9LM0dHNDVRNGFLSHZWQTR5YnFyTXU1Y2J5U0pIMmdiVVNUdUxkRXBK?=
 =?utf-8?B?dnQ0eWZpb0o1aEpCbEVzc1psK3NzWFBRMG9TSnAyWVJUUnRERW01TWRtY2cv?=
 =?utf-8?B?aDZ5bzdSWUt3b0ZSOVlEb1FwSnNkK09Gb2FyNFl2Qm9KS3VYRlpad1h4SVdV?=
 =?utf-8?B?WGRNTHBnVXFzLzZIREJZT0ZtNUhnWWN5NThPc3ZRL3N6OFJDbStRU1c4Wms4?=
 =?utf-8?B?cmx6SGZhRVFkZXIrMytjVnlOQnc4N2wvdCtXdE83N1RyTm1LY3dwNGU4cHpV?=
 =?utf-8?B?MnFPcDd5N1kyZVVpOWpSL3ViUTVwQW9weHkrQTZDVnpqREVWSXdIemRScVVw?=
 =?utf-8?B?V25WN3BtQ2VLRk92bGpRWi80cStpR0piVlVOUFltK3lmUVNiNURYamgwWHhp?=
 =?utf-8?B?UXdyN1VxMyszSVFvY2hKR3p5MnpFYWFkV0JwSWh3dDNGTGx0cWN6Tk5kQ2dT?=
 =?utf-8?B?bG42SDhuMlc5TWJqenF4RE5ab1BlZ0VSdGdsaGpPWXB3ZTJrYVpBVFpCVnZE?=
 =?utf-8?B?aU05aG1NTk1rV0orcXZwMnhkaUEraEVCZHI3TUJFVW1VcVZpR1VnZnVtUFZB?=
 =?utf-8?B?VEs1cUxjUERZR0hkekMyZmFlZWlWODYrU09MSE9tdUpVdTg3L0d5Vld0dzdS?=
 =?utf-8?B?bFhrdEhzcnJoWmZsYUdJeFZ5NW9VcFgzL285eHRNTFJTMXRMRzV1SzlDL2Vl?=
 =?utf-8?B?bjZWUXdCMnRiVnZwZGUwd0h2aDZOWXl6bVpZdHVuRXFlUU9hV01xL0VkS29V?=
 =?utf-8?B?YTN0bXpYQ01RV0dUcjh5clhZYndGT1ZJczgwcXZ2VER6ZEViMld6VUlhTyts?=
 =?utf-8?B?bXN2Z1A1ZjY5L3VKUlc0T1F5bGFTcHBXMkd3L3cxQnNyc09QeE03cmhlcXkr?=
 =?utf-8?B?QlFKUGN3YmxCbEtkNFVCS28xMFBLTHAwOFZUSXZTTll4bllRYjBUMkVNOXNx?=
 =?utf-8?Q?xwr/WZdklYrdEuKn3EsYa9REfBLEqPO5RSFc3/e0Ro=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa336a2-d635-4222-2cd5-08d9aa7b5869
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 10:08:19.3111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mw1okgv/b+UL46B6IWFKv8VCDYMgqXp5MLbgfGuQtbVPTW8GEhaAw6zf/b1diNaidRhcJ19YVINDLiRvkKk3VQ==
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

Add dsp ops callback to register AFE DL2/DL3/UL4/UL5 sof dai's with ALSA

Signed-off-by: YC Hung <yc.hung@mediatek.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

