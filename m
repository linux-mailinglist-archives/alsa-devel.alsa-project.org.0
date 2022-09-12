Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD915B611C
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Sep 2022 20:37:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 639E1167B;
	Mon, 12 Sep 2022 20:36:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 639E1167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663007866;
	bh=YjL3r9x5xNvvzvzk33JWDEor4frkiwK8OFLk1xqsbwg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oyf1Bk++47tdUBjlxd+oEI2KVMJSbAVE7a1u7aZwNjl5NSdSwhvM26EXv5L0GXQVI
	 u0oiiUd4ufQRwhYMxuCtHvQ8xgMfWPVs2U0RNquijL+KPH64agknYz54vi6UAfLRqR
	 5py3u5qdGdDw+tdyahBy0f8+L+l00Pigq/IdCtGY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A90C5F80095;
	Mon, 12 Sep 2022 20:36:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 960DCF8027B; Mon, 12 Sep 2022 20:36:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9183EF800FE
 for <alsa-devel@alsa-project.org>; Mon, 12 Sep 2022 20:36:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9183EF800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="O+5cT5lI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663007798; x=1694543798;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YjL3r9x5xNvvzvzk33JWDEor4frkiwK8OFLk1xqsbwg=;
 b=O+5cT5lIIZvkDvCypXJThMRrY4p/JG0/mUgn+diSE6wCIar1MYFoiYhj
 uxCu54nh83RCRc1cgNLgw6jgUk7M70HMmCAti9N6yZJeQ3fNZZpsEAhoU
 py75xBn70AZ3iakoxENm8WYMgl4St15xA0eYM6FlJyRC50+Lbex/wc38L
 Lfjy3wEM4RTWNVVWRfdV4kkqQpJSDca3hIkZw8XfEiiOK1QmItHlrXXRi
 YxCBMnuCyPib4ZXLAtT19pbWY0bLsTtoIQTSu0kZNrmAcobGUh2Akqsew
 IGUBKopiCtrwftced65fmrLN6b8GUOjmMaVZmd89twJy0PJ25lK0lLbnW Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="324177949"
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="324177949"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 11:36:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="567276601"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga003.jf.intel.com with ESMTP; 12 Sep 2022 11:36:20 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH] ALSA: hda: add Intel 5 Series / 3400 PCI DID
Date: Mon, 12 Sep 2022 21:37:16 +0300
Message-Id: <20220912183716.2126312-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Handle 0x3b57 variant with same AZX_DCAPS_INTEL_PCH_NOPM
capabilities as 0x3b56. In practise this allow use of HDMI/DP
display audio via i915.

BugLink: https://gitlab.freedesktop.org/drm/intel/-/issues/2751
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/pci/hda/hda_intel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 7e605ce43f41..2a93bc64c2d8 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2543,6 +2543,8 @@ static const struct pci_device_id azx_ids[] = {
 	/* 5 Series/3400 */
 	{ PCI_DEVICE(0x8086, 0x3b56),
 	  .driver_data = AZX_DRIVER_SCH | AZX_DCAPS_INTEL_PCH_NOPM },
+	{ PCI_DEVICE(0x8086, 0x3b57),
+	  .driver_data = AZX_DRIVER_SCH | AZX_DCAPS_INTEL_PCH_NOPM },
 	/* Poulsbo */
 	{ PCI_DEVICE(0x8086, 0x811b),
 	  .driver_data = AZX_DRIVER_SCH | AZX_DCAPS_INTEL_PCH_BASE },

base-commit: 0186f7325909dec0cb52814384062f6de3b87941
-- 
2.37.3

