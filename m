Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDC1601DC2
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 01:40:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B74FD48B0;
	Tue, 18 Oct 2022 01:39:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B74FD48B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666050000;
	bh=QB+3wt1ouhpJpsrupQxpbiZ46465zHSxemrQyBGg5m8=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s2GiR5NQaqKXbmAC1Tne1/naBwq5PWpsJbUc/Jr8Oipo0zj+RvV51hosgt7lJCAPP
	 YjFCXwg64EI2l8Xte6RCFLMc/BX7lTmMeQ005Whe5mQFa2gHHNAoDGabl8BIzhL7sq
	 SZ9E+e7SJ3LSNF5RrI2NQc/AYxEwqB6nUemYjXqc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B67DFF80149;
	Tue, 18 Oct 2022 01:37:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BAA8F8059F; Tue, 18 Oct 2022 01:37:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2132.outbound.protection.outlook.com [40.107.114.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E236F80149
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 01:37:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E236F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="ThBykJmR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L6eNG3m1DKOOFuej/WAy/MXkQQ0WPSv0ummsMEEHtzBEr7RxPo8kgXVMEhbF7DJ4btn7ayAa0ddFXi7hcUn6r14oq+DZQpti4Z4gf53gEsaj4gAlaLFkbaIiD0zONK+xLqNTxicSkqYZmojYXUJyDKedWMWt/Dntjp82GCOB0cdXpmH/ziULcmVQ9iuGjtBN9ZYQT/s5tUP5QDW1UZQu4AdVpeBfUH5pGQnfmqy5DcvQxmtmTgEp6/AS9DNAcFcQmk9ebHT3Ovb2JXBofPBcEKtCC5mKT3yvE5UKyjyWaG4QAGQT7KB+wnZFdDENNdK8AzO5XsxEFs+7Uf8TUN11mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U8GmyKLYjPI6WO6tQMsbWAe2YZf1jXH6TaAyCcOrq4g=;
 b=RSAE0FDk7R5kOV80xGubLYKZzjXZwzPeK+wUbTeAUfaeEQm5EUErhzujgSEHQYG/Jc4I72UQqRluzcTeyOVr/ZrPocJCKM3zHcVqd/isuHDZaefGAFKDtqDt8krB6ChAl+E/35/SBZeKeCj4etB3yFNiuBSkVOs5cyBAMW1aGX8FD2JPjCCZiO7UPTrwAYsHbQtBI3u7jBVC3BVljbrkhu83SCKuaHAkWfpsrmDCddf4FVo5aFhx7rfCu0ApMbDwSNAu3g9e+KYxH1shhEecaYWuKPQQrVrmP/48j8H4oF8UFR1wu0rVOIQLItHXx5mTzzQegj/SsgA94Sq9EhxNKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8GmyKLYjPI6WO6tQMsbWAe2YZf1jXH6TaAyCcOrq4g=;
 b=ThBykJmRk9iquOwbwURuQV6n2VC5CkLPfy/b2bA1nTJjf5xwpgxSzq5OGXFRRyXQNj2hv76G0lPcEw9Dp87qRo+/B8d78hafZYZ18nNrSsXA0qPqqGZpuHwkjHpRlaCnmpRPx66VdLsMwG702RaaVSGyI9izKXznl6Z7CnVJF6I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8180.jpnprd01.prod.outlook.com (2603:1096:604:176::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 23:37:27 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8860:a9ae:8e74:ec53]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8860:a9ae:8e74:ec53%6]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 23:37:27 +0000
Message-ID: <87o7uaowcp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 10/11] ASoC: soc-dapm.h: fixup comment for
 snd_soc_dapm_widget_for_each_path()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <8735bmqazf.wl-kuninori.morimoto.gx@renesas.com>
