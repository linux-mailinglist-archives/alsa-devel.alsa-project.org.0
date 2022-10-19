Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B8F603729
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 02:37:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27804A84E;
	Wed, 19 Oct 2022 02:36:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27804A84E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666139829;
	bh=CcaeVGj1sc1OkJJ95ICBOwCzH4g6sT33rO4mAa8JYpY=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NLtkyVKTya8vk2S95ZcLRDb+w6EKM1m4MM3LC488TjupTF0dBRXGLisHOCkF68/YL
	 jV5kR7par8mafdh9pklhmZD5py+FQEy05NJwqJbSoy5+UO/r3+kXED7y1t4k6mZz6Y
	 11Z9CuErcLq+9xIsenqULgDyFIc7gWZTJrshS5vk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6404F80549;
	Wed, 19 Oct 2022 02:36:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76752F80548; Wed, 19 Oct 2022 02:36:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2092.outbound.protection.outlook.com [40.107.113.92])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06405F8053C
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 02:36:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06405F8053C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="kaPpNqFy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qwn54uyU0Px7QrcM63O7QZda/A5QQN08NDOUywT3knL0sHoQtfMSAB8/xeiiUdG7lAD4wjUP1384atgP5OqOjqyTNar0k8e9gS59sgtLTWwwy/vUFcEHimBaundphSCD1x0LAZugcV/cpUelovGj3rbNPS2zrNFa7SezdHoIhMopFlqb8QJftF3mgAIIjxbI6nqs/8Sf0RT3flvfm/HJe1d1MKA0CXOXlWiuOeh0pgASK2E8WeYDwXqZmT81SluOAMaFswaZgNJHeGEeTvy0BzuXV2FccnrAhys3diJ5SVmW7MVzY625vXLiHeDTpn2ne17QM/IPdLwxUm2uvHIgBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iCc1uUpTlKt5moZluVRm8uZD9QpshNc3QhAGSxw6Lpo=;
 b=QvaIbF+LNRJe+S6j7s5T20vjW94zPbN2t4aI8rvO6ekMCIoVxo6dUp7RNPeTpsgtVaNyVsPhEqVzhqeX9IiTMjT8pry+lHmuuKGOA8CT8OhY3Rmf+YjhcLz6NY/IisIyYJOPjbYa/V2sN/BSiLFq8Z0/D7ChLjuUbDUzaDX+GBfB2BVoD6EQS0sItU2oTydFuhLu3Oh1dkNEEfJwDpolrD3PTByZIv3+uOWEFRf1X8MbJye5OaboLS09NbsC0qA7vs4v7ygb7btPQ+ESWfMnWwXPkJ51NtHDBUqE9fMFLdPQFvXfWCGMrsPS6inIffMioMXrcG8z75J9OsJ4BVYzAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iCc1uUpTlKt5moZluVRm8uZD9QpshNc3QhAGSxw6Lpo=;
 b=kaPpNqFygnbJQONYh3Exr2wZ9zBv7jpChVW1xkzXm3mN5RC5iaZKfZJwalmYeBrTzMR42RufcnIZBqdF+1/ZQ9mt+ReqqADi9qYat3e1QISLjxGfPAKgDNxM+MRkJYC9oAHuJZ5LLiqpC23s16BPALMM0jwS3d9zYoENmAdhxB0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8892.jpnprd01.prod.outlook.com (2603:1096:604:17d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Wed, 19 Oct
 2022 00:35:57 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4cba:2bd5:dfd4:f3cf]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4cba:2bd5:dfd4:f3cf%5]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 00:35:57 +0000
