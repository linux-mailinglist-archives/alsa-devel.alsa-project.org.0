Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 974E554ECE5
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 23:56:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 276801B00;
	Thu, 16 Jun 2022 23:55:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 276801B00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655416577;
	bh=6ZUC3i/iTF1493Gf5RNzts0c1O+klPwctnk3pmFoycU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cJ6AyDWMNdB190HbtI8hDhZqrPHAdMcFhbhTJkVJEb4ktJPOFc6n6FAMJqB+0O6cg
	 MYzT+fbAaIQa9a6SayJiYLh6rXnMi6U4KcV0bp5z4UiHX17a5UIqlrlwIZgAqOLjO8
	 rKcupqo56m3+xadBxw/k2f8ix2Ib8nAWeHs/E8j4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0349FF80528;
	Thu, 16 Jun 2022 23:54:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F958F8051F; Thu, 16 Jun 2022 23:54:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0D79F800F0
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 23:54:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0D79F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="nRULojN5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655416478; x=1686952478;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6ZUC3i/iTF1493Gf5RNzts0c1O+klPwctnk3pmFoycU=;
 b=nRULojN5kX5h9V7D+X2nZILgUtvUUxaRjc6dWUExbKBfhnnvVqu2ZBGx
 Hswugz94pruCwRHIWnnQQ0cV1i0IfrqTXtRZvUAsequ9PrfgC/mPZvM1p
 JVmz28kCSo5JclBJfRc48pVvBuQUIPlugcYm2pksKzdc+RYtXqMchFEWN
 +6tS5rFzjN/XNoere9ybNpVVpV642XNQ5huxZoUVXxrntqMuCQc1hFJNM
 I1AK52JYjHC9TXPeZRxM0MDNMNSPRsrJ+WLGLEcQe1asZDolxXfGlTru5
 e6EXoAPbtl/gYtWacWdeux04vB4B8Elbh8WXoPpbsJkiBCiyclif4jDxk w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="268047794"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="268047794"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 14:54:15 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="675212641"
Received: from buckkenx-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.52.70])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 14:54:14 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 01/13] ASoC: SOF: Intel: hda-dsp: report error on power-up/down
Date: Thu, 16 Jun 2022 16:53:39 -0500
Message-Id: <20220616215351.135643-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616215351.135643-1-pierre-louis.bossart@linux.intel.com>
References: <20220616215351.135643-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, tiwai@suse.de,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
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

dev_dbg() is not good-enough since the flow returns an error.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda-dsp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 263ad455e283a..2afaee91b982a 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -743,7 +743,7 @@ int hda_dsp_resume(struct snd_sof_dev *sdev)
 			if (hlink->ref_count) {
 				ret = snd_hdac_ext_bus_link_power_up(hlink);
 				if (ret < 0) {
-					dev_dbg(sdev->dev,
+					dev_err(sdev->dev,
 						"error %d in %s: failed to power up links",
 						ret, __func__);
 					return ret;
@@ -871,7 +871,7 @@ int hda_dsp_suspend(struct snd_sof_dev *sdev, u32 target_state)
 		/* no link can be powered in s0ix state */
 		ret = snd_hdac_ext_bus_link_power_down_all(bus);
 		if (ret < 0) {
-			dev_dbg(sdev->dev,
+			dev_err(sdev->dev,
 				"error %d in %s: failed to power down links",
 				ret, __func__);
 			return ret;
-- 
2.34.1

