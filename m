Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDABE333171
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 23:18:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52A8A1746;
	Tue,  9 Mar 2021 23:17:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52A8A1746
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615328323;
	bh=OqzEe8HSFjtxccWWFM/3KGd/n8qHoFkXzTuxbOVmmxk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iXGM3RAn2Kpe7F+Uqf+c6Kvvay+n3hN2jGNFYWQ9RfJSdTRTbRqtX+BU0M/+Qig4M
	 CVAhm4iicy610wFTrniqcf3CNYv9XpKWHiJnSbpXnwbJpfyF5Z86mtZX9sJWTLdTI+
	 hnAUSNKM3xTnq7B/IMqI83AFCnP8jq6JZeW2JixM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC668F80256;
	Tue,  9 Mar 2021 23:17:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CAECF80227; Tue,  9 Mar 2021 23:17:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FE74F8014E
 for <alsa-devel@alsa-project.org>; Tue,  9 Mar 2021 23:17:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FE74F8014E
IronPort-SDR: J1NJ4530N2WYMRsr09yckvd4zAfaWBnrwS2TToAEk9biN/ksfSl0oWDBoiQwnBps4solwUyGDJ
 E6UOVSUdrgpQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="175439287"
X-IronPort-AV: E=Sophos;i="5.81,236,1610438400"; d="scan'208";a="175439287"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2021 14:16:56 -0800
IronPort-SDR: bXlYi7Lv3NGv7d6MUTxNSFoWX02dxQJzxOjRNhkcqpVcwEU8l6w7SU9rrcIn3XAU56Ws5k8M8g
 87rA6WbxH6SA==
X-IronPort-AV: E=Sophos;i="5.81,236,1610438400"; d="scan'208";a="437777498"
Received: from ckane-desk.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.251.135.181])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2021 14:16:54 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] ASoC: SOF: Intel: broadwell: fix mutual exclusion with
 catpt driver
Date: Tue,  9 Mar 2021 16:16:18 -0600
Message-Id: <20210309221618.246754-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 stable@vger.kernel.org, David Ward <david.ward@ll.mit.edu>, broonie@kernel.org
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

In v5.10, the "haswell" driver was replaced by the "catpt" driver, but
the mutual exclusion with the SOF driver was not updated. This leads
to errors with card names and UCM profiles not being loaded by
PulseAudio.

This fix should only be applied on v5.10-stable, the mutual exclusion
was removed in 5.11.

Reported-by: David Ward <david.ward@ll.mit.edu>
Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=211985
Fixes: 6cbfa11d2694 ("ASoC: Intel: Select catpt and deprecate haswell")
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Acked-by: Mark Brown <broonie@kernel.org>
Cc: <stable@vger.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sasha Levin <sashal@kernel.org>
---
v2: added Mark and Cezary tags, fixed stable address, added
maintainers

 sound/soc/sof/intel/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index de7ff2d097ab..6708a2c5a838 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -84,7 +84,7 @@ config SND_SOC_SOF_BAYTRAIL
 
 config SND_SOC_SOF_BROADWELL_SUPPORT
 	bool "SOF support for Broadwell"
-	depends on SND_SOC_INTEL_HASWELL=n
+	depends on SND_SOC_INTEL_CATPT=n
 	help
 	  This adds support for Sound Open Firmware for Intel(R) platforms
 	  using the Broadwell processors.
-- 
2.25.1

