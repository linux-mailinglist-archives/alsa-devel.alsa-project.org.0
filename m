Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B136821D4
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 03:04:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47C25ED0;
	Tue, 31 Jan 2023 03:03:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47C25ED0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675130647;
	bh=VuJUNAo9gz1HSTn/c4B/Mzd4Eytv73XR4e/E4Ll/MpY=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=F0OuSOwVQJPn8wrVQP8W7YL+KFKm1zlI60qz9NuZbkbZbjKWW4MifRdA07xfuwQBH
	 2cUtjYGmJlJMFysbEFMJAN4+HcgV41DjGuerRp3r8vNasZ9ho7C33RgbGjVHVXBFY3
	 frTzKvtQ36Jerk7gICUFPhzLPi2OWBH2YRidtsFI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7485DF805B0;
	Tue, 31 Jan 2023 03:01:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75E39F805B2; Tue, 31 Jan 2023 03:01:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20728.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::728])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CE1AF805AA
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 03:01:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CE1AF805AA
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=jNVI7NQn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B+t+i423/0WBFnWBkB5Fe4aG3ZM5rwMi5HkUjoFBNm4LgRyWRsP5BVVlFFjQWkfKxcdIMaEGcC1YYGvgUrCrdQstRbHAGBjZMvBS+aTpWSDQTWG8CqWYuD3q+NLj3HVWLBG5AfIpmlEBVuAQcBlrqS5q+u4sSNd+BgflKbYal8lTv6c/qDh7djcK97Gf4ClTEYrH84EaBOtuinDOOnyT0AYvcQnAA9T+g2gXClPqIvsfJ2LRlz0w4lBMq8lqjSvvT6Rgscz5TTEA1IicpqDu1qHcZAYOmXHGHYBGLqy7K2In/dxedt6Hxj3W43s8sRPogWfayr9JoI+2mosnYCEy6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0QZerTTdPFnj38fvbS+BkbLYO7xF5urrNxdtZx1z+qc=;
 b=Wd1Z9IQ7272Wjel9VqLv2ST9d8juSYq+nRu+2FSm/X0FsznzzlbOXQRp+Khz9zbWa93dInoXCdwH0O1ZqCVf614FKJuYiVyvw3b0497cJvMlDsMyhr0Zs9ew3GklurdHd0QRP+4DyJin5YAgoWVW3WhkBBhEjmsk+fJapWr3sxuPG/iivxN5hST4hk3A9gcY/Q54EreFM2XcJ2DBveF/jYSsa8VSKWGCwhNxze98niRha/MPjkQB7FDRfG/aQmaoHq4QeMwFXa6QPHyQGv6+BSJ8G6atm9Eaazi1Jk0CZOTqdtuiBaB0cGtG5DPtotThUYO2xJUQMP6Dkgcxz9TNJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0QZerTTdPFnj38fvbS+BkbLYO7xF5urrNxdtZx1z+qc=;
 b=jNVI7NQnQzf+SMB8OQclP2buFPfWk5L0n//9oHfop6SSr2/7B1zR/p0FFmngFP4NpsokvNj8VEhYARuD+yAocAjBC70pKh+ZcRqMn+QjHe8QEzE0gNCnjrg5KjtuIygx1enlx2uxLsHPqxovHX5G712eANlIEn8ogxLpEmViuFQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8592.jpnprd01.prod.outlook.com (2603:1096:400:179::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 02:00:57 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 02:00:57 +0000
