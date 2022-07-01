Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EEB562AD2
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Jul 2022 07:20:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21AB516EE;
	Fri,  1 Jul 2022 07:19:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21AB516EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656652828;
	bh=wM1fpiHKwvk/e3CNfppoKkBQUw/crB6n/f1t9XhHpC4=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VPwCS8vHB448ppOAp8jR2L7qv4i1Rh2DLgaZXiZOdUsMDw2SiHwv8IbkwrTgnE1gT
	 ZBMzXzJ5e7STRsuWt6zN1eS0GiRACDETib7CTH+AzH/gjuHimFt7d3UcnqksJN19RN
	 SUBacGitOmB8rupOZyW696txHRPrl/APhmf2kRg0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B628CF8053E;
	Fri,  1 Jul 2022 07:18:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62262F80152; Fri,  1 Jul 2022 07:18:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2130.outbound.protection.outlook.com [40.107.113.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C767DF8047C
 for <alsa-devel@alsa-project.org>; Fri,  1 Jul 2022 07:18:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C767DF8047C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="JH8ANfEB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=noQSApzN79Hm/QuYNmkX2wJfKnBhVTOcK2RQYZYqkT/Bp79SVT34/awJQd5MPEB0rVS5iCIuXWdGmEuIwshWUR0Y9xb5hL6h3S75OV2Gxf0rQRYCsOComEGTUfQn08oxMvMUwUIvBLmtJV8rdKP0xP/AbFYp6W8OxgguEwXXL3Vx/lo4EySUkS6a/xe9Q6aLMNW45cACzZru/FGu0wqywVcWbTs9b0xBsuJbFBirUyRxFk5wJCGeOgmMSxLgtzJwDxnZDYHfwzqpE32Xc839lwtUunAsnmExlROU4kn7IFKX2LY1VG6HgeTr+jOU/B63yGqUWVkbAWS1y5rOZwJlfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=koknkcwlOh2Je91vYUIN1LSLDgcKSdtrEMkhqKFoWK4=;
 b=nPJpR2uV1Ki5hC6K0udQSj7G+8mLcVydKFYCijWyUJ9SgdpLowZoM6ASMNZ4xGCQZT//lrdXWHVygD+j+rFBgbct/F3ge9wbMPUdnwzAue7i7QZ9sFm8nY+g1KuhSkdErSMoPGEFsi/dnvSXkV+5qT4KGV7kpzQ7uXD8GVwi/yXnf3ZpfP7/P8IqAuMjuck4OTTYB4QnvfXUZCyC0EWPNXzP7K5qgtU7nrRou8KrhtPaTTbdhM/iWzMfSclS0SbPiLWcM8fUZ2kQxmep8v0hwDtJM8RplRkafzVi2wMzm/WwvGXB7dk+SG3daJd2Ad5BM146YNv026KHxG48olGhog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=koknkcwlOh2Je91vYUIN1LSLDgcKSdtrEMkhqKFoWK4=;
 b=JH8ANfEBOirrdln2XbYy71fbfwEv++ZL7gwf57H99ocqghr2qC6ZH/24WamHb8pqmbiennCL4eAQMOLas7NW+TNoULWSOSkGk9EikHU/Z7iBrShZFDyWQjrA/y2FfoBt9d83vuxI7Luc9QenOYFW97YzDPGvwciZ3hMnFTenGPw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSBPR01MB2776.jpnprd01.prod.outlook.com (2603:1096:604:12::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Fri, 1 Jul
 2022 05:18:35 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2%5]) with mapi id 15.20.5395.014; Fri, 1 Jul 2022
 05:18:35 +0000
