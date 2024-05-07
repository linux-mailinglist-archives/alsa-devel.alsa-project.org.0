Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD28B8BDFC6
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2024 12:31:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45CF2839;
	Tue,  7 May 2024 12:31:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45CF2839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715077870;
	bh=w+Fl9c8AtnA+l9Cg99+RBTFrfVWFNV6HnWmwPoSsPcg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZAew6Ft4cAptenh0z7WHMesBLJ6yJnFw3gC4rzBx7Swl/Mg14yHWkWyZGlRPrx6gn
	 Y+kyemBOW89ggV0Pvd7HftRMTzA8GpjnGRwnYm73r0+4PAEGIDbu2JCcyjDOTZ85sc
	 CYt+Tbocu0SfoN0NumgioZ3p56zUwd2UpgQS/60s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73F09F80423; Tue,  7 May 2024 12:30:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A57FCF805A0;
	Tue,  7 May 2024 12:30:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD790F805B1; Tue,  7 May 2024 12:27:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7AB6CF8049C
	for <alsa-devel@alsa-project.org>; Tue,  7 May 2024 12:27:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AB6CF8049C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=r3INxpxM
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a5200afe39eso763847266b.1
        for <alsa-devel@alsa-project.org>;
 Tue, 07 May 2024 03:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715077666; x=1715682466;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=frwVb4bQCosSJuHrr/Xjlu4xhpYBhEr8JVc+TOrLf3o=;
        b=r3INxpxMe1XlFhOl1BncDZaumV6unSiSlJNQw5jkZTeD4mMrNZxpYEAeol1STid5LE
         mLSe3pYaTeyaiYNnN6rlfCIM4mKWAMwr0JbwtE8Dmyb7I28VSn+a1W8PJzC6VBoLMFQ9
         oz/SbtL4mx4EqG8RLQHg9WuoxuFdXCexiHXJqsMcczUAaZPBbTdUJTeipB1D17achsyk
         2e5i4U73R7DrbvaAEd2q8W5/ngkQU/oStx9uWYifpwWj9k+LnjR+le8RLU1wxVpGRz2K
         RrC7kqPcqMJsBgAUfmKtdBuI7l4RKd+vIUkxjhr1gVUuuUw8HXSBHXur1CWLDK8+cxDR
         Lg8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715077666; x=1715682466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=frwVb4bQCosSJuHrr/Xjlu4xhpYBhEr8JVc+TOrLf3o=;
        b=IA9IEtjZpWKV8lx8Vi187V//nw4IXBJpcO20nw+tr8JITgl9NpnQSDrsgrCdeI0mwj
         BgOwxxYeo+mDwsQn95Zjef2FoOfoDKuesd7xYwRtoRCSjSlGhG8pGJjr+ibbolo3yPwV
         isXpCmDP6IEBEPgHMPuKCmQV17zXg/HmnkpB6YnhBud5YTiSa6m7vEC5eej++GjYwW7W
         DuUESaQmt/LNivPvT9elVtXgOAfRiMxfVon1aoIQ2k+eT4f/rCjHj8zweXAj2UQb0zyE
         xklftsN0V0fYnf/AIssORjkYwQY3h9pbTAqFEpHcax3cmqnpAbtKYCuEhrgGJ3vGSjYa
         yflQ==
X-Gm-Message-State: AOJu0YweJjhD1ymPIDeqFpeDUWzNVkZ7xHsOK1Vr1bwZpf6j0KDQjEQX
	iDphdx/igKB7jPf4SYdR7H0Wp/Ln38jCXvmz4wcQFCtU4IouempkpS6lCCLq5vpKJaSeh4zzgis
	H
X-Google-Smtp-Source: 
 AGHT+IHboeLxH9ZlC99nEXUe5Xp5uK4F4Ftf7MB/od/D3dIouLXpgXrm5GbrxBLT3K4oEU8bz77mNw==
X-Received: by 2002:a17:906:c415:b0:a59:a977:a159 with SMTP id
 u21-20020a170906c41500b00a59a977a159mr7420468ejz.64.1715077666141;
        Tue, 07 May 2024 03:27:46 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id
 bo15-20020a170906d04f00b00a59b87dd0bbsm3370093ejb.161.2024.05.07.03.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 03:27:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 07 May 2024 12:27:31 +0200
Subject: [PATCH 2/4] ASoC: qcom: q6dsp: Implement proper channel mapping in
 Audioreach
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240507-asoc-x1e80100-4-channel-mapping-v1-2-b12c13e0a55d@linaro.org>
References: 
 <20240507-asoc-x1e80100-4-channel-mapping-v1-0-b12c13e0a55d@linaro.org>
