Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8822647B4
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Sep 2020 16:05:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5691D16CB;
	Thu, 10 Sep 2020 16:04:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5691D16CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599746719;
	bh=IViUZFhGP/6CQ9QyH2PvS8+2KqKNaIDLB6B9zmcqQDw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jOKOTZr3uXBljf5AoFL3bZSeyE9HdhNmgYfxFGklaCqMnYWDEkr7BNv5FcDPKMHpz
	 pf6bR2LZSqOpEx3/IKHPSUdwZcuTiaqDKoOEDngBg752q57i+733++Ty6ZIxLls8xg
	 EiWKEpWUFuXvDbf/Lb3WEgxvzVS5cgovj0B+T6dU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FF57F80277;
	Thu, 10 Sep 2020 16:04:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBC4EF80272; Thu, 10 Sep 2020 16:04:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9E68F800D0
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 16:04:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9E68F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fo+Vyz3z"
Received: from localhost.localdomain (unknown [122.179.50.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DD74421941;
 Thu, 10 Sep 2020 14:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599746648;
 bh=IViUZFhGP/6CQ9QyH2PvS8+2KqKNaIDLB6B9zmcqQDw=;
 h=From:To:Cc:Subject:Date:From;
 b=fo+Vyz3zf93DcvKciPNgmHDduCFXgXNnleyWHThN3FYDnDDDBZeFxfcQk0JEJH+FQ
 AmxlXAZy+SZ1LG9DRkpnEOkPYgKxIArqcADOLVurAiZJ78p45KcF0OR/shi0u9Z4Qg
 fPfhhQNJzN14lVa7/8rZatLi4kAaBz3GG8cafj7o=
From: Vinod Koul <vkoul@kernel.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH] soundwire: add slave status as a sysfs file
Date: Thu, 10 Sep 2020 19:33:49 +0530
Message-Id: <20200910140349.681739-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>
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

SoundWire Slave status is not reported in the sysfs, so add this file
with string values for status to userspace. Users can look into this
file to see the Slave status at that point of time.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
On RB3 it shows as:
root@linaro-alip:/sys/bus/soundwire/devices# cat sdw:0:217:2010:0:1/status
Attached
root@linaro-alip:/sys/bus/soundwire/devices# cat sdw:0:217:2010:0:2/status
Attached

 .../ABI/testing/sysfs-bus-soundwire-slave       |  7 +++++++
 drivers/soundwire/sysfs_slave.c                 | 17 +++++++++++++++++
 include/linux/soundwire/sdw.h                   |  2 ++
 3 files changed, 26 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-soundwire-slave b/Documentation/ABI/testing/sysfs-bus-soundwire-slave
index db4c9511d1aa..8a64f8e9079a 100644
--- a/Documentation/ABI/testing/sysfs-bus-soundwire-slave
+++ b/Documentation/ABI/testing/sysfs-bus-soundwire-slave
@@ -89,3 +89,10 @@ Description:	SoundWire Slave Data Source/Sink Port-N DisCo properties.
 		for SoundWire. They define various properties of the
 		Source/Sink Data port N and are used by the bus to configure
 		the Data Port N.
+
+What:		/sys/bus/soundwire/devices/sdw:.../status
+Date:		September 2020
+Contact:	Vinod Koul <vkoul@kernel.org>
+Description:	Soundwire Slave status
+		This reports the current status of the slave, e.g if it is
+		UNATTACHED, Attached, Alert or Reserved
diff --git a/drivers/soundwire/sysfs_slave.c b/drivers/soundwire/sysfs_slave.c
index f510071b0add..3d2cc7612d0d 100644
--- a/drivers/soundwire/sysfs_slave.c
+++ b/drivers/soundwire/sysfs_slave.c
@@ -97,8 +97,25 @@ static ssize_t modalias_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(modalias);
 
+static const char *const slave_status[SDW_SLAVE_MAX] = {
+	[SDW_SLAVE_UNATTACHED] =  "UNATTACHED",
+	[SDW_SLAVE_ATTACHED] = "Attached",
+	[SDW_SLAVE_ALERT] = "Alert",
+	[SDW_SLAVE_RESERVED] = "Reserved",
+};
+
+static ssize_t status_show(struct device *dev,
+			   struct device_attribute *attr, char *buf)
+{
+	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+
+	return sprintf(buf, "%s\n", slave_status[slave->status]);
+}
+static DEVICE_ATTR_RO(status);
+
 static struct attribute *slave_attrs[] = {
 	&dev_attr_modalias.attr,
+	&dev_attr_status.attr,
 	NULL,
 };
 ATTRIBUTE_GROUPS(slave);
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 790823d2d33b..e8c9c20d38b0 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -73,12 +73,14 @@ enum {
  * @SDW_SLAVE_ATTACHED: Slave is attached with bus.
  * @SDW_SLAVE_ALERT: Some alert condition on the Slave
  * @SDW_SLAVE_RESERVED: Reserved for future use
+ * @SDW_SLAVE_MAX: Last status value
  */
 enum sdw_slave_status {
 	SDW_SLAVE_UNATTACHED = 0,
 	SDW_SLAVE_ATTACHED = 1,
 	SDW_SLAVE_ALERT = 2,
 	SDW_SLAVE_RESERVED = 3,
+	SDW_SLAVE_MAX,
 };
 
 /**
-- 
2.26.2

