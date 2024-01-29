Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBA083FB73
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 01:57:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC9F074C;
	Mon, 29 Jan 2024 01:57:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC9F074C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706489852;
	bh=V3wysxgtpraf1FD3rzXyb67aBJ+ub2E5Q1LB48ROvSg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PWQisyri9FFUTQop4p/e6Sj6U2HoH1lqBUcAwqJGDjbziuL/frXee0DgoBUBMvPyQ
	 8RIuhtHZJtsLIx/GibxH8KqoukCuPvygaOgnmxTjSxORyIQWMm3LTI+Ww2L0/3TXbo
	 HPVamgKaGWEhlmQWwxYf/jtMVcGGVvF+XyoDK1Zg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E8F9F80563; Mon, 29 Jan 2024 01:56:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46001F80053;
	Mon, 29 Jan 2024 01:56:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52450F805EF; Mon, 29 Jan 2024 01:56:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5F4F3F80310
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 01:55:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F4F3F80310
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=MXB64GV0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kTS0SLF2SrbpwgyOdScIBms5VmlRHyMcFNeSNBudL1pHq0GTYNmresWe1SJZxvJpMXQRyrZsccf+hlOfHICNQj+olXsteRO+U5GMNLR6ZSpYnJasplxLjgAtKL9GOuXECBX3SYMyauJ9pyeJJo6RuppM0VMy8gggXmt4/ERkZBCrDBdGvcZOXgluleXhyS0iEEIUnV1mWPYwvIvYWbrWWuvxhQmU5YwYuAftVBmFpouRqpz/cOfxOHe4k/QCzLN5k18oPs4TlIyhvpyI11b54Uoz8XC29qVSW1fi6MEtarIEdIZOk3LU+rNvqgiPK5KNhxGom79icC5lpdB7Tw53bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h+zbHtJG2JPjss3ic5YyQJsUH4T3jOKFdArXm1iaN5c=;
 b=hQ+HSqdv2MTDSwbbck2HwgbuOHbuL5XgFG8GYQXnWV5syYTkAH22VOC5nxhCCcPMmepC5D6w1p4HIsoUZ9A0kXdHyu355yAcAhujvmOaEwz1+7IjcF7HDM7FG4bwJj+64A2J77IlWEdpSTVHS5XFF6qU/8/1GEaCS/QJgnM2oR16nYdsRoLUZolzePj74WjY1GdgkS0lZjT89Nt0jQfMyByznADTYrFERyKxG4xet24eW9f8tnNCukJ3qTIFr1yV+OTigFFnBG4R2fw8WcSwpQIs8iOuITAhEilbImPbTEYPmv1pDLHJoHbkEhf2ydNtfARDsE4J8q7a29glQhIxCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h+zbHtJG2JPjss3ic5YyQJsUH4T3jOKFdArXm1iaN5c=;
 b=MXB64GV0EfTyDgnpl7ixQu2v9Pqoo/urHMV2LtpmVSdv4caURlees8xypsiZmCEzRNUx5u1uaSUorOG4QOXpA20vuZrOknWj4mmJu3dt9acnusG86WfRpCTiFduvAoTxhYi+K7+aHP87XkBtOMCrEocb2bWChbTNRVvDGNxmCoI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYAPR01MB5996.jpnprd01.prod.outlook.com
 (2603:1096:402:34::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.20; Mon, 29 Jan
 2024 00:55:27 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.017; Mon, 29 Jan 2024
 00:55:27 +0000
Message-ID: <874jexklfl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 08/13] ASoC: audio-graph-card2: use
 of_graph_get_next_endpoint_raw()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig=22?=
 <u.kleine-koenig@pengutronix.de>,	Daniel Vetter <daniel@ffwll.ch>,	David
 Airlie <airlied@gmail.com>,	Frank Rowand <frowand.list@gmail.com>,	Helge
 Deller <deller@gmx.de>,	Jaroslav Kysela <perex@perex.cz>,	Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,	Liam Girdwood <lgirdwood@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,	Mark Brown
 <broonie@kernel.org>,	Mauro Carvalho Chehab <mchehab@kernel.org>,	Maxime
 Ripard <mripard@kernel.org>,	Michal Simek <michal.simek@amd.com>,	Rob
 Herring <robh+dt@kernel.org>,	Saravana Kannan <saravanak@google.com>,
	Takashi Iwai <tiwai@suse.com>,	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-sound@vger.kernel.org
