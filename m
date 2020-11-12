Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 518042B11F7
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Nov 2020 23:43:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3CAA1834;
	Thu, 12 Nov 2020 23:42:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3CAA1834
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605220995;
	bh=qIBEM6Vy5b1RX3aRqq5k9bZAUofTYx1DqndQyt32jpU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hls7gZwkvIQ58eU6R+YsgbUYual5D1oI+9OJgTsmKPHL3+2n34ZQ3MxZJ1H0z2Lcx
	 PdDBLgQznC/HrFi5KW0UbS/ygHJdqncpmuj1M8fMZfKbAKHKW2zvobjqWWNRGtq+wU
	 0Ru2ycj3k6vfo4xsuQwlF9s0OTDkw5tsE6cSVmw4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F0E7F80506;
	Thu, 12 Nov 2020 23:39:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F202F804E6; Thu, 12 Nov 2020 23:39:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52064F804C1
 for <alsa-devel@alsa-project.org>; Thu, 12 Nov 2020 23:38:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52064F804C1
IronPort-SDR: AoH9C9N41ioMrxIISQFzjY6PnMCeMHd8pUsEquA4iQFo80rfRQNBuBwvF07U2vZkn2McfbIlNo
 tMou1AC+Lxzg==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="166885010"
X-IronPort-AV: E=Sophos;i="5.77,473,1596524400"; d="scan'208";a="166885010"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 14:38:58 -0800
IronPort-SDR: jO5oikXnzVVPAf7C56Yip07g1N0cUyNfMbX18u9poSDahCqkz2rDlfaSy14aDTFSJEPtIFYEyr
 7tIBPrIySCug==
X-IronPort-AV: E=Sophos;i="5.77,473,1596524400"; d="scan'208";a="323797493"
Received: from gjshield-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.213.180.118])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 14:38:57 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 09/14] ASoC: SOF: Intel: allow for coexistence between SOF and
 Atom/SST drivers
Date: Thu, 12 Nov 2020 16:38:20 -0600
Message-Id: <20201112223825.39765-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112223825.39765-1-pierre-louis.bossart@linux.intel.com>
References: <20201112223825.39765-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 tiwai@suse.de, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, broonie@kernel.org,
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

Now that we have all the support needed for coexistence between ACPI
drivers for Baytrail and Cherrytrail, remove mutual exclusion in the
Kconfig file. The selection is done by playing with the snd_intel_dsp
module parameter.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 sound/soc/sof/intel/Kconfig | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index b593b29789d5..59b35fa87e0e 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -61,17 +61,16 @@ if SND_SOC_SOF_INTEL_ACPI
 
 config SND_SOC_SOF_BAYTRAIL_SUPPORT
 	bool "SOF support for Baytrail, Braswell and Cherrytrail"
-	depends on SND_SST_ATOM_HIFI2_PLATFORM_ACPI=n
 	help
 	  This adds support for Sound Open Firmware for Intel(R) platforms
 	  using the Baytrail, Braswell or Cherrytrail processors.
-	  This option is mutually exclusive with the Atom/SST and Baytrail
-	  legacy drivers. If you want to enable SOF on Baytrail/Cherrytrail,
-	  you need to deselect those options first.
-	  SOF does not support Baytrail-CR for now, so this option is not
-	  recommended for distros. At some point all legacy drivers will be
-	  deprecated but not before all userspace firmware/topology/UCM files
-	  are made available to downstream distros.
+	  This option can coexist in the same build with the Atom legacy
+	  drivers, currently the default but which will be deprecated
+	  at some point.
+	  Existing firmware/topology binaries and UCM configurations
+	  typically located in the root file system are already
+	  compatible with both SOF or Atom/SST legacy drivers.
+	  This is a recommended option for distributions.
 	  Say Y if you want to enable SOF on Baytrail/Cherrytrail.
 	  If unsure select "N".
 
-- 
2.25.1

