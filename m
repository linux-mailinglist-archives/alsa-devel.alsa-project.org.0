Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B621EBCD7
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jun 2020 15:15:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE4351685;
	Tue,  2 Jun 2020 15:14:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE4351685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591103749;
	bh=oo2IJU1fru3LygffV9oJzCKnV8pOUhCqcaRYO8068t8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=faTqFqfKRRVQ0UDFIYOBSrsft0ZEbbVUfczNgkxPdQ+HqPpIFgYXWwc+aUX6gDHHj
	 hexjAuAph/9uITX+DTMXxR5MuB6oMcSRLmiH4EsfrJMTDMN2pyQV1Ng/fRuEH4eZaZ
	 2OwqcRxFSjfIoS3iVmhviuAxPeQFVkfhkkbwAjKQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 934B7F802DB;
	Tue,  2 Jun 2020 15:10:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BDE0F8026F; Tue,  2 Jun 2020 07:22:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C62ACF800B8
 for <alsa-devel@alsa-project.org>; Tue,  2 Jun 2020 07:22:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C62ACF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RGaaFj0f"
Received: by mail-pl1-x643.google.com with SMTP id n2so858610pld.13
 for <alsa-devel@alsa-project.org>; Mon, 01 Jun 2020 22:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cdsTla5NmX/8P5iE6VvBk0hZd39sy9358Y1bN31hsbc=;
 b=RGaaFj0fzD7xatRLPSaerrxb8rb16z8awh9rlm6Wd6SUIQ4K3gQrCc65bVMeeiKhRO
 oakwF1sTZhKXTHp++xzRtoiEem7kxx7BtSkImKivL5ElEArCpp4n/IMinXnJyllGKlKH
 KxPdYX4WDF2zCRqFjrrRyH/98jyeE6j1DV3GP/Exfo4FGBL/kfAkqg6x87RCLv9smU1O
 YHQjrHtWT5xwyLAvYVeSTBJT5uKHLPC9jHPc7+8/9UQ/85TqiQK9inO0krRlpBagBc2T
 A9xp+3gQzDuty6iSi9jTQO4tWQBirWwkxfRyNvTAPyR4VatRsu3MNyjv3I+lbKvDfihE
 +uAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cdsTla5NmX/8P5iE6VvBk0hZd39sy9358Y1bN31hsbc=;
 b=m0ZSjCmcNxwm00f7/A+pgWwMvyhPWRxBDkMCNPmS+Foyh2R5WtVbGkQrz3jWzKcA9m
 zgc6jGnQpGRA3tTYU0Wmjd/9KK8Y4FuYRSyvXkwt9g39SEkuwAicgIS/273Et8RNZlE7
 zSmKoqqAR0fwC844A001iMbnMg6bxv4MnJQcAuKa98aFfNvsBHh5xxM7DanYLPY7BUWF
 xJ6GfegPoKiLKtxmXwD0yFeY79j8lKs/W02ESKzs7UUn4n4yJme6jkXaAD7jnlCCqyYA
 0pBnhwdNpKzbXeYzdqWD+++MdTT7dM1qsVqFPPuhIRNisQV/do3fCQuIt68m+2PYzi2z
 62vw==
X-Gm-Message-State: AOAM532/Nw+dXpZIJ34AvshCp4Iip0cZEi4gzhb/J9p1rMImDZj7Su8p
 PhPg77KnA8wtaflXajRYZ8CBulz22CRxrMj9
X-Google-Smtp-Source: ABdhPJwDE8d/ZRpzNecvDr7OlzeXWIYhuyu5j9uBxuT2r/WF7QSVxe+JeALsvaIRC4fTrhRDhra98A==
X-Received: by 2002:a17:90b:f0e:: with SMTP id
 br14mr3283764pjb.78.1591075351126; 
 Mon, 01 Jun 2020 22:22:31 -0700 (PDT)
Received: from cvds-vagarw7.iind.intel.com ([192.55.55.41])
 by smtp.googlemail.com with ESMTPSA id f18sm1004764pga.75.2020.06.01.22.22.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Jun 2020 22:22:29 -0700 (PDT)
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 Mark Greer <mgreer@animalcreek.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [RESEND PATCH v1 5/6] staging: greybus: audio: Add helper APIs for
 dynamic audio modules
