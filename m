Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49508624F95
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 02:30:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBAAA1660;
	Fri, 11 Nov 2022 02:30:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBAAA1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668130252;
	bh=2pur3i1m7TU4lByzoWZ7E5DjI09dYrh2ZHxi79WNNow=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O721X3TI4IXdeMabq9eH3Z8D6s2hX8xxgfSaBSc9Bhh6ii6WNuX/lRh1pjRdLg4lA
	 f9ko/WIoyOg/aeaXSo5bb3V/tkhT3kAx6JA2c/D6d0dHhAzh2zzWNvnHoEohu7/d5t
	 3Fi5enIE9EptJ8xlO3cXp+Gyq4kQyj46O7q/9eP0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F673F802E8;
	Fri, 11 Nov 2022 02:29:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C1BCF8032B; Fri, 11 Nov 2022 02:29:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AA81F80104
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 02:29:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AA81F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="KVApygkv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668130192; x=1699666192;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2pur3i1m7TU4lByzoWZ7E5DjI09dYrh2ZHxi79WNNow=;
 b=KVApygkvj6i7fisNN4rg7ntelt7/LI5LIbLarGZw07gbq/bFXow0Sx8J
 49dZ6PB81/eRTT6g1j1vF5Y8QcYi9Bm1OyaPHTyhMxBx3Uj3gJAG5dkvl
 Y37BY/hhfY4lkk7OHInazHL3hANCPBBd2qHFqmjEAQUY8G8sm5li28FG6
 qMxyVw76Fvv6FJo8aDhGIHzs9Ru9UhIgxV25RUMJyHFRf4UT/KcXP3nYE
 EWOBqsiMWVhINWDdLloZGdSIoYQK5738S4LXRj1RtaznV/45M3Hx9uJoe
 7HTx/oiK1EeR/0VWJQrhq2zNwD1c2JnPUTeWR1ceSSpHucQjkTITn1W2b Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="397789708"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="397789708"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 17:29:47 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="780003212"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="780003212"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 17:29:45 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 0/7] soundwire: intel: introduce hw_ops and move auxdevice
 handling to dedicated file
Date: Fri, 11 Nov 2022 09:31:27 +0800
Message-Id: <20221111013135.38289-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org,
 bard.liao@intel.com, linux-kernel@vger.kernel.org
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

This series adds yet another set of cleanups
a) all the helpers are now exposed as hw_ops callbacks
b) the auxiliary device code is now completely generic.

This will allow for easier introduction of new hw_ops implementations in
the future without throwing away all the goodness of the auxiliary device
handling. Since there will be a tighter coupling with HDaudio, it's likely
that future hw_ops are implemented in the SOF driver directly.

Pierre-Louis Bossart (7):
  soundwire: intel: start using hw_ops
  soundwire: intel: add debugfs callbacks in hw_ops
  soundwire: intel: add register_dai callback in hw_ops
  soundwire: intel: add bus management callbacks in hw_ops
  soundwire: intel: add link power management callbacks in hw_ops
  soundwire: intel: add in-band wake callbacks in hw_ops
  soundwire: intel: split auxdevice to different file

 drivers/soundwire/Makefile          |   2 +-
 drivers/soundwire/intel.c           | 658 +--------------------------
 drivers/soundwire/intel.h           |  96 +++-
 drivers/soundwire/intel_auxdevice.c | 678 ++++++++++++++++++++++++++++
 drivers/soundwire/intel_auxdevice.h |  18 +
 drivers/soundwire/intel_init.c      |   2 +
 include/linux/soundwire/sdw_intel.h |  44 ++
 sound/soc/sof/intel/hda.c           |   2 +
 8 files changed, 853 insertions(+), 647 deletions(-)
 create mode 100644 drivers/soundwire/intel_auxdevice.c
 create mode 100644 drivers/soundwire/intel_auxdevice.h

-- 
2.25.1

