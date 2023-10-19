Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 762127CEDDA
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 04:05:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D24389F6;
	Thu, 19 Oct 2023 04:04:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D24389F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697681145;
	bh=Zj94oie1HW9Anf9ILPc8rSmQHBHsF4bAFC+UERgm+QY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Vm0Z4DMB4Vj2hP0kM7e4EfjKL9lzBnRhEJg6E8ZmujvApvGn7Wle4JMvCXld4STJn
	 gexjXVvcESBgsfe9+BkXSt/ysbK1pZ3crHjrmwQk6+HD9ueJZdPGMhuy8iSPS3RtjO
	 W1UZy9jqiVNbjFdm9peGJ6IafjJOE0yxRdKNylwc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FA84F8055C; Thu, 19 Oct 2023 04:04:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78F0DF8027B;
	Thu, 19 Oct 2023 04:04:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18B9FF80536; Thu, 19 Oct 2023 04:04:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AD6E7F8024E
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 04:04:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD6E7F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=AjMPojRS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U8bUtpfKA9iikwwJ+HZTyAsPPL1pljs4R/BI/Aw1/qdmaS93ba64jsdiG4pVDFQNYeBlPxzbokp1yRC/fOOEhgDqoSN8igLuB0eF3z7ku66icoQm0NsEGPt0mnwmI7YKbuKt7NszVdqtP6Hlr5cDCEqmQiK1LLJvKVtCcyb4kU+arvYplFKXDVamMfsTC3wOZ/4BfFtTNMqdA2mAUzAD+kD7bfNeZHL74iZFvJDHocrnongaTo2bJ7Pf+wu/PCQu22E7cS0R6FJUsRj24xdhVrtbsvwiC4fv1d5uAQ9UC1/BezbXdZJNZvNb80/N7xj9UvaBnH1/+TzPR5+hQ7ma2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nmqWKo2Z24nUsW76b7sx4HbQShNifbPQQHxWVgi1P1c=;
 b=lNisz75SdvVmsLCrhf7WwSs8EDd2j830tgY+531Ok+30jiR36SGWkVkaumvpv0AlA+o/4pYKPBEghWl+vzW9tmxnv+BmYl7ql1FCo6jppR75ym5bvaZzPhCQz+CKpiNxa0wRDpkF9OfnjrvAghfNNjKNsSXLJOhDp3YRaXgcySRXRsHfzY7MTuW9S4dM2mG6IXIBsL74X7s56i+ShfbPbpw9jmNbOZLI/KV8UrwoTWXb9FHI6enYyUX/A09lMAYOMtd0SGg8RFpVP37/MO6ArK3TAKND66fmN2Uvtfhe11Phf/sbYqdzMwCq11rcaBj/Q4IIaXk+lASVN0PuxpLxGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nmqWKo2Z24nUsW76b7sx4HbQShNifbPQQHxWVgi1P1c=;
 b=AjMPojRSdRFW64IPxPvheIc7UY9vn24uZ+/XgT9TSm+bRmGKztPHAXTm+GHYF9/018NLaef+y9XypaQQ25ihMYebhkCp8KbrPwaBLmN81IKdGl+dALLdLG6kSXhPzSGzbAOiMXOUZHrigXNC94coNSqlBXdPv0lComGNglyz4vI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB11658.jpnprd01.prod.outlook.com (2603:1096:400:378::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Thu, 19 Oct
 2023 02:04:11 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 02:04:11 +0000
Message-ID: <87wmvjpdut.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH][TEST-REQUEST] ASoC: makes CPU/Codec channel connection map
 more generic
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, bard.liao@intel.com
Cc: Mark Brown <broonie@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
In-Reply-To: <87y1fzpdxe.wl-kuninori.morimoto.gx@renesas.com>
References: <87zg0jwdnz.wl-kuninori.morimoto.gx@renesas.com>
	<87y1g3wdng.wl-kuninori.morimoto.gx@renesas.com>
	<d3c97c54-d149-4bed-9013-3f07bc6a7f52@linux.intel.com>
	<874jiokg1r.wl-kuninori.morimoto.gx@renesas.com>
	<5667241d-6976-4b44-8edd-79ee426415eb@linux.intel.com>
	<8734y8kd1a.wl-kuninori.morimoto.gx@renesas.com>
	<87y1fzpdxe.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 19 Oct 2023 02:04:11 +0000
