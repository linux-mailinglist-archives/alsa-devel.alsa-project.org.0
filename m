Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6465A7AD6C6
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Sep 2023 13:11:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C90FDE5;
	Mon, 25 Sep 2023 13:10:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C90FDE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695640298;
	bh=IU2c4Ylri5dYmq3XgVM7350Nn8POkBHeuXKSjIyS7hk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=MwZ/bMqOtQZLTjVUJRd4PZSxP1tqblUwTVhZmc819grG4nTIPRzmXwrRM+PUJuVtN
	 OyJ/4xK6loiB8R66gQm1fjSDuoKUcnuJjcnZtEVa7DupzwOj54TyW+npnubiD4Rsll
	 VA3JHJZ6vVq+/+Wr/9oXkp1mGPtBJ1zeufC160ZE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C39EDF8055B; Mon, 25 Sep 2023 13:10:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 32E17F8016A;
	Mon, 25 Sep 2023 13:10:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88532F8016A; Mon, 25 Sep 2023 13:10:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,SPF_HELO_PASS,
	T_SPF_PERMERROR,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1b::61d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B8F7F800AE
	for <alsa-devel@alsa-project.org>; Mon, 25 Sep 2023 13:10:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B8F7F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=UtvSzIEP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RWj5VRNYi1Ubn1EoSnv5McFkN8azhtdoJ3clI7eLE1NOHf/URaayddenNTkF5vWWFaPaJd1er0rrYVtWV0+lt2kRCnm2ZKmSkNluG2AOHrN1YUQYNLNnt+sjomZKjgHjjfEmBRRRGOM6Jij8l4RVEC48YoinEjdIjdPjplkq9/elrGyofr+dw0EG+WHaUogiepS+j6M6eKNtwaWlaXL077duzaAX2FN9quB49dZ33bPKvxwd//Tx342zT/DTfs2Cf7c0dfp521INQPvmB6X8iLlmqDS6qW6Vd1jgXEBiBzy7yQ/Tg4NAMwS9eD70S9DOMUGGDHRkrlGQroVWL+J/7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PI4uIdIkV9AyG0puYfKz4ztIaAoslrT9fpFWHeY2n3M=;
 b=Ao+vol1bSAmLTreHQgAmRCNJyrVNykwL0n7fyTgTUxAFREKV7jhO/QCua4MUlqKzI16x4XEEPyFUiRKUM0htQ8m4zNLWLrAdL7qGaizmC1EXf/bFJqE5JC+IhoiirS5NoNm9GPWsAhFAvrvdXEh1hdm9xjSLkqHF/niug7aw+EEyQWPZB3jy7pLNiKFY9IZCZFRz1zdxKsBdi+UJvhqf7bKGDYjyUAFajXdHJ1eOZRdiBT6cZRewmjerDNUKJ38GnP+mOMzsjfIXAlreNHqYRtggxwkHcAjlrlfoB8ibAkNIWfhye5xhpYE8um3Olp2oLEgB7yKe7U/PIbDT5UbtrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PI4uIdIkV9AyG0puYfKz4ztIaAoslrT9fpFWHeY2n3M=;
 b=UtvSzIEPcPKJiHH8UBLoGELYNzywXhgBBaGT80DTUn0lwtPuZND6OZRyvSN3MIcGB6BqBOQW6eLpBhtzDGLn4YpiYt0KYuSlrVp/EW/F5x0PYjk3gfNu72SyKwaD3SEa6SBSiWIf38pjKjQjyTy8BCYNdgGyJ69pa8HpI17GzGQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by DBBPR04MB7884.eurprd04.prod.outlook.com (2603:10a6:10:1f2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 11:10:17 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::51f9:b8d2:7ddd:c74f]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::51f9:b8d2:7ddd:c74f%6]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 11:10:16 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Chancel Liu <chancel.liu@nxp.com>
Subject: [PATCH v2 1/2] ASoC: dt-bindings: fsl_rpmsg: List DAPM endpoints
 ignoring system suspend
