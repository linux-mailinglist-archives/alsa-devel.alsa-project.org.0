Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 963B67F9666
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 00:20:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 202B683B;
	Mon, 27 Nov 2023 00:20:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 202B683B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701040848;
	bh=L8acr5tOzjEuvH1DljVPXc7fuoXjAHHUNM6H11iwDfM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mEV5nyCWGbKe/LJ72187B6bt0xflRGFW4F6tN3KiUFd8VUvZBl49a9R/qcGvrGe7/
	 wpU9C8knaTcg5/bPlsMDWqJ72jY3qw8USly2XF5bUyxgb+VcA/eR5Cn0uznkUPDUnR
	 UHbPrU6vipXF2Hk1uJ/rfdhVGD5hlVdiQTuAQkCs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4D25F80612; Mon, 27 Nov 2023 00:19:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C0B06F80618;
	Mon, 27 Nov 2023 00:19:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61813F805FF; Mon, 27 Nov 2023 00:19:37 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 7A5DAF805B3
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 00:19:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A5DAF805B3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=oe6eOrzn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dt2hPkHNdEIQaU7t01LO8FMk3eu+xk7eMKpzq+yNnCDqkaarhnpIwpZJdaTBVKFO93Q6rVHwmXAo4kWH1ndhw8dMOU1KB62MAbxQevsXEO8Kr7azKX17b1ZRg/QvcGgGZ5QCf3dqcfZklvr+gJXWMXr9Iej9KslG+KYNSkHBPKaog2PnOlJWF8BKhgmNUr+dLv+6qUpFAlXlbZ2zwEouXC4orWM4y+P/6sDUBtG5Y4m9UdRve0c6IQgPwF/nx3Q93vwyxfyOFMdZHooZqgw5JURxCMw+d/cXM9xP9+Z/sUMVieaJTpj58uIbEUQYG4p0I9oaM3jr3UF8ElY9nQ1TaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hm6041/w3CFB2TLbUjigDvbKgkjEi/yd9CJilzLOY/w=;
 b=ixBd3bgJjP2Pfv/eD8oq3CaDd2RMJFeKHok0j5CzEmjy7SOefPLVkYiLEcj2VjpTtw/SdSBFq9cpjsPIHFTjSUf1KogdluJR+wJSe6pSRBUz0Yx++UaADNVRH0ZydvpgjRDdXOEbj69EhTy+QdMX711x7A4HjwLgnxfkXfwYAd1nQMN17A3kF8vZWQGpCeJ918LUp1/gTZZmi24EayACcc0YL0/esIQZe10NoX2lk9XhX7Nx9Bzhcau/LHFmcRcYC8WPvVlDcmRCftykQct1Ht1hfv4nRFSfEggIvp9YHmuK1OEFwUcRIbtqJDf0wV/5Wj+pnAqrrYQgItVOfw6sXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hm6041/w3CFB2TLbUjigDvbKgkjEi/yd9CJilzLOY/w=;
 b=oe6eOrznyrNeK6skf3gGMvXUQl0NH/4PKuHxb8R9KbcYmI//slv3/kRdCxV5P58F+V7eUVQStHLR2Dro7oAgGLfPNR9DywxY44Yi3OJH27CUi/HKSV3z1+XP+8FlvWR8RpErE0WSDsTmcVa34/52G3p1JQOHaIILe0RNEsONoOg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSRPR01MB11697.jpnprd01.prod.outlook.com
 (2603:1096:604:230::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Sun, 26 Nov
 2023 23:19:19 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::16b3:a84d:faa6:4846]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::16b3:a84d:faa6:4846%6]) with mapi id 15.20.7025.022; Sun, 26 Nov 2023
 23:19:19 +0000