References: <8735bmqazf.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 17 Oct 2022 23:37:26 +0000
X-ClientProxiedBy: TYAPR01CA0066.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::30) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: e04a4cb3-65eb-4387-cd4c-08dab0988cb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iTWix9erTVsAb/xVgANUc8w7+h9mkV1v+CO7BysCDwaG/8A+Is28fBQZzi9TQAyZZnnBXf4OjZWc1jwwEQIAj+z1i1TL6JMrD369fyE/U4807yhkfpgg/QD88Lhi4TsQRVFCClyL0I+BwYvcKPruXAg+8N1IrBz1zccmIF8krz3oW4Iriqb192xIFbOwCzWf1/oa+OlwFerTHQ9YokoJj0laeIwpGEPQoux3fYIbu3xSfUcMjycsa4tQHPQmZlVOtup3xCMmHKWqEnD3kTIzc35wpjzURdgRYMXGOWqi/9HKeWrsTxz3yTVY3ZLa34Ckz+JSM27LlXOvGwFXeAI1v1otMpmJzb37xhLKK4VBq0IErXBbZY8sdYOeYKkQfORNSwTLrSbtVvajv3tnz0fHuJR2iWbFDMaNEJE4UliCwiD+TW2QWHBP1IP1Py0Ou/+xUxlRopy1LcR+Rr5qxGFYS/ie2xztylScSMO6IyqqV2KsCEtbrp9CxVS12pLHHmlkKZKaXHwa8G5T/5aPJgFbgKNg2jkw7EK2owdsEV1M5YO5lXsB/mFzOkfWE2/mNlo0APQNRhuuB0fpQjbJjsL5T8lH/RNnNT/KPW8gfUokrBoI1L9PMI/oQp00GO7ooxTu7ANo5aTThavVMCg+T9Rw/mIuMMDEOi2XJIsttmCKXWSK1PsyMYEFT2IVQDjTL3HcAU42/0xavh5T7OV//61W2pxrbsh02n1EXIyxOkm4NylNQfbBUSlBUGvQyZiF0ajbduwFzJiXXh4OAAdikckznQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(376002)(396003)(366004)(39860400002)(451199015)(36756003)(86362001)(5660300002)(38100700002)(2906002)(38350700002)(2616005)(186003)(83380400001)(316002)(6506007)(6512007)(478600001)(6486002)(26005)(6916009)(66946007)(66556008)(66476007)(41300700001)(4326008)(52116002)(8936002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dzHeQNB0R896iMKnagqbkI6kDnDk1k7wIjRivPPscjFJALkKPOQ6l+AO8JVd?=
 =?us-ascii?Q?uTlWZtJI4DRbGBhXKXsTdNz8V9ujK2waJfEN6U+/1qqoUqUTHd3ImXmSg+Eg?=
 =?us-ascii?Q?YkXYfRkFA6G4dpqv73+YNpTtcg911sB7Qdg2YySkl9ynwQbD7hSDV3aXv1t9?=
 =?us-ascii?Q?k4oao5If1YDcdGvZp4+UdipvdLG6JYK0Kj6DwSFpEELRahhNvZlMEx6LXYRl?=
 =?us-ascii?Q?UFfQyeLqxXU32PgA0n5OEA0+69N47rsNEwUU4IWSU6dBWWLD3YUScXffgKpC?=
 =?us-ascii?Q?gFrFe6VZN9r6JWhE+xoYzUYpd8bs9+0lVZcVc+XbiRGjIzDV23yz1f6D7eHn?=
 =?us-ascii?Q?503QmboL4mdrVBXEf+47O2QFaJsf0kQ9yJh3dYUnfQeyvAxY0FNoE47Qc9Hr?=
 =?us-ascii?Q?Mjuwjnx8V1nPp172JUKugtaZVQTwyLZd9UCLVHnOfj3lHcwScZ6j6TpAgnzc?=
 =?us-ascii?Q?6XTkvuCHovGtIkcHdWUzB0k7w9Kco7Cahz+sY05yZ+CO+tlbGbeWktP1rbMM?=
 =?us-ascii?Q?n/lU5SVTgi+4mK7JLNCO3MzA0IhI1s8O1UcGQhwnovSjS7sh1n6b+4UxPLk4?=
 =?us-ascii?Q?r9PJ9ekWE0o4/Vofg4YPqMokRN3OX9TjUODVQOjNedzz2xttUb4Wi8C0LvnF?=
 =?us-ascii?Q?DuFxp0xQJ57ddmBTQDzIeDgOEVSwiBXHM2XIutsDJUWWSPz3dof1KHN0icrZ?=
 =?us-ascii?Q?W0tRcrIjqveoxao/t9o4ZLcKQIdqXJNQjQ46dWDtPpzjji2dWQWROApyCb3d?=
 =?us-ascii?Q?33SYeByQVeAjjBYh1RNjOsjG3YccmgKgbKs8+l5yv3GWc3SHEmdgwqwJETtn?=
 =?us-ascii?Q?pO4umsPhnaxPfSL7qGtTk8IwIYMLsvWdcd9p8JKDg9lSoJRtJBWV133gmBuI?=
 =?us-ascii?Q?81+wgdUlrhnDT3BSOFqgDK4MAuBFHeywplex0cOQ5kfcxZCrzrsQ/d1XRIaJ?=
 =?us-ascii?Q?wrk6JF57C1x3z8xLQRyhlZ0oMb1u73WrkmSJjXeK8efYCmGyHTWivTvxEDWq?=
 =?us-ascii?Q?RFG3LRaQWXeg5F745Kz3ZkvX8XQjE7G4UvbhMde+uWWC0p6RSMPbSFN0QyOc?=
 =?us-ascii?Q?3WyIprbjqMhCJ4GdJK1JeHUwwo/LSPgDiwiGH+0jALJJ/YeB2elzqAbm+iVr?=
 =?us-ascii?Q?m71VfTtQgYs3NR7DpELMAxs3WgkSTzRJFXSDOER4C0huAxOFwHwycZT/D+dx?=
 =?us-ascii?Q?WwVl83WS70IEn2CHBcoJX+xtBZZyblMs7UJX45Dv8u7TO7HOJfn6NKLJj0e+?=
 =?us-ascii?Q?Bydt7CTcgi9xNvdTnLYyJoJxSeURibWrHnswx2Sih5UClP0elvxEWw84XWXO?=
 =?us-ascii?Q?NjoqMwMt4MFff7ncFM8B4VKoFrp22zeSDaRyPOSsonoNItAqJvKc4wOsL1Af?=
 =?us-ascii?Q?wkkzthUMSs7SsxjVCa0tHhNnwBCTwwapcVvH0GZJQlZ8LfvRw2mtlXtcvY54?=
 =?us-ascii?Q?D4AALLIAKHq6PtTpFeGHvDUml0TCTuwuozbDxOupQiVdivtG41lWBaVpIBnS?=
 =?us-ascii?Q?8D9Sv1zj4Vj7jmtaiX23ksGYruLG6NTzTTy1OVgA2zCLmJMA2S4m7UACBa2g?=
 =?us-ascii?Q?0KKR8kOwjzUfuU+M1QuiqfxdCitmKSCewR9T55VRCzYHpi8Ooii4/qPk7LiB?=
 =?us-ascii?Q?//QAzjeosteGeeo2hq5fJL0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e04a4cb3-65eb-4387-cd4c-08dab0988cb8
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 23:37:26.9423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jy1eve4fwPc8Kda46GqxACe2opkM7DxapSOUdAgTZV/Mj7bq9MrDMbu6waiN9QrWdDF3chO+MYF8DBiiSeyRmYZc1sUVXcnEQ8HuavuoXUBUvbUZZ8zU7uRYkw2J/ad8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8180
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

