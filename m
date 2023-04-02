Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1376D3AE5
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Apr 2023 01:03:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EB101E4;
	Mon,  3 Apr 2023 01:02:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EB101E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680476587;
	bh=tBVMTydThlMekkaq2ZbX0dK4/J3LPUAy5MNVJDseJiU=;
	h=From:Subject:To:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Cn13tzxjga6TtkuMpaLGorflXzLHghmDfvwMctNRb+vWwQYGZZGgJan7XTcBe4Q8f
	 tt1X/Ke8d9ZFGOJ4u94Tkc21v5tRwgLXSkzcYXK0Qg1lrgg8QNA/7lAB7Vbf2FuyIj
	 TSSBs8wsehNyNqcwQTdKF3ZhXOf6MRZAxNoEsG0k=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D538DF80553;
	Mon,  3 Apr 2023 01:01:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 019B2F80557; Mon,  3 Apr 2023 01:01:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2070b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::70b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4DF57F80171
	for <alsa-devel@alsa-project.org>; Mon,  3 Apr 2023 01:00:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DF57F80171
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=mg8fR4eW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HL4/I3xcRcoUOFIjMiZQEJncexr8zUnD4LL9ZMtt4cfjftfUOggJ2QtW7pZoNSfZBOd2lKU6kC/jxPMU/WRYW65UBgQOtV2kiBmnSPlEcmDS4OMVCYKflxHiGO0/ioNMlVipNKK6IxKqRb7InaQju+Ww8li2H2M8Z61oWp+FCYlowUDjN797vzsPCUo6y4LbZNdD8YsHLJL3A/nfbnQgTjB3cTCD0A9kDhfMfLPn48k8HS+Nz7+85kRs1b/6dKAmaVqs570d33imog99/DPd0aXBVHn+zX9TxpSMFZQH0ZlMWEvMdHppz7xVHt/11s2x09B3hbFZACYmznjwgLIioQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WvaJhfx7UAKU271Q1ysdMZJOtZi/ZsIuAS30LdB9f/0=;
 b=TnQADbdP+8ko3EzR48c8WIWKZ7NwQhGXpG2bL02FsApg0+PKcjlApgySZyzLih5tnTpRemf6dl991xUeR4urZTkbXsLmQIn5KcA4ykj36D6k3dI9l7jFJ+YQ0HlermSpUvOWEbA+ggomZNKl+pgGXeqsOW/5wT0G/RXsWPiOY+gqVYxHb8mjLEIyV5+Ply3ohKr5BqAhtNjCB8ysIMBwx+tzKfIoPi1ImY/0TxyilCErJ7Ag16db7D9zpK2nsoAuYGmBrkqAwJMXbfiINF5n+U8/18he4H/rBD5zE8n+dsGV0T4hbnP4bdX9tBOKTqiwqWijJ2/8/RQxzghSy3Ct5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvaJhfx7UAKU271Q1ysdMZJOtZi/ZsIuAS30LdB9f/0=;
 b=mg8fR4eWAefog9S8+gVzYYtNr047fT0E8aFql7eaHXK1/+QFpkRLYl+3Rw0l1GYDt5+/CUBOjg/PJwZyxUEwdBzRVFTJxQcBJJu2GTO0TJ6WPz8eKMq+bMP3fdNG2AhVJHAPSWyluWW463Sb/p7ujdvUTTeoxAvNjlU8XAN4pzw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB10184.jpnprd01.prod.outlook.com (2603:1096:604:1e5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Sun, 2 Apr
 2023 23:00:17 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%4]) with mapi id 15.20.6254.033; Sun, 2 Apr 2023
 23:00:17 +0000
