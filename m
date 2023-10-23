Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB307D29CA
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 07:50:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4C0C84B;
	Mon, 23 Oct 2023 07:49:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4C0C84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698040244;
	bh=n0GknqHwPFWT/zKdn0snzw6tbtBqGLBzQ2k4OGXmQes=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bIRJVrWXqIxopAYXVkWUcz22momL/AvEXOLczS0LL8CjAGCwbg/4UYS1BaqsIkvUZ
	 NLZKbyuuizjZlgikTCpwQ/vXIzEkbemL8tOECeaHBmizMcHU3l2blIpYvliqVZzV4m
	 qD1wNTxndVtPzyJVPlfyM6jvhv9Zsi2VAcOmvblE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6BC99F80536; Mon, 23 Oct 2023 07:49:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 91B5FF8032D;
	Mon, 23 Oct 2023 07:49:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91295F8032D; Mon, 23 Oct 2023 07:37:58 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C2BE4F80527
	for <alsa-devel@alsa-project.org>; Mon, 23 Oct 2023 07:36:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2BE4F80527
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ivImqtUI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FSePvkr5dKUT5d8tjurCzkxf2SSU8xD+Ele7/yCI9+CmD7CDq17NAxzOozt4NV+5mMR6JFzaIqzW9CN/8zCpzSt9wqqlMXvGJKYVjWlZgyIBjbHpUGqO2E+MbGWnnmwXVynTAEj5XaayNHidMVwMlgLFl06nVbyGScJkmN87ykw8h37f3hO7BMVTW7lyzEnpCJS8bgOjRujoF1y2NtwvopjSjuFHvIIgoe7wicgIFchuHN4ObLpjj68E4mjgMSPQuxxf3PA49K9DKjC4FjJdE+OFuBvSWsQkRVkwSOs+dr3EnAPalT18QI0wchNYpoS37+DavmeFn8cQcTwfyLfxBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mBarzRxQ9weni+UdJc4p0ndVo9W4V+NxVpUaRSYdPb4=;
 b=NZIm8RsyGWXgZOVlQ631U9tjneungwUAshW7a+FBYgVpFQGXLaeYfb64e+qMlnR/Mf4wL9eUWEYdCq2CbREHRVkOnh6pyZXeEJUV70dHQ85GIK4elLLbvXI6mv1osl5q6zRh1WhtXkTHi+CMxsiZLXvzjV0Z5MhCgCEC1l0R3X6Ldes3XwKA8UY1SYEzLqreE42bc9jv2iU0lAdLkpSyvAo7LYqfzgRe6UpS0jH6Ar3cPH1SEwXuV4AQLol4o4mCfXFvtKKKIzXOPAwLgd5hZDnZsm4R0GIloecS0l9ZhbjXZSDOERP2U5tJQgs2yJjXbK8carahBvGVtwJ69/H3cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBarzRxQ9weni+UdJc4p0ndVo9W4V+NxVpUaRSYdPb4=;
 b=ivImqtUInvWpGRma6pu4i5nQTl+glQP34zXtiLaH7IyrF3Mhr8uLRNW04qNaJhSUbAoEzPuiVPJZwg5wv7SjtYTEPOn5sjRuifsfueg3Y86PwJRrxyjyZ/yVMXi+6iEvWZs/cRibh5XzpN+UcjahZncXcwotzC/+mUJ8/IRYPG0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8242.jpnprd01.prod.outlook.com (2603:1096:604:174::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Mon, 23 Oct
 2023 05:36:03 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::be8:b648:c989:8e7f]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::be8:b648:c989:8e7f%4]) with mapi id 15.20.6907.032; Mon, 23 Oct 2023
 05:36:03 +0000
