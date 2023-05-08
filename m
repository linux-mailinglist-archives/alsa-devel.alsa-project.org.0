Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C446FBB8D
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 01:51:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 372EA1198;
	Tue,  9 May 2023 01:50:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 372EA1198
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683589899;
	bh=u4qP/QJgLKg814UKnZPJr8h+xvPNXxFTWcpBaxdhvKk=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pfvmLSevMicy02TXYl08tJ0RZWlXDXyUbxvCReGamSNnYIaYBac7MGnhIwQ4BbUP6
	 TPWx4+QlE0OFYQKA+UFiR9LRYifiRzrmlJToR6RqyoeIUW/aPz1HAAwh7yoUzSwVd2
	 AFLndY8wrA5tPEh91waczq17sJrd/N/dVJMDZVJA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C1633F8052E;
	Tue,  9 May 2023 01:50:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8A89F8053B; Tue,  9 May 2023 01:50:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20710.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::710])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C2297F8032D
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 01:50:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2297F8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=S2bF/XE1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I15Qc1ntUnoNxWOyrVm2z0t7o0zyVbpaKUZa2Wdc1TxXGZY1Zzd55lqTAsqeEFeuHaPNEG2GgqrOouWtJpKYqJmz2Yr/Furbz2De5Cga8qXg+iAwMHEMV+JxLWeFEEEvMJnq4G0wP9Ek8tycv2zMG1XqvaS049pIvFmZ8TIfLWah9IlZWO+lEHDIwOBrWHkRM7KQCrwBABeGTuxmnSjPWzoaHKh3XM66oLx+PBcLFHCJ2z07RB6r16cRAicESgSUaBKTcEylPo6Rqh3j+JFeQlghKSlZ4cp28Vmveu3RHhJ8NVosdc/+cHP0/M+wYLOTjwsQCK61SmEIYUY7BFdmKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zIRV10xTkiLSVJB9ODafbuBctZQfkvXjXYNjX3aLxf4=;
 b=EbaI/3EJPipagZjwPk+1oQhWxUBATtcYDkkqD0rwf4LKpArmK2TV+dIJ39H2E5pElxF5wiasd6vjADmvc9IIfa3C3bF1/kgwCunu3gwlh4Jcu8jMfK2yUhVWTQ3wK7ZCXlZJNGzGCGOXWzykqWSoGhOYZmTjSHv/B50kcbosyOEQy1MOT6YScPhfCLRt8A/LRiN5UkBZXGHcSopugowavWQhY+ivrf2J4+Ji9TkpdDpd5BvuxP2gvAr3u3vnDBhxviOlbf+COGzVbmelTYBirnRRkcFqNXmDCcN50dVbdsWGyTADqF+ZZERClSpF5MDfbdgFs+uhtuXbXsbffiOcRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zIRV10xTkiLSVJB9ODafbuBctZQfkvXjXYNjX3aLxf4=;
 b=S2bF/XE1bisrWu3dQiLGRoidM2AoaoMHuVMBPzy9UikO5EgAmyWemV4wUjaTxfKWVEutWckPNG1FZGIIcF892/doH5f/GrWhqciMUHlgyiAVOXi0FnOCjhAKooGSvhg2S4NqfnWgKpwAaUY/K6/1YldrL7AQeEexdHwSP9N/LZY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB10226.jpnprd01.prod.outlook.com (2603:1096:400:1e7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Mon, 8 May
 2023 23:50:34 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6363.031; Mon, 8 May 2023
 23:50:33 +0000
Message-ID: <87ednql6wm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <87fs86l6y8.wl-kuninori.morimoto.gx@renesas.com>
References: <87fs86l6y8.wl-kuninori.morimoto.gx@renesas.com>
Subject: [RESEND][PATCH v2 01/13] ASoC: soc-utils.c: add asoc_dummy_dlc
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 8 May 2023 23:50:33 +0000
X-ClientProxiedBy: TYAPR04CA0007.apcprd04.prod.outlook.com
 (2603:1096:404:15::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB10226:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c1830ba-ae24-44c6-581b-08db501f03a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xvUGmCHmfIj3milljbG5yN6XkaMjIzMkGWkmRkkTyfLnsHbQ66K7xRnllfCwiR/Bff9lkH6+MT13uyalg8YQGHbepZcGlGeyOjXTGK7wI4og8BrrN4q5DCmY8Bay3sXi954+70gCDSAYVuTfPlHF1YXHCLg9C+y0i+gIU93jTgp/KF7zZeaiezW+1hjWhXldY4wW+hKcAOKWLVAqZ2gMa36OK3Mg+iAaHzD308pfnHIvnWWcDq34UqjqS4r/M64AoYMfJMFfMPqBbuNXTcqu7/MIIKUDhvxZBaZdqGhlqN35ZwjoxZt0utopl8GkXd7Tn1q8HLom2IgZn97H8wugu71sIwTDERBnChkMofqTl54y5na8nbZZ/BcQ6RBVErkg+8E/umguPRkvbQfQEVOVFGGoSLerUld+k+j0JFIyG/ZEICaLJ/Wmg5Rrj2CFwtEJAFpRoiOvGoifDLPNBQsWzhoWr6T73nVweGiRX0R0DqgxegwGlelxhkRPGfq8P9l00J5BP2xSAHBv40UxsvEkm2v4j4jRgdqCas5n3LHPuGQyfNj8rDgUPKI0A94tcU4nm0jm8XJ6JkGUWhmGtkAMLeS2c1pr8j4aO/caUdN/0NvyOAU8/FmIg5bHm+GW0LfL
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(451199021)(36756003)(41300700001)(86362001)(2906002)(38350700002)(38100700002)(8676002)(8936002)(6486002)(5660300002)(4326008)(66476007)(66556008)(66946007)(478600001)(316002)(186003)(110136005)(6512007)(6506007)(26005)(2616005)(52116002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XZc+X5QWVATvcIBpimO5iUfGs2Lu747/jRdmYs2mpJSJoNvOLJxKbNYvMrep?=
 =?us-ascii?Q?wcsuJnQI+myxoYWu0taqeLK8jSMTQ0V1PL80s49BaqG0M106gd7MX7MN2Pyj?=
 =?us-ascii?Q?ovoeaYXoC5xrE4grX6izgzh35Bb+1KdPHyMrZ35Z/ZuD4i9vr64m6VDtWuAj?=
 =?us-ascii?Q?T/wivMdCzifMUWn1+Q3O39u/orpF9WPQYihjFH6R/hTSpzikSx9XXSSu+XYJ?=
 =?us-ascii?Q?k9ywb/HXmI+c5UjZWugk/HWGZfIB8aIauoEiHI53hogItIrP3Q4LuX8tzC37?=
 =?us-ascii?Q?9k6bGoKMii2oL7ArVaGs2b1XRLPwZAq+c0GZNnXtJ4wEbHh1Kku5ypVWSavX?=
 =?us-ascii?Q?PG4277P4mu0NEICGRIQwkqbMmsOedkDjPP5XbKl5YSIgf8cBRxpGxLHdNcsM?=
 =?us-ascii?Q?ZCxbNhthBUgP9pK9+5aSkZoMRfl/l9Ht8p7kAkwB1YtBAdCxhSlsFSG2yTdj?=
 =?us-ascii?Q?H5VaatTyGAUv+5UQBBLqj1ttiGY7IrmrapHdaf2nvvofhBFVrYF8enD9xaIu?=
 =?us-ascii?Q?4Yp+xdMmQc44eepyujd21nXi3fDR6MxsehOo9OuaznTUyx/s+ChUtorC8rds?=
 =?us-ascii?Q?RMi9ULYTwzCOYkqoXKLyTlKQP8rcgOY2dDXMMs1IdllJ/5AdOFshJoTVtSoy?=
 =?us-ascii?Q?+rjic5StKAm1VAVR+3hl5GbXOeXlWAy76UsCUeSaIZaDxnUrCz7FUZ3EHN3k?=
 =?us-ascii?Q?FeV262cYTrJsUVens3P0Oy4pf21YCLGTPQDu0GIZdJP+2duT16SvS2nIVR/N?=
 =?us-ascii?Q?yR4iX3cbk3a6hGeFCJtiZmo8+Bqr7uaKpZjts50B92bF131e2ymoZTaj8OEK?=
 =?us-ascii?Q?9wVunwoS0fCdQkgWka5eas8ZJ8axTJ+L//bN+6AgAPexMyi8u5hiMOwChjDz?=
 =?us-ascii?Q?x4oJk7E2GmVihV4R7TCfK2qd5Bz54Ho24TJC8pEIKr5N8Dk64Fj6CFbmAJTv?=
 =?us-ascii?Q?lfK+ZKLU1OsxgpD9mwo/8zAzryKn2bjE5tSfjqMZalg9ezWmd+EIWFEepnv8?=
 =?us-ascii?Q?F1PDPw4kYHWKdzngmhlOw848+pR1VG96e1HBBnkkBw6/VgAT5tY9Fcc6eHhX?=
 =?us-ascii?Q?TP8JlO+XqeI/KyHUNWT0yOl+4oynKupOhAgbE07vevUE4r3jPu0/o38NqGMT?=
 =?us-ascii?Q?BeEIYWiU7zdKhuxhB+nsCFUQ1ZcRCHphbg7yF5gXzNw50BiVsiy23xbYDgfI?=
 =?us-ascii?Q?Ln0pOyT2y1G5h0LcNUlDrdw1HWijD0uHYXzCPTYUmIbYbWqIcwBlKcy2Q+fG?=
 =?us-ascii?Q?83J4iueVxb/vEsZD5fExu5N4ZPNECiNZfBN7A+3rP+l8+JCr9ec1lVzXczFn?=
 =?us-ascii?Q?ZtsgKO7j/VTQyaufeqoIvdZ5YqktbUSeyZhjDwUk+BkzysZc2H5bMZfkOlnI?=
 =?us-ascii?Q?YBdXKDFCMfiO8gwqzc/ZdLTQHWNBNaShg76KKob/tFs+lJ7c5/BxK086p9B1?=
 =?us-ascii?Q?wzogOAvSo7IUGhlUy8REI0t8TtC0cGIutuXeeJ/mZ9izqCjimZBZrqgCUw5Y?=
 =?us-ascii?Q?xkcoDk9exxrWNodmWs2Rs3UwYVgHyeApmGJpvbedpwbNGxl5udzSSxX5XseE?=
 =?us-ascii?Q?4AI/daYgDG2028tF60mCNK9PNlh8RrpJ+5/bOlr/WT/SApVp81GaV0oqi0mr?=
 =?us-ascii?Q?lFVEtLnftYoply7KJBADDQo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6c1830ba-ae24-44c6-581b-08db501f03a3
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 23:50:33.9523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 p+fEmA17PHBpAWAjgA8zNsH8e6K2YsXxgGoxWdki4TuZHaJXP98XIBSnM5v7BaYntxsvF9cUIkC652w62jBLTDFmrEouPQzTOuRg+HLb0zVNfHaFNGtw4olndtJOLkD3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10226
Message-ID-Hash: LNJFLKOXFNEKPEVWIAFWGBLU7FJJDW3T
X-Message-ID-Hash: LNJFLKOXFNEKPEVWIAFWGBLU7FJJDW3T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LNJFLKOXFNEKPEVWIAFWGBLU7FJJDW3T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC uses dummy Component, sharing snd_soc_dai_link_component
for it is better idea. This patch adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h   | 1 +
 sound/soc/soc-utils.c | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 05004c048dd5..533e553a343f 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -878,6 +878,7 @@ asoc_link_to_platform(struct snd_soc_dai_link *link, int n) {
 #define COMP_DUMMY()			{ .name = "snd-soc-dummy", .dai_name = "snd-soc-dummy-dai", }
 
 extern struct snd_soc_dai_link_component null_dailink_component[0];
+extern struct snd_soc_dai_link_component asoc_dummy_dlc;
 
 
 struct snd_soc_codec_conf {
diff --git a/sound/soc/soc-utils.c b/sound/soc/soc-utils.c
index a4dba0b751e7..11607c5f5d5a 100644
--- a/sound/soc/soc-utils.c
+++ b/sound/soc/soc-utils.c
@@ -224,6 +224,13 @@ int snd_soc_component_is_dummy(struct snd_soc_component *component)
 		(component->driver == &dummy_codec));
 }
 
+struct snd_soc_dai_link_component asoc_dummy_dlc = {
+	.of_node	= NULL,
+	.dai_name	= "snd-soc-dummy-dai",
+	.name		= "snd-soc-dummy",
+};
+EXPORT_SYMBOL_GPL(asoc_dummy_dlc);
+
 static int snd_soc_dummy_probe(struct platform_device *pdev)
 {
 	int ret;
-- 
2.25.1

