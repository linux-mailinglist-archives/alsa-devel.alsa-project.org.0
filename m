Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC55D9AD950
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Oct 2024 03:32:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B532AE0D;
	Thu, 24 Oct 2024 03:31:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B532AE0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729733523;
	bh=iLqPNhNv54ZR7u+m94DbveiYQPx/xmpnKsSCxpQ5LqU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=BEPX5RLtIJmevjFyx19ym/2uqF5kd94A4qfJ/Qdp6snTLXBgbeT4B1V61Hw3nRytp
	 VvbqwqE7bE3nUVhWGBJkmw9spkp0WW8bmyjFLvhrFea8uZNSrJ6T/bXsKGoovod7ia
	 8BQUQqM9Kj25V6VAs5ptGpNLP8aCtaijugYXQFyw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F36BDF805CB; Thu, 24 Oct 2024 03:30:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FBF2F80690;
	Thu, 24 Oct 2024 03:30:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0576CF8062D; Thu, 24 Oct 2024 03:30:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 00AD7F80614
	for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2024 03:30:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00AD7F80614
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=HxyFQegY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+6o/ry8XNS0DQ++8LwjSifMGKo8YFfIWPyr5vokpuuVBlvqFEKWNSkRG3esnuiP2Gncwm/ujK6kvGwpcdh61fuWPKw+iSZ1ie5A+fhBaDamBuea8aDpVleb88/2G9ik/mR2r0QsH7HxsI8RRd2CFT5fKIGmTNE3WheOc5REyTg4Y0766oKlZz00ZMaPTcGNqJ6JgPxWWKF5oRTY+UDE6VVhgIrPmmetQHzR7rClqr/gMl/xWLQKkmkiqhr+LnscDHeLNaoC+1uYFQtX8ivoEP6noMmAf9sBYhFADT7AQRq4a+pbpTcz2KzDn1AUWYk5j8vAcKvwOdN82kBl7y24fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DiCPtb68hvMqTY12hBjqsqiOckeFNI1HfeSGkNlX0Yg=;
 b=OPuIrdKndE5J+Oh4MV6Bsja0iqM7ExYCd8viXI8rjU2YKCL9+A9hLq/Z5pZvz5258DwJn4z862ZrshTVSoAXmLw7zwPGpo84To/EtEFUEa0Xw1a48OOb+pVtjpS9V4Pyf30nycmIa2eGu9smt/jA6zkodigyyXVsP85BQuDcftoUY0oyMroA3jeORjnS0PumIanGmbseFoIk38gljBREPAcS0AxKEkTbepOxizjVpWwsEmGj4rzn4ljvDyDOhFkHwSUs22NHj121IQVRxvFGWHNkaFj/Dsd1kDppDuySwwZgWUCfVI+1UaqpGbVfM05q9AJfFyB9hOiyb9cvoROx+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DiCPtb68hvMqTY12hBjqsqiOckeFNI1HfeSGkNlX0Yg=;
 b=HxyFQegY+pUPPl7eDobe+zrbbq4HRHQHFXerni5VCyszXREBKb/jIALAvwO11XBh6Fmun5z739ExMdI4OQ+yDAt6lzPH8l7SS3hOpYCe2d5A8mmyyCfJUR1TadULaFKFVaby8W0D9PuJEaelCLtcHh4nYu4wS1sXqjCG8Dlrk6k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB12111.jpnprd01.prod.outlook.com
 (2603:1096:400:43d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Thu, 24 Oct
 2024 01:29:59 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8093.014; Thu, 24 Oct 2024
 01:29:59 +0000
Message-ID: <87plnqb84p.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Vinod Koul <vkoul@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 alsa-devel@alsa-project.org, imx@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com
In-Reply-To: <871q06cmsl.wl-kuninori.morimoto.gx@renesas.com>
References: <871q06cmsl.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 8/8] ASoC: cleanup function parameter for rtd and its id
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 24 Oct 2024 01:29:58 +0000
X-ClientProxiedBy: TYAPR01CA0197.jpnprd01.prod.outlook.com
 (2603:1096:404:29::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB12111:EE_
X-MS-Office365-Filtering-Correlation-Id: 094e79d7-1ba1-43a1-56a7-08dcf3cb5fb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vL5je6wGMQj+VR4L2UtHqhZxoP+wg0iE2+B+TzifCBnAenCnEfy+mh2n4Q7z?=
 =?us-ascii?Q?itWc92EitrsHZnGjRqQcKK6q3IHz9aSiRyJpGlv8P94PGX0cPpcDTFnL+7WA?=
 =?us-ascii?Q?eeqR3W5Rbp00V3kAtNzR2juYs7+UCk05Lyi7xUTDDdexPPsej9+1LverxMyA?=
 =?us-ascii?Q?7epHi1rYm3yBINM91jd7gX1lL2r03JUz0fWLRElqwnAMIOAtK4oHHBS/L15S?=
 =?us-ascii?Q?vwuWcUd8ZcZW1w5IHaGCGb6nfTXr/gRkh+fSavKICcEig3uEY132ES03PQYz?=
 =?us-ascii?Q?84Tv/vuBcqk1srrcrewapdVyamwZJAmOYS5JPPGOhRYgEtpFgNgVZQJqBq4r?=
 =?us-ascii?Q?PSrmXx5ex8KPYQj44TRtHSEz8pXfIzhZCWM3L8FLcgtEZ1N5T/VT/TXm+AD+?=
 =?us-ascii?Q?gyR5nTWWOc61yiQHU6c0ghFy3Rp2octcArYc0YAaRK0gvZSysSYErs5qnaIA?=
 =?us-ascii?Q?4+o+SKE3CccZJjn3zVt8NOcd+rxrhh74QNoMAhO6NuLkPN+ovBJ8pdFBWR2U?=
 =?us-ascii?Q?VM2NLtEznD/0q14w6kArnJtHXIqIibDzbPes4vjA0Rfm0naJ3p+SGC9EI3Dm?=
 =?us-ascii?Q?3usu7vMIO+4jWNwMR3u6fJM30ejAL/M8WN2L4F+ZymtiboO42YMfM2U9tpxl?=
 =?us-ascii?Q?QECeQAtSzV4GpZP1bdkuSD0dOi3cMB1WW09fUPwmwrHKNqfKVEV9Ed/t16Nc?=
 =?us-ascii?Q?myQW4goAlVQiSckiF28Eshr/ONMzyTfXEasjVsh/mb6FPwYlnlcc9penJV3q?=
 =?us-ascii?Q?FKf+s84FiSzVBIm2ZpEdHaSedbOETu3HOnrrFlvgzooLOGUYQyHC3U8KKkwQ?=
 =?us-ascii?Q?RrD9yZNR7sL0B1UZYEMFcRsvEKH2pLBtOhMRnfG58LFBqejhVf+rprnYhlyP?=
 =?us-ascii?Q?GgcwNd7sPaOIWDmwI7OKSydIZ90ip02zmRs0nrwM66geHBh6D74hv40NYYyD?=
 =?us-ascii?Q?WSwkrONQahilHBBPoiiANd2fWHZZ5NJURuduGibH0TzjS2So1hK9sfFTVx8N?=
 =?us-ascii?Q?OgV6K+hlk7b021k4SJrIjrNV3O+chMmJxFNRdkg7yrxkvfaEo7nkYepr6eKw?=
 =?us-ascii?Q?A8TMUVC909+q/u8lUcn7ZoiUT0hg0Jgzgu4VX4/4ZNGDp3LONW127vf6eYNX?=
 =?us-ascii?Q?uyJBd+h49JxUHY910E+okUjNPqehtyn6OUiB27uACmVf64FHawjGCM7tiHzj?=
 =?us-ascii?Q?njmWme+F/kFxqTPJl2T8eOE0YXa1gUs6hU9hvtOwnsa866LezQBWFrb6Gyy+?=
 =?us-ascii?Q?87frx+BMZ0oD9lVAmQ11l8sxE2IHcrF1KjNQFSHH7Rkn1JpzkND4fuaJsL1l?=
 =?us-ascii?Q?9SYWV4+tFcsA9FYsEixCTN/+QHli/P9tJYCoKDidn8foxCwEFy8ouqDgSLkP?=
 =?us-ascii?Q?ekfAuc/JVtLbMUufw7rU66+GiVdA?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?D6z40hxnf/qyF5SzeW48jDaWLr0AG4ujHQrW2ifa5TvQDZJx0h0KUmHYaGxg?=
 =?us-ascii?Q?QnDYJKeoWh6Dl19onnljHwrbLFMBilrPidlqMX/bbqJGZiAf9hAu5Nn2XOwe?=
 =?us-ascii?Q?NW5O3rIFQ8Qg4w8wyMUgop6HQ35GcjJQnLYbzq8hYkf8rNtAlenCOp8seOG1?=
 =?us-ascii?Q?Rm4gIwaW/MitbTAvMYWA9duzW//VysPW5+PgZ+NI6EvWy1B5DWknvXmmfnay?=
 =?us-ascii?Q?ZMWjcFUX5xVvI+q1d2g5A5qpHKjQzvSDaS4g3Xd8p7iljIwf0LOn/Jb+DR+8?=
 =?us-ascii?Q?7URPirxpBtZQnGBllaCc6JC4HGAexcwKN8rLE2LHcqh5r2vxsRJpYUjQKqP4?=
 =?us-ascii?Q?EtFcrBHbOclGF1wdAgQY15DZod3oCSAJq4cAyhy4O7u0yhALxojdFYDx8/26?=
 =?us-ascii?Q?MqFM/bFtVMMaSzsfBUA4Hcjw38vzKXvejVmQla1ao/+lH28OzQzmjDG5W9dY?=
 =?us-ascii?Q?d8OapbxHDi8oUbplPp/bULHRfA5UgFN7MuKtp+j1hQLBBrcISjAKb07wxjvI?=
 =?us-ascii?Q?sd2tZFmlaxqfVG5jx38LqshRXgAtnjfTbZcRVbGYCKcdAgtSq9mb4je4maRV?=
 =?us-ascii?Q?9GvINudZr+Rbsn/EN1uEL09675/cPZ20pJSXZZWdAm09KyYMJNLIZpeiJ158?=
 =?us-ascii?Q?/jMSOxf9Yd5pB8Mif8znbgH5bSiyHRFx/fDihggGogBw90LJkjR7rAWbo2wi?=
 =?us-ascii?Q?oFLe36ScAo8VasAefJfFiJkckuAHO51b/OcLuJ3uh9XBj1kj0XPHqot03KDV?=
 =?us-ascii?Q?GUQ5wVNbKUo4Be+4FWlzq5MM30z6BcedBfoOZ6puqyDd26/OHDUknZJFYNhR?=
 =?us-ascii?Q?V3GRfNnFxja7P45jRyz5DQb7b/d6tsBrAYp/82Cip38VFTJfXDRI/amCQPot?=
 =?us-ascii?Q?ByYEsqSha354vk9m5JHxUGr5vK4APYDgOZb+GtgvcBDnihngqAhVcwR0KTJw?=
 =?us-ascii?Q?8pUxgzoBeWfaYL+2Lx14LV9aqVjGdXuYq6/Y4rvDVIpMDoV2gQcu5Hgvw0lB?=
 =?us-ascii?Q?yenvTPpl1ED8/e6e2Iiu3sXOYcbyn1BhdBh6k7zZIookKwiN8U6AaKdRkmXL?=
 =?us-ascii?Q?gsZ/AYiOeUFvgNytjFVfM1wf90uNT/oeARx7qQp6kse3vo6kPlHxJpBt0R+f?=
 =?us-ascii?Q?7gwjB29/rd5Mlx1CUt5urmlUxB4gzYbo23dtwCAlc5jen9wPwOvj2tW+gqFN?=
 =?us-ascii?Q?wGI4snZm8xa8NjmEzSQshOMMOjAhz7YfVyyzrb4WLy33n9uQtAUfAv4cGFgR?=
 =?us-ascii?Q?49YZTRnQ3cLOvcMUz49BFK0fGtP9gSQpVT9Q7jiBe/gP9sH15SXY4XMK5C3e?=
 =?us-ascii?Q?71yTYh5GfLXlU7L0lyCAzwTtYHVvKpeqiu9KB291fgpe8vkh9zWo81O/bD+R?=
 =?us-ascii?Q?CcaxlgK/kA0LUR7b4OUk8Za41AqIc674WO8XdTFwvKzBuowY7pK5FTP0fvKD?=
 =?us-ascii?Q?dKJdWwRa2sAfTvGWviqgciARTRzQ5YstHTAIiGP+iF9QkJAsDPW46KswF/gi?=
 =?us-ascii?Q?ul3JFUe2636Rq5JjOF/mx0KNJ7ozAce/OkGs9MpJ4CmPLe6e1jUfy4mvdVqx?=
 =?us-ascii?Q?ASW0x5s2I4yhLLIdlz7+bmnapUoxi9NtzHYSWaaO9/N57RQjN9rkxHnTdXBh?=
 =?us-ascii?Q?uiTmgIVRFARChOn03sdyA9Y=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 094e79d7-1ba1-43a1-56a7-08dcf3cb5fb2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 01:29:59.0149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 rxH+s3W3wZTv63S3yiMdnja0Yb2S9k6WQDc4EguYISWGEk/3JbHP3AROiwEWHIFzTyvQNRfva+JJ88yD+nEl+wxFB7K6wT1N8/gKIEy758GjfDb3ri89KWnKNEHPkAWw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB12111
Message-ID-Hash: GQY5FT7KXKK3S7SEMNQE3OXCARV2PS2C
X-Message-ID-Hash: GQY5FT7KXKK3S7SEMNQE3OXCARV2PS2C
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GQY5FT7KXKK3S7SEMNQE3OXCARV2PS2C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

some functions had parameter like below

	xxx(..., rtd, ..., id);

This "id" is rtd->id. We don't need to have "id" on each functions
because we can get it from "rtd". Let's cleanup it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h  |  5 ++---
 include/sound/soc.h      |  6 +++---
 sound/soc/soc-compress.c |  9 ++++-----
 sound/soc/soc-core.c     |  8 +++-----
 sound/soc/soc-dai.c      |  4 ++--
 sound/soc/soc-pcm.c      | 16 ++++++++--------
 6 files changed, 22 insertions(+), 26 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 9dbeedf6da13b..b275201b02f60 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -216,8 +216,7 @@ void snd_soc_dai_shutdown(struct snd_soc_dai *dai,
 			  struct snd_pcm_substream *substream, int rollback);
 void snd_soc_dai_suspend(struct snd_soc_dai *dai);
 void snd_soc_dai_resume(struct snd_soc_dai *dai);
-int snd_soc_dai_compress_new(struct snd_soc_dai *dai,
-			     struct snd_soc_pcm_runtime *rtd, int id);
+int snd_soc_dai_compress_new(struct snd_soc_dai *dai, struct snd_soc_pcm_runtime *rtd);
 bool snd_soc_dai_stream_valid(const struct snd_soc_dai *dai, int stream);
 void snd_soc_dai_action(struct snd_soc_dai *dai,
 			int stream, int action);
@@ -275,7 +274,7 @@ struct snd_soc_dai_ops {
 	int (*probe)(struct snd_soc_dai *dai);
 	int (*remove)(struct snd_soc_dai *dai);
 	/* compress dai */
-	int (*compress_new)(struct snd_soc_pcm_runtime *rtd, int id);
+	int (*compress_new)(struct snd_soc_pcm_runtime *rtd);
 	/* Optional Callback used at pcm creation*/
 	int (*pcm_new)(struct snd_soc_pcm_runtime *rtd,
 		       struct snd_soc_dai *dai);
diff --git a/include/sound/soc.h b/include/sound/soc.h
index 828ab19258f0a..30a9d1853dc18 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -486,11 +486,11 @@ struct snd_soc_component *snd_soc_lookup_component_nolocked(struct device *dev,
 struct snd_soc_component *snd_soc_lookup_component(struct device *dev,
 						   const char *driver_name);
 
-int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int id);
+int soc_new_pcm(struct snd_soc_pcm_runtime *rtd);
 #ifdef CONFIG_SND_SOC_COMPRESS
-int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int id);
+int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd);
 #else