X-ClientProxiedBy: TYCPR01CA0135.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB11658:EE_
X-MS-Office365-Filtering-Correlation-Id: 8135da5e-ecfa-4dce-d8e4-08dbd047afe0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eHTKwUri4QHR2x91ZokDqRj0GnoHP0p9G5MN2otnWB3ivypNVT5BJ32iR5tZLpjP89u5Qam4vsVEm1QvnztXmxyrY4UziZyOgdrZTxIcSsfEu5RD7/sL3840DkXaNjpQ8M+YQO6vhs5BIHdujasdEzSmnJHJO5yH9Swi20YUoZmqhrQbPAEqjT4O8pjsEjrlZAbXGtbVAfPGc4GQfrVFPZsLZCC+B6+AUn/66UsC9gG8/VDuQtZ0w+pDKV48m0w6FCXgRqdjtCJbG99e/FO7zgoUNFEsh9mzfCtkZfYZ8u8arvFUAz7SSkRpHQj13h22eZZhdLkku4Xnov3U29k3XOFAnz4Y0YEh3eC+dOTY5Nd7rhOGzQQCtCHdEQdG6xGsLvdbnT6EQTR2ETWAAOqlpcd9GfBN0SoL/WRf3wjtAukzXishAQkBeYx1IaL0DfVDzekpqU3Fn+/aTLVBameIH8W7wwrqFgTiv2Yqi3Xr2EjVTBoYZrdDk/dKaMmY9JWZGXbcFWrVXfjGYEsaTOOz60FOCWVBi0cMTVuS1gtJxJO9EYoGhjHPiAMDnla+6ZrIqj6Jcs+3eNtuC0whwmlkOXRCZUs7i+DCBlge+xo86Wj4bEgiy88kHUS1hNILa0PD
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(346002)(39860400002)(376002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6512007)(4326008)(316002)(66476007)(41300700001)(54906003)(66946007)(66556008)(110136005)(36756003)(8936002)(8676002)(30864003)(6486002)(966005)(38350700005)(478600001)(5660300002)(52116002)(2906002)(6506007)(7416002)(26005)(86362001)(2616005)(38100700002)(83380400001)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TXFCxYkZmYmznYGLjyY5wXbjhCDlJC0S+qpLdpdEUy/Q7tiun0HqJc3e3Gu/?=
 =?us-ascii?Q?K8uTe/IoM59NgytR01xB7HQw9D4eAGqjlWYhOab7j/xGMuS+3ErQd8Llp8O6?=
 =?us-ascii?Q?YRSEYC0Leazf/Gn8QgvFVWZnLQU70LTweJ5tCXyr/5N1GWeYI/gMUjHm9L3r?=
 =?us-ascii?Q?vzFVxdqqkxMaDdB/EN4cJUFAy4jEnjU9aQBb2VBXC5G/f9HN8dgejnElk2x0?=
 =?us-ascii?Q?In/f8xs2q+z0ssk5mY1gYzMC7GFr4tsXrNp+vD7rMTUqbX843sXFnzp8g5fK?=
 =?us-ascii?Q?SiJCHtKNgxS11eoMuN2sHJj/jd4XloqfXom3N3UHQ5K89zwoZTkvo51KmDqo?=
 =?us-ascii?Q?lai0IzIRsdVyEW1sGD/XrJGpGuC/2Gxrl/VkTj0m0/tGAEPMsq0e8Q37MdXw?=
 =?us-ascii?Q?RBq/nIJiOXhSG0vFRjmx2NmVuWZzG8H2QnCjA5vskokctJKb3u+mLk672X4J?=
 =?us-ascii?Q?6OS6vyyKeGPn8yT1qTpACtEqUjzP6puX6Jwme2a7tuT+SyyoOapqzDBH+MuI?=
 =?us-ascii?Q?XJDdbvVpjZeTQk+OUiQWzD+jAUi2MHwK/uAtQKYqopBfwxWZPmidcFGlmuPs?=
 =?us-ascii?Q?7IJvGFkrqqEMiAik5RMlDCsC0ThnDAzIFVg8oKPzse2DWlSnLo/Ki/CaC7oQ?=
 =?us-ascii?Q?0y7OB+lO6fdk04xSsqFLArHKFNz0E13rb5h++XHpaK9kbrqrDZAVZl7HDvDW?=
 =?us-ascii?Q?F6f5lIeBvSOJK9W6MopBM5RfXqekVRwIl3MYyAYXIoUE1MtT6Pkke648OU2A?=
 =?us-ascii?Q?7X7x5/1PSINMirpC5w6RAFhF0MLzG87U/8QpRKAt3ZWJ3c+iVW1nth1WGE03?=
 =?us-ascii?Q?5Ocb3f+jAEURUfa96dLV6R9iyjsFUrz24b6E1VrUtDPG2nJQa7LgEpUJeopj?=
 =?us-ascii?Q?q6rkxRTXt/2nQA988FXeRgpXeIrgzKMkIXJucHOOKibYNr71fzg/EWXbp2fe?=
 =?us-ascii?Q?WrnMrKcECez5P7/Edpqq4Np85CQMFvT42AhLxFE9/Sb2N0hpUT5C5uYmN/Eb?=
 =?us-ascii?Q?vFFEooyQMoJMX5z4idafM6WE0S2cdKGj3Rz3lTJ7b/Xq8JiQrGN9IkV42lP4?=
 =?us-ascii?Q?OtDSl/bir6UrzYzkezIIqnfKbq0fUmXetw+4xlFcHPr+AuMdU+vOZm9EYi9T?=
 =?us-ascii?Q?C8vYAVFJLIYlydZ6/rk4PtS38feIk1atdUY/qEKSZo9QUtRFEniL3Ulefi2e?=
 =?us-ascii?Q?4YAW2oy/kBvlcCCfItkI8MAEBM8TbIH6I03C/VqKIbo4gKt+S9zPAo7Q5m2n?=
 =?us-ascii?Q?STuk43WQOkoN1ZfhtPBEDBPMaJcP+LnnpssCctc0QEbsnjKxWE9Y3b4TLUMU?=
 =?us-ascii?Q?qlblrzo34haFHJU7nwa7ThVDBmWusL1YSSnxXStF41pAkVO2wa3WXtZuvhNy?=
 =?us-ascii?Q?1oNnnoXa1iI4cTXpFoGoGce8T/z2y2q7H24l5KIRYqrN6U/Ao3lOc6AGc8Sv?=
 =?us-ascii?Q?DCZsOUw8qsoCy+GQ06/7CDSurlHDxykbAsLgfyQHBbb4P5iu3j3xJB7w3ofa?=
 =?us-ascii?Q?Nedm+HVJCIztNPeBfARX7ELZ7ZBeSDp7Ujy4yQ/9ie/iSOVmzjvhH1txR1LS?=
 =?us-ascii?Q?lYaPNgnIrEfjlKnlhmn4WIEEu60HTt0U9ovg+jeR2HU5o8Mz2YVSVO3n/C41?=
 =?us-ascii?Q?ctVei4Yu+Xrrj9ZaampJAAY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8135da5e-ecfa-4dce-d8e4-08dbd047afe0
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 02:04:11.7617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 opmhubihzJJvs/UHBtM0AuRB62/BQmbv58GyjRhCHOYRPjBBT+fpfjOlwop230FX9xd/ajirRliR+40W/M63yO6jv3r8kbIa/mgAxA6dZbChi01SUPlSuEsHoHt0xu7V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11658
Message-ID-Hash: BJVQP64OJ2L3HEHMRQFF26UJY6GWY7WZ
X-Message-ID-Hash: BJVQP64OJ2L3HEHMRQFF26UJY6GWY7WZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BJVQP64OJ2L3HEHMRQFF26UJY6GWY7WZ/>
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
 sound/soc/soc-core.c             | 84 +++++++++++++++++++++++++++++++-
 sound/soc/soc-dapm.c             | 47 +++++++-----------
 sound/soc/soc-pcm.c              | 73 ++++++++++++++-------------
 5 files changed, 209 insertions(+), 75 deletions(-)

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
index c305e94762c3..46bc6a5ecab1 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1015,6 +1015,83 @@ static int soc_dai_link_sanity_check(struct snd_soc_card *card,
 	return -EINVAL;
 }
 
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
+static int snd_soc_compensate_channel_connection_map(struct snd_soc_card *card,
+						     struct snd_soc_dai_link *dai_link)
+{
+	int n, max;
+
+	/*
+	 * dai_link->ch_maps indicates how CPU/Codec are connected.
+	 * It will be a map seen from a larger number of DAI.
+	 * see
+	 *	soc.h :: [dai_link->ch_maps Image sample]
+	 */
+
+	/* it should have ch_maps if connection was N:M */
+	if (dai_link->num_cpus > 1 && dai_link->num_codecs > 1 &&
+	    dai_link->num_cpus != dai_link->num_codecs && !dai_link->ch_maps) {
+		dev_err(card->dev, "need to have ch_maps when N:M connction (%s)",
+			dai_link->name);
+		return -EINVAL;
+	}
+
+	/* do nothing if it has own maps */
+	if (dai_link->ch_maps)
+		goto sanity_check;
+
+	/* check default map size */
+	if (dai_link->num_cpus   > MAX_DEFAULT_CONNECTION_MAP_SIZE ||
+	    dai_link->num_codecs > MAX_DEFAULT_CONNECTION_MAP_SIZE) {
+		dev_err(card->dev, "soc-core.c needs update default_connection_maps");
+		return -EINVAL;
+	}
+
+	/* Compensate missing map for ... */
+	if (dai_link->num_cpus == dai_link->num_codecs)
+		dai_link->ch_maps = default_connection_map1; /* for 1:1 or N:N */
+	else
+		dai_link->ch_maps = default_connection_map2; /* for 1:N or N:1 */
+
+sanity_check:
+	if (dai_link->num_cpus >= dai_link->num_codecs) {
+		n   = dai_link->num_cpus;
+		max = dai_link->num_codecs;
+	} else {
+		n   = dai_link->num_codecs;
+		max = dai_link->num_cpus;
+	}
+
+	for (int i = 0; i < n; i++)
+		if (dai_link->ch_maps[i].connected_node >= max) {
+			dev_err(card->dev,
+				"dai_link->ch_maps[%d].connected_node (= %d) is "
+				"larger than max (= %d)",
+				i, dai_link->ch_maps[i].connected_node, max);
+			return -EINVAL;
+		}
+
+	return 0;
+}
+
 /**
  * snd_soc_remove_pcm_runtime - Remove a pcm_runtime from card
  * @card: The ASoC card to which the pcm_runtime has
@@ -1121,8 +1198,13 @@ int snd_soc_add_pcm_runtimes(struct snd_soc_card *card,
 			     int num_dai_link)
 {
 	for (int i = 0; i < num_dai_link; i++) {
-		int ret = snd_soc_add_pcm_runtime(card, dai_link + i);
+		int ret;
+
+		ret = snd_soc_compensate_channel_connection_map(card, dai_link + i);
+		if (ret < 0)
+			return ret;
 
+		ret = snd_soc_add_pcm_runtime(card, dai_link + i);
 		if (ret < 0)
 			return ret;
 	}
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