Message-ID: <87r0vbea3r.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 15/25] ASoC: meson: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
References: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 31 Jan 2023 02:00:57 +0000
X-ClientProxiedBy: TY2PR0101CA0023.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::35) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8592:EE_
X-MS-Office365-Filtering-Correlation-Id: fac97567-49d3-44ed-2620-08db032efe35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f/sV+XvkXwqc34CofdLYMugUwF8+tBWqQkyJw0Rcyo+tHjo4R3f4ab5b7X5kEG8X5eNB4zXgd1xkuV/CnmdBDccU+JcC23K+K5IObvObQmmzZZfTu32fyxoSZan3GiPRzO3sZEwIk5XvGikTuZgJUcu6itXlyifxbGezKuMWxLqC/08xbGaAA0kwl/2iNQC72k7U3fQxRKDY6MnMSQcaYG0M092N6Co5pWYilNwiOKb9afzSEvO0j+cyba8eD+hPX/gB3h3VDgGdTAg2k9eRddKHDS/YeU9jk2s9a1YPfRaCTeFlQqd9xJGHrAGEFUB+1Tw0OWTWFkRbSqxixjDGwEpbBaewFn7Hzdzc/g3z7joBydkitnarpWKWZhWomm8r9KARJJjQ/BQ1Ghh/jtb1CafyO5akoeVwPcbjltmOwUlpTWS7LOjqXmObg8OaCPajsYNrk7N9pNfYTT5m4Hdebu1P4gabUXTZFhS+u/qmvN4UQDzre2Z06w/gTjsGT0fA1jdEEP2AkViEL9zlnhfVhd7Rdxr66+f9GtWNwWX+5BGopU846gOsg/siJwB6kdulD2D7GReH96xv9H8i/1zjqY3Eu8QUt1HXPvi+9eySnMHm3L+EGal2ACdIp2DQC7dCS/RyNxLuZuVYs7n5setvfQ49thjf38Lx3Tvym8A6eirzHkdpISS0TpmaYTM9HhwwsZrofc5j8cfvfM5j5sDW7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(346002)(396003)(136003)(366004)(39860400002)(451199018)(52116002)(6916009)(66556008)(8676002)(66476007)(4326008)(41300700001)(66946007)(8936002)(83380400001)(86362001)(478600001)(316002)(2906002)(38100700002)(6486002)(38350700002)(26005)(6506007)(5660300002)(186003)(6512007)(36756003)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QSO795OxCd5ZObgnS53fk+H/8uUchRJt2car1Jj/8ey9DC2zOgWhtIZSjU5H?=
 =?us-ascii?Q?GqTaXwU7m+xSCVtTiR8hlLtCzAL9O904oNIKrLCnggIi2ZFvNfwEGvrJDo3w?=
 =?us-ascii?Q?4Kl5T/xX3s134eBID+w4FFbXKy5WIcOMqsKffQKKoNp85E4lbQCqqSOxJ/40?=
 =?us-ascii?Q?/eQl7mmvK96Uu5iaBBkDMKj7MRif3S9BvEpO9FEPhtxnBGzS9yukjIMBvvC9?=
 =?us-ascii?Q?yCZXRYw6waokN4FLlLDh1YlzrXYp2iANrHk4ZnXb1WqfOA3GtQzFCD3QDt3V?=
 =?us-ascii?Q?GkOzylIS//SlWVHWkODP6TobKsb1QwdLLzuHvp/mOwX54fuYHrpwu4SrykcB?=
 =?us-ascii?Q?ZbLF1kUe8xXCqa28mwkO4HmrAhIAL21sxWGAc+4Gx6skKqlTwxKop/T1DndP?=
 =?us-ascii?Q?xcd07GgKiUZ+11DXoT3waXqVZTuSu67QFjd8ZpphNk4pfE1jgilZTD6BmJw/?=
 =?us-ascii?Q?docpjCPRMiEuhIS6mG8llMjD2bJ13HCSn36gxM2fHgBdqA2lFOkx3vM4o7T1?=
 =?us-ascii?Q?OnZ/Nnc1nDGHiCHGzFqKcUznvPcDlUySH0Na2qw9rPpD8Z0t2c0rKjBAmxQ+?=
 =?us-ascii?Q?ZrfgO/yb9KyTIyXAVp0i7XbF/evEoVMR68rWRiWH6WID2rV72WcNiZVcv0UQ?=
 =?us-ascii?Q?LQGd43I34cgphTgHSz6fLFCj/O4SspZif/tkxUiYrwRftcd968t2dqPgOh01?=
 =?us-ascii?Q?OEeJKfjIJ0Do3WS3x+8JnbFy5e518s4sc6RI/nYpZw/7MZxT9qMoT3xc6Zt0?=
 =?us-ascii?Q?RJko+nePjUHgJhwbvBBexl1wl4T9z+OY8kzY5Sy53A4WhaOwXlMhHia9dtn1?=
 =?us-ascii?Q?0AyaCHDGc0EEHnxidx+ymkLGgEMtbj2hxTVticnbp3OqhsgWCT90OZuuvgrH?=
 =?us-ascii?Q?rH86kpHGAA2AEEmD+hbzGpaOpT7rR0hlDIzkf7SRwHk5HrEBategBGrGxnjE?=
 =?us-ascii?Q?p3ZJQcSISyMNCHbH0SWYZOZOqETOylvLIkrIz9sV2DuBSwHnigf/O4quNWM1?=
 =?us-ascii?Q?YrVdvMF5AVfyBA/dpdM6FM6HRCstbd3IEt47dAK6LEEvWTAst0skFvbAKN82?=
 =?us-ascii?Q?YJ8LK3xe4etrAHNRN3cVUfK2DjLTrmhYcQbk4zkoH+GVw/qvRwYnTJdRw7qb?=
 =?us-ascii?Q?OAQe8EBVO/uSEhjGJrD05aOqk6Gz9KD67qYxVV41OR9XuaX7T60pB5bgkrTA?=
 =?us-ascii?Q?IHtqK1A39SpbXBS9ZP/hPEAOBXuUoe+QM6PQVtDutYDPPOyVKWJeO7pWguNS?=
 =?us-ascii?Q?uJ0RZ46qgbr9Yz4/WlDFR0YmW0yTJ3RTCfZqZ1ZiULpavWY3dleM4aAGJDXA?=
 =?us-ascii?Q?XrK/Yek+fYjUJTqLGplOEGhtlSPUu5axNKmW1zTloyURjQUONJxaqX/J0KpL?=
 =?us-ascii?Q?rIarkbODFhjEirhoV5/4DBnXirds+lCc8zwb1GAc523HMdzAR2zp1ljfKNL6?=
 =?us-ascii?Q?4oCszQBkhTofFx39d+tc4460Rz6AHoySaNh+7d9TL0PpLN0ruQDJJ8CRZ/69?=
 =?us-ascii?Q?pT5LdxO4pb0uzsxXtOlj3L39AmgyvGTJY9AuuptW1hURz5mX1+Qfxi0jCWOD?=
 =?us-ascii?Q?Te9c8JTCbf5T0vfEQlL3QzRvz1lNmxpP2cLiwgnlbYcYepYCwPRiwnWINrRz?=
 =?us-ascii?Q?+JHFK9FubXZNHDyGyHA9KE8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fac97567-49d3-44ed-2620-08db032efe35
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 02:00:57.2425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RqEFgQVA6sNpjhiaNaG5CwBRyBwZkuePuCZ4xoPhEEJYAZkGB9buCcb4NmFBiSKJU/dLLm2czlZFMzvEQzy+0QqoCrNl3QHYhlytiyBX4jjLHGYt+gz4QAWqD+JAWxrU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8592
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
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/aiu-fifo-i2s.c      |  4 ++--
 sound/soc/meson/aiu-fifo-spdif.c    |  2 +-
 sound/soc/meson/aiu-fifo.c          | 21 +++++++++---------
 sound/soc/meson/axg-tdm-interface.c | 34 +++++++++++++++--------------
 sound/soc/meson/axg-tdmin.c         |  2 +-
 sound/soc/meson/axg-tdmout.c        |  2 +-
 sound/soc/meson/meson-codec-glue.c  |  8 +++----
 7 files changed, 38 insertions(+), 35 deletions(-)

