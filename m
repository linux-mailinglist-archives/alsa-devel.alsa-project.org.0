Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B13C49C0B1
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jan 2022 02:22:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C53D91FB1;
	Wed, 26 Jan 2022 02:21:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C53D91FB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643160159;
	bh=wkKJ3f6Qzg0/Fp1c1I/fn7a5yHFKHd8NwTtbxFMF3LM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KUm6KU1hDmxSI2arpE/YpM3etrekcfCM/j7/PqarOAJAsd3t9U9NVvQWCgGZwJLIo
	 rdN/wGtcXu4g/Rn+CjVmZy9rDpjys1Hm5RKlj08sWWPGkiaRtzYx+hNjPm/+FQOwW0
	 BtpmQeFrr12Fb4coKtbIVJXOM546mA2K1GJ78nAM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3205DF80567;
	Wed, 26 Jan 2022 02:18:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68A9AF80578; Wed, 26 Jan 2022 02:18:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2AB0F80567
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 02:18:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2AB0F80567
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="kG+M+a54"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643159890; x=1674695890;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=wkKJ3f6Qzg0/Fp1c1I/fn7a5yHFKHd8NwTtbxFMF3LM=;
 b=kG+M+a54jWMgLMHAP4YWMyQeSxid1ifHlVbxSvcf1PVierawDq46AIaG
 4W7pBABg10BSpnEiSVZnT81V4eCQxMkSMvkkdHta2K+4fj1S7I8aWWGKz
 /a5B9ykleAZ6KrbeLHb615YzNOkezEiBFcXDmAJ+SFhzYXuXYTZH1qtb6
 vMEzuBn/At+6xiMvFMDp/FcTgSXLupm5ADBBK2GiT+4yJYdzb7KXYvfMY
 wVQFq8ELUUa08NfjT2IEe0Q2MTifITLM4wTA8fliF5/9tRoLkuqEFmRay
 uBhJlDOH3fYxfAs/9TThOh/NJW4shbY5MdnCvSez3ebwz7ndULPCAHMbZ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="246236214"
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; d="scan'208";a="246236214"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 17:18:04 -0800
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; d="scan'208";a="520617598"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 17:18:01 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 13/19] soundwire: stream: group sdw_stream_ functions
Date: Wed, 26 Jan 2022 09:17:09 +0800
Message-Id: <20220126011715.28204-14-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220126011715.28204-1-yung-chuan.liao@linux.intel.com>
References: <20220126011715.28204-1-yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com, bard.liao@intel.com
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

Group all exported functions prior to split of add in alloc/config
stages necessary for support of multiple calls to hw_params() by
ALSA/ASoC core.

Pure code move, no functionality change.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/stream.c | 529 +++++++++++++++++++------------------
 1 file changed, 265 insertions(+), 264 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index b7ccfa5a9cfc..b0f21f2ca599 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1015,45 +1015,6 @@ static int sdw_master_port_config(struct sdw_master_runtime *m_rt,
 	return 0;
 }
 
