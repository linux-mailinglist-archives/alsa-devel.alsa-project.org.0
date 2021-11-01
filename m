Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2384414B0
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Nov 2021 09:03:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 949D116BA;
	Mon,  1 Nov 2021 09:02:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 949D116BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635753823;
	bh=OJpGgYRNIncpF2GwbiQ/mq6gk1bqLz+54+/80XqZOhQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=co86z+mdMC1mEkQuXU48i5IBSLVFxUfei4UH4+sgggmL9Nipxha/EdyZg1TfNOMJq
	 83hUKUsaMu56G2V06mAfACYMZc9XyuN/Hu6RIsL06MWcSMu/ySuS8mbOua8Wu8Ws76
	 rsGATFSUg82RlE3g1+y1ljwauCpxjJcn4drK6X2g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4A81F80507;
	Mon,  1 Nov 2021 09:01:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5B7CF804F2; Mon,  1 Nov 2021 09:01:16 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id EAF95F804B1
 for <alsa-devel@alsa-project.org>; Mon,  1 Nov 2021 09:01:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAF95F804B1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="bAL+m+UJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cE14NhI/usy5G6AB7Gzcj+w526+2mptmyLU8KSSetRUnAK+SgjeQur13Ue1nBTW3uRJL+bkdAtzi6vokFTHhalaNtt8SQ77Mq8CfXqBgNjoZ/+yGwir0uUzjpS00uus4rq4L6qychM2rILWehZhcU9mwMoxw201IC8V5m/iQVBYgQfp3pM+5KBMSSOn8ytD/PnhmPW6pBYgNd3qbv41OzIxzqSD1n8chHddCoxoQDIJo7Thn6a344UBCP//pqAPR0LC27gYkZvh+y2xKxebJzXfeuNsrlUaRXugm312cug3i8NfXc9u41P0eCwvvBrdFsScHFS5RYsu9gVjNZb249g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cG8P/WfZcRAHN57UVOx+Wd+RrVgZpkhz13HcXc8Xm+8=;
 b=UvKUdJZl/htNWK9Mey3KudOjtV9peAage9DtcwUN+/X9StH+Bw9HwZDwSBtij5BI/lKMfdOjksuIgINBROvoC7GlePDZIGia6Q24KmtxSwVCLet6mj8wdx/ioYBSqheHt0pnCjbF0MN6UKGMuLKML5zSfGhNIpodZXUVPiMCPcMd/jFP4CA0q26Mgj+qdLrgy2QL5bw6sOczpG7EvgnUNQEQyP1qeoQIzGPdqlXxuAFC+ur9QI2NAf7sScJWPFH3DPyoZ12YMWhPqsRS8PZwkTenL/vk4XjDRUEn8+1izUfecM3vINwk8rIk4dkHF77tNQRkXVrjevlGxF6Xq0UIPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cG8P/WfZcRAHN57UVOx+Wd+RrVgZpkhz13HcXc8Xm+8=;
 b=bAL+m+UJvKI2Ew3oC435IQ/VBbtZ/7ap+7IRK+QpcQyVcDJoTT+iZYYFMNTnCfduRyGENCln0fp+3sAyrExjzN+DwxjgPVkwIjRC27Bs67Jek0BetpZ8GzynKgwjRvtbSrWWnz6T7ssBmqUSJS11zy1WbY3GP4xeHSWStTPM7eg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR0401MB2430.eurprd04.prod.outlook.com (2603:10a6:800:2b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Mon, 1 Nov
 2021 08:00:54 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4649.019; Mon, 1 Nov 2021
 08:00:54 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 5/6] ASoC: SOF: Add mt8195 device descriptor
