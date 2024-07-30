Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4696E940411
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2024 04:05:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8993F857;
	Tue, 30 Jul 2024 04:05:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8993F857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722305130;
	bh=o/ekUqVkHHxLEc6bkTX4tXaKxOW4wrz6LoUxOmjHShU=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vJm4X+0p3IO7z3P6ehSdR0TWBqBjAsfn+oUGG4QvQyeETf+Zlw9swMFJ8fhPsku93
	 cY03PSru8+xIVpPUlEZuMkht4+UDrk4tDytHAGPOwByCIrJJakm5hlYJ5OJmNK4GNx
	 /AsiEub2pdepjbeQ2jhjZbKhgEl+Gcg31CqaSFZg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B36CDF80589; Tue, 30 Jul 2024 04:04:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B45FF805B0;
	Tue, 30 Jul 2024 04:04:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D977F802DB; Tue, 30 Jul 2024 04:04:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D81C4F800E3
	for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2024 04:04:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D81C4F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Wt3TTpkm
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EpgfRhhudbkHpryuszEZe0X1jFsJhhLto0iSqFWBEyiChWDO8P3exKUrL0bmzoIL2qm/z90FeFoNLkbmwDZc4CIAPvetGAztkWoZrF/wbv8jfQYglIdK3UFIekVEp3watfN9aUTZutRUF1JLI3bfM6Ha08odQ9vMkAAyAx+HKWS1P/XgRUBnVULO4EGB75SwM/Vw+Ci3GYEWmBKTpbFvuwtXGDEEEhV+pF9GLZNyhcK+Ct2D2xEy6EUzKkQVgXxkwWFWMyZ3NbnprdonS+yPpphnoZo2QuNRH2bGpAF5kwSJEKIKZg8lffwf5eQl4XHX7Qx8WcK8r/AqqmSiTxdGvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fqpk0CP6Po51NuRG7XnqMgbc+drwNBmMy1E4WlPieJ0=;
 b=dBEuXV+K7/gENB5o7Muh03QKDEaHGzTDzjTKoKRqvg8wwUDYrCGgrEcKBvCJLnHsJluJxWt1/ow0kDmRj4XIalgutAyDLoQ9bL+OzF4e+SOXkHqphqPSu82+y0wzOXBzjyH/Rm0LrfWoUNkja7XoTH7fK9vSnYmpuxkmHE8YiWR+0l7XGWilAOS3KeSmZLHA51wJJ4bvDh8exyNZ5FvRuyj+oiNlxQGu64jHNjOfJkchr7wJgLoU0O4xHQ8gqhB4jT08Z7ELF/yXgrsvV+oCPN60YHdAPW9ZRIChUwA0f55PIk6GyOPJcCTOePtrrK7EsZHy+Y3W4skDzFRWdQSVCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fqpk0CP6Po51NuRG7XnqMgbc+drwNBmMy1E4WlPieJ0=;
 b=Wt3TTpkmoreMYKo45k2vWMQfNO50UhEI+n0/4b7stMYg4A7L/qINHspWl++Vs+15B/cbhkVd02HYBoJ1vnTjvxgGrFUYgSewEqpS4yCuNirf+ePGeHKACdqAQHBfAk6UI+LmARy85P9L4BEFvX87ZB8xUBLZWALa3P35vhpVQa0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9786.jpnprd01.prod.outlook.com
 (2603:1096:604:1ec::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Tue, 30 Jul
 2024 02:04:43 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 02:04:43 +0000
Message-ID: <87wml3k539.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 00/12] ALSA/ASoC: use snd_pcm_direction_name()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 Jul 2024 02:04:43 +0000
X-ClientProxiedBy: TYCP286CA0288.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9786:EE_
X-MS-Office365-Filtering-Correlation-Id: 934d22ad-b88c-419c-5c23-08dcb03bfa87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ROcBLZDZvB4LUxGh/mzdQKQBHdu7fRDfavznXf6TS9I80HrKylNr8obf03nf?=
 =?us-ascii?Q?j1cfW3nM2+tG9GMNw2n2jMvyHB1f5hNFdqY1ZBFz+X9b216ynxTnd90cBrLI?=
 =?us-ascii?Q?NRiNTvNRhT7mXsavMZEauikIIu38hdINoC5tL3UZILv8jHxxxB5+4dMywcgz?=
 =?us-ascii?Q?g62AU5R6bQprl3thWnBLZeovRdtRG7fseuycXiBe5wo7iWuyUp16+0wEB80B?=
 =?us-ascii?Q?IVwp8xWaiOkZG3iybZOR40RfoWlbeGuw7VCCTAWkBqUnXrjXs2T7BwwCl106?=
 =?us-ascii?Q?l4oygE8MPhV3GT7lYq0zuDOQmeDMCsfuWRCDbwMl7HNozn67WigHelc9zyke?=
 =?us-ascii?Q?3Qo3o0aARHxqTJyK3+as04WiVCsOYqVkJGOpqNShD7kv2EgD/kl7IVOpN2gM?=
 =?us-ascii?Q?DJGz805HKZIQvdp857qqTGaR0APDged2C0/uR4zMsPqA8Y3IUU7BKVsgoW5K?=
 =?us-ascii?Q?hu06euMSspLPW+1MENTVgh24BOq3pj6SDyLezkHUW1BSiS6/AN0x3/iYkrO2?=
 =?us-ascii?Q?GJJhSLFvhOODhDxORJR/7avWJYFGVHUVCyDxafid5Qagcdg3lPj/RiXW3XgL?=
 =?us-ascii?Q?IzMKIw8XUPCTtpVxaNPOGkxwMmPEmKNIiuX7gp4U0MUDfpmlOuSAE66CVxOQ?=
 =?us-ascii?Q?Ke1LVtiFUdMUE0kePUxJOAOWU0JKjvKyenN7r/CT7TKtXr4Y1ed5Nug2fBBw?=
 =?us-ascii?Q?sYePGjHa/8JTTG+be5K+iLqU7zkhw0dkZoguUy1Ko1pn7CfN6nDTVTQusO0f?=
 =?us-ascii?Q?ktE9/EZMhpPRZwhMAfCOVxTTV0g4cJHPmi95mWyiKA0Tuidj4rbY69us5xiD?=
 =?us-ascii?Q?QikS8GTU/sxaZKZfTI+aIfr608Y+1bATboAHNHVICJT1/xDjvQR3TH9h3KzL?=
 =?us-ascii?Q?a2IAGhkMHJQenfYa5jMc94u3yxYGy7bjnkbilbHvDi4OBJC3C2K1BfRlDkmh?=
 =?us-ascii?Q?5nhsCpXdIc6I6yQvyRVHggY9dkSd4ahjRc/NcSxahrbYGtbABwNa1Z1P5lNs?=
 =?us-ascii?Q?RcOrKcVhpK6QCE3ev/XtUKe5KVxSpJEDaR2lA7+0cenAYUpiwPhyQeW6UCTn?=
 =?us-ascii?Q?I89PEn5rXu/RX6tZvafi84DujSmoDYgQmbXuOqwq9kVzzF6D+u1VC5y35nKY?=
 =?us-ascii?Q?jbiApTzxPzWAOoGpXPnNj5EoaF5RP78sYhqmdWKJeqMQamvlqY5UemYzanrR?=
 =?us-ascii?Q?nn7VnFuMTw8HSrwgohoWWxkvU3eR/QCRDG5bAj+j+uSXgkmYq7Wmr46B/U4X?=
 =?us-ascii?Q?l/LCv4VN2fmYCgui2yFklR7xsF75CXj8zmjYkzrZweho8dy5RPsFqp4D82BT?=
 =?us-ascii?Q?reKD/HpXWD1gKD8fMe7zQbNf/BWHfeLGQoPk+CcnmTbfZ9X6DBDaA4FnV6jF?=
 =?us-ascii?Q?8rHUzLcDGzxuwBEsAFko15MHSHIc7EWMMdB0SM/Zw9Yj8mcpug=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EEDuVbT+EVlC3GdoSybsiiwqzEIdy5YUbAe79IopP1xp5+jUyqYP+a3TcLG1?=
 =?us-ascii?Q?o0xG+x9rxzjn/pDkEiHJ8Lsn7B+qR99XGHIkMdFZ5OmB1KN39lHleRA3S2sA?=
 =?us-ascii?Q?dI5yS4yFoe0HJ/x6PcLql0jGycrk8ZSn+aUwRJYKvXXbgD0cLmEGxCb0iZAP?=
 =?us-ascii?Q?brHkK5HJkWC4YiPANOJu5OlaHaekoHgi3hsAGEe4JZRG9goR6N8r5U6JOfWk?=
 =?us-ascii?Q?RTHZlemPUcK/Gg16kb+BCTNSV8ubcaPXyyO+UVskRcKMdehrm3eI3eXiMqXX?=
 =?us-ascii?Q?WH7YpbigHiz0wViur4hkMkFUbB2M2kDL4bd4m5OBvmPfUS3MYt0zTK3w40A7?=
 =?us-ascii?Q?9mj7XvsvQkOgGz+XtJR1WYqxenSmZzunKWnXSEEkaN9/PpCZTS00x/muMj6g?=
 =?us-ascii?Q?a7gKEyrmoIUQnQi0qBJYn/9A06lnmFfPJ8UWaIEWFlxsy4Hi8lCy3NKgGzbo?=
 =?us-ascii?Q?GEbnfqCj3zBgSKPGnZrJz8bylM/fuGvajVOVn4O8xJHZkd98MCupN7ZlFVKo?=
 =?us-ascii?Q?AyW3VjbolGIhKPGFk5+9JX9RmrmL5KcCDQe2/Y79jaTR4Yc4z6nnYRWLOkOi?=
 =?us-ascii?Q?qPWkGQAb5POorBmUjnZSKXsufkwhMeoGE4kF+kCRj7AD0M4JwRwQNjPJ5af2?=
 =?us-ascii?Q?bXmpwKMTSZ37niFVgcdVK0uudGQkfWue4qI7HR1l1n3aqllV4T4qkhqMTabt?=
 =?us-ascii?Q?xvBDZwGNHKhSxYA9OaR6flN+O9hnIls2aK789VL+egYPvMC6zQTgnkkPih5S?=
 =?us-ascii?Q?MOKGKecr3P/MXdWeOJJeYKCCIc1pVjd/8u8H1aMPOodEEdbeMs3jebRmb19j?=
 =?us-ascii?Q?ZMi+wnriCCl+kcJycdb/ipAHncSRvx7tSVdbiEGFu4qLBxo2EhcF1ERd/JAG?=
 =?us-ascii?Q?0qKFC0bo7Q9uwDIfq0bi5yAwUtgP4zLYIyZpo/GvfsCVesKSMoXNg1jz2Ikz?=
 =?us-ascii?Q?RN8Cc1IIzDnWZ1KlDsLS9Az8VWWOm1ka0HaV0VAZCvT40IjnnT7wTszXrFjB?=
 =?us-ascii?Q?ySssAcvL7KpFVP2cgPTjaR1z1Ujr0SRh4sVuYGhbRkZ5ODirBNQZ1A/JzjOz?=
 =?us-ascii?Q?NXL3sGQwFIEMyJDjsHe+pKQlmlDBbtEMmbzK67t32wqwQY26drW6Y4SwgiAM?=
 =?us-ascii?Q?bYY1fC0+Yk4LOtqtho/hGurKxubFZo5IM7+oYh6C0plBOSIEClwaOyw7w3sZ?=
 =?us-ascii?Q?RIYUHoAUO/j4axtL2t9BwgOZ02hwH2cbw02BoiOhS7CQOh1b28gThf6HtgXH?=
 =?us-ascii?Q?+3hRcYz/yfs9X+Ylu7zrl3M9WcIKAS10ZzGZgo0S5goBxzc6Up7AebBzL9p2?=
 =?us-ascii?Q?boc6Y1Hzaoja0mszDSI6GLYFJhj/GvcNrq6CDpW6bBZcpQS0s4HfP1YZLnel?=
 =?us-ascii?Q?WXTkPPoCCLuW5u3/nJTXHQzSF31RWRTJoKiPgXOpnqihiDnOAeM+UqU7BVYy?=
 =?us-ascii?Q?uQr5EM3ZD0vXzhI21aOES/QHB+El+UYLWHfC0KVPPJZKH2lNdHH2i2D5Rsdh?=
 =?us-ascii?Q?HLd2EpxqH3M/fxxDUR8CMpn06gZboomc+rJt2uW7E+ZvFbJsWEUSGbmDpwaN?=
 =?us-ascii?Q?lup4GCzDVS8d53GVOnmxA+Dp/zJ8eM1E610mJKA5aNvGQdDrueyxGrxp+3I2?=
 =?us-ascii?Q?D923hO6HF7F0FUJB66mUo8c=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 934d22ad-b88c-419c-5c23-08dcb03bfa87
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 02:04:43.3830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Hyg3O/tnNhVPI/OCEy15BLZBeoc2QXHJScTOB9aSTk3BGEIDxMYOsP452f2IlSe+6bB5R3F8dIcDCiEsmq07LDK4HE7PvbFssNgkL7biv1DottBKZuuMMrd8y+5KWxZE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9786
Message-ID-Hash: QREWEPVJBHBSNDHDHS3ALWMQCDI7RBSO
X-Message-ID-Hash: QREWEPVJBHBSNDHDHS3ALWMQCDI7RBSO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QREWEPVJBHBSNDHDHS3ALWMQCDI7RBSO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Tatasi, Mark

