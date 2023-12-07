Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0467380956C
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 23:33:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24B7D83E;
	Thu,  7 Dec 2023 23:33:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24B7D83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701988399;
	bh=0d60EUy/Rv1jcqrB9RHzlJjXK5+aoVyqe1eJuA5s570=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qUxnWPEX77ystR+IHqaS+IUjsFzWJwfRzBtejQFCgN6GL++/dIpvmsBLhJ73IQP2P
	 lyIhAlE/+uMRkwnf/BVxWflXCDacjwgnUlRE7AAGtO9zc0u/mhyg3jPJ9cRV7KVt3C
	 0Ujj01HFQh+1Qw8ALP2t+cAY0k0jGerKhbuVCuzQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A47F0F806BB; Thu,  7 Dec 2023 23:31:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B840F806B9;
	Thu,  7 Dec 2023 23:31:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71F82F80578; Thu,  7 Dec 2023 23:31:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8BF40F80563
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 23:30:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BF40F80563
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=MZaQ9Rpe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701988225; x=1733524225;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0d60EUy/Rv1jcqrB9RHzlJjXK5+aoVyqe1eJuA5s570=;
  b=MZaQ9RpeeXoCLI+wjASELn6zpQkW736G3gOnqQgLNEf2A4NdYFtjjFty
   COQsVQLhIlexk9jESIZIZCMhpYSEA/3B8K55nFJaOUaDJLeiiAyIZWTmh
   77fHnd4DTfv9ujDTuJDC9WF8nDysI1zv62AoakWL1Esp6byFx4wuPVfFO
   fOg8h4BuUt0iPJVzp1JXI7cbTcYWvnNl/MqGi2B3ncM7Nkhl0zX5Ht9Y8
   t4v8UBw2LMVRj/pySBWV+o41omAANwGJgfoPCR6aLb9OBhQKq8Q1r5qn6
   WUiUtUVUB9Bcv0tuMeF+f3zK9sDeZ1QdfLA8CJujpN+MicIDPG/wIip5Q
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="480516688"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600";
   d="scan'208";a="480516688"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 14:30:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="895307507"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600";
   d="scan'208";a="895307507"
Received: from hrcolco-mobl3.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.148.159])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 14:30:22 -0800
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
Subject: [RFC PATCH 13/16] soundwire: intel: add BPT context definition
Date: Thu,  7 Dec 2023 16:29:41 -0600
Message-Id: <20231207222944.663893-14-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IWZFHSVM55GTHQBVNUEY4QF7LXPDHC3J
X-Message-ID-Hash: IWZFHSVM55GTHQBVNUEY4QF7LXPDHC3J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IWZFHSVM55GTHQBVNUEY4QF7LXPDHC3J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This is needed to be shared between open/send_async/close.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/intel.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
index 511932c55216..2289719f318c 100644
--- a/drivers/soundwire/intel.h
+++ b/drivers/soundwire/intel.h
@@ -48,11 +48,23 @@ struct sdw_intel_link_res {
 	struct hdac_bus *hbus;
 };
 
+struct sdw_intel_bpt {
+	struct hdac_ext_stream *bpt_tx_stream;
+	struct snd_dma_buffer dmab_tx_bdl;
+	struct hdac_ext_stream *bpt_rx_stream;
+	struct snd_dma_buffer dmab_rx_bdl;
+	unsigned int pdi0_buffer_size;
+	unsigned int pdi1_buffer_size;
+	unsigned int num_frames;
+	unsigned int data_per_frame;
+};
+
 struct sdw_intel {
 	struct sdw_cdns cdns;
 	int instance;
 	struct sdw_intel_link_res *link_res;
 	bool startup_done;
+	struct sdw_intel_bpt bpt_ctx;
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *debugfs;
 #endif
-- 
2.39.2