In-Reply-To: 
 <20240507-asoc-x1e80100-4-channel-mapping-v1-0-b12c13e0a55d@linaro.org>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5679;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=w+Fl9c8AtnA+l9Cg99+RBTFrfVWFNV6HnWmwPoSsPcg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmOgIaKvmANyZKclREQrsCajh6i81LFK/Hyjt3l
 OEPizCxqTqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjoCGgAKCRDBN2bmhouD
 1+sMD/90/buBkgY9ho+CVgCsV9DM/H02icdUsmdJiwuG/OCPvTtxuhMqj6GJC4AehbBP7hNPPT2
 cNGSXyo/Hhuni/1SQBMTENd7dDpm1/HlcQZohfB3KguU8gd3fmYk5/lEjJrJzf4KNz7FJSQhW+4
 48sjo3c23reJCJLpnwgf0a4s9Lu/Hx0Y8n4j3M7+KW5lLP6l2NeawGsxMqA1BQhhbimlVrselDM
 35i3dM6uufruxzq+SsEKofs62e583ev9SGUVLoNJgp0LndyW4x/vk5zjJvGA/UGPXC4twme5uhL
 9pG0queC+Uw0xrdjt1Ldug2NDgKj1JjWI2FcDY2IKBHeHBghbDgHpwokHlvg/KXD+SVvBKuCk/o
 65cWEWJe8EDmVoI3d4wq/owSVc7ZQWdsOBLo6+XYEXBOvE1MO1pWVRu56qzb/whCJotGZbkyTFo
 vWtfG02mIC9TUSAtGE9YYKiyQEFsDE5pXrLWDQNvL9HqFwDdSGUgSc0BLjkg/YhAkNRh4LQO2UT
 3SAfnjqlp1HoR2fToqzcSVSp5JZ3gIsOInJKDyZOVe93dKCp5BUBIXEm2t0vHe6CUm0T2C6wXHl
 5WWxmxR4IAj8wvE9r/HF+W4K6L5lK8i4R9levS2CQMMAHvR1Ag4KdwPKq55OPRyWOl1JHge6ltC
 7LNJn2vkCcQwugg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: DF2AVR3LPRYLC4HAEC3NU3X2EGYXY3CD
X-Message-ID-Hash: DF2AVR3LPRYLC4HAEC3NU3X2EGYXY3CD
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DF2AVR3LPRYLC4HAEC3NU3X2EGYXY3CD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Instead of relying on default channel mapping in all Audioreach
platforms, implement set_channel_map() callback to allow sound cards
customize the mapping depending on needs.

The channel mapping is set on frontend DAIs coming from the topology,
not DTS, thus need to add DAI ops in topology dai_load() callback.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/qdsp6/audioreach.c |  2 +-
 sound/soc/qcom/qdsp6/audioreach.h |  1 +
 sound/soc/qcom/qdsp6/q6apm.c      | 28 +++++++++++++++++++++++++++-
 sound/soc/qcom/qdsp6/q6apm.h      |  8 ++++++++
 sound/soc/qcom/qdsp6/topology.c   | 12 ++++++++++++
 5 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index c655f0213723..8175678d8843 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -267,7 +267,7 @@ void *audioreach_alloc_apm_cmd_pkt(int pkt_size, uint32_t opcode, uint32_t token
 }
 EXPORT_SYMBOL_GPL(audioreach_alloc_apm_cmd_pkt);
 
