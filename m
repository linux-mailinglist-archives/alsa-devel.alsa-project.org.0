Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BCE2492AB
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Aug 2020 04:02:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE60717DD;
	Wed, 19 Aug 2020 04:01:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE60717DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597802564;
	bh=0WgFZde4M9HYlTW0oZII/amE5TXqOwjn3R4Y/yUzqq0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=U7oT2v5EN/59I/Sn1r7KQMShP9m1A3P6fuNAqsqLPhzQP+foOkjKdT7AVdt7E42p2
	 CQd/zMhTPVxd/3BYi7Yo/fRQ9CJBrCtSpYFLDcEZmz2RH75Vu9cefTJjq5PfTlLW9z
	 QwqOSUNRlbXf99PqzNve2Fo7UpB8hdkW62XPxaVg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E15C1F80260;
	Wed, 19 Aug 2020 04:01:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7A5FF8025A; Wed, 19 Aug 2020 04:00:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FB45F8011C
 for <alsa-devel@alsa-project.org>; Wed, 19 Aug 2020 04:00:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FB45F8011C
IronPort-SDR: /w2FHpe1TQYDSwTopSWTXmWgcLEym6fALQysvK1xxOaSEaNeV76zkD0z8Z4OgUuZasmH1lg1Gd
 bE1vKGfQEBeg==
X-IronPort-AV: E=McAfee;i="6000,8403,9717"; a="239865507"
X-IronPort-AV: E=Sophos;i="5.76,329,1592895600"; d="scan'208";a="239865507"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 19:00:44 -0700
IronPort-SDR: RLty5/QthTzwkF3aCEloHkasj0GujUwB9QSiNGYW6ZnfDcs1KPXOzKe/jSJ7h+/bVLo9KHPlDs
 PB9tljYg4eSg==
X-IronPort-AV: E=Sophos;i="5.76,329,1592895600"; d="scan'208";a="279565023"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 19:00:40 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 0/7] soundwire: filter out invalid PARITY errors
Date: Tue, 18 Aug 2020 22:06:49 +0800
Message-Id: <20200818140656.29014-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

Some codecs may report fake PARITY errors in the initial state. This
series will filter them out.

Pierre-Louis Bossart (7):
  soundwire: bus: use property to set interrupt masks
  soundwire: bus: filter-out unwanted interrupt reports
  soundwire: slave: add first_interrupt_done status
  soundwire: bus: use quirk to filter out invalid parity errors
  ASoC: codecs: realtek-soundwire: ignore initial PARITY errors
  soundwire: bus: export broadcast read/write capability for tests
  soundwire: cadence: add parity error injection through debugfs

 drivers/soundwire/bus.c            | 93 ++++++++++++++++++++++++------
 drivers/soundwire/bus.h            |  4 ++
 drivers/soundwire/cadence_master.c | 86 +++++++++++++++++++++++++++
 drivers/soundwire/slave.c          |  1 +
 include/linux/soundwire/sdw.h      |  9 +++
 sound/soc/codecs/max98373-sdw.c    |  3 +
 sound/soc/codecs/rt1308-sdw.c      |  3 +
 sound/soc/codecs/rt5682-sdw.c      |  5 ++
 sound/soc/codecs/rt700-sdw.c       |  5 ++
 sound/soc/codecs/rt711-sdw.c       |  5 ++
 sound/soc/codecs/rt715-sdw.c       |  5 ++
 sound/soc/codecs/wsa881x.c         |  1 +
 12 files changed, 202 insertions(+), 18 deletions(-)

-- 
2.17.1

