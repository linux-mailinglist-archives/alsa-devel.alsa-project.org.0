Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 806917F9667
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 00:21:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7661DF1;
	Mon, 27 Nov 2023 00:21:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7661DF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701040870;
	bh=UUm9JccEsp1jgqyTb2wTS4JiSjMXGsssq+Y18Ei6Lmo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DWaL7xn52b0d9fwuYSGEEzko9lfxe9oYbQKd+7yA6Fax1Quh/7CpYZuggc7rJhbR1
	 Jagwmj8ByjaPuB2z8vMj4+ZRrH0rk+7+qXEW2TvKjxF2i4t9Dv3AGQ02eAbZxM/LEi
	 UWnLHoKnZ5g62jysLz1yWfm1UY7sO3LtKKe8s+yA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83333F8063E; Mon, 27 Nov 2023 00:19:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8814BF8062E;
	Mon, 27 Nov 2023 00:19:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3F84F80618; Mon, 27 Nov 2023 00:19:43 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 5BBF0F800F5
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 00:19:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BBF0F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=l8I4UbzZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MaF/IUBQM8E/gSckRDFZoehi85CZSw6Rs5eagzJkWFB3OTNPyiJ07xTj6HymMgM9jxVA35pUVpZX5HuaQ/7qiC2O4OXxN1Lk5R09aITbKU1lZjMZ/PO16Q9GszZBsjrHjUEmtixX02C2+UMXzztia/Iyc5nYY17ElRlTHBRWr4kd0nDwunAv5bVJDZk2oUC049lJwruHZQVZgromlPktLWEcfjeVxQegZTp2WENZr6IIaFLH7s7mu3HbBMHfB+NKrof8MoFIJaldbUKQQGxuiFBEdjqdQs0z+JeaDw1FOhjZc12tlvWjuzEwd38KrXcxvOdoP9vVuqqWwnBexzmNjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ufCmAgxj4vWDs+5p6C0t9sXW43Dw7ngQaq3vAMp+Z9Y=;
 b=XEKd+qNmJvR4h5SmfO7js66rKHn/Rye+yRW+dsxuptx28s8EMPhtzuQg7tb+qOsBoKEhJCJ0qupeya0qciCdfTABmB3ZJEXhPdOMXiddTE23WV7/6vg0XKEMBxqR2POK1HoyggCxDQIOzFiBlgv01olmvRrYFj84ig1+hPSLxJYAPJLlqltdGFo3GpdPqChpW3ome+qmSr0cTm9TF1M1H8Pv30GZJPxhrpOzqih/qgJKp4OTcpA/GQUkIdyZ104cE/FhNa2zVL38NRdw8d1w8yZfdPS2+3ypxNKtv4/dDYIyGRWl97waRS5+XLGmorApzcbfmRIRmFRSMmLqy2c4jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ufCmAgxj4vWDs+5p6C0t9sXW43Dw7ngQaq3vAMp+Z9Y=;
 b=l8I4UbzZw4Ev1N9iuek9tkux3Z9gselzusZXbXBvO69RnB8b+8O/lJmmgDq22UsSqJh9joqN2mVfXamT8EVjYgUXR1dSn/KjH1+/4bYBrLJUdbFjBODZoH4DZs6ZTGauWtTOo7iGg0iDZLGiXoon81D0Q3haczmHGxu/ZIqcEnE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSRPR01MB11697.jpnprd01.prod.outlook.com
 (2603:1096:604:230::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Sun, 26 Nov
 2023 23:19:23 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::16b3:a84d:faa6:4846]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::16b3:a84d:faa6:4846%6]) with mapi id 15.20.7025.022; Sun, 26 Nov 2023
 23:19:22 +0000
