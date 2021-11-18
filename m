Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 685954558AF
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 11:11:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0819918D3;
	Thu, 18 Nov 2021 11:10:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0819918D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637230295;
	bh=zQbXvfYFyhIYzlOkKhAzmdkOkOeGPEY8V059DXnt+5Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=efUkFu/rvA8ydO/MB1SoC2Gzhb1O9vrMLS+2X1KsBoYCL/wce92LX9pRsEyl0Gxiq
	 D7DZ3Cfwi07dNIrELqsdr/njJQQloCWExQGJREQWywnlcYKp8AKCz1Khg6iMwFtqhS
	 20isskUXwGz3xEqyvsW8tafmmqw62IrbmEfWEp68=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9F55F8051B;
	Thu, 18 Nov 2021 11:08:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40AD4F804FD; Thu, 18 Nov 2021 11:08:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F554F8010B
 for <alsa-devel@alsa-project.org>; Thu, 18 Nov 2021 11:08:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F554F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="RSaVGktF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lrg5YO3U9LqWq3NXyhOMMQziaIh5SwdQpaPWY6gN+ogiPqb+ssadqAg5XAjUMFn9Ee8hAob3c5Wy9Z4EnVYxBC8DpYmBImXCxk6i9I+wzn6wPgaVuWg+NXW//WFCyBq0T3tdlCqCt5V1JdMgYM/TF/lWpq/pAjMKcMYMIXgOZq6bUMVH8buQNVYhn1dUGGKmw8+cikX8puiEnTEsG///zbL7m5wO3WKHJMKifMItkb6jVR2o6MZiZcXwJi5iTpr2MeM7PEdGXFdCtbZFt6n01qLmNlBNYUPJecXgT01cwhqG9vhcwwpm3wjOVEhZyO5F+bQ+1M4UiexgC56vRZ2cZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rLHhWr+VMdNdo8jPTd1t8rCkBuoynNxwXMACXCxzpw=;
 b=MJT4I1dWleiV94SlX6EWBogPwiN36iaOyny6rp6IF+XVqfVyeS/HfGJsOIMS/BycDPxm0xMODaZMkxFsSpe1hComB63I1igJ6hMdQamKKO88LjOYlw/76zcfffc31+PSoQ6JXN/a0BVYBdTp99EpX17wTxPY0fy1isy+HkhgJUs1p6iHmLKKwH6tSBaRB97HQur2PYReLCGbRJ8IdOTmR0zfBwefjfgUi/zRqmRBA+AvX8WDfYxXEt3K09sG+zi+r5AQFDi6YQA0ByXQvrg4PBUgk69N1fHQ5Wkbp/vWJGLG7KmWmrQUw47jg9wIC6WuutwJQIWf3eB/A3RCHrIQhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3rLHhWr+VMdNdo8jPTd1t8rCkBuoynNxwXMACXCxzpw=;
 b=RSaVGktFIeSlLmpaWLVFGHM/VDxzHjru4RttE8UQciC2lUP15+ZIvsg9mJ61cGrJPJPejHhYLWlHKNy64m0h5ODucAj9lXHmYLLQKQmdG6Sq5UFAr7rJdj4950jKhJRTD4rghWwL0zIKtT8VL/WXoGUxW8Xy+Tg36RApXlo9IEQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB4285.eurprd04.prod.outlook.com (2603:10a6:803:4a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 18 Nov
 2021 10:08:17 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Thu, 18 Nov 2021
 10:08:17 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH v2 5/8] ASoC: SOF: Add mt8195 device descriptor
Date: Thu, 18 Nov 2021 12:07:46 +0200
Message-Id: <20211118100749.54628-6-daniel.baluta@oss.nxp.com>
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
 Transport; Thu, 18 Nov 2021 10:08:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 094c7214-8390-4b0d-2d27-08d9aa7b576c
