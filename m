Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 827FD638C07
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Nov 2022 15:22:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 223171743;
	Fri, 25 Nov 2022 15:21:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 223171743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669386150;
	bh=RMCz5oPSxtzYRm1iYgdJSYHjJHyDymVlDKQdQujZ6BU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sYdNKGdxjWfuKoE+T96WNPPVET/4WLOxYFLJiRrMkvU2fRVcsIkSTw8uaRQGi1kPz
	 4ihz68oUvkY4IIWoYTuKG9PCaD1GV7Igiyv6eCxVYBMASp3u3VyErMM6oZaNECqMax
	 PNlQ4odQJgT8RsHy438GSXhUNzQDWyxOTtpI37Ag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE91CF8055C;
	Fri, 25 Nov 2022 15:20:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 414E1F80558; Fri, 25 Nov 2022 15:20:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B4E7F80236
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 15:20:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B4E7F80236
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="JNbcaxIq"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AP8g14d009072; Fri, 25 Nov 2022 08:20:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Hf+p2XLDxtDu0bixw/WcTYV02K3jKz11jQ4Wh7jZWhs=;
 b=JNbcaxIq890baQYfRP7F1/m0qJBfIKzCHx/iWaXRDWaEJ3gEKV6fmFydkme2QwFY4abH
 FW16PxoQGsQvUurmsm+2KoVD5L7DhiY1VJWYGcAdeCU/2G5UjeI7EwFIazH4CdpNlbab
 AzvNxf1ycQjR6nrQhdTMSbtQgnwCHAOeEz0SsjJCvWSZxDYCtZG8YkyaLDW37HdqaLdV
 uGLYfuPojsKQAOpOAi1pOKrNzWdaKB63KSWQa2AR+URNqNzmvRhTTsqPXskKHkjDr7ZA
 WUgTc89qYhsP6Sc7d24fLqrGup5nQZTR9mizO/0uixx2WwraqcP4ejeEU2KcaAqHlDe3 DQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3kxvet7ccp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Nov 2022 08:20:30 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Fri, 25 Nov
 2022 08:20:29 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via
 Frontend Transport; Fri, 25 Nov 2022 08:20:29 -0600
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1F523B10;
 Fri, 25 Nov 2022 14:20:29 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <vkoul@kernel.org>
Subject: [PATCH v4 2/4] soundwire: Provide build stubs for common functions
Date: Fri, 25 Nov 2022 14:20:26 +0000
Message-ID: <20221125142028.1118618-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221125142028.1118618-1-ckeepax@opensource.cirrus.com>
References: <20221125142028.1118618-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: -RykCZ5n6tuVbhrgytsuMh0k7okAmOu6
X-Proofpoint-GUID: -RykCZ5n6tuVbhrgytsuMh0k7okAmOu6
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com
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

Provide stub functions when CONFIG_SOUNDWIRE is not set for functions
that are quite likely to be used from common code on devices supporting
multiple control buses.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v3:
 - Return error code and add WARN_ONCE in build stubs. Note I returned
   EINVAL rather than the discussed ENOSYS since it turns out checkpatch
   informs me I really shouldn't be returning ENOSYS :-)

Thanks,
Charles

 include/linux/soundwire/sdw.h | 105 ++++++++++++++++++++++++++++++----
 1 file changed, 95 insertions(+), 10 deletions(-)

diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 902ed46f76c80..132a0ee97b804 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -4,6 +4,7 @@
 #ifndef __SOUNDWIRE_H
 #define __SOUNDWIRE_H
 
+#include <linux/bug.h>
 #include <linux/mod_devicetable.h>
 #include <linux/bitfield.h>
 
@@ -1021,15 +1022,8 @@ int sdw_stream_add_master(struct sdw_bus *bus,
 		struct sdw_port_config *port_config,
 		unsigned int num_ports,
 		struct sdw_stream_runtime *stream);
-int sdw_stream_add_slave(struct sdw_slave *slave,
-		struct sdw_stream_config *stream_config,
-		struct sdw_port_config *port_config,
-		unsigned int num_ports,
-		struct sdw_stream_runtime *stream);
 int sdw_stream_remove_master(struct sdw_bus *bus,
 		struct sdw_stream_runtime *stream);
-int sdw_stream_remove_slave(struct sdw_slave *slave,
-		struct sdw_stream_runtime *stream);
 int sdw_startup_stream(void *sdw_substream);
 int sdw_prepare_stream(struct sdw_stream_runtime *stream);
 int sdw_enable_stream(struct sdw_stream_runtime *stream);
