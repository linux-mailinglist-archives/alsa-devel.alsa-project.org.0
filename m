Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DBC79B164
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 01:54:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C162BE99;
	Tue, 12 Sep 2023 01:54:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C162BE99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476494;
	bh=eGSZldMvKsm/Yom/NSIBvbAgamEkdRm3Tk7LeMi0VIQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uuvYRMDS/W+3ZCA774ekIGGsVaT+e5/kGv4Qc4dBTtb+Pg+0ozaldBYio55yp2mop
	 cSEMI7hIWC0Q8TVNI9RsJCTAuK0NF5BxBVug7jfmVGp1gVUPltH1mVr6IIfGyDCzBJ
	 Kg4lrDhZ+XSG+eAlyjvvdpXztS007cgFq4oyk7I4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E0CCF8065A; Tue, 12 Sep 2023 01:51:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29ECAF80652;
	Tue, 12 Sep 2023 01:51:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1169F8063C; Tue, 12 Sep 2023 01:50:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B29B5F805AE
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:49:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B29B5F805AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=jdxnsSy1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S7/esGFD0uVSHgHdOkzjJXudo9G4osdHd9BKETXR9mt3oNk5l79ymJl91nrV9QobE+m9kG+evG66WpfyBZg6UqqE/8P8VyFVF4QkexvhqwI8Cj5CSGp9hczbX2tn3TFCRWWohck80LLRU6wmgP8Maov1N6EMKtKP9lvl+gKcLiD3xnxgjFpotD7HlEsi+X5TAzkFwnB8vs3wIPkwRh3KFSdJTxj3hJsRLT1WoNeDKOaPUydFgl6HZSluqCeeAjPge8TjHI9f2rzf6uA4F+EDCj/Z9ldoT6iM3Guz3tTKn77w8I0Gay0ksBlxKTW11q8jXjLTpwNULgyRQeffGLBPww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UdxX7tv/3YnbUeudge3Otqv/YReKToKjYwGmjkB4Bvo=;
 b=cML5PG0mJaIJBFbWMu6EvgvOY78u4b+sM9vJ4gbz9Oclwv9OB+p1K/wmMqhvTvF6OXvQzWBSqoJNiZJcApNTBJZ1uLzc2w6mH+qo/eAwaVgThfkKiKDVkRKZSIEWtVIRSkkYdRYPXLW3ATJr7HF1znrCCEqnwVTEz2EaH39mxPI0PQ4ZFd58ioEs53214lcRMqx7aFOtJ0ZX0Dg1LgVQ6RaHQDblDrlzrDo5FKPyNneZ8TX8RmeKb3Kz3JPBQdJaysA/VTLHeOpEiuN1wrgCHZ/EYIRVHfB+TLaAx/4pXEIN7lKouw2Vg8biSw0vgWQBihvjNn6TNuaF8a33iQgm/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UdxX7tv/3YnbUeudge3Otqv/YReKToKjYwGmjkB4Bvo=;
 b=jdxnsSy1T/c0Npa6jAC6znct/l3z44X7T6kswdUJEVlz7Ds5G5aoJTsnJEq4suTyBCjxCvn2D2k5g3fXzZy6QDUL2yq56xT65lCFU/sVvnZZN88IKjJSGJzyqrntVxayvSThew2aGpKbz9pM0A2qgwuG/eEyLqTcgL1vAsnUoQY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSRPR01MB11567.jpnprd01.prod.outlook.com (2603:1096:604:22d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Mon, 11 Sep
 2023 23:49:29 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:49:29 +0000
Message-ID: <87jzswqnhy.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?UTF-8?B?IlBhd2XDhYIgQW5pa2llbCI=?= <pan@semihalf.com>, Jaroslav Kysela
 <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 23/54] ASoC: google: convert not to use asoc_xxx()
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:49:29 +0000
X-ClientProxiedBy: TYCP286CA0198.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSRPR01MB11567:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f6cba49-9a84-464d-afd2-08dbb321bd66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7c2xHMljH8uP1XDSLTXUAE44W7O48CWlTkeEzeNcglvKMQjlZ7eQXMln65GOwDSw1G4Jb2bOPOI5WrFxkgfRyCptW3KAe1NGeXSQuBrVJyp16jbispldcM4o59+PNb8JEu1YR5AZaoT084JApCb7ldLoUfXaM92Vv5TQwxP7w7IsCTgCKV/MOVBQVUKaUQrTJDr0YqCdJhnTqhPBXatl+M72WMQO7lw07cpXUxAYqIyX1a2S26ZRyudAU1Nrm+7AItt2q5Z/W9YZfYIXQ+Rav2Ac7+S6u+rypQ/C6w29CC6eUoOvay4kPx+zPBInF+ooRU24TXPQ9buAwtdNNju6tDFRpv9FFzw/4m51Oqwln4R1946LoIMpwZqjrhSMQaK4eJUyL3ER+cOBX4xX2+zx2jYMfK3Wd4/Yfe3QuMHoD0Lz1t8QmEASm5dBS6fHxZFv9BsVOWEgRAUHaHAPkFPfbJYhQwDYLNpRwL//WYFx/N9aN7/QEKODmrmdbtSVvNht0A1EdFAmFx09ZFC+twRu8AswDg7pM+Z1KKuxMQHWV5P22bkcbxh2cmpPiye8d/uG4sEIgx/MvRS8zfoi8W9uyLGGYHAderrmwaERMIMTq9jXVtTZTj1pr2fmb0DxWzwGm9Fh4qhxNCqkElj6bW0B2A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(396003)(376002)(136003)(186009)(1800799009)(451199024)(6506007)(52116002)(6486002)(6512007)(478600001)(83380400001)(2616005)(26005)(2906002)(66556008)(66946007)(66476007)(41300700001)(110136005)(5660300002)(8676002)(4326008)(8936002)(86362001)(36756003)(38100700002)(38350700002)(316002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?axe2VxlFc83QeuwpA8xA+3AevHQtBtNE3hJEK5Xjf8Sy6dDrK2vlhf1boXw9?=
 =?us-ascii?Q?Do6d6+/bEBN2rLulSreaYYKoWLOu0WpwyJYBtQcoRS7Fubtgb2eZ3/ElrFv2?=
 =?us-ascii?Q?dPvmeCn5m04qkUY5xu/PTjRHVGfbPzlT7bnFloBZ9oLFRVvwwr12PuvCAkl2?=
 =?us-ascii?Q?e1k6FzoaIPHVDwfeMrcqhh5JsxtU5GTuSR2zfZpPbD5rx3+0yaLHHlor/s3O?=
 =?us-ascii?Q?lv9KhR9HoIm+ZSkNR7jeL2xuSeI1TWG0jbXQ2Nw7YQKIgfH6xbZB6ImwXk9n?=
 =?us-ascii?Q?sueBiDMN4LUtr2/J7hbA+aPchRU6o9W4/+AXoBw1WoqjqE7K4Txm3rmnsMwz?=
 =?us-ascii?Q?1esJaretigpgaNhqRCYBTolM27K+F8FJi/N2v0kVmllkNUUl0/i9bjJB303N?=
 =?us-ascii?Q?7ApQrJBzPCOz6IWrTSy6drMmhYHtqswxyAkPFULouthh1AjVeSDHCe4N50rD?=
 =?us-ascii?Q?wUu/nEzvS7f7kMOLUzMsw+RbNzS/jRBiso3h4HdbHWGjLdiCKdCGwTpLdap3?=
 =?us-ascii?Q?l/pTDJMtZ6+ENk9aJUGpMFc/y3YYjRusGwH88WHKQcfD2czC1OaysJuybngD?=
 =?us-ascii?Q?xQuAQHjbI23HUSh1dZCqmNDgVrTp0S89Ag8VVeMtjDXg59fYdDICHhSrUdvy?=
 =?us-ascii?Q?zgeI4CDo9K8Ze7LvfFE5yB8+cQqelh6Y/FVXt0LmFFlz2XeSXHVZnn/8OoWt?=
 =?us-ascii?Q?U7jOGLOdMuGeVrJsp1e9d2vm3ZdLhLJ42Vkfji5CpryG0k3Ej3SlS7jvFLde?=
 =?us-ascii?Q?IKljGtBcA/VaHCQHrVbAoTpx3P1vsqC0/2Bmdm8ZH9T8aIkuUU+0CJAU9d5z?=
 =?us-ascii?Q?bZwcknx/UP5hiGxYJQ1FQZXl9oSh2tlkVSeZoUDCoNB8xcz/hJZ/EcWGaz2K?=
 =?us-ascii?Q?dw9UCjTbBFvF2O+5t/R7zrRkP4decWO0IYOCAKGoeyJ0PStPen75zjtoVAyX?=
 =?us-ascii?Q?y5ifoaqwK1hG8wq9dwmVJIQwn6QRvibgR1mpDRF4I0BwMNyAqPpelwPfrYu5?=
 =?us-ascii?Q?kzLLE5pLHfid9VyF1VG2lroeJs2k8Hgz+X1XVoBGZXtn6W/2h1tCkWhO5vTV?=
 =?us-ascii?Q?xIZ6CrN6+sDmfhlghnNlyLRpq+mejZEbp+pmaW66f4u+164/jFuQ9LSIvFmN?=
 =?us-ascii?Q?hTJ6TvlL7cEWadlOPtenKwvUJmAz+uwan5vvQ6ezXTHNjf3IxArS4tGAh79k?=
 =?us-ascii?Q?AICfIL/PS2i/idaJoTQNYbJnCzhHyu2qO6WFES9Cy+S+/7QdX8vEA8HJAjlD?=
 =?us-ascii?Q?VTHOB6iChKg8Ml9XdUIvDLaVf2h9h2C8hIjvr2pfuv8IblPxiyyjGJsWAEX4?=
 =?us-ascii?Q?JBcJrwsM6xHO0HmsI0IMbEf3D47X6phna62nH5ILfJPGlCsMuGV8IDsFJyuW?=
 =?us-ascii?Q?KosE1v226Js4twAQcJ9U3XryqmxCaVB8v6AD2b/1YaI/vVQi2TBxpmyvNqsU?=
 =?us-ascii?Q?/bEQl3NquriHwZCBU5MrjWvEwfRPYBzyup80HBVOBEC+RMKOsFaBY+w5hKXV?=
 =?us-ascii?Q?LWR7R2bwfp/zDrx/NF/EQTW8RTYmntjz7O3i8THpm1HLOHLkAzPPYJ9wNnD1?=
 =?us-ascii?Q?SO2xUgTC4ZGKdF6dEpBf3JM2fSuIePZBMLya4F1O1ULbodDvQr//VBncaSby?=
 =?us-ascii?Q?AkH7l0A58r7HyYA1gO4NYcs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0f6cba49-9a84-464d-afd2-08dbb321bd66
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:49:29.7164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Jxl0f/mMOd88ABXtDBxZ1Oe7C0yTMUTkzRLxyF03Fuexyi5IPMJiRFCD/Ik9XB/1KIZj8J43llMS7fN4Soze/sB9edpMN6LVhun7s8x5O6Yq/iw9g3NcE5+Qd7HXv7R1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11567
Message-ID-Hash: SEHA24XPPDA4VEF7XJRNE527OB75Z5B3
X-Message-ID-Hash: SEHA24XPPDA4VEF7XJRNE527OB75Z5B3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SEHA24XPPDA4VEF7XJRNE527OB75Z5B3/>
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
 sound/soc/google/chv3-i2s.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/google/chv3-i2s.c b/sound/soc/google/chv3-i2s.c
