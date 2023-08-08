Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D94D8774EE8
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 01:03:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FA0CE74;
	Wed,  9 Aug 2023 01:02:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FA0CE74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691535800;
	bh=e5KPUnTBnZxfLODXJighw+DTr3CFKEQh8KpJoB7oK28=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nHVIc//0lX0SJ2bIudoUZCkxddQ1ms6OFxUcJ/oRFOm58oaiSHf42xSQX5JcwcgV3
	 14hPXdLoarXV7yXPXETinZwuRcDE48qNzErvY+Q396cTQEmbk71pKFpx4JjUDcGSfH
	 /jHd1uHdfkTKm0iugthupa0ikwdNbE26K2iwo3OI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46606F80551; Wed,  9 Aug 2023 00:57:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C2E04F8057A;
	Wed,  9 Aug 2023 00:57:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4E35F805BE; Wed,  9 Aug 2023 00:57:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20705.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::705])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 18801F80116
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 00:57:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18801F80116
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=S6HwzOrE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XjusSmKsiobdzZ21HL+plMGXzGgPEOO1rtt8+br/UPO3NLOFtZhi//MXxYHHH0vU+W/7ToophnEpxJNtVQ9f5mogepnSaV3geBxewBC4FJOy77K35ttR7tCJYkjUhIngMtmDrNEW8zhyI0E2PxsM2mDpcBGRE7CIkMXdDwy4fg/nsoWlEfz7ZWTRsKuPCwe7C4sP+B+JBZ+2zYAPIWsWzp4m6XdBl4KLVKkJAU9BnKq7FHlmHYqMLUMsSBzgxgaDCtfIw/fSR20WyYtq4nh38Q9FMU5gRnN3aZr+pAnpCW8vYJTmorU+kHF1rKf4Rh3wWBhKpLA+lRzXlDkjQdsp6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VvzInMlr1rkSucTh0geroIxjAMA2WCay60ZviUVmtLE=;
 b=m5gDYIufbEsC/KKPgWie+Tri9OkIx1HVBOSEx3q6bD49FTkOiEengXfVut+H9/VELfqvOgp/BeDMTrdTD7aHGvg8IVETAffAevopEzWEnqkhI34snt5pEeP7tNRkcjAI91f8dvM6bzmwOsBRwsQ+ZZb7wc+zwZXlLgzprk06dNdv4PNDAXeVsuMEuysydEMpF0SpOZbirtHa7jI6LkF8JVCeh33U0G5N9Z5JiRy+KVLVczryCtVGpuBVYoO7JbwLKZ4uMxFKKo5NUj7CRMrfHCq2SjNUCsHn3LU3YVlHldUGtlb3Hn9fTTu3dDbgTRzwfYt3nTi3KOriZ2DChu6lhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VvzInMlr1rkSucTh0geroIxjAMA2WCay60ZviUVmtLE=;
 b=S6HwzOrESlQx+FiW2Yi0gxi3KU/61bmzWXYCrHajx+4PP+x6+io26oJtD7JzJMZqVXeToTOGvvl287XP1aTihXP7E042kcA53kKbhepyhjuPVt6HWThlrpP8pKsuBpv9pNvhwnnZBC45Qck+j42RJW/2ZSaCRjJyUqkvDafBPCc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB11379.jpnprd01.prod.outlook.com (2603:1096:400:3f7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Tue, 8 Aug
 2023 22:57:35 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6652.028; Tue, 8 Aug 2023
 22:57:35 +0000
Message-ID: <87v8dp9m74.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Emma Anholt <emma@anholt.net>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <mripard@kernel.org>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 26/39] ASoC: drm/vc4: merge DAI call back functions into
 ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Aug 2023 22:57:35 +0000
