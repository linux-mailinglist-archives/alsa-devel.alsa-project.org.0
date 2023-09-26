Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D937AE5DD
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:28:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F698ECE;
	Tue, 26 Sep 2023 08:27:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F698ECE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695709710;
	bh=zf8OKXFFd4Wroxp0L5s/4wLAFdYDzgytUtdYqvd6ijs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JNWN6C12OOyJ9dsTyOGujpdqAZfVrBCAB0RdhhcWParF4plnc6D6MHhDc1kR/+KOq
	 VrhrYQt4FQPGu4kBu88x7xG+nnxKsJa+5jJEi14ZorR6Dc8D5ZNsi8pFYxoXRiJsbG
	 SSlYOe9kNdO22lLmRJ47NwUYvloLRro9HxP+pDeU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 266F4F8064F; Tue, 26 Sep 2023 08:23:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CA5BAF80637;
	Tue, 26 Sep 2023 08:23:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78122F805CB; Tue, 26 Sep 2023 08:23:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20722.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::722])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5BBEBF8047D
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:23:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BBEBF8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=SuO7j22A
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YRcaSoH4smgwd6O2vLQR75WlWcCOqdS8cz4O8Sg/+pJ/9Rw/qxynmmUKm3OxsNZ+HYBHx8VDxAxer/M8Mf2UDnWVMy/5tTaQ1xhRgOlA6nyd5ItiyIYf3CLYf7UxuCqO6K6pwirQT0YmcjFrT3P4nYvmoJS+0XT61qRTko1ZkZhlydCThWEZJaBwqxVUEk7oH4IBcxQtWtIklT6Z4sXxZsCbymQhB0VPT9Cdcwpfb8lv1Y7yDPRhNpAYQa8oExvEwbY3fdFyNf2TxXKKnM9Lejn5GBMFRr6zsfeRRqSJFszSv/haNV4qVewD7dVyhWlhETJSqTqUdUyWgSKStd3QFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13P8ejIRGUW0GrW61sdH3GylMp23EMWGnGgp0Jflqt0=;
 b=XIec2BbMFuDUErb6YuHisPu7oJjVIWv5rsV0Nwk5fdMK7SRiAMDF4pos6LZqmOQbaKk5vlO+//9hwi+8MT0vhZJA4KVdbFevZHVMfQf9FWckCgISzGwEIV04NlcHsE3DgCloU9g5RDwKDYJ1xDp+JfCzracqB9tHzbA0drDiYdm3bo6L/OTWGF2P5wzg5Wn4ZTrpkfvP4VZkQFlEvtZg1lDAxHdYrIsHFgvmoFQAXN/aqNvDlNq4DPRd+ntvFNlbde7urljmpKqhD2nNav1nmOVHyT7wCJIwTz2D5xGjjsIuZpV+hBtzlsSvzJ+A0hLupusuttwtXVTQOwtZYgT9Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13P8ejIRGUW0GrW61sdH3GylMp23EMWGnGgp0Jflqt0=;
 b=SuO7j22A41RcIdB+uKrfbHsUdaboVBgyTv228O9cRf+rM6i9Qfc4EL2cICwfhf/EQEmCZdSJCqchOUQoVlOr0xZ27qr/vPEuH23wdTodeZT8u0QBc5/IjGpvg37/d7hXOdnI4On4z/jYwG6SiPPf2JE+GaNZi7li9Se+LVFZmWI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB6175.jpnprd01.prod.outlook.com (2603:1096:400:4b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:23:19 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:23:19 +0000
Message-ID: <87a5t9h2qy.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 28/54] ASoC: kirkwood: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:23:18 +0000
X-ClientProxiedBy: TYCP286CA0309.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::10) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB6175:EE_
X-MS-Office365-Filtering-Correlation-Id: e4a4127c-c3ee-4605-512a-08dbbe591357
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Td4xKrZfCGkNOAhR/j0ecx7CLWa4I5wFBuzaAunsQMuMTVl4zbiheyv7eEeAtG273v74YZGA+SE4PeGnybW0B2k+UYE6PIUPhW8hYCz87Mtyty9HjeH4/VPnEUnRhtUz07C8/oEZkDL2L+fH/GwpVibHHtgg3Se3hdGsqU75k6S2Zd53iXaONXiHaaxREp9aBxUde4vAzatuupIY00cYTslsSYBNmAP88zq/Fb2c9r2ccmh38BEM9w4HjQAR08zfPnjPTSAGMwfgE4QmRXUmCttaHzpXoT0Qe6Z+r20IvR/2ep3u+SKJ5C0Y5H0JoQYBDZyKqpiibpAY2v5FZCC2HrHP49rBepY7ZJLnWUHcsjXbieEEtPUCTYB7VAV9y4AJQDwSsvNqjrK4MWLw3uLo9Bvf6HQ0veD4L96rym9W5ivrQ0C609QCeJONMvEs1JrDsLUfoexwacZqfSabHcQCnJfuWrtrXPY2S/yNmBQWEdarGxq0z3Dtoe/Q14yBHRwjfSBNQBzufGyk8zcJQ/rtQYHqdW6CbluEvXHRvRG1ODbN1yrc2k/TMkY8iTl34JdtGlS+2CZ4IeBnoLCDq/qUvTBhoXIcKU7jTFN+ZSblMZSdb1L6FZbi/QlHA6B/bWXn1AHBJ2CuyfX/zOfhkLaTLQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(346002)(136003)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(6506007)(6512007)(52116002)(26005)(478600001)(66476007)(66556008)(66946007)(86362001)(2616005)(110136005)(6486002)(38100700002)(38350700002)(83380400001)(2906002)(8936002)(8676002)(36756003)(4326008)(5660300002)(316002)(41300700001)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5nCuYDnIAeqIEpVkL5FcJpt/5pH/bGHRWKMlstrx44FahwmJcycKM9I35fxV?=
 =?us-ascii?Q?OzNxmdfK6PWXCRMrsj6pypc3YpiAU/P5BdpIBh8V1Cy0hnyQAQdQSaG+JUrM?=
 =?us-ascii?Q?gIT2yxFbfY5ExNw7WQwrzEyWRMmlwlCj2e6m2Z3jBatp2JD8PHO/Pq0U8IzH?=
 =?us-ascii?Q?DsUHGbVKcmbDjRprurbrF54lLfwmSWA/3aAPtU9Zx0lvCLV50kciXRAnXhQY?=
 =?us-ascii?Q?cYnRj5iXovqKcv8XSa4vhO/IYZxb8I5Q1x92wgNcPz9Me6jZxWfEcrNL3Hi+?=
 =?us-ascii?Q?ZjcMdX8VU9xfA5RToVYQ3CAxu848JiJckT5cKPjTW2/tT3uRtgqlIADAkqmO?=
 =?us-ascii?Q?DX+4Ycbn9wbeCDH2PezAcN+UekvELLEb+gG8TeSNaeSeypwiQMMb6cwl6jHI?=
 =?us-ascii?Q?5ZDWUwV4tzWQKBaMIVQ3o8N5YI6EpKl+ewUrC+KDiEOov1MKLCFACQW2TCpG?=
 =?us-ascii?Q?ZVy4OtsrxL3c1LCpFeKH/YqjzHfUbRbpTTv/AMnczr4V0SZgp7SLfUkzsTMD?=
 =?us-ascii?Q?0BLhMozzvENYJutwY7xRBiru79a0WwtEUU97Pe1xKg97YCNege4sOcCjttdZ?=
 =?us-ascii?Q?/EoqdNA3MuDSEXngwxygAU9KA+X+XIWd+r/58VLaVJUrMZgCsMoFyi2wVIs2?=
 =?us-ascii?Q?Rj8JA8FO8YGpOAVJddO6ft1HHJJTOq/fu+Mxi/toP4qiZvuT+S9JvigvYxUX?=
 =?us-ascii?Q?+mtJ/keK5kEqkZsqG6vTUHt6ZQv82xV1uNyf8QiierDoEFYtly8dtfCH3LZk?=
 =?us-ascii?Q?B1iTAUb5Yf/kks9xNZf/WM0m+S7FzCDPj8wC9yiVSrkvl59rQZInRI0YkFeT?=
 =?us-ascii?Q?7xheFxuCVk4xX800zzdsnQKe8w0P9dkc1Q8386J9Hnk/ShuvE+MIXwfJJBcA?=
 =?us-ascii?Q?RHd8TJSdQoVjSb4a+p8qGmJYRcyhHqhTetAFXerTfJsNfiVLRU0se2PQwEeY?=
 =?us-ascii?Q?Jd9B2cuYtbIftKHdi5YJpoBn2LNMlUiNKs09feUkrGGdIRpMjDTE/PLqLX8m?=
 =?us-ascii?Q?IqCRc6heIcK5ZO7zlRmCfnKfSa+Dhe+SzpH+KgH1Mgz/mV88zw1XFcM9oy7y?=
 =?us-ascii?Q?4xziskmfCB8hL4mH0VSh6fFbOl6bM3LZiu3lAXfNHcqDa48QvBVRyv0LU3dO?=
 =?us-ascii?Q?sM05ZeEV3S0dOwqdP0lWWGynqUDJlWo6Ti0XWbq+wvSJ0Xm84GAl2Y/Ep/JD?=
 =?us-ascii?Q?NZX1L7xEnufJzHVqQxcsVuU00L5ncelvr7TrAlehJfOK7UJxjiYj/99O7RCJ?=
 =?us-ascii?Q?pAX1PVus1tBR8/62TALFcKKZY+I7+K0UKuOs7Z0lKxUu/RGdOgdhUEt2qvzR?=
 =?us-ascii?Q?gcKFCxQV47vDTmzTNtDx4F1rRjxW8t3l+5/x0BMcaOwVREc+120bq4hgcBLg?=
 =?us-ascii?Q?K25rguQ2bN4GEXqJhG98TMry+K2INHiC8DfjJojfqCVBgcKtF2KrKaLqd/w3?=
 =?us-ascii?Q?t9dCOHsFN9RIq57OA1J56MQShxbzgk8BDE2q1qyRTCMbIfl87RqnZMPQqwBB?=
 =?us-ascii?Q?IRPlGcMEVctqwg5Vcqeg1doreM2mdt4COxNyeX+2qX6hQN5Khge0I5IxX1Md?=
 =?us-ascii?Q?Ap/Nhy/e/iG4Wd+5F1RDNzUIKBoysp0oJEGMthlpqXe/ieDN+sZV23P7LO7x?=
 =?us-ascii?Q?dFfx79zUQGyDvklQ+ZlJ+6s=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e4a4127c-c3ee-4605-512a-08dbbe591357
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:23:18.9897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 nEEkGrt8k1MINYRP+I8GTE+2BleLgl5hBPmwwIOKrUC2ZaoykBC1FFR6lcCf/BaQhShBZ6s3nT+ebdrcWL+8SM26FU1MUL/zPXTiRNzkJPO+aN8I+rEvgKeEZyEk0CE6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6175
Message-ID-Hash: 3MIJU7D2ZIY62WJPQNJHLQFPREUM45FG
X-Message-ID-Hash: 3MIJU7D2ZIY62WJPQNJHLQFPREUM45FG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3MIJU7D2ZIY62WJPQNJHLQFPREUM45FG/>
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
 sound/soc/kirkwood/armada-370-db.c | 4 ++--
 sound/soc/kirkwood/kirkwood-dma.c  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/kirkwood/armada-370-db.c b/sound/soc/kirkwood/armada-370-db.c
index 81326426da33..79ee7599f06a 100644
--- a/sound/soc/kirkwood/armada-370-db.c
+++ b/sound/soc/kirkwood/armada-370-db.c
@@ -18,8 +18,8 @@
 static int a370db_hw_params(struct snd_pcm_substream *substream,
 			    struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	unsigned int freq;
 
 	switch (params_rate(params)) {
diff --git a/sound/soc/kirkwood/kirkwood-dma.c b/sound/soc/kirkwood/kirkwood-dma.c
index 640cebd2983e..dd2f806526c1 100644
--- a/sound/soc/kirkwood/kirkwood-dma.c
+++ b/sound/soc/kirkwood/kirkwood-dma.c
@@ -20,7 +20,7 @@
 static struct kirkwood_dma_data *kirkwood_priv(struct snd_pcm_substream *subs)
 {
 	struct snd_soc_pcm_runtime *soc_runtime = subs->private_data;
-	return snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(soc_runtime, 0));
+	return snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(soc_runtime, 0));
 }
 
 static const struct snd_pcm_hardware kirkwood_dma_snd_hw = {
-- 
2.25.1

