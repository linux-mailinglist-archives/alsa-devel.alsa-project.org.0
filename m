Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D67D714184
	for <lists+alsa-devel@lfdr.de>; Mon, 29 May 2023 03:07:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4139850;
	Mon, 29 May 2023 03:06:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4139850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685322433;
	bh=B3ftONP+YkmSQ3x01Xzt1nD+kxFPj9Y8w2brHu/tG4w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c1pKeQhSo7mSgxLhJpo3fgP0lMzW2GSQBWyDJPyR1YQKoeYlohwAGUkBwVE3CQ18/
	 0zf5WEBLd7VN4KhB6G7h+XQuyYyKiCuC+XgPrnpqCGxzXTrPpTFBwH0xkn1LIFef8a
	 enQeGfjF1+RycdWQnpV1lM/FhwogdDFQ4StjMMmQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C6EDF8055C; Mon, 29 May 2023 03:05:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ECCE5F805B2;
	Mon, 29 May 2023 03:05:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C1AEF805B2; Mon, 29 May 2023 03:05:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2070d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::70d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9DBF0F80557
	for <alsa-devel@alsa-project.org>; Mon, 29 May 2023 03:04:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DBF0F80557
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=jPTy+KnH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TXWNkECTIV5Bwwdco1Z5tO7nUGQwUc+R4FySMvAJpQMlOHHQZMPq6lq7HhaVhvF0w9rVWgLbVJcekTnZEYb5yIryxMNj2ypOn7glklI4kSzmnOC4bmU9sKFa4WX2UnNU8R36mxP/a3GKDlJIydJBZcBSeUxRRIyPhWthk/sKHdMeok4JtEzrcdZKwgoMEtAavW2ZNchRYy+29BhvZPpU0eoDIIc2COeCCwElCIz8R+3hIJU7EuUs+IGr7evfWWQhfqedfrQNZMobQ9HC5XcxuEfEC7plpEo4H17l1tkz5XFmkCz+obS9Uq5CyTsA3UTbbTV3bDm5g3MW9Fi5o/olew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9H9iKZmrQL9EcgiIFBJwF3X4RSUHdBusJ2Ue1tVZU4=;
 b=Uz5eonhkc1MvTCnijJa+bk4VLJw9sLgE7dlaFE4gz/1/OEBNAuZMu/bsJ3CUny3eaPdNsrYEnP3lB02vvKGuUQOuP5g/BCGZG528WWic3edLvc9R1V2V3xf46sYJcYqooil6ABIVE8pO0JwzN9MH0hwDjSYgJ+zRlaBZnqecKYF0DFzRLOAI6fshYiDf5Dmtvf2eixa9astInpKZ4xKBCdKn07tLoWgKDVjTPU7DOfM55eqgaGtfYVQKs3yDa+0jfDOcnyPkaEXhONRupPD1VhcCs7IgGK9bbKN5G7AuAF93iqE2bahWcMyw9lCQbuhRur5d3kFn6u0lBVG6985RlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9H9iKZmrQL9EcgiIFBJwF3X4RSUHdBusJ2Ue1tVZU4=;
 b=jPTy+KnHnSAob1n7kBM674S8D4EX1Vfit7Xd/Yk42grEuvpQeWQD3Lr3xahdL5XILdeYyyWZh54EnkD/QUOFLpC9QUpjmALpTsXT2D75gsRW8vNf72p1jCVontpZ7EypvCLeA2tRS5wFll+ja6z5zFkM0ir0dJaOgy1LRWxCSRk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYYPR01MB7952.jpnprd01.prod.outlook.com (2603:1096:400:fe::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 29 May
 2023 01:04:50 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%7]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 01:04:50 +0000
Message-ID: <877csslzgt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Takashi Iwai <tiwai@suse.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 12/21] ASoC: meson: replace dpcm_playback/capture to
 playback/capture_only
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 29 May 2023 01:04:50 +0000
X-ClientProxiedBy: TYAPR01CA0007.jpnprd01.prod.outlook.com (2603:1096:404::19)
 To OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYYPR01MB7952:EE_
