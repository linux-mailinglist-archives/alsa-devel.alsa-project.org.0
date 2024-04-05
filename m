Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E51989991D
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Apr 2024 11:14:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCE002D1F;
	Fri,  5 Apr 2024 11:14:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCE002D1F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712308453;
	bh=57TGCSCkjrsonGnK9tulnMl2oRX3ewM3Ljw5o763Gfs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QH1P6onYy44ujBv/pvl3eal65ll+tLxzxQLJRSyGEJIHTnnpJcHPjH+w7o3SPcqy+
	 11ea26Vb7WimbF0poh7kh1Bd+GENmWRddIgbIYVthemu7Ez/CsFO5SVi3LTEykz9Fd
	 PIMG6HgVRHqtoMbXE9Fg6jD7OeI2c5DDhft+GHrI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 595FAF805C3; Fri,  5 Apr 2024 11:10:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99B32F80238;
	Fri,  5 Apr 2024 11:10:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5A42F8057A; Fri,  5 Apr 2024 11:10:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B8C8BF80238
	for <alsa-devel@alsa-project.org>; Fri,  5 Apr 2024 11:08:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8C8BF80238
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Ckf9K0jJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712308103; x=1743844103;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=57TGCSCkjrsonGnK9tulnMl2oRX3ewM3Ljw5o763Gfs=;
  b=Ckf9K0jJnaCDr9cyLTld5VyIPgIt8PFead1QtkAohQKKSyXWe7fOOMe3
   /3m1W/p7GVzWa9zaEEK98WqgQwIBbjdOhiywCj7JVSBTSDVE+SOkIU2oO
   yiS+ikABdYB5DwFnVUXeR+mo/oJdRQTSUhlhOeMMWcV6+/ZmJeUkogvUK
   ul0CzkteoxhT3TL/qUp9TtiMcQf5PN+FBgsGT1+Ig0H0zlGj0NyrDL2zC
   5fvZCggsjw/P3LKtZK/4kuEDH44qU+s/y87hdP0xrgaF+tWh+3k6y5nmP
   H5zaoI/6MBWS08JhVUbFa7ArrtTfgaPvcDlz0/cI0ZtOVKsO9BEzehOCL
   g==;
X-CSE-ConnectionGUID: HKIS3zJ1SA2kiGieh/tTxQ==
X-CSE-MsgGUID: 0RAkL4dqT520fLVp+y/mDQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7787451"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000";
   d="scan'208";a="7787451"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 02:08:20 -0700
X-CSE-ConnectionGUID: QmZPM82BR9WvruM1H3RJDg==
X-CSE-MsgGUID: uQ0JU06KTxySXF9any7D8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000";
   d="scan'208";a="19042433"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa009.jf.intel.com with ESMTP; 05 Apr 2024 02:08:18 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 07/13] ASoC: Intel: avs: Fix potential integer overflow
Date: Fri,  5 Apr 2024 11:09:23 +0200
Message-Id: <20240405090929.1184068-8-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240405090929.1184068-1-cezary.rojewski@intel.com>
References: <20240405090929.1184068-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2EAXTFJAK22BO3TXGYYPIKM7HTIRXCNK
X-Message-ID-Hash: 2EAXTFJAK22BO3TXGYYPIKM7HTIRXCNK
X-MailFrom: cezary.rojewski@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2EAXTFJAK22BO3TXGYYPIKM7HTIRXCNK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

While stream_tag for CLDMA on SKL-based platforms is always 1, function
hda_cldma_setup() uses AZX_SD_CTL_STRM() macro which does:
	stream_tag << 20

what combined with stream_tag type of 'unsigned int' generates a
potential overflow issue. Update the field type to fix that.

Fixes: 45864e49a05a ("ASoC: Intel: avs: Implement CLDMA transfer")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/cldma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/cldma.c b/sound/soc/intel/avs/cldma.c
index d7a9390b5e48..585579840b64 100644
--- a/sound/soc/intel/avs/cldma.c
+++ b/sound/soc/intel/avs/cldma.c
@@ -35,7 +35,7 @@ struct hda_cldma {
 
 	unsigned int buffer_size;
 	unsigned int num_periods;
-	unsigned int stream_tag;
+	unsigned char stream_tag;
 	void __iomem *sd_addr;
 
 	struct snd_dma_buffer dmab_data;
-- 
2.25.1