X-MS-TrafficTypeDiagnostic: VI1PR04MB4285:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB42856CA85FAB670BEF93DA8DB89B9@VI1PR04MB4285.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +Rnrvj67/Xvipbu2Qx9Kb22RSryCoM8t6aqTfjqrOwWuRlpidHWjRDCY5qRtRxU3EzqM1RTdUAMD0Xt7bfw99oB4yzl2i90bc0IY+Q44BH3ab7+DRm08f5mZnxjQ4o8iI2/4dfEmJKLK0+WkNbBOx25NkZW1gB5wgKxyjsUQC+pMnXu9e+9yMRbdtfXbUQ01fOtnKTyGBnJpCgklN48gnVbeg27nvdq6TAIU4SrMnaDs1LsKpm6XNnhDeHDSgihugEGbIFBh+72LLbkLvd4f0TNnxbpk6NgjnU86C4JpnSsgIXJd6T+yi2CCXNj+X3k/vnf3tWmEdeK5lTc8oZXYi1Ll3v74rtzawhU+dzndBfE0XTyDxpDX0AZCSPPeE5m0GgIVWJu/rZdOhR02IWehObNbx0AlFRuy3E5av9bLTgzgyT+KrJrjbYKMZQzimLdm3rBLQKc+YxHNRdzFKGeK1uretj4SwnSU+7amyntTCzNDv0GnRrflhfmn9zt0RTpWTFZaqg71iLo+A2gbeloz7A8hxIbO32TDCWhJeU4IPBODIFvNYSRcnAvBJ9vLzJPnl/AWhxPDUz558wLJp9TrKYNN3q85BLQOkXrTTJqF/J8E/xmX18RGIQuybHroKXFdAKT5BNJ2jNAcMRTMiJlQBg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(54906003)(8676002)(2616005)(4326008)(44832011)(86362001)(7416002)(38100700002)(316002)(508600001)(2906002)(52116002)(6506007)(6486002)(1076003)(6666004)(66556008)(8936002)(83380400001)(66946007)(66574015)(66476007)(5660300002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2RpVWJkemJWOXV0a1BteUM4ZWx4MW1TNFlrY01QdkNKdmhQMW5mMzlwUDY5?=
 =?utf-8?B?SGU0THdhU2VtVERzbDlBTVVrYXpkbjRXNDhFK2lmYzFqWGxxVFNNd0ZtdjY4?=
 =?utf-8?B?dzhRK3hFR0NBTXowZ09ZZ3lDK3VXUmxzMjlRakZneW1GQXJnY2xNTDhpYWx0?=
 =?utf-8?B?VGJHalJmV1JySnB5YWwwVmNzWGdIK2RKUWxxZkxyRHJzeGUrNW5RYitwNy9v?=
 =?utf-8?B?R3RJN0dUakwvV2FBYTcxODJMejZoSWFwRkFmNFl4aFd4Z3B1REhrWVk1V0h4?=
 =?utf-8?B?bU15NVI1UE1sS1NmMHdLOXZhZU9iY2ZvU1Q2N3QraWovckZuQzhRQ2lIUFU5?=
 =?utf-8?B?RGpQbzhTamNQV1pOQzhkUE0xZTBFdEU4TEVMTGZFQ1RtQ0tFakZDRnJha241?=
 =?utf-8?B?RTJyaWtXeWtBZkhlb3o1RnRCVmdJdExqb1QrbW5iZk9vSnhsbVFhQldHV2hN?=
 =?utf-8?B?Sk1BOGUyWXhUZ01KZjcxODJ4Q3FyRG5zejMzNjNVZE9iaCtiU1hEWi9zWlVN?=
 =?utf-8?B?cmloLzVWZnZmbU5MM3ZPcFRMc3ZQRWdaeTZvVUREMWFyNmoxankxejU1bEdx?=
 =?utf-8?B?cDNmNVZCQVZ0TDhaR1piS2lCZy94SHZCT3h3YXFSUmxOWlYxSUZacVVwZDZN?=
 =?utf-8?B?czViNjB5VUNERzNmRk5yZUpONWF6U01BT05LRXUxQ2N2Ry9hMVg1ekVBOGd3?=
 =?utf-8?B?ZmJxZ0xEY2doZ1I1SUY5Z2tZT0dsZXFHWHB5eWl6Q04zZlRVODNwemNlZmtZ?=
 =?utf-8?B?N203TzIxNnRQdXkzR05RdU5MYUpmT1dPMGY0ejJ3a0dZaG5LVUM2eitQVWFL?=
 =?utf-8?B?MnpnbHBUeGt3TW9tR2pueWdMM1JCeGZkdmtYdlVsc1VHOUdNS3dDdkpwN2kr?=
 =?utf-8?B?Rkt3b1FJZ0NhclR6M1BVcUo5TTFWenI5RFpQVEcyaVp1ZnhnZW9yRzRDN0lR?=
 =?utf-8?B?N2hQYk54WUpJeVBoNmNidS9BaE1kLzJaUHRpdzNWY1VSM3pkc3BlMEFMSUll?=
 =?utf-8?B?Q2hESUk0M1pFVWhGWDd3Mm94dm5tUVVnN2dENzNpYVA4MVdmRUxwVThUOEgx?=
 =?utf-8?B?aHdHbDdJbXNvcEd0b3FsZ1d3THd1VUtOMnRGSE0zVFNvQTFiQ0U0NGFWQ0M5?=
 =?utf-8?B?bHIzSFBDdVM2ZkRPRjlubFo5TS8zQnhPWGUreHRab1plNVo4WmNQeHlrUU9r?=
 =?utf-8?B?M2phZ1BUdFI3WlJXQlhXYzBYMTRPYTZLZ2c2aGdVWVNsR2ZUWE51amJuczQy?=
 =?utf-8?B?Ti9nbXY4Rkl1MUtKTTdFcURadFQ2R25rZXNBWGtkbFlZa3I4aDFycUdPTUlN?=
 =?utf-8?B?WkMwQkdqeVg2WlBMemNYOTg4TnR1WmdTeVcvb3VKS1RIVTZiY2wxMk1adUZS?=
 =?utf-8?B?R2tKdlVkY0RRNVR1SEJTTU9kazUwODYxdktQN2ZpY0dOUnB2MWhBa1RDRFYr?=
 =?utf-8?B?ZjNuc1ZrOHZmbktWN2lVMEZzellqRmFHVUt4TDNBTG1rdmtnazkwOFpFUFMv?=
 =?utf-8?B?SUxTRXEzR2tGQmZRajhjWlY5eGhDSlA0aHRaaWl3cHB2dEJBOFIyRG0wRXpR?=
 =?utf-8?B?Z0F0cXZ2YUs5NXNGVitXZkdiejhLZlYrQ01sVWg2WFhXTXdrRkZ5cDNEbXJh?=
 =?utf-8?B?UnFFU2VReFdUYmJ2Rmp1MTN1bzBKUllvTTUwQUZBeWhNclJoSW9TbitZMGZ3?=
 =?utf-8?B?MDNTaHVLOFZMaGY1anBXemsySm11ZENhbDhRa1NPMCt1R0xteW93NmY5UGZw?=
 =?utf-8?B?MUNyVlJQS3Q1Zjc1MDBIUWtNRmtPN2IrQWFDd1Q3WDRVTGtqTlJWT1E2VlZS?=
 =?utf-8?B?cEdPWWxDN3RzNXA2UTVrT2YwREIwd0dENmErcVVXRXJNNGVPSDkvaGZZZWpL?=
 =?utf-8?B?NXhXaWRPSHRBeElGZHdzU0RTeW9maUliMVlZRUo3RjFDekxObHUzUVFOeTF5?=
 =?utf-8?B?N2VhandMZ1lITVdiQ3EzNldtTnhOWVBhWGk3WXI1YXlXZGxsUWtvT0l0SlJN?=
 =?utf-8?B?NTdYNGhmVUdDYy9ncTV3bFBqbk00ck0vZ3Y5a1grakx2MWluUDBXTWppanVL?=
 =?utf-8?B?WWlOOTdPZE92c1B4NEZ3N3J4UlJia0c2aHRQTkNzM2pyaVFvekU3d2lwd3Js?=
 =?utf-8?B?VmMxcEdobEJVd2drVzhBT3RFbTFaeit4OENQODNaNjkrVFBqZ0I3RkxpVllC?=
 =?utf-8?B?eEJNWkx2Wi90TjhRVVRDb1RLdGFlNnB0SGliTlp1ZTYrSGZSKy9maTJPc0Zt?=
 =?utf-8?Q?J16VQbDAGuEQTPuhMXbJNDsjwFlN0Z2V/jH1ABDd7I=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 094c7214-8390-4b0d-2d27-08d9aa7b576c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 10:08:17.6860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eEGDZ6b8T+UBdIiSIcSO9obVDGbqmNjZjTQaT56h0drVS4VyTmxfJAzTu+BXEtAy/iEl0pwSbt5wgIiRKmK1KQ==
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

Add SOF device and DT descriptor for Mediatek mt8195 platform.

Signed-off-by: YC Hung <yc.hung@mediatek.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/Kconfig      |  2 +-
 sound/soc/sof/sof-of-dev.c | 13 +++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index b0cdabcfdde7..ac34c330cf0c 100644
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

