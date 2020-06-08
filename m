Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8641F3673
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 10:53:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F2341694;
	Tue,  9 Jun 2020 10:52:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F2341694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591692802;
	bh=81igSP6vc1dpmNOoay+WkPw0/xbjApVJH4NvLQ/cB3I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KO2ySC1TzIXF7oYagioc3Zrv7C4c9X3V2R/CTD5HOa6DrnSBq7L51Z0/WfWmeFqTn
	 y/KoEo6PX1m+I4Lgsj7xEp5yzX0+32v5oAzVGw+uJxUkNQwCT1QdjUR/15WvQf2rNw
	 d/dAtbamLcJAKExOHe0swESKDQA1Ho5WjEYYmXds=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04AA6F802D2;
	Tue,  9 Jun 2020 10:49:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 254A4F802D2; Tue,  9 Jun 2020 10:49:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24AC1F802A9
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 10:49:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24AC1F802A9
IronPort-SDR: ni1BlJESLxS/UMER5ZHSsg9oFIsly2khZI/YRcuH2sqebwhsIg443rh3jWp/oc5CeI441pPHSP
 ptc9952KlZ1Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2020 01:49:05 -0700
IronPort-SDR: c/pu5iXOQJBKDdH0B1f+WcWAWHrY798dGB08yhusPRw/ffX3C126nXcV/+wK1bozSpGZ76vUYO
 0z3hIIDHnyTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,491,1583222400"; d="scan'208";a="473001917"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga005.fm.intel.com with ESMTP; 09 Jun 2020 01:49:00 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 3/4] soundwire: extend SDW_SLAVE_ENTRY
Date: Tue,  9 Jun 2020 04:54:35 +0800
Message-Id: <20200608205436.2402-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200608205436.2402-1-yung-chuan.liao@linux.intel.com>
References: <20200608205436.2402-1-yung-chuan.liao@linux.intel.com>
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The SoundWire 1.2 specification adds new capabilities that were not
present in previous version, such as the class ID.

To enable support for class drivers, and well as drivers that address
a specific version, all fields of the sdw_device_id structure need to
be exposed. For SoundWire 1.0 and 1.1 devices, a wildcard is used so
class and version information are ignored.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus_type.c      | 13 +++++++++----
 include/linux/mod_devicetable.h   |  2 ++
 include/linux/soundwire/sdw.h     | 11 +++++++----
 scripts/mod/devicetable-offsets.c |  2 ++
 scripts/mod/file2alias.c          |  6 +++++-
 5 files changed, 25 insertions(+), 9 deletions(-)

diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
index c8d948c09d9d..6fba55898cf0 100644
--- a/drivers/soundwire/bus_type.c
+++ b/drivers/soundwire/bus_type.c
@@ -24,7 +24,11 @@ sdw_get_device_id(struct sdw_slave *slave, struct sdw_driver *drv)
 
 	for (id = drv->id_table; id && id->mfg_id; id++)
 		if (slave->id.mfg_id == id->mfg_id &&
-		    slave->id.part_id == id->part_id)
+		    slave->id.part_id == id->part_id  &&
+		    (!id->sdw_version ||
+		     slave->id.sdw_version == id->sdw_version) &&
+		    (!id->class_id ||
+		     slave->id.class_id == id->class_id))
 			return id;
 
 	return NULL;
