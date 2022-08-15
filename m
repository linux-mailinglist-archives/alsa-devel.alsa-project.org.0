Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 836D5593413
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Aug 2022 19:34:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 153CE163B;
	Mon, 15 Aug 2022 19:34:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 153CE163B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660584897;
	bh=e9fyc8iIpxco/psiR+vHx2hpPH98z1n6dH+dZES/Ee8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nYKGvIdT28OCKMoz/k6R0QxU0iDrpU9OVql3F+sLBDuSyIdVuSAQi1RXlINnDae+B
	 gvUSWC2NM1p1jukyyGCmJQql9b2u1GOIUnRruU47z8wFjF8Ni8WQnPb0KblKKgDyTJ
	 JeIGOODFqAa78XkQnT6OSAflabTUE+Oosqj3qGrs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1BD2F80095;
	Mon, 15 Aug 2022 19:33:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6EDCAF80506; Mon, 15 Aug 2022 19:33:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C059DF80082
 for <alsa-devel@alsa-project.org>; Mon, 15 Aug 2022 19:33:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C059DF80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="gE/JGMH0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660584807; x=1692120807;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e9fyc8iIpxco/psiR+vHx2hpPH98z1n6dH+dZES/Ee8=;
 b=gE/JGMH0AD0mTnHnLT1AcHHPjNuFCqBQoXt+lOtVIgIRTLj7BQPFeksk
 jtjBJaqCTOdsj7qV2G9UyL/N2H6/4iLzUxcaYEbyT7zaS0YVXlwv0pT8w
 Mvd8ADqLYUgPQKhnW6db9WYESqj/2FVRuMTcdGGYTzLt1UH84WABTFlBq
 RWTLdk0sf3bwPb4u68gKu7OxnPkEaVRiOQN4T7sLzEUunF3ByZFBKPCPX
 lOKRxfYj6tWQI8yz7YRehtCYm+Zo2n7/lk1E3UqwrAL6VEHwgxjxAkW8v
 EaPfcK94QnJFppHVKgblaE4hB6WpvSMSWrpW0jvBr46tEVC+r9h73+qiQ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="356024264"
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; d="scan'208";a="356024264"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2022 10:33:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; d="scan'208";a="696049351"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 15 Aug 2022 10:33:19 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	tiwai@suse.com
Subject: [PATCH v2 2/6] ASoC: SOF: Intel: Introduce HDA codec init and exit
 routines
Date: Mon, 15 Aug 2022 19:42:23 +0200
Message-Id: <20220815174227.3071323-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220815174227.3071323-1-cezary.rojewski@intel.com>
References: <20220815174227.3071323-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

Preliminary step in making snd_hda_codec_device_init() the only
constructor for struct hda_codec instances. To do that, existing usage
of hdac_ext equivalents has to be dropped.

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/sof/intel/hda-codec.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index 2f3f4a733d9e..4c128ba02340 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -109,6 +109,36 @@ EXPORT_SYMBOL_NS(hda_codec_jack_check, SND_SOC_SOF_HDA_AUDIO_CODEC);
 #define is_generic_config(x)	0
 #endif
 
+static void hda_codec_device_exit(struct device *dev)
+{
+	snd_hdac_device_exit(dev_to_hdac_dev(dev));
+}
+
+static __maybe_unused struct hda_codec *
+hda_codec_device_init(struct hdac_bus *bus, int addr, int type)
+{
+	struct hda_codec *codec;
+	int ret;
+
+	codec = snd_hda_codec_device_init(to_hda_bus(bus), addr, "ehdaudio%dD%d", bus->idx, addr);
+	if (IS_ERR(codec)) {
+		dev_err(bus->dev, "device init failed for hdac device\n");
+		return codec;
+	}
+
+	codec->core.type = type;
+	codec->core.dev.release = hda_codec_device_exit;
+
+	ret = snd_hdac_device_register(&codec->core);
+	if (ret) {
+		dev_err(bus->dev, "failed to register hdac device\n");
+		snd_hdac_device_exit(&codec->core);
+		return ERR_PTR(ret);
+	}
+
+	return codec;
+}
+
 /* probe individual codec */
 static int hda_codec_probe(struct snd_sof_dev *sdev, int address,
 			   bool hda_codec_use_common_hdmi)
-- 
2.25.1

