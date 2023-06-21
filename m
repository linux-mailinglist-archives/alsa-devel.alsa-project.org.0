Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66310737907
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 04:21:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDFFBAE8;
	Wed, 21 Jun 2023 04:20:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDFFBAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687314060;
	bh=MJGAv139ulQqQxgUaEzSxXWGbFrBD4dYquHuP8e6MTE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aamPUDq7ryKwBcMoR4BszirxhUEFPWEahX9utWgLTnNXbKOJsg8JwoVdfEdFpX7jB
	 JOBy9UvlH1Vqz8Q9avHJM95sHmG2j8pCYMeX0Gxo6MlsNNOquSDgSdsM/lS7RMEJnQ
	 /Je3Cbl93lL2E2JmhKnpaJ1UukAcLMnPoySXXF20=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58880F805AC; Wed, 21 Jun 2023 04:19:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E610FF805AA;
	Wed, 21 Jun 2023 04:19:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24547F805AB; Wed, 21 Jun 2023 04:19:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20723.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::723])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AEF17F8051E
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 04:19:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEF17F8051E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=bHeoeGjz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kDRfo4ghFhpUbnyp7VDd/ppHXSqJPioSgDfUwKfpECeylfhQY6loHjcvCy/IBxz5FF2d5AAGoZKnebJ05UBjWu+eOx7UceOkUgDebRi8SBl4D5jo9hXA6UIk7fB6fSbGQJnUBc0JxEd25toHVaEGD5JZJiGk6nu4g+qSZesYLEPSpg3Qlv6JKRjXDrRak+D3v35A8ulPHnGs4lJs7R3gvxe8dU59ORiTHaTTS/y6K6BYVtHqBisLqZtHSOkhT4V4vZMV2sDBcF7uk0wMHJan7NTymSfhbKIaWUA7zgYfTRgHVJjxUPJCiqT25nxucIg69RY1sPisPnGRYxUYRukZVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jo4iX3AAHmHVSR5ZgQHLYW/stIWxa0zDuhdeQKN385g=;
 b=FxX77nYAKjb8dsnplfR1PPV/iOAwn1IbpdQwqGWfCaDPwjj72LKQlQPr7xLav/cU5g8G9VOQ150T4y7zajmKQw0OOMQ+3ryu1b3/lSgBI+ow0KhqWFD3Ptcewbj7I7SZVEQA7CiOHWDKbau1eidOQibzsVf3pxrVWGDoSKhXM+OOCcGR97JKITT6F1kuJtUXKLPaDdkl5d3/HxWVSnbqx+E2AZOeWqmVQVLUEBjiH6GihZyTs6KWEFWPRrGav9Rztffiu+0Ifg6/KU3gYTX7f99cgPU0TmmbCrl5sYk/FpWltSlPBh9siJpiiutO80T2FiRHDf7Lt6ExrX6OLlNVyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jo4iX3AAHmHVSR5ZgQHLYW/stIWxa0zDuhdeQKN385g=;
 b=bHeoeGjzEIclIZv03vmGyNR3Wnt9m/nXQql616mvcIWmPBlFMcRskWvYBRxEw7yX7lh4SUXD/3XnBaAfDvYVd23IQrNJ3th5xUvYiZbSwwaHqCxG8EQvWnFzwX320PjGy/7jtbXTSdHPQfYvnwYhRbBz0wheZ5NRwcEMVNa55sA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8528.jpnprd01.prod.outlook.com (2603:1096:400:13f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Wed, 21 Jun
 2023 02:18:54 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26%6]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 02:18:53 +0000
