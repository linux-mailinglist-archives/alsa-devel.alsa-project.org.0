Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B36F873606A
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jun 2023 02:07:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9CD4852;
	Tue, 20 Jun 2023 02:06:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9CD4852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687219654;
	bh=XK0ti3Ek5Ev6dC94EQFoYuIiwkiHzvg+4xJFrWOlkp0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iv+hXk2ECAdTpAmwGEmQM806a7gooGPstMoLwdKe9xescjYlPDZkPFEk62jQf3lwJ
	 1MWEZnOkGZ8hZUOwqho31OxHpJx+k3uOsZfA4WEEJK/dDxtB9eApyk7+96/MfZXjOW
	 eSWvjTs4YwnMqr1qQij1PNgHl0+dUVymydESf/wk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8DBE3F805AB; Tue, 20 Jun 2023 02:06:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45D54F805AB;
	Tue, 20 Jun 2023 02:06:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E023AF805AA; Tue, 20 Jun 2023 02:06:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2071c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::71c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6FED9F80535
	for <alsa-devel@alsa-project.org>; Tue, 20 Jun 2023 02:05:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FED9F80535
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=CmXtJund
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mSPZ2Py+ZkW+kuFnQ1m0CCpnDfsY7h/ZpI3TghJt+nN5J/rBfQ5vw5i4v4YY4hUigdixsVYt5awas4H/u9xin6EWRiN1oCp1YDp7mvAZ3lc/yXXyA3cM1gecVxLkTLzHWpBtlu/ZBsM/R56f/nqJxkqq3PfokT4qctMnfnShkVfneU0GAPe8CBiFOOCUHLMzjELaAQb2zF8ySTKfKEQ2lTL+3FqGILUxWqVMAOStbvGLUvgr9vRB2msn1nikhtnXqkx1lZqfB9dCAvK+hvdguEk+6mmSlg/KHmrMCh959IHpTmxnvdcS7vqnpqqNwrXiGrCxIAGu33zxaz08euYpYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rn5pqB2VD84GHdbCVnkJVfXyoIxigbqfHBdEUUFGO4Q=;
 b=kyDiA3IStauA1Kw2rFtrbPmvjmfXGfpFybDxsFroodC9DRygM82jWypfBdRHLMPLLg6pg1eXtC5kxDoRBGwUkTvx05vw2PByCyo1IdnELumUZk40/ZpuP4AbR3EEHWXDVzyGBYkr+ErYgAILb4//2dNSZFprKir0/kOBU7r6TXqAJoEnYNBe0ueay6aL0qLjl1bk290d6XME/FArqJfxBNFHI06J0PPQbJzKWYFYMotxoODokxdJGsxPCOMeivG+MieHITmZSzlB1olxCfajMJOf7TXTY5w2ReG11xYt4ahhWJplkUjRuI+TuMqo51tW0FKavkF88wycbTaeqBhwCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rn5pqB2VD84GHdbCVnkJVfXyoIxigbqfHBdEUUFGO4Q=;
 b=CmXtJund9AdjsCyn1WsPhZLgAS9UobmMivJzBQnoOpddAjU1p2zqoq+CFlJsBxzxuimO4l0bPCxABT8yTSwvvVJeZFASCZddomo+QAubyWBwgorbuoZPH/TkpxZPpDUlMxtnmcqYa2NNAOaeNSCK6SWbB8VlDvY9Cd1kwNILtP8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB10176.jpnprd01.prod.outlook.com (2603:1096:400:1e4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 00:05:47 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26%6]) with mapi id 15.20.6500.029; Tue, 20 Jun 2023
 00:05:47 +0000
