Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B57F0728D33
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 03:41:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 978783E8;
	Fri,  9 Jun 2023 03:41:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 978783E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686274915;
	bh=yC/OqtwloswBKmHtsKuke7BrGHpJe3oqx/me9s7vIxc=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=FJKjRi0a9+l0tHGV/gzhKSVqt2ibHt3hcM0UxDziRsIkoAFhamMWXAhonvKrq2Oj1
	 0d9nRQ5knuGr1on4eRsynKeVRi7NQ5gZtNpGxxzFInKp+o01xEISGYtYZDQEoupccI
	 EdBFDMnJiG+uWYp5uoGTMA+toJy8vJSN5VK1sJl0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AEA5EF80199; Fri,  9 Jun 2023 03:41:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 141FAF80130;
	Fri,  9 Jun 2023 03:41:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A21A5F80199; Fri,  9 Jun 2023 03:40:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20705.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::705])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7C220F800C8
	for <alsa-devel@alsa-project.org>; Fri,  9 Jun 2023 03:40:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C220F800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=L/e0MmMa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SSkG90KPUc6YxCJ/wnvGpStZHi1/313ZODbmD12TOP1zIwaadOdWjzs/0GRQ/JXzw/WacUpOgdGXvit8KzP5ZyhxZZR4IrgKet4mEoxrp/6RbKAMVItL7MpFbef6YVXkEgiJ15o9rS5ie5JxR6WAnH44NjCpMypJRKakBmy36GnRJylUvMlbCoPZcBOfBOj+nvrtr33oZIVWAecQGaJ9aZwEfWPsmLHAZxHr5OnsiDc6U2UyMee4P+sonNkitXk1YFVpbdhnD83WLikW09lRJrsWQou4/VJUFGNLgivFbJfSQSWZTjrkYyjkyADFedriSETeDfD8+p3D+/HFHdUBVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1eQiwloFo2QTS5/XtG1ZnOpgGvznG++atnEp2lt+DFQ=;
 b=bDAoARVyKB1ewToIIfuAoiK6l8kWxhTjvTW/S4Rko2AIRmtu0O/5kHEfMB4JEsA7txgu4CHfmJqCb4nW+pSjvIqOmmbEq1NhEAQlM6mG8O+RlkSHAcbav+EBtjLyEREz4g1eKavETwg4YMynlxAXJCJ8CgoLWl/ja/QjO5a+boYS4iyUHKRjbvGZH8VGUyh1a10ZZMGr/9NPSrQaigDnv8hFZlwnCSGFzgQBltxfIeEFQqHam6x7lwhZcEwbCasoA0fNytqwOBOmLnChI03ywYav9hvl9Crh0RdZpfm5dmXUWkbdvvVvStHeDjByQ6P3z49Z4K3/zS9Xl0RQLf2e7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1eQiwloFo2QTS5/XtG1ZnOpgGvznG++atnEp2lt+DFQ=;
 b=L/e0MmMaUBSs0A6ntEjAVcf0NKMFcTaHbkpCiejYbykJevb6eK/93PoejqDw5G0/7n6xe+6Yads8rak4A3SaHskfLcoE3Ensz3aB7v5ppIDQNKGV0TonsvVX6P7VEyxWHzGpWwVGBYVFP+iL+6FNgHo+rfWPpaX39MPe6bbiMng=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB10646.jpnprd01.prod.outlook.com (2603:1096:400:2a2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19; Fri, 9 Jun
 2023 01:40:42 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 01:40:42 +0000
Message-ID: <87ilbx1kh3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: audio-graph-card2-custom-sample: add missing CPU:Codec
 = 1:N sample
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 9 Jun 2023 01:40:41 +0000
X-ClientProxiedBy: TYWP286CA0024.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::9) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB10646:EE_
X-MS-Office365-Filtering-Correlation-Id: 730d92a0-04d8-4301-1a89-08db688a88bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bsI8FhW/fREuk9i1Nr1TogAc2yYrP4EjHFUY5FWwprH25iNYhJ44BGjoB54F+4egs6rPSphSWxypjCKJL4YHbHlbk1lnSO/4voGjB87XsmHMG6abAqPVTaQp3ZlT9StykOp7EhrNQv6b9V3iBIomls6V9Qqck0AP7A/V4P7iDkSsZnK0CIC8RBJzBMGvFeu9eCzduH1fPFfASCr1XsvdnqJ/0FKYh6mXMwyozvtBDb+NeFX5UQTYUhkCmmIgANT0/QT911VsAiLdXRaZNEL0VoYzRAQp3/zEgHSv5iY2tV50M2cGOr3bYkVoxTlcXwYSlJmZuxFeogcckp7Cgvun3Jvz8396BHZ4gZogo72/90LxVvMXtB2gTe0P6geFn0nSVY+x/QnlnuHr248R/oVkzw1b2d/9hmXFVUsc0/KOG4vq36uIaQ+QOWLPQO77V+CUTD0uCz383nJbGRdBBpc/XXxHiB1YjY0WyjTvRjimIpuLumUw04VMwkcbnGIAEgiMYXJ7AU6x+oAUXLZTOSEhhO1B4KgdBsYUAfDcj3rV4UpJVWfegcy4pBK5+XZSWW/IF2h77KdYq0H9yUqBKwnl489fvzuNtdhvblEa+u+AUHl1rv5xQr3pZIhVNCxNOiER
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(451199021)(36756003)(26005)(186003)(41300700001)(6506007)(6512007)(2616005)(8936002)(478600001)(52116002)(66946007)(66556008)(316002)(5660300002)(8676002)(66476007)(4326008)(38350700002)(6486002)(38100700002)(6916009)(2906002)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oe0cQpdh3dG0xXslko7VoBQ14LYoFoUDqKv3cT+kdCeCOQ8OitleX7CnaHAR?=
 =?us-ascii?Q?9tLxveZkpe9v/1AAa1nrV6Nn3RAzCxeGKqSWbq5Gf/jWPA8jY3NbgFfVPFM3?=
 =?us-ascii?Q?xw9af7Ox16J9izWhMVmsJBvqQCeB75mDpKYQrBmfmiYkmP7CkhXVk/AQ+c29?=
 =?us-ascii?Q?kl8iCTtLYSSXFcCccvI2EeStUTScqKSA1dFfJ8E6K29RCvYYo+urv5qpvlnH?=
 =?us-ascii?Q?ANowCVj4/dC4jg2xB/iL95xYyVJkMbT3D+s12nqzH2igwh52iTfrHYDDDuQC?=
 =?us-ascii?Q?x/ewuWbamXlr/xkWKz3faeY00VQRvo/yoAEY2pczPE6HZ50Lb83gEgJHdY6k?=
 =?us-ascii?Q?SZzSZzARtJKnnmeEJ/FfAEkdu/OOpHoq0U/onzkNTOQffiTp4/xotTd5oECG?=
 =?us-ascii?Q?2+xn6g0VAAEMTe2WdaiJAx7FxBW2JlE6xw3uhMnZlm8tzaXpaU+OBCnqm5du?=
 =?us-ascii?Q?yt50+L3v/zZjdX8Gx0IyGUBuYY6R3ZURFz/G7zxpngoNQSr5e6jFJeljIT1B?=
 =?us-ascii?Q?hwyjkrVbLz/7uCg7+UsnqAo4sJpuzMsz8tIeZ8rC/8evVrH0Lk16FoNxd0e/?=
 =?us-ascii?Q?2aEGMH+w8td7uiVJvhTwVLNAGgfV1j0IEvCp14Qh/Tx7crfsF3b5qdOl3Wlg?=
 =?us-ascii?Q?nXbx5tETNiQW2cxDQSnD/BxIxDCj5hiNklb07v/4hRlnLsVMubjhG6CSO41s?=
 =?us-ascii?Q?eBtubBzaG03mzd0srydVto5TxYYpq2ZLSkuDm35TWymC4K1bj/VN2AFrbzTn?=
 =?us-ascii?Q?UqiDIaZKjPVgn/fD10tq8Sv9o83+L+UJb5tjvkhEb4tZeWdc2ZO10YVSkAjl?=
 =?us-ascii?Q?b+Wmd262vP1k79zO5gxwPBK2Tq8SAEWupJNVFpGtNVZJMPfuiy9B01SVBfs/?=
 =?us-ascii?Q?MRi/dJ+WJXbyyAnFcIEKFtiH1sd2lgQFV7fyj4le3zv3TveTIfrqTnx86f+h?=
 =?us-ascii?Q?DQnuNohZxkCRlt4KFaDlqrICrMWqzWfybcO03HFvRzd9U6Z0HPSfuuCt5YCO?=
 =?us-ascii?Q?P7+/Kj61y6oqDZrRwUf3eaCqJ4gNTNQQIcCgCB+568RLgA/U7hVFDiGa6lFi?=
 =?us-ascii?Q?m1gqEecxIfo/eiDjb/d6EoK5ZkrP7t6I77msEfGacda+gyUuS7cAEMcAYhos?=
 =?us-ascii?Q?VRmsBV7oUxpxXwihzUjjwKJoZ9Y7uSimPH1iGqs1ipePm9unb41x1XKCz1QL?=
 =?us-ascii?Q?3aHqx8Ktdox7OZ1kglq7xTsgJohDQigtHqyX+d4m/cIBNqdkb6kkMaFr4SDN?=
 =?us-ascii?Q?IpDjxFymuvrAKpLlQjnGSDii9JyOe+su9fY/7cjKm13IigWKVVeS9el0wtG/?=
 =?us-ascii?Q?t0aS0pmoySUj+MHLaZHsgeVPrPWW+SlmxcHsLXvk0A8EaYtkBowjpF7qpyyz?=
 =?us-ascii?Q?EsttGmyBnMSSKEgQ5r4vqCB74aOV09YhJM+YdFHgyrVnXrNdpSlvYVR/g8rZ?=
 =?us-ascii?Q?5McbO5s/Xs7RM+yMRDPo4FZSALM5KcZ+khW7VvWwW5zV4IpQYNchuXPL4iTt?=
 =?us-ascii?Q?M9ywcq9dEV7Tnskj9k5IA73RnKta//1A4rij9bTmgmqX6URV23nA64dnUTPp?=
 =?us-ascii?Q?Q8NfdooQhwh7uVA2yszKoulkwco2YpojD5ezAGWNzki8c4ockgwrhg6YEeQD?=
 =?us-ascii?Q?e3XfpY7b0Al/sidgspQxNn4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 730d92a0-04d8-4301-1a89-08db688a88bc
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 01:40:42.1980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 qqJ9ofYmNlG0qLhLnHY8QpvCVG6UKvMtHiAVjzbVf6LXCmkALU886j3PDg/Wsp6K1HUBvBnjiXCdp5O/nPGuLZujwIpTYHlLZ8rH/87loV/cZw1C5agufSwRahsH+blL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10646
Message-ID-Hash: YDVWSZY4IRAXOO2C3Q4ZLEK4YMVDL4EX
X-Message-ID-Hash: YDVWSZY4IRAXOO2C3Q4ZLEK4YMVDL4EX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YDVWSZY4IRAXOO2C3Q4ZLEK4YMVDL4EX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

