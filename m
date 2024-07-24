Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAFD93AB53
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jul 2024 04:43:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F3C4E9F;
	Wed, 24 Jul 2024 04:43:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F3C4E9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721788990;
	bh=LkTnb72aTb7kcS1zdgH5m10CNc7UH88hv4pJtxFaDp4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AKqYmIww6Ot3xyQdZomx9C7U+sxHshwhyZeV7S29GaBFRUzXdj3GR8s3/BXnAJmJs
	 Eo60E/ZF1RftZzFVcHPSZ1K7WfMePQ0trwImFfwlyvIFP8XXKy0XjFXKsedsAoFxlx
	 PEBJdWFzLi+2Bb47Ui9UiGby2mLGBVRp4MFrakSM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A704F805B6; Wed, 24 Jul 2024 04:42:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BA741F805C9;
	Wed, 24 Jul 2024 04:42:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81CB2F8013D; Wed, 24 Jul 2024 04:07:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 85994F8026D
	for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2024 04:00:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85994F8026D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=KM3NWmXC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vVjpDzXfWV2Q6EachQhHWbK67+glAaDtURyekgcvz9x2Uc4SwCp+fpjouo9uoFox6CnAmyq1f6NgrFaBsumNh9Hn6m9lQbFg1v5IohqetX1hB874lCaH0zhOM/kC4mTkDn7eqSqY2nHKp341bjksWefsdMH1BxjVdizjmRn3jQ6k7EC1GBu2/+cccThcF9QWMNxqEAr5gSv3eDcqwOWwjHBAOS1k6/8ytPxiindjA00RFXvXzLm+e946Oq313kdBbFSMumb6JOTc2xpGwDMexedxgHwipep2HSdt4ZMQFp8hRUUIgouECoUcOK1N3bdbk+iJYhA1DKERKXgLo7q+fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1SRic96GdGwzG0AvMX8UxTlI8UVl6TeKw699m4CLoPc=;
 b=Ajy6Ri4DY5hEuoEgq+0/B5Pz1B0M/ER0MxOBDRGudTld3y6Q7gZa/J7v6QcSQpnNNJ4x40PZ0VUxaKgjByRE+jtEs4YSfHJuxslzrUtV2JGfDBAdvDFrsqXT4SV0Nf7xWB89lqZYDUXHM1ViGxU32vMBork7s2MXQfo7HK6phOvx+fqKxcpaktUlM+USEX2PF+tFxDDB5ezvEz1Zx+3Tlg1wK/5hKZbHw7VJAdqjiPAFsILYlLnmpfVju7JOu68mLA/R4hCI3SXOO5GC6vNGRW/8eT7t/GHEZAx2uMmZsnbpj3+Y07+ZureKR5Fkqw9Ud+IgKFQb616L7jSm6At5Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1SRic96GdGwzG0AvMX8UxTlI8UVl6TeKw699m4CLoPc=;
 b=KM3NWmXCGIZSZS7iitvGMwiMk8uM/19AbV66Sk1M0o9m/Xs7RWxOvOgYELlj2f8H0awAQqS3vwZfX3vzd/NrpWjawa+5WQBTcXqooZrXUGWjJtafyVKHZp6ZMp1WYPumg4atiqWvjYnESFDTPl7TBwVwMOycmY0YSGi5tIibpVY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8899.jpnprd01.prod.outlook.com
 (2603:1096:400:18d::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Wed, 24 Jul
 2024 02:00:16 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7784.017; Wed, 24 Jul 2024
 02:00:15 +0000
Message-ID: <87jzhbft1s.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 062/112] ASoC: intel: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Takashi Sakamoto
 <o-takashi@sakamocchi.jp>, Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87plr3ft3q.wl-kuninori.morimoto.gx@renesas.com>
