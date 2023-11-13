Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC047E942C
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Nov 2023 02:39:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E76282A;
	Mon, 13 Nov 2023 02:38:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E76282A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699839549;
	bh=LZq/VX4YDkCiF73d9EtoDa+cFGSYicEHVTbkPslc/SY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Wbb5fbXSse8DCXODrSzfgxeVvVs9HTlTXCMjosZWzz+ryk56bpvihGzff4KHsbPIg
	 Xe8mw4/lR+UEZzkS6XLMFdRLf2eAP5Sv2+dL+luzxuYQIozSr5FzBFCs05ZY7F6SSP
	 D2tTnYJUA4597hdST0R3643PCi+9Wk21vpGkNP1s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08E52F805AB; Mon, 13 Nov 2023 02:37:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 71C21F802E8;
	Mon, 13 Nov 2023 02:37:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8742F801D5; Mon, 13 Nov 2023 02:31:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CD7A1F800ED
	for <alsa-devel@alsa-project.org>; Mon, 13 Nov 2023 02:31:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD7A1F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=GjRR7Lwj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SW6yAC7ole2VJQ9crvYGgOie3wSS4PxxHccXj/slDahLzZzqRBDOg2Gc52p66ayadFtBA7yHfH3yIJcjD2Efc/RRbafw2MMbTCSlco7xpkMH7hTnCCtpQ/LnNZZFQucfUnih/iP5vPmEYBEPVfLMnzlBLIp4qWSWC6yHG9jOnn//XSjkvz5101abhbeVfyl2K7GmYyUBH144maIKCfZhW6dUylHkfLSuBQum8EDapjZgdwtTERLESK/KQpL5Ngk77CE/XIkKET2UBR8k1uRZR6uy83pkXl/K4U/GvJd8seiHQEJQszaxJiQu1VZvOnBZzMs6nodAeIoNTFW0dZ8JMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hub/TO/rXMSsorYebWZMGlf5rm7wYeIuPGObxjqKHRs=;
 b=K9F0oPwFHBk2EINmMGc6p+dfvNmhV12VFMfFKPpCaUeLjhVxf4mj0al0+VDijTrbhTS1U4Z2JtNk3/6RdiTmWDiEY5yWCkXWFeNEc77DH+jpdV3TXMxS++lVfI7qGavVilf6hcV1Lz9m8fUYhNovRQS2tFHmh7kx9bBIb8fPkhlLnH472YSKX+PurjAVqw69OK/EMThapjJHSNF1Q/L0SdYf/GHMC0XqgpmVdP0n8JraHB/SYlvP626Wu0oWXXi1hAhTw07Xe97soYI+KZ/L7Jn+cDldMsnjnH95FZBAAY8YFc/zoTSH6jigTcuhB5GcAhHaa17RFLQFSFZ1a9+dUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hub/TO/rXMSsorYebWZMGlf5rm7wYeIuPGObxjqKHRs=;
 b=GjRR7LwjsSEf1rHzWBsmg87Gs0cKp8k9Rb38+DPmf0Y/eawmLlSejeZCtQwdBtk9sH0ZbWImWpxY+fcSBXBWpcWFbRKLl2C+u3xOlpFMnt8nUrF5+x+KNbkkTlRa2+xQsyA+2YQ2I1lSPcm4dv01DtRCYImaaiuGdQJ2XHbxkh4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSAPR01MB2178.jpnprd01.prod.outlook.com (2603:1096:603:1a::14)
 by TYCPR01MB10494.jpnprd01.prod.outlook.com (2603:1096:400:306::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 01:31:04 +0000
Received: from OSAPR01MB2178.jpnprd01.prod.outlook.com
 ([fe80::173f:d892:3d66:397d]) by OSAPR01MB2178.jpnprd01.prod.outlook.com
 ([fe80::173f:d892:3d66:397d%4]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 01:31:04 +0000
Message-ID: <87o7fy4ey0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v7 5/5] ASoC: audio-graph-card2-custom-sample: add CPU/Codec =
 N:M sample
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
Date: Mon, 13 Nov 2023 01:31:04 +0000
X-ClientProxiedBy: TYCP286CA0352.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::19) To OSAPR01MB2178.jpnprd01.prod.outlook.com
 (2603:1096:603:1a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSAPR01MB2178:EE_|TYCPR01MB10494:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ac7331f-9e06-48c3-7776-08dbe3e833e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tb7QlHc/VAcxiMldkl0/9tG8fPLnpA/0EY+A4uwZa+Drhn144Va0/mcSH6MjomED7nePImCk2hc5GdTO+RsbSnd/jUdjMl6H+EPCpXdr3mrHAcyPysFusdgrj7BqEQWcXsOE3dGl0LrrqiJmD9pVurQwfpflFqRlnu+vWLBsnXgL1BwM1uArf63myUv8BipKOAvkfvm0ZBz+FD7KL3LH0y1ZyVmMaSuBw791/+n1fTgcftPkS+1ggxZEXNa272DqrGtQRxn6iSBXEdeodxrGg9HA83nqkHP0cjdsMQlGy98CvkA1ULtSy0ErBRHuowxw/RdnA/5I/+HyuB/4F2PIyFLzYtl4PM5K/L05Ho+CWBoyYp+DlGEJtoO0HXqO8xCqLRXZSehcUoQ3Js8kaiTIwb3cVa2VZReOJzTW+L3hXyQoS10yVWAieZSmdspiXgrYa42q95IRpCMStjST7e4h9irjiO0msnseLxogSrelj0KXT2HIb7V67q9JRa3LOT5laKz2blB0YkRUAJVNiiyOWPunXa5zsG5rYU5SqpscsN2CwN06IzUMjXXcvsPEL6TZrWY5fwAdc6b/9uXpbMvo5FgpzvInglY55MwGiKaNgjk4FUtvHZRoI3t2cZ6Swe0fpDGlHYekq0UqYLtsz7M9Mg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2178.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(39860400002)(376002)(366004)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(2906002)(6506007)(52116002)(478600001)(86362001)(26005)(2616005)(6512007)(316002)(66556008)(66476007)(66946007)(6486002)(38100700002)(83380400001)(5660300002)(2013699003)(7416002)(38350700005)(8936002)(36756003)(8676002)(4326008)(110136005)(41300700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mBWSHUN/YyuQDOskLlgssbwPXuYB9KZYtU7qXCVYM3dJvSqDwQWh7gph4PzP?=
 =?us-ascii?Q?xOwXifahymNYNwBtBUieucWyI+qf5GgbNMQFHrmEi6QpW6YunyzZ6oUPgpDA?=
 =?us-ascii?Q?4KBWXD9oxJgyFaiTT1ztKDByDc6l8tUSYP+VfD4IIQr86HAloIMzQ1D9MjTh?=
 =?us-ascii?Q?qmoHePFhIJf87mcH6xivnw080UO57hbeY3Fxw65NoOWhLPCjD/FuAAYDi9Vx?=
 =?us-ascii?Q?IIoCWy6fDFtTkOor0k2VCzGbSDzVFvKAiOlmsViAsO6hSmbKlacJTkPuEjJh?=
 =?us-ascii?Q?ej7Nu3IOV59kWNiIOtnDXMMDhwKQdcmUMsxTZh7elhBSpMMk+p6kZO6Mk4jT?=
 =?us-ascii?Q?DkZ0HEMk9yV+IHOFog7en2GaOJyYbP1ftbqfL8V23z7ajIRFHLAztts+w04H?=
 =?us-ascii?Q?fLMPC30XVi5U7J3DrruV/B/aS6/wGDT1EhlZbMplfx63IuiiNZIOS0PuWkf7?=
 =?us-ascii?Q?1WK+yfZ8gmYVBko+Qd77e0uf1ApLZABh+jERy6pN5YsY7uN9lW9yru/Iw6C2?=
 =?us-ascii?Q?2XInJ2gs+Llexx2i4k1dqhI/rNlUqnCPZh6XCzoGYCfOEvmZs5NeJDR6GD7+?=
 =?us-ascii?Q?ar1ucu4EZJyxWj0CsV1zbICHy8iCOVg89Aj6sAs2UYe2XAk1IMgrU+e5zwaH?=
 =?us-ascii?Q?ie5xLk2I79nNxQX0p1WzyJ4m7PB5aBZCkq3+cPSXCowFuBDVoWnwcKF2k5sr?=
 =?us-ascii?Q?3zyF7Dd/2P38CKVzuKK8rxRRN1QqIwBBaebR4XkKRBGkYgJQ9qpGBjrlmvaT?=
 =?us-ascii?Q?iq3bLVw0kPlYRp6udP5HunVXu24AXQ+arrYpGfcOjZpDWYe86JVDVjv8fbxM?=
 =?us-ascii?Q?21NVDJpPvi47YUbo4urIfKFPBMB2fObJCMLRGR7YY2xN20/MAdsuIFVz0wf2?=
 =?us-ascii?Q?/VzhV6lDco8YbErQcSK+EgiIUJEh++ulpZsrnd0j02fzNN016KJi2J6E5Sk2?=
 =?us-ascii?Q?+13C5j9T3aXZdmbOTpqjj9USy9e7p8GLafy6bABH49PTB+89/NYx1SCHXpt1?=
 =?us-ascii?Q?9eUSSfoHtTT8UHNDbCsOlpsSBlEnk7rtjscmtn6n7w2SGGvbswZAnBw4CsrX?=
 =?us-ascii?Q?zvv6LVuGwRvCxQ8U1hPYfwuL0QGkqpus06LhyJeH2oSQmkiJn8y+Sl8H9dq8?=
 =?us-ascii?Q?EXOcMRWVqBWTzBj9ngdEJGtil4fk7mhqBg0RPtDxDAcZAj3oazIMfI7CdZcc?=
 =?us-ascii?Q?bBQ4NlIjN8+RVWvx23z0nTS5N/YObzHnSrIvYRNRAMoFtp7bnrr9gUmNi07T?=
 =?us-ascii?Q?7c/i4+bcd4M9IzE+uZUj1prO+2AHBuTcrZJqoleJbV7JTyrTnSEDsbY4fgzK?=
 =?us-ascii?Q?cBJN4NibQsyTusAtr3HGOiRqYV8yvQNH1MHnPB5ly4ZFbNCcTIBLMPW4DsWM?=
 =?us-ascii?Q?mFXk7rzosID4tgKv40ynb/Ax7kvOkL6X6Czdct/xIZJY5laMVgUD+yxryzvv?=
 =?us-ascii?Q?14BJHgA6bSF3jOAeahEduPmicsxzon8YoNfzj17bDAvxrt0Kg11RBqcyNkkq?=
 =?us-ascii?Q?onWbwSz3Zk1xz8uSG03A+tevHCMaO5lvV8cE8NShGKib7Ue11aA59tha8jgl?=
 =?us-ascii?Q?aicnGcQtW+hGpVIF9agf1sQk9VdDlObfZ50v854vrQ45flLDwVT+tUTyi06D?=
 =?us-ascii?Q?eO3SB2fJZx818qnw9Thv6fs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6ac7331f-9e06-48c3-7776-08dbe3e833e9
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2178.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 01:31:04.6839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 boS3PopquMlsa7Z9yWULxiZ1bo9mbI5/91ONI3sB6/Sabfc8H8DxRPTbeTx2J+4msj6cvEgkMRJV8jym97eJhfdoj6xfS6PjeHGVaSCgN/P+Oky7UXysSzaXlTvdwFKK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10494
Message-ID-Hash: UVGNSMVHCQZQQXPLCKOLLGYKVY33MW7V
X-Message-ID-Hash: UVGNSMVHCQZQQXPLCKOLLGYKVY33MW7V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UVGNSMVHCQZQQXPLCKOLLGYKVY33MW7V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now ASoC is supporting CPU/Codec = N:M connection, add its sample
settings.

One note here is that it has many type of samples, it reached to
maximum of sound minor number. Therefore, new sample is disabled so far.
If you want to try it, you need to disable some other one instead.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../audio-graph-card2-custom-sample.dtsi      | 199 ++++++++++++++++++
 1 file changed, 199 insertions(+)

diff --git a/sound/soc/generic/audio-graph-card2-custom-sample.dtsi b/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
index 7e2cd9cc3fa8..9efd31206c9b 100644
--- a/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
+++ b/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
@@ -64,6 +64,26 @@ / {
 	 *	cpu2 <--| |		| |-> codec2
 	 *		+-+		+-+
 	 *
+	 * [Multi-CPU/Codec-1]
+	 *
+	 *		+-+		+-+
+	 *		| |<-@--------->| |
+	 *		| |		| |
+	 *	cpu8 <--| |<----------->| |-> codec14
+	 *	cpu9 <--| |<---+------->| |-> codec15
+	 *		+-+	\------>| |-> codec16
+	 *				+-+
+	 *
+	 * [Multi-CPU/Codec-2]
+	 *
+	 *		+-+		+-+
+	 *		| |<-@--------->| |
+	 *		| |		| |
+	 *	cpu10 <-| |<----------->| |-> codec17
+	 *	cpu11 <-| |<-----+----->| |-> codec18
+	 *	cpu12 <-| |<----/	+-+
+	 *		+-+
+	 *
 	 * [DPCM]
 	 *
 	 *	CPU3/CPU4 are converting rate to 44100
@@ -156,6 +176,26 @@ &sm0
 			 */
 			 &mcpu0
 
+			/*
+			 * [Multi-CPU/Codec-1]: cpu side only
+			 * cpu8/cpu9/codec14/codec15/codec16
+			 *
+			 * Because it will reach to the maximum of sound minor number,
+			 * disable it so far.
+			 * If you want to try it, please disable some other one instead.
+			 */
+			//&mcpu1
+
+			/*
+			 * [Multi-CPU/Codec-2]: cpu side only
+			 * cpu10/cpu11/cpu12/codec17/codec18
+			 *
+			 * Because it will reach to the maximum of sound minor number,
+			 * disable it so far.
+			 * If you want to try it, please disable some other one instead.
+			 */
+			//&mcpu2
+
 			/*
 			 * [DPCM]: both FE / BE
 			 * cpu3/cpu4/codec3
@@ -295,6 +335,150 @@ ports@5 {
 				port@1 { reg = <1>; smcodec1_ep: endpoint { remote-endpoint = <&codec12_ep>; };};/* (A) Multi Element */
 				port@2 { reg = <2>; smcodec2_ep: endpoint { remote-endpoint = <&codec13_ep>; };};/* (B) Multi Element */
 			};
+
+			/*
+			 * [Multi-CPU-1]
+			 *
+			 *		+---+		+---+
+			 *		|  X|<-@------->|x  |
+			 *		|   |		|   |
+			 *	cpu8 <--|A 1|<--------->|3 a|-> codec14
+			 *	cpu9 <--|B 2|<---+----->|4 b|-> codec15
+			 *		+---+	  \---->|5 c|-> codec16
+			 *				+---+
+			 */
+			ports@6 {
+				reg = <6>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			mcpu1:	port@0 { reg = <0>; mcpu10_ep: endpoint { remote-endpoint = <&mcodec10_ep>; };};    /* (X) to pair */
+				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+					mcpu11_ep:   endpoint@0 { reg = <0>; remote-endpoint = <&cpu8_ep>;       }; /* (A) Multi Element */
+					mcpu11_ep_0: endpoint@1 { reg = <1>; remote-endpoint = <&mcodec11_ep_0>; }; /* (1) connected Codec */
+				};
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+					mcpu12_ep:   endpoint@0 { reg = <0>; remote-endpoint = <&cpu9_ep>;       }; /* (B) Multi Element */
+					mcpu12_ep_0: endpoint@1 { reg = <1>; remote-endpoint = <&mcodec12_ep_0>; }; /* (2) connected Codec */
+					mcpu12_ep_1: endpoint@2 { reg = <2>; remote-endpoint = <&mcodec13_ep_0>; }; /* (2) connected Codec */
+				};
+			};
+
+			/*
+			 * [Multi-Codec-1]
+			 *
+			 *		+---+		+---+
+			 *		|  X|<-@------->|x  |
+			 *		|   |		|   |
+			 *	cpu8 <--|A 1|<--------->|3 a|-> codec14
+			 *	cpu9 <--|B 2|<---+----->|4 b|-> codec15
+			 *		+---+	  \---->|5 c|-> codec16
+			 *				+---+
+			 */
+			ports@7 {
+				reg = <7>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 { reg = <0>; mcodec10_ep: endpoint { remote-endpoint = <&mcpu10_ep>;  };};   /* (x) to pair */
+				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+					mcodec11_ep:   endpoint@0 { reg = <0>; remote-endpoint = <&codec14_ep>;  }; /* (a) Multi Element */
+					mcodec11_ep_0: endpoint@1 { reg = <1>; remote-endpoint = <&mcpu11_ep_0>; }; /* (3) connected CPU */
+				};
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+					mcodec12_ep:   endpoint@0 { reg = <0>; remote-endpoint = <&codec15_ep>;  }; /* (b) Multi Element */
+					mcodec12_ep_0: endpoint@1 { reg = <1>; remote-endpoint = <&mcpu12_ep_0>; }; /* (4) connected CPU */
+				};
+				port@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+					mcodec13_ep:   endpoint@0 { reg = <0>; remote-endpoint = <&codec16_ep>;  }; /* (c) Multi Element */
+					mcodec13_ep_0: endpoint@1 { reg = <1>; remote-endpoint = <&mcpu12_ep_1>; }; /* (5) connected CPU */
+				};
+			};
+
+			/*
+			 * [Multi-CPU-2]
+			 *
+			 *		+---+		+---+
+			 *		|  X|<-@------->|x  |
+			 *		|   |		|   |
+			 *	cpu10 <-|A 1|<--------->|4 a|-> codec17
+			 *	cpu11 <-|B 2|<-----+--->|5 b|-> codec18
+			 *	cpu12 <-|C 3|<----/	+---+
+			 *		+---+
+			 */
+			ports@8 {
+				reg = <8>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			mcpu2:	port@0 { reg = <0>; mcpu20_ep: endpoint { remote-endpoint = <&mcodec20_ep>; };};    /* (X) to pair */
+				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+					mcpu21_ep:   endpoint@0 { reg = <0>; remote-endpoint = <&cpu10_ep>;      }; /* (A) Multi Element */
+					mcpu21_ep_0: endpoint@1 { reg = <1>; remote-endpoint = <&mcodec21_ep_0>; }; /* (1) connected Codec */
+				};
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+					mcpu22_ep:   endpoint@0 { reg = <0>; remote-endpoint = <&cpu11_ep>;      }; /* (B) Multi Element */
+					mcpu22_ep_0: endpoint@1 { reg = <1>; remote-endpoint = <&mcodec22_ep_0>; }; /* (2) connected Codec */
+				};
+				port@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+					mcpu23_ep:   endpoint@0 { reg = <0>; remote-endpoint = <&cpu12_ep>;      }; /* (C) Multi Element */
+					mcpu23_ep_0: endpoint@1 { reg = <1>; remote-endpoint = <&mcodec22_ep_1>; }; /* (3) connected Codec */
+				};
+			};
+
+			/*
+			 * [Multi-Codec-2]
+			 *
+			 *		+---+		+---+
+			 *		|  X|<-@------->|x  |
+			 *		|   |		|   |
+			 *	cpu10 <-|A 1|<--------->|4 a|-> codec17
+			 *	cpu11 <-|B 2|<-----+--->|5 b|-> codec18
+			 *	cpu12 <-|C 3|<----/	+---+
+			 *		+---+
+			 */
+			ports@9 {
+				reg = <9>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 { reg = <0>; mcodec20_ep: endpoint { remote-endpoint = <&mcpu20_ep>;  };};   /* (x) to pair */
+				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+					mcodec21_ep:   endpoint@0 { reg = <0>; remote-endpoint = <&codec17_ep>;  }; /* (a) Multi Element */
+					mcodec21_ep_0: endpoint@1 { reg = <1>; remote-endpoint = <&mcpu21_ep_0>; }; /* (4) connected CPU */
+				};
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+					mcodec22_ep:   endpoint@0 { reg = <0>; remote-endpoint = <&codec18_ep>;  }; /* (b) Multi Element */
+					mcodec22_ep_0: endpoint@1 { reg = <1>; remote-endpoint = <&mcpu22_ep_0>; }; /* (5) connected CPU */
+					mcodec22_ep_1: endpoint@2 { reg = <2>; remote-endpoint = <&mcpu23_ep_0>; }; /* (5) connected CPU */
+				};
+			};
 		};
 
 		dpcm {
@@ -440,6 +624,14 @@ ports {
 
 			/* [Semi-Multi] */
 			sm0:  port@7 { reg = <7>; cpu7_ep: endpoint { remote-endpoint = <&smcodec0_ep>; }; };
+
+			/* [Multi-CPU-1] */
+			      port@8 { reg = <8>; cpu8_ep: endpoint { remote-endpoint = <&mcpu11_ep>;   }; };
+			      port@9 { reg = <9>; cpu9_ep: endpoint { remote-endpoint = <&mcpu12_ep>;   }; };
+			/* [Multi-CPU-2] */
+			      port@a { reg = <10>; cpu10_ep: endpoint { remote-endpoint = <&mcpu21_ep>; }; };
+			      port@b { reg = <11>; cpu11_ep: endpoint { remote-endpoint = <&mcpu22_ep>; }; };
+			      port@c { reg = <12>; cpu12_ep: endpoint { remote-endpoint = <&mcpu23_ep>; }; };
 		};
 	};
 
@@ -498,6 +690,13 @@ port@3  {
 			port@c { reg = <12>; codec12_ep: endpoint { remote-endpoint = <&smcodec1_ep>; }; };
 			port@d { reg = <13>; codec13_ep: endpoint { remote-endpoint = <&smcodec2_ep>; }; };
 
+			/* [Multi-Codec-1] */
+			port@e  { reg = <14>; codec14_ep: endpoint { remote-endpoint = <&mcodec11_ep>; }; };
+			port@f  { reg = <15>; codec15_ep: endpoint { remote-endpoint = <&mcodec12_ep>; }; };
+			port@10 { reg = <16>; codec16_ep: endpoint { remote-endpoint = <&mcodec13_ep>; }; };
+			/* [Multi-Codec-2] */
+			port@11 { reg = <17>; codec17_ep: endpoint { remote-endpoint = <&mcodec21_ep>; }; };
+			port@12 { reg = <18>; codec18_ep: endpoint { remote-endpoint = <&mcodec22_ep>; }; };
 		};
 	};
 };
-- 
2.25.1

