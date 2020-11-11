Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E26732AFA99
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Nov 2020 22:39:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CB591703;
	Wed, 11 Nov 2020 22:38:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CB591703
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605130746;
	bh=TD/UVp6vdEfLW1A4DYS1Ojq76Zbi876FizWANtFAJrc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a6SPsIpgSxBxyGoS66ZIU9ihrACKo+c6XTzxbnEZERyS7CboyRU9YKyB4DhOhqNZS
	 qms6nkp+0XGnED3hZ6h8dWFlfzOYsN+arCfBZfbwd62DH3PEPvYUHCryJHMcP0EkMt
	 RHJ7ovbRXYNS1sDtVMWAhC6qfLqrgvfNyTdz9wt4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D368F804CA;
	Wed, 11 Nov 2020 22:36:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4AC6F8007E; Wed, 11 Nov 2020 22:36:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B8F0F80271
 for <alsa-devel@alsa-project.org>; Wed, 11 Nov 2020 22:35:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B8F0F80271
IronPort-SDR: IkM6p3k+rTp7lD435HH58CLiiAkjh1yrMMl3JfJADsNPOqXPpx53Y0wmahwv3j06+Gda4EjthG
 pG0zDzkPKhig==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="157237680"
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; d="scan'208";a="157237680"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2020 13:35:48 -0800
IronPort-SDR: uEzXAjUzqP4e2w0xNiiJMfii7hLWBY4ynmcMwE5KWo3obe5/qQpeeuiNfsNA4PPiudrbtmckTC
 tC3Q5KApA7gg==
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; d="scan'208";a="328266640"
Received: from cmurill1-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.130.147])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2020 13:35:48 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/4] ASoC: SOF: Intel: fix Kconfig dependency for
 SND_INTEL_DSP_CONFIG
Date: Wed, 11 Nov 2020 15:35:33 -0600
Message-Id: <20201111213533.149963-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201111213533.149963-1-pierre-louis.bossart@linux.intel.com>
References: <20201111213533.149963-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

SND_INTEL_DSP_CONFIG is selected by the HDaudio, Skylake and SOF
drivers. When the HDaudio link is not selected as a option, this
Kconfig option is not touched and will default to whatever other
drivers selected. In the case e.g. where HDaudio is compiled as
built-in, the linker will complain:

ld: sound/soc/sof/sof-pci-dev.o: in function `sof_pci_probe':
sof-pci-dev.c:(.text+0x5c): undefined reference to
`snd_intel_dsp_driver_probe'

Adding the select for all HDaudio platforms, regardless of whether
they rely on the HDaudio link or not, solves the problem.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Fixes: 82d9d54a6c0ee ('ALSA: hda: add Intel DSP configuration / probe code')
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 720dce5d7d1e..b607dba5fb2a 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -287,6 +287,7 @@ config SND_SOC_SOF_ALDERLAKE
 
 config SND_SOC_SOF_HDA_COMMON
 	tristate
+	select SND_INTEL_DSP_CONFIG
 	select SND_SOC_SOF_INTEL_COMMON
 	select SND_SOC_SOF_HDA_LINK_BASELINE
 	help
@@ -346,7 +347,6 @@ config SND_SOC_SOF_HDA
 	tristate
 	select SND_HDA_EXT_CORE if SND_SOC_SOF_HDA_LINK
 	select SND_SOC_HDAC_HDA if SND_SOC_SOF_HDA_AUDIO_CODEC
-	select SND_INTEL_DSP_CONFIG
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level.
-- 
2.25.1

