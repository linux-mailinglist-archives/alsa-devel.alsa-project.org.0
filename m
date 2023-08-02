Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 242C376C1D8
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 03:03:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E09DE82;
	Wed,  2 Aug 2023 03:02:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E09DE82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690938228;
	bh=4p4ccm4wIrw4dIhs1wvHAEzCSuNfxLUTJuCkNxNCq0I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a+vEJyQUarl/YQkuHaHoH7EJzbNuLZ1/6BXzgiIR19vmabWJPaPiwtzCOhazSdOWF
	 Sajv2agd5uhgpCiTeyWtxfXWG+MMgKSKlf3n8MMThOkz6TsSFNVsOoZRM15MC+e7rr
	 OWbOHhQ3htmUb40P3nOUH6+lNIVmvAE6FZOKnXm4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D43DF80684; Wed,  2 Aug 2023 02:58:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BDD9AF805FC;
	Wed,  2 Aug 2023 02:58:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA04FF805BB; Wed,  2 Aug 2023 02:58:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20713.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::713])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 70675F805BB
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 02:58:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70675F805BB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=C+qLiuwo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ch9GFwjAPgVfFy0THQGr3Z0h5VlNTnXLA4G4MQ6sXRu2DX4c8xM7cEjfWQvTQ7hi36G0GWoUQcSNuEfB2OZGUuBSxbZq3Dv09x6ZsT/fAUp/GSitJg/S/fCpowrwgk3mAec244uJZlnByeKq74odCnbofIaRVBOMsOzSG1byzkOR8ZQPFyK0VHFyB5fgAAoofFqaugxdKXwNvZtCvH6gNzRQLpflJS6pdt1hKaYtHObtE2MOWNpegV+ZkOKfFxB5d29M8WhA2907tR9R5uLPCmfmYVREmGD+BmSw/isuaPlMu7iII6aTLjv8IalMVFuPPz0l8zfu5A7shsmSHhOFFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yeLpTp9Y7XaElrsA13ZN4DBMf27g5zQupQTT0Kkr+i4=;
 b=G19bs/mqwo/SQ3VhASGa39iMVm7UbVx2GrhHPYn0G0ibq98IhY4uGNpjq5LOuWKZZ0EVRdwuu652TKvBU1Dhhnx6fILAwbati3r6DCF3uVkQha7BDjVo9nb97N0VXYOO8ApvFGbd0AsNRh5GcBSl2ZJ/aJIodwevg4rkpITdAZggP8ZPI2ZE/Huy2O7zrGCRngG0xr9S+qAvS7e8iCyor34vsZzLifsz9eqxpPkwpLyRhe0lsH1MaUrYxmthePZBzc0BzlFHcbZzTgV7U7L6q3hjlYyTuDI6+A436sN+9IFi/x66c94WELdSdw2DXWyCfHHg4LtG1DtxUT+dqP7QxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yeLpTp9Y7XaElrsA13ZN4DBMf27g5zQupQTT0Kkr+i4=;
 b=C+qLiuwouAZyKYsLBRX4/8O+NpHx0I83kJ1IVearifTriJXq6eRy/YUvPhO0WY06/d3Q3mPIUmkE9FLRozb46N6n8+8tc6a/eAF5AggOx2JpZa8ZeEaZHP2OMSuwSDgqJlDhu0TPbVfqEUzBjhCtOBt7951Zut9xY3067T1AByo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB7797.jpnprd01.prod.outlook.com (2603:1096:400:17b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 00:58:38 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 00:58:38 +0000
Message-ID: <87sf92s1j6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 37/38] ASoC: codecs/hdmi-codec: merge DAI call back functions
 into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
