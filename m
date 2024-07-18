Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B06937135
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jul 2024 01:44:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C45E7EB6;
	Fri, 19 Jul 2024 01:43:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C45E7EB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721346244;
	bh=WL/gkx+Qm/CkOfljEM3l/NEpbmKFL+D9AMm8VgTqu3o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BOAcivdKcjQpaQHAcxvVdcxmScVPG3YCJMrFMkniu5fLO3ZCyimPZwGIIYoqI6LrY
	 K7O/YcCz6mXTeNufiLDmSwQ8/dzO8giHbJN/X2djrlNVfyXcJq31zSBaoA+5L/nix/
	 oIa5gNBV2TFVP/Gh1bQO1SpHVlMj3oO4TIDERXs8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 856B3F805FE; Fri, 19 Jul 2024 01:42:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 352E3F8060D;
	Fri, 19 Jul 2024 01:42:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0FDEF80508; Fri, 19 Jul 2024 01:36:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0D628F80518
	for <alsa-devel@alsa-project.org>; Fri, 19 Jul 2024 01:35:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D628F80518
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=g7b6KIR8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=erHZzfh07N4r3aBb+er33hFu4FwnilTt82Zxh90LkdklukarhsIDVzpB03qr+1La7uOuxq/8wUF7+n0e1hyZ7uC1qdgGcb1OkjRAsDUqPXz62DIlNUscpU1xe6KyI+4MG+otOz0pbznyq08nySA2bHbRjN9cXpaJ9QGjpXZUjqICAYKQArLHsZWwOIj2B23FDg5OkkOVW9cttHcmqhK1VfQhWkiOGL770vxjbuHKND8w81kqqRfXBojVedAJpmTljKJn2gC+yCmIaE/8yRaIM0EZ2b5Nb7CNrWhVegcz05U8r8fpsiiWy/Kpkr8KBGrppIxz/S3bbHob38Ehw1/8jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ntBprF3LwC5EHwsq6OhRzYcu8raU13qrLvWh9P40y3c=;
 b=UJwXgMkE9Klw5VJBEK7ocZtvsnaqS84+EzN0/KViUkeVNHKC2m2QgS4Q8pocDP3RijzY+RCAE3oyM5Lr7tOFtEIr3nXaw5CebxheRicvO/lePrN4VDECpXueZ3llI50yJgFLN+1S2cj3UFx9R0HjyKaL64Hb/fQsIPqxdcuGd9ZW/q3+6UFQqWKJfLWuny11xxiEFQ5A44g4XLwTrAHP9lUgupo4JMDAm8LTg/RciH7DDXxEiGKLgSZzf6pyRaoz19s7GedvkeZDqFkM4yRNpvCO0dp1QqyLjnzL/0su0DOXaMj2STrEOu6zaQ+ucd27vb85wDh4hSpkv5o4t2rcAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ntBprF3LwC5EHwsq6OhRzYcu8raU13qrLvWh9P40y3c=;
 b=g7b6KIR8DhxiX25PoqXkT2OlXKQO+0wQRkerOpEeGra3tKjXe2ZsetoVZ4KSjDLczgrfpDC+0E0ly5qQAiUkZdCK4CvLlyWKbOZJNiIrDSDLjNQ132TU3CghBEfr3A+iJWCPNTAaAqpeNGRxogMMli8D5KXPfwvF7vQOOiBMyEU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB12448.jpnprd01.prod.outlook.com
 (2603:1096:405:fa::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Thu, 18 Jul
 2024 23:35:35 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7784.017; Thu, 18 Jul 2024
 23:35:35 +0000
Message-ID: <87ttgml1dl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [RFC 04/xx] ASoC: tegra: use snd_[sub]stream_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87zfqel1g7.wl-kuninori.morimoto.gx@renesas.com>
References: <87zfqel1g7.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 Jul 2024 23:35:35 +0000
X-ClientProxiedBy: TYCP301CA0084.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB12448:EE_
X-MS-Office365-Filtering-Correlation-Id: c3ad0f91-1c69-40d3-7428-08dca782528d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Y6+H1z9+YaJmoXSY4+nrAs1HkwfeloySorO2FhAVUxMkYW6kKMBrOn/pZ+jY?=
 =?us-ascii?Q?72VGpGlTsC2GL83525Ms3uYUDvDzZE+cage+MisHLzPqh69y9yiGG8mC+rt+?=
 =?us-ascii?Q?dQodGwl2huW2srMA8CVnRir9RbYLhYlNWLsFlJq/efaynV95ltQ9hkMO+G4o?=
 =?us-ascii?Q?pE7WU9DPjoCG+iKSKxTGrMrQlwQJmFVk7O/l2MwzvKW1d4xc6aMr2VqvfFpp?=
 =?us-ascii?Q?vYoL1dPOM6TYqwltnHbyGDLsyA8hK2CRwE0pmBMRAMqGghTsb5eyyr1GeXKQ?=
 =?us-ascii?Q?aGdqgFGiP0clqpwB2c1Ap0Eu/oZmc5DeGMUWeLbqlCC9kVOy4jy01D7RiW7b?=
 =?us-ascii?Q?piAf5uiev4ncoWO5oYlMaVuMUdzsmpS6oSq6p5ppSFxXErUObCUDNJ8efWwC?=
 =?us-ascii?Q?xe6laQZJg78V/ykFEMhX7BU557DLNfFMGpx7tLYmUWlVuvZn692VC91P3xYU?=
 =?us-ascii?Q?a8HlAUkFa4QjsbG25X8VYOp9BggRfAlfcN+6Ggy8qyk6kZZ0NEPbSd2R0Gbc?=
 =?us-ascii?Q?5Na9GN/XV7W3pD8xE1aWccXvalimhUz2IBNyga2jI7X/Opvy0qTsl7x7UWyS?=
 =?us-ascii?Q?FAu1o6x1wH9ce0idlGEoJBSR687nI0+J0s5qGDeWAaH007y7aHNRIfhq/G37?=
 =?us-ascii?Q?j/thb/qMOA8I30zZC0tyiyRHfOECWbfUjLocXyHzQDp3jBXQkMsYr0HHiqrb?=
 =?us-ascii?Q?sa2cxgX9P7dWQTCd7nxX1L6wuayJVDXz1pnuEK7CEXdjslBhxeOt6uyslESO?=
 =?us-ascii?Q?4+MQzEWldbYYrz8n1GjcddET9davGNSPRAVVlZ1fuSvytJhphnZxiSpUQHi7?=
 =?us-ascii?Q?HoNUdWs+ruqyRQF3bL73BsTLwHyOzDr8G6aPTtnb1jNQ2npvF4dsGp7RZuEk?=
 =?us-ascii?Q?vFNiYcZXMYIpXmR2c6z4OVygA0QiiVzBPkV6s950AGZ+8Dmj1AhXanMvIwoc?=
 =?us-ascii?Q?RB6/u8hH+dVKUuJvwCPspXll/j+ZN6jb+2Xyh0fEH9u2X38s6Dzw8xlFE8oK?=
 =?us-ascii?Q?3wzrWb109fZtyxorJxcRPegdVjAMgkHZ08yFgpI2h8rrde0KBPAl082YKZhJ?=
 =?us-ascii?Q?PBukeNsnCAYA+B6olMrq0uBDlEoBkFzq1VWhEpE3khrxDKTFOO5bMobuh7Bx?=
 =?us-ascii?Q?LUC9+Y2RzaLBOjWblxGOFx6QwObrAoUJeT6ORt2Sg/tbZf29PViXZGY/uGV1?=
 =?us-ascii?Q?HhlICLPWVSH8qiQULfyc2vAXBIPbp0r3FAVqjxjaxlSu6ZOT4mYSXHABK0EK?=
 =?us-ascii?Q?c9c+0cKXxztj5lbwcViSGbDafBT0bgTFg578vXTZLtna4rKF1haYDM0PUEYA?=
 =?us-ascii?Q?Xm3SFSyWerzG6mD2beIJUq2GthvIB/kSh4vjVusJB4aG+nG3yawPduR2wg8N?=
 =?us-ascii?Q?yczfRmh00YovTi/y9imOx4xweeG+59lHUfQFRjD3YASlBfT7Mw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8fwr7iglm6e0Z7pe6boXtThv93VhLCojmgrZ+NEjh6gRuay1JHrCqlo+vYfa?=
 =?us-ascii?Q?w7kVLOdas7JOcmb3ZXW/7ZGsjRMIkUTKvwxRHQfhsrWLw5TlWpFyiDlXw5yK?=
 =?us-ascii?Q?FnBYAANbxZXKwMR0R3vceVMOsSqj8dBaK29HXFz2Y1PBbaXPsnw63IUuHXjh?=
 =?us-ascii?Q?D0B2z4Z22OSvjvPzUAyfl5qgytSu563EK/Tc26z2Xjh6dWtO50Q4dLOa6lhX?=
 =?us-ascii?Q?8MJShwD4Thg4S8QAo9M4oex8YpLfW340LoRglFJhgtyI4LS8fhI6UXxjM7mW?=
 =?us-ascii?Q?BzEyqS821E8Ru94a/lV+wzplz+2AyD5+VOr3aTwHNL4UfKhlC6gRymwUPDOT?=
 =?us-ascii?Q?baOAb9uGNZS7ViBerKAgCD9e3mpLN1w5PKHlOiEysXjTD0vheHmdSoXxNRdv?=
 =?us-ascii?Q?JsH+pp339bu/fxL7clITxC/lBcFY3HYBOshSOH4QOsRhB4OmhUrZm4XPKrVI?=
 =?us-ascii?Q?RuR+RZUTjoVeUI8feoI9cTvl86xFQhB9hJa3YgNYzhsLLBwNfVJQeP7a2rrR?=
 =?us-ascii?Q?0hNeHexEjA9AezXodwaCuw2DqLCYKIavn6lE/C/aPfK4UL5N2EpUKsSqkQjt?=
 =?us-ascii?Q?6BLsAIaTYyzsljeBO4D2TRosEsW2axCw1sl7x57OVKZV63hqy+uOd7mLKMW7?=
 =?us-ascii?Q?UXk5LxZsKLZhFw6CrT7DNctUjCEj0foR8QWdB6G/c8e8ahxV+HdDlhqyk66g?=
 =?us-ascii?Q?gh1JNQj15vk3ZE+g8uNd+oX2ATDEHlwZBHrvttefuKjrX1+Z4RzGzjBtdaqr?=
 =?us-ascii?Q?AD7N6NSUWWW76MsjUSaf2Ff6rb1i1kUoB/4zqUcUGULUuaietH1tNdycZ9o/?=
 =?us-ascii?Q?qZ7oZnrVYpF8F54bkICbMGgLA7C05Iqhk/i+teQkItLvyJ/NtP12f+80FBwR?=
 =?us-ascii?Q?/1WqLNpOlgNy5IF/zlw4HXbCkCsy2tBoVfyclAGcr/CgKg9V0bxWjbQd/j7E?=
 =?us-ascii?Q?Ae9+ENedO+916VTVPEQQyjzxOD1IZHWv6A7G/0tL36DEandCyO3xYd5/USe0?=
 =?us-ascii?Q?O0tvmaiOdY+QoMKzkO1d3+8oSGmSkiCR/nvXhFk++hVS6IherC8bjFGuT4uN?=
 =?us-ascii?Q?VhiCYLc93DSHR1a6aEgq1kSys+Ch0zV0rr/Ho7zKmB6ZYiZa6APUXiAlZZk5?=
 =?us-ascii?Q?8oM9WTYnjWnDlCOyZZoszyKKmmfeRlTjxGq3R+3hbv0rvxSUO5N8OLkDi5GJ?=
 =?us-ascii?Q?7RqEcdKzZquSDndxj4neUm498iHDgoA3/6YU21nCApTJogi7kaImo66KQM2p?=
 =?us-ascii?Q?+vboIG4c7Qx6Owbyw4ZORli1BQ0HPpChPrW2N4OZcgEMDJ+4vbiAM6PQ7m/c?=
 =?us-ascii?Q?ZeIMREmTShHjL901tLVanTg3mk0gtdus3SLHxR3VM43qoyqEr4cvouV8Lp9c?=
 =?us-ascii?Q?MXi8sB2b4K5i1IxDC6DH2/wx++W1qQSBgYLUMItx4tK1rUP+TTpk1+UXrsKq?=
 =?us-ascii?Q?nQXORwHGMX1sRDFFkrwbRBPFErew9BDvGBLENlYT87GgOV8S5kRFkfLwSTrP?=
 =?us-ascii?Q?QpXINZHATmX+9P0DMgSYNDUIvY2SR3wdga5gIIGatonAa0NsBpMzyff9v5yc?=
 =?us-ascii?Q?Uh2NWXlWWkfhph20xYLnO2aWf38Fyj9S7iO7vqZLg6fRjQbqyuiPLcZk0Vri?=
 =?us-ascii?Q?dK/8OlTFliodhpPDEiwWLac=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c3ad0f91-1c69-40d3-7428-08dca782528d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 23:35:35.3078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 GoHuZUP9No90Kyz1bQAxVk6VQItOxzqI5rp8ifzkQSJlN/sudQJwifkx7X3GqMaFZ60M4rJUzJ3Kpm/CfRJs9+ARTHRcArzujzH/xiWSLxJdgWKj9SbI9f1DA8zSfisI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12448
Message-ID-Hash: VDELMW4JRD7YYOMHGI2K56C6SFWBJWR2
X-Message-ID-Hash: VDELMW4JRD7YYOMHGI2K56C6SFWBJWR2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VDELMW4JRD7YYOMHGI2K56C6SFWBJWR2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We can use snd_[sub]stream_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/tegra/tegra20_ac97.c    | 4 ++--
 sound/soc/tegra/tegra20_i2s.c     | 4 ++--
 sound/soc/tegra/tegra210_admaif.c | 2 +-
 sound/soc/tegra/tegra210_i2s.c    | 4 ++--
 sound/soc/tegra/tegra30_i2s.c     | 6 +++---
 sound/soc/tegra/tegra_pcm.c       | 2 +-
 6 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c
index 8011afe93c96e..c688d86966228 100644
--- a/sound/soc/tegra/tegra20_ac97.c
+++ b/sound/soc/tegra/tegra20_ac97.c
@@ -182,7 +182,7 @@ static int tegra20_ac97_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 	case SNDRV_PCM_TRIGGER_RESUME:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_substream_is_playback(substream))
 			tegra20_ac97_start_playback(ac97);
 		else
 			tegra20_ac97_start_capture(ac97);
