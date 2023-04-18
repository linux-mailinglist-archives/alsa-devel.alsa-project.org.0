Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A117D6E55DB
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 02:30:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70DD0DF4;
	Tue, 18 Apr 2023 02:29:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70DD0DF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681777801;
	bh=184jBGANhlzfvWfgETZHe6WC2XeCrsieDdx1jPzx4K0=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oYr+oQO6mWjr3nDJfOk3zGLyZ7X483XfWT9hX1to07gZCBWi85eZ61FkhYJEXzywO
	 /C7B+tSmNgiLMX5DUwr/TAqltWzn3lPFAv8RplfTsihQHD4VVt9UvWwbVtrMBLYFHF
	 UVlG9IM/Po59t76PQY1wmlN7kaOSgcuJXMqySetA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C1A8F804FC;
	Tue, 18 Apr 2023 02:28:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EBCAF80510; Tue, 18 Apr 2023 02:28:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2070a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::70a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 09215F80212
	for <alsa-devel@alsa-project.org>; Tue, 18 Apr 2023 02:28:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09215F80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=KEtPKLHA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YJbHmuTTSFEgCdGB3mgvl8+kZjChnOeZcTEjMc1En0ZhPjtDA6TV/EJ24YqQei6Xv454pJf0phTYj4pbpukqdhuYOyBhU7WKVUsWYCo0+fkNE9l3VinS2obLijN0U441z2mZFkMiAePI12sH981yC1b2EE0ndEc6vO7CPjPnnjwlpU4k960GFwnCiLbKIwxszPrm8JNr4S5d9Rpr5zS1uYtNyI1LuuoEnzShbva3UqyVKLN0jn/uBFR4IjrCdxEKIz7Buh9rLxbWvDJul/vHgyw0MeyoGlray8sYg6Zess6NxNil5+CjaxzHKLjRPmedieSrcMTEiHV5gH9t0PXYAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=otv6T9ckUvV2ewdzkVkWUbtbiYsexoEoGjgO2QjqJvA=;
 b=I+GNIb44B4wPYapbmGAsoQidGTpjRKRwhN5E7YkfGhGEOcKyJzCJD4634Y9NpCfCeUk6O27kim5gR8ZHYJcYH6KkcHTE050VYianxFdqUyBqfhuzucOpfgQgMfUbbD98o94B7Ki8s7o9BHGpax4yBwJntQQ4Zifd2QlvyHu9gwOiP4qZT/KMIquNVSQ0HcZCeS79OTKIM/MJFs7NVN/m3/vWdsH31NLOB/1Po9wj+d6eLJ9/SEEzCr2Fu1lVqmReJzyx8TgJR0e/yuwRT+YA4vJXwV+w5DmuTFBgDIf2NpCcAEovguhSg6/XaoZcEEUTiw/RgBXITOY9Pkcj2RL6rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=otv6T9ckUvV2ewdzkVkWUbtbiYsexoEoGjgO2QjqJvA=;
 b=KEtPKLHAJj6Udd6JVWv4LsZEYiwh9okGhERkxaPZCKM8tfeKH2ctFL6KDl8rAqNdekgivaTXLXqbFsCcYsVNOkZKPJ8kp9HQL/OhzfhaPfh93IKR1hxvjYylA621ZJsmGTbRHOa84ihTluD3TAyIOpqg9pLL5y+njV0hYrkIM58=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS0PR01MB5665.jpnprd01.prod.outlook.com (2603:1096:604:b3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 00:28:20 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%3]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 00:28:20 +0000
