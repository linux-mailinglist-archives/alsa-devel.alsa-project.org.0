Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEEE1D8F46
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 07:40:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56BB117C9;
	Tue, 19 May 2020 07:39:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56BB117C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589866813;
	bh=gduQhM5jnPbYFPT1uRsw9d+e5CCxciFv0QdSt4sz0k4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZfEQaOhQSmrydaezPvHn9y3sw9zhzGOhHFUgnSRvi+MI773ZxwY1sTOZtggmqqZGP
	 b7P78Lyh2X8OuI33MgxV75cTWOdJSgrLaxjA0mdaFcUvnT2GvJgqhtsGZ53/ef9yhi
	 oAnxATSdjXzvwkrf/DF5z/C0j/M7RWJt91caefno=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53AF0F80259;
	Tue, 19 May 2020 07:38:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C333DF801A3; Tue, 19 May 2020 07:38:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C01D4F80110
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 07:38:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C01D4F80110
IronPort-SDR: AiUtRbyGF3zizctbSe/mb/YH2L3yCxf15mxa/ycYgQDethOhzlyfmo+pZ5Psk/m//Rjqr5N+ii
 azLW7dKHfE7g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2020 22:38:06 -0700
IronPort-SDR: N+3DXfa7REA6Lxc8dVmdsiyma4Gf3XTYenGfx9UEfzHaqG5TFpRRL6oIQAIpeo88DQb6QnqFL/
 dUwQJieYZcKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,409,1583222400"; d="scan'208";a="288836499"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga004.fm.intel.com with ESMTP; 18 May 2020 22:38:02 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 0/5] soundwire: bus_type: add sdw_master_device support
Date: Tue, 19 May 2020 01:43:17 +0800
Message-Id: <20200518174322.31561-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 slawomir.blauciak@intel.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

This series adds sdw master devices support.

changes in v2:
 - Allocate sdw_master_device dynamically
 - Use unique bus id as master id
 - Keep checking parent devices
 - Enable runtime_pm on Master device

Bard Liao (2):
  soundwire: bus: add unique bus id
  soundwire: master: add runtime pm support

Pierre-Louis Bossart (3):
  soundwire: bus: rename sdw_bus_master_add/delete, add arguments
  soundwire: bus_type: introduce sdw_slave_type and sdw_master_type
  soundwire: bus_type: add sdw_master_device support

 .../driver-api/soundwire/summary.rst          |  7 +-
 drivers/soundwire/Makefile                    |  2 +-
 drivers/soundwire/bus.c                       | 47 ++++++++--
 drivers/soundwire/bus.h                       |  3 +
 drivers/soundwire/bus_type.c                  | 19 ++--
 drivers/soundwire/intel.c                     |  9 +-
 drivers/soundwire/master.c                    | 88 +++++++++++++++++++
 drivers/soundwire/qcom.c                      |  7 +-
 drivers/soundwire/slave.c                     |  8 +-
 include/linux/soundwire/sdw.h                 | 24 ++++-
 include/linux/soundwire/sdw_type.h            |  9 +-
 11 files changed, 191 insertions(+), 32 deletions(-)
 create mode 100644 drivers/soundwire/master.c

-- 
2.17.1