index 0f65134449066..08e558f24af86 100644
--- a/sound/soc/google/chv3-i2s.c
+++ b/sound/soc/google/chv3-i2s.c
@@ -131,8 +131,8 @@ static irqreturn_t chv3_i2s_isr(int irq, void *data)
 static int chv3_dma_open(struct snd_soc_component *component,
 			 struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct chv3_i2s_dev *i2s = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct chv3_i2s_dev *i2s = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 	int res;
 
 	snd_soc_set_runtime_hwparams(substream, &chv3_dma_hw);
@@ -152,8 +152,8 @@ static int chv3_dma_open(struct snd_soc_component *component,
 static int chv3_dma_close(struct snd_soc_component *component,
 			  struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct chv3_i2s_dev *i2s = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct chv3_i2s_dev *i2s = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 
 	if (substream->pstr->stream == SNDRV_PCM_STREAM_CAPTURE)
 		chv3_i2s_wr(i2s, I2S_RX_ENABLE, 0);
@@ -166,7 +166,7 @@ static int chv3_dma_close(struct snd_soc_component *component,
 static int chv3_dma_pcm_construct(struct snd_soc_component *component,
 				  struct snd_soc_pcm_runtime *rtd)
 {
-	struct chv3_i2s_dev *i2s = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+	struct chv3_i2s_dev *i2s = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 	struct snd_pcm_substream *substream;
 	int res;
 
@@ -200,8 +200,8 @@ static int chv3_dma_hw_params(struct snd_soc_component *component,
 static int chv3_dma_prepare(struct snd_soc_component *component,
 			    struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct chv3_i2s_dev *i2s = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct chv3_i2s_dev *i2s = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 	unsigned int buffer_bytes, period_bytes, period_size;
 
 	buffer_bytes = snd_pcm_lib_buffer_bytes(substream);
@@ -229,8 +229,8 @@ static int chv3_dma_prepare(struct snd_soc_component *component,
 static snd_pcm_uframes_t chv3_dma_pointer(struct snd_soc_component *component,
 					  struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct chv3_i2s_dev *i2s = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct chv3_i2s_dev *i2s = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 	u32 frame_bytes, buffer_bytes;
 	u32 idx_bytes;
 
@@ -252,8 +252,8 @@ static int chv3_dma_ack(struct snd_soc_component *component,
 			struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct chv3_i2s_dev *i2s = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct chv3_i2s_dev *i2s = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 	unsigned int bytes, idx;
 
 	bytes = frames_to_bytes(runtime, runtime->control->appl_ptr);
-- 
2.25.1

