Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1913E6FBBA3
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 01:54:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FF9F1195;
	Tue,  9 May 2023 01:53:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FF9F1195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683590063;
	bh=SLu4F0J0Vfoqmg+kzeXh7/rfBBodIn15aRMezmeFir4=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MKvc+Us/Ybv33AV/s0nGev6CU109jpJScOwBGjopa2JoVprmqVJv+e4F/acJDjVc8
	 rwL+QKDXsNMa4Yp9z9wf2wG3cqMOT8d4anUg3TiJuhqlI1skC1cplm+/4msQj8mmqq
	 4fI+3rlKFun0qqa741iOPILAfpLGPGJyQA1MWSdQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69EB6F80579;
	Tue,  9 May 2023 01:52:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5394CF80570; Tue,  9 May 2023 01:52:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2071f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::71f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 350F7F80217
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 01:52:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 350F7F80217
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=YECHitir
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WTqf6ZdUFYaX+9OQbZfjPiv7biPPHRAnhXgF9hTFH/cugQ8Im4LL80XbxgnoEYNMI7BEYUREYS6Cs1rq7uG2ayDbumHNMezG//Ghd1cKulq7hyVYOGdky3JugKzsdpaccUu388QpT7AulbbolS30wl9iR7XpnzzWbfb1XCs0K+ztlhDK11AjmOn1BzumymBb2vtOLBpWFF+BdcpFqoOyJGEVS5VEZMgUgEE1sEI/cbAU1TPKgdX8PU/7+Nqfa7wxFK7XFOzSQ62p2l3bQgVpHVzD52p3vtQSBEZDAbw7Gq0JUF2OTCWyGCcRWg17iiu/IfNPGTo1hMwWyiSyuNfJLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BMS9TN69tq70W6Bk47i0zECTBT5WEmlCDKQxzNA7mLM=;
 b=TxPOHJ4ceEZQ57OVP6CkwRbka/EsuGHH4qHhp1gx2mLsPNnzz7JYCA7xZbPYiq5l7sLel7wBiLRVp8rxDDq4vdcx1ttJy+3q5wGnZ4eyCAgRA0VJJJvp7vfPyE41ezxsqueuU3VFZ5nE1ubKbMFkvsjRHdvsv6Jp4n/PREhsRR1RkLWwdImORpbvU7EMyZgSYLETZsQQxtmqyiOWFYaQ4bC4sWe9CnY2gLn1FH30G/MzC7udiNFFGAc3icx6AHcY2TSF5KArUK75lLFrX1vFrTTJR3mMH2N0kB+h0e7rnEl4Xmvh2HxFfXYPXxPhLwJ/ZhkCQzH6WWB19GiKcBLQsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMS9TN69tq70W6Bk47i0zECTBT5WEmlCDKQxzNA7mLM=;
 b=YECHitir9qLz6OSLugqO8IyApNZITFny+gdUelM4oNI7TVSvJZJso6Wo7AdDbCen5+O57XLOcMLHxlxHrFN3qKtu1Aku77CEve73qS6nyJ9PFUCh8Im2sph40HffJw7nNify/eYTPDeiswdmq5bzycVqG97+BYKoV4q85SHKSgI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8249.jpnprd01.prod.outlook.com (2603:1096:400:183::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Mon, 8 May
 2023 23:52:13 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6363.031; Mon, 8 May 2023
 23:52:13 +0000
Message-ID: <871qjql6tv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Brent Lu <brent.lu@intel.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>
In-Reply-To: <87fs86l6y8.wl-kuninori.morimoto.gx@renesas.com>
References: <87fs86l6y8.wl-kuninori.morimoto.gx@renesas.com>
Subject: [RESEND][PATCH v2 10/13] ASoC: intel: sof: use asoc_dummy_dlc
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 8 May 2023 23:52:13 +0000
X-ClientProxiedBy: TYAPR01CA0211.jpnprd01.prod.outlook.com
 (2603:1096:404:29::31) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB8249:EE_
X-MS-Office365-Filtering-Correlation-Id: 59ae7d3d-3ece-4324-2b5f-08db501f3ee3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	58gpJDKNLP33ZugNNGGWzbvk8GFH0GdaERTIESYkrnN/HNkG1M7iMqtF0TDyaANEGnWAOAG4yJu1+MTGxDxc58jvq1Fyfi9HA48vu5hyYRMkaCxEykfHwUnouyspabIqOOGlczAW1NjOlC2MgS6eZZ0ubBx4DlJK2C/ikJgyOGIQmVbk5rRNfvrXiPIcLRpfAg81dddBulGi1s9AiMQn/p4gubaXg7iDCN7LqeRCA5XfUIYqmi2E+MKX3lSL9KKDHW0hsSAGoia0ZOFtcjtMF1Zni55/4KnksAG0iAe+M393ivlexwACyybBz6I1/IWiyO1w8Y4yjmcteFKyeOwM7lnUN1t5DcflJu7Ovz60RP/9TAE4eGV1YgYrnrM02diwzhhl1E4v9vH04PmjT3T6XIbjoGccKXG/fvihySm7ziF72a+Y5Vx56Q5RfwxsoB7ouB9Ek4XkSL9eAHzpuw6Tu2DeSt1u3T+EL+isWxmzB+IAvDopu8Ls6c315iXWQyb2gULgBgbtUdEUhAkR/EbfceMjgSYP6UcgUl+LWvtmpRMEUMfAeKg4L0mHZYbnjwIqy5lXQG12IrnDqDJ9EL2ZCIW99wWaTKb6sHeunPyQW0WTcaJxz/gNtMCs0AT4msch8N402gsZ872pv6l8QWnB0w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(396003)(39860400002)(376002)(451199021)(4326008)(110136005)(52116002)(86362001)(316002)(66556008)(66476007)(41300700001)(6486002)(66946007)(8936002)(8676002)(5660300002)(478600001)(7416002)(36756003)(6512007)(26005)(6506007)(38350700002)(2906002)(186003)(921005)(38100700002)(2616005)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OnmsIHAtjOS0aCFqETvOXrlQXsUGO1Kur7CvKzAZVVfyhLA3EFQX/oOI8ysd?=
 =?us-ascii?Q?uRS1VlFHDkkVNdGPJz/RTMRnx0cbwmkircHf8GVbN/JVlwfE2tWH7yNUyf3x?=
 =?us-ascii?Q?rDKCgMDoIoY2gGEwzeeWRd7fVpBS8wp2cOA8OtA/gU9Y4z/rtCBBNnidA8iq?=
 =?us-ascii?Q?BvTM4eIG3nfNtBf0n0onoK+1z36TAedE3+DyxNJ/K4JcRDQU8GYScYJIHmzN?=
 =?us-ascii?Q?CCBCJvUEgGKapZSlFjojhXlNn9QVYRBvY2qLBMkjctPRG9lPKWBIPR0lLrpJ?=
 =?us-ascii?Q?76ZqjY0llukw4u0dNllAGcVtMpZ7P4CnWKUvWqvw3CjsPLFMdZMksutjkBQ6?=
 =?us-ascii?Q?/LpxVBuf0nYveUU5ynQx74zfmV0Ipy/OFsdNp4a5QiQWsW+gw1hAlRkP2IF/?=
 =?us-ascii?Q?wVWms754wcUdr1N5klajjW0I0d/WxgD8pj8v5sT4EGdZxXF1CRqagvTbyi3x?=
 =?us-ascii?Q?OrnyB1S6JjB9LsqKO4n8Pv2ChzLDPvgBnc5fr49l1Zrn32rKL9XyWf6uycD+?=
 =?us-ascii?Q?xSBwOEEbAkc+dGbSFJDQom9vSxBxaWx/El6dLXB+YywAxrRpqoW97DLr5iLN?=
 =?us-ascii?Q?4HD1vqBEmwczl5EuCUJznx2HXwy4nD8GsL42uaI4/mj4o4UJs+walb69hV1I?=
 =?us-ascii?Q?xjLW0rX51GeeyK3S8q2I8t1JBs/YDG9+ljeLrSwdLj2NvK9dddqf8P0ju3+n?=
 =?us-ascii?Q?Vv6qeKQsPeRPc81SmJY3nUCBYaz/RojWY23C+JhoDdh/sobgN8xrA8dXxEyC?=
 =?us-ascii?Q?PW5rRDHcaczCwsHlM+ymXXXgI9T0UGg+Znd5//dFjLZs1QkXftOphDLpGEa+?=
 =?us-ascii?Q?bAD3IEgMBAIP1y3vIlSFky9ym1vW/VW+zb15vkDTWX4qL8LWPXWh6PC9by/Q?=
 =?us-ascii?Q?uNhuulEP0LuIzU8ZqQ2SK/kc31nOGEW08kP6sbx0yqd3xC6SYCeBy5yMMqQv?=
 =?us-ascii?Q?JnK9ozhW3MBFh9duYkB/npcsi3I4kvvOkeQH5lI2GpYoXir4vZZ1sukKKOkA?=
 =?us-ascii?Q?jaApJve795tYnOnKGY4uoaQMMuCRSf42NUYsqm7rquly1NKKciH2Gijq+gak?=
 =?us-ascii?Q?D8r1CB/bnZU/yaEQTlpqeB0/7w3DtXQZ1zhzak8imryC6smNZTjNIQwK0llv?=
 =?us-ascii?Q?+Y8LihOUHqoiLfBNgk/sisaEJgYvDBAb1cXyGwBHv24VvSL9Y5XWcOEl/xAb?=
 =?us-ascii?Q?el3dJllgNPJm1b93BU6i6OVeWY93XBRMRfr37Amdp+D1ZgVgj+BN7W7IRgMy?=
 =?us-ascii?Q?yCuVsAlVb+jELClfOsQRL+Ww8yh73F3e4YVGW1CB+lS5LR+R8ZNFRjgszBZh?=
 =?us-ascii?Q?muiSnn/KyfhxHYu2Z1PJdV2N+ZfluWlAHlDLEM+UeCUWhncFFySlLxCw1+zL?=
 =?us-ascii?Q?6lHp4eC6hef8rN+bnmEGInGljlq34VZYW87S/KDDQ5/Q/PxBY01uELCSKArE?=
 =?us-ascii?Q?p7drb+vlX+eTxcLBQLDXWiJFqJ9X/JVkT55Hjq8DwpoSMiPWdpvEeoPRGoYy?=
 =?us-ascii?Q?UCAKvS2vI6LTgzWmRXQq0WaIXFrmDlj7FQDgtWu8mrybjtwKrQOogyaDN2lc?=
 =?us-ascii?Q?QrBrgkW8Bpz7zAc0HNZTdHUUFq23gvaZOsx4wOHssY5Z0g31vsqxXYBHaGJs?=
 =?us-ascii?Q?6VYqiHLMUkM0H8dqAR1vhFU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 59ae7d3d-3ece-4324-2b5f-08db501f3ee3
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 23:52:13.3852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 3g3NhjMctzKdNIh1Z2Hf7iR7bVGwgJm6coGj13c4+ZEX5/yEzX8tdQUG0XsZoR5gIKvZEnqmjf7CfGvV+BXJ6jThQOAFhNH9KmPHOiKP+A68y6gES8nc5516i7rfX2x8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8249
Message-ID-Hash: MSR6W3T4566FYHU4ACOA7Z6AWEP4QZP2
X-Message-ID-Hash: MSR6W3T4566FYHU4ACOA7Z6AWEP4QZP2
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MSR6W3T4566FYHU4ACOA7Z6AWEP4QZP2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now we can share asoc_dummy_dlc. This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/boards/ehl_rt5660.c  |  8 ++------
 sound/soc/intel/boards/sof_cs42l42.c | 11 ++---------
 sound/soc/intel/boards/sof_es8336.c  | 11 ++---------
 sound/soc/intel/boards/sof_nau8825.c | 11 ++---------
 sound/soc/intel/boards/sof_pcm512x.c |  3 +--
 sound/soc/intel/boards/sof_rt5682.c  | 14 +++-----------
 sound/soc/intel/boards/sof_sdw.c     | 13 ++-----------
 sound/soc/intel/boards/sof_ssp_amp.c | 18 +++++-------------
 8 files changed, 19 insertions(+), 70 deletions(-)

diff --git a/sound/soc/intel/boards/ehl_rt5660.c b/sound/soc/intel/boards/ehl_rt5660.c
index d5235c294c4c..fee80638cba2 100644
--- a/sound/soc/intel/boards/ehl_rt5660.c
+++ b/sound/soc/intel/boards/ehl_rt5660.c
@@ -254,7 +254,6 @@ static void hdmi_link_init(struct snd_soc_card *card,
 			   struct sof_card_private *ctx,
 			   struct snd_soc_acpi_mach *mach)
 {
-	struct snd_soc_dai_link *link;
 	int i;
 
 	if (mach->mach_params.common_hdmi_codec_drv &&
@@ -267,11 +266,8 @@ static void hdmi_link_init(struct snd_soc_card *card,
 	 * if HDMI is not enabled in kernel config, or
 	 * hdmi codec is not supported
 	 */
-	for (i = HDMI_LINK_START; i <= HDMI_LINE_END; i++) {
-		link = &card->dai_link[i];
-		link->codecs[0].name = "snd-soc-dummy";
-		link->codecs[0].dai_name = "snd-soc-dummy-dai";
-	}
+	for (i = HDMI_LINK_START; i <= HDMI_LINE_END; i++)
+		card->dai_link[i].codecs[0] = asoc_dummy_dlc;
 }
 
 static int snd_ehl_rt5660_probe(struct platform_device *pdev)
diff --git a/sound/soc/intel/boards/sof_cs42l42.c b/sound/soc/intel/boards/sof_cs42l42.c
index e9d190cb13b0..e6695e77d594 100644
--- a/sound/soc/intel/boards/sof_cs42l42.c
+++ b/sound/soc/intel/boards/sof_cs42l42.c
@@ -296,13 +296,6 @@ static struct snd_soc_dai_link_component dmic_component[] = {
 	}
 };
 
-static struct snd_soc_dai_link_component dummy_component[] = {
-	{
-		.name = "snd-soc-dummy",
-		.dai_name = "snd-soc-dummy-dai",
-	}
-};
-
 static int create_spk_amp_dai_links(struct device *dev,
 				    struct snd_soc_dai_link *links,
 				    struct snd_soc_dai_link_component *cpus,
@@ -510,8 +503,8 @@ static int create_bt_offload_dai_links(struct device *dev,
 		goto devm_err;
 
 	links[*id].id = *id;
-	links[*id].codecs = dummy_component;
-	links[*id].num_codecs = ARRAY_SIZE(dummy_component);
+	links[*id].codecs = &asoc_dummy_dlc;
+	links[*id].num_codecs = 1;
 	links[*id].platforms = platform_component;
 	links[*id].num_platforms = ARRAY_SIZE(platform_component);
 
diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index adf5852b2c9a..d6c38d8ea2ff 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -393,13 +393,6 @@ static struct snd_soc_dai_link_component dmic_component[] = {
 	}
 };
 
-static struct snd_soc_dai_link_component dummy_component[] = {
-	{
-		.name = "snd-soc-dummy",
-		.dai_name = "snd-soc-dummy-dai",
-	}
-};
-
 static int sof_es8336_late_probe(struct snd_soc_card *card)
 {
 	struct sof_es8336_private *priv = snd_soc_card_get_drvdata(card);
@@ -572,8 +565,8 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 			if (!links[id].name)
 				return NULL;
 			links[id].id = id + hdmi_id_offset;
-			links[id].codecs = dummy_component;
-			links[id].num_codecs = ARRAY_SIZE(dummy_component);
+			links[id].codecs = &asoc_dummy_dlc;
+			links[id].num_codecs = 1;
 			links[id].platforms = platform_component;
 			links[id].num_platforms = ARRAY_SIZE(platform_component);
 			links[id].dpcm_capture = 1;
diff --git a/sound/soc/intel/boards/sof_nau8825.c b/sound/soc/intel/boards/sof_nau8825.c
index 6794a0249a9a..30e798431e1f 100644
--- a/sound/soc/intel/boards/sof_nau8825.c
+++ b/sound/soc/intel/boards/sof_nau8825.c
@@ -346,13 +346,6 @@ static struct snd_soc_dai_link_component nau8318_components[] = {
 	}
 };
 
-static struct snd_soc_dai_link_component dummy_component[] = {
-	{
-		.name = "snd-soc-dummy",
-		.dai_name = "snd-soc-dummy-dai",
-	}
-};
-
 static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 							  int ssp_codec,
 							  int ssp_amp,
@@ -532,8 +525,8 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		links[id].name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-BT", port);
 		if (!links[id].name)
 			goto devm_err;
-		links[id].codecs = dummy_component;
-		links[id].num_codecs = ARRAY_SIZE(dummy_component);
+		links[id].codecs = &asoc_dummy_dlc;
+		links[id].num_codecs = 1;
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
 		links[id].dpcm_playback = 1;
diff --git a/sound/soc/intel/boards/sof_pcm512x.c b/sound/soc/intel/boards/sof_pcm512x.c
index 5192e02b3cee..9f673ccf81b5 100644
--- a/sound/soc/intel/boards/sof_pcm512x.c
+++ b/sound/soc/intel/boards/sof_pcm512x.c
@@ -331,8 +331,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 				devm_kasprintf(dev, GFP_KERNEL,
 					       "intel-hdmi-hifi%d", i);
 		} else {
-			idisp_components[i - 1].name = "snd-soc-dummy";
-			idisp_components[i - 1].dai_name = "snd-soc-dummy-dai";
+			idisp_components[i - 1] = asoc_dummy_dlc;
 		}
 		if (!idisp_components[i - 1].dai_name)
 			goto devm_err;
diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 791a59c5f00d..7f4783592668 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -607,13 +607,6 @@ static struct snd_soc_dai_link_component dmic_component[] = {
 	}
 };
 
-static struct snd_soc_dai_link_component dummy_component[] = {
-	{
-		.name = "snd-soc-dummy",
-		.dai_name = "snd-soc-dummy-dai",
-	}
-};
-
 #define IDISP_CODEC_MASK	0x4
 
 static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
@@ -745,8 +738,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 			if (!idisp_components[i - 1].dai_name)
 				goto devm_err;
 		} else {
-			idisp_components[i - 1].name = "snd-soc-dummy";
-			idisp_components[i - 1].dai_name = "snd-soc-dummy-dai";
+			idisp_components[i - 1] = asoc_dummy_dlc;
 		}
 
 		links[id].codecs = &idisp_components[i - 1];
