Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2035219190
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 22:34:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DCC71614;
	Wed,  8 Jul 2020 22:33:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DCC71614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594240463;
	bh=+hOpsbfrTXudDNfIM61Y13R32oxja+RlHrRIxA3MBYE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=elyUke5alMO+e5o0orvbubqRKzDT6nJNbsVi0vlg2bi0mIxORPOfr5DCWZj/CEbiL
	 d8cD3n8JURTlzZ4+jZ3khZKrNm6ahs6MeMa+PvApm9sJ4bYJBDRiv7y68qk5GuxZqc
	 uR+TF0YqMZpFLU14QFVdo5WRG94b9p0HzljjO8no=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7C98F80258;
	Wed,  8 Jul 2020 22:32:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 801A0F80161; Wed,  8 Jul 2020 22:32:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FB5BF80115
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 22:32:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FB5BF80115
IronPort-SDR: ZxAWfFcUHyII8J71yjDlHF56DNQShEmcc0WBjZy0pvT0GgM6EF1wElKh+vR83V35mzJb5XpybM
 qE0tlrUWJaxw==
X-IronPort-AV: E=McAfee;i="6000,8403,9676"; a="145386980"
X-IronPort-AV: E=Sophos;i="5.75,329,1589266800"; d="scan'208";a="145386980"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2020 13:32:27 -0700
IronPort-SDR: 2hdMYy5Nj/onI+EtrD2eL116cWHV3a+kHpn91V7qQnyOV1dvgN3YXTgKAfhklnE8EjPeX4+hH3
 Onc7XLKdAZjg==
X-IronPort-AV: E=Sophos;i="5.75,329,1589266800"; d="scan'208";a="323992687"
Received: from cculman-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.230.50])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2020 13:32:26 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 0/4] ASoC: codecs: add MAX98373 Soundwire driver
Date: Wed,  8 Jul 2020 15:32:11 -0500
Message-Id: <20200708203215.231776-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

V3:
Rebased on top of two fixes already merged from the v2 patchset - no
code changes
Added explicit commit reference in last commit message

V2 with a number of cleanups:
split between I2C and SoundWire modes, as done for rt5682, and updated
Kconfigs.
removed useless initializations common to both modes
removed idle_bias on
fixed register classified as volatile in error
fixed SPDX comments

Pierre-Louis Bossart (2):
  ASoC: codecs: max98373: split I2C and common parts
  ASoC: Intel: sof-sdw: add MAX98373 I2C dependencies

Ryan Lee (1):
  ASoC: codecs: max98373: add SoundWire support

randerwang (1):
  ASoC: Intel: sdw_max98373: add card_late_probe support

 sound/soc/codecs/Kconfig                  |  20 +-
 sound/soc/codecs/Makefile                 |   4 +
 sound/soc/codecs/max98373-i2c.c           | 612 +++++++++++++++
 sound/soc/codecs/max98373-sdw.c           | 887 ++++++++++++++++++++++
 sound/soc/codecs/max98373-sdw.h           |  72 ++
 sound/soc/codecs/max98373.c               | 611 +--------------
 sound/soc/codecs/max98373.h               |  17 +-
 sound/soc/intel/boards/Kconfig            |   7 +-
 sound/soc/intel/boards/sof_sdw.c          |  19 +-
 sound/soc/intel/boards/sof_sdw_common.h   |   6 +
 sound/soc/intel/boards/sof_sdw_max98373.c |  12 +
 11 files changed, 1668 insertions(+), 599 deletions(-)
 create mode 100644 sound/soc/codecs/max98373-i2c.c
 create mode 100644 sound/soc/codecs/max98373-sdw.c
 create mode 100644 sound/soc/codecs/max98373-sdw.h


base-commit: 6940701c715e193282cf8b31f970b2ea6eb26341
-- 
2.25.1

