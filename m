Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5F98D139E
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2024 07:06:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 206BFDF6;
	Tue, 28 May 2024 07:05:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 206BFDF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716872763;
	bh=+fLML46oFBz2Z+U6q1KOeGG3IMo/VjOsh/XY9dY0lFY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a6mCWxVeqz6gRPK9Eh3Rpqa3m5j41P+O+cMcB5W587Mmica+DrsRemnioncpMKW4i
	 Avr6gao9fKNc/YxZGRRHehoCLO0oKDmWMA2xGQJOAB16FvYk1I18Z9+H0BouqgMXPN
	 +WjbD6SVSCDgRRhXJIrWWr7VcmgHTJ3nXbdzD9Sw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78410F805B5; Tue, 28 May 2024 07:05:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EFDFCF805C9;
	Tue, 28 May 2024 07:05:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41641F805B0; Tue, 28 May 2024 07:05:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2BADFF8059F
	for <alsa-devel@alsa-project.org>; Tue, 28 May 2024 07:05:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BADFF8059F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=AeeaSL5d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BBL3TbXiq8IM2FAq93I34ssHKNdtjxQaeILvzk8wV9IVC0Wbxx5HZB8y+HbJnaDPMEqXTpd3GRmgpRvUW/Soo3YtbwX8AzJYVqECo/IPvpJIveACnWT3W7+3917J4OUnWjOA9d2Isn0C05k5fTsbk7MXQBwCuDpe6y0zwJ/XNZMUnBfZ0sa28lprxAD/nZr7t12dVQq/ikzIof7tfKKQ1Lt18bxZBDgjIzEgR2bhlNpJXeqE4cbJSvehYSb3YaeoVtK2aT6HdUGnrFNLf8dm1+tKWn6A3k5AFAmyNFgBjADtEjil5klt+MAmEpE9zMPlSKX/OeEX/EGaGHaJRFzoeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OHDLeyHqoRSF/I1MFOJNd2Y3nxbWsOW6A061/JI9SuE=;
 b=cBRmPCQjEHRbVxM6lIWNys2eTiX4S1A1bGFtwTpLSkwbWEeD2meIIutwaG03S4EAV1n+PYC+tEMpBlfztASycVAw7teT+bEYKD0NQiN6FElaSKn4k/a2wIW08EcTH+BYw3+J46ossmEkPyd4aHJdvW5fS0473db/rH8dfijfcq5lEHMrN09dYiNKmD4iU0jUoaeQNHf7yAl5IVklAAd/EW4DpUDBw9sNDSW7OTKKCY6MoFn40LntYvJc0izE0NlsB6NDqkm8qj8d/xUOWZU+Fl1V8NhOVfi2KieV8Zxac6NvrWWQPAMjNwu6WGL7Pi4IlsFclNNC0ZCA48+G73FX9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHDLeyHqoRSF/I1MFOJNd2Y3nxbWsOW6A061/JI9SuE=;
 b=AeeaSL5diMcXDIhTXIOObBG8mbdvqaT4PKcVA1C0ONuT83fU13MtrVxY9dHeklpiHrjtZMMByZuVC40i6wUHLAZurjIPSWJYazt2um0hA3nYpsPY1LeRWiENLWgRc6A0DnqHIL9aWWzIRhs3tqhn/fixQWQl75wdgKMFhA5BhZs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB7090.jpnprd01.prod.outlook.com
 (2603:1096:400:c1::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 05:05:14 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 05:05:14 +0000
Message-ID: <87a5kah6gm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 01/11] ASoC: simple-card-utils: remove both
 playback/capture_only check
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87bk4qh6h8.wl-kuninori.morimoto.gx@renesas.com>
References: <87bk4qh6h8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 28 May 2024 05:05:14 +0000
X-ClientProxiedBy: TYAPR01CA0102.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB7090:EE_
X-MS-Office365-Filtering-Correlation-Id: 58e36699-6fd9-4995-d42e-08dc7ed3c241
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|1800799015|52116005|366007|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0dLypkDoDpspmldvfmi74O+I2LNSOzRwjcw6nlB/hzP3+QP03+mttRYFGVSp?=
 =?us-ascii?Q?dU/ZKLS91C8mk2Kz/QiKguMIuWLx7055S5l7DM3WpDbCudENhdSdJtJX7630?=
 =?us-ascii?Q?qTvfvNqVXrXGyKO2DXKvltdEEr6TCOFxzdoJsOq4Rhn49NNqI/9UZyMAcBTQ?=
 =?us-ascii?Q?1QKftVXYCSNhoPQUPVCCg3YNbZ989jFz8ZQsUIR6rnFGaWPxw9/066447KJv?=
 =?us-ascii?Q?Px1m6nBYKp8nNyA+PuIfcHmLY1jJvyXUbma8VjLxLw4dxu37hVvnXnlDPC41?=
 =?us-ascii?Q?uutp077nBofkKPUtxsGZUqSVtsEq76ZSjNt1yvGEMLDAfIHqvwoBu0MBlW5y?=
 =?us-ascii?Q?Ok6hj/poN5OJRiO6FxrpaSJ+rbj6tFXK6GXX6Zy/RizITFE6U3OCehZPuwu2?=
 =?us-ascii?Q?RkIGDLq5rIVZCwL+Chc3MuJcIB43DE2ICcC7+7kwvIDFm5dV1mxxB82JMMTR?=
 =?us-ascii?Q?jFl2gvh6jJXMq8eCwJjL2ivJ6L8F/iH770k8fKoufXFcrnFEmJWj5fPs5sGr?=
 =?us-ascii?Q?UvPPAoov1wHnMytgvgB2tN27QSBdBfvFGWq9/Npib+52kahfIejgINgoOTbH?=
 =?us-ascii?Q?hpFRAeeQyWDg4MdF2FxJITo07BfL7t6RahIQ6IunXIvAmBnecOoqnHK8OPh5?=
 =?us-ascii?Q?Q+ooboyv+CvfsiHzfA0fIPkbNr8CzNz95aP6Exayw1QA4m47qWdSA6StMqv/?=
 =?us-ascii?Q?6QcENdUTV8qYyk0orBbNd3GML912aF1rM9spElSwCpyAnnop3RVgUJWATJIN?=
 =?us-ascii?Q?0KHxmENRjAg2wyFfhITJ0KtpVIWhfrWGEhykAVuOKwwcNMbDqK9aeeOEHvhb?=
 =?us-ascii?Q?YA1AzPIug7s5aihm6aTjcl71d1KKXsB9DJO+WvwV36rSPlBcK2Bh6ljr4q9D?=
 =?us-ascii?Q?sTcqyBMI4GACIO+xkoA+3G5LS7Ok22SBJazQE+ll+w15fzyqwuwY+R0Ey9QC?=
 =?us-ascii?Q?U540wYPl7ChUFwnmmEOfW7fDIKzajafgCzE4hRxWc660hxuCbdpfzdlS6UGY?=
 =?us-ascii?Q?HJZcTCEXLJMwODRFoVy/5WIZP2GRV1REMQqzilyKg3Ffj2RNyrfMY0/dhNtB?=
 =?us-ascii?Q?7WQCrePw5bldunEMfA0rg9iYSZmonQRV0fZ0gbCXz2fAjDKi1yvRDeM+jydR?=
 =?us-ascii?Q?1QclAvSc6RRz/3Dc4POCGD8mC7MMMkhrL63u5c3n24S0Ghf+MQFIPT0UMvPM?=
 =?us-ascii?Q?mj/N1KmcFEohLmdgX9X1VwlCDJnVRGcjI6IVrLUXZl6v0NM5DbudPlkLRvUA?=
 =?us-ascii?Q?jRVkjeGcLPKnLkj0+Nf0QjdYGjhsLuFYJThDUhMh4c+EQYvw221X63dvvp7f?=
 =?us-ascii?Q?/Rvi3KreLAFXk1lNvYrlQGrY35xuEFr4PxRtJaqulNxe1g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(52116005)(366007)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VBR9iA6q4eqa7uHgGVUW3nLKLUIqz7+rn1yc8omY7TXTjsR82jSKdYeJSF1k?=
 =?us-ascii?Q?UVu0CDWbUu1tL1Z1s9RkPF522G0FIKzPJ6tlU0fy7mmvaB72M5OceuUYpr65?=
 =?us-ascii?Q?Sm76ps5FVYhT7usgq4DvArHH5VCrggoJKrFehgvsngqQ7n8AhUhs/ETncFnZ?=
 =?us-ascii?Q?St24UfdnJ2g/uOrXYss+cACzQNQ/ea6qnBhUT4QHSdfx5TVNBfOA+chX/QEh?=
 =?us-ascii?Q?du24gdwSTzmoNv+Df9adbiaZ991pCYI+BC0OnyZ90osOLmLIwGcGs+barziM?=
 =?us-ascii?Q?QDaYW79ZUArDYtK6TcePPDLIz4/Hbo8HX7Q8qpJxZfPBGGDiIHmihl4rvyW2?=
 =?us-ascii?Q?Sf2VkMYP2gDi8/q4HblSMIvEV+65p24s3qD6RcCpT4LbaRPXwD1ASagnneum?=
 =?us-ascii?Q?tqSD1j51amxQOhAM1oEIIuK/gjy76nOCKNdvzxDkEV+pKJWx8B8qZ7q0zsM7?=
 =?us-ascii?Q?ub2lb5/8+WJyin9OQE5z5guBfivnFpRpoBEc9NbMqoDMikzBABMUGggv5aYt?=
 =?us-ascii?Q?t9P9eUBHO+rUfj2QU1zXHbwilsqcTW1S+csjFwMcBIf2wM3WNhxM+myChG42?=
 =?us-ascii?Q?wjoUiScRHj6y1DRl4qGb/uRB5S4DdMdiRFXJpucDLQpNgj14WCSIyYjDk95K?=
 =?us-ascii?Q?jU/9qMkxLeYxCqS8qgiA4i4pJ/rc25MTtuVGE7kYXOvsi8bqHqNcEh6wg7yS?=
 =?us-ascii?Q?dRMf+Vup2umj0ySKj4b4ZF/OFH/9XOEOMPXzGkXfEatKJkQKk4EWyXdv8AxG?=
 =?us-ascii?Q?a7pX/+esOYqitS+zDQhAumPdxsG8ddBaoiPDbIZZQ5NXfQkay0P+jqdrJWYy?=
 =?us-ascii?Q?rteySy+3j+epdn48owUCVqtnq3Y5c53DchZwnTptg1suKrWtvWxgwkS90SUJ?=
 =?us-ascii?Q?QuGqp00UhQEtqOb5KfcvMAj6ndpf95/t6lmZRSHDsHu75Lh6LRJ8Y7MrKbCp?=
 =?us-ascii?Q?AHCE8j+a+V3EoPQMlH1wVghWTcbKPs1hU4Uhwe43dvi9PHuA+o6t1NcxH1Bz?=
 =?us-ascii?Q?f3162LEBkKo0i7VUTJqGs8CNco+Po5RKAoOuNUhcc3XQElzGnZRLBZk/aPYT?=
 =?us-ascii?Q?ZAbAfihferiRc2G9ZuNYUHlP8o4CPN99k0gQCfqCjesLTLbhNIoJebhT7nlW?=
 =?us-ascii?Q?0Crs30A8ibzkffgFcbsdaSB+rA7orAZkjd9LqqhccmxED6FD0YHq0kMhU2/i?=
 =?us-ascii?Q?dw8yZmLiHjhJSpBLwT2YhXFLJJ2vs7vLXzpjQDQ7yznpH8tDoc+UyCVXUf9q?=
 =?us-ascii?Q?hJgJoIfYWKCEqeIaqc7a3OCdqvqPGAMJn7OUIaWrgHibcvOBkYAz7g2TG3+m?=
 =?us-ascii?Q?lAV3mVm6ZE4A6+bMjfFXLXFwDTCBRSxc6m3BUNe+RDmWZJ7Gcds2jQURY8Bn?=
 =?us-ascii?Q?7m2UmP9MSc4D6x0A2gtg2f4g4QA8Pma2nc+z6qorG/nLEi4KItjaFeEGJkFL?=
 =?us-ascii?Q?+tFUyFe2Q9pSqrx/rA+7o0ry4tGYwF6ERawSZR0mBzr51hXKOTORhWoWdCCs?=
 =?us-ascii?Q?vDGsfwrRJET8n+n2kPfENVGevR5HVfmjhxMQwo4s4ANA0Jh1sR4hFNFDHPU8?=
 =?us-ascii?Q?fIF1s7vtCS+j7oVFLsCtdXuRfdBxpUcamYvlhP5eUyouUywVennQ0uRpCpJX?=
 =?us-ascii?Q?sLFfD0Vo5o/LMNuvtHZ5OP8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 58e36699-6fd9-4995-d42e-08dc7ed3c241
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 05:05:14.3101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 u7n+mGzRNKn4rCNYglDLcZ1mMVfnLh/PYUAH/Nr1xhoJni8s3PBUQo3o3POuzr+4nNCKjCjy4bVkTOdCpN44BMVyS7F4y7lYuf9hpSqo61feQeNN4wdjekjzYQb1cRSL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7090
Message-ID-Hash: K6TYCRUFNYOXYKVKFH54SX5X7ZSSAJSS
X-Message-ID-Hash: K6TYCRUFNYOXYKVKFH54SX5X7ZSSAJSS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K6TYCRUFNYOXYKVKFH54SX5X7ZSSAJSS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc-pcm.c :: soc_get_playback_capture() will indicate error
if both playback_only / capture_only were true.

