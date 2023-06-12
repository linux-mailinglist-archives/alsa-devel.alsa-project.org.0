Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3402E72B544
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 04:01:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51540820;
	Mon, 12 Jun 2023 04:00:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51540820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686535261;
	bh=OeSXYW9/aQqnrs8ZEeyJTEcf8FKZlEaaZIGXiBmjRXw=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=P+vDLL0fJoPsfHVplq2YF+lI0aP/9M7Y+Xmg8ou18mvvAcrsunoIVl2YHbRi+dZSc
	 W4BonTSRhjeRsulNz/3JheaPq1QAcdo4YO7N0DR9ajsYuNd8wUpS/T3Qd+krl3Vdjm
	 GNfFzs6j7iuP7ib4XsiawDWWJamEhvap5ifX/eTE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68B5EF80544; Mon, 12 Jun 2023 04:00:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84B85F80132;
	Mon, 12 Jun 2023 04:00:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E06FF80149; Mon, 12 Jun 2023 03:59:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20730.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::730])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0562AF80130
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 03:59:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0562AF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=YHqjfaFb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bLZsL//MOi5HA/fdxGS7I+8I3/QUN2643FgfFxf/AflGcCZgXhydAFL3Qd5HVXKn46KZUG7Dhj1qOzg6g7geY2vy+ObbFmMAUQ6ejCEifrO2WJMS8/MryuunckqaB+J1uZ2DWKuxE9qHTwtiuDbqKpk6B0Ci9Sl/Xw/LNAVR9AfMzATcc+eqVMbGNIzHlTGHN4611zaG68bgv9lrSt3G5y0u0iMhWfNT1GNXbW9XyNaGVuN26m/EyAIZGQcTXE2qABsiCtEih5VgitA6ak0cLnlrDEtPqZfVtpq4R2DmD5hzhHkXYBx5v2ajwq1o7fqF478N1FEGTI67j9eLeiVGaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJCXMIV0vGYn6eagB8RMyxjEikpGVC9dywIgXskKt6U=;
 b=V1dKdDhD+EBqwOYBFTitGY5axyK1HJ6bRtP2/XLiCA6OJuHUFcCataDc/MW6IgrRZoBd0JP5hGf2AaBr8LhVF0JxRcDi3xnnX0N2Sjb1WbEr5JVcWOlNFdUyy3Qse+4V8L+QdCxvWETVaD/rjQ6SNwrybajCSOdCdG+G4rQ4H4lxOM+a/ldxLSbddqbpUrb6r3Lx55kYfve2TD30kJas0T8FTDddM4LT/9+2bIT5/v7JdcOnBDSXdtGmnDhzAB5X2BIrfRhZKk8++H5tHgWCgdK0rWI9vRtMzLqp/0zsY119oSCRn5UmdJNt4V0hGRwMf7LyFKnVTUmEiYDlI1ahsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJCXMIV0vGYn6eagB8RMyxjEikpGVC9dywIgXskKt6U=;
 b=YHqjfaFbdBsfr8b9E3nPhpm2mETX9VLqcGBQHmbn0w9rStHqtxuMNJAj+lfyospGPx8Exc1ZMuWIYAOVbUc85bFnwPc8/Y1vKrf/6itBhZR7Gc1+TALeZGujb0hdPJbVJT/eEnj/g7wBbgVzh2g8CuuiU0Sl6zWmDQM3tFnk6H4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8110.jpnprd01.prod.outlook.com (2603:1096:400:11f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Mon, 12 Jun
 2023 01:59:35 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6455.045; Mon, 12 Jun 2023
 01:59:34 +0000
Message-ID: <87a5x5qw3d.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: audio-graph-card2-custom-sample.dtsi: remove DT warning
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 12 Jun 2023 01:59:34 +0000
X-ClientProxiedBy: TY2PR0101CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB8110:EE_
X-MS-Office365-Filtering-Correlation-Id: 393d8104-b8df-43a6-6679-08db6ae8aba7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GnwhCCzWkmct40J/SiFg0v9Bo+3Z8M5yFd/+zmDlk9C3NAPJnLrTSuZAyDxJklnP3y0C9weGG5Z6Hcz7ZVEhHkwrHZ7fK9kYcxMX84wDRHaygowalTVpoMqnQRvaZShHjqQZTFsv17VOHJ9W1kIhkoSbieTm4yfNtJDTIA+nGp7mnDprTYY8/rcAZnV9rTm7DJuQO9/NpaJVr8ITV30BOtaQCF4+NRmiliqZLG0o52YO3drA4/FX3LRgv8Wpjb2LuqJcM65xEgD5wx4i5yNrwveZMYJdB0hmRaxC2daj0Ixi8WSeKX7dx83s7KzNhg080e+A9COlUeAY3X5VC7CKE1YJlUST6MqoXrU8yvLq2U5GXvwqrMzMzkTLa60w6qFT71+RQpzDQsnWUY/jx1+Z+hwLpVpLZCxdk1nzsx+PueTNYpa3h0Y5zMrT9dR5NLiJKveyV20gwbM8efOxEVLlB7+8+nekDhlYWiw8skr07Q21FNrCCStoBRxohkQqBr2rzA9xmaa2BYyWxs1qBb8ExYkhtYNjDw9jA7N/iWHjoIe4C0wYyZO3VeARBsro6okUalhJKbTVWuxHIqg2y+tbLG1+wHek0T4sPz5dBqABtOJEIiJYnQcn33hW/AXLPQ41
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(451199021)(86362001)(52116002)(6486002)(316002)(8676002)(41300700001)(83380400001)(5660300002)(26005)(38350700002)(6512007)(38100700002)(6506007)(8936002)(36756003)(66476007)(66556008)(66946007)(4326008)(6916009)(478600001)(186003)(30864003)(2906002)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mq3O9C13zToDZCuzneb2Q9aW8ebuX7pcqZ8/hHfLaNhvHSQfMMT6kEz7DRqH?=
 =?us-ascii?Q?SsatWuT3eXRl0xZQGm1kKl8Q3Z3aGjJIE214YDExwx8EoEXsejPmNt2zJD5/?=
 =?us-ascii?Q?okrNt05WfUSez3rxjIrBZXouaXIeOXEgwyMMs+eZPL+qIM303aU9jgxruQKw?=
 =?us-ascii?Q?ynCqIRP79e+Ms0f4hVaq4k3HVZx8InewDQG2gXQYElRI73pa8oFvLKn27DIW?=
 =?us-ascii?Q?9GDxbySmko2uBshvTdBIz6DkS5aOC3VKa3UhuwItvkXQIgDDzKMSDjQa+gd7?=
 =?us-ascii?Q?/H+iPYjyjEuGemd9XGL/zPuoOyVf1WOUq14hb7GZUGa1Ai+DXU9KYv7wP071?=
 =?us-ascii?Q?9pTosi9aFNZgPbqhksVByPocQoqCNzzfADtYK70DYwvfwJU/ztCPalTAuXCd?=
 =?us-ascii?Q?EUZS+rvoP+NT5RHR/z0uIAcjzL7J1BKFfPl9FN6Yh61l1qUQJmaSVs4yX/6F?=
 =?us-ascii?Q?jT7dRFOoeM25TGOP+Qa0Q5RyMrrSwZCSJuzrhypkeBx6woz/Px9gFKBpK8xJ?=
 =?us-ascii?Q?Mt71g8JkJ5cYN0A1F5WJQw4L+xh1DcyYUOAeMK/y/yiofBdYNoFsAFyTXY1J?=
 =?us-ascii?Q?UXtQLOi+PPvTFa6td92wZzV2TZjOWt4zEIhczgUDZg0k4IBJAerPcXkIBx/f?=
 =?us-ascii?Q?KU7Jrwy4rA5SFQj42g8eQIfT+DUFcOl0q1buf5aW4BlvLVsDZcQG/YxACsoW?=
 =?us-ascii?Q?0+ChT7K7juj8N0nPHQw7iQZdW2fbvr8gKZa1UibTr7aG03dVMbeB4y1IpHKn?=
 =?us-ascii?Q?oJUSgY08q2o5a4dX8/T4rEOjVawGj3Q491ZKP0t7hyULLGqPX139BEwu4eOs?=
 =?us-ascii?Q?+MWyY/ctur+CsQNdNH0K7TUf4QwjCwQgLGfNYQKiovTQpxwXhIqdPt7V4mqG?=
 =?us-ascii?Q?Gcib3/x5KhU9jfLPoJyoUKq4rXYsMvtbbvcsZM+uaQcE24e4BnASSUsfeJ/0?=
 =?us-ascii?Q?cj06Hkq15QaTTT64BST+sNEfCS2PRB9jNwzcCnHK8GOwcVSif/ZKfGj6uZex?=
 =?us-ascii?Q?B6aiPdoHs/P2GUMGjcgsnP3B6X0h2rVqhKCBSB0TPgBGrI7YFdMqwyMnBnBO?=
 =?us-ascii?Q?3+R+CNGAbP8qeZ1M5h9OUcwElk3WOTmpwW+XRvoT0ivj9FEMkMSmzAfNGDjS?=
 =?us-ascii?Q?2SY9A/XfSHcbeJowLezqo4hgMJ3wzv2A4/fYc0LNoeYHGHDXP1+xz8Id1vCb?=
 =?us-ascii?Q?i+CcpmVt/TslqpjxgoMFwJy2D0tUTbnlX6JNE7YnOr7MLRSmcju1D17mkbAV?=
 =?us-ascii?Q?tu3ThDV25tixKceW3MzTvzot0ETBByNYbte97UpVgo0FZ1wO++ctHhKQllcd?=
 =?us-ascii?Q?qdTkE/t8ext9OSZK+qhfR7inlp7c+bph9v0aWl64StH6DpLsB+vV6xta2wVK?=
 =?us-ascii?Q?fz///0MtgyZpYFrWKkqkC9Z/Yd8W5T1giAUqHW3j/+ZMNKL25EzWkmS5XX+9?=
 =?us-ascii?Q?LBdG83hyUsWk2mzpX5IliDg2qBkxkV9+rTdV5HjJnt1T1kAQrxn/Hirle1yC?=
 =?us-ascii?Q?R3PBQvq5e52FJw0aEtV32dMWcgbPr80gjG2WStPRQJuBL0u/BKopQApGtPae?=
 =?us-ascii?Q?5X0/amwVwdI3g1aHkrpECuP7bKloFuFmc0SAPq9ZMNjnkDOyL9k0k/a6joke?=
 =?us-ascii?Q?2K3CO1hk3g2MLpyx3G7wvHo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 393d8104-b8df-43a6-6679-08db6ae8aba7
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 01:59:34.9084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 oDsc1uzhLSBBIHd/zlBCRdmcR+mjP7TIdB4n1oSEfcMpSj3Ty9SoJEvKJpx3LiOIEPDFdHratBwPq5JViCBGLWOyhwSpyAdNipcRZ7+X6aNTU95AXqrVitAYCxJYHAGI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8110
Message-ID-Hash: ELPHKLKMZTIVVZ6HJWQCD7E6GNHF6ADN
X-Message-ID-Hash: ELPHKLKMZTIVVZ6HJWQCD7E6GNHF6ADN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ELPHKLKMZTIVVZ6HJWQCD7E6GNHF6ADN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current audio-graph-card2-custom-sample.dtsi is missing
address-cells / size-cells / reg. Thus it get too many DT warnings.
This patch solved it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../audio-graph-card2-custom-sample.dtsi      | 151 ++++++++++++------
 1 file changed, 101 insertions(+), 50 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2-custom-sample.dtsi b/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
index f5e7d669da45..2ac0de3c21da 100644
--- a/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
+++ b/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
@@ -172,83 +172,127 @@ &c2c_m
 		>;
 
 		multi {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
 			ports@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 			/* [Multi-CPU] */
-			mcpu0:	port@0 { mcpu0_ep: endpoint { remote-endpoint = <&mcodec0_ep>; }; };
-				port@1 { mcpu1_ep: endpoint { remote-endpoint = <&cpu1_ep>;    }; };
-				port@2 { mcpu2_ep: endpoint { remote-endpoint = <&cpu2_ep>;    }; };
+			mcpu0:	port@0 { reg = <0>; mcpu0_ep: endpoint { remote-endpoint = <&mcodec0_ep>; }; };
+				port@1 { reg = <1>; mcpu1_ep: endpoint { remote-endpoint = <&cpu1_ep>;    }; };
+				port@2 { reg = <2>; mcpu2_ep: endpoint { remote-endpoint = <&cpu2_ep>;    }; };
 			};
 
 			/* [Multi-Codec] */
 			ports@1 {
-				port@0 { mcodec0_ep: endpoint { remote-endpoint = <&mcpu0_ep>;  }; };
-				port@1 { mcodec1_ep: endpoint { remote-endpoint = <&codec1_ep>; }; };
-				port@2 { mcodec2_ep: endpoint { remote-endpoint = <&codec2_ep>; }; };
+				reg = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 { reg = <0>; mcodec0_ep: endpoint { remote-endpoint = <&mcpu0_ep>;  }; };
+				port@1 { reg = <1>; mcodec1_ep: endpoint { remote-endpoint = <&codec1_ep>; }; };
+				port@2 { reg = <2>; mcodec2_ep: endpoint { remote-endpoint = <&codec2_ep>; }; };
 			};
 
 			/* [DPCM-Multi]::BE */
 			ports@2 {
-				port@0 { mbe_ep:  endpoint { remote-endpoint = <&be10_ep>;  }; };
-				port@1 { mbe1_ep: endpoint { remote-endpoint = <&codec4_ep>; }; };
-				port@2 { mbe2_ep: endpoint { remote-endpoint = <&codec5_ep>; }; };
+				reg = <2>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 { reg = <0>; mbe_ep:  endpoint { remote-endpoint = <&be10_ep>;  }; };
+				port@1 { reg = <1>; mbe1_ep: endpoint { remote-endpoint = <&codec4_ep>; }; };
+				port@2 { reg = <2>; mbe2_ep: endpoint { remote-endpoint = <&codec5_ep>; }; };
 			};
 
 			/* [Codec2Codec-Multi]::CPU */
 			ports@3 {
-				port@0 { mc2c0_ep:  endpoint { remote-endpoint = <&c2cmf_ep>;  }; };
-				port@1 { mc2c00_ep: endpoint { remote-endpoint = <&codec8_ep>; }; };
-				port@2 { mc2c01_ep: endpoint { remote-endpoint = <&codec9_ep>; }; };
+				reg = <3>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 { reg = <0>; mc2c0_ep:  endpoint { remote-endpoint = <&c2cmf_ep>;  }; };
+				port@1 { reg = <1>; mc2c00_ep: endpoint { remote-endpoint = <&codec8_ep>; }; };
+				port@2 { reg = <2>; mc2c01_ep: endpoint { remote-endpoint = <&codec9_ep>; }; };
 			};
 
 			/* [Codec2Codec-Multi]::Codec */
 			ports@4 {
-				port@0 { mc2c1_ep:  endpoint { remote-endpoint = <&c2cmb_ep>;  }; };
-				port@1 { mc2c10_ep: endpoint { remote-endpoint = <&codec10_ep>; }; };
-				port@2 { mc2c11_ep: endpoint { remote-endpoint = <&codec11_ep>; }; };
+				reg = <4>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 { reg = <0>; mc2c1_ep:  endpoint { remote-endpoint = <&c2cmb_ep>;  }; };
+				port@1 { reg = <1>; mc2c10_ep: endpoint { remote-endpoint = <&codec10_ep>; }; };
+				port@2 { reg = <2>; mc2c11_ep: endpoint { remote-endpoint = <&codec11_ep>; }; };
 			};
 
 			/* [Semi-Multi] */
 			ports@5 {
-				port@0 { smcodec0_ep: endpoint { remote-endpoint = <&cpu7_ep>;    }; };
-				port@1 { smcodec1_ep: endpoint { remote-endpoint = <&codec12_ep>; }; };
-				port@2 { smcodec2_ep: endpoint { remote-endpoint = <&codec13_ep>; }; };
+				reg = <5>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 { reg = <0>; smcodec0_ep: endpoint { remote-endpoint = <&cpu7_ep>;    }; };
+				port@1 { reg = <1>; smcodec1_ep: endpoint { remote-endpoint = <&codec12_ep>; }; };
+				port@2 { reg = <2>; smcodec2_ep: endpoint { remote-endpoint = <&codec13_ep>; }; };
 			};
 		};
 
 		dpcm {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
 			ports@0 {
+				reg = <0>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
 			/* [DPCM]::FE */
-			fe00:	port@0 { fe00_ep: endpoint { remote-endpoint = <&cpu3_ep>; }; };
-			fe01:	port@1 { fe01_ep: endpoint { remote-endpoint = <&cpu4_ep>; }; };
+			fe00:	port@0 { reg = <0>; fe00_ep: endpoint { remote-endpoint = <&cpu3_ep>; }; };
+			fe01:	port@1 { reg = <1>; fe01_ep: endpoint { remote-endpoint = <&cpu4_ep>; }; };
 
 			/* [DPCM-Multi]::FE */
-			fe10:	port@2 { fe10_ep: endpoint { remote-endpoint = <&cpu5_ep>; }; };
-			fe11:	port@3 { fe11_ep: endpoint { remote-endpoint = <&cpu6_ep>; }; };
+			fe10:	port@2 { reg = <2>; fe10_ep: endpoint { remote-endpoint = <&cpu5_ep>; }; };
+			fe11:	port@3 { reg = <3>; fe11_ep: endpoint { remote-endpoint = <&cpu6_ep>; }; };
 			};
 
 			ports@1 {
+				reg = <1>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
 			/* [DPCM]::BE */
-			be0:	port@0 { be00_ep: endpoint { remote-endpoint = <&codec3_ep>; }; };
+			be0:	port@0 { reg = <0>; be00_ep: endpoint { remote-endpoint = <&codec3_ep>; }; };
 
 			/* [DPCM-Multi]::BE */
-			be1:	port@1 { be10_ep: endpoint { remote-endpoint = <&mbe_ep>; }; };
+			be1:	port@1 { reg = <1>; be10_ep: endpoint { remote-endpoint = <&mbe_ep>; }; };
 			};
 		};
 
 		codec2codec {
+			#address-cells = <1>;
+			#size-cells = <0>;
 			/* [Codec2Codec] */
 			ports@0 {
+				reg = <0>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				/* use default settings */
-			c2c:	port@0 { c2cf_ep: endpoint { remote-endpoint = <&codec6_ep>; }; };
-				port@1 { c2cb_ep: endpoint { remote-endpoint = <&codec7_ep>; }; };
+			c2c:	port@0 { reg = <0>; c2cf_ep: endpoint { remote-endpoint = <&codec6_ep>; }; };
+				port@1 { reg = <1>; c2cb_ep: endpoint { remote-endpoint = <&codec7_ep>; }; };
 			};
 
 			/* [Codec2Codec-Multi] */
 			ports@1 {
+				reg = <1>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				/* use original settings */
 				rate = <48000>;
-			c2c_m:	port@0 { c2cmf_ep: endpoint { remote-endpoint = <&mc2c0_ep>; }; };
-				port@1 { c2cmb_ep: endpoint { remote-endpoint = <&mc2c1_ep>; }; };
+			c2c_m:	port@0 { reg = <0>; c2cmf_ep: endpoint { remote-endpoint = <&mc2c0_ep>; }; };
+				port@1 { reg = <1>; c2cmb_ep: endpoint { remote-endpoint = <&mc2c1_ep>; }; };
 			};
 		};
 	};
