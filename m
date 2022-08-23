Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCF359D049
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 06:59:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CBC31654;
	Tue, 23 Aug 2022 06:58:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CBC31654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661230780;
	bh=c+A6ixbjMYao4eit3+mRKLLFN97auJ3zXE3KZtIv1l4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bacv/woJwoe8tVaU01QhJVK52y5bMTBN8i/ZexNHRvNCYEpkGEYQN3GTcgakpiqwX
	 WoYcAkG1Fw8V1h4iHr/+aYNVeg+vkYG3lyNd0nFCVj9+tZjJ0UWlCaO7FJYOiX7XKD
	 WiucsbMNpzhAs7v3cleJ+aRmQ8RJyM25oCOpPYxM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9A51F80152;
	Tue, 23 Aug 2022 06:58:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77289F804E7; Tue, 23 Aug 2022 06:58:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2472F80152
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 06:58:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2472F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ipwIW373"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661230687; x=1692766687;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c+A6ixbjMYao4eit3+mRKLLFN97auJ3zXE3KZtIv1l4=;
 b=ipwIW373Q1wvfv1MhnxO0oVt937rcLCMNeKIe6NQdd/ScNL6/XGRR9Im
 +/s14km9FN+pwOFh63+Ev8e7mZaJIG8NwSg3eiS/ec8bT8uVzbp1uVfkh
 89bEN6qZkBXu2jTfFN1dUSp90ItaGVLc6tfJbSqNDk/aGNueH+1JGLzpa
 8pKCHs87YlsF4lNNjYI5E0fzjTefs45N6zc9wMeFwpa1XKfjbj3CE05vb
 5666/ewn8FNGc6B4MMr/bX9otO9R3ut9mEf/98hOSWeb0TWtAE4yDUmsb
 wIbXVzGUuL+P/0enR79ppuxjPGmBsdIFxxTO+0pN49H94Mfd0KHnVh+eT A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="294380451"
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; d="scan'208";a="294380451"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 21:58:04 -0700
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; d="scan'208";a="605536645"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 21:58:02 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 1/2] soundwire: bus: remove use of __func__ in dev_dbg
Date: Tue, 23 Aug 2022 13:01:57 +0800
Message-Id: <20220823050158.2671245-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220823050158.2671245-1-yung-chuan.liao@linux.intel.com>
References: <20220823050158.2671245-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: gregkh@linuxfoundation.org, pierre-louis.bossart@linux.intel.com,
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

