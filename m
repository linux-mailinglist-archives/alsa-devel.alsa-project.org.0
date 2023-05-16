Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0F8704F3B
	for <lists+alsa-devel@lfdr.de>; Tue, 16 May 2023 15:25:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D44910E;
	Tue, 16 May 2023 15:24:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D44910E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684243537;
	bh=sydQiHobdNSwjuwARG/vNTBzCwpyudak+0H0h79D7BY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=F0fOwvGisTYMtCqVHb+IIdN7hJcOuDnks7YvCqTx3Jp/IgofVUIwRU9VSx16eegtU
	 YSU+GuKVROTmAvr34CcV8bvDtjp7sq8m+mkaQtDVXzq+vrKjlplJNNfs7oesLewxR6
	 dzH4kY0qCwIu+8KdWnfyxP0bQUfK3KRSaupG+/aY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FE70F80549; Tue, 16 May 2023 15:24:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BD29F80272;
	Tue, 16 May 2023 15:24:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BC45F80431; Tue, 16 May 2023 15:24:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1a::603])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E169AF8016D
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 15:24:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E169AF8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=I3hPqOXl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fc8MW+XX4MyQ7xl7HurBSjGto5t4PcpZ3gy1bsL0gaPpEGo6Cy2xUv731T5Zh3sYpso3CB/GXH0ePqsZwt6RSQPHXBJx7uLWkjbI4CrP7+se3hypJhNokQF0MMQbQcEMD9738nEzr6Og0KsH21KyGeivIMduG0HzhBWqJEpatTPTCnn8XBu+KS1BdNTgn3gKUAUoOAMRV7TBK2oMtDw3h1uf6Q8Uoznua2g5uNzt8DWmHN3Vz+sGNl8m8ujL+Ngf7JEeTBTQErhDknzeyT/yuaf8AnoNjJf+4rv2OMfYNn77q/eYkJXBzqT7NwMDE34dAJIKQfMk3D1/F+m5FK5aFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOlNlxW1utziA5jo+UMHtHC8Fr6/606iUvgR2FPKOeY=;
 b=HKT8+23fydzPCxk+XrLioQpeYm844rIkBM4F8RCfM/NDNGlrawq67PNRDzS1BazNBoWDfaDpQQ0omPP3tDXtgjyotkeghIwffKkDQ1lXRaieO0oaEnzv1vdOV8wUHdHig4c8ngD9iSxCHzWqUFeFwpB7KJPfWrn5odcO2tgzeKOiYiJNlDtDpj/pBgDpvSeRtKaq4T8QdV851HscOlZ/2XCUJj119VlyhDZ8marVrrWQnIZCkEPz1aOIwDIn1iS/tXi4d1esD51J23PT+KpMWj32qdnb0ONxO2kYOiEBGnobxN61TbNSmwbfnrxryYSpn/ox6CzQ7wppRaBow7cBjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YOlNlxW1utziA5jo+UMHtHC8Fr6/606iUvgR2FPKOeY=;
 b=I3hPqOXlh+gzbZM99LeM7ExEClIJkWlaOGaQ1UaiSTVJgLX4FjQfifwbdc4+9LSJUZJcpXfoVq644O2v5j37R7wbisiwAEkP8kERf+63DFM1b0QpIMqrRacDaBjkk7E9M/GVzOP8OW73Hcl8OyG81Vfjlsdqq556MZsteFIeuHo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by DU0PR04MB9635.eurprd04.prod.outlook.com (2603:10a6:10:31f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 13:24:23 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::42e1:4216:edc6:52a9]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::42e1:4216:edc6:52a9%7]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 13:24:23 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	daniel.baluta@gmail.com
