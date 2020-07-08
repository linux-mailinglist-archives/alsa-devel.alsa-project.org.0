Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5141D219197
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 22:36:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 003EE1658;
	Wed,  8 Jul 2020 22:35:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 003EE1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594240569;
	bh=LWOGiRvycLejGk24R6hgN8mQ4wWvpRvtQAgyuFVHubI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jaUXLjhgFYII8gt2MQEt1HAHmQsYb5ozhXL9E+WquWtxYclMDxR8VBG67gCz92eIy
	 9KjQKfSrzPiSMZDfw9RVEiAJEZK4nYHVXpO3yQhYym+SfHBupdTG4AtjYwkPGqZFG0
	 CCUc2nBG3FDdNXGqZ7VPpGII9R4w+E6PHSrLopd0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8780F802E0;
	Wed,  8 Jul 2020 22:32:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F15B1F802BC; Wed,  8 Jul 2020 22:32:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BE41F8015A
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 22:32:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BE41F8015A
IronPort-SDR: jE/QhGmS5tgh+MkSMDHAkB+gXBGAhu2v5DrH+QaAuTMm5rutInnisTZ3EzB7kNLIvMmTJrM5Jk
 2EvCbyCUvnfA==
X-IronPort-AV: E=McAfee;i="6000,8403,9676"; a="145386991"
X-IronPort-AV: E=Sophos;i="5.75,329,1589266800"; d="scan'208";a="145386991"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2020 13:32:29 -0700
IronPort-SDR: EGROmA1QnXN3QqyXzC93VE/3rO7I5q8qb8WW7cRRcu6WWNFB4wKnZXcfIyECTGaZXqxeDjL95z
 SuF1TArjE+EQ==
X-IronPort-AV: E=Sophos;i="5.75,329,1589266800"; d="scan'208";a="323992701"
Received: from cculman-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.230.50])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2020 13:32:28 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 3/4] ASoC: Intel: sof-sdw: add MAX98373 I2C dependencies
Date: Wed,  8 Jul 2020 15:32:14 -0500
Message-Id: <20200708203215.231776-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200708203215.231776-1-pierre-louis.bossart@linux.intel.com>
References: <20200708203215.231776-1-pierre-louis.bossart@linux.intel.com>
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