@@ -47,10 +51,11 @@ static int sdw_bus_match(struct device *dev, struct device_driver *ddrv)
 
 int sdw_slave_modalias(const struct sdw_slave *slave, char *buf, size_t size)
 {
-	/* modalias is sdw:m<mfg_id>p<part_id> */
+	/* modalias is sdw:m<mfg_id>p<part_id>v<version>c<class_id> */
 
-	return snprintf(buf, size, "sdw:m%04Xp%04X\n",
-			slave->id.mfg_id, slave->id.part_id);
+	return snprintf(buf, size, "sdw:m%04Xp%04Xv%02Xc%02X\n",
+			slave->id.mfg_id, slave->id.part_id,
+			slave->id.sdw_version, slave->id.class_id);
 }
 
 int sdw_slave_uevent(struct device *dev, struct kobj_uevent_env *env)
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 4c2ddd0941a7..a4969b13477b 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -251,6 +251,8 @@ struct hda_device_id {
 struct sdw_device_id {
 	__u16 mfg_id;
 	__u16 part_id;
+	__u8  sdw_version;
+	__u8  class_id;
 	kernel_ulong_t driver_data;
 };
 
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 9c27a32df9bb..64c9314cb903 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -426,8 +426,7 @@ int sdw_slave_read_prop(struct sdw_slave *slave);
  * struct sdw_slave_id - Slave ID
  * @mfg_id: MIPI Manufacturer ID
  * @part_id: Device Part ID
- * @class_id: MIPI Class ID, unused now.
- * Currently a placeholder in MIPI SoundWire Spec
+ * @class_id: MIPI Class ID (defined starting with SoundWire 1.2 spec)
  * @unique_id: Device unique ID
  * @sdw_version: SDW version implemented
  *
@@ -659,10 +658,14 @@ struct sdw_driver {
 	struct device_driver driver;
 };
 
-#define SDW_SLAVE_ENTRY(_mfg_id, _part_id, _drv_data) \
-	{ .mfg_id = (_mfg_id), .part_id = (_part_id), \
+#define SDW_SLAVE_ENTRY_EXT(_mfg_id, _part_id, _version, _c_id, _drv_data) \
+	{ .mfg_id = (_mfg_id), .part_id = (_part_id),		\
+	  .sdw_version = (_version), .class_id = (_c_id),	\
 	  .driver_data = (unsigned long)(_drv_data) }
 
+#define SDW_SLAVE_ENTRY(_mfg_id, _part_id, _drv_data)	\
+	SDW_SLAVE_ENTRY_EXT((_mfg_id), (_part_id), 0, 0, (_drv_data))
+
 int sdw_handle_slave_status(struct sdw_bus *bus,
 			enum sdw_slave_status status[]);
 
diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
index 010be8ba2116..27007c18e754 100644
--- a/scripts/mod/devicetable-offsets.c
+++ b/scripts/mod/devicetable-offsets.c
@@ -216,6 +216,8 @@ int main(void)
 	DEVID(sdw_device_id);
 	DEVID_FIELD(sdw_device_id, mfg_id);
 	DEVID_FIELD(sdw_device_id, part_id);
+	DEVID_FIELD(sdw_device_id, sdw_version);
+	DEVID_FIELD(sdw_device_id, class_id);
 
 	DEVID(fsl_mc_device_id);
 	DEVID_FIELD(fsl_mc_device_id, vendor);
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 02d5d79da284..330eb599e64a 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -1256,15 +1256,19 @@ static int do_hda_entry(const char *filename, void *symval, char *alias)
 	return 1;
 }
 
-/* Looks like: sdw:mNpN */
+/* Looks like: sdw:mNpNvNcN */
 static int do_sdw_entry(const char *filename, void *symval, char *alias)
 {
 	DEF_FIELD(symval, sdw_device_id, mfg_id);
 	DEF_FIELD(symval, sdw_device_id, part_id);
+	DEF_FIELD(symval, sdw_device_id, sdw_version);
+	DEF_FIELD(symval, sdw_device_id, class_id);
 
 	strcpy(alias, "sdw:");
 	ADD(alias, "m", mfg_id != 0, mfg_id);
 	ADD(alias, "p", part_id != 0, part_id);
+	ADD(alias, "v", sdw_version != 0, sdw_version);
+	ADD(alias, "c", class_id != 0, class_id);
 
 	add_wildcard(alias);
 	return 1;
-- 
2.17.1