Message-ID: <87o7fgw1ag.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v7 resend 4/5] ASoC: audio-graph-card2-custom-sample: Add
 connection image
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
Date: Sun, 26 Nov 2023 23:19:19 +0000
X-ClientProxiedBy: TYCPR01CA0155.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSRPR01MB11697:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ac572f0-eb7e-4bfe-c538-08dbeed61dc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mckLOiF7z4Dn//tZ8IpDIGJt0MtyvNdoGrKTdLimhw+qUGn0icKTPgNXVHr5O+amWzk/1udpFJ+II9q0DmaOnbhbSr8Z6tBQz8E213ZEteqC+9x8BFDfWJzLnFQoTUS0nges9PqRS2TgpXqQzoYQhuQI4MGawOAJ9dNYBPsmkJdjVcgHKoo0WRkXfRIcdO4RsS8CHmMQZK11+sgubcGoE5vq9oWCa7GL/lg+LcRO6eyT+BHh2k+VhSzlqoHcans0p7vfAgTEL6OD08GSCbYL+cPZkKqjksqB3wkUthVX5TMK2Xo8iw2JGYqzaCVPtcNgi7TnpVhWEr3T2CLx5W9F4rKwPQbItfFeQ/lKtEF99rCFSiYECyKkf6c7815fGP6XEGmmLPi3m4F1z5T+QLcQHoZFKEEyCZgaFNSESmTRi56RLe5KWfpmFHVS8sYbks5/OmbmlIKPAGzbouUzcbWVwBvWyvhvyGs3y4sprK6c33gPbakGTb/sbxRO9lt6B3dShBwpdV84QaRgl+ZBhpCkVfodCEesJrC+4MT/+e1SQM6NCvlAbXy/1y+i60uX4nAnI6sUp6UlMlLktcmAxw55x+qtOZXc/iiejgXuyyhRxkpls4j73NIjDu4mGe1isy06RQb4HQEF9AwLlcNdYz7XNw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(376002)(136003)(366004)(346002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(7416002)(4326008)(2906002)(8676002)(8936002)(41300700001)(26005)(66476007)(110136005)(316002)(66946007)(66556008)(6512007)(52116002)(5660300002)(2616005)(6506007)(83380400001)(86362001)(38100700002)(38350700005)(6486002)(478600001)(36756003)(2013699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DzEiGawFu0hOGmcWKyE4vA005l/lir9d0F4dDdjxAJ+45fZZhJlZLjnC264o?=
 =?us-ascii?Q?zXlLp7RfDi+eniAX4Qkmz5jks/5BgnSlnA3POUENcXqA+rimNva6QjysKdt8?=
 =?us-ascii?Q?qSjoHnILo0AIVWVs8rT6vWVvmGr0G6DY6P/xgE0wEo1YNxoue8Tiiwg7wCFM?=
 =?us-ascii?Q?7FadQFpjtaXp6k/OKBz7yu/WOxZ3OxvGA9sDM2i7SE8j4/drAD5xUoKiodOd?=
 =?us-ascii?Q?h2rMD4ob769PssYbf8p4jHq52GM5G6OTPvfLKVNX1V1n7DJu7N8JyVFmSqyv?=
 =?us-ascii?Q?ylalCtQBv3xsOtkn9ePs58wc6ncIdaW6c1rGTytjIR8tQ7g0ausLBY3fCG/c?=
 =?us-ascii?Q?B2C6mgB8ZYlUYV+EFeTCr/hKbHPWt/qfw+mZhfOkdsUIMSTp6/5yekrV2L3M?=
 =?us-ascii?Q?8hTKP7sEYOZLr46I6IbNVsgn62CuueJqF6CKT5oFBqy5Kwv4T5lyX9MMc6Se?=
 =?us-ascii?Q?J2cYKFjSPKoL/L72mnO3DyUcebDHSyp3yy7MWRHDhK3TR0mFeGWu/r6/YDw9?=
 =?us-ascii?Q?XF389DlN1enRmi4AbCY6MCHyugFnYTQbPHf4q4Rp/e01ZMT/8MaY4L2evAd8?=
 =?us-ascii?Q?bye/aXp9oHnR/sYIKt+PtdM/V9ZrI+aOUI5vwdyaXakwe7sEfn8/pePk5B+F?=
 =?us-ascii?Q?w0hIbIYTZqxRIHtbxUcehQ4wr2t2QcUndT3gXDSDuTwR8HbWcP+FK/b2g0NM?=
 =?us-ascii?Q?uy01xd+qi7qQgaCBbp+mCJRzaTmlriEedl+OYo5eiXPRxnWyL8JCdniGK1t7?=
 =?us-ascii?Q?P+vHAqtKGkGVoSK+lZtbfSZTQdBScKf/95ypbBWyeJQg9gM//ET7rwwY6EBW?=
 =?us-ascii?Q?pCZwesvs2kzoGohpI9sFAabJgBA8Tqi0Ok7UBDs8oGKkEv8aodmmqU1CHWUq?=
 =?us-ascii?Q?xhLYalD8SAv/tUTAlx11ox4NDauIseJU/u1IpMX1ZLO8Xd+d3zpMwK12d22r?=
 =?us-ascii?Q?ZjTrubhuc0jsMDhMiSZRjFg8eD7fCPKuU/nIlm3RFJ1npySsCbnLTtYeVdpY?=
 =?us-ascii?Q?kbX7+MDXnxivrKRtXc/Cve2S1txpGZQbNkSt2atj5390AnycW6tBB9pgclMN?=
 =?us-ascii?Q?IHbUJsqjR+FHnbxbANupueNHK5WRArtQpsDiv/xnaC4pPAllhrkMdAIbrXGj?=
 =?us-ascii?Q?tqY8ZiX4crOggRX+41lMdn8Sr3/9yOrpvDDDGRRZeYfaGQkKNKrzuTn+VKxv?=
 =?us-ascii?Q?j0KPlaQVrcxFDMsRNlSIyomOrH2XVaLqQU0+WQ9yUGsECwkZjTK3yLmiIfa0?=
 =?us-ascii?Q?cnNdc0qfdsNnVtu93fwbAJFJgDperXgR3rdcRGVoznCR54WgrXoBifTBx0d6?=
 =?us-ascii?Q?BehK2oqFZ5hzOy1IOGzDFE+wdELNTbgBdUSh3pW1URzaGQ5RZ71tNhipFeTS?=
 =?us-ascii?Q?S0jaEzKKUF3bTGJRerDWNWQYR0cas2Xaa7H4AL7X3RJTl0TkduDYXl5WB8Bf?=
 =?us-ascii?Q?BoVqCkFaOxfM50CvjEkIOadoa6KU5Ue19mxwa5yVgHmeJqCVX1XKpj3cqiLs?=
 =?us-ascii?Q?FC8av1IxoIvXa0/eOOdD59xpcbUFU/muc72ryu3Wu+3WNkvbftiKH7/wPdOy?=
 =?us-ascii?Q?/s3bemtXwu7CVSFIZki8BX5qClmHtQT+TaHkm1NngDX20umXPwqeoXCNvzFR?=
 =?us-ascii?Q?3o2cUm9Ml6BPTm7yl6ZtSsA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1ac572f0-eb7e-4bfe-c538-08dbeed61dc8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2023 23:19:19.4511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 SB4q3PTYXq8Zg6Y72ID1htWk+PWx5v3eoBfdUQtEdln5cqGUzsmwkjyRHz1FGbLP65g5UlG/YR8leAHfrFZxZeKJHvMoc3xHG64LxwE3K2f4iNpxJFznheYUHwgb1a2W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11697
