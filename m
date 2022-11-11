Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A319625287
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 05:28:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0ACA61679;
	Fri, 11 Nov 2022 05:27:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0ACA61679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668140894;
	bh=0rMVWGRMLBg4bFMV6J3jYFGlZ2aidsgYINzFQt3VnEY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vc4Iu9tcTbrbGgRf3tIe4g6w5BgA5E96t3+oBRyfpqI3JOJkQ1gtUgeSc1Iz3lEkS
	 BtN0BXxcVLa8hbEkF37JTBNV/5C9axvq3w2quVuvs9CxOjZKPjt6JzOMZOkI56gNp2
	 SX9F31uQ/xJi2NSJf/H59QzLrim3ON4Uh22+g+hY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46A84F80589;
	Fri, 11 Nov 2022 05:25:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FD31F80589; Fri, 11 Nov 2022 05:25:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C853F8057E
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 05:25:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C853F8057E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="mNqVVKoj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668140725; x=1699676725;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0rMVWGRMLBg4bFMV6J3jYFGlZ2aidsgYINzFQt3VnEY=;
 b=mNqVVKojUZH0SdHQu7Lth3DrlKMSScGZNFE5dt1cFDzWhqK4TwayjifJ
 UPpgA7EcgudyCxSid+EOdXQ/pXuHZ7pTFfLGG9r7Fu4RAESUi8W4t9Zz7
 BlQZY010TIoGyvclbf6lfFHNifF4hCO2ICxXnkG9qzyVulJ0Gk8sZYN5o
 dTwtw02Zw388A0RRZFTGXTFDPE42p89TmbBsCnPvSAYawdfVnB8ykVSfm
 kuDWE4IXYJ3NpVVoISrav6diMnHASsd9FdjB5np3iK0Fo3j/qEYOoIS4s
 PtOf6gdmHBh0pXqkbD/Q9aDZZvVMsRa3SoCQkoEME6AbiL7gvcUQSTb1q Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="291923775"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="291923775"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 20:25:23 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="588440803"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="588440803"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 20:25:21 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 8/8] ASoC: SOF: Intel: hda: read multi-link capabilities
 earlier
Date: Fri, 11 Nov 2022 12:26:53 +0800
Message-Id: <20221111042653.45520-9-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221111042653.45520-1-yung-chuan.liao@linux.intel.com>
References: <20221111042653.45520-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: vinod.koul@linaro.org, tiwai@suse.de, pierre-louis.bossart@linux.intel.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org, bard.liao@intel.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

There's no reason to delay the multi-link parsing, this can be done
earlier before checking the SoundWire capabilities.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 2f9d69e64091..14a2f8701350 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -944,6 +944,8 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 		return ret;
 	}
 
+	hda_bus_ml_get_capabilities(bus);
+
 	/* scan SoundWire capabilities exposed by DSDT */
 	ret = hda_sdw_acpi_scan(sdev);
 	if (ret < 0) {
@@ -972,8 +974,6 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 
 skip_soundwire:
 
-	hda_bus_ml_get_capabilities(bus);
-
 	/* create codec instances */
 	hda_codec_probe_bus(sdev);
 
-- 
2.25.1

