Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7A0702590
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 08:58:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9A72E94;
	Mon, 15 May 2023 08:57:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9A72E94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684133905;
	bh=nQ5bs2pm3yyJqyCctssYUsybKhCJPd02FInwiNQFhys=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Rbd0ROAWGcaqPLM/5uQljk6nJyUuHquamHbodJDr1gTjdTdTq8gp+7juRtuzPKVu3
	 dgaazqJebDN7y7ERJoHEFa2Ec1tSfOuUX0FUZO7bRsL+DbGxjQP16FZIe1Fq015Lyz
	 wrRGlmGX1GUakFJ+i4jcOva4l9mmjmqEAeZhygr8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C65EF8068A; Mon, 15 May 2023 08:52:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A5FD2F80587;
	Mon, 15 May 2023 08:52:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB6A3F80553; Mon, 15 May 2023 08:52:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0E1A5F80571
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 08:50:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E1A5F80571
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IEkLbfNx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684133442; x=1715669442;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nQ5bs2pm3yyJqyCctssYUsybKhCJPd02FInwiNQFhys=;
  b=IEkLbfNxsqxDYPNiVQG6B7Ax8A7qhWIL02t4483K+4ErI51kGgOZNA3j
   HVXl/mQd/MvChNKmOJ8YU80eXMIIiznBxqajTzlayit4Ry4eTTEkccYr2
   w0tr2St1fcYc1xL41UMyw+fW+G7noLsEMhap8ryBLq77Z5r6nBLvHEKIH
   GOxvatyuNkxrwS8PpNAhrIb6dQITmH5HzRxDCHi+mEq1TMI+S0vAYjlOf
   ZRRmSKxpTGG0TTqBZUE5Mxy+vbUMmPwAfTMMp3gzArQqYiPyz78l6YFho
   t0l8ZJtthzuzdSfPKyvrBqn8CC+Y/Tj+I2UnDvdpe/4suq5UtFuCcDxTp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="349966346"
X-IronPort-AV: E=Sophos;i="5.99,275,1677571200";
   d="scan'208";a="349966346"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2023 23:50:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="694908651"
X-IronPort-AV: E=Sophos;i="5.99,275,1677571200";
   d="scan'208";a="694908651"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2023 23:50:38 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org,
	broonie@kernel.org,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	vinod.koul@linaro.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH v2 08/26] ASoC: SOF: Intel: hda: retrieve SoundWire eml_lock
 and pass pointer
Date: Mon, 15 May 2023 15:10:24 +0800
Message-Id: <20230515071042.2038-9-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230515071042.2038-1-yung-chuan.liao@linux.intel.com>
References: <20230515071042.2038-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Y4YGN5JSQTZNISFA6J7Q3EKFV7U7SF7K
X-Message-ID-Hash: Y4YGN5JSQTZNISFA6J7Q3EKFV7U7SF7K
X-MailFrom: yung-chuan.liao@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y4YGN5JSQTZNISFA6J7Q3EKFV7U7SF7K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Use new helper and interface to make sure the HDaudio and SoundWire
parts use the same mutex when accessing shared registers.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Acked-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 4d48f4018617..388e41057172 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -175,6 +175,15 @@ static int hda_sdw_probe(struct snd_sof_dev *sdev)
 		res.alh_base = hdev->desc->sdw_alh_base;
 		res.ext = false;
 	} else {
+		/*
+		 * retrieve eml_lock needed to protect shared registers
+		 * in the HDaudio multi-link areas
+		 */
+		res.eml_lock = hdac_bus_eml_get_mutex(sof_to_bus(sdev), true,
+						      AZX_REG_ML_LEPTR_ID_SDW);
+		if (!res.eml_lock)
+			return -ENODEV;
+
 		res.mmio_base = sdev->bar[HDA_DSP_HDA_BAR];
 		/*
 		 * the SHIM and SoundWire register offsets are link-specific
-- 
2.25.1

