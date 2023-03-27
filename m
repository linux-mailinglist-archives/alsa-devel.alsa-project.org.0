Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8631A6C98ED
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 02:11:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEF08DF2;
	Mon, 27 Mar 2023 02:10:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEF08DF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679875894;
	bh=SWCE2Sfwq7v7IuIDSU/rczVY6xy8P/drc/OhWiDnlWc=;
	h=From:Subject:To:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=M6tGusUZlXrlJ8lnzkx469Ll2Sn24bSmUnGEjGB/FmsSM9dYBnCb+VV0yc+hLk47v
	 5y8tVaGgBQ/K3ow23lV2wbMeMZNP/FfDPDHn8WNMlkdYr0GAfZaXD/O1D9gGuQaEu7
	 FfKOw3y1hegijvpqu7eN7VeULrWdOejCHFdzXu+Y=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 80B2EF80495;
	Mon, 27 Mar 2023 02:10:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D697F80495; Mon, 27 Mar 2023 02:10:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2071c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::71c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A9DE0F8032D
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 02:10:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9DE0F8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=A9ka1/Vf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RksGhfajpldjzU2tnXt6RrMn//oQ8fmBX+WsWjoGoH4m8GcvfiOUcBpR5j8T6lET+oWQ2ONnUorpfoHoPIlve42v4oaORFNmQS2/GL7Glb2zJMR2ti2QW/AJqFTVl+/ATcgeT79XogEKi33SBpUyDFYEEQ11d7co+DtET6jw/84KFNRwNmOa0u0j7s5Uo5iS2S1tp80TTC/bj2a76cBZ2jHw00sD0QTbL6Gnu+7h+xcak2fMRT9iB7ZsyA6gmrWfAObfglNtjg0kLVPIwHy3gJYOt6r75TINLEu/eMRSMDxYY3/pjGWSrKt8yuLpBjiepuIOpBoXWhptje74IFTzFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FnSWMygukqN/0VtQuVH+7UQ4L4gQr8mNjj+iKCnpYvA=;
 b=mpnzf/kr06JPgmalsSmD57ialRp/DdVoKIdzkjRUep1cCpCexgh+h/QU8Qz7BqRAf/I3PIZ5xCnj/C/Ct6z3c48Fd8CZwQ+71+zPre4X07CvKfMLMIjJrc6nYnILBpUQTsh9HzusJxkGwRJxXIx+7UHEoTwSk4KyXvBXSwoC6IFlbP+pFL8StCukK5dQZRW3vc7XxXssoeSk2VOoWk7VAUBsiqi9Wbp2ktZ2DRln1F2ROC55cmPrPQ/yNOI6nzkxWDa92IdRZJFrS4Fif5qdpjdOodPBlAlv6Wx5ulTXbOFDhDNEFQHv3+o2yusAGeHPYKrh4suCVDCZyQtGzrg6Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FnSWMygukqN/0VtQuVH+7UQ4L4gQr8mNjj+iKCnpYvA=;
 b=A9ka1/VfI36iZAyklYZedqo31uzXtDUZsZzMDlyBu7qd/nuvxNXKMG1Ory+VodViHOhsBJN49L978OJWrBTwXY3wjo44LUoEqkIDUt/HhwpjgHK7qSnY4DpztztzYcqT/Esry4O5YKm1uoom4hhOKX8X565jwKFj8aCtXwxQy7I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB11465.jpnprd01.prod.outlook.com (2603:1096:400:402::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.29; Mon, 27 Mar
 2023 00:09:55 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%3]) with mapi id 15.20.6222.030; Mon, 27 Mar 2023
 00:09:54 +0000
