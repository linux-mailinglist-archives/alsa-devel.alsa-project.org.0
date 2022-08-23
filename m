Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE5459D036
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 06:47:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C03D41660;
	Tue, 23 Aug 2022 06:46:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C03D41660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661230069;
	bh=1hk3vPLt5LF/hGQ/U9Opw9PivdsoVIeWfL5vgv/ftqY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Sc5s+dK4HGQ/4W2DqxNvF5l/iekbthpIWOJLKbY6nhpz5/NAroBVdBViIw6j84GQY
	 xX+tc0SqFFC2l/Pht66yfPkxmWDY0XaXaJ96qwzTiIsxiBwesxEXu9jzw1zdHdiDLf
	 OXBhVDg5E8s0zFxO98PvpnzlX961+x5EB8FD3nh0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49CF6F804E6;
	Tue, 23 Aug 2022 06:46:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94B06F8027B; Tue, 23 Aug 2022 06:46:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E042F800C9
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 06:46:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E042F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ci6lOk/u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661230005; x=1692766005;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1hk3vPLt5LF/hGQ/U9Opw9PivdsoVIeWfL5vgv/ftqY=;
 b=ci6lOk/uPD8DCJQoPZEegWHmIojgV84ytHPA3fxjTl4ObEDFwMlqT4uY
 hCO34ThgCf5+oLurBdGDEHi7sTGAMPJcr+pUa+YnT95hybiORWvzOO7wX
 GSTDiBUkStc0anJvpb80/kMNQL/NHCBLHasPbw+SlHhcsQNrbjZVhiFvi
 xTB/+TiIWsGxYabVBT/DnsufJL5N69bWov3V9j2gNejsL3h2YaRpOhWsJ
 JjnWr6mxyczqzkbAu7VPVPQNAnhb6g1HXpl3TRTopHXGlKyq3FCJ5mwwy
 vsOlWxITGzvnsKWMB1YK91wTm3WkrpYV0JNvx6b8CzkQv3KaV4ThmKfxS A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="319629716"
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; d="scan'208";a="319629716"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 21:46:14 -0700
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; d="scan'208";a="669855088"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 21:46:13 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 0/3] soundwire: allocate device_number with IDA
Date: Tue, 23 Aug 2022 12:50:01 +0800
Message-Id: <20220823045004.2670658-1-yung-chuan.liao@linux.intel.com>
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

The device_number is currently allocated in the scope of each bus and does
not need to be unique at the system level.
This leads e.g. on Dell devices with three or four Device1 on different
bus segments. To make the device_number unique at the system level, and
unified with the HDaudio/iDISP SDI values, this series allocates the
dev_number with an IDA restricted between 4 and 11 (inclusive).

Pierre-Louis Bossart (3):
  soundwire: bus: rename sdw_ida as sdw_bus_ida
  soundwire: bus: allow device number to be unique at system level
  soundwire: intel: set dev_num_ida_min

 drivers/soundwire/bus.c       | 29 ++++++++++++++++++++---------
 drivers/soundwire/intel.c     |  4 ++++
 include/linux/soundwire/sdw.h |  4 ++++
 3 files changed, 28 insertions(+), 9 deletions(-)

-- 
2.25.1

