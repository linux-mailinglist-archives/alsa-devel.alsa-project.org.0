Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D29847D29C2
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 07:48:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAB2585D;
	Mon, 23 Oct 2023 07:48:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAB2585D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698040134;
	bh=rqeO6rkh8Pz8ZvHf1evLUSv1uI+kPsAXfRPD+4bcieU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KAgvH8USZ2O3wnaaSoghlhE3sdJyclzHiFmzHhrU/3vp5kgaTzURW9I/Rbev+70HK
	 Gzzu4RvBx/22O8IyXH2L8AJIRigGM1RFBDJIyHO2+m6BOJiyIlskwSwO6XV/SJkc8l
	 6ONOAycj9HYnLzkVQP8SuVAm0zmuQX6mPArUR7iE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4235BF8055A; Mon, 23 Oct 2023 07:47:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B08D9F8055A;
	Mon, 23 Oct 2023 07:47:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DD6FF80552; Mon, 23 Oct 2023 07:37:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0C22DF80027
	for <alsa-devel@alsa-project.org>; Mon, 23 Oct 2023 07:35:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C22DF80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=pyA1nW/s
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SYFBtsldnJPXHFgwbQjy+Ahmoe03mE0lgn/0LokCdrQFC3odxhMIHgY6KDo6efvNdS9yw0xAPlu5yjrhb4g+kWIAxMA+Cx0pU5J0ZI4CUMr5/bCFrnCPVjPa5FCVB1kt4HG/k/oiHMYr89m49MRKgp4Y55gpyj0HTeDr5HVUnP7xdQlECUbMRStFF3tTEOPhE7KDmuItJVRG0kCytPXuSmC0aPsEnm2deIhpUeYs5AhqFccpO9ygw4b6e26eOhdP1ZppUNf58uO6mxCWBm3EGqBXqAb2JwgTTDWmhcPdJ6ETkfPXFEpNi83rmkTLVj1uzN5CI4m41ZP3qhXDgucpMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rI6RK9hVG8ooCE31APybQRhzD8iezgQX1LQF114HS18=;
 b=jXO9dAnLGji5PCOXN2cUGmsdxUJYNGV49grcgjcF97yesdZQKrn0opkzH3xMI9nsBuUaIEXqzq8dl01dhYuXUFVQ0y37VnkM4KxVKlDZxS4l01wkSRi8LBIOXZzcn3njUZVshrk9d30dB3W3gEbpBT41M0B1bziNtJ1J9bCXApbA3dxDno5L7S6h4sOud3+0gcCflxHXS3kv4yIffhLst3Drkfr4GRRvEFjq6G0HZpJxZV2vyP86d2acIIbjN93g+zc93RkK9mU+3q+zKFhT3A5iDeWGsSeSQTT3hBu56PvS9SlHXKVXrxWL0oDEwAMQgQRaLJwJCKj/Z1gWHT1D4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rI6RK9hVG8ooCE31APybQRhzD8iezgQX1LQF114HS18=;
 b=pyA1nW/sHFN+qIjkSe+qJMiwaih9k+hjr/r5KAq1Ik9Eq0c18omKvZZspELkBqgrYyqr0OiRwRZips0Nn2VaB1Gc+/Ko9vJQDyl2iRIOAJy+yX0uCTooBNZ4sSna3CFuIvjcVN+Vpr+Ys8w8o0Xz89kX5OeNEwfWt7AAs/uh69c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8242.jpnprd01.prod.outlook.com (2603:1096:604:174::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Mon, 23 Oct
 2023 05:35:42 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::be8:b648:c989:8e7f]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::be8:b648:c989:8e7f%4]) with mapi id 15.20.6907.032; Mon, 23 Oct 2023
 05:35:42 +0000
