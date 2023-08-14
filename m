Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8199677C3EE
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 01:25:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A89B784C;
	Tue, 15 Aug 2023 01:24:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A89B784C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692055536;
	bh=xByKIulZWn2pyal9fs3gKTJA7pVyZU7i2HRuHKlJo3k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bFRoB6Ema+Ri+6JMM4K1acFxoPuSc7LG+Kema2AZdvNjVWJFJ4vq2skDCrmnZ6RO5
	 Q0AyEssjVP1+ThSowN6SCePo1N7Lj7zlGkcgs2qTZFSVMd0op71vJFI8KjE5IyOtaq
	 poZPjQI2/pOiYuoUbMylCpZApdoGD6sS2zu+fB/U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D536BF80579; Tue, 15 Aug 2023 01:23:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0234DF80568;
	Tue, 15 Aug 2023 01:23:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F22CF80016; Tue, 15 Aug 2023 01:23:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ACAF3F801EB
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 01:23:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACAF3F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=evk4hIq2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692055426; x=1723591426;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xByKIulZWn2pyal9fs3gKTJA7pVyZU7i2HRuHKlJo3k=;
  b=evk4hIq2qs2eCJPjYAGlr5EixSuJll7u/Au9KukHg9I6VkwvxbaQm3Ka
   6Q8SX5bmU3DJ68196zKhus14haqjfPEK5oEYhA86iZpAGDg/97i2XynPI
   BXRYfrOslZuvxm4er7TDKTCZbtHNx4BDsqUWbANpJH6KCozdZb0MUuLnH
   JCwPKrm+yY2cRnJRGX96V6t1BxlyEDLyV4uiWR8mD3JvXSlJJOvmFcu5J
   f26VM/7ePFhQLdiTrid5LjuMbGvmSyOFUcG8kMH25YPMMJQIYD1WQF1zL
   OCKcYF7WV9ChFDBs8WoF1cgBXSxEN2bKxGd/KR2nuTj+nDf7cgbPbu7+k
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="436051855"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200";
   d="scan'208";a="436051855"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 16:23:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="823642507"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200";
   d="scan'208";a="823642507"
Received: from dishasur-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.104.139])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 16:23:35 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Jyri Sarha <jyri.sarha@intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 2/2] ASoC: SOF: topology: Add a token for dropping widget name
 in kcontrol name
Date: Mon, 14 Aug 2023 18:23:25 -0500
Message-Id: <20230814232325.86397-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230814232325.86397-1-pierre-louis.bossart@linux.intel.com>
References: <20230814232325.86397-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZYSKX2WTKJ7MXMZLCUSFBVZAMD6LG7OI
X-Message-ID-Hash: ZYSKX2WTKJ7MXMZLCUSFBVZAMD6LG7OI
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZYSKX2WTKJ7MXMZLCUSFBVZAMD6LG7OI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Jyri Sarha <jyri.sarha@intel.com>

Adds SOF_TKN_COMP_NO_WNAME_IN_KCONTROL_NAME token, and copies the
token's tuple value to the no_wname_in_kcontrol_name flag in struct
snd_soc_dapm_widget.

If the tuple value for the token in the topology is true, then the
widget name is not added to the mixer name. In practice "gain.2.1 Post
Mixer Analog Playback Volume" becomes just "Post Mixer Analog Playback
Volume".

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Jyri Sarha <jyri.sarha@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/uapi/sound/sof/tokens.h |  6 +++++-
 sound/soc/sof/topology.c        | 22 ++++++++++++++++++++++
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/include/uapi/sound/sof/tokens.h b/include/uapi/sound/sof/tokens.h
index e9ec7e4eb982..453cab2a1209 100644
--- a/include/uapi/sound/sof/tokens.h
+++ b/include/uapi/sound/sof/tokens.h
@@ -99,7 +99,11 @@
 #define SOF_TKN_COMP_OUTPUT_PIN_BINDING_WNAME	414
 #define SOF_TKN_COMP_NUM_INPUT_AUDIO_FORMATS	415
 #define SOF_TKN_COMP_NUM_OUTPUT_AUDIO_FORMATS	416
-
+/*
+ * The token value is copied to the dapm_widget's
+ * no_wname_in_kcontrol_name.
+ */
+#define SOF_TKN_COMP_NO_WNAME_IN_KCONTROL_NAME	417
 
 /* SSP */
 #define SOF_TKN_INTEL_SSP_CLKS_CONTROL		500
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index be63ba06762f..a3a3af252259 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1367,6 +1367,20 @@ static int sof_parse_pin_binding(struct snd_sof_widget *swidget,
 	return ret;
 }
 
+static int get_w_no_wname_in_long_name(void *elem, void *object, u32 offset)
+{
+	struct snd_soc_tplg_vendor_value_elem *velem = elem;
+	struct snd_soc_dapm_widget *w = object;
+
+	w->no_wname_in_kcontrol_name = !!le32_to_cpu(velem->value);
+	return 0;
+}
+
+static const struct sof_topology_token dapm_widget_tokens[] = {
+	{SOF_TKN_COMP_NO_WNAME_IN_KCONTROL_NAME, SND_SOC_TPLG_TUPLE_TYPE_BOOL,
+	 get_w_no_wname_in_long_name, 0}
+};
+
 /* external widget init - used for any driver specific init */
 static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 			    struct snd_soc_dapm_widget *w,
@@ -1397,6 +1411,14 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 	ida_init(&swidget->output_queue_ida);
 	ida_init(&swidget->input_queue_ida);
 
+	ret = sof_parse_tokens(scomp, w, dapm_widget_tokens, ARRAY_SIZE(dapm_widget_tokens),
+			       priv->array, le32_to_cpu(priv->size));
+	if (ret < 0) {
+		dev_err(scomp->dev, "failed to parse dapm widget tokens for %s\n",
+			w->name);
+		goto widget_free;
+	}
+
 	ret = sof_parse_tokens(scomp, swidget, comp_pin_tokens,
 			       ARRAY_SIZE(comp_pin_tokens), priv->array,
 			       le32_to_cpu(priv->size));
-- 
2.39.2

