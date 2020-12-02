Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 206C62CCCAB
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Dec 2020 03:32:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD7041809;
	Thu,  3 Dec 2020 03:32:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD7041809
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606962778;
	bh=cTw3IxuyLvx2XKAitKvd4KbsODYSWWOiRRRXbgRGATk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uE0VVsa4yQ3ywP/niGYWIeuYuiJYSuoi6VlrHGq/QdGUPVPi641gNDvxNKPkobhtS
	 F+BzvkrocW7RlPnffY7bo0ZxhG1oEY3fslu7L9uM3A8ndzAjH8KX5QcFhOEXQnOxa1
	 GSPI+BWBBYwQOHq4qU7nKsbnAiGuuoGU5uhw80xM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20A01F80276;
	Thu,  3 Dec 2020 03:31:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DDC2F80082; Thu,  3 Dec 2020 03:31:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 RCVD_IN_MSPIKE_H4, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C3CAF80082
 for <alsa-devel@alsa-project.org>; Thu,  3 Dec 2020 03:31:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C3CAF80082
IronPort-SDR: AN6PiEM7lxZ0BLPybwClOurJ1nUJXSyaccbHZbNHussT0nPsku6zW0vLBdvG3f6HliCmGN5MEe
 hEisCMpFOp7A==
X-IronPort-AV: E=McAfee;i="6000,8403,9823"; a="234727985"
X-IronPort-AV: E=Sophos;i="5.78,388,1599548400"; d="scan'208";a="234727985"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2020 18:31:14 -0800
IronPort-SDR: VJ5tar6iZuhqncjZdDQBJCdMbQFS3tUleR2Q6QOK41uE0eaZQlE0HzDLwJKP/uK8icB9VuubqQ
 v1qgEN7bwmPw==
X-IronPort-AV: E=Sophos;i="5.78,388,1599548400"; d="scan'208";a="539931607"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2020 18:31:12 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 0/4] ASoC/SoundWire: add Realtek SoundWire SDCA codec
Date: Wed,  2 Dec 2020 22:38:41 +0800
Message-Id: <20201202143845.18697-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: vkoul@kernel.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
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

Add Realtek rt1316 and rt711-sdca vender-specific drivers plus some
fixup for rt715-sdca driver.

Jack Yu (2):
  ASoC/SoundWire: rt715-sdca: use rt715_sdca prefix for symbols
  ASoC/SoundWire: rt715-sdca: merge mute/volume operations

Shuming Fan (2):
  ASoC/SoundWire: rt1316: Add RT1316 SDCA vendor-specific driver
  ASoC/SoundWire: rt711-sdca: Add RT711 SDCA vendor-specific driver

 sound/soc/codecs/Kconfig          |   13 +
 sound/soc/codecs/Makefile         |    4 +
 sound/soc/codecs/rt1316-sdw.c     |  756 +++++++++++++++
 sound/soc/codecs/rt1316-sdw.h     |  115 +++
 sound/soc/codecs/rt711-sdca-sdw.c |  424 +++++++++
 sound/soc/codecs/rt711-sdca-sdw.h |  101 ++
 sound/soc/codecs/rt711-sdca.c     | 1482 +++++++++++++++++++++++++++++
 sound/soc/codecs/rt711-sdca.h     |  246 +++++
 sound/soc/codecs/rt715-sdca-sdw.c |   12 +-
 sound/soc/codecs/rt715-sdca.c     |  323 ++++---
 sound/soc/codecs/rt715-sdca.h     |    4 +-
 11 files changed, 3316 insertions(+), 164 deletions(-)
 create mode 100644 sound/soc/codecs/rt1316-sdw.c
 create mode 100644 sound/soc/codecs/rt1316-sdw.h
 create mode 100644 sound/soc/codecs/rt711-sdca-sdw.c
 create mode 100644 sound/soc/codecs/rt711-sdca-sdw.h
 create mode 100644 sound/soc/codecs/rt711-sdca.c
 create mode 100644 sound/soc/codecs/rt711-sdca.h

-- 
2.17.1

