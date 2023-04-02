Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D536D3AE4
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Apr 2023 01:02:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E85D31E8;
	Mon,  3 Apr 2023 01:01:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E85D31E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680476568;
	bh=Lmxf+qN+Gg6qOFp1aB2OmVDEjdPLu79WnWDL+HILz6s=;
	h=From:Subject:To:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VNSCghM9jii8x3KemcbKd4ebiR0IH3Dpd1tZyvhldGeW+wOmXE40RSWmIOqh+LnOV
	 CpLMQWoMeBPEXpBESnIFQMUS5qV+Jfw0RMfGoFQCDRcbLEZPB9o1UKWfA9VlLXE/Ai
	 pEzsNHrRwATR61MD8NajQpHrNWOZqxW0dingLlGo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E544F80482;
	Mon,  3 Apr 2023 01:01:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31DA7F80549; Mon,  3 Apr 2023 01:01:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20705.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::705])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0ECBFF80482
	for <alsa-devel@alsa-project.org>; Mon,  3 Apr 2023 01:00:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0ECBFF80482
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=CRdQtigL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hcRyu/EBWiy97leYUkjUuX3sy3uCqPKk9LS7FElurKb2xpk7SBhErXaOJZGUTcbW4o7PsitAnazoDCHAwORH+OqTlJrMEmBhMaFYDfiHnSLh2WIe1RV1kdZGp+tTRSyXRNdFkX/TSMqhiAy8oaY6VI3cp8Y6zT7E+OmYCIcHTC+tgJhGa8GBB3DbVsk6QAx8efmTVnTJJfC13gZPVkbKtzWdLMuzdwsmf0yG8Kr2k/280YbX0sIeRkZaccmKchBPkOP/2uFqCYpQIjxeCn3dnCxAbS+upVrD+aRoYDZMmdwoj1z/nvCCVUUJOxwbHsTLu+S77b4itLSWlOYBV2oq1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BdE9ZdfsMIcwIYBk522MPRz6/dpjRrySSqhHeB6SV6Q=;
 b=OWX4DfI1ikd9tZIOvireDdTJuWmOFfbXWwTaLWusO+kEURYHCuZi6kDhcf6Lv55D87zV9NzzxdAGCqpnuF5f95P3LtcW65e/Tb2bf5iyIRrOB/VFMyMHKpDlOHmA1ni40qaHQNU74xao8Gz9OzSi6cu2HMttyXNavQMLhG9ayfZNVmujs55AKQZSeaDBEigUSF/95XqLWjxQaOvswMyO4fwFM6opETv+U6uKVdiaOBKRmFOTxB83YnZ0/42ChzVNrxbXWlziwOEec1+xjRu173ZdqFF9TPVT5SITAotY4A+I0JdoG3V3HEdsoEKgjxY9gqprXVRpm8muYlY8wa5/Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BdE9ZdfsMIcwIYBk522MPRz6/dpjRrySSqhHeB6SV6Q=;
 b=CRdQtigLcYH88HJdl8t9r/fPuqMqP29U6IxkGBZYteR0oLjUOr2KWKzk0LN0MZx18jJs6/NmOrEIjEBE1RF5klCo+D4got+beTW+5dC+M+cl7Sy2IOAIlcoZ/+miL1TMX2X3iXMQsT6KKeoC/IZO6bd/XoX098v5+8sZ7VQ5tcA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSZPR01MB9395.jpnprd01.prod.outlook.com (2603:1096:604:1d7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Sun, 2 Apr
 2023 23:00:07 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%4]) with mapi id 15.20.6254.033; Sun, 2 Apr 2023
 23:00:07 +0000