The comment of snd_soc_dapm_widget_for_each_path() (= X) has
"_sink_" (= s), but this is typo.
With "_sink_" is already exist at (A). This patch fixup it.

	/**
(s)	 * snd_soc_dapm_widget_for_each_sink_path - ...
	 *                              ****
	 */
(X)	#define snd_soc_dapm_widget_for_each_path(w, dir, p)

	/**
(s)	 * snd_soc_dapm_widget_for_each_sink_path_safe - ...
	 *                              ****
	 */
(X)	#define snd_soc_dapm_widget_for_each_path_safe(w, dir, p, next_p)

(A)	#define snd_soc_dapm_widget_for_each_sink_path(w, p)
	                                     ****

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dapm.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 44597e63344d..77495e5988c1 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -735,7 +735,7 @@ enum snd_soc_dapm_direction {
 #define SND_SOC_DAPM_EP_SINK	SND_SOC_DAPM_DIR_TO_EP(SND_SOC_DAPM_DIR_OUT)
 
 /**
- * snd_soc_dapm_widget_for_each_sink_path - Iterates over all paths in the
+ * snd_soc_dapm_widget_for_each_path - Iterates over all paths in the
  *   specified direction of a widget
  * @w: The widget
  * @dir: Whether to iterate over the paths where the specified widget is the
@@ -746,7 +746,7 @@ enum snd_soc_dapm_direction {
 	list_for_each_entry(p, &w->edges[dir], list_node[dir])
 
 /**
- * snd_soc_dapm_widget_for_each_sink_path_safe - Iterates over all paths in the
+ * snd_soc_dapm_widget_for_each_path_safe - Iterates over all paths in the
  *   specified direction of a widget
  * @w: The widget
  * @dir: Whether to iterate over the paths where the specified widget is the
@@ -754,7 +754,7 @@ enum snd_soc_dapm_direction {
  * @p: The path iterator variable
  * @next_p: Temporary storage for the next path
  *
- *  This function works like snd_soc_dapm_widget_for_each_sink_path, expect that
+ *  This function works like snd_soc_dapm_widget_for_each_path, expect that
  *  it is safe to remove the current path from the list while iterating
  */
 #define snd_soc_dapm_widget_for_each_path_safe(w, dir, p, next_p) \
-- 
2.25.1

