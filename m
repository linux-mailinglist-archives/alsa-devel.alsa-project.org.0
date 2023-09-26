Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDB97AE604
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:34:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA3A9ED0;
	Tue, 26 Sep 2023 08:33:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA3A9ED0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695710089;
	bh=XcOJ+miBOPBhpEsnP1makq0FYHT2futDKTBFQVk0y7c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BW1bImKYlIeO0vCj3MHMJFqUgiQAxvBM1C/xFe/VBqQcZw5NBp2d+9o5JOIARy63r
	 8EObsyM2klwe2/gN26WrsE8Wah3cWvzXd1hl9XsmArWfByLW138g2SDclJqgbeMwva
	 vt16ErdXrXeRYhSERZZ0J2zNdZ1RvJ0+5b+FAWxk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26E38F8060C; Tue, 26 Sep 2023 08:26:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E600F80616;
	Tue, 26 Sep 2023 08:26:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D3CDF8072A; Tue, 26 Sep 2023 08:26:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20715.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::715])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 41A3CF8060E
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:26:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41A3CF8060E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=LREbo3lO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qtt5gMgH25mcRTmJOLpbqsJHzQilvW4G5CQm485TDDmNd68NjXpFkrogi9WVb/AI3qiITdKzL68n/0fY+dfUdRLf44ENCfi5r8A8ADTUtGDPhTA1nho4jziFTB30NOEdnArUbXLKwvsrGL696+lfaV/qRA8O3fp/qVK2t0C+X00FibFf40jFt86jU1puFPq+0HRGrkBXa5DXwkW069GS2CkDde30yKBCB7zab4tFKFgKJkuedE3Hzh7wmxcj/HvFisIrbi7KsWmxDaYN1nTbqxaD1r0mOjTBa7KFZV6LcKn/EXm+GmKmy/hzFtTj7yFt72OrNn7IXrZCKY6B9BViTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQXfnDWteiz8GE3/czrvoSSltI6Csd83QA100FZ+hl8=;
 b=FxonDInPVkOXkcJ+Qg/+zgy9SfcNGXEvNudYcxeWckVB1peHG2hq6F7e11881+YGv1O2ejsi+W5aprXBB4vCjjsloIAEbQHr0E3jhq3+fEmho+ihQAhHdAobKDxfPncAlRTOgtkVwwvTarY1S/auWxOf/1urWGklJVoZbSLV8tjPk/9yr2XrroPC8zn9W4R9VPJdw84O2RIWNRp9MwnzHUEn8xL4/DCGWCF5Qxd9vPrgu0PCbsDYQo/ujxW5eVT5pvoE2PdevmVHSZXosOCqoYhrkK5XmUqnJNDdCxnAnchjLQC5RE/BlBSvQ2+OKIkY4ydWA/lPB1fpTuS7SKGH2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQXfnDWteiz8GE3/czrvoSSltI6Csd83QA100FZ+hl8=;
 b=LREbo3lOxK0eANC/yJtqU8KelXmFE/hy8vCPw2St5NFiLX8kSh8eincqM1lyLtqzdSzjXtTn8HP8Kq0Bz4LEg5KyWKtK5xhRNXaJNx/5u98wfFVz7nChyEgw7UMny7GqK7iuZ5X3Y7KziNm4wjfl42N5jP+HZWoxuKnxKoS5ZiI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB10043.jpnprd01.prod.outlook.com (2603:1096:604:1e6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:26:28 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:26:28 +0000
Message-ID: <87h6nhfo18.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 48/54] ASoC: soc-link: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:26:27 +0000
X-ClientProxiedBy: TYCP286CA0118.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::11) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB10043:EE_
X-MS-Office365-Filtering-Correlation-Id: d53d5e27-0735-4fe8-1262-08dbbe59841d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	P2Sp0XxxkJViRu0OQ9Dl7JzwvpEabmQQqAHwtDg8PnTf8/Tu53TbDGMXVCx/L1CqioR1S2tThXo7CPQqjjldPcHznygf4T8hQb6CFiyGczMLQ2WiNCaVXgew8q6Z2DovU9Jg16r8L8PsmlMoYTJb+I2NBI4oXjocaQcsg1ly0iIAvgybZidWvq+tqa4s7dsTPbXpY256YflshUpike2D9dNxqb9wnMoWYiZgCUeeFgJEg62AdC+YA9mcX7vDZ3CtTeCsC11t+ESrIYvCaMwAEjFk4eJQUTb2xzWapWHSYdqbiJ7Vc1aUDeXOrhBgGkecqNYfG3co+6PsQnBvCptKb/LJfmkslUui3ckRE0vVMVlUaj+TwislHlHZoKdT+xaCIZ9P1MuUTUd6Z2LlVjxObKm2Xc18J4npS99wHcPfSWxANe8VfM074O8jEeWuNDWbF0upoXPab7jinKzAuh2N7WD5ygpWDM26ecdJlFdsjZKaBRtbry8jFc73FxP9C1l3bXMrgQ4wKzgQtc8Qpueff3ao6VcpkYEmuHN7wVe6LN8udPio1nRf8ovUbwmkug+Z3+bU8HBm8jNviqT6Ouu7DX/Tzad5K3Jcz714K2g1teSvuTQe2wYry8e+rXnR0ZBQiZcML8+IBncpXHdfv9tDlQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(396003)(376002)(346002)(136003)(230922051799003)(451199024)(1800799009)(186009)(2906002)(110136005)(66556008)(66946007)(66476007)(316002)(4326008)(8936002)(8676002)(41300700001)(5660300002)(2616005)(26005)(83380400001)(36756003)(86362001)(38100700002)(38350700002)(6506007)(6486002)(6512007)(52116002)(478600001)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?m/jDoCUaK4fXBRBO5ATSecElzz2vdgPpDGs6Ml7BpeKy/eOjpdyvWekzFQWA?=
 =?us-ascii?Q?uEJmLQQWa67c4maWiqODMLKObg6ICwWrhv8ZfI4v9D0h2TVm8rJWt2CQNhk8?=
 =?us-ascii?Q?9oV4cJqysLPSeHkqirrDvar5PplWzmVlsdPwJHJroxupgbk8jrTYyKqGqXjx?=
 =?us-ascii?Q?4vqnvATW5tsDMeRmKoF5mSxbQ5X3dW61TdWXj37C4ysrw/lwIJT6kFBa+XUS?=
 =?us-ascii?Q?eJwRKhB1A2f2ai50dnHCr4eb1e7ER70d5yMaTbpPYA/AZhsLgvjWboeojy7N?=
 =?us-ascii?Q?cKQ8tmrBeaUj/IVp8qbWXyvy+Vlc0j6BDvFHO8ohaaN6prBgDxc4Fokxxe3T?=
 =?us-ascii?Q?oxoTVAt9T8SSDRV22Ezziq8dxejW9lrOn9zqFxeY/ZEfaA1P+P4fzWfdW/ji?=
 =?us-ascii?Q?ZYgczyEZA8PZeK9ZUycuO5+j/0KECXpmkcCS7lFI9UT2zm8qmpW3WkqrHr5l?=
 =?us-ascii?Q?zm21nptJx4BhqUTrK/r/E8ksaMJsUT9wH2QoUrCKdyUnO8jgMqB+dIlHmlLw?=
 =?us-ascii?Q?jJysjc81mgxITPli+xElTw5phFpQyAHyr8pq26DdRL4LzYhvN/9FNCd3OB3r?=
 =?us-ascii?Q?9FBNGIxcur1//Znf6R+pkA/lmOsm4TgTWuAe812UZAfCyRlJsi7/HqZ1iIDD?=
 =?us-ascii?Q?XCtUa0bMkzuD5kWHUk4oF3XknoVqNF0ykz4v8Pnj1dxvS2MOlXMFmTlBQPls?=
 =?us-ascii?Q?AiZfLAGezOFPZwuvgFeaIv1C3fA6piRbHkxTgd5PzTTnKvQMW5NrQMcPgul+?=
 =?us-ascii?Q?DtWW+JVpObq70HeYsuanRmz7znfzul/w829Wg2S5prQa3wvn2AZ/MIhgdKKz?=
 =?us-ascii?Q?1XXng7RDkrjWXjhzdHZ4RADNjcRiUX2AMM8vc+DLgF19An3kXOxumPYKlnDP?=
 =?us-ascii?Q?W4+0k5ACNzFit/xZfXZeD+Lhy972IrL13wmfKmoAWY6O0lufMg15zeLTArB7?=
 =?us-ascii?Q?u1iFazjzljDfhK9R7pKA78/+849XalLv75sGwxRMCZ7G3eQeEhQpjwonsBFM?=
 =?us-ascii?Q?WqysbUURPW0nFdnd34oRMwNtm/WypTi5GdTyW2Xbc63C+y0eiMIia3XZGY/3?=
 =?us-ascii?Q?e4F7/ZVnCitAMYFX0ZXHqDlh7t62mt8gcmrl996kToOUXnRsPQY6VMHfKfqD?=
 =?us-ascii?Q?Ak9r7+haaZJzH3CulgoNJKnE+ByKW8s1G71N8JEo1MRn19TspPZrewA5nCX2?=
 =?us-ascii?Q?FLX1RWwGl6k/YFovATeATzEtWyv9ofuveoLZ/IH592/D3G1HvBmw/4oh2SrU?=
 =?us-ascii?Q?rRrSE8sUINBp9ihKxWuX0MCVDOO+m7buU7S4eZ7Hb9dFDYD5VuEoaaE7zQXx?=
 =?us-ascii?Q?peYp+Ww2EATBrn5WW5bTaXSMrINeXwi5riZ6JkZXgEawxeB86XoFaKXgTsMG?=
 =?us-ascii?Q?uZLcvVFcWiuutgpnltPjm1GoTaJmNxzcksmmynP1OC6nKSC1E9oeVDNFA3ZO?=
 =?us-ascii?Q?+rr+hCBgz4VUQMGUVxTQZXgl2QDIEA/Zn9IN6qCOE0SImqeiW9u7JyObupXr?=
 =?us-ascii?Q?gCxmcLDHC4Gw7/wOnIf6JG40HY0zwJ+3KdmRfTXrdGmf206mugVWXniwbIeA?=
 =?us-ascii?Q?7A0/m0hYST2Lx+GSfNrVylugDbl5N0B0iRJGmZsTxDqgC8G5wtkZ30gKfeyG?=
 =?us-ascii?Q?WxlChmN7260shDoo/DSPbE4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d53d5e27-0735-4fe8-1262-08dbbe59841d
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:26:28.1768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 7qKcIcoQ9xN/ipl8ozkbvwN6RhH8oeAF4n55H0VHUpymTn0E4WOCuRYa0RifICMryWeM4vxHewUzhcwo/xIhil7GMQFOQ/eQF1p8eeFMSa9JEKdivKA5cLe4x6fVw8KO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10043
Message-ID-Hash: LVNFGRUYPR4M6M5EBFYRL5RVQ3IM2GMF
X-Message-ID-Hash: LVNFGRUYPR4M6M5EBFYRL5RVQ3IM2GMF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LVNFGRUYPR4M6M5EBFYRL5RVQ3IM2GMF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is now unified asoc_xxx() into snd_soc_xxx().
This patch convert asoc_xxx() to snd_soc_xxx().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-link.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/soc-link.c b/sound/soc/soc-link.c
index 619664cc9ab9..fee4022708bc 100644
--- a/sound/soc/soc-link.c
+++ b/sound/soc/soc-link.c
@@ -67,7 +67,7 @@ int snd_soc_link_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 
 int snd_soc_link_startup(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	int ret = 0;
 
 	if (rtd->dai_link->ops &&
@@ -84,7 +84,7 @@ int snd_soc_link_startup(struct snd_pcm_substream *substream)
 void snd_soc_link_shutdown(struct snd_pcm_substream *substream,
 			   int rollback)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 
 	if (rollback && !soc_link_mark_match(rtd, substream, startup))
 		return;
@@ -99,7 +99,7 @@ void snd_soc_link_shutdown(struct snd_pcm_substream *substream,
 
 int snd_soc_link_prepare(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	int ret = 0;
 
 	if (rtd->dai_link->ops &&
@@ -112,7 +112,7 @@ int snd_soc_link_prepare(struct snd_pcm_substream *substream)
 int snd_soc_link_hw_params(struct snd_pcm_substream *substream,
 			   struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	int ret = 0;
 
 	if (rtd->dai_link->ops &&
@@ -128,7 +128,7 @@ int snd_soc_link_hw_params(struct snd_pcm_substream *substream,
 
 void snd_soc_link_hw_free(struct snd_pcm_substream *substream, int rollback)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 
 	if (rollback && !soc_link_mark_match(rtd, substream, hw_params))
 		return;
@@ -143,7 +143,7 @@ void snd_soc_link_hw_free(struct snd_pcm_substream *substream, int rollback)
 
 static int soc_link_trigger(struct snd_pcm_substream *substream, int cmd)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	int ret = 0;
 
 	if (rtd->dai_link->ops &&
@@ -156,7 +156,7 @@ static int soc_link_trigger(struct snd_pcm_substream *substream, int cmd)
 int snd_soc_link_trigger(struct snd_pcm_substream *substream, int cmd,
 			 int rollback)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	int ret = 0;
 
 	switch (cmd) {
-- 
2.25.1

