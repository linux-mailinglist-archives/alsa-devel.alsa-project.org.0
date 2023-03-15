Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC136BA855
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 07:46:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7681B132E;
	Wed, 15 Mar 2023 07:45:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7681B132E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678862765;
	bh=xe+X2LMtrwLbGpMmtrdTlNcOCgCchCyvV1NnjrOBzag=;
	h=From:Subject:To:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vrhBpDd6+25MvJWIkDp+RIbroTp0UuJruD1aNis9gLbLN+HvbfDBA/RFWdyIox5N8
	 /BkDl5dXYTaEJCrcZ0vakkr7FdaZyLW37lW04letiI8cM3IgCcOSukgU2PoSfUwo+G
	 /4+MRJOZdqBts+LRIIGweGLXvsOTkbS1ib3dzAO4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A3F0F80527;
	Wed, 15 Mar 2023 07:44:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03E3AF80551; Wed, 15 Mar 2023 07:44:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2071c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::71c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3CE32F8032D
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 07:42:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CE32F8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=P0eIuC4q
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C3nmUKE3ihANye4LLQaHCbMc6j7FBMKejteiylwxfvmdyHbCsV09sZQanlubUr3d7KLvmd1XhAqXUKS0ewwvsRol+9sZ5nqmxbo7yNw4UiPG6tFg4mrYbhwMC96KIgkDXVsXy8MP7BhWZM3ZkflNey/12t25MY3lnzezfZkzomiYeK0uCMMfpjct2bqJ5DktSeaM80B1xCM2DlAdORcUzcTZaZKfF+2iKKBuefjFoB7gHlzJHMdHSylq9F2bC+IQC+FD9sIHqZ9JXeTmyF6uEhZCQdT/0CWIEytXEfNv9uA/EaQpnDsTCdUognuU39apQluQVX6tppKnZx7XtOYQzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GQDjZn3qlyP7uBu+p8TDw047RGPe9qfQBNW6Hb8yQHA=;
 b=M6fVEIQ6N0cRKfUFg5XVFhihTVDEyl9quCPmeuKNqCZpEQgClOietW9aq1nlNw1N1r9dqF2pGGQYZeq6UWGtMkGxGxigfM4nYGZDVYb7RJuhW85Ty09bJR0iCc/zL2xdb3ZQPrI9urYLR+wPpdSSK+3HVsoT4qJ4v4qypUIQU+w8qyo7HKpx1eJrF4KvjsUj4seA0Whw/LqAumBePlfpj1sNPrDpezPoLE7ZO05gQs14lIbwIqPoqeW/seRDXqTCc3LaB4vaHlEBdGlQYLmSYMTfY0mpWqQiFQ1f8LsWCdBJIt/qdYu90SuBkhylLQ4dKVDZRbA6F+zAzbW5qaNEcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GQDjZn3qlyP7uBu+p8TDw047RGPe9qfQBNW6Hb8yQHA=;
 b=P0eIuC4qXupKwsjDnX8HAWfRgjx75MNZnctm/JhLEwxAW+/V8P8Dks0omY3xdVAV3DCiiBV++snC5nmrOifdsNyN8kMhct8tz/6u5KsQDvDGIeOeDYJJJypuh6EhkSBgSom/2Symy6xn/7QiPI0wpMDQyBrex+123gOG/6NibDo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYAPR01MB5755.jpnprd01.prod.outlook.com (2603:1096:404:8054::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 06:41:58 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472%7]) with mapi id 15.20.6178.027; Wed, 15 Mar 2023
 06:41:58 +0000
Message-ID: <875yb2jz2p.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/6] ASoC: atmel: remove unnecessary dai_link->platform
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <878rfyjz4p.wl-kuninori.morimoto.gx@renesas.com>
References: <878rfyjz4p.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 15 Mar 2023 06:41:56 +0000
X-ClientProxiedBy: SYBPR01CA0003.ausprd01.prod.outlook.com (2603:10c6:10::15)
 To OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYAPR01MB5755:EE_
