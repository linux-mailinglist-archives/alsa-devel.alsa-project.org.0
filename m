Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFC78EFDA
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 17:58:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F83B168E;
	Thu, 15 Aug 2019 17:57:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F83B168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565884693;
	bh=cmiLGYM/OMqwlqg5+5rfbAezFiL0dw4+UieWyfBygp0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ap7EzhGG+gq/xy4Kb4IPVQgujeOKBSHntQyf/ThzhOw5uFTjq+tR1O9mBmy2te1SN
	 JXh1FIowI+5bTVsOJHfIJlI2qUv5DJnCoCQmpF8L4o1oG01URNLkjZ37z0UW9UxYdK
	 fHyC6N+23u4S0gCMobjTZMj6gU2PZoYrbczSiiMY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EF78F805AA;
	Thu, 15 Aug 2019 17:55:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F50EF80273; Thu, 15 Aug 2019 17:55:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3591FF80273
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 17:55:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3591FF80273
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Aug 2019 08:50:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,389,1559545200"; d="scan'208";a="194788845"
Received: from ranofal-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.136.131])
 by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2019 08:50:35 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 15 Aug 2019 10:50:29 -0500
Message-Id: <20190815155032.29181-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190815155032.29181-1-pierre-louis.bossart@linux.intel.com>
References: <20190815155032.29181-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 1/4] ASoC: SOF: rename SOUNDWIRE to ALH
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

From: Bard liao <yung-chuan.liao@linux.intel.com>

Rename SOUNDWIRE to ALH.

Signed-off-by: Bard liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof/dai.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/sof/dai.h b/include/sound/sof/dai.h
index 7a84f7fb460a..6b296df242bd 100644
--- a/include/sound/sof/dai.h
+++ b/include/sound/sof/dai.h
@@ -49,7 +49,7 @@ enum sof_ipc_dai_type {
 	SOF_DAI_INTEL_SSP,		/**< Intel SSP */
 	SOF_DAI_INTEL_DMIC,		/**< Intel DMIC */
 	SOF_DAI_INTEL_HDA,		/**< Intel HD/A */
-	SOF_DAI_INTEL_SOUNDWIRE,	/**< Intel SoundWire */
+	SOF_DAI_INTEL_ALH,		/**< Intel ALH  */
 	SOF_DAI_IMX_SAI,		/**< i.MX SAI */
 	SOF_DAI_IMX_ESAI,		/**< i.MX ESAI */
 };
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