@@ -264,25 +308,28 @@ test_cpu {
 		 */
 		compatible = "test-cpu";
 		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
 			bitclock-master;
 			frame-master;
 			/* [Normal] */
-			cpu0: port@0 { cpu0_ep: endpoint { remote-endpoint = <&codec0_ep>; }; };
+			cpu0: port@0 { reg = <0>; cpu0_ep: endpoint { remote-endpoint = <&codec0_ep>; }; };
 
 			/* [Multi-CPU] */
-			      port@1 { cpu1_ep: endpoint { remote-endpoint = <&mcpu1_ep>; }; };
-			      port@2 { cpu2_ep: endpoint { remote-endpoint = <&mcpu2_ep>; }; };
+			      port@1 { reg = <1>; cpu1_ep: endpoint { remote-endpoint = <&mcpu1_ep>; }; };
+			      port@2 { reg = <2>; cpu2_ep: endpoint { remote-endpoint = <&mcpu2_ep>; }; };
 
 			/* [DPCM]::FE */
-			      port@3 { cpu3_ep: endpoint { remote-endpoint = <&fe00_ep>; }; };
-			      port@4 { cpu4_ep: endpoint { remote-endpoint = <&fe01_ep>; }; };
+			      port@3 { reg = <3>; cpu3_ep: endpoint { remote-endpoint = <&fe00_ep>; }; };
+			      port@4 { reg = <4>; cpu4_ep: endpoint { remote-endpoint = <&fe01_ep>; }; };
 
 			/* [DPCM-Multi]::FE */
-			      port@5 { cpu5_ep: endpoint { remote-endpoint = <&fe10_ep>; }; };
-			      port@6 { cpu6_ep: endpoint { remote-endpoint = <&fe11_ep>; }; };
+			      port@5 { reg = <5>; cpu5_ep: endpoint { remote-endpoint = <&fe10_ep>; }; };
+			      port@6 { reg = <6>; cpu6_ep: endpoint { remote-endpoint = <&fe11_ep>; }; };
 
 			/* [Semi-Multi] */
-			sm0:  port@7 { cpu7_ep: endpoint { remote-endpoint = <&smcodec0_ep>; }; };
+			sm0:  port@7 { reg = <7>; cpu7_ep: endpoint { remote-endpoint = <&smcodec0_ep>; }; };
 		};
 	};
 
