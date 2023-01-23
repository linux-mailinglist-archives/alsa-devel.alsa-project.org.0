Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B499678BEB
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Jan 2023 00:18:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9174AE9;
	Tue, 24 Jan 2023 00:17:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9174AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674515909;
	bh=UT9OCbgWkwcIHybhqFmv1irI6QppsPXWBtBMJHL/C/E=;
	h=From:Subject:To:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=mPXIBf4+KREegklL1D3RFriQnsLwYeCRN16dkrDmhvK1GDyKbbJ6FmTD8y8WzhaDl
	 ai8twSN2Yp2Xd41AlS5zNri3Tz64eWb/0aiH3wRWn7IBHua/p4qXb94Wx0RC8lB+Il
	 bSHC/SKmuTKYtLpY4DApi1luoyAS3NeongmiGqfk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE1F8F800FB;
	Tue, 24 Jan 2023 00:17:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56BC1F804C2; Tue, 24 Jan 2023 00:17:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=no autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2103.outbound.protection.outlook.com [40.107.113.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A2EDF800FB
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 00:17:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A2EDF800FB
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=SlyzhRyk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SY/l6FgYRqv/W/hFcFxLBUFt9KUgzFmNkX+1Otvfb8+CX8z3JwfAvEtNwZM5iW/KkL9XuljVvUTzywlvnBCo5qPB2yaVq0CDfmBHXzr0EaxV9avn2W3xXze4wqJUu8XZyhi7rcHEn8TdEx6xQvwBt0WSnVWBjRW/OmOpPvVMwnA/bCwbsjk2N51BMEHTtd5spSVuYZLqnb38z0D833aHMqkvYeWMZF2o57p5tkaPRDzvQj1/eRxfH4g7TpIWS4uVHYQg5qr3CaX64E0UC201mIsBQzReBXwi8ofj7MDo2t71grhLLS0r/UaJnPo6zQgW2D8+Nxj3VPe3CUYUmz9WPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Q2tDgDLq+QjjaCQirHvqXf25GMsEEeMSGXjD92+Ht8=;
 b=Q2r+xgfYtllW8R/AeCHVF01ZYciEWpbS8P1dK19QjGDoBzlb06oyC0l0q1QCRBDVPh8uwN1MyvJ+aCpx35NOUnQj4rYXjzxoperEH8+0c+c2Z1vrRekCz9aJUofUXSabiT7PVgqJjwgW+Bcp71jrBq0RI2meAeyVtcohOLN2HmLOAnobxKI385Mopi4lNdfjE1Um1Z2RjzhnjrvWmsFllc0+Yt7MHxU4aePKHwbVQGW72PzXMoyARGE9k0/46bC/K0KBZO3Mg1NYHJ5ctKRjrRrThNh4O+8Q9/mhTn6YBkKECutprQI2+RqyL7NxDI7OFjnSAmWFiDrUGoMyB2zc9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Q2tDgDLq+QjjaCQirHvqXf25GMsEEeMSGXjD92+Ht8=;
 b=SlyzhRykZbI27OPxYONEN2f/7L+79o0eOyivBg2GA88s1SbVIHkTdy1JilwGKaxXJeDFG/RmtiWWGJmtly5Y0Gq3cXz2jWayjKjFLks8TQLMP5Hblw/4TgeSXalZuR1ICjK2S7f8wnFc/+yteMCOxC/qkwKBatTZaT+17rL4a8U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB10228.jpnprd01.prod.outlook.com (2603:1096:400:1ed::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 23:17:20 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%6]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 23:17:20 +0000
Message-ID: <871qnkvo1s.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: soc-compress.c: fixup private_data on
 snd_soc_new_compress()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 23 Jan 2023 23:17:20 +0000
X-ClientProxiedBy: TYCPR01CA0195.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::17) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB10228:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d13f99d-211a-4833-df35-08dafd97fa0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VQaaiQw4v8b3yeaoTDjM6NQNsJ/e0WAjXL2sOuAi88KXb0A3+8PFbPAYmoCjFkSr2UupsDUdQyu5wPjt4lMtv52RlGXeauGSXKIQKahRhQj5im/EaRTJhiQ7hj2AJqE4Ggn9r6RKll8ynHGfAtwbG9OHa6uz2IRiCThKQs0k2FbEE8tV1MsICVvml5Rl8wEuEArGHsWeGH88u6Jno7A2avhIyBlTx+aQkI1kqea6Dx+TIzqAL0dARsVwTlcX8fEVLn9PlV4lKyV7gujitbPHvuXaoGTFbDNBKdyFB9A3z8hbmrnlV3QqDzXpj/KI0LIwxN01mDaVvfNNU+FDylmG2LM2sc0fU4P+LeX6+QzWK26pbcFpQPMYt26unKlAi9av9o+wLOarEoxrX6te3NCOQfz9lewykyyysYXU+ncm73d7EFld3kbEc0X29CH8bwNkJQQIkqMDDWUNXWnn73z0Fnti1tBQKj10QFADxu1M/M8N05pgwuawZyLdPg3nUJn5DH2yeBe6dXclyFNP5hBdFWgssmvWCSu8MfF6hESQBtFsOOf5eEJ8fsH1LYa1UjqykHwpG8GXJkeZeAJCgLj1JH6E965mwOQc7SBUhk+cMSSsI/pUaP5+5rPdYYmqehPHj81MyaAlPOGjExQitbBijcvO9zV54TImRzMrtZeg1wAHdyOSwSumIDzU7ggjgrXPEtaqFMD3aSAW5eSa0MDf0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(376002)(136003)(396003)(39860400002)(451199015)(36756003)(38100700002)(2906002)(38350700002)(5660300002)(8936002)(4326008)(41300700001)(83380400001)(8676002)(6486002)(478600001)(52116002)(86362001)(26005)(186003)(6916009)(6506007)(6512007)(66556008)(66946007)(316002)(54906003)(66476007)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VfJCmB6DTseVUpyY4GZumhpCaABhUoq4fOaj8N5s8nUgLy2C0Ksgv6z/4tCT?=
 =?us-ascii?Q?ojD709yTfyNUw45GMjGstz97G1hyQ/AOhqiOfFtRQ8Sbn+RGBo3qNt8UmVTR?=
 =?us-ascii?Q?VsA4Shp7MnHrJswvbbqUyOsDepCFdsuYxgqJPUbkxj8Xyn2VCDtitIEAElUe?=
 =?us-ascii?Q?mjO+qsoSreZFmwadMpT1ZpFegoUK6sZ6FRpbWHNpkmTMjXZpQMzEsqAseXfi?=
 =?us-ascii?Q?Zy+psMNrEKZktgLA7ZrjT+BKaLPomiJ4BjTPF4Q78LayY2el/1xBHKG17T9H?=
 =?us-ascii?Q?IAGSQp6Zth5OAfkAbzXtBueEV04v/0T4vBVbbV541MUqwkW24HCZbgZv0yOc?=
 =?us-ascii?Q?zeX6nMf5P/hqeHybjlCiSbGnzMwyOqRqvFIXrp8Y+1V2L47WIjcvfDoeNXoB?=
 =?us-ascii?Q?0m3k9gtuB+ekX2Kt46ZNaCr1p5aGxTYoIXJpZYHuIEgv+HAtgjgMuI+9WIuR?=
 =?us-ascii?Q?U9VTT/q4xhHDyLOwTILRkvtaCOmzlvZKwrX27aU2ybC9TDxftwscv+hKzgWG?=
 =?us-ascii?Q?Oz0cjyfjne7PWOlX5T2skD+bamZTbidBx7rPEB5ZjPl+h3AkJ+qzdDABVTKQ?=
 =?us-ascii?Q?e3hBZk7S0PF14HLeq9Rl5DNtVVpmR/34++Em0urB/Zb28Dx6z0DoCN/I5/rF?=
 =?us-ascii?Q?R82X8kaqmv7/x7xtT+t2JcTrDT9HNtkZqhWw4e5OjxWjWT6uRU7pQbW7AW41?=
 =?us-ascii?Q?IUCDYRu1j56la8MWLp6SsFmIDbuMQbnFKaoeOcpGEiAb5MaWVrwM2ugRL10/?=
 =?us-ascii?Q?KUgWhZvwM/p1QUeMrYwDtX6zWWJxwR1S/wypbh7L4Lx4D7NZbWdZExC098UZ?=
 =?us-ascii?Q?z+ySSA//nDMkbWxJivXylH8mUvxrMhpp1k3TMNp8JgOOY5PUMkYmKbwaZmgJ?=
 =?us-ascii?Q?vwLLkiCjF4Q9o5To33mQOt8gRrzo//Z8k0aZOK1vpYvDhxkafexoCEWhyJVq?=
 =?us-ascii?Q?3Hw5BkKBoUNRDCr0ml9xma24GT9nHkfu3MV6QKboG60JjVDAPY82AkNe4Nwd?=
 =?us-ascii?Q?vKKxoh/k8M96RbCaiypSQ+dP2TtR/+zevnWKSNH9bTUgplQFGKMw7snEGeFj?=
 =?us-ascii?Q?U4GglHwynPCvqlRQpz8dKIxC/SVtLKA7AO+WY75g8Htqc8zwV/Q49hgmxMR+?=
 =?us-ascii?Q?aSEAKPFxkoZs98SgFu4DPkbRvLmhcgxf/XyCW0scpxZmeKWtkTeJUEn/9cvY?=
 =?us-ascii?Q?qmBKEyvuL2blT/b2ejVsqur7gvfWJcVFMvtCBCWi1jayUrqqbrlut0h66xN1?=
 =?us-ascii?Q?0S0eCPJSkUXyQhGFJSB3rPRKQYNyIuZwTwQOzleoKos93ftmXqzCWu3mJZoe?=
 =?us-ascii?Q?wY+MOIiTvz6UWH7+CX/5oAhbLDXNImrw5V8i3loCqJXyWyB/hgQ6AGAOxUIr?=
 =?us-ascii?Q?oLgPM9P742aLtWt0CMSYqBBHtaJWiAF5kj+4Xp2b19epImKhneXLItmn+4Ox?=
 =?us-ascii?Q?DTEUeBvyB4CQojNnB7M849Go8Ur57bUhd0SXTapvLOzE0aOPK/HRRsHl9WsY?=
 =?us-ascii?Q?aDmuFlKWhiIcBmIB2cwWK+hAewY464igFsQO+dCmERaZA7zcOzJ9JTMrBK1O?=
 =?us-ascii?Q?8HKacSFigVijYBOgcCwfmGz++ajYMyt0IhZ3x6/UHOXlsEA9QlDhA48w0dt/?=
 =?us-ascii?Q?uXskz0Etk/g5AECWkSXJSoY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d13f99d-211a-4833-df35-08dafd97fa0f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 23:17:20.4673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AJeLZC+iLSiUPqup6A+Vk2KJ3alUqdpdsEamReGsBdDKfQFqNo194IPuI9rdAE9xRNJ2tzhpDxppT61QESnQzOt5llXr4l+V2kqWJIt5ea3BsLfqpmpxkiGilVc3sP4S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10228
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

commit d3268a40d4b19f ("ASoC: soc-compress.c: fix NULL dereference")
enables DPCM capture, but it should independent from playback.
This patch fixup it.

Fixes: d3268a40d4b1 ("ASoC: soc-compress.c: fix NULL dereference")
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
> Need Intel's Tested-by ?

 sound/soc/soc-compress.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index b2a6bbb4e807..ed9e910659ab 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -616,7 +616,7 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int num)
 		rtd->fe_compr = 1;
 		if (rtd->dai_link->dpcm_playback)
 			be_pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream->private_data = rtd;
-		else if (rtd->dai_link->dpcm_capture)
+		if (rtd->dai_link->dpcm_capture)
 			be_pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream->private_data = rtd;
 		memcpy(compr->ops, &soc_compr_dyn_ops, sizeof(soc_compr_dyn_ops));
 	} else {
-- 
2.25.1