-static inline int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int id)
+static inline int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd)
 {
 	return 0;
 }
diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index fb664c775dda5..3c514703fa33d 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -537,11 +537,10 @@ static struct snd_compr_ops soc_compr_dyn_ops = {
  * snd_soc_new_compress - create a new compress.
  *
  * @rtd: The runtime for which we will create compress
- * @id: the device index number (zero based - shared with normal PCMs)
  *
  * Return: 0 for success, else error.
  */
-int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int id)
+int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_component *component;
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
@@ -617,7 +616,7 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int id)
 		snprintf(new_name, sizeof(new_name), "(%s)",
 			rtd->dai_link->stream_name);
 
-		ret = snd_pcm_new_internal(rtd->card->snd_card, new_name, id,
+		ret = snd_pcm_new_internal(rtd->card->snd_card, new_name, rtd->id,
 				playback, capture, &be_pcm);
 		if (ret < 0) {
 			dev_err(rtd->card->dev,
@@ -638,7 +637,7 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int id)
 		memcpy(compr->ops, &soc_compr_dyn_ops, sizeof(soc_compr_dyn_ops));
 	} else {
 		snprintf(new_name, sizeof(new_name), "%s %s-%d",
-			rtd->dai_link->stream_name, codec_dai->name, id);
+			rtd->dai_link->stream_name, codec_dai->name, rtd->id);
 
 		memcpy(compr->ops, &soc_compr_ops, sizeof(soc_compr_ops));
 	}
