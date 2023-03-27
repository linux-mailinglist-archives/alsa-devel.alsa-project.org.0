Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F53D6C9900
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 02:36:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF40C9F6;
	Mon, 27 Mar 2023 02:35:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF40C9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679877376;
	bh=6DJQvhdOnkgJK88KOynfosEQAHlo8jtuC+gAvJwbkRM=;
	h=From:Subject:To:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=nS3rViAFX/eb4csHyN17QgyHlXI0rBe00SV8wN+PKzMGEHTU5J6Mw3MCu0zUkavKw
	 dNBoVonK0sqPvOgxgN9G1RnkA5SLDMAbafa5H1QwgIWIqQ9pIVGxka8SroH7S9GzCv
	 plys/ZwJOeZvb/hxVOocpj2wY22zCjEulPEAm3mE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 049E6F80423;
	Mon, 27 Mar 2023 02:34:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6AACCF80482; Mon, 27 Mar 2023 02:34:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-3.7 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20723.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::723])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 36208F80114
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 02:34:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36208F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Vvke25Ei
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mmiLNl+uj8kDxOOD14vBYZpUwX3jCMiGtIkf4u5qpc1W1xSYRHIZo32jMeOWMt9Qk2n/T727B9QXAVJnXcjEuw6zSqkT1/CQaxFRwa0u5VmkAM9EG+ZaJ88OTWnY+ifpSCety9uSgYBHSY9NrQ+ZSKpMdVjR6C4Z2LsPA4mfdWJBud3Uf6gPjU5/RUhmaGB4W64DA7MAtC2MqLrR3Bp1CccWRuFNBhzASsyThXdTbfiJEX5aQaK/9Pjczo3WnG4kJDavX4gl/hYbHtUUpal7puzAsmgNqCm9YvwMZTL2K8VHMIg0gJQRVu0uNN3BSzIfCD5qfIS7zdxw4QWB5AQObg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WBJbNJSMRVx/mPQQIjMAsC9TZsAyjDTDegT3/z7clBY=;
 b=ER/ipkRZlNKdCxNprUZ9/mKDOSEIuKri3o5KWDd9Bgu54oUa4LqLm4hODn2PjT3NZpnQH2JV65/YfN15kHJWeZ685ZBBdHkVUDLnYhg/b0LJg9DGZSH3NtNYpcZjA0nUvR9XfjXehDLdhjr/0hUDVOfOlVp1Vbmc9t4EDudZ1Nnxq/THQ9N/qd0c+yje2VHaaOWBkUSJrpFo0AqcTCpkEhEINk3P39GHyRKSz7Nx+rVK7jLvqiggRhQ+9N51R/elZmA9Y1vjOXjbGWPixm/w+a5OXB78UsuVZp+aYV3LlWiUDYupTQ1jUZxiUj5wf2eALp7WVp3wp20BrOQkBKwebA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WBJbNJSMRVx/mPQQIjMAsC9TZsAyjDTDegT3/z7clBY=;
 b=Vvke25Eiwk+/PjohY0lqAghZl9tXFk6fNAmmlGUOyCBD37UZosNEiLlCdB3FgcV93MJbw9Rm/fPaWD1foyjNDkXCEsfifdyhxFOJZ4iYGgOtNmLAHaj6qxP6bKSDeizTrmmSYr9DJKzwxd6b0rYhcbW4xyg8JSbgLeGC8A9cu6U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8085.jpnprd01.prod.outlook.com (2603:1096:400:11e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Mon, 27 Mar
 2023 00:34:26 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%3]) with mapi id 15.20.6222.030; Mon, 27 Mar 2023
 00:34:26 +0000