Message-ID: <87pm8v6omm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/5] ASoC: soc.h: clarify Codec2Codec params
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87r0tb6ond.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0tb6ond.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 27 Mar 2023 00:09:54 +0000
X-ClientProxiedBy: TYWP286CA0021.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::12) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB11465:EE_
X-MS-Office365-Filtering-Correlation-Id: f11010fe-3fb4-402d-0554-08db2e57979c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XQVUlQF7XiJWAeMvrwHmSKN6XTplIkBWIL0wgv6/Fa62w/DXLAexPL1BMLTzsAF4xhF/hgHcbqzkgM4BhE7MqkXjPpGpE/erNkWlLSNt3VZDUmRgo6cuDhmHZV8CDy//okYfObyv26DLE/egoYtdd6YTAB2J9tBkBGoX9JoyTowk75L2LiXtphyNoFuP+EXMEMHjowlxcsL4GfATxs0yJmZcn5yii977mI7HoCXsrpIzzCtRonMyvJktwzuaMAfvWzwXgkE6MdlhySbfCpxPTUaUtcDGsdVFdBDbb6fY1PPIKD1pa/K2QA/YIKNlZvYgmCeakKMw7wWeQP08M3Ut3ujdZOPSQkaqt7hh5enULmsuXSFSHd5weBQWiRt0vSIZtRBJHQmbpVJjqqnOfZdT3LKrctjUcUyf8Y+FU24aMHoEX2XnlNH+MdxJK3+ndE1mxusOfTJmvphjzrPTVZSkNpbuekhfhbewbyWg46DHUGFWVHNWPrymgiUG1UXjSsUuPCdmeuNtPI1ntaonSdrO1GTOGKNKSc78auKB3IK/Ecd1GZsh8Q5WmBfQmAC04zSC5cH9xXa37tbMDQMlKwIRO7rXJBIYsW4okQal0aeskhtkZ6K1Rz+i7TUyuwRRJX68
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(366004)(39860400002)(396003)(346002)(451199021)(83380400001)(2616005)(4326008)(66476007)(66946007)(66556008)(6916009)(8676002)(6486002)(478600001)(52116002)(6512007)(26005)(186003)(6506007)(316002)(2906002)(36756003)(86362001)(41300700001)(38100700002)(38350700002)(5660300002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VD7bb+QMQqyswMRiTpWa+qFqUW2ovG7Fy9YwCUvM3GXCm1EPlJM5cugL4vfS?=
 =?us-ascii?Q?iGVrZpbus/7X/bKXcWClxbkRzQeWNvkp2PEnhdUTk0c+tiWEKhasYSBXMHfs?=
 =?us-ascii?Q?Gtp8ftBIW0fM37ZrIjJVZsy9+/84XGbeHpHE6G66xmhjghlCx2zFDeFeoJ8l?=
 =?us-ascii?Q?xxms0XymHhs5u+9xzX1ahSvDkJdGj24VMhiMwmRjM9EtQgdfzIEBtl86UkoD?=
 =?us-ascii?Q?dQ6ezwAp9I26yOdKfx8svYJNdkO+OE5cAhaQpqTJP0X/DIXtDvSRZkiCZZKz?=
 =?us-ascii?Q?2mZ0F0xJ9zYegyI+EtrRRgfYCbo0mx6fmDrZ1mJu24YUSpV76n39WbNtovDC?=
 =?us-ascii?Q?fASdwJWWsifmcGotZfCOuvunYk/rHw8rbX6SAkeGGsPGZL1rgoT2uH2kyURd?=
 =?us-ascii?Q?yp8j9ZN5lBzsAEY2hak75rYcQGApQE9iPjBe2QiICXqaVsDv9y9/Rj61OYZM?=
 =?us-ascii?Q?QiLGiFgy/wZbg+2MKbNHmggoPGee4Nd+tr0r1PibbnkN9lWX8STMgvtb4U7/?=
 =?us-ascii?Q?q7XuFYpYsNuCNDnvImSQYBZOtv6buLqH1m0RJigA5SIqQWRu1JTZPdeAFZYE?=
 =?us-ascii?Q?CG0DyGFPg2RoUtdP2l3soT1zs/N6AJ469i920FQZCLylzI3tJa8MXLWdh7lm?=
 =?us-ascii?Q?xQJ9kdySGJsJNs67lLOSH3okRP5oDTXP69D4MiPFDJBieyT1tb8+69Z3bOqx?=
 =?us-ascii?Q?77787fz8N9CA/OiX/kR/tXdGx5fBrErKDbBr++o41NJmvzpft/aAhWZDrk4m?=
 =?us-ascii?Q?5Zw8+AyhLdbSzlq6zLpVWyByePQ4O6+zXupCZ4SWS9vA9PoxA7000HwtslLY?=
 =?us-ascii?Q?zQzS+7ccz40awqQCjrNfLlREoOwpWNYyeUJ4UQ+74y/WTyXnI4/zYJwEQD3B?=
 =?us-ascii?Q?Qob/kxILk+zYLlo3HfgaRlP2qyTREQ026UQsrPws3Sqnrw3vMIodA6wM6Ek3?=
 =?us-ascii?Q?l676K+sNTXOKkOw3GSJDCQug6XAcf7BbrvJLmAD9ECKCpWeQxi/V/v6OYPiV?=
 =?us-ascii?Q?AXAn3s2vTmnPcnXflHIk+SOZizMJKSVHiUkPTvG0RmqNzqGk6FbUILiSW+ZT?=
 =?us-ascii?Q?grvmUCx5VhRU5JiGahKDgy9R8VMltUy3dLwE+7cXRx1XPd/cR7xVFFQL6C3J?=
 =?us-ascii?Q?6Cl9g70J/uoUAE2QFxY7NpQ/OgUIMX0lCE2+03+jsPlkEch7S8hIJa3UMtmw?=
 =?us-ascii?Q?Pk1stwmCHc2v5BswmGIaQlJMayPUxOzdffm94+dJ4whRL7x5CWpSUJOxI3fd?=
 =?us-ascii?Q?F7oMzGsHPpuDjytvihkcU3R1GenljD8ECEjNfwc38nTfVmQhUejVNd4yKaRg?=
 =?us-ascii?Q?B6XNhHNggSmAerzAIvk35RGfROm3xAGP8hG7LQrpOnuZshMh+z39ue6nONTV?=
 =?us-ascii?Q?rtRqO4xFxVoe8ljuoLBfmwE9rrTcpNb/acPLhTGO+MdlPL7RvSIp2651Ucxj?=
 =?us-ascii?Q?ESIheNpKSzTryKu7s8DwRlU8c3ok4XOzK6HZ5zjZ6ziG+WYcqUwEzGtuXMlD?=
 =?us-ascii?Q?ABVQsm3PKZSC2d1lHo36ozhf7K1E52ACdsqWg6I6IpqR3jrl1g85dD46I5S2?=
 =?us-ascii?Q?vYTOWM7vJBEzm5ys6YDapO/iQpSqWTMlGYL+guoefeonbcIgMVu46hpt4jW9?=
 =?us-ascii?Q?P69N/MEtsnLvszASUUDkevw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f11010fe-3fb4-402d-0554-08db2e57979c
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 00:09:54.5545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 S/IkFsaXlY5ObGiRqmr5VbU0508m8g3kKpEiFMF5cbAzTGprIGtIwBeawMUgRLzAsC/nDcFZ8EGe07O/HosdKhSwQjfsFBBLftHpBDb+55XhM4fkq/azEvbX+Mf/gpor
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11465
Message-ID-Hash: WG6Y5BR6UXNSNK4WX6D55EI2PEFCKKE6
X-Message-ID-Hash: WG6Y5BR6UXNSNK4WX6D55EI2PEFCKKE6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WG6Y5BR6UXNSNK4WX6D55EI2PEFCKKE6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

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
index e58b43b5da7c..08fc69cf6b74 100644
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
index 2faa0d8d0d8e..f3450478e20c 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2283,6 +2283,9 @@ EXPORT_SYMBOL_GPL(snd_soc_add_dai_controls);
  */
 int snd_soc_register_card(struct snd_soc_card *card)
 {
+	struct snd_soc_dai_link *dai_link;
+	int i;
+
 	if (!card->name || !card->dev)
 		return -EINVAL;
 
@@ -2303,6 +2306,14 @@ int snd_soc_register_card(struct snd_soc_card *card)
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
index 5d9a671e50f1..3fa30a3afec2 100644
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
index f6b5f72df65e..d88b94b5a0e3 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2789,9 +2789,9 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 		struct snd_soc_dai *codec_dai;
 
 		/* Adapt stream for codec2codec links */
-		int cpu_capture = rtd->dai_link->params ?
+		int cpu_capture = rtd->dai_link->c2c_params ?
 			SNDRV_PCM_STREAM_PLAYBACK : SNDRV_PCM_STREAM_CAPTURE;
-		int cpu_playback = rtd->dai_link->params ?
+		int cpu_playback = rtd->dai_link->c2c_params ?
 			SNDRV_PCM_STREAM_CAPTURE : SNDRV_PCM_STREAM_PLAYBACK;
 
 		for_each_rtd_codec_dais(rtd, i, codec_dai) {
@@ -2835,7 +2835,7 @@ static int soc_create_pcm(struct snd_pcm **pcm,
 	int ret;
 
 	/* create the PCM */
-	if (rtd->dai_link->params) {
+	if (rtd->dai_link->c2c_params) {
 		snprintf(new_name, sizeof(new_name), "codec2codec(%s)",
 			 rtd->dai_link->stream_name);
 
@@ -2892,7 +2892,7 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 	 * don't interface with the outside world or application layer
 	 * we don't have to do any special handling on close.
 	 */
-	if (!rtd->dai_link->params)
+	if (!rtd->dai_link->c2c_params)
 		rtd->close_delayed_work_func = snd_soc_close_delayed_work;
 
 	rtd->pcm = pcm;
@@ -2900,7 +2900,7 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 	pcm->private_data = rtd;
 	pcm->no_device_suspend = true;
 
-	if (rtd->dai_link->no_pcm || rtd->dai_link->params) {
+	if (rtd->dai_link->no_pcm || rtd->dai_link->c2c_params) {
 		if (playback)
 			pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream->private_data = rtd;
 		if (capture)
-- 
2.25.1