Message-ID: <87jzytc2kp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH resend 4/5] ASoC: samsung: switch to use c2c_params instead of
 params
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87pm8lc2m7.wl-kuninori.morimoto.gx@renesas.com>
References: <87pm8lc2m7.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 2 Apr 2023 23:00:07 +0000
X-ClientProxiedBy: TYXPR01CA0043.jpnprd01.prod.outlook.com
 (2603:1096:403:a::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSZPR01MB9395:EE_
X-MS-Office365-Filtering-Correlation-Id: 01cd2a5b-1ccf-47f0-9318-08db33ce00c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wdPI3evW6hQ06fLDtvxzCoD8xE+e/70uGFaD64VdtCKDvMG0XzN9UtAmTQ0/IJQwznL7UeuvWL4r5fvbvbpEt+WdQldOUC3blKNRl44nVDf/aV2dUx8wnBdYis2gZgzAqrahQUsbNXrhhR62HqypId6JvCgValBolxPPxnTLahzuhT1rnENUfwBxFys7Kk8kWogfoGRnxUIW9i9ieX2TNaRIhuup37Qb4otpeWinswwxLeg8J8LT6u6GIrXcoGjFxPVcnfLA0U+JujKp3HWq+NEktWkbad7DcpZzwpql8lJWAu1Rc9kBsxbVNpQLZQIN8ExiwiyT9umRdouKvDxSJjbdNAtZ8/T0gsgpzm36Ldvtc1mX1kBnZ+C+1XVg1CGk0HZnAsXqqEpZLAuMF/2ZvCaqmNEAJnJWROXAf/nulhbpq7JhReqfFDlOOhAq9wqLLJRnSWHJP9+XvDcHNVxKGeN0BdPKdqRLhl2ApZdvDUk0voiRO7F6lbKEtnh6Zaz922gD3lJVdc5WAOLSMnWyNZ9TVImg12LM2LPir0BFR7Rfz4ucwMwBX5yHvcrxNcwPcPDg0tOsJCKN4ISosHLQkI3GuLqQlAS3L2lAXAky/DCgxUQZYZOeRfG/gZxcTya1
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(451199021)(478600001)(186003)(6512007)(6506007)(26005)(2616005)(52116002)(6486002)(36756003)(2906002)(83380400001)(86362001)(66556008)(66946007)(66476007)(5660300002)(8936002)(8676002)(38350700002)(41300700001)(38100700002)(4326008)(6916009)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9hZ4e2B/BXim/bK/DahSU3k4va0Lz0yCWncg5qapyG4WM1mXU5or2OyCH/8z?=
 =?us-ascii?Q?VBHxdACuA/oJywRjtIBjctN9+FjeqeSxqd05qibRh5ZsNWxMe5OcEw7V45IR?=
 =?us-ascii?Q?zjR6tpVmK9FskXLe1iMLbsLj0dhS0yvpaYxzoP5raQBiH6ZX6/Oos7QIJDHy?=
 =?us-ascii?Q?9VmbDuLpoOIxV4C+nqgtx+mDDnfXcAPJ5JlzA1yh0wX0gKt1Qxtl+Voaos2Q?=
 =?us-ascii?Q?3Z3UdgJz51z8rkFx92bjHY5sgpIPLmAcg9uFyN3YAGdcDaxUczUoVJhNcfOi?=
 =?us-ascii?Q?lWYb6WyqMb3zmbo3y32QoZY0wwxvls5rBi4MAy1dXm2/UqLItcEi4VDp5J9z?=
 =?us-ascii?Q?7rh7pxMDEAXxt+/lVH79JF5WqAztf6S6zkgoFsSnN8oBkfmPMm8kJJZtEiX+?=
 =?us-ascii?Q?7kfIQWzMQmKcauzlMDpE2jWOc+xSQd6ELbqRwagTho6W/SCin6YyRvndo7qa?=
 =?us-ascii?Q?zcoNyv3XnUbvJRLtO93tD1os7A8hM0uSOeuJsHs2hyK9IcbryPxEd7m6XpUA?=
 =?us-ascii?Q?3QoJObOwJhBGi/s+4iHmEdHA9Jigbh3cOrO9ARKkRaYQ4pIvjEcGTmpTINE/?=
 =?us-ascii?Q?8m8c5F8kgV5SBTz5t07LnuXH82Q3CinWywVHutzTwQfgt9bKmiQC+pcnrWbp?=
 =?us-ascii?Q?vBTmBcWTzeHoV4hXgTkJPswu0RndbfM6pj5qQNyiTC3fM+RZ9Y1FEuB6Qadk?=
 =?us-ascii?Q?yC3robVGKadRUFxnprPK5qkvWIaqccdgjTIcqu/WDwO+mbpBQU6NWbOAol9d?=
 =?us-ascii?Q?uHOCom4o2zwHtO5EyDR5/j+DgvHKiGLtfylxCOzFzRwUgdqgcIkj4QMOHrOq?=
 =?us-ascii?Q?Ji4gSiTgMITwUlwU27C2/gQWQBFkhTj4nGwfwWYqQi7Wnbsmo7uuD2K3r+br?=
 =?us-ascii?Q?NnMb5WzyQlxbwFQk8elbS6Fh/vAgyEInVbSLQXAMSBHsJkG8hHq29v+2Rxge?=
 =?us-ascii?Q?EF6njVyPPO6s7F0JlDHc/1EQ+bWYTVJUrsA4cNsoFdIPSHsJn3T0xQsB41/8?=
 =?us-ascii?Q?dxARxQQ2DPyifigZmg3C9j7V8gLDGAlRuNTcEY0jU42xxb/osa5UZ2aU0RIb?=
 =?us-ascii?Q?kMhxWNqVpddRcsJ1LU9ozTrV9rpyW+OqnhH1023HABEsrzNwEH30GF76bdti?=
 =?us-ascii?Q?NvwVp6ONioOHzoLRCLPLvoVEjXzvydxHJWYy3mEfMYEMj6WLIIeb/Vbr9Rs7?=
 =?us-ascii?Q?ImnY8u8mRbWy1WJJTaqqeLNo3g22xYkxNc3eYGjpSrdLFuPVdy/ysI1VQQy2?=
 =?us-ascii?Q?GbczhZh+oOZA8vRE5BNRMep6eKNfx5xbtug+Heaqdj3T1Ok6Boy5ESum3GJs?=
 =?us-ascii?Q?15LyEJNKjfLL9Vj/V7raYMJQ9aWfAqKEFFpDprAAEXny7CiUfXlBg6wpvenw?=
 =?us-ascii?Q?TDGPq6b3aCoBGE/Ua2ozQuCX3YcUnphGfMsfyMLOko/NuBTYIUpAeYHbip2g?=
 =?us-ascii?Q?W8F7OLHKNpqAoFP6Y3tmwAClWQoJowptERa9QEFVacWG6vASBG6aj2eERkIy?=
 =?us-ascii?Q?E2dKzDDih2Exfcgtlf2sonQihJwmBsmxAk6WKGC6PVzo4X+BxcyvYkb3T5+m?=
 =?us-ascii?Q?zbYWaaT5ilL1Kohlb/K2ymbmOtkL24mIlnEwVCZMn0Aik0yYk4TCB3iZbVc8?=
 =?us-ascii?Q?10AHQADer6U8DIH5mVGVKVU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 01cd2a5b-1ccf-47f0-9318-08db33ce00c2
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2023 23:00:07.2938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 RpIulQ+fw+TyfKeJj9fn3MnzOwQ4ZndDXs97/i0/VT84920ipVKF+HJ1xxfhV0CrM0aYLl5yTY+BKrRXeN2a0KHWufln7qPCT9R6Flg6LS81+HW1TfxBu2C2IsITGTVe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9395
Message-ID-Hash: A6SRSJU3CMUAQSFAMCN5FDAI3VPFHDU5
X-Message-ID-Hash: A6SRSJU3CMUAQSFAMCN5FDAI3VPFHDU5
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A6SRSJU3CMUAQSFAMCN5FDAI3VPFHDU5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>


ASoC is now using c2c_params instead of params. This patch replace it.
num_c2c_params (was num_params) was not mandatory before,
but let's set it by this patch.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/samsung/aries_wm8994.c |  6 ++++--
 sound/soc/samsung/bells.c        | 21 ++++++++++++++-------
 sound/soc/samsung/littlemill.c   |  3 ++-
 sound/soc/samsung/lowland.c      |  3 ++-
 sound/soc/samsung/speyside.c     |  3 ++-
 5 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/sound/soc/samsung/aries_wm8994.c b/sound/soc/samsung/aries_wm8994.c
index 0fbbf3b02c09..7492bb41456c 100644
--- a/sound/soc/samsung/aries_wm8994.c
+++ b/sound/soc/samsung/aries_wm8994.c
@@ -483,14 +483,16 @@ static struct snd_soc_dai_link aries_dai[] = {
 		.name = "WM8994 AIF2",
 		.stream_name = "Baseband",
 		.init = &aries_baseband_init,
-		.params = &baseband_params,
+		.c2c_params = &baseband_params,
+		.num_c2c_params = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(baseband),
 	},
 	{
 		.name = "WM8994 AIF3",
 		.stream_name = "Bluetooth",
-		.params = &bluetooth_params,
+		.c2c_params = &bluetooth_params,
+		.num_c2c_params = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(bluetooth),
 	},
diff --git a/sound/soc/samsung/bells.c b/sound/soc/samsung/bells.c
index 76998a4a4cad..70b63d4faa99 100644
--- a/sound/soc/samsung/bells.c
+++ b/sound/soc/samsung/bells.c
@@ -264,7 +264,8 @@ static struct snd_soc_dai_link bells_dai_wm2200[] = {
 		.stream_name = "DSP-CODEC",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBM_CFM,
-		.params = &sub_params,
+		.c2c_params = &sub_params,
+		.num_c2c_params = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(wm2200_dsp_codec),
 	},
@@ -300,7 +301,8 @@ static struct snd_soc_dai_link bells_dai_wm5102[] = {
 		.stream_name = "DSP-CODEC",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBM_CFM,
-		.params = &sub_params,
+		.c2c_params = &sub_params,
+		.num_c2c_params = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(wm5102_dsp_codec),
 	},
@@ -310,7 +312,8 @@ static struct snd_soc_dai_link bells_dai_wm5102[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBM_CFM,
 		.ignore_suspend = 1,
-		.params = &baseband_params,
+		.c2c_params = &baseband_params,
+		.num_c2c_params = 1,
 		SND_SOC_DAILINK_REG(wm5102_baseband),
 	},
 	{
@@ -319,7 +322,8 @@ static struct snd_soc_dai_link bells_dai_wm5102[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBS_CFS,
 		.ignore_suspend = 1,
-		.params = &sub_params,
+		.c2c_params = &sub_params,
+		.num_c2c_params = 1,
 		SND_SOC_DAILINK_REG(wm5102_sub),
 	},
 };
@@ -355,7 +359,8 @@ static struct snd_soc_dai_link bells_dai_wm5110[] = {
 		.stream_name = "DSP-CODEC",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBM_CFM,
-		.params = &sub_params,
+		.c2c_params = &sub_params,
+		.num_c2c_params = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(wm5110_dsp_codec),
 	},
@@ -365,7 +370,8 @@ static struct snd_soc_dai_link bells_dai_wm5110[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBM_CFM,
 		.ignore_suspend = 1,
-		.params = &baseband_params,
+		.c2c_params = &baseband_params,
+		.num_c2c_params = 1,
 		SND_SOC_DAILINK_REG(wm5110_baseband),
 	},
 	{
@@ -374,7 +380,8 @@ static struct snd_soc_dai_link bells_dai_wm5110[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBS_CFS,
 		.ignore_suspend = 1,
-		.params = &sub_params,
+		.c2c_params = &sub_params,
+		.num_c2c_params = 1,
 		SND_SOC_DAILINK_REG(wm5110_sub),
 	},
 };
diff --git a/sound/soc/samsung/littlemill.c b/sound/soc/samsung/littlemill.c
index 411e25cec591..5d8118e69359 100644
--- a/sound/soc/samsung/littlemill.c
+++ b/sound/soc/samsung/littlemill.c
@@ -167,7 +167,8 @@ static struct snd_soc_dai_link littlemill_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBM_CFM,
 		.ignore_suspend = 1,
-		.params = &baseband_params,
+		.c2c_params = &baseband_params,
+		.num_c2c_params = 1,
 		SND_SOC_DAILINK_REG(baseband),
 	},
 };
diff --git a/sound/soc/samsung/lowland.c b/sound/soc/samsung/lowland.c
index b44f5e92224f..106770be6fc5 100644
--- a/sound/soc/samsung/lowland.c
+++ b/sound/soc/samsung/lowland.c
@@ -119,7 +119,8 @@ static struct snd_soc_dai_link lowland_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 				SND_SOC_DAIFMT_CBM_CFM,
 		.ignore_suspend = 1,
-		.params = &sub_params,
+		.c2c_params = &sub_params,
+		.num_c2c_params = 1,
 		.init = lowland_wm9081_init,
 		SND_SOC_DAILINK_REG(speaker),
 	},
diff --git a/sound/soc/samsung/speyside.c b/sound/soc/samsung/speyside.c
index 69d7b0115b38..22e2ad63d64d 100644
--- a/sound/soc/samsung/speyside.c
+++ b/sound/soc/samsung/speyside.c
@@ -219,7 +219,8 @@ static struct snd_soc_dai_link speyside_dai[] = {
 		.init = speyside_wm8996_init,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBM_CFM,
-		.params = &dsp_codec_params,
+		.c2c_params = &dsp_codec_params,
+		.num_c2c_params = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(dsp_codec),
 	},
-- 
2.25.1

