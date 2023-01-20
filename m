Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEB7675268
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 11:27:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A4083086;
	Fri, 20 Jan 2023 11:26:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A4083086
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674210457;
	bh=ZJdrDMWZHinBYd+RS22Hea5lmsp141B457M7qSe9N00=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=gS2VPfdmB7s/GWGR/5mdF2kdsPFzb6hD3/qjq5wJtuXnfaaTtrfZ3re1HZfBieKce
	 YYRGA4BEjKtiJndsDagnST3CfO7P/rAecJ32+avAPTMNnjdI9vrXTDHPskcfF1r3wi
	 KXaBmO+ZjLqeRXyu7HB0pjBlwNybkMSz7Va11yGE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37FBCF80246;
	Fri, 20 Jan 2023 11:26:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEC90F804A9; Fri, 20 Jan 2023 11:26:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3AA6F8024C
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 11:26:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3AA6F8024C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256
 header.s=axis-central1 header.b=nw4Gx7SS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1674210365;
 x=1705746365; h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/WXW21EG+pqy+W42CXni76Bfh0YGb++llEepThhlRRc=;
 b=nw4Gx7SSTramV+SvOoHfRrE7TQYOvJUGysadaAk/78qxyaXwOuiBC8sR
 ufAX5iGkg4c3ApCSTo4SceG/ISh/7BkDj0e8VvrfGYSqY28jPaP0lAj9o
 2J8QHKxegOJHDRby2ZsRKee55i+Wjl7h3E8Ivah9elEC42vqB7dRgLSav
 rK2BWM6d7qo3sYFMTbyXngdxpy4Q43M+AfSbGg/voKa4MzDk5gPoNJOfK
 PIhKKBTxn2Nc6KJKLOa8cD9cODHY3jrpBLGREhlg+4urj424nzjr6iom0
 Gx/e463xipJPA5NSVq38OvvTb/TGyKxqkesa5VuTtuRgi+rKyO7P7D5Lx g==;
From: Astrid Rost <astrid.rost@axis.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 1/4] ASoC: soc-component: add get_jack_type
Date: Fri, 20 Jan 2023 11:25:51 +0100
Message-ID: <20230120102555.1523394-2-astrid.rost@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230120102555.1523394-1-astrid.rost@axis.com>
References: <20230120102555.1523394-1-astrid.rost@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: alsa-devel@alsa-project.org, kernel@axis.com, linux-kernel@vger.kernel.org,
 Astrid Rost <astrid.rost@axis.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add function to return the jack type of snd_jack_types.
This allows a generic card driver to add a jack with the specified
type.

Signed-off-by: Astrid Rost <astrid.rost@axis.com>
---
 include/sound/soc-component.h |  2 ++
 sound/soc/soc-component.c     | 20 ++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index c26ffb033777..3203d35bc8c1 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -98,6 +98,7 @@ struct snd_soc_component_driver {
 		       int source, unsigned int freq_in, unsigned int freq_out);
 	int (*set_jack)(struct snd_soc_component *component,
 			struct snd_soc_jack *jack,  void *data);
+	int (*get_jack_type)(struct snd_soc_component *component);
 
 	/* DT */
 	int (*of_xlate_dai_name)(struct snd_soc_component *component,
@@ -384,6 +385,7 @@ int snd_soc_component_set_pll(struct snd_soc_component *component, int pll_id,
 			      unsigned int freq_out);
 int snd_soc_component_set_jack(struct snd_soc_component *component,
 			       struct snd_soc_jack *jack, void *data);
+int snd_soc_component_get_jack_type(struct snd_soc_component *component);
 
 void snd_soc_component_seq_notifier(struct snd_soc_component *component,
 				    enum snd_soc_dapm_type type, int subseq);
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index e12f8244242b..3cd6952212e1 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -256,6 +256,26 @@ int snd_soc_component_set_jack(struct snd_soc_component *component,
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_set_jack);
 
+/**
+ * snd_soc_component_get_jack_type
+ * @component: COMPONENTs
+ *
+ * Returns the jack type of the component
+ * This can either be the supported type or one read from
+ * devicetree with the property: jack-type.
+ */
+int snd_soc_component_get_jack_type(
+	struct snd_soc_component *component)
+{
+	int ret = -ENOTSUPP;
+
+	if (component->driver->get_jack_type)
+		ret = component->driver->get_jack_type(component);
+
+	return soc_component_ret(component, ret);
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_get_jack_type);
+
 int snd_soc_component_module_get(struct snd_soc_component *component,
 				 void *mark, int upon_open)
 {
-- 
2.30.2

