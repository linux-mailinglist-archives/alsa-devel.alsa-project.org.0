Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BE5677D65
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jan 2023 15:01:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C2303326;
	Mon, 23 Jan 2023 15:00:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C2303326
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674482474;
	bh=ZJdrDMWZHinBYd+RS22Hea5lmsp141B457M7qSe9N00=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=HkxDi13R1pZ5DY+OPfBFmJjvln5C+4vro1Vx8W0xH8yp5IZGo8zM92ukz1vyMIKKA
	 aZKhmcAVWT1bDUVgaHMI+KZHpGRoGj76awFwwX25223NuzUzdSEM4SmuTYIIrLG/P3
	 oGaPkwnXqk80Kpvn5oSKO5fNz/sqzX9S17GB34J4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC119F800FB;
	Mon, 23 Jan 2023 14:59:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CADAF80552; Mon, 23 Jan 2023 14:59:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1BFAF804A9
 for <alsa-devel@alsa-project.org>; Mon, 23 Jan 2023 14:59:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1BFAF804A9
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256
 header.s=axis-central1 header.b=Xpj+Tf+h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1674482362;
 x=1706018362; h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/WXW21EG+pqy+W42CXni76Bfh0YGb++llEepThhlRRc=;
 b=Xpj+Tf+hYVqNjKNlm+uDiP/w1DlgHReVmygj2di+WQbazhthScS3q+Q5
 omdzQGCgquKVMtvXfGr4BG1iWtpLdDe6kHuLaTzmwG9x8cXJQljQyFXbz
 0Oeb5Uwk4FKelygsSX+qg+pa4wY/VpEQOcAh1+01IV73vApk0SLqde8n4
 jyOwFs6jkAY/g/diO47NQg9XQb+3juNGQI73ZMq/yCM/ZwTudiXU9rbXo
 NpHffamWWZRPWcPqomkIFk+BJ1gotO0z3s/acCtZN13hZGTySEsNq8dru
 SfpkIxpnIgecE/H48owexTg0/AyoB1X8wpvk0wfKpk+XYoI6XA2MoczA6 w==;
From: Astrid Rost <astrid.rost@axis.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 1/3] ASoC: soc-component: add get_jack_type
Date: Mon, 23 Jan 2023 14:59:11 +0100
Message-ID: <20230123135913.2720991-2-astrid.rost@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230123135913.2720991-1-astrid.rost@axis.com>
References: <20230123135913.2720991-1-astrid.rost@axis.com>
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