Message-ID-Hash: P3L5SVYVR6OJLQA23MEZOCRSU3BIJDKE
X-Message-ID-Hash: P3L5SVYVR6OJLQA23MEZOCRSU3BIJDKE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P3L5SVYVR6OJLQA23MEZOCRSU3BIJDKE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Audio Graph Card2 is supporting many type of Sound connections, but
thus it is very difficult to understand how these are connected.

To support well understanding, this patch adds each connection
images and indicates each settings are for where.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../audio-graph-card2-custom-sample.dtsi      | 181 ++++++++++++++----
 1 file changed, 142 insertions(+), 39 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2-custom-sample.dtsi b/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
index 8acaa2ddb335..7e2cd9cc3fa8 100644
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
@@ -182,64 +185,115 @@ multi {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
+			/*
+			 * [Multi-CPU-0]
+			 *
+			 *		+---+		+---+
+			 *	cpu1 <--|A X|<-@------->|x a|-> codec1
+			 *	cpu2 <--|B  |		|  b|-> codec2
+			 *		+---+		+---+
+			 */
 			ports@0 {
 				reg = <0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
-			/* [Multi-CPU] */
-			mcpu0:	port@0 { reg = <0>; mcpu0_ep: endpoint { remote-endpoint = <&mcodec0_ep>; }; };
-				port@1 { reg = <1>; mcpu1_ep: endpoint { remote-endpoint = <&cpu1_ep>;    }; };
-				port@2 { reg = <2>; mcpu2_ep: endpoint { remote-endpoint = <&cpu2_ep>;    }; };
+			mcpu0:	port@0 { reg = <0>; mcpu00_ep: endpoint { remote-endpoint = <&mcodec00_ep>; };};/* (X) to pair */
+				port@1 { reg = <1>; mcpu01_ep: endpoint { remote-endpoint = <&cpu1_ep>;     };};/* (A) Multi Element */
+				port@2 { reg = <2>; mcpu02_ep: endpoint { remote-endpoint = <&cpu2_ep>;     };};/* (B) Multi Element */
 			};
 
-			/* [Multi-Codec] */
+			/*
+			 * [Multi-Codec-0]
+			 *
+			 *		+---+		+---+
+			 *	cpu1 <--|A X|<-@------->|x a|-> codec1
+			 *	cpu2 <--|B  |		|  b|-> codec2
+			 *		+---+		+---+
+			 */
 			ports@1 {
 				reg = <1>;
 				#address-cells = <1>;
 				#size-cells = <0>;
-				port@0 { reg = <0>; mcodec0_ep: endpoint { remote-endpoint = <&mcpu0_ep>;  }; };
-				port@1 { reg = <1>; mcodec1_ep: endpoint { remote-endpoint = <&codec1_ep>; }; };
-				port@2 { reg = <2>; mcodec2_ep: endpoint { remote-endpoint = <&codec2_ep>; }; };
+				port@0 { reg = <0>; mcodec00_ep: endpoint { remote-endpoint = <&mcpu00_ep>; };};/* (x) to pair */
+				port@1 { reg = <1>; mcodec01_ep: endpoint { remote-endpoint = <&codec1_ep>; };};/* (a) Multi Element */
+				port@2 { reg = <2>; mcodec02_ep: endpoint { remote-endpoint = <&codec2_ep>; };};/* (b) Multi Element */
 			};
 
-			/* [DPCM-Multi]::BE */
+			/*
+			 * [DPCM-Multi]::BE
+			 *
+			 *	FE			BE
+			 *		  ****		+---+
+			 *	cpu5 <-@--*  *-----@--->|x a|-> codec4
+			 *	cpu6 <-@--*  *		|  b|-> codec5
+			 *		  ****		+---+
+			 */
 			ports@2 {
 				reg = <2>;
 				#address-cells = <1>;
 				#size-cells = <0>;
-				port@0 { reg = <0>; mbe_ep:  endpoint { remote-endpoint = <&be10_ep>;  }; };
-				port@1 { reg = <1>; mbe1_ep: endpoint { remote-endpoint = <&codec4_ep>; }; };
-				port@2 { reg = <2>; mbe2_ep: endpoint { remote-endpoint = <&codec5_ep>; }; };
+				port@0 { reg = <0>; mbe_ep:  endpoint { remote-endpoint = <&be10_ep>;   };};/* (x) to pair */
+				port@1 { reg = <1>; mbe1_ep: endpoint { remote-endpoint = <&codec4_ep>; };};/* (a) Multi Element */
+				port@2 { reg = <2>; mbe2_ep: endpoint { remote-endpoint = <&codec5_ep>; };};/* (b) Multi Element */
 			};
 
-			/* [Codec2Codec-Multi]::CPU */
+			/*
+			 * [Codec2Codec-Multi]::CPU
+			 *
+			 *		+---+
+			 *	   +-@->|X A|-> codec8
+			 *	   |	|  B|-> codec9
+			 *	   |	+---+
+			 *	   |	+---+
+			 *	   +--->|x a|-> codec10
+			 *		|  b|-> codec11
+			 *		+---+
+			 */
 			ports@3 {
 				reg = <3>;
 				#address-cells = <1>;
 				#size-cells = <0>;
-				port@0 { reg = <0>; mc2c0_ep:  endpoint { remote-endpoint = <&c2cmf_ep>;  }; };
-				port@1 { reg = <1>; mc2c00_ep: endpoint { remote-endpoint = <&codec8_ep>; }; };
-				port@2 { reg = <2>; mc2c01_ep: endpoint { remote-endpoint = <&codec9_ep>; }; };
+				port@0 { reg = <0>; mc2c0_ep:  endpoint { remote-endpoint = <&c2cmf_ep>;  };};/* (X) to pair */
+				port@1 { reg = <1>; mc2c00_ep: endpoint { remote-endpoint = <&codec8_ep>; };};/* (A) Multi Element */
+				port@2 { reg = <2>; mc2c01_ep: endpoint { remote-endpoint = <&codec9_ep>; };};/* (B) Multi Element */
 			};
 
-			/* [Codec2Codec-Multi]::Codec */
+			/*
+			 * [Codec2Codec-Multi]::Codec
+			 *
+			 *		+---+
+			 *	   +-@->|X A|-> codec8
+			 *	   |	|  B|-> codec9
+			 *	   |	+---+
+			 *	   |	+---+
+			 *	   +--->|x a|-> codec10
+			 *		|  b|-> codec11
+			 *		+---+
+			 */
 			ports@4 {
 				reg = <4>;
 				#address-cells = <1>;
 				#size-cells = <0>;
-				port@0 { reg = <0>; mc2c1_ep:  endpoint { remote-endpoint = <&c2cmb_ep>;  }; };
-				port@1 { reg = <1>; mc2c10_ep: endpoint { remote-endpoint = <&codec10_ep>; }; };
-				port@2 { reg = <2>; mc2c11_ep: endpoint { remote-endpoint = <&codec11_ep>; }; };
+				port@0 { reg = <0>; mc2c1_ep:  endpoint { remote-endpoint = <&c2cmb_ep>;   };};/* (x) to pair */
+				port@1 { reg = <1>; mc2c10_ep: endpoint { remote-endpoint = <&codec10_ep>; };};/* (a) Multi Element */
+				port@2 { reg = <2>; mc2c11_ep: endpoint { remote-endpoint = <&codec11_ep>; };};/* (b) Multi Element */
 			};
 
-			/* [Semi-Multi] */
+			/*
+			 * [Semi-Multi]
+			 *
+			 *			+---+
+			 *	cpu7 <-@------->|X A|-> codec12
+			 *			|  B|-> codec13
+			 *			+---+
+			 */
 			ports@5 {
 				reg = <5>;
 				#address-cells = <1>;
 				#size-cells = <0>;
-				port@0 { reg = <0>; smcodec0_ep: endpoint { remote-endpoint = <&cpu7_ep>;    }; };
-				port@1 { reg = <1>; smcodec1_ep: endpoint { remote-endpoint = <&codec12_ep>; }; };
-				port@2 { reg = <2>; smcodec2_ep: endpoint { remote-endpoint = <&codec13_ep>; }; };
+				port@0 { reg = <0>; smcodec0_ep: endpoint { remote-endpoint = <&cpu7_ep>;    };};/* (X) to pair */
+				port@1 { reg = <1>; smcodec1_ep: endpoint { remote-endpoint = <&codec12_ep>; };};/* (A) Multi Element */
+				port@2 { reg = <2>; smcodec2_ep: endpoint { remote-endpoint = <&codec13_ep>; };};/* (B) Multi Element */
 			};
 		};
 
