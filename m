Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A71A110A7E
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2019 18:01:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 402AF16DE;
	Wed,  1 May 2019 18:00:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 402AF16DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556726489;
	bh=8AMHA/uNF12ssg6urq+IktgqVx56fOh6H2ny+vSPXh4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kPAW+i1piGR5DBaeiQBcTGyvxalW9ErHZ9yQ+MVJijU9PdKL5DaNwheACjcligijO
	 1yzaHinGIYLJm8OMUzC0cIn2zHpn0YMHu+E1A4B9/Fc7N1nmn/jZ3rTPUYyFBI0PBA
	 TULtGRa5IzP+DYG5idGGnYpH0ZyF7GSR3PX6nJG4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 397DDF8972A;
	Wed,  1 May 2019 17:58:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F08CF8075A; Wed,  1 May 2019 17:58:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5AF3F89693
 for <alsa-devel@alsa-project.org>; Wed,  1 May 2019 17:58:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5AF3F89693
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 May 2019 08:58:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,418,1549958400"; d="scan'208";a="296115671"
Received: from modiarvi-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.134.211])
 by orsmga004.jf.intel.com with ESMTP; 01 May 2019 08:58:13 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  1 May 2019 10:57:26 -0500
Message-Id: <20190501155745.21806-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190501155745.21806-1-pierre-louis.bossart@linux.intel.com>
References: <20190501155745.21806-1-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, joe@perches.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [alsa-devel] [PATCH v4 03/22] soundwire: fix alignment issues in
	header files
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

use Linux style

Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/bus.h            | 12 ++++++------
 drivers/soundwire/cadence_master.h | 18 +++++++++---------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
index 2f8436584e7f..3048ca153f22 100644
--- a/drivers/soundwire/bus.h
+++ b/drivers/soundwire/bus.h
@@ -16,7 +16,7 @@ static inline int sdw_acpi_find_slaves(struct sdw_bus *bus)
 #endif
 
 void sdw_extract_slave_id(struct sdw_bus *bus,
-			u64 addr, struct sdw_slave_id *id);
+			  u64 addr, struct sdw_slave_id *id);
 
 enum {
 	SDW_MSG_FLAG_READ = 0,
@@ -116,19 +116,19 @@ struct sdw_master_runtime {
 };
 
 struct sdw_dpn_prop *sdw_get_slave_dpn_prop(struct sdw_slave *slave,
-				enum sdw_data_direction direction,
-				unsigned int port_num);
+					    enum sdw_data_direction direction,
+					    unsigned int port_num);
 int sdw_configure_dpn_intr(struct sdw_slave *slave, int port,
-					bool enable, int mask);
+			   bool enable, int mask);
 
 int sdw_transfer(struct sdw_bus *bus, struct sdw_msg *msg);
 int sdw_transfer_defer(struct sdw_bus *bus, struct sdw_msg *msg,
-				struct sdw_defer *defer);
+		       struct sdw_defer *defer);
 
 #define SDW_READ_INTR_CLEAR_RETRY	10
 
 int sdw_fill_msg(struct sdw_msg *msg, struct sdw_slave *slave,
-		u32 addr, size_t count, u16 dev_num, u8 flags, u8 *buf);
+		 u32 addr, size_t count, u16 dev_num, u8 flags, u8 *buf);
 
 /* Read-Modify-Write Slave register */
 static inline int
diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/cadence_master.h
index 75f7412cfbbd..fe2af62958b1 100644
--- a/drivers/soundwire/cadence_master.h
+++ b/drivers/soundwire/cadence_master.h
@@ -160,24 +160,24 @@ irqreturn_t sdw_cdns_thread(int irq, void *dev_id);
 
 int sdw_cdns_init(struct sdw_cdns *cdns);
 int sdw_cdns_pdi_init(struct sdw_cdns *cdns,
-			struct sdw_cdns_stream_config config);
+		      struct sdw_cdns_stream_config config);
 int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns);
 
 int sdw_cdns_get_stream(struct sdw_cdns *cdns,
 			struct sdw_cdns_streams *stream,
 			u32 ch, u32 dir);
 int sdw_cdns_alloc_stream(struct sdw_cdns *cdns,
-			struct sdw_cdns_streams *stream,
-			struct sdw_cdns_port *port, u32 ch, u32 dir);
+			  struct sdw_cdns_streams *stream,
+			  struct sdw_cdns_port *port, u32 ch, u32 dir);
 void sdw_cdns_config_stream(struct sdw_cdns *cdns, struct sdw_cdns_port *port,
-			u32 ch, u32 dir, struct sdw_cdns_pdi *pdi);
+			    u32 ch, u32 dir, struct sdw_cdns_pdi *pdi);
 
 void sdw_cdns_shutdown(struct snd_pcm_substream *substream,
-				struct snd_soc_dai *dai);
+		       struct snd_soc_dai *dai);
 int sdw_cdns_pcm_set_stream(struct snd_soc_dai *dai,
-				void *stream, int direction);
+			    void *stream, int direction);
 int sdw_cdns_pdm_set_stream(struct snd_soc_dai *dai,
-				void *stream, int direction);
+			    void *stream, int direction);
 
 enum sdw_command_response
 cdns_reset_page_addr(struct sdw_bus *bus, unsigned int dev_num);
@@ -187,7 +187,7 @@ cdns_xfer_msg(struct sdw_bus *bus, struct sdw_msg *msg);
 
 enum sdw_command_response
 cdns_xfer_msg_defer(struct sdw_bus *bus,
-		struct sdw_msg *msg, struct sdw_defer *defer);
+		    struct sdw_msg *msg, struct sdw_defer *defer);
 
 enum sdw_command_response
 cdns_reset_page_addr(struct sdw_bus *bus, unsigned int dev_num);
@@ -195,5 +195,5 @@ cdns_reset_page_addr(struct sdw_bus *bus, unsigned int dev_num);
 int cdns_bus_conf(struct sdw_bus *bus, struct sdw_bus_params *params);
 
 int cdns_set_sdw_stream(struct snd_soc_dai *dai,
-		void *stream, bool pcm, int direction);
+			void *stream, bool pcm, int direction);
 #endif /* __SDW_CADENCE_H */
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
