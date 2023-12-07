Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A673280956D
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 23:33:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EA63A4E;
	Thu,  7 Dec 2023 23:33:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EA63A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701988410;
	bh=4mNgJNnotsHrJOFFxqMdimap3f18t/HV+ud7BxYhTaE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OWxtVoHbKE0xNQOznmOHBX4LtnlqQgTVU2II2U92sS9kUkqfVKdCZY6O48s+9oBKx
	 I16EHIlO9eyAhsy1Q/2XJC0XFqVDC/STD+wZsx4i0358W4nHqf/utxOw2cHNn/h0U/
	 7KmRBcGeykMIMP9dRjymARx+rznW0SIc6EgH9D74=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20C58F80571; Thu,  7 Dec 2023 23:31:26 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 639EDF80588;
	Thu,  7 Dec 2023 23:31:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13F2FF80588; Thu,  7 Dec 2023 23:31:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F2429F8055A
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 23:30:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2429F8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LONDLdKd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701988224; x=1733524224;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4mNgJNnotsHrJOFFxqMdimap3f18t/HV+ud7BxYhTaE=;
  b=LONDLdKdQNQYqVrFNwNxlCMH3ssckMR3qfDcKBH5yjmNL2RzrkPSMPNW
   PxZ1PJL4f7/HtiEIB4AP9QaXtai9MOLQApf/TxYm9Ov0bzT8Y1IVr/IJI
   EkN6zgRMsLZckDSnQEnTVvfzjl3VHrtO1D/damcXc5W3SIX1hm1YiykRe
   yiARihvwrJ0YF5UxwAyo9K5nvP1fZ798ASOYO1re8G8ZcALYMkwUX3PfT
   etYmj1o6T/NzxdmcLpqRKpCF5mwmk56iqSGHb7Qcx9rSz0cWUI2fPNVhx
   iDelWgqoJp6DBeXfnthK/RfmuKwJxWthsswzJl4eO1h+NA6hdpMZdJufr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="480516671"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600";
   d="scan'208";a="480516671"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 14:30:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="895307498"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600";
   d="scan'208";a="895307498"
Received: from hrcolco-mobl3.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.148.159])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 14:30:19 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	vinod.koul@intel.com,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	srinivas.kandagatla@linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	vijendar.mukunda@amd.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [RFC PATCH 11/16] soundwire: intel_auxdevice: add indirection for BPT
 open/close/send_async/wait
Date: Thu,  7 Dec 2023 16:29:39 -0600
Message-Id: <20231207222944.663893-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OPBGFRAXPV43TRBRGSESUEUCNQQBISOG
X-Message-ID-Hash: OPBGFRAXPV43TRBRGSESUEUCNQQBISOG
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OPBGFRAXPV43TRBRGSESUEUCNQQBISOG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Mirror abstraction added for master ops.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/intel_auxdevice.c | 55 +++++++++++++++++++++++++++++
 include/linux/soundwire/sdw_intel.h | 16 +++++++++
 2 files changed, 71 insertions(+)

diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
index 93698532deac..1cdf4699cf2a 100644
--- a/drivers/soundwire/intel_auxdevice.c
+++ b/drivers/soundwire/intel_auxdevice.c
@@ -74,6 +74,56 @@ static bool is_wake_capable(struct sdw_slave *slave)
 	return false;
 }
 
+static int generic_bpt_stream_open(struct sdw_bus *bus,
+				   struct sdw_slave *slave,
+				   enum sdw_bpt_type mode,
+				   struct sdw_bpt_msg *msg)
+{
+	struct sdw_cdns *cdns = bus_to_cdns(bus);
+	struct sdw_intel *sdw = cdns_to_intel(cdns);
+
+	if (sdw->link_res->hw_ops->bpt_open_stream)
+		return sdw->link_res->hw_ops->bpt_open_stream(sdw, slave, mode, msg);
+	return -ENOTSUPP;
+}
+
+static int generic_bpt_stream_close(struct sdw_bus *bus,
+				    struct sdw_slave *slave,
+				    enum sdw_bpt_type mode,
+				    struct sdw_bpt_msg *msg)
+{
+	struct sdw_cdns *cdns = bus_to_cdns(bus);
+	struct sdw_intel *sdw = cdns_to_intel(cdns);
+
+	if (sdw->link_res->hw_ops->bpt_close_stream)
+		return sdw->link_res->hw_ops->bpt_close_stream(sdw, slave, mode, msg);
+	return -ENOTSUPP;
+}
+
+static int generic_bpt_send_async(struct sdw_bus *bus,
+				  struct sdw_slave *slave,
+				  struct sdw_bpt_msg *msg)
+{
+	struct sdw_cdns *cdns = bus_to_cdns(bus);
+	struct sdw_intel *sdw = cdns_to_intel(cdns);
+
+	if (sdw->link_res->hw_ops->bpt_send_async)
+		return sdw->link_res->hw_ops->bpt_send_async(sdw, slave, msg);
+	return -ENOTSUPP;
+}
+
+static int generic_bpt_wait(struct sdw_bus *bus,
+			    struct sdw_slave *slave,
+			    struct sdw_bpt_msg *msg)
+{
+	struct sdw_cdns *cdns = bus_to_cdns(bus);
+	struct sdw_intel *sdw = cdns_to_intel(cdns);
+
+	if (sdw->link_res->hw_ops->bpt_wait)
+		return sdw->link_res->hw_ops->bpt_wait(sdw, slave, msg);
+	return -ENOTSUPP;
+}
+
 static int generic_pre_bank_switch(struct sdw_bus *bus)
 {
 	struct sdw_cdns *cdns = bus_to_cdns(bus);
@@ -203,6 +253,11 @@ static struct sdw_master_ops sdw_intel_ops = {
 	.get_device_num =  intel_get_device_num_ida,
 	.put_device_num = intel_put_device_num_ida,
 	.new_peripheral_assigned = generic_new_peripheral_assigned,
+
+	.bpt_open_stream = generic_bpt_stream_open,
+	.bpt_close_stream = generic_bpt_stream_close,
+	.bpt_send_async = generic_bpt_send_async,
+	.bpt_wait = generic_bpt_wait,
 };
 
 /*
diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index 00bb22d96ae5..9e114df37a5b 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -423,6 +423,22 @@ struct sdw_intel_hw_ops {
 	bool (*sync_check_cmdsync_unlocked)(struct sdw_intel *sdw);
 
 	void (*program_sdi)(struct sdw_intel *sdw, int dev_num);
+
+	int (*bpt_open_stream)(struct sdw_intel *sdw,
+			       struct sdw_slave *slave,
+			       enum sdw_bpt_type mode,
+			       struct sdw_bpt_msg *msg);
+	int (*bpt_close_stream)(struct sdw_intel *sdw,
+				struct sdw_slave *slave,
+				enum sdw_bpt_type mode,
+				struct sdw_bpt_msg *msg);
+	int (*bpt_send_async)(struct sdw_intel *sdw,
+			      struct sdw_slave *slave,
+			      struct sdw_bpt_msg *msg);
+	int (*bpt_wait)(struct sdw_intel *sdw,
+			struct sdw_slave *slave,
+			struct sdw_bpt_msg *msg);
+
 };
 
 extern const struct sdw_intel_hw_ops sdw_intel_cnl_hw_ops;
-- 
2.39.2

