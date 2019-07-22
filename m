Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3623B70220
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 16:21:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A82BA1814;
	Mon, 22 Jul 2019 16:20:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A82BA1814
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563805275;
	bh=jSjIV3veDDiZQPDcIqwm4qZwkywe6OwTsXA57qDuBQw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K6rZ9SMoVxJsZ+c6khJAvG04NTCK3YhqpanieE2WM4jUQNCyT8fG/A/jdZkeHR9qx
	 DqBgm32qZiYeFPBr9ZzauktKGPgHGtujtQqVSv63C06lfR9ZcmG67wlJKhHZCJBFJf
	 Ac/cVrCwVvuPfHl55ii+s3e+JKK3L+zGCD6+hx5A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED8B4F805AF;
	Mon, 22 Jul 2019 16:14:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 740BFF804CF; Mon, 22 Jul 2019 16:14:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8ECE4F8049B
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 16:14:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8ECE4F8049B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jul 2019 07:14:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,295,1559545200"; d="scan'208";a="192733283"
Received: from agalla-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.254.103.46])
 by fmsmga004.fm.intel.com with ESMTP; 22 Jul 2019 07:14:15 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 22 Jul 2019 09:13:51 -0500
Message-Id: <20190722141402.7194-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722141402.7194-1-pierre-louis.bossart@linux.intel.com>
References: <20190722141402.7194-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org, Keyon Jie <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 10/21] ASoC: SOF: Intel: hda: correct ROM state
	mask
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Keyon Jie <yang.jie@linux.intel.com>

The ROM state is represented by the 24 LSB bits in the ROM status
register, so the mask should be 0xffffff instead of 0xf.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 84d5fd021ccb..70909debfeb5 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -175,7 +175,7 @@
 #define HDA_DSP_STACK_DUMP_SIZE			32
 
 /* ROM  status/error values */
-#define HDA_DSP_ROM_STS_MASK			0xf
+#define HDA_DSP_ROM_STS_MASK			GENMASK(23, 0)
 #define HDA_DSP_ROM_INIT			0x1
 #define HDA_DSP_ROM_FW_MANIFEST_LOADED		0x3
 #define HDA_DSP_ROM_FW_FW_LOADED		0x4
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
