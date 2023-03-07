Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 543A26ADCD5
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 12:08:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39D611429;
	Tue,  7 Mar 2023 12:07:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39D611429
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678187310;
	bh=bTimc2MAA6BicrS4r1fMKiRlXjyMBPoe+rjIRjDpB08=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=fff6cF+TJInnsKBtktOFHJJPKsUiuYi5OzoMG7+Vp2cymh9t5J7XayX6ItdkUUQ5/
	 QSEi3UvqdPiYCEmNDVT8Cmc38HRpX72aTjJbdA1XKNkNpVRhj4CPBhkKx1zwynHk1z
	 JgaY9r1wv7jQ7pLWqkkwxWncezV5hzUUhKyJ2PCA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 68CE0F804B1;
	Tue,  7 Mar 2023 12:07:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2295F804FE; Tue,  7 Mar 2023 12:07:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 88E50F80482
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 12:07:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88E50F80482
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=elqqgChD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678187236; x=1709723236;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bTimc2MAA6BicrS4r1fMKiRlXjyMBPoe+rjIRjDpB08=;
  b=elqqgChDhkvmIRWPKjCKZhK4HLuJSgDi9oTAbN1gdMEtcFuzvYN5z4RZ
   BbvwmZE7on3ecc/rOpHTE6MjKHh8fOOf4ddMav1iOZmhURJq64EMUg67M
   ylY+FpNVHl+K/Y3i5+n9olKiA6fpWMHw1YbfwoGt6o59H3dRrQr1RwNAH
   E0PgVkefWzZuLuqFu+jJa+Jk+fgkjajHRwXpqd76UHN8iKtNf9MCuaIbz
   tj0I8bHzXjPNXgQrz6DFGZW+JfbIykITsh2CXay70LVF5wiYjguFaLhwz
   IH3FumcjhXVULSKJn971mssUV3p9aJWeAK/F/yxnmbj2T1OGxcbSuTRN/
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="333295381"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="333295381"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 03:07:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="653942516"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="653942516"
Received: from rganesh-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.47.75])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 03:07:08 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: ipc4-topology: set dmic dai index from copier
Date: Tue,  7 Mar 2023 13:07:30 +0200
Message-Id: <20230307110730.1995-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LEH3A6ICAWWPQQUZ3PCZQWJK24FTLJJD
X-Message-ID-Hash: LEH3A6ICAWWPQQUZ3PCZQWJK24FTLJJD
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 jaska.uimonen@linux.intel.com, adrian.bonislawski@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LEH3A6ICAWWPQQUZ3PCZQWJK24FTLJJD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Jaska Uimonen <jaska.uimonen@linux.intel.com>

Dmic dai index was set incorrectly to bits 5-7, when it is actually using
just the lowest 3. Fix the macro for setting the bits.

Fixes: aa84ffb72158 ("ASoC: SOF: ipc4-topology: Add support for SSP/DMIC DAI's")
Signed-off-by: Jaska Uimonen <jaska.uimonen@linux.intel.com>
Reviewed-by: Adrian Bonislawski <adrian.bonislawski@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index cf1595f8d7d2..12180c783330 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -46,7 +46,7 @@
 #define SOF_IPC4_NODE_INDEX_INTEL_SSP(x) (((x) & 0xf) << 4)
 
 /* Node ID for DMIC type DAI copiers */
-#define SOF_IPC4_NODE_INDEX_INTEL_DMIC(x) (((x) & 0x7) << 5)
+#define SOF_IPC4_NODE_INDEX_INTEL_DMIC(x) ((x) & 0x7)
 
 #define SOF_IPC4_GAIN_ALL_CHANNELS_MASK 0xffffffff
 #define SOF_IPC4_VOL_ZERO_DB	0x7fffffff
-- 
2.39.2

