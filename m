Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D9E76C1B5
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 02:55:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CA04210;
	Wed,  2 Aug 2023 02:55:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CA04210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690937756;
	bh=Es1PrXO2oMKX6cS27+q+y5ouvy4e3pWNB0WMJZeoG+s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uhefXzXFOmmbwSUBpt57+BWfQM6fNCNgfkC3sa0Tgwb+kXKMhQ+uzeA4powg3Uw5J
	 H0K7VVdxwY9BsA87XVbmFOtzCKYqadvi68NDaNF94ctupsUZPZb8ZpdoXdaMR4Lu05
	 ipnAUSLK+ZVxrUs0+8uQBCrtysak+yhmMYzCTIZI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E4ADF805C0; Wed,  2 Aug 2023 02:53:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A686F802BE;
	Wed,  2 Aug 2023 02:53:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94994F80563; Wed,  2 Aug 2023 02:53:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20708.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::708])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 929C8F8025A
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 02:53:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 929C8F8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=iS/AhaSi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lK0xGNofmEUP0xUP4qD1g9D9zCnb3lWMYj0SPIHzqr8DmPeNOZ+BIm5xTFaRipEpv5eCvP0+DgFSNbEf/oK/EFdnduwD6+Umsu76dUeaa+MXL0NPbEPL2+Pi5m/1g9sdCzA2+swWMWxq6ZrR/vCuJpYEPo5T0rD1u4CemTRT4jbFbKuCNvxWoNW1tYtPkxx/ym1uSsFsEHEG1iVyyUx7S0b4yR/P3qMZlNP4S7KI0gR5GgGW6Tgt1C9nLPNC+5Ta/P/fsbwyEalE0BFZIte/QnCNi1rE8UJgMStnt/HU1Kfq3lfz3cEATMn/0LyHHqW2oy8VFKHDxx9tLSeb841ZTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VbG4JGDDHnAW77KCbDHr77BpJznoPugD4d32FSmyEy4=;
 b=cUUi+BapCMMEnUDkxqIjyT9vL+ugEcF5ZhJplRKL3kvMrWSyxbYPR9xcdgAbMY9JW8jnB1/dTMNYqT2zPypn0I9gojUm3ffURF1jpP9TvdzA2Xys2sQVsOI0wLetVDVyY8lK7nIHJGumFAgd47/KEPTFDMOIyu0egQ0lFm/y5DsGzxmRN7P0zBdcBBJmjID3HQpIL1c3b5h5G6A9yVI5YFeERGZrY5MSoxDQXqMZRbDPLF9wef9ZyRa2zdJ0FHQWgsglxk2TLC4Ebluq+cLvOTmEMsb1S8GtOtXMLD9kgRkB5sqPAzvwIeoHylG54aOq/6q4vldqc3R4hImf2mtyuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VbG4JGDDHnAW77KCbDHr77BpJznoPugD4d32FSmyEy4=;
 b=iS/AhaSiEZmSyq/JVdfOTnzza88IDWa5kf5jyiGFOSOHAk5hRQNjDTRiqMWmpQcqqwBWdWfRrCYrZVIQwglJQJ4yHcYkUqFmflBk9FgXpmhWHRLqosZTkzcJl9Sywb06tdUFxJDLWQQMTWHU9pmfVHXDhkY/pVEX278ro6aGdXI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB12016.jpnprd01.prod.outlook.com (2603:1096:400:408::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 00:53:28 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 00:53:28 +0000
Message-ID: <87wmyetgc7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Chancel Liu <chancel.liu@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, alsa-devel@alsa-project.org
Subject: [PATCH 09/38] ASoC: fsl: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
References: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 2 Aug 2023 00:53:28 +0000
X-ClientProxiedBy: TYWP286CA0028.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::14) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB12016:EE_
X-MS-Office365-Filtering-Correlation-Id: 741da13b-8c6e-4a66-1227-08db92f2e2b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uEJ1P/DtoacbzUPQyguNkkQ3wklLk/PCyRGMnF71n/MWPMZc7wdlY62AMmlX/w7tqtie9dsQuy1nw10oTlmfzaeIx+qROP+zvf9XGIHEGUyGXFngKFF08JnGXe5BqcKFgx/T454tUIfkZrzJodQWs8gEHcFlT9qDuI+tZ0wLNUFIDrf5wFY1YWIqBw7DQnOII3amh48i1hgJdGNVH0FF9Zo1yZV8PodNowSuLA2b7I6FLIvPfOtZXrKCl2dEAdHxmFhafg5IoZjXu0xbmw5KRLDQ4fwjIpbIQt7Cf09lXvhRYzJ6/FWKNTBX7nBREeYsBKJalMNKaPSoGmuwpwBKCRE4ZBjLB2yJShbA9N75fWGWGC9pFGlQGm+Y6fltFbyBMtKBOCAgBBA/LGBqluuYokYPMQDUaz/c/OFolOvs+zZt8JvboRcJtAVDEkcVmGw0GZeCr1eVWJKKRmMjuaDxmeamEwrpswTRP55UQfgwzot9JGav/bMYbQp8+ffP9Ng4szRI2xd3S43iM0iC81J4O2YwZcFoJgfZlPWIALOOtcdM3W1OFJIDC3M9o+9Zd645eDh6jt6cVeZBuY4PIqRETfBkctJYXTfd1AarfwyzVl5lRoVKX+SHdyALK2GeaQqG
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(366004)(376002)(451199021)(186003)(8936002)(83380400001)(8676002)(26005)(41300700001)(30864003)(2906002)(5660300002)(7416002)(2616005)(86362001)(478600001)(54906003)(110136005)(38350700002)(38100700002)(316002)(6506007)(6486002)(52116002)(66946007)(66476007)(66556008)(4326008)(6512007)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/IzMwee0mV/9P6Z5kT3pPfx9HOxDrmmI8f+OqGgygMX1e63mb8yPrUWVozM3?=
 =?us-ascii?Q?81DsdKoffOgepSvTG2X+WG92WTf9fwoVpDJjp5jOROadSNeIT49qqPuI3lrU?=
 =?us-ascii?Q?SLUInT3qz0uJst1dsCJnY3T/nBXZYojyv1NaRyzL1scIAJTIa8fxnE6TrPYD?=
 =?us-ascii?Q?iyacx78CS/xUU/M12MDG/B52Sc+n6In11rigDNl8tpTFKl5s6Qhu8KWzUNu7?=
 =?us-ascii?Q?fdiRxuJZXhgmAUoJBgNPa5J+iXSGvVpY7Fttn2s8kSLjdrPtwAjvSJ4Hkq9M?=
 =?us-ascii?Q?fiHAkrSLHsvPVsvQpSeJ67RURLu+SyJLfBxOauaYxIpMMsE8Tq7mVM/MJJ19?=
 =?us-ascii?Q?tR5FNc8juSBzX6fpRmd4hr+OHmg9fNYyaxcMpdchEWxgKEfUwVBitB2/iB5a?=
 =?us-ascii?Q?4F6rAbUQLElbxyz4PD2TZ1bYtCTmZz1qD9iGsTx/g+DxZbbcgF5ecxZPU8mI?=
 =?us-ascii?Q?uJGM/rYCsfrrVk6t0q9lBme0enyDcvUZejQPS5vpcAWiIwsA2Q+X3KRbRPMA?=
 =?us-ascii?Q?/uDcRTuvN4UTJrJbF86+TJ1Ylt5gQJi15IgqP99KA3bx0YLCUzzw6C47d2u/?=
 =?us-ascii?Q?KygTF90x0FII18FPB2nkuuBd7rW85FD4og2XDKyhKZlrpBFR/60kx3FBzaCG?=
 =?us-ascii?Q?pK0bhTzbyqleCQdD/q9l9UaKiAXxjHuKqTtbijGaWGmGOdEz+vJkMheW2Kcu?=
 =?us-ascii?Q?PVp1fzI5c0WpIHx9KqAFyWviAxhYfvQ1gCkVRxqUmwvOQTJn+/nYaBNQkwRs?=
 =?us-ascii?Q?fC/Rch/WGXVyB0jGzkVDAOp8TTR1vSpQODC7U5hIswhdxx9dUSNAqhVbxnid?=
 =?us-ascii?Q?qX2DBCKY9paZTqzTOpjWwARf5LAxAWSElRi8aPRcMbPtrtcXla3uG0fg9kJu?=
 =?us-ascii?Q?PGtsK6iMArUcKGfvmPkCszPnvwoaMOdbGn55ZZ7+r6VNRIKoGLd8UGeL/V+l?=
 =?us-ascii?Q?ZJAzBlB/AHsD7sfAM9Uw5qo239LJ9ZAjWTk2LHrLZjhBAiCRzwErl4JdByaj?=
 =?us-ascii?Q?t4qmU1kS+dmDqVHDqcp168DZHbViQyo6oGP7ZqkWBpDhdAziz9X7FS7vz57d?=
 =?us-ascii?Q?Z3bc2BbA3VE0O2ATH2Fx1VL+mDQZvE1w0JNquXq6TVcBO6F0vnxMF1X33Tbw?=
 =?us-ascii?Q?nxl0jMSxyjQ/5td6zmPyx/6dgD4DVe+QHgnqFmmoGbaQ8/TSzH9Vcx3WxqOS?=
 =?us-ascii?Q?VBbqksYGI3X7vOMulWV6RsUQwNIs25yKOqQkl2YMwKMaA+/m8EqqM0P7O0rf?=
 =?us-ascii?Q?WvXJNygJ2+DxcV04QePHy+SZPgVkTq7dc6HfLB1IFe3PqXpyKVnDgA9rZ2wh?=
 =?us-ascii?Q?nB8qORiB4n0S5RDRdz6P5gruffkUbEECLqY0fFB2yAuypIAQgxwSh7S1n6jQ?=
 =?us-ascii?Q?gKJ+bLnL9RNqrrLCptk3PODSdw/LANetRmXgerJhE4eBdfUEW3UYMfuKfCgu?=
 =?us-ascii?Q?/BqyAsTxiOPjbL6PsU/0M9eMQMNf21OSLgvbESiH68+g+eylMLsx+XTyP7SZ?=
 =?us-ascii?Q?zZLODhG9xclMRuNGbymIv7VTfnQKmfadoML/a5/pLX5Uy+onmAHMR8dclVQR?=
 =?us-ascii?Q?BkoKvKEgB7kKjWqNqr+Jfpuru4sQfjkaUnhSXrUUmNl32+Uyjk716oZL+P83?=
 =?us-ascii?Q?jnJqRmERDg5kxDls0RfOjgQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 741da13b-8c6e-4a66-1227-08db92f2e2b1
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 00:53:28.7029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Ek5m3ANXsknsjArfWIlUjTpChOQYjcxj1pWm1akIYcMEk+FBQn3s87FdJmtkV7Q49wfNv/CL+eK774ftoPsi9wn1Ik4MUnCMD4xeKTzdDmN5YtylHwOMNN+IrDNXKPl9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB12016
Message-ID-Hash: UMKDGCANXOHX27PC3HC3WRJGFSL4XMUK
X-Message-ID-Hash: UMKDGCANXOHX27PC3HC3WRJGFSL4XMUK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UMKDGCANXOHX27PC3HC3WRJGFSL4XMUK/>
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
 sound/soc/fsl/fsl_asrc.c    | 16 ++++++++--------
 sound/soc/fsl/fsl_aud2htx.c | 10 +++++-----
 sound/soc/fsl/fsl_easrc.c   | 16 ++++++++--------
 sound/soc/fsl/fsl_esai.c    | 20 ++++++++++----------
 sound/soc/fsl/fsl_micfil.c  | 14 +++++++-------
 sound/soc/fsl/fsl_sai.c     | 24 ++++++++++++------------
 sound/soc/fsl/fsl_spdif.c   | 17 ++++++++---------
 sound/soc/fsl/fsl_ssi.c     |  3 +--
 sound/soc/fsl/fsl_xcvr.c    | 16 ++++++++--------
 9 files changed, 67 insertions(+), 69 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index adb8a59de2bd..b793263291dc 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -780,13 +780,6 @@ static int fsl_asrc_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 	return 0;
 }
 