Date: Mon, 25 Sep 2023 19:09:45 +0800
Message-Id: <20230925110946.3156100-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0023.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::19) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|DBBPR04MB7884:EE_
X-MS-Office365-Filtering-Correlation-Id: e90646e2-6d6a-470a-f9b9-08dbbdb7ff47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	C59mhd3rGIjNzXfeK6SNPJL0GTDqg6SQNc0SKdk8iAuyAJd/IeXjV0lerT7bILTrMq/Q63ffoJJAmcIgzzdH/LcJbhkreSIqEOesva1jq5Nx3TcaZq+/Z5QViNUk288+NXj+4Y/sbLWmU0CsSGZKRL207Er0kKqsYjUiWJhB4UZr1iUWt/swVr2C0yq8oyNiSyHNNuGjzoYSxjX99EQitkMJ4vYRoEtPqyLDZ0sia7KmuX2aVPe31Qm6xXBKaHyhadkF4kJOK6pTn77IwJKOkgcTr3a0ub6xIgHg9IbylpZmsPJswlA0R0nJfeAMG5/ynmMRESuQkTDyUXcXnOlYcYQstAkJhStA0QkC8PZugSLAdjXG+2nYnfAcu137rOKNHqdX14xxmjXdp1sIOk/Wx8sa99OCRJoK4WapzDwGiYWUy+97X/Txqocdfhu2Ea6COT/PjrpKQj2KIEvjsgWo8tpJzKGM9uIfN8V2QG+oQZ03/qvfUTy/Nun4/xwDIQ2c/6iTAwv1bGGE2+DRuii13zgu6LTfMgx0NjwBDgB7PaeLBh4ne7MVuXA2J8+p+1ylwW5n/JL942WHrDo4WwJmoiMk581nI6VRbt7TEkjzV7QoNAKZ0TyJIZnpLlodBowT+ZNOoGJUn2lGmFTALKsB2Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39860400002)(376002)(366004)(396003)(230922051799003)(1800799009)(186009)(451199024)(6506007)(52116002)(6512007)(6666004)(1076003)(2616005)(66476007)(86362001)(66946007)(66556008)(6486002)(478600001)(38100700002)(38350700002)(921005)(83380400001)(2906002)(7416002)(8936002)(8676002)(4326008)(36756003)(15650500001)(316002)(5660300002)(41300700001)(44832011)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Qr5kSPlv5BemCjZD4v2K1E4uJjBvj31h9TKjN9+TGm4XvYdTqCeTx1+ecM5T?=
 =?us-ascii?Q?kSi2CpaG/43Y/86vd/VlWzYFV0cKrDRs6B2FCfzICmaqgqIKsR7V0rfxxx08?=
 =?us-ascii?Q?1H+ZjzRzmfyvBFxm1mJqJ33AKk17xKOAr/r0oZw7acEvrUG0rhNOhVSfd64e?=
 =?us-ascii?Q?JAaysHKgaFBXHvtRoVaQ8nV4j93XdSPtxXo/9ABGZ/xnJ+0DgnviDuVVgzek?=
 =?us-ascii?Q?z+fgeRdkMxhLcmwTX7Jiv/3ysyPSl9pH0WXMG4bEnhQ0CVVjfZUZo7umYHYQ?=
 =?us-ascii?Q?FVu5HsoK/+M1VDdFdj/i6vBd/WH+3GbsVfzwkEBE15nidblpTmzGYubSsE0Q?=
 =?us-ascii?Q?oZrC0wgZGlCu4faPQMgPPah86t/HQvXcvq608FbU6muUbkkzM2IScHQ+ohUQ?=
 =?us-ascii?Q?DzVfmBrX1iP0a/7sPJy9L+Y3771xdWCHoWGyTlE7f8KXg7X6kLq/gPb9zHbj?=
 =?us-ascii?Q?2LOgaMYmG4BBGH9mfpplI1qmGnfKURhUhwC9bb2lGFq5J8F7PKtNNimytw5v?=
 =?us-ascii?Q?TlfGhUoJodohSKK1/tuusqCUKHbfV3xjbAT6cUdW2YEbBXME+AeIoZMV+mjT?=
 =?us-ascii?Q?S8jYJzdW4Q1A2CSAOGyBm/W7K2mcro6sgn/z5f9sogS/LD29zkiaeKdaMDKT?=
 =?us-ascii?Q?HQvmleZ868hjFaAghzJqUMwX/xPB+SRPci3PgYezygTdHshji2mGqDcLPzjH?=
 =?us-ascii?Q?JkyMLl8UvUTvk5BtSgIIGjaXTJj0tILu1jViKXQwuivuAP5b12pVOg9Ci0+i?=
 =?us-ascii?Q?56ZemChAAd/AlpaqC9SmL9oLBztyuqBYCivBf0TI+zRLvH3XqtmzBT2AJfM6?=
 =?us-ascii?Q?Eb5PiLfVc5cYZCOhn/1Pf1G9SOrZdaq1+aLy6yBbY1bN3zgRhz0UtCgSNzxr?=
 =?us-ascii?Q?bWyCA05QJCfCyn2xWa264ypaHLHEg4n+FdgSx8kH4wVRiU2P7x5xmz/KFK6J?=
 =?us-ascii?Q?sARNL6cHPiNWCNUsnGXTsBmOYZB1WcqGaaT4FCxtHNm2aH8bDcDHR5JlDD/n?=
 =?us-ascii?Q?73roJUrnGXCQL556IFq5EFcui52JOtqHm78TpEUPBfOEHkaJLTX4E0YZCcpI?=
 =?us-ascii?Q?Gd4SHhP3sfsKHNRFX3p27FsAhZGPyDpOQR1/prnVDv8FACXx03LFRBbaw3o7?=
 =?us-ascii?Q?4qN3sfZtbdbXhtJ7TSztvZObbCnryN4KSbG6iUrf4QdFzcjnAN0tOeFyHIPD?=
 =?us-ascii?Q?wR9ZusaPDAtcAamdYdYdHILMB+p0WmGcf8HIxBcfXT+7fRDmoJbFrVOxegYq?=
 =?us-ascii?Q?XfIpEcC2gjCT5BmI5sqkyG6U3dnHnyAHUwJLXyjR1cTI9EFab4PwFLaglTbq?=
 =?us-ascii?Q?HEprEU0yROFRtCVpqP7YX0n2wjmdv5Kg5Edetb2y71eU9ZJTf224sRM9/BmM?=
 =?us-ascii?Q?iS0H91BcBYID3DyZlcjc9ojV/l1oxH52zWUHWaRuzqLchYlcgxq6gsweLoUk?=
 =?us-ascii?Q?E6n99sgO+qc3GAdw3aB55bp3u/DZe1dwlnmBM2WpAdioPDkFPI1EP84iS4f3?=
 =?us-ascii?Q?KegwSh55fh+TMmeTh9MbCDFGx16HWp2IT8dVcqcm5zU498NhmMQyMtJck7fE?=
 =?us-ascii?Q?5clEkm8b6oXfBdAEBV8gl/TG867wLob6ic5qdO8G?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e90646e2-6d6a-470a-f9b9-08dbbdb7ff47
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 11:10:16.5136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 hGflbsOZg+xOQecSoXbMQK2jsJy0xvAVUiaMpkiI9D7Dp+amvyh2FThd0/zN34FB6A6ux0Ghyh0PpbXhid5yPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7884
Message-ID-Hash: A4QJRYOPVBPT2FUYWLJ3LRAX6YKOJM2H
X-Message-ID-Hash: A4QJRYOPVBPT2FUYWLJ3LRAX6YKOJM2H
X-MailFrom: chancel.liu@nxp.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A4QJRYOPVBPT2FUYWLJ3LRAX6YKOJM2H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a property to list DAPM endpoints which mark paths between these
endpoints should not be disabled when system enters in suspend state.

