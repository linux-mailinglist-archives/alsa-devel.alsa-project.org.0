Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 768BA7AE5CD
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:26:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D790BEB6;
	Tue, 26 Sep 2023 08:25:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D790BEB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695709568;
	bh=RmsLKG9oQ7j1XgS2INAf6+K4bpIXd855SO2hdq4lSGE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QKtoBfwVBZu34m+qjiCbWpSZe8A+n4xkUxsRXsk9bBMOZvA86NBcwQ7KxggXndKiz
	 C3jyMaAj5ujtjtwo2SpSMia2xxIk2oU7pjkxxwAs35nF2VNZpjrbPmkWI2Og1bq0i2
	 DvrS9YSays9Pyer08grZpx7IUYscN6x9tOk5oH2M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67776F805FB; Tue, 26 Sep 2023 08:22:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4D0AF80558;
	Tue, 26 Sep 2023 08:22:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE81EF805B4; Tue, 26 Sep 2023 08:22:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20709.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::709])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D66AEF805C0
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:22:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D66AEF805C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=NCanGAJj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JfjbreJBpyLBO9+tpdQyU8tT6FDkiuBP6tJ2/bSllO7yZdUkrKKLxNugY6G6fkjXCzH7cDbvUkLC7INAvHghEKRjJk1OU6OSM7oxEZk45daahWaErMi9aco/gG6zSFnJojYbS3q6RKdHvIdyhTfDfHHqRD0qSbbO+cJGAyabYPAQaMwzkIu82HCOyncj2Lhw+aBrmxdg6NtzE6e4VrYZBpj14gdiABNkx282jp1afS+k1YNGv7g1hGP6PleISfGPxHdSKYTUSddb9bGcp1gPlRYSX3UJJpm7scHZsw8GX5BBhivw4wgy/WZg1bB5NqAXsSphkV2VWa+BKiLgORnXvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eBkIiolKIH+EfCoADWKQA2TeSTGB1yql1Z8hlVUZLD0=;
 b=f7aBUinZlnqN+w5vsjTvD2Wob73YgrWwrkAWxtWQTUGLuuV9qlvubSFukASnzWofjKzC4DvvmycgYShhRG7f6/vjXiSFo5OptmxzD/LXJqtsCpDrksURhfaMghSn0t9yL+LPWmOeTeYAhj7UD2Zfg6mG6eP6CmWom4RCO3U+S3wIBBVlsaFq/ipYdFhg1+pD2p/4dvIpK6PX9TcHgavybSoG6w3zP5Zj4/OpvghrEXelU88F01clxxF2ppXewCyGzdHdrkS9rEkTzhPNRUkSabCDYZjt8dy5rak6D3cEqFMokYaqJCTIhoms3g4rroEIbHQ9rd7rpo0wlOuHQiDAdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eBkIiolKIH+EfCoADWKQA2TeSTGB1yql1Z8hlVUZLD0=;
 b=NCanGAJj2nr+HuB+SGE7mLlBiqUJxoqlQETmydle56L/jnpE14wD+W8/0RazMvZDPDkJJuRNrUaTuDESfYFlGu/XB6GudySexPlFiAnt2HilUU/LxOvzQ4ymYEaY6qPS6QpZN3MQfZ99gN3A+1lTo/jQdrrzVOOh6PqVRwBlIS4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB10364.jpnprd01.prod.outlook.com (2603:1096:400:240::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:22:26 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:22:26 +0000
Message-ID: <87msx9h2se.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Takashi Iwai <tiwai@suse.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 alsa-devel@alsa-project.org
Subject: [PATCH v2 19/54] ASoC: meson: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:22:25 +0000
X-ClientProxiedBy: TYCP286CA0170.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::11) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB10364:EE_
X-MS-Office365-Filtering-Correlation-Id: 006291e4-926e-4d52-a3f9-08dbbe58f3d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	008wUtxpnFtjFD/6zP0RVN9fk9R94gtipwGMWFhi+UPTXJXvd5zD5BVXN/wfXCq9MpSssEweZrc/Py6Kzi12SbBy2Gdad229l63W5be4lKb0qgjm9e0w//LhrWL4cAUQG6yHy30eILjqGpbW5jXZM5IiL1aGGU5dvqFroCtW8BL/7UA3MfRdmRGyva03PmNKozTPxehzOb/M0gB7F+8xB8BZaswJZRYAkfV51AuYow+04F9rBw8R0LZ8OFU7Y1CQGwVMMjXXAnttUtNofKLf5nnQMBL0FiyHDbYZVskIg7Pocz+0svy2wnM3gsNK2tvwJOOA2+iuKkKW25EAZzQOWsf9artVZAhIrZlrjdSoPcvB1jOzP9YUwjHiY6E67DziayeaYTjNsYR2puCHdSM3hMX+FdoXktwoa9FWODO7246IMYu72GgW+mYi/aSSPyg+3yDu/8tiCCOf5Dwamg+r2BIFSOtNhD8E3HVMVStiqYT4C+V+1+b2t/6XpToLxxYXaI9NANgjlABEvjALNjH7gwW0BgHwowsSMcQuHIU49T7Sa/4rwNTFZRFvSrYcbODlxe2ow5BWNL3p14GIEhgRaKt4rzgvMphOBFlAA/pDEgLKIsOWrVQJaQ7OIjaFWJDfHKCFxRUEK6VB1Pph83VL/A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(39860400002)(366004)(346002)(230922051799003)(1800799009)(186009)(451199024)(52116002)(478600001)(6512007)(41300700001)(38100700002)(38350700002)(316002)(26005)(2616005)(5660300002)(83380400001)(66476007)(66556008)(6486002)(6506007)(110136005)(8676002)(4326008)(66946007)(8936002)(2906002)(86362001)(36756003)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kEQGQSXQWCi3cVLJa0OnIiysTza5u2TO0OcwD7xLQTXZlVgshaTsWnSswdmS?=
 =?us-ascii?Q?jWCpGcCK4z1gZo1YgEiDMW9yb9VbT9Qb9Al/ZhAWTwMZscTVmV0oy1V+pFAs?=
 =?us-ascii?Q?3mu1u9vXys7DPhoigsy2AmqNTZBCbNmjriWGp4kEjiwyvvlrG7t5erpRmFUR?=
 =?us-ascii?Q?WSkSQ5tF0SsXXa61aKxQr7KwbxpQLjwqNOoi326g2k4/rNM39O9ZzTRU67Rg?=
 =?us-ascii?Q?3UNRbh3wqRyitsPUHxg+La/L99jtV6jnSSAy4kiPKYi9WrdXnFbWv8vqhdRQ?=
 =?us-ascii?Q?Ib9O+vJyV5kXH9k3cuANRGtpzxhfKFvprZkdvt+/hJvs+U75n+KZqEfykREl?=
 =?us-ascii?Q?7zzYJwcskIyi2VwRUJ6b/W3ppe5ffi57gQY4GusVlrbxdvTsciviQlKyAqg1?=
 =?us-ascii?Q?IckVPJ/my3uUziLzSvaI1QDyfWrrN6bNBwA5pUSz1r5SEQ85My2RSIaRY86b?=
 =?us-ascii?Q?3k67dPK8JHv1jSrdMZKgxxqxawZimzNOMvjvoy5yXQe/VYVDAYkva9POaGX1?=
 =?us-ascii?Q?G/gJviVDt9PDqnkJLWnuQXwbGao6o45BZZuWe3irKN/R2rSm7SUEl5ibvpVK?=
 =?us-ascii?Q?KBNWKCC1csrBYKsT4KdClmi0kpFM1gD7s/bbBoQO6Hszkb8jAcge8pIBsTXr?=
 =?us-ascii?Q?WE2d/CJpquXffDCCPsr4XjRghr4SVuPpkzgDbqpfeI6/ynjtvFyGctRYQAb1?=
 =?us-ascii?Q?OSR2wSa+k8mZAhUXVnL7XlKei9OJQ3ChjR+/cc+45N0bGPxE9QZ52MciPWT4?=
 =?us-ascii?Q?zNUXyy4gHOuDCmvE4LV6UHdFevG0YeKxcU+jFQcQBbTOFTzr/9iU9dqmOrmR?=
 =?us-ascii?Q?eEIYipLEZgTC3GcIzbSXAi6zoPnZawtAEy1B4WAhVxCkTDr/xLOoy+lMpOE4?=
 =?us-ascii?Q?y6/cMzLcPbBXiSlZmAGp4lNYHsG9q/Funh/MGb2kmOAsvAHKqohX/nZ0cYy6?=
 =?us-ascii?Q?NKb81/CAbmsry5eOTHiU7YA77b0u/DoFUfV+kxHBOV3ouFVdOWGr+BRLdO6L?=
 =?us-ascii?Q?M1ufeHQ+MEGZKVqdUlO+P/igMvpuGQpSXG5oqE/CuGwef/hhg5Ys5rOYtoVU?=
 =?us-ascii?Q?jHfLpEidx9JCgl28s3YZm19Cz1Q9IRYcYJW8fe4QPWp/i9ao+UPVVzviObeW?=
 =?us-ascii?Q?sa5vfk8cwFA7a2a1HO5pboYHfcpqUf+wLkk5kaZSkRibmLhypZnnSZ3Rj9uZ?=
 =?us-ascii?Q?aSDNE9XFGfkAaUlW7xly/usbmgZ+9/vfaMkMg9Hz7M5zkvCRgxDcDWOBrO8f?=
 =?us-ascii?Q?QEuoBoviOjlLHUx/PS3Zb7MKjScBp2EJxhlfPgdWjiZi0vinPrwyG37h5O3D?=
 =?us-ascii?Q?Ce0APyOwHFobsgtWIFLrrlb8KsB7/g2behQaa8uSq+pZ/pIRbX/DBLcdLwSv?=
 =?us-ascii?Q?a4P09XbAc1BHxEFTxWcXLbnzvGB4sFX1JoDVMmjfE7EqYKA/4E6r8bW9M+pb?=
 =?us-ascii?Q?onQI5u38BmHVfnvW1AstvvNj3RMg/wpG3AfdOXEocrmzV6s/ZTmUD9YfdyQr?=
 =?us-ascii?Q?pkuo0hJxkhCopjsmdCzzTRcEK3GGhoo2nAx4qXk61Qi5cwzY1D6NnwKL958E?=
 =?us-ascii?Q?s9z6fJuE68nNvv8NvWLJSQqdHB6DH4yU5KqfTTbz8WKPxbFvBE/gYOS3w37a?=
 =?us-ascii?Q?1zMPH7w+I5EFJwlijVolwwc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 006291e4-926e-4d52-a3f9-08dbbe58f3d4
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:22:26.2630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 R9dDNV+IqhzgsJJsG9YZsc2HuMfddiXjG0aOqOqsxsf+Ntu4PDq60A1TLJteYBdp8UXW4MRLFGuSqlXcAdL4tIbtdcrvM14M8nOFPcdcGfMOtmpkDyTnBk8rXCKHme4G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10364
Message-ID-Hash: 2MPXUVDQHEKZYUVSDBONNDDG5QPFRO66
X-Message-ID-Hash: 2MPXUVDQHEKZYUVSDBONNDDG5QPFRO66
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2MPXUVDQHEKZYUVSDBONNDDG5QPFRO66/>
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
 sound/soc/meson/aiu-fifo.c         |  2 +-
 sound/soc/meson/axg-card.c         | 12 ++++++------
 sound/soc/meson/axg-fifo.c         |  2 +-
 sound/soc/meson/gx-card.c          |  2 +-
 sound/soc/meson/meson-card-utils.c |  6 +++---
 sound/soc/meson/meson-codec-glue.c |  2 +-
 6 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/sound/soc/meson/aiu-fifo.c b/sound/soc/meson/aiu-fifo.c
