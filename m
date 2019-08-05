Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7663082260
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2019 18:30:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09F9B16C7;
	Mon,  5 Aug 2019 18:29:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09F9B16C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565022622;
	bh=RHhHMvp6a8gNbRwmk79SBHHc4s52XMGRNkT3i/HB5Bg=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ZIPLMrd+1raEIshhY/RgILVa0T4biIaVrU0vWYbYz2IUxLZwNKYdHi2vm3xSCXTGR
	 pn4eptdDo5gwiNFSTpE3KgpYIgM8XB3XTB50QHczZDiPOYIDVads5DZao+o+pldc8b
	 hGkT/v1QsMHl2LiGVlNgI10Iiiy3HgPVQ5PCdk+w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF299F80C20;
	Mon,  5 Aug 2019 18:10:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65732F8067B; Mon,  5 Aug 2019 18:10:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6FC67F80610
 for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2019 18:10:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FC67F80610
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="RC6S4lP7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=6FD4Rg9gE5RcazVNmV0ewd1l0f5o1mAn9uZzCqcBrfk=; b=RC6S4lP7fP1f
 eX/baIouGvCUnIVzyNN6spkiiM+XdbjWppl9IIMMLMNTVJ50rr8FkTYMqg/d5QVImlFM4HNcuQttS
 HtBQKwNQZOdb8nDVLThBIrAkFEWN3dz/peaLzNjl6VyXrUOA4RhKyLeacg+NVQFZEbPjMCxiqE+Sh
 6Bjw4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hufYg-0000mJ-Ei; Mon, 05 Aug 2019 16:10:02 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id B2F332742D06; Mon,  5 Aug 2019 17:10:01 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87imrp5roa.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190805161001.B2F332742D06@ypsilon.sirena.org.uk>
Date: Mon,  5 Aug 2019 17:10:01 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: add soc-component.c" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: add soc-component.c

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 4ff1fef10f353b928bcc9d56d31fda53f2c43191 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 26 Jul 2019 13:49:48 +0900
Subject: [PATCH] ASoC: add soc-component.c