@@ -252,11 +306,27 @@ ports@0 {
 
 				#address-cells = <1>;
 				#size-cells = <0>;
-			/* [DPCM]::FE */
+				/*
+				 * [DPCM]::FE
+				 *
+				 *	FE				BE
+				 *			****
+				 *	cpu3 <-@(fe00)--*  *--(be0)@--> codec3
+				 *	cpu4 <-@(fe01)--*  *		(44.1kHz)
+				 *			****
+				 */
 			fe00:	port@0 { reg = <0>; fe00_ep: endpoint { remote-endpoint = <&cpu3_ep>; }; };
 			fe01:	port@1 { reg = <1>; fe01_ep: endpoint { remote-endpoint = <&cpu4_ep>; }; };
 
-			/* [DPCM-Multi]::FE */
+				/*
+				 * [DPCM-Multi]::FE
+				 *
+				 *		FE			BE
+				 *			****		+-+
+				 *	cpu5 <-@(fe10)--*  *---(be1)@-->| |-> codec4
+				 *	cpu6 <-@(fe11)--*  *		| |-> codec5
+				 *			****		+-+
+				 */
 			fe10:	port@2 { reg = <2>; fe10_ep: endpoint { remote-endpoint = <&cpu5_ep>; }; };
 			fe11:	port@3 { reg = <3>; fe11_ep: endpoint { remote-endpoint = <&cpu6_ep>; }; };
 			};
