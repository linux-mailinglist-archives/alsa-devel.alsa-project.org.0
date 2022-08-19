Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0C7599BBE
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Aug 2022 14:20:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3491F84C;
	Fri, 19 Aug 2022 14:19:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3491F84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660911620;
	bh=s3zyPhwBOgrjSaC2xcdzm96IEOFGLcHf990suEYQQJg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=u77RA/9kI96jNGwaK7/nWwMlkJiaBbpb6t3VfiGjd3w+h2RAPNfkP8jQb9buWpD3p
	 EZgD6XzFlqqBt8vin1ea8pTHIv8Q/0/ljHxVko2omy+yFwlQ8xPJG+yfVzvEPLSzQE
	 zdZVUSyTznG5/fNvAdcBsfvVfIPRo9xwbJOjrl1A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D573F800EE;
	Fri, 19 Aug 2022 14:19:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF4B7F801F7; Fri, 19 Aug 2022 14:19:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 549BEF80128
 for <alsa-devel@alsa-project.org>; Fri, 19 Aug 2022 14:19:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 549BEF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="MQryPSAb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660911553; x=1692447553;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=s3zyPhwBOgrjSaC2xcdzm96IEOFGLcHf990suEYQQJg=;
 b=MQryPSAbPy/e29v4Vt+crHQjJaRUBK59KgAeaMJLHuMlvpEaB8zFH1T5
 LcZLb4PcfmwjrTJHvFoBuPbjj3HGWxY1J1A+4OxFFs3Nl4M0CKmEMdym9
 4W5jDfhJOVXPkB1ANn6d6PeKJrzU7Say88rVmqJnsJRvMPxPxo3jh3PtS
 w9w8CG7g6YNCkl7apsc0gXg/gtk1eUdr0yEcraD/5JbZ62xncZgx8KUkA
 XQm/U56KipN9QkyysuepLo8y+M0OZWbsvImM68WluMv/hnPxo/cVfkfAW
 5K9t+DpmEa9Y+3KBJhPoFYzON0e6rJDZhnOd7RkIUxiUfIpQP/AncFDOn g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="379295374"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="379295374"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2022 05:19:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="637260228"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga008.jf.intel.com with ESMTP; 19 Aug 2022 05:19:05 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	tiwai@suse.com
Subject: [PATCH] ASoC: SOF: Fix compilation when HDA_AUDIO_CODEC config is
 disabled
Date: Fri, 19 Aug 2022 14:29:08 +0200
Message-Id: <20220819122908.3563930-1-cezary.rojewski@intel.com>
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

Fixes: f2183b08c81a ("ASoC: Intel: Drop hdac_ext usage for codec device creation")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
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