-static const struct snd_soc_dai_ops fsl_asrc_dai_ops = {
-	.startup      = fsl_asrc_dai_startup,
-	.hw_params    = fsl_asrc_dai_hw_params,
-	.hw_free      = fsl_asrc_dai_hw_free,
-	.trigger      = fsl_asrc_dai_trigger,
-};
-
 static int fsl_asrc_dai_probe(struct snd_soc_dai *dai)
 {
 	struct fsl_asrc *asrc = snd_soc_dai_get_drvdata(dai);
@@ -797,12 +790,19 @@ static int fsl_asrc_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops fsl_asrc_dai_ops = {
+	.probe		= fsl_asrc_dai_probe,
+	.startup	= fsl_asrc_dai_startup,
+	.hw_params	= fsl_asrc_dai_hw_params,
+	.hw_free	= fsl_asrc_dai_hw_free,
+	.trigger	= fsl_asrc_dai_trigger,
+};
+
 #define FSL_ASRC_FORMATS	(SNDRV_PCM_FMTBIT_S24_LE | \
 				 SNDRV_PCM_FMTBIT_S16_LE | \
 				 SNDRV_PCM_FMTBIT_S24_3LE)
 
 static struct snd_soc_dai_driver fsl_asrc_dai = {
-	.probe = fsl_asrc_dai_probe,
 	.playback = {
 		.stream_name = "ASRC-Playback",
 		.channels_min = 1,
diff --git a/sound/soc/fsl/fsl_aud2htx.c b/sound/soc/fsl/fsl_aud2htx.c
index 46b0c5dcc4a5..fc56f6ade368 100644
--- a/sound/soc/fsl/fsl_aud2htx.c
+++ b/sound/soc/fsl/fsl_aud2htx.c
@@ -49,10 +49,6 @@ static int fsl_aud2htx_trigger(struct snd_pcm_substream *substream, int cmd,
 	return 0;
 }
 
-static const struct snd_soc_dai_ops fsl_aud2htx_dai_ops = {
-	.trigger	= fsl_aud2htx_trigger,
-};
-
 static int fsl_aud2htx_dai_probe(struct snd_soc_dai *cpu_dai)
 {
 	struct fsl_aud2htx *aud2htx = dev_get_drvdata(cpu_dai->dev);
@@ -84,8 +80,12 @@ static int fsl_aud2htx_dai_probe(struct snd_soc_dai *cpu_dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops fsl_aud2htx_dai_ops = {
+	.probe		= fsl_aud2htx_dai_probe,
+	.trigger	= fsl_aud2htx_trigger,
+};
+
 static struct snd_soc_dai_driver fsl_aud2htx_dai = {
-	.probe = fsl_aud2htx_dai_probe,
 	.playback = {
 		.stream_name = "CPU-Playback",
 		.channels_min = 1,
diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index 670cbdb361b6..ba62995c909a 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -1531,13 +1531,6 @@ static int fsl_easrc_hw_free(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static const struct snd_soc_dai_ops fsl_easrc_dai_ops = {
-	.startup = fsl_easrc_startup,
-	.trigger = fsl_easrc_trigger,
-	.hw_params = fsl_easrc_hw_params,
-	.hw_free = fsl_easrc_hw_free,
-};
-
 static int fsl_easrc_dai_probe(struct snd_soc_dai *cpu_dai)
 {
 	struct fsl_asrc *easrc = dev_get_drvdata(cpu_dai->dev);
@@ -1548,8 +1541,15 @@ static int fsl_easrc_dai_probe(struct snd_soc_dai *cpu_dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops fsl_easrc_dai_ops = {
+	.probe		= fsl_easrc_dai_probe,
+	.startup	= fsl_easrc_startup,
+	.trigger	= fsl_easrc_trigger,
+	.hw_params	= fsl_easrc_hw_params,
+	.hw_free	= fsl_easrc_hw_free,
+};
+
 static struct snd_soc_dai_driver fsl_easrc_dai = {
-	.probe = fsl_easrc_dai_probe,
 	.playback = {
 		.stream_name = "ASRC-Playback",
 		.channels_min = 1,
diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index 936f0cd4b06d..d0d8a01da9bd 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -785,15 +785,6 @@ static int fsl_esai_trigger(struct snd_pcm_substream *substream, int cmd,
 	return 0;
 }
 
-static const struct snd_soc_dai_ops fsl_esai_dai_ops = {
-	.startup = fsl_esai_startup,
-	.trigger = fsl_esai_trigger,
-	.hw_params = fsl_esai_hw_params,
-	.set_sysclk = fsl_esai_set_dai_sysclk,
-	.set_fmt = fsl_esai_set_dai_fmt,
-	.set_tdm_slot = fsl_esai_set_dai_tdm_slot,
-};
-
 static int fsl_esai_dai_probe(struct snd_soc_dai *dai)
 {
 	struct fsl_esai *esai_priv = snd_soc_dai_get_drvdata(dai);
@@ -804,8 +795,17 @@ static int fsl_esai_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops fsl_esai_dai_ops = {
+	.probe		= fsl_esai_dai_probe,
+	.startup	= fsl_esai_startup,
+	.trigger	= fsl_esai_trigger,
+	.hw_params	= fsl_esai_hw_params,
+	.set_sysclk	= fsl_esai_set_dai_sysclk,
+	.set_fmt	= fsl_esai_set_dai_fmt,
+	.set_tdm_slot	= fsl_esai_set_dai_tdm_slot,
+};
+
 static struct snd_soc_dai_driver fsl_esai_dai = {
-	.probe = fsl_esai_dai_probe,
 	.playback = {
 		.stream_name = "CPU-Playback",
 		.channels_min = 1,
diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index fe28b27e50d0..550bf4da36e5 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -717,12 +717,6 @@ static int fsl_micfil_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static const struct snd_soc_dai_ops fsl_micfil_dai_ops = {
-	.startup = fsl_micfil_startup,
-	.trigger = fsl_micfil_trigger,
-	.hw_params = fsl_micfil_hw_params,
-};
-
 static int fsl_micfil_dai_probe(struct snd_soc_dai *cpu_dai)
 {
 	struct fsl_micfil *micfil = dev_get_drvdata(cpu_dai->dev);
@@ -760,8 +754,14 @@ static int fsl_micfil_dai_probe(struct snd_soc_dai *cpu_dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops fsl_micfil_dai_ops = {
+	.probe		= fsl_micfil_dai_probe,
+	.startup	= fsl_micfil_startup,
+	.trigger	= fsl_micfil_trigger,
+	.hw_params	= fsl_micfil_hw_params,
+};
+
 static struct snd_soc_dai_driver fsl_micfil_dai = {
-	.probe = fsl_micfil_dai_probe,
 	.capture = {
 		.stream_name = "CPU-Capture",
 		.channels_min = 1,
diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index f7676d30c82f..1e4020fae05a 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -849,17 +849,6 @@ static int fsl_sai_startup(struct snd_pcm_substream *substream,
 	return ret;
 }
 
-static const struct snd_soc_dai_ops fsl_sai_pcm_dai_ops = {
-	.set_bclk_ratio	= fsl_sai_set_dai_bclk_ratio,
-	.set_sysclk	= fsl_sai_set_dai_sysclk,
-	.set_fmt	= fsl_sai_set_dai_fmt,
-	.set_tdm_slot	= fsl_sai_set_dai_tdm_slot,
-	.hw_params	= fsl_sai_hw_params,
-	.hw_free	= fsl_sai_hw_free,
-	.trigger	= fsl_sai_trigger,
-	.startup	= fsl_sai_startup,
-};
-
 static int fsl_sai_dai_probe(struct snd_soc_dai *cpu_dai)
 {
 	struct fsl_sai *sai = dev_get_drvdata(cpu_dai->dev);
@@ -885,6 +874,18 @@ static int fsl_sai_dai_probe(struct snd_soc_dai *cpu_dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops fsl_sai_pcm_dai_ops = {
+	.probe		= fsl_sai_dai_probe,
+	.set_bclk_ratio	= fsl_sai_set_dai_bclk_ratio,
+	.set_sysclk	= fsl_sai_set_dai_sysclk,
+	.set_fmt	= fsl_sai_set_dai_fmt,
+	.set_tdm_slot	= fsl_sai_set_dai_tdm_slot,
+	.hw_params	= fsl_sai_hw_params,
+	.hw_free	= fsl_sai_hw_free,
+	.trigger	= fsl_sai_trigger,
+	.startup	= fsl_sai_startup,
+};
+
 static int fsl_sai_dai_resume(struct snd_soc_component *component)
 {
 	struct fsl_sai *sai = snd_soc_component_get_drvdata(component);
@@ -903,7 +904,6 @@ static int fsl_sai_dai_resume(struct snd_soc_component *component)
 }
 
 static struct snd_soc_dai_driver fsl_sai_dai_template = {
-	.probe = fsl_sai_dai_probe,
 	.playback = {
 		.stream_name = "CPU-Playback",
 		.channels_min = 1,
diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index 95bb8b10494a..78d9dfbe6548 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -765,14 +765,6 @@ static int fsl_spdif_trigger(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static const struct snd_soc_dai_ops fsl_spdif_dai_ops = {
-	.startup = fsl_spdif_startup,
-	.hw_params = fsl_spdif_hw_params,
-	.trigger = fsl_spdif_trigger,
-	.shutdown = fsl_spdif_shutdown,
-};
-
-
 /*
  * FSL SPDIF IEC958 controller(mixer) functions
  *
@@ -1283,8 +1275,15 @@ static int fsl_spdif_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops fsl_spdif_dai_ops = {
+	.probe		= fsl_spdif_dai_probe,
+	.startup	= fsl_spdif_startup,
+	.hw_params	= fsl_spdif_hw_params,
+	.trigger	= fsl_spdif_trigger,
+	.shutdown	= fsl_spdif_shutdown,
+};
+
 static struct snd_soc_dai_driver fsl_spdif_dai = {
-	.probe = &fsl_spdif_dai_probe,
 	.playback = {
 		.stream_name = "CPU-Playback",
 		.channels_min = 2,
diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index 53ed3701b0b0..079ac04272b8 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -1152,6 +1152,7 @@ static int fsl_ssi_dai_probe(struct snd_soc_dai *dai)
 }
 
 static const struct snd_soc_dai_ops fsl_ssi_dai_ops = {
+	.probe = fsl_ssi_dai_probe,
 	.startup = fsl_ssi_startup,
 	.shutdown = fsl_ssi_shutdown,
 	.hw_params = fsl_ssi_hw_params,
@@ -1162,7 +1163,6 @@ static const struct snd_soc_dai_ops fsl_ssi_dai_ops = {
 };
 
 static struct snd_soc_dai_driver fsl_ssi_dai_template = {
-	.probe = fsl_ssi_dai_probe,
 	.playback = {
 		.stream_name = "CPU-Playback",
 		.channels_min = 1,
@@ -1187,7 +1187,6 @@ static const struct snd_soc_component_driver fsl_ssi_component = {
 
 static struct snd_soc_dai_driver fsl_ssi_ac97_dai = {
 	.symmetric_channels = 1,
-	.probe = fsl_ssi_dai_probe,
 	.playback = {
 		.stream_name = "CPU AC97 Playback",
 		.channels_min = 2,
diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index 318fe77683f5..fa0a15263c66 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -888,13 +888,6 @@ static struct snd_kcontrol_new fsl_xcvr_tx_ctls[] = {
 	},
 };
 
-static const struct snd_soc_dai_ops fsl_xcvr_dai_ops = {
-	.prepare = fsl_xcvr_prepare,
-	.startup = fsl_xcvr_startup,
-	.shutdown = fsl_xcvr_shutdown,
-	.trigger = fsl_xcvr_trigger,
-};
-
 static int fsl_xcvr_dai_probe(struct snd_soc_dai *dai)
 {
 	struct fsl_xcvr *xcvr = snd_soc_dai_get_drvdata(dai);
@@ -915,8 +908,15 @@ static int fsl_xcvr_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops fsl_xcvr_dai_ops = {
+	.probe		= fsl_xcvr_dai_probe,
+	.prepare	= fsl_xcvr_prepare,
+	.startup	= fsl_xcvr_startup,
+	.shutdown	= fsl_xcvr_shutdown,
+	.trigger	= fsl_xcvr_trigger,
+};
+
 static struct snd_soc_dai_driver fsl_xcvr_dai = {
-	.probe  = fsl_xcvr_dai_probe,
 	.ops = &fsl_xcvr_dai_ops,
 	.playback = {
 		.stream_name = "CPU-Playback",
-- 
2.25.1

