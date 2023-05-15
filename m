Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC70702677
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 09:53:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8C071E2;
	Mon, 15 May 2023 09:52:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8C071E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684137215;
	bh=SiCBDBnlz88gKGLR73uUCWFOWyCRfe4txr9qACADick=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ETJNqczIbfFRRShbG9bll/S/o7LnTYsVHEwPedlNyef8gFQ5jx3Ptih1M7yjpCY4m
	 8JSXsyrhRY3XcBej5fffmoKXrJpatVFqkSs49R+cPkLBZjOkbtbcgzwCQ8MrbO7D1l
	 KYOEHsrMQ0RW62+DZ+XXy4XJNdErx4DwUCBPBrOI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E84D3F8016D; Mon, 15 May 2023 09:52:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 756A4F8025A;
	Mon, 15 May 2023 09:52:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED82AF80272; Mon, 15 May 2023 09:52:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BD131F8024E
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 09:52:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD131F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QV4Q+we6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684137159; x=1715673159;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SiCBDBnlz88gKGLR73uUCWFOWyCRfe4txr9qACADick=;
  b=QV4Q+we691A+dNfTsrMngXeqA2duvQ+3cOdQx8ZE5OQOXpEX4ySh0Mf8
   N6vJM7ETw/0EsiMwg9H/26WZloYJ9DM0skR69pzDnNo9gFiqvAoyeM1JI
   1judB3gflc/c7//7AkCiWux+Izo/wUyTSC0Auxu4IbxBIDJ8680JZAVl+
   txHEMtpqcKs5eQuAacQNMu7H1L0si+pQuuv4u34/5mjvxBq1CqFHZdZGQ
   VFwwrFVWNT/Ax3WUJf69xbkDqb3RijGqll5XVlFavJzihfwBBwjRjwzJz
   5BxRST+OGWOdEUXa8/64WR5KQSC9b1F02kRRjI3WQyKUr8fFynoWoaHIR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="335676056"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200";
   d="scan'208";a="335676056"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 00:52:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="731550650"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200";
   d="scan'208";a="731550650"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 00:52:30 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH] soundwire: intel: read AC timing control register before
 updating it
Date: Mon, 15 May 2023 16:13:01 +0800
Message-Id: <20230515081301.12921-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QG5ANTPSWQZH2KUNPLBGOAYJEVN6TGHR
X-Message-ID-Hash: QG5ANTPSWQZH2KUNPLBGOAYJEVN6TGHR
X-MailFrom: yung-chuan.liao@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QG5ANTPSWQZH2KUNPLBGOAYJEVN6TGHR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Chao Song <chao.song@linux.intel.com>

Start from ACE1.x, DOAISE is added to AC timing control
register bit 5, it combines with DOAIS to get effective
timing, and has the default value 1.

The current code fills DOAIS, DACTQE and DODS bits to a
variable initialized to zero, and updates the variable
to AC timing control register. With this operation, We
change DOAISE to 0, and force a much more aggressive
timing. The timing is even unable to form a working
waveform on SDA pin on Meteorlake.

This patch uses read-modify-write operation for the AC
timing control register access, thus makes sure those
bits not supposed and intended to change are not touched.

Signed-off-by: Chao Song <chao.song@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 238acf5c97a9..8cd2c73ac66f 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -260,7 +260,7 @@ static void intel_shim_init(struct sdw_intel *sdw)
 {
 	void __iomem *shim = sdw->link_res->shim;
 	unsigned int link_id = sdw->instance;
-	u16 ioctl = 0, act = 0;
+	u16 ioctl = 0, act;
 
 	/* Initialize Shim */
 	ioctl |= SDW_SHIM_IOCTL_BKE;
@@ -281,6 +281,7 @@ static void intel_shim_init(struct sdw_intel *sdw)
 
 	intel_shim_glue_to_master_ip(sdw);
 
+	act = intel_readw(shim, SDW_SHIM_CTMCTL(link_id));
 	u16p_replace_bits(&act, 0x1, SDW_SHIM_CTMCTL_DOAIS);
 	act |= SDW_SHIM_CTMCTL_DACTQE;
 	act |= SDW_SHIM_CTMCTL_DODS;
-- 
2.25.1

