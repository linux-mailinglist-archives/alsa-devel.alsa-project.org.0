Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CD779B21D
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 01:58:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2E18ECD;
	Tue, 12 Sep 2023 01:57:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2E18ECD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476686;
	bh=coA9QPdtjCkBGaQJkWT8b4JPoxiq+2Mp80xdlxFHSj0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kDZfp6OezeLpw0C5h/dODxhASjrAXuXy8XvzXBLLAGbFd2AUx0nnTYo8BgS51WUOe
	 fxrOb+oY62LTVCO0D7cYmujug9skjWI4gxwoHtflj9FdmdpDe5UgZBvx7EOBHo9TWj
	 2AyKN5uWiue0Y5Y8TN52R/VikJp/2R4Ms3QK/3O4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CC12F8059F; Tue, 12 Sep 2023 01:52:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3560BF8059F;
	Tue, 12 Sep 2023 01:52:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14239F8059F; Tue, 12 Sep 2023 01:52:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2072f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::72f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6F493F80431
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:50:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F493F80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=mhDVeOe4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KWwnbfghDEUGjPSQE8Fc0BE23x4ECQNbkE5QWwD4vf0poR+xcymlc1WAtI69tZGe4EvVi8zPU4v/XuUVB6Vvmlv0UwvRiHz6sDA3zLrfo91qnTsybYlBP7859qOhj5WzBLTdpIwJDg5kqpWPL/K2FO4wV7G5k+G6NEpWq+wjCkdvtqMfqumkwgers4y9we5me7kHkT0WRXxKxWG+KYUbGAzc3JLE9lndo/xkuNiNqR6BpR/UOJV9GCifPAEqr5xoLvA6gevW/HLNxCnu8h6efmo54EDSxHlNxHnmhqYmXud9yLS9MdbBtA5tLmLtZjemrG3brUiO72PWPFv5VyJd9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bRS34VjWYGJDkpRdsTJU7OBGFaL6JbJEuRLEaQypjbs=;
 b=Xquzk+g2Sp9vC2kbwKtb1Feff+Um1sWIw6qqa7XoZ3l40+AyMGw1VQPOL6ajTWXKNgGYrpU21HW6L3kC5viL6yuIF6TUxsEmG+JpM6EGizGPctqDbw61BdaOIeJJgX1inUCRSOVGtbseaNrd/tZ+nDKkYzqkfwTdsfFYkM5LiMAuuyYD1sN/L5rODx3ucP05i7nZ+nwiuJiwmyn3BbqW0ZdZmmnqWrmBCk1rR1zjNJsU9h5XpEyl9wTANZYTwkzo1DkIwEgxvAcGZS7DlE+L8q+mofeszRICSGi+hGq/4gygDtj1OJEG+VxH8yAE//GOEBbvWnTs7tylGQ/C1cvPHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bRS34VjWYGJDkpRdsTJU7OBGFaL6JbJEuRLEaQypjbs=;
 b=mhDVeOe4ZuL+qX/RbPZoNU3e/gugou196dVxcmXOxv9IwyrLqR3pY7faYShVmsVLkktEsYrXfZS+0jjxBu7KkAgu5VQ62B0F1sQtiWYIoKG+H3FX1l3F4mMEABOVGlyYgi8NNcaYvvhvUV2r2B8y/vbD7OKZ9ni3ygs7Jjti/+E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB9445.jpnprd01.prod.outlook.com (2603:1096:604:1ce::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Mon, 11 Sep
 2023 23:50:41 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:50:41 +0000
Message-ID: <871qf4qnfz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?UTF-8?B?IkFtYWRldXN6IFPDhYJhd2nDhYRza2ki?=
 <amadeuszx.slawinski@linux.intel.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>, Cezary
 Rojewski <cezary.rojewski@intel.com>, Jaroslav Kysela <perex@perex.cz>, Kai
 Vehmanen <kai.vehmanen@linux.intel.com>, Liam Girdwood
 <liam.r.girdwood@linux.intel.com>, Mark Brown <broonie@kernel.org>, Peter
 Ujfalusi <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 36/54] ASoC: intel: avs: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:50:41 +0000
