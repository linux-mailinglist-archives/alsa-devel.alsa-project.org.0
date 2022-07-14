Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 105735740D6
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 03:12:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90D0E1746;
	Thu, 14 Jul 2022 03:11:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90D0E1746
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657761150;
	bh=XgIzkdg1w/45yFVa+8wnGc4HfPgO64m5VVNu5kFaai4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dWEyxAxgbkoVnz4PmHusNtwjg4Mi6exBcRmqFCs5TIE0MdG8UZ0G05uXZT+NvzmxY
	 78TYkPQQfknHv6tt1Qzr8rmz6KLDRSO6xRnY3+VyQuLmsVNFKqvqwceTgDuikjYeeb
	 yGUSP2pRAb/QLwj7sXvpjERqF8zi1spqYJYCKnZc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35CB3F80542;
	Thu, 14 Jul 2022 03:11:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77D68F8053D; Thu, 14 Jul 2022 03:11:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92083F800AA
 for <alsa-devel@alsa-project.org>; Thu, 14 Jul 2022 03:10:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92083F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="kbQwpOrl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657761057; x=1689297057;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XgIzkdg1w/45yFVa+8wnGc4HfPgO64m5VVNu5kFaai4=;
 b=kbQwpOrlkygNWzBK6E+07OD6IIQT9d+x2uJpxCLzwBDPGIoHBFAJieWW
 q+Nn8LitXb3QTpLGW1l/ZhjbXPPw0yJGss7aBWrjMa2abCjq6pJTx5hyZ
 GPkrhA8buWURrn4wAx6QPfmdzHeSZj7uj3vvRHdtDFCZB28BLu98oYdIF
 wCeOk6YHr9+5jB3cJF7fGb3bcq+28WR96D2s7+fz+jWzCkYRRn07NO91k
 PuszfKDOn2EspE5DGPCn4bDEy5B9Xcit8eDPEvto8uPKNlnwsONun1Sro
 TljyL3KyNIDZvijdHcthBO68xEiOiuOc0vPAv6+0S4q4r+PT9cNWQxLQm w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="347066127"
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="347066127"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 18:10:52 -0700
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="593192510"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 18:10:49 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 1/4] soundwire: add read_ping_status helper definition in
 manager ops
Date: Thu, 14 Jul 2022 09:10:40 +0800
Message-Id: <20220714011043.46059-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220714011043.46059-1-yung-chuan.liao@linux.intel.com>
References: <20220714011043.46059-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: vinod.koul@linaro.org, tiwai@suse.de, pierre-louis.bossart@linux.intel.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org, bard.liao@intel.com
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

The existing manager ops provide callbacks to transfer read/write
commands, but don't allow for direct access to PING status
register. This is accessible in all existing IP, and would help
diagnose timeouts or resume issues by reporting the 'true' status
instead of the internal status reported by the IP.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 include/linux/soundwire/sdw.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index a2b31d25ea27..a85cf829bb77 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -839,6 +839,8 @@ struct sdw_defer {
  * @set_bus_conf: Set the bus configuration
  * @pre_bank_switch: Callback for pre bank switch
  * @post_bank_switch: Callback for post bank switch
+ * @read_ping_status: Read status from PING frames, reported with two bits per Device.
+ * Bits 31:24 are reserved.
  */
 struct sdw_master_ops {
 	int (*read_prop)(struct sdw_bus *bus);
@@ -855,6 +857,7 @@ struct sdw_master_ops {
 			struct sdw_bus_params *params);
 	int (*pre_bank_switch)(struct sdw_bus *bus);
 	int (*post_bank_switch)(struct sdw_bus *bus);
+	u32 (*read_ping_status)(struct sdw_bus *bus);
 
 };
 
-- 
2.25.1

