Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBAC595974
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 13:09:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0EEA165D;
	Tue, 16 Aug 2022 13:08:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0EEA165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660648149;
	bh=DlCHbBLmYpBhZOy6P1Vp+2wi9cqcmb5zazV3g9hM7RA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F4ZNmNL/BOtuEQC9HAV7Vvw7+CyMiQkcmN1gnCDDLKW2Qb2AjnKvDzEPEpViRIq+n
	 zE100fYnqK+k3jkzi6cdKPW71OTxY83J4fZUIBqmNaC3R3dOQGg01mSeZ8K9Xfk2rT
	 +NNZTDew1/WN4tXnRnn+tm4DIHWBW86rjGqgkzYo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D4A3F80544;
	Tue, 16 Aug 2022 13:07:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE54CF8053E; Tue, 16 Aug 2022 13:07:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D191F80238
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 13:07:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D191F80238
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="MkRJxFLs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660648059; x=1692184059;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DlCHbBLmYpBhZOy6P1Vp+2wi9cqcmb5zazV3g9hM7RA=;
 b=MkRJxFLszvO1KFqJIW5171nXdOv3cTPgZN8YrJMmh4mKDASh+7pOlLNr
 p4qAduUf8xfoRAUJ5lvOflEyter/aNoluvZBLJc3nCsbrH+slNicl0YQ6
 NzDnK5AjwKbDU7M+xngcSM4Rgos++saK5c9VcQusTw52nrDLW/PEXX8h6
 XakDyBgi5lwgleTNHudxG3eQxH+TuYjSnnFs9Y4R4JGXjl4ofg8shAIhe
 kxavgLlgtd5hYlS5INFM0IYJFhZZMgjBDiJi2z/leyj9iz8jl7dURP1Mk
 RhbWrXpAsmg2zRw3x4SdxaYEj7lZOJd1HpTzyP/gQlxHZDPgziw2RGJay w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="271960439"
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; d="scan'208";a="271960439"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2022 04:07:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; d="scan'208";a="782986150"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga005.jf.intel.com with ESMTP; 16 Aug 2022 04:07:30 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	tiwai@suse.com
Subject: [RESEND PATCH v2 1/6] ASoC: Intel: Skylake: Introduce HDA codec init
 and exit routines
Date: Tue, 16 Aug 2022 13:17:22 +0200
Message-Id: <20220816111727.3218543-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220816111727.3218543-1-cezary.rojewski@intel.com>
References: <20220816111727.3218543-1-cezary.rojewski@intel.com>
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
 sound/soc/intel/skylake/skl.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
index aeca58246fc7..33b0ed6b0534 100644
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -689,6 +689,35 @@ static void load_codec_module(struct hda_codec *codec)
 
 #endif /* CONFIG_SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC */
 
+static void skl_codec_device_exit(struct device *dev)
+{
+	snd_hdac_device_exit(dev_to_hdac_dev(dev));
+}
+
+static __maybe_unused struct hda_codec *skl_codec_device_init(struct hdac_bus *bus, int addr)
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
+	codec->core.type = HDA_DEV_ASOC;
+	codec->core.dev.release = skl_codec_device_exit;
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
 /*
  * Probe the given codec address
  */
-- 
2.25.1

