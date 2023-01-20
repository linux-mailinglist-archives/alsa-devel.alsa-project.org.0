Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9930A674DA5
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 08:04:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC5F72E01;
	Fri, 20 Jan 2023 08:03:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC5F72E01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674198256;
	bh=2fNNpSfO24r+GmKD76Pbiz/ETMMgq6wF0jWrKVIUeL4=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=UtjRbY1vg8Kyo6Xxl4rmVBJRuhsA9b6kG6isLOdLrWjZAUgTgj4TF8AiJHwBH8t0A
	 2VwzIpcxpjtlVvQrQPywv8x/4Iiuv8rz/RjvCiQzeJ1MEj4/yUnakGbH8Uhq7N3hP/
	 q7ejtZTiWBvqqmKP6sLFFVFqwQYD6Q7v4SQ852Ys=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93381F80495;
	Fri, 20 Jan 2023 08:02:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29BCEF80563; Fri, 20 Jan 2023 08:02:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2100.outbound.protection.outlook.com [40.107.114.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F771F8055C
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 08:02:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F771F8055C
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=EEDQzeBP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kd3YsZGNYrf505NIPn6GhSMNdOSzrbTZK3Yk3Bw2yGC/TFIyD1Zud0JiD6I92EitVTVm1wwrm0D3iTi5aDyCjTrYMxL3QjgnjAB8sJKDOpJe9xYqDW5Hx9UHGLLybPGSnFkPBUzpe3kHvmudBUFMAQlhTJ4EYNkcVByMU9VrFZmGrENfw5zgVnkoyLILp6K0Lfr0tznTiYcnW+UO2WGxrKwKK4sSDGwn/RUfymFAf4+FVKcUms60CKHyw80YQyQexfxIeFeM6zpV8hIjUQl74W+N/SbHkSqH43zbfPVBdfP9dczeDw4/iBMr8ihOYYjR5PD0+y+OQnkggwJ7CGnLJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+DHAC/qAHFuTBfjBrmASsqdMC94lXiyUM2PUGJLHhM=;
 b=k0SZgd4w1nel0gCndsSCkqokxuy6Lqy42IlsYPespLPXegXahRALcrB1HbEJaGDhvvlFF34QBwtonzFZ0VLLfOlpYu/vjByPCIgygxBvcIAb8S16DtYhwZ9zHJxOcf/KdnUZNZpN8yWhMR16htH1RFbRArx9BVB6k0oDklv+7VP89P3EIv0U4ZYTMjtqZu/zcx7NCrXfX7D7uJsQ0wwsN0cz0ypOg4gbZPs5WWUM6gW5z8F5NBI8yNb816yemBtK9gajFZc/grTtfUwVUju6B7PEBAjC0oU0hF3ATnHVaAZeOfYq+0k/p9dFtgnXRFUY7igPybnf8m2g2HknFZVpTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+DHAC/qAHFuTBfjBrmASsqdMC94lXiyUM2PUGJLHhM=;
 b=EEDQzeBPFPWPmnNzWdLsaGWWJjvOJEJPpbbfDX0iN95Fpdb3guQjvhonSzdWA7SUUPTNTdj+Q5gyWmDAYL8paYZfZbqvOCAwKLICiqRdtuUo+gy4dMySqGq00XcYi2A37Mhz27SjpqTBjB/Ml38GnzL+kQ6X1RWgWjaWmj634j4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB9337.jpnprd01.prod.outlook.com (2603:1096:400:195::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26; Fri, 20 Jan
 2023 07:02:21 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Fri, 20 Jan 2023
 07:02:21 +0000
Message-ID: <871qnplmdf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 06/25] ASoC: hdmi-codec: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
References: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 20 Jan 2023 07:02:20 +0000
X-ClientProxiedBy: TYAPR04CA0001.apcprd04.prod.outlook.com
 (2603:1096:404:15::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB9337:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d4bb7c6-225a-47af-e14a-08dafab4466d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BDzHbEPuZXNe6BQFJdiH9Ez3gf1IoidldTLhFXvfgEYoFDOvRI3G15XaYIUnTqn/58y/7JT/kE+QN6oBJdVIxUJOEzLTVyA8XKmiQ1uqGnhZ/izKrybBjdUFcYoy7sxo/tpQmo6BjbceF1nQGD7iFm/vBccaeBRvDEUrxqLC+3JoYGTKUjsn0XnKjj4PZtTVcudZkZXJ/zBeQv4R/fT3tEH/+Gm26ooFc4R1KRLnMJ1g7HXg7AIIwWTPhgsi3yzkqDDSL2VFNg5WTb1DRMVJAjDeNwBoRXSt/ulxzncUPPncxVSDnsli6G+VKAIM/4lp837aLd/wG7Fb24hIjmn+fGKkahDlt0BInjko1nRDZESQz4Vd8EGRL6doxm7W1Lmq3drYwssns5cnum63nv1hrnH3ntfuNTbYSVxDFUiyG6tNXPqODwkV2HIq4/JY02gupvY93ELa/SDgbfE1I010efSNSEnAHlOEZNOMx1tTI1FOHcK/xTNTB0JDfzsmCr7/3DB+WblJahfp7pT1qdNDWkoS5IrKIOkmzAzhfLiiY3136TrGCMAZr4bWHvKBPL6vcX29YgAyiHSJDLwe12YJXvtlYmSyC4gLwN55e+2Dne+sGfhxDfpmadfBPv9k8hSollEOwOvozZ3BUcN7P3p6T7v+B2/k0aAwOGvH89N51SxrQQKlG5Ipa02ur/yB1sAkvMA11TPMWzOgblJOCEGeBg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199015)(2906002)(83380400001)(41300700001)(6916009)(66476007)(8676002)(66556008)(66946007)(36756003)(4326008)(7416002)(2616005)(8936002)(54906003)(5660300002)(316002)(6512007)(186003)(26005)(478600001)(38100700002)(38350700002)(52116002)(6506007)(6486002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XMJYG+4iSw3aHBvTi8ILAelJHtg4n8Yu09cK/3VoKIa4W7gsJBIQ0hswFCKp?=
 =?us-ascii?Q?hECz/nGnPmr3bhvfQ4r8JZiJSd3h3llC0qWt/6c/y6HhtFb7C3igdtFxJwyF?=
 =?us-ascii?Q?/Cj8enj5A68hrwgHEbMMq6IfFGDf79O357x+8ddAyTxGaS6iT7kDo7K0jCZN?=
 =?us-ascii?Q?nqoLXaRllBt+rx+cu7Y2m+DetyjjAtNlQUM1kLVRtd90S5OmvWtJ1A2UyTEG?=
 =?us-ascii?Q?yjyqgko21SHmy8Mr7G5g+dES/RFlDNz0S7YNFG0lq0h7phoTSIPGx5Tyawju?=
 =?us-ascii?Q?MB15qTjOPq16DcZHL2Yw2JhtSaQ7cEd3rkr63D99YgM3nEEWrpm2uu81HOgx?=
 =?us-ascii?Q?J4Yxe/QASw/MYEHJAaLGVL2cujX5PbgR0jPAgtZGFg30tLQuGE52dMfWbcHT?=
 =?us-ascii?Q?5gFCPb+WqI9ibcTx9LDT6sakeiOqW7kr+UQDAtpdGah1WnJCLtoe5o+ov30f?=
 =?us-ascii?Q?+DPQYhnQ544iPXaKAGlFe5nhWwiVEaNAAI+zp5HgbyBuDg5gT3RlqLx/sL69?=
 =?us-ascii?Q?WtDxX+xCsTyYUKgvvUQITLSxs0dyKBJMPf1tsyUr5IMB//m+gP5fsj0KYe6s?=
 =?us-ascii?Q?a8dNGKEYGbn1kfubdpMFKwGlz/ZcUVZBd5lrzHjYOBRj2aFbSHNsqI6WxWXV?=
 =?us-ascii?Q?VywlZkuMhEb7ArD4oPfcPA2oYbUT5jhEg4uKH9n03888w2EQbH84dw0E91T7?=
 =?us-ascii?Q?o7fUzLgQRyPkJDynUzr+gKcQBUl8caDe9FPlqwSLveNc3tmf2Qfijh59cmr/?=
 =?us-ascii?Q?Z/+0KTJGCUWtJHI3XgQHamCB0SpUHj6HTP47WpQrNUKQ+SONKXksv/yjtA7x?=
 =?us-ascii?Q?bzEz24ZHSLwUiIB8wuHIsWiUu3t9W3bhvkEPLoCbB9sFVut6+B6WyhWJeV/y?=
 =?us-ascii?Q?ZnhvUS8QqTVdhPXPNUSm99nNVR5n7LdWfpQehbnlNrWLKuqDLwgW88WqIDPQ?=
 =?us-ascii?Q?y3/sZusQ3ZOzUmG9ppFiPh5sYlczxrjfbPlW87MKT+5CsGunR5wO1sD7tW2K?=
 =?us-ascii?Q?MPG5E66ziQO7hCYUuUoDte7xt86O96Nu8a+0oyDJle1oRd1+GMAx6nfKu8Jp?=
 =?us-ascii?Q?amlab2YZu1WmNICmYVNm6ybjEJdycXGpLrrZ1B0bZiDBSHU0nrwK0QgyFkRu?=
 =?us-ascii?Q?5wyA2unpQo3DLtfGhyVTWjn+b5IB1zlVeMKvKZRiRYULDSUhUL2EGNPwIM/Q?=
 =?us-ascii?Q?stpenVVz+PjIMp7BxZZT3Yex1ffx4AEdYWsuYvkQyd61yfOsglMvHYrvbLuc?=
 =?us-ascii?Q?BtZccXurT/8gHW17dHicTfSIFBTxpQkMj3xnWvdr7vWD0qiZcQFL58SJaHe3?=
 =?us-ascii?Q?ZSrVN2c7Fqrd7LuCfkwz7amfyz132hNXGYfJt/dSez37T595Yz1282Qcx4kM?=
 =?us-ascii?Q?xtdPuuHZdaR2xRzDTbH5ONYU3aIIu2CYklKBK3reR+GykRJJaq3nAB+fbETM?=
 =?us-ascii?Q?bByzaOET99HJj7AyTHuNlx1NnO5/+k/uGDN5SoHIN7BqemJgKAMnBf0Ht52N?=
 =?us-ascii?Q?39MXw6C3uun1baRoUp4BFO/8OVQlJtOpmljx7rlTqZdjGLvhJE5TQCUHJP28?=
 =?us-ascii?Q?rYatRgAOaqnKURVRiri8MVhNzHVlm5db/FCmykviezbL8Q9iE5T0FDKW1AlN?=
 =?us-ascii?Q?VcPnNEU4eBw2F66RLpDlhQ4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d4bb7c6-225a-47af-e14a-08dafab4466d
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 07:02:21.0259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ewxxvDuR5LJQytIeqzC8OAdv7mfBwrZCMb+nLsKBJty/LsKooh79uXGy+QZCGdHFXS3sE+o+eLhjZmVoxMpwVu5c5WAxSyptW1Lix47IidwqZmRq7rm1Nww6Qn03pgJD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9337
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Heiko Stuebner <heiko@sntech.de>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Colin Ian King <colin.i.king@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current ASoC has many helper function.
This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/hdmi-codec.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 74cbbe16f9ae..01e8ffda2a4b 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -518,7 +518,7 @@ static int hdmi_codec_hw_params(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 {
 	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
-	struct hdmi_codec_daifmt *cf = dai->playback_dma_data;
+	struct hdmi_codec_daifmt *cf = snd_soc_dai_dma_data_get_playback(dai);
 	struct hdmi_codec_params hp = {
 		.iec = {
 			.status = { 0 },
@@ -562,7 +562,7 @@ static int hdmi_codec_prepare(struct snd_pcm_substream *substream,
 			      struct snd_soc_dai *dai)
 {
 	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
-	struct hdmi_codec_daifmt *cf = dai->playback_dma_data;
+	struct hdmi_codec_daifmt *cf = snd_soc_dai_dma_data_get_playback(dai);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	unsigned int channels = runtime->channels;
 	unsigned int width = snd_pcm_format_width(runtime->format);
@@ -597,7 +597,7 @@ static int hdmi_codec_prepare(struct snd_pcm_substream *substream,
 static int hdmi_codec_i2s_set_fmt(struct snd_soc_dai *dai,
 				  unsigned int fmt)
 {
-	struct hdmi_codec_daifmt *cf = dai->playback_dma_data;
+	struct hdmi_codec_daifmt *cf = snd_soc_dai_dma_data_get_playback(dai);
 
 	/* Reset daifmt */
 	memset(cf, 0, sizeof(*cf));
@@ -834,7 +834,8 @@ static int hdmi_dai_probe(struct snd_soc_dai *dai)
 	if (!daifmt)
 		return -ENOMEM;
 
-	dai->playback_dma_data = daifmt;
+	snd_soc_dai_dma_data_set_playback(dai, daifmt);
+
 	return 0;
 }
 
@@ -891,7 +892,7 @@ static int hdmi_dai_spdif_probe(struct snd_soc_dai *dai)
 	if (ret)
 		return ret;
 
-	cf = dai->playback_dma_data;
+	cf = snd_soc_dai_dma_data_get_playback(dai);
 	cf->fmt = HDMI_SPDIF;
 
 	return 0;
-- 
2.25.1