X-ClientProxiedBy: TYBP286CA0029.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::17) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB11379:EE_
X-MS-Office365-Filtering-Correlation-Id: fe2b6bde-e456-42e2-512d-08db9862db48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uS6IDbKChNGFMxJHcs26dOXZsz76vvS4ubSxrlcLqCr+qDX7UeqGgkGibyCg7yU7/Mz+SIOZ1tFtL2bWPHn8MowGSLbOLC6Hwjx5MejU/fZHuwSUNa0b7kfJiSm3b0GgDHcAtaTgsBPyjULEj12/HNE0SCdOcdFG5uao2rw0KyWUK5DdE2JwnquWh0q3aLarAQO24/nhbD9IiVWZSnwi1thxioFU4Od1KUDGqvG9JvneopFiNkDI0Z+AG3NfIvE8+v25zeiIoDqwXvW+jOgwKIfOjnUW7b531SjN747RfYktl/Y//gXNAwwlehBlgz+4g0O0Z+cudvBfheK9Lr58/oI22iElc+s3bJh7VkS7uFeiuuyadHoOq+sodzYzjVTBIrHgDFAvx9/fqPnJO7d6OYT1Wps9CzkjIHrvDYh/gQm8H1QJZmk4xRWMY6usP6/XeIwMkUWpzA28uWzAhN5WUuyGOQyDUwdkd5uZbxHYCTSI9qfpJeQrkyyVHTccb0cxT9FiqH0iNpwyAATcgQVrbX8nToAiCRbRBJOH502wemcEN/jVjjkfEmYRy3bHbXfkei02vVqrPtGXdEybcXhV1uWv7sXwgLdlzxFx4vyVqQ3NAIIBKZr4QRNmSMK9pUJP
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(451199021)(1800799006)(186006)(5660300002)(8676002)(8936002)(38100700002)(38350700002)(4744005)(2906002)(86362001)(2616005)(52116002)(6486002)(110136005)(83380400001)(478600001)(6506007)(26005)(6512007)(36756003)(4326008)(41300700001)(316002)(66476007)(66946007)(66556008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sgaV6xMJO3uE9SRTsUq969GxvnyVNJdkB0gDhvyXaMiHppdlZS/jNYeIkxnY?=
 =?us-ascii?Q?ts/1zg3vYH3w+Psd6gjvgbkLEz+gYE3Qzuk/UcJfhb52cidaKCy3E5vQBLpp?=
 =?us-ascii?Q?3hQe4G+ioSsyv6UCk/tJ55GxZxzQXw28hGaYoqwEKZfLRCvfWyy6edCq6qUW?=
 =?us-ascii?Q?jjZHxiuthon9lblhEDVEq6ynOt8DG/FWkN8ES1Jeimn2VFSCl/68GEgZYcqw?=
 =?us-ascii?Q?ML2/syLlMWBRjGG6KsK+TsmagQMImA7lAmgwVDyjs5MIgJS7L5YwL7zuViBx?=
 =?us-ascii?Q?tWcxv6ZO47ZQUoBnsMdsm1Uxorwz8GHI9sVy+3+HakNIn3IigYGhteeEjqFm?=
 =?us-ascii?Q?DxiZ8epfT+HFq074Wq80YtGOZqNlDOJz7TYBI9XQ8cnxJY66dN963QwSPIQd?=
 =?us-ascii?Q?eHw/rdpEKrhgZ4u/uePRx1hPDGoQ3fY1QPHAgLih3zZq/slji6zJEuK6DFnZ?=
 =?us-ascii?Q?RGf59HLowAa3Ao6jlZOfc9cdH1FAF8xx39x9RwuWaS6+hJNQhCWQ6R4dQ4Sx?=
 =?us-ascii?Q?8sdJenbS9dEbpAbVFfUirChNIZUPm7L1pyKnAKCxUEf9LQV9lpHCYm3Q9hlp?=
 =?us-ascii?Q?snA1jyRIBDLLMiTydL6uXPhLEMlmZ6WUQaH8NfSl+dq/+DvoU+r/Z50KASuI?=
 =?us-ascii?Q?+spg8HDrHNfnjbAUeOewk6e3eiCeMWySCY8Abb+N39sLpiVnBizAWP7trUsn?=
 =?us-ascii?Q?j3rPdwor7OvueorDj57vMEef4RUtfVXlPunUmjvXWVoxrB4u3Zvk6PX3sFW2?=
 =?us-ascii?Q?YTARv7SCqYlB1KqlMbUa30dl9+sERd65lq6vqn5IgyJhmora2KzEo1cntnxK?=
 =?us-ascii?Q?fVC3PBYYaAWRfGrq2E6edbLj6hG49GSaSekVXJPwsra8sgAXdG15WTTpEflZ?=
 =?us-ascii?Q?MC/tR3yP6yG+syMneQd19djU3g3VKtmdzXSPGJIpzGcvw7xBaHTM94PpLk0z?=
 =?us-ascii?Q?cph7lTGh/nSG+4Mz1OZKXesOzfIwoKizJNWnPqnvyTwjhgcEYs6AvlQU37eS?=
 =?us-ascii?Q?quvrZxMLkRBrhxEms432RJoRw2qY1Rj7g8g0vSCRWfoZhMubaRXLQ2GvZ9Qc?=
 =?us-ascii?Q?C8C9x8ePPCnMK8/EGMpwACPHKJcSIR2lZAYL3Qoda4uvFFnphec0BbgaNrYU?=
 =?us-ascii?Q?H81YDUz0POSAcS/zA76jV6uAZvOqpihpesc6Y1Nk59tjgLFxkRjOvkvDTdvf?=
 =?us-ascii?Q?kLH6ZAlVOy7p3NTVknGKdJXf4o2JB+x75OL4aXSFB3P/dK3PzNZt5DcBQvD9?=
 =?us-ascii?Q?XNiljb716sFjXavg9TZi2WELb4CGQB/vcphKAyBH+sntpjQVksSgRBTSQOzZ?=
 =?us-ascii?Q?hjOpuvLJh0XSdpOaaGmzF9Bz5q7bZEt9R5nzv1tmqFxRv4eDF5LA9BNu5XyB?=
 =?us-ascii?Q?S3Dqa946Lj6gZVe8v6Ut/iPR1c0yM0BlVvTgWsf3DqJei1hyv+1jWMXa9wRj?=
 =?us-ascii?Q?W0F/zoNf3F7laU935znUzlo516ZdGTpFmtwgg/hiXRcjRRm6hS5MuZPhyYJ9?=
 =?us-ascii?Q?FllibzfGDv+lNj7To2tb1uWRHJW8D6ZKxN1hs/6rGr1oh+srAknbdGBhHlrs?=
 =?us-ascii?Q?gHuDvlNa8CFbrdVPrDchcyx9xlpp7qgOLCtcYPfD3O933hhjMJ0c7zysfrUE?=
 =?us-ascii?Q?DIZ/IXZiMvwJRq8VseUyj1E=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fe2b6bde-e456-42e2-512d-08db9862db48
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 22:57:35.6863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 FieVm7aWu44WawUjNQXLoKQzskiJTERnkZ8z5M1SCrX61PRpa+oR4mjKoHqC6HjxkVsP9rql9jAaurVZBCpYGYHqsRsYsg0caIOtAYJ0L21N5yT/32uks/O3ev3lW2KL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11379
Message-ID-Hash: 5WJBVAQ7L5TM4JETPIJNKAQXKLYP22UO
X-Message-ID-Hash: 5WJBVAQ7L5TM4JETPIJNKAQXKLYP22UO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5WJBVAQ7L5TM4JETPIJNKAQXKLYP22UO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA SoC merges DAI call backs into .ops.
This patch merge these into one.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 5261526d286f..a8dec24b146b 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2615,9 +2615,13 @@ static int vc4_hdmi_audio_cpu_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops vc4_snd_dai_ops = {
+	.probe  = vc4_hdmi_audio_cpu_dai_probe,
+};
+
 static struct snd_soc_dai_driver vc4_hdmi_audio_cpu_dai_drv = {
 	.name = "vc4-hdmi-cpu-dai",
-	.probe  = vc4_hdmi_audio_cpu_dai_probe,
+	.ops = &vc4_snd_dai_ops,
 	.playback = {
 		.stream_name = "Playback",
 		.channels_min = 1,
-- 
2.25.1