Subject: [RESEND PATCH 0/2] Improve support for sof_ipc{3|4}_bytes_ext_put
Date: Tue, 16 May 2023 16:23:59 +0300
Message-Id: <20230516132401.205563-1-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P195CA0032.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:65a::6) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5151:EE_|DU0PR04MB9635:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dc5fd21-e1db-4e05-8464-08db5610dceb
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	32PuJLa0abtMExCTpeM07edaP09MYJX/Oz7GUXjU7GtFk4hgyWmj/Za1pLA/suCS0txMgIiqdBwh8Ftx4g+l22T80u/s5OJt0pe86kJeu4UiQCoxVenSVyYVXbXNRIddET2IzwYoqFYR0QC4HjgUU7IJmbx/i0m1Oup0wDF5qFZnm1VxqbpSUF90SSeKJ8/oGESMOVCoyveV+0fSf6j0noCcj/+ZSAezYvZuKwUxrkaQlNOd9oCo5AT31teWKCXQ5wT93yERwCTq6NO4Ttxw+m7qI2QUBU1jkKFobwvLGSagf2iFu3q1H1WgeaPjAAxAdMBFl+KEBwHQgPRgYK8t85O3vvOryhkOczfPrfrAB8ODpBGIUEY6xAUL5YWZdY7WrhHRTNpo6K645ef4CC9xD3C+dcTmPFRjHW7ROhFKQ9k8jk02kynhyievxETlhePKPFir7RFuGOC203AE4/bFMd7nmvxfN+2FyyPN3Mxdk5dgdvORjFm1nlBJuOvMal7a1wxbNBVRgH1a+Aj6Gw5k5nQIhXidGG6SEvtIfhcq6TM65lMdFok0ev0YGIS4h+FP
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5151.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(376002)(366004)(39860400002)(451199021)(83380400001)(66476007)(66946007)(2616005)(52116002)(1076003)(6486002)(478600001)(8936002)(66556008)(44832011)(7416002)(6666004)(186003)(5660300002)(4744005)(86362001)(2906002)(8676002)(6512007)(4326008)(316002)(6506007)(38100700002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5lEhslWjCrC6t9+obWai+pPMBNEYRf8LounP++O7K9qKZiZ0JQX78S1FDwNZ?=
 =?us-ascii?Q?GfEpgYrUPDUHrE2qyW//laFnXuYbVYTjV/8xGyoNUzDJ+gJP/nSLM+eb8866?=
 =?us-ascii?Q?bbUMC+HfcItbqf7dTU69JM+bixcGT4ZP58IeyJADyFSiu+hhAr+mw94u4LqL?=
 =?us-ascii?Q?7rgZU/pHBq3Oo68ahJD/aCAky8W5xA/iVEai5MKFqivOhf4izm3bvQpFZjyH?=
 =?us-ascii?Q?vgUb002OgXwCS6jsEICEl6Oug8rspQsC6s89+yuSQo0IzdPi0nrz/32Ksjte?=
 =?us-ascii?Q?knmej1ar25CxXl/JMv6f15gWHDRnnxnLR/V5BxEUI+CObr/TG89zfd20iaq+?=
 =?us-ascii?Q?ILfqSPI3EUQlK2Lb+BvtWM6l0JERguOXASKZvIxRKKX91lUU1N/rRXwB+/Ha?=
 =?us-ascii?Q?6PT6LCQI8HbU/UlAOWN+P2A/5/skI1M77gnHLCk6Y4FJpR7jPWzGb+AdC4LE?=
 =?us-ascii?Q?IL+BMEzlsn+S4+qwqk5J3lHZ1j697zcnnCKHgm9FfSdsKzZI3mfDrdTcGtR+?=
 =?us-ascii?Q?w7pI8Z1j2LE4Y+DQGq7Xd75KetxAZ2GRejhQwEpvSDg+R6aIIEAbCYn5FkG0?=
 =?us-ascii?Q?4qOFp8RCY76PqFySXsxLk9OvY45R6g2QffUt+sQb9iKV/pySf2ISCGrz8ujN?=
 =?us-ascii?Q?FR1FmsydvwDGqgfMxsENH05Nl/Uvq3MXGgZXOvAoM72S8hys9rBlHTzOz/fP?=
 =?us-ascii?Q?zYN81dILJfGPCPKQ3A5NV7c+qO9kvxzeIeuhgL2Un9D+o+f/Y+rd2/7Ybo0p?=
 =?us-ascii?Q?B20AfTUAThfVnshg8ez7wDgPWmMLW8ZVO7iRF+GjxCG9+Ze82aelc2S+1f2l?=
 =?us-ascii?Q?dT6ysJ9wt+zlpHmWq01XX8P9N1HhozO1EZkMiilnghAWIE2lYEcu9J2ka29z?=
 =?us-ascii?Q?sLAITj3YlVKHmkA3XCul9wIqPlE0o1gKESLwNpKSunp3vMt/i5yqL1cK0MXQ?=
 =?us-ascii?Q?fG2vMhcme5wJ+pX3hLlHdMZpztUP4kfZ37jypj19X8HA7ZxKcl6CpfQoW4Ch?=
 =?us-ascii?Q?wcAwmOGC0KKOP1Du9wMRHwIaMwPNcYCACWTX2Fyh7blT2kPpQ7SC6Jja7U2V?=
 =?us-ascii?Q?suNuS4pEk/Lm81XR7LZnBDiBdkld6bVULhRP3lm82tvYTY/ZqSxoajUdbz2j?=
 =?us-ascii?Q?vc3TRFJGyt5PSNeVs+Yi08mfkGOY3BYiazUq4uDdrLV0QCiK0KCTLt9Upr1X?=
 =?us-ascii?Q?Lizf/IIOb1hmpxSj1JDJxnTclhLkFzcQjTwFMoimqxyiGZGXNxF0Of7qS+k6?=
 =?us-ascii?Q?Gz84/KBOwGLqrfNQJdk6HOpSV6SmqfA4WApYY7UGG7qOJ4KGkwqC+NBju8kj?=
 =?us-ascii?Q?NqFuxuhGIYa+SkdZXlzhYrZk5wAw0UhXkdbsLSdxHlaHi1JFKA47FZIdxmHY?=
 =?us-ascii?Q?f1WbiroA0qXmeDyEaFrm79DKMZZ7oBnoqul9JmEBWGGY2USUvD1YQ7kV9Sxf?=
 =?us-ascii?Q?5cy1X3qocfsCYwOnKoOu89J+ydT1JREeI/ZyuzYoFdTUy4O42aqBgfD/gZBN?=
 =?us-ascii?Q?AhGky2kPeciGDjeaYfYTIBTupRhN/N+8Mtz6I8JiCC4Mke7B8nloQDsIPzzG?=
 =?us-ascii?Q?G05TKLdpMGq1tbC+lrPSTpNQia67/+r6f2cqMlJZdaEtti1+sN6bS494Hk6A?=
 =?us-ascii?Q?Jn8mqqxit/qlODeIEoq+6Tx3y0ri5mjtMNjuTxBhwJb0ztNs9xMdRcdPra2g?=
 =?us-ascii?Q?zmbEXg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9dc5fd21-e1db-4e05-8464-08db5610dceb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 13:24:23.2477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 aSfwT8nugtzMhFkglZKVdnBtL3qE1G0MahhAJJjcThE7PiPuMPd3EhCS+CoBZz+KwLVhj08CU9RPKnGEnSYqTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9635
Message-ID-Hash: X43ZWZTIL4L2ETG4JXIQN5MC5JAAJNCA
X-Message-ID-Hash: X43ZWZTIL4L2ETG4JXIQN5MC5JAAJNCA
X-MailFrom: daniel.baluta@oss.nxp.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X43ZWZTIL4L2ETG4JXIQN5MC5JAAJNCA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Daniel Baluta <daniel.baluta@nxp.com>

This patch series provides better handling of cases where sending
a data blob to FW results in a validation error.

In this case we restore to the last good known value instead of keeping
the data that firwmare rejected.

Paul Olaru (2):
  ASoC: sof: Improve sof_ipc3_bytes_ext_put function
  ASoC: sof: Improve sof_ipc4_bytes_ext_put function

 sound/soc/sof/ipc3-control.c | 54 ++++++++++++++++++++++++++++++++----
 sound/soc/sof/ipc4-control.c | 39 +++++++++++++++++++++++---
 sound/soc/sof/sof-audio.h    |  1 +
 3 files changed, 84 insertions(+), 10 deletions(-)

-- 
2.25.1

