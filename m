Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A4E774EF8
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 01:06:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B414AEC1;
	Wed,  9 Aug 2023 01:06:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B414AEC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691536011;
	bh=T/JYhbmvi6JEIwMO8uqAO8+4/7EKoe3F36kpr7sBrO8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bjUu0HW7DT0nRXnHyLX5imdT0/QjDX92g9i+s6LEb4VuR1G/qDZ85TbsuPAvuev6R
	 1ScWSTLdojIxdAgOffpjSb3a79pGl/GLbWnYUSY6Et9WjChLyxgZ7fnrwUvphqBjV3
	 /aWZ2kG9VeGanj8bbT4ow4nqZsgi/fhuX7nlkwOg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56143F806D5; Wed,  9 Aug 2023 00:59:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BA204F80605;
	Wed,  9 Aug 2023 00:59:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B565AF805F4; Wed,  9 Aug 2023 00:59:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2071e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::71e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 46089F806CE
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 00:59:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46089F806CE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=AiccxorR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PDlsD78KjxMFmjrC4RWdh4W0dZMFI9+h3UTfjKfnC/BmSmUJzxNqGaMSNuilW6O37I5Ps1lSLuzYIj5zasIF6ER8sHh5/QpvdGGAHqsnr3WSXQUaqQGVXUmZeV03EktkOMChZKAPPbKPM9hSaCIRWLyWbcgNs7KQq/txMGgwOT+f+iIVPoS+jservNS0Pm3/Wb4QX2ZyCm0tbCWn7yRFjEH0fEj/cAZmiZI+4STuFeh2wRTlLN4F3VPoxE/vrWOVRojqm9ndFsyyIou85mjwMtmRZm7kOxLvW6aquZD4jSyQW5nNNp32CEfzgUKYg1KJPd40gPxqlGl0f332HlLeUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmdMINNXf7yZVGeNQRgMRAOzqUBW5RKk5UUksA8gCUI=;
 b=hCjnCUIljC5dS8lSEbvq4kYXz7eJ8eYKLJhAGlWarpO6QI7U9gWQ6jFrYDA0GXjM6+0ixHO9O/IwllN953LX/RJXung0cOoEwU/BqMErqfbqPE39Iir2QyRk5Gzj7n5W2ecX/QODdwHyVOlYrbiolKWuMxsaDrUtSn2V+9ktrHG2y26lgJQ4WbdE6ronlasa/4zXGy9PSY34/m/Usp36+J/VwvW8ccevr8cx0zBluA1BTBPM7RZqp+xTv8nQ7yj9mLct5IMOG2oumRgON7MpFTwdF3FfwJ1vGXpMhoBNBVccgzdFea3dj0QR+KwjzJnksaV+xE6nDw0eKUZxmX4JMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmdMINNXf7yZVGeNQRgMRAOzqUBW5RKk5UUksA8gCUI=;
 b=AiccxorRsU+9NMQDufKGy8hC9y/YvyZ7mGNz3XLK1AfgnWe+WnIMo99cDpnFKHlreNnaeNM/vx1VWSEzE5zv28swvOc30hBsWEh+tOyWSPpZRmd4UXNWkTYpF3wNbxkDRk4ge9qT6w1aXEhjIZSt+UCVRYnoWgAIlbtsKXILvSE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8414.jpnprd01.prod.outlook.com (2603:1096:604:192::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Tue, 8 Aug
 2023 22:59:04 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6652.028; Tue, 8 Aug 2023
 22:59:04 +0000
Message-ID: <87cyzx9m4o.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 39/39] ASoC: soc-dai.h: remove unused call back functions
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Aug 2023 22:59:03 +0000
X-ClientProxiedBy: TYCP286CA0169.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::12) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8414:EE_
X-MS-Office365-Filtering-Correlation-Id: 09508c53-27df-4554-9daf-08db98630ff7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	08nZfimdxRdo5kCW6lYhzQ/2fo2Go6VD/KArR2Sd7qvadi9RFQZFntFsKxykrd/fu5Mt1oBiE3Gl8LvYmonljqgL4Vz3PgX2Ibmf1F19j9sFAN9MVKkP0NrVG4G9M40NB1rc4qf+GEL6GuoC4F9/78O44a9xrZdW5kTfGFt3CDygyCoOsf0HXKgGnyKIHqpa/RTHmtP3HebXt29LAxsZ9sDQtRi9IaUKa0J3bx1w4fJ159qxqAyii1To+AN6A1TgpFBgZyAh/P1eisXRkDjWueUcqGD96JNjUKK9y+cNAEnBlpuHu8HBM1PfGGneDofdoBZSnuSKI/QzRBx6glQ9uqlNFYkmjvzHQfV/71nycOTwSk4DArY+VSgWyTWTjFbRO6MU2DtQTnp0Z7e0aHlHbi3QoKV+eBf0bQA2zUx9iDVq7gmZXoLdm9JBgnigLl4/1a3VBZPHDdO9wW0SEdr8rTAfvEjXhIlgFjPQuWSD4hvNu15NQ9TLjnjWuycIyvVe03t0nhW8kEjLSGEtleN0t1Cjju3+tX7MdGWXV9/to28OHgoFTVLENOENIDFtVOsUsfZJwUx1IfDiaj6mrqp89/ddt1ucjAEazGp6Acg+tOS9z5ZOTL7LQjzQuMHQZsfw
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(346002)(376002)(39860400002)(1800799006)(451199021)(186006)(5660300002)(38350700002)(8676002)(8936002)(38100700002)(2906002)(86362001)(52116002)(6512007)(6486002)(2616005)(110136005)(83380400001)(478600001)(66556008)(6506007)(26005)(4326008)(41300700001)(36756003)(316002)(66476007)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tXHs4jpD/P9gIlZ1Gq5fX5OsKlY9EEHeczGYkYXStAmF1kqPAapykYcpXWnO?=
 =?us-ascii?Q?A4JjFomP2bihxPcPGxT3qtHlzSqLq28p7lUjn9l3ZNwxqoyWX/CRed4l072v?=
 =?us-ascii?Q?4nfhyefQPdBIy2TCpwyPjPcP7+7xQB6MNPcKqLVyMZFFtmFg3nJplyOFsf7V?=
 =?us-ascii?Q?RSFT8+puX4HPALBxCvmvy7OL0vXvY1sw2z8+v27JKfi7JWbW3fgfm5YF4BKz?=
 =?us-ascii?Q?xKpVgJGDk7S4T3V1xvBJTTREto/OlACbXFO2Am2He3uEdpPhLO+3kpzUoWKN?=
 =?us-ascii?Q?LhMAX8zE/FG152sxGn05rNe0uH93iEgsxVsHbHVVfl1HvtLsAqS3lOsGch6v?=
 =?us-ascii?Q?IGHskur9gYwSNMslRUl1EA7OZa3j+1Dq/IRFKGSaOjnrvJZH813AKO0frrbm?=
 =?us-ascii?Q?UxGUgcXDNwNdj4BobFbSLtN6MhYvetvP2MwEwyHoE0AaiB2yRVPq/+MGaHkb?=
 =?us-ascii?Q?POGpbSPknGU9ZskPlU2D7kntXzXGrQFOmZmkrUJFAOyW9GdLg5+ZQJ31UK4L?=
 =?us-ascii?Q?dkgjVMYKyYVQKd2WkT7611n63Cfh1UOyu4FmzG6wIJV9v9kYWY7BaPiLZlEF?=
 =?us-ascii?Q?AxdBewqYFdBICze7KBPgMspOX5e0N47IwsLnQ912OSGj3B9dj/VILWPFKwQ/?=
 =?us-ascii?Q?ntebwTmB7+RtAQmeDylpgc0sfxWH1yP6r3+w5uBAV3/a1XYRfRfswr540VpI?=
 =?us-ascii?Q?arQ5PXQupQFMqkfUNBiJbe+qfL7aDLEC4Uxf+Yjitsa5AvJb4gmvBH19/DZK?=
 =?us-ascii?Q?cZoblsxnZZ9KRX05CB7Tyb/2bKMKz0xW1R80JmImdxDzhmGouvGahdr6xMcB?=
 =?us-ascii?Q?7AxXW/j/Yy3XE3KIEZ75tbIsyRSxXS2RtSeGQR4L9wV3r5qEmCFro0/0wtdh?=
 =?us-ascii?Q?BopupitODJUz+aweY168Fksk1Wu9C/qEumbU+YKSIGN9JXL7F6DjhQiIKID8?=
 =?us-ascii?Q?JHDKy85YmW2HEtNjxzEF8Pt9lcMWAeqxHaPnoWwzu/v5K8nSbW7P177Dpark?=
 =?us-ascii?Q?53UQIK995uRfeEYg9XqgCsFIYOXMYsjFp2VxM4haM/lz5lg4r6Gxx/KEg9hE?=
 =?us-ascii?Q?Q6JnD7c1Y7c8Qe2wU9wFJKkpzAvjqV3A8a5Fl0tgxMJUOiBF2ykxzTLkCG0i?=
 =?us-ascii?Q?ip+NkailTcoVFaYYTB1a2CNxUKmTCxw1ypqfgP2suEutjuIa1Mvn2xEvtNrp?=
 =?us-ascii?Q?EDQ9QpwyX6OgQ8Jsy7wKaqXeCuuWZOn/brRnY+xu39NpWe33JtlDngAmK5r+?=
 =?us-ascii?Q?W4XAp+LjPs9SuU+rKcp+scT4CBga+frESUE/HwMIXtgNvAnGsq8GrM6HnUlF?=
 =?us-ascii?Q?YyfCcn9DdS18UJUsm/fcuVxgJcjg75hH7wmqDbjGoI8KU2wY85mb7JlBRYTC?=
 =?us-ascii?Q?Qj1Tt17CiOIUVvUmyXCZJ8IDKFymH/SzGv+Dq4Jd9uPQqtFg2kzECIFUxJHj?=
 =?us-ascii?Q?RsrNKZYqmGoRjM/BNLLQTehaE9LoVDyjcF3udjOtv8GJnbUzgdNanTN8RR+t?=
 =?us-ascii?Q?dHYmdwdBTU/giZDlvs/47Q1V6dxA4Xgs0MUZ52/X3vWzkFH5fevL4Xzw7rRB?=
 =?us-ascii?Q?yuP7tRlqUqsyA+RDnOoTpzDLK/+3WaZLSu8KEd52odUttDdpOiB5bdTUm0F4?=
 =?us-ascii?Q?ovNnX+V3vNvYkH3syUw/Hxg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 09508c53-27df-4554-9daf-08db98630ff7
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 22:59:04.0828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 KGveQWTLkeAyKP3OkX2r/gSBZPst7P1zHrcTJR5gvzFYlcpTW8BsuSylRqmkxDbLMIpMkkKSo140qEXYaOszrW72yPTmt6aTMLRqkkec8mwklR/sJPQ2QsjauIj6y5si
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8414
Message-ID-Hash: DOLTKK6743ELF57YQ5QSBR2BAQVKIQTP
X-Message-ID-Hash: DOLTKK6743ELF57YQ5QSBR2BAQVKIQTP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DOLTKK6743ELF57YQ5QSBR2BAQVKIQTP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now, all drivers are using ops call backs.
Let's remove unused other call back functions.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h | 13 -------------
 sound/soc/soc-core.c    | 25 -------------------------
 2 files changed, 38 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 85f897fea21a..5fcfba47d98c 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -414,15 +414,6 @@ struct snd_soc_dai_driver {
 	struct snd_soc_dobj dobj;
 	struct of_phandle_args *dai_args;
 
-	/* DAI driver callbacks */
-	int (*probe)(struct snd_soc_dai *dai);
-	int (*remove)(struct snd_soc_dai *dai);
-	/* compress dai */
-	int (*compress_new)(struct snd_soc_pcm_runtime *rtd, int num);
-	/* Optional Callback used at pcm creation*/
-	int (*pcm_new)(struct snd_soc_pcm_runtime *rtd,
-		       struct snd_soc_dai *dai);
-
 	/* ops */
 	const struct snd_soc_dai_ops *ops;
 	const struct snd_soc_cdai_ops *cops;
@@ -433,10 +424,6 @@ struct snd_soc_dai_driver {
 	unsigned int symmetric_rate:1;
 	unsigned int symmetric_channels:1;
 	unsigned int symmetric_sample_bits:1;
-
-	/* probe ordering - for components with runtime dependencies */
-	int probe_order;
-	int remove_order;
 };
 
 /* for Playback/Capture */
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 7dbf37e0ba2f..a5b96c17633a 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2510,7 +2510,6 @@ struct snd_soc_dai *snd_soc_register_dai(struct snd_soc_component *component,
 {
 	struct device *dev = component->dev;
 	struct snd_soc_dai *dai;
-	struct snd_soc_dai_ops *ops; /* REMOVE ME */
 
 	lockdep_assert_held(&client_mutex);
 
@@ -2539,30 +2538,6 @@ struct snd_soc_dai *snd_soc_register_dai(struct snd_soc_component *component,
 	if (!dai->name)
 		return NULL;
 
-	/* REMOVE ME */
-	if (dai_drv->probe		||
-	    dai_drv->remove		||
-	    dai_drv->compress_new	||
-	    dai_drv->pcm_new		||
-	    dai_drv->probe_order	||
-	    dai_drv->remove_order) {
-
-		ops = devm_kzalloc(dev, sizeof(struct snd_soc_dai_ops), GFP_KERNEL);
-		if (!ops)
-			return NULL;
-		if (dai_drv->ops)
-			memcpy(ops, dai_drv->ops, sizeof(struct snd_soc_dai_ops));
-
-		ops->probe		= dai_drv->probe;
-		ops->remove		= dai_drv->remove;
-		ops->compress_new	= dai_drv->compress_new;
-		ops->pcm_new		= dai_drv->pcm_new;
-		ops->probe_order	= dai_drv->probe_order;
-		ops->remove_order	= dai_drv->remove_order;
-
-		dai_drv->ops = ops;
-	}
-
 	dai->component = component;
 	dai->dev = dev;
 	dai->driver = dai_drv;
-- 
2.25.1