Message-ID: <87h6u76nhq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: soc-core.c: add snd_soc_add_pcm_runtimes()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 27 Mar 2023 00:34:26 +0000
X-ClientProxiedBy: TYCP286CA0089.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB8085:EE_
X-MS-Office365-Filtering-Correlation-Id: c8d52d4a-19be-4c6a-4de7-08db2e5b04f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZHr6IAx7Drjhb71YYZAw9ANmIQB2qOnZ5XAfxAAV5X/RsUij+WKZk7jwvH4ipQsX2fxj6IBQ7msG1QdqctbRv6N4vPKTcJv9UWqucMZaymGj4NN1xw9Sxctx33vorc8EPJnhD7DXyNMEVRkWCzrpQn7ITcX9T9VgIcn+O21ysoI2ti3zd27lfdfx47Ja3pec6D0n0fupkomnrqHtKuUJu0fCbD+V+QIllplFKaD0Im2zl10ZpEGKOIYHLh2oLvFTT3fu7xhG4664hEkdteYN/16eocMfm5QlvQl8u8/I1pgMxvH//2HJ3LfV3GMx1to9vWdHtB7b+xQ7WP4zzTx5crocq8Ca5jMGR1N6cfPBwl60UI4Fkbu9qVULOrc7eJpD6lEG3As9TBzofkNEIBW1qyIuPzaHAc8ci6pvwWA6/a+GiTyjEPoyJ0h8ZMQvOtd6dk6R8vjJevVsPkJCa3qYI1BUiW/NxY0VrYcgmpaK58pieOkY/WdovTsf+JysAg29ek4ZTUd31fObrXs7pzIxsyzr+7ZbO6+lazOkqTWNYJigttK6/S3UK+d0hld2+LGqZZS7LiochwvYHI4zkxH2G04DWQzq6+7ankFJfCdP+Q9KAnDcZ1MhS0IyDjaCFprI
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(366004)(39860400002)(396003)(346002)(451199021)(83380400001)(2616005)(4326008)(66476007)(66946007)(66556008)(6916009)(8676002)(6486002)(478600001)(52116002)(6512007)(26005)(186003)(6506007)(316002)(2906002)(36756003)(86362001)(41300700001)(38100700002)(38350700002)(5660300002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ocsLhDbrYhxnd5bfhAXSicrgWBTOwKlfQhnsdDLXeYpb2EdfUFhUiDos9LDc?=
 =?us-ascii?Q?7//hTuBInnmw0axEYTBvQF7spl24S0xO9fVHozlfJDlh0tQ737e3LNOm5Ilh?=
 =?us-ascii?Q?S6lJfZR3ti9+iRnLUfBR3P8Yc1UgDeQrvKeSb+PRtUWj0LBkR34dUof/Gq7v?=
 =?us-ascii?Q?rPdtJmqDtBe8POOHGCGJHqwABYsn3jfIDXjt6bLbMKtG3Pn7c4rf7bZuX8Yp?=
 =?us-ascii?Q?cotNTnhwmiLu5mQBswPD/37w+YjYyTRyapfWlZFhf6TlwErkvwAYTHnJNPgv?=
 =?us-ascii?Q?DrDo+G9YqORyIFmZ2xORLkJKS5DeJYmXb5jJgR5y5tWXsuf57bkuWL9pSGFU?=
 =?us-ascii?Q?MYVIsVHKQzvF1u0LirgGOdw9NDKyE2cmeMQPHS3Hfs4FQp5omHmyq2V47gQH?=
 =?us-ascii?Q?IT08GRwqh1OgRLtpI7T1r/IGUOqVKSbkZvhbD5pEVaKIx95EXo8hFKcy+dVi?=
 =?us-ascii?Q?7KFEqOAZi9dxzRhiNp6M8JFS628InvumwW0eGFz/aR+2D6Kr+q6FdBSOiFMI?=
 =?us-ascii?Q?dPUAQj1L+Fpbl3IYvpDgbA1RHcVowbTUDhLEHl0n0TEqIydzjR+k6rXRyqRr?=
 =?us-ascii?Q?PgdLotORLy+joE0g5Ihx4o/ybfvkVim999zFftxHC9U0f9emhDjSy4DQy40U?=
 =?us-ascii?Q?hhoCrEk+nAgzuwGGRKHabO9taBZzFrfkbusZSWuCaupEziGd61iRi9cUsbAQ?=
 =?us-ascii?Q?9sPc4EmOiuCan4Gk9t3zD1dOf3CcXUkgpCFGbiiSS7v6Pfqs6gfT8iKShR2f?=
 =?us-ascii?Q?zn55x+TKxkxN1kw5RvDN5uW/NdGgXQcekjdSi3gb5c9aebe5w0EJo5D9qHeM?=
 =?us-ascii?Q?e3qjpU6NUzSKrbAGa5+WHdU0z9iR1Ux7fKTNWwdwqUDZS51c/pYF3Oty8GST?=
 =?us-ascii?Q?ExFz6JQy2bCOp5OWErHj8/cZqhH3f5taaC+25o9A/GtZXEnraYZillDInowO?=
 =?us-ascii?Q?H2EkjTmimEiyc8AQBe8UUcH4JGwrn8R24PlIQW2E0/mpBSJc6eEa22trae/6?=
 =?us-ascii?Q?n3FyPb7Jgas0aDehUSyNTEBfCENgOT8EOWQfUceymYJp81zrf6O00XiYHz5F?=
 =?us-ascii?Q?fwHZrk9H+arvf/oDEtfcxEypVutJDJqfJmzRcnYpIGjkIFKngeyayhdeA/E6?=
 =?us-ascii?Q?usyv4+y8/3h1viKiQnbrHcNUDML7FTsr/bYeT2Ff30f7gAPpBih6Gjpn5yZv?=
 =?us-ascii?Q?j89lrRXj8pNl6Vug4mNkxNLKMRBvAYJjXC0W7osea23qc9piimzbwL9NQ0wo?=
 =?us-ascii?Q?mjpQaVEfusQqciUpqMVX4blLw8lUaDWXnPwEhS4WvPdWDfiiG7sHNqlVGWgE?=
 =?us-ascii?Q?gQCoU10hRbNvowfEZwvLGyu620fXbfBK41+a4IM6mSRm5iAlo5cFaGAIo29/?=
 =?us-ascii?Q?Qu5y43TFhTL/ePvMP7s07phcyAsgS4zq8QoiUZUh8VJz6jmA0dqyRtu3UK5p?=
 =?us-ascii?Q?BgQfvNhA3mgJPXyOoECa174bAXjc5fZSsqqwqn1p9llGczD6BuCXn866nY1c?=
 =?us-ascii?Q?d70K0+7itVxDcDRBxZheEZ0ud7Hdn59dMm4S2nh7W7IlldWUX/f1c755BLZK?=
 =?us-ascii?Q?ftCRi29Hwt+Fz0AC7oyzaLNtjpNtMrbmbtEliRxeKOG4L0eGek0vpwUznGki?=
 =?us-ascii?Q?O3HvDRBjm3sehV4FOruljtA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c8d52d4a-19be-4c6a-4de7-08db2e5b04f4
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 00:34:26.4975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Dt8QDDR78juAH6QCE9x/PV5TKiwMMUbfsJJDca9wzn1MGaNur9+5Z6FdscdNGvMqXcTvC1stev1GFXMn1zrlAGT43UiIVENEPfEHJMcdtJLd2W70M96fSCmXtQ0IJwXA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8085
Message-ID-Hash: HNRU5UZEABDQZHSMPKFMFZ43GKHL3FBZ
X-Message-ID-Hash: HNRU5UZEABDQZHSMPKFMFZ43GKHL3FBZ
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HNRU5UZEABDQZHSMPKFMFZ43GKHL3FBZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current ASoC supports snd_soc_add_pcm_runtime(), but user need to
call it one-by-one if it has multi dai_links.
This patch adds snd_soc_add_pcm_runtimes() which supports multi
dai_links.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h                  |  5 +++--
 sound/soc/intel/avs/boards/hdaudio.c | 10 ++++-----
 sound/soc/soc-core.c                 | 31 +++++++++++++++++++---------
 sound/soc/soc-topology.c             |  2 +-
 4 files changed, 29 insertions(+), 19 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 371c254aa74b..3833184c187f 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1305,8 +1305,9 @@ int snd_soc_of_get_dai_link_cpus(struct device *dev,
 				 struct snd_soc_dai_link *dai_link);
 void snd_soc_of_put_dai_link_cpus(struct snd_soc_dai_link *dai_link);
 
-int snd_soc_add_pcm_runtime(struct snd_soc_card *card,
-			    struct snd_soc_dai_link *dai_link);
+int snd_soc_add_pcm_runtimes(struct snd_soc_card *card,
+			     struct snd_soc_dai_link *dai_link,
+			     int num_dai_link);
 void snd_soc_remove_pcm_runtime(struct snd_soc_card *card,
 				struct snd_soc_pcm_runtime *rtd);
 
diff --git a/sound/soc/intel/avs/boards/hdaudio.c b/sound/soc/intel/avs/boards/hdaudio.c
index e68c4c7aa2ba..a542a67e21d0 100644
--- a/sound/soc/intel/avs/boards/hdaudio.c
+++ b/sound/soc/intel/avs/boards/hdaudio.c
@@ -194,12 +194,10 @@ static int avs_probing_link_init(struct snd_soc_pcm_runtime *rtm)
 		return ret;
 	}
 
