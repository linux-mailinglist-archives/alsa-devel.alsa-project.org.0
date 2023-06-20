Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C16736176
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jun 2023 04:17:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 301F0851;
	Tue, 20 Jun 2023 04:17:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 301F0851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687227478;
	bh=XK0ti3Ek5Ev6dC94EQFoYuIiwkiHzvg+4xJFrWOlkp0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SniOdGKaxsrryic2B33Gbyo/8kiVkmqypUJkbw02uyhin71DTW19ofiWx+wjQLLh4
	 +nV+8hx0CQ9P7HTnthBcs6Msg9zgBxydtUg793H1ihVKs9oCcPQG0+EFWjjp8teKOy
	 IJMs5fECeDb4so+XBR7IyqmsnF88ww0hdrTvIlSE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 110F6F805E4; Tue, 20 Jun 2023 04:14:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A353F805DA;
	Tue, 20 Jun 2023 04:14:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2ED52F805C7; Tue, 20 Jun 2023 04:14:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20724.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::724])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 95BECF805C3
	for <alsa-devel@alsa-project.org>; Tue, 20 Jun 2023 04:14:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95BECF805C3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=GGVkV8mS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lHOnTgvlnLPJQBqix5kpI3Zc2Ebrh+iQ1Q2SwXT+uskXe0NTYvoqCwh5MoFFW6mAQHh+nvA0lEzOTPFHxwFKlqPGJ+7qR3T3bvrx9yBixEpAgbO6IwWMWw2Q7VOgTPpUR48t7NM7yILVAzK5Dl7vZ8wblDLKaX+JRfW/M6AmNimX59xlrwTohZwdDZbxUE4/9luALmviEOCNlLkSWycdeJx1Q1SsL1Mccb/7KD/XsLVQkoFmw1K4Vh2pwiIjQAJ8X/SFbnXJHTNHSKMPw5OdglqMdjR49hwIKu58GBgUSjAwU5gxaHF+AK6Vc9rZkjwV/Yv8T+5+sMgSi5PGGOD5EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rn5pqB2VD84GHdbCVnkJVfXyoIxigbqfHBdEUUFGO4Q=;
 b=jZ5Uq/V02jptTfQIeeZiuzEQJ/bTWs8Qr2N6VBuH5d4CnGJYBdVZaZp40/GR3mEvolcCFfo3Wp7SPBLx/ehL/C8q6Ris+yoyuw/LEK3HIcHcnQ3aERNaH589K6/1Ixbk8wZKuEVRf82VPJ8/SJl4klTdHefuAXYFkTyTFWKdZhVvj9C1Awidh9taWsqaIKxR/ipyPpB2BQXpFtTx0VnUqd/FJyvIHcKXHW/wR90P6TH8cbebW6ISbHs6yWf0T5egsxFNRMLmQw0YpldDSUclRywLf0qpPWheyRD2RmxwdlYA0zzUEp9dJVtOHSfvCyW0DBU56QngIcO+DzsTyOaZsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rn5pqB2VD84GHdbCVnkJVfXyoIxigbqfHBdEUUFGO4Q=;
 b=GGVkV8mS0BkAtiPjLn+lRWAY/zRRXJC9375XPk+2dLmNawuiUG7TDl5lUy9Drh9pol/B0Mt2vthgUeWmtqGvXnhUYqXJif8XLk4P7zO4jhApyCvmr8dx04/pGxlmDYyiU0IBHAHbQAcH3LzBDmfmaG+xX73RpDlD8tlkz/L6iX8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB10965.jpnprd01.prod.outlook.com (2603:1096:400:3ad::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 02:14:46 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26%6]) with mapi id 15.20.6500.029; Tue, 20 Jun 2023
 02:14:46 +0000
Message-ID: <87h6r2dgmi.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v3 8/9] ASoC: soc-core.c: use snd_soc_{of_}get_dlc()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87sfamdgo1.wl-kuninori.morimoto.gx@renesas.com>
References: <87sfamdgo1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 20 Jun 2023 02:14:46 +0000
X-ClientProxiedBy: TYAPR01CA0037.jpnprd01.prod.outlook.com
 (2603:1096:404:28::25) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB10965:EE_