References: <87plr3ft3q.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 24 Jul 2024 02:00:15 +0000
X-ClientProxiedBy: TYCPR01CA0188.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8899:EE_
X-MS-Office365-Filtering-Correlation-Id: 214b1775-d35b-45e5-9124-08dcab845c93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hEjh/O5beMQSEG9SIk6u8o1Np7l1I3GAKysytqFBVohcEtmj/DZHyihSRsMO?=
 =?us-ascii?Q?8Nj9Vz++aFthpsWWifN870bpIYmQICA6LaleYK4qHmt4mLdtualfdt/v+Hue?=
 =?us-ascii?Q?lsr0HlVF7ZIVpi2SoILKoYDhHOmco83plFkr2N+ecjHVqTz4oHVMLqJOCMQ1?=
 =?us-ascii?Q?b6uopjCNK4e7H6/wh8UQt6tLP6lqZGpewYOBkqmc9ttKqT6vmRHqCf1BkRfJ?=
 =?us-ascii?Q?gW/7W9gVpwVp/tWYfchEtVzMI4vtoK2gwUkjrAs//rLLWa3/KUqz3JJGvXON?=
 =?us-ascii?Q?hZjzmgSanaxkROXBCwoh+S+DTUw5XqA8fMiVIuIRP8BVNRsrlpMGUY5PxUEu?=
 =?us-ascii?Q?Qcxh+hHabbDL40wbU5OkYHcZtA1xdNdWuY83FP87d1FiQTECXCiYA2IXnV5h?=
 =?us-ascii?Q?Wx0zduHkA4wy48ohF8NgPf9fOSU8qe/eDH1tndZwNpDNeTPmIhzUqO8bdFwS?=
 =?us-ascii?Q?AJHJv/bOUKAXudZmu0mAvtxVlXNaG3qP0pFw1I6LhS+apTV1L69yNrC8tUxR?=
 =?us-ascii?Q?RcN34xeCeoMom8nB5l55X5Q+vM8d1GOviQssfGNlygw4d/uULAV1VSLuAfHi?=
 =?us-ascii?Q?671xNc4KoxuRUX9gWSxJuI0OWFEup2oHNf+DexsUGEInm99yvBYGmPLUxmZB?=
 =?us-ascii?Q?XcVoWjceOKom/pJKvnf3LLO3EGpUnbOsQO9F/K7U/Lr51asKRPvlrgpp7wts?=
 =?us-ascii?Q?YQYBk9IsPoEqn64AVnxSbV0wnXmXjWSjcQGC7TsrWp12bbTdzgTwoQbP9Lle?=
 =?us-ascii?Q?NjdepG7b8ulMaLW9Cobg6AZJaPTWV/c0Gwo3EjYlhHFa0BjBesr8mYTUUvxJ?=
 =?us-ascii?Q?wPZKhw1jAHUAzHLJCyNb5GZ7qjYfDZxY4vB1jAPv3DippX7ZmSVDL03ZGW92?=
 =?us-ascii?Q?B5BMYrgPfFtJi2Nu6AjB12E6qqFltxiYO6N5wmqUshx0bLNI6v6euSJDuspm?=
 =?us-ascii?Q?V26ZbDO+GKo2laYDz89GpcUZpy05ymQcSdTiFcb+FONPWf+PsyBtMsetAteT?=
 =?us-ascii?Q?0JjbO96w7OEpslj3UlHQP/PDojh7cm65OaW5wqxoV1D4zTiEUPOgPVo3P0JK?=
 =?us-ascii?Q?WRjLPyT8CJZE+or52nCvn81S1xgXvE6PzwxJoRCSssiuZkA6kIhIPTai+Ah5?=
 =?us-ascii?Q?1wIkHHtO4q2rDVliyk8aXYjnYE1ktF4WG/ofxC2Qj7f1tF0OX27ycL0lPk16?=
 =?us-ascii?Q?vsmNIlPz55uW4gisVMVLSutgWY9h2PdCKB0g4SQbXB2DWooNl0QOD959go7p?=
 =?us-ascii?Q?CLmrlKWvIyLY+PdkJNJPpPyXJfoTWvWtOM4w36cRVD6P7jX2N6CMppyVQi84?=
 =?us-ascii?Q?F+F5u7dXmy8d3Dll3uUEBPk6cTuDW8KUeWJIs+GXTrhOdZKGhdZEN+iK0J2z?=
 =?us-ascii?Q?kb7L8c4l231bksqsrbTVwWQ+95OlxYLIVpxOYk7PcpPFFNhmEA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zMv/JhCD5G6Pxi/P7/NxhEqvYpGSPq9LylGorfusn/WcoDCctpTgLWmBajCu?=
 =?us-ascii?Q?ebf9PWVyJinMu4ITDRgEcuVfUR/YfnMXmAlEvakaBFUf0SpMVDlFTLNpnsYT?=
 =?us-ascii?Q?Yu54I86tqRHDIU194ycIFm7L3esOoptEWD2t/CA3zrTJQmEsDuitgs6aWHQP?=
 =?us-ascii?Q?25ks/760+oOXEtgf+lw4xEtRFmjQBQ60+s0dgXWb5za5+3pRl+/bv4MRi6iu?=
 =?us-ascii?Q?6SgJSnQa2IjTfQui3IQDreya2Xl2smDdrzgM+9aROMDxkNVRHOG1AlWpaqKb?=
 =?us-ascii?Q?Bpfrp1C+FUF89fgvnkWmUGC42CY5nMWWcryn8ZM9Zqxf6px5akGbAkqY86Ql?=
 =?us-ascii?Q?KEjPOQRaf49YoQJajlSmG+VRI89R6VFFFfBoBqfk9/Lh0rrZd2CvuinPUBjR?=
 =?us-ascii?Q?UmGwzbt5HkvrH4BGHDKViQrrThCWh+QIZy5/6a3uOH/dyyJRvsRFIm3SdbXS?=
 =?us-ascii?Q?nnv2LnZsoEbFO3r6PYavSVVuxZXo+daJ372SRGgeJv2HZ7EH2BuIHNH4uHvo?=
 =?us-ascii?Q?avx8L9wYcnb1UB5N+pKpCQ/0AX3Njo+ZARs90ytZxGP6t5pOaO0Uw+muin7l?=
 =?us-ascii?Q?qMr0+MOrBbZa3v8H4QK9bO8NThHvDqh0OAeQG3E5cicKXobRl1d8OYDSrnTx?=
 =?us-ascii?Q?uubp+sv22xQFlrMS6FcDmVVF5axDcMqSgk6XSBr6J2Cud/BoulrwkH8gir7J?=
 =?us-ascii?Q?Ubd50tXfrtAhb1XUKLsPE1T33H4HD6m3B/CCKauVb5XNUBBDboES4vd/ioP2?=
 =?us-ascii?Q?mc/bNnA4Izt6SZMin4ULbn5pgIteaoe9fSxJgPsQFIif3zKSIe3Mt9bZ9rDe?=
 =?us-ascii?Q?fVGK1jpz3CLEhsNrrXnJg5cshI0EwBfJUiD23G1079ISCvbmCPTqh187KjM9?=
 =?us-ascii?Q?NzTn0OljZhjKMgHLO81d4pyhKjVnYC1gLGXesGtBuXSnP+KjNhGAhNO3wnbV?=
 =?us-ascii?Q?4R0wO0QFEcZdMdqtUZCSzPJmRJPnakyj2wXIsg7JaBENL7udShs0oZS5DndD?=
 =?us-ascii?Q?KbMhde+go7IdWL9GV/rKFGNw4/SNxQUDJ7j9GWTUgslM3wGjVSZM/eYO4a9X?=
 =?us-ascii?Q?l64kAzp5xRio2ZAHaAcng9545KTRSOBii2c1tqfHZYl+/c3BHtBGRbwZme2e?=
 =?us-ascii?Q?JiEk7kInguq2N2uNZuNTdDMV68TbRVUyhUH2I37qpQnjsuUV+DcwKJomzsV5?=
 =?us-ascii?Q?Lc44I/8xIFlGlPjxDWmRwQVKaeuov7gW6WMXBwfoyQabWUrSbpm00+Aqw+ZQ?=
 =?us-ascii?Q?wFaYihYAWQertB0zE9XbZKNtTREK/bjGB/D+HCKn+WtrTUcs8sZSo0aqadvx?=
 =?us-ascii?Q?SaBUrSBNRlTnS+mSdGc5Z2r89a+40/2zFmB50ozY420kK0RFf4Dxo+Cwd5lP?=
 =?us-ascii?Q?eOwdK4L4ZPKtcittJif3w5nF3xH0c9K60oAx+5DJ/109DiVT0u7wdVk6RjvH?=
 =?us-ascii?Q?j/30BFslFr4RGEDMkK68yCNwUrfpd2XV6Fr9pj2uAin6JgsZlV0A5es77JIV?=
 =?us-ascii?Q?VC2oN6zrYyQrMcs1JazMmWtUHljrda3fpY6DCKOnqbTzXkSEbrkS7O0uBSyj?=
 =?us-ascii?Q?+WONvNbRmmx0KaV3G3Jx4yoPzHyquh8G0r4HYPpmPeJ5WrgJo8Fwkwc4Aj/C?=
 =?us-ascii?Q?Wd9SblmydqhZEv2UKh3NQ/s=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 214b1775-d35b-45e5-9124-08dcab845c93
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 02:00:15.7998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 58/F2Ky6RBSLT93hnk4TbYHeG9gvO2eQwMIOj9Rf8uN72I6IqggXQ16Q7UuMgXjPDletkso4Lt7MG/tyIfPlHF5h8LbH1KB3isgbq7p0BeOVdfjHxxmIK39UEtpiPs1E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8899
Message-ID-Hash: E22356Z4552PPJT4FKYKYEODSHEFYJFY
X-Message-ID-Hash: E22356Z4552PPJT4FKYKYEODSHEFYJFY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E22356Z4552PPJT4FKYKYEODSHEFYJFY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/atom/sst-atom-controls.c     |  2 +-
 sound/soc/intel/atom/sst/sst_drv_interface.c |  2 +-
 sound/soc/intel/boards/bdw-rt5650.c          |  2 +-
 sound/soc/intel/boards/sof_maxim_common.c    |  2 +-
 sound/soc/intel/boards/sof_sdw.c             |  6 ++---
 sound/soc/intel/boards/sof_sdw_maxim.c       |  2 +-
 sound/soc/intel/catpt/pcm.c                  |  4 +--
 sound/soc/intel/keembay/kmb_platform.c       | 28 ++++++++++----------
 sound/soc/intel/skylake/skl-pcm.c            | 14 +++++-----
 sound/soc/intel/skylake/skl-topology.c       | 18 ++++++-------
 10 files changed, 40 insertions(+), 40 deletions(-)

