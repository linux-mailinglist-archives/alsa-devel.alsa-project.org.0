Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E6C774EF4
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 01:05:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB514EBF;
	Wed,  9 Aug 2023 01:04:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB514EBF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691535945;
	bh=xo2Utyw8lxpudwTDUheI8L3FsXHr3saZOu0N+cM5b2A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=t6P/LAhIzPvqYwy5TXUy6e2H/Cs4jRCitgMSPtN+fnBnxaHezb8WmtZmq/B/J3XRs
	 rnI4ieVxwAHwrxg3QmZaNNBYikUcI3E8W8FJ/oQEx/s5HDE66pI45ps4x81TI5yloK
	 IRle2zVuqKKKHD1OOhy+K7jWvu9vrsGN9P7sYYWM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C7F7F80564; Wed,  9 Aug 2023 00:58:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3A91F805FD;
	Wed,  9 Aug 2023 00:58:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37DB7F80564; Wed,  9 Aug 2023 00:58:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20716.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::716])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8569CF806B5
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 00:58:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8569CF806B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=WAdzXl61
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kM7qyQGGr0PPVDar/LsAgWm2bN+hdLMsKCp17sWxj63n0WcFhtzpSWQWtrZvyrdpt+vp3A4ou1pfI1aAZVPmeDyKyTC/MCAxGr2bftdE+40d/KW0vIlWUQli5KIKtf9k5JvrA3YaLwr6BnFd3s2hDw6hB+HLRdLQTAPI0zb3GWm+DB3a7oYIusUjmzwIlxH3XFr538g6DuTUx28i+EiChJiV2vEesdVSSykayN6vDEclEHNuBGDoFMvHAjNlu1qfn/K154sanhBetiAs13nfaHNegj7G6/AVj74XHuUUiJNxUdvz9zBLDScSzHZvO8Bh3RHy3HANy5CEaSe+rrKpCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tqq9rfk0v8IhGlN5/b994XJ7vAqT2uEGmcOXs3S9DPY=;
 b=dj9ff00/mFHCR9jZiYM1geImIJ9I0ldXcWh3LnLqTJNrXG8ffMBT9FP9a1OuPPiuN82aRhhpjHiTEpp6IUiLZqCT+2WyCqTF4dpGVDil4LyRd1z6DSO0YYVmlmLZcT5cKZvptUGFpfwJCmPOs7zxalhnDy6lh3IQ1wLhElHLlT8Vm9ZQrgHA+YeGL6LkUsGibHeoDkKrJWZ9W+JI0RK1Cvi7iQeralx5aLD52qWDLPiIvt2rIcDz7EVd6DBAHsteOP0Oz0ptyWm3tpMS9CR1Y5lv1z8Tvz+PbPnN9YY6kUj3CwZSxahMCDBBltfBgD7QOcKv7DZ0BtldXr3vLfGAQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tqq9rfk0v8IhGlN5/b994XJ7vAqT2uEGmcOXs3S9DPY=;
 b=WAdzXl61ZXzvZi88bgqYc2pDa4FDIbpkPxSkzA+cgXSGLglFVSSM0Rw+niFcVEeuarv5EdY3JqwCsqp+MUDZBodt9pmRQzvveoEQhgIKGud3yDawfxlMP1J53Qw5VQznWfkvQi9YXBW3zCzFWpCL11xbFFIyMGYDt/DBLRwCaB8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8414.jpnprd01.prod.outlook.com (2603:1096:604:192::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Tue, 8 Aug
 2023 22:58:42 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6652.028; Tue, 8 Aug 2023
 22:58:42 +0000
Message-ID: <87il9p9m5a.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?UTF-8?B?IkFtYWRldXN6IFPDhYJhd2nDhYRza2ki?=
 <amadeuszx.slawinski@linux.intel.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 35/39] ASoC: soc-topology: merge DAI call back functions
 into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Aug 2023 22:58:42 +0000