-static void audioreach_set_channel_mapping(u8 *ch_map, int num_channels)
+void audioreach_set_channel_mapping(u8 *ch_map, int num_channels)
 {
 	if (num_channels == 1) {
 		ch_map[0] =  PCM_CHANNEL_FL;
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 2c82917b7162..cef9a9015dcc 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -767,6 +767,7 @@ struct audioreach_module_config {
 /* Packet Allocation routines */
 void *audioreach_alloc_apm_cmd_pkt(int pkt_size, uint32_t opcode, uint32_t
 				    token);
+void audioreach_set_channel_mapping(u8 *ch_map, int num_channels);
 void *audioreach_alloc_cmd_pkt(int payload_size, uint32_t opcode,
 			       uint32_t token, uint32_t src_port,
 			       uint32_t dest_port);
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 2a2a5bd98110..c29a2dd36992 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -13,6 +13,7 @@
 #include <linux/soc/qcom/apr.h>
 #include <linux/wait.h>
 #include <sound/soc.h>
+#include <sound/soc-dai.h>
 #include <sound/soc-dapm.h>
 #include <sound/pcm.h>
 #include "audioreach.h"
@@ -29,6 +30,29 @@ struct apm_graph_mgmt_cmd {
 
 static struct q6apm *g_apm;
 
+static int q6apm_dai_set_channel_map(struct snd_soc_dai *dai,
+				     unsigned int tx_num,
+				     const unsigned int *tx_ch_mask,
+				     unsigned int rx_num,
+				     const unsigned int *rx_ch_mask)
+{
+	struct q6apm *apm = dev_get_drvdata(dai->dev);
+	int i;
+
+	if (dai->id >= ARRAY_SIZE(apm->dai_config))
+		return -EINVAL;
+
+	apm->dai_config[dai->id].num_channels = rx_num;
+	for (i = 0; i < rx_num; i++)
+		apm->dai_config[dai->id].channel_map[i] = rx_ch_mask[i];
+
+	return 0;
+}
+
+const struct snd_soc_dai_ops q6apm_dai_ops = {
+	.set_channel_map	= q6apm_dai_set_channel_map,
+};
+
 int q6apm_send_cmd_sync(struct q6apm *apm, struct gpr_pkt *pkt, uint32_t rsp_opcode)
 {
 	gpr_device_t *gdev = apm->gdev;
@@ -722,7 +746,7 @@ static int apm_probe(gpr_device_t *gdev)
 {
 	struct device *dev = &gdev->dev;
 	struct q6apm *apm;
-	int ret;
+	int ret, i;
 
 	apm = devm_kzalloc(dev, sizeof(*apm), GFP_KERNEL);
 	if (!apm)
@@ -733,6 +757,8 @@ static int apm_probe(gpr_device_t *gdev)
 	mutex_init(&apm->lock);
 	apm->dev = dev;
 	apm->gdev = gdev;
+	for (i = 0; i < ARRAY_SIZE(apm->dai_config); i++)
+		audioreach_set_channel_mapping(apm->dai_config[i].channel_map, 4);
 	init_waitqueue_head(&apm->wait);
 
 	INIT_LIST_HEAD(&apm->widget_list);
diff --git a/sound/soc/qcom/qdsp6/q6apm.h b/sound/soc/qcom/qdsp6/q6apm.h
index c248c8d2b1ab..0e2e7b6cd6c1 100644
--- a/sound/soc/qcom/qdsp6/q6apm.h
+++ b/sound/soc/qcom/qdsp6/q6apm.h
@@ -47,6 +47,11 @@
 #define APM_LAST_BUFFER_FLAG			BIT(30)
 #define NO_TIMESTAMP				0xFF00
 
+struct q6apm_dai_config {
+	unsigned int num_channels;
+	u8 channel_map[AR_PCM_MAX_NUM_CHANNEL];
+};
+
 struct q6apm {
 	struct device *dev;
 	gpr_port_t *port;
@@ -65,6 +70,7 @@ struct q6apm {
 	struct idr sub_graphs_idr;
 	struct idr containers_idr;
 	struct idr modules_idr;
+	struct q6apm_dai_config dai_config[4];
 };
 
 struct audio_buffer {
@@ -108,6 +114,8 @@ struct q6apm_graph {
 	struct audioreach_graph_info *info;
 };
 
+extern const struct snd_soc_dai_ops q6apm_dai_ops;
+
 /* Graph Operations */
 struct q6apm_graph *q6apm_graph_open(struct device *dev, q6apm_cb cb,
 				     void *priv, int graph_id);
diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index 70572c83e101..9708d200568d 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -1034,6 +1034,17 @@ static int audioreach_tplg_complete(struct snd_soc_component *component)
 	return 0;
 }
 
+static int audioreach_dai_load(struct snd_soc_component *cmp, int index,
+			       struct snd_soc_dai_driver *dai_drv,
+			       struct snd_soc_tplg_pcm *pcm,
+			       struct snd_soc_dai *dai)
+{
+	if (pcm)
+		dai_drv->ops = &q6apm_dai_ops;
+
+	return 0;
+}
+
 /* DAI link - used for any driver specific init */
 static int audioreach_link_load(struct snd_soc_component *component, int index,
 				struct snd_soc_dai_link *link,
@@ -1251,6 +1262,7 @@ static struct snd_soc_tplg_ops audioreach_tplg_ops  = {
 	.widget_unload = audioreach_widget_unload,
 
 	.complete = audioreach_tplg_complete,
+	.dai_load = audioreach_dai_load,
 	.link_load = audioreach_link_load,
 
 	.dapm_route_load	= audioreach_route_load,

-- 
2.43.0

