Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EA975B77
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 01:42:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DB5E1F29;
	Fri, 26 Jul 2019 01:42:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DB5E1F29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564098171;
	bh=1izkGAYLD5l1zz0Z0eRpCN2bWBJVOktSXQSw7D1QrLc=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=b1AJtWORdsZFoWZqOy9BsQ+kqV1IlX4xE1mLZvrIodKgPgLEOhWDhViAUCZD8d3mK
	 4ap8PrHWKZBp55m4evA9YxgLKBsfIh53Q6FmL+SlyTbcvPTxx5e5lwBRydBDGozEA/
	 pXe5jVoIMDGUPSexy/jCkv7C7r/rYZFI4oprUyY0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3C1AF80448;
	Fri, 26 Jul 2019 01:41:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1734EF803D0; Fri, 26 Jul 2019 01:41:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 569BFF800E8
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 01:41:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 569BFF800E8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Jul 2019 16:40:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,308,1559545200"; d="scan'208";a="369874625"
Received: from amrutaku-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.255.230.75])
 by fmsmga006.fm.intel.com with ESMTP; 25 Jul 2019 16:40:56 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 25 Jul 2019 18:39:52 -0500
Message-Id: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com
Subject: [alsa-devel] [RFC PATCH 00/40] soundwire: updates for 5.4
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

The existing upstream code allows for SoundWire devices to be
enumerated and managed by the bus, but streaming is not currently
supported.

Bard Liao, Rander Wang and I did quite a bit of integration/validation
work to close this gap and we now have SoundWire streaming + basic
power managemement on Intel CometLake and IceLake reference
boards. These changes are still preliminary and should not be merged
as is, but it's time to start reviews. While the number of patches is
quite large, each of the changes is quite small.

SOF driver changes will be submitted shortly as well but are still
being validated.

ClockStop modes and synchronized playback on
multiple links are not supported for now and will likely be part of
the next cycle (dependencies on codec drivers and multi-cpu DAI
support).

Acknowledgements: This work would not have been possible without the
support of Slawomir Blauciak and Tomasz Lauda on the SOF side,
currently being reviewed, see
https://github.com/thesofproject/sof/pull/1638

Comments and feedback welcome!

Bard liao (1):
  soundwire: include mod_devicetable.h to avoid compiling warnings

Pierre-Louis Bossart (38):
  soundwire: add debugfs support
  soundwire: cadence_master: add debugfs register dump
  soundwire: cadence_master: align debugfs to 8 digits
  soundwire: intel: add debugfs register dump
  soundwire: intel: move interrupt enable after interrupt handler
    registration
  soundwire: intel: prevent possible dereference in hw_params
  soundwire: intel: fix channel number reported by hardware
  soundwire: intel: remove BIOS work-arounds
  soundwire: cadence_master: fix usage of CONFIG_UPDATE
  soundwire: cadence_master: remove useless wrapper
  soundwire: cadence_master: simplify bus clash interrupt clear
  soundwire: cadence_master: revisit interrupt settings
  soundwire: cadence_master: fix register definition for SLAVE_STATE
  soundwire: cadence_master: fix definitions for INTSTAT0/1
  soundwire: cadence_master: handle multiple status reports per Slave
  soundwire: cadence_master: improve startup sequence with link hw_reset
  soundwire: bus: use runtime_pm_get_sync/pm when enabled
  soundwire: bus: split handling of Device0 events
  soundwire: bus: improve dynamic debug comments for enumeration
  soundwire: prototypes for suspend/resume
  soundwire: export helpers to find row and column values
  soundwire: stream: fix disable sequence
  soundwire: cadence_master: use BIOS defaults for frame shape
  soundwire: intel: use BIOS information to set clock dividers
  soundwire: Add Intel resource management algorithm
  soundwire: intel: handle disabled links
  soundwire: intel_init: add kernel module parameter to filter out links
  soundwire: cadence_master: add kernel parameter to override interrupt
    mask
  soundwire: intel: move shutdown() callback and don't export symbol
  soundwire: intel: add helper for initialization
  soundwire: intel: Add basic power management support
  soundwire: intel: ignore disabled links for suspend/resume
  soundwire: intel: export helper to exit reset
  soundwire: intel: disable interrupts on suspend
  soundwire: cadence_master: add hw_reset capability in debugfs
  soundwire: cadence_master: make clock stop exit configurable on init
  soundwire: intel: add pm_runtime support
  soundwire: intel: add delay on restart for enumeration

Rander Wang (1):
  soundwire: cadence_master: fix divider setting in clock register

 drivers/soundwire/Makefile                  |   4 +-
 drivers/soundwire/algo_dynamic_allocation.c | 403 ++++++++++++++++++++
 drivers/soundwire/bus.c                     |  44 ++-
 drivers/soundwire/bus.h                     |  77 +++-
 drivers/soundwire/bus_type.c                |   3 +
 drivers/soundwire/cadence_master.c          | 365 ++++++++++++++----
 drivers/soundwire/cadence_master.h          |  12 +-
 drivers/soundwire/debugfs.c                 | 156 ++++++++
 drivers/soundwire/intel.c                   | 381 +++++++++++++++++-
 drivers/soundwire/intel_init.c              |  14 +
 drivers/soundwire/slave.c                   |   1 +
 drivers/soundwire/stream.c                  |  53 ++-
 include/linux/soundwire/sdw.h               |  15 +
 13 files changed, 1414 insertions(+), 114 deletions(-)
 create mode 100644 drivers/soundwire/algo_dynamic_allocation.c
 create mode 100644 drivers/soundwire/debugfs.c

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
