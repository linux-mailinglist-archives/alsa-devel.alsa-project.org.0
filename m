Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F366BA84F
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 07:45:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB5EC1309;
	Wed, 15 Mar 2023 07:44:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB5EC1309
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678862741;
	bh=/SxxBNo4lIq4+GLAM9AokN6vZFqVoB7i6MRM7DVszE4=;
	h=From:Subject:To:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jNtw9Fyp/OTyuLzDEQXJm9e96X1GJRR4FO7PCV1Y7FwCcsWcq9Gq4FNS3czK1FuZ6
	 54LWIz7BoRmw1K+FIb5TadIxZftyCwGN8LibUtDnYOOFkRIPLgxjVqBA6A0hhGrAk+
	 LtuscHhgacOvaMFKmZ4wvsDjbyWtkLXBkcjOZj0A=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CB3DF8053B;
	Wed, 15 Mar 2023 07:44:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51DB5F80425; Wed, 15 Mar 2023 07:42:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20728.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::728])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 728A4F80093
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 07:42:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 728A4F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=hwVSsgi/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fa3Dy29/xhOG/J1wfFpD9KHtJSw/jUipT9kxnL3AW/ILtIpPhEeH5fnV63YcupQW07jX7+RMBxg9KyuyBGSz6Q6PwvUvflpAxA01YPjdKDIRMiEKrowKKXutg8kFVQUfc0ztHJ4ybcMELls4ppiep5W8mWbMsVhiKb69bztTjyuGtbUSafa4L35Il239GqGPXCs//orDZa1gZL6P+XH3K5WyhmxD+FccPh+1MG37pGIbyy0LyzctrpFIOIYoKX6EFwHGcupYDJ0rC7DD+R6vezcdtaTI0378v4r6bHWfohHGB5g1GYXR7JHHWzwGIOb3p2XlVVt0xlwAmUq4JLK08A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yrNb9izMel4j+PUOkcsN0guCt/jbWOShYIYKpQ9JKb0=;
 b=SmUbO1z9nbFBhKoRJp+OjBpXRQbvHrzXbp7Ad7+F3HIcKf5YndeqwTsCgA35ywKH7pB48FZHtj7JhOkdBT4XFhGS+mpbRn6qbF8o01oFjKMh4VVong+WL0cCbC3k+s+S6Fo5KeykdpF10cDumSauwLer411RPS3J4NBa1jokSBH7GisKR2P4jN5Tf7EZK4+nTvniv0BTUQvsM448MFV8JdBmlQBvWG1rwXELiar8pNIBcrj/Ryotnt6gh4x335O78LIcN62a38yKVi0CKVJ+4hw9KXLwXlYPIWtCo4/PDCBsKFRwgWtBCGy2Ju2w8pUJm/4Kbs+Jp/DQ/I/M+AcfJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrNb9izMel4j+PUOkcsN0guCt/jbWOShYIYKpQ9JKb0=;
 b=hwVSsgi/jK6y5cLgmFryTj5hUfBDhGiyyi3llfeRd+ynJIpDz+FUTCjybfJmURPRhMC36BIqo/RrGPX1imEQ9nF840M4eMVS+qs3qZ4ulBWc/ieAWdLqAyZF/ir+hJdjUH7KbfimBRFmSCEqfawkokTcMC9MKd7+We3aH59AJTA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB11479.jpnprd01.prod.outlook.com (2603:1096:400:37f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 06:42:27 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472%7]) with mapi id 15.20.6178.027; Wed, 15 Mar 2023
 06:42:26 +0000
