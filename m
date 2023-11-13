Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D0A7E9427
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Nov 2023 02:38:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFA67828;
	Mon, 13 Nov 2023 02:37:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFA67828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699839487;
	bh=B9INzx5SQ3rvMn71z3vavdFEIIXCiCe063g3y2yX9eQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dZIFBOK5XbpbZqSkOyvi0r8Jv+PjNrGocFCX26RNhwMWGzSEQMr4LmQ88yzIFSaQk
	 boHKZ+pwqGmMQQl6tjiR7tzgdJUy/bDib2g+JzGA9IYrCz8exnBGG5XPUBKl+zdA1e
	 ENEmBas08TnXl5JsjhHjAQ28OIBxbN3Ljtmu4j3U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92E6CF801D5; Mon, 13 Nov 2023 02:37:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A1B4FF80249;
	Mon, 13 Nov 2023 02:37:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2F2EF80249; Mon, 13 Nov 2023 02:29:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 70E6EF800ED
	for <alsa-devel@alsa-project.org>; Mon, 13 Nov 2023 02:29:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70E6EF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=YkundB1E
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=igpnikoGczO+AzlYwmbgK7kdFm2K7KEKn/MYp/ZZNwRDQ3nEebIvNv9Ck0gVp0nfeJUd/7yYPMLUexMnht3y5ifzR+7PGIdVbBTkwp+XsDlI1CnRJkYVSVKvcpX2yjxV4D+q+5IxgV94g/AYTRiwuTHbi2blATYrvKgv+KWkHk5ruVtGWtIajkyQg76jTanA8ncFXrEzKjJkBS7J/IjfVwd738DiaFgDGzL/uMpKsWRG27gVOfKzc5oxz8yY2KzD1G4SEbuztZFiMQ5RSjfdmF6qpPC0lBgJeRs1rmOv18gDssiz3w63x/xNBJv5Ti44zWmw+ggyfHTa7iKyCa8lvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6lgI+NnMtUgwd80kqYyvT4xzHLP/hbXj+sVpR7rVGo4=;
 b=btkDmHSvFONobhf1m2YjjXByJHpgqrIPohhJLg0Vav+hTASI+YU44gGTFgqg0ZVnH36GNfmGfF5+Ue32jR2psv7PZhJY0y+TNWZsvwVVaWec9/IwyMmtOA6TLVMV9zjj3BrL2S+/HSrvTHsEhSUaaKElxOWnDZxvj5LKEJPlDQb2i8XCF2JUEm2pgBf++v4QcWckvECOogr4sX9F1x9f6GF1ewUoc3/2GuxucDmQXML6/sVmMRvH7+gIReqFscyz69tOsCymNn3vicJnKJBeLJHucPnvWnHodB0AVyvqJxqDYNpkQQR2O53sSl5U4O8OAt1xR6rQ9JzZzc86ie8wpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6lgI+NnMtUgwd80kqYyvT4xzHLP/hbXj+sVpR7rVGo4=;
 b=YkundB1E4ROXjJA21DPRLK77l3t2fE1362bel2oskto3hU+qI/rdM8b+k3pu5Pg9WIhTwJDCJtaCMMJEfRXJKar96kvu6CWl2HL3dHi/xBnH5iEmlEtn3vNcQvLi3RRmv29EbcqOiK7aXId+KSif/lJPUNr0tZNn0XaTmYsuDlg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSAPR01MB2178.jpnprd01.prod.outlook.com (2603:1096:603:1a::14)
 by TYCPR01MB10494.jpnprd01.prod.outlook.com (2603:1096:400:306::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 01:28:58 +0000
Received: from OSAPR01MB2178.jpnprd01.prod.outlook.com
 ([fe80::173f:d892:3d66:397d]) by OSAPR01MB2178.jpnprd01.prod.outlook.com
 ([fe80::173f:d892:3d66:397d%4]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 01:28:58 +0000
Message-ID: <87sf5a4f1i.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v7 2/5] ASoC: audio-graph-card2: use better image for Multi
 connection
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
In-Reply-To: <87v8a64f3d.wl-kuninori.morimoto.gx@renesas.com>
References: <87v8a64f3d.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 13 Nov 2023 01:28:58 +0000
X-ClientProxiedBy: TYAPR01CA0217.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::13) To OSAPR01MB2178.jpnprd01.prod.outlook.com
 (2603:1096:603:1a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSAPR01MB2178:EE_|TYCPR01MB10494:EE_
X-MS-Office365-Filtering-Correlation-Id: 41a1d73d-5ab4-477e-1cd8-08dbe3e7e8e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	i3VL18npzJsOTkMWKjsLv7RqKhCq3w+YcpBmPjm3u841R5DI5uXkjyVArTQLPKC3UHJo2vx6GFy5N+QIWyooBcdCBDQdhgJ+wxy+ABtTQXfjQShG09jecJ4u3sOwEiGHiWKrxSGsyQPPHnc0VRPoglhqk3ow7xRAFwtWDQkdKG9C5JLQKiGD5613H2Y43rz3kWaPGmvujloLIUMywmgpw0bnsGGCOJJc9GZpG0QkbyheKRuGDuYSlK/Qz8l0S/yCYpvtOFISmJcJ1Fukhw3JhP7mrqFKD2qYaELtuDJfOIlpM+5ArF/HJHIUcbXWoc8RsuZx81rncxqML3GhQtaCdz/bogBm9sYjX1wSi2eq/lcr2YERNWV2EBd15c6neaam+REqBC4wTzV9FJBcjAA29NeofZDDBEiET5lN4V+FDAMgfESGClFuz0lQk5aE2MbIYO+fKzwzYcAKqxBQRgozuI2L5Ma1KmmeDRfgKYaS7cIMnUoNaev9dNQuBSeai5KAMyP/mlMnfioA828RCjGmDMeJcmyTzEKo7nIio8ThZ60JlnXOr1gLV2SwR0VRRPYQsG7W2ukKXNtHlbRICNkpN9KUvG8VofDqbO6cFg9DWjvsM/ZtrtIOY5cm7T0evw8FbResfNsVwgPuVkuL/2yzgg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2178.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(39860400002)(376002)(366004)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(2906002)(6506007)(52116002)(478600001)(86362001)(26005)(2616005)(6512007)(316002)(66556008)(66476007)(66946007)(6486002)(38100700002)(83380400001)(5660300002)(2013699003)(7416002)(38350700005)(8936002)(36756003)(8676002)(4326008)(110136005)(41300700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uDD3BnTEp29CFVMMV0Ke3yGMXDwk1LwvGEAFGFENdBLxJ8qwxODha8Me3RvU?=
 =?us-ascii?Q?dVLD9xfmj3neIF8JzBYdyOduve4k9wO7yE2Ja2PI+1OPcnVJ/5LDIVIDF9X2?=
 =?us-ascii?Q?pJ5a+d+tT6O8ZgDd+hhQSGPTl/GnGCMofUHA+DpwFbf7LJ5L0hoe42Ri86Nx?=
 =?us-ascii?Q?L6GVV8i4PQQ7LbFtiSEcprYqFfRkdplb1vGOjRQfMUot2FBRlUEq+20xVZnP?=
 =?us-ascii?Q?vudf2egfGx2pk/9dcoQ0CaIIc5u20F4Rheb0QLaQbQ1MEn/ls/jUsfPcy0Pd?=
 =?us-ascii?Q?Du1g+/4L6fp5QBh/wl8l817vIdGRRJGBYXCBxsCRLTkeby3wINW2HwBWHq6R?=
 =?us-ascii?Q?5nh0G+whz2FtWDDTTns4+bSDDWXJvM2yWN8b0fRJzWjJuC5PyA+Trb3l/jsk?=
 =?us-ascii?Q?EaN4cOVp5gq/+FRYKzZNmdBJjf4uZxqzrHNiEpvdtYNWrYXKoJrhwV0L5lVE?=
 =?us-ascii?Q?XdnO4ekWk6xkx7EF9F3Ttu9WB6vuRHu0TMp9ony50k+/ikostbWpZi7NCGFS?=
 =?us-ascii?Q?qarovbb3mJ5mcfxNkQmmwGx7rvFTpLCkp7bQg5g3boepVnVG7ys8vCq0H1kr?=
 =?us-ascii?Q?iizBL79+bxKxWUoVj8vim4ABFtpg13Sl4d6eRCrVD2Kn0lt7/pixE2hIdvd3?=
 =?us-ascii?Q?1uDb+cQhZehgfOSIjiIqchBL7mP2uKnbFmM7CiWIREwg1gFJtkXnQieJO3R5?=
 =?us-ascii?Q?FR6oNB1B8pZzwiTQ0JsxM2SXxQ2hw0UayyZXC19IrzfIvBQsK6PWYvKEG6Zw?=
 =?us-ascii?Q?7n60TeYCCkBLqprDw5DAB9wgJyMN/k2EBLq6rH9OqFYDeS7q2Q1xr30xILFx?=
 =?us-ascii?Q?fVAjNxsaSdpK6dGRMILTVm0ZceaaeG39TDxdLuLF2r6mK87S4kEVokpA0kM7?=
 =?us-ascii?Q?WZGhQctV7S3cgh6QRijx2xzBClep22C1Mpl2O4X6gCrucuLTtN71k9ZOyj/S?=
 =?us-ascii?Q?ZQpD4n8TnU+w2rbpf6mcDA+hBrME+O7oabeqsyNXlhwitiNAb+fty08Ys7tM?=
 =?us-ascii?Q?jJM2i/ru1SvTSrgztU7JEvZi7tMiGl48RCV07UL7Tm9LvV91NkLkKA2FV7Lm?=
 =?us-ascii?Q?uc5V6TktDGm7TkZeMcAqTZ1cNggQir6LSNpReSO8W6DQleZw+W5Bi+c/Eevu?=
 =?us-ascii?Q?DLgNj46QucYZw4dbfbae9Wzf+pI4KSSybmkHnbUVNFOoyeJWJa5s3fcMMVPP?=
 =?us-ascii?Q?nwqPW2JWibHJ8NHGexpXizORawpSDiYv6wrnmrpJ9P/DhYvgkjgy+8R7ikjl?=
 =?us-ascii?Q?kkLA7qP4/Py0dCtRUAZg9Px/i2FYNmXWmk6QEeExUgJ/HR8Q8vMLo3WtGY12?=
 =?us-ascii?Q?VagjZWwCzJEJ4zeUbUuYFkkNmiDWh4mA6lg5tMcQvIVxG5YSVzxHFReJErgr?=
 =?us-ascii?Q?XwbwnMPTBzh/Y6nuu5WW6W+5MhXkni+onlbStYgRzhsuldmbLklkoLwGy4mp?=
 =?us-ascii?Q?xadXR/imLmLFjD1/C03kM/BdfoRJVoly+yIX/n5p0nttIjjqyxnr+lgP1l0v?=
 =?us-ascii?Q?xRJ9JqN7npD9McV574FFd15IUSdLj1EA3AllSoBjvSBLBaRnZOq6PPLksvN+?=
 =?us-ascii?Q?vePCm9JwNfBRdNS0OpoJEZOxfdXAu59US/2QOtQLqIkNXtnmDNwzriPckcLc?=
 =?us-ascii?Q?p9JBpw7W7LlUe++EgedIDak=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 41a1d73d-5ab4-477e-1cd8-08dbe3e7e8e0
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2178.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 01:28:58.7977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 yN2tLFls3HSpUHp9vSG8LgEIcGwFJBW5qWqu1s/gJSDFNaTxsYPzuUD/h0VDF3bh3VUs2iRtEk4kj1u7tdFIvDOGG7u9+4T+uwgyqf47BH4ltnJkz1oe4n9RWLNT6IJs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10494
Message-ID-Hash: 5RECJBFW6EHIYNQXUSN6BR6SOEMS5AWP
X-Message-ID-Hash: 5RECJBFW6EHIYNQXUSN6BR6SOEMS5AWP
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5RECJBFW6EHIYNQXUSN6BR6SOEMS5AWP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

1st port on Multi ports is for paired CPU/Codec, and the 2nd or later
port are for Multi Elements. This patch indicates its image to easy to
understand.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card2.c | 52 +++++++++++++--------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 7146611df730..c564f630abf6 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -83,32 +83,32 @@
 	Multi-CPU/Codec
  ************************************
 
-It has connection part (= X) and list part (= y).
-links indicates connection part of CPU side (= A).
+It has link connection part (= X,x) and list part (= A,B,a,b).
+"links" is connection part of CPU side (= @).
 
-	    +-+   (A)	     +-+
- CPU1 --(y) | | <-(X)--(X)-> | | (y)-- Codec1
- CPU2 --(y) | |		     | | (y)-- Codec2
-	    +-+		     +-+
+	+----+		+---+
+ CPU1 --|A  X| <-@----> |x a|-- Codec1
+ CPU2 --|B   |		|  b|-- Codec2
+	+----+		+---+
 
-	sound {
-		compatible = "audio-graph-card2";
+ sound {
+	compatible = "audio-graph-card2";
 
-(A)		links = <&mcpu>;
+(@)	links = <&mcpu>;
 
-		multi {
-			ports@0 {
-(X) (A)			mcpu:	port@0 { mcpu0_ep: endpoint { remote-endpoint = <&mcodec0_ep>; }; };
-(y)				port@1 { mcpu1_ep: endpoint { remote-endpoint = <&cpu1_ep>; }; };
-(y)				port@2 { mcpu2_ep: endpoint { remote-endpoint = <&cpu2_ep>; }; };
-			};
-			ports@1 {
-(X)				port@0 { mcodec0_ep: endpoint { remote-endpoint = <&mcpu0_ep>; }; };
-(y)				port@1 { mcodec1_ep: endpoint { remote-endpoint = <&codec1_ep>; }; };
-(y)				port@2 { mcodec2_ep: endpoint { remote-endpoint = <&codec2_ep>; }; };
-			};
+	multi {
+		ports@0 {
+(@)		mcpu:	port@0 { mcpu0_ep: endpoint { remote-endpoint = <&mcodec0_ep>;	}; };	// (X) to pair
+			port@1 { mcpu1_ep: endpoint { remote-endpoint = <&cpu1_ep>;	}; };	// (A) Multi Element
+			port@2 { mcpu2_ep: endpoint { remote-endpoint = <&cpu2_ep>;	}; };	// (B) Multi Element
+		};
+		ports@1 {
+			port@0 { mcodec0_ep: endpoint { remote-endpoint = <&mcpu0_ep>;	}; };	// (x) to pair
+			port@1 { mcodec1_ep: endpoint { remote-endpoint = <&codec1_ep>;	}; };	// (a) Multi Element
+			port@2 { mcodec2_ep: endpoint { remote-endpoint = <&codec2_ep>;	}; };	// (b) Multi Element
 		};
 	};
+ };
 
  CPU {
 	ports {
@@ -328,9 +328,9 @@ static struct device_node *graph_get_next_multi_ep(struct device_node **port)
 	/*
 	 * multi {
 	 *	ports {
-	 * =>	lnk:	port@0 { ... };
-	 *		port@1 { ep { ... = rep0 } };
-	 *		port@2 { ep { ... = rep1 } };
+	 * =>	lnk:	port@0 { ...		   }; // to pair
+	 *		port@1 { ep { ... = rep0 } }; // Multi Element
+	 *		port@2 { ep { ... = rep1 } }; // Multi Element
 	 *		...
 	 *	};
 	 * };
@@ -920,9 +920,9 @@ static int graph_counter(struct device_node *lnk)
 	 *
 	 * multi {
 	 *	ports {
-	 * =>		lnk:	port@0 { ... };
-	 *			port@1 { ... };
-	 *			port@2 { ... };
+	 * =>		lnk:	port@0 { ... }; // to pair
+	 *			port@1 { ... }; // Multi Element
+	 *			port@2 { ... }; // Multi Element
 	 *			...
 	 *	};
 	 * };
-- 
2.25.1

