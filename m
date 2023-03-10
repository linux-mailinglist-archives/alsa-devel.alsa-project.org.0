Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 159A46B471D
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 15:48:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6100E18AE;
	Fri, 10 Mar 2023 15:48:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6100E18AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678459737;
	bh=KzD5GY515ptwHFTcAVXR8EtlJ5ilwmppy3W5Ka05Yc8=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mGYQ3TnRnyeGVsJ4lPBWTNJP14zyPqm2N7J5MxBBWuQJa533fz8x56wCNlV/7XaIQ
	 zD5YYmabftUzxztsu4AtIzhaenaYOdI/Vdt1h/DnY6IkHKA438+pwBOhRXy05OaP0/
	 0y6iJ0p7uhA9zBT+YOmfhHGpIQaDVVeBI5Aj18Dk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3A5DF8042F;
	Fri, 10 Mar 2023 15:48:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D6BBF8042F; Fri, 10 Mar 2023 15:48:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3BFA4F80093
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 15:47:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BFA4F80093
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-17638494edbso6034384fac.10
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Mar 2023 06:47:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678459677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8lNbDhvtNNABoeoJ1EEfrQ6VIu2kxnEGjaB82Wf/W24=;
        b=cg0ATSKjxXf2zpc4n5qOy49F3mKo2sTtDM+RsczQ/qyLlzGxg/Sl+HmcQ6592ndDtG
         mX9rEGngDPqb7PsuOOwNNASvYADFhkm4UyFdkFZl6bWRpAMgyGKwafxqBtpRB6M7FJTF
         NAcFF7P/7vm50wjIPK5miljinI3WtkrOwvex8qlGnERjOiKveRFexMF7DWXusZYbOKOc
         RsnWtShAGAhVdD6E9OOlcvvZFkZgEeJ3brdfxxTXYLoNqvBbYCJAQqU0xx5gvqd7ZYSt
         usdvmfydnH0B2q67zVomEuvs8d0qWcUy5nGaZz80uZNzfyHzdFeMJcZ8Ys3XBwOliGR3
         8XrA==
X-Gm-Message-State: AO0yUKWTrWzhOALCEtnGIzP4Jom5gUgHtFDARwMFXLisKgMJ4aF+3TuN
	xWmmk721IqgIMA5PaSsqxQ==
X-Google-Smtp-Source: 
 AK7set9I+4VRoGtOVjvZEWPeH4QUf03Pg5OM+6KwBoqWhi2Fyc9oRdnGlhttZ2bQMXTrEhf9nUK3ig==
X-Received: by 2002:a05:6870:73c6:b0:163:535d:4a86 with SMTP id
 a6-20020a05687073c600b00163535d4a86mr15295757oan.22.1678459676973;
        Fri, 10 Mar 2023 06:47:56 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 m3-20020a056870a40300b00172289de1besm115189oal.18.2023.03.10.06.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 06:47:56 -0800 (PST)
Received: (nullmailer pid 1546370 invoked by uid 1000);
	Fri, 10 Mar 2023 14:47:32 -0000
From: Rob Herring <robh@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH] ASoC: Use of_property_present() for testing DT property
 presence
Date: Fri, 10 Mar 2023 08:47:31 -0600
Message-Id: <20230310144732.1546328-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: H5LKDWYGISI6QYYYBCINM3CCR55ZK2Z5
X-Message-ID-Hash: H5LKDWYGISI6QYYYBCINM3CCR55ZK2Z5
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H5LKDWYGISI6QYYYBCINM3CCR55ZK2Z5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

It is preferred to use typed property access functions (i.e.
of_property_read_<type> functions) rather than low-level
of_get_property/of_find_property functions for reading properties. As
part of this, convert of_get_property/of_find_property calls to the
recently added of_property_present() helper when we just want to test
for presence of a property and nothing more.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 sound/soc/codecs/lpass-macro-common.c | 2 +-
 sound/soc/generic/audio-graph-card.c  | 2 +-
 sound/soc/generic/audio-graph-card2.c | 2 +-
 sound/soc/mxs/mxs-sgtl5000.c          | 2 +-
 sound/soc/samsung/i2s.c               | 2 +-
 sound/soc/sh/fsi.c                    | 2 +-
 sound/soc/stm/stm32_i2s.c             | 2 +-
 sound/soc/stm/stm32_sai_sub.c         | 4 ++--
 sound/soc/tegra/tegra_asoc_machine.c  | 2 +-
 9 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/lpass-macro-common.c b/sound/soc/codecs/lpass-macro-common.c
index 1b9082d237c1..f54baaad54d4 100644
--- a/sound/soc/codecs/lpass-macro-common.c
+++ b/sound/soc/codecs/lpass-macro-common.c
@@ -16,7 +16,7 @@ struct lpass_macro *lpass_macro_pds_init(struct device *dev)
 	struct lpass_macro *l_pds;
 	int ret;
 
-	if (!of_find_property(dev->of_node, "power-domains", NULL))
+	if (!of_property_present(dev->of_node, "power-domains"))
 		return NULL;
 
 	l_pds = devm_kzalloc(dev, sizeof(*l_pds), GFP_KERNEL);
diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 5daa824a4ffc..d788f5f23a8a 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -78,7 +78,7 @@ static int graph_get_dai_id(struct device_node *ep)
 		 * only of_graph_parse_endpoint().
 		 * We need to check "reg" property
 		 */
-		if (of_get_property(ep,   "reg", NULL))
+		if (of_property_present(ep,   "reg"))
 			return info.id;
 
 		node = of_get_parent(ep);
diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 06609a526b78..259544f64df9 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -376,7 +376,7 @@ static int graph_get_dai_id(struct device_node *ep)
 		 * only of_graph_parse_endpoint().
 		 * We need to check "reg" property
 		 */
-		if (of_get_property(ep,   "reg", NULL))
+		if (of_property_present(ep,   "reg"))
 			return info.id;
 
 		node = of_get_parent(ep);
diff --git a/sound/soc/mxs/mxs-sgtl5000.c b/sound/soc/mxs/mxs-sgtl5000.c
index 746f40938675..a55e7256a4c3 100644
--- a/sound/soc/mxs/mxs-sgtl5000.c
+++ b/sound/soc/mxs/mxs-sgtl5000.c
@@ -150,7 +150,7 @@ static int mxs_sgtl5000_probe(struct platform_device *pdev)
 
 	card->dev = &pdev->dev;
 
-	if (of_find_property(np, "audio-routing", NULL)) {
+	if (of_property_present(np, "audio-routing")) {
 		card->dapm_widgets = mxs_sgtl5000_dapm_widgets;
 		card->num_dapm_widgets = ARRAY_SIZE(mxs_sgtl5000_dapm_widgets);
 
diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 6f96032090de..083e278aa021 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1289,7 +1289,7 @@ static int i2s_register_clock_provider(struct samsung_i2s_priv *priv)
 	int ret, i;
 
 	/* Register the clock provider only if it's expected in the DTB */
-	if (!of_find_property(dev->of_node, "#clock-cells", NULL))
+	if (!of_property_present(dev->of_node, "#clock-cells"))
 		return 0;
 
 	/* Get the RCLKSRC mux clock parent clock names */
diff --git a/sound/soc/sh/fsi.c b/sound/soc/sh/fsi.c
index f3edc2e3d9d7..9f3f1af6349f 100644
--- a/sound/soc/sh/fsi.c
+++ b/sound/soc/sh/fsi.c
@@ -1855,7 +1855,7 @@ static void fsi_of_parse(char *name,
 
 	for (i = 0; i < ARRAY_SIZE(of_parse_property); i++) {
 		sprintf(prop, "%s,%s", name, of_parse_property[i].name);
-		if (of_get_property(np, prop, NULL))
+		if (of_property_present(np, prop))
 			flags |= of_parse_property[i].val;
 	}
 	info->flags = flags;
diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index f3dd9f8e621c..9dad85ecb93f 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -1066,7 +1066,7 @@ static int stm32_i2s_parse_dt(struct platform_device *pdev,
 				     "Could not get x11k parent clock\n");
 
 	/* Register mclk provider if requested */
-	if (of_find_property(np, "#clock-cells", NULL)) {
+	if (of_property_present(np, "#clock-cells")) {
 		ret = stm32_i2s_add_mclk_provider(i2s);
 		if (ret < 0)
 			return ret;
diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index eb31b49e6597..8ba4206f751d 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -1394,7 +1394,7 @@ static int stm32_sai_sub_parse_of(struct platform_device *pdev,
 
 	/* Get spdif iec60958 property */
 	sai->spdif = false;
-	if (of_get_property(np, "st,iec60958", NULL)) {
+	if (of_property_present(np, "st,iec60958")) {
 		if (!STM_SAI_HAS_SPDIF(sai) ||
 		    sai->dir == SNDRV_PCM_STREAM_CAPTURE) {
 			dev_err(&pdev->dev, "S/PDIF IEC60958 not supported\n");
@@ -1480,7 +1480,7 @@ static int stm32_sai_sub_parse_of(struct platform_device *pdev,
 		return 0;
 
 	/* Register mclk provider if requested */
-	if (of_find_property(np, "#clock-cells", NULL)) {
+	if (of_property_present(np, "#clock-cells")) {
 		ret = stm32_sai_add_mclk_provider(sai);
 		if (ret < 0)
 			return ret;
diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index 78faa8bcae27..2dc1f44c5a8b 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -502,7 +502,7 @@ int tegra_asoc_machine_probe(struct platform_device *pdev)
 	 * If clock parents are not set in DT, configure here to use clk_out_1
 	 * as mclk and extern1 as parent for Tegra30 and higher.
 	 */
-	if (!of_find_property(dev->of_node, "assigned-clock-parents", NULL) &&
+	if (!of_property_present(dev->of_node, "assigned-clock-parents") &&
 	    !of_machine_is_compatible("nvidia,tegra20")) {
 		struct clk *clk_out_1, *clk_extern1;
 
-- 
2.39.2

