Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 835566B7807
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 13:50:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23E091457;
	Mon, 13 Mar 2023 13:50:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23E091457
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678711852;
	bh=Uhvu/MLFHFaz/Fv865n31KDHESAAi8YKTrMyphRRZd0=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KTcoruHsiu+gcUH29FqA3ad/OHmM5GuZafGo2gMX9LNzlOio+w6a8ere8WRjaig/x
	 gJE6iFQcUhao/QTCkvjGKFBYyDHEa3PtXPRvIqojWGN/oYky6hLO3pd4VXq7W3+RqD
	 AXjzXFRb0l/0xDZpciQBm3SoiWc5NnPXhJqa/Ei8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C917F804B1;
	Mon, 13 Mar 2023 13:49:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12BDAF804B1; Mon, 13 Mar 2023 13:49:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 89DA1F80093
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 13:48:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89DA1F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dvvpGHii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678711740; x=1710247740;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Uhvu/MLFHFaz/Fv865n31KDHESAAi8YKTrMyphRRZd0=;
  b=dvvpGHiimmxpvoefOZUh0g/JYN1xTaqv2IO7XnGr42S0yVoUdAaBZRID
   wT7rmGj2wSxEYkQ/8oSCD06rhddTsOyU8mWCU9XOVuUiYRtFspGNIOI5t
   POXlTwHue/gvUXSnVGmCfjjlbvXtcZEByqNFlS01iq0X7mKPr5NQPLwLx
   IsqMnc0Eqs0C+yfIcPJbae3PUpuMfuQ2PLTXNIjLVh9nPDh4Ho0d5oD5A
   B3Xjo4CJFhv756hyyW5HKUkiPSZ9F7OLDRrI/JLsm1HxVzW9YYBjfd5zJ
   WG0Mw5LPsvEOLglbMjQqbRrPFuSKexK/GdwJyphB2UiTW6mEPcukDNnh/
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="399728033"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400";
   d="scan'208";a="399728033"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 05:48:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="711116402"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400";
   d="scan'208";a="711116402"
Received: from tchambon-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.43.68])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 05:48:34 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 01/11] ASoC: SOF: rename a couple of tokens
Date: Mon, 13 Mar 2023 14:48:46 +0200
Message-Id: <20230313124856.8140-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313124856.8140-1-peter.ujfalusi@linux.intel.com>
References: <20230313124856.8140-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GO3OUD57ZG727NJPSKN5UY3BKW3R77KS
X-Message-ID-Hash: GO3OUD57ZG727NJPSKN5UY3BKW3R77KS
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GO3OUD57ZG727NJPSKN5UY3BKW3R77KS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Rename SOF_TKN_CAVS_AUDIO_FORMAT_IN_VALID and
SOF_TKN_CAVS_AUDIO_FORMAT_OUT_VALID as
SOF_TKN_CAVS_AUDIO_FORMAT_IN_VALID_BIT_DEPTH and
SOF_TKN_CAVS_AUDIO_FORMAT_OUT_VALID_BIT_DEPTH respectively.

These are currently not used.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/uapi/sound/sof/tokens.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/uapi/sound/sof/tokens.h b/include/uapi/sound/sof/tokens.h
index bacaf8a6317e..a1ef6b5c0d45 100644
--- a/include/uapi/sound/sof/tokens.h
+++ b/include/uapi/sound/sof/tokens.h
@@ -173,7 +173,7 @@
 /* CAVS AUDIO FORMAT */
 #define SOF_TKN_CAVS_AUDIO_FORMAT_IN_RATE	1900
 #define SOF_TKN_CAVS_AUDIO_FORMAT_IN_BIT_DEPTH	1901
-#define SOF_TKN_CAVS_AUDIO_FORMAT_IN_VALID_BIT	1902
+#define SOF_TKN_CAVS_AUDIO_FORMAT_IN_VALID_BIT_DEPTH	1902
 #define SOF_TKN_CAVS_AUDIO_FORMAT_IN_CHANNELS	1903
 #define SOF_TKN_CAVS_AUDIO_FORMAT_IN_CH_MAP	1904
 #define SOF_TKN_CAVS_AUDIO_FORMAT_IN_CH_CFG	1905
@@ -183,7 +183,7 @@
 /* intentional token numbering discontinuity, reserved for future use */
 #define SOF_TKN_CAVS_AUDIO_FORMAT_OUT_RATE	1930
 #define SOF_TKN_CAVS_AUDIO_FORMAT_OUT_BIT_DEPTH	1931
-#define SOF_TKN_CAVS_AUDIO_FORMAT_OUT_VALID_BIT	1932
+#define SOF_TKN_CAVS_AUDIO_FORMAT_OUT_VALID_BIT_DEPTH 1932
 #define SOF_TKN_CAVS_AUDIO_FORMAT_OUT_CHANNELS	1933
 #define SOF_TKN_CAVS_AUDIO_FORMAT_OUT_CH_MAP	1934
 #define SOF_TKN_CAVS_AUDIO_FORMAT_OUT_CH_CFG	1935
-- 
2.39.2