Date: Mon,  1 Nov 2021 10:00:25 +0200
Message-Id: <20211101080026.297360-6-daniel.baluta@oss.nxp.com>
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
 Transport; Mon, 1 Nov 2021 08:00:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e7550ad-8ac4-4874-9e6b-08d99d0dbad4
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2430:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2430DAE8622AC75EAF60C372B88A9@VI1PR0401MB2430.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OT1v0NMNEVyYjCX3MI+b26GYWR40vFqDNFZPfHZxcfXUzZxDVf//lAVB5hdC51RU6aF1jxwsziS6LBoSGG8efRy9KDF012lFIOlb5eXU1DfwqGx620+kXYCjHvoC4HLFmRWBSoDxvjaHdpbz96TWqGAxKdUTz/Lx7z6x+XJZJzWN+JH+L4edU01DG3A0fyEDB8a/3dOmbBXTk1tpHoD4Q4m2uUDtfKmi8G+AvX6hUUDxvCf6JkdN+atZj0uB5SZsHJwCSrlGuk+59J95cQnUQsA3d+eUm5JdroDzvWoIC0emefvEvsvW6I+HfajOkEfWmiVWiFj7lQsb/fkVAWhXk6mHRuHnBfb4CF6jRzeYToQruFVo3x5kGhDFt1gX5Xm6MRZ68dpl7Bx9rs1xtk4yIHfQWaBB9OpIj7uJ+RFLIEJqQtvGVF8t94YHGWfxxMvZsJo30I5emQn9Z3SFC/aMYLEdc/AGofh/4KLQQ9XnWf33Gx44AwCojrjmQFUKwbj+rgzkcCw4TYwezscNbVmg86J4JqJIM31K+nUUuT+A/lOVmzfrN+7PxlozGKvZdUeXKCqYiWH+/NEaRW6eMDMoLCLQJYPQqM3S8dMb0918zoYdCgZTT5evVBRuYNTp2vIDRuNmdl2LaXSQ0BT/8IOqxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(8676002)(508600001)(54906003)(6486002)(8936002)(6506007)(1076003)(5660300002)(66574015)(83380400001)(52116002)(6666004)(44832011)(6512007)(66476007)(2906002)(7416002)(2616005)(66946007)(38100700002)(186003)(86362001)(66556008)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1dQdzJMNksvRTRGcE1RN2lSWGJ5UVlkWkVTenlFdXhBOHdESitFZnA1S2h0?=
 =?utf-8?B?SzAzajZpenlxalo2dmxBblVyVk9pWkwwMnlaejRGSU1wMFU4V3FtRXhLRXpq?=
 =?utf-8?B?YmgyT1RldWx5Y0RveDBMZThjUndLZnZ5VlprZWlvMmNjYUVPR3FXVW8wczVL?=
 =?utf-8?B?UFErRUZaVmM2eWttc3ZqWGNoMWZOUVlPdEdmRUVHQUYrVHBLM2xSMTR2S2g4?=
 =?utf-8?B?VDMwYnJrc050dTZrSlBCMEVadHZnSFJWd1BrUHJ5UHJHUEdNbWhxK1duVEtV?=
 =?utf-8?B?OGxmaENXb1VBSGVMeEltbE8veENMM1NPRWlQZytlVFJYK0loMnRmWm1Uc0t0?=
 =?utf-8?B?SWNLR0x3SHpENW5yWFh6aU16OEZDNDFCa2JCeEo2RjAvMTV2NEJhd3M1bFQx?=
 =?utf-8?B?WlJtSWk5WFozc0t3RkUwWUU0WWl5d1RMN0lpK01BTTlhMUJ5RElXWWtJQVFw?=
 =?utf-8?B?MW0rdzcwb3FMeWhyOGswb0JWZm5vQkRmclFlRG0wSUFKTEp4bjJUaWhUVWw4?=
 =?utf-8?B?L05RVXAwZ0hyUndzMjJ3YlQ1cE1ST09PKzZvTWdPb2dLbFFuRllpcit1R2sr?=
 =?utf-8?B?YlNuemxWajIrSWRjL29aeGlmVEdKZE04cFl5dkFmM3l1cEdpWjl6dXRWY0Jt?=
 =?utf-8?B?M0VEaUc2YURicGQvbHJQdTBRQ2F0R203bmlTTnBBTDB6QUtGdHpUcTFYeTRw?=
 =?utf-8?B?VS93eXhwM2lDeUpna3NtSnFLRDhwcm41ZWE0WjNuSjY1TnhJOGZuWGN3alEz?=
 =?utf-8?B?MTJFOGhpbEFKcmQra3pzdnNlOENhY3VvNzBoYkVBYmpEanNzeTlPaURXOGtt?=
 =?utf-8?B?YmNlUDNDZEkzM3hPejNUWlFRdmlmYkhjUUJOVno4TmRUaWtSZitnS1BHZ0lr?=
 =?utf-8?B?YVQydnNGK0FiVHhSK1k5VjU5NUdod3orZjNjakZPYklMOVhZZkgwWFVjZlU4?=
 =?utf-8?B?clFYL2hwTTFwU0xoUC9EOTFlWmg4aVlTYkxmdFFmOFY0MUs3YUR5QnoxR1pM?=
 =?utf-8?B?UVA1RmM3MGkwZkk4N09jaHBzSFJQWjd2dUxERC9EdG4zYnVJcGxYS2Qwc3NI?=
 =?utf-8?B?eVJrZ2RTMVBNMnkxTlpMZ3lROHd1RzRXbFM0Ukc3ME9Cajd6YlRpcXh0NXZB?=
 =?utf-8?B?WlFWN3JDVEw4VXNsVTBWYnVlRmZaaXpjaGdOL1BrREQ2dnp1Y09JT2pybUFH?=
 =?utf-8?B?UGxHUHl6cTNNcWVaZEdGQUYycFZ3dmNSNTE5ajBKVGV4dnZuU25tREw0dmdo?=
 =?utf-8?B?Y3pGZzJVWnNGOWcrMVJTQWp2R0JRZFFRdU9lV203WEVQTzY0bU4rZWlDVE5m?=
 =?utf-8?B?bEZYb1paNmlObDBvditFNG5MVUc2N3RQZnc4a29mdW41Y2xLRjBkMFJzdEZq?=
 =?utf-8?B?Z0l6VnBOcnZ0QlhlQzhrOFNFc0hYelJLVzBsd0JwMjhGZ1VjMjR1VWZybnBq?=
 =?utf-8?B?RWZJZ0tHVHg1TFNLQWp0SkJwalRmM0hxOUtFT2VJMlRJRFo1cW5OYVFSTFcr?=
 =?utf-8?B?T0RVYzdlYkZ6RXZZWTlDVFFWaVdSOUZIL2tydWJNS0R5NVgyN1dzM21md1ZR?=
 =?utf-8?B?VTk2Z0dhUmo2b1d6L2hFeW5oL1lENVpyYTVLVFBkbS9YaHlCeEMybXFnVjAv?=
 =?utf-8?B?ZUtiLzZVbFNEVlUzaXRoR3ZLdDdHcWRneHJabW9FQ3hVRTJ0T0hITk13T2RL?=
 =?utf-8?B?TE9vV2RlUnQrSkUxUFdqcTFIcU55T0t4S1JyREF0NjhhVGNTd2xYakpFbUxL?=
 =?utf-8?B?OW5sTEdhM0E0U1laVmJKditnSjZGbmlheTMzU2VpTm13SXFSRVJrQlBpL20z?=
 =?utf-8?B?aVVBZzFWVFFYOVdUdWlGeEpMN09ya0M3UE94TXNPRDZtUW5xNThURzdxWGdn?=
 =?utf-8?B?dlFUWmtrNU9USGozNGxSWmd0TktvUmh6U2t0Q3ZTTUs4Rmt1aUYwRmRHaDdn?=
 =?utf-8?B?bkNLOWY1Y2t4WjByYkp4YVVERmduZmNBSitBTE1ibjJ6b0JZRG93ZDNpaHJY?=
 =?utf-8?B?ckpWTXdYM01iY1NsN011cmhKa2xwbE55ZUNxb1hxeDM5T05MQTlrOXdmWEpV?=
 =?utf-8?B?WU51UmhhNzhFUFk0ZjFCKzF0MVltK3R6R0d0MmJVamNLOTlPODdSckxEUkRK?=
 =?utf-8?B?RUI3ZEdGWE9SS3k5cjhQNm9xL3hRd0hCQmNZbGFsTmV2UEhzclcwcjZZaHhY?=
 =?utf-8?B?YmFKS2lSeW9jemhwNURpWjhqRVhlMEZSbklkTU1yZTAxOWNrM0s1OUgvN2ZN?=
 =?utf-8?B?SUFqNGlPSzA4NkZ1eUh1eHRURzZjWXJLV3U3cVllVTRiWEo2Uk9mVXZvMUhI?=
 =?utf-8?Q?gNXkIbw4tDSRglK82g?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e7550ad-8ac4-4874-9e6b-08d99d0dbad4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2021 08:00:54.5747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pj7h+X9deZmePj11gQdqwp2uiNcnR0TNBuoTkOOiytnJvIt1XvH6MwAJLje7UUYyEtnF0OYdJzphM2cbkjgWNw==
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

