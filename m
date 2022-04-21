Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAAD50A560
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 18:28:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6125E166D;
	Thu, 21 Apr 2022 18:27:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6125E166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650558498;
	bh=2zeSKabTRnMbxVgX4GI47xdJqfIOfUZjFYCbLwHBUQs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WXlyFZIJQka3aqHRojOFGzFLr5IiZtJGUFr+M3Cv6U87VnZzdnskSHPvRz5glil2n
	 QHC7lLLHZhsh/rjqOLlKvoFdchODxXb3z1NClOM4ixKS27i4fgdD18xtgw33wGcowb
	 W7lLIH6l2TynNpUrbGnUNeinp3JxUYS/NbEPhpxs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 498C9F804F1;
	Thu, 21 Apr 2022 18:27:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4548EF804DA; Thu, 21 Apr 2022 18:27:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B754F8032D
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 18:26:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B754F8032D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="TzGOM0Ku"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650558414; x=1682094414;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2zeSKabTRnMbxVgX4GI47xdJqfIOfUZjFYCbLwHBUQs=;
 b=TzGOM0Ku8hmkUdWoZUiVLQFLrT0MYMTbsj/L43/iGIsNkivTxsFW9C6x
 x1ANCgz+Zx0JcOpczgQhC9NQM1UhI+EeVPVjSXPFEbn9OFG0mpCVs14qz
 QKN7uUuLnTBPZVScu7V2Z0xSQs/4/37vAxX0/QGMxQV108B6VIWaFlkFe
 AN36ierouTmQRaH/nEcOP6gkEy7+xTrYKR4xYNRQVd5C3X9fOgXchzNoP
 er/6M57f/4LMspt8LlhKZP9JjHuwGC46V7ZXMB4ihkSmn7NIusNkoEN2T
 pjZGV38ZRMBzBGkaQeyWDRgo54v7K5+ybzGKwr83h7G+UEU3YViQwCJDd A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="263874455"
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="263874455"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 09:26:50 -0700
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="511144619"
Received: from qingsu-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.148.250])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 09:26:50 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: SOF: bump SOF_ABI_MINOR
Date: Thu, 21 Apr 2022 11:26:40 -0500
Message-Id: <20220421162640.302311-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org, Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

Commit a0f84dfb3f6d9 ("ASoC: SOF: IPC: dai: Expand DAI_CONFIG IPC flags")
did not update the SOF_ABI_MINOR, bump to version 20 before new
changes are added.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/uapi/sound/sof/abi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/sound/sof/abi.h b/include/uapi/sound/sof/abi.h
index e052653a6e4cc..42227d4cb92c5 100644
--- a/include/uapi/sound/sof/abi.h
+++ b/include/uapi/sound/sof/abi.h
@@ -26,7 +26,7 @@
 
 /* SOF ABI version major, minor and patch numbers */
 #define SOF_ABI_MAJOR 3
-#define SOF_ABI_MINOR 19
+#define SOF_ABI_MINOR 20
 #define SOF_ABI_PATCH 1
 
 /* SOF ABI version number. Format within 32bit word is MMmmmppp */
-- 
2.30.2