@@ -190,7 +190,7 @@ static int tegra20_ac97_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_substream_is_playback(substream))
 			tegra20_ac97_stop_playback(ac97);
 		else
 			tegra20_ac97_stop_capture(ac97);
diff --git a/sound/soc/tegra/tegra20_i2s.c b/sound/soc/tegra/tegra20_i2s.c
index f11618e8f13ee..55bbddcf46516 100644
--- a/sound/soc/tegra/tegra20_i2s.c
+++ b/sound/soc/tegra/tegra20_i2s.c
@@ -232,7 +232,7 @@ static int tegra20_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 	case SNDRV_PCM_TRIGGER_RESUME:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_substream_is_playback(substream))
 			tegra20_i2s_start_playback(i2s);
 		else
 			tegra20_i2s_start_capture(i2s);
@@ -240,7 +240,7 @@ static int tegra20_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_substream_is_playback(substream))
 			tegra20_i2s_stop_playback(i2s);
 		else
 			tegra20_i2s_stop_capture(i2s);
diff --git a/sound/soc/tegra/tegra210_admaif.c b/sound/soc/tegra/tegra210_admaif.c
index 9f9334e480490..0e6a2e1cbc2f3 100644
--- a/sound/soc/tegra/tegra210_admaif.c
+++ b/sound/soc/tegra/tegra210_admaif.c
@@ -299,7 +299,7 @@ static int tegra_admaif_hw_params(struct snd_pcm_substream *substream,
 	cif_conf.client_ch = channels;
 	cif_conf.audio_ch = channels;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_substream_is_playback(substream)) {
 		path = ADMAIF_TX_PATH;
 		reg = CH_TX_REG(TEGRA_ADMAIF_CH_ACIF_TX_CTRL, dai->id);
 	} else {
diff --git a/sound/soc/tegra/tegra210_i2s.c b/sound/soc/tegra/tegra210_i2s.c
index fe4fde844d861..886528d81e985 100644
--- a/sound/soc/tegra/tegra210_i2s.c
+++ b/sound/soc/tegra/tegra210_i2s.c
@@ -673,12 +673,12 @@ static int tegra210_i2s_hw_params(struct snd_pcm_substream *substream,
 	srate = params_rate(params);
 
 	/* For playback I2S RX-CIF and for capture TX-CIF is used */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_substream_is_playback(substream))
 		path = I2S_RX_PATH;
 	else
 		path = I2S_TX_PATH;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_substream_is_playback(substream)) {
 		unsigned int max_th;
 
 		/* FIFO threshold in terms of frames */
diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index a8ff51d12edb5..6b1e1468ec806 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -188,7 +188,7 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
 	cif_conf.truncate = 0;
 	cif_conf.mono_conv = 0;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_substream_is_playback(substream)) {
 		cif_conf.direction = TEGRA30_AUDIOCIF_DIRECTION_RX;
 		reg = TEGRA30_I2S_CIF_RX_CTRL;
 	} else {
@@ -244,7 +244,7 @@ static int tegra30_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 	case SNDRV_PCM_TRIGGER_RESUME:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_substream_is_playback(substream))
 			tegra30_i2s_start_playback(i2s);
 		else
 			tegra30_i2s_start_capture(i2s);
@@ -252,7 +252,7 @@ static int tegra30_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_substream_is_playback(substream))
 			tegra30_i2s_stop_playback(i2s);
 		else
 			tegra30_i2s_stop_capture(i2s);
diff --git a/sound/soc/tegra/tegra_pcm.c b/sound/soc/tegra/tegra_pcm.c
index 4bdbcd2635ef5..996c0c6797516 100644
--- a/sound/soc/tegra/tegra_pcm.c
+++ b/sound/soc/tegra/tegra_pcm.c
@@ -164,7 +164,7 @@ int tegra_pcm_hw_params(struct snd_soc_component *component,
 		return ret;
 	}
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_substream_is_playback(substream)) {
 		slave_config.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 		slave_config.dst_addr = dmap->addr;
 		slave_config.dst_maxburst = 8;
-- 
2.43.0

