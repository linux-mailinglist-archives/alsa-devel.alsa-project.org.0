Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A06117F4
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 13:07:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E83B1792;
	Thu,  2 May 2019 13:06:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E83B1792
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556795246;
	bh=PHgGnUnJjYwcAupETY9CBNPuJAGOyxrzxYZCNXauc9c=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZbHc8gzBcabV1eR9WV1QXfTRSHhZHJAxy6wYM7Dot17HkpY/QQUZ5vUPwtALzcOYV
	 TAea8hFUKp+1bKVKFU09jooq0zEh6pb4NNrm1YsErZ/ECvCzv9b0PPXyRYqiANGeKg
	 /aMbVQKYeaZITC9QtbhIUmdPhp3zXJCzIOxUX+cE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F060F89749;
	Thu,  2 May 2019 13:00:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 186E9F89735; Thu,  2 May 2019 13:00:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41821F8972C
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 13:00:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41821F8972C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="2cQBYE1m"
Received: from localhost.localdomain (unknown [171.76.113.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 13004208C4;
 Thu,  2 May 2019 11:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556794831;
 bh=oWZCOO5ZhAxtsK5LdmP4POUzoUhxQFo0+9rSVVi55G8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2cQBYE1mj6VEJu9QVD0iceIjil3JWKrx6KsC7uPhTwSrUpVzf+in40lTRBWFREZ+t
 klbEoXIQUUBioajE3uQO4KzHHrPzHMOt+XIdwSTM+MiObCwXK2vN41cCVaqcDp+rQF
 Tbkp8tGPySj3fmCeSJ8vrD05pLUISn8LQuSfHf4Q=
From: Vinod Koul <vkoul@kernel.org>
To: alsa-devel@alsa-project.org
Date: Thu,  2 May 2019 16:29:24 +0530
Message-Id: <20190502105930.9889-9-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190502105930.9889-1-vkoul@kernel.org>
References: <20190502105930.9889-1-vkoul@kernel.org>
MIME-Version: 1.0
Cc: Greg KH <gregkh@linuxfoundation.org>, Sanyog Kale <sanyog.r.kale@intel.com>,
 Vinod Koul <vkoul@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Shreyas NC <shreyas.nc@intel.com>
Subject: [alsa-devel] [PATCH 08/14] soundwire: more alignment fixes
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Found few more issues reported checkpatch on code alignment so fix those
as well in the soundwire core.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/soundwire/bus.c       |  3 ++-
 drivers/soundwire/stream.c    | 15 ++++++++++-----
 include/linux/soundwire/sdw.h | 10 +++++-----
 3 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index e2ee305905a6..16b2a3b2662d 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -43,7 +43,8 @@ int sdw_add_bus_master(struct sdw_bus *bus)
 	if (bus->ops->read_prop) {
 		ret = bus->ops->read_prop(bus);
 		if (ret < 0) {
-			dev_err(bus->dev, "Bus read properties failed:%d\n", ret);
+			dev_err(bus->dev,
+				"Bus read properties failed:%d\n", ret);
 			return ret;
 		}
 	}
diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 032a326a96d7..bffa535294ed 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -400,7 +400,8 @@ static int sdw_do_port_prep(struct sdw_slave_runtime *s_rt,
 		ret = ops->port_prep(s_rt->slave, &prep_ch, cmd);
 		if (ret < 0) {
 			dev_err(&s_rt->slave->dev,
-				"Slave Port Prep cmd %d failed: %d\n", cmd, ret);
+				"Slave Port Prep cmd %d failed: %d\n",
+				cmd, ret);
 			return ret;
 		}
 	}
@@ -614,7 +615,8 @@ static int sdw_program_params(struct sdw_bus *bus)
 
 		ret = sdw_notify_config(m_rt);
 		if (ret < 0) {
-			dev_err(bus->dev, "Notify bus config failed: %d\n", ret);
+			dev_err(bus->dev,
+				"Notify bus config failed: %d\n", ret);
 			return ret;
 		}
 
@@ -789,7 +791,8 @@ static int do_bank_switch(struct sdw_stream_runtime *stream)
 			ret = ops->post_bank_switch(bus);
 			if (ret < 0) {
 				dev_err(bus->dev,
-					"Post bank switch op failed: %d\n", ret);
+					"Post bank switch op failed: %d\n",
+					ret);
 				goto error;
 			}
 		} else if (bus->multi_link && stream->m_rt_count > 1) {
@@ -1562,7 +1565,8 @@ static int _sdw_enable_stream(struct sdw_stream_runtime *stream)
 		/* Enable port(s) */
 		ret = sdw_enable_disable_ports(m_rt, true);
 		if (ret < 0) {
-			dev_err(bus->dev, "Enable port(s) failed ret: %d\n", ret);
+			dev_err(bus->dev,
+				"Enable port(s) failed ret: %d\n", ret);
 			return ret;
 		}
 	}
@@ -1672,7 +1676,8 @@ static int _sdw_deprepare_stream(struct sdw_stream_runtime *stream)
 		/* De-prepare port(s) */
 		ret = sdw_prep_deprep_ports(m_rt, false);
 		if (ret < 0) {
-			dev_err(bus->dev, "De-prepare port(s) failed: %d\n", ret);
+			dev_err(bus->dev,
+				"De-prepare port(s) failed: %d\n", ret);
 			return ret;
 		}
 
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index d9102af5e26c..41c49631288a 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -470,14 +470,14 @@ struct sdw_bus_params {
 struct sdw_slave_ops {
 	int (*read_prop)(struct sdw_slave *sdw);
 	int (*interrupt_callback)(struct sdw_slave *slave,
-			struct sdw_slave_intr_status *status);
+				  struct sdw_slave_intr_status *status);
 	int (*update_status)(struct sdw_slave *slave,
-			enum sdw_slave_status status);
+			     enum sdw_slave_status status);
 	int (*bus_config)(struct sdw_slave *slave,
-			struct sdw_bus_params *params);
+			  struct sdw_bus_params *params);
 	int (*port_prep)(struct sdw_slave *slave,
-			struct sdw_prepare_ch *prepare_ch,
-			enum sdw_port_prep_ops pre_ops);
+			 struct sdw_prepare_ch *prepare_ch,
+			 enum sdw_port_prep_ops pre_ops);
 };
 
 /**
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