Many drivers are selecting strings "playback" / "capture" by own
handling, but we have snd_pcm_direction_name() function for it.
This patch use it.

One note is that snd_pcm_direction_name() will select
"Playback" and "Capture", instead of "playback" / "capture".
Almost all drivers are using it as dev_dbg() or dev_err()
so no problem. But some other drivers are using it as other
purpose. It might be issue (?). For example ASoC debugfs dir name
will be changed by this patch.

Kuninori Morimoto (12):
  ALSA: pci: pcxhr: use snd_pcm_direction_name()
  ALSA: pci: rme9652: use snd_pcm_direction_name()
  ALSA: trace: use snd_pcm_direction_name()
  ALSA: aloop: use snd_pcm_direction_name()
  ALSA: pcm_timer: use snd_pcm_direction_name()
  ASoC: stm: use snd_pcm_direction_name()
  ASoC: sof: pcm: use snd_pcm_direction_name()
  ASoC: sof: intel: use snd_pcm_direction_name()
  ASoC: fsl: lpc3xxx-i2s: use snd_pcm_direction_name()
  ASoC: tegra: use snd_pcm_direction_name()
  ASoC: soc-pcm: use snd_pcm_direction_name()
  ASoC: soc-dapm: use snd_pcm_direction_name()

 include/trace/events/asoc.h      |  3 ++-
 sound/core/pcm_timer.c           |  3 +--
 sound/drivers/aloop.c            |  3 +--
 sound/pci/pcxhr/pcxhr_mix22.c    |  2 +-
 sound/pci/rme9652/hdspm.c        |  6 ++----
 sound/soc/fsl/lpc3xxx-i2s.c      |  3 +--
 sound/soc/soc-dapm.c             |  3 +--
 sound/soc/soc-pcm.c              | 30 +++++++++++++++---------------
 sound/soc/sof/intel/hda-stream.c |  4 +---
 sound/soc/sof/pcm.c              |  2 +-
 sound/soc/stm/stm32_i2s.c        |  4 ++--
 sound/soc/tegra/tegra210_i2s.c   | 16 ++++++++--------
 12 files changed, 36 insertions(+), 43 deletions(-)

-- 
2.43.0

