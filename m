Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 049EE62DDCD
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Nov 2022 15:19:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EDEF16DF;
	Thu, 17 Nov 2022 15:18:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EDEF16DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668694767;
	bh=rKzGV463f5rMWJCVcfeddYNQZEhVYiY3BeZ5mhH5sSo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CJC25wqNv5lhfn6lGxck882BEY1Bz7z+zi9RPg4ircXBod8g4a8NEIPrbiijOrRGY
	 /IsNxL4uuYjfiLCLs2D/ghRP4tsGmYkl/2s085Xk5rfvTmS09pYC57OiQn+E54GWr7
	 5so0W9UsEJoTr+J9hCw8KcO8AQK0ZKTteltO4UqQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3842EF8055B;
	Thu, 17 Nov 2022 15:17:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE787F8025A; Thu, 17 Nov 2022 15:17:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FC6DF804C1
 for <alsa-devel@alsa-project.org>; Thu, 17 Nov 2022 15:17:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FC6DF804C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="MY0YSzTc"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AHEHLJZ006137; Thu, 17 Nov 2022 08:17:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=6f5Gxn+PK186Gour1Z336p425d2huBXCAzXNCXUMyT0=;
 b=MY0YSzTck2b53SXhUqz2BMIsStPXAd0g9dKvLFL1C8axi+Wm8eryec1s0Xmu26IvzjGe
 scld5H9LOKZ+E84alkz9x7FVxQh7aVHbP9n3GioSejt7mMqfVBEo12I9GIycLXDe1d0J
 4JNx8ddkncLTmlV80natj0rGiweTtrQhC5WXwI9NlE6Lg6Igm2ua4Ic8PWpjE9QGXkx5
 4h+eGDyQvB7RKLjxGhO7my6mfzggl9lPGmQMsX1iER+0lUvOI1xisZfTpGFYdtFzaVeZ
 Xd+MrvaLkddh89GOQMV1RSOQN2mBm4d3R+pEyPxQ4ekjX2WrGkm81tb1L8A6sesYgKPD hg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3kv73yk9j9-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Nov 2022 08:17:31 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Thu, 17 Nov
 2022 08:17:27 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.20 via Frontend Transport; Thu, 17 Nov 2022 08:17:27 -0600
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DA515476;
 Thu, 17 Nov 2022 14:17:27 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <vkoul@kernel.org>
Subject: [PATCH v2 2/4] soundwire: Provide build stubs for common functions
Date: Thu, 17 Nov 2022 14:17:25 +0000
Message-ID: <20221117141727.3031503-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221117141727.3031503-1-ckeepax@opensource.cirrus.com>
References: <20221117141727.3031503-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: CJjQr3JXmgQ59wv7LzYgtiJsJOO51XC8
X-Proofpoint-GUID: CJjQr3JXmgQ59wv7LzYgtiJsJOO51XC8
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

Changes since v1:
 - Added Pierre's reviewed-by.

 include/linux/soundwire/sdw.h | 92 +++++++++++++++++++++++++++++++----
 1 file changed, 82 insertions(+), 10 deletions(-)

diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 902ed46f76c80..4f80cba898f11 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -1021,15 +1021,8 @@ int sdw_stream_add_master(struct sdw_bus *bus,
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
@@ -1040,8 +1033,20 @@ int sdw_bus_prep_clk_stop(struct sdw_bus *bus);
 int sdw_bus_clk_stop(struct sdw_bus *bus);
 int sdw_bus_exit_clk_stop(struct sdw_bus *bus);
 
-/* messaging and data APIs */
+int sdw_compare_devid(struct sdw_slave *slave, struct sdw_slave_id id);
+void sdw_extract_slave_id(struct sdw_bus *bus, u64 addr, struct sdw_slave_id *id);
+
+#if IS_ENABLED(CONFIG_SOUNDWIRE)
 
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
@@ -1053,7 +1058,74 @@ int sdw_nwrite_no_pm(struct sdw_slave *slave, u32 addr, size_t count, const u8 *
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
+	return 0;
+}
+
+static inline int sdw_stream_remove_slave(struct sdw_slave *slave,
+					  struct sdw_stream_runtime *stream)
+{
+	return 0;
+}
+
+/* messaging and data APIs */
+static inline int sdw_read(struct sdw_slave *slave, u32 addr)
+{
+	return 0;
+}
+
+static inline int sdw_write(struct sdw_slave *slave, u32 addr, u8 value)
+{
+	return 0;
+}
+
+static inline int sdw_write_no_pm(struct sdw_slave *slave, u32 addr, u8 value)
+{
+	return 0;
+}
+
+static inline int sdw_read_no_pm(struct sdw_slave *slave, u32 addr)
+{
+	return 0;
+}
+
+static inline int sdw_nread(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
+{
+	return 0;
+}
+
+static inline int sdw_nread_no_pm(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
+{
+	return 0;
+}
+
+static inline int sdw_nwrite(struct sdw_slave *slave, u32 addr, size_t count, const u8 *val)
+{
+	return 0;
+}
+
+static inline int sdw_nwrite_no_pm(struct sdw_slave *slave, u32 addr, size_t count, const u8 *val)
+{
+	return 0;
+}
+
+static inline int sdw_update(struct sdw_slave *slave, u32 addr, u8 mask, u8 val)
+{
+	return 0;
+}
+
+static inline int sdw_update_no_pm(struct sdw_slave *slave, u32 addr, u8 mask, u8 val)
+{
+	return 0;
+}
+
+#endif /* CONFIG_SOUNDWIRE */
 
 #endif /* __SOUNDWIRE_H */
-- 
2.30.2

