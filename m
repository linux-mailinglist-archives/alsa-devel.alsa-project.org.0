Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D677C49A9
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Oct 2023 08:11:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CEBBEC4;
	Wed, 11 Oct 2023 08:10:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CEBBEC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697004696;
	bh=N4XpC+Quh4UGbwECP0k3oKRvQZ2JcuqQv88iNoxDLr4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=roZGaAGe73MMHe209Y+vAYZrronr5VDxZds5O1rv0XPRFEhTDhp+zx1gI0Rw+HiW4
	 GqbRqlodhNYGmPe8IDhY8oKWShWIXBQRB+jx+6phZIw+7UNOyYQPH7rulyt6A4pHlC
	 Q2jYKb7iHErw1ZBXcqo/1wA4Cu13P5VwL8RKJM/o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80659F8056F; Wed, 11 Oct 2023 08:09:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 31626F8055B;
	Wed, 11 Oct 2023 08:09:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97C85F80552; Wed, 11 Oct 2023 08:04:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2072c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::72c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B6212F80130
	for <alsa-devel@alsa-project.org>; Wed, 11 Oct 2023 08:02:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6212F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=OqGsJKrU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h7V7rOksIVGVSu+PBX0a2J4RK/dAPRPma2vGeuL171Va8qGGIBbS28zktqQPrMcg/NsVwFX8Yhc9x4uRTBKRA7oQowjJU7r41d2WthpdeXMMjV0RWZWN5INPAsWwQK0v4IovFvkDCg64dNl5JyuG31qpoPfXQONiyJNFaQmwsoWHVnj2dmzelr+PTYWEiDHrtWRkapbzWy6JFXuvqltRqJsXAXxUk7BZvIoWQxK2U4Dp1l9vy0Fc4Yb4mLBmkjJuwK+Y7DlwZlLdFdWxpLjy/mzIXvLYaiEcYd2XaW13AFyCIhi1JQAuMi3uS5piJG451hyW6O2zrMcToKpvMH5Wcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oAuKBwG+PQ9xeS1F64MxL9urfcS0AEoF8rRul4XzurY=;
 b=j+RJOdayb9gIgHpsqF3wSXgygp3Gl6j6aj/QTU4i1BCaRy7QXbIHswurGgn1DQNi9ExipNs3tqel2T04icClt8EHtSSYQnann3IdD30/ZWCS6YBF3F4po292Wq6U2AjHSFd4KN6hLCeG9XaY+6DddAW9ID8A8LhfYpvwf+SrQp+7JdnsMhl9mohyR3HLNh4ekgOvWbCPGHKhguXAsEVsPsrg6iGL4scU4WOGsHtA9w0Na9unfhMJ4fAgfYi9cEN1x5EkWfTloK483Uo/MtkYJdbYiKm05fG5j5j2xhaxNWHq7fu5ewFy2PhNQUYEs6motEOn0TWVNq1+UU9eIV5d0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oAuKBwG+PQ9xeS1F64MxL9urfcS0AEoF8rRul4XzurY=;
 b=OqGsJKrUQDZWPMYCaj/qnKTd/LAeXk7lUDu4HCF72ZwycNzLYaf/wSek7HGG/yBrdXdSSQrUR6XZp2wOJ6tK+jgPv9WRgkdYuz3WXJAaLrjqof0iJhQOOmZFKz2cd3vOGghUcAAAo5Z/SfT7vuK0F7TaBVf6OTlF1MxmRXuA6ws=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11514.jpnprd01.prod.outlook.com (2603:1096:400:377::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.40; Wed, 11 Oct
 2023 06:02:54 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6863.040; Wed, 11 Oct 2023
 06:02:54 +0000
Message-ID: <87il7d1ysx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 3/4] ASoC: audio-graph-card2-custom-sample: add CPU/Codec =
 N:M sample
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 bard.liao@intel.com
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87mswp1ytu.wl-kuninori.morimoto.gx@renesas.com>
References: <87mswp1ytu.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 11 Oct 2023 06:02:54 +0000
X-ClientProxiedBy: TYWPR01CA0001.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::6) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11514:EE_
X-MS-Office365-Filtering-Correlation-Id: 46f6c2a6-8f15-4378-954c-08dbca1fb5e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	x1EnK7tr+ZzjZQnFWwFAwsYeQiutT4n5BH20jaWegIfeUyU40cgTGAectOTHDxwU1+h2gybYyqwMsB2vY0ldIGoyxu100Pw0CyrQ73yn37vyRGqwBFY24XjuGLbvSdigeezyK+ttvJ3snTinzjhdhgkNypBMd3mncD4Yranfv+7DY3QR/SjsOyLMJIWe9aZl+dis7glzhm4O6C1pstR4nt+8PPYdiOUdOIejxKo6IHis4Sdjfiqyz6syERIH1rthpu4fE1G3BH34EBL341lIDgo4Cvkge9tTcRveL7bw3axXgJ6OREtg197pyLJ/kD5noloO/y2laPELzBhKF1KJAdOlxEhHoWNbWonk5eAKSOFziPJcttsma6lHu94SLyLqWeHIWqWcM6t9NHbm6QPX9C8Sw4TFbi6DuNXJUFsDJDByHjdc49lDIWAiJbmtKofhCgY/SgDrYKCHqG27SEiNPA2+RYFHEeDoXS1nmC2lhQZA0EJ0tNv6Mv0bR1huxCJ68t7fOiIOMciuaa9zoW29z8Ftk4A2YU1G/HhIUkvLbbKDLWO5iwD1WD+RsPM0TryHxHnLIsMkmGyT4zHJrn3Uf8YOCECKbpRZ4SNorbd1Gq1ZBtX720cnXs7xPfJoUvLOJyUa5DrH0XFJya7rFnb4AA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(136003)(396003)(39860400002)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(52116002)(6512007)(478600001)(2013699003)(86362001)(38350700002)(36756003)(38100700002)(2616005)(2906002)(83380400001)(6506007)(26005)(6486002)(8676002)(4326008)(8936002)(316002)(41300700001)(66476007)(66946007)(110136005)(66556008)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Rff2mIORRf2r790cT0Ki/K2JTYoBT3fd0cGWNsQNLK44Gds6JxEpRJfKaD81?=
 =?us-ascii?Q?sbyVPE3JCp+Cy5L0OGnqs0CXJM0qGj1ywJoPrPu/iSztVYJEyphWZ+NTcgVR?=
 =?us-ascii?Q?nz6gjHBlweofcsC48sWnCZxL++UNHQx65BArX3d0gPlumhhgubLRQJDePN0u?=
 =?us-ascii?Q?MJSyoZz0fjrum3nGbKjTPPfyfj7f907ppTug2Mlm7EyO8Yn0B0myJgp3VjTY?=
 =?us-ascii?Q?jFGeWDbIZzimqJrAYOIKfIVS22257pSG7SCkzfvXH28UZlF1GfQqv+H+pShZ?=
 =?us-ascii?Q?QZzemcY9sZWW3kKQeWghEU2U8CUzWW0rp20jYlOLHS96axiAYFSOZZni3O0Y?=
 =?us-ascii?Q?Mb3c2whNksSv3txiisi83fu1+h7M5QpzcrJQZ6CHDrUYeBcrfWR/XLeRoek9?=
 =?us-ascii?Q?ZHvRdj5ibxlkxQS/smCexnVJtiMCutwFZrjIJWPJKw29i5EwQFRQQvQ0YRlb?=
 =?us-ascii?Q?nJoj8aGic+SyAfYYJvA8DMk8tRLewDLQ7/ZMV57Isus92DDa/NNg7IHVNvWc?=
 =?us-ascii?Q?lpVfU43rDLzZ2WEDvFfIqISXuMIjKm4z6PrjLrEqBgQk2zvOGmu1qFn9eFiY?=
 =?us-ascii?Q?TDO7oQuLOXDCM3AY9NTYc2I5PDjzLM9xs4tLJh62RHmUBClfGZpIjaAvHRq3?=
 =?us-ascii?Q?DU7qpkGg1tgofOadEMqUD8VRpr4TjKkJxdayhvMMWMEhzSXr/MDQ4NqNmSKc?=
 =?us-ascii?Q?BLMADvOBqTTW2ZsJRsjRIDUhwDHp8rPY5Bu1Pe4R9e4f+pR03GoW0UTBuIHV?=
 =?us-ascii?Q?pY6zALZlNxlO6Ia27ntCX7f7Ufi7Slw9bXkrlRoS7NVo9gMPfXZABrW639Q1?=
 =?us-ascii?Q?TYEvIvP6degI3K/tz8g0y3IbosMhTw73d8VE4KAUL8I1160fgaNfU7i89y+0?=
 =?us-ascii?Q?bL5DUE8PlEaEnLw+ww5erNDbFfoC1qIBWoQBjaRPIOCqssiz6h5d+RNCWelI?=
 =?us-ascii?Q?P2HDhs30DoM+FpTtvu4nO5ybAfJbnXPKxFZDzEmGNpMT+Ofyub+0+SZZOAtY?=
 =?us-ascii?Q?XIOb2LhIT6HnYJhSfevWHM1tepsaWerpBHz2ppXDjF1eHNDYEtyITRMsc2Y2?=
 =?us-ascii?Q?ppw+2e0+MPq39bLEc7BAnQF77r3w6AbHJfE6lmjAer/eWViO212exRJAILka?=
 =?us-ascii?Q?bpmyvEqjXHt17vvTfBSHEAhkln6t7MkWRcbL4GD4LYdC8ilLZyTslua3SxuM?=
 =?us-ascii?Q?w2SqiplbcNFl0JbcmoJYXlAGZ8EtUqb7VUjD240HnWq08HNwB9LQt/SBNQFN?=
 =?us-ascii?Q?MO72+MeuF3WDQCNHcDgkdN/wHvK0/P1VWm6ejvnsWksHlLd7/FlDILnXtI+H?=
 =?us-ascii?Q?Sfmu/TEe0n5fOlyDL4j8xesnGQ9oJZ3TzKsWdS8eR8ym1o7/hwwPfi/MNMCR?=
 =?us-ascii?Q?qhy2hOaI0fxRsMmyr/FKwAyHtDAPJF8HsGoxTtCkw6mrredDX2lcxX7W/Z0N?=
 =?us-ascii?Q?Th7VLVhSP7MwSFZ2HEzc16g5mQQOqE3Tq5MrJrJjiVA8flvmpFIB4x/3H1wB?=
 =?us-ascii?Q?sQaM6Pyme3iENLyruSKWPYUUETi/3sPRYBAMhKxJU0V26QU5okbsWbPXSOyp?=
 =?us-ascii?Q?Q/48H2iyGUPsaeLW1ljNWO+C2EwJGcGTzr1yApz7q1tcKrD054BrgqESqDGQ?=
 =?us-ascii?Q?3Z/e7XGB7TfIKPFdvuYHQ4U=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 46f6c2a6-8f15-4378-954c-08dbca1fb5e3
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 06:02:54.8286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 a1fNO0JAznWLUhgSiea2yPWDoNdWbe/8jX3FRWiN/v8qj2UESE3tMs3S7XuhKRnu+W32RBqGR3/2HTPFcqX8KRG7wC0pny4uK6/TfhnNaq+PSp0e4hA2tbknU8z8kwZg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11514
Message-ID-Hash: 5T76AYRQH44JJJYYGKSD3U7UMXZ26XOX
X-Message-ID-Hash: 5T76AYRQH44JJJYYGKSD3U7UMXZ26XOX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5T76AYRQH44JJJYYGKSD3U7UMXZ26XOX/>
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
 .../audio-graph-card2-custom-sample.dtsi      | 138 +++++++++++++++---
 1 file changed, 121 insertions(+), 17 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2-custom-sample.dtsi b/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