ALSA SoC has many snd_soc_component_xxx(), but these are randomly
located in many files. Because of it, code is difficult to read.
This patch creates new soc-component.c, and moves existing
snd_soc_component_xxx() into it.
But not yet fully. We need more cleanup it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87imrp5roa.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-component.h | 328 ++++++++++++++++++++++++++++++++++
 include/sound/soc.h           | 306 +------------------------------
 sound/soc/Makefile            |   2 +-
 sound/soc/soc-component.c     | 269 ++++++++++++++++++++++++++++
 sound/soc/soc-core.c          |  44 -----
 sound/soc/soc-jack.c          |  18 --
 sound/soc/soc-utils.c         | 199 ---------------------
 7 files changed, 599 insertions(+), 567 deletions(-)
 create mode 100644 include/sound/soc-component.h
 create mode 100644 sound/soc/soc-component.c

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
new file mode 100644
index 000000000000..a97d499e5d7a
--- /dev/null
+++ b/include/sound/soc-component.h
@@ -0,0 +1,328 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * soc-component.h
+ *
+ * Copyright (c) 2019 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+#ifndef __SOC_COMPONENT_H
+#define __SOC_COMPONENT_H
+
+#include <sound/soc.h>
+
+/*
+ * Component probe and remove ordering levels for components with runtime
+ * dependencies.
+ */
+#define SND_SOC_COMP_ORDER_FIRST	-2
+#define SND_SOC_COMP_ORDER_EARLY	-1
+#define SND_SOC_COMP_ORDER_NORMAL	 0
+#define SND_SOC_COMP_ORDER_LATE		 1
+#define SND_SOC_COMP_ORDER_LAST		 2
+
+#define for_each_comp_order(order)		\
+	for (order  = SND_SOC_COMP_ORDER_FIRST;	\
+	     order <= SND_SOC_COMP_ORDER_LAST;	\
+	     order++)
+
+/* component interface */
+struct snd_soc_component_driver {
+	const char *name;
+
+	/* Default control and setup, added after probe() is run */
+	const struct snd_kcontrol_new *controls;
+	unsigned int num_controls;
+	const struct snd_soc_dapm_widget *dapm_widgets;
+	unsigned int num_dapm_widgets;
+	const struct snd_soc_dapm_route *dapm_routes;
+	unsigned int num_dapm_routes;
+
+	int (*probe)(struct snd_soc_component *component);
+	void (*remove)(struct snd_soc_component *component);
+	int (*suspend)(struct snd_soc_component *component);
+	int (*resume)(struct snd_soc_component *component);
+
+	unsigned int (*read)(struct snd_soc_component *component,
+			     unsigned int reg);
+	int (*write)(struct snd_soc_component *component,
+		     unsigned int reg, unsigned int val);
+
+	/* pcm creation and destruction */
+	int (*pcm_new)(struct snd_soc_pcm_runtime *rtd);
+	void (*pcm_free)(struct snd_pcm *pcm);
+
+	/* component wide operations */
+	int (*set_sysclk)(struct snd_soc_component *component,
+			  int clk_id, int source, unsigned int freq, int dir);
+	int (*set_pll)(struct snd_soc_component *component, int pll_id,
+		       int source, unsigned int freq_in, unsigned int freq_out);
+	int (*set_jack)(struct snd_soc_component *component,
+			struct snd_soc_jack *jack,  void *data);
+
+	/* DT */
+	int (*of_xlate_dai_name)(struct snd_soc_component *component,
+				 struct of_phandle_args *args,
+				 const char **dai_name);
+	int (*of_xlate_dai_id)(struct snd_soc_component *comment,
+			       struct device_node *endpoint);
+	void (*seq_notifier)(struct snd_soc_component *component,
+			     enum snd_soc_dapm_type type, int subseq);
+	int (*stream_event)(struct snd_soc_component *component, int event);
+	int (*set_bias_level)(struct snd_soc_component *component,
+			      enum snd_soc_bias_level level);
+
+	const struct snd_pcm_ops *ops;
+	const struct snd_compr_ops *compr_ops;
+
+	/* probe ordering - for components with runtime dependencies */
+	int probe_order;
+	int remove_order;
+
+	/*
+	 * signal if the module handling the component should not be removed
+	 * if a pcm is open. Setting this would prevent the module
+	 * refcount being incremented in probe() but allow it be incremented
+	 * when a pcm is opened and decremented when it is closed.
+	 */
+	unsigned int module_get_upon_open:1;
+
+	/* bits */
+	unsigned int idle_bias_on:1;
+	unsigned int suspend_bias_off:1;
+	unsigned int use_pmdown_time:1; /* care pmdown_time at stop */
+	unsigned int endianness:1;
+	unsigned int non_legacy_dai_naming:1;
+
+	/* this component uses topology and ignore machine driver FEs */
+	const char *ignore_machine;
+	const char *topology_name_prefix;
+	int (*be_hw_params_fixup)(struct snd_soc_pcm_runtime *rtd,
+				  struct snd_pcm_hw_params *params);
+	bool use_dai_pcm_id;	/* use DAI link PCM ID as PCM device number */
+	int be_pcm_base;	/* base device ID for all BE PCMs */
+};
+
+struct snd_soc_component {
+	const char *name;
+	int id;
+	const char *name_prefix;
+	struct device *dev;
+	struct snd_soc_card *card;
+
+	unsigned int active;
+
+	unsigned int suspended:1; /* is in suspend PM state */
+
+	struct list_head list;
+	struct list_head card_aux_list; /* for auxiliary bound components */
+	struct list_head card_list;
+
+	const struct snd_soc_component_driver *driver;
+
+	struct list_head dai_list;
+	int num_dai;
+
+	struct regmap *regmap;
+	int val_bytes;
+
+	struct mutex io_mutex;
+
+	/* attached dynamic objects */
+	struct list_head dobj_list;
+
+	/*
+	 * DO NOT use any of the fields below in drivers, they are temporary and
+	 * are going to be removed again soon. If you use them in driver code
+	 * the driver will be marked as BROKEN when these fields are removed.
+	 */
+
+	/* Don't use these, use snd_soc_component_get_dapm() */
+	struct snd_soc_dapm_context dapm;
+
+	/* machine specific init */
+	int (*init)(struct snd_soc_component *component);
+
+#ifdef CONFIG_DEBUG_FS
+	struct dentry *debugfs_root;
+	const char *debugfs_prefix;
+#endif
+};
+
+#define for_each_component_dais(component, dai)\
+	list_for_each_entry(dai, &(component)->dai_list, list)
+#define for_each_component_dais_safe(component, dai, _dai)\
+	list_for_each_entry_safe(dai, _dai, &(component)->dai_list, list)
+
+/**
+ * snd_soc_dapm_to_component() - Casts a DAPM context to the component it is
+ *  embedded in
+ * @dapm: The DAPM context to cast to the component
+ *
+ * This function must only be used on DAPM contexts that are known to be part of
+ * a component (e.g. in a component driver). Otherwise the behavior is
+ * undefined.
+ */
+static inline struct snd_soc_component *snd_soc_dapm_to_component(
+	struct snd_soc_dapm_context *dapm)
+{
+	return container_of(dapm, struct snd_soc_component, dapm);
+}
+
+/**
+ * snd_soc_component_get_dapm() - Returns the DAPM context associated with a
+ *  component
+ * @component: The component for which to get the DAPM context
+ */
+static inline struct snd_soc_dapm_context *snd_soc_component_get_dapm(
+	struct snd_soc_component *component)
+{
+	return &component->dapm;
+}
+
+/**
+ * snd_soc_component_init_bias_level() - Initialize COMPONENT DAPM bias level
+ * @component: The COMPONENT for which to initialize the DAPM bias level
+ * @level: The DAPM level to initialize to
+ *
+ * Initializes the COMPONENT DAPM bias level. See snd_soc_dapm_init_bias_level()
+ */
+static inline void
+snd_soc_component_init_bias_level(struct snd_soc_component *component,
+				  enum snd_soc_bias_level level)
+{
+	snd_soc_dapm_init_bias_level(
+		snd_soc_component_get_dapm(component), level);
+}
+
+/**
+ * snd_soc_component_get_bias_level() - Get current COMPONENT DAPM bias level
+ * @component: The COMPONENT for which to get the DAPM bias level
+ *
+ * Returns: The current DAPM bias level of the COMPONENT.
+ */
+static inline enum snd_soc_bias_level
+snd_soc_component_get_bias_level(struct snd_soc_component *component)
+{
+	return snd_soc_dapm_get_bias_level(
+		snd_soc_component_get_dapm(component));
+}
+
+/**
+ * snd_soc_component_force_bias_level() - Set the COMPONENT DAPM bias level
+ * @component: The COMPONENT for which to set the level
+ * @level: The level to set to
+ *
+ * Forces the COMPONENT bias level to a specific state. See
+ * snd_soc_dapm_force_bias_level().
+ */
+static inline int
+snd_soc_component_force_bias_level(struct snd_soc_component *component,
+				   enum snd_soc_bias_level level)
+{
+	return snd_soc_dapm_force_bias_level(
+		snd_soc_component_get_dapm(component),
+		level);
+}
+
+/**
+ * snd_soc_dapm_kcontrol_component() - Returns the component associated to a
+ * kcontrol
+ * @kcontrol: The kcontrol
+ *
+ * This function must only be used on DAPM contexts that are known to be part of
+ * a COMPONENT (e.g. in a COMPONENT driver). Otherwise the behavior is undefined
+ */
+static inline struct snd_soc_component *snd_soc_dapm_kcontrol_component(
+	struct snd_kcontrol *kcontrol)
+{
+	return snd_soc_dapm_to_component(snd_soc_dapm_kcontrol_dapm(kcontrol));
+}
+
+/**
+ * snd_soc_component_cache_sync() - Sync the register cache with the hardware
+ * @component: COMPONENT to sync
+ *
+ * Note: This function will call regcache_sync()
+ */
+static inline int snd_soc_component_cache_sync(
+	struct snd_soc_component *component)
+{
+	return regcache_sync(component->regmap);
+}
+
+/* component IO */
+int snd_soc_component_read(struct snd_soc_component *component,
+			   unsigned int reg, unsigned int *val);
+unsigned int snd_soc_component_read32(struct snd_soc_component *component,
+				      unsigned int reg);
+int snd_soc_component_write(struct snd_soc_component *component,
+			    unsigned int reg, unsigned int val);
+int snd_soc_component_update_bits(struct snd_soc_component *component,
+				  unsigned int reg, unsigned int mask,
+				  unsigned int val);
+int snd_soc_component_update_bits_async(struct snd_soc_component *component,
+					unsigned int reg, unsigned int mask,
+					unsigned int val);
+void snd_soc_component_async_complete(struct snd_soc_component *component);
+int snd_soc_component_test_bits(struct snd_soc_component *component,
+				unsigned int reg, unsigned int mask,
+				unsigned int value);
+
+/* component wide operations */
+int snd_soc_component_set_sysclk(struct snd_soc_component *component,
+				 int clk_id, int source,
+				 unsigned int freq, int dir);
+int snd_soc_component_set_pll(struct snd_soc_component *component, int pll_id,
+			      int source, unsigned int freq_in,
+			      unsigned int freq_out);
+int snd_soc_component_set_jack(struct snd_soc_component *component,
+			       struct snd_soc_jack *jack, void *data);
+
+#ifdef CONFIG_REGMAP
+void snd_soc_component_init_regmap(struct snd_soc_component *component,
+				   struct regmap *regmap);
+void snd_soc_component_exit_regmap(struct snd_soc_component *component);
+#endif
+
+static inline void snd_soc_component_set_drvdata(struct snd_soc_component *c,
+						 void *data)
+{
+	dev_set_drvdata(c->dev, data);
+}
+
+static inline void *snd_soc_component_get_drvdata(struct snd_soc_component *c)
+{
+	return dev_get_drvdata(c->dev);
+}
+
+static inline bool snd_soc_component_is_active(
+	struct snd_soc_component *component)
+{
+	return component->active != 0;
+}
+
+/* component pin */
+int snd_soc_component_enable_pin(struct snd_soc_component *component,
+				 const char *pin);
+int snd_soc_component_enable_pin_unlocked(struct snd_soc_component *component,
+					  const char *pin);
+int snd_soc_component_disable_pin(struct snd_soc_component *component,
+				  const char *pin);
+int snd_soc_component_disable_pin_unlocked(struct snd_soc_component *component,
+					   const char *pin);
+int snd_soc_component_nc_pin(struct snd_soc_component *component,
+			     const char *pin);
+int snd_soc_component_nc_pin_unlocked(struct snd_soc_component *component,
+				      const char *pin);
+int snd_soc_component_get_pin_status(struct snd_soc_component *component,
+				     const char *pin);
+int snd_soc_component_force_enable_pin(struct snd_soc_component *component,
+				       const char *pin);
+int snd_soc_component_force_enable_pin_unlocked(
+	struct snd_soc_component *component,
+	const char *pin);
+
+#endif /* __SOC_COMPONENT_H */
diff --git a/include/sound/soc.h b/include/sound/soc.h
index f0797792dd8d..6ac6481b4882 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -362,21 +362,6 @@
 #define SOC_ENUM_SINGLE_VIRT_DECL(name, xtexts) \
 	const struct soc_enum name = SOC_ENUM_SINGLE_VIRT(ARRAY_SIZE(xtexts), xtexts)
 