Message-ID: <871qi7dmlh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 8/9] ASoC: soc-core.c: use snd_soc_{of_}get_dlc()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87cz1rdmp0.wl-kuninori.morimoto.gx@renesas.com>
References: <87cz1rdmp0.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 20 Jun 2023 00:05:47 +0000
X-ClientProxiedBy: TYCP286CA0344.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB10176:EE_
X-MS-Office365-Filtering-Correlation-Id: 538b4f4e-ea3a-4624-6ca3-08db7122199e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kYEp6Awzufr4gMjnda6uAwu7cHR8G5eCJPGnPocM8UOfoE1BZH/nJ4w/bWLedANzKVREu/g89mYtIT6HGm0jpaJrYsnaXS12sY8SIvIbew8XkuiMfspHQ06lNmXkoWeJODU0OsRgWRmf6F5yQ/ChQsPoz4P31s0QXxZsQQ1iLL8D+WH6vJmCVN+j4phq7Cm00eVn0xybnQjidDEYVWEVEsNRkokDMwNBTyIDG6gZZpELe2puEPHPE2Xh5gaIIfEFu1QPwrzB3NEmLqV/3qCboBmDJ+eWfVDvZYgvJZjahb6w7waz1WEdvQLQZFQ+50QpMty24rO4h0p8i1QbIatznu86jQJB7X43afQHFN4oHXFdAtFivcQJHQ60UmD+3PD/oztvJdLj91MqBvgAGqgZ2POnCjiKHBi8pAt686/QZpZ5oSC+GY+KspMkqgZnhQ22FDfKidmCJIug23TVN8zQkMkS7xT3IFTyLR11hEmv822YB45wQrU7dYfydXYzJm70nU1iuRTjj4ZR5JYtBL5njW2vzYSpyBXKr196KzqHzX6WIUaO1FHeAiKbCJsptiozRCqFwBM1yk2X+we0IOFSYW3fCIFTvlFAumfApkd5rFmn9dMRGRYEUvgbq2wmSnWv
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(451199021)(2906002)(52116002)(6486002)(38100700002)(38350700002)(2616005)(83380400001)(26005)(6506007)(6512007)(186003)(41300700001)(110136005)(86362001)(478600001)(316002)(36756003)(4326008)(66476007)(66556008)(66946007)(5660300002)(8676002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oOAn5tBwP22ATlsq+5ZLmoUaEGI1tvFN+K9NIXFVwPT6wyNEOuJTI2XRsvlb?=
 =?us-ascii?Q?sC2ZEPY0DP5WL4Hmxa0GKW2VCf5gTXKQwCAykD8o/vTM0wHdrzjh/v3rR1A8?=
 =?us-ascii?Q?cD4AAV9aUNwiowHLrLeFet2LlTQp8yOQ46J93AESALx0SraoUQI9rfH0tgB7?=
 =?us-ascii?Q?4mOGHJJ3EIa68eQkQZjnp9IUnUgmU/dSlFeQ7iQQYP99SRla0S4kBPKwmcEh?=
 =?us-ascii?Q?REQ2gplnCp2hIChXFF5kAPWU+HgqNzZofpgvs3AGUPGIcfWvV87b8i+DMjXy?=
 =?us-ascii?Q?GDbpD4dSbgN7DxAJCK9IDvf5RiXeEzsYIPS4j36MXH8pA0LiXlZltpG1dtf1?=
 =?us-ascii?Q?3CxmwIqSrdk8pbWX9OzTldFPxNx8zTf74bmOeZc1uPN0NMzB8ck+kgvax4BQ?=
 =?us-ascii?Q?BcjTYWLS7uNfDDyFrNb4uicNZR3o04FvY+ZiRSRIXZ6KCIH/at5T1NHjooDz?=
 =?us-ascii?Q?z9+r0XWlzDMDGF+N8XYTOFiDEjL75wAFUNdmw4ByZ7h9ywu+EFTHee5dydzU?=
 =?us-ascii?Q?ti4CwptS+bCYSTpsX8Yr+hqN1zRv3OpIgc9G13DDL4bYXYxqvNbuRuuJddyZ?=
 =?us-ascii?Q?oI3d4V9hBOjGefuMI8niDFFmdtnrulxGAADA9HVgO1qGUvXI07cZSdqyhQMU?=
 =?us-ascii?Q?jt0Qd4KAsySR3FBuDKSS8jb4/PCS4s4wfOaGcIlouyvdpItScmP3OyzbqWN0?=
 =?us-ascii?Q?AJkCcIF4mdvLouV4w74xeVAwtMQwt2s6TqP4tyCh18KHElHg1xaa2RSLDv85?=
 =?us-ascii?Q?6chcf//ZwH569eQL3qxiGwRZnTepB7Rc5KL6Fpyk5zXZf3DaGlgMX5Pi1rtY?=
 =?us-ascii?Q?c1mLqPN9DSpiEUUg9u5rk5+WDFOcgbuga30IVq+cXRkDaEIvgemWVVh9spJ8?=
 =?us-ascii?Q?52Vna3l+VfZ/ttCbyTmBLS72czdxDqtEZyvJHVUy7azV6NjIupYFdEH84h95?=
 =?us-ascii?Q?QokFLbMl7z43MhmCJEvapwJjeyx/c+whe667yiVR1rOqnaU+WUsnC0JYqbjc?=
 =?us-ascii?Q?6fL/wfaPKde+hOy1hNSDVQnB+TBCirnsWTS8serT9DmavQAHh/w3vZkgp3Iu?=
 =?us-ascii?Q?lY9L9aM7VfdLC8GoQWyCxW4OE2M515SlJhXpNfsefJd/rNLTZGG7PirLZ3eJ?=
 =?us-ascii?Q?Ig8n8LA6LqEcoTzkpGBxaZSZlm8srfjxtkfzvaDD88fnC+3CEp34IdCsJiS0?=
 =?us-ascii?Q?FTVgqfyIhgDrJKCnEosT1UcwgZObEgPojjgdlRpT5dBk0HRqET8GctQfivb6?=
 =?us-ascii?Q?0OXsX5Lioi7oRMY68wXeEhYi3EmpSTLaRXSwhdCsLj63PvY8GCaHIKoW1t3X?=
 =?us-ascii?Q?IPCvOK/jwj3Z+DIUvpqssIfxRTFCNWIu3ltaR6FQUt3ROmeyWDhEo6arK+Sx?=
 =?us-ascii?Q?5EKwoP+3ePRGEYnaqkZ3o4GU+jhL5E0Kgl+w4U8ZqKovKOsO9oqaRe8RY5gS?=
 =?us-ascii?Q?Z23X8ZMcrVTL6nt4kpxshQOCxny0yzyClwxM1h1UF1R7d2Hli0MTQ28/B/tQ?=
 =?us-ascii?Q?ccsX8lAs35T7vWLxGgQGY5z3cfvWzFNstHc4fl0YFzlt6PxKDHPAXexDgMqP?=
 =?us-ascii?Q?iS+ELQCe5Q8I4jKeABQ9e5lUkU08PwaUrLfwq4nEyLJ4RVnKQK6K1ASoUHIM?=
 =?us-ascii?Q?l9TnO+qWNxUumSk2i34+viE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 538b4f4e-ea3a-4624-6ca3-08db7122199e
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 00:05:47.6881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 +MiUvTnmGso3vURvKrSYQKrnW24QzWQda/lkWxuZvNkiIyCnjnib/6NO/2t5S9CUtnDl5xDMzzwnurY+ZAGBv5iufmJHKRoUM93pgD+CMfUkkn+GB0UkAf8PayyJYwyy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10176
Message-ID-Hash: XVLGSE7H237U4SYH3SPIHFLTJTEH66U2
X-Message-ID-Hash: XVLGSE7H237U4SYH3SPIHFLTJTEH66U2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XVLGSE7H237U4SYH3SPIHFLTJTEH66U2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current ASoC has snd_soc_{of_}get_dai_name() to get DAI name
for dlc (snd_soc_dai_link_component).
But we now can use snd_soc_{of_}get_dlc() for it. Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-core.c | 24 ++----------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 7b13b1b232ef..f06a20773a34 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -3402,26 +3402,6 @@ static int __snd_soc_of_get_dai_link_component_alloc(
 	return 0;
 }
 
-static int __snd_soc_of_get_dai_link_component_parse(
-	struct device_node *of_node,
-	struct snd_soc_dai_link_component *component, int index)
-{
-	struct of_phandle_args args;
-	int ret;
-
-	ret = of_parse_phandle_with_args(of_node, "sound-dai", "#sound-dai-cells",
-					 index, &args);
-	if (ret)
-		return ret;
-
-	ret = snd_soc_get_dai_name(&args, &component->dai_name);
-	if (ret < 0)
-		return ret;
-
-	component->of_node = args.np;
-	return 0;
-}
-
 /*
  * snd_soc_of_put_dai_link_codecs - Dereference device nodes in the codecs array
  * @dai_link: DAI link
@@ -3466,7 +3446,7 @@ int snd_soc_of_get_dai_link_codecs(struct device *dev,
 
 	/* Parse the list */
 	for_each_link_codecs(dai_link, index, component) {
-		ret = __snd_soc_of_get_dai_link_component_parse(of_node, component, index);
+		ret = snd_soc_of_get_dlc(of_node, NULL, component, index);
 		if (ret)
 			goto err;
 	}
@@ -3521,7 +3501,7 @@ int snd_soc_of_get_dai_link_cpus(struct device *dev,
 
 	/* Parse the list */
 	for_each_link_cpus(dai_link, index, component) {
-		ret = __snd_soc_of_get_dai_link_component_parse(of_node, component, index);
+		ret = snd_soc_of_get_dlc(of_node, NULL, component, index);
 		if (ret)
 			goto err;
 	}
-- 
2.25.1