X-ClientProxiedBy: TYAPR01CA0176.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::20) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8414:EE_
X-MS-Office365-Filtering-Correlation-Id: a4fae57c-b1f9-4f7a-9211-08db98630308
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tZk067J4e7LKxYF45KWHPKL3wA6J4JFm/+yO+8gOvRmJomEF1TpkO8llyhbqpeaRqP5BVaj2KQyIOGI+TROE8MB1ey+9aobcWwM7wm4vQ3IysD05W9RDdPVxxqfA3iRIqqIZhPllnKJCtG5La1g7Edaj+KGMlJ8E1D7BcTD05v+id/1e0Kdp1MAzQl6/Po4avt8dqqbEuasn4TkAnZsnUsY78FRPW/uFPxCg0sj015EX4mD68VndwegMRzywKMVGrhcIj5jtHF6j/DHsI9pBnHHbSfPIswvZPGvw6tgyFQEAjJmcpFy3cGfvjY/zodlPu1Xumsy9h+E7NxVK02zgk/TehDFJZRO+l0q7o1azNUoSOlDmupxQrGjNvkXXTtSn8XSivCQRq9MqKVNnpGuJRYEN6+PZd6+yLdDLQQSEuKg/pMtes9cYuNXm4aLttpULuZQ3SUl7qlRhXZBsFJYW1HyijbmLMQWF2Q+P6rdAmU7r9yjZPL91jD2OasgpclribDcmJDoplpRhtGQv6DvzNvOUyxI+7eJ23AC5trCMGC6Q7G/nIjocbpnPKR8AajaAiKMfqRi3xPetAcuR1hOmBjcUJCmP9sRQCpJTYv2zXt8iOHW7rIko1A5jAdm80O9q
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(346002)(376002)(39860400002)(1800799006)(451199021)(186006)(5660300002)(38350700002)(8676002)(8936002)(38100700002)(4744005)(2906002)(86362001)(52116002)(6512007)(6486002)(2616005)(110136005)(83380400001)(478600001)(66556008)(6506007)(26005)(4326008)(41300700001)(36756003)(316002)(66476007)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9kDyJSu9zlPBc36VoSt5ncNQkmdrMHXaU7EuiKHmuMWqFJtKqwKo3YNcKs7K?=
 =?us-ascii?Q?yg4aPZso6lYyEm7I5Kn4obGQ8gZ0IZiEeQRpzzkv8OxssdWnbGfAQWxWPlFa?=
 =?us-ascii?Q?G6GKBFPkdJ1cnZQXmFhGUZo8NCKihxhuAPC/rbnr/6sSXAcAzqc0T7g3byag?=
 =?us-ascii?Q?Fj2KsVXZ1OIXmfP2COplPPXmNjjR6VgRuHHzBjMs4L3OH1JLpUKMNI4e3acl?=
 =?us-ascii?Q?9nbKZYUn0ueTKukZAuVhhOap+2w2QSnLnJ24aIuL1UBD5sLmsJj7KVuR0xDW?=
 =?us-ascii?Q?KjHAHFQvZXnmLhKKAqrR7LBm8gIlxebZOBTa7teh1uOvbulBoj8nyh6NPCaJ?=
 =?us-ascii?Q?Dc2hh1j/xRIEBotvnUj5ZmBjoW1qcRVxJNgZIIFkQr/i1eRmiw3GrtWus+fr?=
 =?us-ascii?Q?CzYRbwXHOyRnqUnUAnF+YAI1OnYDBQlTCzqygGr2Djj5II1cbZCCPh8HfHnd?=
 =?us-ascii?Q?snNEeF/Jic53/R/o5ZAJgb3cyK3sJHwRMHZcqgX2mnHl9eAIi+LYbgKCezlh?=
 =?us-ascii?Q?Bc/HTR/8RkIqbzf4KqwXzC2hhj6r2dC319Ucfhs8PFC7qVMoQiM40JRrr1gx?=
 =?us-ascii?Q?nNvO0uvZU9hgUAdSBK1z08Tb/qR5fDUz2AJBemmyJT3R89cZpyHXsLQKCy5y?=
 =?us-ascii?Q?a6aCAB48/zbv0bX9qxVXwZ0cDzG23ygOBWL4FiMiHEfuNx61HUKoJZOiOxy3?=
 =?us-ascii?Q?wNTZ6PCPvulHxtfN2p+JOkjI/xoBetgHqhlfNqILHdJnoPQIjtUGN1OygteN?=
 =?us-ascii?Q?tAuK/rBh/4HyPgI0QroZyIHIDmR4EQv3IvRZG5e3grdPCIxSLWgZr2til3bm?=
 =?us-ascii?Q?gyE0N6j3SbUzBGmc4nDhAXdSRZM6dv6Q1+Tf4RC8KdVmXYiVldD1Rvh0SAcz?=
 =?us-ascii?Q?48r9raJaxsqnFEhnq8L1B3qUnTAirDyRuSzVnBP8eANDzBnUCFgluZy2zykg?=
 =?us-ascii?Q?SPdYLyWWQ56xeoo7wiY6AkXx0qmmDBKkuUuWc0hJ1UZTYnAOrwMg4MB/vD51?=
 =?us-ascii?Q?5y1CDC7nZuJETrjrDlQXrC98DGI5Y5Q1iUQ4arSz35wrNT7juvUhl5npImTP?=
 =?us-ascii?Q?H/jDYS+0q/KvQ69DAc8uLVdcI8otj49FSqKSGUj1RIfCCYzLCAyvDgNvk/Qz?=
 =?us-ascii?Q?oXFGOw6iMCj+3vPAkVO5Z9BxYI4kGaQDUrpyd+glXf8yS/l26rfVTvsBzKhV?=
 =?us-ascii?Q?DpNbEzacY/iIluf7UxNAAiQQseK301j0N9rpjvbmZOcms+mauQ3Htyk+Cri3?=
 =?us-ascii?Q?Qzs42s+BsU3UZ/Dw2nYnTH73nd7cC8dNKvbp17XDFDZVudXw34ZurXig2mPk?=
 =?us-ascii?Q?MXAsTcq1haA56SnRYjh2XC3vn6KmT6Cm9qBiMgeCRyibuVTxb5y940HKP3GE?=
 =?us-ascii?Q?wrP9eBdDXkI2K4R+sQQQ3SBjTLbbXgVAGFZ4WgFx9dqyopvLn2nnJKulDnmL?=
 =?us-ascii?Q?dCCQBobue4i/PZDhccZE8rLeOSGkCvH2EWRlRJWnKH9nIrw8O7KVuu7pWo1T?=
 =?us-ascii?Q?r+jvgZzaY7d7v3aRddLRvaf1co8EwWJqCfL35KI5RZTvaO1DV14QBeIqzVyE?=
 =?us-ascii?Q?cV03y12KWH24dpi0PokmEzj2+D4+9DqL0OxYdDoRTSlAl+dwfLRIU+rxi5i1?=
 =?us-ascii?Q?AoLdNb3ohDJi/P4ilmPktwI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a4fae57c-b1f9-4f7a-9211-08db98630308
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 22:58:42.4355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 folcaHK2qxdDY4px8CtQQLDpicbnkC+vfV361n8WH2/lple+Hvq32QAb3TzvyaLMXLKQydqblgW+GI/ybbabnVj2tQf6blS+97avR6Tv6JgfBZYNijbUbyHeZAeU1BG6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8414
Message-ID-Hash: VXOKICZDI3HFNJKZQ4PZBVJM5BDHNMJN
X-Message-ID-Hash: VXOKICZDI3HFNJKZQ4PZBVJM5BDHNMJN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VXOKICZDI3HFNJKZQ4PZBVJM5BDHNMJN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA SoC merges DAI call backs into .ops.
This patch merge these into one.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-topology.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index ad08d4f75a7b..e783055b6c3a 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1560,6 +1560,10 @@ static void set_dai_flags(struct snd_soc_dai_driver *dai_drv,
 			1 : 0;
 }
 
+static const struct snd_soc_dai_ops tplg_dai_ops = {
+	.compress_new	= snd_soc_new_compress,
+};
+
 static int soc_tplg_dai_create(struct soc_tplg *tplg,
 	struct snd_soc_tplg_pcm *pcm)
 {
@@ -1601,7 +1605,7 @@ static int soc_tplg_dai_create(struct soc_tplg *tplg,
 	}
 
 	if (pcm->compress)
-		dai_drv->compress_new = snd_soc_new_compress;
+		dai_drv->ops = &tplg_dai_ops;
 
 	/* pass control to component driver for optional further init */
 	ret = soc_tplg_dai_load(tplg, dai_drv, pcm, NULL);
-- 
2.25.1

