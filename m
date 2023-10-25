Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCE17D5FE9
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Oct 2023 04:23:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95A539F6;
	Wed, 25 Oct 2023 04:22:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95A539F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698200617;
	bh=Idug1BoSOS9VMn+xZogE4d9uVuMJ+rS6yEqL22vMMpo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HotOtyNDyJgbLp7pSgwNWs5nQl7qoRDXDJLAEuqejL4JYowKKB0n7bcyM/K3NlNAF
	 XuqaaACAO7bTMuovNGde42OOnEM80DTsGjKYa7OSrulgwKpgixX48Dfs9aWBUx2sVP
	 kg5Y1hoBt+UswptxioYTG6ZiW+TUYmGTKR/YwQog=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EAEF0F80578; Wed, 25 Oct 2023 04:21:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BF712F80571;
	Wed, 25 Oct 2023 04:21:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4B22F8055B; Wed, 25 Oct 2023 04:19:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2071f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::71f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DBF00F8055A
	for <alsa-devel@alsa-project.org>; Wed, 25 Oct 2023 04:19:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBF00F8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ZvBa3pO/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OWfUKem9d3QyOGaCWFUmEzn3OcX/QEY8qWNmG3MSDcSs1WiO8YjyiO4ez+aZ+VTGQYywP9zrQ6cw6jreWVlQJlxZfQ8R6tHdVYYMiwgdNX55pDC1/pzc3QzuearfFTSSoxMqXLzrK2cGw73oWN4m/V5vlArmXTExnLvNYKWAKNfJ98MKWvOSCsIjSgr8BsMx9m2CbFLXXut8F4jvUJtDu8HhOlF90IzH5iXbd5kyoZwvLYMbKs6vioY0TU+5X2GU8anOgPvEoCrOBQ8g6axQKAXMrrOC9h4VsqoviLKbZ6A3Ptr80Ph2CZMAJelxKZZ+xXRk3dSCRKC4q/SwAk1jAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+4NxP9ri6wR9QU49HthNKfdmU1xNZLCubvXcLm15/+E=;
 b=RMu7pyPCUJhUyD/ewc5+yt81bE8926x1Kf03VJmBGe0rtx3CoKM3jtobWuOgHpDHVmDV1gYkVcdO+Izz3afRWq5uhvndbUVwuVPzC+FeYEjjqhM1IsZlPKntcS5cmTucoZD0c/EbfgXSBmxHTMHYEHcXxvTyYsG31bGNZoKER92dD7nPePr+U3hhXck1cSg+O3lx1QIbrsMzw80mqksYmEI9TKxk0Tko5RscgAwQ4+DjeAm/KpZW8YdmSQFU04Q+MXmF72pWSa18Vky0ZbsZF1dIPGsu5Rv6M9kLBjmoTmD3g8Wta61XO1XAZsyqc1YezIiLEGH4FYmqfHq4ErTAUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+4NxP9ri6wR9QU49HthNKfdmU1xNZLCubvXcLm15/+E=;
 b=ZvBa3pO/JykRUeBHYLa8Ui0kg4FNt29KFeLfWI72ZDe0zdPuKXd4wVNIByDkEB5pSaV4/g/H8/fMkr7MDypKQ73f+sMl/y8TWH6/xEPP/WscrDkm+pF3B+xurv/ymBv0EgFCuHOOw79o8x5D9S8++eCHvHLtimIbmdjo3i9iENE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB10372.jpnprd01.prod.outlook.com (2603:1096:604:1f9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.31; Wed, 25 Oct
 2023 02:18:59 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f7e9:e682:d78b:f55a]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f7e9:e682:d78b:f55a%3]) with mapi id 15.20.6933.019; Wed, 25 Oct 2023
 02:18:59 +0000
