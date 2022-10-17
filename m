Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5998C601DB1
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 01:38:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D62DA4DFC;
	Tue, 18 Oct 2022 01:37:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D62DA4DFC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666049908;
	bh=wkT7vfErJJWpsTviw+cbKjtO5uVl5+jnPpuDbSK6gB8=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nzm04UVyJhTfz9XETwJ47Xnoe7uAPJs0Zqzfgo2zm4FUA4cW9CHJpnWlvHv85ClFd
	 Gev3Fa/BU+uPNujUMBanTU7yiLydYZ3K8WdWP8qTjo/NSvIlJ1KvvXmF9RfkF0FfU9
	 s98OKz2xlYlu1Qhc+e9tTivQuzTeX9ET7eng1vlU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF3D8F80496;
	Tue, 18 Oct 2022 01:37:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB702F8055A; Tue, 18 Oct 2022 01:37:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2094.outbound.protection.outlook.com [40.107.114.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D5D7F8055A
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 01:36:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D5D7F8055A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="cVxgv5yD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gonKLXOQ1jnqzPaWxCX7XDRCPBiLt6CFg33c6SkEkWwbcnd3ltMNxshzcFq20bidZ/8gcg3v9EWnwjHgAxzCxu3W7XNNh8w578QFSRMZJRM9vBbcuCcADoBsl4GnscBVnrrgIQrWFcwrqvxp5UaHRo8LDA9LuNYXps7zsfYHWJJHYPXZIEt7bBQO5lHP9SzMD3Np0GaprImC67xE0VHU7QXjhGIJVKy4vPmcgfGhfkfmSzUsiAp35NF9Yt5Azu00I/qBZnkdfEBDgMqNbb42yBwixvUEhIPtTP9YsXXVsymJ4ztVdjqF4HQaNTgCT8IcGT2VnW9mKiNL2jAXCLN8/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X6BjvMMYbeznEwmDLvJJUjpp7ttpBcP0nkK3R3c7j0I=;
 b=Z2a4ivYaMzLVVEyxK6WPEzV+uVlthFtIF+i78VcPZqgLMN6JPp0zBvOgmYX37mFRhMsm9DzZgRI0dZi7+puQni2nUhLOJ5z32MTzu2G3wpykeg0syGe1euSqzhZ8M9W9XUVo/l2CIIpgrt+L6zm3eX7QqubHb0Uxf/VEGndya+PqRbQZID1TysPkhkI8RzmrMnhXGPhmYgQuOMscABVEQlp6K9KAtAaEShuj8mG6+CV3Q76zA/nHCU/YTjk7qLgZi0dS4tejCxfLA/icpjHQX5jQrgrvjLwYKVjMVxnkcX9rKfq4Ny8RqnYouhbSNMGg2L0B1rHZUNcdcH/6bSsDUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X6BjvMMYbeznEwmDLvJJUjpp7ttpBcP0nkK3R3c7j0I=;
 b=cVxgv5yDx+lmyyfgQCJsly3ZZPwwSRAFGrSaXNBKS/a6dBAXpK9dWSlhiuPgRkB/TmhgytoNSqNhdbl0q1HIHlW+GKxDYexJqQFKsrzeWlxo66gd8jQv+mvnsCsxYgu8L7t8zc6Ty0K5/nbtRaLVyR4zXMwargmXevyChzMMueA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB10199.jpnprd01.prod.outlook.com (2603:1096:400:1ef::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.31; Mon, 17 Oct
 2022 23:36:56 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8860:a9ae:8e74:ec53]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8860:a9ae:8e74:ec53%6]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 23:36:56 +0000
