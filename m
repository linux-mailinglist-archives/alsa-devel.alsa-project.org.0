Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6129B7D5FE4
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Oct 2023 04:22:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F4EF827;
	Wed, 25 Oct 2023 04:21:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F4EF827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698200560;
	bh=pr8dYZAqJBS5+jk0lFEaUfngteMulpescejoPQvZCig=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cZEuMqhQBxx9F2aWTsul7SZxjutsuMFbcw1t6vtWkJnWarmob3k7Qy/CQM7IwkDwX
	 rmwQXI4N4NewchM6W4/GtdKYv1N9htgDFnkKJMbEmNNpGspJpMNJXq/olROXn6FotF
	 PKWp0AZMZBAUunJBoRG4DxOtgJUwuYUqw3dSSUK0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7108F80558; Wed, 25 Oct 2023 04:21:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C551BF80157;
	Wed, 25 Oct 2023 04:21:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DFAC6F80563; Wed, 25 Oct 2023 04:19:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20714.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::714])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AE174F80224
	for <alsa-devel@alsa-project.org>; Wed, 25 Oct 2023 04:18:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE174F80224
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=iJoaSwZ3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TiE8dPzjUGtwofxW2CxJxPSMpNfPDW/EYCY8a8q6zsEZ6VupKxe2pN4oXLAWRQsulC43XR7F+izFHLl1mh+Dan8CA8sH5wGAuCz6TTnpAXneb/ZXfIXEVr0feHX+BpPzRpCVTOkT3a1S4QyEuRj2Ns/ZNLqTUw0IEoe28JsGYK8LX7rA/TZnQXnVM1VlnaTZPe+qm/OMTQQQFVofHC2vRYuptNKDYKPtSWRedrMuJn90f13lb19K2BsXj1Ps9s2gaIGH+qwB3QCnmqynGjkJmRuqnSX2SKCKSRqS8VMUKq+Y/RS6njRtG8661/0g7mRisMYtQU0/Yc58WN702iSY8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cogS2eDOJsyo8yKrUcDeIx/Ae7epNAjSt0k0hC8PN2s=;
 b=mf2S9M+YkvGwnAjbCJ0WM1x13dtsEG4jlMIl6ud+X8FUD26Lu42/tQlsFceAsFt88sFBaAHG4Kns3wRH5flwPhN6ZIzdwr8vjJCwC287ZsLgwh9jJuiUmfgNYMCPIknrFWatm85GetRKBpji3uG1JdyEvYwBnLTOm80Uoc7LxBX0ylSQcFD49Z0T/eZ9UzljseOCbrL+3e1C+gdbAudfe5sv6hAL6Ni5nAwnJDarcekpprK6RtSROv8gqmtSQi3WWNxSzKOw9IWfWRssFujOU4EpmVwhLyR9R8b74pf33UJwxveMNttXvvapuBt6pP016QTsbFstSkQx1lGKS63ZWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cogS2eDOJsyo8yKrUcDeIx/Ae7epNAjSt0k0hC8PN2s=;
 b=iJoaSwZ3cgGHbxjdtvhU6gKR5myalpW5PGK5aVDB4O/bz95CaORBXHaJgICcGOc5/xQdQLiLb45Kn86+hVMg5nLG/61ej29s+gICAm6y4KPceUdFSubBSk7510fPSo53ixdkG4H7y2S85yKNJ0VWp25lHUL168tF4n8BRztx/qQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB10372.jpnprd01.prod.outlook.com (2603:1096:604:1f9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.31; Wed, 25 Oct
 2023 02:18:39 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f7e9:e682:d78b:f55a]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f7e9:e682:d78b:f55a%3]) with mapi id 15.20.6933.019; Wed, 25 Oct 2023
 02:18:39 +0000