LPA means low power audio case. On asymmetric multiprocessor, there are
Cortex-A core and Cortex-M core, Linux is running on Cortex-A core,
RTOS or other OS is running on Cortex-M core. The audio hardware
devices can be controlled by Cortex-M. LPA can be explained as a
mechanism that Cortex-A allocates a large buffer and fill audio data,
then Cortex-A can enter into suspend for the purpose of power saving.
Cortex-M continues to play the sound during suspend phase of Cortex-A.
When the data in buffer is consumed, Cortex-M will trigger the Cortex-A
to wakeup to fill data. LPA requires some audio paths still enabled
when Cortex-A enters into suspend.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../devicetree/bindings/sound/fsl,rpmsg.yaml      | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
index 188f38baddec..d8fd17615bf2 100644
--- a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
@@ -91,6 +91,21 @@ properties:
       - rpmsg-audio-channel
       - rpmsg-micfil-channel
 
+  fsl,lpa-widgets:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description: |
+      A list of DAPM endpoints which mark paths between these endpoints should
+      not be disabled when system enters in suspend state. LPA means low power
+      audio case. On asymmetric multiprocessor, there are Cortex-A core and
+      Cortex-M core, Linux is running on Cortex-A core, RTOS or other OS is
+      running on Cortex-M core. The audio hardware devices can be controlled by
+      Cortex-M. LPA can be explained as a mechanism that Cortex-A allocates a
+      large buffer and fill audio data, then Cortex-A can enter into suspend
+      for the purpose of power saving. Cortex-M continues to play the sound
+      during suspend phase of Cortex-A. When the data in buffer is consumed,
+      Cortex-M will trigger the Cortex-A to wakeup to fill data. LPA requires
+      some audio paths still enabled when Cortex-A enters into suspend.
+
 required:
   - compatible
 
-- 
2.25.1

