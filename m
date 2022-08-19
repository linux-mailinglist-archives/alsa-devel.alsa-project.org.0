Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7727D599C13
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Aug 2022 14:38:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1353A1616;
	Fri, 19 Aug 2022 14:38:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1353A1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660912730;
	bh=x1ugOjRX48eGrt84mYnkV10rWIU/I0OcUgTDAua5LZE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DzTbdsGGeQKAbjBgL3skEcDlcfHPd5Wj+BdEcJEy2AZovTEhzPC/UpL9wC8T5Nw5C
	 qj+VFMp1M7K1be2x3PxmgpISswQm8Jm2VG97JNWYs++crsW/Z/TCP0WSBjbrAy8jAR
	 tTJYhtNm+xDFWKz+zusr+v8pE3ndBb1R1VSkCDhY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89F7FF80128;
	Fri, 19 Aug 2022 14:37:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26840F80217; Fri, 19 Aug 2022 14:37:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A66D0F800EE
 for <alsa-devel@alsa-project.org>; Fri, 19 Aug 2022 14:37:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A66D0F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="IeaEOEV7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660912663; x=1692448663;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x1ugOjRX48eGrt84mYnkV10rWIU/I0OcUgTDAua5LZE=;
 b=IeaEOEV7EcRgIMh9Vl+XkBoZiH8V+gxoQ4bpFVPMB7Uo5lyrZQMUzccI
 2gski4KEhAbyXcn5Cwo2iqYW1zpNPN6KsQjqQtOWjV9akkPu+XllhDh76
 8jOPJmtQp9nAi+RGgJ8Lqa+EFHAxE/rOdLFfyB0T43dhoqWL2sC3TcVwl
 oeZJVQbtgrLYfc5KIFvpkZGrvYRK9lSo8Q/zmkeHWJZGQBBg5LlVkHr1k
 RHJLD9Ryo5Sp02C1QalFQhmhAk059K6cE1gk3qfuJmFwwQdNjVUGl9Fhh
 7KKlfiCf9+NN/2zi6vNNu4kqKpmVe9zTZYxkVmeGaX2YZBGZIJRVTqlsR w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="279966080"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="279966080"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2022 05:37:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="750512910"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 19 Aug 2022 05:37:37 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	tiwai@suse.com
Subject: [PATCH v2] ASoC: SOF: Fix compilation when HDA_AUDIO_CODEC config is
 disabled
Date: Fri, 19 Aug 2022 14:47:40 +0200
Message-Id: <20220819124740.3564862-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 kernel test robot <lkp@intel.com>, kai.vehmanen@linux.intel.com,
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

hda_codec_device_init() expects three parameters, not two.

Fixes: 3fd63658caed ("ASoC: Intel: Drop hdac_ext usage for codec device creation")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---

Changes in v2:
- adjusted SHA-1 provided in Fixes tag

 sound/soc/sof/intel/hda-codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index 73336648cd25..1e9afc48394c 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -213,7 +213,7 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address,
 		put_device(&codec->core.dev);
 	}
 #else
-	codec = hda_codec_device_init(&hbus->core, address);
+	codec = hda_codec_device_init(&hbus->core, address, HDA_DEV_ASOC);
 	ret = PTR_ERR_OR_ZERO(codec);
 #endif
 
-- 
2.25.1

