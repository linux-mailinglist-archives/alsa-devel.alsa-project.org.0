Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 959162C2F8C
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Nov 2020 19:05:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F53017A3;
	Tue, 24 Nov 2020 19:04:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F53017A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606241128;
	bh=H+WNDw8eG4NN9C3/E8c9i1tCDK1EtImlIr/OA8ICphY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MaxPcqgpurBVGFuLZU84DrbG0+VcM8w/IFQ41Iksnj4yuMgEQ7zjH9vgOro35h0xv
	 1XnMJiLVVy87OOKlUNbSIr/CUp20hfhtR3pi/rJs0UnAwwm1xagtt+cxYtr/M8g4te
	 lIvXzxx8h896VBpckz1iIbjI5xQjD0H1yp2p9P7s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 048D5F8016A;
	Tue, 24 Nov 2020 19:03:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0ABDF802C4; Tue, 24 Nov 2020 19:03:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AFCABF8016A
 for <alsa-devel@alsa-project.org>; Tue, 24 Nov 2020 19:02:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFCABF8016A
IronPort-SDR: x8fFCL1fSWW7gyktiwBilfj4ezWmd2xF5yB9c9LUUvCYpq0a6nV0UoMdqYx3Ro5iBpwR0Kk95C
 y08Hr02361KA==
X-IronPort-AV: E=McAfee;i="6000,8403,9815"; a="151830624"
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="151830624"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 10:02:56 -0800
IronPort-SDR: 0P2ABhXROQb7LzlliHgYLaMyqTEiWJMQ2IRlXF0oMZctjPyv3ciTuhhrRbSB/i+KN0lnsMZHQz
 j2GOSjojUTDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="478585054"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga004.jf.intel.com with ESMTP; 24 Nov 2020 10:02:54 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 3/4] ASoC: SOF: Change section comment for SOF_IPC_TEST_
Date: Tue, 24 Nov 2020 20:00:16 +0200
Message-Id: <20201124180017.2232128-4-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201124180017.2232128-1-kai.vehmanen@linux.intel.com>
References: <20201124180017.2232128-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 Karol Trzcinski <karolx.trzcinski@linux.intel.com>, daniel.baluta@nxp.com
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

From: Karol Trzcinski <karolx.trzcinski@linux.intel.com>

Section comment should be coherent with IPC prefix from define
names.

Signed-off-by: Karol Trzcinski <karolx.trzcinski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/sound/sof/header.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/sof/header.h b/include/sound/sof/header.h
index ece6d48dd007..13256d4fb0dd 100644
--- a/include/sound/sof/header.h
+++ b/include/sound/sof/header.h
@@ -118,7 +118,7 @@
 #define SOF_IPC_TRACE_DMA_POSITION		SOF_CMD_TYPE(0x002)
 #define SOF_IPC_TRACE_DMA_PARAMS_EXT		SOF_CMD_TYPE(0x003)
 
-/* debug */
+/* test */
 #define SOF_IPC_TEST_IPC_FLOOD			SOF_CMD_TYPE(0x001)
 
 /* Get message component id */
-- 
2.28.0