Message-ID: <87edhjbg1u.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v6 1/5] ASoC: makes CPU/Codec channel connection map more
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
In-Reply-To: <87fs1zbg2g.wl-kuninori.morimoto.gx@renesas.com>
References: <87fs1zbg2g.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 25 Oct 2023 02:18:38 +0000
X-ClientProxiedBy: TY2PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:404:a6::28) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB10372:EE_
X-MS-Office365-Filtering-Correlation-Id: ecdb6003-dc4a-4a94-94db-08dbd500b305
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KeJWeJ5bnStzLyfm8ujyG78FCAvjvOF77Ljx2qxi0PJXeudYGt4AAjPuG0NadyN3s1e4jdIPTkRvYS3S4tgTkoDfWDpdgdud3FEhVGVcY2UdsaBK3rBLKm7xGHTLBFEibrOMm2/EdLK6NUARYd12oxsvsKSjgXfQeXUK6KcDcZOQ+J+zaQfm1BorH+y68nPA5BpX2u95fiFE5nYkgPqxz2m3rBszxuBzJVangAb8cc/5REEUAFm0n7xQiyLykeAI0OXRHJUGueVk9qhLBn4Zm6HjF/oGjcFGR8d5VCK808xO/q88pE5LO6We0X9GEuggup2+E8hColChbN1pdJ7GkhPX89EiYtPjsFfhyjhVI5K4x4t1BFCHNnpHlvgt5tB9aPgNgjuEoCOrY/HqplmQ0/GFGQxTaSjuGKN3yNu+NHQtUloGQMeQjki4EXYsBd+MLswmDz63wcfYlgbaPeCR66VR7zugjzIOa1VZw0Vw89J5EDEPPzrsgqYw8mtjXYfYlINIpNv7D1cdSU1/jRNGB0rrt3YONRN85IEiAbHERsQ9l47eqt7NNVCuDIWLlX+lGbjKO2sddigxErjf8GOVIALAUtVMgjZgVF2y2gUrolEjRirdZoXeX/u+DaVhPnXlTs+d3Cxv6Lb5HsAlefRP2CmyAastEpaw0bG0qNg7Bcw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(39860400002)(396003)(346002)(136003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(38350700005)(2616005)(41300700001)(6506007)(966005)(52116002)(83380400001)(6512007)(7416002)(66556008)(26005)(4326008)(8936002)(8676002)(30864003)(6486002)(2906002)(5660300002)(66946007)(478600001)(66476007)(110136005)(316002)(86362001)(38100700002)(36756003)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YA9XTGNJhDNPZL4KS6bVjjw0+gkWMjsU5/NnySyb2pdbv8RD0rC1hYDRvfpu?=
 =?us-ascii?Q?d2HdSGpbwz8D0vZalrXkzP96CJt56WNsGFQc41pY7OrqDdGKYrqHvegMVXxP?=
 =?us-ascii?Q?UCex+3bZ4LHfS+ipL+oxkETNSFF1YOngiy6+OWL8BjJClGuoYn3rxXi4hDzu?=
 =?us-ascii?Q?oyMUL0p3jF41V/15Z6imiNOdeSSmoroarducn+5CPAFsO/37h/LyIOiLmSNi?=
 =?us-ascii?Q?v0dhwqp4ccDPTO3aEqIptFZM+gLLUPB+tl9/mf17JCcdC2niWBUu7tfjcbAK?=
 =?us-ascii?Q?thMZ4tVKg5+IfO8diRSd6qG1zJ3A68uKXACooZGkoABdfEAdoKuQpPjHLdVV?=
 =?us-ascii?Q?7LR0ytVK2wAWrT/gF7oLKjnB0i/cnbxLtNJqv3kP2OAjdGzdx4tlz0gftLis?=
 =?us-ascii?Q?8kSsHf++DfsWgjdllYYL7IdmlXws++JH1F5jbiczL2ejt3Sqiv64yKLVqw7N?=
 =?us-ascii?Q?zbu5zt50wm17XkBDl6tFBCNP9L6Yb2E4yfuq8GUG/CS8hH+Euid8mpaip3mw?=
 =?us-ascii?Q?V74af+Dcybquq8+aB4qpTdmfQ7/Qb9IIZZjiMtPJTQogsp5wGHlkKrSF+GpH?=
 =?us-ascii?Q?9x7yVoEihEgX2c0+uJPCp8RVcY56C/lVnil8UzKuK3eGXRzfghSYQq+6OBf3?=
 =?us-ascii?Q?3c6AnLcOgldDuB6PoNcCrlyLgnus31J8n0b+WMAGDrDpC5yba4ebTwtREzJt?=
 =?us-ascii?Q?cfsMQj5DTstSGSARIN5OadLLDIXXL/A8Iwg8Er6l8ECLFNiqqbQKQ9obiAzc?=
 =?us-ascii?Q?QiMIrrz3Ka+rttAWQyRmQEbMDYyeaj2SOq32yeFU6GBFxQgAoE7IzVs40wrS?=
 =?us-ascii?Q?68i0ZfktFNKnYFc0cHil4rQlFsCbI6AdI2j1oHYR+uKv6EKoNodPtbZpXxst?=
 =?us-ascii?Q?ZGqVFeAtIxw7GTzpxKHYPBSNEq9Q9PVekBUyNGqevMYowYHl564xjnAtPlOt?=
 =?us-ascii?Q?s4CyQGv8i3y5h09J0LzLnWiT0J0STFbZGz7uMbZBpW4/WSi+RVlQdYbwy2p0?=
 =?us-ascii?Q?HlGjG3EehZqR/NsVMRxl9LzNr7JMsc5nNNaZIWips9M82GcuVLbWx3GOw1Wi?=
 =?us-ascii?Q?LggajFoRGtZ0BZls2j2//1vShOJBQVDQUgM3A4hMqDq1jzfuna/b6L/QfhJk?=
 =?us-ascii?Q?iN5E4/yI9X9KVEeqUqLuqH7+yjVqrhyAMmiAlhT0oBzl0OUcXEv5nSUGtBoT?=
 =?us-ascii?Q?xFglK1zxap9NpMTlB+Z0Yi7fwkr3NYsN0WE6x+15PZE8g8CaYJ3XwsnFk1Hi?=
 =?us-ascii?Q?osf0r43Gpdj55kn0XAtQ0LgurXWvQ15fYft0kpI5DPcE7q442xLkM5m94V3z?=
 =?us-ascii?Q?M4yIOkwbjfkDyQbuWoGPhCHc8fCkWz3IWrukgliYYr3HVu+gyEhC78Ao1r8b?=
 =?us-ascii?Q?p0p9ajrM2huYL1W08VY/eszmtrt98usjHdcDPowHwY4mW9jQllW1f3d6EBdw?=
 =?us-ascii?Q?gTdkWZ+5K8btVRU/LaeigtVQqGi4DgdMb/J66ezmSh+pFCGHN24lJhF8zNwV?=
 =?us-ascii?Q?SPAbuzysiGdVzTsN+NKO2wWKnyQke5Ggs4OehWbqtu2ZZLHZLRuNkAOhqNnD?=
 =?us-ascii?Q?rhGB55sxzX9QhiT86Jf/WvYEwI16g/gsZQgGSSMugCPDWRMEzD503SEE3jEv?=
 =?us-ascii?Q?Z8CMrhoTIYiYvbh2UK2KRk8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ecdb6003-dc4a-4a94-94db-08dbd500b305
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 02:18:39.5247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 LUnjIcgEsKqmQA9KmHan9YqpDdCyS6z8oswalx+mqdze62O5QaS302w5bQ6MJEFftJIuqMQYPZ8G4+BOy4+wQ0HF6ZjEZMXHr5+k3YVjxmtfv4AQVpvpQbWiml6opRne
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10372
Message-ID-Hash: OZ2AKSP2OC5CAMOCGXIEMVFDWMNHBAHH
X-Message-ID-Hash: OZ2AKSP2OC5CAMOCGXIEMVFDWMNHBAHH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OZ2AKSP2OC5CAMOCGXIEMVFDWMNHBAHH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current ASoC CPU:Codec = N:M connection is using connection mapping idea,
but it is used for N < M case only. We want to use it for any case.

By this patch, not only N:M connection, but all existing connection
(1:1, 1:N, N:N) will use same connection mapping. Then, because it will
use default mapping, no conversion patch is needed to exising drivers.

More over, CPU:Codec = N:M (N > M) also supported in the same time.

ch_maps array will has CPU/Codec index by this patch.

Image
	CPU0 <---> Codec0
	CPU1 <-+-> Codec1
	CPU2 <-/

ch_map
	ch_map[0].cpu = 0	ch_map[0].codec = 0
	ch_map[1].cpu = 1	ch_map[1].codec = 1
	ch_map[2].cpu = 2	ch_map[2].codec = 1

Link: https://lore.kernel.org/r/87fs6wuszr.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/878r7yqeo4.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Tested-by: Jerome Brunet <jbrunet@baylibre.com>
---
 include/sound/soc.h              | 56 ++++++++++++++++++-
 sound/soc/intel/boards/sof_sdw.c | 28 ++++------
 sound/soc/soc-core.c             | 95 +++++++++++++++++++++++++++++++-
 sound/soc/soc-dapm.c             | 45 ++++-----------
 sound/soc/soc-pcm.c              | 44 +++++----------
 5 files changed, 185 insertions(+), 83 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 7792c393e238..f3803c2dc349 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -655,8 +655,45 @@ struct snd_soc_dai_link_component {
 	struct of_phandle_args *dai_args;
 };
 
-struct snd_soc_dai_link_codec_ch_map {
-	unsigned int connected_cpu_id;
+/*
+ * [dai_link->ch_maps Image sample]
+ *
+ *-------------------------
+ * CPU0 <---> Codec0
+ *
+ * ch-map[0].cpu = 0	ch-map[0].codec = 0
+ *
+ *-------------------------
+ * CPU0 <---> Codec0
+ * CPU1 <---> Codec1
+ * CPU2 <---> Codec2
+ *
+ * ch-map[0].cpu = 0	ch-map[0].codec = 0
+ * ch-map[1].cpu = 1	ch-map[1].codec = 1
+ * ch-map[2].cpu = 2	ch-map[2].codec = 2
+ *
+ *-------------------------
+ * CPU0 <---> Codec0
+ * CPU1 <-+-> Codec1
+ * CPU2 <-/
+ *
+ * ch-map[0].cpu = 0	ch-map[0].codec = 0
+ * ch-map[1].cpu = 1	ch-map[1].codec = 1
+ * ch-map[2].cpu = 2	ch-map[2].codec = 1
+ *
+ *-------------------------
+ * CPU0 <---> Codec0
+ * CPU1 <-+-> Codec1
+ *	  \-> Codec2
+ *
+ * ch-map[0].cpu = 0	ch-map[0].codec = 0
+ * ch-map[1].cpu = 1	ch-map[1].codec = 1
+ * ch-map[2].cpu = 1	ch-map[2].codec = 2
+ *
+ */
+struct snd_soc_dai_link_ch_map {
+	unsigned int cpu;
+	unsigned int codec;
 	unsigned int ch_mask;
 };
 
@@ -688,7 +725,9 @@ struct snd_soc_dai_link {
 	struct snd_soc_dai_link_component *codecs;
 	unsigned int num_codecs;
 
-	struct snd_soc_dai_link_codec_ch_map *codec_ch_maps;
+	/* num_ch_maps = max(num_cpu, num_codecs) */
+	struct snd_soc_dai_link_ch_map *ch_maps;
+
 	/*
 	 * You MAY specify the link's platform/PCM/DMA driver, either by
 	 * device name, or by DT/OF node, but not both. Some forms of link
@@ -775,6 +814,10 @@ struct snd_soc_dai_link {
 #endif
 };
 
+static inline int snd_soc_link_num_ch_map(struct snd_soc_dai_link *link) {
+	return max(link->num_cpus, link->num_codecs);
+}
+
 static inline struct snd_soc_dai_link_component*
 snd_soc_link_to_cpu(struct snd_soc_dai_link *link, int n) {
 	return &(link)->cpus[n];
@@ -808,6 +851,12 @@ snd_soc_link_to_platform(struct snd_soc_dai_link *link, int n) {
 		     ((cpu) = snd_soc_link_to_cpu(link, i));		\
 	     (i)++)
 
+#define for_each_link_ch_maps(link, i, ch_map)			\
+	for ((i) = 0;						\
+	     ((i) < snd_soc_link_num_ch_map(link) &&		\
+		      ((ch_map) = link->ch_maps + i));		\
+	     (i)++)
+
 /*
  * Sample 1 : Single CPU/Codec/Platform
  *
@@ -1163,6 +1212,7 @@ struct snd_soc_pcm_runtime {
 	     ((i) < (rtd)->dai_link->num_cpus + (rtd)->dai_link->num_codecs) &&	\
 		     ((dai) = (rtd)->dais[i]);				\
 	     (i)++)
+#define for_each_rtd_ch_maps(rtd, i, ch_maps) for_each_link_ch_maps(rtd->dai_link, i, ch_maps)
 
 void snd_soc_close_delayed_work(struct snd_soc_pcm_runtime *rtd);
 
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 3312ad8a563b..2faf7372bad0 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -570,16 +570,14 @@ int sdw_hw_params(struct snd_pcm_substream *substream,
 		  struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai_link_ch_map *ch_maps;
 	int ch = params_channels(params);
-	struct snd_soc_dai *codec_dai;
-	struct snd_soc_dai *cpu_dai;
 	unsigned int ch_mask;
 	int num_codecs;
 	int step;
 	int i;
-	int j;
 
-	if (!rtd->dai_link->codec_ch_maps)
+	if (!rtd->dai_link->ch_maps)
 		return 0;
 
 	/* Identical data will be sent to all codecs in playback */
@@ -605,13 +603,9 @@ int sdw_hw_params(struct snd_pcm_substream *substream,
 	 * link has more than one codec DAIs. Set codec channel mask and
 	 * ASoC will set the corresponding channel numbers for each cpu dai.
 	 */
-	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-		for_each_rtd_codec_dais(rtd, j, codec_dai) {
-			if (rtd->dai_link->codec_ch_maps[j].connected_cpu_id != i)
-				continue;
-			rtd->dai_link->codec_ch_maps[j].ch_mask = ch_mask << (j * step);
-		}
-	}
+	for_each_link_ch_maps(rtd->dai_link, i, ch_maps)
+		ch_maps->ch_mask = ch_mask << (i * step);
+
 	return 0;
 }
 
@@ -1350,15 +1344,17 @@ static int get_slave_info(const struct snd_soc_acpi_link_adr *adr_link,
 	return 0;
 }
 
-static void set_dailink_map(struct snd_soc_dai_link_codec_ch_map *sdw_codec_ch_maps,
+static void set_dailink_map(struct snd_soc_dai_link_ch_map *sdw_codec_ch_maps,
 			    int codec_num, int cpu_num)
 {
 	int step;
 	int i;
 
 	step = codec_num / cpu_num;
-	for (i = 0; i < codec_num; i++)
-		sdw_codec_ch_maps[i].connected_cpu_id = i / step;
+	for (i = 0; i < codec_num; i++) {
+		sdw_codec_ch_maps[i].cpu	= i / step;
+		sdw_codec_ch_maps[i].codec	= i;
+	}
 }
 
 static const char * const type_strings[] = {"SimpleJack", "SmartAmp", "SmartMic"};
@@ -1453,7 +1449,7 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 		*ignore_pch_dmic = true;
 
 	for_each_pcm_streams(stream) {
-		struct snd_soc_dai_link_codec_ch_map *sdw_codec_ch_maps;
+		struct snd_soc_dai_link_ch_map *sdw_codec_ch_maps;
 		char *name, *cpu_name;
 		int playback, capture;
 		static const char * const sdw_stream_name[] = {
@@ -1530,7 +1526,7 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 		dai_links[*link_index].nonatomic = true;
 
 		set_dailink_map(sdw_codec_ch_maps, codec_num, cpu_dai_num);
-		dai_links[*link_index].codec_ch_maps = sdw_codec_ch_maps;
+		dai_links[*link_index].ch_maps = sdw_codec_ch_maps;
 		ret = set_codec_init_func(card, adr_link, dai_links + (*link_index)++,
 					  playback, group_id, adr_index, dai_index);
 		if (ret < 0) {
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index b2bd45e87bc3..4ca3319a8e19 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1015,6 +1015,94 @@ static int soc_dai_link_sanity_check(struct snd_soc_card *card,
 	return -EINVAL;
 }
 
+#define MAX_DEFAULT_CH_MAP_SIZE 7
+static struct snd_soc_dai_link_ch_map default_ch_map_sync[MAX_DEFAULT_CH_MAP_SIZE] = {
+	{ .cpu = 0, .codec = 0 },
+	{ .cpu = 1, .codec = 1 },
+	{ .cpu = 2, .codec = 2 },
+	{ .cpu = 3, .codec = 3 },
+	{ .cpu = 4, .codec = 4 },
+	{ .cpu = 5, .codec = 5 },
+	{ .cpu = 6, .codec = 6 },
+};
+static struct snd_soc_dai_link_ch_map default_ch_map_1cpu[MAX_DEFAULT_CH_MAP_SIZE] = {
+	{ .cpu = 0, .codec = 0 },
+	{ .cpu = 0, .codec = 1 },
+	{ .cpu = 0, .codec = 2 },
+	{ .cpu = 0, .codec = 3 },
+	{ .cpu = 0, .codec = 4 },
+	{ .cpu = 0, .codec = 5 },
+	{ .cpu = 0, .codec = 6 },
+};
+static struct snd_soc_dai_link_ch_map default_ch_map_1codec[MAX_DEFAULT_CH_MAP_SIZE] = {
+	{ .cpu = 0, .codec = 0 },
+	{ .cpu = 1, .codec = 0 },
+	{ .cpu = 2, .codec = 0 },
+	{ .cpu = 3, .codec = 0 },
+	{ .cpu = 4, .codec = 0 },
+	{ .cpu = 5, .codec = 0 },
+	{ .cpu = 6, .codec = 0 },
+};
+static int snd_soc_compensate_channel_connection_map(struct snd_soc_card *card,
+						     struct snd_soc_dai_link *dai_link)
+{
+	struct snd_soc_dai_link_ch_map *ch_maps;
+	int i;
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
+	if (dai_link->num_cpus   > MAX_DEFAULT_CH_MAP_SIZE ||
+	    dai_link->num_codecs > MAX_DEFAULT_CH_MAP_SIZE) {
+		dev_err(card->dev, "soc-core.c needs update default_connection_maps");
+		return -EINVAL;
+	}
+
+	/* Compensate missing map for ... */
+	if (dai_link->num_cpus == dai_link->num_codecs)
+		dai_link->ch_maps = default_ch_map_sync;	/* for 1:1 or N:N */
+	else if (dai_link->num_cpus <  dai_link->num_codecs)
+		dai_link->ch_maps = default_ch_map_1cpu;	/* for 1:N */
+	else
+		dai_link->ch_maps = default_ch_map_1codec;	/* for N:1 */
+
+sanity_check:
+	dev_dbg(card->dev, "dai_link %s\n", dai_link->stream_name);
+	for_each_link_ch_maps(dai_link, i, ch_maps) {
+		if ((ch_maps->cpu   >= dai_link->num_cpus) ||
+		    (ch_maps->codec >= dai_link->num_codecs)) {
+			dev_err(card->dev,
+				"unexpected dai_link->ch_maps[%d] index (cpu(%d/%d) codec(%d/%d))",
+				i,
+				ch_maps->cpu,	dai_link->num_cpus,
+				ch_maps->codec,	dai_link->num_codecs);
+			return -EINVAL;
+		}
+
+		dev_dbg(card->dev, "  [%d] cpu%d <-> codec%d\n",
+			i, ch_maps->cpu, ch_maps->codec);
+	}
+
+	return 0;
+}
+
 /**
  * snd_soc_remove_pcm_runtime - Remove a pcm_runtime from card
  * @card: The ASoC card to which the pcm_runtime has
@@ -1121,8 +1209,13 @@ int snd_soc_add_pcm_runtimes(struct snd_soc_card *card,
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
index 4e2beda6f9bf..233ebc74c313 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4438,11 +4438,14 @@ static void soc_dapm_dai_stream_event(struct snd_soc_dai *dai, int stream,
 void snd_soc_dapm_connect_dai_link_widgets(struct snd_soc_card *card)
 {
 	struct snd_soc_pcm_runtime *rtd;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
-	int i;
 
 	/* for each BE DAI link... */
 	for_each_card_rtds(card, rtd)  {
+		struct snd_soc_dai_link_ch_map *ch_maps;
+		int i;
+
 		/*
 		 * dynamic FE links have no fixed DAI mapping.
 		 * CODEC<->CODEC links have no direct connection.
@@ -4450,39 +4453,15 @@ void snd_soc_dapm_connect_dai_link_widgets(struct snd_soc_card *card)
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
+		for_each_rtd_ch_maps(rtd, i, ch_maps) {
+			cpu_dai   = snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
+			codec_dai = snd_soc_rtd_to_codec(rtd, ch_maps->codec);
 
-			for_each_rtd_codec_dais(rtd, i, codec_dai) {
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
-			}
-		} else {
-			dev_err(card->dev,
-				"%s: codec number %d < cpu number %d is not supported\n",
-				__func__, rtd->dai_link->num_codecs, rtd->dai_link->num_cpus);
+			dapm_connect_dai_pair(card, rtd, codec_dai, cpu_dai);
 		}
 	}
 }
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 8c168dc553f6..7198f017c167 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1042,6 +1042,7 @@ static int __soc_pcm_hw_params(struct snd_soc_pcm_runtime *rtd,
 	}
 
 	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
+		struct snd_soc_dai_link_ch_map *ch_maps;
 		unsigned int ch_mask = 0;
 		int j;
 
@@ -1055,22 +1056,20 @@ static int __soc_pcm_hw_params(struct snd_soc_pcm_runtime *rtd,
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
-		}
+		for_each_rtd_ch_maps(rtd, j, ch_maps)
+			if (ch_maps->cpu == i)
+				ch_mask |= ch_maps->ch_mask;
 
 		/* fixup cpu channel number */
 		if (ch_mask)
 			soc_pcm_codec_params_fixup(&tmp_params, ch_mask);
 
-hw_params:
 		ret = snd_soc_dai_hw_params(cpu_dai, substream, &tmp_params);
 		if (ret < 0)
 			goto out;
@@ -2818,35 +2817,20 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 			}
 		}
 	} else {
+		struct snd_soc_dai_link_ch_map *ch_maps;
 		struct snd_soc_dai *codec_dai;
 
 		/* Adapt stream for codec2codec links */
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
-
-				cpu_id = rtd->dai_link->codec_ch_maps[i].connected_cpu_id;
-				cpu_dai = snd_soc_rtd_to_cpu(rtd, cpu_id);
-			} else {
-				dev_err(rtd->card->dev,
-					"%s codec number %d < cpu number %d is not supported\n",
-					__func__, rtd->dai_link->num_codecs,
-					rtd->dai_link->num_cpus);
-				return -EINVAL;
-			}
+		/*
+		 * see
+		 *	soc.h :: [dai_link->ch_maps Image sample]
+		 */
+		for_each_rtd_ch_maps(rtd, i, ch_maps) {
+			cpu_dai	  = snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
+			codec_dai = snd_soc_rtd_to_codec(rtd, ch_maps->codec);
 
 			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
 			    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
-- 
2.25.1