index 543d41856c12..4041ff8e437f 100644
--- a/sound/soc/meson/aiu-fifo.c
+++ b/sound/soc/meson/aiu-fifo.c
@@ -27,7 +27,7 @@ static struct snd_soc_dai *aiu_fifo_dai(struct snd_pcm_substream *ss)
 {
 	struct snd_soc_pcm_runtime *rtd = ss->private_data;
 
-	return asoc_rtd_to_cpu(rtd, 0);
+	return snd_soc_rtd_to_cpu(rtd, 0);
 }
 
 snd_pcm_uframes_t aiu_fifo_pointer(struct snd_soc_component *component,
diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index f10c0c17863e..18b16274449e 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -40,7 +40,7 @@ static const struct snd_soc_pcm_stream codec_params = {
 static int axg_card_tdm_be_hw_params(struct snd_pcm_substream *substream,
 				     struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct meson_card *priv = snd_soc_card_get_drvdata(rtd->card);
 	struct axg_dai_link_tdm_data *be =
 		(struct axg_dai_link_tdm_data *)priv->link_data[rtd->num];
@@ -72,10 +72,10 @@ static int axg_card_tdm_dai_init(struct snd_soc_pcm_runtime *rtd)
 		}
 	}
 
-	ret = axg_tdm_set_tdm_slots(asoc_rtd_to_cpu(rtd, 0), be->tx_mask, be->rx_mask,
+	ret = axg_tdm_set_tdm_slots(snd_soc_rtd_to_cpu(rtd, 0), be->tx_mask, be->rx_mask,
 				    be->slots, be->slot_width);
 	if (ret) {
-		dev_err(asoc_rtd_to_cpu(rtd, 0)->dev, "setting tdm link slots failed\n");
+		dev_err(snd_soc_rtd_to_cpu(rtd, 0)->dev, "setting tdm link slots failed\n");
 		return ret;
 	}
 
@@ -90,10 +90,10 @@ static int axg_card_tdm_dai_lb_init(struct snd_soc_pcm_runtime *rtd)
 	int ret;
 
 	/* The loopback rx_mask is the pad tx_mask */
-	ret = axg_tdm_set_tdm_slots(asoc_rtd_to_cpu(rtd, 0), NULL, be->tx_mask,
+	ret = axg_tdm_set_tdm_slots(snd_soc_rtd_to_cpu(rtd, 0), NULL, be->tx_mask,
 				    be->slots, be->slot_width);
 	if (ret) {
-		dev_err(asoc_rtd_to_cpu(rtd, 0)->dev, "setting tdm link slots failed\n");
+		dev_err(snd_soc_rtd_to_cpu(rtd, 0)->dev, "setting tdm link slots failed\n");
 		return ret;
 	}
 
@@ -125,7 +125,7 @@ static int axg_card_add_tdm_loopback(struct snd_soc_card *card,
 		return -ENOMEM;
 
 	lb->cpus = dlc;
-	lb->codecs = &asoc_dummy_dlc;
+	lb->codecs = &snd_soc_dummy_dlc;
 	lb->num_cpus = 1;
 	lb->num_codecs = 1;
 
diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index 2e3d0108179b..65541fdb0038 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -47,7 +47,7 @@ static struct snd_soc_dai *axg_fifo_dai(struct snd_pcm_substream *ss)
 {
 	struct snd_soc_pcm_runtime *rtd = ss->private_data;
 
-	return asoc_rtd_to_cpu(rtd, 0);
+	return snd_soc_rtd_to_cpu(rtd, 0);
 }
 
 static struct axg_fifo *axg_fifo_data(struct snd_pcm_substream *ss)
diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
index a26b620fc177..01beac1d927f 100644
--- a/sound/soc/meson/gx-card.c
+++ b/sound/soc/meson/gx-card.c
@@ -29,7 +29,7 @@ static const struct snd_soc_pcm_stream codec_params = {
 static int gx_card_i2s_be_hw_params(struct snd_pcm_substream *substream,
 				    struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct meson_card *priv = snd_soc_card_get_drvdata(rtd->card);
 	struct gx_dai_link_i2s_data *be =
 		(struct gx_dai_link_i2s_data *)priv->link_data[rtd->num];
diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index f7fd9c013e19..c81099218597 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -13,7 +13,7 @@ int meson_card_i2s_set_sysclk(struct snd_pcm_substream *substream,
 			      struct snd_pcm_hw_params *params,
 			      unsigned int mclk_fs)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
 	unsigned int mclk;
 	int ret, i;
@@ -30,7 +30,7 @@ int meson_card_i2s_set_sysclk(struct snd_pcm_substream *substream,
 			return ret;
 	}
 
-	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0), 0, mclk,
+	ret = snd_soc_dai_set_sysclk(snd_soc_rtd_to_cpu(rtd, 0), 0, mclk,
 				     SND_SOC_CLOCK_OUT);
 	if (ret && ret != -ENOTSUPP)
 		return ret;
@@ -177,7 +177,7 @@ int meson_card_set_fe_link(struct snd_soc_card *card,
 			   struct device_node *node,
 			   bool is_playback)
 {
-	link->codecs = &asoc_dummy_dlc;
+	link->codecs = &snd_soc_dummy_dlc;
 	link->num_codecs = 1;
 
 	link->dynamic = 1;
diff --git a/sound/soc/meson/meson-codec-glue.c b/sound/soc/meson/meson-codec-glue.c
index e702d408ee96..f8c5643f3cfe 100644
--- a/sound/soc/meson/meson-codec-glue.c
+++ b/sound/soc/meson/meson-codec-glue.c
@@ -98,7 +98,7 @@ EXPORT_SYMBOL_GPL(meson_codec_glue_input_set_fmt);
 int meson_codec_glue_output_startup(struct snd_pcm_substream *substream,
 				    struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget_capture(dai);
 	struct meson_codec_glue_input *in_data = meson_codec_glue_output_get_input_data(w);
 
-- 
2.25.1

