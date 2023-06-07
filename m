Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B50E7251AC
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jun 2023 03:44:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFA5A820;
	Wed,  7 Jun 2023 03:44:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFA5A820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686102297;
	bh=oak0LJhMLWtP9UoshEOtnO5xklZAVt1BPVezT+IWuFw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=oLKAq8cNXsNIMalLqwcnqIOy+gPKZvYQYNlDZp2YXnC36AfjWeoOBZ6OnenCMjVff
	 DwfDNcxqBQboU0ZPU2N7hrj3x7GHkaKI437jEy9OkkSAYJTJnfX2T2ef0FQ0Jup6C9
	 /5KGExSpAHjSC3WVHvM0piW+0PK0lW4ldxvJv98I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49ACCF80155; Wed,  7 Jun 2023 03:44:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DD066F8016C;
	Wed,  7 Jun 2023 03:44:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07492F80199; Wed,  7 Jun 2023 03:44:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C4ABEF800C8
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 03:43:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4ABEF800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VoSzJvqU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686102234; x=1717638234;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oak0LJhMLWtP9UoshEOtnO5xklZAVt1BPVezT+IWuFw=;
  b=VoSzJvqUAOcfqwb2dk64YigPJZ16TQza+felYkpAvsyUOPZG70kRsC4f
   AEGd/3v9+0BEN3z4r2J24qS6LUD7cVEdZcJaL3KxUAClNjwXjcQoyklLY
   IQH9zIY89Yed45dJ9k9tLajgJHDBh/W5PPTPZp/aIeahuB2SAqPEInoD4
   uMfShdN+w8brb6R4hqysVyb+tyb3dtkqn1M1Apems9BXzTRrmZhtbkZyF
   lRjO/1jUptJDJapzYQJK3rM+avLdSSBVqQ9omfZb3JOR7sL0828NnF60h
   SFfa4zfOP5TxjCBakuqS9vYQPDZHffUS+qAYira4Qp4wA7gPCrjDBG2Gr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="359314356"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400";
   d="scan'208";a="359314356"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 18:43:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="742396227"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400";
   d="scan'208";a="742396227"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 18:43:44 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH] soundwire: debugfs: Add missing SCP registers
Date: Wed,  7 Jun 2023 10:06:32 +0800
Message-Id: <20230607020632.1030309-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XQPCHTXX3IO6U74Q77DQU25IRFCYWT2E
X-Message-ID-Hash: XQPCHTXX3IO6U74Q77DQU25IRFCYWT2E
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XQPCHTXX3IO6U74Q77DQU25IRFCYWT2E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Uday M Bhat <uday.m.bhat@intel.com>

SCP registers needs to be updated to accommodate additional
register entries as per the Soundwire 1.2 specification.

Signed-off-by: Uday M Bhat <uday.m.bhat@intel.com>
Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/debugfs.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/debugfs.c b/drivers/soundwire/debugfs.c
index c3a1a359ee5c..d1553cb77187 100644
--- a/drivers/soundwire/debugfs.c
+++ b/drivers/soundwire/debugfs.c
@@ -86,10 +86,17 @@ static int sdw_slave_reg_show(struct seq_file *s_file, void *data)
 
 	/* SCP registers */
 	ret += scnprintf(buf + ret, RD_BUF - ret, "\nSCP\n");
-	for (i = SDW_SCP_INT1; i <= SDW_SCP_BANKDELAY; i++)
+	for (i = SDW_SCP_INT1; i <= SDW_SCP_BUS_CLOCK_BASE; i++)
 		ret += sdw_sprintf(slave, buf, ret, i);
 	for (i = SDW_SCP_DEVID_0; i <= SDW_SCP_DEVID_5; i++)
 		ret += sdw_sprintf(slave, buf, ret, i);
+	for (i = SDW_SCP_FRAMECTRL_B0; i <= SDW_SCP_BUSCLOCK_SCALE_B0; i++)
+		ret += sdw_sprintf(slave, buf, ret, i);
+	for (i = SDW_SCP_FRAMECTRL_B1; i <= SDW_SCP_BUSCLOCK_SCALE_B1; i++)
+		ret += sdw_sprintf(slave, buf, ret, i);
+	for (i = SDW_SCP_PHY_OUT_CTRL_0; i <= SDW_SCP_PHY_OUT_CTRL_7; i++)
+		ret += sdw_sprintf(slave, buf, ret, i);
+
 
 	/*
 	 * SCP Bank 0/1 registers are read-only and cannot be
-- 
2.25.1

