Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5936C6B87B0
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Mar 2023 02:43:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99CA41457;
	Tue, 14 Mar 2023 02:42:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99CA41457
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678758224;
	bh=hZc2EGLHxJx9i0Pailyxx3z91nn/GaDqbMywZWeyhkI=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JusSUYplvDYcLI5PTBxlQr0GZGX5uaxg7M+Hc+q3uZkJjqQsCXRpt5OL3oY8EPulS
	 EQh06N5ALxdUDeGw8fgYa7+wwo7WbQqqTRhb0iabZatourZ3dMK2R+clzQL3baiF3O
	 L4V9SUY4eLvrWZdvX3T6U9Wif0dggDHL+h7kEv1k=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CB9BBF8055A;
	Tue, 14 Mar 2023 02:41:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FD17F80520; Tue, 14 Mar 2023 02:41:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 70CB3F80482
	for <alsa-devel@alsa-project.org>; Tue, 14 Mar 2023 02:41:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70CB3F80482
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=AuUtKHcQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678758078; x=1710294078;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hZc2EGLHxJx9i0Pailyxx3z91nn/GaDqbMywZWeyhkI=;
  b=AuUtKHcQ0RzrFcQ95e1Gc9lWieUVXCCcVqEy9BG2vHxS9goCiPTMtQTF
   Z600V2MiDdv775LBtDeSPRW44MBw16Ek+mwhXTPWQV5bfCyvK7itDR73Y
   ZEdy4VhEA9xk8HF71QAjEjy3gBq5fV/IYyAVFzNAtr6LoHzznL+m7vkEf
   04RE3TrZVSB1LFmdG2MdKeXLTzQpD5ulFA9811XBYbKa95SJbGEH8bDCG
   U/CskfYvht8Vo5DenB9b768PmREscQxggOflhbbuYuKtFT7ByMCNEe8d8
   /vUzAlUQ+BLkoTewcY9Pn4odVsnfYH2aDXaOiLVS1MFvJpoG0k4VWBMBG
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="316949242"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400";
   d="scan'208";a="316949242"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 18:41:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="711327399"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400";
   d="scan'208";a="711327399"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 18:41:14 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 05/16] soundwire: intel: simplify sync_go sequence
Date: Tue, 14 Mar 2023 09:53:59 +0800
Message-Id: <20230314015410.487311-6-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230314015410.487311-1-yung-chuan.liao@linux.intel.com>
References: <20230314015410.487311-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UMHUFYUDD6A6FKDPRNRYUCDPBTUM733M
X-Message-ID-Hash: UMHUFYUDD6A6FKDPRNRYUCDPBTUM733M
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: vinod.koul@linaro.org, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UMHUFYUDD6A6FKDPRNRYUCDPBTUM733M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

In the existing code, the SHIM_SYNC::SYNC_GO bit is set, and the code
waits for it to return to zero.

That second wait part is just wrong: the SYNC_GO bit is *write-only* so
there's no way to know if it's cleared by hardware. The code works
because the value for a read-only bit is zero, but that's really just
luck.

Simplify the sequence to a plain read-modify-write.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 2c1c905f8889..6fdb10117e59 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -475,7 +475,6 @@ static int intel_shim_sync_go_unlocked(struct sdw_intel *sdw)
 {
 	void __iomem *shim = sdw->link_res->shim;
 	u32 sync_reg;
-	int ret;
 
 	/* Read SYNC register */
 	sync_reg = intel_readl(shim, SDW_SHIM_SYNC);
@@ -487,13 +486,9 @@ static int intel_shim_sync_go_unlocked(struct sdw_intel *sdw)
 	 */
 	sync_reg |= SDW_SHIM_SYNC_SYNCGO;
 
-	ret = intel_clear_bit(shim, SDW_SHIM_SYNC, sync_reg,
-			      SDW_SHIM_SYNC_SYNCGO);
+	intel_writel(shim, SDW_SHIM_SYNC, sync_reg);
 
-	if (ret < 0)
-		dev_err(sdw->cdns.dev, "SyncGO clear failed: %d\n", ret);
-
-	return ret;
+	return 0;
 }
 
 static int intel_shim_sync_go(struct sdw_intel *sdw)
-- 
2.25.1