-/*
- * Component probe and remove ordering levels for components with runtime
- * dependencies.
- */
-#define SND_SOC_COMP_ORDER_FIRST		-2
-#define SND_SOC_COMP_ORDER_EARLY		-1
-#define SND_SOC_COMP_ORDER_NORMAL		0
-#define SND_SOC_COMP_ORDER_LATE		1
-#define SND_SOC_COMP_ORDER_LAST		2
-
-#define for_each_comp_order(order)		\
-	for (order  = SND_SOC_COMP_ORDER_FIRST;	\
-	     order <= SND_SOC_COMP_ORDER_LAST;	\
-	     order++)
-
 /*
  * Bias levels
  *
@@ -747,132 +732,6 @@ struct snd_soc_compr_ops {
 	int (*trigger)(struct snd_compr_stream *);
 };
 
-/* component interface */
-struct snd_soc_component_driver {
-	const char *name;
-
-	/* Default control and setup, added after probe() is run */
-	const struct snd_kcontrol_new *controls;
-	unsigned int num_controls;
-	const struct snd_soc_dapm_widget *dapm_widgets;
-	unsigned int num_dapm_widgets;
-	const struct snd_soc_dapm_route *dapm_routes;
-	unsigned int num_dapm_routes;
-
-	int (*probe)(struct snd_soc_component *);
-	void (*remove)(struct snd_soc_component *);
-	int (*suspend)(struct snd_soc_component *);
-	int (*resume)(struct snd_soc_component *);
-
-	unsigned int (*read)(struct snd_soc_component *, unsigned int);
-	int (*write)(struct snd_soc_component *, unsigned int, unsigned int);
-
-	/* pcm creation and destruction */
-	int (*pcm_new)(struct snd_soc_pcm_runtime *);
-	void (*pcm_free)(struct snd_pcm *);
-
-	/* component wide operations */
-	int (*set_sysclk)(struct snd_soc_component *component,
-			  int clk_id, int source, unsigned int freq, int dir);
-	int (*set_pll)(struct snd_soc_component *component, int pll_id,
-		       int source, unsigned int freq_in, unsigned int freq_out);
-	int (*set_jack)(struct snd_soc_component *component,
-			struct snd_soc_jack *jack,  void *data);
-
-	/* DT */
-	int (*of_xlate_dai_name)(struct snd_soc_component *component,
-				 struct of_phandle_args *args,
-				 const char **dai_name);
-	int (*of_xlate_dai_id)(struct snd_soc_component *comment,
-			       struct device_node *endpoint);
-	void (*seq_notifier)(struct snd_soc_component *, enum snd_soc_dapm_type,
-		int subseq);
-	int (*stream_event)(struct snd_soc_component *, int event);
-	int (*set_bias_level)(struct snd_soc_component *component,
-			      enum snd_soc_bias_level level);
-
-	const struct snd_pcm_ops *ops;
-	const struct snd_compr_ops *compr_ops;
-
-	/* probe ordering - for components with runtime dependencies */
-	int probe_order;
-	int remove_order;
-
-	/*
-	 * signal if the module handling the component should not be removed
-	 * if a pcm is open. Setting this would prevent the module
-	 * refcount being incremented in probe() but allow it be incremented
-	 * when a pcm is opened and decremented when it is closed.
-	 */
-	unsigned int module_get_upon_open:1;
-
-	/* bits */
-	unsigned int idle_bias_on:1;
-	unsigned int suspend_bias_off:1;
-	unsigned int use_pmdown_time:1; /* care pmdown_time at stop */
-	unsigned int endianness:1;
-	unsigned int non_legacy_dai_naming:1;
-
-	/* this component uses topology and ignore machine driver FEs */
-	const char *ignore_machine;
-	const char *topology_name_prefix;
-	int (*be_hw_params_fixup)(struct snd_soc_pcm_runtime *rtd,
-				  struct snd_pcm_hw_params *params);
-	bool use_dai_pcm_id;	/* use the DAI link PCM ID as PCM device number */
-	int be_pcm_base;	/* base device ID for all BE PCMs */
-};
-
-struct snd_soc_component {
-	const char *name;
-	int id;
-	const char *name_prefix;
-	struct device *dev;
-	struct snd_soc_card *card;
-
-	unsigned int active;
-
-	unsigned int suspended:1; /* is in suspend PM state */
-
-	struct list_head list;
-	struct list_head card_aux_list; /* for auxiliary bound components */
-	struct list_head card_list;
-
-	const struct snd_soc_component_driver *driver;
-
-	struct list_head dai_list;
-	int num_dai;
-
-	struct regmap *regmap;
-	int val_bytes;
-
-	struct mutex io_mutex;
-
-	/* attached dynamic objects */
-	struct list_head dobj_list;
-
-	/*
-	* DO NOT use any of the fields below in drivers, they are temporary and
-	* are going to be removed again soon. If you use them in driver code the
-	* driver will be marked as BROKEN when these fields are removed.
-	*/
-
-	/* Don't use these, use snd_soc_component_get_dapm() */
-	struct snd_soc_dapm_context dapm;
-
-	/* machine specific init */
-	int (*init)(struct snd_soc_component *component);
-
-#ifdef CONFIG_DEBUG_FS
-	struct dentry *debugfs_root;
-	const char *debugfs_prefix;
-#endif
-};
-
-#define for_each_component_dais(component, dai)\
-	list_for_each_entry(dai, &(component)->dai_list, list)
-#define for_each_component_dais_safe(component, dai, _dai)\
-	list_for_each_entry_safe(dai, _dai, &(component)->dai_list, list)
-
 struct snd_soc_rtdcom_list {
 	struct snd_soc_component *component;
 	struct list_head list; /* rtd::component_list */
@@ -1337,134 +1196,6 @@ struct soc_enum {
 	struct snd_soc_dobj dobj;
 };
 
-/**
- * snd_soc_dapm_to_component() - Casts a DAPM context to the component it is
- *  embedded in
- * @dapm: The DAPM context to cast to the component
- *
- * This function must only be used on DAPM contexts that are known to be part of
- * a component (e.g. in a component driver). Otherwise the behavior is
- * undefined.
- */
-static inline struct snd_soc_component *snd_soc_dapm_to_component(
-	struct snd_soc_dapm_context *dapm)
-{
-	return container_of(dapm, struct snd_soc_component, dapm);
-}
-
-/**
- * snd_soc_component_get_dapm() - Returns the DAPM context associated with a
- *  component
- * @component: The component for which to get the DAPM context
- */
-static inline struct snd_soc_dapm_context *snd_soc_component_get_dapm(
-	struct snd_soc_component *component)
-{
-	return &component->dapm;
-}
-
-/**
- * snd_soc_component_init_bias_level() - Initialize COMPONENT DAPM bias level
- * @component: The COMPONENT for which to initialize the DAPM bias level
- * @level: The DAPM level to initialize to
- *
- * Initializes the COMPONENT DAPM bias level. See snd_soc_dapm_init_bias_level().
- */
-static inline void
-snd_soc_component_init_bias_level(struct snd_soc_component *component,
-				  enum snd_soc_bias_level level)
-{
-	snd_soc_dapm_init_bias_level(
-		snd_soc_component_get_dapm(component), level);
-}
-
-/**
- * snd_soc_component_get_bias_level() - Get current COMPONENT DAPM bias level
- * @component: The COMPONENT for which to get the DAPM bias level
- *
- * Returns: The current DAPM bias level of the COMPONENT.
- */
-static inline enum snd_soc_bias_level
-snd_soc_component_get_bias_level(struct snd_soc_component *component)
-{
-	return snd_soc_dapm_get_bias_level(
-		snd_soc_component_get_dapm(component));
-}
-
-/**
- * snd_soc_component_force_bias_level() - Set the COMPONENT DAPM bias level
- * @component: The COMPONENT for which to set the level
- * @level: The level to set to
- *
- * Forces the COMPONENT bias level to a specific state. See
- * snd_soc_dapm_force_bias_level().
- */
-static inline int
-snd_soc_component_force_bias_level(struct snd_soc_component *component,
-				   enum snd_soc_bias_level level)
-{
-	return snd_soc_dapm_force_bias_level(
-		snd_soc_component_get_dapm(component),
-		level);
-}
-
-/**
- * snd_soc_dapm_kcontrol_component() - Returns the component associated to a kcontrol
- * @kcontrol: The kcontrol
- *
- * This function must only be used on DAPM contexts that are known to be part of
- * a COMPONENT (e.g. in a COMPONENT driver). Otherwise the behavior is undefined.
- */
-static inline struct snd_soc_component *snd_soc_dapm_kcontrol_component(
-	struct snd_kcontrol *kcontrol)
-{
-	return snd_soc_dapm_to_component(snd_soc_dapm_kcontrol_dapm(kcontrol));
-}
-
-/**
- * snd_soc_component_cache_sync() - Sync the register cache with the hardware
- * @component: COMPONENT to sync
- *
- * Note: This function will call regcache_sync()
- */
-static inline int snd_soc_component_cache_sync(
-	struct snd_soc_component *component)
-{
-	return regcache_sync(component->regmap);
-}
-
-/* component IO */
-int snd_soc_component_read(struct snd_soc_component *component,
-	unsigned int reg, unsigned int *val);
-unsigned int snd_soc_component_read32(struct snd_soc_component *component,
-				      unsigned int reg);
-int snd_soc_component_write(struct snd_soc_component *component,
-	unsigned int reg, unsigned int val);
-int snd_soc_component_update_bits(struct snd_soc_component *component,
-	unsigned int reg, unsigned int mask, unsigned int val);
-int snd_soc_component_update_bits_async(struct snd_soc_component *component,
-	unsigned int reg, unsigned int mask, unsigned int val);
-void snd_soc_component_async_complete(struct snd_soc_component *component);
-int snd_soc_component_test_bits(struct snd_soc_component *component,
-	unsigned int reg, unsigned int mask, unsigned int value);
-
-/* component wide operations */
-int snd_soc_component_set_sysclk(struct snd_soc_component *component,
-			int clk_id, int source, unsigned int freq, int dir);
-int snd_soc_component_set_pll(struct snd_soc_component *component, int pll_id,
-			      int source, unsigned int freq_in,
-			      unsigned int freq_out);
-int snd_soc_component_set_jack(struct snd_soc_component *component,
-			       struct snd_soc_jack *jack, void *data);
-
-#ifdef CONFIG_REGMAP
-
-void snd_soc_component_init_regmap(struct snd_soc_component *component,
-	struct regmap *regmap);
-void snd_soc_component_exit_regmap(struct snd_soc_component *component);
-
-#endif
-
 /* device driver data */
 
 static inline void snd_soc_card_set_drvdata(struct snd_soc_card *card,
@@ -1478,17 +1209,6 @@ static inline void *snd_soc_card_get_drvdata(struct snd_soc_card *card)
 	return card->drvdata;
 }
 
-static inline void snd_soc_component_set_drvdata(struct snd_soc_component *c,
-		void *data)
-{
-	dev_set_drvdata(c->dev, data);
-}
-
-static inline void *snd_soc_component_get_drvdata(struct snd_soc_component *c)
-{
-	return dev_get_drvdata(c->dev);
-}
-
 static inline void snd_soc_initialize_card_lists(struct snd_soc_card *card)
 {
 	INIT_LIST_HEAD(&card->widgets);
@@ -1535,12 +1255,6 @@ static inline unsigned int snd_soc_enum_item_to_val(struct soc_enum *e,
 	return e->values[item];
 }
 
-static inline bool snd_soc_component_is_active(
-	struct snd_soc_component *component)
-{
-	return component->active != 0;
-}
-
 /**
  * snd_soc_kcontrol_component() - Returns the component that registered the
  *  control
@@ -1676,24 +1390,6 @@ static inline void snd_soc_dapm_mutex_unlock(struct snd_soc_dapm_context *dapm)
 	mutex_unlock(&dapm->card->dapm_mutex);
 }
 
-int snd_soc_component_enable_pin(struct snd_soc_component *component,
-				 const char *pin);
-int snd_soc_component_enable_pin_unlocked(struct snd_soc_component *component,
-					  const char *pin);
-int snd_soc_component_disable_pin(struct snd_soc_component *component,
-				  const char *pin);
-int snd_soc_component_disable_pin_unlocked(struct snd_soc_component *component,
-					   const char *pin);
-int snd_soc_component_nc_pin(struct snd_soc_component *component,
-			     const char *pin);
-int snd_soc_component_nc_pin_unlocked(struct snd_soc_component *component,
-				      const char *pin);
-int snd_soc_component_get_pin_status(struct snd_soc_component *component,
-				     const char *pin);
-int snd_soc_component_force_enable_pin(struct snd_soc_component *component,
-				       const char *pin);
-int snd_soc_component_force_enable_pin_unlocked(
-					struct snd_soc_component *component,
-					const char *pin);
+#include <sound/soc-component.h>
 
 #endif
diff --git a/sound/soc/Makefile b/sound/soc/Makefile
index 919c3c027c62..250a0dea9294 100644
--- a/sound/soc/Makefile
+++ b/sound/soc/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-snd-soc-core-objs := soc-core.o soc-dapm.o soc-jack.o soc-utils.o soc-dai.o
+snd-soc-core-objs := soc-core.o soc-dapm.o soc-jack.o soc-utils.o soc-dai.o soc-component.o
 snd-soc-core-objs += soc-pcm.o soc-io.o soc-devres.o soc-ops.o
 snd-soc-core-$(CONFIG_SND_SOC_COMPRESS) += soc-compress.o
 
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
new file mode 100644
index 000000000000..e19f78bfb919
--- /dev/null
+++ b/sound/soc/soc-component.c
@@ -0,0 +1,269 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// soc-component.c
+//
+// Copyright (C) 2019 Renesas Electronics Corp.
+// Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
+//
+#include <sound/soc.h>
+
+/**
+ * snd_soc_component_set_sysclk - configure COMPONENT system or master clock.
+ * @component: COMPONENT
+ * @clk_id: DAI specific clock ID
+ * @source: Source for the clock
+ * @freq: new clock frequency in Hz
+ * @dir: new clock direction - input/output.
+ *
+ * Configures the CODEC master (MCLK) or system (SYSCLK) clocking.
+ */
+int snd_soc_component_set_sysclk(struct snd_soc_component *component,
+				 int clk_id, int source, unsigned int freq,
+				 int dir)
+{
+	if (component->driver->set_sysclk)
+		return component->driver->set_sysclk(component, clk_id, source,
+						     freq, dir);
+
+	return -ENOTSUPP;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_set_sysclk);
+
+/*
+ * snd_soc_component_set_pll - configure component PLL.
+ * @component: COMPONENT
+ * @pll_id: DAI specific PLL ID
+ * @source: DAI specific source for the PLL
+ * @freq_in: PLL input clock frequency in Hz
+ * @freq_out: requested PLL output clock frequency in Hz
+ *
+ * Configures and enables PLL to generate output clock based on input clock.
+ */
+int snd_soc_component_set_pll(struct snd_soc_component *component, int pll_id,
+			      int source, unsigned int freq_in,
+			      unsigned int freq_out)
+{
+	if (component->driver->set_pll)
+		return component->driver->set_pll(component, pll_id, source,
+						  freq_in, freq_out);
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_set_pll);
+
+int snd_soc_component_enable_pin(struct snd_soc_component *component,
+				 const char *pin)
+{
+	struct snd_soc_dapm_context *dapm =
+		snd_soc_component_get_dapm(component);
+	char *full_name;
+	int ret;
+
+	if (!component->name_prefix)
+		return snd_soc_dapm_enable_pin(dapm, pin);
+
+	full_name = kasprintf(GFP_KERNEL, "%s %s", component->name_prefix, pin);
+	if (!full_name)
+		return -ENOMEM;
+
+	ret = snd_soc_dapm_enable_pin(dapm, full_name);
+	kfree(full_name);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_enable_pin);
+
+int snd_soc_component_enable_pin_unlocked(struct snd_soc_component *component,
+					  const char *pin)
+{
+	struct snd_soc_dapm_context *dapm =
+		snd_soc_component_get_dapm(component);
+	char *full_name;
+	int ret;
+
+	if (!component->name_prefix)
+		return snd_soc_dapm_enable_pin_unlocked(dapm, pin);
+
+	full_name = kasprintf(GFP_KERNEL, "%s %s", component->name_prefix, pin);
+	if (!full_name)
+		return -ENOMEM;
+
+	ret = snd_soc_dapm_enable_pin_unlocked(dapm, full_name);
+	kfree(full_name);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_enable_pin_unlocked);
+
+int snd_soc_component_disable_pin(struct snd_soc_component *component,
+				  const char *pin)
+{
+	struct snd_soc_dapm_context *dapm =
+		snd_soc_component_get_dapm(component);
+	char *full_name;
+	int ret;
+
+	if (!component->name_prefix)
+		return snd_soc_dapm_disable_pin(dapm, pin);
+
+	full_name = kasprintf(GFP_KERNEL, "%s %s", component->name_prefix, pin);
+	if (!full_name)
+		return -ENOMEM;
+
+	ret = snd_soc_dapm_disable_pin(dapm, full_name);
+	kfree(full_name);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_disable_pin);
+
+int snd_soc_component_disable_pin_unlocked(struct snd_soc_component *component,
+					   const char *pin)
+{
+	struct snd_soc_dapm_context *dapm =
+		snd_soc_component_get_dapm(component);
+	char *full_name;
+	int ret;
+
+	if (!component->name_prefix)
+		return snd_soc_dapm_disable_pin_unlocked(dapm, pin);
+
+	full_name = kasprintf(GFP_KERNEL, "%s %s", component->name_prefix, pin);
+	if (!full_name)
+		return -ENOMEM;
+
+	ret = snd_soc_dapm_disable_pin_unlocked(dapm, full_name);
+	kfree(full_name);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_disable_pin_unlocked);
+
+int snd_soc_component_nc_pin(struct snd_soc_component *component,
+			     const char *pin)
+{
+	struct snd_soc_dapm_context *dapm =
+		snd_soc_component_get_dapm(component);
+	char *full_name;
+	int ret;
+
+	if (!component->name_prefix)
+		return snd_soc_dapm_nc_pin(dapm, pin);
+
+	full_name = kasprintf(GFP_KERNEL, "%s %s", component->name_prefix, pin);
+	if (!full_name)
+		return -ENOMEM;
+
+	ret = snd_soc_dapm_nc_pin(dapm, full_name);
+	kfree(full_name);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_nc_pin);
+
+int snd_soc_component_nc_pin_unlocked(struct snd_soc_component *component,
+				      const char *pin)
+{
+	struct snd_soc_dapm_context *dapm =
+		snd_soc_component_get_dapm(component);
+	char *full_name;
+	int ret;
+
+	if (!component->name_prefix)
+		return snd_soc_dapm_nc_pin_unlocked(dapm, pin);
+
+	full_name = kasprintf(GFP_KERNEL, "%s %s", component->name_prefix, pin);
+	if (!full_name)
+		return -ENOMEM;
+
+	ret = snd_soc_dapm_nc_pin_unlocked(dapm, full_name);
+	kfree(full_name);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_nc_pin_unlocked);
+
+int snd_soc_component_get_pin_status(struct snd_soc_component *component,
+				     const char *pin)
+{
+	struct snd_soc_dapm_context *dapm =
+		snd_soc_component_get_dapm(component);
+	char *full_name;
+	int ret;
+
+	if (!component->name_prefix)
+		return snd_soc_dapm_get_pin_status(dapm, pin);
+
+	full_name = kasprintf(GFP_KERNEL, "%s %s", component->name_prefix, pin);
+	if (!full_name)
+		return -ENOMEM;
+
+	ret = snd_soc_dapm_get_pin_status(dapm, full_name);
+	kfree(full_name);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_get_pin_status);
+
+int snd_soc_component_force_enable_pin(struct snd_soc_component *component,
+				       const char *pin)
+{
+	struct snd_soc_dapm_context *dapm =
+		snd_soc_component_get_dapm(component);
+	char *full_name;
+	int ret;
+
+	if (!component->name_prefix)
+		return snd_soc_dapm_force_enable_pin(dapm, pin);
+
+	full_name = kasprintf(GFP_KERNEL, "%s %s", component->name_prefix, pin);
+	if (!full_name)
+		return -ENOMEM;
+
+	ret = snd_soc_dapm_force_enable_pin(dapm, full_name);
+	kfree(full_name);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_force_enable_pin);
+
+int snd_soc_component_force_enable_pin_unlocked(
+	struct snd_soc_component *component,
+	const char *pin)
+{
+	struct snd_soc_dapm_context *dapm =
+		snd_soc_component_get_dapm(component);
+	char *full_name;
+	int ret;
+
+	if (!component->name_prefix)
+		return snd_soc_dapm_force_enable_pin_unlocked(dapm, pin);
+
+	full_name = kasprintf(GFP_KERNEL, "%s %s", component->name_prefix, pin);
+	if (!full_name)
+		return -ENOMEM;
+
+	ret = snd_soc_dapm_force_enable_pin_unlocked(dapm, full_name);
+	kfree(full_name);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_force_enable_pin_unlocked);
+
+/**
+ * snd_soc_component_set_jack - configure component jack.
+ * @component: COMPONENTs
+ * @jack: structure to use for the jack
+ * @data: can be used if codec driver need extra data for configuring jack
+ *
+ * Configures and enables jack detection function.
+ */
+int snd_soc_component_set_jack(struct snd_soc_component *component,
+			       struct snd_soc_jack *jack, void *data)
+{
+	if (component->driver->set_jack)
+		return component->driver->set_jack(component, jack, data);
+
+	return -ENOTSUPP;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_set_jack);
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index ed66d2c68d10..dc3e45547da2 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2345,50 +2345,6 @@ int snd_soc_add_dai_controls(struct snd_soc_dai *dai,
 }
 EXPORT_SYMBOL_GPL(snd_soc_add_dai_controls);
 
-/**
- * snd_soc_component_set_sysclk - configure COMPONENT system or master clock.
- * @component: COMPONENT
- * @clk_id: DAI specific clock ID
- * @source: Source for the clock
- * @freq: new clock frequency in Hz
- * @dir: new clock direction - input/output.
- *
- * Configures the CODEC master (MCLK) or system (SYSCLK) clocking.
- */
-int snd_soc_component_set_sysclk(struct snd_soc_component *component,
-				 int clk_id, int source, unsigned int freq,
-				 int dir)
-{
-	if (component->driver->set_sysclk)
-		return component->driver->set_sysclk(component, clk_id, source,
-						 freq, dir);
-
-	return -ENOTSUPP;
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_set_sysclk);
-
-/*
- * snd_soc_component_set_pll - configure component PLL.
- * @component: COMPONENT
- * @pll_id: DAI specific PLL ID
- * @source: DAI specific source for the PLL
- * @freq_in: PLL input clock frequency in Hz
- * @freq_out: requested PLL output clock frequency in Hz
- *
- * Configures and enables PLL to generate output clock based on input clock.
- */
-int snd_soc_component_set_pll(struct snd_soc_component *component, int pll_id,
-			      int source, unsigned int freq_in,
-			      unsigned int freq_out)
-{
-	if (component->driver->set_pll)
-		return component->driver->set_pll(component, pll_id, source,
-						  freq_in, freq_out);
-
-	return -EINVAL;
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_set_pll);
-
 static int snd_soc_bind_card(struct snd_soc_card *card)
 {
 	struct snd_soc_pcm_runtime *rtd;
diff --git a/sound/soc/soc-jack.c b/sound/soc/soc-jack.c
index c7b990abdbaa..a71d2340eb05 100644
--- a/sound/soc/soc-jack.c
+++ b/sound/soc/soc-jack.c
@@ -23,24 +23,6 @@ struct jack_gpio_tbl {
 	struct snd_soc_jack_gpio *gpios;
 };
 
-/**
- * snd_soc_component_set_jack - configure component jack.
- * @component: COMPONENTs
- * @jack: structure to use for the jack
- * @data: can be used if codec driver need extra data for configuring jack
- *
- * Configures and enables jack detection function.
- */
-int snd_soc_component_set_jack(struct snd_soc_component *component,
-			       struct snd_soc_jack *jack, void *data)
-{
-	if (component->driver->set_jack)
-		return component->driver->set_jack(component, jack, data);
-
-	return -ENOTSUPP;
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_set_jack);
-
 /**
  * snd_soc_card_jack_new - Create a new jack
  * @card:  ASoC card
diff --git a/sound/soc/soc-utils.c b/sound/soc/soc-utils.c
index e3b9dd634c6d..54dcece52b0c 100644
--- a/sound/soc/soc-utils.c
+++ b/sound/soc/soc-utils.c
@@ -52,205 +52,6 @@ int snd_soc_params_to_bclk(struct snd_pcm_hw_params *params)
 }
 EXPORT_SYMBOL_GPL(snd_soc_params_to_bclk);
 
-int snd_soc_component_enable_pin(struct snd_soc_component *component,
-				 const char *pin)
-{
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
-	char *full_name;
-	int ret;
-
-	if (!component->name_prefix)
-		return snd_soc_dapm_enable_pin(dapm, pin);
-
-	full_name = kasprintf(GFP_KERNEL, "%s %s", component->name_prefix, pin);
-	if (!full_name)
-		return -ENOMEM;
-
-	ret = snd_soc_dapm_enable_pin(dapm, full_name);
-	kfree(full_name);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_enable_pin);
-
-int snd_soc_component_enable_pin_unlocked(struct snd_soc_component *component,
-					  const char *pin)
-{
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
-	char *full_name;
-	int ret;
-
-	if (!component->name_prefix)
-		return snd_soc_dapm_enable_pin_unlocked(dapm, pin);
-
-	full_name = kasprintf(GFP_KERNEL, "%s %s", component->name_prefix, pin);
-	if (!full_name)
-		return -ENOMEM;
-
-	ret = snd_soc_dapm_enable_pin_unlocked(dapm, full_name);
-	kfree(full_name);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_enable_pin_unlocked);
-
-int snd_soc_component_disable_pin(struct snd_soc_component *component,
-				  const char *pin)
-{
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
-	char *full_name;
-	int ret;
-
-	if (!component->name_prefix)
-		return snd_soc_dapm_disable_pin(dapm, pin);
-
-	full_name = kasprintf(GFP_KERNEL, "%s %s", component->name_prefix, pin);
-	if (!full_name)
-		return -ENOMEM;
-
-	ret = snd_soc_dapm_disable_pin(dapm, full_name);
-	kfree(full_name);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_disable_pin);
-
-int snd_soc_component_disable_pin_unlocked(struct snd_soc_component *component,
-					   const char *pin)
-{
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
-	char *full_name;
-	int ret;
-
-	if (!component->name_prefix)
-		return snd_soc_dapm_disable_pin_unlocked(dapm, pin);
-
-	full_name = kasprintf(GFP_KERNEL, "%s %s", component->name_prefix, pin);
-	if (!full_name)
-		return -ENOMEM;
-
-	ret = snd_soc_dapm_disable_pin_unlocked(dapm, full_name);
-	kfree(full_name);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_disable_pin_unlocked);
-
-int snd_soc_component_nc_pin(struct snd_soc_component *component,
-			     const char *pin)
-{
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
-	char *full_name;
-	int ret;
-
-	if (!component->name_prefix)
-		return snd_soc_dapm_nc_pin(dapm, pin);
-
-	full_name = kasprintf(GFP_KERNEL, "%s %s", component->name_prefix, pin);
-	if (!full_name)
-		return -ENOMEM;
-
-	ret = snd_soc_dapm_nc_pin(dapm, full_name);
-	kfree(full_name);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_nc_pin);
-
-int snd_soc_component_nc_pin_unlocked(struct snd_soc_component *component,
-				      const char *pin)
-{
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
-	char *full_name;
-	int ret;
-
-	if (!component->name_prefix)
-		return snd_soc_dapm_nc_pin_unlocked(dapm, pin);
-
-	full_name = kasprintf(GFP_KERNEL, "%s %s", component->name_prefix, pin);
-	if (!full_name)
-		return -ENOMEM;
-
-	ret = snd_soc_dapm_nc_pin_unlocked(dapm, full_name);
-	kfree(full_name);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_nc_pin_unlocked);
-
-int snd_soc_component_get_pin_status(struct snd_soc_component *component,
-				     const char *pin)
-{
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
-	char *full_name;
-	int ret;
-
-	if (!component->name_prefix)
-		return snd_soc_dapm_get_pin_status(dapm, pin);
-
-	full_name = kasprintf(GFP_KERNEL, "%s %s", component->name_prefix, pin);
-	if (!full_name)
-		return -ENOMEM;
-
-	ret = snd_soc_dapm_get_pin_status(dapm, full_name);
-	kfree(full_name);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_get_pin_status);
-
-int snd_soc_component_force_enable_pin(struct snd_soc_component *component,
-				       const char *pin)
-{
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
-	char *full_name;
-	int ret;
-
-	if (!component->name_prefix)
-		return snd_soc_dapm_force_enable_pin(dapm, pin);
-
-	full_name = kasprintf(GFP_KERNEL, "%s %s", component->name_prefix, pin);
-	if (!full_name)
-		return -ENOMEM;
-
-	ret = snd_soc_dapm_force_enable_pin(dapm, full_name);
-	kfree(full_name);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_force_enable_pin);
-
-int snd_soc_component_force_enable_pin_unlocked(
-					struct snd_soc_component *component,
-					const char *pin)
-{
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
-	char *full_name;
-	int ret;
-
-	if (!component->name_prefix)
-		return snd_soc_dapm_force_enable_pin_unlocked(dapm, pin);
-
-	full_name = kasprintf(GFP_KERNEL, "%s %s", component->name_prefix, pin);
-	if (!full_name)
-		return -ENOMEM;
-
-	ret = snd_soc_dapm_force_enable_pin_unlocked(dapm, full_name);
-	kfree(full_name);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_force_enable_pin_unlocked);
-
 static const struct snd_pcm_hardware dummy_dma_hardware = {
 	/* Random values to keep userspace happy when checking constraints */
 	.info			= SNDRV_PCM_INFO_INTERLEAVED |
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
