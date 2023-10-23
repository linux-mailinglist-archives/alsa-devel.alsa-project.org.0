Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F5D7D29CC
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 07:51:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC07A85D;
	Mon, 23 Oct 2023 07:50:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC07A85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698040292;
	bh=JIftVMUTHyucbnO76pE0xCJuHGyFH8buKqCmRIpjtdI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jTEMnK/MpB8Y179jGJG2Z8Mjwo3vN4lP1TijaAviw6ZPlGKJWSt2WGKO9Q9YTcezh
	 MSX8QvGcPDh6JVPpVAiZeA/2a8S2w8dbL5G8TUSvLdjpKwYHcMUwaGGQ0EWZTKw9kt
	 7Gx2UOUQrA60+aM85t9KCtWiRflIb/EG65+MUhu4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79648F80564; Mon, 23 Oct 2023 07:49:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 943B3F8055B;
	Mon, 23 Oct 2023 07:49:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09BC3F80527; Mon, 23 Oct 2023 07:38:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6CE2BF804F3
	for <alsa-devel@alsa-project.org>; Mon, 23 Oct 2023 07:36:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CE2BF804F3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=P+/FX+Dq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YSoVASmgZ+MXqAJj6NDdjsP1lMt8Iflbs4CW+9YG76cX5WLoruPubHNVmYe3NbrGJ7nTxX/8F9QnqhdRI2IN5fhZzK1fsyuCeJqdqSU1Bnh9qoj3dBdaZmKoTTMyx/HdimRbp2wgJzqZkwV0NsGJzzxxkbg5oNpB1xq0IB5DjD3Em6jecXaOn4M4/vNCuFwDodHsqP8sUlQ6CpJmKHIb6J6iG+FjNQsYJHaiahdq9e2FzMWgipYnAjoB1iXIBkEx4Tn3WDgxFpH8XPal1OzMWglqdDSd9uDTUDT5PFthzqKr9jM+P947fJVxsrk2n2HNHnF826ZG6lFwq7DsY69JVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AM7EnB83jtlSKLAmJEJGQftdO29zDX7nmWMdLsNRMT8=;
 b=Myfz7/Yc+CzF2e1gS1seiHqnmTE/mm874lzlbZ00nWNeWXY2lmkJSw8DrrXeICS5LdUzV1+Hj0tLwLuZ3AxkBw8DI9b9XDhGSzZ02Qiy5iwP4oW1xREndNrqGEHgMjTykg+JiK8MyD77eYCJi8Avc0q/pCuCCbh7sA9ETc/1eK+KYk2DSgFPKIP3qtTqHAbXI+ps19BhAK0cnQbevqP19RMAlPiKFOdLDCF15SetSK74+m8NoH14l2oa9tng0+o2WQaLRid921h+eAh+rAHaNI7XzjtbO0qCWelNjDQNWNBgbV2NjtcyDjE34ZhRiKjVz84jN56JY95O4DOcqEeGWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AM7EnB83jtlSKLAmJEJGQftdO29zDX7nmWMdLsNRMT8=;
 b=P+/FX+Dq4XN1wtybuSwOLLQBNMwR1e9sjYj9GkSXjIbaeIW8yAPEI6UXzLfw96+yQ1l/KKs9hcrOUl47Dm5w6YoN+hGp0k3jJ8go3mtB5hLDEkPkZSVeoX7vMfqwf5rOp99EjjnAEL4fQyfqD1WDR7gP3kAknVU0w6sZpdUdb2I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8242.jpnprd01.prod.outlook.com (2603:1096:604:174::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Mon, 23 Oct
 2023 05:35:55 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::be8:b648:c989:8e7f]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::be8:b648:c989:8e7f%4]) with mapi id 15.20.6907.032; Mon, 23 Oct 2023
 05:35:55 +0000
