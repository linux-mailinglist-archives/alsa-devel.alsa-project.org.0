Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD63136CE
	for <lists+alsa-devel@lfdr.de>; Sat,  4 May 2019 03:04:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 677321872;
	Sat,  4 May 2019 03:03:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 677321872
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556931884;
	bh=bln6sM0MWAvM4BtrGlYgbB1raCEjlHVj0JbgkpY+N1g=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HT/NFnW4MXHoiYGYuozzstHuUYlxO7dYfmQJT01Q46QjLQ/VWuleL/71h8UifSEbu
	 p4g1B50OJPdXNPDfxx3UCxsgAGNeMucxRhFsFul8XDOsmA4voNMvbuDhRoAkl4xMAY
	 nJOMK0zp7ER2vDpowWbz2wbPGIKeE4Y23nXJmWno=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 400AEF89733;
	Sat,  4 May 2019 03:01:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C22D8F89729; Sat,  4 May 2019 03:00:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC628F89722
 for <alsa-devel@alsa-project.org>; Sat,  4 May 2019 03:00:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC628F89722
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 May 2019 18:00:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,427,1549958400"; d="scan'208";a="148114217"
Received: from jlwhitty-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.28.45])
 by fmsmga007.fm.intel.com with ESMTP; 03 May 2019 18:00:49 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri,  3 May 2019 20:00:26 -0500
Message-Id: <20190504010030.29233-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190504010030.29233-1-pierre-louis.bossart@linux.intel.com>
References: <20190504010030.29233-1-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, joe@perches.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [alsa-devel] [RFC PATCH 3/7] ABI: testing: Add description of
	soundwire master sysfs files
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

The description is directly derived from the MIPI DisCo specification.

Credits: this patch is based on an earlier internal contribution by
Vinod Koul, Sanyog Kale, Shreyas Nc and Hardik Shah.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../ABI/testing/sysfs-bus-soundwire-master    | 21 +++++++++++++++++++
 drivers/soundwire/sysfs.c                     |  1 +
 2 files changed, 22 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-soundwire-master

diff --git a/Documentation/ABI/testing/sysfs-bus-soundwire-master b/Documentation/ABI/testing/sysfs-bus-soundwire-master
new file mode 100644
index 000000000000..69cadf31049d
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-soundwire-master
@@ -0,0 +1,21 @@
+What:		/sys/bus/soundwire/devices/sdw-master-N/revision
+		/sys/bus/soundwire/devices/sdw-master-N/clk_stop_modes
+		/sys/bus/soundwire/devices/sdw-master-N/clk_freq
+		/sys/bus/soundwire/devices/sdw-master-N/clk_gears
+		/sys/bus/soundwire/devices/sdw-master-N/default_col
+		/sys/bus/soundwire/devices/sdw-master-N/default_frame_rate
+		/sys/bus/soundwire/devices/sdw-master-N/default_row
+		/sys/bus/soundwire/devices/sdw-master-N/dynamic_shape
+		/sys/bus/soundwire/devices/sdw-master-N/err_threshold
+		/sys/bus/soundwire/devices/sdw-master-N/max_clk_freq
+
+Date:		May 2019
+
+Contact:	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
+
+Description:	SoundWire Master-N DisCo properties.
+		These properties are defined by MIPI DisCo Specification
+		for SoundWire. They define various properties of the Master
+		and are used by the bus to configure the Master. clk_stop_modes
+		is a bitmask for simplifications and combines the
+		clock-stop-mode0 and clock-stop-mode1 properties.
diff --git a/drivers/soundwire/sysfs.c b/drivers/soundwire/sysfs.c
index 734e2c8bc5cd..c2e5b7ad42fb 100644
--- a/drivers/soundwire/sysfs.c
+++ b/drivers/soundwire/sysfs.c
@@ -31,6 +31,7 @@ struct sdw_master_sysfs {
  *      |---- clk_gears
  *      |---- default_row
  *      |---- default_col
+ *      |---- default_frame_shape
  *      |---- dynamic_shape
  *      |---- err_threshold
  */
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
