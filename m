Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81704774EBA
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 00:56:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8330C851;
	Wed,  9 Aug 2023 00:55:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8330C851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691535399;
	bh=i9xwK3z43h5dEes4w1l8PyxpQp11HCX/Wo6lsJQYnzI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KHwPFZCPSGkQwTPM7vBnbeTzFaGY9d751Z3SXnfIHQFnS1lSGFZzi1g9eD94V1ZKP
	 020+eTv0YLDwYZzfpy4JO+zh9JoeLl+EsUnDJKf1mUa/D50AaeDNEFWU6/5g9woSgR
	 xQglTd1+FHVpdjh4YVgefVEHRkdgOOxTA5jCVUkw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50317F8056F; Wed,  9 Aug 2023 00:55:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A6D15F80557;
	Wed,  9 Aug 2023 00:55:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4B41F80564; Wed,  9 Aug 2023 00:55:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2071c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::71c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 62B4EF80552
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 00:55:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62B4EF80552
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=a9Uq22hS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQ4s2M2e3eahjZZNu2ScT4u6PEJm0Ady8ptBsjJWkEXUfGiQh6PJS6qBMZeUu/NxWjSY5iVnrXQkgysXUI26vIeFFWe6v8QeT5WAl3yVm6TW80NL5pdS2lw5KUm0G7O0HTZRcx9F/o+g4ENAXPMsneTYx7QDi3ptZaqxO47NjhHUJp76uauryn8OctADXS3T/Mkdg0C5KdUx3T1YBjSZaeJMKBCfcARMibD/vHSEdsLHy5eS9ubYDeaUF3ZAFf3/pk6rEBW6ko+XXHHIb1w//OArCSlxO3I9Y8oW/9/9m2SBFXateMPBdi1OnPLnD5bqb5XAw4YuvnpOnXj+sazrHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RdkS+zllRPE8lnPiO4u2KTsg6XraR5NksAuD20oXy94=;
 b=fqXkKJIEnJE6J/6Kay8vRgzH1GBTr+WvbHbGbEeOnow9R96YvFGC9A5V8VwPyWXWZA9j6HdkJ9w7exAehmXDI3gca3DKzf12LEAUG1WHZpbZ/AeJhE6HOo2lLnLeO9Sh1ITXvlx+sUeqGKtVYrminppBGNnst/oNJNAltBvSo+xdnNOCWYiB8p2dFkXqQShxmFtMdr8GMdw7a1q6Ji0JWrLfohgR78F8lsthTHI3FqZx69+tXKDXgHUpB6BNB7XLFtiQYQB5dkK1gZ2TmkilHK1a0LtkFzQIox++TcaUMan4yxzXG1hTMheRWWJVsZxffRA5FnwFxmezPo6+Ia5b4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RdkS+zllRPE8lnPiO4u2KTsg6XraR5NksAuD20oXy94=;
 b=a9Uq22hS2MYG+AYyW+MF0LkAqeuEHo5l0mwmC5/Mtf8GafNd30KibFI1+fnd01JanMRty72bUJziEiF/ntnx6yp62ekHSIe/D/DLkq8JsTi+SlbkvzlWCdVpQN+2n1od2b2KaZsCVMCTQ9zJeuFIbjzYIgVlat2V4tpABiavYW8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11969.jpnprd01.prod.outlook.com (2603:1096:400:40b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Tue, 8 Aug
 2023 22:55:00 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6652.028; Tue, 8 Aug 2023
 22:55:00 +0000
Message-ID: <87ttt9b0vw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jarkko Nikula <jarkko.nikula@bitmer.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 02/39] ASoC: ti: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Aug 2023 22:54:59 +0000
X-ClientProxiedBy: TYCPR01CA0123.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::9) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11969:EE_
X-MS-Office365-Filtering-Correlation-Id: 130e7cf6-8cfa-4911-6998-08db98627e98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1pIeeLLMvv8YQ+EPHs52+iud5+K7kDcYv252w+abwQK+/0qE5OE/0DkmSb3SwNVTtzfGbwDGa280tZrPiQPl2IGW4s0sTxBxAaTRr6We3f1Jy2jMBu4J+AD+q/S81iP5naJCYf6dkmGCoLuVBV52koXh0ygZzljKnFP1Yzo1YR++sG6m6eQ3iNVKJsz7H3EgZDDTR9G9+iauofKu206TznnAxhCSfrDzyGEeNAoFzjk/3GGC5SDKQKla7mvChzKk0AdFw/KnU0+4dkaDs2emSwRKzL2i0wvF9bGr6MExIwjVO8ocFM3qBftXrH6Un3D7MQz4bauHFUHGOC3eVdC5bdxPK1P1WEFhqLptj0ULXunx+jSjanVL+UEFexUMxEJ6nkAGBwS8zdwdhPWiJqw20+nff8jrPEkT0SZ/OedyTD/+ayfb46taXi0BDIEHcd8vYPaOD6T1qtilOjRZRKZaTEtFJG88VMg/IBUhF6/X5hxMBhLLH81N4bOU27SzoMfR18VP3bQFgNWOW4kudRGtmxAgF9DnuqshyVcT7oLQhCTVte8pywFpiefH0A126+UHsQFJnSujN3ZtfdUP4L7BIziFr3+T+xFmOJK3i6awvGl4FMJ/nyGV3pVqS8NTWw+y
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199021)(186006)(1800799006)(2906002)(83380400001)(316002)(2616005)(41300700001)(86362001)(5660300002)(26005)(6506007)(8936002)(8676002)(110136005)(6512007)(52116002)(6486002)(66946007)(66476007)(66556008)(38100700002)(36756003)(38350700002)(478600001)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wM24+jGnupT0lfdkD7ljk/DZl/cc+WJh+QMLhLMprvpb+sHtcxJnKqrfuJeI?=
 =?us-ascii?Q?gykaBegBGiFV5TEkd2qZlJHqaHrNqrbpGKynI6aknK1byWSApR4nuXetTkE4?=
 =?us-ascii?Q?DbTmjmpw/nBpIk2FhbcFWwcJK0KFZILFvBZbELshu+BO2bZk+kF2ChmZIXv8?=
 =?us-ascii?Q?wb3YMdR+TDawy2Yl7PmAiyqctZMNlfkGZSQ95Yop4zS0bX/q5CbHagFgvr+o?=
 =?us-ascii?Q?kwO4c7H3NZe6q9bAs8/fhilx0KTHgl1S8Yqndv9gyK4t+MmhYz3mhJzDRrvV?=
 =?us-ascii?Q?KBCbbg4A/h/DIGNir0WiNqM8U715u1pudd6TCfz6eL2yFH2cnlSjsPwF9HfH?=
 =?us-ascii?Q?c5JqpWZLpuD6iPpeHovfXyDWbxafCWBou06X1fwwNXdQ8K0NfZ6YHPXtkI9q?=
 =?us-ascii?Q?f4yE4W20E7cAdLNU6f9msCGkKqMeyX9PcYFe3Jhic1+YYe0vfyDjaOKtmvju?=
 =?us-ascii?Q?J1bdNhE+MEXVsgjawFOheAfFhVGglj/B6It3JrN7L629xJqstrrhIMpASVvT?=
 =?us-ascii?Q?W/a54jug0kW7CIfZGPqpjbxX15GMA3yVHmltOa5Jxdm8/W80iV7l3TeYghZB?=
 =?us-ascii?Q?HViUAXjBZ5pjMvRGOaWq349GIuTxqzhshMUW8KpSacyGw01GNthq9gda9FSh?=
 =?us-ascii?Q?gp8d1zUtolobvfBc0zyKpVe8/z0akwY3sqJCKnczZ1rR9unCzF/I7XWdQKxl?=
 =?us-ascii?Q?Y9KZQFN/00YzNuXW/herUlXm7nVanQQC/yHA1kWvHxRJrz+aP/QtwGrKJ2an?=
 =?us-ascii?Q?D5Ub7hXkfsNPPcgUpiJSpYci9P0DWSCz0lUYDTQyMJxwrDWKCUNRpD6a8qOn?=
 =?us-ascii?Q?YeHTCpb+IEEuDptWVIEoOBQshqGOIYOsPZzl9E1+l2a33qUjRTGKrCiKjlma?=
 =?us-ascii?Q?UoSWlHvjmOVMMngwlBpQ16/RkZb69ZSJmqFvQYl9iUaAz52MgSxvWtgKA3qG?=
 =?us-ascii?Q?K9VTUXTb+5tjtf9RHOH+0W3gDQJ5mufLLWgwVQRgi2QkMRUGHkVM1fqmgN7c?=
 =?us-ascii?Q?Ck+Rbn2jHgr6qgZflHIDmqNaoVojoudq890vpgK16BPA4qumSiLM5Sfflm2Y?=
 =?us-ascii?Q?T7LLp27CfFK6Z1l0PRjqCj7W4sdBjaEoMSgBdle22qW4RuRnbtNYBxK2c+r2?=
 =?us-ascii?Q?XxkVhc/VvplcydBte8s9Ct7d1+Wirs5o90x3cHYvuPyY7k5WvwcXAbXY73Yh?=
 =?us-ascii?Q?ykjM4WZeTP4s48UID0QZEybuXNMYIMnZsb33c2PUX1Wv9A9bHJGP/AJfmyB6?=
 =?us-ascii?Q?PFvP7rAaUX9L1WNmm8L3ostuLb3+sgUY+tKZi1hRQC+Vdwr5UApj99/4Gdm4?=
 =?us-ascii?Q?r1kimEOG9OuN4xV6wuUH3ePeWw2Z8Sy9Y4t9t4y1NuH1YE6S0l8uk4h4Ff2M?=
 =?us-ascii?Q?9Z045phSO3T4uWD2CEKkd0jjDmTrL1Oa0jxfzsKsEdroyltslyHZS6pErcPx?=
 =?us-ascii?Q?phoQVJsMk7kUWCVEPUm+LJBNBbkJNbtL68oY32E/V/8Q8x9bZPxv7NgoM6Xb?=
 =?us-ascii?Q?2r3+hzdsfRe+Fk9NMifdpoCVtDvs/NrRtlJBkGovOvjs7CPxtpbctpRyb/aZ?=
 =?us-ascii?Q?Xa/AWPRK+2u8vVTA26HmOxPfQUL6qLEtXtugTDpNy+3tNVOM2MUFRndPE94i?=
 =?us-ascii?Q?YdyeTOxJNoDXBt1HnFBMWpI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 130e7cf6-8cfa-4911-6998-08db98627e98
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 22:55:00.2202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 6wq5Rwhn0xOdvrp1jIQoKp0/krDhP42km4iq9vtpwjXp0Kvd/N23bG9JwydUOf8OkGV24bBgmsxbbGI2DPr0RmaUfNLGOJiQ3auBUeyCeCgGVv4JYNfWiGVDR22lafH5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11969
Message-ID-Hash: XGD5VL4IX3UALOQTUC5TLOPSIEQ3MSZ2
X-Message-ID-Hash: XGD5VL4IX3UALOQTUC5TLOPSIEQ3MSZ2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XGD5VL4IX3UALOQTUC5TLOPSIEQ3MSZ2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA SoC merges DAI call backs into .ops.
This patch merge these into one.

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

