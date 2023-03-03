Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 609146AA28D
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Mar 2023 22:49:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 707EBE78;
	Fri,  3 Mar 2023 22:48:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 707EBE78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677880142;
	bh=cEgpfTO+tojAyddBmQF60UPcj8eS0eXsQZgOpH8A7+Y=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lc1FFdtO4MzegjOVR+BFJVxCjl47qmbk39V3ObXjvK9vKg967noffIqqrbfVO7mcX
	 xqfqert9IomrIoGJTdUgjzDrlRT3uDvBVk3cTWZRkjBo0ZLTwVyYOAEMk95s4KSS+f
	 Jh2AwcbnYHGPOUzE+wLvcgGHKQl5Id8cU/HiWiQA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0041EF80266;
	Fri,  3 Mar 2023 22:48:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39F6CF80310; Fri,  3 Mar 2023 22:48:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6D4B8F800BA
	for <alsa-devel@alsa-project.org>; Fri,  3 Mar 2023 22:48:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D4B8F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DDA2p6Rp
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 47D4961921;
	Fri,  3 Mar 2023 21:48:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57276C433A1;
	Fri,  3 Mar 2023 21:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677880084;
	bh=cEgpfTO+tojAyddBmQF60UPcj8eS0eXsQZgOpH8A7+Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DDA2p6Rpi1CoM+usl+msuGCPX6hT25Z/WBss1dWrPyfi+iGKUxyfaIANJ9zgFFxau
	 9+HcJ6x1duDkIeaN29bBfOXW84L8h7jACqqnXmPqiHvPG3aUAZ9wW5A6zm5EXeHKAf
	 YC7mHbsdbQtf4RkJyh27LzVslrR+8nsX26h5f0eHQf37Q2kpOiDhhP8sD63N45D6Yw
	 12tXAZhm+BNLoH4psZF5ruAPf9YSuv2yi2jzGtv9TCkqJhx8+Tjz+dAQXsbvFrY4ps
	 JQFoGgp7FdCChj5Z7FUAAE37mZAuNR0S4TXwRXyU+b0RDFV/tIRdrkY8r9PLLjlwww
	 A7pW3BpY7JoFg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 29/30] soundwire: cadence: Remove wasted space in
 response_buf
Date: Fri,  3 Mar 2023 16:47:14 -0500
Message-Id: <20230303214715.1452256-29-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303214715.1452256-1-sashal@kernel.org>
References: <20230303214715.1452256-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZK5I2KXGOGQMC7V55EQ4CNLZ3F3RU76P
X-Message-ID-Hash: ZK5I2KXGOGQMC7V55EQ4CNLZ3F3RU76P
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Richard Fitzgerald <rf@opensource.cirrus.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>, Sasha Levin <sashal@kernel.org>,
 yung-chuan.liao@linux.intel.com, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZK5I2KXGOGQMC7V55EQ4CNLZ3F3RU76P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Richard Fitzgerald <rf@opensource.cirrus.com>

[ Upstream commit 827c32d0df4bbe0d1c47d79f6a5eabfe9ac75216 ]

The response_buf was declared much larger (128 entries) than the number
of responses that could ever be written into it. The Cadence IP is
configurable up to a maximum of 32 entries, and the datasheet says
that RX_FIFO_AVAIL can be 2 larger than this. So allow up to 34
responses.

Also add checking in cdns_read_response() to prevent overflowing
reponse_buf if RX_FIFO_AVAIL contains an unexpectedly large number.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20221202161812.4186897-3-rf@opensource.cirrus.com
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/soundwire/cadence_master.c |  7 +++++++
 drivers/soundwire/cadence_master.h | 13 ++++++++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index a3247692ddc07..292c4460eaaa3 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -725,8 +725,15 @@ static void cdns_read_response(struct sdw_cdns *cdns)
 	u32 num_resp, cmd_base;
 	int i;
 
+	/* RX_FIFO_AVAIL can be 2 entries more than the FIFO size */
+	BUILD_BUG_ON(ARRAY_SIZE(cdns->response_buf) < CDNS_MCP_CMD_LEN + 2);
+
 	num_resp = cdns_readl(cdns, CDNS_MCP_FIFOSTAT);
 	num_resp &= CDNS_MCP_RX_FIFO_AVAIL;
+	if (num_resp > ARRAY_SIZE(cdns->response_buf)) {
+		dev_warn(cdns->dev, "RX AVAIL %d too long\n", num_resp);
+		num_resp = ARRAY_SIZE(cdns->response_buf);
+	}
 
 	cmd_base = CDNS_MCP_CMD_BASE;
 
diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/cadence_master.h
index 4d1aab5b5ec2d..e7f0108d417ca 100644
--- a/drivers/soundwire/cadence_master.h
+++ b/drivers/soundwire/cadence_master.h
@@ -8,6 +8,12 @@
 #define SDW_CADENCE_GSYNC_KHZ		4 /* 4 kHz */
 #define SDW_CADENCE_GSYNC_HZ		(SDW_CADENCE_GSYNC_KHZ * 1000)
 
+/*
+ * The Cadence IP supports up to 32 entries in the FIFO, though implementations
+ * can configure the IP to have a smaller FIFO.
+ */
+#define CDNS_MCP_IP_MAX_CMD_LEN		32
+
 /**
  * struct sdw_cdns_pdi: PDI (Physical Data Interface) instance
  *
@@ -119,7 +125,12 @@ struct sdw_cdns {
 	struct sdw_bus bus;
 	unsigned int instance;
 
-	u32 response_buf[0x80];
+	/*
+	 * The datasheet says the RX FIFO AVAIL can be 2 entries more
+	 * than the FIFO capacity, so allow for this.
+	 */
+	u32 response_buf[CDNS_MCP_IP_MAX_CMD_LEN + 2];
+
 	struct completion tx_complete;
 	struct sdw_defer *defer;
 
-- 
2.39.2

