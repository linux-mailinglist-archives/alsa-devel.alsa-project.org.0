Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BAB7079E2
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 07:52:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 473D0822;
	Thu, 18 May 2023 07:51:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 473D0822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684389121;
	bh=3UAWpJyK9GEvSTkQzT/uVHN+RWkQFnJpy2a5VbK9LO8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r9lw3jSdaQIlRhnylPjpxE6Evqd5MQEKfwFzVOMPi+w9jaxRua8Rwo8/aTkifJcI3
	 494QYMxosClZwnrm5ce7LQwPL8cuwolQkmNNQA3A9mwQtw+X4Woz14v3zky9EV/y1K
	 uasbB2iLqgwitUV0DX5xlDSroIczMbUbWBtbP67A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33FF4F805CB; Thu, 18 May 2023 07:49:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C0CAEF805BA;
	Thu, 18 May 2023 07:49:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 863B5F805AA; Thu, 18 May 2023 07:49:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2070b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::70b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8EFA8F8059F
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 07:49:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EFA8F8059F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=pQymLS3o
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VjI0GawbaW7TDZTKcSf49boQnFnC2P5TGUomVmObVd3jOL3b9Zye4f38sHOBj2UdGYg8opwpvzaYd02kB5beCElHiQF5nRNQgSKEksapmYRJ8YEJpUqvOkTpmaHuH5WeLZpjNAMITCOlX+AqSkOVHq9U2te79/JWXG6jbUyQa9XVphhXlQWmujtooKi3Q5KlKuON0Fo2ihffSX2DcpOWHpud9gxUcl8tvWjnivdT8SZgKx0HGaEd8Ak3c3dTdAkV0cWMY54w6mQLS0k6NfVOrK+iZ+hJla0VFYM3nAwqKUguFCo5VUmUcI7AgEJ5+OiCkTjbKQnqUSCBLNB8XNB19A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/KvGg+GtRs9ZSxrJdNNHMdnxhkoZHdRwXbE8vxwnTTQ=;
 b=Z6G2bt+e+tYyQpBGvzMz3bFkKxz62ennMj/mFEOfOuYOQ6zy3llezq9v61rI9AAsmJj/BotQmTCP9d443axoj05zMAcd7LMoMjoJ92p4l4fgNXYTv2yJFZu3Fj+FrXWtacoZVXPT3ZShVEQKi+6q1B/NlqEQGFys07hZl6LunjCW7DHhE9z2A/XsCLr0CTIPHcUVb7zcrTayzXdjp1LEo+Q0awo6fcRy73mBMd+W2Ws/d0shhZnO8URGzXNE0usaZYeQknloK1TPQ9luj06Jspro/FLYyOXcuc4UbVzoQDmr7nxGT1PuuVkhGD02V1e8728v83KLR9LDkQpk+rZfDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/KvGg+GtRs9ZSxrJdNNHMdnxhkoZHdRwXbE8vxwnTTQ=;
 b=pQymLS3ozijzzxs1JnRlaaaRC3tKLZjo2vWuYGLgtka2l9vMe1FPizkqQ1EfFPJXq+fu3TZDYTW4rTZA0Q9LH5B+mpQFX4JsDV6unDX8KF41bJGxLnQlMBPnUP0EABfF/AVA1UqkGBLiYZTCExZCx+qqwVaD8U1rYHRPceTGWMo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB5591.jpnprd01.prod.outlook.com (2603:1096:604:b5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.18; Thu, 18 May
 2023 05:49:08 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6411.018; Thu, 18 May 2023
 05:49:08 +0000
Message-ID: <87ilcqp4tn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
References: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 14/20] ASoC: samsung: replace dpcm_playback/capture to
 playback/capture_only
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 May 2023 05:49:08 +0000
X-ClientProxiedBy: TY2PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:404:56::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB5591:EE_
X-MS-Office365-Filtering-Correlation-Id: 886c6433-5348-414e-6fce-08db5763992d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	B8SJEylmoJKCLSEn9/bheYMb0KcC3/2sAgE3ktriXZNeWS/ZjGF7n+ItPgUPswGfrj0D4mohkTSbv2gnldbXR4vy0Nne7rjTG/XqmsW0XDm38kK2ti8nOTspOJtL/tEkUMiG/JxRJ6IgPU+4/nUV6nAhrRh2do229StGvrmp5YYROvcnl01EtCI5Gsv+Jdd3wYU7npADCSHM3ie9b0g/ZCeU5QmrdrDL7vxmlBiWzJCMErYW8Q/ELTpS3fONgaICRwvW9+neXnzyRD3w9HGmrWvToMBOPz4cEhHO+Bb9NFF3IY9qhDdmB6tNm48RivbmhNZBMi4EME7qdK9q3DhAHZLI8IymgpSQ3JkAJIarpTGFiQxqI8lEehXzZKtjKE4EeV2C0CUUn1b1ec99LH0/El0+9JcVmoUmD7YjU0lav+2x94NM7sOPcVKAAPrMN+me8MsqronR0SFGd7vdr64VVpLPltf+2wmdmzZF4XAa6DRCcP+sNXDXDhfJ7RrF+K3BpBd41ihsEhPo6nfZ7Oh0h6XD10JDnmHazdoj9luEExPsPg0LP4moXVwHGc90nH+vGiLdXOFBVosY19k+Lxsz6zrw4fFxrYj/Ta3mTgDduatVwGABt7O1CnI7H22Dl028
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(366004)(376002)(39860400002)(451199021)(316002)(4326008)(66946007)(66556008)(478600001)(66476007)(52116002)(110136005)(86362001)(36756003)(83380400001)(6506007)(26005)(6512007)(186003)(2616005)(41300700001)(6486002)(5660300002)(8676002)(8936002)(2906002)(38100700002)(38350700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aRUGduxp1+kRa0Oc801MsMrSciqWJff9bn3XmAr65/6mYH/LmeI+aHuSixsB?=
 =?us-ascii?Q?gLvI0ncJcRezlBhvM0ILfQWc84q6MQCKtK7b54SOe4qD9t/lG22ptv6Q7bks?=
 =?us-ascii?Q?mwoSuv6ASv5L/w+lR7C6hgCzy+qk28MRiOsijU43X1ta63P0/JNrlDpI2ax+?=
 =?us-ascii?Q?zWCiGdRH0OkJTuPkfbpLAHDikBt4rBfwY674I3qs+ELikogy49NUdlSfLoKF?=
 =?us-ascii?Q?4DWrrXTbm6zNgjTLKHUGd1YCP0llymveUu1w8+jpMs8yl9E5w3ebI5n1j6R3?=
 =?us-ascii?Q?6y8fRpgSwbm5CrX/9iXxLWsSvD6eibcRm55xU8JN8eTmfnnkzQuZiV5P1P+s?=
 =?us-ascii?Q?ZLweeqjLA336OGy2hVknVzGtE/X2yo+ZL62Uhmr6b4jNZoijb9VDtQzPLRJO?=
 =?us-ascii?Q?7OWk4C8GrzQsNx5l2+e6Yl6klX5IMM9/HCNHiHym0d3EKEZVSLESWH/MaBGW?=
 =?us-ascii?Q?04f6sjtnEj4AS+PcBKApgdE8wyh3nM0ZWDGLdHMYovVXT5YVwRiqwtPkDcfy?=
 =?us-ascii?Q?qwTYFfBYOVb6Q2YXcAkaUKJ2vVoT48gnn+XOgaXPG1o9fJgUclEnDwkRtm6J?=
 =?us-ascii?Q?qpXRj0Oby7hCgM6l3nxqjzW3GRMI0vVrX4jJLy7rZJP9+viGr+50O8eUUqWl?=
 =?us-ascii?Q?/Ft9W65WTlyik95et75KasikgNt1AHwmLcm3a88aMc8kgozydwuDnprtGzRJ?=
 =?us-ascii?Q?awhspBrNsUr2mUoFQemerKBW90ozxhaR0TTZGITdHZV063HDGJpgOu3B4OqW?=
 =?us-ascii?Q?5c9yU3lK52TX9WI4qHlfJ8qNc2WRjwnDSmrvgNcGIBpvV+3TzJGgz2y1OpFD?=
 =?us-ascii?Q?ytx/HdxbKrUF90xOjFNM8cIwHevGZ4YhMYKTW++8RPdMPOuLTbMnOthc5WK6?=
 =?us-ascii?Q?0sPToT4CQOnZVyZnKKq6wwuZsvZ2IaXjsPN/ih2rEdgEx5mBuY2bmfu6Tdc8?=
 =?us-ascii?Q?Yn5va+tOLWhZEJN6tO+opZshNcfcWIDSqVfpHYDJtZMeZuCyJLLxYE1Y2h/7?=
 =?us-ascii?Q?9oAQhskcUzn6DFrek4jzzMSILRcvAUKwer0B9cg7Ig04w2ZwHi0KM0O9RczD?=
 =?us-ascii?Q?DocV5ZpXXZVkQqzSqVi+nDxtdKN2BHNtnWT2f4EWSvh8LX5mdqLpja4iO+Ax?=
 =?us-ascii?Q?Tpp7N+g/H5YBVVTDsooy3bP5qHBVxJ/zivhIQKEfWEnFPCSZ561vvVkQZydi?=
 =?us-ascii?Q?i0EP/ITtnyNSaVWEkw6UrPbiY1nF0f0r0dPWArL7GUpZ8jmV8cLcpy0/OjTp?=
 =?us-ascii?Q?nwX7HSKREgCbP1f37YcaezRhPDFGlHfEDggprPmFbEZsyjQtRxYw02pnlkAV?=
 =?us-ascii?Q?kfyC7ptnnzYLrU3lDxVheINNfx3MDgxLFMfshEm5ZfLJ9y8Ob4sQlmN48sMH?=
 =?us-ascii?Q?FddarxzKRUAsW8XnO9i2Bj/j2emngjPHhRczCBmeQCsk1YDqtpUPK7V2qEmH?=
 =?us-ascii?Q?qQ7kwjPGFMopmakFE/svzoTYMtkUUhUN5saM48fzcUXFWTfq31S16Za6xUdW?=
 =?us-ascii?Q?maPg9PntwRvg40kEzYIs8iORkP8sACmtlRNWAYz6EYr2XPuJ8oUu9a/VmiS9?=
 =?us-ascii?Q?zivGJ7ueI5SJ+7H4123c2slXwXE9XHdlUEiBr0w/+p/Shle1iciSdZ5peP+Z?=
 =?us-ascii?Q?cOsWZdNdazvBTuB1zQWSNOU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 886c6433-5348-414e-6fce-08db5763992d
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 05:49:08.7352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 S1etStba08Y3UcatrMWRbvxqTb5gu3EmPbUPa7cn4eZW3mgy0qOWzc4VOMwM+fwBM5xWnqFoPHpucnBgJ5MkyCgkrJUSYH8msODUXrlr5mhWIC7m6EAOs4Ic5uiD0dod
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5591
Message-ID-Hash: IFVJB2P76AOMEXOKYWSQ5LZUAMSMT6TU
X-Message-ID-Hash: IFVJB2P76AOMEXOKYWSQ5LZUAMSMT6TU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IFVJB2P76AOMEXOKYWSQ5LZUAMSMT6TU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_get_playback_capture() is now handling DPCM and normal comprehensively
for playback/capture stream. We can use playback/capture_only flag
instead of using dpcm_playback/capture. This patch replace these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/samsung/odroid.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index fd95a79cc9fa..3fd6a8c2c0fe 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -173,14 +173,14 @@ static struct snd_soc_dai_link odroid_card_dais[] = {
 		.name = "Primary",
 		.stream_name = "Primary",
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(primary),
 	}, {
 		/* BE <-> CODECs link */
 		.name = "I2S Mixer",
 		.ops = &odroid_card_be_ops,
 		.no_pcm = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 				SND_SOC_DAIFMT_CBS_CFS,
 		SND_SOC_DAILINK_REG(mixer),
@@ -191,7 +191,7 @@ static struct snd_soc_dai_link odroid_card_dais[] = {
 		.name = "Secondary",
 		.stream_name = "Secondary",
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(secondary),
 	}
 };
@@ -293,8 +293,8 @@ static int odroid_audio_probe(struct platform_device *pdev)
 
 	/* Set capture capability only for boards with the MAX98090 CODEC */
 	if (codec_link->num_codecs > 1) {
-		card->dai_link[0].dpcm_capture = 1;
-		card->dai_link[1].dpcm_capture = 1;
+		card->dai_link[0].capture_only = 1;
+		card->dai_link[1].capture_only = 1;
 	}
 
 	priv->sclk_i2s = of_clk_get_by_name(cpu_dai, "i2s_opclk1");
-- 
2.25.1

