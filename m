Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E0690E0C8
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2024 02:22:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AD52A4A;
	Wed, 19 Jun 2024 02:22:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AD52A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718756554;
	bh=R5m/4n1JoYnPi16p3LCIa2mEuJhAVRlRCjFtk+jPqoc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XRn4YOa74t25n4mhCpB2gILfl8kCgB69f79l1K/VeZhegMPxX+hD+k8RdJJCrcMe1
	 tcDvEDn4j75AmocT5dOTjtjkI+chOxTcBtXAzeq/IbZS/yY1pXlz6tBCeMn0B5wl2A
	 OIbi9+uj/+tlAcO5I3UnmC39JBOMXlsoAa7dpgGM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45345F805EF; Wed, 19 Jun 2024 02:21:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45DAFF80603;
	Wed, 19 Jun 2024 02:21:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4177DF80236; Wed, 19 Jun 2024 02:20:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::61d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 089A5F804F2
	for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2024 02:19:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 089A5F804F2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=dsbEq2fE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m7nHH3J0Yq7+nZfUxX7ur6cWOq7zvCtEPh13pjpiKEZdSXXbR95URxJgUigp+2AY6rD2V9FetjCenV7u6SZeI+GIU91CzYWLQakcCF6pdEpv2J44jfTjwcYdqGo7gQ2/0PgSv9RUx5RLhUy8xbjiT0JDY9p/nmFZDm21Nn10L7ysJ5HyhOwZ3aCwedEGpyQgkZbv5lXdx98PVnGKLFAfLXa5h0rXfFv/g6EwRX3K0ZLMl8h2Fa+URB3Zyu67p4VLxcETmyNWcIO9CMnUMOlN0DA+dbVeHpRb4U6h+C1mMMlkPagFMZ3bAg8xPCwkzCDZZq2D/hzpYamzFaw0NJSpCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w61PALYSiWkhH9o42uXVCAd/pnpT87hto831DJrTNiE=;
 b=QZLi0Iwl18HiOW1hyj9Kv2ZrNapY99cwE48kGX2kaAbltkz2XNtbsDusZulBio2ay/8eVBqaXKq/J6/F8POylV8ozWRD3V6SAiliThlAy5mKgsPgjHLvvdMcdcXtf+edWSSHPg8ssJkk0Bwh4X95pD1CVdHPI/EA2qe2hlbWlaQEWv1ojHTnGTGRl7tHUtOcZEct4NKLb20+cS9Us12SusmkACxs6JgJ7cRkOyLAPEOI30/CEZZaWuMFOaZ/4WTBltsMCFSC4yJmgnLYR31HqzQb17ZPtnPnoRM/wqm4k1jM03jI3mgkWJV/Tgi6SJnY8Qlk2MCUv2PrTwUbJc9nfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w61PALYSiWkhH9o42uXVCAd/pnpT87hto831DJrTNiE=;
 b=dsbEq2fE1sFonWqwVRe9wOYLx0wKBKCG7vel2lyprdrG++1Zb78NoR/t9+1HaaiouDDXnguiqWlZ34UcUikjcgq/u3I5h7hqsvmEfQcInpCFzHOWePcL3u5Fs8H1H79FghpNE964y4A5hkMOS7+99MldTX2qWTr+SKJYFKWWNc8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11717.jpnprd01.prod.outlook.com
 (2603:1096:400:37d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Wed, 19 Jun
 2024 00:19:52 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7677.030; Wed, 19 Jun 2024
 00:19:51 +0000
Message-ID: <87msnhwzq0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v6 3/4] ASoC: amlogic: do not use dpcm_playback/capture flags
To: =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski=22?=
 <amadeuszx.slawinski@linux.intel.com>,	Alexandre Belloni
 <alexandre.belloni@bootlin.com>,	Alper Nebi Yasak
 <alpernebiyasak@gmail.com>,	AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,	Banajit Goswami
 <bgoswami@quicinc.com>,	Bard Liao <yung-chuan.liao@linux.intel.com>,	Brent
 Lu <brent.lu@intel.com>,	Cezary Rojewski <cezary.rojewski@intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,	Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,	Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>,	Daniel Baluta <daniel.baluta@nxp.com>,
	Hans de Goede <hdegoede@redhat.com>,	Jaroslav Kysela <perex@perex.cz>,
	Jerome Brunet <jbrunet@baylibre.com>,	Jiawei Wang <me@jwang.link>,	Jonathan
 Corbet <corbet@lwn.net>,	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Kevin Hilman <khilman@baylibre.com>,	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,	Maso Huang <maso.huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,	Neil Armstrong
 <neil.armstrong@linaro.org>,	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,	Takashi Iwai <tiwai@suse.com>,	Vinod Koul
 <vkoul@kernel.org>,	Xiubo Li <Xiubo.Lee@gmail.com>