In-Reply-To: <87fryhklhb.wl-kuninori.morimoto.gx@renesas.com>
References: <87fryhklhb.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 29 Jan 2024 00:55:26 +0000
X-ClientProxiedBy: TYCP286CA0222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYAPR01MB5996:EE_
X-MS-Office365-Filtering-Correlation-Id: daed1450-303c-4a67-b01a-08dc2064fbac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NeUuqYWMACGKgzfnvIS+I52nnnPv3lHjEnwZxrenaDDvCv5hdR5DYNQqScK5e4V43kFPEu8CapgdDCVMDdSskKQ3gwKYFHM84UxJ9VdhpZwoE8LzN5QqH57GRr7qfPk6OBifWAu6W49HYAipv+QS89G69Fc774Pw9QkjaQiM+wY9XWvDd4buUXfi8U5PIPI+6UUSALujbcBYH7dAhr8Oo0yelxsrrQssyapXBULhU37VWDg/FjWY2GAZ/gGdjKcU6Qi7fY/qFF2rgD2+AfCoJmOb9dsp8cBAKcfWSp6S1RH3TYXcgX0r+AOYll/3BX5SrZc05y71dtwkA0mFYxJ6crPz8qinSpS45CSfxW6495v0DQnDKE6XwNUB36GA7K842vDgdOnYRCE6E+/OM4fwwka8DtrYMXo2rxklpSXZNG9Q3Bd0jo/EJXn1GZ/THVo5QKhOZI9vFZeeOOiZaIlJ9dTAfrJymF+smonEreLoASuFoUjHwu+NGQyOC0vpTB3TZoaJ3OGwpKFJfiS6qTeUsio1rtkYKWT73MU0luEPSqara2ieU6f9QJVvNJSqeikWqBi2pWItzqO7OL+nzxZZcTpjAHo/tlKjT+nJAnvc04SNyLDQMgOGOxJ+8ang6KZI8p6xLSEqyDoGDpfKvOR8gaSxgHDXmFHA5C1nhEi925w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(396003)(39860400002)(376002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(83380400001)(6512007)(7416002)(6486002)(5660300002)(2616005)(6506007)(52116002)(478600001)(26005)(38100700002)(4326008)(8936002)(8676002)(41300700001)(4744005)(38350700005)(36756003)(86362001)(2906002)(66946007)(316002)(921011)(66556008)(110136005)(66476007)(2013699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AmNgNgY9xyd66eQVLYxxwFEK0X8bHAXs5uJGPMIgoUGJFeX7y3h8QclFa9sL?=
 =?us-ascii?Q?+AxXLCQfhinG877kgzYh3QjPW34B76qcuyLQdz0F8RwRfiPe4PFXg6z/Vswv?=
 =?us-ascii?Q?GMrZiNys7l1jKCXyPa/0ec54BiLHUrx0EOvlO7D/gUvsKp1GoCbNbXxop/v4?=
 =?us-ascii?Q?C/CYlFmTLKy7Ndi/uJpAqzQSQJ2da+Zt+VHXvuf2F33Sxu3c1v/iHxrl/c7g?=
 =?us-ascii?Q?Rwt855PyH1eLQ2EzJZalWbx3dJCExfScZS9uUVn8T0wXcQkKZ9Fe/Qrj8KZC?=
 =?us-ascii?Q?aa6boLxmYsJce8O6d+wx8KSBqN34Dz60MpQ/D+XRLEMQEUg4pHN0lSFYLmlS?=
 =?us-ascii?Q?7aPjwBfri+h7cn4cOwLpmQhYQrs+BNPwiDytKyfp/sJsa1YqO24+R4rrOvzV?=
 =?us-ascii?Q?t8D4xE1XiXMzVMeQsNmn24qIwYn9tBv8Y4MMB4ljP+JWIH0fytAz7TbPiJmJ?=
 =?us-ascii?Q?EdSAAGzwbAh6+JeDqo97nu+w0cOokRbZPC8nNpxgUYPqCs6Cof+lzOpVmHmy?=
 =?us-ascii?Q?/Z/FqBXSwZ4gDWZzb7vfzC3eN5TIGMXE6GRmPO8I0aI6Y2AVqjMrjHUqACTS?=
 =?us-ascii?Q?l5gzWsZUb/O0UbzM94S2RIQ1pocivo71WU5+5IOVfeb5qESEOZEey5G+ztb9?=
 =?us-ascii?Q?Z8/x/kQ0J/hc/W2FLv5Brj66ilN56QIOE7p1waHIX978r+dKnjJ0pIzcXhf6?=
 =?us-ascii?Q?HKkgP7WRIo/y2/0LUIlSeeGZhhfru2vWot7p9OsSGYtypaPcYVzszSpenXrY?=
 =?us-ascii?Q?UQp/oyDAM9UIrjd+I6fwIo+lOTPY8JV92J93Hmw4lII6NzFq+nYuEmTs07hA?=
 =?us-ascii?Q?3vWPknn5hXEVicJ5pxqOju3UNGZnGRknqxUT8wl12J5UJw57HSKUjwDLSmVO?=
 =?us-ascii?Q?GZzO9lItkgG3nRE7B+5n0KZ8Icl+6Dby1ZbdXXBShwgcZnKMQhD/DE2/dIGs?=
 =?us-ascii?Q?JJfpPM6oR1JciUXfbQO74U8SsKTb0LTVIaVLc0qCnTXHeFGELUTETNEdwzdn?=
 =?us-ascii?Q?AyRu0Iae4LmzUA1Jhp12rpHRha9QXkO4rM4+rY5Q7Gl/k4L5KV7VMNjJUOv3?=
 =?us-ascii?Q?7RnJSMAXRuXnlKc+xkgNL33sZ5NHVHokSm+uoHoGKiKof6DMj/UlJ8tDmDgX?=
 =?us-ascii?Q?KoH0/QP3pnuGw/5+JOioEqt7gE+hy+dtl7pGuidfl4PWWsCM5y3IGu6b4F23?=
 =?us-ascii?Q?IDt9VbZnXFfhCfPQkOfVqtujQ/KlojSPApXYGXmicMwW8RXxGsOgF4g52ecc?=
 =?us-ascii?Q?2zAAuok40tXnWd/7EGmXnrr3GxB72cjE+6ay6fwgo0WFuYZjPCzxxCc8fFTZ?=
 =?us-ascii?Q?mHVGOdBlVxHSCXME6fjJxrozF/PT6EG1wiT2bKFq+q/VyJXjOFnnp8KgU+lV?=
 =?us-ascii?Q?S5bdnFb8/GymA8ozdW53qQw75ikVpQNqrK3XD9x4RvfiEwai2tjyensG+/Ae?=
 =?us-ascii?Q?vKGCYTihZ0rZEVLOdDmwL49UmTNGgxEgZq1bJ/HgeFuYgkeQCAlEvRYp4v8Z?=
 =?us-ascii?Q?678Ml0LT3kFeqnxefOFRuyHCxr18CD1j3fqLMdrS+nbx0TBBoKz2SkvUUW7X?=
 =?us-ascii?Q?Kd6HeeNQtTCz7iGvkrBZ/wM5C7GQ6qVu4Q0IZRwIb4uTZEbG7/dkXJgWVyJN?=
 =?us-ascii?Q?NAO1Jhabm9gdbt978cKqXPs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 daed1450-303c-4a67-b01a-08dc2064fbac
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 00:55:27.2256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 MlAMKcG/Z6mTbCQUY8UFhUuycVNQjygxLO2otHQ8bRzJiDmOtI6MH0HuUCIUN2D/jQ8GmD7IDRy4tv7EsMR/sH+JbvSLjU88AAapE5AYUw9UmbU2jNCwXIxETFmex2hK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5996
Message-ID-Hash: MJI6BCOPZAGQECXDKTFNJYQW2W3GU77D
X-Message-ID-Hash: MJI6BCOPZAGQECXDKTFNJYQW2W3GU77D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MJI6BCOPZAGQECXDKTFNJYQW2W3GU77D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We can now use of_graph_get_next_endpoint_raw(), let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 59a5db12bb5c..d616a82f05b6 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -555,7 +555,7 @@ static int graph_parse_node_multi_nm(struct snd_soc_dai_link *dai_link,
 		if (*nm_idx > nm_max)
 			break;
 
-		mcpu_ep_n = of_get_next_child(mcpu_port, mcpu_ep_n);
+		mcpu_ep_n = of_graph_get_next_endpoint_raw(mcpu_port, mcpu_ep_n);
 		if (!mcpu_ep_n) {
 			ret = 0;
 			break;
-- 
2.25.1

