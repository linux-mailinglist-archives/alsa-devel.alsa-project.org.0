Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBC176A2F7
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 23:36:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 798AF3E7;
	Mon, 31 Jul 2023 23:35:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 798AF3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690839364;
	bh=/G6qEZR7l6CuFZLwRfa/+iMq+7jtKFHIeF5aGbGrc1Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iuThAKKiy81Rwzgk1o6OEBKi1Kc1JdygVOFvGh0zcPRdCz7zSkfTwra67Jo4biQp8
	 uB2dLkFTHLhuhZghS3+9v8jW8/MmlpmPyyEsew4xFRpgxi3zxdJVe1hbDTBFETL8Lq
	 3T59bO8szdJAizQmctj0yH55/Wrj67tMAQPH8xyo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56E5FF80578; Mon, 31 Jul 2023 23:34:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A8BC2F8055B;
	Mon, 31 Jul 2023 23:34:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 328EEF80549; Mon, 31 Jul 2023 23:34:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,RDNS_NONE,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AC741F80153
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 23:33:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC741F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VCp7TX7H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690839190; x=1722375190;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/G6qEZR7l6CuFZLwRfa/+iMq+7jtKFHIeF5aGbGrc1Y=;
  b=VCp7TX7HjJrtrdOHSaojZZRmTwAb7sNBKoYviKo68MC1g1lb59lbAjDN
   Qa7YLVThHtywSRV+qbRNItlXceEZj1mlci8QwDtf96KZyXn9y8uP7rA5E
   Rr7hwJTLrqt93rjN3V1m+/YSDxSBeJlSFgEn+h00yHQHRqfOop54vnusV
   +EqnLPaVbAqpPLqHvZzmlRgtAbi1M7vMqZ1FwUCsEz4EpLlfXbepbl+zC
   7HUiO+wtepyxR8KavjPuuILbNHAeVe8gl6ux6DYBXhk/3YQCkvbW98lc9
   rhKJgJskNlWoZVVXt8/uP0osrMpicoha76sc+6NvkQhCfhhI74zPC2nDW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="435447533"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="435447533"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:33:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="731708912"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="731708912"
Received: from youngnic-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.180.66])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:33:07 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Curtis Malainey <cujomalainey@chromium.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 5/6] ASoC: SOF: Deprecate invalid enums in IPC3
Date: Mon, 31 Jul 2023 16:32:41 -0500
Message-Id: <20230731213242.434594-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230731213242.434594-1-pierre-louis.bossart@linux.intel.com>
References: <20230731213242.434594-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MSRMNBPUTUTNJMFECNW4OE3RRF4IA53L
X-Message-ID-Hash: MSRMNBPUTUTNJMFECNW4OE3RRF4IA53L
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MSRMNBPUTUTNJMFECNW4OE3RRF4IA53L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Curtis Malainey <cujomalainey@chromium.org>

The switch component was never completed and sat half empty for over 3
years. It was recently deleted. For modern components this would
require not change in the kernel but since this was a legacy allocation
from the enum days of IPC3 we should mark the respective enum as
deprecated.

The splitter component was never even got a source file in the firmware.
Therefore also delete it since this is not needed.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof/topology.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sound/sof/topology.h b/include/sound/sof/topology.h
index 88560281d420..906e2f327ad2 100644
--- a/include/sound/sof/topology.h
+++ b/include/sound/sof/topology.h
@@ -26,9 +26,9 @@ enum sof_comp_type {
 	SOF_COMP_MIXER,
 	SOF_COMP_MUX,
 	SOF_COMP_SRC,
-	SOF_COMP_SPLITTER,
+	SOF_COMP_DEPRECATED0, /* Formerly SOF_COMP_SPLITTER */
 	SOF_COMP_TONE,
-	SOF_COMP_SWITCH,
+	SOF_COMP_DEPRECATED1, /* Formerly SOF_COMP_SWITCH */
 	SOF_COMP_BUFFER,
 	SOF_COMP_EQ_IIR,
 	SOF_COMP_EQ_FIR,
-- 
2.39.2

