Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 271F93296B1
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 08:52:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B31601687;
	Tue,  2 Mar 2021 08:52:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B31601687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614671571;
	bh=AX1ktzKLV3n1c+DM8ZxzBs+f6HAiLDz54ZBOEQ/JnO8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Fzdqdr+lrIAtcl+gvjeCxBf6YZSvLQXg/AU/a5EEna8bu2rSzkQ05knURK//0fveg
	 q0ZQEp6cm3X00OoCig/H042SIXKA5AcXZlQvAr8DkosqSLVd7hyWEVDcOm+KmKjWyc
	 21RVjqlnn5zqsV9FJ5OOhKqt/vU3eGBZQ9B2Vamo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15E58F80271;
	Tue,  2 Mar 2021 08:51:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CD78F80269; Tue,  2 Mar 2021 08:51:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49569F80088
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 08:51:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49569F80088
IronPort-SDR: DhGTqdCEm2TbY2nFP7AiMiHBWylNElGcnm+pHntoY+sVVnynYj66a2KEYi2qGBWshaWmt++qaN
 cY86RjWfl0+Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="186782221"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="186782221"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 23:51:09 -0800
IronPort-SDR: 6RbV4hktqVLxK4m9qsZBCzwonRlqfOBgJvEbq5XzAR0Y+pHALuGYzTPTRMrTi928iYv92cZjkg
 jsn+hZGOVYfQ==
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="406597558"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 23:51:05 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 0/3] soundwire: add DMI quirks for overridind addr
Date: Tue,  2 Mar 2021 15:51:02 +0800
Message-Id: <20210302075105.11515-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, srinivas.kandagatla@linaro.org,
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

Platform firmware may have incorrect _ADR values causing the driver
probes to fail. Adding the override_ops allows people to override the
addr values.

v2:
 - Add the override_adr ops
 - Move DMI quirks to a new file

Pierre-Louis Bossart (2):
  soundwire: Intel: introduce DMI quirks for HP Spectre x360 Convertible
  soundwire: Intel: add DMI quirk for Dell SKU 0A3E

Vinod Koul (1):
  soundwire: add override addr ops

 drivers/soundwire/Makefile     |  2 +-
 drivers/soundwire/bus.h        |  2 +
 drivers/soundwire/dmi-quirks.c | 96 ++++++++++++++++++++++++++++++++++
 drivers/soundwire/intel.c      |  1 +
 drivers/soundwire/slave.c      |  8 ++-
 include/linux/soundwire/sdw.h  |  4 +-
 6 files changed, 110 insertions(+), 3 deletions(-)
 create mode 100644 drivers/soundwire/dmi-quirks.c

-- 
2.17.1