It has CPU:Codec = 1:1 and N:N samples, but missing 1:N settings.
This patch adds it.

One note here is that because of registering timing, probing and
CPU/Codec numbering are mismatching.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../audio-graph-card2-custom-sample.dtsi      | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/sound/soc/generic/audio-graph-card2-custom-sample.dtsi b/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
index 994db61a26b3..f5e7d669da45 100644
--- a/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
+++ b/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
@@ -42,6 +42,15 @@ / {
 	 * [Normal]
 	 *	cpu0 <-@-----------------> codec0
 	 *
+	 * [Semi-Multi]
+	 *
+	 * CPU:Codec = 1:N
+	 *
+	 *			+-+
+	 *	cpu7 <-@------->| |-> codec12
+	 *			| |-> codec13
+	 *			+-+
+	 *
 	 * [Multi-CPU/Codec]
 	 *		+-+		+-+
 	 *	cpu1 <--| |<-@--------->| |-> codec1
@@ -128,6 +137,9 @@ audio-graph-card2-custom-sample {
 			 */
 			 &cpu0
 
+			/* [Semi-Multi] */
+			&sm0
+
 			/*
 			 * [Multi-CPU/Codec]: cpu side only
 			 * cpu1/cpu2/codec1/codec2
@@ -194,6 +206,13 @@ ports@4 {
 				port@1 { mc2c10_ep: endpoint { remote-endpoint = <&codec10_ep>; }; };
 				port@2 { mc2c11_ep: endpoint { remote-endpoint = <&codec11_ep>; }; };
 			};
+
+			/* [Semi-Multi] */
+			ports@5 {
+				port@0 { smcodec0_ep: endpoint { remote-endpoint = <&cpu7_ep>;    }; };
+				port@1 { smcodec1_ep: endpoint { remote-endpoint = <&codec12_ep>; }; };
+				port@2 { smcodec2_ep: endpoint { remote-endpoint = <&codec13_ep>; }; };
+			};
 		};
 
 		dpcm {
@@ -261,6 +280,9 @@ ports {
 			/* [DPCM-Multi]::FE */
 			      port@5 { cpu5_ep: endpoint { remote-endpoint = <&fe10_ep>; }; };
 			      port@6 { cpu6_ep: endpoint { remote-endpoint = <&fe11_ep>; }; };
+
+			/* [Semi-Multi] */
+			sm0:  port@7 { cpu7_ep: endpoint { remote-endpoint = <&smcodec0_ep>; }; };
 		};
 	};
 
@@ -311,6 +333,10 @@ port@3  {
 			port@9  { codec9_ep:  endpoint { remote-endpoint = <&mc2c01_ep>; }; };
 			port@10 { codec10_ep: endpoint { remote-endpoint = <&mc2c10_ep>; }; };
 			port@11 { codec11_ep: endpoint { remote-endpoint = <&mc2c11_ep>; }; };
+
+			/* [Semi-Multi] */
+			port@12 { codec12_ep: endpoint { remote-endpoint = <&smcodec1_ep>; }; };
+			port@13 { codec13_ep: endpoint { remote-endpoint = <&smcodec2_ep>; }; };
 		};
 	};
 };
-- 
2.25.1

