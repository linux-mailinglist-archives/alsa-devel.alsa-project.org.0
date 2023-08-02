Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE7576C1AB
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 02:54:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8ADA47F8;
	Wed,  2 Aug 2023 02:53:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8ADA47F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690937654;
	bh=cMFH5Dxy+ZJoT8cWJQ+Hyd/fk0/oPbz3zB6uevGnAwg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SPcnXtfBAUvHVYokTdbptXMs0xDDwbBs8/zkjXj0Uw4v602VFNPem/AyJ9VcAo0pN
	 qtjtygFxmUhVjPyPKPhLMe9m4D/IWG3RiMkM90KU7HwiyyYe8L3rqzzHX9tiv5B1wC
	 gT7KB3AmVd/mlFbuQDO1esl8RVnqMjXn2mlnfiNc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 497AEF8055A; Wed,  2 Aug 2023 02:52:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0202CF8053B;
	Wed,  2 Aug 2023 02:52:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47F64F80549; Wed,  2 Aug 2023 02:52:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20721.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::721])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0CD6DF80149
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 02:52:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CD6DF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=U0fkcwF6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DthNmhmMFvKgONWGXjssJY1ZXOwieEqJ/NViroyF67Ar1jqaW/1ZMNw/43K7eujTWJtfK5yMB51UMULo2CYS+8KABag5ZDyjXlOuKAc7qnpK06Us5jryiH0FWxxJ4iLR2XdnA2KuKvg7zYqy78vxbNrDcZGuUI7ECLjSDDBLXfKr/kSMWcDIw1VgTvRfuvGR2BzFads1XwPpym0vQ9/axEGaidQci4RW33eH4NV9F6oB+osCN7KnpS2c/Cf3qZrf7lj+vYVZJQLPWO9QavfSF87ZgtRqdKfIVfImCDCaJuUJ2LmXpxFD2Q3fRdF2W8iNjDJBZ1cVjO+meAYckCMO0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hVVumunzmYcwXVdvaaN93q1hVkmItYRmdoFs7xeuYsw=;
 b=AXtviMLmJo1748hImUqoHXFQwxo9FUyJbZ41HdsEWkZu/pE5HlaKiwyAh3qySabeT3SHLI5On+nqNf/l29Pm7xWyDPowP5ewfyiB/+SY0feMMF0jwGq7fPMRXmyXfwQVJ87NoQ8yTXr1Fprlq9ZebB4WvCu8uEqeqpCyaZC3Tf9bXq2kbHjmMhiP4J90kNsKFqlMhz5IjP0sVww5XwqaLeiSkhI6/+C0f5GEnPoa8glBM/jrZ315llD+5xy2+pMHsyCjy2ct2X8PkleRYyX6DzWqa8CywAbNI9qufnJYIDdtxehUogFMLZ4RvDTM0JHVSsvJctQriLoRzqgrSDJjLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hVVumunzmYcwXVdvaaN93q1hVkmItYRmdoFs7xeuYsw=;
 b=U0fkcwF6eVfCoIlfEXxGwMHYV5cPEB7NpcF9+EIS98i1L6QCI3r1+Ic9F61kO+INqPMWLhfLqQnG2VMOCch4onUE4pYyAOvEHlIgfibJbkaJoE3LOqEjMNs6v9+PS3HaIvDhveHUBszLVHr9locKAs7Jb8SQMXH/v6uctSWrH0U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB12016.jpnprd01.prod.outlook.com (2603:1096:400:408::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 00:52:23 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 00:52:23 +0000
Message-ID: <877cqeuuyh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jarkko Nikula <jarkko.nikula@bitmer.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
References: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 02/38] ASoC: ti: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 2 Aug 2023 00:52:23 +0000
X-ClientProxiedBy: TYCP286CA0135.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB12016:EE_
X-MS-Office365-Filtering-Correlation-Id: c75f2fdc-bc14-452e-5831-08db92f2bbe6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+cAA8ZaktrNOzdeVUuvGQbRsgg9XrFWy1MPUZp5vMoV4S9v4ItslhPd+FCJGFXahNW9rM97XFQGgDHMkeuUbyuvGEyzfsT6RVm3TlreCHbiKu6aB+x/UOtV60z1sDzBhjocv2IZ8V2itwJH4xykrzSL0A3+9KUpkpBnjq+TmjXWbjePe9e0VJr0oh80OZLIOuX+7LVrZBezhBAOsHXsRzKojj5oX7js5ACZcI3GGOA7a29A22RRnKysKndo8C/Zejk8noSxXj0AdU0AL4GwdmF2LznzKaqlsPM0Tv6lMunQxfWPjx2nAqfQuJ0dxyg96DG5y4uddj52vmWMhooNtZMXosYqNnh25IU0s/afApia52w6sNnDXbxvmGOlsjcSUbj0Ps/vQplYcl51TnvQR5bA7cICU+GsHYaKezg3Yfvwet2grJ+C0o9wdp8NmZ6+1vDdFD67/0d8UTA6N8v5Q2iedKfi5RK5ec/px6mb+Wfcd24m6vyyPD7emFvN/p0AzVROR/o+E9kRgLkavFo5raIm+bSQe/TrhDfjqu4PpSYaVAXuA0YeZ7WNHyoimG90++opeRe7WSRtzzGQFXkAkuf3yT6BjZZt4ueuAH/daxSM5Z5c5Ck8O3SRI9Twp6jli
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(366004)(376002)(451199021)(186003)(8936002)(83380400001)(8676002)(26005)(41300700001)(2906002)(5660300002)(2616005)(86362001)(478600001)(110136005)(38350700002)(38100700002)(316002)(6506007)(6486002)(52116002)(66946007)(66476007)(66556008)(4326008)(6512007)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?700Jt3OGQ4pGHUeGaYi/ihqRuxdFM+6E8HSH1ooCNVm4pFqjecssjf0buWhd?=
 =?us-ascii?Q?PvEdbRpcwovGYNOeFjoWtDCruty9eH5STjJASlWPQpzBPIBPVGk1joIPcH1S?=
 =?us-ascii?Q?K4g9e6PFKtnN6xcDaSckOOvk1YVi5XsDInHbksK2qBw+RGapDoLfW4s20mEL?=
 =?us-ascii?Q?qinCuh6EWncWM47ApiY04ggFWlVnmtV3hEWy0iTlONealLEHzS601U5Oi3sW?=
 =?us-ascii?Q?IcHmvx+f80IoK1hOZsdzEeoYsdgQ7ZWL7twNJlIUp0FJKM/+F5I9nueS8cfU?=
 =?us-ascii?Q?p5oyUsUjOv/UfIIVG6UxUEQg/Y72Te4gXP/lRGTX6d/i5Lc/RkXW+SlraGDU?=
 =?us-ascii?Q?3dqNVYmTIrk/8vL1UWbYagC0w7tRVRyeHzkx4/nHtaGzqNfjGDd32y5x6F+i?=
 =?us-ascii?Q?+pTfLWBuf0wb18XrJevY2TvfQD68gMLnTLtbHDDtwikyXmwKHLsdphe15pj4?=
 =?us-ascii?Q?TZZNgVt9BOLDoHBip0F15mK1spm9388PR3YFRNqv7D1ZEAomjbau10/D8yn1?=
 =?us-ascii?Q?+JAkdXo+gFZDQnsXo8yBaV2oxdqnpKGBaOeBgu/z7QlCPcKyKnXUSCVl2RwJ?=
 =?us-ascii?Q?e17AsZX9AVexJveJtq3u/GRMLbagHnYSJZAqc5KWxqHQKNz8WcU5AY1s6E51?=
 =?us-ascii?Q?jY+OfrvDTNFjt4hYVTxOsdBw1H55gG/9eER0s7ZHyNkpxC2qvkwjMdiHW06Z?=
 =?us-ascii?Q?2iipJL0QyZpk6OznajwZ4GSvMuf0gTMg+sZco4MERVR3iV5fFGuy5vKVHkCz?=
 =?us-ascii?Q?yISYuvyXdNDrhkyEhQcyzefOcFsEATSCiO+ozKMS4g25SEwe8oopI5Ke3GlP?=
 =?us-ascii?Q?x3yF2oWCqG4pKGwPhv9Rbmntha/spFRcBCRXWFUQzbvbTMPSyx/nf6NtOh1b?=
 =?us-ascii?Q?RwvcoK4Qccusrnus6tcSx0gI1HfVZZTvQV/xqY/fPpLzG8uu4QzFd4hSCtJh?=
 =?us-ascii?Q?VcOrzNAgkRLdVPR0m1rPT5bXAR2HJ1aauH+7xYRrYa1Iv3ptm4HJRrmZpjk1?=
 =?us-ascii?Q?LH6I67iYjTvocKtWe70LDPzJgxyMw4LZTQNoJIgSnQgXp1vd1T6ZuZschVDo?=
 =?us-ascii?Q?BQBXVfyrztXZ+FxP2q9TrXNROrqdQtuQo/35w7wuRNyp4ZOA3iQbTPcKUyDy?=
 =?us-ascii?Q?J+iKOIMDPwx7g9n3oZMz6bSQvqhetOWJCZmOGExjw/3iTvxjr8D9N8SyKjTN?=
 =?us-ascii?Q?ROK8otOG9++vGZLQrSi7kd8QuBfeEW4uYK7z1AZGYvwDwod/CdZd3/4TcBy0?=
 =?us-ascii?Q?+cVARw9HsJzdcgjDrVcanfE3ziwxwW3/+fzP2g6OKhOcyVfmgR5/M52QzGnV?=
 =?us-ascii?Q?JOxJFrmVYiIjOOE5n5COZccOQ3CrZ8gRUAJhUxQbIXN7lo1l5eUMXiMBfQ5y?=
 =?us-ascii?Q?w7V7fVE5SGwjdftWb2pgLfvnhPTAbE9WOEJK0pYPY7dU+vBccOBES1oaRAVB?=
 =?us-ascii?Q?JXh/HPBR6571GqrBIhuummGcP/Q43FoqtSBmdpWPAmk/75aA6JIz6Vrq3bDj?=
 =?us-ascii?Q?VLPvmetVCx+3dc4sKAqh12a0IRJGiHR42uKB3SYVfMno3tlZNFCDsIlIozR3?=
 =?us-ascii?Q?5e4JcRxr7PIXDHuk071JsxEO7bCUQusOnMGPEl4oPthcXjkKKYSduuOVXvyU?=
 =?us-ascii?Q?9SxCI0lWKfuyd0OPuJdFyyE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c75f2fdc-bc14-452e-5831-08db92f2bbe6
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 00:52:23.6392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ofLVcHDbjEq1eJt7NjTOyRGT72px5otLhuvXD4t+Rjf9IYJDZHPWov70cDYdqRbYFARAC+nudECuCHUe0tbzCVLV17SlqZlG3dIayBKbeTTyEqr5RL3KarvOMde7E9EQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB12016
Message-ID-Hash: CBLHFDURU3VNW4MKC344NDY77KI2PSLH
X-Message-ID-Hash: CBLHFDURU3VNW4MKC344NDY77KI2PSLH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CBLHFDURU3VNW4MKC344NDY77KI2PSLH/>
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
 sound/soc/ti/davinci-i2s.c   | 22 +++++++++++-----------
 sound/soc/ti/davinci-mcasp.c | 27 +++++++++++++--------------
 sound/soc/ti/omap-dmic.c     | 22 +++++++++++-----------
 sound/soc/ti/omap-mcbsp.c    | 28 ++++++++++++++--------------
 sound/soc/ti/omap-mcpdm.c    | 22 +++++++++++-----------
 5 files changed, 60 insertions(+), 61 deletions(-)