Message-ID: <87czeps95h.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 4/6] ASoC: audio-graph-card2-custom-sample.dtsi: add verbose
 explanation
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87ilohs96p.wl-kuninori.morimoto.gx@renesas.com>
References: <87ilohs96p.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 1 Jul 2022 05:18:34 +0000
X-ClientProxiedBy: TYCP286CA0070.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::14) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94041c79-d748-42b1-49d5-08da5b212574
X-MS-TrafficTypeDiagnostic: OSBPR01MB2776:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8QLjQrHAdR84YeGQZyd/w20+7LLnBuU2zGlcpdMCIzujhBsqIxXjdiahO8OSwm9NbQa7WsuCujVtj1f7IXseXa1A9S4kZ7qQcleQWqp2TxjmpEsYIjmm0vSNLJa5UTjn0iehViu+kbIgM0p053wPo+ZsWLDudWT5InK/ZkZN7AXCMGE8uQpQmManM73cF0G5v3a95+LDGuNXuQ06TJHq75JYfs+2GJ/y5gUtnyVnZOho1kaErYLPi3IiO/+HRBweBafryXC7Yg5KcCR1z81Umc87shGgC2Lh7lMvRbOvTnxnvj3/ReQuO4PDE+kUabkCFHBFYUAdpK95U5MMXYR/UhtuF3Uu5EkFFec63O3TN75cP7VM5OQAB9eoPB0DK2mJWK1xu97MlC2nt1ktiaxNaabluLhO7rWDut417pEKuW4HiKOoz86MsA9ptYEsxGeyImI19b9Mf2mvdzuCAu9uGCiuaitWjO/ASSeRb+f94zmiCzN8rkk+Vv+S3quEPzmwN0V2iavFbLDFL8reptRaIzn0YZ4CY3OePo5L52z6EApBChFR0jDOZVEew3XtSeaVstiT0zJs7aMqGtITsWAqqQ5VpbldfgIeQrq81q9AWWnXSdaAc49yKpQYWlQlPW/u4dGylbMW06xx1MWpqM6xGUaLd2BX7COcm4cEYqx0MQmU36wMuzuXJ2HNfAHr3y9RAvUDs7z2B3sMz7JGgCKDCdU6cJ95VCkkzr9sp5Jmrk6ufqW1ityQGhFj5JIP7BdCLFb6z9Lgk9wRXIgLsZTPsnt3STcQcSNDf8gIdbTExNZ5+c2TAjtS5fpMota4JKNZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(316002)(26005)(38100700002)(8676002)(41300700001)(38350700002)(6512007)(86362001)(6506007)(66476007)(66556008)(4326008)(478600001)(6486002)(8936002)(83380400001)(52116002)(6916009)(66946007)(2906002)(36756003)(2616005)(186003)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FTXVzXUDkkcp7E4+j6aXXJH4MGdwr3kQ4Ppt6/n8Bjdx4kjXSagBVbIECaGJ?=
 =?us-ascii?Q?e9xQfGg9js3T9iiw2dLtIjbATMmwMF6Mb7B6agz39fnO+nJEs2/wj6dVnqcv?=
 =?us-ascii?Q?khBZLiBk5O18+BQkqTnJbeys7ZJ+SvScXZjjqXScIQgSh0YOVC8c6UE1b/61?=
 =?us-ascii?Q?/lDB2wpDrxuhsKFHAMOe2dcK7kYHV/H4MV0erRuEnS5d9oz6nTBBp5B5qKML?=
 =?us-ascii?Q?IS5zPFbuZaxo+g96U3Dp3/Jf/5QUwWG5lJk5AP9Ege3zDMLDSXY0yDlc6u8N?=
 =?us-ascii?Q?TtaC+1IWZ9UAZSVKcsGGRQ82LduG8YBt70y1Fc5PVryY6UCLvulp1OuEdYFa?=
 =?us-ascii?Q?kreGh6fkZZdrDYgfOayFTCSVTzMiLXuPxw0TPDDtCIDPQSQsJviDfqzhzSWx?=
 =?us-ascii?Q?zMijgY/OvjzHERW6/yuKT6OxwbZqiBsthSVANWDqTWmCUyiFy8nRblEMNdn7?=
 =?us-ascii?Q?dk6+U8UYvBY5f9xa/zD8GL+aRi2uUdB5pmGat9f61vgcq9/YN4w1DzBH4mqX?=
 =?us-ascii?Q?FSkn4/Dtq4Hi5Wzu1L+mF/i9peg6P+QBKnDh043SEa6dV538n8vs3IPl1qVQ?=
 =?us-ascii?Q?1aYSYmAeTQucdn5WH1uXaIT86kaybU8lTKNVLTfbN5l1g1sG7iQ6vzGMua57?=
 =?us-ascii?Q?NgXbiRo5i/3QyzW6dHrqbz+29Q7lbnUBay1jFB+xZnxGWIE/x9uOFNBJOJ5y?=
 =?us-ascii?Q?nEdD+0kGpo4GvFiKcjsRl+bdf1TOZg+EVd4STmEMcI4c7k99iO7vuSplDomy?=
 =?us-ascii?Q?yEPwFV1em4w5TER40mnOrksvt+cekT+t+HZeZF9JYFvR96jmxd61rKtoDVTe?=
 =?us-ascii?Q?CcBi4vS1/fE2spMdGL274op4ptt65Jhr14dSkrq9OZ6MbttwtTBKit+mYtaB?=
 =?us-ascii?Q?WZnxDDEztZVTPcYdDRV2i1ZXDGTfB2C/gs6mlgiqB86uTXwXTh4lyJ8Jj/1S?=
 =?us-ascii?Q?XTFrsyJjw+83xgKc3G/5LqHiXJuquY4vW8jk2682jRtGdq/RLbO638LRSNQ1?=
 =?us-ascii?Q?Q7lQnqJi+I51i6vw100MVT0hnae6REZ4E3Sdum3XWfwqVWME5np/UcCjx/ug?=
 =?us-ascii?Q?8zCEiCFo6wZa4HOV1eF6cyW3UHgYXP1hJhTFxJxJn2LaNO59/8sDIlvyanv+?=
 =?us-ascii?Q?rxIqjV5lTNP7ihWqNgEKfYIlETEaeoK9iw55nKJYq9rZ9i7Wafx+A4fzMQpl?=
 =?us-ascii?Q?zU2p9CmDipmqN/+kMmjG7g+mQmvA01qVDoSfCrCch1l5xF3Z5NrRZiZd0DEs?=
 =?us-ascii?Q?BOZTn9gC8QeKuWEMftkXkMOhKyPiZy0O1fXftyK6OvXDqqN3/YwBqQtvIOwo?=
 =?us-ascii?Q?Ncwt6XoLCBWOewKYZx7AAj7etGU3bIATqVUqPfqpshrPnPqGejFBJShJgRSP?=
 =?us-ascii?Q?nXN0eN2ZmljMk4sgHJjZ2OiRLLq8RatQoFBOT5M4uDfdBGpOutqUhnYllAKE?=
 =?us-ascii?Q?Hj8CuetydEIHUzqsmBxcReN48LUHFXwsdAFaTG1liWtNarB71Vk8Nun3Mlcu?=
 =?us-ascii?Q?uPDWqUfbhJkHdmJ9kkHvc08JrkvrTZ+qmkKw+S2Gib1DvoIcw5MQ/wosTfES?=
 =?us-ascii?Q?pLFHDMT2gMtF8+JL5SngSiRqHnJiDhCLILfNRJa9sEUmptGSP8LQga9wIiva?=
 =?us-ascii?Q?Gajk6nLUujoIKR+nT5n1u0s=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94041c79-d748-42b1-49d5-08da5b212574
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 05:18:35.1941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KMQ2Q2w/0b+tBYh5EuzF9ikuFbg+ykLgyeEi7P5CaNnIhthXXI42MD1Az6W0/1eejk+Vu1DANGLu/ELgTtIfqd2AfWxilZxw6TrkA4qfj85lUCV11LDPs/gAmDQZ0/Gc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2776
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

