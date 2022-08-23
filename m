Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 161AE59D047
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 06:59:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF8DA1657;
	Tue, 23 Aug 2022 06:58:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF8DA1657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661230749;
	bh=cNxzDbwrsjHAHf3Ry/RTPETly9gpzhY9qK4HhF9EKO0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MdWHgOhgKMpIdXpGubD1La5mo89RTLncDUDZSqbNhMCsI8yokk6wCWpSLWEIGZ0RQ
	 g0somLB0hyc93nSTOAQO0p60sxdshR6n1FSYkpN4IaCNr6kFtOw5r5lRfgR8D82Inr
	 AGcrvpFdBXaANWMJwfMku9NxexdZV4hRVXH5NN24=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F93FF804E6;
	Tue, 23 Aug 2022 06:58:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2A9AF8027B; Tue, 23 Aug 2022 06:58:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C226CF8014E
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 06:58:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C226CF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ciC7amdw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661230686; x=1692766686;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cNxzDbwrsjHAHf3Ry/RTPETly9gpzhY9qK4HhF9EKO0=;
 b=ciC7amdwpOnDRjrboCIQ3P45Q+irQ+5vuesCzHkAZo6UfPKG2+seaISR
 3kA4aOD2G6gWflM6ezkM+10c9Vjy8TBV9c6B+2yLre8MC/k2b8t/vvhfb
 75EULlnGDWXYXYAYH50iyHAQ+bOgI/4EOCFJQE8BBPMi6axeNv8kD2Pes
 ywl0exNmMdSgU62D1v5PcnpXVgz3yPBB2czq0EOBxV0C2TgnbPGA84iax
 YYvQcSF6lpTO2a4j5Eovt1f5k2YCE/3mVR7q4w0FTIaotk5S3f31lXEh1
 bYGilXFMmKE1jnOEOTzePi2/yYTy9PiQ/Jafwh+UZV8FpH1nRWe4VlWWu A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="294380446"
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; d="scan'208";a="294380446"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 21:58:02 -0700
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; d="scan'208";a="605536620"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 21:58:00 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 0/2] soundwire: remove use of __func__ in dev_dbg
Date: Tue, 23 Aug 2022 13:01:56 +0800
Message-Id: <20220823050158.2671245-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: gregkh@linuxfoundation.org, pierre-louis.bossart@linux.intel.com,
 vinod.koul@linaro.org, bard.liao@intel.com, linux-kernel@vger.kernel.org
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

The module and function information can be added with
'modprobe foo dyndbg=+pmf'

Pierre-Louis Bossart (2):
  soundwire: bus: remove use of __func__ in dev_dbg
  soundwire: intel: remove use of __func__ in dev_dbg

 drivers/soundwire/bus.c   | 16 ++++++++--------
 drivers/soundwire/intel.c | 14 +++++++-------
 2 files changed, 15 insertions(+), 15 deletions(-)

-- 
2.25.1

