Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4170562AD0
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Jul 2022 07:19:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F3F816E3;
	Fri,  1 Jul 2022 07:18:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F3F816E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656652789;
	bh=01NQJXt2kxWxl9F0muVUHkoWvUuziMPLuOHR8UNUbV4=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G/L735yGHNodgiOSS4tXlVRpSPzgIStntJXvDZlk73+puInlUY5JRNrCfYLWmn1In
	 T3+Q1Z+DnmngKoLzDGlf3Kmy4jd8Luc5B9CBZ2VLVKaw/H2xUeYfQH75AaZUTZItCb
	 R6gLXlMM3IrMsmtyoEE7/NcQ2HBBvk4bQEYATAQM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14ACDF80538;
	Fri,  1 Jul 2022 07:18:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5C4BF8053B; Fri,  1 Jul 2022 07:18:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2134.outbound.protection.outlook.com [40.107.113.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 259FAF80539
 for <alsa-devel@alsa-project.org>; Fri,  1 Jul 2022 07:18:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 259FAF80539
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="Ma5uYPkV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oVLL9HsKhAdH1eelMbJM2LD7LUVYsgpegGWaLJFbQxT/zfYEC/HyloEG9A77eaeVCrceLr8H/Bvq42oyxIZ+JZ0mrju8M3FRH3rPP9BbRq45YQc9ISFD4yGfcQWsojZYDUifMlA0KfXH5Z0QKjN3J+njFQCc6Bb6S53qLK6kZq4oHBNhJkZza30M58HmGTmHrnc6PFkC/4208f1fPyLZqFMTU8GHYGmpVXyxJPiuD1Ob7nloeYig4nE/mFVnBajlNcWz3wN6rjOkyl4+OirluV9ggt9PQ01GfMTKeaa6Qf/kyC92Fv8xpmjVE92z0vEIMB/RNHtRvjNf6VGmqWSJaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lY0if8P8IQ1dmlWZn8V9ThM3d67ZoxWmer/7dku+fyw=;
 b=exioaI9eLe/CcxrIeDjfwUJ2Mo6kHU1oki/IroY0xMlOb4XeCSWnNjQQRdAfLV+JXNviOseHKtoRf7B6I/wOdk+AShN5KP4+iSse5kfmls0q4gFMjAbkxdoh6j3CN8Q68y6+/p/yPqvWCD5GqxKEezGoIBek57iKnX/p2PHzvUR2/b1cpHKkaE13yMPRRR3zAAbDilsB0tMIX6LmDIUP8UMLgKffz4PVJssdodLFay5KXLmFOHxnh6SFE6YBxR6v239wIuEWq3UJbt3RmyQs8jsBiLvqRXT4ktH4lP5j4KkknSocfIId0p1ysde0r0VpYNS/di2g191cgBkchQ+DHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lY0if8P8IQ1dmlWZn8V9ThM3d67ZoxWmer/7dku+fyw=;
 b=Ma5uYPkV9SpdGX121kOT0PK1LEK+fEoBpbr2oawbsOYI63mouT9jFsChxRXoCEkTlLh4fxTKDjauQ48t1BaM6bjlXPxyGH9Ni3xH5GCrRWTmOQCItFYccqIqTsbbjcbppQrH35gOUKpgk6MaKqGv+PkdkSXx6L9XF5pDzNAXoLg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8838.jpnprd01.prod.outlook.com (2603:1096:400:17c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 1 Jul
 2022 05:18:21 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2%5]) with mapi id 15.20.5395.014; Fri, 1 Jul 2022
 05:18:21 +0000