X-MS-Office365-Filtering-Correlation-Id: 96beaf54-fc48-4ca6-3455-08db25206029
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+JK4RPZ9SyjnRrEp1gSCFJ1XxMR9Jj0VGjiYmmibVXCGJl2q7hi4/gdmsx5svIiRKE8jCcE6JY96msOYHOVq9i0hAGwFZVZJhFJYYJRqvDGvWZhWSNZ/5ZIGLgXf4DMPCPNSlHqKITA+FOu0mCE4if2UJuTQA6Nd0ndA9DKkGfFOZw6VjyA31xyj/zNLqnmKnuIUQWmlXjgHjO0R5ep6GklQtNxuM8ETu66q6x4TCmLq6tDBIxLpAuihDF5Vy5GyZmqe5BR2t49aZvCXLeKt8y383CxR7k/awzhGBgwXK/t+VOBOZsQQl+CaYsI5UDpilAHn7APx/YOW6+CjMDBo0cqT+gdimk1RcodMoHS1z2tU7l8hfSmVo53YN/euLLW2bonxDh7OUhuS/TQUNB2Mm6DLKd7QJ8veCR9NFzM30/B4iZCRApBurU+ikgm01VsohiLaV34YPN9s0Cipg/0vL1bXdXp5NW24Tygiue1r5A78qnICkpzVN0f3ze//OjW5rVlQ9/yAlYhc+1icr/3Fj30gaQbrZzLPasgB3MIKQRJUBRa9V/ZUemi5irFfsTBII6kR14+J/ZkilOwIfW5cDXBCwk6MtO23yYjRetkF+MF+pK4rIoPZV4PbDfb2KBSbGVdwrjUBz0CYEIM7CPhPQWnftUk/CF0lk3B11N4Vs73b646K6pCSZwegiKuBhQvPxjWiuDPUHd65DwdVBreuHg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(366004)(396003)(136003)(346002)(451199018)(36756003)(5660300002)(83380400001)(66946007)(478600001)(52116002)(66556008)(6512007)(6506007)(6486002)(2616005)(186003)(26005)(8676002)(316002)(4326008)(6916009)(8936002)(66476007)(41300700001)(54906003)(86362001)(38350700002)(38100700002)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oAB7XPL7pdFXKB4aE/zkmD0QWr0akhMbn7irvPt5iPsjHf6gI/qTHjFxV0UV?=
 =?us-ascii?Q?YECnY7QIaQpfEgQXQhPJm3RqC8bwqAO3nuzQqNDr1lXuTcdyEIDK3RxV3iAl?=
 =?us-ascii?Q?BA6UcurWiiYjnb1WTkLYE2JG2moM/aGP+JpC6vJQUK2r/FFlAEgGevLTFaGQ?=
 =?us-ascii?Q?2yC6hV89wh1jU+ytKQgwvHgO/UIqNYlCmKVjlyw5MjLwcXpQyeHqzPYpuspR?=
 =?us-ascii?Q?qf4FNL8JrrOhD8Olu8dLltvdVp/jC6NHjy60J5ypEgoV9njliteMRnzx6Z1Y?=
 =?us-ascii?Q?t9GIq6dumQ3Lw+3HpLiWg/kaRlulR4X23VeaxdvOu+mEMijwBuVSutHAh+H0?=
 =?us-ascii?Q?vJfHnVmPWkCdIYtXu59RLzoM92em5eMWndsZf3X3B63LtGK98QMMi08KeXTe?=
 =?us-ascii?Q?etNYD2FbHIBfJcJE5c4sGS8NsXsqux9fdxKateTxrBzFeKb+19nl3nq/A9V3?=
 =?us-ascii?Q?6g6quals9oae9CUzpkfOVI8swPlXwOjlm9At8Ac2KXjOHtqPbnOZF4wycc48?=
 =?us-ascii?Q?NBPF+Lj/7Yg0WD+mI/iULgqcL6o7Wnxw5BLYODuyDizhCgZSwvGRaQ/Vp4y1?=
 =?us-ascii?Q?dkNqYeLELme7MJkvwp6GKiUvgQ34Bip0NgxTwHlwJuOi3rQnRPqBx4Hs12qL?=
 =?us-ascii?Q?YPbz89Gqt7sJckAIl9htjefgJKeB+hnvncphrGFiy1jeXfmhni8umk9B0oIx?=
 =?us-ascii?Q?Saeqjl9DSgfDKojvavpECfCo3kFFoTYbRaD48G9GXis4oGiSnINwc6JxoExo?=
 =?us-ascii?Q?ENlue0HUZ5N6QbCUBMfF2dy8CJAhFWpgFu7NVcpuFf+PCH3EICeKI5uxE+Hn?=
 =?us-ascii?Q?DzJO8V5Pa21shS2fGjp5YJ+ZehpR413u6+rqpxZ3SN/f+lM22X2QfzbfHTc4?=
 =?us-ascii?Q?B2BlcQwY9aNOmxEXxKcaffdIlM/uX36Hq/1xYDqK99bdNobDN8bhHjMa2fMM?=
 =?us-ascii?Q?xdPiSjLA6lVpXLuSpQ+EmHFaTOVUxmpyxoOXGaiwjesBhbljt6agzZUBB7F3?=
 =?us-ascii?Q?zAkgbLhIBwB4ndMRd5op7VkXBoYXzEvfZgDwarD1ESmBR85LrO8VDSDLtnVi?=
 =?us-ascii?Q?Nl1h5bpZBMGOa9cN4voVRDbdBdAyaS94CGl+46/qqoO7PPnv7uWco0qOx6OO?=
 =?us-ascii?Q?09qT3qxzvaJQ7fnejNmefJcRHlOMngL5uv9dAI0lfvTNK5XfX51Ai5HSHYqd?=
 =?us-ascii?Q?qyg5FJqX++n81aF6J4szIN6ZXm7/4hnQtt+DW3cLqrIJGNjbmogWnBnZI8Od?=
 =?us-ascii?Q?RIaU3NrvK0WBLptSMzMNebbUt44CWA5UZLR35I8TxpFs1CNkhb0FFtRa9RtW?=
 =?us-ascii?Q?NzTI/4zDq6tNHvNVfRNHaBnCtstQW79eN+3caP/aSp47twhsUj2kV1homP57?=
 =?us-ascii?Q?5exmTj2CzY+bKcm7/dQCCgdSPTo+zbGqEDz20y3tjUkxEl+PjCMCpo/ere97?=
 =?us-ascii?Q?v+l7C0hLgmOcUR7rW0EsGILSpVZtgYNoKFMx1OMRlKVDvwxjIUP1DPHLVfvJ?=
 =?us-ascii?Q?ubNtMjED+mDN0NitCVlbxlj8rz5dp4e/4EojsXScNLDSTp9EgYYt1HLynTKD?=
 =?us-ascii?Q?4ZpuJNPtFAMYp4IQuwKpGIzoIrwNsRVuMtM9XnXTEfbjK3tfHoECVXm77rpl?=
 =?us-ascii?Q?ufcMINUNGelKi3jFWa+yiyc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 96beaf54-fc48-4ca6-3455-08db25206029
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 06:41:58.6801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ecrRLXIgPpLlN3Pw9DcJrwn69vg+WOGF2hnZCoPojwyUx0LAdxUTEPHeAvrb6bH7UoHTReIBzSio/3ZPdXoDCxY+wHxm0TxOUTYs4vYDQeny8aD5cwlpXH6nJ6Vjbatz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5755
Message-ID-Hash: BZPENO3BWLIJR5IMOPZ3UBWQN3H4BBOQ
X-Message-ID-Hash: BZPENO3BWLIJR5IMOPZ3UBWQN3H4BBOQ
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BZPENO3BWLIJR5IMOPZ3UBWQN3H4BBOQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dai_link->platform is no longer needed if CPU and Platform are
same Component. This patch removes unnecessary dai_link->platform.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/atmel/atmel-classd.c | 5 +----
 sound/soc/atmel/atmel-pdmic.c  | 5 +----
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/sound/soc/atmel/atmel-classd.c b/sound/soc/atmel/atmel-classd.c
index 9883e6867fd1..007ab746973d 100644
--- a/sound/soc/atmel/atmel-classd.c
+++ b/sound/soc/atmel/atmel-classd.c
@@ -473,24 +473,21 @@ static int atmel_classd_asoc_card_init(struct device *dev,
 	if (!dai_link)
 		return -ENOMEM;
 
-	comp = devm_kzalloc(dev, 3 * sizeof(*comp), GFP_KERNEL);
+	comp = devm_kzalloc(dev, 2 * sizeof(*comp), GFP_KERNEL);
 	if (!comp)
 		return -ENOMEM;
 
 	dai_link->cpus		= &comp[0];
 	dai_link->codecs	= &comp[1];
-	dai_link->platforms	= &comp[2];
 
 	dai_link->num_cpus	= 1;
 	dai_link->num_codecs	= 1;
-	dai_link->num_platforms	= 1;
 
 	dai_link->name			= "CLASSD";
 	dai_link->stream_name		= "CLASSD PCM";
 	dai_link->codecs->dai_name	= "snd-soc-dummy-dai";
 	dai_link->cpus->dai_name	= dev_name(dev);
 	dai_link->codecs->name		= "snd-soc-dummy";
-	dai_link->platforms->name	= dev_name(dev);
 
 	card->dai_link	= dai_link;
 	card->num_links	= 1;
diff --git a/sound/soc/atmel/atmel-pdmic.c b/sound/soc/atmel/atmel-pdmic.c
index 12cd40b15644..00c7b3a34ef5 100644
--- a/sound/soc/atmel/atmel-pdmic.c
+++ b/sound/soc/atmel/atmel-pdmic.c
@@ -496,24 +496,21 @@ static int atmel_pdmic_asoc_card_init(struct device *dev,
 	if (!dai_link)
 		return -ENOMEM;
 
-	comp = devm_kzalloc(dev, 3 * sizeof(*comp), GFP_KERNEL);
+	comp = devm_kzalloc(dev, 2 * sizeof(*comp), GFP_KERNEL);
 	if (!comp)
 		return -ENOMEM;
 
 	dai_link->cpus		= &comp[0];
 	dai_link->codecs	= &comp[1];
-	dai_link->platforms	= &comp[2];
 
 	dai_link->num_cpus	= 1;
 	dai_link->num_codecs	= 1;
-	dai_link->num_platforms	= 1;
 
 	dai_link->name			= "PDMIC";
 	dai_link->stream_name		= "PDMIC PCM";
 	dai_link->codecs->dai_name	= "snd-soc-dummy-dai";
 	dai_link->cpus->dai_name	= dev_name(dev);
 	dai_link->codecs->name		= "snd-soc-dummy";
-	dai_link->platforms->name	= dev_name(dev);
 
 	card->dai_link	= dai_link;
 	card->num_links	= 1;
-- 
2.25.1