Message-ID: <8734y1lx3m.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 1/5] ASoC: makes CPU/Codec channel connection map more
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
In-Reply-To: <874jihlx44.wl-kuninori.morimoto.gx@renesas.com>
References: <874jihlx44.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 23 Oct 2023 05:35:41 +0000
X-ClientProxiedBy: TYCP286CA0180.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8242:EE_
X-MS-Office365-Filtering-Correlation-Id: 8984d36c-f2dc-4ad0-37de-08dbd389e584
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sIcZQVAVjrLjrbJhAS6XtITuJ29OxiiLfangaYuCf9QDSuh11gyIs+fsxLL/raBOW4rDE9obFcuwm3/MwJg1s2JoieGToCy7LMrsCXiIESD6mSJ6Xaahs6mmarHt4q4J9pYtxJaAInw25EFzyPq+ZQvJZJM6deNVRjmgg7D8Qm1y6cGD+85nRLRjpKdUXuJ75kVRpxzi4JoDbMNKN0Fk5bWnhw358ys7UmFa9Y7ope13BikEdIN9YbJY89QRzfvZGPfO2jsKYfPEJLUP2dvLPnZhxg0qEQnKytykih+XSIIpsXaBaw8g97xL5xP9zkjjS2GDs6HUwkol4fIO6iyGvwdBNh6076OfXZxq5vAkfxmT/B0PJ5TWzGi5eENoCsIhKj9KsToh18tpjUKBzsXWxPUjwZYIs+wb6mFNT6RP0v0nTM95OBdpPDM6mXm6Lu2HeIvdlNBpp0E8NDMf4c/jy5AaA+eW+0QU/AyS5gCju/lRWMe/9gwVSD7/U8niSXlmiTnVBzwAr1RSV/+uEGuwTLr5Rk4LqgP5WgV0hl8SygoNooMkyRcTBuQ+B6dbKFxTU3bNBcx2Qr42J8vNMVS9cJspCr0t8CzGZ6V9oEEnLhE7VWWqOkGC1qg8EheN1MSI3XXBbQA/Z9NFlJhCNnw19k95X9O92gy9YIpdXfwkcCI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(346002)(39860400002)(376002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(38350700005)(36756003)(38100700002)(66476007)(66946007)(66556008)(110136005)(6512007)(86362001)(2616005)(26005)(52116002)(83380400001)(6506007)(2906002)(6486002)(7416002)(316002)(478600001)(8676002)(41300700001)(8936002)(966005)(4326008)(30864003)(5660300002)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qPx+YIL7+yw3aBPnily50jB/iiBYts6T7xlTrxh4btivkZsHzLTBr+lAqOuH?=
 =?us-ascii?Q?ZYkIqKirMsSrDGuxnmB8T0IBUiAO0tTjuXVyeo/qVJuUXC1vfLJzlzFSvhFI?=
 =?us-ascii?Q?xXrPdxjHrh4g8WZnWf40TofqfpjpagJHkAemZblOknO+o1ApZ6IyooXHus3U?=
 =?us-ascii?Q?hEjVKaML2SIHbHyEteSMSMY3YD00qtVLNjm7jBGk6qYdvgVqMM64Zh8AxqOq?=
 =?us-ascii?Q?gziLguCNUy4R5/mZGDbVWNbd75fpEz9REV6Cr7DoKoKWath8YWALLnJ2yGqd?=
 =?us-ascii?Q?J4+f2n9Ott4plQ7TmtDEWpYIaVQjsDz0im1jezqujGYDL6WDtsXTcy2nnRB8?=
 =?us-ascii?Q?4aHj7lQ82/FpB0P23EoFRTWPfA0BH7l1DH4wo+pgBZ2Y6Wt0Q1lN0DruRF4J?=
 =?us-ascii?Q?MMjLqtH0hPxpqUu5VQMGJogn4tz0A6Tdb1+pgb/4+OKboV97CeHnwDZY8mem?=
 =?us-ascii?Q?TBotAtD8SmCs0DLmdnO4szcQe0VUufnxv7WeJOR/eoLrdH6wLrdVFPcx2PkC?=
 =?us-ascii?Q?iWGBWs75k6yRRt1rkDMrQOJHbKtYbGFHatpHP/avZ7JHl6CJGv+pTOZ5NhTe?=
 =?us-ascii?Q?sj/4Bz3yjn2jgCgTop0Y1h35Xzz+PzG0hw4nlxeeRNV2rCdUQeT/BiQKFydT?=
 =?us-ascii?Q?T3VTnQU/xmETwcx3nvEU/xLpmBDkK+ARZeYon0VExO4MElJRJpcwk8rnZC5V?=
 =?us-ascii?Q?AmowzXpd5ecSa8p25z/9NvyBRwfNcDAwRWNnn2GIATvey/9N6KSF00vr3Cxv?=
 =?us-ascii?Q?li7BiKnBkQpbDob5p4AIp56Alx93Y02H7bL39SPrBgDBpv51E8RIqjNcUUB6?=
 =?us-ascii?Q?ZNSvmBHpNXLIwDud2T5BJ1zzV4TLiJxYvTtEPv+HJCWwXnKHY9mgbx71wbP0?=
 =?us-ascii?Q?IkkiOOca7E/VXftOww8a+zisFzjwaQuG+6zKnlJ9vYB/ly4c/Z2hshjsZZ0K?=
 =?us-ascii?Q?VqOl1fEZhxnhs/EvNpQuDW46TnCAkzwIXo5epHntg/JBU+lNuX4uWr2W4j+q?=
 =?us-ascii?Q?eHO/1DvGZOs6Jaaya+PQXMGAUUKeDN+jRqJZTJxOPT8YN+Ehv2PQ3uPhW8BI?=
 =?us-ascii?Q?U9kAkXylgBGswMShYxn8UPHgm6hLT5RZoj2S+P7IXSQz7GOj8cx5ZXUEo9N2?=
 =?us-ascii?Q?g73agMCliXcIJZ+uJ6ffTJs56LpL/EaPH48mSFPz6BvxXz9A9ThTCNQK+9qT?=
 =?us-ascii?Q?JRjj7331d9t9jGO/dFsmimETAjb6aLWRb3jFZHK7u3rvUyTJlIHGxp2pl2wA?=
 =?us-ascii?Q?lywjusEajf8scwgh5HqzxOj4IzmEo+390W9FMBCeeeSnviRq5/hm6n8GTeQt?=
 =?us-ascii?Q?ltzZuDuaVp+SCLMqVpPlAOrxhsxBeKrBpbod7Q6cvhC0fX1U88hfm+iR7knF?=
 =?us-ascii?Q?KWV+h+mPlG1K9EpXvNv3UFLD0x+JAgfCf7qqsZM2hn25Tzlxbr4cUu++oyTR?=
 =?us-ascii?Q?FT6V2nh04DfAn2O8tPOAWXYK5qpRzdQFfiIO6JjzWOtU7z3b56EjJY3XlfRG?=
 =?us-ascii?Q?9YGx2rX1uCB0RQGJ6LnfI4G2YW+yLSPVcVAFo140T/nagItoFwpCRytx8UCM?=
 =?us-ascii?Q?M/VXHeNOtxUj+YOTaTRhiKiemC55nv+wqmapCZgAgCsbSj++mB3ye7fnemsd?=
 =?us-ascii?Q?g8ItQ8nEquuDL2vnht0Qekc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8984d36c-f2dc-4ad0-37de-08dbd389e584
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 05:35:42.3576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 cJRmwUbwLTXPpn3g6BEs/tnyVoVxAHyhNwaw5VJ/mH+R6TnxthlVom7jfivWVLb4B0L2Ivvc8VuIbxSjdw9citxavAz+EC7Xpgly435MsdZ2HEtOwdowbAfcbUxYZbbE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8242
Message-ID-Hash: DYNK6PB6D7XPULK3WOZZ4NQP7E7L5C7O
X-Message-ID-Hash: DYNK6PB6D7XPULK3WOZZ4NQP7E7L5C7O
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DYNK6PB6D7XPULK3WOZZ4NQP7E7L5C7O/>
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
---
 include/sound/soc.h              | 55 +++++++++++++++++-
 sound/soc/intel/boards/sof_sdw.c | 28 ++++-----
 sound/soc/soc-core.c             | 97 +++++++++++++++++++++++++++++++-
 sound/soc/soc-dapm.c             | 45 ++++-----------
 sound/soc/soc-pcm.c              | 44 +++++----------
 5 files changed, 186 insertions(+), 83 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 63b57f58cc56..2eb93e357789 100644
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
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 226a74a4c340..d62b3b46297f 100644
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
index c305e94762c3..a55fea23f871 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1015,6 +1015,96 @@ static int soc_dai_link_sanity_check(struct snd_soc_card *card,
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
+	int i, max;
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
+	max = min(dai_link->num_cpus, dai_link->num_codecs);
+
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
@@ -1121,8 +1211,13 @@ int snd_soc_add_pcm_runtimes(struct snd_soc_card *card,
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
index 2512aadf95f7..770768f4a027 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4426,11 +4426,14 @@ static void soc_dapm_dai_stream_event(struct snd_soc_dai *dai, int stream,
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
@@ -4438,39 +4441,15 @@ void snd_soc_dapm_connect_dai_link_widgets(struct snd_soc_card *card)
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
+		for_each_link_ch_maps(rtd->dai_link, i, ch_maps) {
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
index 8c168dc553f6..c434fc19e253 100644
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
+		for_each_link_ch_maps(rtd->dai_link, j, ch_maps)
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
+		for_each_link_ch_maps(dai_link, i, ch_maps) {
+			cpu_dai	  = snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
+			codec_dai = snd_soc_rtd_to_codec(rtd, ch_maps->codec);
 
 			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
 			    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
-- 
2.25.1