@@ -1040,8 +1034,20 @@ int sdw_bus_prep_clk_stop(struct sdw_bus *bus);
 int sdw_bus_clk_stop(struct sdw_bus *bus);
 int sdw_bus_exit_clk_stop(struct sdw_bus *bus);
 
-/* messaging and data APIs */
+int sdw_compare_devid(struct sdw_slave *slave, struct sdw_slave_id id);
+void sdw_extract_slave_id(struct sdw_bus *bus, u64 addr, struct sdw_slave_id *id);
 
+#if IS_ENABLED(CONFIG_SOUNDWIRE)
+
+int sdw_stream_add_slave(struct sdw_slave *slave,
+			 struct sdw_stream_config *stream_config,
+			 struct sdw_port_config *port_config,
+			 unsigned int num_ports,
+			 struct sdw_stream_runtime *stream);
+int sdw_stream_remove_slave(struct sdw_slave *slave,
+			    struct sdw_stream_runtime *stream);
+
+/* messaging and data APIs */
 int sdw_read(struct sdw_slave *slave, u32 addr);
 int sdw_write(struct sdw_slave *slave, u32 addr, u8 value);
 int sdw_write_no_pm(struct sdw_slave *slave, u32 addr, u8 value);
@@ -1053,7 +1059,86 @@ int sdw_nwrite_no_pm(struct sdw_slave *slave, u32 addr, size_t count, const u8 *
 int sdw_update(struct sdw_slave *slave, u32 addr, u8 mask, u8 val);
 int sdw_update_no_pm(struct sdw_slave *slave, u32 addr, u8 mask, u8 val);
 
-int sdw_compare_devid(struct sdw_slave *slave, struct sdw_slave_id id);
-void sdw_extract_slave_id(struct sdw_bus *bus, u64 addr, struct sdw_slave_id *id);
+#else
+
+static inline int sdw_stream_add_slave(struct sdw_slave *slave,
+				       struct sdw_stream_config *stream_config,
+				       struct sdw_port_config *port_config,
+				       unsigned int num_ports,
+				       struct sdw_stream_runtime *stream)
+{
+	WARN_ONCE(1, "SoundWire API is disabled");
+	return -EINVAL;
+}
+
+static inline int sdw_stream_remove_slave(struct sdw_slave *slave,
+					  struct sdw_stream_runtime *stream)
+{
+	WARN_ONCE(1, "SoundWire API is disabled");
+	return -EINVAL;
+}
+
+/* messaging and data APIs */
+static inline int sdw_read(struct sdw_slave *slave, u32 addr)
+{
+	WARN_ONCE(1, "SoundWire API is disabled");
+	return -EINVAL;
+}
+
+static inline int sdw_write(struct sdw_slave *slave, u32 addr, u8 value)
+{
+	WARN_ONCE(1, "SoundWire API is disabled");
+	return -EINVAL;
+}
+
+static inline int sdw_write_no_pm(struct sdw_slave *slave, u32 addr, u8 value)
+{
+	WARN_ONCE(1, "SoundWire API is disabled");
+	return -EINVAL;
+}
+
+static inline int sdw_read_no_pm(struct sdw_slave *slave, u32 addr)
+{
+	WARN_ONCE(1, "SoundWire API is disabled");
+	return -EINVAL;
+}
+
+static inline int sdw_nread(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
+{
+	WARN_ONCE(1, "SoundWire API is disabled");
+	return -EINVAL;
+}
+
+static inline int sdw_nread_no_pm(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
+{
+	WARN_ONCE(1, "SoundWire API is disabled");
+	return -EINVAL;
+}
+
+static inline int sdw_nwrite(struct sdw_slave *slave, u32 addr, size_t count, const u8 *val)
+{
+	WARN_ONCE(1, "SoundWire API is disabled");
+	return -EINVAL;
+}
+
+static inline int sdw_nwrite_no_pm(struct sdw_slave *slave, u32 addr, size_t count, const u8 *val)
+{
+	WARN_ONCE(1, "SoundWire API is disabled");
+	return -EINVAL;
+}
+
+static inline int sdw_update(struct sdw_slave *slave, u32 addr, u8 mask, u8 val)
+{
+	WARN_ONCE(1, "SoundWire API is disabled");
+	return -EINVAL;
+}
+
+static inline int sdw_update_no_pm(struct sdw_slave *slave, u32 addr, u8 mask, u8 val)
+{
+	WARN_ONCE(1, "SoundWire API is disabled");
+	return -EINVAL;
+}
+
+#endif /* CONFIG_SOUNDWIRE */
 
 #endif /* __SOUNDWIRE_H */
-- 
2.30.2