Message-ID: <87o7nm2fvf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <874jpe3uqh.wl-kuninori.morimoto.gx@renesas.com>
References: <874jpe3uqh.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 11/11] ASoC: soc-topology.c: use asoc_dummy_dlc
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 18 Apr 2023 00:28:20 +0000
X-ClientProxiedBy: TYAPR01CA0226.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::22) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS0PR01MB5665:EE_
X-MS-Office365-Filtering-Correlation-Id: 1900a6bd-e94d-4fea-b978-08db3fa3d019
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QVYw04a0y/cTl50JC/5CV1qZ6uLfDdXFIbohkJincmrTo5TB2AwrVQwcazJfHTBx006MUXpA20eSlo90HVQDe768NfN4OUR/mV9duQnQ9yH0FUUNOQ8orv9Yl9GnitgiEH/k+SlXrucInKMXzY+PJOk1Ket4Bem19OPG4z0nBIV8f9d5FEHE7KvW5E017Qkelj56rLQEHOgzo9sIGzCCS7rTlg4U0d/VCYoAsfe6JSbL/lrB4C1CIOoUWgNBBAKXkBp9f6BtUw0QEGsKfh8uGKUwGE2Kp+9nZbey5lEIB61kbiuf/Q7GFyxXfJFuNKVrDQpSGHc0jF47uWim2d0549Xr96ZgvFXoTB++fZTIxkzQKqO8j/NrgFObLwX18Tzem3aZ0yrUqsjbRmXBrcSkl3OvRfxoiPXT4fCKV88RpmTLGVPyZEW7iNRGzuI+JpKgIHK5pKX9tnQ58ooIBRoVHD0riJjiRgi8wsJyqQ9U+O9gzHRj2M01BahI8+DakS0+QmLeisWmXP8tuV6vXNc1FcER9j6W2jC2ueQZnETPMHYee1DFgh6D+t7mU5chyitPVWAc2E+QxpDSphUZulvw+4TtcFWQOy4Dry5KpTvIK61SZkBMXaKKwQpE1CFX8zYS
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(451199021)(5660300002)(2616005)(83380400001)(86362001)(186003)(26005)(6512007)(6506007)(38100700002)(38350700002)(8936002)(8676002)(478600001)(6486002)(52116002)(41300700001)(316002)(36756003)(66556008)(66476007)(4326008)(66946007)(6916009)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MpF03i27yXLDFuuVzUen1h/qoN65r6c8AYrjBbfXAnnaXr9p3/lOAmnruXw1?=
 =?us-ascii?Q?ZPKoh9z0TNQD13o5bmZFyyvDe3cFGfXqRfZmoTpRCv8/SjOwE94as88dS4aX?=
 =?us-ascii?Q?xl5jer/E7V0dn+SUkZ3bR/Ou/57xbvRNwoQwLMWoN0VQisAOB2frbrugajyX?=
 =?us-ascii?Q?GdZ9GqaxEvTZY/WKbW5EmLsWU94N2Bw9t1gvLlf4StVdOhIslMe9J4GWW5ps?=
 =?us-ascii?Q?2rZSR3qpA6kOU2OVt88d5dAEWcqTBQ8EZSVhP7rOMDVLasrv/aZQlSjeeuOZ?=
 =?us-ascii?Q?cEbCnHWqDIa6p7EFPsG0laqmHVVDDU2LubhvXnSqubXHnjLdADte8EzC7k5A?=
 =?us-ascii?Q?fofGw0+ZAFhbU9EDcCTBIkHPIxEgnO7q2aReSPwsYQi15zZcbfdMgIdRU63d?=
 =?us-ascii?Q?7E/bWb4tw/4wDmMOO/ZoEOrgFTZniCtr3MTk8R5TN4NqA4nAsF3YKsrZDecV?=
 =?us-ascii?Q?IoXjVoP65TJVS7oyimU+Jjncpmwbw1tzfVUTdQffNX/7pSfYGo9DwY0WMaoD?=
 =?us-ascii?Q?ZbO2NDP0K1XBzlpq94Z+jDs+lB0rZ6lV0Uw5gQU5EOxftDCsp0R7ytFInVeu?=
 =?us-ascii?Q?IA7j9kH5Puvf7rJjX2EBZb2MiTQY/ZO3GcF02vQPEvc6/2zqoxa2lsY6vugb?=
 =?us-ascii?Q?7sYqHKUcyC2DkFm70pqPBojgQwPlElVKDfYfkpJo+H1EXRM+f6Q77FPwqFDd?=
 =?us-ascii?Q?v949A49fngYJPqtxTdml3F53xYe8jTtd9J7l1yy1qy2IkAIiKRXHzXz5a3zo?=
 =?us-ascii?Q?mi58LpHUDhPfF61WURwiFK5BBxSfPoGow+S6HR5TL67CfUAhq0XYsstGKM4W?=
 =?us-ascii?Q?b91ORFw1BnT9DtNFhOyEcwMWPr8+3zYbyCE7XMRswePHqgdhsYAo124sfe7o?=
 =?us-ascii?Q?0PTWPft8PtfJF/w191PN/TM/80ur9P0ONvD73+FeTwXesQmFec0L3VI3CZ75?=
 =?us-ascii?Q?kGxuAcCi85fZzLH53D2SdUH93sX7gM0iWkqCVdNM3LCztMAhk833HFnmC2nV?=
 =?us-ascii?Q?+K86EXbluZacryLzoKmks90oqeMCcXMeF2nZl1sNyDeSmYLOczcg0OG+KU17?=
 =?us-ascii?Q?5snkIT7GxiHrUrEKH56cad2dFdMT8YCOKgpKwAYQEwKZ8fl/QDLK4LIhLCMy?=
 =?us-ascii?Q?F6zyKjy29wE/egB+1Brx2j+WUkeyy6apY1DALuOH3Pqm7MfG0URjr8q2cYqp?=
 =?us-ascii?Q?KHask0bfXI+oO7G/yj2sruG+XB/CtQhrB0VAL96DoC2pCN80o3N30GqGfOka?=
 =?us-ascii?Q?XMXRQFC802n/tg2K6/eAroruc3VoSqSn/3fpuvFXyCxhGdANvJDypnqklN8P?=
 =?us-ascii?Q?x+XSgA/2SlDwpwc9SBzG3YLXQNB1CjfpJGPxhyqGqhCJ7LfM/lfL/D5k33z0?=
 =?us-ascii?Q?/QT1AcYBtlIxOvfzohIA+vAKNJ5nb7TYBPPt0Agsjmf2HPmOfwt0hQXG/UZV?=
 =?us-ascii?Q?0/T+4WNX+Oeeqkdw9ZgvS7PUWAtaw3poZVbnYpjPJcz8vvGOtYFmrnlYCRrc?=
 =?us-ascii?Q?Y4aA4SXJfgIvZw7rspZcHBJpaVwJ60z4qGfcdf+JQl6DgwOxJXIqn6ecH2m/?=
 =?us-ascii?Q?mFVSiCHKrLyBHd5VhvPab5blF0897Mi2ONxb5fPn2qj9fl2CDs/og7yTAhzQ?=
 =?us-ascii?Q?W3f8QyOYRzEDvKT+O4Yfg7Q=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1900a6bd-e94d-4fea-b978-08db3fa3d019
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 00:28:20.7683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 kTVIfCo9cQxOjC1Ph/Pl1FFrkL87MVLvONPnbMBfeLCI19piwubCfJRdAI/Vz17MODIiy85ksU5bVdLqRulkRdeJrKerXbKf03n5O5IGZHbFmuNlHabSa4XCKJHL5Wv/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5665
Message-ID-Hash: HDHV4RRGJIPOFD6ITE564NY3ZWK2R5LR
X-Message-ID-Hash: HDHV4RRGJIPOFD6ITE564NY3ZWK2R5LR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HDHV4RRGJIPOFD6ITE564NY3ZWK2R5LR/>
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
 sound/soc/soc-topology.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index d0aca6b9058b..873448c4a895 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1685,15 +1685,15 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 	struct snd_soc_dai_link_component *dlc;
 	int ret;
 