Message-ID: <87v8oiowdk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 05/11] ASoC: soc-dapm.c: cleanup dapm_widget_set_power()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <8735bmqazf.wl-kuninori.morimoto.gx@renesas.com>
References: <8735bmqazf.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 17 Oct 2022 23:36:56 +0000
X-ClientProxiedBy: TYBP286CA0005.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::17) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB10199:EE_
X-MS-Office365-Filtering-Correlation-Id: 05e85208-28a1-48ce-0b0f-08dab0987a73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0QaFYsDNStQLvEMI8brpuVlMxLkmsEa8k7e6VDZOgOwXtxNJKWqZSua9lZu3ARFeDsLBluDFuQLBVeiSfaaZ9q6ykndmmlH4JUW5grZ5OeSLH3VGO/BGn5HmKW5t4G45O6MN/oDcuVShb97iaGSLj/C2/tqIONPHuIoQkRujTDCPOE9MAZF2RFiCJ8uai4/pwXCF9xP04F9Xt/5CajNEgW17ho9Le+OeKeuTssNMW2hGnPeJxi0R+/ecyCAHq0TRC/l3aEQuwYwXXl2btMT3sdx+XACh78TXMX9USziWnVqoJ/oZNKtJy32ViMeUDPSR+BYahmDs9sfs2qPTjP1bgIOIIHEtvxYW5UqrJtcdctH5mso3zyYcxubdjtrzHRL7B4QG+5wh1lB0doPhU/loESWkDp/1A0s0n12BoURuxw67fPXCwQO8PBCmuaZXixxpFjEyHsy4ZnFjdrHvZmz5Bz863kK8Yjmnr2qnO8SOOgCDCAPyyfWaYEsrls+W4dNharcPanddutVlaSsTnfUzU9hqsbsaHrI5At3FqbNKrHBZpazGKnqW4HJGvOYiCUOu1IEtIe2mPol+qORcpaluCthWVEd/IjCuv5MxTWuf4DSZHmr0OGfArJLgvy+Ur+83OiapBwOBQN/eaEFmAlB+ndiNG3eiX1pdYnIM0dinpQDklvFIIUlpEgoYxvkSb12DgXIYdKNrRQTj7u4wCRPngrirpHmW6qwNYGk5506KK3IYMfBYm8quLCOtRjFUAukE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(376002)(396003)(136003)(366004)(451199015)(41300700001)(5660300002)(2906002)(8936002)(316002)(6916009)(36756003)(6506007)(52116002)(478600001)(6486002)(66476007)(66556008)(66946007)(4326008)(8676002)(83380400001)(86362001)(26005)(6512007)(38100700002)(38350700002)(2616005)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xvF/g0NFJG9dcOkEjuGCVdm7RegrDvZsUSMI1diQG4oyMYHSZwNXczYRF8Wt?=
 =?us-ascii?Q?VdcuT5aE6ERvxLxphCMpFys1JzgF8cwJC4uqq2B4fa7B0JjNHByjdnMiQuky?=
 =?us-ascii?Q?CB06eP7g1UfUO0/asXdZjOFMOJF1C7yq+KFENyLu73XKlNcHxZQBByYPcs4z?=
 =?us-ascii?Q?usCBFH+N8Lit6r++AAxAg5Ta+r4uJDdynwan/48jVyJgyy3rzYJC+9ZsfEDv?=
 =?us-ascii?Q?UzO61LJFj1QF5n+yqh14+rdIPC7mXgzUPPyObngaNvEyuXwb69F/qoImaZyE?=
 =?us-ascii?Q?ylnenELiM8ZYYbsS+ClmN0hlc9aNzwXGFydvFgdgwE9FXhV+OJ1b66N3XTl4?=
 =?us-ascii?Q?ssgNQjKFjcDFm1HSYV5RI/ImmCkskt2Osp04r2tEfRgmAyLOBT6dFrZvjkhI?=
 =?us-ascii?Q?W150TseHQXCbfGw3O18NhNQYjrnArbEzpl6rXobO5S8SK29hULSyKSDthkR0?=
 =?us-ascii?Q?n89d+k2kkG4jVC5XE3lwjdKHhqG/jEY41CRcqQeWM+Txc55UxZpYFyd+9TEY?=
 =?us-ascii?Q?i6R+KEsG8SHnLz1TPIhhTwdUlg1VLB6ll3ioRbaJtafpWaNp5Mx7/9rMhrHC?=
 =?us-ascii?Q?tzc2EvFhhyIVlNm57UwVWvhgKBLiFt2h4DUWpFJAyM+u97S9QGMr8P9iAeMl?=
 =?us-ascii?Q?vBpUu31vsQxAa1sYSwZaAj5/Dv0jUOA9xCwXzyRDUCCT/OpJ+G78jQaTkYpb?=
 =?us-ascii?Q?F6Edw4NHuiUS23wGMtRPNRUxzjGzHBBWlug2+gH2RGRiIVQf7jtZByAuvmlM?=
 =?us-ascii?Q?QqcShSX6FBTpLiH2tPCw4ViSWFqrgvjxM6hrMqSURtorKADE3qAI79Omn76E?=
 =?us-ascii?Q?dopqhdILceRHMEv7Uzp5QEbLXJge/VP++KQqMSpab8GnaKeewAkMAwQv0ckt?=
 =?us-ascii?Q?TJZcnLvVri86sDLpWDtyHctfOo9YbMGbbkcWdkXiY8x/uYxhgl7kB4T08H24?=
 =?us-ascii?Q?6+KBzlT/DDQ9k3K7hF59Ja+y+RQmjAJzp4C+n3FjYRuC5OkLx452KP9UK5Ug?=
 =?us-ascii?Q?bWjNqQ4rxHUDjFiWQHe39cv+eCh/019SQX2BVAVmPfGYnr1Xo3JsIijOT3rd?=
 =?us-ascii?Q?Kp+MJWg9XNtrlAk/inBXqIdeY4fKj5GOVC8fxEH3EYixZmxAtf2BfR3PCA5/?=
 =?us-ascii?Q?iHnkdQWR7jeNL7/Rn19j63OKGUIteDeP4iiWCyYA4h3CwMveE+avzjFkb3QG?=
 =?us-ascii?Q?kKVRRMR3bm6r6LDyRllBxMTLU/hQuwr9x0s8ErnTkVCcgv91MPVWd8wn5WYe?=
 =?us-ascii?Q?/EzZsd/b36PEB3WSi/T4L23PvH++NJR4iNHJS0bS/NSxBXuznYUU0pOO73lt?=
 =?us-ascii?Q?/pYuLXYcirsgr72XMP6LavVmclMR9EbaYrwjfN664zpBib8QL9dJCtuAcaOF?=
 =?us-ascii?Q?i/ggcI0kjdMpEtXuPnkXrb5eEpmVQpEICPZpn/Evb1cMLpmpWnvNKrpQcsBD?=
 =?us-ascii?Q?0zkpzba/sbIG9f1ADML18o1O5dUAJkUU+7G0ryZr7SHndeK493Pb7GK4FWr+?=
 =?us-ascii?Q?WbB+nH09jJ6nboY5knQCNpBzbIUhKJ6PRa/tmA7R8wgirJisUZiSk97/Q/c0?=
 =?us-ascii?Q?RQGxZTjyJOmrVEAPulEhEx09OWDVv0RUR4Gqbk4BdDaV0hs7Phl/HbT6W5kZ?=
 =?us-ascii?Q?djGNe59mcBT385nm/6QztFM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05e85208-28a1-48ce-0b0f-08dab0987a73
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 23:36:56.3488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K/UDkV9ym9/5zoNsO+mypCWtKJbkMboKyQg/OME31PlQ33IrY5f85uGGKVXNul0zBmASevSikybLvmgIAVqfJFovStStwMJxgZ93TjtjD/o1Jnpi+o1YnpLFb54o21gl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10199
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

This patch cleanup dapm_widget_set_power() comment, parenthesis,
and 100 chars. It has no meaning, nothing will be changed.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dapm.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 5280a1aafb92..d4281e776e44 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -1884,18 +1884,19 @@ static void dapm_widget_set_power(struct snd_soc_dapm_widget *w, bool power,
 
 	trace_snd_soc_dapm_widget_power(w, power);
 
-	/* If we changed our power state perhaps our neigbours changed
-	 * also.
+	/*
+	 * If we changed our power state perhaps our neigbours
+	 * changed also.
 	 */
 	snd_soc_dapm_widget_for_each_source_path(w, path)
 		dapm_widget_set_peer_power(path->source, power, path->connect);
 
-	/* Supplies can't affect their outputs, only their inputs */
-	if (!w->is_supply) {
+	/*
+	 * Supplies can't affect their outputs, only their inputs
+	 */
+	if (!w->is_supply)
 		snd_soc_dapm_widget_for_each_sink_path(w, path)
-			dapm_widget_set_peer_power(path->sink, power,
-						   path->connect);
-	}
+			dapm_widget_set_peer_power(path->sink, power, path->connect);
 
 	if (power)
 		dapm_seq_insert(w, up_list, true);
-- 
2.25.1