@@ -841,8 +833,8 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		links[id].name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-BT", port);
 		if (!links[id].name)
 			goto devm_err;
-		links[id].codecs = dummy_component;
-		links[id].num_codecs = ARRAY_SIZE(dummy_component);
+		links[id].codecs = &asoc_dummy_dlc;
+		links[id].num_codecs = 1;
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
 		links[id].dpcm_playback = 1;
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 6faf4a43eaf5..c845a5cf7f4d 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1488,8 +1488,7 @@ static int sof_card_dai_links_create(struct device *dev,
 			if (!idisp_components[i].dai_name)
 				return -ENOMEM;
 		} else {
-			idisp_components[i].name = "snd-soc-dummy";
-			idisp_components[i].dai_name = "snd-soc-dummy-dai";
+			idisp_components[i] = asoc_dummy_dlc;
 		}
 
 		cpu_name = devm_kasprintf(dev, GFP_KERNEL,
@@ -1514,21 +1513,13 @@ static int sof_card_dai_links_create(struct device *dev,
 		if (!name)
 			return -ENOMEM;
 
-		ssp_components = devm_kzalloc(dev, sizeof(*ssp_components),
-						GFP_KERNEL);
-		if (!ssp_components)
-			return -ENOMEM;
-
-		ssp_components->name = "snd-soc-dummy";
-		ssp_components->dai_name = "snd-soc-dummy-dai";
-
 		cpu_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", port);
 		if (!cpu_name)
 			return -ENOMEM;
 
 		cpus[cpu_id].dai_name = cpu_name;
 		init_dai_link(dev, links + link_index, be_id, name, 1, 1,
-				cpus + cpu_id, 1, ssp_components, 1, NULL, NULL);
+				cpus + cpu_id, 1, &asoc_dummy_dlc, 1, NULL, NULL);
 	}
 
 	card->dai_link = links;
