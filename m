Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F58A47E280
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Dec 2021 12:42:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF9AD18DC;
	Thu, 23 Dec 2021 12:41:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF9AD18DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640259770;
	bh=EkqVJs/khj++KhLgjxQZWW4O10AXGkFwnAyS+jVQHPs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dJ2+KFZfUXyMMj6SvErOwH3WVGru4Um2sOJVYJC+bs6WrWVjbiGJEUgI9PrZynChE
	 QtEPU7z7o8iKMUPnK12Mh/n/a4lPdxJzsHbC0oAfKlOdYY7wgc3BR52a88ONkwjEk2
	 SpOk2iXM0wvrwPxYfIKQHog/3jJMxNrUbIemIc1o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17FF4F805A1;
	Thu, 23 Dec 2021 12:37:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45457F80571; Thu, 23 Dec 2021 12:37:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F422BF8054A
 for <alsa-devel@alsa-project.org>; Thu, 23 Dec 2021 12:36:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F422BF8054A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="iZKCfT4Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640259415; x=1671795415;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EkqVJs/khj++KhLgjxQZWW4O10AXGkFwnAyS+jVQHPs=;
 b=iZKCfT4QdX5KEThb9YCvBp2clnxlNyxuA8Gxc1rPq7jE4XpII/xaEi/o
 65p5ZH89zZEOqvpLGUlqvqkEFkCY75mSVsHwz0zbgAuw70Ap9SPAkMOrj
 RX34pGaUQQdcJbiyMkD0dvnnhIK/UdmsT/gCd9RYQwLxhwLyOnJaGnspZ
 P2oJAq9L6nRFnTYHBDjzsNtKYg9tQT1GuWNs61HTNx6FEq/LUvaTehh2m
 zaCfacEiAF3bunUyZb6hlL4XZiHZ2UW2CavW9PKmG8uQBlxeE959REfd6
 SSzqyZMIKQrnhQLn3QKeOGAEzgDGwXL/IHxoZUSatET3UebtCJi2GVsFQ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="304180868"
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="304180868"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 03:36:53 -0800
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="522065263"
Received: from gcatala-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.214.126])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 03:36:51 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 18/20] ASoC: SOF: Add clarifying comments for sof_core_debug
 and DSP dump flags
Date: Thu, 23 Dec 2021 13:36:26 +0200
Message-Id: <20211223113628.18582-19-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211223113628.18582-1-peter.ujfalusi@linux.intel.com>
References: <20211223113628.18582-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 chao.song@intel.com, daniel.baluta@nxp.com
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

Update the comment for the global SOF level debug flags and add one for
the flags used to control the DSP dump functionality.

Document the expected behavior when the SOF_DBG_DUMP_OPTIONAL is passed
for the DSP dump:
Only print the dump if SOF_DBG_PRINT_ALL_DUMPS is set
Print must use KERN_DEBUG log level

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Chao Song <chao.song@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/sof-priv.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 5fbd4f29321a..087935192ce8 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -20,7 +20,7 @@
 #include <uapi/sound/sof/fw.h>
 #include <sound/sof/ext_manifest.h>
 
-/* debug flags */
+/* Flag definitions used in sof_core_debug (sof_debug module parameter) */
 #define SOF_DBG_ENABLE_TRACE	BIT(0)
 #define SOF_DBG_RETAIN_CTX	BIT(1)	/* prevent DSP D3 on FW exception */
 #define SOF_DBG_VERIFY_TPLG	BIT(2) /* verify topology during load */
@@ -35,11 +35,13 @@
 							*/
 #define SOF_DBG_PRINT_ALL_DUMPS		BIT(6) /* Print all ipc and dsp dumps */
 
+/* Flag definitions used for controlling the DSP dump behavior */
 #define SOF_DBG_DUMP_REGS		BIT(0)
 #define SOF_DBG_DUMP_MBOX		BIT(1)
 #define SOF_DBG_DUMP_TEXT		BIT(2)
 #define SOF_DBG_DUMP_PCI		BIT(3)
-#define SOF_DBG_DUMP_OPTIONAL		BIT(4) /* only dump if SOF_DBG_PRINT_ALL_DUMPS is set */
+/* Output this dump (at the DEBUG level) only when SOF_DBG_PRINT_ALL_DUMPS is set */
+#define SOF_DBG_DUMP_OPTIONAL		BIT(4)
 
 /* global debug state set by SOF_DBG_ flags */
 bool sof_debug_check_flag(int mask);
-- 
2.34.1