-	/* link + cpu + codec + platform */
-	link = devm_kzalloc(tplg->dev, sizeof(*link) + (3 * sizeof(*dlc)), GFP_KERNEL);
+	/* link + cpu + platform */
+	link = devm_kzalloc(tplg->dev, sizeof(*link) + (2 * sizeof(*dlc)), GFP_KERNEL);
 	if (link == NULL)
 		return -ENOMEM;
 
 	dlc = (struct snd_soc_dai_link_component *)(link + 1);
 
 	link->cpus	= &dlc[0];
-	link->codecs	= &dlc[1];
+	link->codecs	= &asoc_dummy_dlc;
 
 	link->num_cpus	 = 1;
 	link->num_codecs = 1;
@@ -1721,14 +1721,12 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 		}
 	}
 
-	link->codecs->name = "snd-soc-dummy";
-	link->codecs->dai_name = "snd-soc-dummy-dai";
-
 	/*
 	 * Many topology is assuming link has Platform.
 	 * This might be overwritten at soc_tplg_dai_link_load().
+	 * Don't use &asoc_dummy_dlc here.
 	 */
-	link->platforms	= &dlc[2];
+	link->platforms	= &dlc[1];
 	link->platforms->name = "snd-soc-dummy";
 	link->num_platforms = 1;
 
-- 
2.25.1