Message-ID: <87zg09kiit.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 3/5] ASoC: audio-graph-card2-custom-sample: tidyup comment
 / numbering
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	bard.liao@intel.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
In-Reply-To: <874jihlx44.wl-kuninori.morimoto.gx@renesas.com>
References: <874jihlx44.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 23 Oct 2023 05:35:55 +0000
X-ClientProxiedBy: TYCP286CA0350.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8242:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e0f8c00-6e1c-486e-a4ee-08dbd389ed86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	q7XHWOjNYQLezA6dQ66UKQzY3xvc2x4XVlqGcrHf+F0pndESgKuyIugEtg1lRodsE5Ptl44eobk1NTn8+gDq05rGlHCXs3pftTnIX2FOrNv6cv8cFMCvfpo+tqL5kaJgMcR4/IDEDfBXI7AsUEpUeah7VeqUosPTjHan2XHCzG1HjfcXyX3yongWkc1sv/8njEMB8jp2A7V276vOGtbYP99BVFX2DwuyLUaxcgwt444qJmTKE5Doa2kchM3lPXh+HLGNao3MMwFo0A3A2yPi4usWZakD+xOCtNuKSNA5m5vM3FxJuXQvOZfX3Trpcp62dSkzqnk0l+EijYFf7jS+lLfj3zcoPk/1IgogHaDsnxKgGTuRenTNpi1LnZfByvFCK9XvhHPiScVB4PzBUnnI6Px0jgxK7uDulPAI7CUnk6PAqKOAQK9Dq3x63jHt8+8nI6OQPqJsREOuU7PBh9FS6RYHzrDkkG3Cz1B7F5uDPfXEgHVLfQq3WrTq7EY0vUZyroGIQaGYOXiiBt1le9Hl/g9aGa9zglzi8t2nLd9y4Y5VUS5XF2E1l6jEKKa/FP0lWLhGcS6+3sHksPk+5dEhYk6PyM365YTw/fvPuIzEYfeazfECSNZ+kEcauS+5im1/77ip6sqOvKIrIRCGxCdcnA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(346002)(39860400002)(376002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(38350700005)(36756003)(38100700002)(66476007)(66946007)(66556008)(2013699003)(110136005)(6512007)(86362001)(2616005)(26005)(52116002)(83380400001)(6506007)(2906002)(6486002)(7416002)(316002)(478600001)(8676002)(41300700001)(8936002)(4326008)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6M3gFv9fo4VOAmGfEuNqVCRZCWVUsGZzwdLSbTjHQ+3sjadQBnxva58JDS4p?=
 =?us-ascii?Q?rrkomjnJb1uRkFJDA+29A22M39JsVsvFqmAWEaXc+iRbp1tft+cnbDr0tXEn?=
 =?us-ascii?Q?9CXdr78rSLVKz+8DyZG+tqwgGowlXcTPznD4kV4HBtZ6PQ0pbKM3OfZE/RYY?=
 =?us-ascii?Q?JgVw0f/bdUPZYBwpBYmqwA32H4lPWMeQxLchmuXDULEfQn2kVlQjzY+SWGvW?=
 =?us-ascii?Q?iE05hmg0sP83AQEARFdQgcY2eUXtavNaG3hJACY7udNgrwwHeU97ews2EizU?=
 =?us-ascii?Q?yOe3akBeiVP20mjkT0cR9SM0tiSXUZFpKC2eiNoQEO+UgAdjM10QlyTNogA+?=
 =?us-ascii?Q?7RFOBV3Y1UYV1rSiimxrrj5ZtO3lvBp7otLWh97aI0N6qJudeNBsBxlX7IAQ?=
 =?us-ascii?Q?8YSCTGXJVrH9ZOWW2WZltP7xzsiUiOWnt9ZXn37BxFkwSPkoY3zgUZ0unLEN?=
 =?us-ascii?Q?+XCgnb3P7oeIyEwTOC/dPnSd19IIdXxS83xLxHytiNHdtIygKm/ZiTrcPt82?=
 =?us-ascii?Q?h4TaCeFFllywbpP/IT5RFyVDUQE8t5ZvhBoSftSIDSXbXNyWcB8gzL7gBs0D?=
 =?us-ascii?Q?CVpTEIvPcW68xwh3ZEiDfBhSrbiVY7642OSrjk7gyOQJ0tyxPxulGWFTcShw?=
 =?us-ascii?Q?4L0T+tNTYxbTHerjB1sngW2seQsp1PsuMwx4rBqWzrWkfr7eQ4UcgGjRGv/F?=
 =?us-ascii?Q?QRRj+b0eA83CKYe04lmjbsh6Dt5H/gbCMP00Wd8ISjAz6BX2s6sJW29HPneE?=
 =?us-ascii?Q?jGTwGVrfc/xDuEywI1cTCqQhDB40OfXCSLy78tm2SeKla2GvP7tFaKYjvmHC?=
 =?us-ascii?Q?PqkWEUMHvwnYesFD4AGRLx+Keu0o+SbX6C/Ues5rpXOVcoiIm555xP2o9Bdr?=
 =?us-ascii?Q?gwGNJfnvMJE/nFUd7pU0rg4il7rQjjR0aUAsJI3EF7dPXjrrC0xJURpbZ313?=
 =?us-ascii?Q?2paXUe8fWKSe9RxZV4AK9oj5ZPiEuHI9RPlFERMuIwVwsdyqPeZpISR6R4ct?=
 =?us-ascii?Q?j17LlHJF89LNxWCEB4lUiIOrx7kBJEGH5EXJFcU8m+w55QEGvZNzoWBr3aLU?=
 =?us-ascii?Q?fsLxCIKZfACsI4lEAc0js4sY0rIB35CFFg+SpBSqWbEFownzFFkMO4G7g0ij?=
 =?us-ascii?Q?pBuzFh2ixGLbsPFbaVcsCtiqs7jYAHVoEqT71XkKGOPhnxMFP6F9YIJAdjb1?=
 =?us-ascii?Q?wfYEzPWhGDXBdiRRINiRRRVdUNDHvbMaiwyePHGKGr7rzZM7GVwUXO4eANNB?=
 =?us-ascii?Q?sPaQnTA67MCSwzaTK+L4pUJ8/pE8ouus4K93wf0kZNIxTuvHY/nF0ach90nK?=
 =?us-ascii?Q?oNdZ2KU6mEqjHWsFpzu9DZXyYCvLXKA4vD7aOJqJeWMTZeXShVO1F8n6FSpo?=
 =?us-ascii?Q?V0T4Ih+ejcYdfOrzerGIOlEsD28hBY8uOS0aUrccu1iBQNkZD0Sx19ReVi8z?=
 =?us-ascii?Q?Nt36xeCCmNC6jq4AHE7KyGKl3Mo34V8nS4Izfc71mp3HcBkVnExagHFsrza+?=
 =?us-ascii?Q?BmfVCiRptyb7hi9kgjxl/Lj0gKX9Rej43U97halMYOUntXmE+9BpIDJaDxrG?=
 =?us-ascii?Q?qkKtTYLz1pCUS6JAwjPDlJPpizGf2KeWPhcREcCCYqYHZ/rWS8R7tzLBYgx8?=
 =?us-ascii?Q?Tr0aXsE+ya++3l8tbjFSATM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2e0f8c00-6e1c-486e-a4ee-08dbd389ed86
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 05:35:55.3412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 wPtslJISNF1/kkfbop+jNkhNmm/IdT5jxCcyF+FW7z5SXygkUKcM4v2CqcvaKgEmsvpzVB2gxk4znfOVVlpEbSGeCZQRyirtBgO2wjORC7+USM8eK9hQuQ4DajMvCL0T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8242
Message-ID-Hash: LUXRR7ARNPXBMFB55BVKJRVESW6OJHOV
X-Message-ID-Hash: LUXRR7ARNPXBMFB55BVKJRVESW6OJHOV
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some comment doesn't match other styles, this patch tidyup it.
To prepare Multi CPU/Codec, this patch fixup some CPU/Codec numbering.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../audio-graph-card2-custom-sample.dtsi      | 37 ++++++++++---------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2-custom-sample.dtsi b/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
index 8acaa2ddb335..736eca553d7c 100644
--- a/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
+++ b/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
@@ -58,7 +58,7 @@ / {
 	 *			| |-> codec13
 	 *			+-+
 	 *
-	 * [Multi-CPU/Codec]
+	 * [Multi-CPU/Codec-0]
 	 *		+-+		+-+
 	 *	cpu1 <--| |<-@--------->| |-> codec1
 	 *	cpu2 <--| |		| |-> codec2
@@ -144,11 +144,14 @@ audio-graph-card2-custom-sample {
 			 */
 			 &cpu0
 
-			/* [Semi-Multi] */
+			/*
+			 * [Semi-Multi]
+			 * cpu7/codec12/codec13
+			 */
 			&sm0
 
 			/*
-			 * [Multi-CPU/Codec]: cpu side only
+			 * [Multi-CPU/Codec-0]: cpu side only
 			 * cpu1/cpu2/codec1/codec2
 			 */
 			 &mcpu0
@@ -182,24 +185,24 @@ multi {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
+			/* [Multi-CPU-0] */
 			ports@0 {
 				reg = <0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
-			/* [Multi-CPU] */
-			mcpu0:	port@0 { reg = <0>; mcpu0_ep: endpoint { remote-endpoint = <&mcodec0_ep>; }; };
-				port@1 { reg = <1>; mcpu1_ep: endpoint { remote-endpoint = <&cpu1_ep>;    }; };
-				port@2 { reg = <2>; mcpu2_ep: endpoint { remote-endpoint = <&cpu2_ep>;    }; };
+			mcpu0:	port@0 { reg = <0>; mcpu00_ep: endpoint { remote-endpoint = <&mcodec00_ep>; }; };
+				port@1 { reg = <1>; mcpu01_ep: endpoint { remote-endpoint = <&cpu1_ep>;     }; };
+				port@2 { reg = <2>; mcpu02_ep: endpoint { remote-endpoint = <&cpu2_ep>;     }; };
 			};
 
-			/* [Multi-Codec] */
+			/* [Multi-Codec-0] */
 			ports@1 {
 				reg = <1>;
 				#address-cells = <1>;
 				#size-cells = <0>;
-				port@0 { reg = <0>; mcodec0_ep: endpoint { remote-endpoint = <&mcpu0_ep>;  }; };
-				port@1 { reg = <1>; mcodec1_ep: endpoint { remote-endpoint = <&codec1_ep>; }; };
-				port@2 { reg = <2>; mcodec2_ep: endpoint { remote-endpoint = <&codec2_ep>; }; };
+				port@0 { reg = <0>; mcodec00_ep: endpoint { remote-endpoint = <&mcpu00_ep>;  }; };
+				port@1 { reg = <1>; mcodec01_ep: endpoint { remote-endpoint = <&codec1_ep>;  }; };
+				port@2 { reg = <2>; mcodec02_ep: endpoint { remote-endpoint = <&codec2_ep>;  }; };
 			};
 
 			/* [DPCM-Multi]::BE */
@@ -323,9 +326,9 @@ ports {
 			/* [Normal] */
 			cpu0: port@0 { reg = <0>; cpu0_ep: endpoint { remote-endpoint = <&codec0_ep>; }; };
 
-			/* [Multi-CPU] */
-			      port@1 { reg = <1>; cpu1_ep: endpoint { remote-endpoint = <&mcpu1_ep>; }; };
-			      port@2 { reg = <2>; cpu2_ep: endpoint { remote-endpoint = <&mcpu2_ep>; }; };
+			/* [Multi-CPU-0] */
+			      port@1 { reg = <1>; cpu1_ep: endpoint { remote-endpoint = <&mcpu01_ep>; }; };
+			      port@2 { reg = <2>; cpu2_ep: endpoint { remote-endpoint = <&mcpu02_ep>; }; };
 
 			/* [DPCM]::FE */
 			      port@3 { reg = <3>; cpu3_ep: endpoint { remote-endpoint = <&fe00_ep>; }; };
@@ -363,9 +366,9 @@ ports {
 			/* [Normal] */
 			port@0  { reg = <0>; codec0_ep:  endpoint { remote-endpoint = <&cpu0_ep>; }; };
 
-			/* [Multi-Codec] */
-			port@1  { reg = <1>; codec1_ep:  endpoint { remote-endpoint = <&mcodec1_ep>; }; };
-			port@2  { reg = <2>; codec2_ep:  endpoint { remote-endpoint = <&mcodec2_ep>; }; };
+			/* [Multi-Codec-0] */
+			port@1  { reg = <1>; codec1_ep:  endpoint { remote-endpoint = <&mcodec01_ep>; }; };
+			port@2  { reg = <2>; codec2_ep:  endpoint { remote-endpoint = <&mcodec02_ep>; }; };
 
 			/* [DPCM]::BE */
 			port@3  {
-- 
2.25.1

