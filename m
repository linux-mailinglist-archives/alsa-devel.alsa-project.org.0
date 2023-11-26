Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E044C7F9664
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 00:20:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7958F7F8;
	Mon, 27 Nov 2023 00:20:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7958F7F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701040811;
	bh=B9INzx5SQ3rvMn71z3vavdFEIIXCiCe063g3y2yX9eQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JiOF8MAiNIgEeBloRocBW5U6Kelhbx8jBt+v2yUO1bd9LMpcOk2dY7XG9dHZJzCld
	 q3JZC7sVFoQy7NWfhEC5iXukE7/bxA/nOqBt0TE4Behv0KJ1kRa3gdtLLLqEP5kRnR
	 xJ88soNFodE+eamQiuhYriRSViNJqRwMprxUTRYs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AEDA5F805E8; Mon, 27 Nov 2023 00:19:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66A71F805E3;
	Mon, 27 Nov 2023 00:19:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CEC6BF802BE; Mon, 27 Nov 2023 00:19:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 320FBF805AD
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 00:19:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 320FBF805AD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=HCVUoHpZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iyJarqE4/ZH6BhrC4aXHNGB2ROp8CYVkZEiiQhFT7TP3fZH3J3jmCd4SUgJWZxgh8J+7iXljB76R0pQA2uuVAR2Lh8RlzDInDC6M4q8RbQN9ybo+5JW5A3BDOqnvhV/1w+wltXRRzcPcBeDUJGdP1N/YPe902GlScXLkGVlM/NyYgh3NiwFo3RN76cOIpDOlEi6ezWYlezaJ++nFYE/gnRlXrUEeUzAxzXsoTAQGx2/zS+Ex8FTcpm1pSAgLgi6Q+sRNIEhMu4ilYe/Kv8FTSP2W+n2UwPBWv7zwBHzN8pjLa4KOGzAAxTNe/gU9q0ojC6745hPINrdsNUoMnzSZpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6lgI+NnMtUgwd80kqYyvT4xzHLP/hbXj+sVpR7rVGo4=;
 b=oBq9xO/bbc8rTT2byaWQerLSYi2lKOgywc5Kw+waIGDFWfaX9y08wNFSd7iT+wlu3YBHqukKSuNozLn2X3LkAupw5rJi2fxmi0c2dn3iLW/YsD0KT8/coX2C8Ohd8ZkffZXASsOGZn/FUkN3MuT7JOwWZcV9OtuaQPg8Ca3VfNFay6RUDwNi0mWBZUbXwry+jsBxCRy6hkbrnTYQJDszkqyWZnCgNsYx9caDI6AJY5aF6NZxE8zGO3xo2549un1G4ZxWli5TD29vcU2iAz2l0O4Hrm7giwj9T50KPnpgeb+JJ0/AiXQN1uW4wtCK4jwwAvly4Cd0WMHuMgL7ETKi2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6lgI+NnMtUgwd80kqYyvT4xzHLP/hbXj+sVpR7rVGo4=;
 b=HCVUoHpZJuqWgt7AuQ8TNuAkIb+RwNNz9V4g/PjHe+2+erNqvUnLfDSjNMZ48ZlLXB/wjRIccRgpOS6cePlB+TdoA3NbOMpGA0dMkH5y9n+bVd60msr0Ko96RQn3lDsqCv9NdZ/wpYNRdcjQi/JRWejSiqTh3i9LSFFDsgUDgbI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSRPR01MB11697.jpnprd01.prod.outlook.com
 (2603:1096:604:230::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Sun, 26 Nov
 2023 23:19:10 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::16b3:a84d:faa6:4846]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::16b3:a84d:faa6:4846%6]) with mapi id 15.20.7025.022; Sun, 26 Nov 2023
 23:19:10 +0000
