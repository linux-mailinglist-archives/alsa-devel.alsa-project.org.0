Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4E05F0BE6
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Sep 2022 14:46:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E107168A;
	Fri, 30 Sep 2022 14:45:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E107168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664541983;
	bh=EX2qIUqVeS3t4+DvbVh8YCnJX4TlO/3l9v7ExfIKCfY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qF0erWJr6b+HuWapMTNdDLKs7I8Q6prm+AiwOZS4zI6rdPPJCRrsRoinRryNY8LII
	 zmAyl50qzeo+P3HUF0+0BqxzD7dOEkhvoGIyRm4CgxZKLei5WJ5rTkzea30IHc1faF
	 m0rl1ocU41UdMqAP7co6I3Fz4oQk4xTSxUpIBTi0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8752FF804AE;
	Fri, 30 Sep 2022 14:45:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FEAFF8032B; Fri, 30 Sep 2022 14:45:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 756DFF800AA
 for <alsa-devel@alsa-project.org>; Fri, 30 Sep 2022 14:45:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 756DFF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ZvnKYz65"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664541921; x=1696077921;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EX2qIUqVeS3t4+DvbVh8YCnJX4TlO/3l9v7ExfIKCfY=;
 b=ZvnKYz65W8qjZC4dz4T0t3Rh8mX2qPdkRcXZ/SCrhsu9l7tT4N9akzq3
 P9rEqxlPPF76cYKHSH+ojEw4YZTRaej5vasRWfKdziYN8Jo9knp6D5afB
 /tG9WQaWdPmQp7yVixGJErP+KVO7UsrDqXSHPiaq2v4Pd0olBlN/OJMEr
 oRpMui3tp70oR+4shrnSFvTMWnLJL7LsTYKtuOBAURZ/ikNeAYzFXRff6
 63GYIkOMkuclfei0wXIAh3Smb7StcLcZeS9//vUadSKI5mO4iMP7jn8Kj
 O1fRJuPNGnICkZzWki3Lr/U1wHG9J4WnYNEAjMRFIm9Q/eoAa57/hiB0n Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="303667487"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="303667487"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 05:44:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="748219002"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="748219002"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by orsmga004.jf.intel.com with ESMTP; 30 Sep 2022 05:44:53 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/2] ASoC: Intel: avs: Add support for max98927 codec
Date: Fri, 30 Sep 2022 14:45:36 +0200
Message-Id: <20220930124538.354992-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

This series adds machine board for max98927 codec present on some
Chromebook devices.

Amadeusz Sławiński (2):
  ASoC: Intel: avs: Add max98927 machine board
  ASoC: Intel: avs: Load max98927 on target platform

 sound/soc/intel/avs/board_selection.c |   8 +
 sound/soc/intel/avs/boards/Kconfig    |  10 ++
 sound/soc/intel/avs/boards/Makefile   |   2 +
 sound/soc/intel/avs/boards/max98927.c | 236 ++++++++++++++++++++++++++
 4 files changed, 256 insertions(+)
 create mode 100644 sound/soc/intel/avs/boards/max98927.c

-- 
2.25.1

