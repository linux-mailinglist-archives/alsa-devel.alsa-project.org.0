Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4AA410F98
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Sep 2021 08:43:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F6F41681;
	Mon, 20 Sep 2021 08:42:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F6F41681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632120212;
	bh=Rtwm/r+B686yEGXDyrYgoyKQwmsC4imOG/LfvLsdp6g=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TLBALdoZ2eaz2/jt4El+cUk9pMitfzrp7uTX2mUjk1ej0EGvUHL2OMl0QtB9n+mcG
	 DhsEUeEQ6Ax2BqJP/Ig16+S1BRKaU8skhuXXxvyZQElWXqC5yDvl6mpPRpWtiHSDFU
	 v+Giq+Um5gxv9Iq4iuaO+qBZDRGegvbnJaqWTyzU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE65AF802A0;
	Mon, 20 Sep 2021 08:42:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 979B8F8025D; Mon, 20 Sep 2021 08:42:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8A62F80152
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 08:42:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8A62F80152
X-IronPort-AV: E=McAfee;i="6200,9189,10112"; a="286751107"
X-IronPort-AV: E=Sophos;i="5.85,307,1624345200"; d="scan'208";a="286751107"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2021 23:41:58 -0700
X-IronPort-AV: E=Sophos;i="5.85,307,1624345200"; d="scan'208";a="548563322"
Received: from tataruax-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.35.119])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2021 23:41:55 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH] ASoC: SOF: Remove struct sof_ops_table and sof_get_ops() macro
Date: Mon, 20 Sep 2021 09:41:56 +0300
Message-Id: <20210920064156.4763-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com, bard.liao@intel.com
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

sof_get_ops() is not used and the struct sof_ops_table is only used by that
macro.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ops.h      | 15 ---------------
 sound/soc/sof/sof-priv.h |  6 ------
 2 files changed, 21 deletions(-)

diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index b4121e516585..d40ce2581d94 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -524,21 +524,6 @@ snd_sof_set_mach_params(const struct snd_soc_acpi_mach *mach,
 		sof_ops(sdev)->set_mach_params(mach, sdev);
 }
 
-static inline const struct snd_sof_dsp_ops
-*sof_get_ops(const struct sof_dev_desc *d,
-	     const struct sof_ops_table mach_ops[], int asize)
-{
-	int i;
-
-	for (i = 0; i < asize; i++) {
-		if (d == mach_ops[i].desc)
-			return mach_ops[i].ops;
-	}
-
-	/* not found */
-	return NULL;
-}
-
 /**
  * snd_sof_dsp_register_poll_timeout - Periodically poll an address
  * until a condition is met or a timeout occurs
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 9b1bdba15c74..6b1dbae3344c 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -294,12 +294,6 @@ struct dsp_arch_ops {
 
 #define sof_dsp_arch_ops(sdev) ((sdev)->pdata->desc->ops->dsp_arch_ops)
 
-/* DSP device HW descriptor mapping between bus ID and ops */
-struct sof_ops_table {
-	const struct sof_dev_desc *desc;
-	const struct snd_sof_dsp_ops *ops;
-};
-
 /* FS entry for debug files that can expose DSP memories, registers */
 struct snd_sof_dfsentry {
 	size_t size;
-- 
2.33.0

