Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEE07E942A
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Nov 2023 02:39:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC3B7AEA;
	Mon, 13 Nov 2023 02:38:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC3B7AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699839547;
	bh=3CGvLqXz9Fe3ryLVVBq2GTnMQedhc0u01mIB+g+5NSE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bPOC240030Ix1ReBCg7ZfxL96OtvG7gPHtK4rfvoSbrL+bg/12N012i2w1sOJMLQX
	 lFR5KrApmuFm3I4l5/MT+t13xAlcYRVEgR3u8mRnMjHpOlsaMyOlMAoh9tIiQiEG3/
	 4Kj0bU7yBpeWb2w9UasvbDjAHc/qhm1WfgFwVpBg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39BE1F80587; Mon, 13 Nov 2023 02:37:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F0A8CF80579;
	Mon, 13 Nov 2023 02:37:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EB66F801D5; Mon, 13 Nov 2023 02:30:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D1360F800ED
	for <alsa-devel@alsa-project.org>; Mon, 13 Nov 2023 02:30:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1360F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=aoj1vI2d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V1Udm1vkl8j2OeLF8d9IwUqLfGAACchufkhbvOh6AyUhP4CHh42/x/k6GazIB7tm8x97eDuEFmEj+4HTAfYgPM0V7YtqrN33lI8JwNh3cyKh252dJcWKiQyHoJSIKwIbtyNsviRGd1F6nqmLM50+zqvFQkE73zpT2JlkV1fMDH5bsFMS7PHjoc2+DpuUNwyi37DnHRCuztHu4X7em3UtoGPlTns2DJxEZ+cLf2a8Uq4jSrg3Y1bLYqRs7rfzDnxD57acfRa77PYBxso45MG9XvrJ+xhq8qu0a4rz6la1AplLGnq8rTT0trg96brHRyNwy9iw0ZX7WRD1cOqnkjkJWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oy4vQekdgJiju5VL4wbaRDicu+/WFRmSLeiS8XpUl0I=;
 b=ZvpVYy5CBgPJO7sXujh0kqXhbbkgQcLgfkaioeLIeuSH1mHnIdLXgmSataKrgHIndOwbqu9CPtoK1bYMTVGtSzvcR9YNck1f4lgeBsURdfOMZyyff90ZFVhrN2J76MVddkyD03W3iPxaC8M6NdTsmabNjXWBTPzKQgwA+hePS0tHyuoUnaNkXaMXQ+cykIorZKnADmKEtrcySqZvwV3lBETg48KhbLn1TYfJfzNFWoJMZFrbrzDs2UA1AqlgQDQ4j74aXMK0BXXuNE2cIIah23DoMVCLkfzNJNkFgEdOy18eU+o90XH3SIS9HqH+hdttN4gn/z/OgY/T9+n8GuWFXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oy4vQekdgJiju5VL4wbaRDicu+/WFRmSLeiS8XpUl0I=;
 b=aoj1vI2duWFKbueGqJl0Wf6Wnn+/Ac5sTXZwe8bTkpTcNVEWiK0eUQl/10hYtT3E3s17mO/2mPJxo6+QSLN+vqo8Zv4IE9tXh6UaCWTIp3bPrBlEv4Xd/IXkamrH0YWCr3nZHu1Xi10hL6/zsjsxGU9lahWH0HQBm3CxK1PuV+g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSAPR01MB2178.jpnprd01.prod.outlook.com (2603:1096:603:1a::14)
 by TYCPR01MB10494.jpnprd01.prod.outlook.com (2603:1096:400:306::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 01:30:10 +0000
Received: from OSAPR01MB2178.jpnprd01.prod.outlook.com
 ([fe80::173f:d892:3d66:397d]) by OSAPR01MB2178.jpnprd01.prod.outlook.com
 ([fe80::173f:d892:3d66:397d%4]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 01:30:10 +0000
Message-ID: <87pm0e4ezi.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v7 4/5] ASoC: audio-graph-card2-custom-sample: Add connection
 image
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
Date: Mon, 13 Nov 2023 01:30:09 +0000
X-ClientProxiedBy: TYAPR01CA0066.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::30) To OSAPR01MB2178.jpnprd01.prod.outlook.com
 (2603:1096:603:1a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSAPR01MB2178:EE_|TYCPR01MB10494:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f95a495-a6a9-4aa8-97d1-08dbe3e81374
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	x3uGPSKAYM4aUodXj50yi4DVxGaat5wRyesmF0Ci/PnobwA1Yw3w+OWHM5NJ3Pkb5OEjsH0hbld5QptO650fSP1SKcS9sV1d8xSjtpnanB1BeEMTBm/Cw96TR1IDuKrPECRa6vQ0N59bt5Sq0AA28iRvXucqy2smqTa4P41P+w430CO7iThDF2U+rI8nlyQvHl2B2270cja5uN0B/oGVPlNFV4pODuw557I5XZx8GV6IrC6V71hvhi1TFQp38ZJarfgqMND9guaIarWCawJstg4X6M4AYUB+bnlymY52weElLTPTSD9mkJ/r2TIsMw4P7lTmnCj2rIS10G4opgykNWxtV3jcNiuIX/F9EK4Q0GoeV0iPM8P1tETs0HR00S4eOpsORJu9PfK5gb7V2+H8iSSZOxRkqwLe01EJzOtRnFCyM+qvg2tK906FJvwRYx2pjMhTqwmebAPMZNDgGSNz9d5161u22E7TqrNXw1OaihcwlY1XXtL2WF1j8J+DQsPGO58GGp6jOenBolZwk0vKD/Jc29eBOBYjpD3PDDfJbPxAaqjnmQO9yUES4PfsoW+5TdNH1HuTGZUPVCJXC2zmb/fj4y0pLLEcEZX2wCr1vPOwmxuJc4GM+TPrXW+f1e4jChjQSa37P9eBvcaf7zP6kA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2178.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(39860400002)(376002)(366004)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(2906002)(6506007)(52116002)(478600001)(86362001)(26005)(2616005)(6512007)(316002)(66556008)(66476007)(66946007)(6486002)(38100700002)(83380400001)(5660300002)(2013699003)(7416002)(38350700005)(8936002)(36756003)(8676002)(4326008)(110136005)(41300700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?loqWiqhPZrOl4NAMR9fERkFnJTCtSAZ1oIu6zHXf6T5WhIspPeoUDNfhd0wm?=
 =?us-ascii?Q?DV3yH+s+ublkwDM938Szx4C6HI+bBXHTBoQVP4nNg7qkiS3R5VCk+MHTEGGk?=
 =?us-ascii?Q?03p1MqmNoeUrYZtw3bCGMnRODEjXTae1ImD8OsMD51AMaYJrmW1y/Y4Q7Zy5?=
 =?us-ascii?Q?O5lSuGKp5NuUd/77RIu9cU1AgzpzTPaHETRD9oYpQNJvZCaO9ARx7+EtaAr7?=
 =?us-ascii?Q?53SXc9diiwYc3m/hGFfYo0X0Ni5ZimxM8EDP5s3qir0a56haDBKnfzCvjX2O?=
 =?us-ascii?Q?f8Mh2to8zpO0IVPTfXrrzp+M6l+v68+mT5430r2pEDtEyDUZiGdvb/mxyDZr?=
 =?us-ascii?Q?Bf3vagVFusw9zaGSCjb0cXIsH7FM4s35DWhlbiKFttd/s0sHpd3PNHEYhD4i?=
 =?us-ascii?Q?S1uHZ8eK8oNEkUAPTKn/Rfcce97mAApnco6a1Dj9OgDr7GSfZc6Ff/sz8eBV?=
 =?us-ascii?Q?bCP4cnbi//vkVRaX32jpwunMmoMU5JSORoWsDrH0tVBFnaM4sU91pEU2Uau+?=
 =?us-ascii?Q?ci5kAxOqd/M0Hm4bvfTxGqUiGKp+E0o405LlEfj8uBvNQwKIYfopXJ4FI/DY?=
 =?us-ascii?Q?jMlfBVxaK91O6jD8CFw51yJZMY6GLD4aiqRXm+4mGa0ozwW40tlOyg1RHica?=
 =?us-ascii?Q?xAaahn62c382GcslLfjX+oVtzx7HRrUVPdxfs+fZHaV9XwluCOOrUK4HRnG3?=
 =?us-ascii?Q?AYsU4mMZx0jttKLsUWdbVChInVinxAPVjtTKOGEXCIsadK77Ufgf5SvhphnH?=
 =?us-ascii?Q?OFqtGlN1Aq92Yif4GX1BLKz1SycAK97lfY+3dN+5ywCCsyMzFtjGnARpduw+?=
 =?us-ascii?Q?rSiusiai58jDFkruRbug8xdhFn3TE2sEHocRQ0DrMc2DxlMkpWKhXcBqGbVi?=
 =?us-ascii?Q?VsJHfF79BlCtuxwpUIdH+Tz/mxtNRr7leQ+PSbXE1Z0RcRxAsY3To7i/Cvht?=
 =?us-ascii?Q?htocnX3DUUEqDoLBYI9Ve1XCey8MrwP5gS7N7xhqB+ZQDVgiPxMjQ2Tl1hxW?=
 =?us-ascii?Q?Y/arX6M7RPEc9r9Cv6i3Wg9fr3rOFjBVTSF5Ve2MYMYgjTGAFYMlw2rrnSI+?=
 =?us-ascii?Q?XrlCdq/DQJ0XtXoPi3CEHy80BA7VLiZwUS7ZCvAkqcpeX2td9oO0pXgma0A7?=
 =?us-ascii?Q?zAvuwnnK+V0G4fjch5IaibWhaMmt8vHywINZO3KFY8VetESxIV6hognDn4TV?=
 =?us-ascii?Q?Wn3OYc9sxyzVj9oR1OMNDl5UQQWdF/XMwxkkKMwHPaA6aaeI/GIYfLk50Hny?=
 =?us-ascii?Q?fkOGRQa7mQQAQY2KJBxi4Sh9w6y6fiYwWVNMXWFueD4XIaTqw5WjuAuZ/W6M?=
 =?us-ascii?Q?w5L+JDv587fD9c+40cF2MnqSpBJoQkZXFCYLqI98IR4lbdv5AKIDwNB+uLT+?=
 =?us-ascii?Q?3aaSaId4VAqMMTLmU63q+sLPRik/MxhKGiRO18y26CSnG8z6wXYsd3hCV5Sx?=
 =?us-ascii?Q?/J+dJ1cy/0U56QpLo/ZlK5isjIWruyvlIEUU6gKRqtUeK9/co3uqk2n9TOIL?=
 =?us-ascii?Q?F82JZ6ylJP6tmnUjPF9+IXkwNhib/frr6lvJumFKn7d1p99d6ubrO48sio/1?=
 =?us-ascii?Q?pnnQZS67CO/E/Gk3/AYy+elCY1fdAczpQ/BDACtYtrjkeumdh1kQIA0En+id?=
 =?us-ascii?Q?tJ8TE/JamJCezUS7vOu2aNg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5f95a495-a6a9-4aa8-97d1-08dbe3e81374
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2178.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 01:30:10.2326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 oaDH8MPM24ypnC950zhwgjWHGRhDdXxFxEadCqn7G65vbIr4m/H0TSN4UvLENwgLhtyFCWOhPKnDi6aM2BJ5TZYMZPRcYR9HSWrRX6uv1Yc7vHGq7nlzh0oFpxKlKWfT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10494
Message-ID-Hash: L7OXFGBLUN56N5V7ME7NZTG3CFCUC2YI
X-Message-ID-Hash: L7OXFGBLUN56N5V7ME7NZTG3CFCUC2YI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L7OXFGBLUN56N5V7ME7NZTG3CFCUC2YI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Audio Graph Card2 is supporting many type of Sound connections, but
thus it is very difficult to understand how these are connected.

To support well understanding, adds each connection images and indicates
each settings are for where.

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