Message-ID: <873566jz1p.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 4/6] ASoC: soc-topology.c: remove unnecessary
 dai_link->platform
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <878rfyjz4p.wl-kuninori.morimoto.gx@renesas.com>
References: <878rfyjz4p.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 15 Mar 2023 06:42:26 +0000
X-ClientProxiedBy: TYWPR01CA0040.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::9) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB11479:EE_
X-MS-Office365-Filtering-Correlation-Id: d7f97940-32ad-4730-1238-08db25207103
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tHAPtXyJDfcbiGlpKCvMgIPHI9lP2vJ14teOz5NSFoEoMwBDHB6kDQdwY/p7dSkuApzS077UhaSGSnaaD9tHNrOg3nuj14IkDiTHxMdPq/8a/DX77+pyFInauc4CMo2OhTkFyLYngHd2949GgiXcYqfZrHasntNL5fLcaf/96v3Y2iAymINNm3KFXBEEz5mQyFrUy88coSHBPVBJYpb/gcpjmwSoWLZVGtFo88k9m1a6L3/gcI77QAc6I/0Aq++HEzJ/Yesh78wTmUPyI/e0CnHSHTZfFBo+JbRoONAsU6xIqvF5WMyC/ULFvWD0iDXfhhZo1R5Gqa2jv2VPheVofmusy0q1E4f2TtLXz/5HPuMNuhfl+Md6S8eR9lYeH7fcMqIPXWWQD+KWxRiAKprjCLTJdiNDqDIVObO/cOGDj17CD28pBccSrFBtNLthuJooFUk1LNRVmZYODsKgvToCnPOn0nHHm3PJuek9UZ9bf+StbSJ2oEQXtT9ohzSTba+xmhzN29nqXVO3/ugeZB9bk3M+/l2lpt2mNWTMsaZLWCI17xdWJUYid3QMql403fKHdQBcxdFdc4Ghc2Tln6TYCgT5pGGkZ4SqVdTLdJK7FdTBj8sRvaTRDTtAKdadGgqyRuUf7iRNh4KF2tclc8QkiLgMAPYM5gIWqfzEyJCvrwwaslOGf0+0NVwaLShqHCh2BQBQdZSJw5qpsrMXVx1b/g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(376002)(136003)(396003)(346002)(39860400002)(451199018)(83380400001)(5660300002)(478600001)(52116002)(2616005)(2906002)(86362001)(26005)(6506007)(6512007)(6486002)(36756003)(186003)(41300700001)(38350700002)(38100700002)(4326008)(6916009)(66946007)(66556008)(8676002)(66476007)(8936002)(316002)(54906003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vU8gwN/bq+BIaItpVkZSp7KZ4C25i6ubggjqeQrDna4Ei0rH0/nvoBMH9rkF?=
 =?us-ascii?Q?ad8xybEzWhgyqUC3QPJgNZs2+Eb6dPJSH4RT3qNlLDrqv/3slp0rAW84wwep?=
 =?us-ascii?Q?77eXvt04s+Af4RXxqJiGrosQQCa+OtYQ2XrqpQeyaN0GxzQ8iyyH0S8RgB/h?=
 =?us-ascii?Q?W1KdYgrwSmM6B7CIi6widW6vJwE+mnvvdtwWdFVyBi0DRkFCvBw6InZRehFQ?=
 =?us-ascii?Q?CGX+KGjg4BFgVT5yzyIDXJJSk1IFfKA+p6GdjKBuXO+L0iozd6JwR3Dc90Ld?=
 =?us-ascii?Q?Dtk8SFmBs6VwrZSAdPqWXcTx1fJ0Dy6lVsEbIGy4cGsaNMHviB7NlS2p0Hwp?=
 =?us-ascii?Q?19yEzuw+BXIDtmd4qwODP+om4wfAbTG+dmHtu3sT7Rd0sq9yZfYPiSKRC28d?=
 =?us-ascii?Q?dqFsxw8SHwcrXPms6LbK6CwXOhGuldY4KrzlS3UCNtR3HaiiA6u7xWDzjkO0?=
 =?us-ascii?Q?xtrVLvmmnddoeC9wVFX5VStZ+ffHqMmsoIyEcxo6srQjvW9rvxAcXtIX77Ay?=
 =?us-ascii?Q?xNftvdmyrOzMohCD/1qXhHzMXFdqS4fQSqfbo+AyTfJWypt41eXIdij6VeVQ?=
 =?us-ascii?Q?eQUt3y5YCd+PP+P6Aw1EHPSJDPEsNjdGW20LYi2gNVCECNBUAf/zEMoIomp/?=
 =?us-ascii?Q?QqdS1+OpxmUeXtZ+ZehYs9jRDsWQ5lL1VlpooZWV9zim8mj0N9GyEFDtQ+JG?=
 =?us-ascii?Q?cgBVJLTbzM6gI1ShZr5gCmJoNQ14eCRNp0HuslyPjwiGuDv/QALSdtKrhZ2/?=
 =?us-ascii?Q?VKwPPbP4hwIEVSIshwQX7zVm1h2SPoxvFKVPKdmwbJBz2Nc/NEx27yAlhCQ4?=
 =?us-ascii?Q?ZH/6CtlyfMDUS30FPi/cPbcpe1Iv0tZvaF4N2OuLo5FdqOff625xW+mYMMWV?=
 =?us-ascii?Q?nOFEKILiO4iFjIUQz7d6eh0WOmnzLycP34YWVQcFCjW7W+5SeM7f2kXZQWdD?=
 =?us-ascii?Q?balrUzTptbiiuy2QbI8d55/UQRvSxxBzQ+VEdpNfrhArCxthDLB8rTGTGNGz?=
 =?us-ascii?Q?pBIDPsIRE1uIqeFhJDDdsNRFEuKzSKUtHo5kdspfLiwTxE5xUl7LOSzV9WQM?=
 =?us-ascii?Q?iCe+Z3O6tYVJQULF9z+PqCkLBKPMc8G36Yl0swfQLXJVE/b9eG1UR0ttfelf?=
 =?us-ascii?Q?L5nWJ2ncmbX477CCq0WWGMnar/yUthBqnyVQ2TmNuBSVdKAV085GImZ1GFP7?=
 =?us-ascii?Q?yAp2MlctPfSjm00hoWPkaiC6A6f2wrX1jq51BAFkob6m/E6YFREvIwdC062l?=
 =?us-ascii?Q?6Qoi933cxROlVIftI+2nba7w3zxzxik0eVnt00H21RF4t48klE7jp6UZ3KCX?=
 =?us-ascii?Q?qIpgs9uNY3UQK7a3FLkiReCYQLmw5KgbyX7HQ7L8H5zb0MGCljkWYCzDG4RV?=
 =?us-ascii?Q?d6TPTa9NSLYOwgGSnWtlqpBNSbG1dRn9k5acNPXuRECQUNa8pmPznc85uh2s?=
 =?us-ascii?Q?r/61and5Fs6J1Wkg7kLr2NO8ykLxxl99v0fEPYkYWTM1PzzdOuVWfgX28sR6?=
 =?us-ascii?Q?UI/cJbo3qsLmjzK/yYkTqwvu336lPHOzXdI6pD1mm//YSYXgunnrU1phRerx?=
 =?us-ascii?Q?pW523XtJHcABNolR72LRfjsTg2/hKiMLlSHk4kCnkFq9/AXgygdPoU6RsOjn?=
 =?us-ascii?Q?XFKpWM9m1tFQvukwp8XzhVk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d7f97940-32ad-4730-1238-08db25207103
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 06:42:26.9683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Yx3PC13O6hXA88hhDG1q2QUJ4rsfgZPN3mftL8cWSvb+XMBO2lRfARhSjtXokbf7mnruegUVoqbT2EKXjoQHF+UV9+MEtpC4WZO2emQh/HINMCUfDg1MRo673IYw4Cm7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11479
Message-ID-Hash: VQR5VR75AS4AXIJAYWADXIK3BTFJBTNW
X-Message-ID-Hash: VQR5VR75AS4AXIJAYWADXIK3BTFJBTNW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VQR5VR75AS4AXIJAYWADXIK3BTFJBTNW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dai_link->platform is no longer needed if CPU and Platform are
same Component. This patch removes unnecessary dai_link->platform.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-topology.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 07421f5d4ebd..7f6424fa59ab 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1685,8 +1685,8 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 	struct snd_soc_dai_link_component *dlc;
 	int ret;
 
-	/* link + cpu + codec + platform */
-	link = devm_kzalloc(tplg->dev, sizeof(*link) + (3 * sizeof(*dlc)), GFP_KERNEL);
+	/* link + cpu + codec */
+	link = devm_kzalloc(tplg->dev, sizeof(*link) + (2 * sizeof(*dlc)), GFP_KERNEL);
 	if (link == NULL)
 		return -ENOMEM;
 
@@ -1694,11 +1694,9 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 
 	link->cpus	= &dlc[0];
 	link->codecs	= &dlc[1];
-	link->platforms	= &dlc[2];
 
 	link->num_cpus	 = 1;
 	link->num_codecs = 1;
-	link->num_platforms = 1;
 
 	link->dobj.index = tplg->index;
 	link->dobj.type = SND_SOC_DOBJ_DAI_LINK;
@@ -1726,8 +1724,6 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 	link->codecs->name = "snd-soc-dummy";
 	link->codecs->dai_name = "snd-soc-dummy-dai";
 
-	link->platforms->name = "snd-soc-dummy";
-
 	/* enable DPCM */
 	link->dynamic = 1;
 	link->ignore_pmdown_time = 1;
-- 
2.25.1