@@ -652,7 +651,7 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int id)
 		break;
 	}
 
-	ret = snd_compress_new(rtd->card->snd_card, id, direction,
+	ret = snd_compress_new(rtd->card->snd_card, rtd->id, direction,
 				new_name, compr);
 	if (ret < 0) {
 		component = snd_soc_rtd_to_codec(rtd, 0)->component;
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 4f0bfe73fe15e..a1dace4bb6166 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1479,7 +1479,7 @@ static int soc_init_pcm_runtime(struct snd_soc_card *card,
 {
 	struct snd_soc_dai_link *dai_link = rtd->dai_link;
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	int ret, id;
+	int ret;
 
 	/* do machine specific initialization */
 	ret = snd_soc_link_init(rtd);
@@ -1494,15 +1494,13 @@ static int soc_init_pcm_runtime(struct snd_soc_card *card,
 	/* add DPCM sysfs entries */
 	soc_dpcm_debugfs_add(rtd);
 
-	id = rtd->id;
-
 	/* create compress_device if possible */
-	ret = snd_soc_dai_compress_new(cpu_dai, rtd, id);
+	ret = snd_soc_dai_compress_new(cpu_dai, rtd);
 	if (ret != -ENOTSUPP)
 		goto err;
 
 	/* create the pcm */
-	ret = soc_new_pcm(rtd, id);
+	ret = soc_new_pcm(rtd);
 	if (ret < 0) {
 		dev_err(card->dev, "ASoC: can't create pcm %s :%d\n",
 			dai_link->stream_name, ret);
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 2feb76bf57bb7..34ba1a93a4c95 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -457,12 +457,12 @@ void snd_soc_dai_shutdown(struct snd_soc_dai *dai,
 }
 
 int snd_soc_dai_compress_new(struct snd_soc_dai *dai,
-			     struct snd_soc_pcm_runtime *rtd, int id)
+			     struct snd_soc_pcm_runtime *rtd)
 {
 	int ret = -ENOTSUPP;
 	if (dai->driver->ops &&
 	    dai->driver->ops->compress_new)
-		ret = dai->driver->ops->compress_new(rtd, id);
+		ret = dai->driver->ops->compress_new(rtd);
 	return soc_dai_ret(dai, ret);
 }
 
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 81b63e547a099..fb7f25fd8ec5b 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2891,7 +2891,7 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 
 static int soc_create_pcm(struct snd_pcm **pcm,
 			  struct snd_soc_pcm_runtime *rtd,
-			  int playback, int capture, int id)
+			  int playback, int capture)
 {
 	char new_name[64];
 	int ret;
@@ -2901,13 +2901,13 @@ static int soc_create_pcm(struct snd_pcm **pcm,
 		snprintf(new_name, sizeof(new_name), "codec2codec(%s)",
 			 rtd->dai_link->stream_name);
 
-		ret = snd_pcm_new_internal(rtd->card->snd_card, new_name, id,
+		ret = snd_pcm_new_internal(rtd->card->snd_card, new_name, rtd->id,
 					   playback, capture, pcm);
 	} else if (rtd->dai_link->no_pcm) {
 		snprintf(new_name, sizeof(new_name), "(%s)",
 			rtd->dai_link->stream_name);
 
-		ret = snd_pcm_new_internal(rtd->card->snd_card, new_name, id,
+		ret = snd_pcm_new_internal(rtd->card->snd_card, new_name, rtd->id,
 				playback, capture, pcm);
 	} else {
 		if (rtd->dai_link->dynamic)
@@ -2916,9 +2916,9 @@ static int soc_create_pcm(struct snd_pcm **pcm,
 		else
 			snprintf(new_name, sizeof(new_name), "%s %s-%d",
 				rtd->dai_link->stream_name,
-				soc_codec_dai_name(rtd), id);
+				soc_codec_dai_name(rtd), rtd->id);
 
-		ret = snd_pcm_new(rtd->card->snd_card, new_name, id, playback,
+		ret = snd_pcm_new(rtd->card->snd_card, new_name, rtd->id, playback,
 			capture, pcm);
 	}
 	if (ret < 0) {
@@ -2926,13 +2926,13 @@ static int soc_create_pcm(struct snd_pcm **pcm,
 			new_name, rtd->dai_link->name, ret);
 		return ret;
 	}
-	dev_dbg(rtd->card->dev, "ASoC: registered pcm #%d %s\n", id, new_name);
+	dev_dbg(rtd->card->dev, "ASoC: registered pcm #%d %s\n", rtd->id, new_name);
 
 	return 0;
 }
 
 /* create a new pcm */
-int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int id)
+int soc_new_pcm(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_component *component;
 	struct snd_pcm *pcm;
@@ -2943,7 +2943,7 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int id)
 	if (ret < 0)
 		return ret;
 
-	ret = soc_create_pcm(&pcm, rtd, playback, capture, id);
+	ret = soc_create_pcm(&pcm, rtd, playback, capture);
 	if (ret < 0)
 		return ret;
 
-- 
2.43.0