Add SOF device and DT descriptor for Mediatek mt8195 platform.

Signed-off-by: YC Hung <yc.hung@mediatek.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/Kconfig      |  2 +-
 sound/soc/sof/sof-of-dev.c | 13 +++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index fd6ae0629a1c..0147d089553f 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -42,7 +42,7 @@ config SND_SOC_SOF_OF
 	depends on OF || COMPILE_TEST
 	help
 	  This adds support for Device Tree enumeration. This option is
-	  required to enable i.MX8 devices.
+	  required to enable i.MX8 or Mediatek devices.
 	  Say Y if you need this option. If unsure select "N".
 
 config SND_SOC_SOF_OF_DEV
diff --git a/sound/soc/sof/sof-of-dev.c b/sound/soc/sof/sof-of-dev.c
index 885430a42226..412cbb824b84 100644
--- a/sound/soc/sof/sof-of-dev.c
+++ b/sound/soc/sof/sof-of-dev.c
@@ -13,6 +13,7 @@
 
 #include "ops.h"
 #include "imx/imx-ops.h"
+#include "mediatek/mediatek-ops.h"
 
 static char *fw_path;
 module_param(fw_path, charp, 0444);
@@ -50,6 +51,15 @@ static struct sof_dev_desc sof_of_imx8mp_desc = {
 	.ops = &sof_imx8m_ops,
 };
 #endif
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_MT8195)
+static const struct sof_dev_desc sof_of_mt8195_desc = {
+	.default_fw_path = "mediatek/sof",
+	.default_tplg_path = "mediatek/sof-tplg",
+	.default_fw_filename = "sof-mt8195.ri",
+	.nocodec_tplg_filename = "sof-mt8195-nocodec.tplg",
+	.ops = &sof_mt8195_ops,
+};
+#endif
 
 static const struct dev_pm_ops sof_of_pm = {
 	.prepare = snd_sof_prepare,
@@ -130,6 +140,9 @@ static const struct of_device_id sof_of_ids[] = {
 #endif
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_IMX8M)
 	{ .compatible = "fsl,imx8mp-dsp", .data = &sof_of_imx8mp_desc},
+#endif
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_MT8195)
+	{ .compatible = "mediatek,mt8195-dsp", .data = &sof_of_mt8195_desc},
 #endif
 	{ }
 };
-- 
2.27.0

