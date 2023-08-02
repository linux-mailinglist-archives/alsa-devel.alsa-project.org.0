Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 642E576C1C8
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 02:59:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5662A829;
	Wed,  2 Aug 2023 02:58:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5662A829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690937969;
	bh=CA/Y8OcN6rpxKNt7DKcyxbkeY0tzXlWWfJR9oI7bUsM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dQpvUHosI8pJfhvhW66mK+FOATkKsZ0osYKy3HuPfVEyLj9JmRFpRwsOMgJK1XhT/
	 +MGskoC8vsY5vP/oZjBqBy1nTowcxmfHcLcWzdYIGsAfviUAn5e8CPlaarXfY6yKKk
	 wt8tyvlTcL65nFBxu9SmOLZ/IPRhLugE1pMm3brU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF4DDF8060D; Wed,  2 Aug 2023 02:55:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E905F80604;
	Wed,  2 Aug 2023 02:55:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2699F80549; Wed,  2 Aug 2023 02:55:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20702.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::702])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15BB3F802BE
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 02:55:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15BB3F802BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=S09FCO4K
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TUS/D0HZcq+VbSACOVGCufzyOvDB9/0EJXL3HXsauwGI1FMyaK11PeYE/Y7yLqn2r8KcRc0TnsG3AwhMvreNOb4OXJZmQB3P185CVu+kCAYqiT26mTyr8NlvcU6P8r5PwA4GirZg7CIev2aKlRnu4kC7rw34nXOvHcroo0WGbasjU4B8Kikq0BHyp2klyJjqDdLpAOTiqFiQ8UZVnk7n1kV/niUr0AtYYE+qW0cjMOIn9I69LlEC9tuVXg8oTfMbEOCJTuZ9ZItHnB7bu58afc5igMyXSbchHKsGG49OOQuQEerSM29TiU8f1LATjWNdJsnX9JYFK0oVCUkOKkenbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1dLzNzauJRelucMaq6e0/H4LrmZJgqsIkmtTaY9iho0=;
 b=P6Au6QoqzEzKfBTE4o+Jsh1NLkSn6uFQ9VHWAifuBZ4u1JH/s3uPN294t+fA9dX7ZrZJCdMkd6J/grVAfWfOcLZzLYCDiJQAUw2DqAfgUoUHIJxWiUlBo7pbe2sBP2pWS3PKtQhnrRd5UpdG9A40Lc/JMGPHOAZ1X0c044jstsGkOHHgOI4CyBhUQz9rOMt1jk2Wtgoql1hZ2pcWsz7nRQBKPxxuG65ngdosPBTuzpiboYYB6tjZmfc+hV8/O5imk7zCoqQMdXyTOVvdJTvrW+ryn7NXVxgAw2RBymj0+vk6ZrOWllMM1jfDnGYnSHudhe9LZLT/eSr5uyUk58vKrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1dLzNzauJRelucMaq6e0/H4LrmZJgqsIkmtTaY9iho0=;
 b=S09FCO4KhFeGjKmKSB6UP7uc3RGYiEqdmyErRGRCC5upzjE/AvbAnSB7kJjAV3/uvzTLfqBHPRfcmu2OeUWEnLriHM+KEv55QQB+m6WOWBO91umldTzsWMAzbCi93bGFYUzbQFSJaQ0rL44QcVRxJ98JNCCxGvGOiOagUhM1N1A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8348.jpnprd01.prod.outlook.com (2603:1096:400:177::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 00:55:34 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 00:55:34 +0000
Message-ID: <87cz06tg8q.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 23/38] ASoC: jz4740: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
References: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 2 Aug 2023 00:55:34 +0000
X-ClientProxiedBy: TYCP286CA0172.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::10) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8348:EE_
X-MS-Office365-Filtering-Correlation-Id: 3961edb3-10af-4137-3c3a-08db92f32d93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CysrenRC0d1gOPokczwOaqXuwrkz71CyW5K1o0O703gvW2xz3Wwl+YlN/B+Wb/VUtzp/8GQakPw+LNDkpPkvN6Dbp1Swgr+h8nJ/EV/rL65hUk5/QSahGxwsAsY5hkzJJUslVwqNTeesu3/QZ8z7iHz9DYd59hvS7OluknmMPbjmK/BjXgVk1RagwawOY/PzT4A1v3xU9koG7uC6lDAaBaGXKqHqg5sOcgC8fAWGinNOrC/r5sHZ0fGlIwW9iz8Vc3xGPSB69aoblxEuUXeoFcqEaWgQzsxEPdHslbliKqQ52TfR1uJMTjFTpmIBv9UZBKSzV4s/wCgmwboTYwv6oRs4HA8hDoXQKyXlswyw1l+K9sYraKIi4mcWnvGwckocvtAsHP+EsG7binNOmJitAEBrKqV3XGGtP1wbHlD+qjw+i37xVT1yqaWQZ/V2XgEqXGv+GxB8Jq1JGJDPKeSC7+WxVEKMsclFDJK79j6Gac3r41S7pwNKyF9brHxzMgyyBw3ayGCRIxdQe5swxIJJwN4T08QMPI/CAJpZW4oqQwsp+QQGBiWKQwjKQ5yGZMjEinkfagQwaTtBk3QxnN4XPkplDbeZbuPlEOvIDphjPtLNNw3rWkekrsZMZL16hNx3
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(451199021)(5660300002)(8936002)(8676002)(41300700001)(316002)(4326008)(66476007)(66556008)(66946007)(2906002)(26005)(6506007)(38100700002)(2616005)(110136005)(83380400001)(6512007)(86362001)(6486002)(52116002)(38350700002)(36756003)(478600001)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?e5hPW6rXHkrTUxW75Mf+qgZ8MtBNeMCRgLIHmyW/zwlMDN8PoGKTc9hEqcnx?=
 =?us-ascii?Q?Xyn6uvzrQVE3IqpHRDznP8o7pu6HbfnQqCFVc8hpCe9mTCa9pd52F7InThzB?=
 =?us-ascii?Q?u/59AFU8wJeQD4sYkfnzkcS0j4nGm7LRrjFfZJmAG3TTetBHOjxYxxbQ2LQQ?=
 =?us-ascii?Q?AMGlUX3cwJ8TDpqYzu+RpnAgnEaZ9oP2a5Z24O0RzwrNEkdnCzzNEzL/+iZQ?=
 =?us-ascii?Q?uQwsVcPXDlmy/C53cjFChpsD69Ug/bih0ovIkHAiRlSG6jVXjURVmGn2tTwM?=
 =?us-ascii?Q?wzqCIb6o9FYu67pw6YeOPgzacxCcdGDeREruZknilZVYKzKdFzXxXwzWUIiI?=
 =?us-ascii?Q?Lc5g45K0HXC46DmwFKm6t+glYI8ygbCSPiTeucAfgRCzYSJCDzElzSruqixT?=
 =?us-ascii?Q?xRmrB4Ymr9GnvKa0ncOWrEdcuFKwdj1/Chu2aWe11gusEetl03ijiu5Yusrb?=
 =?us-ascii?Q?0qTpaa7gEdcDmnGy9k81HNjDR4zOJyjnzXko11wwTd8QFOHvjtTnb/kgFKBJ?=
 =?us-ascii?Q?05wwlcGnnZlQRavVxbqRP8xuIobZCDRRQMiJ9ve5gD4HLoUCCqSntH73OVJq?=
 =?us-ascii?Q?+FTux+sXupUWk9mZ+GxzjN9J5Efz+FfzlmJ7x5qqDINwhq38+93SdH1ePFwW?=
 =?us-ascii?Q?B2RAuvP86muTidGbFMZblfWt6Es29mhnOO2KC1ymqjCz0n8p0xxFob/vzTx0?=
 =?us-ascii?Q?oIrh/9XrwDVt4MoSnkkKAxgsfuvG4uiE7+9mq2s0oPjUow/FCl9ZlFe+aAWh?=
 =?us-ascii?Q?Ix1V1gN/ZoBbGPdhCiGVP0vI6FQYHjfkl1/zpseXfVmSOa5IjMHFGw3CSFH5?=
 =?us-ascii?Q?8fqU/eAxDdXj0aUl29Eeyg1v0R90wPIZV7XykUsSfi7JtVFwA/JOST2mm0Sw?=
 =?us-ascii?Q?lzL3Xf8t28UYibvL5RsnnBYJulz5d07UEkE6XMsgZdqYWtAAlL+i0nuMDa2/?=
 =?us-ascii?Q?+EqtNcRvaHo2qwm7+LBYLa0F/jKECjBFTRaxi8cBNyGRlxCvUXUk6ojX7xMb?=
 =?us-ascii?Q?IFBG3/dcmTLM+O3rGMz54t2cicTEjvMXbNdK1NmJzEZdczjQxhvJQ6SIAIIB?=
 =?us-ascii?Q?kdcbfQW/9W32ddxlExrbmT7q9lGMSJ9cx5w1jY11YJvGJ/M0f/sBKXagmN7E?=
 =?us-ascii?Q?vG1+HWtXInFZ8/Q09KFMOkNRposdKRWIviU/LQ34epLH2XCbt2CyvuoW2Ip6?=
 =?us-ascii?Q?dpvuAE8U+lepy0EcAPAD82D65GjnYssEhxC6mhXwf+gTObLH9nKHdVkqRVh0?=
 =?us-ascii?Q?p4yZs0oCES05EnQjwm7m1JfsNPAeMdEuQ/AlQysK0HBLeAdL7VGObbFUzKRZ?=
 =?us-ascii?Q?VP6/61/xt9NsttF6C2LpHGalcLjnmsfDgMkN7ixlIK0mXpCi62Bg5xm5JWJc?=
 =?us-ascii?Q?vCzYPU+6xsIjWDPguRShF4kVtVxJL+af+Y1Hgh0UKbN6cxWOrRT0D3dfW0BU?=
 =?us-ascii?Q?ONw3uXzYKT0v5jbzdEYYdr6SJAbp3+sLdlFxurJYwrIC93zQUdPaEyNM5i6x?=
 =?us-ascii?Q?qX6aa5425k+uYBms2x5Coqf8qlZaAnUf1pP39aSNU6J9OGhUo3sMcX2zcWDv?=
 =?us-ascii?Q?fW8+9DCaTe9rbycWKAJnylNI1KUDurSJERM4W1HHrC/tTfSdzA8NratHGv9x?=
 =?us-ascii?Q?kn/YScVu4bdd3sD7zRKmns0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3961edb3-10af-4137-3c3a-08db92f32d93
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 00:55:34.3192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 KfF3r3h782gZ1/5qxm4Vs+GLzqI3g/vcmP+j/k7mzGxUrfZ8zfbAXImTyzslX/moNrT6kQ8akwrZxp3sQ5duTTJ6OFPH5UMAKrYcfXaz+Q4cZvpvlHAZtsQck+FMF3d7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8348
Message-ID-Hash: Y3NOQAEBAOTLPBTEIH64Q6R2BWAYQXCD
X-Message-ID-Hash: Y3NOQAEBAOTLPBTEIH64Q6R2BWAYQXCD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y3NOQAEBAOTLPBTEIH64Q6R2BWAYQXCD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA SoC merges DAI call backs into .ops.
This patch merge thesse into one.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/jz4740/jz4740-i2s.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index 578af21769c9..517619531615 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -328,6 +328,7 @@ static int jz4740_i2s_dai_probe(struct snd_soc_dai *dai)
 }
 
 static const struct snd_soc_dai_ops jz4740_i2s_dai_ops = {
+	.probe = jz4740_i2s_dai_probe,
 	.startup = jz4740_i2s_startup,
 	.shutdown = jz4740_i2s_shutdown,
 	.trigger = jz4740_i2s_trigger,
@@ -341,7 +342,6 @@ static const struct snd_soc_dai_ops jz4740_i2s_dai_ops = {
 			 SNDRV_PCM_FMTBIT_S24_LE)
 
 static struct snd_soc_dai_driver jz4740_i2s_dai = {
-	.probe = jz4740_i2s_dai_probe,
 	.playback = {
 		.channels_min = 1,
 		.channels_max = 2,
@@ -384,7 +384,6 @@ static const struct i2s_soc_info x1000_i2s_soc_info = {
 };
 
 static struct snd_soc_dai_driver jz4770_i2s_dai = {
-	.probe = jz4740_i2s_dai_probe,
 	.playback = {
 		.channels_min = 1,
 		.channels_max = 2,
-- 
2.25.1