diff --git a/sound/soc/meson/aiu-fifo-i2s.c b/sound/soc/meson/aiu-fifo-i2s.c
index 57e6e7160d2f..59e00a74b5f8 100644
--- a/sound/soc/meson/aiu-fifo-i2s.c
+++ b/sound/soc/meson/aiu-fifo-i2s.c
@@ -88,7 +88,7 @@ static int aiu_fifo_i2s_hw_params(struct snd_pcm_substream *substream,
 				  struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *component = dai->component;
-	struct aiu_fifo *fifo = dai->playback_dma_data;
+	struct aiu_fifo *fifo = snd_soc_dai_dma_data_get_playback(dai);
 	unsigned int val;
 	int ret;
 
@@ -158,7 +158,7 @@ int aiu_fifo_i2s_dai_probe(struct snd_soc_dai *dai)
 	if (ret)
 		return ret;
 
-	fifo = dai->playback_dma_data;
+	fifo = snd_soc_dai_dma_data_get_playback(dai);
 
 	fifo->pcm = &fifo_i2s_pcm;
 	fifo->mem_offset = AIU_MEM_I2S_START;
diff --git a/sound/soc/meson/aiu-fifo-spdif.c b/sound/soc/meson/aiu-fifo-spdif.c
index 2fb30f89bf7a..ddbd2fc40185 100644
--- a/sound/soc/meson/aiu-fifo-spdif.c
+++ b/sound/soc/meson/aiu-fifo-spdif.c
@@ -173,7 +173,7 @@ int aiu_fifo_spdif_dai_probe(struct snd_soc_dai *dai)
 	if (ret)
 		return ret;
 
-	fifo = dai->playback_dma_data;
+	fifo = snd_soc_dai_dma_data_get_playback(dai);
 
 	fifo->pcm = &fifo_spdif_pcm;
 	fifo->mem_offset = AIU_MEM_IEC958_START;
diff --git a/sound/soc/meson/aiu-fifo.c b/sound/soc/meson/aiu-fifo.c
index d67ff4cdabd5..543d41856c12 100644
--- a/sound/soc/meson/aiu-fifo.c
+++ b/sound/soc/meson/aiu-fifo.c
@@ -34,7 +34,7 @@ snd_pcm_uframes_t aiu_fifo_pointer(struct snd_soc_component *component,
 				   struct snd_pcm_substream *substream)
 {
 	struct snd_soc_dai *dai = aiu_fifo_dai(substream);
-	struct aiu_fifo *fifo = dai->playback_dma_data;
+	struct aiu_fifo *fifo = snd_soc_dai_dma_data_get_playback(dai);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	unsigned int addr;
 
@@ -46,7 +46,7 @@ snd_pcm_uframes_t aiu_fifo_pointer(struct snd_soc_component *component,
 static void aiu_fifo_enable(struct snd_soc_dai *dai, bool enable)
 {
 	struct snd_soc_component *component = dai->component;
-	struct aiu_fifo *fifo = dai->playback_dma_data;
+	struct aiu_fifo *fifo = snd_soc_dai_dma_data_get_playback(dai);
 	unsigned int en_mask = (AIU_MEM_CONTROL_FILL_EN |
 				AIU_MEM_CONTROL_EMPTY_EN);
 
@@ -80,7 +80,7 @@ int aiu_fifo_prepare(struct snd_pcm_substream *substream,
 		     struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *component = dai->component;
-	struct aiu_fifo *fifo = dai->playback_dma_data;
+	struct aiu_fifo *fifo = snd_soc_dai_dma_data_get_playback(dai);
 
 	snd_soc_component_update_bits(component,
 				      fifo->mem_offset + AIU_MEM_CONTROL,
@@ -98,7 +98,7 @@ int aiu_fifo_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_component *component = dai->component;
-	struct aiu_fifo *fifo = dai->playback_dma_data;
+	struct aiu_fifo *fifo = snd_soc_dai_dma_data_get_playback(dai);
 	dma_addr_t end;
 
 	/* Setup the fifo boundaries */
@@ -132,7 +132,7 @@ static irqreturn_t aiu_fifo_isr(int irq, void *dev_id)
 int aiu_fifo_startup(struct snd_pcm_substream *substream,
 		     struct snd_soc_dai *dai)
 {
-	struct aiu_fifo *fifo = dai->playback_dma_data;
+	struct aiu_fifo *fifo = snd_soc_dai_dma_data_get_playback(dai);
 	int ret;
 
 	snd_soc_set_runtime_hwparams(substream, fifo->pcm);
@@ -168,7 +168,7 @@ int aiu_fifo_startup(struct snd_pcm_substream *substream,
 void aiu_fifo_shutdown(struct snd_pcm_substream *substream,
 		       struct snd_soc_dai *dai)
 {
-	struct aiu_fifo *fifo = dai->playback_dma_data;
+	struct aiu_fifo *fifo = snd_soc_dai_dma_data_get_playback(dai);
 
 	free_irq(fifo->irq, substream);
 	clk_disable_unprepare(fifo->pclk);
@@ -178,7 +178,7 @@ int aiu_fifo_pcm_new(struct snd_soc_pcm_runtime *rtd,
 		     struct snd_soc_dai *dai)
 {
 	struct snd_card *card = rtd->card->snd_card;
-	struct aiu_fifo *fifo = dai->playback_dma_data;
+	struct aiu_fifo *fifo = snd_soc_dai_dma_data_get_playback(dai);
 	size_t size = fifo->pcm->buffer_bytes_max;
 	int ret;
 
@@ -200,15 +200,16 @@ int aiu_fifo_dai_probe(struct snd_soc_dai *dai)
 	if (!fifo)
 		return -ENOMEM;
 
-	dai->playback_dma_data = fifo;
+	snd_soc_dai_dma_data_set_playback(dai, fifo);
 
 	return 0;
 }
 
 int aiu_fifo_dai_remove(struct snd_soc_dai *dai)
 {
-	kfree(dai->playback_dma_data);
+	struct aiu_fifo *fifo = snd_soc_dai_dma_data_get_playback(dai);
+
+	kfree(fifo);
 
 	return 0;
 }
-
diff --git a/sound/soc/meson/axg-tdm-interface.c b/sound/soc/meson/axg-tdm-interface.c
index c040c83637e0..7624aafe9009 100644
--- a/sound/soc/meson/axg-tdm-interface.c
+++ b/sound/soc/meson/axg-tdm-interface.c
@@ -37,10 +37,8 @@ int axg_tdm_set_tdm_slots(struct snd_soc_dai *dai, u32 *tx_mask,
 			  unsigned int slot_width)
 {
 	struct axg_tdm_iface *iface = snd_soc_dai_get_drvdata(dai);
-	struct axg_tdm_stream *tx = (struct axg_tdm_stream *)
-		dai->playback_dma_data;
-	struct axg_tdm_stream *rx = (struct axg_tdm_stream *)
-		dai->capture_dma_data;
+	struct axg_tdm_stream *tx = snd_soc_dai_dma_data_get_playback(dai);
+	struct axg_tdm_stream *rx = snd_soc_dai_dma_data_get_capture(dai);
 	unsigned int tx_slots, rx_slots;
 	unsigned int fmt = 0;
 
@@ -362,11 +360,14 @@ static int axg_tdm_iface_prepare(struct snd_pcm_substream *substream,
 
 static int axg_tdm_iface_remove_dai(struct snd_soc_dai *dai)
 {
-	if (dai->capture_dma_data)
-		axg_tdm_stream_free(dai->capture_dma_data);
+	int stream;
 
-	if (dai->playback_dma_data)
-		axg_tdm_stream_free(dai->playback_dma_data);
+	for_each_pcm_streams(stream) {
+		struct axg_tdm_stream *ts = snd_soc_dai_dma_data_get(dai, stream);
+
+		if (ts)
+			axg_tdm_stream_free(ts);
+	}
 
 	return 0;
 }
@@ -374,19 +375,20 @@ static int axg_tdm_iface_remove_dai(struct snd_soc_dai *dai)
 static int axg_tdm_iface_probe_dai(struct snd_soc_dai *dai)
 {
 	struct axg_tdm_iface *iface = snd_soc_dai_get_drvdata(dai);
+	int stream;
 
-	if (dai->capture_widget) {
-		dai->capture_dma_data = axg_tdm_stream_alloc(iface);
-		if (!dai->capture_dma_data)
-			return -ENOMEM;
-	}
+	for_each_pcm_streams(stream) {
+		struct axg_tdm_stream *ts;
+
+		if (!snd_soc_dai_get_widget(dai, stream))
+			continue;
 
-	if (dai->playback_widget) {
-		dai->playback_dma_data = axg_tdm_stream_alloc(iface);
-		if (!dai->playback_dma_data) {
+		ts = axg_tdm_stream_alloc(iface);
+		if (!ts) {
 			axg_tdm_iface_remove_dai(dai);
 			return -ENOMEM;
 		}
+		snd_soc_dai_dma_data_set(dai, stream, ts);
 	}
 
 	return 0;
diff --git a/sound/soc/meson/axg-tdmin.c b/sound/soc/meson/axg-tdmin.c
index 49b613a1faf2..c8f6ea24ae78 100644
--- a/sound/soc/meson/axg-tdmin.c
+++ b/sound/soc/meson/axg-tdmin.c
@@ -83,7 +83,7 @@ axg_tdmin_get_tdm_stream(struct snd_soc_dapm_widget *w)
 	if (!be)
 		return NULL;
 
-	return be->capture_dma_data;
+	return snd_soc_dai_dma_data_get_capture(be);
 }
 
 static void axg_tdmin_enable(struct regmap *map)
diff --git a/sound/soc/meson/axg-tdmout.c b/sound/soc/meson/axg-tdmout.c
index 22d519fc07b2..c4039e4f0847 100644
--- a/sound/soc/meson/axg-tdmout.c
+++ b/sound/soc/meson/axg-tdmout.c
@@ -81,7 +81,7 @@ axg_tdmout_get_tdm_stream(struct snd_soc_dapm_widget *w)
 	if (!be)
 		return NULL;
 
-	return be->playback_dma_data;
+	return snd_soc_dai_dma_data_get_playback(be);
 }
 
 static void axg_tdmout_enable(struct regmap *map)
diff --git a/sound/soc/meson/meson-codec-glue.c b/sound/soc/meson/meson-codec-glue.c
index 80c5ed196961..5913486c43ab 100644
--- a/sound/soc/meson/meson-codec-glue.c
+++ b/sound/soc/meson/meson-codec-glue.c
@@ -39,13 +39,13 @@ meson_codec_glue_get_input(struct snd_soc_dapm_widget *w)
 static void meson_codec_glue_input_set_data(struct snd_soc_dai *dai,
 					    struct meson_codec_glue_input *data)
 {
-	dai->playback_dma_data = data;
+	snd_soc_dai_dma_data_set_playback(dai, data);
 }
 
 struct meson_codec_glue_input *
 meson_codec_glue_input_get_data(struct snd_soc_dai *dai)
 {
-	return dai->playback_dma_data;
+	return snd_soc_dai_dma_data_get_playback(dai);
 }
 EXPORT_SYMBOL_GPL(meson_codec_glue_input_get_data);
 
@@ -99,8 +99,8 @@ int meson_codec_glue_output_startup(struct snd_pcm_substream *substream,
 				    struct snd_soc_dai *dai)
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct meson_codec_glue_input *in_data =
-		meson_codec_glue_output_get_input_data(dai->capture_widget);
+	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget_capture(dai);
+	struct meson_codec_glue_input *in_data = meson_codec_glue_output_get_input_data(w);
 
 	if (!in_data)
 		return -ENODEV;
-- 
2.25.1