diff --git a/sound/soc/ti/davinci-i2s.c b/sound/soc/ti/davinci-i2s.c
index 97dd1634b6be..07c8b2259208 100644
--- a/sound/soc/ti/davinci-i2s.c
+++ b/sound/soc/ti/davinci-i2s.c
@@ -601,16 +601,6 @@ static void davinci_i2s_shutdown(struct snd_pcm_substream *substream,
 #define DAVINCI_I2S_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | \
 				 SNDRV_PCM_FMTBIT_S32_LE)
 
-static const struct snd_soc_dai_ops davinci_i2s_dai_ops = {
-	.shutdown	= davinci_i2s_shutdown,
-	.prepare	= davinci_i2s_prepare,
-	.trigger	= davinci_i2s_trigger,
-	.hw_params	= davinci_i2s_hw_params,
-	.set_fmt	= davinci_i2s_set_dai_fmt,
-	.set_clkdiv	= davinci_i2s_dai_set_clkdiv,
-
-};
-
 static int davinci_i2s_dai_probe(struct snd_soc_dai *dai)
 {
 	struct davinci_mcbsp_dev *dev = snd_soc_dai_get_drvdata(dai);
@@ -622,8 +612,18 @@ static int davinci_i2s_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops davinci_i2s_dai_ops = {
+	.probe		= davinci_i2s_dai_probe,
+	.shutdown	= davinci_i2s_shutdown,
+	.prepare	= davinci_i2s_prepare,
+	.trigger	= davinci_i2s_trigger,
+	.hw_params	= davinci_i2s_hw_params,
+	.set_fmt	= davinci_i2s_set_dai_fmt,
+	.set_clkdiv	= davinci_i2s_dai_set_clkdiv,
+
+};
+
 static struct snd_soc_dai_driver davinci_i2s_dai = {
-	.probe = davinci_i2s_dai_probe,
 	.playback = {
 		.channels_min = 2,
 		.channels_max = 2,
diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index 172fea764a31..7e7d665a5504 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -1616,18 +1616,6 @@ static void davinci_mcasp_shutdown(struct snd_pcm_substream *substream,
 	}
 }
 
-static const struct snd_soc_dai_ops davinci_mcasp_dai_ops = {
-	.startup	= davinci_mcasp_startup,
-	.shutdown	= davinci_mcasp_shutdown,
-	.trigger	= davinci_mcasp_trigger,
-	.delay		= davinci_mcasp_delay,
-	.hw_params	= davinci_mcasp_hw_params,
-	.set_fmt	= davinci_mcasp_set_dai_fmt,
-	.set_clkdiv	= davinci_mcasp_set_clkdiv,
-	.set_sysclk	= davinci_mcasp_set_sysclk,
-	.set_tdm_slot	= davinci_mcasp_set_tdm_slot,
-};
-
 static int davinci_mcasp_iec958_info(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_info *uinfo)
 {
@@ -1716,6 +1704,19 @@ static int davinci_mcasp_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops davinci_mcasp_dai_ops = {
+	.probe		= davinci_mcasp_dai_probe,
+	.startup	= davinci_mcasp_startup,
+	.shutdown	= davinci_mcasp_shutdown,
+	.trigger	= davinci_mcasp_trigger,
+	.delay		= davinci_mcasp_delay,
+	.hw_params	= davinci_mcasp_hw_params,
+	.set_fmt	= davinci_mcasp_set_dai_fmt,
+	.set_clkdiv	= davinci_mcasp_set_clkdiv,
+	.set_sysclk	= davinci_mcasp_set_sysclk,
+	.set_tdm_slot	= davinci_mcasp_set_tdm_slot,
+};
+
 #define DAVINCI_MCASP_RATES	SNDRV_PCM_RATE_8000_192000
 
 #define DAVINCI_MCASP_PCM_FMTS (SNDRV_PCM_FMTBIT_S8 | \
@@ -1732,7 +1733,6 @@ static int davinci_mcasp_dai_probe(struct snd_soc_dai *dai)
 static struct snd_soc_dai_driver davinci_mcasp_dai[] = {
 	{
 		.name		= "davinci-mcasp.0",
-		.probe		= davinci_mcasp_dai_probe,
 		.playback	= {
 			.stream_name = "IIS Playback",
 			.channels_min	= 1,
@@ -1753,7 +1753,6 @@ static struct snd_soc_dai_driver davinci_mcasp_dai[] = {
 	},
 	{
 		.name		= "davinci-mcasp.1",
-		.probe		= davinci_mcasp_dai_probe,
 		.playback 	= {
 			.stream_name = "DIT Playback",
 			.channels_min	= 1,
diff --git a/sound/soc/ti/omap-dmic.c b/sound/soc/ti/omap-dmic.c
index cb60af36dbc3..5b5eccf303ab 100644
--- a/sound/soc/ti/omap-dmic.c
+++ b/sound/soc/ti/omap-dmic.c
@@ -401,15 +401,6 @@ static int omap_dmic_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id,
 	return -EINVAL;
 }
 
-static const struct snd_soc_dai_ops omap_dmic_dai_ops = {
-	.startup	= omap_dmic_dai_startup,
-	.shutdown	= omap_dmic_dai_shutdown,
-	.hw_params	= omap_dmic_dai_hw_params,
-	.prepare	= omap_dmic_dai_prepare,
-	.trigger	= omap_dmic_dai_trigger,
-	.set_sysclk	= omap_dmic_set_dai_sysclk,
-};
-
 static int omap_dmic_probe(struct snd_soc_dai *dai)
 {
 	struct omap_dmic *dmic = snd_soc_dai_get_drvdata(dai);
@@ -438,10 +429,19 @@ static int omap_dmic_remove(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops omap_dmic_dai_ops = {
+	.probe		= omap_dmic_probe,
+	.remove		= omap_dmic_remove,
+	.startup	= omap_dmic_dai_startup,
+	.shutdown	= omap_dmic_dai_shutdown,
+	.hw_params	= omap_dmic_dai_hw_params,
+	.prepare	= omap_dmic_dai_prepare,
+	.trigger	= omap_dmic_dai_trigger,
+	.set_sysclk	= omap_dmic_set_dai_sysclk,
+};
+
 static struct snd_soc_dai_driver omap_dmic_dai = {
 	.name = "omap-dmic",
-	.probe = omap_dmic_probe,
-	.remove = omap_dmic_remove,
 	.capture = {
 		.channels_min = 2,
 		.channels_max = 6,
diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
index f9fe96b61852..fdabed5133e8 100644
--- a/sound/soc/ti/omap-mcbsp.c
+++ b/sound/soc/ti/omap-mcbsp.c
@@ -1254,18 +1254,6 @@ static int omap_mcbsp_dai_set_dai_sysclk(struct snd_soc_dai *cpu_dai,
 	return err;
 }
 
-static const struct snd_soc_dai_ops mcbsp_dai_ops = {
-	.startup	= omap_mcbsp_dai_startup,
-	.shutdown	= omap_mcbsp_dai_shutdown,
-	.prepare	= omap_mcbsp_dai_prepare,
-	.trigger	= omap_mcbsp_dai_trigger,
-	.delay		= omap_mcbsp_dai_delay,
-	.hw_params	= omap_mcbsp_dai_hw_params,
-	.set_fmt	= omap_mcbsp_dai_set_dai_fmt,
-	.set_clkdiv	= omap_mcbsp_dai_set_clkdiv,
-	.set_sysclk	= omap_mcbsp_dai_set_dai_sysclk,
-};
-
 static int omap_mcbsp_probe(struct snd_soc_dai *dai)
 {
 	struct omap_mcbsp *mcbsp = snd_soc_dai_get_drvdata(dai);
@@ -1288,9 +1276,21 @@ static int omap_mcbsp_remove(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops mcbsp_dai_ops = {
+	.probe		= omap_mcbsp_probe,
+	.remove		= omap_mcbsp_remove,
+	.startup	= omap_mcbsp_dai_startup,
+	.shutdown	= omap_mcbsp_dai_shutdown,
+	.prepare	= omap_mcbsp_dai_prepare,
+	.trigger	= omap_mcbsp_dai_trigger,
+	.delay		= omap_mcbsp_dai_delay,
+	.hw_params	= omap_mcbsp_dai_hw_params,
+	.set_fmt	= omap_mcbsp_dai_set_dai_fmt,
+	.set_clkdiv	= omap_mcbsp_dai_set_clkdiv,
+	.set_sysclk	= omap_mcbsp_dai_set_dai_sysclk,
+};
+
 static struct snd_soc_dai_driver omap_mcbsp_dai = {
-	.probe = omap_mcbsp_probe,
-	.remove = omap_mcbsp_remove,
 	.playback = {
 		.channels_min = 1,
 		.channels_max = 16,
diff --git a/sound/soc/ti/omap-mcpdm.c b/sound/soc/ti/omap-mcpdm.c
index 35deceb73427..d7d9f708f1fd 100644
--- a/sound/soc/ti/omap-mcpdm.c
+++ b/sound/soc/ti/omap-mcpdm.c
@@ -404,13 +404,6 @@ static int omap_mcpdm_prepare(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static const struct snd_soc_dai_ops omap_mcpdm_dai_ops = {
-	.startup	= omap_mcpdm_dai_startup,
-	.shutdown	= omap_mcpdm_dai_shutdown,
-	.hw_params	= omap_mcpdm_dai_hw_params,
-	.prepare	= omap_mcpdm_prepare,
-};
-
 static int omap_mcpdm_probe(struct snd_soc_dai *dai)
 {
 	struct omap_mcpdm *mcpdm = snd_soc_dai_get_drvdata(dai);
@@ -457,6 +450,17 @@ static int omap_mcpdm_remove(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops omap_mcpdm_dai_ops = {
+	.probe		= omap_mcpdm_probe,
+	.remove		= omap_mcpdm_remove,
+	.startup	= omap_mcpdm_dai_startup,
+	.shutdown	= omap_mcpdm_dai_shutdown,
+	.hw_params	= omap_mcpdm_dai_hw_params,
+	.prepare	= omap_mcpdm_prepare,
+	.probe_order	= SND_SOC_COMP_ORDER_LATE,
+	.remove_order	= SND_SOC_COMP_ORDER_EARLY,
+};
+
 #ifdef CONFIG_PM_SLEEP
 static int omap_mcpdm_suspend(struct snd_soc_component *component)
 {
@@ -502,10 +506,6 @@ static int omap_mcpdm_resume(struct snd_soc_component *component)
 #define OMAP_MCPDM_FORMATS	SNDRV_PCM_FMTBIT_S32_LE
 
 static struct snd_soc_dai_driver omap_mcpdm_dai = {
-	.probe = omap_mcpdm_probe,
-	.remove = omap_mcpdm_remove,
-	.probe_order = SND_SOC_COMP_ORDER_LATE,
-	.remove_order = SND_SOC_COMP_ORDER_EARLY,
 	.playback = {
 		.channels_min = 1,
 		.channels_max = 5,
-- 
2.25.1