@@ -266,10 +336,26 @@ ports@1 {
 
 				#address-cells = <1>;
 				#size-cells = <0>;
-			/* [DPCM]::BE */
+				/*
+				 * [DPCM]::BE
+				 *
+				 *	FE				BE
+				 *			****
+				 *	cpu3 <-@(fe00)--*  *--(be0)@--> codec3
+				 *	cpu4 <-@(fe01)--*  *		(44.1kHz)
+				 *			****
+				 */
 			be0:	port@0 { reg = <0>; be00_ep: endpoint { remote-endpoint = <&codec3_ep>; }; };
 
-			/* [DPCM-Multi]::BE */
+				/*
+				 * [DPCM-Multi]::BE
+				 *
+				 *		FE			BE
+				 *			****		+-+
+				 *	cpu5 <-@(fe10)--*  *---(be1)@-->| |-> codec4
+				 *	cpu6 <-@(fe11)--*  *		| |-> codec5
+				 *			****		+-+
+				 */
 			be1:	port@1 { reg = <1>; be10_ep: endpoint { remote-endpoint = <&mbe_ep>; }; };
 			};
 		};
@@ -277,7 +363,13 @@ ports@1 {
 		codec2codec {
 			#address-cells = <1>;
 			#size-cells = <0>;
-			/* [Codec2Codec] */
+			/*
+			 * [Codec2Codec]
+			 *
+			 *	+-@(c2c)-> codec6
+			 *	|
+			 *	+--------> codec7
+			 */
 			ports@0 {
 				reg = <0>;
 
@@ -289,7 +381,18 @@ ports@0 {
 				port@1 { reg = <1>; c2cb_ep: endpoint { remote-endpoint = <&codec7_ep>; }; };
 			};
 
-			/* [Codec2Codec-Multi] */
+			/*
+			 * [Codec2Codec-Multi]
+			 *
+			 *			+-+
+			 *	   +-@(c2c_m)-->| |-> codec8
+			 *	   |		| |-> codec9
+			 *	   |		+-+
+			 *	   |		+-+
+			 *	   +----------->| |-> codec10
+			 *			| |-> codec11
+			 *			+-+
+			 */
 			ports@1 {
 				reg = <1>;
 
@@ -323,9 +426,9 @@ ports {
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
@@ -363,9 +466,9 @@ ports {
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

