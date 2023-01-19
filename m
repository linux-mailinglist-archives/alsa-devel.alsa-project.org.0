Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB39673262
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Jan 2023 08:24:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEA6B56DF;
	Thu, 19 Jan 2023 08:23:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEA6B56DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674113084;
	bh=J+PuaT8Pd5jSfyga8q8sol2GC6waEKgBjAT0Ja2R/Sk=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=rEiQb1IPThhTAyiMOVXCeM2npDdqbQiKRH9NtK0WvfEOnj2oMHrZWTkycfUFk8+WH
	 vrPmz0n9Y3xAXOCNrT6C8knRn27FbdX+yM4xyixHnM5pLRV6L2jjaSR8d0ANR4nHsK
	 dsZm/F6SiDE8FC4ef9bnuapjQcQy1Aa+In1BQZ8A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50042F8024D;
	Thu, 19 Jan 2023 08:23:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D50CCF8047B; Thu, 19 Jan 2023 08:23:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FCEBF80083
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 08:23:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FCEBF80083
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZKG4OjKm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674113023; x=1705649023;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=J+PuaT8Pd5jSfyga8q8sol2GC6waEKgBjAT0Ja2R/Sk=;
 b=ZKG4OjKmf3JyRb98vO+b9rLP0T07xw12rGEJD48hr2WtLEt8r/eXd2zx
 vnptUFLzSqbW5KPABN7vksBbXViyP9OrgnVRNoySXm/+MbZj+65ZI/50v
 yK9SKaRWLRKuKoKSEvBOHbLwKSj9lv2MLZwbFUjWoWmYKJTYD8/bt6Yoh
 JDFFSfDqVNHCE1LDeV/eyMceVSgH7OPHm5BwBglS15CRhQJn3uU8drNu2
 eAUrJ0vKkBXoqnJ75kR+D+v11kZRKW2Gec/uqiVzLgQ6ZbvdBFB6anQec
 Z9eETX/96wHABlpkQq9SZW5BTEStoO9rfbIQH9f5uQhgFSTc/t5xVeG2P A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="322902650"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; d="scan'208";a="322902650"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 23:23:38 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="662027983"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; d="scan'208";a="662027983"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 23:23:36 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 0/4] soundwire: better error handling in deferred transfers
Date: Thu, 19 Jan 2023 15:32:07 +0800
Message-Id: <20230119073211.85979-1-yung-chuan.liao@linux.intel.com>
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

v2:
 - Remove the "soundwire: stream: uniquify dev_err() logs" patch

Pierre-Louis Bossart (4):
  soundwire: stream: use consistent pattern for freeing buffers
  soundwire: bus: remove sdw_defer argument in sdw_transfer_defer()
  soundwire: cadence: use directly bus sdw_defer structure
  soundwire: cadence: further simplify low-level xfer_msg_defer()
    callback

 drivers/soundwire/bus.c            | 12 +++++-------
 drivers/soundwire/bus.h            |  3 +--
 drivers/soundwire/cadence_master.c | 20 ++++++++++----------
 drivers/soundwire/cadence_master.h |  5 +----
 drivers/soundwire/stream.c         |  8 ++++----
 include/linux/soundwire/sdw.h      |  6 +++---
 6 files changed, 24 insertions(+), 30 deletions(-)

-- 
2.25.1

