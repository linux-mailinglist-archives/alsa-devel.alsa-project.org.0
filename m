Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A66137A72
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Jan 2020 01:04:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F21DC16C1;
	Sat, 11 Jan 2020 01:03:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F21DC16C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578701079;
	bh=SrcRiEtiqdkXI+vDHszrgya3Qh4f5WLNTsCDYJzWyog=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BsL8sE5bcCDMNSncsntj/y10OnkiBUqJuCLFVFwZtGAQAiKMigpQy/22HjS6I1Dh+
	 3Xd2zdvyXXTkO3htX5Q2wx2LWFBLGIMkGoPmzg8Fu3xYDbyFZoeFOSMIiy+rfiyuY1
	 FcJuYYHCIk7iAml2pNQsVb8WssqPEcOt1NHlwo48=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C0BEF802BC;
	Sat, 11 Jan 2020 00:58:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A42EF8026F; Sat, 11 Jan 2020 00:58:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB780F801DA
 for <alsa-devel@alsa-project.org>; Sat, 11 Jan 2020 00:58:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB780F801DA
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jan 2020 15:58:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,418,1571727600"; d="scan'208";a="224345306"
Received: from jrderube-mobl5.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.155.251])
 by orsmga003.jf.intel.com with ESMTP; 10 Jan 2020 15:58:11 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 10 Jan 2020 17:57:50 -0600
Message-Id: <20200110235751.3404-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200110235751.3404-1-pierre-louis.bossart@linux.intel.com>
References: <20200110235751.3404-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [alsa-devel] [PATCH 7/8] ASoC: SOF: Intel: fix HDA codec driver
	probe with multiple controllers
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

In case system has multiple HDA controllers, it can happen that
same HDA codec driver is used for codecs of multiple controllers.
In this case, SOF may fail to probe the HDA driver and SOF
initialization fails.

SOF HDA code currently relies that a call to request_module() will
also run device matching logic to attach driver to the codec instance.
However if driver for another HDA controller was already loaded and it
already loaded the HDA codec driver, this breaks current logic in SOF.
In this case the request_module() SOF does becomes a no-op and HDA
Codec driver is not attached to the codec instance sitting on the HDA
bus SOF is controlling. Typical scenario would be a system with both
external and internal GPUs, with driver of the external GPU loaded
first.

Fix this by adding similar logic as is used in legacy HDA driver
where an explicit device_attach() call is done after request_module().

Also add logic to propagate errors reported by device_attach() back
to caller. This also works in the case where drivers are not built
as modules.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-codec.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index 5514e6191ba4..78dfd5f5c034 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -24,19 +24,18 @@
 #define IDISP_VID_INTEL	0x80860000
 
 /* load the legacy HDA codec driver */
-#ifdef MODULE
-static void hda_codec_load_module(struct hda_codec *codec)
+static int hda_codec_load_module(struct hda_codec *codec)
 {
+#ifdef MODULE
 	char alias[MODULE_NAME_LEN];
 	const char *module = alias;
 
 	snd_hdac_codec_modalias(&codec->core, alias, sizeof(alias));
 	dev_dbg(&codec->core.dev, "loading codec module: %s\n", module);
 	request_module(module);
-}
-#else
-static void hda_codec_load_module(struct hda_codec *codec) {}
 #endif
+	return device_attach(hda_codec_dev(codec));
+}
 
 /* enable controller wake up event for all codecs with jack connectors */
 void hda_codec_jack_wake_enable(struct snd_sof_dev *sdev)
@@ -124,10 +123,16 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address,
 	if (hda_codec_use_common_hdmi ||
 	    (resp & 0xFFFF0000) != IDISP_VID_INTEL) {
 		hdev->type = HDA_DEV_LEGACY;
-		hda_codec_load_module(&hda_priv->codec);
+		ret = hda_codec_load_module(&hda_priv->codec);
+		/*
+		 * handle ret==0 (no driver bound) as an error, but pass
+		 * other return codes without modification
+		 */
+		if (ret == 0)
+			ret = -ENOENT;
 	}
 
-	return 0;
+	return ret;
 #else
 	hdev = devm_kzalloc(sdev->dev, sizeof(*hdev), GFP_KERNEL);
 	if (!hdev)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