Date: Tue,  2 Jun 2020 10:51:14 +0530
Message-Id: <c1339e4d57c8b39bd25197d4514fabd868b829b1.1591040859.git.vaibhav.sr@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591040859.git.vaibhav.sr@gmail.com>
References: <cover.1591040859.git.vaibhav.sr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 02 Jun 2020 15:10:44 +0200
Cc: devel@driverdev.osuosl.org, alsa-devel@alsa-project.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vaibhav Agarwal <vaibhav.sr@gmail.com>, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org
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

Greybus Codec driver allows modules to be dynamically added and removed,
which further requires updating the DAPM configurations as well.

With current snd_soc architecture, dynamic audio modules is not yet
supported. This patch provides helper APIs to update DAPM configurations
in response to modules which are dynamically added or removed. The
source is primarily based on snd_dapm.c

Signed-off-by: Vaibhav Agarwal <vaibhav.sr@gmail.com>
---
 drivers/staging/greybus/Makefile       |   2 +-
 drivers/staging/greybus/audio_codec.c  |  13 +-
 drivers/staging/greybus/audio_helper.c | 197 +++++++++++++++++++++++++
 drivers/staging/greybus/audio_helper.h |  17 +++
 4 files changed, 224 insertions(+), 5 deletions(-)
 create mode 100644 drivers/staging/greybus/audio_helper.c
 create mode 100644 drivers/staging/greybus/audio_helper.h

diff --git a/drivers/staging/greybus/Makefile b/drivers/staging/greybus/Makefile
index 627e44f2a983..3b4b6cabff19 100644
--- a/drivers/staging/greybus/Makefile
+++ b/drivers/staging/greybus/Makefile
@@ -28,7 +28,7 @@ obj-$(CONFIG_GREYBUS_VIBRATOR)	+= gb-vibrator.o
 
 # Greybus Audio is a bunch of modules
 gb-audio-module-y	:= audio_module.o audio_topology.o
-gb-audio-codec-y	:= audio_codec.o
+gb-audio-codec-y	:= audio_codec.o audio_helper.o
 gb-audio-gb-y		:= audio_gb.o
 gb-audio-apbridgea-y	:= audio_apbridgea.o
 gb-audio-manager-y	:= audio_manager.o audio_manager_module.o
diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index bbd072acda5c..866b3342515f 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -14,6 +14,7 @@
 #include "audio_codec.h"
 #include "audio_apbridgea.h"
 #include "audio_manager.h"
+#include "audio_helper.h"
 
 static struct gbaudio_codec_info *gbcodec;
 
