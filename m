Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B8A774EDB
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 01:01:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8E70E8A;
	Wed,  9 Aug 2023 01:00:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8E70E8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691535660;
	bh=Lxu+C9UiyCz4ICucrxZDNUe74vOMcvWzFNFcMpqRmUY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aGDERAyLSfNDvUefe3TxmFS9KM5gL+mJryr1FfuRoUjSxr+PoVRSMlL6TgXMUd93t
	 poXXOCS65LxxbcX2Wq50rXXA8a6hjZ1zUGd3vazvE68bGBJW3DDA5dkyxQuUR74LoV
	 SFSg/EaLnzKxhWiHa/8Mvku0yGkG2ktlXFxlYkxw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC2A4F80633; Wed,  9 Aug 2023 00:56:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4726CF80621;
	Wed,  9 Aug 2023 00:56:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C61AAF8061C; Wed,  9 Aug 2023 00:56:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2070c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::70c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B9D1DF80587
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 00:56:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9D1DF80587
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=bPIyJXs1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eW3JqChEO5gJb9Sbq+YSj4J9uARVaE9AaZZ/ln88VPhedMYCZyAf7yAUbfmVV8swErqkKcZSILCN6keKFXlZvx9+ZwHWoMkax9sqGi7vQGCSbj0PCUmfojHcF51mf4dGdeGainQq7cxnVOCGrFOAjIXeeiBdeow6mpilTFLWKJZp3MXb3fQU7TZFl2UKMObTfUJIH3dTxSDAUWVS7jrI69wpXazLclPIsf2hfN+kw1OU7qG2CdhC+0fH/DqWvcAcwYdoeRJ1qGIfgiUpQFK2LeYNx2QUSjxpuJVgetx4E7wo7ecC0WQMJjZsePu1kdEb2Pn9oNFN9OHmrxjS7kuikQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=owj1JA0VfjcvkFGEBIjOhhHrYs55CX5/MP/Pn98nwqY=;
 b=JukXldkTRTmGKPlKk5dwHAVCPMjJJE82KCnnr13G9G4PB5ICJ82FQHC68I7KEdb6wc+oLO/AZwyT2R/qS1uH3gzVPtL0JG5Gug4i5Ldt9fizoQH5xNHu/v3uwK9HOfYK7sJT3GK/Ol3FOtTpQgkfOYP/d8pgMZOC8gIAeNA6V+w1TwsEvhlggvW1nnwjcyG9hYnP5C26/5HZs7JBd4n2J2yYS3YnypnXkqYxGshEZBoFDx9mmBYWSVWGJ86/7HTgcvUiy3idnYfttQKiB3qCukK2daF3SI4B6FchxNlC+H6B603QqFmdZKj52tFnK/fAE0XEPyjklP1dqSTPPo1WOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=owj1JA0VfjcvkFGEBIjOhhHrYs55CX5/MP/Pn98nwqY=;
 b=bPIyJXs1TB8BE4few2vD+43iFhX5HAkTlp+HauaEhmoE+lKVfWa77epimT08ttGX4edqO10W+73Gz+GO3n+gq1sjIQAYvwC8hSwmVv1JmM1eFXZm8HKaJWmHEdrFbUzY0jUvcLm77RV/7GcsiKCVcVXjIdaFKsaRJUWflGK4smo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11969.jpnprd01.prod.outlook.com (2603:1096:400:40b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Tue, 8 Aug
 2023 22:56:46 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6652.028; Tue, 8 Aug 2023
 22:56:46 +0000
Message-ID: <877cq5b0sx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Arnd Bergmann <arnd@arndb.de>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 18/39] ASoC: ux500: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Aug 2023 22:56:46 +0000
X-ClientProxiedBy: TYWP286CA0011.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11969:EE_
X-MS-Office365-Filtering-Correlation-Id: c15418af-6870-4c74-8e82-08db9862be06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZDjIgpAB12ZYay0XFs4o4aFyRXO/ftsLllqkF5fqthnsPueBL/JekaHHilAwribxSFHSRMm+rtYx2zjy8vK4m13BgCBTq6eCWpasrbnZV6Dorg5/pY2JNzImLcefj+s/K6q2bfjy8hn0K4hbmXihdyRSrNvs9mb5NsfabM8/bmqUwYfIEHVnM0RK0pIaGww8Xkx71j+w4eOvVOwB4Nyh6PaXMXWo5L0dhx1FBBflXjebLOFTkae51eRR7WCXX5htnCaxbpKsFWOdIVnAUk4eeUFICvAds5E9z7i8zd3DSkq07RNTxsmZt0HUVsRRRM37JfbhGkPWS0RozzKXVCxQjj9KSkVsZlQ/nfqBh58Zu4Rxrd0J8ytmrtcxg66AO8MhXvuKpmTHyKyOjnoGrwGLT8AP+XIBptSUSgRUywgNUAVndwe7i8i/Xk3XmPBOcZ0+By3JqAienrxj1hvpSnleJELZ6kRW+oIOjjT1sgHS0EeLP9NvwSUAZrRCVCI6PLEpJtoikQmH/nmFU9Nv/bLvtZVy9a76q1KG93dWtDIIGxpXdJ5JmfZOpzySRSowGF1yurgB2NWMOSDSYpsEZgFGB5ODEznJZV4SPvtclBygzzeGDxJE0hgdah3e5sJMXH+s
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199021)(186006)(1800799006)(2906002)(83380400001)(316002)(2616005)(41300700001)(86362001)(5660300002)(26005)(6506007)(8936002)(8676002)(110136005)(6512007)(52116002)(6486002)(66946007)(66476007)(66556008)(38100700002)(36756003)(38350700002)(478600001)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mnaJPx8WjRi7HgEXImFiApbZDiAjl2nocrL+lq+1XwemvmDV3I6wKUtdMkQi?=
 =?us-ascii?Q?Mfv8YVZ9vmZ3nvUqJYg4gXPnyYYDREY0izvDtqeHAjPuAaipXsaGHgn4JKL1?=
 =?us-ascii?Q?wJCGkNy2u1udOBj0YdW4MCgDmJk6Cpq6BeMNdqgr0U8qiPthiBMr4ZFV2Z2n?=
 =?us-ascii?Q?jsT/WSduf3/9Lrqs1BhkF/QRJcmb1CdgEsYtLddUSlYyzBoOwUC+B9YWplpC?=
 =?us-ascii?Q?uzWuaFZFJe9rGQjMEFG5bBI6FEK7O2R9jiAJmEyagno0rTpCEuz/KWWkdgai?=
 =?us-ascii?Q?51TdrqcFk7pLHfKF53yIYllbnpv8NUU0nMbRB58/Velw+vKxiJSZmuxoikjI?=
 =?us-ascii?Q?383uSPnGnAHPCK67h7yQT8koE7GIbPaoyc6aoiiNbV8XqEER2O7/GhONrcoN?=
 =?us-ascii?Q?2hP8DjFB63sdkd2JUTdUMbiy0kdWqLih+8iZggVXXi4UrOnMlo06xuyWY9K4?=
 =?us-ascii?Q?xCEbYF7KC/W9Fi47+ZMUnP/qO9L7/Mq/YtBRJcTDorKhzVVrBsHiyrYiPbsI?=
 =?us-ascii?Q?pcxVIPgl3s68+gysQkOOOGxCZMBVXCnG62Xld/j8lVCGZamHf7YPqGYSaSqE?=
 =?us-ascii?Q?/6irhUrHkNFXyTgZM8tzpsDMVfhH/NV6fxEB54476Z8Juwl7pNAoidRalVag?=
 =?us-ascii?Q?mkxazFXF3c43MPHla7N/wjko1H4XC3QlZ0ixqRrbYPGf9Veo1vMeSROiu9K7?=
 =?us-ascii?Q?9ZPc1xKMuzQJQJ/CDegmJi4SukU/eZ/0aFhuSPKzhCrYgKidJf7VQefz1FiS?=
 =?us-ascii?Q?3mous7/LAEgJE8Z3Vqg1l1AhpJeMT2rBCDClv+N68DmUTlbfAk8mGo99tYjc?=
 =?us-ascii?Q?FNxgPKjxU+Z4LIXyNQqjekgIDvUZ8FI9n9DdT8ijGFOqbp77+OlWWrZX3qTs?=
 =?us-ascii?Q?EQxic0yzbYQwzpYVGIfNuL+DE6rjKAZ3LSyZyrhxST5LfKWL0pt0tL9/n23u?=
 =?us-ascii?Q?S2LktNpqC44bF546rnED6VOAOqyo+xyfPo+8FcPYI9/d3HO3PLdYnWHPCtsf?=
 =?us-ascii?Q?zBH4diGW7ZECwXFaq9LItHtrQ3H5gmEgVtcQ266G3bBISIjxpnAgz2m04hRm?=
 =?us-ascii?Q?4YhPg5SV+YC7cHAsuantNOsHIeq/GZ/hphp9xQzzljf7N39hfJQhp9AVg0a1?=
 =?us-ascii?Q?928t9Cs2AX1TruGewJuF+gVivt8ZvkaOiIFKmZwEQEqvMQ5f270CPJ3m3GPd?=
 =?us-ascii?Q?KahBOncG2wPH+3dWMFpM49T4e2jZ8sh6zdt8brY822urmw68jpHiF+akLY2P?=
 =?us-ascii?Q?WcM0fSlgLKPEz95hYm+R7GkgNes4ekJffBswWaIP1Qy+mEZYIv2Yltrdmlsi?=
 =?us-ascii?Q?Iu+J/8M2Wk4jB51lG7BIB3N4SEamTtNFTSAgXVRdOSMTR5t9YbrydrIFDUMT?=
 =?us-ascii?Q?cOpP3/PYOnKmE/3HuUk3sm3UWsqCCFn+P6RvFluckcVKEuLaGf+65WdpjbJb?=
 =?us-ascii?Q?a7VfdXuOzKAm8ry8L1A6SxZerBV73EChpQF4IGJm+nHyrxB+I+DPhPylKhfQ?=
 =?us-ascii?Q?yGtCwynCNaUXjDJSs2FLzf8mYODaIENkQ7YWrn2Nj9Y7601Yc564dDRidF3K?=
 =?us-ascii?Q?CsiM00/Gy6qnqH4eiN07kOu+XcT+VImQ2gHAsp5ffmbKUTMwWSyFy0Ad8KAO?=
 =?us-ascii?Q?mad6/3ZKU1t9QDQwKC+0AZg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c15418af-6870-4c74-8e82-08db9862be06
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 22:56:46.6329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 7DUu2DcuzHFKagzGJbAkkyNbEwzaR3jYp+ABnVA3mnlCSLhKtsTKI6BI2OUJ2kj2EJtJitTaXTQLwwEDRzVcYoffIO80AOUbauro1g1WC9QwsRtia67PsUEspbyilSTB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11969
Message-ID-Hash: 527QVICFKTCKRTJZKNOZCIIJLWPH2MIG
X-Message-ID-Hash: 527QVICFKTCKRTJZKNOZCIIJLWPH2MIG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/527QVICFKTCKRTJZKNOZCIIJLWPH2MIG/>
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
 sound/soc/ux500/ux500_msp_dai.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/ux500/ux500_msp_dai.c b/sound/soc/ux500/ux500_msp_dai.c
index 44e88dad8584..cde0dd8e2569 100644
--- a/sound/soc/ux500/ux500_msp_dai.c
+++ b/sound/soc/ux500/ux500_msp_dai.c
@@ -683,6 +683,7 @@ static int ux500_msp_dai_of_probe(struct snd_soc_dai *dai)
 
 static const struct snd_soc_dai_ops ux500_msp_dai_ops[] = {
 	{
+		.probe = ux500_msp_dai_of_probe,
 		.set_sysclk = ux500_msp_dai_set_dai_sysclk,
 		.set_fmt = ux500_msp_dai_set_dai_fmt,
 		.set_tdm_slot = ux500_msp_dai_set_tdm_slot,
@@ -695,7 +696,6 @@ static const struct snd_soc_dai_ops ux500_msp_dai_ops[] = {
 };
 
 static struct snd_soc_dai_driver ux500_msp_dai_drv = {
-	.probe                 = ux500_msp_dai_of_probe,
 	.playback.channels_min = UX500_MSP_MIN_CHANNELS,
 	.playback.channels_max = UX500_MSP_MAX_CHANNELS,
 	.playback.rates        = UX500_I2S_RATES,
-- 
2.25.1