-	for (n = 0; n < pcm_count; n++) {
-		ret = snd_soc_add_pcm_runtime(card, &links[n]);
-		if (ret < 0) {
-			dev_err(card->dev, "add links failed: %d\n", ret);
-			return ret;
-		}
+	ret = snd_soc_add_pcm_runtimes(card, links, pcm_count);
+	if (ret < 0) {
+		dev_err(card->dev, "add links failed: %d\n", ret);
+		return ret;
 	}
 
 	ret = avs_create_dapm_routes(card->dev, codec, pcm_count, &routes, &n);
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 2faa0d8d0d8e..9bbcff492c1e 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -959,8 +959,8 @@ EXPORT_SYMBOL_GPL(snd_soc_remove_pcm_runtime);
  * topology component. And machine drivers can still define static
  * DAI links in dai_link array.
  */
-int snd_soc_add_pcm_runtime(struct snd_soc_card *card,
-			    struct snd_soc_dai_link *dai_link)
+static int snd_soc_add_pcm_runtime(struct snd_soc_card *card,
+				   struct snd_soc_dai_link *dai_link)
 {
 	struct snd_soc_pcm_runtime *rtd;
 	struct snd_soc_dai_link_component *codec, *platform, *cpu;
@@ -1027,7 +1027,21 @@ int snd_soc_add_pcm_runtime(struct snd_soc_card *card,
 	snd_soc_remove_pcm_runtime(card, rtd);
 	return -EPROBE_DEFER;
 }
-EXPORT_SYMBOL_GPL(snd_soc_add_pcm_runtime);
+
+int snd_soc_add_pcm_runtimes(struct snd_soc_card *card,
+			     struct snd_soc_dai_link *dai_link,
+			     int num_dai_link)
+{
+	for (int i = 0; i < num_dai_link; i++) {
+		int ret = snd_soc_add_pcm_runtime(card, dai_link + i);
+
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_soc_add_pcm_runtimes);
 
 static void snd_soc_runtime_get_dai_fmt(struct snd_soc_pcm_runtime *rtd)
 {
@@ -1921,8 +1935,7 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 {
 	struct snd_soc_pcm_runtime *rtd;
 	struct snd_soc_component *component;
-	struct snd_soc_dai_link *dai_link;
-	int ret, i;
+	int ret;
 
 	mutex_lock(&client_mutex);
 	mutex_lock_nested(&card->mutex, SND_SOC_CARD_CLASS_INIT);
@@ -1939,11 +1952,9 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 
 	/* add predefined DAI links to the list */
 	card->num_rtd = 0;
-	for_each_card_prelinks(card, i, dai_link) {
-		ret = snd_soc_add_pcm_runtime(card, dai_link);
-		if (ret < 0)
-			goto probe_end;
-	}
+	ret = snd_soc_add_pcm_runtimes(card, card->dai_link, card->num_links);
+	if (ret < 0)
+		goto probe_end;
 
 	/* card bind complete so register a sound card */
 	ret = snd_card_new(card->dev, SNDRV_DEFAULT_IDX1, SNDRV_DEFAULT_STR1,
diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 7f6424fa59ab..be9849749713 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1741,7 +1741,7 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 		goto err;
 	}
 
-	ret = snd_soc_add_pcm_runtime(tplg->comp->card, link);
+	ret = snd_soc_add_pcm_runtimes(tplg->comp->card, link, 1);
 	if (ret < 0) {
 		dev_err(tplg->dev, "ASoC: adding FE link failed\n");
 		goto err;
-- 
2.25.1

