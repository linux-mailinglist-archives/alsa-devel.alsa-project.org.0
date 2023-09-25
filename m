Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 607647AD9F0
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Sep 2023 16:18:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F354E11;
	Mon, 25 Sep 2023 16:17:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F354E11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695651493;
	bh=XtW1noqdh2AkhKEnR3mNGRm/gZQlpuYljnTPmEXTclQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CXMgM00yaNAhSd0/4+htARnQi8zaBc7RpEcDeheUp6E6hSb7O2+TCHHg1lBVzgnMn
	 theUyHXsG8AxJLKZ+YGB/onMWbsNb/AD0pHhvOgmM3oZ2vgC39TLOhujuExF5nsK1f
	 FPq8SLGSy+gbplHMJKM4/J3ONE5WNeKRrMbDBBQs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6F5CF80570; Mon, 25 Sep 2023 16:16:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1C68F80579;
	Mon, 25 Sep 2023 16:16:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B4AFF80551; Mon, 25 Sep 2023 16:16:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 95FB6F8016A
	for <alsa-devel@alsa-project.org>; Mon, 25 Sep 2023 16:16:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95FB6F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BLmDJpfn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695651381; x=1727187381;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XtW1noqdh2AkhKEnR3mNGRm/gZQlpuYljnTPmEXTclQ=;
  b=BLmDJpfnYTBFG3tLBvoAfQIXXJrzUQGCNquWy85JqEv9DoZTfyq4JjGX
   TzQTxdlur2B1TXlJkqB4UiB+Xp3xto2ewyEWFZgv+Z9jdrtXL/8FGup1S
   LMKREYI7XklXP3ogGBHJJNdhmGhmlMZlIJjWyt69hq3ltv3dVUxzLukoE
   62ajPN+lt+qZNBELGitWdu0hV3jXozSBnRTXrjBrYfkOwJGryBRFj8Ah0
   d18tilyV4xuN8FVETVCX0XqUfi3/Rfj+cUsUu1Ks/SmKnUdA20r8B6BfP
   snu5fXsnDykYSWk+vzg1v3HpunX36OqCSkTuTuxF4cXBCIS/rK0HSo9PU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="361514128"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200";
   d="scan'208";a="361514128"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 07:07:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="783508167"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200";
   d="scan'208";a="783508167"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orsmga001.jf.intel.com with ESMTP; 25 Sep 2023 07:07:28 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 2/4] ALSA: hda: Introduce HOST stream setup mechanism
Date: Mon, 25 Sep 2023 16:06:14 +0200
Message-Id: <20230925140616.26892-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230925140616.26892-1-cezary.rojewski@intel.com>
References: <20230925140616.26892-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GHH742NHZMQEV66SIZVNBBJGSLFCO77Y
X-Message-ID-Hash: GHH742NHZMQEV66SIZVNBBJGSLFCO77Y
X-MailFrom: cezary.rojewski@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GHH742NHZMQEV66SIZVNBBJGSLFCO77Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

HDAudio stream setup procedure differs between revisions of the
controller device. Currently the differences are handled directly within
AudioDSP platform drivers with if-statements. Implement a more generic
approach and expose a function that a platform driver may use to ensure
the correct procedure is followed each time.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/hdaudio_ext.h     |  3 +++
 sound/hda/ext/hdac_ext_stream.c | 41 +++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/include/sound/hdaudio_ext.h b/include/sound/hdaudio_ext.h
index 511211f4a2b6..d32959cb71d2 100644
--- a/include/sound/hdaudio_ext.h
+++ b/include/sound/hdaudio_ext.h
@@ -60,6 +60,8 @@ struct hdac_ext_stream {
 	bool link_locked:1;
 	bool link_prepared;
 
+	int (*host_setup)(struct hdac_stream *);
+
 	struct snd_pcm_substream *link_substream;
 };
 
@@ -86,6 +88,7 @@ void snd_hdac_ext_stream_start(struct hdac_ext_stream *hext_stream);
 void snd_hdac_ext_stream_clear(struct hdac_ext_stream *hext_stream);
 void snd_hdac_ext_stream_reset(struct hdac_ext_stream *hext_stream);
 int snd_hdac_ext_stream_setup(struct hdac_ext_stream *hext_stream, int fmt);
+int snd_hdac_ext_host_stream_setup(struct hdac_ext_stream *hext_stream);
 
 struct hdac_ext_link {
 	struct hdac_bus *bus;
diff --git a/sound/hda/ext/hdac_ext_stream.c b/sound/hda/ext/hdac_ext_stream.c
index 11b7119cc47e..f12fe348b9fc 100644
--- a/sound/hda/ext/hdac_ext_stream.c
+++ b/sound/hda/ext/hdac_ext_stream.c
@@ -10,12 +10,45 @@
  */
 
 #include <linux/delay.h>
+#include <linux/pci.h>
+#include <linux/pci_ids.h>
 #include <linux/slab.h>
 #include <sound/pcm.h>
 #include <sound/hda_register.h>
 #include <sound/hdaudio_ext.h>
 #include <sound/compress_driver.h>
 
+/**
+ * snd_hdac_ext_host_stream_setup - Setup a HOST stream.
+ * @hext_stream - HDAudio stream to set up.
+ *
+ * Return: Zero on success or negative error code.
+ */
+int snd_hdac_ext_host_stream_setup(struct hdac_ext_stream *hext_stream)
+{
+	return hext_stream->host_setup(hdac_stream(hext_stream));
+}
+EXPORT_SYMBOL_GPL(snd_hdac_ext_host_stream_setup);
+
+/**
+ * snd_hdac_apl_host_stream_setup - Setup a HOST stream following procedure
+ *                                  recommended for ApolloLake devices.
+ * @hstream - HDAudio stream to set up.
+ *
+ * Return: Zero on success or negative error code.
+ */
+static int snd_hdac_apl_host_stream_setup(struct hdac_stream *hstream)
+{
+	struct hdac_ext_stream *hext_stream = stream_to_hdac_ext_stream(hstream);
+	int ret;
+
+	snd_hdac_ext_stream_decouple(hstream->bus, hext_stream, false);
+	ret = snd_hdac_stream_setup(hstream);
+	snd_hdac_ext_stream_decouple(hstream->bus, hext_stream, true);
+
+	return ret;
+}
+
 /**
  * snd_hdac_ext_stream_init - initialize each stream (aka device)
  * @bus: HD-audio core bus
@@ -55,9 +88,16 @@ static void snd_hdac_ext_stream_init(struct hdac_bus *bus,
 int snd_hdac_ext_stream_init_all(struct hdac_bus *bus, int start_idx,
 				 int num_stream, int dir)
 {
+	struct pci_dev *pci = to_pci_dev(bus->dev);
+	int (*setup_op)(struct hdac_stream *);
 	int stream_tag = 0;
 	int i, tag, idx = start_idx;
 
+	if (pci->device == PCI_DEVICE_ID_INTEL_HDA_APL)
+		setup_op = snd_hdac_apl_host_stream_setup;
+	else
+		setup_op = snd_hdac_stream_setup;
+
 	for (i = 0; i < num_stream; i++) {
 		struct hdac_ext_stream *hext_stream =
 				kzalloc(sizeof(*hext_stream), GFP_KERNEL);
@@ -66,6 +106,7 @@ int snd_hdac_ext_stream_init_all(struct hdac_bus *bus, int start_idx,
 		tag = ++stream_tag;
 		snd_hdac_ext_stream_init(bus, hext_stream, idx, dir, tag);
 		idx++;
+		hext_stream->host_setup = setup_op;
 	}
 
 	return 0;
-- 
2.25.1