References: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 2 Aug 2023 00:58:37 +0000
X-ClientProxiedBy: TYCPR01CA0146.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::14) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB7797:EE_
X-MS-Office365-Filtering-Correlation-Id: 1930b2e7-c76b-42d2-5a34-08db92f39b1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ufA8qPunufFuCLOKI0Q6dSgb0RnHmwUZs90QPzVnOgZnK1KdGf6WzJfoD054la8kPyC1CQHBinf+sAXgNtiQcxZYwA/iYv/2rOxeoy8A8F2dd4x/pn+6yjHl07x0+M89xiSeuZfTZKRL4JV9FZhj039EyCqRYJI51/AAF2zbub+4QXvuSiaH+yceycex1X5hyGBpIHoCoN59jbwIQQJa8hsJefyqIiMcfFkY86iwtc9v8/JmnpqSqEQ7L7K8QuzuUW1naB1n7VH4ZDeLa+ENfCtik4OmNMY/6CEuef6cDjwL2GnggFKDqdjoLecSbg0lz6x2JOE9g/7z31yUiCzj+B2bmFJ7xsdRGXGftKwQu/px8rUu3992uawWs+ec/UCURzlJ9izUIk940UiaiwE1MOlm4m4qPlWWZ3O+TOGL6WdepSPwq9zUOW7ttVKo5//CUpMNPtqaoPKTIBmJYvrbN/HDTmahgPefLExv7bvZpDzwrCTLcIv1T/3DUllfPUfJiAgIJjgwiXKqwjqDg/QvUrw6ax8XpEEljTx9ycbdcvz6k9bZN2XDMP/kwemVRFaZYGCMiLg/jdkiJuuPKC3TFFYaYswQiyoJCoPzqb7Gsp7m/T/ad8hyqWXbo7qRm77S
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(451199021)(52116002)(6512007)(6486002)(26005)(6506007)(186003)(2616005)(110136005)(478600001)(83380400001)(36756003)(38100700002)(2906002)(5660300002)(86362001)(8676002)(8936002)(66556008)(41300700001)(66476007)(66946007)(316002)(38350700002)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GLkt9ig1YI9Cz1XcI7exmqlmatr1FMFhTkcHJcXwqXDNjMhhNQevnP68fLOY?=
 =?us-ascii?Q?ZDP0NXVOMMF5odsTBi0s6Bgjo5s8xpKIwT857YjmLOV1Iye28hq/IucdQpb0?=
 =?us-ascii?Q?mfYV3Gm2lS0HsJ5ifDBZNTwvh1G+c4qG6AVpOkD6D+jDubSfrPEEwo4UMaqJ?=
 =?us-ascii?Q?/puh/AdQNUSEes2ftjW/g8pjtjJtZmb9I3wVlhvzX+ltfxXFsgeTegt/WwBc?=
 =?us-ascii?Q?Y75guSBRNneiz+9SYfuD3yHMjdmTXbH4G7qjoiEcIV4HGdqGP9UIKTijTexZ?=
 =?us-ascii?Q?PduNx6hr3ZdU2KJiG2CIMFNwxcB2aA0vQY+lH+nFeU0zwlpu6vkdT8PXKJz/?=
 =?us-ascii?Q?sGPNLFW/GfDgQg6PL2XDpWmKGLvpL01qoGryvZVd/GtAfidiU2Zf7cIGCUyT?=
 =?us-ascii?Q?H4zRshZkXKCUOcPFcnG/vXWRBKsIzNZ+HKoUbDtNVWsghfH7Chl+wTnbk202?=
 =?us-ascii?Q?pul7YNECYNu8WnUKbPUsn6F/YwuTTpvu4C2Ku+91JuejWhnVajStcJcm4Syn?=
 =?us-ascii?Q?omXiq6mmbAxfb9nJJQsGQO7KCXQhPSxiSrIFip8noNxL9NLAaUgbmZdz/eM+?=
 =?us-ascii?Q?tyKzdaguc/Oys3QOXzP5dGzdO3G9+zQxBoyJviWCwqyI/cm+ga06P3xrpaTD?=
 =?us-ascii?Q?I0sP5k8NIA6xCpu/RtMyrF5g60XYZGiR4SJ7Ef+A97e4jLMIzQ8f6h1ZsF9L?=
 =?us-ascii?Q?wlXsezGUFg2OLJpgJGn5WUBNlxnme+3qUIJm+7zi/YIJY0LxPqGSbfMsrQm2?=
 =?us-ascii?Q?FWnfbjbJok76EO+9Lgsf3vRzIW/7ldk1Kz/h9TOS962S3vnUBMghQtOj2n7f?=
 =?us-ascii?Q?5R0H4IEfNnU7S/r98oR+ryi5e6c7HkmkY1ufuGKqU0Dv2o3ng22yfaG1Xjyp?=
 =?us-ascii?Q?JWekUY6YxmVPIc3WxP71HD3nxH8zQVjTkPlyto7cA5G+IuI4tVkyXJuP5xGy?=
 =?us-ascii?Q?AC5Ia0ro4xbb650ZtDdQZoy3qUW0WIcYb57F7rN2yWjNU9d1RWayqljASd+Z?=
 =?us-ascii?Q?NcPBOt8sjih6TuO3Rfacdq5SeUNud+aJPe2wzy4wJD59KOx5Hg2+H3sfBNKZ?=
 =?us-ascii?Q?hIdyFYGuV4kpuob5CkTe3KFfcpZn7v41P63wALf/UOw/ehlh7DIUHrUyaM4i?=
 =?us-ascii?Q?n4IRVZrVeWO9Z/gllXupfdS05tS0GvMlDLVnoMi140X9YgSU6fcQ5ZbhY897?=
 =?us-ascii?Q?w+byy6wGR+V9ypbhqqOv/tw2nEDv77p1mCxWmL3NQyy3JxBjCeGzs1BlNK96?=
 =?us-ascii?Q?6trflO0RwxcMzqQvX0MSxn5GHp0Wm22bFHu1CjnCi8ViXuwYD6l+Amg2ynrU?=
 =?us-ascii?Q?RkJnJEX6gmGPc+yReq3u6rPmXwNqRuAIyS+Q+UotLr/yiWHODgS5eg/TXhqJ?=
 =?us-ascii?Q?ucXzTA9Mu6SRooyRwoCWNSzTPBBYDEvumnYrdp70l6aI2DRaINpA9hztZnBG?=
 =?us-ascii?Q?BpP0ZLos+sj7W5cStsK8/5/gyYj9yHbFnbgz3UYpY1VaAM9foGZfgJz/JMCi?=
 =?us-ascii?Q?jAXcX8MtU3iwYNiH21aYIM15Z06MLfib/j228CRwI3jcDYT/S69AvHAG/NTf?=
 =?us-ascii?Q?xKgZgMloHuVDcsbeLd06qszQnUJ+slf0ZC7iGMz4qrjVmB3bql/S/KK7bAdr?=
 =?us-ascii?Q?Mg5rIfDVnZPqPYlWLTJuOrM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1930b2e7-c76b-42d2-5a34-08db92f39b1b
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 00:58:38.0920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 pECNyM86/+RFO27M72BQFrUQXv7hpJwwkNDhcSCF0jVpJt/0hCX27n9ECsaMraeZ3VV6cbef1r+0x04uaWDxlyqJNtTI+rnRjNzby0WDOc5ygooIx7NW+QgobB4dC8Dc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7797
Message-ID-Hash: 24KTJAGUG3PZ3DXOND375HPN3WFOWYRN
X-Message-ID-Hash: 24KTJAGUG3PZ3DXOND375HPN3WFOWYRN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/24KTJAGUG3PZ3DXOND375HPN3WFOWYRN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA SoC merges DAI call backs into .ops.
This patch merge thesse into one.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/hdmi-codec.c | 44 +++++++++++++++++------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index d21f69f05342..13689e718d36 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -723,24 +723,6 @@ static u64 hdmi_codec_formats =
 	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
 	SND_SOC_POSSIBLE_DAIFMT_AC97;
 
