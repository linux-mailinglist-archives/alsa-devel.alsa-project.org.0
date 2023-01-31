Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5B66821BF
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 03:01:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5868EB4;
	Tue, 31 Jan 2023 03:00:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5868EB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675130463;
	bh=cnZxgJOpDmkVmBcM2TMoQnU/cr23c+Zkl91FHP4lN5M=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kjt9mMr8PmP7JTQjgNjMTL6K+tFi/+JbB0MGAz9TET7lX0/eemCdOz9tR7/ZL/v+9
	 X9I6a/AuEhuAVSwF/yTvmxk/tjxOrgn3JtSBtHtDApdyNcdBZaZTuddr+QAyNj5HQP
	 NZMPQr2ykrlUF2S+lagcNbU2hy7HI2egq3ty76Q4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED661F8055C;
	Tue, 31 Jan 2023 02:59:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25AE6F8055B; Tue, 31 Jan 2023 02:59:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,TVD_SPACE_RATIO,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2129.outbound.protection.outlook.com [40.107.117.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95DEEF80553
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 02:59:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95DEEF80553
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=UtTzhaY1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cga8T+maDv204CM8v1gnBgqeq+DczJ9Luawu32nOmG8vcn4Z6a2QUL64xfAk6sJUTMjaXeU1Ijcuvkv0roZZIjDNZ3P7SLpNWkwh9UBrpPbqAdaeLRahyGaoqEMOIbCKALuc+KFkCILx1wRWgPO7Yt1fbBFLlvIG6HW4agjncaWO757K04u7NBpu1f0aW1HRKIvOjOBBz4HcAO7ZnEGddLnrz3RwIzvJc4j8bpEqroNgFpXk3G/aZk+W3ygdtN/poITy53LDKGJsAs+QstTeG2BmrhmqQbPR54q0PgaNfT7cx5LA8xOLv9oSPaoUEoSd5/W7CSpJ1R1DXQ2UguJ1bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=InVWUW6g4FGe1LJnTolBTyS+unFt/5azc4hxxvd54qU=;
 b=S63+Ev6OEO82oZD9lfFrK8Oq/b8Oj6WvvU8gQW1M1NJULuzH1Ur3yWBUZNYs+e4GZsv4THYNXlCnk5HTRQo6eL+ETkmhVnIsKpV5he6DPhxFEZCBA9sqmzvmlmDJFvkUbSkAf5q0WGBb4qZpoZ9r0N8xltVn7+9v7AzTLsQ28VCGOgnKUhojZkUi3t51T2m54Fj0d0l5r4b2tR/5K82sK7Xt6MTQhM2q6cZ1qbT9bYZuBPv6bhOyuwTj8L2fRfrpuQLscTqAUozmtwmD86JhADaBne9o7Cgiy5N9OcOD1WDyt1aD4pvwmEGVbRLyAYdF+NZCuZZB2kDtuIVP8qXhgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=InVWUW6g4FGe1LJnTolBTyS+unFt/5azc4hxxvd54qU=;
 b=UtTzhaY1KT12Tha+Y9A55vrZLs6PqiFceqDbcR/RjTkZqml/AaKiroK/oozPN7Yh3gZUH5kzS1MR1KQ6QmCbFjvf9hxPn2GoTHOwzr65gJ5ds9P7/r77f7XdT5bOMtO+EB/ZkN77Dm+FjMRHXf88CtJyB4feAq77WdEDTwXPGdc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB9980.jpnprd01.prod.outlook.com (2603:1096:400:1aa::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 01:59:17 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 01:59:17 +0000
Message-ID: <877cx3foqz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 04/25] ASoC: soc-dai.h: add
 snd_soc_dai_get/set_widget_playback/capture() helper
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
References: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 31 Jan 2023 01:59:17 +0000
X-ClientProxiedBy: TYCPR01CA0148.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::7) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB9980:EE_
X-MS-Office365-Filtering-Correlation-Id: 71667099-2f50-4039-f1e8-08db032ec2c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EwI2YhLIaq1Cy5bOO+QfmuxlByUH6UeT/wGkZ0FFoRA82kUWzZ7oinDiLrfB6Hl8CfTeujXuMf3CMHgv11euCsbA83qr8iepa6P2LZbEJ6fPyjDA4LjO/46bK1E+Yw+NPtgMFqk8eX88bxRuqYSON2jLISanDvD9+2xk7FDHW1QwldU5RawGBd8BqFakS/m1LvzHh0ezJbAI89tCk2HKgf2l3zIhUj85zTZvehyd43OnC3dnkC9G/jyrxPMx+1Tyl4btzFr0J/Q5Gpk9FKMkh3jsDQB7o0rqCyOrs69omGGDP29vVrn+Mq4JFxorYNzbBYOG4vSUFsuk4OqyuPeO7KakFdtg4x3VeESLSUuUT+bDPYs1o15q4rfj0fYN4B3pBCCAJh3TvoBFCzPWJePHr0VXMtQr/aQOKgMUviLSXdHpeeSvxMzhC0Ig/opys1c3GJ5m7bE7o84+rbKrW4DrGPJA+UnSCxlR3upYn9FLMtDzlR57u/6sDoEbHhCr58CmgTaKbcXoRaej+hnzMPq7lke0wFHQAL/3qFqLbRMQRBxXpff+WtixT3ZnzO4YnrDuTraOCem5gf7wHzMLvYrswxZqTDnFULXrcJrWCRclsVmYVSSE6dUVT8lCqwtL7351T/+dzdJTd2DQZp/hFssW8OkKZMr58KTPir2zJ03tylfS3A7F2+IpYO7mJiNq4lHuTqRsX+jFtZcIGAhxqLwuTA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(366004)(396003)(346002)(39860400002)(451199018)(66476007)(8676002)(66946007)(66556008)(4326008)(41300700001)(6916009)(8936002)(316002)(2906002)(5660300002)(6486002)(478600001)(52116002)(186003)(6506007)(26005)(6512007)(2616005)(83380400001)(36756003)(38100700002)(38350700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v4kwPBmC5hxnOdJQTkcsWOgBRnA8tLlRKF9vk+qEEWPS2blmyMSjmUxDw+8T?=
 =?us-ascii?Q?VKpHFIS+H1YCn2psZHf7D7Voc1twPQ3dNi3tHuggRG/2jf/CT0+q/4DXqUDb?=
 =?us-ascii?Q?oZ1euYMy8uoR+tMKKCBWoK3t72SorMqpOeFo1+Oa2QldLdtrql3vXVU/HjpN?=
 =?us-ascii?Q?LbwqiU+xDpuly/bhOUYWiZC1PPpD2CC1aEAGkrj0x80r7Kgjw9axoaVM80+R?=
 =?us-ascii?Q?NhVs4tmwg2Ku20javNfW6TbdmN7pgunu0uBfsH4LyHhUH9Cc9cimtZ9TAfqi?=
 =?us-ascii?Q?/2yOuVqIkrKf2DUjjBIvtxT1pjBBmMx1ZbOlktp1O3CQPCX0l8G3BvTF90kf?=
 =?us-ascii?Q?kANXWdcdxWFqw2u7Qk4IaIABqwWyhUezajKhJN4+j6FtCe6dAcDuE4DVc68n?=
 =?us-ascii?Q?DsXNsngW6bRCupFvMas0rO1W5Bmm1hw66ApVZgHBIFMq44HjKqWfkEWyz0f3?=
 =?us-ascii?Q?RwApx3eoe+fu2ZBcrF8XwP6W3/OlYW3JB9J8Uf8ZRkow+25g6QJSworqV6vb?=
 =?us-ascii?Q?oVO8JkryMEGxw1LrCIVLMtziAr3TWlenIxk8urq13xSenQPfBTFTAjRLRO13?=
 =?us-ascii?Q?ldEdvxiu85d1Lm99HROCGTmzKl3vKGJHgFhyXxi6didXTPKhmNMr/Hna2yL+?=
 =?us-ascii?Q?LqhAPmJdmbiJY/QIzDFuCRaUv9pLAn6sJTCFcIh3+e2mz1pFilDc2u9wjMwE?=
 =?us-ascii?Q?oAIECJajgNp9KECt6p8H2USfUAZ/kSavAYttiDfPo2OHWqGU1fjtTkOV/wt5?=
 =?us-ascii?Q?BA9nWhx+cv8vSOUKFEgvSSeQ/OWO7oSbGIZasDGfK10o5WNAuAbyuw3nZOnp?=
 =?us-ascii?Q?sgVq4ogA/GcNfputKwurn1nzd4JAT8owSMWTWKdASRCVzWux6CDH3WBC6xWV?=
 =?us-ascii?Q?WW9A+fYBQAEM/2fzsonfMgXp4cdvsEy45s27cWe0pcGSLTAqqmafn81lcXsH?=
 =?us-ascii?Q?jWW4Q10U+91G8ISCrEktyJixrAJvYgc/AqXZpPyablg3Y8mukFu5JOQ8QX85?=
 =?us-ascii?Q?hC+J5zVSOR3nt0wRdRRx6fRvcJpZYTXjr8eEpyFFCQ5fgCl53yrYbxbpFqFE?=
 =?us-ascii?Q?1lKEUHVMp2K5O60ofAcH+pPTkh2cRGhBJ/PutpeOxEqUiN9uY3l3os/EwM5T?=
 =?us-ascii?Q?BbhyeHRsQthRWuJJDNHKVlrqrhuxfZANubuNEeiGEQKRnTIOmHf+oO89D8Hs?=
 =?us-ascii?Q?2+ZzShaP0h2Js15SSQGrlZ0cNSLh/kIQiD6KXQxDwv8lN68yJ0zVwKrcAjKn?=
 =?us-ascii?Q?/J9dZUhJMH54HImPFVrP7nWib7ZOHPEiSuVZG6UiuZLiRhs/HcogK5ABNkkY?=
 =?us-ascii?Q?BcZ7VaIukgQhncVke3iaTAM0rTZ/EEjdfB+16MYWEfp6u6FvINoDEQDcJNor?=
 =?us-ascii?Q?kFPmxwlgcHpq6Jzw3uOWsFtffhfmGyH4uKZKEBN+dxbYqyRIlX3iftE9UUnH?=
 =?us-ascii?Q?seHLhPAerSW3qXouOvIW/3jo3g8UGw2DWhkb71ACb6BI9VifGE/i9od9P/3H?=
 =?us-ascii?Q?8ZymHsVSBN8EEYERX0Y3ueaOr0ONtLHBxiTIL7uWzjTfvB8W25N51bYhokuU?=
 =?us-ascii?Q?YTeKBUIUvNtHzDs898d94w2aVYfz3lSbjXwEt7kLZstwTLc6zfj2xKwF6XuX?=
 =?us-ascii?Q?gqx/Whc7TmEcjC6P1DDGYKU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71667099-2f50-4039-f1e8-08db032ec2c5
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 01:59:17.5438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SLtaKo3tc92FK7Hz5wUZoMsGJvsDT5+jsgflo5hLLhffMpZe987yVBEUO1sPl7YcpoJXrbkJCV6Gwg2F2WBNFoL8oW6D4D/0WLWEv3zfSywlPLuB1KkVaqVI7Db6SDSb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9980
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

snd_soc_dai_get_widget() requests SNDRV_PCM_STREAM_PLAYBACK/CAPTURE.
This patch adds helper for it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/soc-dai.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 9b18e230e5b3..197dc1629708 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -477,6 +477,8 @@ snd_soc_dai_get_pcm_stream(const struct snd_soc_dai *dai, int stream)
 		&dai->driver->playback : &dai->driver->capture;
 }
 
+#define snd_soc_dai_get_widget_playback(dai)	snd_soc_dai_get_widget(dai, SNDRV_PCM_STREAM_PLAYBACK)
+#define snd_soc_dai_get_widget_capture(dai)	snd_soc_dai_get_widget(dai, SNDRV_PCM_STREAM_CAPTURE)
 static inline
 struct snd_soc_dapm_widget *snd_soc_dai_get_widget(struct snd_soc_dai *dai, int stream)
 {
@@ -484,6 +486,8 @@ struct snd_soc_dapm_widget *snd_soc_dai_get_widget(struct snd_soc_dai *dai, int
 		dai->playback_widget : dai->capture_widget;
 }
 
+#define snd_soc_dai_set_widget_playback(dai, widget)	snd_soc_dai_set_widget(dai, SNDRV_PCM_STREAM_PLAYBACK, widget)
+#define snd_soc_dai_set_widget_capture(dai,  widget)	snd_soc_dai_set_widget(dai, SNDRV_PCM_STREAM_CAPTURE,  widget)
 static inline
 void snd_soc_dai_set_widget(struct snd_soc_dai *dai, int stream, struct snd_soc_dapm_widget *widget)
 {
-- 
2.25.1