X-MS-Office365-Filtering-Correlation-Id: afaaafb7-de89-48c4-4b99-08db5fe0b45c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZWdKJ8wZoQuvWjGkTclG4pixtV9+OJGK5s2Iu0p8zgHUh/YYmTBBmSzwlV0ofv3u5NbTP6RbaB1ptFjOlV7Q+to4677JKZek/ExHId4AsH4Sl5JUCLvxb83jq3rgF5pCYEpIHF9D6+buPXGJmNoOCvxdTE0tdh/xmRD98KOQsC5uo70UzM6X2qUnRJZ9lCFTruwrXDiccogH6zZXWUDKxA7vgZunOmOP9nQqOEarL2ColnmFB/VNKXL6/fihHOidCbfsYI1vzr5JBsumr5Ztusw/rIEKaESzvV90SvFELeTS2GbwAfQlSiGKvQrjT4SQaX3S4KjTxvFaR4bczGHwCSTmxkQG8qoNxFaXTXEz/zZglouxWptEGORQ71vKOR7HxVK3SypNy/cI9bAGEb1CKh7GgrtI5aI1u25U3Bmhry2iyOVG7Zqg2qyvCONMZ71GDi7yL4ATjbWLDLhsNnnMWFUehHosUKvLlTByoy2/lfH/tXZZC825guY/X4ktXooyq8dcwt/CyUJTiwcU2++QwI0NSp+Tg9EWuTJJI6kGVxCtUVLPKnlKMmtJqxXbPgVzeZm4oQus+lJfciYYTolP7wAwpOl7I+MPe/iMdDl2MhWIez3I2ZP9+2d0kPsOBG4a
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(136003)(376002)(39860400002)(396003)(451199021)(2906002)(186003)(6506007)(6512007)(26005)(5660300002)(478600001)(8936002)(110136005)(8676002)(38350700002)(83380400001)(2616005)(38100700002)(52116002)(6486002)(41300700001)(86362001)(316002)(66946007)(36756003)(66476007)(66556008)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RN6ybt2KvtdCUM+uOkaKQzQZ4HVPLsnoJDWNqfZz+A7ud8luARpm4IT1Tesh?=
 =?us-ascii?Q?65q+qto2yzv4iUDeRRjBhfpgF7+c0qyI6smRCjuPANTxe5tF99ecLo9P/08Y?=
 =?us-ascii?Q?3BObz0y3NHwGARTJOzUoMYXkAJ0qiZV79iDShhuAzX0Q0452cg+gR2VLS2GD?=
 =?us-ascii?Q?aLbfKBURFWA7cBqNIsquSj7y8nZwE7TUSjrzHtQhf8Lr7IrqyD8SWNQsPyVp?=
 =?us-ascii?Q?sUI2udRw4m4V99XraY6+DkF8yP3ihklGun+T4A18ChZJkv5DuBUNYNaEFGU0?=
 =?us-ascii?Q?RTF8OWBhOyuDfx7b7GlwbbqQnK6oQgh/vc8nS7Ris2vkuYVzFPUzOE42rnbZ?=
 =?us-ascii?Q?WpO7JCng0fzgls6ArhkfXt9/VaN8+iXMrfcG4GqDpzJHulhWu/MEfYyNAuON?=
 =?us-ascii?Q?KQLnYPTq+FYY0WoiQD1LtQLMv6DE//Iv+fMGO9PhZvuR7/JDbFmfEm9QAhJ4?=
 =?us-ascii?Q?GOPxfN9wO8nBzytvF4SOnzUW86rozb5V/PCv0llSWm6gZ+P8ZYODm//rwC4S?=
 =?us-ascii?Q?32NcsppjV7+z65GG1KAz4ZG5LsbKvUFPG6Y4uYpzDm5gXlKBkfA2tLNokidA?=
 =?us-ascii?Q?s4OdDxvbdXJhcmIBpyJ1O0MhaYI7baY8/It7VgZ3WwYwtwLx04sQVTSA0zh/?=
 =?us-ascii?Q?TE/8ybaqAmFt23cAFRMf+T4MEA6YFtIcbDWqpeS/hQHCFXBr0wkyXxPWCCie?=
 =?us-ascii?Q?ND6suAUAOobn2FHzUcJB8QjkuLmVtWveXJ3MTXaDr/d11gzDwVKEykQ/yQeB?=
 =?us-ascii?Q?itXvX4n0Nzu7Sjrq9antQrsRiLBO5zcCQyZs/DptutkNahfwvA7w1E5a4xfB?=
 =?us-ascii?Q?GeplNaxhCwa0H2vqjYzkgtXL0vP+SuVoKLOHxhsZfk5r52xX6vyzjBvrIHfB?=
 =?us-ascii?Q?9VomCXxx9SyBV5vlScpZSL2/558EBgdqiK2yPmnH3ATpZAtX1gIoR4KMNBXE?=
 =?us-ascii?Q?Lm5+qRlfV3ngqHX7Z5uXTv9/+RPABGzrdHGQuZXAA3jpMUUaq0QmAJaM0ZdO?=
 =?us-ascii?Q?xR9HCiEh/GjKC8wUFzjkIZfRVVPqlujiZ4wsyme4+Gc0yIskGC858BqMbTi4?=
 =?us-ascii?Q?kcwfcB9PfgVzO/mQ9DXxMfdzMGFxPrU08LqOfvDA2VKyMnNV0aj3ODT4xHg9?=
 =?us-ascii?Q?9XvR2Zqwzdea4JU6kvSS2TOA5deqXIY3h7P8MHuEomtaR4bplaPtXBVxhdna?=
 =?us-ascii?Q?7TcGxwIYZPVcIYMawZ4l+BmijpATf98gz2iAB/EiMgrwWH3QZ2dyE3zYbmUx?=
 =?us-ascii?Q?pDtyuizOKVdSWg+PKVI7/wJxAqH602UNE8k31wkVj+DNYmLyqOEC07amPnu4?=
 =?us-ascii?Q?1c/jm2fqrXnQN1RQdiVTHkHYhReNMyCaH9691UUegPjxKxWXtDvTnArTvZTw?=
 =?us-ascii?Q?X2lNdhv3GBLtjY26uS3TLjBPL5tsvPFoBM/ySMGfUJ4KS8hOf6JpiQIi2REf?=
 =?us-ascii?Q?Ul+S7fOuYd4CPO3TcaqKmfO6rKLdXUSZm0QolWcaDPAsMxI1xnzEhqjmgg5S?=
 =?us-ascii?Q?FkTJSh/+ABH0IVkQ0EsFbbQS9tbBF4mDkP9hDmtIYftGmcDPIlTEnQPDYvAN?=
 =?us-ascii?Q?anW9eTGI+vZY0CV49GtCRyIGIwyG8Sq8HINwd0EleVBGTNlBtu1f7VqIMonM?=
 =?us-ascii?Q?rw8m+3VoFPH2EHBV/XrFLnk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 afaaafb7-de89-48c4-4b99-08db5fe0b45c
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 01:04:50.7143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 JX9ZW7ycvfN1YIqvZ/G+rFcWdhqhcZFmbyCBwpU06Z7/LLHjmCs9a2Bw2eRaLaxty9VgLPvp4pU7sjEEv/EGCVfoPxiPHNYO0hIT76pJOOI+KewJkHKqnyi6QmiJUf4u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7952
Message-ID-Hash: 4HO5ZUW4FQ7SFCKCJXPCH3AF6K3M4QXX
X-Message-ID-Hash: 4HO5ZUW4FQ7SFCKCJXPCH3AF6K3M4QXX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4HO5ZUW4FQ7SFCKCJXPCH3AF6K3M4QXX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_get_playback_capture() is now handling DPCM and normal comprehensively
for playback/capture stream. We can use playback/capture_only flag
instead of using dpcm_playback/capture. This patch replace these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/meson/axg-card.c         | 8 ++++----
 sound/soc/meson/meson-card-utils.c | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 74e7cf0ef8d5..2d62e1ae7425 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -132,7 +132,7 @@ static int axg_card_add_tdm_loopback(struct snd_soc_card *card,
 	lb->stream_name = lb->name;
 	lb->cpus->of_node = pad->cpus->of_node;
 	lb->cpus->dai_name = "TDM Loopback";
-	lb->dpcm_capture = 1;
+	lb->capture_only = 1;
 	lb->no_pcm = 1;
 	lb->ops = &axg_card_tdm_be_ops;
 	lb->init = axg_card_tdm_dai_lb_init;
@@ -176,7 +176,7 @@ static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
 
 	/* Disable playback is the interface has no tx slots */
 	if (!tx)
-		link->dpcm_playback = 0;
+		link->capture_only = 1;
 
 	for (i = 0, rx = 0; i < AXG_TDM_NUM_LANES; i++) {
 		snprintf(propname, 32, "dai-tdm-slot-rx-mask-%d", i);
@@ -186,7 +186,7 @@ static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
 
 	/* Disable capture is the interface has no rx slots */
 	if (!rx)
-		link->dpcm_capture = 0;
+		link->playback_only = 1;
 
 	/* ... but the interface should at least have one of them */
 	if (!tx && !rx) {
@@ -275,7 +275,7 @@ static int axg_card_parse_tdm(struct snd_soc_card *card,
 		return ret;
 
 	/* Add loopback if the pad dai has playback */
-	if (link->dpcm_playback) {
+	if (!link->capture_only) {
 		ret = axg_card_add_tdm_loopback(card, index);
 		if (ret)
 			return ret;
diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index ffc5111f9e3c..8a531ec8fad4 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -192,9 +192,9 @@ int meson_card_set_fe_link(struct snd_soc_card *card,
 	link->dpcm_merged_rate = 1;
 
 	if (is_playback)
-		link->dpcm_playback = 1;
+		link->playback_only = 1;
 	else
-		link->dpcm_capture = 1;
+		link->capture_only = 1;
 
 	return meson_card_set_link_name(card, link, node, "fe");
 }
-- 
2.25.1

