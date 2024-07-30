Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38652940421
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2024 04:08:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E880E9D;
	Tue, 30 Jul 2024 04:08:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E880E9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722305302;
	bh=Bp7EUHbMlCX8NrGlSB2mlcwwzFXrG3jyeXK4vHJLKEA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IqwqOJIDueMmpVw7pjsn7gXIC6OML9tgk4Lpnbbdeiw2wZI6XSlfrfrEeD/Gbnfat
	 oGCLblgdHuIigqiU5Fp0cW5pPoblTj1NYX2KlIxhaucjzomxoeiKe7GAXsxdAqpb5F
	 gmZHDSA51POqgF1dWxQYJGop4PuUFWjhMU0jRFlc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4839F806D7; Tue, 30 Jul 2024 04:06:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40348F805E5;
	Tue, 30 Jul 2024 04:06:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6DB7F805FF; Tue, 30 Jul 2024 04:06:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C959CF805A9
	for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2024 04:06:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C959CF805A9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=S939cQuR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vOddaXstN02B5biK8GudbkBKlQICc2Rap14kNf/tJQcdliaCVY2WmMOV3G2oA5tB4TDsUxxpkvNfMe0TDFfrOdxOYhmJnLyFXcHs3uplMQfpHWkuiM0/88pCVTSowUQfjRhHGQ10bAgzlBBBkW5Ln0zWHAxzZgZTx22M2026MtsmpZKSg/WuwnR7LsX/RaaXj2dKuL4NwMqJfRRJwmkfk4RQgVFHWze5rcdwMFLS7YLF+tjyePfle3nl63y9foP8Pc3E3GQ8BUpUDzpEMUuZLKpYNmdY9JcEYwTAA5GN7IMamE1gsP6T9WpDFs51SFaq6BwRY1CErEDRo6+BiOtj/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PNrZMqv2BKjyKQJMUoZ1S5TDVrPo+9FSNc9wZOBwspk=;
 b=co7NSbH+4GsAyD50K38gD2O/8KCiYraEv3DOw/uhW92oTDkAtAtLG329ued3UXckGYgKok238DiyGmrodbZI6FHF/vy79JZ0UOmM+w8KY1c3zETN/z2oBfBMbLqU4UvuqvvbqhOXYEFt5ZLJ6+aAcFQ9M5SciiMvBz3nRgXmfotT5pBhZg3gOBNYWXnLUu9NjxmJoJDfy3nQz9biG1HEbbtXri5VIx+WJ/A0jP9WbD8DByfFOwfaTjUexK4HPHElDDuGEPTHvhggh7xCEMqp25DIGzxQG+zPeM/c2Txk8XdppMSp6pHFkgzxzyuOKXAAJn4fuzLrHhe2ylVQLVIdrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PNrZMqv2BKjyKQJMUoZ1S5TDVrPo+9FSNc9wZOBwspk=;
 b=S939cQuRwsXnf+vAF3VOK75VBVNArimW8dTGdpZXwczQq1wIHqF/1oGTI24OwAMtl7iYAku05khssEw3md/Ce2uWMElrxVXB1H3R10hFStUt9Efp8LtKHOeWzML8+OQukkGAeBGbE352wBXUtlbooUKjTWWlpyHvOOjSy5X3m9A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYAPR01MB6427.jpnprd01.prod.outlook.com
 (2603:1096:400:a1::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 02:06:04 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 02:06:03 +0000
Message-ID: <87ikwnk510.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 10/12] ASoC: tegra: use snd_pcm_direction_name()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87wml3k539.wl-kuninori.morimoto.gx@renesas.com>
References: <87wml3k539.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 Jul 2024 02:06:03 +0000
X-ClientProxiedBy: TYCP286CA0198.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYAPR01MB6427:EE_
X-MS-Office365-Filtering-Correlation-Id: 4def750f-ee63-4bfb-e752-08dcb03c2a93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fkFdmtjD+DELYxSxgy4CfTVbNZA3xEwq+TJlVHys3q2KgmaTPhp1tKOwt3NL?=
 =?us-ascii?Q?85lumvIbMOyjAJbfp+aAhna/TASM+bunwKEZooYYtk3b473+FNHDkP2FvQ4x?=
 =?us-ascii?Q?J7WfiNRpXpu9Tm5h6YT+YMAOkerF10+xvRgGag4PD/52IVg/7XcbOZvNF2x4?=
 =?us-ascii?Q?r3PxDVE22lr6u2WRCF8lY6We4ziwTwtXwmneP/s1+VVV6K9HUemdkv8/d3lR?=
 =?us-ascii?Q?g7EPbXAbAHb9fHs1qeu9qlGNNp5YF6+n4BSKH6VnCftowzjEwaBi/kTeqYOg?=
 =?us-ascii?Q?fPVPz32tiv39tqt2J+augwBBlTakm4W9NEUNmr55gdjgHS29qgo2ooGWufa8?=
 =?us-ascii?Q?v/JJP4iISZ1NVsqcikqF8HfdpyUv5lVieu+xXL1TMXcanfziCJNniNgiiwmB?=
 =?us-ascii?Q?vnfAlzEqzMzoyk133Li9hFO9qNBTrnmArjnoCxanAX375kd3M3j+a80Y49xp?=
 =?us-ascii?Q?qzgf5NXSOB9habvAKUTYePF7CvYkTSVU8IA0m3lNEAcGZYQOi64OAUVMJR2i?=
 =?us-ascii?Q?nVSSqaGYsFcN8XEQHbXEGUAZeGExfqaZ2aj3EktWeWPnle8IdPylgUUO8MvV?=
 =?us-ascii?Q?7Cx0qQfbXwElIKMKf2d72s+A2hhhYsdwEN+XYb40E7J9F2wohkbhC+uxllb2?=
 =?us-ascii?Q?oVeB7j6ZsXVXYNuqvN5+SX7KtIUigLe3KdV3Wmnb9MIV65e3qCMd9CVBcYWv?=
 =?us-ascii?Q?gPjeuikuFlOS+D7v3HukPlwvjonQNEUTqwLrbHVfhdSAnP9GF65zQe/yobP9?=
 =?us-ascii?Q?oHEcBq9wg/v5yzWLC5B5CJ4L6g2Aj4VVFSdHCt/gnTXRFM1HM8cL/lQ5QmUC?=
 =?us-ascii?Q?Q8TKXws7yqWybzGjynqkZcY+AdySnddLW5uW0Lx9lvqrvUXAhscYL4WVjCLA?=
 =?us-ascii?Q?NrBqllc2lplN1vrxFGsvs8VZsmWNgT94ScMGYesmFL8EQrR3hlG5SDb8r4m0?=
 =?us-ascii?Q?ucnWvVY3i5hoWF8c7DLn3AucypgUuDmJHT4G6hO0jFfzhdgm0b4c2wQTKOFU?=
 =?us-ascii?Q?ZFfcVHYjHgfRwQFcnTrmYmW02/7gsdf9GKz5a/69Zcq1GICa4M+R4X0pL/yW?=
 =?us-ascii?Q?uxAtCTytHVmySJscRLO2LV8k/GVdmfezci8h9UvdkRGGQKpodSUDT1E4Gjd0?=
 =?us-ascii?Q?C39PmWkw8IzsbfNJFV9z6UPZzEQhQ6u3NN+aNmTToBAzwXQn6jKCSevhZ7Zd?=
 =?us-ascii?Q?yCVbMTSwzHIj5yK0/mN6ShNZjsr+QcFmtytRYReBUXUdlOZNicSqfMyw/Jf7?=
 =?us-ascii?Q?i8MIrtMqWP11xZN6jM8pTPC3Cs40gRq6qfjAO8rwwAEAdvS3SPg4PSamCqfI?=
 =?us-ascii?Q?/3LsYzBJJGEE1Bq/yByTG6XJzJ5k4lNy4LHrErL1oHbUA1xPJTP2EGVsBWIW?=
 =?us-ascii?Q?GAVVi7RxZugnG0Le8aU3VqL6qZHBLjiiEwTantoaMDLvuOpXRw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sYLqQgw87Vwo8J9ZNSlWgFbteU7eNR5Kk64E9Z8JwngWneMCqFwKLsqH1Th5?=
 =?us-ascii?Q?b+p8QrSywQGY90vhCv6oYdcTI6PEjwpSV6VMyUy/ASaHC0fkJrhXo/Mn7ifA?=
 =?us-ascii?Q?2IMWRbDXPoYMNOydAZTmSuWXXmaQryyUqbxIKNN7J8mTMfN9aoVMwzMdDtvs?=
 =?us-ascii?Q?YnHYT1tZL1QwMkoywATnReHl84AG8jg4izRp9ecEtfryOO9RmY1b5EtIM9D9?=
 =?us-ascii?Q?AVEt99hjyZg1FWLcMESvgIedsq3MHfVKSIuzooWAewt/DP8pbqFUWvz6lybQ?=
 =?us-ascii?Q?wHopDGO5e5ADOLvdF8FJgYud38sUc/4pkQzV6kieUQuED75uq2BeHWW0MUbY?=
 =?us-ascii?Q?+qtJIshhF5odeo3b400qEpasSKgAVcqhkn6zdeAAw6wAu5JrUDEy8Ujs+Cdo?=
 =?us-ascii?Q?tiwskSy4gMblfGPelSdKEzEEQ9rGvXusoPz1r7eLbpXMX7zHiBrBXwdz3pm+?=
 =?us-ascii?Q?IxSkulW6JabGDtVEaAdQty0xoojCdY4faOP1KWKlM0YcCX6aQyuZ1Ukyhdq/?=
 =?us-ascii?Q?HAhNEeyfZPM+uh87UBtRCeV3aHtffLwGJJ4/32sreu0BLkf/5u+7TG+24NYz?=
 =?us-ascii?Q?+VgZzTNLCna6RdCBr8fqj+duhw6g2/4ND6fVrYdu3r0RTmu7a/97t57r/BO/?=
 =?us-ascii?Q?fTSXOvclWkeUgxLvcdNlJD2UmuS8EdF5bu54p+Ymm8xXNuCcw9sVvfNm0IKG?=
 =?us-ascii?Q?1QIQdZgvMazOa+zkSyl6uOHyQyvBeP+OW0NR9daBS0gRzCQfTm6/gIUf3xOI?=
 =?us-ascii?Q?wtkE0EZzpiU25yRmZYT2eagdUuvTggK3JYMsELlC59ox7eDIVlf4ZTcOCSmf?=
 =?us-ascii?Q?OJ9Rm56NzpbhqWMNBvJgMUpe4D64ojtfVIUmsEwW3+BUmRqZeAQHiy5xWjqe?=
 =?us-ascii?Q?alOcEJ7lZPr7iBwGCh0bIVsXINrJH/eWIhAT/ujZzPS98nWt+VLx7SXlw1SP?=
 =?us-ascii?Q?7NJ7i7kXhDaJ3S565w+1OUXRz+nxFdOF/QUc7cpzf91bwcLXAN8XwamSkcKD?=
 =?us-ascii?Q?UGyhodsVKLy4HJrGozSHjkSQT9MrxD9Mg2IhDdanPI3qUtrGUP82wIxJmv/4?=
 =?us-ascii?Q?NDBTCXUOp0kebZnkx/3wwFJLevKsRtHtV5JbZSaPtYV69MyxmC4ohwAKodTy?=
 =?us-ascii?Q?F/ogqVheFIJIMhkGdHZ70J/VVaf/SUHCnNEcChn98nR08wVOwhTwxJPandAj?=
 =?us-ascii?Q?RJPkZOheoplGiSq+44u+mtvWbkK/8huuzo9fk4EMS6W9vpGfV3li851IsZ82?=
 =?us-ascii?Q?idieI1j+bnFWuolBmtp9ZTBfG/pDOV4HLJAwotZb1Jltz4fD9kxAEHzitdIW?=
 =?us-ascii?Q?6yJy1eqXjqMEDZ4HdRk3oGF+e+2uarbKTPX6RkUWLPLRzizlzTD/LSu5MYrQ?=
 =?us-ascii?Q?LK7EccJST6CEkdTONoRqZ2oXLoiap3Vu2t+Qai0rX8KcESydzied4PGd1yuz?=
 =?us-ascii?Q?1f2aTSXn83knnYvob59TKX0RGOT6xf5RP5VC3c815pGuLjU/AKIparwCPPgH?=
 =?us-ascii?Q?6arGfP53zSQYq0FTbWcE4/VykhNk/9VPgk0avS9bzC5h3oymRThECIJ/9ecd?=
 =?us-ascii?Q?+I3CqTzOq3iOJy0Poo/Ajd+mL/nHVMeSPwS1NQ2M1aleloCKNjcGvk25/Hwi?=
 =?us-ascii?Q?Np5jXAnSqD9sxfAE00S2YvA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4def750f-ee63-4bfb-e752-08dcb03c2a93
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 02:06:03.9528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 xH7mzxAY6lRHW5dZDUkbhI1TYO6SNpwcq/2W4Jx2vd1+3/HfWPQu8uJO16ddEL7mh8fhYAMCpO062lr9Vd2J9auloP5UHmMfoVEU+U1NCrpaxCwLxIHabOJKFRWMg+RY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6427
Message-ID-Hash: AKMHX2Q6JWBI5HYIISYJSLT37M4ZQJMN
X-Message-ID-Hash: AKMHX2Q6JWBI5HYIISYJSLT37M4ZQJMN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AKMHX2Q6JWBI5HYIISYJSLT37M4ZQJMN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We already have snd_pcm_direction_name(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/tegra/tegra210_i2s.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/tegra/tegra210_i2s.c b/sound/soc/tegra/tegra210_i2s.c
index fe4fde844d861..e93ceb7afb4c4 100644
--- a/sound/soc/tegra/tegra210_i2s.c
+++ b/sound/soc/tegra/tegra210_i2s.c
@@ -85,7 +85,7 @@ static int tegra210_i2s_set_clock_rate(struct device *dev,
 }
 
 static int tegra210_i2s_sw_reset(struct snd_soc_component *compnt,
-				 bool is_playback)
+				 int stream)
 {
 	struct device *dev = compnt->dev;
 	struct tegra210_i2s *i2s = dev_get_drvdata(dev);
@@ -95,7 +95,7 @@ static int tegra210_i2s_sw_reset(struct snd_soc_component *compnt,
 	unsigned int cif_ctrl, stream_ctrl, i2s_ctrl, val;
 	int err;
 
-	if (is_playback) {
+	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		reset_reg = TEGRA210_I2S_RX_SOFT_RESET;
 		cif_reg = TEGRA210_I2S_RX_CIF_CTRL;
 		stream_reg = TEGRA210_I2S_RX_CTRL;
@@ -118,7 +118,7 @@ static int tegra210_i2s_sw_reset(struct snd_soc_component *compnt,
 				       10, 10000);
 	if (err) {
 		dev_err(dev, "timeout: failed to reset I2S for %s\n",
-			is_playback ? "playback" : "capture");
+			snd_pcm_direction_name(stream));
 		return err;
 	}
 
@@ -137,16 +137,16 @@ static int tegra210_i2s_init(struct snd_soc_dapm_widget *w,
 	struct device *dev = compnt->dev;
 	struct tegra210_i2s *i2s = dev_get_drvdata(dev);
 	unsigned int val, status_reg;
-	bool is_playback;
+	int stream;
 	int err;
 
 	switch (w->reg) {
 	case TEGRA210_I2S_RX_ENABLE:
-		is_playback = true;
+		stream = SNDRV_PCM_STREAM_PLAYBACK;
 		status_reg = TEGRA210_I2S_RX_STATUS;
 		break;
 	case TEGRA210_I2S_TX_ENABLE:
-		is_playback = false;
+		stream = SNDRV_PCM_STREAM_CAPTURE;
 		status_reg = TEGRA210_I2S_TX_STATUS;
 		break;
 	default:
@@ -159,11 +159,11 @@ static int tegra210_i2s_init(struct snd_soc_dapm_widget *w,
 				       10, 10000);
 	if (err) {
 		dev_err(dev, "timeout: previous I2S %s is still active\n",
-			is_playback ? "playback" : "capture");
+			snd_pcm_direction_name(stream));
 		return err;
 	}
 
-	return tegra210_i2s_sw_reset(compnt, is_playback);
+	return tegra210_i2s_sw_reset(compnt, stream);
 }
 
 static int __maybe_unused tegra210_i2s_runtime_suspend(struct device *dev)
-- 
2.43.0

