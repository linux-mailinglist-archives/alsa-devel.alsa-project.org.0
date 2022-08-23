Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A77DE59D0A0
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 07:39:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 561F0163D;
	Tue, 23 Aug 2022 07:38:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 561F0163D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661233179;
	bh=IcbO0++/F7Z/PmyZHrtTY1NFZWAxV0s5biqxV9P3eGo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o/pv5xRWRHvlcIe2IEQLXZ2rco26uU7Un6qp3tJkemW0GIfg+onlofBQVUVlsV+WZ
	 eNPOrRSZBnthAivKsx4iJvruE9AfBfakWzYpQtOkSBpSeNdaQ6cortN8u/iDCTeWUX
	 NScHF2xwH3hY6ZsMS+LO56AShCPhEylt1RlrW3mc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18631F805A1;
	Tue, 23 Aug 2022 07:36:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECB2BF804E7; Tue, 23 Aug 2022 07:36:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C874F80525
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 07:35:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C874F80525
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="dmcpGYfM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661232930; x=1692768930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IcbO0++/F7Z/PmyZHrtTY1NFZWAxV0s5biqxV9P3eGo=;
 b=dmcpGYfMsTSO+B1jymyY6wC9asA6K0vcPXHYk4+jqK2Qw7tirBVVQm7Z
 DoyvnDzX21U+cDoJJk9kcMm8t5i7n+7itALDZcHH91YIx+Kxx6AeBr2w7
 0Cz+q6XgeV9grI0mJsGMOvjEAsu+X87nfoI93XmGr8VP5XNnElDNyOLei
 tfQ8LJIvaJUg9KFze37Uy5SAzK5r6KjhV19neM/F9kmLmQyTq9XxxBOT/
 /KGo8oVKVI+MGDKniOuXwyi0Cg531hgH38kwrjDGADAAXbrr0oQ7G9EdL
 8auvchAVA268D3l/FWbYxfWaPwesuNumYJwYDFQeFua2jkXL1Girdb2/x A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="273349253"
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; d="scan'208";a="273349253"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 22:35:02 -0700
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; d="scan'208";a="698558311"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 22:35:00 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 06/11] soundwire: intel: add comment for control stream
 cap/chmap
Date: Tue, 23 Aug 2022 13:38:41 +0800
Message-Id: <20220823053846.2684635-7-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220823053846.2684635-1-yung-chuan.liao@linux.intel.com>
References: <20220823053846.2684635-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org,
 bard.liao@intel.com, linux-kernel@vger.kernel.org
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

add comment and newline to mark out control stream capabilities and
chmap. These registers are unused by the driver, only dumped in
debugfs.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 include/linux/soundwire/sdw_intel.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index 34af5bc010b3..7c1d111c5f3f 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -38,11 +38,13 @@
 #define SDW_SHIM_SYNC_CMDSYNC		BIT(16)
 #define SDW_SHIM_SYNC_SYNCGO		BIT(24)
 
+/* Control stream capabililities and channel mask */
 #define SDW_SHIM_CTLSCAP(x)		(0x010 + 0x60 * (x))
 #define SDW_SHIM_CTLS0CM(x)		(0x012 + 0x60 * (x))
 #define SDW_SHIM_CTLS1CM(x)		(0x014 + 0x60 * (x))
 #define SDW_SHIM_CTLS2CM(x)		(0x016 + 0x60 * (x))
 #define SDW_SHIM_CTLS3CM(x)		(0x018 + 0x60 * (x))
+
 #define SDW_SHIM_PCMSCAP(x)		(0x020 + 0x60 * (x))
 
 #define SDW_SHIM_PCMSYCHM(x, y)		(0x022 + (0x60 * (x)) + (0x2 * (y)))
-- 
2.25.1

