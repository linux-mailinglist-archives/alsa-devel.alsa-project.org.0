Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E37C4ED0B2
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Mar 2022 02:08:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C27651AD6;
	Thu, 31 Mar 2022 02:07:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C27651AD6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648685293;
	bh=+fNKPocUjxQXDuz3GDZUxg0u1ctHRF6erM6q0fnGmzI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dTDTPOO5yeDyBO+Dzm3YP87nybQKOSlZBGeNg7iF5OD9Ke9l3zmbD2yZKvee10K6O
	 znZEVdXCpAyxIXQNveYQY8pkgJ2KAC9L/QfLRmobEq8/QzGR/nJ+j7xo83AW1t0wbt
	 Zh7t1k4hnVT9umKhgi5uJiPhFgTptX30uUIqCqBY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37140F80533;
	Thu, 31 Mar 2022 02:05:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F5B5F8051D; Thu, 31 Mar 2022 02:05:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45339F80253
 for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022 02:05:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45339F80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="VpQis266"
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1648685133; bh=Ea0QBaJP2Xhb2qk22MNKaoz+blbZuooVi0kGOsoChyQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=VpQis266M9BalLOWg7P4c+68owWtkGGUriBUeUvRyIyl43yyS9AeR6+npb/uhLoFt
 cMdw2Woc8wg62T4OF3zn6GU3pC59+r9ZlLV67mAu/hz1u2cugNWW+fk+SqwpnZqlhG
 tWrI+oOjiZ4p8wuTk6iLkVWaYDX6HAojQwwwLI0o=
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [RFC PATCH 4/5] ASoC: Introduce snd_soc_of_get_dai_link_cpus
Date: Thu, 31 Mar 2022 02:04:48 +0200
Message-Id: <20220331000449.41062-5-povik+lin@cutebit.org>
In-Reply-To: <20220331000449.41062-1-povik+lin@cutebit.org>
References: <20220331000449.41062-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sven Peter <sven@svenpeter.dev>, Hector Martin <marcan@marcan.st>,
 linux-kernel@vger.kernel.org, Mark Kettenis <kettenis@openbsd.org>,
 =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This function is an analogue of snd_soc_of_get_dai_link_codecs to help
machine drivers read CPU DAI lists from devicetrees.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 include/sound/soc.h  |  4 +++
 sound/soc/soc-core.c | 80 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 0ab664500b8f..0bf9d1d0768c 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1266,6 +1266,10 @@ int snd_soc_of_get_dai_link_codecs(struct device *dev,
 				   struct device_node *of_node,
 				   struct snd_soc_dai_link *dai_link);
 void snd_soc_of_put_dai_link_codecs(struct snd_soc_dai_link *dai_link);
+int snd_soc_of_get_dai_link_cpus(struct device *dev,
+				 struct device_node *of_node,
+				 struct snd_soc_dai_link *dai_link);
+void snd_soc_of_put_dai_link_cpus(struct snd_soc_dai_link *dai_link);
 
 int snd_soc_add_pcm_runtime(struct snd_soc_card *card,
 			    struct snd_soc_dai_link *dai_link);
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 0bf05d98ec0d..a97476ec01ab 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -3400,6 +3400,86 @@ int snd_soc_of_get_dai_link_codecs(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(snd_soc_of_get_dai_link_codecs);
 
+/*
+ * snd_soc_of_put_dai_link_cpus - Dereference device nodes in the codecs array
+ * @dai_link: DAI link
+ *
+ * Dereference device nodes acquired by snd_soc_of_get_dai_link_cpus().
+ */
+void snd_soc_of_put_dai_link_cpus(struct snd_soc_dai_link *dai_link)
+{
+	struct snd_soc_dai_link_component *component;
+	int index;
+
+	for_each_link_cpus(dai_link, index, component) {
+		if (!component->of_node)
+			break;
+		of_node_put(component->of_node);
+		component->of_node = NULL;
+	}
+}
+EXPORT_SYMBOL_GPL(snd_soc_of_put_dai_link_cpus);
+
+/*
+ * snd_soc_of_get_dai_link_cpus - Parse a list of CPU DAIs in the devicetree
+ * @dev: Card device
+ * @of_node: Device node
+ * @dai_link: DAI link
+ *
+ * Is analogous to snd_soc_of_get_dai_link_codecs but parses a list of CPU DAIs
+ * instead.
+ *
+ * Returns 0 for success
+ */
+int snd_soc_of_get_dai_link_cpus(struct device *dev,
+				 struct device_node *of_node,
+				 struct snd_soc_dai_link *dai_link)
+{
+	struct of_phandle_args args;
+	struct snd_soc_dai_link_component *component;
+	char *name;
+	int index, num_codecs, ret;
+
+	/* Count the number of CODECs */
+	name = "sound-dai";
+	num_codecs = of_count_phandle_with_args(of_node, name,
+						"#sound-dai-cells");
+	if (num_codecs <= 0) {
+		if (num_codecs == -ENOENT)
+			dev_err(dev, "No 'sound-dai' property\n");
+		else
+			dev_err(dev, "Bad phandle in 'sound-dai'\n");
+		return num_codecs;
+	}
+	component = devm_kcalloc(dev,
+				 num_codecs, sizeof(*component),
+				 GFP_KERNEL);
+	if (!component)
+		return -ENOMEM;
+	dai_link->cpus = component;
+	dai_link->num_cpus = num_codecs;
+
+	/* Parse the list */
+	for_each_link_cpus(dai_link, index, component) {
+		ret = of_parse_phandle_with_args(of_node, name,
+						 "#sound-dai-cells",
+						 index, &args);
+		if (ret)
+			goto err;
+		component->of_node = args.np;
+		ret = snd_soc_get_dai_name(&args, &component->dai_name);
+		if (ret < 0)
+			goto err;
+	}
+	return 0;
+err:
+	snd_soc_of_put_dai_link_codecs(dai_link);
+	dai_link->cpus = NULL;
+	dai_link->num_cpus = 0;
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_soc_of_get_dai_link_cpus);
+
 static int __init snd_soc_init(void)
 {
 	snd_soc_debugfs_init();
-- 
2.33.0

