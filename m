Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD416692DE
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 10:28:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 401AC7B86;
	Fri, 13 Jan 2023 10:27:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 401AC7B86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673602105;
	bh=aD/lfRR8F8fjWyTEE25We7aJuQghHG33UM+A1dXJgGo=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=s1ZMusg+JEnPtv0hkpokd4D/6ZvjaOOQlTm7bDlj8O1+cafFXnbR/GsI8PVy/lUls
	 BQtPIcRH3Sy85Za5x54jx2+2ZXbl0WLhS2WbpeIXepo5Q77gCFLligV1VEXf1nebrx
	 iY4Dto1klQ/v3bA/o4D2VRF29eXFiFAbTqJBWEG8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CD10F802E8;
	Fri, 13 Jan 2023 10:27:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC2D0F8030F; Fri, 13 Jan 2023 10:27:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 602A5F8026D
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 10:27:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 602A5F8026D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bRNXBBHI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673602043; x=1705138043;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aD/lfRR8F8fjWyTEE25We7aJuQghHG33UM+A1dXJgGo=;
 b=bRNXBBHIRIdx9kqNLCo7e0KexmpjGgxuzyCQOAqjjfqYPWQDRxpnLBEz
 S1T95KgNa87Z04ZyUpM3sydmODTSsoC+yu2Ruk3T8LNd4yK9pUFh9Piat
 c7NADYjd4UK9SeeMwUVK7KPsQPqCdnxOJ2SJLroZMXDSVmrU2rpttPeRk
 boTWyZrDHsw9gPLuC78hV3QROaTt4RWv5d/jj6zT+xKg5k46owza8Dkrh
 2o/yUyOZlsxLk+v5w55KgO9r9rTMhjoL+IiG9gw/SnZP9F+4GOnHSA1Fw
 aZ9GA2lCuuDZb3csp9HRBTUKvQa1lV5TMCvGID9Sy6NB4Azs5Tafs97ia g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="351189428"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="351189428"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 01:27:20 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="608116081"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="608116081"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 01:27:18 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 0/5] soundwire: better error handling in deferred transfers
Date: Fri, 13 Jan 2023 17:35:27 +0800
Message-Id: <20230113093532.3872113-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org,
 bard.liao@intel.com, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This is a generic cleanup series.

Pierre-Louis Bossart (5):
  soundwire: stream: uniquify dev_err() logs
  soundwire: stream: use consistent pattern for freeing buffers
  soundwire: bus: remove sdw_defer argument in sdw_transfer_defer()
  soundwire: cadence: use directly bus sdw_defer structure
  soundwire: cadence: further simplify low-level xfer_msg_defer()
    callback

 drivers/soundwire/bus.c            | 12 +++++-------
 drivers/soundwire/bus.h            |  3 +--
 drivers/soundwire/cadence_master.c | 20 ++++++++++----------
 drivers/soundwire/cadence_master.h |  5 +----
 drivers/soundwire/stream.c         | 22 ++++++++++++----------
 include/linux/soundwire/sdw.h      |  6 +++---
 6 files changed, 32 insertions(+), 36 deletions(-)

-- 
2.25.1

