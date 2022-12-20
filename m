Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B044652113
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Dec 2022 13:58:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E55552138;
	Tue, 20 Dec 2022 13:57:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E55552138
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671541080;
	bh=DIzxGdpsaudAy4Rr6Rfk/rSkOgdDzfTmlES+w5hTlWI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IuvCWD21dN1bKlvnwot1VaR/vhceKGHmgY8SqSEIpK+iEvDehE3Pw+07mnXO4kS4c
	 IJB802Uqdd9SedM60wexUpsATtTIeyBjmoDiwa1+/BELXk/Mh93nVfMBtXRvYTFmYk
	 rjHQ30c6MZyuk8POwncy1akAejDFxBqfeFxulCUw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60E15F80539;
	Tue, 20 Dec 2022 13:56:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 623B0F804CB; Tue, 20 Dec 2022 13:56:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E587F8018A
 for <alsa-devel@alsa-project.org>; Tue, 20 Dec 2022 13:56:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E587F8018A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=B6pbNUpy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671541012; x=1703077012;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DIzxGdpsaudAy4Rr6Rfk/rSkOgdDzfTmlES+w5hTlWI=;
 b=B6pbNUpyc5nSoIBzMw83JF7JmsQVcVWp+qyWEPxHW2m0hyyRzTT/pDiC
 z147f+jvGLHWeWeI0Y9rvJsCXJzgKHhlV8lRYmrpuuw3HtYWEtlH4QiWd
 OE1+HbT4caXW3G+2PFPp4AkSDe1QoNk53uXozICZV5m+PsKbZNMrzc4WR
 vBAPsV+8x3Bbk1gIUezJmWwQBsc5kjTF0PK8uds1vymyqWBkt4g9YbjDS
 xh4kJrRCT7glgCebHm4MpQRssaO2uz03GKXc8t+ZlR4GttGL1C/MVdBBJ
 flRwYHaNue0qNUkuDsKvysQ4Wzsd1F9NNs4+Wi80Xd69GWYrjnx9uVmuA A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="299280480"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; d="scan'208";a="299280480"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2022 04:56:26 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="825222233"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; d="scan'208";a="825222233"
Received: from vadimbel-mobl2.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.20.205])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2022 04:56:23 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v2 1/3] ASoC: SOF: pm: Set target state earlier
Date: Tue, 20 Dec 2022 14:56:27 +0200
Message-Id: <20221220125629.8469-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221220125629.8469-1-peter.ujfalusi@linux.intel.com>
References: <20221220125629.8469-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

If the DSP crashes before the system suspends, the setting of target state
will be skipped because the firmware state will no longer be
SOF_FW_BOOT_COMPLETE. This leads to the incorrect assumption that the
DSP should suspend to D0I3 instead of suspending to D3. To fix this,
set the target_state before we skip to DSP suspend even when the DSP has
crashed.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Curtis Malainey <cujomalainey@chromium.org>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/pm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index df740be645e8..5f88c4a01fa3 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -182,7 +182,7 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 	const struct sof_ipc_pm_ops *pm_ops = sdev->ipc->ops->pm;
 	const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
 	pm_message_t pm_state;
-	u32 target_state = 0;
+	u32 target_state = snd_sof_dsp_power_target(sdev);
 	int ret;
 
 	/* do nothing if dsp suspend callback is not set */
@@ -206,7 +206,6 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 		}
 	}
 
-	target_state = snd_sof_dsp_power_target(sdev);
 	pm_state.event = target_state;
 
 	/* Skip to platform-specific suspend if DSP is entering D0 */
-- 
2.39.0