Cc: alsa-devel@alsa-project.org,
	imx@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-sound@vger.kernel.org
In-Reply-To: <87r0ctwzr4.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0ctwzr4.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 19 Jun 2024 00:19:51 +0000
X-ClientProxiedBy: TYCPR01CA0123.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11717:EE_
X-MS-Office365-Filtering-Correlation-Id: e20b2dd8-9b46-4b10-51fe-08dc8ff58980
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|366013|52116011|7416011|376011|1800799021|38350700011|921017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?eDBJ3xTo1iPn47peB6QFpmdYmAjSWI3y3CE52+1JSO08a60wGe3N3tN8Pexn?=
 =?us-ascii?Q?8tw8WpXT5AZceSPEGiwmxWj1xPcv2r1r3LgltaDeJveiz3jy8/+U26Fb0e1q?=
 =?us-ascii?Q?wAYT9evSjbwtyCBa2Er/gWptTRQazZiVyRhrFu0OB7TjKrU3qpwc5ti3u6vB?=
 =?us-ascii?Q?pq8j8khyhKKlojQEhyfS/T80xXiuvv1qeWbbTgQCU73+Mah+RN3tDyCvr2tN?=
 =?us-ascii?Q?XWhJE2xYicnhdrtB2iXwL4nHDg+VlT67qU5nhAZxi2BA7MtMhqqJ3TIpktZs?=
 =?us-ascii?Q?6ZD1ds7Ci7OvF199I0PsT4Sz+TOrc9d8hLwwTUrE2x1aENEt8rMBj2T1wTLi?=
 =?us-ascii?Q?fXeRom5AzCif1aUdCUELVZMNGihf2ZFpweFl6KxcyktQlxT2IvA1+3bu7pfV?=
 =?us-ascii?Q?+K5gHxosMYOwcVGJ08A8XoQQ3AdUh8VsbegR1L8a8noU+qfI7avkYfPRI7QP?=
 =?us-ascii?Q?JrKzAMiMdxZQEJJEjO6Anr9rirk9qgOHfX2bUYpB3CdBjmnVBQ7REKVE6Wcm?=
 =?us-ascii?Q?3MY8zonQHd3hinA87+5tm8LdX3cgHafZguN7rmZkyLz9jMqEMKZo1xHimJZt?=
 =?us-ascii?Q?xgHov3kSIe1PAeRH9j9xX6rc+D5y/RKHXDi3CIk0kAvgoFGrTylScyKMBqhv?=
 =?us-ascii?Q?66prvjCerML/FUPdmY55owlPVoi1njuJhQlu6utEX86BF8ToYxUIrGiITbgT?=
 =?us-ascii?Q?J24VffKN6P/04amN8z5zC4dsekdTkSUYj3e1+g2v+gCssSOqQc/faOUxLo2T?=
 =?us-ascii?Q?/n7tsdNb8zq6ViWfbLZSA7XSlWVlbFBtsxfyOp40qEY6n3g66weZ97mkedop?=
 =?us-ascii?Q?F8f9OecKMW7HOprmZLM8l4eg8dmERO7/+ZKNURMdAApNVAHuwCcwD5+tCAJ1?=
 =?us-ascii?Q?j+cdb+uzzdTNwYS6OvDheQwBQ6ZF8IRopEAwXDlDdVnfnr2YSJOGOon28m4i?=
 =?us-ascii?Q?q9YhMnCrMPieBcVfpSEw3MQk3OWY6LsiaJaExc3+U5Hk/AdO+jmW0a11Jdak?=
 =?us-ascii?Q?HdB4X9mafKl86awoQeVNGMTM4vrLuW2FKG30wvuJ7+HUPQV6lylkfydv3Qus?=
 =?us-ascii?Q?58M6ClSvfa8xuVaPvhKu78hPoJxZEl/6e+9bMcBJbC20pk4i+sis7JZsvT8R?=
 =?us-ascii?Q?KOHOY01WdWGNPOSi/H86jbMt4QGJXtQEuQRjkwJernHyYFSHkG6wNEtZugAU?=
 =?us-ascii?Q?qAvN/SMdHunoKMZ4xlsAm+z/aZVRh7jyygyhOlUZM09nhpgzyzTED3PiNkva?=
 =?us-ascii?Q?DWCWxrOV6rt2X6ayFz/JVrHPRGaZZsisTqhaQn3yan1GArpv7CNNtTsmtp8w?=
 =?us-ascii?Q?IPTzwQJw+jPmC54Wj0O7m27YxX9BscqBh43P2YcrLWjLU9Ajpp2hXXVPyLox?=
 =?us-ascii?Q?pGm2Y6NJQUV2wkqWlv4+EStKw9Xh?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(52116011)(7416011)(376011)(1800799021)(38350700011)(921017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mm/6/h40yfSPB4HMvqZDPZNnseVxTyFcKPnGJ76/p4fivfBBo1Sc2j5FhR7C?=
 =?us-ascii?Q?tVkAKPqfpaiCUJ9K3Qty+gDGN0L2nO13BbeTEKA4VqLCzoBOELFW/SQgflxi?=
 =?us-ascii?Q?yFhsMK1k9IiNYpKqZ0NfyscOv0yKZq/t05/DK0su1W77ZpzQsRnco9SVahzy?=
 =?us-ascii?Q?Z3zVG7wq0vG/HU0IQWsKGzJDA2X0GNYPGAwUSickbe2prxjiTDPD9fJZGiUd?=
 =?us-ascii?Q?KPp8yE0URc3Isl6K4pqaNt1gNZfRRQoyHJuwnLFAVE6fDUUJLlaMHNxpD/p3?=
 =?us-ascii?Q?F46DL1Ku+LjG1zmC8G4rNlRVjdTtWoc8fSIXO6hJOeKC0l/gWx6+Qwd5enZH?=
 =?us-ascii?Q?oQCLfxcof6zgvSIz89npCEWaDk35NDaxQiB+shcKt+VHYL/9Tlg+IG5PnoD+?=
 =?us-ascii?Q?Jdo7aADJecEvr92yzQLuRUfvQB9mA5a++MM7O3vr6W+RkeqaQoiZnoBt5ysZ?=
 =?us-ascii?Q?bb8Sf0ryib00mIb8oI6yxyygFLI2f746vIxyQN6OPK378kCn//1W9+zWX6fU?=
 =?us-ascii?Q?KzmNsCmzvlB7OwKKeC5OGoImaKhX69Azi3pPlYw5NKIKYpOeblhv4tRPdoia?=
 =?us-ascii?Q?Yt+nmQnYEzNSSs7DcVGt9u/+gHjigO2c5YgnhZAJINkCr767RYGu7H1/NLrT?=
 =?us-ascii?Q?P3amUFqRx0ZudMm+4BtN6EfTMtMXJdpotgWSGQvOnlAZlefKjVLtL+KA/6QH?=
 =?us-ascii?Q?qe5mjoR247twSZVRRI9x7cJxS9OiGfBxZk34VKjoUEsde9ope2hUFvLpy1bD?=
 =?us-ascii?Q?NUIOz0cQ6qFs3DtFID9xoKQPbodaCS7VmvexasKcKp7n2km7CTE72qmgMSlz?=
 =?us-ascii?Q?aO4i+sgN3VF01RoaJ3QzsIX0iHoqmQXr+On25ZG3MAyu0lFWiv7gxRAXDQUr?=
 =?us-ascii?Q?GVQyQsiKSaDNuEEOHdVXmSUmb3lL4owDVDw4Zt0wyQJZRwyiyxh6OSRB+sHm?=
 =?us-ascii?Q?CVZynQje7ZWRR8tu3tGURhruMRdbtJTLudkKBikiP23BYQS3njJN0wEfWIF6?=
 =?us-ascii?Q?BlQfud4Pnmxo2bcRTKEVazdQH6x0p7IkuZXlbyvCeJkPQMediZ+slNEZN8LI?=
 =?us-ascii?Q?VMSb6TUQSZCq8RiczX81TvyJ0cUYq/HD4CYf0ezQaWbjhneaW8lnRopJu50W?=
 =?us-ascii?Q?Wwj2N0Bkbx8J0p2/O7YAnAoZ8mXDMLumeDkJbRRc09ugOmwYcF5fU+Cb7Qru?=
 =?us-ascii?Q?2jZmGeuN8ZEEnU9HBMdAmEbt3CPk3MPUYSSlM1dJOyEGhg9FZrUT36HwSowJ?=
 =?us-ascii?Q?OtTes/JNDFnLLIOr25IIsOEleOKeyYTYp22sDcpAas3KB3gnU1kZF7cCm82O?=
 =?us-ascii?Q?Eb2OK8Uew7mgbldR07ZsHI7TUnqy7OsJHJjwJTVVeD/8XDcath644UtfumEu?=
 =?us-ascii?Q?tKBs2Qtv3LBwuyqCtMmK0+Fi3nOW+VcrTKmCPa+cScMN/1jF47isWzWysJ+D?=
 =?us-ascii?Q?YojGCMmFLRlpMQXjZnQxnWe61Op3mDHRZp5C8f747cUQc4uxjwPwQptNf9gy?=
 =?us-ascii?Q?KGSKuuGF6LQh3Xc3YhbGB3YI6iCXg5nqqp/OpnN+SS9zWoIb1nXl7y4bYvLJ?=
 =?us-ascii?Q?U9G8Afh3VNwPAqlbqToKzv+bnbiHGIlAiOv9iJRhgcoB3tRkiuk6F/1Fo4OZ?=
 =?us-ascii?Q?K21o64QWEMbjSJuIYvlBI7Q=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e20b2dd8-9b46-4b10-51fe-08dc8ff58980
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 00:19:51.8568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 2KZCY+wcMN0jWypjRHXaI4Ver4HoC20cMvFsos5hUuxcBgenj1zHTcOveJBWn2XqfLLLx4T6EWUARB/hln6uUZBcccsj8/9cRVTRkpSSzjx6dyTyGXvZnQC2RwU5hlCZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11717
Message-ID-Hash: OKYKKZB3JRBTCRMNQB3KAF7WRXQQPSAI
X-Message-ID-Hash: OKYKKZB3JRBTCRMNQB3KAF7WRXQQPSAI
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OKYKKZB3JRBTCRMNQB3KAF7WRXQQPSAI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Jerome Brunet <jbrunet@baylibre.com>

dpcm_playback/capture flags are being deprecated in ASoC.
Use playback/capture_only flags instead

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/meson/axg-card.c         | 10 +++++-----
 sound/soc/meson/meson-card-utils.c |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 09aa36e94c85..646ab87afac2 100644
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
@@ -186,9 +186,9 @@ static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
 
 	/* Disable capture is the interface has no rx slots */
 	if (!rx)
-		link->dpcm_capture = 0;
+		link->playback_only = 1;
 
-	/* ... but the interface should at least have one of them */
+	/* ... but the interface should at least have one direction */
 	if (!tx && !rx) {
 		dev_err(card->dev, "tdm link has no cpu slots\n");
 		return -EINVAL;
@@ -275,7 +275,7 @@ static int axg_card_parse_tdm(struct snd_soc_card *card,
 		return ret;
 
 	/* Add loopback if the pad dai has playback */
-	if (link->dpcm_playback) {
+	if (!link->capture_only) {
 		ret = axg_card_add_tdm_loopback(card, index);
 		if (ret)
 			return ret;
diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index ed6c7e2f609c..1a4ef124e4e2 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -186,9 +186,9 @@ int meson_card_set_fe_link(struct snd_soc_card *card,
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
2.43.0

