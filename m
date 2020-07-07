Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5312179ED
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 23:02:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B344B15DC;
	Tue,  7 Jul 2020 23:01:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B344B15DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594155733;
	bh=LWOGiRvycLejGk24R6hgN8mQ4wWvpRvtQAgyuFVHubI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T2M2zExjB1aSnHqtv31ST425yBM0v9bfan9wyfEWgGNYC9DtdFQmzkkQudqj7H4NK
	 iYK0fW8wFxpG+aPBQbGc4YTMSi19AyG/yHVeAvJPg6P7PmLW9syZpi6kgh6c5fyHWC
	 Djlc4tgt0OYko7MuFGUDEN4I5aKA96eB75wzWG9g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7080DF802E1;
	Tue,  7 Jul 2020 22:58:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A645CF802DB; Tue,  7 Jul 2020 22:58:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F81FF80264
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 22:57:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F81FF80264
IronPort-SDR: K7SeSaVKsul10/UFOREPt8LMWLnOhOEDJRPKlzr8urjoG6IvGy2co0sAwkxyIXB+6L1/kFl1jf
 pJASZ25VB2bA==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="146762920"
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="146762920"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 13:57:55 -0700
IronPort-SDR: 9/PH69B0olGdEMVy+2M6PN/DvU8BrGLkdmADvGIyv50g8FCtVUq1CEZc4Q6JvdyN5Sbb0mjuaQ
 F4kXvkcILf5Q==
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="305796653"
Received: from colvinch-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.229.3])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 13:57:54 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 5/6] ASoC: Intel: sof-sdw: add MAX98373 I2C dependencies
Date: Tue,  7 Jul 2020 15:57:39 -0500
Message-Id: <20200707205740.114927-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707205740.114927-1-pierre-louis.bossart@linux.intel.com>
References: <20200707205740.114927-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

Reflect Kconfig changes and add both SoundWire and I2C modes

Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 1032f6608045..d96fc1313434 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -565,6 +565,7 @@ config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
 	depends on SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES || COMPILE_TEST
 	depends on SOUNDWIRE
 	depends on SND_HDA_CODEC_HDMI && SND_SOC_SOF_HDA_AUDIO_CODEC
+	select SND_SOC_MAX98373_I2C
 	select SND_SOC_MAX98373_SDW
 	select SND_SOC_RT700_SDW
 	select SND_SOC_RT711_SDW
-- 
2.25.1