-/**
- * sdw_release_stream() - Free the assigned stream runtime
- *
- * @stream: SoundWire stream runtime
- *
- * sdw_release_stream should be called only once per stream
- */
-void sdw_release_stream(struct sdw_stream_runtime *stream)
-{
-	kfree(stream);
-}
-EXPORT_SYMBOL(sdw_release_stream);
-
-/**
- * sdw_alloc_stream() - Allocate and return stream runtime
- *
- * @stream_name: SoundWire stream name
- *
- * Allocates a SoundWire stream runtime instance.
- * sdw_alloc_stream should be called only once per stream. Typically
- * invoked from ALSA/ASoC machine/platform driver.
- */
-struct sdw_stream_runtime *sdw_alloc_stream(const char *stream_name)
-{
-	struct sdw_stream_runtime *stream;
-
-	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
-	if (!stream)
-		return NULL;
-
-	stream->name = stream_name;
-	INIT_LIST_HEAD(&stream->master_list);
-	stream->state = SDW_STREAM_ALLOCATED;
-	stream->m_rt_count = 0;
-
-	return stream;
-}
-EXPORT_SYMBOL(sdw_alloc_stream);
-
 /**
  * sdw_slave_rt_alloc() - Allocate a Slave runtime handle.
  *
@@ -1210,62 +1171,6 @@ static void sdw_release_master_stream(struct sdw_master_runtime *m_rt,
 	kfree(m_rt);
 }
 
-/**
- * sdw_stream_remove_master() - Remove master from sdw_stream
- *
- * @bus: SDW Bus instance
- * @stream: SoundWire stream
- *
- * This removes and frees port_rt and master_rt from a stream
- */
-int sdw_stream_remove_master(struct sdw_bus *bus,
-			     struct sdw_stream_runtime *stream)
-{
-	struct sdw_master_runtime *m_rt, *_m_rt;
-
-	mutex_lock(&bus->bus_lock);
-
-	list_for_each_entry_safe(m_rt, _m_rt,
-				 &stream->master_list, stream_node) {
-		if (m_rt->bus != bus)
-			continue;
-
-		sdw_master_port_free(m_rt);
-		sdw_release_master_stream(m_rt, stream);
-		stream->m_rt_count--;
-	}
-
-	if (list_empty(&stream->master_list))
-		stream->state = SDW_STREAM_RELEASED;
-
-	mutex_unlock(&bus->bus_lock);
-
-	return 0;
-}
-EXPORT_SYMBOL(sdw_stream_remove_master);
-
-/**
- * sdw_stream_remove_slave() - Remove slave from sdw_stream
- *
- * @slave: SDW Slave instance
- * @stream: SoundWire stream
- *
- * This removes and frees port_rt and slave_rt from a stream
- */
-int sdw_stream_remove_slave(struct sdw_slave *slave,
-			    struct sdw_stream_runtime *stream)
-{
-	mutex_lock(&slave->bus->bus_lock);
-
-	sdw_slave_port_free(slave, stream);
-	sdw_release_slave_stream(slave, stream);
-
-	mutex_unlock(&slave->bus->bus_lock);
-
-	return 0;
-}
-EXPORT_SYMBOL(sdw_stream_remove_slave);
-
 /**
  * sdw_config_stream() - Configure the allocated stream
  *
@@ -1312,175 +1217,6 @@ static int sdw_config_stream(struct device *dev,
 	return 0;
 }
 
-/**
- * sdw_stream_add_master() - Allocate and add master runtime to a stream
- *
- * @bus: SDW Bus instance
- * @stream_config: Stream configuration for audio stream
- * @port_config: Port configuration for audio stream
- * @num_ports: Number of ports
- * @stream: SoundWire stream
- */
-int sdw_stream_add_master(struct sdw_bus *bus,
-			  struct sdw_stream_config *stream_config,
-			  struct sdw_port_config *port_config,
-			  unsigned int num_ports,
-			  struct sdw_stream_runtime *stream)
-{
-	struct sdw_master_runtime *m_rt;
-	int ret;
-
-	mutex_lock(&bus->bus_lock);
-
-	/*
-	 * For multi link streams, add the second master only if
-	 * the bus supports it.
-	 * Check if bus->multi_link is set
-	 */
-	if (!bus->multi_link && stream->m_rt_count > 0) {
-		dev_err(bus->dev,
-			"Multilink not supported, link %d\n", bus->link_id);
-		ret = -EINVAL;
-		goto unlock;
-	}
-
-	/*
-	 * check if Master is already allocated (e.g. as a result of Slave adding
-	 * it first), if so skip allocation and go to configuration
-	 */
-	m_rt = sdw_master_rt_find(bus, stream);
-	if (m_rt)
-		goto skip_alloc_master_rt;
-
-	m_rt = sdw_master_rt_alloc(bus, stream);
-	if (!m_rt) {
-		dev_err(bus->dev, "Master runtime alloc failed for stream:%s\n", stream->name);
-		ret = -ENOMEM;
-		goto unlock;
-	}
-
-	ret = sdw_master_rt_config(m_rt, stream_config);
-	if (ret < 0)
-		goto unlock;
-
-skip_alloc_master_rt:
-	ret = sdw_config_stream(bus->dev, stream, stream_config, false);
-	if (ret)
-		goto stream_error;
-
-	ret = sdw_master_port_alloc(m_rt, num_ports);
-	if (ret)
-		goto stream_error;
-
-	ret = sdw_master_port_config(m_rt, port_config);
-	if (ret)
-		goto stream_error;
-
-	stream->m_rt_count++;
-
-	goto unlock;
-
-stream_error:
-	sdw_release_master_stream(m_rt, stream);
-unlock:
-	mutex_unlock(&bus->bus_lock);
-	return ret;
-}
-EXPORT_SYMBOL(sdw_stream_add_master);
-
-/**
- * sdw_stream_add_slave() - Allocate and add master/slave runtime to a stream
- *
- * @slave: SDW Slave instance
- * @stream_config: Stream configuration for audio stream
- * @stream: SoundWire stream
- * @port_config: Port configuration for audio stream
- * @num_ports: Number of ports
- *
- * It is expected that Slave is added before adding Master
- * to the Stream.
- *
- */
-int sdw_stream_add_slave(struct sdw_slave *slave,
-			 struct sdw_stream_config *stream_config,
-			 struct sdw_port_config *port_config,
-			 unsigned int num_ports,
-			 struct sdw_stream_runtime *stream)
-{
-	struct sdw_slave_runtime *s_rt;
-	struct sdw_master_runtime *m_rt;
-	int ret;
-
-	mutex_lock(&slave->bus->bus_lock);
-
-	/*
-	 * check if Master is already allocated, if so skip allocation
-	 * and go to configuration
-	 */
-	m_rt = sdw_master_rt_find(slave->bus, stream);
-	if (m_rt)
-		goto skip_alloc_master_rt;
-
-	/*
-	 * If this API is invoked by Slave first then m_rt is not valid.
-	 * So, allocate m_rt and add Slave to it.
-	 */
-	m_rt = sdw_master_rt_alloc(slave->bus, stream);
-	if (!m_rt) {
-		dev_err(&slave->dev, "Master runtime alloc failed for stream:%s\n", stream->name);
-		ret = -ENOMEM;
-		goto error;
-	}
-	ret =  sdw_master_rt_config(m_rt, stream_config);
-	if (ret < 0)
-		goto stream_error;
-
-skip_alloc_master_rt:
-	s_rt = sdw_slave_rt_alloc(slave);
-	if (!s_rt) {
-		dev_err(&slave->dev, "Slave runtime alloc failed for stream:%s\n", stream->name);
-		ret = -ENOMEM;
-		goto stream_error;
-	}
-	list_add_tail(&s_rt->m_rt_node, &m_rt->slave_rt_list);
-
-	ret = sdw_slave_rt_config(s_rt, stream_config);
-	if (ret)
-		goto stream_error;
-
-	ret = sdw_config_stream(&slave->dev, stream, stream_config, true);
-	if (ret)
-		goto stream_error;
-
-	ret = sdw_slave_port_alloc(slave, s_rt, num_ports);
-	if (ret)
-		goto stream_error;
-
-	ret = sdw_slave_port_config(slave, s_rt, port_config);
-	if (ret)
-		goto stream_error;
-
-	/*
-	 * Change stream state to CONFIGURED on first Slave add.
-	 * Bus is not aware of number of Slave(s) in a stream at this
-	 * point so cannot depend on all Slave(s) to be added in order to
-	 * change stream state to CONFIGURED.
-	 */
-	stream->state = SDW_STREAM_CONFIGURED;
-	goto error;
-
-stream_error:
-	/*
-	 * we hit error so cleanup the stream, release all Slave(s) and
-	 * Master runtime
-	 */
-	sdw_release_master_stream(m_rt, stream);
-error:
-	mutex_unlock(&slave->bus->bus_lock);
-	return ret;
-}
-EXPORT_SYMBOL(sdw_stream_add_slave);
-
 /**
  * sdw_get_slave_dpn_prop() - Get Slave port capabilities
  *
@@ -1939,6 +1675,32 @@ static int set_stream(struct snd_pcm_substream *substream,
 	return ret;
 }
 
+/**
+ * sdw_alloc_stream() - Allocate and return stream runtime
+ *
+ * @stream_name: SoundWire stream name
+ *
+ * Allocates a SoundWire stream runtime instance.
+ * sdw_alloc_stream should be called only once per stream. Typically
+ * invoked from ALSA/ASoC machine/platform driver.
+ */
+struct sdw_stream_runtime *sdw_alloc_stream(const char *stream_name)
+{
+	struct sdw_stream_runtime *stream;
+
+	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
+	if (!stream)
+		return NULL;
+
+	stream->name = stream_name;
+	INIT_LIST_HEAD(&stream->master_list);
+	stream->state = SDW_STREAM_ALLOCATED;
+	stream->m_rt_count = 0;
+
+	return stream;
+}
+EXPORT_SYMBOL(sdw_alloc_stream);
+
 /**
  * sdw_startup_stream() - Startup SoundWire stream
  *
@@ -2015,3 +1777,242 @@ void sdw_shutdown_stream(void *sdw_substream)
 	set_stream(substream, NULL);
 }
 EXPORT_SYMBOL(sdw_shutdown_stream);
+
+/**
+ * sdw_release_stream() - Free the assigned stream runtime
+ *
+ * @stream: SoundWire stream runtime
+ *
+ * sdw_release_stream should be called only once per stream
+ */
+void sdw_release_stream(struct sdw_stream_runtime *stream)
+{
+	kfree(stream);
+}
+EXPORT_SYMBOL(sdw_release_stream);
+
+/**
+ * sdw_stream_add_master() - Allocate and add master runtime to a stream
+ *
+ * @bus: SDW Bus instance
+ * @stream_config: Stream configuration for audio stream
+ * @port_config: Port configuration for audio stream
+ * @num_ports: Number of ports
+ * @stream: SoundWire stream
+ */
+int sdw_stream_add_master(struct sdw_bus *bus,
+			  struct sdw_stream_config *stream_config,
+			  struct sdw_port_config *port_config,
+			  unsigned int num_ports,
+			  struct sdw_stream_runtime *stream)
+{
+	struct sdw_master_runtime *m_rt;
+	int ret;
+
+	mutex_lock(&bus->bus_lock);
+
+	/*
+	 * For multi link streams, add the second master only if
+	 * the bus supports it.
+	 * Check if bus->multi_link is set
+	 */
+	if (!bus->multi_link && stream->m_rt_count > 0) {
+		dev_err(bus->dev,
+			"Multilink not supported, link %d\n", bus->link_id);
+		ret = -EINVAL;
+		goto unlock;
+	}
+
+	/*
+	 * check if Master is already allocated (e.g. as a result of Slave adding
+	 * it first), if so skip allocation and go to configuration
+	 */
+	m_rt = sdw_master_rt_find(bus, stream);
+	if (m_rt)
+		goto skip_alloc_master_rt;
+
+	m_rt = sdw_master_rt_alloc(bus, stream);
+	if (!m_rt) {
+		dev_err(bus->dev, "Master runtime alloc failed for stream:%s\n", stream->name);
+		ret = -ENOMEM;
+		goto unlock;
+	}
+
+	ret = sdw_master_rt_config(m_rt, stream_config);
+	if (ret < 0)
+		goto unlock;
+
+skip_alloc_master_rt:
+	ret = sdw_config_stream(bus->dev, stream, stream_config, false);
+	if (ret)
+		goto stream_error;
+
+	ret = sdw_master_port_alloc(m_rt, num_ports);
+	if (ret)
+		goto stream_error;
+
+	ret = sdw_master_port_config(m_rt, port_config);
+	if (ret)
+		goto stream_error;
+
+	stream->m_rt_count++;
+
+	goto unlock;
+
+stream_error:
+	sdw_release_master_stream(m_rt, stream);
+unlock:
+	mutex_unlock(&bus->bus_lock);
+	return ret;
+}
+EXPORT_SYMBOL(sdw_stream_add_master);
+
+/**
+ * sdw_stream_remove_master() - Remove master from sdw_stream
+ *
+ * @bus: SDW Bus instance
+ * @stream: SoundWire stream
+ *
+ * This removes and frees port_rt and master_rt from a stream
+ */
+int sdw_stream_remove_master(struct sdw_bus *bus,
+			     struct sdw_stream_runtime *stream)
+{
+	struct sdw_master_runtime *m_rt, *_m_rt;
+
+	mutex_lock(&bus->bus_lock);
+
+	list_for_each_entry_safe(m_rt, _m_rt,
+				 &stream->master_list, stream_node) {
+		if (m_rt->bus != bus)
+			continue;
+
+		sdw_master_port_free(m_rt);
+		sdw_release_master_stream(m_rt, stream);
+		stream->m_rt_count--;
+	}
+
+	if (list_empty(&stream->master_list))
+		stream->state = SDW_STREAM_RELEASED;
+
+	mutex_unlock(&bus->bus_lock);
+
+	return 0;
+}
+EXPORT_SYMBOL(sdw_stream_remove_master);
+
+/**
+ * sdw_stream_add_slave() - Allocate and add master/slave runtime to a stream
+ *
+ * @slave: SDW Slave instance
+ * @stream_config: Stream configuration for audio stream
+ * @stream: SoundWire stream
+ * @port_config: Port configuration for audio stream
+ * @num_ports: Number of ports
+ *
+ * It is expected that Slave is added before adding Master
+ * to the Stream.
+ *
+ */
+int sdw_stream_add_slave(struct sdw_slave *slave,
+			 struct sdw_stream_config *stream_config,
+			 struct sdw_port_config *port_config,
+			 unsigned int num_ports,
+			 struct sdw_stream_runtime *stream)
+{
+	struct sdw_slave_runtime *s_rt;
+	struct sdw_master_runtime *m_rt;
+	int ret;
+
+	mutex_lock(&slave->bus->bus_lock);
+
+	/*
+	 * check if Master is already allocated, if so skip allocation
+	 * and go to configuration
+	 */
+	m_rt = sdw_master_rt_find(slave->bus, stream);
+	if (m_rt)
+		goto skip_alloc_master_rt;
+
+	/*
+	 * If this API is invoked by Slave first then m_rt is not valid.
+	 * So, allocate m_rt and add Slave to it.
+	 */
+	m_rt = sdw_master_rt_alloc(slave->bus, stream);
+	if (!m_rt) {
+		dev_err(&slave->dev, "Master runtime alloc failed for stream:%s\n", stream->name);
+		ret = -ENOMEM;
+		goto error;
+	}
+	ret =  sdw_master_rt_config(m_rt, stream_config);
+	if (ret < 0)
+		goto stream_error;
+
+skip_alloc_master_rt:
+	s_rt = sdw_slave_rt_alloc(slave);
+	if (!s_rt) {
+		dev_err(&slave->dev, "Slave runtime alloc failed for stream:%s\n", stream->name);
+		ret = -ENOMEM;
+		goto stream_error;
+	}
+	list_add_tail(&s_rt->m_rt_node, &m_rt->slave_rt_list);
+
+	ret = sdw_slave_rt_config(s_rt, stream_config);
+	if (ret)
+		goto stream_error;
+
+	ret = sdw_config_stream(&slave->dev, stream, stream_config, true);
+	if (ret)
+		goto stream_error;
+
+	ret = sdw_slave_port_alloc(slave, s_rt, num_ports);
+	if (ret)
+		goto stream_error;
+
+	ret = sdw_slave_port_config(slave, s_rt, port_config);
+	if (ret)
+		goto stream_error;
+
+	/*
+	 * Change stream state to CONFIGURED on first Slave add.
+	 * Bus is not aware of number of Slave(s) in a stream at this
+	 * point so cannot depend on all Slave(s) to be added in order to
+	 * change stream state to CONFIGURED.
+	 */
+	stream->state = SDW_STREAM_CONFIGURED;
+	goto error;
+
+stream_error:
+	/*
+	 * we hit error so cleanup the stream, release all Slave(s) and
+	 * Master runtime
+	 */
+	sdw_release_master_stream(m_rt, stream);
+error:
+	mutex_unlock(&slave->bus->bus_lock);
+	return ret;
+}
+EXPORT_SYMBOL(sdw_stream_add_slave);
+
+/**
+ * sdw_stream_remove_slave() - Remove slave from sdw_stream
+ *
+ * @slave: SDW Slave instance
+ * @stream: SoundWire stream
+ *
+ * This removes and frees port_rt and slave_rt from a stream
+ */
+int sdw_stream_remove_slave(struct sdw_slave *slave,
+			    struct sdw_stream_runtime *stream)
+{
+	mutex_lock(&slave->bus->bus_lock);
+
+	sdw_slave_port_free(slave, stream);
+	sdw_release_slave_stream(slave, stream);
+
+	mutex_unlock(&slave->bus->bus_lock);
+
+	return 0;
+}
+EXPORT_SYMBOL(sdw_stream_remove_slave);
+
-- 
2.17.1