diff --git a/sound/soc/intel/boards/sof_ssp_amp.c b/sound/soc/intel/boards/sof_ssp_amp.c
index ffd9c583dab1..b33f720b3e6d 100644
--- a/sound/soc/intel/boards/sof_ssp_amp.c
+++ b/sound/soc/intel/boards/sof_ssp_amp.c
@@ -167,13 +167,6 @@ static struct snd_soc_dai_link_component dmic_component[] = {
 	}
 };
 
-static struct snd_soc_dai_link_component dummy_component[] = {
-	{
-		.name = "snd-soc-dummy",
-		.dai_name = "snd-soc-dummy-dai",
-	}
-};
-
 static int sof_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
@@ -233,8 +226,8 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 			if (!links[id].name)
 				return NULL;
 			links[id].id = id;
-			links[id].codecs = dummy_component;
-			links[id].num_codecs = ARRAY_SIZE(dummy_component);
+			links[id].codecs = &asoc_dummy_dlc;
+			links[id].num_codecs = 1;
 			links[id].platforms = platform_component;
 			links[id].num_platforms = ARRAY_SIZE(platform_component);
 			links[id].dpcm_capture = 1;
@@ -331,8 +324,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 				if (!idisp_components[i - 1].dai_name)
 					goto devm_err;
 			} else {
-				idisp_components[i - 1].name = "snd-soc-dummy";
-				idisp_components[i - 1].dai_name = "snd-soc-dummy-dai";
+				idisp_components[i - 1] = asoc_dummy_dlc;
 			}
 
 			links[id].codecs = &idisp_components[i - 1];
@@ -360,8 +352,8 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		links[id].name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-BT", port);
 		if (!links[id].name)
 			goto devm_err;
-		links[id].codecs = dummy_component;
-		links[id].num_codecs = ARRAY_SIZE(dummy_component);
+		links[id].codecs = &asoc_dummy_dlc;
+		links[id].num_codecs = 1;
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
 		links[id].dpcm_playback = 1;
-- 
2.25.1

