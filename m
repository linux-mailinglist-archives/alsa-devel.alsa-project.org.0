Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C86876D165
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 17:14:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C77C846;
	Wed,  2 Aug 2023 17:14:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C77C846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690989295;
	bh=znXh8jhk50KTy9cQHFdBDmGE/L6ZUCXCnIswbewkii8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GpBg5GgVEhNXIJkY+4iCM9p4bSY6dufM289Zg4cTN/renG9HLni4VuGRtRU5gRykE
	 43GHOKl9dfO14+8YzTxa7A57fqyX2jH0TdeWv3dE3lnbc1JuryjPUW4ZmATKaE0c6C
	 L3WQgjyVfOj0WOtjQYJ0bTmu89rDwoIR7tH0764k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB4ECF80580; Wed,  2 Aug 2023 17:12:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69E96F8056F;
	Wed,  2 Aug 2023 17:12:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C81AAF80553; Wed,  2 Aug 2023 17:12:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RDNS_NONE,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9C94BF801D5
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 17:12:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C94BF801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LLg1o+gv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690989167; x=1722525167;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=znXh8jhk50KTy9cQHFdBDmGE/L6ZUCXCnIswbewkii8=;
  b=LLg1o+gvgEXeW0uvfLHmH11dzAtoOCYZqn15F0wHhDv54FCPaoleuKML
   VlU5aTodVX4aU0N/CDPQLqBHWM5X52OFak40aJv0ERS3RAg73Qpt4n64Q
   8F30q/IlgtdLUrI2I5114PyXqLGwS5F8UIQjhHpASB8dWBvidJvpQXbrr
   lq61lyWzn6VpgFCsvR6IA2cbGcLui17/a0w79BU/0Yp8Y6vJzn8fWxdl7
   CY44dfDdq61alIRKF3pYmlzT21cIDe8qtaBa44mo1MY/YPfrfmOvoSOhJ
   JCYo43q9S/Oy1W1aDIkqTKh5Gx7DAg22Ah5xMGsOPrKecGqdxExMEBdNp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="369607285"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200";
   d="scan'208";a="369607285"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 08:01:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="732428698"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200";
   d="scan'208";a="732428698"
Received: from rickylop-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.125.114])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 08:01:16 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	"T, Arun" <arun.t@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 5/5] ALSA: hda/i915: extend connectivity check to cover Intel
 ARL
Date: Wed,  2 Aug 2023 10:01:05 -0500
Message-Id: <20230802150105.24604-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802150105.24604-1-pierre-louis.bossart@linux.intel.com>
References: <20230802150105.24604-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LRFJDGBPZ2EKBQCV5T44LLZLSQI4KHSE
X-Message-ID-Hash: LRFJDGBPZ2EKBQCV5T44LLZLSQI4KHSE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LRFJDGBPZ2EKBQCV5T44LLZLSQI4KHSE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Expand the HDA/I915 connectivity check to correctly handle
the PCI topology used in some Intel Arrow Lake products.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Tested-by: "T, Arun" <arun.t@intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/hda/hdac_i915.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
index 2a451ff4fe6a..b428537f284c 100644
--- a/sound/hda/hdac_i915.c
+++ b/sound/hda/hdac_i915.c
@@ -75,16 +75,22 @@ static bool connectivity_check(struct pci_dev *i915, struct pci_dev *hdac)
 	if (bus_a == bus_b)
 		return true;
 
+	bus_a = bus_a->parent;
+	bus_b = bus_b->parent;
+
+	/* connected via parent bus (may be NULL!) */
+	if (bus_a == bus_b)
+		return true;
+
+	if (!bus_a || !bus_b)
+		return false;
+
 	/*
 	 * on i915 discrete GPUs with embedded HDA audio, the two
 	 * devices are connected via 2nd level PCI bridge
 	 */
 	bus_a = bus_a->parent;
 	bus_b = bus_b->parent;
-	if (!bus_a || !bus_b)
-		return false;
-	bus_a = bus_a->parent;
-	bus_b = bus_b->parent;
 	if (bus_a && bus_a == bus_b)
 		return true;
 
-- 
2.39.2

