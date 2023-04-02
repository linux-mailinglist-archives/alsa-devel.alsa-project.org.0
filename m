Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 646F76D3AE1
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Apr 2023 01:01:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 466E01FA;
	Mon,  3 Apr 2023 01:00:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 466E01FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680476494;
	bh=2D0/FqrKQqVFq+lTvIg26z4H3ZtJHzciYJFN3Bhhgn4=;
	h=From:Subject:To:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CY/ZxmlKEm+zU7mh83SbGZrkHQIeoJCfoicy2yTDmSFbhwO0TMGEGTozHqmh3Iijt
	 o8+ezISrbdtFLJJf0c2IwBV6OJvXrduxg7YBZkitU/gWNu0bVkvHOxX58ZE5YpqkPf
	 FfRYMBZkOEwyAUIvECl0R44Tiw+5kp7KPmrnTleU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D8194F80529;
	Mon,  3 Apr 2023 01:00:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CF36F8052E; Mon,  3 Apr 2023 01:00:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2071b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::71b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B05BF80423
	for <alsa-devel@alsa-project.org>; Mon,  3 Apr 2023 00:59:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B05BF80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=doI6RUa+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F0hDXJ8n8uPAU0y1xcsPbt/VWqHWlEzB1ORLZLx2uJ2dNCa8/+2IEv+dAXQ2u4TncHiqdsUXAevAzQdmgze76cZ4jPfvwZj8TP8CulAWXqo7shDhkMeGDd08+/kM+QsvCmF9wl72xjQrhRW1+IvhFF7ritpupJb2V6+mAfdaysZx+Eu4ezJsUUm6JiwdqCl57Xvn6eFAdf8gP8Hq0aEfvj3BRTBR5nsaTpQPnfvxEfvv+TRRsQbO74dDYw5iabvcpjQB51rxJ+v4bUk51MEvyf71wR8cMGgp9dnsdHlOpGL1TCDgs6PpYppLA4Ty7juWQxOR8mWAM7LNa6wDEtTM0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IY2ypbIDMgvN2z+qPRVsEon20uA6hdwqlynLowK3GdA=;
 b=hvNPiYAcvK7yvsAQOKjn+YRtnH/FoXK+bJ0Oplgq5IIYXDnD5GFGH9WjyYw42GKq5760EIc7EDye8U3cvB803u4e7IZ1L10D4I/i2Ko0HSM0SUja4a6Gm76NyYZP8W49rj3ZYvLHbi7bVMN2otW3dTCKBpGHeUdrH3070mnPjU6MK6S1Qp/xRvzAy4HK+6Iz4jtuu+WpSPyPJBh66YYtnbOOad56NCM+EQC12FV5kyuKLMNlbS6Es6o1PuqxkXli2d+tSTEfUiPnXNRu5mXkZXWD8HHzyZGsHt5t9VV9jrCgndsxJTkVzDVRP90kxXTUrPvnoh2Pi/y+XFxppfGWTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IY2ypbIDMgvN2z+qPRVsEon20uA6hdwqlynLowK3GdA=;
 b=doI6RUa+5rBVgyijHh+aJlr4x+dyWTtiP9cJQx6gE8xAdU7HPhFx6q7fwPd4ztj3ZsjqlxUqrl43Nk8jYvVXOZAp56rxmsNY3e0jInOaXIs60dK9QNw/mC7Hh+WjMeQdC+dTMJSOy1WV+7oRlmZEZiBZO4Z/ctjPLuds6PDt9og=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSYPR01MB5304.jpnprd01.prod.outlook.com (2603:1096:604:80::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Sun, 2 Apr
 2023 22:59:36 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%4]) with mapi id 15.20.6254.033; Sun, 2 Apr 2023
 22:59:36 +0000