Message-ID: <87a65stztf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 01/11] ASoC: soc-dapm.c: replace snd_soc_dapm_wcache to
 snd_soc_dapm_widget
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87bkq8tzu1.wl-kuninori.morimoto.gx@renesas.com>
References: <87bkq8tzu1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 19 Oct 2022 00:35:57 +0000
X-ClientProxiedBy: TYAPR01CA0183.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::27) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8892:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eaceac9-4fa5-42d6-fd2d-08dab169e36e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A8a00T13YlOV0uCuRmCm8oUCuBP2hsBZZ2gQt5IU/7Xq+bLrpPzcD2gji8eLV73V/4zzZpMEbp3KkSwKVB7AL+HjuLC8v5XSUosrYt/8XiP+idY6pRd29PfaOaZFHLlLVTvKBZE5ic6XQoZY4inkAe+VvnrUJpn7lQRtKPBX5mSuzi/AWS44AE0bH09SFZfS0Yc6b6kjS3z4jwb0VEfxsiGPEI4ETnyzGojQx4J74l6VuEJmROpP/O7zlDmNjzGNCTrhzmb1DDfuh1boYa48Sd2ItLMVWzuZxXwPMlcjYCbGegwoGrpuoezObQWSF/BEELmSxO3Pg8dsACAOGus43iBxrAMc4MzImeXOk+yDvsD9n/tplVq/1EfuT8eBE6lYq8qHvwIAQrkGg/zUF20k3tMg6vxZrN49d1fG0JYYoDj+bYL+iLqYkE/O+QpO9HQSi0XTuxsLUWAQYi31Gxan4DtwhjGUsRTCkmVHmRd5ceBJ+iEMKlWzWt/woDUCpWCRpRjYeK0faKMn8lQPL21t7AKAxSXDeJGudZ6lEgVy5S1ePvVKrYh81ZipH3ij2Dhn4i9ycVKwPZqTeCfPjDgR+VURZsQMBmg6S19gfs1wkcWheQESwBpCFkBDAXkAA6ydbyq2z9cHRrxK2H+xDj8kg+ImzbAP/QYyAFUUaocaLbsDIB9ewwS2KFx+pUextEz6VcamM6TS0I2JIwOvBJmM7p0Tiux0pW7m21+Uw5UbqH/GIBJo5TWVhEJaJymIY2fNgXkfOypdscm0VU4KK7hCVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(346002)(39860400002)(376002)(136003)(396003)(451199015)(36756003)(86362001)(4326008)(316002)(66476007)(6916009)(66556008)(66946007)(8676002)(5660300002)(38100700002)(38350700002)(6486002)(478600001)(41300700001)(52116002)(6512007)(6506007)(26005)(2906002)(8936002)(186003)(2616005)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XAKqe8Z2arXyOntKWiIH4IDuY8uf4cbcC/DZ5Eue9d9uk5U5as5cTai3Kjmi?=
 =?us-ascii?Q?IBvfb6ecwRm0loA1Qrh0Y8OaK87rmRC27yjH+FTW3+VQ2z4ug5ucvE8j0Yus?=
 =?us-ascii?Q?FZb5BrbwcdYA6e3ivMTFojk/cFeWKsz6a7LJzvMjh627HjsTUkaCFz4Uyrjz?=
 =?us-ascii?Q?LoskPX7bJ+HFTyzCvoI2WkSUsQFfTxI4LDgRrZ2bYaidKn7/5eOZWFi7+M40?=
 =?us-ascii?Q?scZ30mPI/YAH6nfBzonhbmfWDWJy2m5P498Ui26qaTEY4aHPQ8J2aCYxa1zb?=
 =?us-ascii?Q?Ovx6thTeqcsRE2X2pjaHsAGpqjn4zxiv9r03r/ZJwlTV7fkXZHJQIZnu8QCD?=
 =?us-ascii?Q?zV7fXUELBPfFDyFoxvYl0TEMJkJt4qYpw7Omxf5W5g/04wvOqLSeIgxoFk7m?=
 =?us-ascii?Q?+IH83n8lwL0zSwgZLGOYKgz7bs7MAg35USu1IhbVrz5YGLVaf4MKVxvXhi0o?=
 =?us-ascii?Q?VlC+h8mEnrU4yY5HwkVqoVnSonNMQHez7KKiEoygCsoG/ImwEMeIF/qf4Y3h?=
 =?us-ascii?Q?ePL5r/8XK/diFKI0+aBxzrYBk3sazFj+3s+LisAdDyk/K1ackobuegFUKZA0?=
 =?us-ascii?Q?DTptvUDx4Y/mel1bDDDfef+IFHB+K9Aot9moCr+52HnPqFBRhwrN9Q1CX0V/?=
 =?us-ascii?Q?5t1p6zfw185LrEX59VWHS37kI2+T7A+X8Ici/ncLFCV8B5lOCBSr7cl9eNjo?=
 =?us-ascii?Q?oA4JrUb1VS2mg2Jxyx/DOo1IZmANATxJTW9xIzHJ/baMPUsois3OVEVnc3A8?=
 =?us-ascii?Q?8RoCeurAD4yTVCM9Sf9F1Zd2CNuUPyPVMkAhMILieDZfLH1iZQXQ6+Y/791r?=
 =?us-ascii?Q?V1gF4OPm40iAFBMioXYa80Iuscogmr9YpTYG8hutYYVRY2iliPHqFTidaP/2?=
 =?us-ascii?Q?hrInCx5MJzEQeiudYu6r7GuNlyfeSy/rqWJAym/zVEXXYX/4V1lIUSPZGBEO?=
 =?us-ascii?Q?MNKVqJG5b6fVaB2RCsBpVnsuIJkYGUj10vyFfCjiU95hYxlnctd10CulLJS9?=
 =?us-ascii?Q?1t/M4zCgN3FOp4YUChhjNpJrNiFmSvi+7LLXx7c/bD/zHsYEuc0vyLaXvhob?=
 =?us-ascii?Q?Lv5acC0x20SL4bkgyoQy63o9GUogptlJLeYEBbvgfiIEHmy8EwWLpoA3W8k7?=
 =?us-ascii?Q?O7o6NejUwa31TIozgDIHv/hmwpDw5lexnCv7RdiyCzN7i1OPSzD9wMgrAyiz?=
 =?us-ascii?Q?uVQOLkDqseKfkhx+c8N8A8OunKOx0ucQgri7TzjkfiBIKFd1WK8MHDrY7WqY?=
 =?us-ascii?Q?6TPy1zsLBMKXwiOwwMvhwO7f/QBHqAqeBZmXySiV/6nv7fBUdfdamD/UFnWS?=
 =?us-ascii?Q?GJsjdP2xV6WfoUv/zW7zhWI6Cioh3baLLN8+PhJu3MGNtr3Rv8l91+QFS9vy?=
 =?us-ascii?Q?ux71BK/z2EolaSrofz2STfCy4gEkBQsf7HhDETs0Cd6fJKwDxJRJOF8LAj5a?=
 =?us-ascii?Q?irivgYvQlzaBGdRw1ovLZak5wSOu01Ic3RGKBTyvVZocBF0iVley3Wf6nhDV?=
 =?us-ascii?Q?BL+DCdTqZzPc3w1El1cMyLE/W+nbba1FoQ1h3cCuwwtiP6WzFnNjbrzNpHHs?=
 =?us-ascii?Q?9xkhcaaW8AAqMY7Pe56861iA5rEdTcMc5X3qb8WhYVl22ulAs2l73n4TMw/2?=
 =?us-ascii?Q?Icbt51ikJXfCvbSlkbxCRu8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eaceac9-4fa5-42d6-fd2d-08dab169e36e
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 00:35:57.2824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A6UOLDSjytH62pLNtLNwuGUsZlRLG70gh/M9PgLVaPz/eEdwejDjYtfObCIPKV5z+TI13gSp3LdY7nKAo53kklCuvgvh7bebUXJhb+0ch251zAuNU82wk+Z7hoXkmr6w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8892
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

