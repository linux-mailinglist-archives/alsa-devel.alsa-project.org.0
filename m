Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB20379B003
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 01:48:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70DF3852;
	Tue, 12 Sep 2023 01:47:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70DF3852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476121;
	bh=FNU3KzUP+Ljn1Z0UYB6MrA/T9mh2Q7rM3Ec0ZZJl0Z0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=stOIllJSh7ne/tFPr4l4amBReGLLY+6a2V8eIj4/OcxKKPPJ6A/y+Y4AvgTb18H73
	 oTcPTf8rDPbMRBIsKwbbPvZH3/syrW4/2v4lqdHrpXk+iCrGQWHHCS1VEdksvVIAOl
	 tYCVYcmpiVUZshuQSMcIFJHkp3PW4TXIx9RfrsdM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D58CF80431; Tue, 12 Sep 2023 01:47:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 91547F80431;
	Tue, 12 Sep 2023 01:47:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 615AEF8047D; Tue, 12 Sep 2023 01:47:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_FILL_THIS_FORM_SHORT,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20719.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::719])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AAC37F80246
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:47:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAC37F80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=HtgMpEBP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KXnZU/S/9+hl1E07BxdR+O/EWfHuCnUcT+cmdXcBoQlAlcK7qrUVhDTkh9OEgdtoPLuRsBymWCgX8w2ZcUD213hqpPsTh3GA7F2h0gj2ycAH/+scDb05l78CYDjCJng9/rFkoV5z7j999l+x8acedc/e2rmG+81JK0oRyZWX6F/eckbOzLqzp0KETAQCpYU2s09PwRF7t+Lgua3tITCodZS8DNzKMiKUOGA9pbLf1vO4p4ElNuCzaV+3uPf2rpkVV3To82R0JCP8u81oFbwhmCQIRQBDwsFss5XHUZGjAffhV16PLNJWUCh96veC/itUoHiuD2wY26AEKcsaOCXy8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C9cggvY4V2W7mAR9GVXepobwThGN1gYNw6ZJPEPeZtc=;
 b=Jkdw8n95F6RLLiGLB3bqCo6QuNqSqV7SnjbDjWCW7h/uuRRaZCzxb9pPE6wi307BgoPLOxuXFJfL8xnZuIeYL8xwwumrkkX+o1NUc0K8dpCs4MeC++TGVi4bSlbZwEssfFl+x8F6DrFSOm9M44nfk5ueOQdk+fQT/sngpkTjhO87k6cGoymySfefOVUevpsJkAPle2zJO9biY1MSfURJPVkTfiA5XopWUjM6XfenBvDr8n8rUmSgSoLnvZlKJkjciv8WATHBS3RTBsuN4Blz2CbBQU47tAUdt2HkcPg0lyqbZuK1zQm3vWzYDdjKIynLy3M5Vd0MjB8kXmG092hTQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9cggvY4V2W7mAR9GVXepobwThGN1gYNw6ZJPEPeZtc=;
 b=HtgMpEBP4cB49ch9fax3itxbiuAcMkot+Nc6s6RdfYowZ7R4qxs06YeN4W6ABAYHqoyhRol77j6CpYF5+fs7MF+2Q+fMZxjzzWraLIJnq1/WXdSBwxL9OBlwux/f29uQO06Kw8HmC4kBUxWdQxAe7RzD4JRNYdUv+dGcWjwbhFI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYVPR01MB10735.jpnprd01.prod.outlook.com (2603:1096:400:298::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Mon, 11 Sep
 2023 23:47:02 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:47:02 +0000
Message-ID: <87fs3ks26i.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 01/54] ASoC: soc.h: convert asoc_xxx() to snd_soc_xxx()
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:47:02 +0000
X-ClientProxiedBy: TYCP286CA0156.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::20) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYVPR01MB10735:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a4d1853-2e0d-490b-f28f-08dbb321658b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+eu+Z0P4PoIoP0gytukzHEP33jxvWY7zkBo+ABDYVwJ/NEkXMiJQpgKWoiLD4ynxn3hxwYZxJZbWSjicI8qXcCeIiS06yDpCHu7eTC4pNsxCfzL5JLI794npGKujSTdpThyJwr5E/xw7kh6DE36smkV96Vl+pwsK4kX9h4Ih9UI8sg54fqIkZgyZLtnXm5/Mk6LzI14ynuVttmy6chENNfgT8heiSCMM7tGwVAOjuGXXYtAJ3rpAJnHM7JWOxk/vD8hGQ+hM60MoA1ZZM0z1oTJbtOnaV6DhWFV+H9RaF+7JcozVFyjvflpoz/5fWDQZafcKt0+k65RWBZoAgfPRJ3KMc6CgPEDjSCjBjC6+7PVVrNAK9mVL2jB6zemXo/0IOBEKiysaMgWcVf9FBVoZgAlKid/0MFYJaLMlOoHB6RZRvD5G90sMhnYzh1tLfqiL/AS+X3TkA8nCfsfl2WVheqhbkcE80clySWAXYFcNjtGxl9qlpEsoBhnOArEgljPxHx5kUCLnqNiarImezHSMBnFifnWnA2zbfOwcL7U0ybPeV+leglm4ZtV2aasIXfN9dzPv63qjaWV13+f6VVHC+Pisv55IZxgi+9S/GK398LCOL9iFaH4OaT9ZztiLvR7D
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(376002)(346002)(396003)(451199024)(1800799009)(186009)(6512007)(966005)(5660300002)(6486002)(6506007)(52116002)(26005)(478600001)(2906002)(2616005)(83380400001)(8676002)(4326008)(8936002)(66946007)(41300700001)(38100700002)(110136005)(66476007)(66556008)(38350700002)(36756003)(316002)(86362001)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0eI1nsTvukK6JrHG+916nwr+BuIzxrr9NRILpfjbEWta4wwcoJBG+2TK+4fg?=
 =?us-ascii?Q?0kjzgS4cTXe77XKazK0OL2RYYdms0AbZ8X2Ole5HRa7Toi3tLWaqVMmmxxhy?=
 =?us-ascii?Q?dPJJ6JsJX4v0gqzk6jKtT8feoQs1/OD+Om93xK+WJUI8/pRtYlrmHLJbPtYX?=
 =?us-ascii?Q?7N3h1AOmLXY4MdPIU81J1seykS+++lFzJLd21JVEWada39saoN4/bFFHL9my?=
 =?us-ascii?Q?GX0h0Rr3IOzlhTOOdubqT/O7vJfFHVJKN6Epu2kh9AFSOiCjixGKTUWBYyjR?=
 =?us-ascii?Q?KUhl2yoV2dD32ifQlChVSyeUTYofswN+PwKSJI2JIS3+CKSdzmRPeQ5nYaEs?=
 =?us-ascii?Q?L1xS8UgscN7mYYAhHvZpswck7/MSt9AWb6vQ8P+2VGXGfzl1jckzfx+pOCdj?=
 =?us-ascii?Q?lPfbl0kihpRgz5o3cLXbhfVFfmugCQwBREvDBAOIl+LR4qbzmT+t/ALtEqNo?=
 =?us-ascii?Q?KW73uiSlBl4j3/A+Jrkm+DoxF/J6u9He4Qmhax2n+psMNWiSOPPKbXzhdumQ?=
 =?us-ascii?Q?WpeCo/X/iZvdOMteWqHug8lMza+TDW+XF+u3jnwaK2IWqSzsOc5EVQCXsTyb?=
 =?us-ascii?Q?7LkVKchKRkQb7GI5hfzSN9P+QEHBnSBdCR47Yh3pZ1N4rzUdDiBE2PA5vFF4?=
 =?us-ascii?Q?fny9SkvMzxk+jJpFQJotF5K27tNNFTNUnCFh1A/CM37tP4Zt0PvjRKUgyKZn?=
 =?us-ascii?Q?6GQ/lSnGDOZTZiHx4KG0DzcVxTOQoWTy+LQ6o0LZAZoKiQtkExcAdPBeT0Ld?=
 =?us-ascii?Q?gk0HMRXoQal//qybj4Al9yspgxPIySgUyA081FszKuNCaJQ7xkTCV7M3iGep?=
 =?us-ascii?Q?smAp45NClHzNQaftm9p61ZZPRwE8Ws14M1WkSE1ryU46BBXkj8zf/F/TBaV5?=
 =?us-ascii?Q?2SUmpESXyBobuQOIy8RakXtceeWiSsSFidAAtLuVewNb8LLr59/xyeQ0YpJZ?=
 =?us-ascii?Q?lyNMDSCMaiUR1VnVdovd7LRF597Pi7L2o8miJHpS0ubJY+B9d+9ZTngCkUR1?=
 =?us-ascii?Q?Zpv8ofp85BqkaWSXSYGVXpO84WNk5pjw9t/X280PSg87cFxn09dSaNBWr3Rw?=
 =?us-ascii?Q?FIbHkFT9tpauOiFeMfH4Da5gyfPYLjXeFo2EOPstbPzb9hJCPMlr7I/FIAtB?=
 =?us-ascii?Q?LY3y4aecygeqL7rYLv0/R1u+HCSp5490+PKYuihA9ZXtwe86wVGskjQcRUcq?=
 =?us-ascii?Q?G5omRPvXJXYr6jvTqh4DJyLkPqE2/m1idvPDzhUJX6yc6UlvXFoB67P7rNwX?=
 =?us-ascii?Q?5MWQeFAOQyPiXMPX/Sn0cK1LDk3ePFLURUkEtB0prd2S23ws206x5aAkFfJ2?=
 =?us-ascii?Q?TP8fShUtDxTZiFjoCdU3rZGvkJW4EZyEtzt5N8VENYOZOcgSQFFHW0+bz1qA?=
 =?us-ascii?Q?ML1aDQ5dz7f9fmFeVVaqVxmU1iYISZjf2O800GWd4Kh1lVB/wS4MGEHgSX+9?=
 =?us-ascii?Q?sAWmnoaMc+AOeHJ7ReC+/1FGoS4oI+38E9uT/YvEI9T/yLQO8xSY3E/hEE3P?=
 =?us-ascii?Q?zsr25LLkG/HtEABQtSKUKpAMeOh2klilAUTtxbQvsKJxbuAPDFUUJkf+N8kZ?=
 =?us-ascii?Q?8PyeMf+WN0vDS0Suuuf2xZEDzKhCiVDXyLdMamGzDy3tAVDVUnTxMP9vKdbt?=
 =?us-ascii?Q?x+iQtKPWljWAuOGWSxLlUDM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3a4d1853-2e0d-490b-f28f-08dbb321658b
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:47:02.3058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 CfJ8AgvtVi7cwbsmqZMU5VXUves7o1dbsVlYuCAEsJc9H+zTHH0TeCntnRrjh3lR0CAHkbyVN0yd9TWKjtacCeJfzAEQ8Ss2yTemB0fgmUf310UGmpt+vTcgEvXCd4Dh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10735
Message-ID-Hash: X5J2GHSI6MGSKTEFYVUP72CO4NJLO32N
X-Message-ID-Hash: X5J2GHSI6MGSKTEFYVUP72CO4NJLO32N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X5J2GHSI6MGSKTEFYVUP72CO4NJLO32N/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is using 2 type of prefix (asoc_xxx() vs snd_soc_xxx()), but there
is no particular reason about that [1].
To reduce confusing, standarding these to snd_soc_xxx() is sensible.