Message-ID: <87a5s7bg19.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v6 4/5] ASoC: audio-graph-card2-custom-sample: add CPU/Codec =
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
In-Reply-To: <87fs1zbg2g.wl-kuninori.morimoto.gx@renesas.com>
References: <87fs1zbg2g.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 25 Oct 2023 02:18:58 +0000
X-ClientProxiedBy: TYAPR01CA0079.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB10372:EE_
X-MS-Office365-Filtering-Correlation-Id: 9453b298-ec9b-4434-5c60-08dbd500bf4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/+BvT5gMyhKUvCb2rtMDyjMvcZKXtqPXicvNtHPVvrOpawNziICC3LyLR5ZVmR2dTPcGqDieo+Otixa+ARlA6gFSD9Plbe9HIzzGWhEYk3axc5gJTmC2hraCY2Nq5JGPodzEVP/zZBlvhUo1uDNh0C5OLauOkoZ+XaZQFpsGHTP1Hj52LWHijEh5FIuntBSv6FaM/BHxjjKBXqx47wd09IQ1TYSn0fhM7hA2DocesUdCIaBHBKYix9uynrcfheI7DF5Px8h3fK8elNdE3o7XxAvbjzkjLZt1csvooAoTlRef24DfWtS2K44akXy5/4H4eF9jaf40TksjfhSlRjgMjJ4VWIO81XUNZjd7/T9qWu+zqZQZVgVhLmvcXrQZL3Za1YfC1ZW4eVfNCwNyIV84k1IflCxkbACK8GrwiAedYai/5e3evU6ZABdlckFrlstvCih2tMaerm8ThNWnpw+uQ3bBFK5OwMtFjXcNWZZMe90ELiACka0rRHpoEDI0RI6ZnxplfkgrrWnOmkrSiY2IV84umoZAsWAuDb/J/FB8j2eKmKKeBMShKG3ezxbGsz0z0siE83RVrGmi3fV+02imwAzL6PfYfV+Ruj1+x1DpZ4R0fsIPPlipNVZfdwGxn8mjxO2/IDXY+p0GXna+LydmVQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(39860400002)(396003)(346002)(136003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(38350700005)(2616005)(41300700001)(6506007)(52116002)(83380400001)(6512007)(7416002)(66556008)(26005)(4326008)(8936002)(8676002)(6486002)(2906002)(5660300002)(66946007)(478600001)(66476007)(110136005)(2013699003)(316002)(86362001)(38100700002)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qklCoTkN0lJNGX6of/KrjGW/Ll9PIxwAmR5v0RUtbWhsENN5gTdXtwIfg7OV?=
 =?us-ascii?Q?I+bjnTwv8wEb3fYjHI7MudL97iOYR+NMEA4PswgEds6rM0MTLxtT0+LK0Nwz?=
 =?us-ascii?Q?/BmcMwUubWerzpetr/FDG0Pk+TAe5o9CUte0llP0CyPyDdBYg34Pxa71dKhP?=
 =?us-ascii?Q?VLJaL8NHx8xkAs6HwBAsoHfsRPyvygwse7MM/EJvkeEMPeGPLSdT8tmSVHWA?=
 =?us-ascii?Q?l6+VNMIuuEjgfAx1OS/+2UKAp870DkHlo3DULydrTQdw5xqEdpPilBz5rAXw?=
 =?us-ascii?Q?MjHhaJw3gicM3PQfl3nIawoq8o4cBTBxjee6wTg9uytePhCjAFunBBACvQE8?=
 =?us-ascii?Q?X209xNuuVrfBneFUEFZVOMbK1k/dWOtT4C/xjkixt0pzuZa2JODcvHaJIyyD?=
 =?us-ascii?Q?T9FYyHHKXmxkfo7adV9tYSs8mKtyG+ekaput7XW1FUoWa2AFHXn7e7Xmh9Pk?=
 =?us-ascii?Q?JfGmYGWCxrfbpKiu9tKd1s2B2D4cOaYWg4kywM3zIrBH0QAfIorXY3o5nRll?=
 =?us-ascii?Q?Wc904haqyV+0Y7An1jGOLDnP0aY0wgH6CcYrtwuYEu+bMoBnld1LwrJDoFFo?=
 =?us-ascii?Q?onOOsHbRXlMbY3FzThJC1erxxXScB8NVj6UDIaUQ8Voe2U+e6MJY5C0Oe3eP?=
 =?us-ascii?Q?VZ9to2bDV1gv59fn7sk1qCPWKHv5nG4spmVL2J7Tw5W4P2qiF2WONb1/aJa5?=
 =?us-ascii?Q?z8hyh/Ifn23ZEORiqVB1VmFdopfK1ZKJo52XCIY5bWaadIxiQIbh17yAHb/z?=
 =?us-ascii?Q?WXGxW4z31OSs5dPrNJSYK7ZPJ28ToEvcZ3aaihUwQJk4pLjTuSy00vXkBfDW?=
 =?us-ascii?Q?gTWaZYMbFPgp87pFIFGcdyxXxTS/Md6Qt0F49rbpx1xVjpwglABPEj1t5/Kx?=
 =?us-ascii?Q?egUGh2jQPfPi2OAcYiRwZXyNX1Ev807UJIQGVlM6EdjTriLb0P6piezzacei?=
 =?us-ascii?Q?QfF6C/kt4v7Ntwk5LNe/fNkKXt5hk+hUTxMfeven8xlyTnFkz5NsEAEyxatb?=
 =?us-ascii?Q?4/sBKFUwzLd/5nTl9rW9yLcVffezISM+3g13XgNfd9QLJHvbez3fTRDgCMD6?=
 =?us-ascii?Q?K1/244Kt+U0AAhENWQAJ8lNdnqw9WdMvFcwcfuI7+OSn0MMLb4ekLWZ9kRuy?=
 =?us-ascii?Q?aPgNixNCPSseRYMXPmvrI5FwDsCdlvqpAJmZzw1P4CvO10iKDSLE4OYecU4G?=
 =?us-ascii?Q?066Vau1Kb2vQ0mLdrbGYJLRx1TX1ab+bHRYW5sMnG8fcZo3k1R+dSBCp1cpH?=
 =?us-ascii?Q?Lg6VPqk5aSzvJhRJOh2GL/aqu6y+z0lNFcNg68IKksF3M56PgX8x7e+7Xbq1?=
 =?us-ascii?Q?DKLBn2YM3oYMaqbDw6K9fYBSHJvwahWPLY7qz9VxSGaymy/T7ZYRmhg16l3n?=
 =?us-ascii?Q?ew73qbwxI2F1Xub38oM+uOEEFxfKRPC0VNc6eersU63SQmR+cf5I1tNNcxwq?=
 =?us-ascii?Q?aqFKrKRrRrpcsKRI1C8HT21oVD55Qtwael+vwUEhA1fzy/gUh7WL3Zhu8K36?=
 =?us-ascii?Q?1kX57X6wrUrzEWCxGazm6/ShSW2kpmWq1+OSAQw/+O6tBeKNUmG5A5g3nA4f?=
 =?us-ascii?Q?XlewT8Hs2oyLG6Xts5t2MM/1MHeVR6d2Q371ZfQIERM55/ZEsGyRv7ctK12c?=
 =?us-ascii?Q?t5ELS1yxZ9z0qNEWlkZ6ItE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9453b298-ec9b-4434-5c60-08dbd500bf4e
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 02:18:59.1350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 F6wOXgYxxgEZyooMziknW5FapIxjONqH8XNGgnaw+KalEe0zCrY6s8oInnEPqhZrMnbGJpLJgfkcw5L8rOGFOWKl/uwG9TBER0PMvUB1KbZv8Tb7/YChUbVYKrQN5qZU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10372
Message-ID-Hash: OFENAQ3FRH7MO3DQAUB4BR2VZLGHJ22B
X-Message-ID-Hash: OFENAQ3FRH7MO3DQAUB4BR2VZLGHJ22B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OFENAQ3FRH7MO3DQAUB4BR2VZLGHJ22B/>
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
index 736eca553d7c..f792ada69f02 100644
--- a/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
+++ b/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
@@ -64,6 +64,26 @@ / {
 	 *	cpu2 <--| |		| |-> codec2
 	 *		+-+		+-+
 	 *
+	 * [Multi-CPU/Codec-1]
+	 * About ch-map / channel-map-index (*), see
+	 *	soc.h :: [dai_link->ch_maps Image sample]
+	 *
+	 *		+-+		+-+		ch-map (*)
+	 *	cpu8 <--| |<-@--------->| |-> codec14	ch-map[0].cpu = cpu8	ch-map[0].codec = codec14
+	 *	cpu9 <--| |		| |-> codec15	ch-map[1].cpu = cpu9	ch-map[1].codec = codec15
+	 *		+-+		| |-> codec16	ch-map[2].cpu = cpu9	ch-map[2].codec = codec16
+	 *				+-+		       ^-- channel-map-index --^
+	 *
+	 * [Multi-CPU/Codec-2]
+	 * About ch-map / channel-map-index (*), see
+	 *	soc.h :: [dai_link->ch_maps Image sample]
+	 *
+	 *		+-+		+-+		ch-map (*)
+	 *	cpu10 <-| |<-@--------->| |-> codec17	ch-map[0].cpu = cpu10	ch-map[0].codec = codec17
+	 *	cpu11 <-| |		| |-> codec18	ch-map[1].cpu = cpu11	ch-map[1].codec = codec18
+	 *	cpu12 <-| |		+-+		ch-map[2].cpu = cpu12	ch-map[2].codec = codec18
+	 *		+-+				       ^-- channel-map-index --^
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
+			      port@8 { reg = <8>; cpu8_ep: endpoint { remote-endpoint = <&mcpu11_ep>; channel-map-index = <0>;   }; };
+			      port@9 { reg = <9>; cpu9_ep: endpoint { remote-endpoint = <&mcpu12_ep>; channel-map-index = <1 2>; }; };
+
+			/* [Multi-CPU-2] */
+			      port@a { reg = <10>; cpu10_ep: endpoint { remote-endpoint = <&mcpu21_ep>; channel-map-index = <0>; }; };
+			      port@b { reg = <11>; cpu11_ep: endpoint { remote-endpoint = <&mcpu22_ep>; channel-map-index = <1>; }; };
+			      port@c { reg = <12>; cpu12_ep: endpoint { remote-endpoint = <&mcpu23_ep>; channel-map-index = <2>; }; };
 		};
 	};
 
@@ -398,6 +489,14 @@ port@3  {
 			port@c { reg = <12>; codec12_ep: endpoint { remote-endpoint = <&smcodec1_ep>; }; };
 			port@d { reg = <13>; codec13_ep: endpoint { remote-endpoint = <&smcodec2_ep>; }; };
 
+			/* [Multi-Codec-1] */
+			port@e  { reg = <14>; codec14_ep:  endpoint { remote-endpoint = <&mcodec11_ep>; channel-map-index = <0>;}; };
+			port@f  { reg = <15>; codec15_ep:  endpoint { remote-endpoint = <&mcodec12_ep>; channel-map-index = <1>;}; };
+			port@10 { reg = <16>; codec16_ep:  endpoint { remote-endpoint = <&mcodec13_ep>; channel-map-index = <2>;}; };
+
+			/* [Multi-Codec-2] */
+			port@11 { reg = <17>; codec17_ep:  endpoint { remote-endpoint = <&mcodec21_ep>; channel-map-index = <0>;  }; };
+			port@12 { reg = <18>; codec18_ep:  endpoint { remote-endpoint = <&mcodec22_ep>; channel-map-index = <1 2>;}; };
 		};
 	};
 };
-- 
2.25.1