Message-ID: <87y1ftkiik.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 4/5] ASoC: audio-graph-card2-custom-sample: add CPU/Codec =
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
In-Reply-To: <874jihlx44.wl-kuninori.morimoto.gx@renesas.com>
References: <874jihlx44.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 23 Oct 2023 05:36:03 +0000
X-ClientProxiedBy: TYCP286CA0331.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::10) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8242:EE_
X-MS-Office365-Filtering-Correlation-Id: 267f0d2c-8ce2-4886-0c2b-08dbd389f27b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	H6mN9trSs2+j1samxQ27naM07kM0coJ7O7sMoLasMg/S7s4HmJSUt21EZ7qBgf/aPn1Nhi1t15McTUTCTjlr0g8mGnVKOmd4/YmlpaEreRovvvyt7hmtXIHxJzEX5Z874/fPpgHTUuSv/4Yi0xmkvaPRLrRtUcn1h4Qo8+kRJtYtZRqFNIghoDef+Diz7BfdIUOViU5wzSaZLShmZGham2FaCvyiSvtYjhcr8J2RfO5V6DAqFkIJbzfd26+nXl0Z55qz3POUxXbG18grFdt3YS6Rt4rAJfMkmpMrgkuVTfib7ry4bZR0MZ5f2EGQLxouJhhyEG448ooPNKQJOP8RTYxXOd9aCKTEasFxE5T0GUTpulWlM9NQ7HzfI2gpbZ5SEHltksGkWug3Q4TDsvTjVYjHOeKWg5pvu3cFaHlNBUXUqjtCh7lsnsMg6hm7cZTva14yle8VyAdTc+IYDm95g4/mtVIj+xz0u9MGbaiX+cH1dc8lf6Hzgimhw1X/OKaDoYLf/V1OYma11y2G4TwyrT/kHA9rg5Sc3OhyS5UgqKIMTCP6V3+MBvUXukw57XPPaFTRgoR7Zg9rx1J2hoVtrCWR1i02Qvlu9IHwhfP8hXEnuMo2vlFbdt9x4Q5Ac4FTa1/U/jDah3ZSBmiGQTyXMQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(346002)(39860400002)(376002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(38350700005)(36756003)(38100700002)(66476007)(66946007)(66556008)(2013699003)(110136005)(6512007)(86362001)(2616005)(26005)(52116002)(83380400001)(6506007)(2906002)(6486002)(7416002)(316002)(478600001)(8676002)(41300700001)(8936002)(4326008)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?D9VQamQ2U0AXdjW+W491BrT2R0JcErvu7jlh6SPOwLZvt7BMawCttdXxyGuy?=
 =?us-ascii?Q?3xSFBRKuSRdjih54Na0fPAD+ZB6vN3Q+f2Wo8r+eqr0rTpLL65tZeGbgDPOl?=
 =?us-ascii?Q?ErYTLE712e+k5az9VlNwocFkV5xguO/R+NDA7TDE46S0OaF6RPpB+K15mU9O?=
 =?us-ascii?Q?p5IdleMnanlMpsJVqNdfA1DeG0C5D1+p/3Lu/XpmtksSfeSgZ6FIT1CCd5Pc?=
 =?us-ascii?Q?CNpQN8sF6p5OeLTw+zvMfnz3lhNuRMT2H+AwFrw0sTjv3yGrMWvWNm+rXHS9?=
 =?us-ascii?Q?lEOVFfViGrzuJUvtYJckcYFysPq4oEaZ+f1D57ClUE8ffks5Y4mY0TJ2DlK9?=
 =?us-ascii?Q?tC59aEyvXwneuLniaD46PimiFHU+RtE3fWdJZANPFxmXcKvY9C9YV5zZ8sEE?=
 =?us-ascii?Q?AE+HbjzH/kU0wdS48r/3vxqa+ReAq03w9InFHkvdwbEaz7JiBUdTnJNY0e7A?=
 =?us-ascii?Q?Bu2r9lubU0835NDzqmimaC96UArR03zrdThILRde0BwkSuI04rdYo750Y662?=
 =?us-ascii?Q?gPM8buqyXlM9IHeiIRDuW1CEbMkgPrS5cYs4XTU/qBXahzpze7Y6/VnVOHrw?=
 =?us-ascii?Q?VUjezorHaPgQmUBayfPuAIHLGQ+dGQ1uUp7wuxHNxjP47Cy/xnOZvdcb3ere?=
 =?us-ascii?Q?IdHJjLwyUoxghnslgPsaxor2B8Fiffg4DRadHwx7DxC7XAc0ogTF/7u4u1SD?=
 =?us-ascii?Q?A+/Pg+xsV2odzQZgJllbb69vEIcODGq2WSsyV1N+9AeSPu4HiwySYDA07NCB?=
 =?us-ascii?Q?FvVZm4Fb7ZQ+5R9nAEDuUpp2gn6GRyQW4majmGTL3qe3NH1oogCjUGXsGyBi?=
 =?us-ascii?Q?+krf8aaQwkCzuqEj7TAx8O97MVNL7o86qLnZ+HOW6YYBGPio6BKsyhsGrKkk?=
 =?us-ascii?Q?F1N30HlBwKMpJswN05h7zHRpcwcs1LN1n6PRVe2OcrMZN4B6FA4B+K7qE7KE?=
 =?us-ascii?Q?jDVHsTr6MRKzFqpJSo6c+1UBMFQiSn4kyGkQqG3U+xOCxJYwERy2UM6Y5s6V?=
 =?us-ascii?Q?d2AG3lF3kSCmvd0XwBj0tjy+ePO9AC3uSjA6bFtsaLNKf0uNSCAmnqzvPzVD?=
 =?us-ascii?Q?KjccqrpQt0DDiJIjmhUgEJPSXR5w4UZFpsX2/pTXPCyu48OABS5cIoe0ilVJ?=
 =?us-ascii?Q?eoid7+Jxv7NqgqDSBpm823Nb8nqLA4sl3VHDIQUV8xwMeQ+6JLvh/6xEBCYr?=
 =?us-ascii?Q?4uF8+NayYm0kTHlnA0D4fkMca8GOmNhS6SNtfY48242Plp9z2UEUnktMu9ZJ?=
 =?us-ascii?Q?c4Hd53709ZBaRWLGH1BeOx9pHWd/s/1SDHdFCGrYfTjRDZXtpg37dyhp8wkp?=
 =?us-ascii?Q?57/UD/m5j+tj4CTvzyJ4OE5RhcKtGeeNBLu4WMe9AjfltkCoDKn8JZc8x94d?=
 =?us-ascii?Q?4QgmrYnR2GFNdyljo9bsNDOefmTx/xuFzvXJnqWbWQ86/+rqnIh58PmF/dsa?=
 =?us-ascii?Q?qv2ToGYw18k/vJzcwVCXO92gQoQzrCkXS4XgzoGHRK2nmGggoBK6g6lsFpum?=
 =?us-ascii?Q?Vjl+4yw2goNfZ4TnfOsI6VX81zMtDQiX8ijlIyIVUfn46xgO78EIFzFqK8td?=
 =?us-ascii?Q?u9i1kt6OiJqvXo0H7LlW1w7m3VKDHEQh1xkdm7aEXwru8fALq1n5ZIIZVHEA?=
 =?us-ascii?Q?T5SRIEHJMHKHzN7ooEllCWQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 267f0d2c-8ce2-4886-0c2b-08dbd389f27b
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 05:36:03.7004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 fx217IHCGr14HLV9tZy6Iq4Sv5sTapSal6wwt4MX2g4DNWIrgWIo14odv/exr/v1u6rGcWVm0zIqjTQ+49ti45ARtF8A6YYToexDqmTm6vbO6SmaJ3FBjbw2A8sVQpml
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8242
Message-ID-Hash: FN2B4CWIQSYF2SKKHSPBYZIGKY4PHDR7
X-Message-ID-Hash: FN2B4CWIQSYF2SKKHSPBYZIGKY4PHDR7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FN2B4CWIQSYF2SKKHSPBYZIGKY4PHDR7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now ASoC is supporting CPU/Codec = N:M connection.
This patch adds its sample settings.

But One note here is that it has many type of samples, it reached to
maximum of sound minor number. Therefore, new sample is disabled so far.
If you want to try it, you need to disable some other one instead.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../audio-graph-card2-custom-sample.dtsi      | 99 +++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/sound/soc/generic/audio-graph-card2-custom-sample.dtsi b/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
index 736eca553d7c..fbbc203edee1 100644
--- a/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
+++ b/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
@@ -64,6 +64,26 @@ / {
 	 *	cpu2 <--| |		| |-> codec2
 	 *		+-+		+-+
 	 *
+	 * [Multi-CPU/Codec-1]
+	 * About ch-map / ch-map-idx (*), see
+	 *	soc.h :: [dai_link->ch_maps Image sample]
+	 *
+	 *		+-+		+-+		ch-map (*)
+	 *	cpu8 <--| |<-@--------->| |-> codec14	ch-map[0].cpu = cpu8	ch-map[0].codec = codec14
+	 *	cpu9 <--| |		| |-> codec15	ch-map[1].cpu = cpu9	ch-map[1].codec = codec15
+	 *		+-+		| |-> codec16	ch-map[2].cpu = cpu9	ch-map[2].codec = codec16
+	 *				+-+
+	 *
+	 * [Multi-CPU/Codec-2]
+	 * About ch-map / ch-map-idx (*), see
+	 *	soc.h :: [dai_link->ch_maps Image sample]
+	 *
+	 *		+-+		+-+		ch-map (*)
+	 *	cpu10 <-| |<-@--------->| |-> codec17	ch-map[0].cpu = cpu10	ch-map[0].codec = codec17
+	 *	cpu11 <-| |		| |-> codec18	ch-map[1].cpu = cpu11	ch-map[1].codec = codec18
+	 *	cpu12 <-| |		+-+		ch-map[2].cpu = cpu12	ch-map[2].codec = codec18
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
@@ -244,6 +284,48 @@ ports@5 {
 				port@1 { reg = <1>; smcodec1_ep: endpoint { remote-endpoint = <&codec12_ep>; }; };
 				port@2 { reg = <2>; smcodec2_ep: endpoint { remote-endpoint = <&codec13_ep>; }; };
 			};
+
+			/* [Multi-CPU-1] */
+			ports@6 {
+				reg = <6>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			mcpu1:	port@0 { reg = <0>; mcpu10_ep: endpoint { remote-endpoint = <&mcodec10_ep>; }; };
+				port@1 { reg = <1>; mcpu11_ep: endpoint { remote-endpoint = <&cpu8_ep>;     }; };
+				port@2 { reg = <2>; mcpu12_ep: endpoint { remote-endpoint = <&cpu9_ep>;     }; };
+			};
+
+			/* [Multi-Codec-1] */
+			ports@7 {
+				reg = <7>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 { reg = <0>; mcodec10_ep: endpoint { remote-endpoint = <&mcpu10_ep>;  }; };
+				port@1 { reg = <1>; mcodec11_ep: endpoint { remote-endpoint = <&codec14_ep>; }; };
+				port@2 { reg = <2>; mcodec12_ep: endpoint { remote-endpoint = <&codec15_ep>; }; };
+				port@3 { reg = <3>; mcodec13_ep: endpoint { remote-endpoint = <&codec16_ep>; }; };
+			};
+
+			/* [Multi-CPU-2] */
+			ports@8 {
+				reg = <8>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			mcpu2:	port@0 { reg = <0>; mcpu20_ep: endpoint { remote-endpoint = <&mcodec20_ep>; }; };
+				port@1 { reg = <1>; mcpu21_ep: endpoint { remote-endpoint = <&cpu10_ep>;    }; };
+				port@2 { reg = <2>; mcpu22_ep: endpoint { remote-endpoint = <&cpu11_ep>;    }; };
+				port@3 { reg = <3>; mcpu23_ep: endpoint { remote-endpoint = <&cpu12_ep>;    }; };
+			};
+
+			/* [Multi-Codec-2] */
+			ports@9 {
+				reg = <9>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 { reg = <0>; mcodec20_ep: endpoint { remote-endpoint = <&mcpu20_ep>;  }; };
+				port@1 { reg = <1>; mcodec21_ep: endpoint { remote-endpoint = <&codec17_ep>; }; };
+				port@2 { reg = <2>; mcodec22_ep: endpoint { remote-endpoint = <&codec18_ep>; }; };
+			};
 		};
 
 		dpcm {
@@ -340,6 +422,15 @@ ports {
 
 			/* [Semi-Multi] */
 			sm0:  port@7 { reg = <7>; cpu7_ep: endpoint { remote-endpoint = <&smcodec0_ep>; }; };
+
+			/* [Multi-CPU-1] */
+			      port@8 { reg = <8>; cpu8_ep: endpoint { remote-endpoint = <&mcpu11_ep>; ch-map-idx = <0>;   }; };
+			      port@9 { reg = <9>; cpu9_ep: endpoint { remote-endpoint = <&mcpu12_ep>; ch-map-idx = <1 2>; }; };
+
+			/* [Multi-CPU-2] */
+			      port@a { reg = <10>; cpu10_ep: endpoint { remote-endpoint = <&mcpu21_ep>; ch-map-idx = <0>; }; };
+			      port@b { reg = <11>; cpu11_ep: endpoint { remote-endpoint = <&mcpu22_ep>; ch-map-idx = <1>; }; };
+			      port@c { reg = <12>; cpu12_ep: endpoint { remote-endpoint = <&mcpu23_ep>; ch-map-idx = <2>; }; };
 		};
 	};
 
@@ -398,6 +489,14 @@ port@3  {
 			port@c { reg = <12>; codec12_ep: endpoint { remote-endpoint = <&smcodec1_ep>; }; };
 			port@d { reg = <13>; codec13_ep: endpoint { remote-endpoint = <&smcodec2_ep>; }; };
 
+			/* [Multi-Codec-1] */
+			port@e  { reg = <14>; codec14_ep:  endpoint { remote-endpoint = <&mcodec11_ep>; ch-map-idx = <0>;}; };
+			port@f  { reg = <15>; codec15_ep:  endpoint { remote-endpoint = <&mcodec12_ep>; ch-map-idx = <1>;}; };
+			port@10 { reg = <16>; codec16_ep:  endpoint { remote-endpoint = <&mcodec13_ep>; ch-map-idx = <2>;}; };
+
+			/* [Multi-Codec-2] */
+			port@11 { reg = <17>; codec17_ep:  endpoint { remote-endpoint = <&mcodec21_ep>; ch-map-idx = <0>;  }; };
+			port@12 { reg = <18>; codec18_ep:  endpoint { remote-endpoint = <&mcodec22_ep>; ch-map-idx = <1 2>;}; };
 		};
 	};
 };
-- 
2.25.1

