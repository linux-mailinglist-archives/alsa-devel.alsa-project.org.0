Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FECDEC809
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Nov 2019 18:39:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16A9623B7;
	Fri,  1 Nov 2019 18:38:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16A9623B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572629980;
	bh=QeZIB3GGxiX1eBuGNUeak3KQrjArdd6AINd64OMkm+E=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RBFZm9P8/+foxxORl58FWVj5Kc5BWGhG1aVTvc3wu9Wr270MWM9K2sNKUs5jfBYY4
	 iQU5jUcfBO7z28KfEUfxtY4IG3iuvRdm4ElS9D/ZaG2YJs4QPEKB0rZTo5FUB1IXeA
	 DN1zk2vdpHzMuHA8wvDZWm7rVA2YqxWWWYEPLNQI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFE58F806F0;
	Fri,  1 Nov 2019 18:31:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 297DDF80635; Fri,  1 Nov 2019 18:31:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 224CFF8044A
 for <alsa-devel@alsa-project.org>; Fri,  1 Nov 2019 18:31:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 224CFF8044A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Nov 2019 10:31:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,256,1569308400"; d="scan'208";a="206457437"
Received: from ggarreto-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.92.243])
 by FMSMGA003.fm.intel.com with ESMTP; 01 Nov 2019 10:31:00 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri,  1 Nov 2019 12:30:44 -0500
Message-Id: <20191101173045.27099-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191101173045.27099-1-pierre-louis.bossart@linux.intel.com>
References: <20191101173045.27099-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 10/11] ASoC: Intel: boards: Geminilake is only
	supported by SOF
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

Geminilake machine drivers are only tested and recommended with SOF.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 826694ecfdbf..76d1e6ab30b5 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -367,7 +367,7 @@ config SND_SOC_INTEL_KBL_RT5660_MACH
 
 endif ## SND_SOC_INTEL_KBL
 
-if SND_SOC_INTEL_GLK || (SND_SOC_SOF_GEMINILAKE  && SND_SOC_SOF_HDA_LINK)
+if SND_SOC_SOF_GEMINILAKE  && SND_SOC_SOF_HDA_LINK
 
 config SND_SOC_INTEL_GLK_DA7219_MAX98357A_MACH
 	tristate "GLK with DA7219 and MAX98357A in I2S Mode"
@@ -394,7 +394,7 @@ config SND_SOC_INTEL_GLK_RT5682_MAX98357A_MACH
 	   Say Y if you have such a device.
 	   If unsure select "N".
 
-endif ## SND_SOC_INTEL_GLK || (SND_SOC_SOF_GEMINILAKE  && SND_SOC_SOF_HDA_LINK)
+endif ## SND_SOC_SOF_GEMINILAKE  && SND_SOC_SOF_HDA_LINK
 
 if SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC || SND_SOC_SOF_HDA_AUDIO_CODEC
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