Message-ID: <87fsjls95u.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/6] ASoC: audio-graph-card2.c: make Codec2Codec settings
 optional
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87ilohs96p.wl-kuninori.morimoto.gx@renesas.com>
References: <87ilohs96p.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 1 Jul 2022 05:18:21 +0000
X-ClientProxiedBy: TYCPR01CA0153.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::12) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1e207e3-3ed1-408f-c520-08da5b211da0
X-MS-TrafficTypeDiagnostic: TYWPR01MB8838:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2gReraXeyBnpWyyWR/48hARYXX1nCUREaTNuplMdhgudB6WF46zA0QUk8helCY1mWIW0u7JfVCdyKPxpefiURUHO6FY8ABV3mRyU+JZsLeq8IW1ABz6w0IE0L9QZa8p7mxanPsoo4PL58I8lvJQM3DXKge1NTTRTKWGiyaZUfNBOy4+xaIG0r6LxUTSMx8LPtuW/sst0ZlADrKIa1jaxPHdT7rGDekW1bxzCX83kpiue+0q/20/JikeObHVDze9ZB63mxV0Ah3pzY1C28CIfusaSf6nA2ywlh51AEQinT9I5wfgLYuFKzO/eYgypdrduVMDLdbnB0KZYhIWOHiOj8EOM5LkDkoEHo4Vk3CgG5aNzYgx08m3sE1fKBGx3hYsgXIirEOnJYhVQWX/kUpVuoeXRQuW0i9Zw9cbrKrHOpglDQT9i7YnkuOQiTkM0csAAsmuyM3lj9cTABppGsypzU+QHbzRIL4Wr7utYdcXybmDXGAdceqJzpfppB1UxfU3dvpXF0T5A0UzGBLcREL4UVNZNLZN/0KIkq/skjeClDgz+PJL5eno6oe4qsgCIx4hsMejeM79Srv/Whl0fK+e0wouU/OUaUlwmBb5LwYNZAAXKOjnwBaoGTvtyrPU1CLoZhQPrAgksYYmK5tf/wRZUjEZ4PjUKvxB2/ruGjFZY+WffiUaMGcTn0kxhqqbO5XQBp9OrECBDu0HPBRfsUupXicUurLhHuq9FHcMo9dmp5gS5sCFXOuhCQyI5Qd+i9pzOVRoUB2bb0sqHSi2hZti1FTuxWMpJQAWSjwmEwLeKZ8GKLy73yNIxV4Qm1MIHTfaF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(346002)(396003)(39860400002)(366004)(186003)(2616005)(2906002)(6486002)(478600001)(83380400001)(36756003)(8936002)(26005)(5660300002)(6916009)(316002)(66476007)(6512007)(38350700002)(8676002)(66946007)(38100700002)(86362001)(4326008)(66556008)(41300700001)(6506007)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SCILH1opdExtOtdNFzk1bC/Y+eeuYbKmBlzpVPxtf1rAJHE+Kz8/QFraaMMC?=
 =?us-ascii?Q?8t67dQD7oRZjGXVJfj/B34lld5eKgnynsA5O9JqBmadkW+MpbeSNpdm2Kaig?=
 =?us-ascii?Q?LUl1gFQYVdRR6XT3symX5oKtEelMY7jN7emKIl77Zsgzhy5qD3rmRmM+tWLd?=
 =?us-ascii?Q?dMuVyfp7ePh/hlkd1Ra/7D/dvXByfDvmbqgnYNJk2Da2OieutxwweCfPnGq4?=
 =?us-ascii?Q?HZ1mW12jg8V0gqbm+PHCxVOZO6UxZCIQuMFHaVnqfccrC0j5ogfEYHeUUx/r?=
 =?us-ascii?Q?bgC/m6G2wVQ1VcnB5V+F60EWM0ElZmR8UR+IPQ5dR59uXUFTW3f5NtpT+tMn?=
 =?us-ascii?Q?n7Pq7V/DFnT4IbX+K0CtcDEYm1swFJKMi8JwfhhlKIFrMXN3vB8NxFLTYLSN?=
 =?us-ascii?Q?vIDJ6Jd3vN19jdlDnMGdr7IeMCCRK/tiD8Oqd5OllooXZIIaJ11aDdpCqCvM?=
 =?us-ascii?Q?qGDFjs9YinLEgzoWcw361ehzEOo+g+Q6UayVBtjzVKWBk76LCoXn+3AcROq0?=
 =?us-ascii?Q?6nGTORj6lM8rHWqqkyFclmL/kIad4bZ5TGT30hl+t7gNlvsFv4YANssjjB3e?=
 =?us-ascii?Q?GCVzV9CA5jqBXu31LF0VAQeG/TwJDNKynymKDaTsI8wQmT3eGlTlaBg199Ys?=
 =?us-ascii?Q?SqrsozRPC1ptzw/9vz/CF6SbhJ2UhoTEmb3WvizWZqwW9aiGpqxCH7tceJ63?=
 =?us-ascii?Q?zFX6DxXIU3rzt+Xzse2/59uzbMYl+FWykcXAqOpquKHd0/Yw9zfBvGQQibou?=
 =?us-ascii?Q?wKBrL8ZTXLdpnUv6yyfgjcAyoKeuEE29Uiw1ULizMsXffPlCaxRmoT5Q9ehh?=
 =?us-ascii?Q?1jtFGGLC6osvNawzO6OobHCJBcSrLVfzGO+u/U9RFWYExWWKgX8GkFfUjnVh?=
 =?us-ascii?Q?in/RAKpQlFRSfakeSiHF88q4EqRRcUjcnNM5w/iYmZkvOzMupEo0QCcVzoTU?=
 =?us-ascii?Q?EYoFdOrz+oTs4juZDtZr7XFgRpVqhhV7uL4M72MJAsipxjPDNSFVSc01BoOG?=
 =?us-ascii?Q?WZny6PayWVLV8BCe8M8YgyWCygFGWriHwb7ZQGRPQKtEAQoNwIwl15gXreK1?=
 =?us-ascii?Q?8xBvVTSqJRN7EfITmJK0QBlR5f+QJiKCk19v3Ou9LmgA/yyOQdS2vVwL2sd6?=
 =?us-ascii?Q?SzXMYrZbSS8rKD+IIJQaQknaeNlRC1KRkDzzyPjvUrzYOIJ6fIF1MIUKeb30?=
 =?us-ascii?Q?g6hl/t+p7cwLI4MZklE/nMTEG6+a53AcQ3rtkSbTWsb7hulcCnSDCjexlPIe?=
 =?us-ascii?Q?gWraAkQzgEirZvY7iBJqqfRv79b/14a+Lnkc5f0oKKqKQzXnEVlNnYsHpOih?=
 =?us-ascii?Q?VqSVFQyKSTxMbENaiVw2Ff6DHT7AOdoyGRrG0T3gSAVJZnPb3XHZvKi4nGa2?=
 =?us-ascii?Q?alfE7pU4nXF31BhAJu5xeQ/On3gUbSU5LSgcJ6d255fHIwNqIHIebl/zacQM?=
 =?us-ascii?Q?xEI0DtYilP74PaNZGyOKrh7KkkOgXRGmIbMueZM603LjYRboZTa8TUiugDn9?=
 =?us-ascii?Q?QshysWM0iEnkqcwFENLKhjxVr0BOimG+HtmLtC+jpSQsgSlli2ErmZAYdTom?=
 =?us-ascii?Q?4hKUkEz5bxK1L7mKUAMwzwfgmzInE3nVbuJ2Xra56zC27nllxSEW3I2orRuM?=
 =?us-ascii?Q?J6/6MXHFaszJ4iUQHp+mqVU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1e207e3-3ed1-408f-c520-08da5b211da0
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 05:18:21.7813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OguVtuYE37t0BJmabk20xjAUsWQSO6ilD3EAtUqq78k5Vb3Z8RzY+ozZ5NXXgtw7jUP4z+FYkWI+boTkba1yh9ieaNz0syr8i58DLVeRLdpb4MhChXlALjkgfFAOC/Nn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8838
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current audio-graph-card2 can use Codec2Codec, and having its
original parameter (= rate) on DT is mandatory for now.