audio-graph-card2-custom-sample.dtsi will be used to test
Audio-Graph-Card2 behavior. But it is difficult to say that it is easy
to understand, because the comment/explanation are not so many.

This patch add verbose explanation to it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../audio-graph-card2-custom-sample.dtsi      | 98 +++++++++++++++++--
 1 file changed, 90 insertions(+), 8 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2-custom-sample.dtsi b/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
index 053d987a1fec..fe547c18771f 100644
--- a/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
+++ b/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
@@ -17,6 +17,23 @@
  *	CONFIG_SND_AUDIO_GRAPH_CARD2
  *	CONFIG_SND_AUDIO_GRAPH_CARD2_CUSTOM_SAMPLE
  *	CONFIG_SND_TEST_COMPONENT
+ *
+ *
+ * You can indicate more detail each device behavior as debug if you modify
+ * "compatible" on each test-component. see below
+ *
+ *	test_cpu {
+ *	-	compatible = "test-cpu";
+ *	+	compatible = "test-cpu-verbose";
+ *		...
+ *	};
+ *
+ *	test_codec {
+ *	-	compatible = "test-codec";
+ *	+	compatible = "test-codec-verbose";
+ *		...
+ *	};
+ *
  */
 / {
 	/*
@@ -101,35 +118,74 @@ audio-graph-card2-custom-sample {
 			  "TC OUT",		"TC DAI11 Playback",
 			  "TC DAI9 Capture",	"TC IN";
 
-		links = <&cpu0			/* normal: cpu side only */
-			 &mcpu0			/* multi:  cpu side only */
-			 &fe00 &fe01 &be0	/* dpcm:   both FE / BE  */
-			 &fe10 &fe11 &be1	/* dpcm-m: both FE / BE  */
-			 &c2c			/* c2c:    cpu side only */
-			 &c2c_m			/* c2c:    cpu side only */
+		links = <
+			/*
+			 * [Normal]: cpu side only
+			 * cpu0/codec0
+			 */
+			 &cpu0
+
+			/*
+			 * [Multi-CPU/Codec]: cpu side only
+			 * cpu1/cpu2/codec1/codec2
+			 */
+			 &mcpu0
+
+			/*
+			 * [DPCM]: both FE / BE
+			 * cpu3/cpu4/codec3
+			 */
+			 &fe00 &fe01 &be0
+
+			/*
+			 * [DPCM-Multi]: both FE / BE
+			 * cpu5/cpu6/codec4/codec5
+			 */
+			 &fe10 &fe11 &be1
+
+			/*
+			 * [Codec2Codec]: cpu side only
+			 * codec6/codec7
+			 */
+			 &c2c
+
+			/*
+			 * [Codec2Codec-Multi]: cpu side only
+			 * codec8/codec9/codec10/codec11
+			 */
+			 &c2c_m
 		>;
 
 		multi {
 			ports@0 {
+			/* [Multi-CPU] */
 			mcpu0:	port@0 { mcpu0_ep: endpoint { remote-endpoint = <&mcodec0_ep>; }; };
 				port@1 { mcpu1_ep: endpoint { remote-endpoint = <&cpu1_ep>;    }; };
 				port@2 { mcpu2_ep: endpoint { remote-endpoint = <&cpu2_ep>;    }; };
 			};
+
+			/* [Multi-Codec] */
 			ports@1 {
 				port@0 { mcodec0_ep: endpoint { remote-endpoint = <&mcpu0_ep>;  }; };
 				port@1 { mcodec1_ep: endpoint { remote-endpoint = <&codec1_ep>; }; };
 				port@2 { mcodec2_ep: endpoint { remote-endpoint = <&codec2_ep>; }; };
 			};
+
+			/* [DPCM-Multi]::BE */
 			ports@2 {
 				port@0 { mbe_ep:  endpoint { remote-endpoint = <&be10_ep>;  }; };
 				port@1 { mbe1_ep: endpoint { remote-endpoint = <&codec4_ep>; }; };
 				port@2 { mbe2_ep: endpoint { remote-endpoint = <&codec5_ep>; }; };
 			};
+
+			/* [Codec2Codec-Multi]::CPU */
 			ports@3 {
 				port@0 { mc2c0_ep:  endpoint { remote-endpoint = <&c2cmf_ep>;  }; };
 				port@1 { mc2c00_ep: endpoint { remote-endpoint = <&codec8_ep>; }; };
 				port@2 { mc2c01_ep: endpoint { remote-endpoint = <&codec9_ep>; }; };
 			};
+
+			/* [Codec2Codec-Multi]::Codec */
 			ports@4 {
 				port@0 { mc2c1_ep:  endpoint { remote-endpoint = <&c2cmb_ep>;  }; };
 				port@1 { mc2c10_ep: endpoint { remote-endpoint = <&codec10_ep>; }; };
@@ -138,26 +194,34 @@ ports@4 {
 		};
 
 		dpcm {
-			/* FE */
 			ports@0 {
+			/* [DPCM]::FE */
 			fe00:	port@0 { fe00_ep: endpoint { remote-endpoint = <&cpu3_ep>; }; };
 			fe01:	port@1 { fe01_ep: endpoint { remote-endpoint = <&cpu4_ep>; }; };
+
+			/* [DPCM-Multi]::FE */
 			fe10:	port@2 { fe10_ep: endpoint { remote-endpoint = <&cpu5_ep>; }; };
 			fe11:	port@3 { fe11_ep: endpoint { remote-endpoint = <&cpu6_ep>; }; };
 			};
-			/* BE */
+
 			ports@1 {
+			/* [DPCM]::BE */
 			be0:	port@0 { be00_ep: endpoint { remote-endpoint = <&codec3_ep>; }; };
+
+			/* [DPCM-Multi]::BE */
 			be1:	port@1 { be10_ep: endpoint { remote-endpoint = <&mbe_ep>; }; };
 			};
 		};
 
 		codec2codec {
+			/* [Codec2Codec] */
 			ports@0 {
 				/* use default settings */
 			c2c:	port@0 { c2cf_ep: endpoint { remote-endpoint = <&codec6_ep>; }; };
 				port@1 { c2cb_ep: endpoint { remote-endpoint = <&codec7_ep>; }; };
 			};
+
+			/* [Codec2Codec-Multi] */
 			ports@1 {
 				/* use original settings */
 				rate = <48000>;
@@ -180,11 +244,18 @@ test_cpu {
 		ports {
 			bitclock-master;
 			frame-master;
+			/* [Normal] */
 			cpu0: port@0 { cpu0_ep: endpoint { remote-endpoint = <&codec0_ep>; }; };
+
+			/* [Multi-CPU] */
 			      port@1 { cpu1_ep: endpoint { remote-endpoint = <&mcpu1_ep>; }; };
 			      port@2 { cpu2_ep: endpoint { remote-endpoint = <&mcpu2_ep>; }; };
+
+			/* [DPCM]::FE */
 			      port@3 { cpu3_ep: endpoint { remote-endpoint = <&fe00_ep>; }; };
 			      port@4 { cpu4_ep: endpoint { remote-endpoint = <&fe01_ep>; }; };
+
+			/* [DPCM-Multi]::FE */
 			      port@5 { cpu5_ep: endpoint { remote-endpoint = <&fe10_ep>; }; };
 			      port@6 { cpu6_ep: endpoint { remote-endpoint = <&fe11_ep>; }; };
 		};
@@ -207,16 +278,27 @@ ports {
 			 */
 			prefix = "TC";
 
+			/* [Normal] */
 			port@0  { codec0_ep:  endpoint { remote-endpoint = <&cpu0_ep>; }; };
+
+			/* [Multi-Codec] */
 			port@1  { codec1_ep:  endpoint { remote-endpoint = <&mcodec1_ep>; }; };
 			port@2  { codec2_ep:  endpoint { remote-endpoint = <&mcodec2_ep>; }; };
+
+			/* [DPCM]::BE */
 			port@3  { codec3_ep:  endpoint { remote-endpoint = <&be00_ep>; }; };
+
+			/* [DPCM-Multi]::BE */
 			port@4  { codec4_ep:  endpoint { remote-endpoint = <&mbe1_ep>; }; };
 			port@5  { codec5_ep:  endpoint { remote-endpoint = <&mbe2_ep>; }; };
+
+			/* [Codec2Codec] */
 			port@6  { bitclock-master;
 				  frame-master;
 				  codec6_ep:  endpoint { remote-endpoint = <&c2cf_ep>; }; };
 			port@7  { codec7_ep:  endpoint { remote-endpoint = <&c2cb_ep>; }; };
+
+			/* [Codec2Codec-Multi] */
 			port@8  { bitclock-master;
 				  frame-master;
 				  codec8_ep:  endpoint { remote-endpoint = <&mc2c00_ep>; }; };
-- 
2.25.1