-static const struct snd_soc_dai_ops hdmi_codec_i2s_dai_ops = {
-	.startup	= hdmi_codec_startup,
-	.shutdown	= hdmi_codec_shutdown,
-	.hw_params	= hdmi_codec_hw_params,
-	.prepare	= hdmi_codec_prepare,
-	.set_fmt	= hdmi_codec_i2s_set_fmt,
-	.mute_stream	= hdmi_codec_mute,
-	.auto_selectable_formats	= &hdmi_codec_formats,
-	.num_auto_selectable_formats	= 1,
-};
-
-static const struct snd_soc_dai_ops hdmi_codec_spdif_dai_ops = {
-	.startup	= hdmi_codec_startup,
-	.shutdown	= hdmi_codec_shutdown,
-	.hw_params	= hdmi_codec_hw_params,
-	.mute_stream	= hdmi_codec_mute,
-};
-
 #define HDMI_RATES	(SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 |\
 			 SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_88200 |\
 			 SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_176400 |\
@@ -921,10 +903,31 @@ static int hdmi_dai_spdif_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops hdmi_codec_i2s_dai_ops = {
+	.probe				= hdmi_dai_probe,
+	.startup			= hdmi_codec_startup,
+	.shutdown			= hdmi_codec_shutdown,
+	.hw_params			= hdmi_codec_hw_params,
+	.prepare			= hdmi_codec_prepare,
+	.set_fmt			= hdmi_codec_i2s_set_fmt,
+	.mute_stream			= hdmi_codec_mute,
+	.pcm_new			= hdmi_codec_pcm_new,
+	.auto_selectable_formats	= &hdmi_codec_formats,
+	.num_auto_selectable_formats	= 1,
+};
+
+static const struct snd_soc_dai_ops hdmi_codec_spdif_dai_ops = {
+	.probe		= hdmi_dai_spdif_probe,
+	.startup	= hdmi_codec_startup,
+	.shutdown	= hdmi_codec_shutdown,
+	.hw_params	= hdmi_codec_hw_params,
+	.mute_stream	= hdmi_codec_mute,
+	.pcm_new	= hdmi_codec_pcm_new,
+};
+
 static const struct snd_soc_dai_driver hdmi_i2s_dai = {
 	.name = "i2s-hifi",
 	.id = DAI_ID_I2S,
-	.probe = hdmi_dai_probe,
 	.playback = {
 		.stream_name = "I2S Playback",
 		.channels_min = 2,
@@ -942,13 +945,11 @@ static const struct snd_soc_dai_driver hdmi_i2s_dai = {
 		.sig_bits = 24,
 	},
 	.ops = &hdmi_codec_i2s_dai_ops,
-	.pcm_new = hdmi_codec_pcm_new,
 };
 
 static const struct snd_soc_dai_driver hdmi_spdif_dai = {
 	.name = "spdif-hifi",
 	.id = DAI_ID_SPDIF,
-	.probe = hdmi_dai_spdif_probe,
 	.playback = {
 		.stream_name = "SPDIF Playback",
 		.channels_min = 2,
@@ -964,7 +965,6 @@ static const struct snd_soc_dai_driver hdmi_spdif_dai = {
 		.formats = SPDIF_FORMATS,
 	},
 	.ops = &hdmi_codec_spdif_dai_ops,
-	.pcm_new = hdmi_codec_pcm_new,
 };
 
 static int hdmi_of_xlate_dai_id(struct snd_soc_component *component,
-- 
2.25.1

