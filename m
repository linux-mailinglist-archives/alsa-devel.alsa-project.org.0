Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4173EAD52
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Aug 2021 00:46:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 691011922;
	Fri, 13 Aug 2021 00:45:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 691011922
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628808407;
	bh=dBmfEBdkmgI5YiU834wTlN8vA7Nl+onbL+0tBmjjxok=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YbN66mRmfIUl/QYrhQp0/3sPN8PqcNvDP6bAsva5w1NS3PPNnU9Y6c/kyuXTIqYpv
	 ZhD+jLR80jCEMFn8/sV0HEasDKIDzfbsU3UilKLS10iFp8AHjlpijJw3hOsS2Cvhvy
	 cWFdGIGhHx4jQCrzRFCezy7oaAMDvRgLxbd+F0p8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E25A8F804DA;
	Fri, 13 Aug 2021 00:45:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93902F802A0; Fri, 13 Aug 2021 00:45:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 327D4F800AF
 for <alsa-devel@alsa-project.org>; Fri, 13 Aug 2021 00:45:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 327D4F800AF
X-IronPort-AV: E=McAfee;i="6200,9189,10074"; a="212349749"
X-IronPort-AV: E=Sophos;i="5.84,317,1620716400"; d="scan'208";a="212349749"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2021 15:45:08 -0700
X-IronPort-AV: E=Sophos;i="5.84,317,1620716400"; d="scan'208";a="517647183"
Received: from evanklei-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.77.110])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2021 15:45:07 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 0/8] ASoC: Intel: boards: use software node API
Date: Thu, 12 Aug 2021 17:44:35 -0500
Message-Id: <20210812224443.170144-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, broonie@kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

This is an update on an earlier contribution from Heikki Krogerus

The function device_add_properties() is going to be removed.
Replacing it with software node API equivalents.

Thanks for Hans de Goede and Andy Shevchenko for their comments,
suggestions and Reviewed-by tags on GitHub. The review thread can be
found at https://github.com/thesofproject/linux/pull/3041)

v2 changes: feedback from Andy and Hans
Better error handling
Codec reference is kept until the .remove callback
Remove bus search to find device

v1 changes from Heikki's patches:
Avoid the use of devm_ routines for Baytrail machine drivers.

Heikki Krogerus (1):
  ASoC: Intel: boards: use software node API in Atom boards

Pierre-Louis Bossart (7):
  ASoC: Intel: boards: harden codec property handling
  ASoC: Intel: boards: handle errors with acpi_dev_get_first_match_dev()
  ASoC: Intel: boards: get codec device with ACPI instead of bus search
  ASoC: Intel: sof_sdw: pass card information to init/exit functions
  ASoC: Intel: sof_sdw_rt711*: keep codec device reference until remove
  ASoC: Intel: use software node API in SoundWire machines
  ASoC: Intel: remove device_properties for Atom boards

 sound/soc/intel/boards/bytcht_es8316.c      | 31 ++++++++--
 sound/soc/intel/boards/bytcr_rt5640.c       | 57 ++++++++++++++-----
 sound/soc/intel/boards/bytcr_rt5651.c       | 63 ++++++++++++++-------
 sound/soc/intel/boards/sof_sdw.c            | 20 ++++---
 sound/soc/intel/boards/sof_sdw_common.h     | 37 +++++++-----
 sound/soc/intel/boards/sof_sdw_max98373.c   |  3 +-
 sound/soc/intel/boards/sof_sdw_rt1308.c     |  3 +-
 sound/soc/intel/boards/sof_sdw_rt1316.c     |  3 +-
 sound/soc/intel/boards/sof_sdw_rt5682.c     |  3 +-
 sound/soc/intel/boards/sof_sdw_rt700.c      |  3 +-
 sound/soc/intel/boards/sof_sdw_rt711.c      | 51 +++++++++--------
 sound/soc/intel/boards/sof_sdw_rt711_sdca.c | 52 +++++++++--------
 sound/soc/intel/boards/sof_sdw_rt715.c      |  3 +-
 sound/soc/intel/boards/sof_sdw_rt715_sdca.c |  3 +-
 14 files changed, 221 insertions(+), 111 deletions(-)

-- 
2.25.1

