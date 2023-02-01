Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCF9685D08
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 03:05:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CC6E1EE;
	Wed,  1 Feb 2023 03:04:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CC6E1EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675217101;
	bh=3SBifjegUCWRbwD+lx513gyGziXmluQoF+74CB2kX0o=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=LSeF3P8+k730AUGNtKBdZzFFhdmIv9/A2+njipaTjmBNaIz0JZFg5lMKOA9hS5290
	 tVnHpAj3R0QkynqrKaG3EqdioC+lzB3M+ebGtR8E+2X2A4nHwNMXIipwRavPo8m39J
	 eVadZETWHxRZPMWYhJABPBRN0orAELD6TUUCmSYM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E96CF80544;
	Wed,  1 Feb 2023 03:02:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7785F8053D; Wed,  1 Feb 2023 03:02:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20706.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::706])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D1C3F80245
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 03:02:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D1C3F80245
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=P2EuVQol
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VIsUl2nV/I3phZ7dFqzaiMIzMCx3PuYzNaK3FaiN+tNchY6E6/Ws8hD9oSFPT2w4HCzgKIJLNMoSkghkXR91bh8TMUVMl5WN6bJkBAOmp7bx2jMEIm8y7hbRi7UDKj/LX3B9NZvBv2A+6J/qeUXHpG+qRbaq6laoZ0CKpqXNAfadEtP5js4zI9zpWQeoj/NYTNn4Q3tHJUcr/bA59t17NoxjMQKGaQO9XZCWley4c7YTjnHaEMAe0tgTqCx2iJGmkbBFSaaNPMSZQcH2yMhtd2UnBkK4NrZJ77nscErsKsgiMeTsrJKbKiKdfKb6U+IRa06cYmf6jdwYre1/szyCSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zH9EK0hDHG0pSEmu5cYql1dWDArF6I43CH5X3apI800=;
 b=JA+4JZaT7Dzy8kQXbaKGqDM6wR7cumxWB9fSuiiPX2j1OvSmi4pzOp9h0Lwea28RPghbxA4lZvW2KJA8pygNvtFBVAdmi5vnY1D5/4rN9Ciw+y+WISbCFLK5nX7MGUdN5Adj1PWHV5U7mVhBlzXJxymw8LvKjjO/9W3/neQWs8WRIgToiKPPwN5vwHjDxPU8vN6wcQ+08xo/PvattMFEXpjvqqxHF0iFVVdyYwLrV83f83yBmzB17NP0KDTC40jgGpv1V1D3v/2TeLXSU1AKAspTCwRx8I0kYufTX8AQgJ8qbqasu2+nKhJsRpO9rPAm9NHxmY8HuN6Xm94kSMyxzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zH9EK0hDHG0pSEmu5cYql1dWDArF6I43CH5X3apI800=;
 b=P2EuVQolU3kn9KRKw31RD981HHhi3lQJEeIVzj+5x0wU1AnoAQVtjTfInT3faK6aqiU3L2sO6llydWqM2q2LnTXxW3sn8fvsO4KkkGQpI/cMq2dKr7lDDFCIb6AzOKEnsOsJ6mkoTON1iGSmYY3zh3YId3Sz5BzeCL9KP7iu2WQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8772.jpnprd01.prod.outlook.com (2603:1096:400:18a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Wed, 1 Feb
 2023 02:02:22 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Wed, 1 Feb 2023
 02:02:22 +0000
Message-ID: <87o7qe5ej5.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 15/15] ASoC: rsnd: add R-Car Gen4 Sound support
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87a61y6t8e.wl-kuninori.morimoto.gx@renesas.com>
References: <87a61y6t8e.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 1 Feb 2023 02:02:22 +0000
X-ClientProxiedBy: TY2PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:404:56::32) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB8772:EE_
X-MS-Office365-Filtering-Correlation-Id: 89364abf-0e1f-4667-fc66-08db03f85b74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qi2oLkid8kkkLuqHwpzUnXxAaRlRNOUs7uib9KyuYNgCmUTJyiI2AreRgzrzkhCh3cVhljxtZxDF9EpYcBUBlwGl78KcJEyVBxByJt4249aGwk0WhSbxdMRtaxoYL6VjrJqbaWE/GVsgPFFe9fW156VP65/0vU+MOxvAEmbiBIGGjxh7Ne8sqjxVa/nTYS83gTTQlKZMABgjoQuIfeeheIeWC5P02yPjo+YgKm2GkLDr+aafJjK9B10OvcGRIXt28edeng18IokjvQ6PZhxseiXgwDmN8hgcVfw3ZSjHA4pq33yL9n198zgIJfxXlJ8P7zf8+w5P2AAuSZ7ldfSgRtUeCvrfI1g42KScn7KfpxBNi6Ih0cJC6REkEw4oDy3W9GhGtXYbSVljJNBndzSApIexynko/ZpNagJP0lhZGCI8IzlwhaeDis6yXP6FoPbEx2fncBmdDP+kXU0BF8bREbQ4ZyApviyF9xygydGeDIeurbiKuukVlUs2TWjF1PmlTBLwqLmwr9Ej8qHTWM2CZYF7CBbpkBKTrkSsXUJxkbNXTtyCvS0PGh/p/AzaM+VHxU+PsjZlkXcHzTYXkaQwUh51hnJObKn7zfx8JMELOyPsbQ+m/7JuSnqZgSrZvBInwVZS82U+ud/Nb/OTc4f6Io+Dv7HbZWoknjPNWD7UG+yYD+oB8R4fuUNx7cTphED0lrqVVo8VqWvEX5HTjR0IsA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(39860400002)(366004)(396003)(346002)(136003)(451199018)(86362001)(36756003)(38350700002)(38100700002)(83380400001)(6506007)(6512007)(186003)(26005)(2616005)(2906002)(316002)(66476007)(52116002)(8676002)(6486002)(478600001)(66556008)(6916009)(30864003)(66946007)(4326008)(5660300002)(41300700001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aWNdk4qcKUMXttB0YQ5erHoqW5GXq6JmRd/YfA1U8VO68sfxxktK5FjhM1Ps?=
 =?us-ascii?Q?Rp+LgCccLygLfxArsc7UEl5mhq+lSgKT3IgGUM2la7n7l6Vfe0TxSBtE8RLA?=
 =?us-ascii?Q?P5SQivsxaCdD8m8V9j4091NIoYO4JD0PxsAwbS4dZEymY7dc9LffEyVpDVeg?=
 =?us-ascii?Q?5Iegj6UbLfZHGiyjWPwS4a+YbPJ8q6R3NRkqMGaCdnVSObb52S2Hond5VOAo?=
 =?us-ascii?Q?5ig1HwzF5bOL/Q+tPU0NfyUYBNbfR0pM3+TOHaEJBS5cmIw5P8CESK8bIYCr?=
 =?us-ascii?Q?21emOzhD21QInjJCcGN4gYeWWRsQVJB8ykjHi+osTkOjWj7EUSTZvJOHHhZk?=
 =?us-ascii?Q?IBBehRq+7SnxeBLtuh5otGmSqP0e8iTgXFKuoOkceSepPbt1snZXn74zEUgt?=
 =?us-ascii?Q?NGmdchJUWGZQEADDhU3jG/cNqEmZSooukPordHujyBaf+wcBQZ6cWS1BN7vt?=
 =?us-ascii?Q?LyMkFzeVCHgCtyNuX0wO/f+boC8tLkl/UoyjFBfiJleEw1B6gSxAKNI54xML?=
 =?us-ascii?Q?Guvy4D3WXUQprbKtOMQgOXyxcVTPHGqzxY3+BlWYybI+6xf7pQgQ6W4Ryn8w?=
 =?us-ascii?Q?XszQECsf+aUvonfvVHzZAZTD9JgT6VzlS6Ql2YIxlBJPJKFBmQ8BvWuDSJSw?=
 =?us-ascii?Q?t3d4EDtLSUKQI9bDy6I7xRKDYafMJhFgLtwaXgZVvdXxzAg01XNn7tg7C8CV?=
 =?us-ascii?Q?VGKRnbIU55qBaxmkBhoevnLoIViHaQoRD3CaTPuetxi0h8dBSpCExKKEzSDa?=
 =?us-ascii?Q?VM7Aqa4SXkj8+eUhRdGag0zD6R2L0vlSJHe8SrE84F/6Ki6AMjk92RZQ997Q?=
 =?us-ascii?Q?1VJDjZI6dOPa6guARTLhaL9kliZ4iEQSBpd8EsxNQxMVvVe5XyGRqubETqBD?=
 =?us-ascii?Q?Hs1pf0UEaTezqK1z2UQFs9vyXerrKf0GP9+fAxQgskJdh7H68D6GL203TNb8?=
 =?us-ascii?Q?52vaeZrqpox7V4JDYIjvXNGJEVlPbT+WHLxXLi/TDPspjQnZmPbcvSJLzrlQ?=
 =?us-ascii?Q?xiyXnDAlWpS7zsgwUrxuAGDWa1EtfkTAcmcJ6DwsokiDprFwWt80HOAEumoH?=
 =?us-ascii?Q?oNNtPGl42dRvNrhXcb1GWJOt9v8qKqMDjLd9uMs3EVP7AWdEK4n8QDWixbu1?=
 =?us-ascii?Q?2uPVa/4Bfs5fhNsglFriG5g+C8Xm83Fz4qv1OZORcWAycsUCgAogBmvgJczU?=
 =?us-ascii?Q?kh2gfnbRVt9a1TB20BmGRaV/a8Y7qwj8F9XCx/fwYgO0x+BfDNmjAdT1MbQ0?=
 =?us-ascii?Q?Rti6mKBaBgdFFWjJo9yJZHYpRuADORPfEQp5kYUvWYN3lszqaHC7nn1k4lvr?=
 =?us-ascii?Q?NpaNTqSLeoOtwB4uzvg4PRDXvrpmMaBVhwPOU8WHOZNZgKZ6Jkw6nUJ7snLr?=
 =?us-ascii?Q?aobZMbSEMOCz0li2m5W+P6wbb00zsieHNGXGMFDnpttEYgSMPsqcb0+bCIPi?=
 =?us-ascii?Q?PUdF+6DomRg0OwCGCIy3Bk8qWjLAqKLhZQjN8Bih58cWEFm6w0Glo2VM3tPX?=
 =?us-ascii?Q?tj3P0fPpF9ZFdH9r40DtwMqlH5cpi353GS55+grkoJXSZ1WwA9tc9mHfo8mJ?=
 =?us-ascii?Q?sGej65qIPdPXb8GuxBJMrXDCUYHSH61nGmr9SBPmvf5Zqcu7VTQ/bOSHXBLy?=
 =?us-ascii?Q?OxhnVwF+FLR3b2fENDAVK/k=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89364abf-0e1f-4667-fc66-08db03f85b74
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 02:02:22.5785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qA7H/ONCKAmkKZBKw4pX97vz+eDYOLVNR05K1YqCKSAtm5u2X2z/3a4+hYsY347ORlrqIFGcDLOHsfCQysjGYvy8Q8AV/P9ndD4UbmnI81Ibw806uqvFe0RMXI5Riy7L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8772
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

This patch is tested on V4H White Hawk + ARD-AUDIO-DA7212

Signed-off-by: Linh Phung <linh.phung.jy@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sh/rcar/adg.c  | 10 ++++++
 sound/soc/sh/rcar/core.c |  5 +--
 sound/soc/sh/rcar/dma.c  | 38 +++++++++++++++++++++-
 sound/soc/sh/rcar/gen.c  | 70 ++++++++++++++++++++++++++++++++++++++++
 sound/soc/sh/rcar/rsnd.h |  8 +++++
 sound/soc/sh/rcar/ssiu.c | 15 +++++++--
 6 files changed, 140 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sh/rcar/adg.c b/sound/soc/sh/rcar/adg.c
index 00df32be4a4a..7bc4421835d7 100644
--- a/sound/soc/sh/rcar/adg.c
+++ b/sound/soc/sh/rcar/adg.c
@@ -57,6 +57,10 @@ struct rsnd_adg {
 	     i++)
 #define rsnd_priv_to_adg(priv) ((struct rsnd_adg *)(priv)->adg)
 
+static const char * const clkin_name_gen4[] = {
+	[CLKA]	= "clkin",
+};
+
 static const char * const clkin_name_gen2[] = {
 	[CLKA]	= "clk_a",
 	[CLKB]	= "clk_b",
@@ -435,6 +439,10 @@ static int rsnd_adg_get_clkin(struct rsnd_priv *priv)
 
 	clkin_name = clkin_name_gen2;
 	clkin_size = ARRAY_SIZE(clkin_name_gen2);
+	if (rsnd_is_gen4(priv)) {
+		clkin_name = clkin_name_gen4;
+		clkin_size = ARRAY_SIZE(clkin_name_gen4);
+	}
 
 	for (i = 0; i < clkin_size; i++) {
 		clk = devm_clk_get(dev, clkin_name[i]);
@@ -568,6 +576,8 @@ static int rsnd_adg_get_clkout(struct rsnd_priv *priv)
 
 	clkout_name = clkout_name_gen2;
 	clkout_size = ARRAY_SIZE(clkout_name_gen2);
+	if (rsnd_is_gen4(priv))
+		clkout_size = 1; /* reuse clkout_name_gen2[] */
 
 	/*
 	 * ADG supports BRRA/BRRB output only.
diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index 3de81af41ffc..a9125c1ff75a 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -102,6 +102,7 @@ static const struct of_device_id rsnd_of_match[] = {
 	{ .compatible = "renesas,rcar_sound-gen1", .data = (void *)RSND_GEN1 },
 	{ .compatible = "renesas,rcar_sound-gen2", .data = (void *)RSND_GEN2 },
 	{ .compatible = "renesas,rcar_sound-gen3", .data = (void *)RSND_GEN3 },
+	{ .compatible = "renesas,rcar_sound-gen4", .data = (void *)RSND_GEN4 },
 	/* Special Handling */
 	{ .compatible = "renesas,rcar_sound-r8a77990", .data = (void *)(RSND_GEN3 | RSND_SOC_E) },
 	{},
@@ -1467,7 +1468,7 @@ static int rsnd_dai_probe(struct rsnd_priv *priv)
 	if (is_graph) {
 		for_each_endpoint_of_node(dai_node, dai_np) {
 			__rsnd_dai_probe(priv, dai_np, dai_i);
-			if (rsnd_is_gen3(priv)) {
+			if (rsnd_is_gen3(priv) || rsnd_is_gen4(priv)) {
 				rdai = rsnd_rdai_get(priv, dai_i);
 
 				rsnd_parse_connect_graph(priv, &rdai->playback, dai_np);
@@ -1478,7 +1479,7 @@ static int rsnd_dai_probe(struct rsnd_priv *priv)
 	} else {
 		for_each_child_of_node(dai_node, dai_np) {
 			__rsnd_dai_probe(priv, dai_np, dai_i);
-			if (rsnd_is_gen3(priv)) {
+			if (rsnd_is_gen3(priv) || rsnd_is_gen4(priv)) {
 				rdai = rsnd_rdai_get(priv, dai_i);
 
 				rsnd_parse_connect_simple(priv, &rdai->playback, dai_np);
diff --git a/sound/soc/sh/rcar/dma.c b/sound/soc/sh/rcar/dma.c
index 9aca5ff791a3..1c494e521463 100644
--- a/sound/soc/sh/rcar/dma.c
+++ b/sound/soc/sh/rcar/dma.c
@@ -653,6 +653,36 @@ rsnd_gen2_dma_addr(struct rsnd_dai_stream *io,
 		dma_addrs[is_ssi][is_play][use_src + use_cmd].in_addr;
 }
 
+/*
+ *	Gen4 DMA read/write register offset
+ *
+ *	ex) R-Car V4H case
+ *		  mod		/ SYS-DMAC in	/ SYS-DMAC out
+ *	SSI_SDMC: 0xec400000	/ 0xec400000	/ 0xec400000
+ */
+#define RDMA_SSI_SDMC(addr, i)	(addr + (0x8000 * i))
+static dma_addr_t
+rsnd_gen4_dma_addr(struct rsnd_dai_stream *io, struct rsnd_mod *mod,
+		   int is_play, int is_from)
+{
+	struct rsnd_priv *priv = rsnd_io_to_priv(io);
+	phys_addr_t addr = rsnd_gen_get_phy_addr(priv, RSND_GEN4_SDMC);
+	int id = rsnd_mod_id(mod);
+	int busif = rsnd_mod_id_sub(mod);
+
+	/*
+	 * SSI0 only is supported
+	 */
+	if (id != 0) {
+		struct device *dev = rsnd_priv_to_dev(priv);
+
+		dev_err(dev, "This driver doesn't support non SSI0");
+		return -EINVAL;
+	}
+
+	return RDMA_SSI_SDMC(addr, busif);
+}
+
 static dma_addr_t rsnd_dma_addr(struct rsnd_dai_stream *io,
 				struct rsnd_mod *mod,
 				int is_play, int is_from)
@@ -667,6 +697,8 @@ static dma_addr_t rsnd_dma_addr(struct rsnd_dai_stream *io,
 	 */
 	if (rsnd_is_gen1(priv))
 		return 0;
+	else if (rsnd_is_gen4(priv))
+		return rsnd_gen4_dma_addr(io, mod, is_play, is_from);
 	else
 		return rsnd_gen2_dma_addr(io, mod, is_play, is_from);
 }
@@ -891,6 +923,10 @@ int rsnd_dma_probe(struct rsnd_priv *priv)
 		return 0; /* it will be PIO mode */
 	}
 
+	/* for Gen4 doesn't have DMA-pp */
+	if (rsnd_is_gen4(priv))
+		goto audmapp_end;
+
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "audmapp");
 	if (!res) {
 		dev_err(dev, "lack of audmapp in DT\n");
@@ -902,7 +938,7 @@ int rsnd_dma_probe(struct rsnd_priv *priv)
 	dmac->ppbase = devm_ioremap_resource(dev, res);
 	if (IS_ERR(dmac->ppbase))
 		return PTR_ERR(dmac->ppbase);
-
+audmapp_end:
 	priv->dma = dmac;
 
 	/* dummy mem mod for debug */
diff --git a/sound/soc/sh/rcar/gen.c b/sound/soc/sh/rcar/gen.c
index 925565baaa41..86bdecc24956 100644
--- a/sound/soc/sh/rcar/gen.c
+++ b/sound/soc/sh/rcar/gen.c
@@ -215,6 +215,74 @@ static int _rsnd_gen_regmap_init(struct rsnd_priv *priv,
 	return 0;
 }
 
+/*
+ *		Gen4
+ */
+static int rsnd_gen4_probe(struct rsnd_priv *priv)
+{
+	static const struct rsnd_regmap_field_conf conf_ssiu[] = {
+		RSND_GEN_S_REG(SSI_SYS_INT_ENABLE0,	0x850),
+		RSND_GEN_S_REG(SSI_SYS_INT_ENABLE2,	0x858),
+		RSND_GEN_S_REG(SSI_SYS_INT_ENABLE4,	0x890),
+		RSND_GEN_S_REG(SSI_SYS_INT_ENABLE6,	0x898),
+		RSND_GEN_S_REG(SSI_SYS_STATUS0,		0x840),
+		RSND_GEN_S_REG(SSI_SYS_STATUS2,		0x848),
+		RSND_GEN_S_REG(SSI_SYS_STATUS4,		0x880),
+		RSND_GEN_S_REG(SSI_SYS_STATUS6,		0x888),
+
+		RSND_GEN_S_REG(SSI_BUSIF0_MODE,		0x0),
+		RSND_GEN_S_REG(SSI_BUSIF0_ADINR,	0x4),
+		RSND_GEN_S_REG(SSI_BUSIF0_DALIGN,	0x8),
+		RSND_GEN_S_REG(SSI_BUSIF1_MODE,		0x20),
+		RSND_GEN_S_REG(SSI_BUSIF1_ADINR,	0x24),
+		RSND_GEN_S_REG(SSI_BUSIF1_DALIGN,	0x28),
+		RSND_GEN_S_REG(SSI_BUSIF2_MODE,		0x40),
+		RSND_GEN_S_REG(SSI_BUSIF2_ADINR,	0x44),
+		RSND_GEN_S_REG(SSI_BUSIF2_DALIGN,	0x48),
+		RSND_GEN_S_REG(SSI_BUSIF3_MODE,		0x60),
+		RSND_GEN_S_REG(SSI_BUSIF3_ADINR,	0x64),
+		RSND_GEN_S_REG(SSI_BUSIF3_DALIGN,	0x68),
+		RSND_GEN_S_REG(SSI_BUSIF4_MODE,		0x500),
+		RSND_GEN_S_REG(SSI_BUSIF4_ADINR,	0x504),
+		RSND_GEN_S_REG(SSI_BUSIF4_DALIGN,	0x508),
+		RSND_GEN_S_REG(SSI_BUSIF5_MODE,		0x520),
+		RSND_GEN_S_REG(SSI_BUSIF5_ADINR,	0x524),
+		RSND_GEN_S_REG(SSI_BUSIF5_DALIGN,	0x528),
+		RSND_GEN_S_REG(SSI_BUSIF6_MODE,		0x540),
+		RSND_GEN_S_REG(SSI_BUSIF6_ADINR,	0x544),
+		RSND_GEN_S_REG(SSI_BUSIF6_DALIGN,	0x548),
+		RSND_GEN_S_REG(SSI_BUSIF7_MODE,		0x560),
+		RSND_GEN_S_REG(SSI_BUSIF7_ADINR,	0x564),
+		RSND_GEN_S_REG(SSI_BUSIF7_DALIGN,	0x568),
+		RSND_GEN_S_REG(SSI_CTRL,		0x010),
+		RSND_GEN_S_REG(SSI_INT_ENABLE,		0x018),
+		RSND_GEN_S_REG(SSI_MODE,		0x00c),
+		RSND_GEN_S_REG(SSI_MODE2,		0xa0c),
+	};
+	static const struct rsnd_regmap_field_conf conf_adg[] = {
+		RSND_GEN_S_REG(BRRA,			0x00),
+		RSND_GEN_S_REG(BRRB,			0x04),
+		RSND_GEN_S_REG(BRGCKR,			0x08),
+		RSND_GEN_S_REG(AUDIO_CLK_SEL0,		0x0c),
+	};
+	static const struct rsnd_regmap_field_conf conf_ssi[] = {
+		RSND_GEN_S_REG(SSICR,			0x00),
+		RSND_GEN_S_REG(SSISR,			0x04),
+		RSND_GEN_S_REG(SSITDR,			0x08),
+		RSND_GEN_S_REG(SSIRDR,			0x0c),
+		RSND_GEN_S_REG(SSIWSR,			0x20),
+	};
+	static const struct rsnd_regmap_field_conf conf_sdmc[] = {
+		RSND_GEN_M_REG(SSI_BUSIF,		0x0, 0x8000),
+	};
+	int ret_adg  = rsnd_gen_regmap_init(priv, 10, RSND_GEN4_ADG,  "adg",  conf_adg);
+	int ret_ssiu = rsnd_gen_regmap_init(priv, 10, RSND_GEN4_SSIU, "ssiu", conf_ssiu);
+	int ret_ssi  = rsnd_gen_regmap_init(priv, 10, RSND_GEN4_SSI,  "ssi",  conf_ssi);
+	int ret_sdmc = rsnd_gen_regmap_init(priv, 10, RSND_GEN4_SDMC, "sdmc", conf_sdmc);
+
+	return ret_adg | ret_ssiu | ret_ssi | ret_sdmc;
+}
+
 /*
  *		Gen2
  */
@@ -484,6 +552,8 @@ int rsnd_gen_probe(struct rsnd_priv *priv)
 	else if (rsnd_is_gen2(priv) ||
 		 rsnd_is_gen3(priv))
 		ret = rsnd_gen2_probe(priv);
+	else if (rsnd_is_gen4(priv))
+		ret = rsnd_gen4_probe(priv);
 
 	if (ret < 0)
 		dev_err(dev, "unknown generation R-Car sound device\n");
diff --git a/sound/soc/sh/rcar/rsnd.h b/sound/soc/sh/rcar/rsnd.h
index 3e1184f56ffd..239705d52517 100644
--- a/sound/soc/sh/rcar/rsnd.h
+++ b/sound/soc/sh/rcar/rsnd.h
@@ -31,6 +31,11 @@
 #define RSND_GEN2_SSIU	2
 #define RSND_GEN2_SSI	3
 
+#define RSND_GEN4_ADG	0
+#define RSND_GEN4_SSIU	1
+#define RSND_GEN4_SSI	2
+#define RSND_GEN4_SDMC	3
+
 #define RSND_BASE_MAX	4
 
 /*
@@ -197,6 +202,7 @@ enum rsnd_reg {
 	SSI_SYS_INT_ENABLE5,
 	SSI_SYS_INT_ENABLE6,
 	SSI_SYS_INT_ENABLE7,
+	SSI_BUSIF,
 	HDMI0_SEL,
 	HDMI1_SEL,
 	SSI9_BUSIF0_MODE,
@@ -629,6 +635,7 @@ struct rsnd_priv {
 #define RSND_GEN1	(1 << 0)
 #define RSND_GEN2	(2 << 0)
 #define RSND_GEN3	(3 << 0)
+#define RSND_GEN4	(4 << 0)
 #define RSND_SOC_MASK	(0xFF << 4)
 #define RSND_SOC_E	(1 << 4) /* E1/E2/E3 */
 
@@ -703,6 +710,7 @@ struct rsnd_priv {
 #define rsnd_is_gen1(priv)	(((priv)->flags & RSND_GEN_MASK) == RSND_GEN1)
 #define rsnd_is_gen2(priv)	(((priv)->flags & RSND_GEN_MASK) == RSND_GEN2)
 #define rsnd_is_gen3(priv)	(((priv)->flags & RSND_GEN_MASK) == RSND_GEN3)
+#define rsnd_is_gen4(priv)	(((priv)->flags & RSND_GEN_MASK) == RSND_GEN4)
 #define rsnd_is_e3(priv)	(((priv)->flags & \
 					(RSND_GEN_MASK | RSND_SOC_MASK)) == \
 					(RSND_GEN3 | RSND_SOC_E))
diff --git a/sound/soc/sh/rcar/ssiu.c b/sound/soc/sh/rcar/ssiu.c
index 281bc20d4c5d..17bd8cc86dd0 100644
--- a/sound/soc/sh/rcar/ssiu.c
+++ b/sound/soc/sh/rcar/ssiu.c
@@ -29,8 +29,8 @@ struct rsnd_ssiu {
 	     i++)
 
 /*
- *	SSI	Gen2		Gen3
- *	0	BUSIF0-3	BUSIF0-7
+ *	SSI	Gen2		Gen3		Gen4
+ *	0	BUSIF0-3	BUSIF0-7	BUSIF0-7
  *	1	BUSIF0-3	BUSIF0-7
  *	2	BUSIF0-3	BUSIF0-7
  *	3	BUSIF0		BUSIF0-7
@@ -40,10 +40,11 @@ struct rsnd_ssiu {
  *	7	BUSIF0		BUSIF0
  *	8	BUSIF0		BUSIF0
  *	9	BUSIF0-3	BUSIF0-7
- *	total	22		52
+ *	total	22		52		8
  */
 static const int gen2_id[] = { 0, 4,  8, 12, 13, 14, 15, 16, 17, 18 };
 static const int gen3_id[] = { 0, 8, 16, 24, 32, 40, 41, 42, 43, 44 };
+static const int gen4_id[] = { 0 };
 
 /* enable busif buffer over/under run interrupt. */
 #define rsnd_ssiu_busif_err_irq_enable(mod)  rsnd_ssiu_busif_err_irq_ctrl(mod, 1)
@@ -152,6 +153,10 @@ static int rsnd_ssiu_init(struct rsnd_mod *mod,
 	/* clear status */
 	rsnd_ssiu_busif_err_status_clear(mod);
 
+	/* Gen4 doesn't have SSI_MODE */
+	if (rsnd_is_gen4(priv))
+		goto ssi_mode_setting_end;
+
 	/*
 	 * SSI_MODE0
 	 */
@@ -206,6 +211,7 @@ static int rsnd_ssiu_init(struct rsnd_mod *mod,
 	rsnd_mod_bset(mod, SSI_MODE1, 0x0013001f, val1);
 	rsnd_mod_bset(mod, SSI_MODE2, 0x00000017, val2);
 
+ssi_mode_setting_end:
 	/*
 	 * Enable busif buffer over/under run interrupt.
 	 * It will be handled from ssi.c
@@ -553,6 +559,9 @@ int rsnd_ssiu_probe(struct rsnd_priv *priv)
 		} else if (rsnd_is_gen3(priv)) {
 			list	= gen3_id;
 			nr	= ARRAY_SIZE(gen3_id);
+		} else if (rsnd_is_gen4(priv)) {
+			list	= gen4_id;
+			nr	= ARRAY_SIZE(gen4_id);
 		} else {
 			dev_err(dev, "unknown SSIU\n");
 			return -ENODEV;
-- 
2.25.1

