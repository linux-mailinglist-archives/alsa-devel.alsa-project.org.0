Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D20E5BCB8D
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 14:13:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D00191676;
	Mon, 19 Sep 2022 14:12:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D00191676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663589603;
	bh=3h9IKQULfPHmOUrWnq1/yOhluTQ7XAXnjosw0hkMgDw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jT8ao5Q8Le3NtkCrvTkbb0SqI3PoibANBQwYnvhE3f598cToJsdwFW2+qFNBoFRfg
	 qbT4pJb+/fxFeGyX/VnEisumGuyJJehEgy0OWGqPjdhXv003c4svXAWiRvPhZPEyUq
	 UJ5uPWd1ER7DTMcsV3Ajx1lxki0YxLOXRHcWfggs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA40BF8053A;
	Mon, 19 Sep 2022 14:11:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69BECF80558; Mon, 19 Sep 2022 14:11:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A614AF8053A
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 14:11:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A614AF8053A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="EoTqzQ1o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663589483; x=1695125483;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3h9IKQULfPHmOUrWnq1/yOhluTQ7XAXnjosw0hkMgDw=;
 b=EoTqzQ1oBAPKYcMGJmfKIkPBICgfMXGJ/tLCrZb18FnrFWgMH/5LkWVG
 FwNODAfGjrgKtkB0plVpsARJL1kRfKsRBHB/KOoWAAKB6UrIvsMHYWd1V
 FXTCXveZ+PPMUldsqSKNng+pbMj9QTIKU2BtOhrw8mwEO20JTcqQLTrH2
 CPKYc8p/1WTu4PvkOtCylqInwpt96Yay9S2cBE2ntoAdUIuKMYXUgba8B
 vb/e+YHKaOPxXJbQZDmSrxzhRQkF1cX0Edz4wE/RzQMR3fdt6s2WGAVzL
 v9lxfUjfGvVeIgf5vmTbYJdXAkc35+85oio/GzXbekKvrnVbomEoJ/Cmn w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10474"; a="361121103"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="361121103"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 05:11:22 -0700
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="680826129"
Received: from amagnus-mobl2.ger.corp.intel.com (HELO pbossart-mobl3.home)
 ([10.249.46.168])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 05:11:18 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/8] ALSA: hda: Use hdac_ext prefix in
 snd_hdac_stream_free_all() for clarity
Date: Mon, 19 Sep 2022 14:10:37 +0200
Message-Id: <20220919121041.43463-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220919121041.43463-1-pierre-louis.bossart@linux.intel.com>
References: <20220919121041.43463-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

Make sure there's no ambiguity on layering with the appropriate prefix
added.

Pure rename, no functionality changed.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/sound/hdaudio_ext.h     | 2 +-
 sound/hda/ext/hdac_ext_stream.c | 6 +++---
 sound/soc/intel/avs/core.c      | 4 ++--
 sound/soc/intel/skylake/skl.c   | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/sound/hdaudio_ext.h b/include/sound/hdaudio_ext.h
index 4a4bd1d88612f..83aed26ab1433 100644
--- a/include/sound/hdaudio_ext.h
+++ b/include/sound/hdaudio_ext.h
@@ -79,7 +79,7 @@ struct hdac_ext_stream {
 
 int snd_hdac_ext_stream_init_all(struct hdac_bus *bus, int start_idx,
 				 int num_stream, int dir);
-void snd_hdac_stream_free_all(struct hdac_bus *bus);
+void snd_hdac_ext_stream_free_all(struct hdac_bus *bus);
 void snd_hdac_link_free_all(struct hdac_bus *bus);
 struct hdac_ext_stream *snd_hdac_ext_stream_assign(struct hdac_bus *bus,
 					   struct snd_pcm_substream *substream,
diff --git a/sound/hda/ext/hdac_ext_stream.c b/sound/hda/ext/hdac_ext_stream.c
index 5c665b26f8533..9419abd7fc036 100644
--- a/sound/hda/ext/hdac_ext_stream.c
+++ b/sound/hda/ext/hdac_ext_stream.c
@@ -87,11 +87,11 @@ int snd_hdac_ext_stream_init_all(struct hdac_bus *bus, int start_idx,
 EXPORT_SYMBOL_GPL(snd_hdac_ext_stream_init_all);
 
 /**
- * snd_hdac_stream_free_all - free hdac extended stream objects
+ * snd_hdac_ext_stream_free_all - free hdac extended stream objects
  *
  * @bus: HD-audio core bus
  */
-void snd_hdac_stream_free_all(struct hdac_bus *bus)
+void snd_hdac_ext_stream_free_all(struct hdac_bus *bus)
 {
 	struct hdac_stream *s, *_s;
 	struct hdac_ext_stream *hext_stream;
@@ -103,7 +103,7 @@ void snd_hdac_stream_free_all(struct hdac_bus *bus)
 		kfree(hext_stream);
 	}
 }
-EXPORT_SYMBOL_GPL(snd_hdac_stream_free_all);
+EXPORT_SYMBOL_GPL(snd_hdac_ext_stream_free_all);
 
 void snd_hdac_ext_stream_decouple_locked(struct hdac_bus *bus,
 					 struct hdac_ext_stream *hext_stream,
diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index c50c20fd681a1..bb0719c58ca49 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -466,7 +466,7 @@ static int avs_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
 
 err_acquire_irq:
 	snd_hdac_bus_free_stream_pages(bus);
-	snd_hdac_stream_free_all(bus);
+	snd_hdac_ext_stream_free_all(bus);
 err_init_streams:
 	iounmap(adev->dsp_ba);
 err_remap_bar4:
@@ -502,7 +502,7 @@ static void avs_pci_remove(struct pci_dev *pci)
 		snd_hda_codec_unregister(hdac_to_hda_codec(hdev));
 
 	snd_hdac_bus_free_stream_pages(bus);
-	snd_hdac_stream_free_all(bus);
+	snd_hdac_ext_stream_free_all(bus);
 	/* reverse ml_capabilities */
 	snd_hdac_link_free_all(bus);
 	snd_hdac_ext_bus_exit(bus);
diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
index 52a041d6144c9..0122926f9c58b 100644
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -444,7 +444,7 @@ static int skl_free(struct hdac_bus *bus)
 	if (bus->irq >= 0)
 		free_irq(bus->irq, (void *)bus);
 	snd_hdac_bus_free_stream_pages(bus);
-	snd_hdac_stream_free_all(bus);
+	snd_hdac_ext_stream_free_all(bus);
 	snd_hdac_link_free_all(bus);
 
 	if (bus->remap_addr)
-- 
2.34.1

