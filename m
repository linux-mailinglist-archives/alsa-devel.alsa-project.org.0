Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D527C9CEE
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Oct 2023 03:39:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F78CAE9;
	Mon, 16 Oct 2023 03:38:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F78CAE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697420359;
	bh=ifNCtF3ql/QikeiDvr91Flp2w6TiNIsMJd3bcafZFSE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QnGVWFzY2JylNowuPlV3mjnAJV3e7LxyzlU2EAb2f4mnwE82Hruzf/FgIl6BRhTzB
	 2xG2JckSXOxwqUNoIWcRDpNqPaZc+Fj5eIU9M1Sr5ydVadhqXbH0y2v0qo2NC/yFIQ
	 vrIhrBJADjDnn/6gt9AkLiVLlEfNBFj27wg/Jero=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A35BAF80567; Mon, 16 Oct 2023 03:38:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F3E02F80567;
	Mon, 16 Oct 2023 03:38:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 077FFF8056F; Mon, 16 Oct 2023 03:38:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EAA8EF8024E
	for <alsa-devel@alsa-project.org>; Mon, 16 Oct 2023 03:37:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAA8EF8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=mWsK7pSv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h95LdVcj7LqjKuLZhvzF5cZ+khxCJZeDanBXJ/q5rgwNLbJpcrzRRtZY9MaM0/GjUA3PFbCS8kptAJzRG0kauKwIpZvsb2xg93bYHtFq1l3mJRUOjh0XSwbbAVG4H5ZsW+Spo3InleGSgTP2In2XhDtSIieTMKKQ8Cf8/m77LPWd/s4pQmOvVTgb7MDy/QNbvdREWEpExN62LKKuy+r2CCnpfshrGHq78750TtgmJcQ+/yx4jZB2jTEZhMUta46u7NgiLIKOGn5rvSc8XkhwEz5RcdQgR0bGfBKIvmH2Im4eH8OD2K4RpKZ9/jYANJ5anP2iR0+CbxU5rmjJb0aSDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W4AYtG+keeIPKxYqNKHZTQiSO/VnWhfY9wa6gnssUMs=;
 b=Ruu/KOoB2AaEZoxWX8JiWHJFLu8D2Ok1uyy/LTfTJUSMMxMG638aaDgBEkzRcEpJJyHp9AkFjQA0Pok/uc6xpvRVX709BRxLFNSoypu+77nOJDDuZu4kwDBDHNMLPvDGFWcnOsYErMmlIKMNljFXKCqOOGzfjR5EaT70SX7TgQbiy1/soon4Z7+SolQlkVx1oyZKTuKuCgtmxdBmhK/kbkcbGtn5RVDKCPga8765yFWdqtt1J0/lrKMG2U3ZuvqHJ6bhuS0TAIB0FggqKqC8JDsFXxbpEXQP5e6uWnkglpNLXTyPC/Riqgx9OHvC2oS9UBPcvWByyfPzfpSw/blggw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W4AYtG+keeIPKxYqNKHZTQiSO/VnWhfY9wa6gnssUMs=;
 b=mWsK7pSvv0UF5WE3R97ZYJSjlldMgI+kq4Gxc0+Z8QkaVRhspbeP/K9oJildCF4oNT7OBCcdxv68QXVMYk3PJu2RUFp8q0co0+mjITc/bEMT3YDt6Q7f+xupWsQKOuoOFoqKu+d9x3aLiOg1pIDKP7ytdRU3+wpVRIUzfCfQpOI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11744.jpnprd01.prod.outlook.com (2603:1096:400:407::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.47; Mon, 16 Oct
 2023 01:37:40 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 01:37:40 +0000
Message-ID: <87y1g3wdng.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 1/4] ASoC: makes CPU/Codec channel connection map more
 generic
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	bard.liao@intel.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
In-Reply-To: <87zg0jwdnz.wl-kuninori.morimoto.gx@renesas.com>
References: <87zg0jwdnz.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 16 Oct 2023 01:37:39 +0000
X-ClientProxiedBy: TY2PR02CA0036.apcprd02.prod.outlook.com
 (2603:1096:404:a6::24) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11744:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c6a7de1-fc4a-4311-e7bb-08dbcde87bda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uXu3PhC0fRmj5G6/LGMIVAnWOiSaQBLBlSSWscmcRcRb8h4aQcEIt2b5efJIN84q1Hv1Srjtv8nx0au3+ThqDM6RqGkn6j89FLmfQBj1wqXMj02i6JbEikzAJ8QY5s+CY29/SBECtTG0hNASRH8fcgFgmbkmE2t+Ei2F0cRbEJ0KrD8gzh55CuF5GcwhU9EbcZ979/DhI+nyUc1KsvvF0EHCBSBsK+WEZUzFXiYyLaucwB/A3Pk9F5D3CYiYGzZYi56e1o0WkcMvIHUysrso6vR0yBskkm5/jp8rvBAxYYvPhcPPjWqQzGBkVYNrN88nWykbV1dP4qQaY5F8SRcuy2y7NmnbcHp05PkXI4i3QE/bJGfUva678TZhZF1lsJoHbI+5RSRbAL1kkJYUoAgE54OmzqK+j/5Wm0mrH7tyNGa7pO2IawqO8wyAyEtpkvXH5C0iDmMB1GWJYibrDwxqNzPdVkcZLWgVGKAB+Esb1oa9WXQIdo+HwP3dixZNdvdcbyV94oxsWYTsnDvLRlPSevDxoDOaVGdHoATtyySBqacL3iF55qjAT1/NGK9LVQ6f1VaXsGcVs3Ik3MXHmTD9doZQoKSfmKhD0wfLbOfl/MWmHtPI9QpE3zokiNI4eW0k
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(366004)(396003)(376002)(136003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(966005)(478600001)(66556008)(6486002)(110136005)(66946007)(66476007)(2616005)(52116002)(316002)(6512007)(6506007)(26005)(8936002)(8676002)(5660300002)(7416002)(41300700001)(2906002)(38100700002)(4326008)(30864003)(36756003)(86362001)(83380400001)(38350700005)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?I6td28MOuFnmLbqY4Nk/mhXkOl+EmNhJhmF1UX6vDcv1JrqxWNNFz5+wXhVj?=
 =?us-ascii?Q?KVNB5r8MH5T6B8b0cPlAbug2XoXeSTufL8H0BVT/aeJvuz1pvUMZ/l6a4wJ+?=
 =?us-ascii?Q?HO+k7VCs2Dq4H3wWbZ2fFkMoAX8fJmb3bW29mdyRXyQSC0oC1FqYopLw+5AC?=
 =?us-ascii?Q?ppFeabsQmkvCisp/71vi8IA4SpiXTJpF1XfwNWpHGVdIq+Vd1myLMKYd/MLB?=
 =?us-ascii?Q?G62HTjE8CxKmvY6Wul6FYNkvWGl41q7JpRqxWgowZRrII/pOc5nSYki/UbeD?=
 =?us-ascii?Q?KoxkjxdcWDAVgK1fRqKlnhGiJl7mUr29lyHKsm6Jb1SROPRvdQel44Ty5cQZ?=
 =?us-ascii?Q?MnIyxng2v27+ERRaOdXwZln/FMUlJ/9I88yq0rs7UoF5ZkrKhBv+4FzPlbAa?=
 =?us-ascii?Q?YKsFR31ayvX1sSb3vBG8gqpiChwb9FTbmw/sAzR6pu/YTd8V444Nlo6nm0SI?=
 =?us-ascii?Q?2LZYtqE6uD50+nnf/WzjdrEXwLSyzo+koGVgJwVi7A6yTfhExMfajpMSB9zC?=
 =?us-ascii?Q?8uXOmqUaSiEHg+bwIbzEMUJyO3aKqNPX2/jLdtHElaOQh11Y691uGAORkyaS?=
 =?us-ascii?Q?vd5uAS7IpqfIzRqYU8MVz11ZhrnMjsWex+gaprrFei0X5KOsRDusVfEQSRKt?=
 =?us-ascii?Q?qIoLnPbGcbdKFG1AW8XYPpqd4mevHsy73bF0E3YxpL+EJ5SIkfl/yZh5nImG?=
 =?us-ascii?Q?lwkWap8B8xsEFhTIHjutOmt3Ovhg2BDnVI3rZH+rHi3xeLuOpG3Me/orfAt8?=
 =?us-ascii?Q?BPCffJpPTTbWXvBhxFiWmAydInQcNzMZJc5TfCO0PPHB0Vvvf8kTqDDr7wzT?=
 =?us-ascii?Q?Q38FxVN12fZKlTl77oWKDFUrIQa4+X2RKSULbAUtq19rThyyDFRHrkM5Z8wc?=
 =?us-ascii?Q?LYIz+uqC+OXgAiqIZVCVEKPALMgPqZYf8jhpSLUuFPNV6AtRcXEb4eNddONx?=
 =?us-ascii?Q?BwyN7NFSXgSOrFMRmF+0B4IRL97CYATEnLccnePiunsyp9zlUPsX6ZFjR5WR?=
 =?us-ascii?Q?iH7EaeSp68WNx0i58b3dCBRJpdlcclCiY8wsVL5xWbnAZ9pNL7GjZkisYhc/?=
 =?us-ascii?Q?4nYtR91nZOb/5eGJ8VaXilzPpnEDQm2Y9ph9R9+9PrtzHmZFBCrVaZlLKv/6?=
 =?us-ascii?Q?T3KN4FLU9DfBG7rTzagupwGKHb1f0nMP/aVseU8zsj0uL+lSLG6+a641LoRl?=
 =?us-ascii?Q?XuBrccw4Ndcc01/AzvGtEVksBZECsyWoQKiniRk8x21MhZOrQ1DNrS2xUNh1?=
 =?us-ascii?Q?4apXz2kZ8qQviFQtA6HmhUFW6b3hfsQKQsOIeVIQRxh+qdK2oFlEE3sLYo86?=
 =?us-ascii?Q?CQJoy5Uk9U0pVzXLvZkzkQ4Ehc7ov20w7jntUaE1CoN1yLNJ2X9mQXENmbgY?=
 =?us-ascii?Q?5nBz18T4cjemjwtWWXets9SV8YDZ0Z57JGGkz+qBN+O/TE4qOPLu/2tGf+Yl?=
 =?us-ascii?Q?cKMwBdmJzJ6aO09p642OJq1NBW7jFbWdWFMDWo3hJGQCrKxzkSVVHFilMhkg?=
 =?us-ascii?Q?SLr5xMvmuP1/npihrVEd9pNQKJjq/0dRFbYrGF92VOwt7cqaFsn7N0dx1GNR?=
 =?us-ascii?Q?PMeB/5CEIjXim3XvmhmdeF68hOe9nul9SoTgKjvzy0relgdi7NV6U7lM48+t?=
 =?us-ascii?Q?ovphk4radcIEVdBcXhLhHO0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2c6a7de1-fc4a-4311-e7bb-08dbcde87bda
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 01:37:39.9986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Lgm0TNsk46ONFg83DAuziZn68OAVmQFcNbu1QnB0uYnpvbeh6x6QdcDReXKoEraB4JiHIkwNvTnQd1WxIFIRpED3JFVeBLU6sQfWib0HU9tQdjwPNbnTSnKM+R67qomi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11744
Message-ID-Hash: DDXEBE3G4BTKWA4FIKGFFPPXSFX4S6ND
X-Message-ID-Hash: DDXEBE3G4BTKWA4FIKGFFPPXSFX4S6ND
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DDXEBE3G4BTKWA4FIKGFFPPXSFX4S6ND/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current ASoC CPU:Codec = N:M connection is using connection mapping idea,
but it is used for CPU < Codec case only. We want to use it for any case.

By this patch, not only N:M connection, but all existing connection
(1:1, 1:N, N:N) will use same connection mapping.
Because it will use default mapping, no conversion patch is needed
to exising CPU/Codec drivers.

More over, CPU:Codec = M:N (M > N) also supported in the same time.

Link: https://lore.kernel.org/r/87fs6wuszr.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h              | 66 +++++++++++++++++++++++--
 sound/soc/intel/boards/sof_sdw.c | 14 +++---
 sound/soc/soc-core.c             | 85 ++++++++++++++++++++++++++++++++
 sound/soc/soc-dapm.c             | 47 +++++++-----------
 sound/soc/soc-pcm.c              | 73 ++++++++++++++-------------
 5 files changed, 211 insertions(+), 74 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 63b57f58cc56..ff04ed312009 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -655,8 +655,68 @@ struct snd_soc_dai_link_component {
 	struct of_phandle_args *dai_args;
 };
 
-struct snd_soc_dai_link_codec_ch_map {
-	unsigned int connected_cpu_id;
+/*
+ * [dai_link->ch_maps Image sample]
+ *
+ * if (num_cpus >= num_codecs)
+ *	.ch_maps is [CPU] base
+ * else
+ *	.ch_maps is [Codec] base
+ *
+ *-------------------------
+ * CPU0 <---> CodecX
+ *
+ *	Because [num_cpus >= num_codecs]
+ *	.ch_maps is [CPU] base
+ *
+ *	.num_cpus   = 1;
+ *	.num_codecs = 1;
+ *	.ch_maps[] = {{.connected_node = X; }}; CPU0 <-> CodecX
+ *
+ *-------------------------
+ * CPU0 <---> CodecX
+ * CPU1 <---> CodecY
+ * CPU2 <---> CodecZ
+ *
+ *	Because [num_cpus >= num_codecs]
+ *	.ch_maps is [CPU] base
+ *
+ *	.num_cpus   = 3;
+ *	.num_codecs = 3;
+ *	.ch_maps[] = {{.connected_node = X; },	CPU0 <-> CodecX
+ *		      {.connected_node = Y; },	CPU1 <-> CodecY
+ *		      {.connected_node = Z; }};	CPU2 <-> CodecZ
+ *
+ *-------------------------
+ * CPU0 <---> CodecX
+ * CPU1 <-+-> CodecY
+ * CPU2 <-/
+ *
+ *	Because [num_cpus >= num_codecs]
+ *	.ch_maps is [CPU] base
+ *
+ *	.num_cpus   = 3;
+ *	.num_codecs = 2;
+ *	.ch_maps[] = {{.connected_node = X; },	CPU0 <-> CodecX
+ *		      {.connected_node = Y; },	CPU1 <-> CodecY
+ *		      {.connected_node = Y; }};	CPU2 <-> CodecY
+ *
+ *-------------------------
+ * CPU_X <---> Codec0
+ * CPU_Y <-+-> Codec1
+ *	   \-> Codec2
+ *
+ *	Because [num_cpus < num_codecs]
+ *	.ch_maps is [Codec] base
+ *
+ *	.num_cpus   = 2;
+ *	.num_codecs = 3;
+ *	.ch_maps[] = {{.connected_node = X; },	Codec0 <-> CPU_X
+ *		      {.connected_node = Y; },	Codec1 <-> CPU_Y
+ *		      {.connected_node = Y; }};	Codec2 <-> CPU_Y
+ */
+struct snd_soc_dai_link_ch_map {
+	unsigned int connected_node;
 	unsigned int ch_mask;
 };
 
@@ -688,7 +748,7 @@ struct snd_soc_dai_link {
 	struct snd_soc_dai_link_component *codecs;
 	unsigned int num_codecs;
 
-	struct snd_soc_dai_link_codec_ch_map *codec_ch_maps;
+	struct snd_soc_dai_link_ch_map *ch_maps;
 	/*
 	 * You MAY specify the link's platform/PCM/DMA driver, either by
 	 * device name, or by DT/OF node, but not both. Some forms of link
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 226a74a4c340..7927b729866d 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -579,7 +579,7 @@ int sdw_hw_params(struct snd_pcm_substream *substream,
 	int i;
 	int j;
 
-	if (!rtd->dai_link->codec_ch_maps)
+	if (!rtd->dai_link->ch_maps)
 		return 0;
 
 	/* Identical data will be sent to all codecs in playback */
@@ -607,9 +607,9 @@ int sdw_hw_params(struct snd_pcm_substream *substream,
 	 */
 	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 		for_each_rtd_codec_dais(rtd, j, codec_dai) {
-			if (rtd->dai_link->codec_ch_maps[j].connected_cpu_id != i)
+			if (rtd->dai_link->ch_maps[j].connected_node != i)
 				continue;
-			rtd->dai_link->codec_ch_maps[j].ch_mask = ch_mask << (j * step);
+			rtd->dai_link->ch_maps[j].ch_mask = ch_mask << (j * step);
 		}
 	}
 	return 0;
@@ -1350,7 +1350,7 @@ static int get_slave_info(const struct snd_soc_acpi_link_adr *adr_link,
 	return 0;
 }
 
-static void set_dailink_map(struct snd_soc_dai_link_codec_ch_map *sdw_codec_ch_maps,
+static void set_dailink_map(struct snd_soc_dai_link_ch_map *sdw_codec_ch_maps,
 			    int codec_num, int cpu_num)
 {
 	int step;
@@ -1358,7 +1358,7 @@ static void set_dailink_map(struct snd_soc_dai_link_codec_ch_map *sdw_codec_ch_m
 
 	step = codec_num / cpu_num;
 	for (i = 0; i < codec_num; i++)
-		sdw_codec_ch_maps[i].connected_cpu_id = i / step;
+		sdw_codec_ch_maps[i].connected_node = i / step;
 }
 
 static const char * const type_strings[] = {"SimpleJack", "SmartAmp", "SmartMic"};
@@ -1453,7 +1453,7 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 		*ignore_pch_dmic = true;
 
 	for_each_pcm_streams(stream) {
-		struct snd_soc_dai_link_codec_ch_map *sdw_codec_ch_maps;
+		struct snd_soc_dai_link_ch_map *sdw_codec_ch_maps;
 		char *name, *cpu_name;
 		int playback, capture;
 		static const char * const sdw_stream_name[] = {
@@ -1530,7 +1530,7 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 		dai_links[*link_index].nonatomic = true;
 
 		set_dailink_map(sdw_codec_ch_maps, codec_num, cpu_dai_num);
-		dai_links[*link_index].codec_ch_maps = sdw_codec_ch_maps;
+		dai_links[*link_index].ch_maps = sdw_codec_ch_maps;
 		ret = set_codec_init_func(card, adr_link, dai_links + (*link_index)++,
 					  playback, group_id, adr_index, dai_index);
 		if (ret < 0) {
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index c305e94762c3..07fdcb997ab4 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1824,6 +1824,86 @@ int snd_soc_set_dmi_name(struct snd_soc_card *card, const char *flavour)
 EXPORT_SYMBOL_GPL(snd_soc_set_dmi_name);
 #endif /* CONFIG_DMI */
 
+#define MAX_DEFAULT_CONNECTION_MAP_SIZE 7
+static struct snd_soc_dai_link_ch_map default_connection_map1[MAX_DEFAULT_CONNECTION_MAP_SIZE] = {
+	{ .connected_node = 0 },
+	{ .connected_node = 1 },
+	{ .connected_node = 2 },
+	{ .connected_node = 3 },
+	{ .connected_node = 4 },
+	{ .connected_node = 5 },
+	{ .connected_node = 6 },
+};
+static struct snd_soc_dai_link_ch_map default_connection_map2[MAX_DEFAULT_CONNECTION_MAP_SIZE] = {
+	{ .connected_node = 0 },
+	{ .connected_node = 0 },
+	{ .connected_node = 0 },
+	{ .connected_node = 0 },
+	{ .connected_node = 0 },
+	{ .connected_node = 0 },
+	{ .connected_node = 0 },
+};
+
+static int snd_soc_compensate_connection_map(struct snd_soc_card *card)
+{
+	struct snd_soc_dai_link *dai_link;
+	int i, j, n, max;
+
+	/*
+	 * dai_link->ch_maps indicates how CPU/Codec are connected.
+	 * It will be a map seen from a larger number of DAI.
+	 * see
+	 *	soc.h :: [dai_link->ch_maps Image sample]
+	 */
+	for_each_card_prelinks(card, i, dai_link) {
+
+		/* it should have ch_maps if connection was N:M */
+		if (dai_link->num_cpus > 1 && dai_link->num_codecs > 1 &&
+		    dai_link->num_cpus != dai_link->num_codecs && !dai_link->ch_maps) {
+			dev_err(card->dev, "need to have ch_maps when N:M connction (%s)",
+				dai_link->name);
+			return -EINVAL;
+		}
+
+		/* do nothing if it has own maps */
+		if (dai_link->ch_maps)
+			goto sanity_check;
+
+		/* check default map size */
+		if (dai_link->num_cpus   > MAX_DEFAULT_CONNECTION_MAP_SIZE ||
+		    dai_link->num_codecs > MAX_DEFAULT_CONNECTION_MAP_SIZE) {
+			dev_err(card->dev, "soc-core.c needs update default_connection_maps");
+			return -EINVAL;
+		}
+
+		/* Compensate missing map for ... */
+		if (dai_link->num_cpus == dai_link->num_codecs)
+			dai_link->ch_maps = default_connection_map1; /* for 1:1 or N:N */
+		else
+			dai_link->ch_maps = default_connection_map2; /* for 1:N or N:1 */
+
+sanity_check:
+		if (dai_link->num_cpus >= dai_link->num_codecs) {
+			n   = dai_link->num_cpus;
+			max = dai_link->num_codecs;
+		} else {
+			n   = dai_link->num_codecs;
+			max = dai_link->num_cpus;
+		}
+
+		for (j = 0; j < n; j++)
+			if (dai_link->ch_maps[j].connected_node >= max) {
+				dev_err(card->dev,
+					"dai_link->ch_maps[%d].connected_node (= %d) is "
+					"larger than max (= %d)",
+					j, dai_link->ch_maps[j].connected_node, max);
+				return -EINVAL;
+			}
+	}
+
+	return 0;
+}
+
 static void soc_check_tplg_fes(struct snd_soc_card *card)
 {
 	struct snd_soc_component *component;
@@ -2030,6 +2110,11 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 
 	snd_soc_dapm_init(&card->dapm, card, NULL);
 
+	/* for keeping compatibility */
+	ret = snd_soc_compensate_connection_map(card);
+	if (ret < 0)
+		goto probe_end;
+
 	/* check whether any platform is ignore machine FE and using topology */
 	soc_check_tplg_fes(card);
 
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 2512aadf95f7..3c7c2b16bd64 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4426,6 +4426,7 @@ static void soc_dapm_dai_stream_event(struct snd_soc_dai *dai, int stream,
 void snd_soc_dapm_connect_dai_link_widgets(struct snd_soc_card *card)
 {
 	struct snd_soc_pcm_runtime *rtd;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	int i;
 
@@ -4438,39 +4439,25 @@ void snd_soc_dapm_connect_dai_link_widgets(struct snd_soc_card *card)
 		if (rtd->dai_link->dynamic)
 			continue;
 
-		if (rtd->dai_link->num_cpus == 1) {
-			for_each_rtd_codec_dais(rtd, i, codec_dai)
-				dapm_connect_dai_pair(card, rtd, codec_dai,
-						      snd_soc_rtd_to_cpu(rtd, 0));
-		} else if (rtd->dai_link->num_codecs == rtd->dai_link->num_cpus) {
-			for_each_rtd_codec_dais(rtd, i, codec_dai)
-				dapm_connect_dai_pair(card, rtd, codec_dai,
-						      snd_soc_rtd_to_cpu(rtd, i));
-		} else if (rtd->dai_link->num_codecs > rtd->dai_link->num_cpus) {
-			int cpu_id;
-
-			if (!rtd->dai_link->codec_ch_maps) {
-				dev_err(card->dev, "%s: no codec channel mapping table provided\n",
-					__func__);
-				continue;
-			}
+		/*
+		 * see
+		 *	soc.h :: [dai_link->ch_maps Image sample]
+		 */
+		/* .ch_map is from CPU */
+		if (rtd->dai_link->num_cpus >= rtd->dai_link->num_codecs) {
+			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
+				codec_dai = snd_soc_rtd_to_codec(rtd, rtd->dai_link->ch_maps[i].connected_node);
 
+				dapm_connect_dai_pair(card, rtd, codec_dai, cpu_dai);
+			}
+		}
+		/* .ch_map is from Codec */
+		else {
 			for_each_rtd_codec_dais(rtd, i, codec_dai) {
-				cpu_id = rtd->dai_link->codec_ch_maps[i].connected_cpu_id;
-				if (cpu_id >= rtd->dai_link->num_cpus) {
-					dev_err(card->dev,
-						"%s: dai_link %s cpu_id %d too large, num_cpus is %d\n",
-						__func__, rtd->dai_link->name, cpu_id,
-						rtd->dai_link->num_cpus);
-					continue;
-				}
-				dapm_connect_dai_pair(card, rtd, codec_dai,
-						      snd_soc_rtd_to_cpu(rtd, cpu_id));
+				cpu_dai = snd_soc_rtd_to_cpu(rtd, rtd->dai_link->ch_maps[i].connected_node);
+
+				dapm_connect_dai_pair(card, rtd, codec_dai, cpu_dai);
 			}
-		} else {
-			dev_err(card->dev,
-				"%s: codec number %d < cpu number %d is not supported\n",
-				__func__, rtd->dai_link->num_codecs, rtd->dai_link->num_cpus);
 		}
 	}
 }
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 8c168dc553f6..0bfff2ea111d 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1043,7 +1043,6 @@ static int __soc_pcm_hw_params(struct snd_soc_pcm_runtime *rtd,
 
 	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 		unsigned int ch_mask = 0;
-		int j;
 
 		/*
 		 * Skip CPUs which don't support the current stream
@@ -1055,22 +1054,28 @@ static int __soc_pcm_hw_params(struct snd_soc_pcm_runtime *rtd,
 		/* copy params for each cpu */
 		tmp_params = *params;
 
-		if (!rtd->dai_link->codec_ch_maps)
-			goto hw_params;
 		/*
 		 * construct cpu channel mask by combining ch_mask of each
 		 * codec which maps to the cpu.
+		 * see
+		 *	soc.h :: [dai_link->ch_maps Image sample]
 		 */
-		for_each_rtd_codec_dais(rtd, j, codec_dai) {
-			if (rtd->dai_link->codec_ch_maps[j].connected_cpu_id == i)
-				ch_mask |= rtd->dai_link->codec_ch_maps[j].ch_mask;
+		if (rtd->dai_link->num_cpus >= rtd->dai_link->num_codecs) {
+			/* .ch_map is from CPU */
+			ch_mask = rtd->dai_link->ch_maps[i].ch_mask;
+		} else {
+			int j;
+
+			/* .ch_map is from Codec */
+			for_each_rtd_codec_dais(rtd, j, codec_dai)
+				if (rtd->dai_link->ch_maps[j].connected_node == i)
+					ch_mask |= rtd->dai_link->ch_maps[j].ch_mask;
 		}
 
 		/* fixup cpu channel number */
 		if (ch_mask)
 			soc_pcm_codec_params_fixup(&tmp_params, ch_mask);
 
-hw_params:
 		ret = snd_soc_dai_hw_params(cpu_dai, substream, &tmp_params);
 		if (ret < 0)
 			goto out;
@@ -2824,36 +2829,36 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 		int cpu_capture  = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_CAPTURE);
 		int cpu_playback = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_PLAYBACK);
 
-		for_each_rtd_codec_dais(rtd, i, codec_dai) {
-			if (dai_link->num_cpus == 1) {
-				cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-			} else if (dai_link->num_cpus == dai_link->num_codecs) {
-				cpu_dai = snd_soc_rtd_to_cpu(rtd, i);
-			} else if (rtd->dai_link->num_codecs > rtd->dai_link->num_cpus) {
-				int cpu_id;
-
-				if (!rtd->dai_link->codec_ch_maps) {
-					dev_err(rtd->card->dev, "%s: no codec channel mapping table provided\n",
-						__func__);
-					return -EINVAL;
-				}
+		/*
+		 * see
+		 *	soc.h :: [dai_link->ch_maps Image sample]
+		 */
+		/* .ch_map is from CPU */
+		if (dai_link->num_cpus >= dai_link->num_codecs) {
+			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
+				codec_dai = snd_soc_rtd_to_codec(rtd, dai_link->ch_maps[i].connected_node);
 
-				cpu_id = rtd->dai_link->codec_ch_maps[i].connected_cpu_id;
-				cpu_dai = snd_soc_rtd_to_cpu(rtd, cpu_id);
-			} else {
-				dev_err(rtd->card->dev,
-					"%s codec number %d < cpu number %d is not supported\n",
-					__func__, rtd->dai_link->num_codecs,
-					rtd->dai_link->num_cpus);
-				return -EINVAL;
+				if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
+				    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
+					has_playback = 1;
+				if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
+				    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
+					has_capture = 1;
 			}
+		}
+		/* .ch_map is from Codec */
+		else {
+			for_each_rtd_codec_dais(rtd, i, codec_dai) {
+				cpu_dai = snd_soc_rtd_to_cpu(rtd, dai_link->ch_maps[i].connected_node);
+
+				if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
+				    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
+					has_playback = 1;
+				if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
+				    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
+					has_capture = 1;
 
-			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
-			    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
-				has_playback = 1;
-			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
-			    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
-				has_capture = 1;
+			}
 		}
 	}
 
-- 
2.25.1