Message-ID: <87ilbhblrm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 06/14] ASoC: soc-core.c: add snd_soc_dlc_use_cpu_as_platform()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87r0q5blta.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0q5blta.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 21 Jun 2023 02:18:53 +0000
X-ClientProxiedBy: TYCP286CA0076.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8528:EE_
X-MS-Office365-Filtering-Correlation-Id: f6821375-89a0-49d0-2520-08db71fddc20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RMlcajSqWcrQKHuwu02MO2u4yXvZ7pmHaRl8CMkaV4vpWK8IxJI1A5phpwAFRB89SfroE/oMX/By7uUSSBFzq5qNp7J3oTO/VHisxNdNfw2XAqa/AODxZVhLEalpgMFPcGiLsmOstgC+NaFO3Augm+UMmc5y/n7me/uYrHliwVEsebakB4YRc1grEI52EA1EU2b/fS3p8/peglzF/MtqT2NDW45WRoGb4CX0cbqgkMxFN6a05oTZFCrYmT5YV1ZrnceDWFcLn8A2JrIcqmeoA80rpO8lmgfv9FqAeRdcLzY+o+s3FUH/Rhg5p/pXpD+P4WgwG/Bh6i4W0Nvwq59kn/5vSiM5ECWADrp0mFHRP61iMdyUOOx5OZGHzLQPq5RmXI5SWvPmzNvzHW1nJ9j5D4vUIp9Yueb41R28JDsKRDqg+6gcm+gqRutyhTajhepzZ74wbrDfkX7Q/B/f5Lm1RU73wI+g69u5cXm3gnkb/4rkHKEY1ZyVBhz5Rz4TEL2Sv9Vtav/UVYcuoQ2X63rV9EExdnA2JpAJ0GpPtWYzpPumq/2tY+tpfQCeS95cb6Us9MtApD+T705glg5gOe/D1oranMRIU6+6qngeMaLqQTYWBkwUzvAAh84GPOsXqLoe
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(366004)(346002)(376002)(451199021)(86362001)(66556008)(66476007)(6916009)(6486002)(66946007)(4326008)(186003)(5660300002)(2906002)(6512007)(36756003)(83380400001)(26005)(2616005)(316002)(38350700002)(38100700002)(41300700001)(6506007)(52116002)(8676002)(478600001)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OhpMFDfwyZDQ0/976ZyxTUAHbv7KiB/f5eSBvB6Sy8ZpNvHelmfndQdEX1ky?=
 =?us-ascii?Q?HAkLtMHg2TiLCK93Wwfx4GPBWAw4W5ftg9fwhxZQ+md6YsNODfVs6z0u2RPD?=
 =?us-ascii?Q?tZmTsUct3lyN9G8r7AMDziCCEtjbB2jDHmVaqQjtF4mjgXe7g5Cv3jHPYuIQ?=
 =?us-ascii?Q?1EqN/nKoPkB0ZTuLJzMN8E292q+N/Kf73TgZhEi5tUeAqAIGYY/ZGdvfcQlW?=
 =?us-ascii?Q?IWCFCUV8pq3f3F9PGsWUoL5A8DV9tS6Z0A84o2hxjkaUZzC0/ZWR+MKfuUSP?=
 =?us-ascii?Q?AlAJ3PXSaWMfFp81+eiHgnYwlnRQkSPFGTEQvdZNuO5eN+UVRPWluBZ3T/Ui?=
 =?us-ascii?Q?0CZb3AVQUY0TpaPkzbQ04G1FM+JTBZ70gFF98/mnz2LwVKubdntpYa8+ARQj?=
 =?us-ascii?Q?FqDU+A3YbCmjHHcyU0UJi6DwQl4N1duTQR/HNwKYNQOohk/Ui7IryNigt8q9?=
 =?us-ascii?Q?/+yyLazF6vCngpHuKs4f3Al7OiVcC72Hgp3T+OV96VcB0yO8BnPH8Xx0+2k1?=
 =?us-ascii?Q?AwgUJYIQOTl00U35EcJfG5IbL1NkcH8wI2fXk1brltsf7IN8SPzOFs8S9mtH?=
 =?us-ascii?Q?qEO18p1HvR5nl4fAbqxUslmo0Bjg+azKCXszLlcg+c5QYq6sVS8lZdfK5oV+?=
 =?us-ascii?Q?w1vxLQmzT24u9JVj1gYadv+OIbq+KS1BhkZdYBZFnm3Ep//gmdj/9RNUBaRp?=
 =?us-ascii?Q?MGPxGpN5JDIlg8R+ARQolJhw0nGiZShyRU38GLtVNsv3jHXazdsBITLHFsy+?=
 =?us-ascii?Q?NvVxKJdP0ZWCjUHCl6vY3hpkW9DpXBJkjNdOZzERpXNQQEh6hn/hqZIT2Pnb?=
 =?us-ascii?Q?q905NejnFNHrYt2wcILAkio65wseoAw6uNVK3Crg7hFxY2LOPMma7yWhJLt9?=
 =?us-ascii?Q?dzkEpT6BNPUgF30Lks0qKBeeQK7pvDqC3hmVdtbWT6vmVsY3UE2qIeWCmC4k?=
 =?us-ascii?Q?LMZNpKNpah4COIz7az2y6UpnQI90gjnLtGn5L4r2FtZZFJP7A0ASY6dgDVVi?=
 =?us-ascii?Q?pG3aG8ISrQKQ8xTV20eWGrM2uttCHlTlaPwxKirSxlPTuJ0nZMR/aOm8ReL8?=
 =?us-ascii?Q?XcuXZHoAwEcWzhROecFUhjwazMsFummIyx80y2R3AkvtOEwd/5xODHmiAkwv?=
 =?us-ascii?Q?m+q4A4OUB1ur57Hyp6jlPvas+qpeGZoYefS0G7v7UG0jdDYq1nCc+6TtEbaG?=
 =?us-ascii?Q?X2Ygnevo1DGP4OG9ohNO3gruJRwrwZUBkVsUGwuYZXCnplfGxyRSiRI3zk/w?=
 =?us-ascii?Q?BKSzx4YibSE8QJVng9AmP6Nh6yw9UzIpIhWpJrx4BfVYDXLHmwwFppZOWIu0?=
 =?us-ascii?Q?4wrfTgoA9mEOqgDeq3zty/rfd4gpJYUPFYMRNPsNjHwi0IZEmVBiGNCAs4M0?=
 =?us-ascii?Q?R3iXu9SCFWcjkif3oi43KSPf2ZnMjdZDGt6G6NYiTR3EL3CKw4//8+4hsF9Q?=
 =?us-ascii?Q?+EVS528G+phsrN6bKMcihdtx8eqe+PHaZMZSdNClto2OoVA2Ea7GKNTjPlfw?=
 =?us-ascii?Q?4HjublTW5Cdc56lJVtbuwT2QuoeGaNnEq5U0vDIn6P961bpgVahvFa60JWQe?=
 =?us-ascii?Q?yAOXEQSjpOp0qDrkgcPl40XBl9sj4/npeB8JrX6sftykshCnwp+HdrVpfErW?=
 =?us-ascii?Q?oIKo0acqIxpZGnR/cFyRttI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f6821375-89a0-49d0-2520-08db71fddc20
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 02:18:53.8083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 mdF8N8+gBUxft30gxYMFPBzdeiZgsT9tDXIYbTTF/cWA4HrMGGW/ey81VpMMPakxdhkZkL+jrziCjhNLctSZdKaSARAUE520qnTGYU+z3ilZ1ANsBvlG6nF+MAWJiAFR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8528
Message-ID-Hash: AG6UJANQLHA7AC6RA53TLH4SK4GOXRXK
X-Message-ID-Hash: AG6UJANQLHA7AC6RA53TLH4SK4GOXRXK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AG6UJANQLHA7AC6RA53TLH4SK4GOXRXK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current snd_soc_is_matching_component() checks "of_node" or "dai_args".
Thus coping "of_node" only is not enough to use CPU as Platform.
This patch adds snd_soc_dlc_use_cpu_as_platform() and help it.