diff --git a/sound/soc/intel/atom/sst-atom-controls.c b/sound/soc/intel/atom/sst-atom-controls.c
index 38116c7587174..0c6ce403148f8 100644
--- a/sound/soc/intel/atom/sst-atom-controls.c
+++ b/sound/soc/intel/atom/sst-atom-controls.c
@@ -1333,7 +1333,7 @@ int sst_send_pipe_gains(struct snd_soc_dai *dai, int stream, int mute)
 	dev_dbg(dai->dev, "enter, dai-name=%s dir=%d\n", dai->name, stream);
 	dev_dbg(dai->dev, "Stream name=%s\n", w->name);
 
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(stream)) {
 		snd_soc_dapm_widget_for_each_sink_path(w, p) {
 			if (p->connected && !p->connected(w, p->sink))
 				continue;
diff --git a/sound/soc/intel/atom/sst/sst_drv_interface.c b/sound/soc/intel/atom/sst/sst_drv_interface.c
index dc31c2c8f54c8..f02ee7f48a2a4 100644
--- a/sound/soc/intel/atom/sst/sst_drv_interface.c
+++ b/sound/soc/intel/atom/sst/sst_drv_interface.c
@@ -487,7 +487,7 @@ static inline int sst_calc_tstamp(struct intel_sst_drv *ctx,
 			fw_tstamp->ring_buffer_counter);
 	dev_dbg(ctx->dev, "mrfld hardware_counter %llu in bytes\n",
 			 fw_tstamp->hardware_counter);
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		delay_bytes = (size_t) (fw_tstamp->ring_buffer_counter -
 					fw_tstamp->hardware_counter);
 	else
diff --git a/sound/soc/intel/boards/bdw-rt5650.c b/sound/soc/intel/boards/bdw-rt5650.c
index 3c7cee03a02e6..a5df4d3067d71 100644
--- a/sound/soc/intel/boards/bdw-rt5650.c
+++ b/sound/soc/intel/boards/bdw-rt5650.c
@@ -150,7 +150,7 @@ static int bdw_rt5650_fe_startup(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
 	/* Board supports stereo and quad configurations for capture */
-	if (substream->stream != SNDRV_PCM_STREAM_CAPTURE)
+	if (!snd_pcm_is_capture(substream))
 		return 0;
 
 	runtime->hw.channels_max = 4;
diff --git a/sound/soc/intel/boards/sof_maxim_common.c b/sound/soc/intel/boards/sof_maxim_common.c
index fcc3b95e57a4f..f520442bbb096 100644
--- a/sound/soc/intel/boards/sof_maxim_common.c
+++ b/sound/soc/intel/boards/sof_maxim_common.c
@@ -196,7 +196,7 @@ static int max_98373_trigger(struct snd_pcm_substream *substream, int cmd)
 	int ret = 0;
 
 	/* set spk pin by playback only */
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_pcm_is_capture(substream))
 		return 0;
 
 	cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index e5feaef669d14..778190cbe3dbc 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -671,7 +671,7 @@ int sdw_hw_params(struct snd_pcm_substream *substream,
 		return 0;
 
 	/* Identical data will be sent to all codecs in playback */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		ch_mask = GENMASK(ch - 1, 0);
 		step = 0;
 	} else {
@@ -1731,8 +1731,8 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 
 		WARN_ON(i != num_cpus || j != num_codecs);
 
-		playback = (stream == SNDRV_PCM_STREAM_PLAYBACK);
-		capture = (stream == SNDRV_PCM_STREAM_CAPTURE);
+		playback = snd_pcm_is_playback(stream);
+		capture  = snd_pcm_is_capture(stream);
 
 		init_dai_link(dev, *dai_links, be_id, name, playback, capture,
 			      cpus, num_cpus, codecs, num_codecs,
diff --git a/sound/soc/intel/boards/sof_sdw_maxim.c b/sound/soc/intel/boards/sof_sdw_maxim.c
index b7f73177867f4..b3d51d345964f 100644
--- a/sound/soc/intel/boards/sof_sdw_maxim.c
+++ b/sound/soc/intel/boards/sof_sdw_maxim.c
@@ -51,7 +51,7 @@ static int mx8373_enable_spk_pin(struct snd_pcm_substream *substream, bool enabl
 	int j;
 
 	/* set spk pin by playback only */
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_pcm_is_capture(substream))
 		return 0;
 
 	cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index 81a2f0339e055..c32c101e65b9c 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -83,11 +83,11 @@ catpt_get_stream_template(struct snd_pcm_substream *substream)
 	/* account for capture in bidirectional dais */
 	switch (type) {
 	case CATPT_STRM_TYPE_SYSTEM:
-		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		if (snd_pcm_is_capture(substream))
 			type = CATPT_STRM_TYPE_CAPTURE;
 		break;
 	case CATPT_STRM_TYPE_BLUETOOTH_RENDER:
-		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		if (snd_pcm_is_capture(substream))
 			type = CATPT_STRM_TYPE_BLUETOOTH_CAPTURE;
 		break;
 	default:
diff --git a/sound/soc/intel/keembay/kmb_platform.c b/sound/soc/intel/keembay/kmb_platform.c
index 37ea2e1d2e922..eab7b8223b51b 100644
--- a/sound/soc/intel/keembay/kmb_platform.c
+++ b/sound/soc/intel/keembay/kmb_platform.c
@@ -170,7 +170,7 @@ static inline void kmb_i2s_disable_channels(struct kmb_i2s_info *kmb_i2s,
 	u32 i;
 
 	/* Disable all channels regardless of configuration*/
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(stream)) {
 		for (i = 0; i < MAX_ISR; i++)
 			writel(0, kmb_i2s->i2s_base + TER(i));
 	} else {
@@ -184,7 +184,7 @@ static inline void kmb_i2s_clear_irqs(struct kmb_i2s_info *kmb_i2s, u32 stream)
 	struct i2s_clk_config_data *config = &kmb_i2s->config;
 	u32 i;
 
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(stream)) {
 		for (i = 0; i < config->chan_nr / 2; i++)
 			readl(kmb_i2s->i2s_base + TOR(i));
 	} else {
@@ -199,7 +199,7 @@ static inline void kmb_i2s_irq_trigger(struct kmb_i2s_info *kmb_i2s,
 	u32 i, irq;
 	u32 flag;
 
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(stream))
 		flag = TX_INT_FLAG;
 	else
 		flag = RX_INT_FLAG;
@@ -270,7 +270,7 @@ static int kmb_pcm_trigger(struct snd_soc_component *component,
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(substream)) {
 			kmb_i2s->tx_ptr = 0;
 			kmb_i2s->tx_substream = substream;
 		} else {
@@ -279,7 +279,7 @@ static int kmb_pcm_trigger(struct snd_soc_component *component,
 		}
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			kmb_i2s->tx_substream = NULL;
 		else
 			kmb_i2s->rx_substream = NULL;
@@ -378,7 +378,7 @@ static snd_pcm_uframes_t kmb_pcm_pointer(struct snd_soc_component *component,
 	struct kmb_i2s_info *kmb_i2s = runtime->private_data;
 	snd_pcm_uframes_t pos;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		pos = kmb_i2s->tx_ptr;
 	else
 		pos = kmb_i2s->rx_ptr;
@@ -419,7 +419,7 @@ static inline void kmb_i2s_enable_dma(struct kmb_i2s_info *kmb_i2s, u32 stream)
 
 	dma_reg = readl(kmb_i2s->i2s_base + I2S_DMACR);
 	/* Enable DMA handshake for stream */
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(stream))
 		dma_reg |= I2S_DMAEN_TXBLOCK;
 	else
 		dma_reg |= I2S_DMAEN_RXBLOCK;
@@ -433,7 +433,7 @@ static inline void kmb_i2s_disable_dma(struct kmb_i2s_info *kmb_i2s, u32 stream)
 
 	dma_reg = readl(kmb_i2s->i2s_base + I2S_DMACR);
 	/* Disable DMA handshake for stream */
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(stream)) {
 		dma_reg &= ~I2S_DMAEN_TXBLOCK;
 		writel(1, kmb_i2s->i2s_base + I2S_RTXDMA);
 	} else {
@@ -451,7 +451,7 @@ static void kmb_i2s_start(struct kmb_i2s_info *kmb_i2s,
 	/* I2S Programming sequence in Keem_Bay_VPU_DB_v1.1 */
 	writel(1, kmb_i2s->i2s_base + IER);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		writel(1, kmb_i2s->i2s_base + ITER);
 	else
 		writel(1, kmb_i2s->i2s_base + IRER);
@@ -474,7 +474,7 @@ static void kmb_i2s_stop(struct kmb_i2s_info *kmb_i2s,
 	/* I2S Programming sequence in Keem_Bay_VPU_DB_v1.1 */
 	kmb_i2s_clear_irqs(kmb_i2s, substream->stream);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		writel(0, kmb_i2s->i2s_base + ITER);
 	else
 		writel(0, kmb_i2s->i2s_base + IRER);
@@ -556,7 +556,7 @@ static void kmb_i2s_config(struct kmb_i2s_info *kmb_i2s, int stream)
 	kmb_i2s_disable_channels(kmb_i2s, stream);
 
 	for (ch_reg = 0; ch_reg < config->chan_nr / 2; ch_reg++) {
-		if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(stream)) {
 			writel(kmb_i2s->xfer_resolution,
 			       kmb_i2s->i2s_base + TCR(ch_reg));
 
@@ -678,7 +678,7 @@ static int kmb_dai_prepare(struct snd_pcm_substream *substream,
 {
 	struct kmb_i2s_info *kmb_i2s = snd_soc_dai_get_drvdata(cpu_dai);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		writel(1, kmb_i2s->i2s_base + TXFFR);
 	else
 		writel(1, kmb_i2s->i2s_base + RXFFR);
@@ -695,7 +695,7 @@ static int kmb_dai_startup(struct snd_pcm_substream *substream,
 	if (kmb_i2s->use_pio)
 		return 0;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		dma_data = &kmb_i2s->play_dma_data;
 	else
 		dma_data = &kmb_i2s->capture_dma_data;
@@ -713,7 +713,7 @@ static int kmb_dai_hw_free(struct snd_pcm_substream *substream,
 	if (kmb_i2s->use_pio)
 		kmb_i2s_clear_irqs(kmb_i2s, substream->stream);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		writel(0, kmb_i2s->i2s_base + ITER);
 	else
 		writel(0, kmb_i2s->i2s_base + IRER);
diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
index 613b27b8da134..2ffd511eedfe4 100644
--- a/sound/soc/intel/skylake/skl-pcm.c
+++ b/sound/soc/intel/skylake/skl-pcm.c
@@ -189,7 +189,7 @@ int skl_pcm_link_dma_prepare(struct device *dev, struct skl_pipe_params *params)
 	snd_hdac_ext_stream_setup(stream, format_val);
 
 	stream_tag = hstream->stream_tag;
-	if (stream->hstream.direction == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(stream->hstream.direction)) {
 		list_for_each_entry(link, &bus->hlink_list, list) {
 			if (link->index == params->link_index)
 				snd_hdac_ext_bus_link_set_stream_id(link,
@@ -225,7 +225,7 @@ static int skl_pcm_open(struct snd_pcm_substream *substream,
 	 * disable WALLCLOCK timestamps for capture streams
 	 * until we figure out how to handle digital inputs
 	 */
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+	if (snd_pcm_is_capture(substream)) {
 		runtime->hw.info &= ~SNDRV_PCM_INFO_HAS_WALL_CLOCK; /* legacy */
 		runtime->hw.info &= ~SNDRV_PCM_INFO_HAS_LINK_ATIME;
 	}
@@ -319,7 +319,7 @@ static int skl_pcm_hw_params(struct snd_pcm_substream *substream,
 	p_params.host_dma_id = dma_id;
 	p_params.stream = substream->stream;
 	p_params.format = params_format(params);
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		p_params.host_bps = dai->driver->playback.sig_bits;
 	else
 		p_params.host_bps = dai->driver->capture.sig_bits;
@@ -574,7 +574,7 @@ static int skl_link_hw_params(struct snd_pcm_substream *substream,
 	p_params.link_index = link->index;
 	p_params.format = params_format(params);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		p_params.link_bps = codec_dai->driver->playback.sig_bits;
 	else
 		p_params.link_bps = codec_dai->driver->capture.sig_bits;
@@ -645,7 +645,7 @@ static int skl_link_hw_free(struct snd_pcm_substream *substream,
 	if (!link)
 		return -EINVAL;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		stream_tag = hdac_stream(link_dev)->stream_tag;
 		snd_hdac_ext_bus_link_clear_stream_id(link, stream_tag);
 	}
@@ -1193,7 +1193,7 @@ static snd_pcm_uframes_t skl_platform_soc_pointer(
 	 * or greater than period boundary.
 	 */
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		pos = readl(bus->remap_addr + AZX_REG_VS_SDXDPIB_XBASE +
 				(AZX_REG_VS_SDXDPIB_XINTERVAL *
 				hdac_stream(hstream)->index));
@@ -1226,7 +1226,7 @@ static u64 skl_adjust_codec_delay(struct snd_pcm_substream *substream,
 	codec_nsecs = div_u64(codec_frames * 1000000000LL,
 			      substream->runtime->rate);
 
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_pcm_is_capture(substream))
 		return nsec + codec_nsecs;
 
 	return (nsec > codec_nsecs) ? nsec - codec_nsecs : 0;
diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index 602ef43211221..cb51b98b92c9a 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -198,7 +198,7 @@ static void skl_tplg_update_params_fixup(struct skl_module_cfg *m_cfg,
 	in_fmt = &m_cfg->module->formats[m_cfg->fmt_idx].inputs[0].fmt;
 	out_fmt = &m_cfg->module->formats[m_cfg->fmt_idx].outputs[0].fmt;
 
-	if (params->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(params->stream)) {
 		if (is_fe) {
 			in_fixup = m_cfg->params_fixup;
 			out_fixup = (~m_cfg->converter) &
@@ -618,9 +618,9 @@ skl_tplg_get_pipe_config(struct skl_dev *skl, struct skl_module_cfg *mconfig)
 	}
 
 	if ((pipe->conn_type == SKL_PIPE_CONN_TYPE_FE &&
-	     pipe->direction == SNDRV_PCM_STREAM_PLAYBACK) ||
+	     snd_pcm_is_playback(pipe->direction)) ||
 	     (pipe->conn_type == SKL_PIPE_CONN_TYPE_BE &&
-	     pipe->direction == SNDRV_PCM_STREAM_CAPTURE))
+	      snd_pcm_is_capture(pipe->direction)))
 		in_fmt = true;
 
 	for (i = 0; i < pipe->nr_cfgs; i++) {
@@ -1612,7 +1612,7 @@ int skl_tplg_update_pipe_params(struct device *dev,
 	if (skl->nr_modules)
 		return 0;
 
-	if (params->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(params->stream))
 		format = &mconfig->module->formats[mconfig->fmt_idx].inputs[0].fmt;
 	else
 		format = &mconfig->module->formats[mconfig->fmt_idx].outputs[0].fmt;
@@ -1642,7 +1642,7 @@ int skl_tplg_update_pipe_params(struct device *dev,
 		return -EINVAL;
 	}
 
-	if (params->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(params->stream)) {
 		res->ibs = (format->s_freq / 1000) *
 				(format->channels) *
 				(format->bit_depth >> 3);
@@ -1666,7 +1666,7 @@ skl_tplg_fe_get_cpr_module(struct snd_soc_dai *dai, int stream)
 	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(dai, stream);
 	struct snd_soc_dapm_path *p = NULL;
 
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(stream)) {
 		snd_soc_dapm_widget_for_each_sink_path(w, p) {
 			if (p->connect && p->sink->power &&
 				!is_skl_dsp_widget_type(p->sink, dai->dev))
@@ -1745,7 +1745,7 @@ skl_tplg_be_get_cpr_module(struct snd_soc_dai *dai, int stream)
 	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(dai, stream);
 	struct skl_module_cfg *mconfig;
 
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(stream)) {
 		mconfig = skl_get_mconfig_pb_cpr(dai, w);
 	} else {
 		mconfig = skl_get_mconfig_cap_cpr(dai, w);
@@ -1813,7 +1813,7 @@ static int skl_tplg_be_fill_pipe_params(struct snd_soc_dai *dai,
 		goto err;
 
 	dev_dbg(skl->dev, "%s using pipe config: %d\n", __func__, pipe->cur_config_idx);
-	if (pipe->direction == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(pipe->direction))
 		pipe_fmt = &pipe->configs[pipe->cur_config_idx].out_fmt;
 	else
 		pipe_fmt = &pipe->configs[pipe->cur_config_idx].in_fmt;
@@ -1903,7 +1903,7 @@ int skl_tplg_be_update_params(struct snd_soc_dai *dai,
 {
 	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(dai, params->stream);
 
-	if (params->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(params->stream)) {
 		return skl_tplg_be_set_src_pipe_params(dai, w, params);
 	} else {
 		return skl_tplg_be_set_sink_pipe_params(dai, w, params);
-- 
2.43.0