But simple-card-utils.c has asoc_simple_init_for_codec2codec() to
setup *default* Codec2Codec settings.

This patch makes Audio Graph Card2 Codec2Codec rate settings
optional.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../audio-graph-card2-custom-sample.dtsi      |  3 +-
 sound/soc/generic/audio-graph-card2.c         | 36 +++++++++++--------
 2 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2-custom-sample.dtsi b/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
index 8eee7b821ff7..053d987a1fec 100644
--- a/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
+++ b/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
@@ -154,11 +154,12 @@ ports@1 {
 
 		codec2codec {
 			ports@0 {
-				rate = <48000>;
+				/* use default settings */
 			c2c:	port@0 { c2cf_ep: endpoint { remote-endpoint = <&codec6_ep>; }; };
 				port@1 { c2cb_ep: endpoint { remote-endpoint = <&codec7_ep>; }; };
 			};
 			ports@1 {
+				/* use original settings */
 				rate = <48000>;
 			c2c_m:	port@0 { c2cmf_ep: endpoint { remote-endpoint = <&mc2c0_ep>; }; };
 				port@1 { c2cmb_ep: endpoint { remote-endpoint = <&mc2c1_ep>; }; };
diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 8e0628e6f2a0..510058c47a92 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -851,8 +851,6 @@ int audio_graph2_link_c2c(struct asoc_simple_priv *priv,
 			  struct link_info *li)
 {
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
-	struct simple_dai_props *dai_props = simple_priv_to_props(priv, li->link);
-	struct snd_soc_pcm_stream *c2c_conf = dai_props->c2c_conf;
 	struct device_node *port0, *port1, *ports;
 	struct device_node *codec0_port, *codec1_port;
 	struct device_node *ep0, *ep1;
@@ -880,21 +878,30 @@ int audio_graph2_link_c2c(struct asoc_simple_priv *priv,
 	ports = of_get_parent(port0);
 	port1 = of_get_next_child(ports, lnk);
 
+	/*
+	 * Card2 can use original Codec2Codec settings if DT has.
+	 * It will use default settings if no settings on DT.
+	 * see
+	 *	asoc_simple_init_for_codec2codec()
+	 *
+	 * Add more settings here if needed
+	 */
 	of_property_read_u32(ports, "rate", &val);
-	if (!val) {
-		struct device *dev = simple_priv_to_dev(priv);
-
-		dev_err(dev, "Codec2Codec needs rate settings\n");
-		goto err1;
+	if (val) {
+		struct simple_dai_props *dai_props = simple_priv_to_props(priv, li->link);
+		struct snd_soc_pcm_stream *c2c_conf = dai_props->c2c_conf;
+
+		c2c_conf->formats	= SNDRV_PCM_FMTBIT_S32_LE; /* update ME */
+		c2c_conf->rates		= SNDRV_PCM_RATE_8000_384000;
+		c2c_conf->rate_min	=
+		c2c_conf->rate_max	= val;
+		c2c_conf->channels_min	=
+		c2c_conf->channels_max	= 2; /* update ME */
+
+		dai_link->params	= c2c_conf;
+		dai_link->num_params	= 1;
 	}
 
-	c2c_conf->formats	= SNDRV_PCM_FMTBIT_S32_LE; /* update ME */
-	c2c_conf->rate_min	=
-	c2c_conf->rate_max	= val;
-	c2c_conf->channels_min	=
-	c2c_conf->channels_max	= 2; /* update ME */
-	dai_link->params	= c2c_conf;
-
 	ep0 = port_to_endpoint(port0);
 	ep1 = port_to_endpoint(port1);
 
@@ -923,7 +930,6 @@ int audio_graph2_link_c2c(struct asoc_simple_priv *priv,
 	of_node_put(ep1);
 	of_node_put(codec0_port);
 	of_node_put(codec1_port);
-err1:
 	of_node_put(ports);
 	of_node_put(port0);
 	of_node_put(port1);
-- 
2.25.1