index 8acaa2ddb335..d43a4d2cdaa5 100644
--- a/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
+++ b/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
@@ -58,12 +58,32 @@ / {
 	 *			| |-> codec13
 	 *			+-+
 	 *
-	 * [Multi-CPU/Codec]
+	 * [Multi-CPU/Codec-0]
 	 *		+-+		+-+
 	 *	cpu1 <--| |<-@--------->| |-> codec1
 	 *	cpu2 <--| |		| |-> codec2
 	 *		+-+		+-+
 	 *
+	 * [Multi-CPU/Codec-1]
+	 * for ch_map (*), see
+	 *	soc-core.c :: [dai_link->ch_maps Image sample]
+	 *
+	 *		+-+		+-+
+	 *	cpu8 <--| |<-@--------->| |-> codec14		cpu8 <---> codec14
+	 *	cpu9 <--| |		| |-> codec15		cpu9 <-+-> codec15
+	 *		+-+		| |-> codec16		       \-> codec16
+	 *				+-+		    (*) ch_map = [0, 1, 1]
+	 *
+	 * [Multi-CPU/Codec-2]
+	 * for ch_map (*), see
+	 *	soc-core.c :: [dai_link->ch_maps Image sample]
+	 *
+	 *		+-+		+-+
+	 *	cpu10 <-| |<-@--------->| |-> codec17		cpu11 <---> codec17
+	 *	cpu11 <-| |		| |-> codec18		cpu10 <-+-> codec18
+	 *	cpu12 <-| |		+-+			cpu12 <-/
+	 *		+-+				    (*) ch_map = [1, 0, 1]
+	 *
 	 * [DPCM]
 	 *
 	 *	CPU3/CPU4 are converting rate to 44100
@@ -144,15 +164,38 @@ audio-graph-card2-custom-sample {
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
@@ -182,24 +225,24 @@ multi {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
+			/* [Multi-CPU-0] */
 			ports@0 {
 				reg = <0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
-			/* [Multi-CPU] */
-			mcpu0:	port@0 { reg = <0>; mcpu0_ep: endpoint { remote-endpoint = <&mcodec0_ep>; }; };
-				port@1 { reg = <1>; mcpu1_ep: endpoint { remote-endpoint = <&cpu1_ep>;    }; };
-				port@2 { reg = <2>; mcpu2_ep: endpoint { remote-endpoint = <&cpu2_ep>;    }; };
+			mcpu0:	port@0 { reg = <0>; mcpu00_ep: endpoint { remote-endpoint = <&mcodec00_ep>; }; };
+				port@1 { reg = <1>; mcpu01_ep: endpoint { remote-endpoint = <&cpu1_ep>;    }; };
+				port@2 { reg = <2>; mcpu02_ep: endpoint { remote-endpoint = <&cpu2_ep>;    }; };
 			};
 
-			/* [Multi-Codec] */
+			/* [Multi-Codec-0] */
 			ports@1 {
 				reg = <1>;
 				#address-cells = <1>;
 				#size-cells = <0>;
-				port@0 { reg = <0>; mcodec0_ep: endpoint { remote-endpoint = <&mcpu0_ep>;  }; };
-				port@1 { reg = <1>; mcodec1_ep: endpoint { remote-endpoint = <&codec1_ep>; }; };
-				port@2 { reg = <2>; mcodec2_ep: endpoint { remote-endpoint = <&codec2_ep>; }; };
+				port@0 { reg = <0>; mcodec00_ep: endpoint { remote-endpoint = <&mcpu00_ep>;  }; };
+				port@1 { reg = <1>; mcodec01_ep: endpoint { remote-endpoint = <&codec1_ep>; }; };
+				port@2 { reg = <2>; mcodec02_ep: endpoint { remote-endpoint = <&codec2_ep>; }; };
 			};
 
 			/* [DPCM-Multi]::BE */
@@ -241,6 +284,50 @@ ports@5 {
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
+				port@1 { reg = <1>; mcpu11_ep: endpoint { remote-endpoint = <&cpu8_ep>;    }; };
+				port@2 { reg = <2>; mcpu12_ep: endpoint { remote-endpoint = <&cpu9_ep>;    }; };
+			};
+
+			/* [Multi-Codec-1] */
+			ports@7 {
+				reg = <7>;
+				ch_maps = <0 1 1>; /* see [Multi-CPU/Codec-1] */
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
+				ch_maps = <1 0 1>; /* see [Multi-CPU/Codec-2] */
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
@@ -323,9 +410,9 @@ ports {
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
@@ -337,6 +424,15 @@ ports {
 
 			/* [Semi-Multi] */
 			sm0:  port@7 { reg = <7>; cpu7_ep: endpoint { remote-endpoint = <&smcodec0_ep>; }; };
+
+			/* [Multi-CPU-1] */
+			      port@8 { reg = <8>; cpu8_ep: endpoint { remote-endpoint = <&mcpu11_ep>; }; };
+			      port@9 { reg = <9>; cpu9_ep: endpoint { remote-endpoint = <&mcpu12_ep>; }; };
+
+			/* [Multi-CPU-2] */
+			      port@a { reg = <10>; cpu10_ep: endpoint { remote-endpoint = <&mcpu21_ep>; }; };
+			      port@b { reg = <11>; cpu11_ep: endpoint { remote-endpoint = <&mcpu22_ep>; }; };
+			      port@c { reg = <12>; cpu12_ep: endpoint { remote-endpoint = <&mcpu23_ep>; }; };
 		};
 	};
 
@@ -363,9 +459,9 @@ ports {
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
@@ -395,6 +491,14 @@ port@3  {
 			port@c { reg = <12>; codec12_ep: endpoint { remote-endpoint = <&smcodec1_ep>; }; };
 			port@d { reg = <13>; codec13_ep: endpoint { remote-endpoint = <&smcodec2_ep>; }; };
 
+			/* [Multi-Codec-1] */
+			port@e  { reg = <14>; codec14_ep:  endpoint { remote-endpoint = <&mcodec11_ep>; }; };
+			port@f  { reg = <15>; codec15_ep:  endpoint { remote-endpoint = <&mcodec12_ep>; }; };
+			port@10 { reg = <16>; codec16_ep:  endpoint { remote-endpoint = <&mcodec13_ep>; }; };
+
+			/* [Multi-Codec-2] */
+			port@11 { reg = <17>; codec17_ep:  endpoint { remote-endpoint = <&mcodec21_ep>; }; };
+			port@12 { reg = <18>; codec18_ep:  endpoint { remote-endpoint = <&mcodec22_ep>; }; };
 		};
 	};
 };
-- 
2.25.1