This is helper function for multi Component support.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h                   | 2 ++
 sound/soc/generic/simple-card-utils.c | 2 +-
 sound/soc/soc-core.c                  | 8 ++++++++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 1b3c58fe14c4..94fca10f01ad 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1336,6 +1336,8 @@ int snd_soc_add_pcm_runtimes(struct snd_soc_card *card,
 void snd_soc_remove_pcm_runtime(struct snd_soc_card *card,
 				struct snd_soc_pcm_runtime *rtd);
 
+void snd_soc_dlc_use_cpu_as_platform(struct snd_soc_dai_link_component *platforms,
+				     struct snd_soc_dai_link_component *cpus);
 struct snd_soc_dai *snd_soc_get_dai_via_args(struct of_phandle_args *dai_args);
 struct snd_soc_dai *snd_soc_register_dai(struct snd_soc_component *component,
 					 struct snd_soc_dai_driver *dai_drv,
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 3019626b0592..c142571992a1 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -649,7 +649,7 @@ void asoc_simple_canonicalize_platform(struct snd_soc_dai_link_component *platfo
 	 *	simple-card.c :: simple_count_noml()
 	 */
 	if (!platforms->of_node)
-		platforms->of_node = cpus->of_node;
+		snd_soc_dlc_use_cpu_as_platform(platforms, cpus);
 }
 EXPORT_SYMBOL_GPL(asoc_simple_canonicalize_platform);
 
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index f22a09f74ee7..6e61f500cc2a 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -3003,6 +3003,14 @@ int snd_soc_of_parse_tdm_slot(struct device_node *np,
 }
 EXPORT_SYMBOL_GPL(snd_soc_of_parse_tdm_slot);
 
+void snd_soc_dlc_use_cpu_as_platform(struct snd_soc_dai_link_component *platforms,
+				     struct snd_soc_dai_link_component *cpus)
+{
+	platforms->of_node	= cpus->of_node;
+	platforms->dai_args	= cpus->dai_args;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dlc_use_cpu_as_platform);
+
 void snd_soc_of_parse_node_prefix(struct device_node *np,
 				  struct snd_soc_codec_conf *codec_conf,
 				  struct device_node *of_node,
-- 
2.25.1