X-ClientProxiedBy: TYCPR01CA0179.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::14) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB9445:EE_
X-MS-Office365-Filtering-Correlation-Id: 9629d117-0dca-4d54-57b9-08dbb321e85d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Q8xs61/IBlGhogaE72vTy8q2IA3GWLe88GhzMv6unY4Rqb0AmcRRSApKDlVNMTwlyL1cJotPIL8B7zGKDoAlLqX25z2SiGbyPkpRcGDcCxs58O2UWXZztCxsMp5yZn1x59mO9NGyMG4XtuzqTP9yvUGf24ZCu+2ExP0BXj8izz4RsMi9zQNB2ioDkuAMcz+0Kz+h3fwD7ys/PKRr6EO9a273nECGK7sgk0KCH7BcupD/d8uCx285xLWwP5Z0CijkqjCXujeTNGJ1FicvrUFGGfsxVKIPhbs3bhj1bDBRZak8m2Hq9c5iNKNV+xULNQWcQrC2jCyaN4oeKBE725zyDaAnyM0KFbNHqNGM/yCM1XhaPadCtlCZLqVkJMQdjvVMEVXX0yr/q4kze7xYENk6E4w/o5Up0C5bfLZxip3SNcz2WmJ43lRJlkZg/634bioZWUgs5w0tQ7sZi3NQUOpPwlMZmnWIIKFL8jmAfPDk54ypt4jlImbcvmoDvW+G8KMjZYUGphVk0UQwAgPBDITQPFPAfqm6NewMbnbd0kvTIcC15opqs8ogJIGeHG1v9MTeUVkeNF+hlQXoOb0jvBXkI4xP79aoxlOuM8N7HfOZuqWT61iVnoeUxGEuI8y4m92NqLRIbUTVcCVBQ8hQ/ZcJVPI8e+kqqFNj+2rHTdB2T9E=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(136003)(39860400002)(396003)(1800799009)(186009)(451199024)(83380400001)(66556008)(110136005)(38100700002)(36756003)(38350700002)(86362001)(316002)(66476007)(66946007)(8936002)(4326008)(8676002)(921005)(41300700001)(5660300002)(6506007)(6486002)(52116002)(6512007)(7416002)(2906002)(478600001)(30864003)(2616005)(26005)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mOGWpgGGYSjsWo7c5CODwXqM54gAqjTcy2+Vy5uQmPekILo0NAfTBxyzrqzi?=
 =?us-ascii?Q?7AEUNILUHm8I4KaqWxS4gOOf7mLDAjVYJOM+e1OsbQye5GAs52xR+NRbCI9t?=
 =?us-ascii?Q?G+eiO+aurHTEaXLSt+Kc3W08eXTCkIj9uURoByANdcKadXlObZaPCIm1YMLx?=
 =?us-ascii?Q?2R47rBHgh7rvfUVehFoI3ry2Z0okAmRGEYVFz5G2NoRs1yMvhP2J1gXtfJpV?=
 =?us-ascii?Q?qo5MZ1teYjbwIdWyoieieUAOBXiYjELvYR+smtqO6BF2XjszpKGf0UX2htVZ?=
 =?us-ascii?Q?YsyQuKDm3YUD2Gnh1ZE6q52x1Dd19lH5Zu1+XbdJu8/pBEvDIQbrG22NYE4j?=
 =?us-ascii?Q?ull644+vCdxbj2MC/ebt/yQTbnWzvlExm4jmmQOD8dYPLSVGco6hF4P8w0ol?=
 =?us-ascii?Q?HcpTqS+Lt6NbpMoPIRtwYqD//wsTo+qZGrcPvJUonFam9ldID8qn/cEe/nfj?=
 =?us-ascii?Q?VeBDh4iAIJdnWXfde1BnErIHTJllbetuvaP+yqp9iSy7scPxM4UD0qDjGuAw?=
 =?us-ascii?Q?em5nDvTjnUicAlJyUwPKmKg46KYMrs1cTFUHo81mxsP7RvQ7SIIi8GugI9lY?=
 =?us-ascii?Q?w4+DcXxNUC8aqEBCy72T8z4uYC5rlC+OJxvzpslY6G4qbsmP+lDawQtNhqza?=
 =?us-ascii?Q?wrTca+a/3PQ/EKl2xBZP0D7KSd84PZaO9gouUbFb8hNI0OtvqrSAhhFIv9oT?=
 =?us-ascii?Q?8rsOHUkwe5erI2ai54177Te2qM9eAJ52f1OVLL7e8DEhNr4mkPtnMMpOnZxz?=
 =?us-ascii?Q?ohFo9WJBNuJSXU/0X1Vz3dheo4syo4OCKYeX8VcFMjKP7v0joHLTaiQ9Ljjg?=
 =?us-ascii?Q?iiPhsFAv+K2BqUCcx3PFkF4HN4SbRQ7CfZmfQ1Y3iK3KT1QKRcbTNbq75auS?=
 =?us-ascii?Q?Iyj1Vp87LRVzuBmelEuZY3rQKVmGb9sULCynciY1dvOGG0ciZQy3VWiqyvnQ?=
 =?us-ascii?Q?0MuqKmDh/i5yiL5nT2GuwWKJF0d0YHxOVS5VlAYlwVfpDedzk4fbMo3HLo+w?=
 =?us-ascii?Q?O+07nRRSBHfN1TcS2mj9iEZZxvi7iRM+m7vXGO4LXtEh+RZhbjJSMbwLKvhZ?=
 =?us-ascii?Q?yifYCyejYWwQ61FEXax6Wbr8A+LvugrsyYn0ov7ER4E7HXrkHTMb2tl4TDJw?=
 =?us-ascii?Q?AaUknNuiYQKhoHINdwjt9Vbi6PMSAjg2X3OeP4ZQMO2Ey1IwGSLY6+InvlG8?=
 =?us-ascii?Q?GUbcSTXQ2UK7fQ1USQVsLAK+ro6OI9rbRkhHe/M9FOGEXtgMZVExZamMK0VT?=
 =?us-ascii?Q?DhRnyMidXrdve49n5qo9vuOex733dUAYu8FC8ZoI3xu1GD4sMQHUEpPH+Hob?=
 =?us-ascii?Q?z+hP1QCOePmLa71pOX4t2NETUzCOeiYdwV9InE+kXLmiHHLWlZD5M7AptxqR?=
 =?us-ascii?Q?Z5ceh65trp35W/g+ivAyvSg/gOTfvfOv02DlSCk6llJoAJ8xUKsZRLOTLDJM?=
 =?us-ascii?Q?c12oOwoWfjXFSoDpmt5b5StdKg3SUsvmS1xzM8/Icc5pR3yL3kz1y5Qwf0uN?=
 =?us-ascii?Q?09Ds7o5TxknqAmy/qwp4nuswr4GTgw9Kjgf8v1wLf1BPhXw8KBShd9c9+YOP?=
 =?us-ascii?Q?u5zCqZ7su0EeHoYYpDlyH/9xSSIqDdpEOOIZMfoDHumNJ0k0wk+CFnuDMH6P?=
 =?us-ascii?Q?WcUeKa58ehKbIPe9CjbzxQ4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9629d117-0dca-4d54-57b9-08dbb321e85d
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:50:41.8045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 squFzTvTObb8Os3uV1yA7WaI/CsqHyBJMmlWieM4+wR3Bc0prebo8SzPp5RDknDG4tfbhuAojJABoCeUEExpCQIePJcV3mEtfdfkjtbk0zEiJ30F++VT6acteRBTeviK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9445
Message-ID-Hash: HZ2PZYGWQYKPTVPN2VJAKL3RN2D5DD45
X-Message-ID-Hash: HZ2PZYGWQYKPTVPN2VJAKL3RN2D5DD45
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HZ2PZYGWQYKPTVPN2VJAKL3RN2D5DD45/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is now unified asoc_xxx() into snd_soc_xxx().
This patch convert asoc_xxx() to snd_soc_xxx().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/avs/boards/da7219.c   |  4 +--
 sound/soc/intel/avs/boards/es8336.c   |  8 ++---
 sound/soc/intel/avs/boards/i2s_test.c |  2 +-
 sound/soc/intel/avs/boards/max98373.c |  2 +-
 sound/soc/intel/avs/boards/max98927.c |  2 +-
 sound/soc/intel/avs/boards/nau8825.c  |  8 ++---
 sound/soc/intel/avs/boards/rt274.c    |  4 +--
 sound/soc/intel/avs/boards/rt286.c    |  8 ++---
 sound/soc/intel/avs/boards/rt298.c    |  8 ++---
 sound/soc/intel/avs/boards/rt5663.c   |  8 ++---
 sound/soc/intel/avs/boards/rt5682.c   |  8 ++---
 sound/soc/intel/avs/boards/ssm4567.c  |  4 +--
 sound/soc/intel/avs/pcm.c             | 44 +++++++++++++--------------
 13 files changed, 55 insertions(+), 55 deletions(-)

