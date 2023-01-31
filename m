Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2D96821C3
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 03:01:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CCC4E8B;
	Tue, 31 Jan 2023 03:00:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CCC4E8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675130499;
	bh=2fNNpSfO24r+GmKD76Pbiz/ETMMgq6wF0jWrKVIUeL4=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=JJEfLQxiw7wzUTw+cDG04RRMRsencMNJ1EvKJPkg/n20qN65XB4s39MqcXlpuiC/F
	 vmsCunztpBgP+aRAeQ0MjHHkpcJ5JaGrEfoanEV+pjO45MO9xPQbSbfzBZPmLwUj9X
	 HVFOtzJ0tlueigog7VpwdagIu4T4Ig9swpiRrVdE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96DC5F8032B;
	Tue, 31 Jan 2023 02:59:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2E90F80496; Tue, 31 Jan 2023 02:59:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20729.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::729])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 959D6F8007C
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 02:59:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 959D6F8007C
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=e8ztCa3K
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n81Hlm6CBDftctJcA2N168IRc01ZbcCkmms0FQGnprZWGVmGZc0um9jGM6tqzJM9qlUhcfyQdS4Dy4uyzHQ3De52RxYcIEed2omct4eLRtfA+Eq15rs2XYT0USBbVsU9WszIHHQcxm95GXHWwTrpYtWy+jOQGyMji3xJ5S9Y0ucH+CNns6V1QEFxlrNG/hKYDavtx2d1JoSOz5BW0zYDFv2bZmNHPtruGWScT3qNfa+JlN0PIioabIK4J5jpKL6/vB4iqPqy0NhO/ffxc9TrqcxEBOO1mtlm/fGtx7mnjmz0hxu7fNWt6nc5NT6m48yg384qLoXpuuJ8IBbgNBgzVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+DHAC/qAHFuTBfjBrmASsqdMC94lXiyUM2PUGJLHhM=;
 b=adfdy2r39r7l4sBW3IPLeRdiAFeIOzBP5cU0Kc73GNn8XxGj7IY7DzkjcnXTuPB6lWAbRAKR5tE9WSAbFLVF8vbremlqERw/z9Lh9iOz/Zi87vlnkgeDnzVOSZvVdY8I/o9iPJsdRI2O5pv66iV2c+40dL2XSzXN8MsFEs2o5OxIpK535LyjLxozeULS1dwgcQrTRJZzigusEaW0LPPPFaT3SyVKyss1hbnn0LrkJI9i6BezU+Bz06q37/hziDCWiBihL8qQX5myEtPVOfcmX/KJhjm85kT3uQLUuBIK8qlw9ZOlHSVKr+vnlETeezy98pchCfoRwn1uZ4xptqJ1ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+DHAC/qAHFuTBfjBrmASsqdMC94lXiyUM2PUGJLHhM=;
 b=e8ztCa3KRxBpVxX9jjP+UMw63aSvuI0RZI8seprW8MM9AHueGs7jQF20AkiVAX4PlaHAdy85mEsxA/7eF867M3t9GiRDFAkNI8FcYlb26DqFZfjBsXboxBVzyppifBZhiP/5vLdI7UViqu73zWxDoo/Xa6wADbeuFky6TAChCxM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8196.jpnprd01.prod.outlook.com (2603:1096:604:176::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 01:59:41 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 01:59:41 +0000
Message-ID: <874js7foqb.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 06/25] ASoC: hdmi-codec: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
References: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 31 Jan 2023 01:59:40 +0000
X-ClientProxiedBy: TYAPR04CA0023.apcprd04.prod.outlook.com
 (2603:1096:404:15::35) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8196:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b187618-a5e8-4c25-ad69-08db032ed0d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SYPRKmZZJfDv0TNeEGbMlKHVKdYqg4abhaNJVj+4eRRPpZmQNJZw/iV3ntW3pdVZ7OBiOdOQ0g0LI8BOO5z4v32d409VDu6X/WJPb7/dFkgyjnx8ylEo7nJnvzGig5bXKGd2dapZW9XFt4TE1F1k16cFcZIAXdRtJ+LJXuqcNDkzvpNRnIAqrMI0DXuw2EK86XTMOv34uApN2mO8/uo6PnwfsjMHtXT5JIMQeHCKU7s1U0v29EjAPmYQm+vKxXyF4CERPAUpZBe6TOcNZ/79LDKosmRWae8HQuenN6vdyDtnB7LUUCDJDCJCN3ZgszuTZJ0bmwJ5Ugs7ROdO/XcUxzh4n5IxG58QVpIFXR3I8BSwMGAZQexcY7Zqse9LjU/Jffmv/41MVimntd+vbiESHgNXMtx1qVIPH2tvoxeGCbWXibw97DuAvaQHfZye5FlnFxH3wtqfxt2O35oRbBySJfStNIVE7kTojMkAsWDfaQtrsLFnxwH7UjvFZcTw555v2k5O+HiHdoMJPyqm7cDvpB+uhLscglRZombFaBAwDwnI4zmGj47lgLS2XbWEznTk/toXQMu5udVCEq7o3MMIxIh24S/lmbpP8yLik8yiaa6+drkvSYPcb0iUNqT8bAMZJ0Q4rzr6GRgCrl6jBEd3z5sv3lCFnagWrPuOmc+2kQv6fwKJZa83sbh+7YsbrQTaAYgszFWWjdyWUTlhZguQBQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(451199018)(8936002)(2906002)(6916009)(38100700002)(4326008)(38350700002)(36756003)(478600001)(5660300002)(186003)(6486002)(6506007)(52116002)(26005)(6512007)(2616005)(86362001)(41300700001)(83380400001)(66556008)(8676002)(66946007)(66476007)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gpRfTNfsSrAPBV0do3i9jMWiKFY1HMl5wvJ4lCDDih6t8PNTgLUYI8TumRUr?=
 =?us-ascii?Q?sfdkIWMaIZEpSoKPpbtd0bro2T5gkDqV0ZEwJoZSwEKkYtj5jv4EKmEeQzQk?=
 =?us-ascii?Q?RW+DHKCQW8JSu61tl0awNajX4FrahSuZBFGt7CsCKfuyn8bbv/iaXQcZuTPS?=
 =?us-ascii?Q?WnZTDQsUB5t6UODid++pc8OogCDcEEHxoap3Ae7YLGhyVnvBpXMGmXhDSRU3?=
 =?us-ascii?Q?f5E2ZSs1RKpkE3h1/AMsNinXaWzvqybt+UK4cE/mVLjQSaY5c+nrKosF3rEj?=
 =?us-ascii?Q?hQK4gpS3vD+g5mMjFDxjRkUzdcUweKSR6LMHhRuBmVf4X++txHzSJwk9A9d2?=
 =?us-ascii?Q?5c7SRpvdM8vHn7nvNLJOzFT2IFISs7pte/3Q93TrrCguYgWoICDQ4Ip5/Pfh?=
 =?us-ascii?Q?YxdlDLy15Kn8l6iDLS9AB27HmWFo+xQdV+Z9sV4WfAtjelWaWG7KzTyBADz8?=
 =?us-ascii?Q?Y7YClp6L7wwTR2Y2ALIUNyCwhT+sEjH2qAS+OdHiGadQq6OpIzDBJNC1Ca0Q?=
 =?us-ascii?Q?ykjS4RZfCFN+4T0gcLei7OnRRQ6wcBUDqB/Cc5/UCbo6JH/lLMcWZCwi2oQr?=
 =?us-ascii?Q?RIcOinMidtO7MfPkjWggYjLEiGFkkRHfo4Du9ygbTKAt9eLxZ8z/ByhljWqd?=
 =?us-ascii?Q?izpsUwSK30Wezi/9t2EwDJb8LCD3lYJTEUZ4xzf4FJWs50Qn36+4qG7D7sjR?=
 =?us-ascii?Q?NQe+lWiVWjvBFFJK41559Zntzt0rveofe4mRTpM14iaAVAhYZHWneyc7wYXD?=
 =?us-ascii?Q?OgPDBl9+ib1TqQ+LvwT19oeaU0MkNJONDofJvvDwAsVG6D6MVIzjoJaFHXHM?=
 =?us-ascii?Q?HKqQevldikyq7j7XwcUfHTlbFj11zYlvtMCEoHKpXyPvvrtf6q7HUx4QmNJZ?=
 =?us-ascii?Q?8Ax5iQRWUpt3YlgkVONmwjljv/XSy1JYf6pIBVeeR2IcFGtm3k8TRQf+ZWRG?=
 =?us-ascii?Q?rBfdIb4hNptMGicBFyo56LJALWZmey9is9Vl2n+8jkn1vM2wpva8SwCx5urK?=
 =?us-ascii?Q?tlI5NOUd6IsKjibRoMntI3sRDNr3xz25YQWxz3GsWrXQtMrZ6Dvy6uu7aLTG?=
 =?us-ascii?Q?xCuhOD72ipJR+8b/g0V7YuQglkFgV7YgOXjWKhfbPuZOV1UEgkCDVif84BcE?=
 =?us-ascii?Q?kboGJE1yAHnJ9H1ZXZ9Zyt2H5y6POdXFdQNQOg4Dht08rgCybvtFJ2LEe/iu?=
 =?us-ascii?Q?Vfpj4lQPrLV3kOvdHU9YwxKkT8TpOfABdDOpxkmoE9H5rWYRUEaCskh9FNGm?=
 =?us-ascii?Q?ey5qK0o53Wzhuv+6bVxbWtLXYoOAc1ABwqHaovsFcLKpZc4RF+xI4H4cdTAP?=
 =?us-ascii?Q?5gZjG/YQwqhFwaS7F1LvdjHMWriDzwJwgjgTxr3SncqNyejakluhOpSc3iwL?=
 =?us-ascii?Q?tq2OfpUJEqDtYq7h94U9/pbbbgXrrPiWuNzM2VTJ1Vdsy2HY26ylRlwesHW7?=
 =?us-ascii?Q?Rb2lckgeEc3+2KVdP10kcD6LebqaFaXj8rQQaBn5NvsmFHwmgv3XpzODeVk2?=
 =?us-ascii?Q?koVRQlL6/kFcZhpzlU89H96JiHqDz75FIZPF5+cJkiC9n4+tXnmAcWLVysmr?=
 =?us-ascii?Q?3+9LsSwESTfG5jCrabPk7H3YNHRDS8dbB52Nr0QjBzOVB6WHZRy/wmn8Or5y?=
 =?us-ascii?Q?/nFDuw6HHoKS2NFe359lnyw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b187618-a5e8-4c25-ad69-08db032ed0d2
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 01:59:41.0840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ckFPmFySIJ9N3m4fcsQYYvumuNHUw7eXQf4WAKIgJsBxKZdsqeHKpSnKyHkDw0YXN+/sLPwFvjB56SyOEXz3z7F7KAbFdkz2FtWLXVxNQXnjjXapi1/gC/aK9G/dcPhY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8196
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