@@ -874,7 +875,7 @@ int gbaudio_register_module(struct gbaudio_module_info *module)
 
 	/* card already instantiated, create widgets here only */
 	if (component->card->instantiated) {
-		snd_soc_dapm_link_component_dai_widgets(component->card,
+		gbaudio_dapm_link_component_dai_widgets(component->card,
 							&component->dapm);
 #ifdef CONFIG_SND_JACK
 		/*
@@ -1004,19 +1005,23 @@ void gbaudio_unregister_module(struct gbaudio_module_info *module)
 	if (module->dapm_routes) {
 		dev_dbg(component->dev, "Removing %d routes\n",
 			module->num_dapm_routes);
+		/* verify routes with controls are removed */
 		snd_soc_dapm_del_routes(&component->dapm, module->dapm_routes,
 					module->num_dapm_routes);
 	}
 	if (module->controls) {
 		dev_dbg(component->dev, "Removing %d controls\n",
 			module->num_controls);
-		snd_soc_remove_codec_controls(component, module->controls,
-					      module->num_controls);
+		/* release control semaphore */
+		up_write(&card->controls_rwsem);
+		gbaudio_remove_component_controls(component, module->controls,
+						  module->num_controls);
+		down_write(&card->controls_rwsem);
 	}
 	if (module->dapm_widgets) {
 		dev_dbg(component->dev, "Removing %d widgets\n",
 			module->num_dapm_widgets);
-		snd_soc_dapm_free_controls(&component->dapm,
+		gbaudio_dapm_free_controls(&component->dapm,
 					   module->dapm_widgets,
 					   module->num_dapm_widgets);
 	}
diff --git a/drivers/staging/greybus/audio_helper.c b/drivers/staging/greybus/audio_helper.c
new file mode 100644
index 000000000000..e2f113a811ee
--- /dev/null
+++ b/drivers/staging/greybus/audio_helper.c
@@ -0,0 +1,197 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Greybus Audio Sound SoC helper APIs
+ */
+
+#include <linux/debugfs.h>
+#include <sound/core.h>
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+
+#define gbaudio_dapm_for_each_direction(dir) \
+	for ((dir) = SND_SOC_DAPM_DIR_IN; (dir) <= SND_SOC_DAPM_DIR_OUT; \
+		(dir)++)
+
+static void gbaudio_dapm_link_dai_widget(struct snd_soc_dapm_widget *dai_w,
+					 struct snd_soc_card *card)
+{
+	struct snd_soc_dapm_widget *w;
+	struct snd_soc_dapm_widget *src, *sink;
+	struct snd_soc_dai *dai = dai_w->priv;
+
+	/* ...find all widgets with the same stream and link them */
+	list_for_each_entry(w, &card->widgets, list) {
+		if (w->dapm != dai_w->dapm)
+			continue;
+
+		switch (w->id) {
+		case snd_soc_dapm_dai_in:
+		case snd_soc_dapm_dai_out:
+			continue;
+		default:
+			break;
+		}
+
+		if (!w->sname || !strstr(w->sname, dai_w->sname))
+			continue;
+
+		/*
+		 * check if widget is already linked,
+		 * if (w->linked)
+		 *	return;
+		 */
+
+		if (dai_w->id == snd_soc_dapm_dai_in) {
+			src = dai_w;
+			sink = w;
+		} else {
+			src = w;
+			sink = dai_w;
+		}
+		dev_dbg(dai->dev, "%s -> %s\n", src->name, sink->name);
+		/* Add the DAPM path and set widget's linked status
+		 * snd_soc_dapm_add_path(w->dapm, src, sink, NULL, NULL);
+		 * w->linked = 1;
+		 */
+	}
+}
+
+int gbaudio_dapm_link_component_dai_widgets(struct snd_soc_card *card,
+					    struct snd_soc_dapm_context *dapm)
+{
+	struct snd_soc_dapm_widget *dai_w;
+
+	/* For each DAI widget... */
+	list_for_each_entry(dai_w, &card->widgets, list) {
+		if (dai_w->dapm != dapm)
+			continue;
+		switch (dai_w->id) {
+		case snd_soc_dapm_dai_in:
+		case snd_soc_dapm_dai_out:
+			break;
+		default:
+			continue;
+		}
+		gbaudio_dapm_link_dai_widget(dai_w, card);
+	}
+
+	return 0;
+}
+
+static void gbaudio_dapm_free_path(struct snd_soc_dapm_path *path)
+{
+	list_del(&path->list_node[SND_SOC_DAPM_DIR_IN]);
+	list_del(&path->list_node[SND_SOC_DAPM_DIR_OUT]);
+	list_del(&path->list_kcontrol);
+	list_del(&path->list);
+	kfree(path);
+}
+
+static void gbaudio_dapm_free_widget(struct snd_soc_dapm_widget *w)
+{
+	struct snd_soc_dapm_path *p, *next_p;
+	enum snd_soc_dapm_direction dir;
+
+	list_del(&w->list);
+	/*
+	 * remove source and sink paths associated to this widget.
+	 * While removing the path, remove reference to it from both
+	 * source and sink widgets so that path is removed only once.
+	 */
+	gbaudio_dapm_for_each_direction(dir) {
+		snd_soc_dapm_widget_for_each_path_safe(w, dir, p, next_p)
+			gbaudio_dapm_free_path(p);
+	}
+
+	kfree(w->kcontrols);
+	kfree_const(w->name);
+	kfree_const(w->sname);
+	kfree(w);
+}
+
+int gbaudio_dapm_free_controls(struct snd_soc_dapm_context *dapm,
+			       const struct snd_soc_dapm_widget *widget,
+			       int num)
+{
+	int i;
+	struct snd_soc_dapm_widget *w, *next_w;
+#ifdef CONFIG_DEBUG_FS
+	struct dentry *parent = dapm->debugfs_dapm;
+	struct dentry *debugfs_w = NULL;
+#endif
+
+	mutex_lock(&dapm->card->dapm_mutex);
+	for (i = 0; i < num; i++) {
+		/* below logic can be optimized to identify widget pointer */
+		list_for_each_entry_safe(w, next_w, &dapm->card->widgets,
+					 list) {
+			if (w->dapm != dapm)
+				continue;
+			if (!strcmp(w->name, widget->name))
+				break;
+			w = NULL;
+		}
+		if (!w) {
+			dev_err(dapm->dev, "%s: widget not found\n",
+				widget->name);
+			return -EINVAL;
+		}
+		widget++;
+#ifdef CONFIG_DEBUG_FS
+		if (!parent)
+			debugfs_w = debugfs_lookup(w->name, parent);
+		debugfs_remove(debugfs_w);
+		debugfs_w = NULL;
+#endif
+		gbaudio_dapm_free_widget(w);
+	}
+	mutex_unlock(&dapm->card->dapm_mutex);
+	return 0;
+}
+
+static int gbaudio_remove_controls(struct snd_card *card, struct device *dev,
+				   const struct snd_kcontrol_new *controls,
+				   int num_controls, const char *prefix)
+{
+	int i, err;
+
+	for (i = 0; i < num_controls; i++) {
+		const struct snd_kcontrol_new *control = &controls[i];
+		struct snd_ctl_elem_id id;
+		struct snd_kcontrol *kctl;
+
+		if (prefix)
+			snprintf(id.name, sizeof(id.name), "%s %s", prefix,
+				 control->name);
+		else
+			strlcpy(id.name, control->name, sizeof(id.name));
+		id.numid = 0;
+		id.iface = control->iface;
+		id.device = control->device;
+		id.subdevice = control->subdevice;
+		id.index = control->index;
+		kctl = snd_ctl_find_id(card, &id);
+		if (!kctl) {
+			dev_err(dev, "%d: Failed to find %s\n", err,
+				control->name);
+			return -ENOENT;
+		}
+		err = snd_ctl_remove(card, kctl);
+		if (err < 0) {
+			dev_err(dev, "%d: Failed to remove %s\n", err,
+				control->name);
+			return err;
+		}
+	}
+	return 0;
+}
+
+int gbaudio_remove_component_controls(struct snd_soc_component *component,
+				      const struct snd_kcontrol_new *controls,
+				      unsigned int num_controls)
+{
+	struct snd_card *card = component->card->snd_card;
+
+	return gbaudio_remove_controls(card, component->dev, controls,
+				       num_controls, component->name_prefix);
+}
diff --git a/drivers/staging/greybus/audio_helper.h b/drivers/staging/greybus/audio_helper.h
new file mode 100644
index 000000000000..5cf1c6d7d3ea
--- /dev/null
+++ b/drivers/staging/greybus/audio_helper.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Greybus Audio Sound SoC helper APIs
+ */
+
+#ifndef __LINUX_GBAUDIO_HELPER_H
+#define __LINUX_GBAUDIO_HELPER_H
+
+int gbaudio_dapm_link_component_dai_widgets(struct snd_soc_card *card,
+					    struct snd_soc_dapm_context *dapm);
+int gbaudio_dapm_free_controls(struct snd_soc_dapm_context *dapm,
+			       const struct snd_soc_dapm_widget *widget,
+			       int num);
+int gbaudio_remove_component_controls(struct snd_soc_component *component,
+				      const struct snd_kcontrol_new *controls,
+				      unsigned int num_controls);
+#endif
-- 
2.26.2

