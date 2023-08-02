Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C0776C1AD
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 02:54:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CC751E7;
	Wed,  2 Aug 2023 02:53:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CC751E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690937675;
	bh=VT7jhRl/fcMoNnKivFjGramW21w615SCW/kFVsus6fY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z375Hh2Lfh6EQViUzoyMDKR7hjjEB5XrFGUVZW6wcKzacUzvopFa0cPxhZGsU/xRb
	 HGg5u+c0BTMU+MxwxQ3m+gbKk/yJmYPAq10iLUJIUuvAtK8JlZWifPKIcMDQOuEPbI
	 dI8To4Cf7Pm/BLCYRAR4gEl4yBdEobHoqJ2ZzpWY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 380B1F8057F; Wed,  2 Aug 2023 02:52:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F0C84F8057A;
	Wed,  2 Aug 2023 02:52:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80378F8057A; Wed,  2 Aug 2023 02:52:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20720.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::720])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 11D99F8055C
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 02:52:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11D99F8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=JdhZKYgf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j/9PsFRDyYawhHcHlhefaUV3KsYg09YCiyIllfP2Pp1zhpy2IZy/4m40IuWPOmuFM9ZScStudBIcpEZtmWiXeGzIZDnth3Gmx3LhzJ4hPHtivxLV9ZdDHB4LKkEbY1nqP3FzpWYrih4DybztZSlvw8JUlIdI+QKIhp+ZTDbPMu2tUcxGBGeD83D/5wI2gRfk9fUs0CqVPb8yS221fholXtczUw4uOyEfwf7chkoa2Pqkdt1BrszHRSUBtzz3ZA+uVvWrmhHDAtP8+zCEfwXzgcrijKinRV6WZXj1+tiFKpa/Fz2dQniL5NHa07/ymIiZthl8vh6o6Uq4tBCSKMZdeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IB/2m2O31TxjIt2X+RRB87LPseiLF4W8peGV5Rywowo=;
 b=VcEe2uCKRXY0DGJBqh5Ygi0IiWjkz8aR8qcvDVU+9GNRPM7YNjgCQ2qeWQV4G8OHak52HaktCWmpWWc3GM6hL8DKs4ys6SFyl40cb72Ba6CvuizLc95Deq/KtlrzmT260S4tPUHRsRFAlsKmjJLwPSYZ+vbpSXLcwr6G5EyynTMKCXQFbPTUg7OzuDhNwWwliXq61GrGCtPUwgn+UEf3GehLJ6jg/78PjXpler4oTvVDs+Vv6I3P0nGhTI3PGs1QWC41xn+UBkVF5iWd5FUahY0dofButbKnnyPnvnSAOLv8OMSzDbdzivoUGoyVi6+0455y2IAhOEtWWtNmnzhe/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IB/2m2O31TxjIt2X+RRB87LPseiLF4W8peGV5Rywowo=;
 b=JdhZKYgfMs8IogcPV/KsxkSt9qfU79KYkSLIgyXobfnkLxtRBrJx9bTUFH7AerFPQtTmElKOLhJG+VXg+d1RxCsxG1UPJ8EtDLQES4phP7Okjh5RLld0DOvpaU7GhnzP3XE2kzIUYnBTeCTvXjrvG1HsPgKJohdiM8+WKSW4/y0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB12016.jpnprd01.prod.outlook.com (2603:1096:400:408::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 00:52:47 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 00:52:47 +0000
Message-ID: <874jliuuxt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: "Uwe" <u.kleine-koenig@pengutronix.de>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
References: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 04/38] ASoC: adi: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 2 Aug 2023 00:52:47 +0000
X-ClientProxiedBy: TYAPR01CA0191.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::35) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB12016:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ce8a612-7740-47e5-9533-08db92f2c9fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iJsljZSrJ4uiuC9cnq3Qr2BUEHMBWAreJNaD+G4yhqmFDrblK21eUp5JXvYFON1xtUN4/ZKl+8c5EjhUFSqITIZ81WQtR0gwg4zrCOtshwMsD8R5o/qGBFKQWP8sRtnl6euC/wEVj+m4KSkH9psHmSlxyI456pktT+ZhWNNx7Hg8MnJypiU6jaV/S6ovNwZ3gNLdCxRUJHSh4i+0f2ow4itpGa8ZBedUiCWD8veP+BcimIU3Ima4E1UQb66T9FUhAI0spT16284gXwrxcpHmvFCymLsiN7vAgMzA3gBq95ew98uiao0xpm9Qsk4SXA0Fb3cujtqAokvSQKJaAtSeKCUqVfe8H5O7z8kN6UlGMWerCdw08xd/EELH2ot4/mxu0HsE3WRHuVSCDyUN2X47oFZ6ByT8dbUM0uWx1UT7FIE3+Ym/1DnpRVUqLlhlZugWLrJalLM1k8oRR3IGV/RSOiRWvaYi8CRq6H5mt3m4D0q0umov0qptSw5BaemiHtVw+Aj25G6YwPN5JE6iEybvrcRQyB0oJtxC+GVPizkOsrKsm0CSgjWfD1CGI6r3dxQeG5fx9qR3QbMyrJS89WAh3ckDe9g2qtXdkSffC2CAjqAMEP93dJWdLB3T/+2U6bvP
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(366004)(376002)(451199021)(186003)(8936002)(83380400001)(8676002)(26005)(41300700001)(4744005)(2906002)(5660300002)(2616005)(86362001)(478600001)(110136005)(38350700002)(38100700002)(316002)(6506007)(6486002)(52116002)(66946007)(66476007)(66556008)(4326008)(6512007)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rPACh9XOcO/Uig8ZbgJpnhnGAA17q43EZ69cUCiX9qqVGndGI3gar24C1EYF?=
 =?us-ascii?Q?xmF7yRp4EAnBwicsxmGjlN6ik1Y1AaqQ+m5ztNo837uZbvEDVkIn0XHwqZ5y?=
 =?us-ascii?Q?x2Fa5EXoPamVg1rNj3TkfX3R7IQXixtmgJYalcS1KFdjJGlFmgTsej41ZHpX?=
 =?us-ascii?Q?R6XmE27yI9qsuL9QAqGfKuRGkTsX7YDTgnXSOJJ+LhFrt2abN9fX2T9bFbqX?=
 =?us-ascii?Q?7/WX26ACVFFAbCVAVX/elDqIMjvTTqKrpkoNgmG0zJPvtUi8DpzfejDCHW3I?=
 =?us-ascii?Q?AXaosM7YYUPcrQxSNKxoR5ld/k6hDXvg258rzTBfUVwnDKVsJ3yTVIT/kIHM?=
 =?us-ascii?Q?spwnjCV5G5V+Ao5dyKa/7vWSNuj5zLMK47+jE+fS2ZhtMA9VwJ+HCErntSKV?=
 =?us-ascii?Q?mpWhPNFb97cUwMF05DAGl+t65QyXHxcc3JniywQUw2iwScRAWwKRVQMSzq0U?=
 =?us-ascii?Q?S2ZUh1MX8NDrGXAlsOA/uV04NX/GV+VoCNEDh1rAbhtPA8XEcqt+naL8Ht+X?=
 =?us-ascii?Q?muAzBX9CK8V1XbQ853aJkhXUthQL0NQ/6nYe6MQBXHvJW+oTUnE7Hn+HPc26?=
 =?us-ascii?Q?L/sm88y/aVqvtUNQCD+eB3tUqFTdurFmq7hRLXDXwruWA5xZzlpupUgEOreE?=
 =?us-ascii?Q?nnCT5Vqhe6lVIi2NM20Jaz/3jYGlk5Znb3bXGiFLfQZhg34EUmNqVmYKBCTB?=
 =?us-ascii?Q?gJa4eyNz8g1O0U/XivLZVgJipcWOAOsoGwRq11g0ua0IuihVu2Zh9v4cQZQ7?=
 =?us-ascii?Q?ZyGWPlCMJRAbB/8krh3M/p3p2BmkaHhBpmP1vrIEX8IOEkdr2z+gsSu6NlDg?=
 =?us-ascii?Q?GMvqRnE14Iq6ET5LymBJuWUzztC8Cg7vFYT0Z8gc2yJiSbotz3jeSj6ycUKV?=
 =?us-ascii?Q?q2R18IVkCKc8mZmBmllEJoe4Ki+ml9+66kALIHIw002M/RvR3sbDoNoDeA6v?=
 =?us-ascii?Q?WhvfnxK/0OslWlf6rIGjAFWfrXppWeQuw5gEP50EHeo/HziTkvaF8ZWSGhpX?=
 =?us-ascii?Q?nMrFBpkGPdev9fKscCGNMT7deDdPev2UfQlj84K4soS0hYq0pe5y1LhBKcRI?=
 =?us-ascii?Q?/MlCaapIaYZrMvVcC9wStSReRQAAKxsjjHsN6kUSfSEo9NDOyKOHmdebIlzu?=
 =?us-ascii?Q?COQHfeyKyxybnBPQLtuCPPBSCdanBqtrwd/GZCuG/Mz0IRS/1/hkkiS/Zc2Z?=
 =?us-ascii?Q?ZbOfa6J+/aeUE3sb7nXyDTeaim/DRXjjYB0kNjmYeZSu9+H1O0V7Mj0YLTg7?=
 =?us-ascii?Q?IJxg1FfL3qsM0AK56sH69m6xN4adKv3+dEe27lzzeTsfJKv00dfjSPn4ECy6?=
 =?us-ascii?Q?0pHtqESLCAo+ublY1Qxbms7Wx92Y1B0TvBX7ROEG3R3woUEMCKONbMqiak3C?=
 =?us-ascii?Q?j0/rbX5FvzE0iBHYcJJCQdP6W+DU29SPJ4oZyk52v88aGwYcwHbaoLbARM7p?=
 =?us-ascii?Q?AVGqJ7xc/V/PzIatlfJw7uVCxthqQWes1N82JlJnqdNG2kVSjAIJYXYkO3oR?=
 =?us-ascii?Q?DsNQOtzlm8QmJAZj2l+TkyEj+SxMylhxr/OMhiiobjWnArrCIbcS8HPMsTdh?=
 =?us-ascii?Q?RXuKDueZGth61ypvFcjSVa+SUpHLZ0T7At1EMpcyzz3epj43J6z+iASIGJF2?=
 =?us-ascii?Q?aYbFOcc6HA3LVM4NzpzOLlU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1ce8a612-7740-47e5-9533-08db92f2c9fa
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 00:52:47.2730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 iy2VEi96dbTIhCgKqHHMhZpOQEwD1SVu8K+LuLpraDaYgPZDd/yIkwHbTb1GIGtzaee9yUVzjktm9bklYKErBmMtyIVi11gOU9dISQ0kHp6L98J2K3poKXYCoJLFOMaO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB12016
Message-ID-Hash: UMWGWLKJPRVCFH4ZBYFYAFTGBK6KFI2Z
X-Message-ID-Hash: UMWGWLKJPRVCFH4ZBYFYAFTGBK6KFI2Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UMWGWLKJPRVCFH4ZBYFYAFTGBK6KFI2Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA SoC merges DAI call backs into .ops.
This patch merge thesse into one.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/adi/axi-spdif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/adi/axi-spdif.c b/sound/soc/adi/axi-spdif.c
index e4c99bbc9cdd..10545bd99704 100644
--- a/sound/soc/adi/axi-spdif.c
+++ b/sound/soc/adi/axi-spdif.c
@@ -148,6 +148,7 @@ static void axi_spdif_shutdown(struct snd_pcm_substream *substream,
 }
 
 static const struct snd_soc_dai_ops axi_spdif_dai_ops = {
+	.probe = axi_spdif_dai_probe,
 	.startup = axi_spdif_startup,
 	.shutdown = axi_spdif_shutdown,
 	.trigger = axi_spdif_trigger,
@@ -155,7 +156,6 @@ static const struct snd_soc_dai_ops axi_spdif_dai_ops = {
 };
 
 static struct snd_soc_dai_driver axi_spdif_dai = {
-	.probe = axi_spdif_dai_probe,
 	.playback = {
 		.channels_min = 2,
 		.channels_max = 2,
-- 
2.25.1