Message-ID: <87o7o5c2lk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH resend 1/5] ASoC: soc.h: clarify Codec2Codec params
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87pm8lc2m7.wl-kuninori.morimoto.gx@renesas.com>
References: <87pm8lc2m7.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 2 Apr 2023 22:59:35 +0000
X-ClientProxiedBy: TYCP301CA0023.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSYPR01MB5304:EE_
X-MS-Office365-Filtering-Correlation-Id: e3aa87fa-f6c7-4b89-753f-08db33cdee23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uBHNPJzbL9sd3vpPNNgRWudSqgQhlIKWrMFL4gdsaTWzd3BBpLcS4Goi1e5rhLVuK+0Sgoh9E0R+TF3G/bmI4EqfCYO+1B4q0KTMYkpu6t206ai2onOMGahYmjCcKYKxKQcfBhu51mXmqvDJzo+LcV8U1v60bapyZJz/rHcLxFRQMJVIdyY9IbXgOs0Ti7Ue9syTQJChhDo/bueiNRYP0BT1uytoHQvRdEMlW57oKAE7Aj4SEqHXltMBN0Lx1EJfZBIze5G1CkY397SShyOFt6eUg4uy+YU/r6gm8KjokIzDo6QfGv6g4EKCAYtJtlFQw8pQPTQMKS+vou+eyCrSkfQ0blVifAXal5qCpsYKkPIImFOeqv9ijzeB0T2MPb8H4ifms5F2oMvXB4neftqCbQU745kHrL7QAeNlFeEojmp2ugfoQ9VYlnjJowaYEjOMdeB7zAGmpj63YqbrkrFQlCGmMj2qmyu+QpFaKDukc9tfXdYTkrMzm3P+UZQrt1S0q8FTXLKiVSe42O2i6FoU6zTv0hFjC2pMHQVbIs2TK2Xm44ThfVcDeeaDbFtlmaeO/7f10ckz+4N/CJlmTwXNQdE/nO4LGaXsJFssdP73xLqHScOz8af7qRt9VBMQz75s
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(346002)(39860400002)(376002)(451199021)(4326008)(6916009)(8676002)(66556008)(66946007)(66476007)(478600001)(316002)(8936002)(5660300002)(41300700001)(38100700002)(38350700002)(186003)(83380400001)(2616005)(52116002)(6486002)(6512007)(6506007)(26005)(86362001)(36756003)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IdXfJR/2ZJ+AbVDmYAuvGKJDVjPVaNOODdVSBxRb5cKM9jRHP8zcPqZ9kmwH?=
 =?us-ascii?Q?MSPAd2hGoluBccFn3O+swMByz6+yat3eZpCh3m03sgYvBEwls1AO8iltmh14?=
 =?us-ascii?Q?jBP8H4kIpdJZDHJ6T1iuJqVRkUeW8BoKInw/yVps8Wa6yDV+hw73CbcjRDcF?=
 =?us-ascii?Q?qwrtljyBDfIkaM5sS+RFyHNrZB89JSGDjmKT2rSfzyn/zVwtLhWO/2UJs9kd?=
 =?us-ascii?Q?JEjOaGCLBdApmGHM4qQ28IOEH8ar9cZAYUrnFhO8f4JWe3jw6fW93Vcn90w7?=
 =?us-ascii?Q?gQoE20eB+A6bc3/OlBMEo6NoTbpEsA5Bu4VfKseyHiFpMdTgYa6TTlbH11v5?=
 =?us-ascii?Q?ZZ2xZavtjPO0nRxMfqaYkxBdlmBlMacHtdVQOXtye7W8CRyhzhpdDUTtUq8c?=
 =?us-ascii?Q?ox1OE/t2V6RQz82NStrudSmNwxVBU65qgETh24+/VDsdKRq6//hNyH3dHNjN?=
 =?us-ascii?Q?CsgBcjvRpW6e1H3mGS7wum8i2f1jfmC7g6tIpRYcGSISImKY2e65v0KlQeAR?=
 =?us-ascii?Q?/fS6Y82AdU6vF3H0f/JpO1fAY+u4+HtpaJAK6BE9wXDeNGXgDhQo4jjpSWIH?=
 =?us-ascii?Q?aWoOp/3FHF30q63d+B6G1zXCZfWiWnxMc5JtLF9SBSZ7g+GDaQnBpDIXOcQr?=
 =?us-ascii?Q?ydaheEdTfSPPo7A5lI1IeU8qbRirDFC0kpeGrSMpW5ZxGeHzY/qs/36Y5s/z?=
 =?us-ascii?Q?asGtm3MyH/bTiRmAAbJwhW8occyC4KlanBKe4ask7QVL/R5BignDbFZzbU9a?=
 =?us-ascii?Q?lU5WRqMz1VhE883HYE8mziX4R3BFbHldDFojnXH0eJCJ5Q6lxTUs1jlrGSfs?=
 =?us-ascii?Q?VdkhQAjwjFJz8pbhRJhsRQDcIPfzPx2jXx8hn8eKPiyGtMkdnnwURoB9ZnK9?=
 =?us-ascii?Q?r+eYybjRebyaOszng6d1xq1vTa9gJ84L6R24rIBAJVaxqFFrkj0cpoNbaIO1?=
 =?us-ascii?Q?9KWiPSsuDd9EfU8Gi8t1fGNSw9POGHKgjhUmwpwzVZ0XWuecgoMW9PIEthRX?=
 =?us-ascii?Q?YfaXNhVepp4JvDRVsXgZS0g85wqYngCkXofJgk+uJ1Uc6alUkSU6b8lKcO77?=
 =?us-ascii?Q?G0P6a3p6CWFfCrZ4+8Ybf42I7MVHZXtx4v/0O1rpWFqoQH2ofeDVAlD7+B6M?=
 =?us-ascii?Q?Z/pFQKXSU9es6xXg/6wHeZnu5O11FFcWDXrVxbIas1ASoWfKU/GsCTw+4NDF?=
 =?us-ascii?Q?E3CHxG8mJFwVJ9lnmuUHFANGlSLQV5BOzJO2wAhFsYtBzNIW8QdwGCnEO4bL?=
 =?us-ascii?Q?+vetomO7nnvtS4ar/925+0BSfNiY+SVWoh7xzG0MjLdK5qJqIntzu3A5HSgA?=
 =?us-ascii?Q?ialGOi+ILLQW50M2uzeuZ/W/W6LFV/EM91pEEfJVjArSEBU9pYpvoynrCJfR?=
 =?us-ascii?Q?0D5Dw+hRFmk/OiLIoKGEeUCdt51sssHKpUbcyuJSRrITR6oO+Ru0AZEfN5Pc?=
 =?us-ascii?Q?ycFbRsb/qBfp3h2w4GRuFnVgOBZrfrYcR++mxzqwPo+JPDflvRdZSp1yWc82?=
 =?us-ascii?Q?5a7MzqPMCuYv66vTZuliJIIr287pznYE8PKTDeQWie4MwCZMXGjwUN9lU+MO?=
 =?us-ascii?Q?g8TECWOS8Te1UiI82W8jcRZbmFZoW/pxWgggafsh0ocaOfwh0yzXd708/Hmq?=
 =?us-ascii?Q?3vdwRTvJ498osU17XHrx0uc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e3aa87fa-f6c7-4b89-753f-08db33cdee23
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2023 22:59:36.0703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 eade/Zclib0qbencSQORNmSLBseiUgef+qE9NqnO290/TIJz5IRwP9qFz7cGrcU3R1g8n52unfGsYbB0dbUY7QYjG6E4UGC+7xbwEYkZXwDps16AkGtZTiS70Bv+3GqR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5304
Message-ID-Hash: KQ5R2MSF5C3MFSXSLIMPL5PJBQDYUYTQ
X-Message-ID-Hash: KQ5R2MSF5C3MFSXSLIMPL5PJBQDYUYTQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KQ5R2MSF5C3MFSXSLIMPL5PJBQDYUYTQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