Current ASoC has snd_soc_dapm_wcache, but its member is only
snd_soc_dapm_widget.

	struct snd_soc_dapm_wcache {
		struct snd_soc_dapm_widget *widget;
	};

It is no meaning for now, and makes code unreadable.
This patch replace snd_soc_dapm_wcache to snd_soc_dapm_widget directly.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dapm.h |  9 ++-------
 sound/soc/soc-dapm.c     | 29 +++++++++--------------------
 2 files changed, 11 insertions(+), 27 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index ebb8e7a7fc29..29d5700393c6 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -450,7 +450,6 @@ int snd_soc_dapm_del_routes(struct snd_soc_dapm_context *dapm,
 int snd_soc_dapm_weak_routes(struct snd_soc_dapm_context *dapm,
 			     const struct snd_soc_dapm_route *route, int num);
 void snd_soc_dapm_free_widget(struct snd_soc_dapm_widget *w);
-void snd_soc_dapm_reset_cache(struct snd_soc_dapm_context *dapm);
 
 /* dapm events */
 void snd_soc_dapm_stream_event(struct snd_soc_pcm_runtime *rtd, int stream,
@@ -680,10 +679,6 @@ struct snd_soc_dapm_update {
 	bool has_second_set;
 };
 
-struct snd_soc_dapm_wcache {
-	struct snd_soc_dapm_widget *widget;
-};
-
 /* DAPM context */
 struct snd_soc_dapm_context {
 	enum snd_soc_bias_level bias_level;
@@ -699,8 +694,8 @@ struct snd_soc_dapm_context {
 	enum snd_soc_bias_level target_bias_level;
 	struct list_head list;
 
-	struct snd_soc_dapm_wcache path_sink_cache;
-	struct snd_soc_dapm_wcache path_source_cache;
+	struct snd_soc_dapm_widget *wcache_sink;
+	struct snd_soc_dapm_widget *wcache_source;
 
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *debugfs_dapm;
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index d515e7a78ea8..1796863bff1b 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -652,10 +652,8 @@ static void soc_dapm_async_complete(struct snd_soc_dapm_context *dapm)
 }
 
 static struct snd_soc_dapm_widget *
-dapm_wcache_lookup(struct snd_soc_dapm_wcache *wcache, const char *name)
+dapm_wcache_lookup(struct snd_soc_dapm_widget *w, const char *name)
 {
-	struct snd_soc_dapm_widget *w = wcache->widget;
-
 	if (w) {
 		struct list_head *wlist = &w->dapm->card->widgets;
 		const int depth = 2;
@@ -673,12 +671,6 @@ dapm_wcache_lookup(struct snd_soc_dapm_wcache *wcache, const char *name)
 	return NULL;
 }
 
-static inline void dapm_wcache_update(struct snd_soc_dapm_wcache *wcache,
-				      struct snd_soc_dapm_widget *w)
-{
-	wcache->widget = w;
-}
-
 /**
  * snd_soc_dapm_force_bias_level() - Sets the DAPM bias level
  * @dapm: The DAPM context for which to set the level
@@ -2516,12 +2508,6 @@ void snd_soc_dapm_free_widget(struct snd_soc_dapm_widget *w)
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_free_widget);
 
-void snd_soc_dapm_reset_cache(struct snd_soc_dapm_context *dapm)
-{
-	dapm->path_sink_cache.widget = NULL;
-	dapm->path_source_cache.widget = NULL;
-}
-
 /* free all dapm widgets and resources */
 static void dapm_free_widgets(struct snd_soc_dapm_context *dapm)
 {
@@ -2532,7 +2518,9 @@ static void dapm_free_widgets(struct snd_soc_dapm_context *dapm)
 			continue;
 		snd_soc_dapm_free_widget(w);
 	}
-	snd_soc_dapm_reset_cache(dapm);
+
+	dapm->wcache_sink	= NULL;
+	dapm->wcache_source	= NULL;
 }
 
 static struct snd_soc_dapm_widget *dapm_find_widget(
@@ -2961,8 +2949,8 @@ static int snd_soc_dapm_add_route(struct snd_soc_dapm_context *dapm,
 		source = route->source;
 	}
 
-	wsource = dapm_wcache_lookup(&dapm->path_source_cache, source);
-	wsink = dapm_wcache_lookup(&dapm->path_sink_cache, sink);
+	wsource	= dapm_wcache_lookup(dapm->wcache_source, source);
+	wsink	= dapm_wcache_lookup(dapm->wcache_sink,   sink);
 
 	if (wsink && wsource)
 		goto skip_search;
@@ -3018,8 +3006,9 @@ static int snd_soc_dapm_add_route(struct snd_soc_dapm_context *dapm,
 	}
 
 skip_search:
-	dapm_wcache_update(&dapm->path_sink_cache, wsink);
-	dapm_wcache_update(&dapm->path_source_cache, wsource);
+	/* update cache */
+	dapm->wcache_sink	= wsink;
+	dapm->wcache_source	= wsource;
 
 	ret = snd_soc_dapm_add_path(dapm, wsource, wsink, route->control,
 		route->connected);
-- 
2.25.1