Message-ID: <87iledc2ke.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH resend 5/5] ASoC: soc.h: remove unused params/num_params
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87pm8lc2m7.wl-kuninori.morimoto.gx@renesas.com>
References: <87pm8lc2m7.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 2 Apr 2023 23:00:17 +0000
X-ClientProxiedBy: TYWP286CA0016.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::21) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB10184:EE_
X-MS-Office365-Filtering-Correlation-Id: 792e7424-0d1b-4b94-28d4-08db33ce06ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SKCygCmLNZp4O6/V8YHs0KkUjisyZ/ZPXttZdlHb7ZBGuDMIc8yPkECo/onVa6vMhdILEZguZBuMrb+h+4Al0WGf/y5Ed54Q4opNfDoELZ627p0OqTHB+NMN5rv418eUiBgBCzw55o2cZi1DzLebE0nO4iO4x5HF5VRF60ZsWNf+g7H/73XRyS/2d9qHWMq8Mw1bfNOPrs/JUJ7VT+8bgLlsuabaIZVuMC2YcAJkdP2+a8iAPZuMlHj0Ca1h680oTO17P9U2zCgpgh16G+aGsCqQEEUdzwiNCVOLm86n5KxUzw4jsW6BblkqJd5HpDjlHHVaEB8M7IZ0OR7XFvK+ECCEsz4XVonCucOxcFxZPR5xRwpjvSBbUPsTvD1KoYt+sOo0iMZRDXLSeKV0eQ/QC2ymDfOdmFr9oxtZMWCC8p13W8O1QaZX6mg11Jo0jC8yHGnt+b3LVPFnSRSM1cQ1d17p+Bqpt2GPUrdfzWc9Y79231ubE7yZf0s7TN3zLqdNeSW7rUCTg1XBe8EwwIyddpL5ZcLp2WrfwZmzyacojUCOPgmx59kyZFItiPmssN5P3eVNhTAPFGVTuasLxQeUA2Dtk/yheRI2jUbL3sJpq5TeDJWJC3qzMSTHA65z0iP2
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(39860400002)(346002)(396003)(376002)(451199021)(186003)(6512007)(6506007)(26005)(478600001)(36756003)(52116002)(38350700002)(38100700002)(86362001)(66556008)(66946007)(66476007)(83380400001)(4326008)(6916009)(8676002)(316002)(2906002)(41300700001)(5660300002)(2616005)(6486002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Loz0W7DLBqSrj3fXTVMX4CzZxv6i3kuoLz88wVAs5/ABNFfAghuIS1KVxueL?=
 =?us-ascii?Q?l45SPY54K7NCY7K5AWC46lJjPCqpoYgIcui1H7OOdKe1UuV8e4SUXGWN13Zo?=
 =?us-ascii?Q?EKNkB/k2lPScWvmx+pHIWKEQyWIOgaS97fxwZIsesFSkZsgAtJfYeQ2cZeAY?=
 =?us-ascii?Q?MmuyVKIGdruT9jBLFUzH9IWUqcJzD8yMrY7PmppCyUwXeG/DIcVlQ3AnBgQG?=
 =?us-ascii?Q?Xwt+6jp0fdcXriJKzW9rJzS6rEVacs6xgGj5FOqq31ZZZNPwoz+Zk2/MEgDw?=
 =?us-ascii?Q?qNLAQcVP9HxvRpA0VI4nS1v924egDkgb3sOggvo10dSHUzC/jbBQnl1R8aN4?=
 =?us-ascii?Q?7FehNmJMenrsayHly4yLiaUARL4GGzRoXbrQbY4PeYYx9b9NJSp0TTAQ+Kus?=
 =?us-ascii?Q?8J+c0o1IshetP8JcydWdWkxmBitHdr+lB3hWTqkkU55thWTcja60C/sUYJcW?=
 =?us-ascii?Q?HNlvhuLaW6RQ0FPKw2JshNTvAz4XTCJWah/YyDKzRNiYiVzbYoHHB705KSc4?=
 =?us-ascii?Q?QwSFEe+RulaXEqNF5u/rJPqINSqMP80al1DnNpr2scsCHORuKE90DUABw2Uw?=
 =?us-ascii?Q?w2CLIotrh1iZ7HR/YgX9aLdoOdyMjEL5rNbYIZR6PDfKQNZbN2VelDE+LsmX?=
 =?us-ascii?Q?umBJGd+LFo7AtPxIDRcbR2oYZ9m2xf7/H7mx7lQvMA6NqZgB5iQmWF+De25P?=
 =?us-ascii?Q?F6T4AMl1vB6WAzH11l8zcf+ZoAmxzkD7tfTKmiq6eX9o0FbD5dAtvhE01tlb?=
 =?us-ascii?Q?aUNrDVhnhY0zic8mM5br5BeGt+2AH/p7mOyg278u+VUxCQ3LDDbWrsIbR/7u?=
 =?us-ascii?Q?+ig1r3QXkIHYPxeavzP6djVbe9q8TUvpZDW35PER29t+Q5700UBtJJFl8/ln?=
 =?us-ascii?Q?RohmNvqpFHJX8D75fi77juNil1jwkoo6VPkgCLErdZ3DVFQxRt3dISXUVgJW?=
 =?us-ascii?Q?lPeMEur6zeAZrg42PRbd33fPNDX7XWEC1g8yUMy+nNSaJk/Fw96jO9YXXy6W?=
 =?us-ascii?Q?1XEBCQFK5u7tA8RhKMuY0fCWfo8LASuZcwOLCZ7GrEgy+HaSkVV1NWqZbxKW?=
 =?us-ascii?Q?noZAxQwYA2jb8lW0SjHPMBF46g4jhCGE/kQwrQVMBvTVwaNyKALXXdJJuZcp?=
 =?us-ascii?Q?HORsu5hvEjK9OE4hblWsbLMumxzDXPy4mGc5ILlmb6iE3EU+WbxbzV6G2urE?=
 =?us-ascii?Q?dNwBfrZAs9EDz4aXGMtgEFfzvnkzyCYB7oacfVYYMvBz0dRHIipttUm61kKH?=
 =?us-ascii?Q?b+onkhq/0GF0dXfwqqcRMulit/+6yftEVuAbb5b5Sh0752yOsPd3TlDUyQI8?=
 =?us-ascii?Q?5RfBtdJlCnjas9kVMQ5xGflXPa9jeyXrVKkSfCOapHhndF7yB6nfNOwNDQwX?=
 =?us-ascii?Q?vOALUSWtBEseiJS0e+dEzTn+L8lA6TPZrR0Y7jqNrCIP3YZqmUKplepE9chw?=
 =?us-ascii?Q?JXvcREAkbNA/YXYFN4o7s4fcDRrcRPQbQabs9mmT57UUw7iI7bI6MS53QvgB?=
 =?us-ascii?Q?AtA3t3I6qSGg4RB6sjAKyF75GLubB9qnJ5Qh5GznPDLVfKNgYgEeqWrGnVm9?=
 =?us-ascii?Q?ThXjKBtglQ9+tZ1LCjf89q4KlAxTfzNwbyJC90Moc20BA/Hve9NTskMeZrBq?=
 =?us-ascii?Q?wV5FlrWDkOWoty0jQM/XEIw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 792e7424-0d1b-4b94-28d4-08db33ce06ed
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2023 23:00:17.6406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 CPj2zFDuNNDqin9/EI+LVXlsTEiEWGNPVNhiIuRIlncsHnXAZvuuJQR7ZLLFzTbuwyUUXHqzJroGkotjHfAGVOiEZyQkT0kKcJmLYa0Snnqnxn0/LZcTNHcDVQziinAA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10184
Message-ID-Hash: KEVEJFX4PC6AIHRIUHRELHEDU5R3DYYP
X-Message-ID-Hash: KEVEJFX4PC6AIHRIUHRELHEDU5R3DYYP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KEVEJFX4PC6AIHRIUHRELHEDU5R3DYYP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

No drivers are using params/num_params any more.
Let's remove these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h  |  3 ---
 sound/soc/soc-core.c | 11 -----------
 2 files changed, 14 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 276afdb1f445..3833184c187f 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -690,9 +690,6 @@ struct snd_soc_dai_link {
 	const struct snd_soc_pcm_stream *c2c_params;
 	unsigned int num_c2c_params;
 
-	const struct snd_soc_pcm_stream *params;	/* REMOVE ME */
-	unsigned int num_params;			/* REMOVE ME */
-
 	unsigned int dai_fmt;           /* format to set on init */
 
 	enum snd_soc_dpcm_trigger trigger[2]; /* trigger type for DPCM */
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 04f1bc8a3128..9bbcff492c1e 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2294,9 +2294,6 @@ EXPORT_SYMBOL_GPL(snd_soc_add_dai_controls);
  */
 int snd_soc_register_card(struct snd_soc_card *card)
 {
-	struct snd_soc_dai_link *dai_link;
-	int i;
-
 	if (!card->name || !card->dev)
 		return -EINVAL;
 
@@ -2317,14 +2314,6 @@ int snd_soc_register_card(struct snd_soc_card *card)
 	mutex_init(&card->dapm_mutex);
 	mutex_init(&card->pcm_mutex);
 
-	/* REMOVE ME */
-	for_each_card_prelinks(card, i, dai_link) {
-		if (!dai_link->c2c_params) {
-			dai_link->c2c_params	 = dai_link->params;
-			dai_link->num_c2c_params = dai_link->num_params;
-		}
-	}
-
 	return snd_soc_bind_card(card);
 }
 EXPORT_SYMBOL_GPL(snd_soc_register_card);
-- 
2.25.1

