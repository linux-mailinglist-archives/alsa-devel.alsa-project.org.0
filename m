Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C96C51073D
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 20:37:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C21E21752;
	Tue, 26 Apr 2022 20:37:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C21E21752
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650998278;
	bh=91L9HuDSNWrK+kuav3lf4LC1yYNwL+/SgtAxBWEhq7w=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fXCj7X3IKXfiYSwX7ZVjq1domIMKkAGKLaMLJbXW9LxG793LqUkRZdVc/BjbE/Yjg
	 NZbVgEyqm4ttXckYFYdcq/5JpF1vDhm+KO+NqCk79F2zhOY1xJVH07QPYzxIbaQDaM
	 rTWkl4MSShZ+w8WDJ1qEDJdGQG2IwdHRVeYZ7n18=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E437F80171;
	Tue, 26 Apr 2022 20:37:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41821F80152; Tue, 26 Apr 2022 20:36:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7EB63F800FA
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 20:36:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EB63F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ZAq65iQ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650998212; x=1682534212;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=91L9HuDSNWrK+kuav3lf4LC1yYNwL+/SgtAxBWEhq7w=;
 b=ZAq65iQ1YwFQylojGQx6Zx07rHw/GNMsTRk2cCE3s0OzE72tZJlWY9EQ
 2yK2tPNyDXHNfztgg62ZQ/k/YCwzJgSEdk03uWbWeJZ4RW9vjBtqJeSgI
 ogDi/5Pb9qlj/kL2ko/N0TJiJkUkKR20nOZogIGkog+U2Cnii7hlAibfm
 gXbQr32daHuZY+qtnjX6L0Zjil4uHENsASOal4H7a9Qmikc98dCMzfcn0
 g2VgSr3VlL5C/8P5DMTISwEIcFiQ+SNH4d6k4KJwmsB0Hj6MqTKwqPqQg
 EZv8dfua6o45NNr59hP6EqtLJgXY7wNhJGBAPa388kkk5yAcS5bAiDgrb w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="246249842"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="246249842"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 11:36:39 -0700
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="628657188"
Received: from jzhang96-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.151.202])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 11:36:38 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] ASoC: SOF: bump SOF_ABI_MINOR
Date: Tue, 26 Apr 2022 13:36:31 -0500
Message-Id: <20220426183631.102356-1-pierre-louis.bossart@linux.intel.com>
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
 include/uapi/sound/sof/abi.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/uapi/sound/sof/abi.h b/include/uapi/sound/sof/abi.h
index e052653a6e4cc..b87e46684623b 100644
--- a/include/uapi/sound/sof/abi.h
+++ b/include/uapi/sound/sof/abi.h
@@ -26,8 +26,8 @@
 
 /* SOF ABI version major, minor and patch numbers */
 #define SOF_ABI_MAJOR 3
-#define SOF_ABI_MINOR 19
-#define SOF_ABI_PATCH 1
+#define SOF_ABI_MINOR 20
+#define SOF_ABI_PATCH 0
 
 /* SOF ABI version number. Format within 32bit word is MMmmmppp */
 #define SOF_ABI_MAJOR_SHIFT	24
-- 
2.30.2

