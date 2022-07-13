Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D61385738E0
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jul 2022 16:31:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81573172C;
	Wed, 13 Jul 2022 16:30:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81573172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657722689;
	bh=c+A6ixbjMYao4eit3+mRKLLFN97auJ3zXE3KZtIv1l4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nkQSv8mQntrK3KpTIUx2vkQi1omUuD/dtkoDSdYMDFV1TvrQ4DyO+YO4BtbS0Hplj
	 AicltueUJw60L4ZrQRR64i0TNVm9OzZe8XiZx6NNKC5tVhS9VNG0RYOrb0HGE/PmZD
	 EtT+m4jpms56VJH6Em6U7R7u2jF1Ffa7ctcDF/MM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70D0CF804EC;
	Wed, 13 Jul 2022 16:29:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD424F80134; Wed, 13 Jul 2022 16:29:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9FCFF800AA
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 16:29:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9FCFF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ctQh2upM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657722591; x=1689258591;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=c+A6ixbjMYao4eit3+mRKLLFN97auJ3zXE3KZtIv1l4=;
 b=ctQh2upMNb31v4Qrf1fXRd7H6A+FajU8oDKCFOFqzfbRWnMmgS31CehE
 x7JWJjtZ4DAmKGaFAC0ofUCI8ho3+bhGhYwx8jLXl/QUqFbIBuCH34RUF
 sX9aBpheqiszAwhD9Gtmov6ZqNJSuJXebUkaqhKQ+MbgQnVs58Y0DJTCK
 /s19YHEGFP9BSdTd1Z8xp1oaxpiYVhUqR8KC1BOR5ydKaOItTp4YNbZG1
 Xjtood4dO5zkW82G0MjNttFWtgExdTH5wk4KHDw0jm4YRtdHv4wb+2VsU
 3svzfJ1HkZR/NHSN0PJzlfCYlIDPUKZj0hKPaZ43v967Kiy4N324FnN5r A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="285251384"
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; d="scan'208";a="285251384"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 07:29:47 -0700
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; d="scan'208";a="622966715"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 07:29:44 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 1/2] soundwire: bus: remove use of __func__ in dev_dbg
Date: Wed, 13 Jul 2022 22:29:36 +0800
Message-Id: <20220713142937.17562-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, gregkh@linuxfoundation.org,
 vinod.koul@linaro.org, bard.liao@intel.com, linux-kernel@vger.kernel.org
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The module and function information can be added with
'modprobe foo dyndbg=+pmf'

Suggested-by: Greg KH <gregkh@linuxfoundation.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 8970f8560766..2772973eebb1 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -827,13 +827,13 @@ static void sdw_modify_slave_status(struct sdw_slave *slave,
 	mutex_lock(&bus->bus_lock);
 
 	dev_vdbg(bus->dev,
-		 "%s: changing status slave %d status %d new status %d\n",
-		 __func__, slave->dev_num, slave->status, status);
+		 "changing status slave %d status %d new status %d\n",
+		 slave->dev_num, slave->status, status);
 
 	if (status == SDW_SLAVE_UNATTACHED) {
 		dev_dbg(&slave->dev,
-			"%s: initializing enumeration and init completion for Slave %d\n",
-			__func__, slave->dev_num);
+			"initializing enumeration and init completion for Slave %d\n",
+			slave->dev_num);
 
 		init_completion(&slave->enumeration_complete);
 		init_completion(&slave->initialization_complete);
@@ -841,8 +841,8 @@ static void sdw_modify_slave_status(struct sdw_slave *slave,
 	} else if ((status == SDW_SLAVE_ATTACHED) &&
 		   (slave->status == SDW_SLAVE_UNATTACHED)) {
 		dev_dbg(&slave->dev,
-			"%s: signaling enumeration completion for Slave %d\n",
-			__func__, slave->dev_num);
+			"signaling enumeration completion for Slave %d\n",
+			slave->dev_num);
 
 		complete(&slave->enumeration_complete);
 	}
@@ -1849,8 +1849,8 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
 				"Update Slave status failed:%d\n", ret);
 		if (attached_initializing) {
 			dev_dbg(&slave->dev,
-				"%s: signaling initialization completion for Slave %d\n",
-				__func__, slave->dev_num);
+				"signaling initialization completion for Slave %d\n",
+				slave->dev_num);
 
 			complete(&slave->initialization_complete);
 
-- 
2.25.1