Message-ID: <87msv0w1ad.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v7 resend 5/5] ASoC: audio-graph-card2-custom-sample: add
 CPU/Codec = N:M sample
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
Date: Sun, 26 Nov 2023 23:19:22 +0000
X-ClientProxiedBy: TYCP286CA0087.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSRPR01MB11697:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c4c6824-aeb2-4548-4417-08dbeed61fe1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	s69WLMWMi7bUqG/MphReyBBeEMLYAI7Dt8z+L9ZCZuzACZKBhHmQaG0Bt/xeorZJoVHACEUZ+l2uYLTsuqvzDbrEcrS3aknD1Lx3uCB7/J6VWnRB80TvLXA1QqiAgiPkvYisXz4J824rlP3hsbGasgB1l72nEWJa/nFnU2xvSHnnkP6Ca8r3DQ2hRm14yHuS9EGKHr9YeABRGJNHDtOHDj7kyyHOSB8fZO/rPeAse1cuWc6IKan3OnGwTTJbK7nk655n9lm8UipCczJfZRmkC36OOa7Ke9k9tOeh0JtPgqXUJmqEU2ZVxt1WQmOIsqi27WGLSfMvX7bAwMo3vDB1ksDx31mltJGNem/KCpyI4rBYt4zxjCS7EsaWTsrrIY7oFtf/P7rJF39ab+j8z70qocNacAqy4u1JYDeqfg1OHtbA4xyQN11MqXS/ia5eq8VkA30TJ0saFcY+2bmSYKaZxIARZc10v+b8QM1E5ZtmKFqwHKszrbbT38DhdNCdqo4w3UYWGIHyeuoXv2COWTbigJqC5q6ZqpBqzijBGkDAjQr5/mrlH0mWDB1bTKA5do42YPxjxqtahlLoPGACtiuWEjHzHk2NhzYgZkem/DeugvWDazx/2FrlR67zcNA1bFUQaq0wv01AyucRVRzE7ul1+Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(376002)(136003)(366004)(346002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(7416002)(4326008)(2906002)(8676002)(8936002)(41300700001)(26005)(66476007)(110136005)(316002)(66946007)(66556008)(6512007)(52116002)(5660300002)(2616005)(6506007)(83380400001)(86362001)(38100700002)(38350700005)(6486002)(478600001)(36756003)(2013699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GuiYLlYPeCMkRVvV89pzi45mN3SaDNMIy+ToBL5lt4Dpc1tqFsAZKELeUzyL?=
 =?us-ascii?Q?C6LHErvDktkdw33NXs/kFhDxub4+Y/90pnHDPmgDgkbZCtD9dH/2LQGDYidH?=
 =?us-ascii?Q?/ayrygolyBCRYYbxuPZQCYJE2ppnUAfNt67ekektNpYEor+36uI1Lud0Lv3G?=
 =?us-ascii?Q?IE727C6G+HoX/yTlVc5R3VHyfyKFb7boTvZkrR7S+2UfkH9C90E7SLEtYNix?=
 =?us-ascii?Q?HSp3Z2SqHYsfYTR7klMxMtFyyEkO8sar+pPOLHxmuwQkqvxohCzDo8Mey89D?=
 =?us-ascii?Q?1MCb5CXKEWcH4OnQMluronDt3/DwvyV6r0sELs9ElfvZY/jVph7qmdOPo+DR?=
 =?us-ascii?Q?7vYDmcFDR8vkVME/sIjFVRgo3ctkkBqZAg3DeaiRUAUuZiVxtd4pU9mgDXY6?=
 =?us-ascii?Q?UljaAEUIM10AMgAA1tJ9lxGZ91/0Oc445bL4nKAgTIBuUoCcipI8B4tnYePP?=
 =?us-ascii?Q?LfrJgIYU0TUVXtHQdm1GqZmhFj0ukITCO4ukJsUc/LPPGWCJKSzeZV3g4wPO?=
 =?us-ascii?Q?MjfE1reYNLyQ2oqH0+75PvCs2Juw1o+nyAogvrhL0UyhiEfipLu4UiLb9qcS?=
 =?us-ascii?Q?GAKJ5drXIbDBz1Z3BomSq99+JZEgftgMI2u65Xr5dd+5vaZ8riEzlgLzEK/y?=
 =?us-ascii?Q?eqQx4xtRwyypKxn4nBAyN4Svld0Dhv8rjHk3r8TfWpY3BiVX4JpsVn1lTpGd?=
 =?us-ascii?Q?+gAfdOnAWDUVcPZlib8I0HrxZGUXs7vC5VWnJWThvy3kcdp3umlOngmyCJzC?=
 =?us-ascii?Q?EtYFUTUfpRqqTCeMScGDkQ59skPWxN6co4RjkFAn5WlTMqLSRqoLXTvMeSCW?=
 =?us-ascii?Q?Iat9mibV5ROCoWonKLme7YUngIMBdHo9LBNylPXe2AhHhFVCvHxD2ckJugVy?=
 =?us-ascii?Q?1vjF0oBAjlq4LKAZVaRWG7XP6BP9a4mR4cyyDjdwPo1q+0kZwzYYP5Tbvh/r?=
 =?us-ascii?Q?w+No5Mfv9yMrO+g04F8MVFJFkjZHG2uVSo+FJq8LTHdxzy8zdQgvh3I/Ti5a?=
 =?us-ascii?Q?cavyC2rE9JlePstgNkR1rqBtEEowM612d8HlIMX6FrryB4vGCYIHfv3pH4BN?=
 =?us-ascii?Q?PZ4XWeimY2dCmJsAtc3AgbNAKlUd0Q6YLHJhTvTZAlw+2MdClCkxoPvA5AHc?=
 =?us-ascii?Q?aCs7LODbRPRYqZo9Rrx+npnyD+YLXtW+gHe4KGgBCHNEOkcRJS73rn0fmejE?=
 =?us-ascii?Q?UxNOBep6S11PMVYUqtvmGxpmJxHtGeV+bnmJ0Sz4GSb2pQ4DJohTEl/uHgND?=
 =?us-ascii?Q?rkzaCy1I81y7J5QgeNhUp19wjkCcQY2AR9SSspCdBxaFGKWbKxxx2R/9EXI0?=
 =?us-ascii?Q?00GvFXoxUEuDhbkPnsNjJbVA2ohhwV9dQKUbpW9ZzqSKizknq4VN+cf8SGrs?=
 =?us-ascii?Q?InNHtABHaLUUqZg6/8a7yZL6MXdT15zfh97tjAnuGQ8B1psMLDlSkDGOG8kY?=
 =?us-ascii?Q?HAWfARs6R6snaZ/NhkjovSvoA/+QGOzygNmn38bV8qyQ/EqSgpfiUQd4VwsS?=
 =?us-ascii?Q?jI4MJCcxqjHSSVNBEerQ2xj7pwKcYr6+1/hutZIYfqQDQ8oES9FXwtWaeTyT?=
 =?us-ascii?Q?WO99BpUL95kU+hl7FHyMWCP8UX+PIIje6tmFHynQG5B9tLsvS8Bx08ys3Lax?=
 =?us-ascii?Q?lKZhF3JhFt27EB98XWKBQZM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2c4c6824-aeb2-4548-4417-08dbeed61fe1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2023 23:19:22.9187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 4XTuMYM8+uXMSx2Dkhda1uaFr13/jWd9RzbqRGVOM/+BllOqY8LslVzDyTq7nAc/15syVbeyTkgQ7nHqH3tBN3HmV10fHU3ok1MiQiLUFr1weMeQlKJQOLxyc6F2kJqP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11697
Message-ID-Hash: Z4N5TEDBYEPI7AI7MT5WXCO2FC23CYV3
X-Message-ID-Hash: Z4N5TEDBYEPI7AI7MT5WXCO2FC23CYV3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z4N5TEDBYEPI7AI7MT5WXCO2FC23CYV3/>
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