@@ -297,6 +344,9 @@ test_codec {
 		 */
 		compatible = "test-codec";
 		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
 			/*
 			 * prefix can be added to *component*,
 			 * see audio-graph-card2::routing
@@ -304,39 +354,40 @@ ports {
 			prefix = "TC";
 
 			/* [Normal] */
-			port@0  { codec0_ep:  endpoint { remote-endpoint = <&cpu0_ep>; }; };
+			port@0  { reg = <0>; codec0_ep:  endpoint { remote-endpoint = <&cpu0_ep>; }; };
 
 			/* [Multi-Codec] */
-			port@1  { codec1_ep:  endpoint { remote-endpoint = <&mcodec1_ep>; }; };
-			port@2  { codec2_ep:  endpoint { remote-endpoint = <&mcodec2_ep>; }; };
+			port@1  { reg = <1>; codec1_ep:  endpoint { remote-endpoint = <&mcodec1_ep>; }; };
+			port@2  { reg = <2>; codec2_ep:  endpoint { remote-endpoint = <&mcodec2_ep>; }; };
 
 			/* [DPCM]::BE */
 			port@3  {
 				convert-rate = <44100>;
-				codec3_ep:  endpoint { remote-endpoint = <&be00_ep>; };
+				reg = <3>; codec3_ep:  endpoint { remote-endpoint = <&be00_ep>; };
 			};
 
 			/* [DPCM-Multi]::BE */
-			port@4  { codec4_ep:  endpoint { remote-endpoint = <&mbe1_ep>; }; };
-			port@5  { codec5_ep:  endpoint { remote-endpoint = <&mbe2_ep>; }; };
+			port@4  { reg = <4>; codec4_ep:  endpoint { remote-endpoint = <&mbe1_ep>; }; };
+			port@5  { reg = <5>; codec5_ep:  endpoint { remote-endpoint = <&mbe2_ep>; }; };
 
 			/* [Codec2Codec] */
 			port@6  { bitclock-master;
 				  frame-master;
-				  codec6_ep:  endpoint { remote-endpoint = <&c2cf_ep>; }; };
-			port@7  { codec7_ep:  endpoint { remote-endpoint = <&c2cb_ep>; }; };
+				  reg = <6>; codec6_ep:  endpoint { remote-endpoint = <&c2cf_ep>; }; };
+			port@7  { reg = <7>; codec7_ep:  endpoint { remote-endpoint = <&c2cb_ep>; }; };
 
 			/* [Codec2Codec-Multi] */
 			port@8  { bitclock-master;
 				  frame-master;
-				  codec8_ep:  endpoint { remote-endpoint = <&mc2c00_ep>; }; };
-			port@9  { codec9_ep:  endpoint { remote-endpoint = <&mc2c01_ep>; }; };
-			port@10 { codec10_ep: endpoint { remote-endpoint = <&mc2c10_ep>; }; };
-			port@11 { codec11_ep: endpoint { remote-endpoint = <&mc2c11_ep>; }; };
+				  reg = <8>;  codec8_ep:  endpoint { remote-endpoint = <&mc2c00_ep>; }; };
+			port@9  { reg = <9>;  codec9_ep:  endpoint { remote-endpoint = <&mc2c01_ep>; }; };
+			port@a  { reg = <10>; codec10_ep: endpoint { remote-endpoint = <&mc2c10_ep>; }; };
+			port@b  { reg = <11>; codec11_ep: endpoint { remote-endpoint = <&mc2c11_ep>; }; };
 
 			/* [Semi-Multi] */
-			port@12 { codec12_ep: endpoint { remote-endpoint = <&smcodec1_ep>; }; };
-			port@13 { codec13_ep: endpoint { remote-endpoint = <&smcodec2_ep>; }; };
+			port@c { reg = <12>; codec12_ep: endpoint { remote-endpoint = <&smcodec1_ep>; }; };
+			port@d { reg = <13>; codec13_ep: endpoint { remote-endpoint = <&smcodec2_ep>; }; };
+
 		};
 	};
 };
-- 
2.25.1