X-MS-Office365-Filtering-Correlation-Id: 828081d3-03fd-43b9-2ebf-08db71341e4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WDGFCDO36x34xMql+pSrtpCNRHmpX0dzVotnBGdZ8zYVOd6G3nP3nDpHsL/kS5dGM9+cN4rFZGMTrIUBCg+YxKIP7nLCOf9jaGljTYVa2AuKU/AhGQuKHaZtye0iaXTIpTtJmEJLb67grNL9angmqt88IUSql1yfCq4zXakkBx8rS6CWIviCmACGK1fIGl0T9jocLRhD9KeD2mbaLdIXxtBRimzGpbmFMl+jXzr3MNbbQDFm8HTK8MuIzVdo6g1JY8wN4xZomK3iCR1bwTBBgGwJhi/4RaqL8iNPYhZz/HWy26q9fbHoOYhSNY6CXsLEP1RN5hkcU62GZiuUZ8WsxK22WOWgHvxv/64O0DDOerjxnd2hIYuC0rqjRSkhzHOXK6NIK5cOz+suLQ1Or4T2CW4YSuY9wr4+EJN2Y2AB7TPvdmfJvnazdeh3OWIMy/YSmcjMsWleEMo3NzP72yXBMrK4UMXFU+E19xipQ4pSXtk9acdqVpmh2cH8KMDvM8pjGDX5FtYZma99vQSfxNJDSZIbWezCYL1+47oBRuJT+NODFak8+O7JCOFNKRpdC4zKKcDAQCm3KcsAs5JwwWE8N1INF0F6b08rwzmufSO8XzYjJVn9V6T/0zDZC5iZjIAz
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(376002)(39860400002)(346002)(136003)(451199021)(83380400001)(2906002)(66946007)(66476007)(2616005)(86362001)(41300700001)(5660300002)(66556008)(316002)(4326008)(6512007)(6506007)(26005)(186003)(52116002)(8676002)(8936002)(36756003)(478600001)(6486002)(38350700002)(110136005)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ckV+/aJMAjlZLFpsmkmEvWgKrwVxrxGnsNPTezYxaZd66TPruNz7ubRfIE8v?=
 =?us-ascii?Q?vIIhNyRtN9cLwvsiMW+gLgdbAVgClT8dQq06Kr44uyNkJ5PhWRv0Me2fgDbA?=
 =?us-ascii?Q?bc6xAWe+Tlf+OCPOzE3QG05uAq3+C8Sw0PzgFlS2c3rUgp49lq1e3G/XOJ41?=
 =?us-ascii?Q?yAnT4THs7W8UL+mlsTY6XU/stUlFnzuFmTWXAeuIdLfuDt4dmdMmdLr/teTa?=
 =?us-ascii?Q?Gz+fs5d1nZXRJDEpIJc1QNq54jR8iyI8VFd6FQrjcoe78c4sDkBk6S15v4Uq?=
 =?us-ascii?Q?QsjRZVSjaxswVlaHozlIq0zdpJR2UjSvrTn24+NKQbLp85NnjeuFhf3ajF7c?=
 =?us-ascii?Q?fzFcd/zkMKpt27TNASF1ZgO5mnQMr4LtMCPE4qX6SXKHB9WII4F7KbWF6pEm?=
 =?us-ascii?Q?3sQLjc5et12pJKzw1VK0QLAipUBwkx90oxPd3Hn2BxZe1Aa+5MXBS4+z5/i/?=
 =?us-ascii?Q?gmvSBKKInibKqLS6/XQJeM96nRuVnuGQNia1dBr5YhRbn2QjaCDBFhi72QZB?=
 =?us-ascii?Q?14hWOMBjCQ21QYo8l/0RHao4HvlOfmLg/IuvDZt+o6zXI3h8XL5qVyG7CA+h?=
 =?us-ascii?Q?JdIS/vYvxrmZVeIGGvE2hPBYV56m4lJ0YvIf52ToBAKrfE8+3CG3nVG0TYR2?=
 =?us-ascii?Q?p+ogm+2gXBmpi4VPAKIkBusZ6529X4R9zoL1Y+gJuUK3IBnMVviLxYN6v9E7?=
 =?us-ascii?Q?hRdU/ucKCYiBNn+iN/zlex8surillkQZjcJuVBO2/bI1EvBznmD3DuAfHVb0?=
 =?us-ascii?Q?lGb5Tmxyz+VKKFT8wyObtk+h7DGjBOaqQUv54TRkYKPoaEc/5SnEuRcTBW7k?=
 =?us-ascii?Q?xzxDTB+YaKEVqlNpla8Xf55BqoW6FK7qbBhKn/DC9xm3/MdgnjAnUrPokisr?=
 =?us-ascii?Q?TE++JYo2ExxLmI4pCmi9gUKXb4z0i0+uAUmoCz8CXSyauqBmqd+c6nRh6g2h?=
 =?us-ascii?Q?NonUIS/dHSMMIJN1XwB4fSQ2x6RCS4KQXHR5QtQpoZIRp9lZ/ad1TExHIHuC?=
 =?us-ascii?Q?msuqrvAZN72Uud31lrWpRURIOEqV/SZ2g4Kfi3S6mXxAfrI+/kc44tpl7rOk?=
 =?us-ascii?Q?urS5V9vCgeM4trjul2OYKDbVpDO6QPXsrSYoAZ2YhDanjHE6nRttmYyruOuI?=
 =?us-ascii?Q?sFs4gytXd5Uz9/3R9h/niodzoZuge7SIY918ZvBRf2c7nnPMq2J5qmio8wVT?=
 =?us-ascii?Q?AFCqOdFe378FOc+M21jseythN39PEivGEwkFaHG5Q8GMBNSD9+M379pL4WGF?=
 =?us-ascii?Q?EyWehuor9wTl8lZJOB8fAyQ0VC/bN/OuHHmtXPE2F5BTGc3IFJZj/hRJPtne?=
 =?us-ascii?Q?9PhvfEqMSiHKXAMiKh3Cfpt1hK8/5yVrLN9tCCM00sKvVAXvg6RNr3+k9df1?=
 =?us-ascii?Q?DJwARE1Cn/XVq0RhFI4KGEXWA33Z6tCX1p3zAM35S1tsKyIQabSkE+G2O6X/?=
 =?us-ascii?Q?2LfoDmxUkX8p5mRIN+X+NxyRrGAbyiiG7Zlue3qKbTTKhxlBDAv3acM8UaFA?=
 =?us-ascii?Q?WeMx2WPs2WPUuQoCfpd0DBj7epWolqUfS3DXY3mF5wvWGW9NrBoSHGrgs3DG?=
 =?us-ascii?Q?/HDk8BwqKbou82d8XmzKqudALKBhww15oG1sgQfWBJIBDWLTttjFxtzAPOw9?=
 =?us-ascii?Q?jwDMnpQ7iIWnJx19HlzTYxQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 828081d3-03fd-43b9-2ebf-08db71341e4c
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 02:14:46.4262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 eIbc0UOXJR6f4mtDFLyjec4LnMlxCDGoCrxHCJmQjNhOFKa0dE3xpDN8aZ7pSsKttDyOSl3RlzvINJcpqgArc6UlLcd973rLw0w0X206Xlus0YINCbXyACwQ6LG8x4p8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10965
Message-ID-Hash: CGVUXFYZ6S32RVIC26JI3FSHKOX6MND6
X-Message-ID-Hash: CGVUXFYZ6S32RVIC26JI3FSHKOX6MND6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CGVUXFYZ6S32RVIC26JI3FSHKOX6MND6/>
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