diff --git a/sound/soc/intel/avs/boards/da7219.c b/sound/soc/intel/avs/boards/da7219.c
index 85014d98f7e8a..2059d61567384 100644
--- a/sound/soc/intel/avs/boards/da7219.c
+++ b/sound/soc/intel/avs/boards/da7219.c
@@ -90,7 +90,7 @@ static const struct snd_soc_jack_pin card_headset_pins[] = {
 
 static int avs_da7219_codec_init(struct snd_soc_pcm_runtime *runtime)
 {
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(runtime, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(runtime, 0);
 	struct snd_soc_component *component = codec_dai->component;
 	struct snd_soc_card *card = runtime->card;
 	struct snd_soc_jack_pin *pins;
@@ -140,7 +140,7 @@ static int avs_da7219_codec_init(struct snd_soc_pcm_runtime *runtime)
 
 static void avs_da7219_codec_exit(struct snd_soc_pcm_runtime *rtd)
 {
-	snd_soc_component_set_jack(asoc_rtd_to_codec(rtd, 0)->component, NULL, NULL);
+	snd_soc_component_set_jack(snd_soc_rtd_to_codec(rtd, 0)->component, NULL, NULL);
 }
 
 static int
diff --git a/sound/soc/intel/avs/boards/es8336.c b/sound/soc/intel/avs/boards/es8336.c
index 0a023f871d93a..6d2a7c8e445e4 100644
--- a/sound/soc/intel/avs/boards/es8336.c
+++ b/sound/soc/intel/avs/boards/es8336.c
@@ -97,7 +97,7 @@ static struct snd_soc_jack_pin card_headset_pins[] = {
 
 static int avs_es8336_codec_init(struct snd_soc_pcm_runtime *runtime)
 {
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(runtime, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(runtime, 0);
 	struct snd_soc_component *component = codec_dai->component;
 	struct snd_soc_card *card = runtime->card;
 	struct snd_soc_jack_pin *pins;
@@ -138,7 +138,7 @@ static int avs_es8336_codec_init(struct snd_soc_pcm_runtime *runtime)
 static void avs_es8336_codec_exit(struct snd_soc_pcm_runtime *runtime)
 {
 	struct avs_card_drvdata *data = snd_soc_card_get_drvdata(runtime->card);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(runtime, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(runtime, 0);
 
 	snd_soc_component_set_jack(codec_dai->component, NULL, NULL);
 	gpiod_put(data->gpiod);
@@ -147,8 +147,8 @@ static void avs_es8336_codec_exit(struct snd_soc_pcm_runtime *runtime)
 static int avs_es8336_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *runtime = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(runtime, 0);
+	struct snd_soc_pcm_runtime *runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(runtime, 0);
 	int clk_freq;
 	int ret;
 
diff --git a/sound/soc/intel/avs/boards/i2s_test.c b/sound/soc/intel/avs/boards/i2s_test.c
index bc3065c6ceda7..1dd0c59a8d91b 100644
--- a/sound/soc/intel/avs/boards/i2s_test.c
+++ b/sound/soc/intel/avs/boards/i2s_test.c
@@ -32,7 +32,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 		return -ENOMEM;
 
 	dl->cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", ssp_port);
-	dl->codecs = &asoc_dummy_dlc;
+	dl->codecs = &snd_soc_dummy_dlc;
 	if (!dl->cpus->dai_name || !dl->codecs->name || !dl->codecs->dai_name)
 		return -ENOMEM;
 
diff --git a/sound/soc/intel/avs/boards/max98373.c b/sound/soc/intel/avs/boards/max98373.c
index 3833251ade265..7820435e3a53e 100644
--- a/sound/soc/intel/avs/boards/max98373.c
+++ b/sound/soc/intel/avs/boards/max98373.c
@@ -66,7 +66,7 @@ avs_max98373_be_fixup(struct snd_soc_pcm_runtime *runrime, struct snd_pcm_hw_par
 static int avs_max98373_hw_params(struct snd_pcm_substream *substream,
 				  struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *runtime = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
 	int ret, i;
 
diff --git a/sound/soc/intel/avs/boards/max98927.c b/sound/soc/intel/avs/boards/max98927.c
index 09b231bf4e6d6..ae465b231249c 100644
--- a/sound/soc/intel/avs/boards/max98927.c
+++ b/sound/soc/intel/avs/boards/max98927.c
@@ -66,7 +66,7 @@ avs_max98927_be_fixup(struct snd_soc_pcm_runtime *runrime, struct snd_pcm_hw_par
 static int avs_max98927_hw_params(struct snd_pcm_substream *substream,
 				  struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *runtime = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
 	int ret = 0;
 	int i;
diff --git a/sound/soc/intel/avs/boards/nau8825.c b/sound/soc/intel/avs/boards/nau8825.c
index 38c5087d98e97..9f15b22a3c3f6 100644
--- a/sound/soc/intel/avs/boards/nau8825.c
+++ b/sound/soc/intel/avs/boards/nau8825.c
@@ -106,12 +106,12 @@ static int avs_nau8825_codec_init(struct snd_soc_pcm_runtime *runtime)
 	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
 	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
 
-	return snd_soc_component_set_jack(asoc_rtd_to_codec(runtime, 0)->component, jack, NULL);
+	return snd_soc_component_set_jack(snd_soc_rtd_to_codec(runtime, 0)->component, jack, NULL);
 }
 
 static void avs_nau8825_codec_exit(struct snd_soc_pcm_runtime *rtd)
 {
-	snd_soc_component_set_jack(asoc_rtd_to_codec(rtd, 0)->component, NULL, NULL);
+	snd_soc_component_set_jack(snd_soc_rtd_to_codec(rtd, 0)->component, NULL, NULL);
 }
 
 static int
@@ -138,8 +138,8 @@ avs_nau8825_be_fixup(struct snd_soc_pcm_runtime *runtime, struct snd_pcm_hw_para
 static int avs_nau8825_trigger(struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtm = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtm, 0);
+	struct snd_soc_pcm_runtime *rtm = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtm, 0);
 	int ret = 0;
 
 	switch (cmd) {
diff --git a/sound/soc/intel/avs/boards/rt274.c b/sound/soc/intel/avs/boards/rt274.c
index ebfee54814cee..b376d4c2d7063 100644
--- a/sound/soc/intel/avs/boards/rt274.c
+++ b/sound/soc/intel/avs/boards/rt274.c
@@ -87,7 +87,7 @@ static struct snd_soc_jack_pin card_headset_pins[] = {
 
 static int avs_rt274_codec_init(struct snd_soc_pcm_runtime *runtime)
 {
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(runtime, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(runtime, 0);
 	struct snd_soc_component *component = codec_dai->component;
 	struct snd_soc_jack_pin *pins;
 	struct snd_soc_jack *jack;
@@ -121,7 +121,7 @@ static int avs_rt274_codec_init(struct snd_soc_pcm_runtime *runtime)
 
 static void avs_rt274_codec_exit(struct snd_soc_pcm_runtime *rtd)
 {
-	snd_soc_component_set_jack(asoc_rtd_to_codec(rtd, 0)->component, NULL, NULL);
+	snd_soc_component_set_jack(snd_soc_rtd_to_codec(rtd, 0)->component, NULL, NULL);
 }
 
 static int avs_rt274_be_fixup(struct snd_soc_pcm_runtime *runtime, struct snd_pcm_hw_params *params)
diff --git a/sound/soc/intel/avs/boards/rt286.c b/sound/soc/intel/avs/boards/rt286.c
index 84cf9a0c8dfed..36da0578d5b47 100644
--- a/sound/soc/intel/avs/boards/rt286.c
+++ b/sound/soc/intel/avs/boards/rt286.c
@@ -67,12 +67,12 @@ static int avs_rt286_codec_init(struct snd_soc_pcm_runtime *runtime)
 	if (ret)
 		return ret;
 
-	return snd_soc_component_set_jack(asoc_rtd_to_codec(runtime, 0)->component, jack, NULL);
+	return snd_soc_component_set_jack(snd_soc_rtd_to_codec(runtime, 0)->component, jack, NULL);
 }
 
 static void avs_rt286_codec_exit(struct snd_soc_pcm_runtime *rtd)
 {
-	snd_soc_component_set_jack(asoc_rtd_to_codec(rtd, 0)->component, NULL, NULL);
+	snd_soc_component_set_jack(snd_soc_rtd_to_codec(rtd, 0)->component, NULL, NULL);
 }
 
 static int avs_rt286_be_fixup(struct snd_soc_pcm_runtime *runtime, struct snd_pcm_hw_params *params)
@@ -98,8 +98,8 @@ static int avs_rt286_be_fixup(struct snd_soc_pcm_runtime *runtime, struct snd_pc
 static int
 avs_rt286_hw_params(struct snd_pcm_substream *substream, struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *runtime = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(runtime, 0);
+	struct snd_soc_pcm_runtime *runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(runtime, 0);
 	int ret;
 
 	ret = snd_soc_dai_set_sysclk(codec_dai, RT286_SCLK_S_PLL, 24000000, SND_SOC_CLOCK_IN);
diff --git a/sound/soc/intel/avs/boards/rt298.c b/sound/soc/intel/avs/boards/rt298.c
index 3b0e2b1a32519..3cd8057f0ed64 100644
--- a/sound/soc/intel/avs/boards/rt298.c
+++ b/sound/soc/intel/avs/boards/rt298.c
@@ -78,12 +78,12 @@ static int avs_rt298_codec_init(struct snd_soc_pcm_runtime *runtime)
 	if (ret)
 		return ret;
 
-	return snd_soc_component_set_jack(asoc_rtd_to_codec(runtime, 0)->component, jack, NULL);
+	return snd_soc_component_set_jack(snd_soc_rtd_to_codec(runtime, 0)->component, jack, NULL);
 }
 
 static void avs_rt298_codec_exit(struct snd_soc_pcm_runtime *rtd)
 {
-	snd_soc_component_set_jack(asoc_rtd_to_codec(rtd, 0)->component, NULL, NULL);
+	snd_soc_component_set_jack(snd_soc_rtd_to_codec(rtd, 0)->component, NULL, NULL);
 }
 
 static int avs_rt298_be_fixup(struct snd_soc_pcm_runtime *runtime, struct snd_pcm_hw_params *params)
@@ -109,8 +109,8 @@ static int avs_rt298_be_fixup(struct snd_soc_pcm_runtime *runtime, struct snd_pc
 static int
 avs_rt298_hw_params(struct snd_pcm_substream *substream, struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	unsigned int clk_freq;
 	int ret;
 
diff --git a/sound/soc/intel/avs/boards/rt5663.c b/sound/soc/intel/avs/boards/rt5663.c
index 770b36d05bf42..2e84bd629766d 100644
--- a/sound/soc/intel/avs/boards/rt5663.c
+++ b/sound/soc/intel/avs/boards/rt5663.c
@@ -79,14 +79,14 @@ static int avs_rt5663_codec_init(struct snd_soc_pcm_runtime *runtime)
 	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
 	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
 
-	snd_soc_component_set_jack(asoc_rtd_to_codec(runtime, 0)->component, jack, NULL);
+	snd_soc_component_set_jack(snd_soc_rtd_to_codec(runtime, 0)->component, jack, NULL);
 
 	return 0;
 }
 
 static void avs_rt5663_codec_exit(struct snd_soc_pcm_runtime *runtime)
 {
-	snd_soc_component_set_jack(asoc_rtd_to_codec(runtime, 0)->component, NULL, NULL);
+	snd_soc_component_set_jack(snd_soc_rtd_to_codec(runtime, 0)->component, NULL, NULL);
 }
 
 static int
@@ -113,8 +113,8 @@ avs_rt5663_be_fixup(struct snd_soc_pcm_runtime *runtime, struct snd_pcm_hw_param
 static int avs_rt5663_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	/* use ASRC for internal clocks, as PLL rate isn't multiple of BCLK */
diff --git a/sound/soc/intel/avs/boards/rt5682.c b/sound/soc/intel/avs/boards/rt5682.c
index b93468ae09773..f1c46c6abd9de 100644
--- a/sound/soc/intel/avs/boards/rt5682.c
+++ b/sound/soc/intel/avs/boards/rt5682.c
@@ -92,7 +92,7 @@ static struct snd_soc_jack_pin card_jack_pins[] = {
 
 static int avs_rt5682_codec_init(struct snd_soc_pcm_runtime *runtime)
 {
-	struct snd_soc_component *component = asoc_rtd_to_codec(runtime, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(runtime, 0)->component;
 	struct snd_soc_card *card = runtime->card;
 	struct snd_soc_jack_pin *pins;
 	struct snd_soc_jack *jack;
@@ -137,14 +137,14 @@ static int avs_rt5682_codec_init(struct snd_soc_pcm_runtime *runtime)
 
 static void avs_rt5682_codec_exit(struct snd_soc_pcm_runtime *rtd)
 {
-	snd_soc_component_set_jack(asoc_rtd_to_codec(rtd, 0)->component, NULL, NULL);
+	snd_soc_component_set_jack(snd_soc_rtd_to_codec(rtd, 0)->component, NULL, NULL);
 }
 
 static int
 avs_rt5682_hw_params(struct snd_pcm_substream *substream, struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *runtime = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(runtime, 0);
+	struct snd_soc_pcm_runtime *runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(runtime, 0);
 	int pll_source, freq_in, freq_out;
 	int ret;
 
diff --git a/sound/soc/intel/avs/boards/ssm4567.c b/sound/soc/intel/avs/boards/ssm4567.c
index 7324869d61327..27eca051122d3 100644
--- a/sound/soc/intel/avs/boards/ssm4567.c
+++ b/sound/soc/intel/avs/boards/ssm4567.c
@@ -50,12 +50,12 @@ static int avs_ssm4567_codec_init(struct snd_soc_pcm_runtime *runtime)
 	int ret;
 
 	/* Slot 1 for left */
-	ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_codec(runtime, 0), 0x01, 0x01, 2, 48);
+	ret = snd_soc_dai_set_tdm_slot(snd_soc_rtd_to_codec(runtime, 0), 0x01, 0x01, 2, 48);
 	if (ret < 0)
 		return ret;
 
 	/* Slot 2 for right */
-	ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_codec(runtime, 1), 0x02, 0x02, 2, 48);
+	ret = snd_soc_dai_set_tdm_slot(snd_soc_rtd_to_codec(runtime, 1), 0x02, 0x02, 2, 48);
 	if (ret < 0)
 		return ret;
 
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 8565a530706d0..3f1f98e1a31a9 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -58,7 +58,7 @@ avs_dai_find_path_template(struct snd_soc_dai *dai, bool is_fe, int direction)
 static int avs_dai_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai, bool is_fe,
 			   const struct snd_soc_dai_ops *ops)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct avs_dev *adev = to_avs_dev(dai->dev);
 	struct avs_tplg_path_template *template;
 	struct avs_dma_data *data;
@@ -127,7 +127,7 @@ static int avs_dai_be_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *fe, *be;
 	struct snd_soc_dpcm *dpcm;
 
-	be = asoc_substream_to_rtd(substream);
+	be = snd_soc_substream_to_rtd(substream);
 	for_each_dpcm_fe(be, substream->stream, dpcm) {
 		fe = dpcm->fe;
 		fe_hw_params = &fe->dpcm[substream->stream].hw_params;
@@ -167,7 +167,7 @@ static int avs_dai_nonhda_be_startup(struct snd_pcm_substream *substream, struct
 
 static void avs_dai_nonhda_be_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct avs_dev *adev = to_avs_dev(dai->dev);
 	struct avs_dma_data *data;
 
@@ -216,7 +216,7 @@ static int avs_dai_nonhda_be_prepare(struct snd_pcm_substream *substream, struct
 static int avs_dai_nonhda_be_trigger(struct snd_pcm_substream *substream, int cmd,
 				     struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct avs_dma_data *data;
 	int ret = 0;
 
@@ -303,7 +303,7 @@ static int avs_dai_hda_be_hw_params(struct snd_pcm_substream *substream,
 static int avs_dai_hda_be_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
 	struct avs_dma_data *data;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct hdac_ext_stream *link_stream;
 	struct hdac_ext_link *link;
 	struct hda_codec *codec;
@@ -320,7 +320,7 @@ static int avs_dai_hda_be_hw_free(struct snd_pcm_substream *substream, struct sn
 	data->path = NULL;
 
 	/* clear link <-> stream mapping */
-	codec = dev_to_hda_codec(asoc_rtd_to_codec(rtd, 0)->dev);
+	codec = dev_to_hda_codec(snd_soc_rtd_to_codec(rtd, 0)->dev);
 	link = snd_hdac_ext_bus_get_hlink_by_addr(&codec->bus->core, codec->core.addr);
 	if (!link)
 		return -EINVAL;
@@ -333,7 +333,7 @@ static int avs_dai_hda_be_hw_free(struct snd_pcm_substream *substream, struct sn
 
 static int avs_dai_hda_be_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct hdac_ext_stream *link_stream = runtime->private_data;
 	struct hdac_ext_link *link;
@@ -345,7 +345,7 @@ static int avs_dai_hda_be_prepare(struct snd_pcm_substream *substream, struct sn
 	if (link_stream->link_prepared)
 		return 0;
 
-	codec = dev_to_hda_codec(asoc_rtd_to_codec(rtd, 0)->dev);
+	codec = dev_to_hda_codec(snd_soc_rtd_to_codec(rtd, 0)->dev);
 	bus = &codec->bus->core;
 	format_val = snd_hdac_calc_stream_format(runtime->rate, runtime->channels, runtime->format,
 						 runtime->sample_bits, 0);
@@ -372,7 +372,7 @@ static int avs_dai_hda_be_prepare(struct snd_pcm_substream *substream, struct sn
 static int avs_dai_hda_be_trigger(struct snd_pcm_substream *substream, int cmd,
 				  struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct hdac_ext_stream *link_stream;
 	struct avs_dma_data *data;
 	int ret = 0;
@@ -500,7 +500,7 @@ static int avs_dai_fe_startup(struct snd_pcm_substream *substream, struct snd_so
 
 static void avs_dai_fe_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct avs_dev *adev = to_avs_dev(dai->dev);
 	struct avs_dma_data *data;
 
@@ -534,7 +534,7 @@ static int avs_dai_fe_hw_params(struct snd_pcm_substream *substream,
 	hdac_stream(host_stream)->period_bytes = 0;
 	hdac_stream(host_stream)->format_val = 0;
 
-	fe = asoc_substream_to_rtd(substream);
+	fe = snd_soc_substream_to_rtd(substream);
 	for_each_dpcm_be(fe, substream->stream, dpcm) {
 		be = dpcm->be;
 		be_hw_params = &be->dpcm[substream->stream].hw_params;
@@ -639,7 +639,7 @@ static int avs_dai_fe_prepare(struct snd_pcm_substream *substream, struct snd_so
 
 static int avs_dai_fe_trigger(struct snd_pcm_substream *substream, int cmd, struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct avs_dma_data *data;
 	struct hdac_ext_stream *host_stream;
 	struct hdac_bus *bus;
@@ -869,7 +869,7 @@ static int avs_dai_resume_hw_params(struct snd_soc_dai *dai, struct avs_dma_data
 	int ret;
 
 	substream = data->substream;
-	rtd = asoc_substream_to_rtd(substream);
+	rtd = snd_soc_substream_to_rtd(substream);
 
 	ret = dai->driver->ops->hw_params(substream, &rtd->dpcm[substream->stream].hw_params, dai);
 	if (ret)
@@ -964,7 +964,7 @@ static int avs_component_pm_op(struct snd_soc_component *component, bool be,
 	for_each_component_dais(component, dai) {
 		data = snd_soc_dai_dma_data_get_playback(dai);
 		if (data) {
-			rtd = asoc_substream_to_rtd(data->substream);
+			rtd = snd_soc_substream_to_rtd(data->substream);
 			if (rtd->dai_link->no_pcm == be && !rtd->dai_link->ignore_suspend) {
 				ret = op(dai, data);
 				if (ret < 0) {
@@ -977,7 +977,7 @@ static int avs_component_pm_op(struct snd_soc_component *component, bool be,
 
 		data = snd_soc_dai_dma_data_get_capture(dai);
 		if (data) {
-			rtd = asoc_substream_to_rtd(data->substream);
+			rtd = snd_soc_substream_to_rtd(data->substream);
 			if (rtd->dai_link->no_pcm == be && !rtd->dai_link->ignore_suspend) {
 				ret = op(dai, data);
 				if (ret < 0) {
@@ -1081,7 +1081,7 @@ static const struct snd_pcm_hardware avs_pcm_hardware = {
 static int avs_component_open(struct snd_soc_component *component,
 			      struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 
 	/* only FE DAI links are handled here */
 	if (rtd->dai_link->no_pcm)
@@ -1099,12 +1099,12 @@ static unsigned int avs_hda_stream_dpib_read(struct hdac_ext_stream *stream)
 static snd_pcm_uframes_t
 avs_component_pointer(struct snd_soc_component *component, struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct avs_dma_data *data;
 	struct hdac_ext_stream *host_stream;
 	unsigned int pos;
 
-	data = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
+	data = snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0), substream);
 	if (!data->host_stream)
 		return 0;
 
@@ -1129,7 +1129,7 @@ static int avs_component_mmap(struct snd_soc_component *component,
 static int avs_component_construct(struct snd_soc_component *component,
 				   struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dai *dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_pcm *pcm = rtd->pcm;
 
 	if (dai->driver->playback.channels_min)
@@ -1430,7 +1430,7 @@ static void avs_component_hda_remove(struct snd_soc_component *component)
 static int avs_component_hda_open(struct snd_soc_component *component,
 				  struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct hdac_ext_stream *link_stream;
 	struct hda_codec *codec;
 
@@ -1464,7 +1464,7 @@ static int avs_component_hda_open(struct snd_soc_component *component,
 		return snd_soc_set_runtime_hwparams(substream, &hwparams);
 	}
 
-	codec = dev_to_hda_codec(asoc_rtd_to_codec(rtd, 0)->dev);
+	codec = dev_to_hda_codec(snd_soc_rtd_to_codec(rtd, 0)->dev);
 	link_stream = snd_hdac_ext_stream_assign(&codec->bus->core, substream,
 					     HDAC_EXT_STREAM_TYPE_LINK);
 	if (!link_stream)
@@ -1477,7 +1477,7 @@ static int avs_component_hda_open(struct snd_soc_component *component,
 static int avs_component_hda_close(struct snd_soc_component *component,
 				   struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct hdac_ext_stream *link_stream;
 
 	/* only BE DAI links are handled here */
-- 
2.25.1