This patch adds asoc_xxx() macro to keep compatible for a while.
It will be removed if all drivers were switched to new style.

Link: https://lore.kernel.org/r/87h6td3hus.wl-kuninori.morimoto.gx@renesas.com [1]
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-card.h |  4 ++--
 include/sound/soc.h      | 42 ++++++++++++++++++++++++++--------------
 sound/soc/soc-utils.c    |  4 ++--
 3 files changed, 32 insertions(+), 18 deletions(-)

diff --git a/include/sound/soc-card.h b/include/sound/soc-card.h
index fc94dfb0021fd..d5db10a098653 100644
--- a/include/sound/soc-card.h
+++ b/include/sound/soc-card.h
@@ -78,8 +78,8 @@ struct snd_soc_dai *snd_soc_card_get_codec_dai(struct snd_soc_card *card,
 	struct snd_soc_pcm_runtime *rtd;
 
 	for_each_card_rtds(card, rtd) {
-		if (!strcmp(asoc_rtd_to_codec(rtd, 0)->name, dai_name))
-			return asoc_rtd_to_codec(rtd, 0);
+		if (!strcmp(snd_soc_rtd_to_codec(rtd, 0)->name, dai_name))
+			return snd_soc_rtd_to_codec(rtd, 0);
 	}
 
 	return NULL;
diff --git a/include/sound/soc.h b/include/sound/soc.h
index fa2337a3cf4c7..2d0e8801cd485 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -774,37 +774,42 @@ struct snd_soc_dai_link {
 #endif
 };
 
+/* REMOVE ME */
+#define asoc_link_to_cpu	snd_soc_link_to_cpu
+#define asoc_link_to_codec	snd_soc_link_to_codec
+#define asoc_link_to_platform	snd_soc_link_to_platform
+
 static inline struct snd_soc_dai_link_component*
-asoc_link_to_cpu(struct snd_soc_dai_link *link, int n) {
+snd_soc_link_to_cpu(struct snd_soc_dai_link *link, int n) {
 	return &(link)->cpus[n];
 }
 
 static inline struct snd_soc_dai_link_component*
-asoc_link_to_codec(struct snd_soc_dai_link *link, int n) {
+snd_soc_link_to_codec(struct snd_soc_dai_link *link, int n) {
 	return &(link)->codecs[n];
 }
 
 static inline struct snd_soc_dai_link_component*
-asoc_link_to_platform(struct snd_soc_dai_link *link, int n) {
+snd_soc_link_to_platform(struct snd_soc_dai_link *link, int n) {
 	return &(link)->platforms[n];
 }
 
 #define for_each_link_codecs(link, i, codec)				\
 	for ((i) = 0;							\
 	     ((i) < link->num_codecs) &&				\
-		     ((codec) = asoc_link_to_codec(link, i));		\
+		     ((codec) = snd_soc_link_to_codec(link, i));		\
 	     (i)++)
 
 #define for_each_link_platforms(link, i, platform)			\
 	for ((i) = 0;							\
 	     ((i) < link->num_platforms) &&				\
-		     ((platform) = asoc_link_to_platform(link, i));	\
+		     ((platform) = snd_soc_link_to_platform(link, i));	\
 	     (i)++)
 
 #define for_each_link_cpus(link, i, cpu)				\
 	for ((i) = 0;							\
 	     ((i) < link->num_cpus) &&					\
-		     ((cpu) = asoc_link_to_cpu(link, i));		\
+		     ((cpu) = snd_soc_link_to_cpu(link, i));		\
 	     (i)++)
 
 /*
@@ -894,8 +899,11 @@ asoc_link_to_platform(struct snd_soc_dai_link *link, int n) {
 #define COMP_CODEC_CONF(_name)		{ .name = _name }
 #define COMP_DUMMY()			{ .name = "snd-soc-dummy", .dai_name = "snd-soc-dummy-dai", }
 
+/* REMOVE ME */
+#define asoc_dummy_dlc		snd_soc_dummy_dlc
+
 extern struct snd_soc_dai_link_component null_dailink_component[0];
-extern struct snd_soc_dai_link_component asoc_dummy_dlc;
+extern struct snd_soc_dai_link_component snd_soc_dummy_dlc;
 
 
 struct snd_soc_codec_conf {
@@ -1102,8 +1110,8 @@ struct snd_soc_pcm_runtime {
 	 * dais = cpu_dai + codec_dai
 	 * see
 	 *	soc_new_pcm_runtime()
-	 *	asoc_rtd_to_cpu()
-	 *	asoc_rtd_to_codec()
+	 *	snd_soc_rtd_to_cpu()
+	 *	snd_soc_rtd_to_codec()
 	 */
 	struct snd_soc_dai **dais;
 
@@ -1129,10 +1137,16 @@ struct snd_soc_pcm_runtime {
 	int num_components;
 	struct snd_soc_component *components[]; /* CPU/Codec/Platform */
 };
+
+/* REMOVE ME */
+#define asoc_rtd_to_cpu		snd_soc_rtd_to_cpu
+#define asoc_rtd_to_codec	snd_soc_rtd_to_codec
+#define asoc_substream_to_rtd	snd_soc_substream_to_rtd
+
 /* see soc_new_pcm_runtime()  */
-#define asoc_rtd_to_cpu(rtd, n)   (rtd)->dais[n]
-#define asoc_rtd_to_codec(rtd, n) (rtd)->dais[n + (rtd)->dai_link->num_cpus]
-#define asoc_substream_to_rtd(substream) \
+#define snd_soc_rtd_to_cpu(rtd, n)   (rtd)->dais[n]
+#define snd_soc_rtd_to_codec(rtd, n) (rtd)->dais[n + (rtd)->dai_link->num_cpus]
+#define snd_soc_substream_to_rtd(substream) \
 	(struct snd_soc_pcm_runtime *)snd_pcm_substream_chip(substream)
 
 #define for_each_rtd_components(rtd, i, component)			\
@@ -1141,11 +1155,11 @@ struct snd_soc_pcm_runtime {
 	     (i)++)
 #define for_each_rtd_cpu_dais(rtd, i, dai)				\
 	for ((i) = 0;							\
-	     ((i) < rtd->dai_link->num_cpus) && ((dai) = asoc_rtd_to_cpu(rtd, i)); \
+	     ((i) < rtd->dai_link->num_cpus) && ((dai) = snd_soc_rtd_to_cpu(rtd, i)); \
 	     (i)++)
 #define for_each_rtd_codec_dais(rtd, i, dai)				\
 	for ((i) = 0;							\
-	     ((i) < rtd->dai_link->num_codecs) && ((dai) = asoc_rtd_to_codec(rtd, i)); \
+	     ((i) < rtd->dai_link->num_codecs) && ((dai) = snd_soc_rtd_to_codec(rtd, i)); \
 	     (i)++)
 #define for_each_rtd_dais(rtd, i, dai)					\
 	for ((i) = 0;							\
diff --git a/sound/soc/soc-utils.c b/sound/soc/soc-utils.c
index 11607c5f5d5a8..04f87e998f1dd 100644
--- a/sound/soc/soc-utils.c
+++ b/sound/soc/soc-utils.c
@@ -224,12 +224,12 @@ int snd_soc_component_is_dummy(struct snd_soc_component *component)
 		(component->driver == &dummy_codec));
 }
 
-struct snd_soc_dai_link_component asoc_dummy_dlc = {
+struct snd_soc_dai_link_component snd_soc_dummy_dlc = {
 	.of_node	= NULL,
 	.dai_name	= "snd-soc-dummy-dai",
 	.name		= "snd-soc-dummy",
 };
-EXPORT_SYMBOL_GPL(asoc_dummy_dlc);
+EXPORT_SYMBOL_GPL(snd_soc_dummy_dlc);
 
 static int snd_soc_dummy_probe(struct platform_device *pdev)
 {
-- 
2.25.1