snd_soc_dai_link has params/num_params, but it is unclear that
params for what. This patch clarify it is params for Codec2Codec.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h  | 12 +++++++++---
 sound/soc/soc-core.c | 11 +++++++++++
 sound/soc/soc-dapm.c | 44 ++++++++++++++++++++++----------------------
 sound/soc/soc-pcm.c  | 10 +++++-----
 4 files changed, 47 insertions(+), 30 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 57c5786a625b..276afdb1f445 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -684,8 +684,14 @@ struct snd_soc_dai_link {
 
 	int id;	/* optional ID for machine driver link identification */
 
-	const struct snd_soc_pcm_stream *params;
-	unsigned int num_params;
+	/*
+	 * for Codec2Codec
+	 */
+	const struct snd_soc_pcm_stream *c2c_params;
+	unsigned int num_c2c_params;
+
+	const struct snd_soc_pcm_stream *params;	/* REMOVE ME */
+	unsigned int num_params;			/* REMOVE ME */
 
 	unsigned int dai_fmt;           /* format to set on init */
 
@@ -1065,7 +1071,7 @@ struct snd_soc_pcm_runtime {
 	struct snd_soc_dai_link *dai_link;
 	struct snd_pcm_ops ops;
 
-	unsigned int params_select; /* currently selected param for dai link */
+	unsigned int c2c_params_select; /* currently selected c2c_param for dai link */
 
 	/* Dynamic PCM BE runtime data */
 	struct snd_soc_dpcm_runtime dpcm[SNDRV_PCM_STREAM_LAST + 1];
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 9bbcff492c1e..04f1bc8a3128 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2294,6 +2294,9 @@ EXPORT_SYMBOL_GPL(snd_soc_add_dai_controls);
  */
 int snd_soc_register_card(struct snd_soc_card *card)
 {
+	struct snd_soc_dai_link *dai_link;
+	int i;
+
 	if (!card->name || !card->dev)
 		return -EINVAL;
 
@@ -2314,6 +2317,14 @@ int snd_soc_register_card(struct snd_soc_card *card)
 	mutex_init(&card->dapm_mutex);
 	mutex_init(&card->pcm_mutex);
 
+	/* REMOVE ME */
+	for_each_card_prelinks(card, i, dai_link) {
+		if (!dai_link->c2c_params) {
+			dai_link->c2c_params	 = dai_link->params;
+			dai_link->num_c2c_params = dai_link->num_params;
+		}
+	}
+
 	return snd_soc_bind_card(card);
 }
 EXPORT_SYMBOL_GPL(snd_soc_register_card);
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 34fdcb7ee079..e7a0c28e0cb1 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -1075,7 +1075,7 @@ static int dapm_new_dai_link(struct snd_soc_dapm_widget *w)
 	struct snd_soc_pcm_runtime *rtd = w->priv;
 
 	/* create control for links with > 1 config */
-	if (rtd->dai_link->num_params <= 1)
+	if (rtd->dai_link->num_c2c_params <= 1)
 		return 0;
 
 	/* add kcontrol */
@@ -3864,7 +3864,7 @@ snd_soc_dai_link_event_pre_pmu(struct snd_soc_dapm_widget *w,
 	 * either party on the link to alter the configuration if
 	 * necessary
 	 */
-	config = rtd->dai_link->params + rtd->params_select;
+	config = rtd->dai_link->c2c_params + rtd->c2c_params_select;
 	if (!config) {
 		dev_err(w->dapm->dev, "ASoC: link config missing\n");
 		ret = -EINVAL;
@@ -4010,7 +4010,7 @@ static int snd_soc_dapm_dai_link_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_dapm_widget *w = snd_kcontrol_chip(kcontrol);
 	struct snd_soc_pcm_runtime *rtd = w->priv;
 
-	ucontrol->value.enumerated.item[0] = rtd->params_select;
+	ucontrol->value.enumerated.item[0] = rtd->c2c_params_select;
 
 	return 0;
 }
@@ -4025,13 +4025,13 @@ static int snd_soc_dapm_dai_link_put(struct snd_kcontrol *kcontrol,
 	if (w->power)
 		return -EBUSY;
 
-	if (ucontrol->value.enumerated.item[0] == rtd->params_select)
+	if (ucontrol->value.enumerated.item[0] == rtd->c2c_params_select)
 		return 0;
 
-	if (ucontrol->value.enumerated.item[0] >= rtd->dai_link->num_params)
+	if (ucontrol->value.enumerated.item[0] >= rtd->dai_link->num_c2c_params)
 		return -EINVAL;
 
-	rtd->params_select = ucontrol->value.enumerated.item[0];
+	rtd->c2c_params_select = ucontrol->value.enumerated.item[0];
 
 	return 1;
 }
@@ -4039,7 +4039,7 @@ static int snd_soc_dapm_dai_link_put(struct snd_kcontrol *kcontrol,
 static void
 snd_soc_dapm_free_kcontrol(struct snd_soc_card *card,
 			unsigned long *private_value,
-			int num_params,
+			int num_c2c_params,
 			const char **w_param_text)
 {
 	int count;
@@ -4049,7 +4049,7 @@ snd_soc_dapm_free_kcontrol(struct snd_soc_card *card,
 	if (!w_param_text)
 		return;
 
-	for (count = 0 ; count < num_params; count++)
+	for (count = 0 ; count < num_c2c_params; count++)
 		devm_kfree(card->dev, (void *)w_param_text[count]);
 	devm_kfree(card->dev, w_param_text);
 }
@@ -4057,8 +4057,8 @@ snd_soc_dapm_free_kcontrol(struct snd_soc_card *card,
 static struct snd_kcontrol_new *
 snd_soc_dapm_alloc_kcontrol(struct snd_soc_card *card,
 			char *link_name,
-			const struct snd_soc_pcm_stream *params,
-			int num_params, const char **w_param_text,
+			const struct snd_soc_pcm_stream *c2c_params,
+			int num_c2c_params, const char **w_param_text,
 			unsigned long *private_value)
 {
 	struct soc_enum w_param_enum[] = {
@@ -4070,10 +4070,10 @@ snd_soc_dapm_alloc_kcontrol(struct snd_soc_card *card,
 			     snd_soc_dapm_dai_link_put),
 	};
 	struct snd_kcontrol_new *kcontrol_news;
-	const struct snd_soc_pcm_stream *config = params;
+	const struct snd_soc_pcm_stream *config = c2c_params;
 	int count;
 
-	for (count = 0 ; count < num_params; count++) {
+	for (count = 0 ; count < num_c2c_params; count++) {
 		if (!config->stream_name) {
 			dev_warn(card->dapm.dev,
 				"ASoC: anonymous config %d for dai link %s\n",
@@ -4093,7 +4093,7 @@ snd_soc_dapm_alloc_kcontrol(struct snd_soc_card *card,
 		config++;
 	}
 
-	w_param_enum[0].items = num_params;
+	w_param_enum[0].items = num_c2c_params;
 	w_param_enum[0].texts = w_param_text;
 
 	*private_value =
@@ -4118,7 +4118,7 @@ snd_soc_dapm_alloc_kcontrol(struct snd_soc_card *card,
 	return kcontrol_news;
 
 outfree_w_param:
-	snd_soc_dapm_free_kcontrol(card, private_value, num_params, w_param_text);
+	snd_soc_dapm_free_kcontrol(card, private_value, num_c2c_params, w_param_text);
 	return NULL;
 }
 
@@ -4146,17 +4146,17 @@ snd_soc_dapm_new_dai(struct snd_soc_card *card,
 	w_param_text	= NULL;
 	kcontrol_news	= NULL;
 	num_kcontrols	= 0;
-	if (rtd->dai_link->num_params > 1) {
+	if (rtd->dai_link->num_c2c_params > 1) {
 		w_param_text = devm_kcalloc(card->dev,
-					    rtd->dai_link->num_params,
+					    rtd->dai_link->num_c2c_params,
 					    sizeof(char *), GFP_KERNEL);
 		if (!w_param_text)
 			goto param_fail;
 
 		num_kcontrols = 1;
 		kcontrol_news = snd_soc_dapm_alloc_kcontrol(card, link_name,
-							    rtd->dai_link->params,
-							    rtd->dai_link->num_params,
+							    rtd->dai_link->c2c_params,
+							    rtd->dai_link->num_c2c_params,
 							    w_param_text, &private_value);
 		if (!kcontrol_news)
 			goto param_fail;
@@ -4187,7 +4187,7 @@ snd_soc_dapm_new_dai(struct snd_soc_card *card,
 outfree_kcontrol_news:
 	devm_kfree(card->dev, (void *)template.kcontrol_news);
 	snd_soc_dapm_free_kcontrol(card, &private_value,
-				   rtd->dai_link->num_params, w_param_text);
+				   rtd->dai_link->num_c2c_params, w_param_text);
 param_fail:
 	devm_kfree(card->dev, link_name);
 name_fail:
@@ -4336,7 +4336,7 @@ static void dapm_connect_dai_pair(struct snd_soc_card *card,
 	struct snd_pcm_str *streams = rtd->pcm->streams;
 	int stream;
 
-	if (dai_link->params) {
+	if (dai_link->c2c_params) {
 		playback_cpu	= snd_soc_dai_get_widget_capture(cpu_dai);
 		capture_cpu	= snd_soc_dai_get_widget_playback(cpu_dai);
 	} else {
@@ -4349,7 +4349,7 @@ static void dapm_connect_dai_pair(struct snd_soc_card *card,
 	codec = snd_soc_dai_get_widget(codec_dai, stream);
 
 	if (playback_cpu && codec) {
-		if (dai_link->params && !rtd->c2c_widget[stream]) {
+		if (dai_link->c2c_params && !rtd->c2c_widget[stream]) {
 			substream = streams[stream].substream;
 			dai = snd_soc_dapm_new_dai(card, substream, "playback");
 			if (IS_ERR(dai))
@@ -4368,7 +4368,7 @@ static void dapm_connect_dai_pair(struct snd_soc_card *card,
 	codec = snd_soc_dai_get_widget(codec_dai, stream);
 
 	if (codec && capture_cpu) {
-		if (dai_link->params && !rtd->c2c_widget[stream]) {
+		if (dai_link->c2c_params && !rtd->c2c_widget[stream]) {
 			substream = streams[stream].substream;
 			dai = snd_soc_dapm_new_dai(card, substream, "capture");
 			if (IS_ERR(dai))
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index b830a53ceacb..913a7d98e742 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2793,9 +2793,9 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 		struct snd_soc_dai *codec_dai;
 
 		/* Adapt stream for codec2codec links */
-		int cpu_capture = rtd->dai_link->params ?
+		int cpu_capture = rtd->dai_link->c2c_params ?
 			SNDRV_PCM_STREAM_PLAYBACK : SNDRV_PCM_STREAM_CAPTURE;
-		int cpu_playback = rtd->dai_link->params ?
+		int cpu_playback = rtd->dai_link->c2c_params ?
 			SNDRV_PCM_STREAM_CAPTURE : SNDRV_PCM_STREAM_PLAYBACK;
 
 		for_each_rtd_codec_dais(rtd, i, codec_dai) {
@@ -2839,7 +2839,7 @@ static int soc_create_pcm(struct snd_pcm **pcm,
 	int ret;
 
 	/* create the PCM */
-	if (rtd->dai_link->params) {
+	if (rtd->dai_link->c2c_params) {
 		snprintf(new_name, sizeof(new_name), "codec2codec(%s)",
 			 rtd->dai_link->stream_name);
 
@@ -2896,7 +2896,7 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 	 * don't interface with the outside world or application layer
 	 * we don't have to do any special handling on close.
 	 */
-	if (!rtd->dai_link->params)
+	if (!rtd->dai_link->c2c_params)
 		rtd->close_delayed_work_func = snd_soc_close_delayed_work;
 
 	rtd->pcm = pcm;
@@ -2904,7 +2904,7 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 	pcm->private_data = rtd;
 	pcm->no_device_suspend = true;
 
-	if (rtd->dai_link->no_pcm || rtd->dai_link->params) {
+	if (rtd->dai_link->no_pcm || rtd->dai_link->c2c_params) {
 		if (playback)
 			pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream->private_data = rtd;
 		if (capture)
-- 
2.25.1

