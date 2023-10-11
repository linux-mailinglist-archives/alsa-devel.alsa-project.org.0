Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9530D7C49A2
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Oct 2023 08:10:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C066BEBD;
	Wed, 11 Oct 2023 08:10:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C066BEBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697004655;
	bh=2n+2a4zkJQdWPSHVloKnRNIMDu1ywgdxHuNiEX5QAjA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jYdfAWdyCyD2XdeMbE3jfHv39cGnMVYGcqU2hKXRyZiCxlh4MmnlSlBTh1S3GOofM
	 2gE3V4gIpeDYWs6UlLdptd8HxCVoYxOfIZ2hLQvkAvNFpc5fXMR30I8NWEiNbVx0OR
	 UpmXwYiqQtZGfUCPAQ087TzZpAe8/lQ01V0f+kUE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43491F802E8; Wed, 11 Oct 2023 08:09:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BB07F802BE;
	Wed, 11 Oct 2023 08:09:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4CC4F80310; Wed, 11 Oct 2023 08:03:36 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 10D09F802BE
	for <alsa-devel@alsa-project.org>; Wed, 11 Oct 2023 08:02:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10D09F802BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=BwR8HwPJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ASS8spJBzuuc2h4vwBWwUMavZmRxHpuKlkZ2cIyP1m4hrHlCdXcx8SVGn5cwGMRU+1IM1RWK8T4hJJSxWSRlSMLwyG9h8uGQ1cPkIeCBaDip/rhLHuN3vnbiS2VcghX8OGsDaXdq9mPjntMjPnHe5Rimr+/3aWseqYqYtRCN0jopR4n7Jini6zUW8LG9kUll0X6wU9S26NYneLmkIuMn33fRp0DPJeUx5nH69HQ+Nbuha+7ZwydgrnEBGeta3Vc4l2ckekfLdIOjiZbkLqjn10cYorR1W06BaRsGlDuFtO8XJTmcbQiayj1uW8INuF1tjcdyiEbHGZjuEMYnzrM97g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VGJwPdePh9FJsBzfLV9i5VeRs4aObFkEsVIaOs5TnyQ=;
 b=nIo9Nbs9V4HV+NXQg8OJlIEMx9+ms48RGl+TDWOUX6uV66hhq2MXzmsz8UMJDhfAMdpwUmqUaK3FFYmXISzKLZPpKQwGyBKI4avOFX7siAsxfGLSKCz99XrBfKzw13gW9foz4H5nTjq/xvaYX7tA2hcrni4gRrLFzLbet8bu/T2AvzM68akrskaICvk391cRNWr2+eK+twOoVg56HXWam8W3dNyEGiAaxHOhNiLQkFndxwz+/P74urcxfBV4q8X2utHhDHAZJY1JGGNzMO64Cih/G37O0Xc68JZIO3KEyBTX+zOiCTyHoITm41hPHwxKBKeHUvE6uEBdWKVxLbccYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VGJwPdePh9FJsBzfLV9i5VeRs4aObFkEsVIaOs5TnyQ=;
 b=BwR8HwPJExOTJ+Q10bZokvpZQpwkZEft3gNrc3ApeNunnkOidlcQxfi2OXHp5Ek2bQc1DOF30IPV/rt4qEZwgBHjQKS9Ph0ddyR4gHhlYrqeDvTeYdSjqMlclh8waxpBEWy+aQIFmQobVHX8BTn/+v/PpHPMKUUIK3/8j3tgFWs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11514.jpnprd01.prod.outlook.com (2603:1096:400:377::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.40; Wed, 11 Oct
 2023 06:02:49 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6863.040; Wed, 11 Oct 2023
 06:02:49 +0000
Message-ID: <87jzrt1yt4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 2/4] ASoC: audio-graph-card2: add CPU:Codec = N:M support
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 bard.liao@intel.com
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87mswp1ytu.wl-kuninori.morimoto.gx@renesas.com>
References: <87mswp1ytu.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 11 Oct 2023 06:02:48 +0000
X-ClientProxiedBy: TYAPR01CA0187.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::31) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11514:EE_
X-MS-Office365-Filtering-Correlation-Id: e00fc271-0e04-4b82-d64c-08dbca1fb24d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MG1Fh84r7BM1EcO61ra8PXS5rtv+2GNTflY9rENr+H+CqcRb2q5ZoDVoYiUqBpz85qIOTNEV1h8ENvkN/qGh1sKrC5YV8IlVfBZ1SWrRfkBep1RSz6EGHVwdbaBNRZlYgSVm3XYsKjWUrPAHicBDK7W1MI+MYvfR8djdOuj3ErgSggQSrtKsoaHqW4RHHD+i2EMtFb5S0FFuAQrAW5w4sB/QvCdlPqbnjWkJWXqVLCnvOIdWXdqbsn+4KldRaXjBlQg5PszYzJBPxiqoPjW+Dke/yDyW3JQuBlIW1CC4P8eN5SZ3ZG6xHXNop0LARrxQUNjEAsLFDGVE706+wTB3rDpGqbmx194N0zDoc8aCd7uzRptFBiXYkCH0sabh10K+HifcKBfJFS4lcD78Tv9VpjO8ylSiMY6MLnWcljivrbBIRxpK2N/ADyEk1k8ZJZu3V5NiovwtUHuJ6OATqYAseFRcJ0Qrl8MTt61Ageal1vve8AJAKZarbH7XhdCRz/BEDU3kU6fV0J/xQi21ji8vfSBDKaQskoS4CmS5RbKbp1+Fe7/KmpPvAc/+HgY8DYOFx1g1iSSwgiGiGdRCBNzAW1A7r5iI7b23RnbK/47XopWA87NC5W1umKSYcDoNd3Q/QjLeUXldHvfmIQNcMAG2fw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(136003)(396003)(39860400002)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(52116002)(6512007)(478600001)(2013699003)(86362001)(38350700002)(36756003)(38100700002)(2616005)(2906002)(6506007)(26005)(6486002)(8676002)(4326008)(8936002)(316002)(41300700001)(66476007)(66946007)(110136005)(66556008)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+7F8NgbVhqgPmAZoe4FjHfimrwc/0HAvD/W8QBSHUbFhx4F3+szUrtzUjOPZ?=
 =?us-ascii?Q?uQ/TjbYlKEOMu5wnpSye3hAOh+D39SXQh9ZfmmNuudDKRfCKCUJhwOMJBeO/?=
 =?us-ascii?Q?p5Gr6ZY6onN/cUx/+davV8/gaV8YpXGHNhe+TOI3XkIIDwfBAeKOHjHZACZt?=
 =?us-ascii?Q?rbwgKHaysisk5qq1Ua15bzxHe6XJr4f+1Ui+28ihICxvpHJ7HtgI3ENnGw9I?=
 =?us-ascii?Q?fs4Pi2VoAgRhdZFPVgYwV2/efKxWfg7B8gW4Dut03Mj3soruDlwmQ0LKElaY?=
 =?us-ascii?Q?bgw0J+HToR6mG7DFdTBueFk7ow8GPpWWm7xDhhZm13Qxq8eht4uTV75VOfh+?=
 =?us-ascii?Q?5Ts5exewD+4AlWDOFOVEDHsE0hMzGSZCeAgCFVIxovmyqTpyrjJs/XWHeiai?=
 =?us-ascii?Q?HAGVo4bJ2l7zVHk5LljD2EoQYyFuU+MwFwhD8MSL90wPuuf753FPSfstCPXX?=
 =?us-ascii?Q?k8+HSdDFN0499HNEb5IobYZ/NlSAOgMvdBBelcXzfpadzsG9gN+Yvfrl1xyv?=
 =?us-ascii?Q?MtNxLsUKGu39RTkhm8EqeP84/ocrS1+o0mRAsorbFuUYfPoD9gcw8H3QXLXo?=
 =?us-ascii?Q?/ZM0YzeyNiX5VYYHAUMT0eR0/utsOntf36JCqW8GGtjvLFHXLg0LOF5ZnCUj?=
 =?us-ascii?Q?+hkj9GJK2ZNCsPETbczjlYhVf1i/gWclC0JC7hHmcn7chgqdJyeOKwXDrLTH?=
 =?us-ascii?Q?iPqzMkBlQsgKhbWTv1fncd/I53MV3vIPHopc0zNNVmYtWjna5cvd2jdxp6jf?=
 =?us-ascii?Q?ln0LTawDoL/uX+V1oRQMwtH8P3ZIa7nkKSiyIvxecCDdTmPm71OWAc9PSYYF?=
 =?us-ascii?Q?X3j8fW7tltiXgzkyC5d1X/DtJI6kCIcCZTQzOv6/XeNMpmhzDqhlx/d0VvH2?=
 =?us-ascii?Q?cH02cE94CJz0aU2q9hCJb5CZrPSRQwkxAECdRyYOxWrWdLQqesG9z8XXt7X6?=
 =?us-ascii?Q?yVVE7pcVyjja0AE+fYTxeNC5A0kzCxIR1yrf3XqTMRUFeCykt9i9LUuLdYcs?=
 =?us-ascii?Q?/tMUHSahQ8ms8vUs+sbb1mUZoRIEc7+1i3FtffDwxm7Kcc1YFnhX3h0HYlLU?=
 =?us-ascii?Q?V1XGVv/TBcye81KfOEo1OGCX14VybCkBAuxoewgXAHEv7Ta4SxOKGbklibL9?=
 =?us-ascii?Q?bH47TUseRxSZ43km0eL8bziHBadQlv+x5KbSxVFYNqeYWj5Ibo+ZfCKBEGGD?=
 =?us-ascii?Q?PKxK0W8f36PC5GZ1T2Kvh1qD5xBU6r9h4UhGgCOA7g7tyPmZbfDb5YLfzvSs?=
 =?us-ascii?Q?QN7KMu38h6LXOyHiH9EOJuat9Xj/zoOpwgukZXxT3Grr2qZVmVCVKqRP4tGR?=
 =?us-ascii?Q?AlpZUIcqzJMTRjcVSy2dX8gQFLQniVpx/TyKnV73XgPsZJbuEnZMLFnS+CBD?=
 =?us-ascii?Q?I2dCQt2VetyzE+1Oy8oKumDuZCfV6d/HK45RJjJNzglVycZwDm3BagrjtnpY?=
 =?us-ascii?Q?EVl9SgvQebVR2NWv75HFa0UYYN19F7GVl6KdqJqaIUp8AWk292c90YVQONNF?=
 =?us-ascii?Q?Gtjw8Q1qVep4vqeFZ/se6oEQ/4dM5jSC5/Go1yxb+racRRZW/4PaLpikYHwH?=
 =?us-ascii?Q?EjqbWHsBjn1R80/CE+DN+BwaskBRsPxiYHGwCh9xR4RYC8gWQfvE3NNhDtcz?=
 =?us-ascii?Q?Q3ooemlxHPU1mwmTqdYrzN0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e00fc271-0e04-4b82-d64c-08dbca1fb24d
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 06:02:49.0535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Zqx1DRoQfFvo1GPtvUUhvU9WfZ44l6x80M2JwzxvNC3QGNWzghsbTSzBhrqOS8ELKvpxKhOeH1c0JtKTOl8Ms3Z7T36DQX5UH5F6SVR1gARwgFRhJ5F6H/rkURNcfAvl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11514
Message-ID-Hash: 7WAD6HOE3ID257WNZNIMJBSNTNJBPYKS
X-Message-ID-Hash: 7WAD6HOE3ID257WNZNIMJBSNTNJBPYKS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7WAD6HOE3ID257WNZNIMJBSNTNJBPYKS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now ASoC is supporting CPU:Codec = N:M support.
This patch enables it on Audio Graph Card2.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card2.c | 29 +++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 5d856942bcae..009fef88d443 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -515,7 +515,10 @@ static int graph_parse_node(struct simple_util_priv *priv,
 	int ret = 0;
 
 	if (graph_lnk_is_multi(port)) {
+		struct device_node *ports = of_get_parent(port);
 		int idx;
+		int num;
+		char *props = "ch_maps";
 
 		of_node_get(port);
 
@@ -530,6 +533,32 @@ static int graph_parse_node(struct simple_util_priv *priv,
 			if (ret < 0)
 				break;
 		}
+
+		/* read nm_ch_maps if exist */
+		num = of_property_count_elems_of_size(ports, props, sizeof(u32));
+		if (num > 0) {
+			struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
+			struct device *dev = simple_priv_to_dev(priv);
+			struct snd_soc_dai_link_ch_map *ch_maps = devm_kcalloc(dev, num, sizeof(*ch_maps), GFP_KERNEL);
+			int *temp = devm_kcalloc(dev, num, sizeof(int), GFP_KERNEL);
+			int i;
+
+			if (!ch_maps || !temp) {
+				ret = -ENOMEM;
+				goto multi_end;
+			}
+
+			ret = of_property_read_u32_array(ports, props, temp, num);
+			if (ret < 0)
+				goto multi_end;
+
+			dai_link->ch_maps = ch_maps;
+			for (i = 0; i < num; i++)
+				dai_link->ch_maps[i].connected_node = temp[i];
+multi_end:
+			devm_kfree(dev, temp);
+		}
+		of_node_put(ports);
 	} else {
 		/* Single CPU / Codec */
 		ep = port_to_endpoint(port);
-- 
2.25.1

