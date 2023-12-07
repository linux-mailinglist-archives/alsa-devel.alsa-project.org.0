Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FC3809562
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 23:31:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEB95206;
	Thu,  7 Dec 2023 23:31:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEB95206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701988314;
	bh=n1mWbGKFemsTLPwuTmI6hhmqxPf97t6/N27jfi+k5vQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hSCif8OA86Ey+IQmg5n5suQdNKiw2Eb08jNO/uVhpjxYSxcbtOc5TvzZQbGLbS3/X
	 1us2soyVz+pmsoAmpdocqgvA+gqeqXisxjndaJ1aqfVcTvM2RZEaAJTejBVdd8nswr
	 WZu5Ll6P01C8KGIJc1kpwwhhWdyJ89K3cs8QVYI8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D770F80631; Thu,  7 Dec 2023 23:30:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66AFFF80613;
	Thu,  7 Dec 2023 23:30:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19D5CF805C3; Thu,  7 Dec 2023 23:30:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 64ED5F8025F
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 23:30:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64ED5F8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ImUSEvK7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701988216; x=1733524216;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n1mWbGKFemsTLPwuTmI6hhmqxPf97t6/N27jfi+k5vQ=;
  b=ImUSEvK73Xhvv5xt6iydAWgbTN86Zyz454kLxXkuWVGEQttRD6XBnV5t
   yvdxPcctLwEzkrUALU/i9mf1BqWFEzR78Nxh1b1g/nG0UsGIwSq2YXgYB
   BUVksDH9C6FICOHKcybkXS9K00cA1ZRW6AuYtta85IrZkZIWkSOxogPgM
   HQrg7R77eybPFaVMxROBekJO+f9MjLY9OLAw5YwZy56Xi1F9lUgO5iVsM
   0ujsXr7ATGwEye2Gkh77KyaD+kAYh0mqPjAbHFJtY5mE4ScawkJrs3Bqi
   btUyII7JPgzefHkUxiRYicP2vIhpTDA2zRJ2/5iDUnREpGgHDuBUO1llz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="480516609"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600";
   d="scan'208";a="480516609"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 14:30:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="895307473"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600";
   d="scan'208";a="895307473"
Received: from hrcolco-mobl3.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.148.159])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 14:30:10 -0800
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
Subject: [RFC PATCH 04/16] soundwire: extend sdw_stream_type to BPT
Date: Thu,  7 Dec 2023 16:29:32 -0600
Message-Id: <20231207222944.663893-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YMR2LIFG4BEYNQ7LFIDMBEBORP5QOYFN
X-Message-ID-Hash: YMR2LIFG4BEYNQ7LFIDMBEBORP5QOYFN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YMR2LIFG4BEYNQ7LFIDMBEBORP5QOYFN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

BPT/BRA need to be special cased, i.e. there's no point in using the
bandwidth allocation since the entire frame can be used.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/linux/soundwire/sdw.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 5cc7fed1bf19..9f04f3ad044f 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -140,12 +140,14 @@ enum sdw_dpn_pkg_mode {
  *
  * @SDW_STREAM_PCM: PCM data stream
  * @SDW_STREAM_PDM: PDM data stream
+ * @SDW_STREAM_BPT: BPT data stream
  *
  * spec doesn't define this, but is used in implementation
  */
 enum sdw_stream_type {
 	SDW_STREAM_PCM = 0,
 	SDW_STREAM_PDM = 1,
+	SDW_STREAM_BPT = 2,
 };
 
 /**
@@ -959,7 +961,7 @@ struct sdw_port_config {
  * @ch_count: Channel count of the stream
  * @bps: Number of bits per audio sample
  * @direction: Data direction
- * @type: Stream type PCM or PDM
+ * @type: Stream type PCM, PDM or BPT
  */
 struct sdw_stream_config {
 	unsigned int frame_rate;
@@ -1009,7 +1011,7 @@ struct sdw_stream_params {
  * @name: SoundWire stream name
  * @params: Stream parameters
  * @state: Current state of the stream
- * @type: Stream type PCM or PDM
+ * @type: Stream type PCM, PDM or BPT
  * @master_list: List of Master runtime(s) in this stream.
  * master_list can contain only one m_rt per Master instance
  * for a stream
-- 
2.39.2

