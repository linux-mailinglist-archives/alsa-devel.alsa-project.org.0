Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8B91369F
	for <lists+alsa-devel@lfdr.de>; Sat,  4 May 2019 02:34:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 211411864;
	Sat,  4 May 2019 02:33:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 211411864
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556930052;
	bh=cre850Llapr4d7TILnd7UD6Fj7DqSJW184LtJ32tt8c=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uYQTUWpMmsZg5G3Ute8ttrG5SVSH6oiHaU5ZUsfstZODGs74HfR/V1SOF1ZwUneKf
	 iOIWnSZgy9jBzSuvN8H4ohtJQCAXuOJlZkVPA0c4g+Wt/JAFm/41iJpkjQNWgBrNv5
	 xMB72pHXRnWlP2aRl5u/29kshhXpn5lX41CyhUz4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EF61F8972E;
	Sat,  4 May 2019 02:30:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADBAEF896B7; Sat,  4 May 2019 02:29:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9FB6F896CB
 for <alsa-devel@alsa-project.org>; Sat,  4 May 2019 02:29:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9FB6F896CB
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 May 2019 17:29:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,427,1549958400"; d="scan'208";a="170430455"
Received: from jlwhitty-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.28.45])
 by fmsmga001.fm.intel.com with ESMTP; 03 May 2019 17:29:42 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri,  3 May 2019 19:29:22 -0500
Message-Id: <20190504002926.28815-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190504002926.28815-1-pierre-louis.bossart@linux.intel.com>
References: <20190504002926.28815-1-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, joe@perches.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [alsa-devel] [PATCH 4/8] soundwire: mipi_disco: expose
	sdw_slave_read_dp0 as symbol
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

sdw_slave_read_dp0 was so far a static function, which prevented codec
drivers from using it. Expose as non-static function and add symbol

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/mipi_disco.c | 7 ++++---
 include/linux/soundwire/sdw.h  | 3 +++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/mipi_disco.c b/drivers/soundwire/mipi_disco.c
index 4995554bd6b6..f6b1be920a19 100644
--- a/drivers/soundwire/mipi_disco.c
+++ b/drivers/soundwire/mipi_disco.c
@@ -121,9 +121,9 @@ int sdw_master_read_prop(struct sdw_bus *bus)
 }
 EXPORT_SYMBOL(sdw_master_read_prop);
 
-static int sdw_slave_read_dp0(struct sdw_slave *slave,
-			      struct fwnode_handle *port,
-			      struct sdw_dp0_prop *dp0)
+int sdw_slave_read_dp0(struct sdw_slave *slave,
+		       struct fwnode_handle *port,
+		       struct sdw_dp0_prop *dp0)
 {
 	int nval;
 
@@ -160,6 +160,7 @@ static int sdw_slave_read_dp0(struct sdw_slave *slave,
 
 	return 0;
 }
+EXPORT_SYMBOL(sdw_slave_read_dp0);
 
 int sdw_slave_read_dpn(struct sdw_slave *slave,
 		       struct sdw_dpn_prop *dpn, int count, int ports,
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 04a45225e248..594c17ed8593 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -348,6 +348,9 @@ int sdw_slave_read_prop(struct sdw_slave *slave);
 int sdw_slave_read_dpn(struct sdw_slave *slave,
 		       struct sdw_dpn_prop *dpn, int count, int ports,
 		       char *type);
+int sdw_slave_read_dp0(struct sdw_slave *slave,
+		       struct fwnode_handle *port,
+		       struct sdw_dp0_prop *dp0);
 
 /*
  * SDW Slave Structures and APIs
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
