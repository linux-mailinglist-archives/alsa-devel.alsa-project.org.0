Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0DD74EFC5
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 15:02:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2C51DF8;
	Tue, 11 Jul 2023 15:01:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2C51DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689080526;
	bh=zk2sNO05UAbs2nuTw7unuMIHhKz7EsY9TKiKaOgRRPU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Zs5pI5YbVcPGDyfQTbogMl+eeo4ZCW0GSw0GIBV7KiJ/aiMDm9d4yWOhpGXEWaeOw
	 PfWHkcs0LuyNnLq64RCWBYdNi787LJxDMdhdnOaZP5RXuvFlztWLWczj+gVXcTDhXX
	 bxmhp5lROwdmGFzoxsUACOylWFUVP1oBBz8YhwAY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E7E4F805A0; Tue, 11 Jul 2023 14:59:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AB79F8057A;
	Tue, 11 Jul 2023 14:59:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5678F8027B; Tue, 11 Jul 2023 14:59:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8041FF800E4
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 14:57:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8041FF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JWy2RaB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689080245; x=1720616245;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zk2sNO05UAbs2nuTw7unuMIHhKz7EsY9TKiKaOgRRPU=;
  b=JWy2RaB9AjC9XLvcQAUDUSCpL1pWI6icK4rzPy8XREIKwCIOaOhWxYag
   h+RTa2n2Ned6qYxzhmzW/X6F3WyzV+lTXhGsziNSkL/loDUb6NFkbfAkY
   jWtXOmZlDuL7tXjhC+C+RMiJ3tYPvhiBoIsDPuMw31Zdz2RJt48MRVicX
   /Ebri8J0haxxlojnOJgfkjFgpC14yVJlaFmX07O6DC9Das2gdTsQwyPKD
   q07YH5gqs0hVF7xi6YJL8W7xMECP8sU30mW/DKV92lLfEFtx1NUk/WjY/
   ZMuFEpRO/T0eYwW0SQaGV4RwoV1sYN3Bil3E1oXYon8Y/VM4ADdP7/vMA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="367187446"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="367187446"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 05:57:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="834666632"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="834666632"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga002.fm.intel.com with ESMTP; 11 Jul 2023 05:57:21 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 06/13] ASoC: Intel: Skylake: Use global PCI match macro
Date: Tue, 11 Jul 2023 14:57:19 +0200
Message-Id: <20230711125726.3509391-7-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230711125726.3509391-1-amadeuszx.slawinski@linux.intel.com>
References: <20230711125726.3509391-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EV2IAYFMTED4PIWHOCACAZ62OAJ4ODUG
X-Message-ID-Hash: EV2IAYFMTED4PIWHOCACAZ62OAJ4ODUG
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EV2IAYFMTED4PIWHOCACAZ62OAJ4ODUG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Instead of using local macro to match PCI device, use global one.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 include/sound/hda_codec.h         | 3 ---
 sound/soc/intel/skylake/skl-pcm.c | 3 ++-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
index bbb7805e85d8..5497dc9c396a 100644
--- a/include/sound/hda_codec.h
+++ b/include/sound/hda_codec.h
@@ -18,9 +18,6 @@
 #include <sound/hda_verbs.h>
 #include <sound/hda_regmap.h>
 
-#define IS_BXT(pci) ((pci)->vendor == 0x8086 && (pci)->device == 0x5a98)
-#define IS_CFL(pci) ((pci)->vendor == 0x8086 && (pci)->device == 0xa348)
-
 /*
  * Structures
  */
diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
index a4209d88b0c6..ac3dc8c63c26 100644
--- a/sound/soc/intel/skylake/skl-pcm.c
+++ b/sound/soc/intel/skylake/skl-pcm.c
@@ -13,6 +13,7 @@
 #include <linux/pci.h>
 #include <linux/pm_runtime.h>
 #include <linux/delay.h>
+#include <sound/hdaudio.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include "skl.h"
@@ -152,7 +153,7 @@ int skl_pcm_host_dma_prepare(struct device *dev, struct skl_pipe_params *params)
 	 * The recommended SDxFMT programming sequence for BXT
 	 * platforms is to couple the stream before writing the format
 	 */
-	if (IS_BXT(skl->pci)) {
+	if (HDA_CONTROLLER_IS_APL(skl->pci)) {
 		snd_hdac_ext_stream_decouple(bus, stream, false);
 		err = snd_hdac_stream_setup(hdac_stream(stream));
 		snd_hdac_ext_stream_decouple(bus, stream, true);
-- 
2.34.1

