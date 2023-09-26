Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6FA7AE77C
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 10:09:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EBF7E0F;
	Tue, 26 Sep 2023 10:08:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EBF7E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695715744;
	bh=NPLm1R1xooncE6h8XpHdiMrkOnUqiX+wOZ7zokDJw7A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MyUI2PdiUCRux3YcSNEc2k47lXSjoL4rv2xbM9ckagAH6n9oi6JbPY+KG7uHxVkU5
	 ruR3LQe+qj6SShgY330B5j7tj/T6OrDmwM3JG9pAk4YjnMwF3qHC9TZos0xRHU0bKI
	 eMRMPwR9bN6kLoeyBBpE4LFGS98tM/7u7Wdqu1l8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85D42F8057E; Tue, 26 Sep 2023 10:07:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CA738F80130;
	Tue, 26 Sep 2023 10:07:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ABE99F8055C; Tue, 26 Sep 2023 10:07:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15933F80166
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 10:06:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15933F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=W7PMZbyd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695715616; x=1727251616;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NPLm1R1xooncE6h8XpHdiMrkOnUqiX+wOZ7zokDJw7A=;
  b=W7PMZbydTpSGBIUy/N7IAb550OL9rELwZWPMzqbgBotbXRVUV+4+NTag
   k7ed6VpSfdGjGl88eDF5Lj8gpVTxzft1d8GiC5DqoxtWFi8FUc94SKDow
   Pfa1ooFp8Cg4nzQR737VzYopPAmjefbcGa0D8+3b06IHSNnjC5MOX2Md7
   Kyr3fB67jTns6ujKP+rIjy5xbVF3Uqyc1ugZWSy2tv8OU6fAs54M9rgE3
   PT7M6m6PxfyvuV0WFa6lR2TvsMhZNUEd2coKWRSOxzqfpLHMR1X6Q5cVs
   0msXH1C78u1YE1EXzSc9zuBjh0QL4SO/3tJ70fbYsoqkxIhF7qVO6xRBw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="360891423"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200";
   d="scan'208";a="360891423"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 01:06:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="725357984"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200";
   d="scan'208";a="725357984"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orsmga006.jf.intel.com with ESMTP; 26 Sep 2023 01:06:49 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 2/4] ALSA: hda: Introduce HOST stream setup mechanism
Date: Tue, 26 Sep 2023 10:06:21 +0200
Message-Id: <20230926080623.43927-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230926080623.43927-1-cezary.rojewski@intel.com>
References: <20230926080623.43927-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TBHA4KB67ND67AIMRQWSYV5HNJO65UYJ
X-Message-ID-Hash: TBHA4KB67ND67AIMRQWSYV5HNJO65UYJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TBHA4KB67ND67AIMRQWSYV5HNJO65UYJ/>
List-Archive: <>
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
index 11b7119cc47e..186e95bffb28 100644
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
+ * @hext_stream: HDAudio stream to set up.
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
+ * @hstream: HDAudio stream to set up.
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