Thus, graph_util_parse_link_direction() which setup playback_only /
capture_only don't need to check it.
And, its return value is not used on existing driver. Let's remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/simple_card_utils.h     | 2 +-
 sound/soc/generic/simple-card-utils.c | 7 +------
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index ad67957b7b48c..1a96e177158c8 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -195,7 +195,7 @@ int graph_util_is_ports0(struct device_node *port);
 int graph_util_parse_dai(struct device *dev, struct device_node *ep,
 			 struct snd_soc_dai_link_component *dlc, int *is_single_link);
 
-int graph_util_parse_link_direction(struct device_node *np,
+void graph_util_parse_link_direction(struct device_node *np,
 				    bool *is_playback_only, bool *is_capture_only);
 
 #ifdef DEBUG
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index b4876b4f259dd..17718c58793d2 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -1126,7 +1126,7 @@ int graph_util_parse_dai(struct device *dev, struct device_node *ep,
 }
 EXPORT_SYMBOL_GPL(graph_util_parse_dai);
 
-int graph_util_parse_link_direction(struct device_node *np,
+void graph_util_parse_link_direction(struct device_node *np,
 				    bool *playback_only, bool *capture_only)
 {
 	bool is_playback_only = false;
@@ -1135,13 +1135,8 @@ int graph_util_parse_link_direction(struct device_node *np,
 	is_playback_only = of_property_read_bool(np, "playback-only");
 	is_capture_only = of_property_read_bool(np, "capture-only");
 
-	if (is_playback_only && is_capture_only)
-		return -EINVAL;
-
 	*playback_only = is_playback_only;
 	*capture_only = is_capture_only;
-
-	return 0;
 }
 EXPORT_SYMBOL_GPL(graph_util_parse_link_direction);
 
-- 
2.43.0