Message-ID: <87r0kcw1ap.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v7 resend 2/5] ASoC: audio-graph-card2: use better image for
 Multi connection
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
In-Reply-To: <87ttp8w1bk.wl-kuninori.morimoto.gx@renesas.com>
References: <87ttp8w1bk.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 26 Nov 2023 23:19:10 +0000
X-ClientProxiedBy: TYCPR01CA0202.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSRPR01MB11697:EE_
X-MS-Office365-Filtering-Correlation-Id: 75a5e342-7e0c-426c-1c18-08dbeed61870
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	r1xEdpbOukkEwpy3fwDbxVaoVl5bb05DODia28EGrOMujzMEaS3eMaRD4XKPp+jNMg1hyxMJVup2FDDXBjHP7o2BBjVrFvcodArrZ9sluhgWiSZflDrwNfPGA0vWMS2i+UqsdV0E28RC7cDvZNDuL4v0zLqF5AbB4vGhHGDclkeFcHBsJfZ50w64iT2P2GhXtKAsgAvyUdx+4E5lxmPrvTXnFTdZym0IuPMpdzGJbJlwO4DbLFgyZIxoLY5l0fMo11ut4Nzu1a9oyRVUeeuOqoHG+IeQ6TbTmYR2czX2Jsvnc0mc55bkvdP2ndXnfmuH9eGtUWaU1eatJu8fxg7MARn2ERy4wVVLf6Lj5IPwSzZqJXSTHYsYFDfthhEGAm0IAkX1qTcjDpE+iyg/EY+1UX4GfnAvK7pN8+hRYIAjc2zhrKT4Md0bbNMASGwsTktSLZlklxTt88VZyyWE27qYJ1fabXSpW2M2AA4r2nyH48N3kQKdEIt1fhWKFAgzKTKYqK82kYXXBrWkM4Ia0n9aEP3+Gt5rWaGagI6Xe8Vs7ngRJGnk0TAUNiHdMJ1OirmmZzjnJSuSOzf5yI3s0HY7jWtisisMCvpmH3gfhluMRO7wmTIBHR1v9wOC9Edl59M3uptYSHkCgQM0xEUv5FpDPA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(376002)(136003)(366004)(346002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(7416002)(4326008)(2906002)(8676002)(8936002)(41300700001)(26005)(66476007)(110136005)(316002)(66946007)(66556008)(6512007)(52116002)(5660300002)(2616005)(6506007)(83380400001)(86362001)(38100700002)(38350700005)(6486002)(478600001)(36756003)(2013699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UFQVertSQZG3X+7mYJUZYBHa36Aus1IEF3qdZiT1jOlyquGNbm8WeX2eDMB9?=
 =?us-ascii?Q?2pYap1TigPswuqucm4SYFUk9mlGmAFfkFGEZUozzYmjXvARV/pcz2Tzz4t4g?=
 =?us-ascii?Q?z+4EOndnlwIrFI6uJYSCS/NGg6182txYuKibSMjVvu+TWsoc0EYD7V2qbi5S?=
 =?us-ascii?Q?TRTVQ3cvDC+DscLNhtBI6UuaxChT2H6H0NYDsHrO8RCsiVG2EhR71jnY+4Jx?=
 =?us-ascii?Q?Ct/hlDe47I8xxY/238qtkcLQ2cVpmCA4N53X4Ama7fCN2tOjHu6CEoq0WadW?=
 =?us-ascii?Q?sgs7dGq+KQ35MsggHGXfrIpfplL+rjZfyAopSfqJ2jFOtS7YK5axPNcDSm5g?=
 =?us-ascii?Q?mdyKqXRMzKiH3KXIyJECNd8JRgD63/Jk3FIjoTfki0HquCsQ2mEzWtnlqT87?=
 =?us-ascii?Q?KLX2i3NVTUSG9oU0t7eR2vUQH7YT652rercH5j2xcoPTyqvP5ZSjj5VbAVZ9?=
 =?us-ascii?Q?P4+88s2Ymj9zLvPJA/h47JSoKF1OXjwlVtvVaDcdmcOIwTYnGLJYCm/cDWvc?=
 =?us-ascii?Q?GJ4Q7BJxJVAtbbouVNE+kiBAH6Y4Umj1Ktopz+zKYFBCtd9tXnehasJXXJ1T?=
 =?us-ascii?Q?Q7t0iZ26kg+SKXeCYAvC30oYJKVsY+x99BBC7GDoGMZnG0c29eAgatul4FxT?=
 =?us-ascii?Q?tHxsUFy5XECMqEUgjM6TPkxDbqZjFNyVtvlZceFW7wNrSr6dxZrzHvZOybmM?=
 =?us-ascii?Q?vGAB5GeIjMdN5HIrmMwr8tbLirb86WQHMynJ3W5sUDY6QL+RJUDsl5OJIras?=
 =?us-ascii?Q?j561SuUrT/lyeeXzkblScBKBjR70e0PA/phe8Z+7f7tS4LgjOULDelLB007b?=
 =?us-ascii?Q?suW36SNUO5IJ1T+nVUxepXyMeE8umNPQMwFxuYi4supiSXsKnBDOdS9Fl1DD?=
 =?us-ascii?Q?1nII3t5s9MkM4htPzZoR0TUFqjZWhvHpbsygBvFgwUctYzkv2T3NAWbjhLGU?=
 =?us-ascii?Q?Pn8QSl5BAxRrDka6PlCIFgWzTltNaesI7OI4VSUjUlQBM6lkCIMu5pXnE5Bv?=
 =?us-ascii?Q?Uzrd99heLG9RgetSID89vzEVSnEQ4xWLGaNwtY32eZpOCTtDFNTQavBxxtnL?=
 =?us-ascii?Q?JWL8tywZ0CO+KWso9sxlBvEJoNgEn6tgzim77jgwWoBRfNhdeQpzCKh6nT89?=
 =?us-ascii?Q?pRS5N4HHuxB/lU1f7Z6TS52E6rYni/hBlQuZz/qXRFNAvwU/C2YRyiy7Ooj4?=
 =?us-ascii?Q?efA4jq6ckhFGrgQUnnO29R+IUjRXJchubMCDMYcp4zOGBxC6FRJL00W2/PHL?=
 =?us-ascii?Q?cUoWSigqjOj/JE0DucONg1bdXkfLfdWZGZ+QV6Hupbh4V8WXWgSWu62aBEZ4?=
 =?us-ascii?Q?/Zqx5rNuSyZMNhOx1PIvruf2qBMNd7pKtVuflyV0j9k3jpNJxk9u4miaxPOk?=
 =?us-ascii?Q?pa9ZnbD3JOA4ecltkpe4QL2uPO4Wvx8oeq1whLqaBoN/11D3yLvGyF4pRee4?=
 =?us-ascii?Q?y4QYquPWO22MEloL5WCfodmm4WsSeyf8k3yAzw4Zcva7AnXO5EL00qOR5PA6?=
 =?us-ascii?Q?Mbt/x5qbYIfcZWBx1+8bTU/UQ4cC/XMlUFPzHpxnL5oNsyIVSSgHQKm3BpTJ?=
 =?us-ascii?Q?CTcZGDsy1Jh0krrcGlFNkxVaQW9UpKexCxENS8bzU9cSVFR3q7KEiynr1YbE?=
 =?us-ascii?Q?qYc1PMSHUihoI/AnsikJGdc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 75a5e342-7e0c-426c-1c18-08dbeed61870
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2023 23:19:10.5308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 jcCYH09ofJyN1Bl4X4R6SMvdORtLkbu7NwXoDoXzhz0rqkKLm5MA+Vogorf20I6S3yvp+CQLNTb/gnVYATMuQUT2FnY/m38adtfFXSl4nqJOeJUJQgU1aH9qrH9n4KBP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11697
Message-ID-Hash: 46FCNBCY3FYP4PJKUWD4GM2GRKF56IO4
X-Message-ID-Hash: 46FCNBCY3FYP4PJKUWD4GM2GRKF56IO4
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/46FCNBCY3FYP4PJKUWD4GM2GRKF56IO4/>
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

