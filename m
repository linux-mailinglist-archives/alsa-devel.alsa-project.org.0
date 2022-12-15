Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F3164E16A
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Dec 2022 19:55:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E38E21FE;
	Thu, 15 Dec 2022 19:54:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E38E21FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671130537;
	bh=j73SLV8Dy0hfxMlBy2XicZPFmXbzH0ZbGjxroUA8I0c=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=s3wEG+xuexlwcLYRXCHpZprHqw9R06UXL08ON73CdUjYWl5NiPVmt5kogZ525DpTE
	 7isM7fPZewuROviLtx3oVFJryA9ozTp+D9U7iAyaOa55/W0G2qaARmSqbQquRLS314
	 /E3AIhXS4gOLhIhPnNTsFxdyiszwBZCbpQCI3lz4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B77BF80510;
	Thu, 15 Dec 2022 19:54:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 236D9F80510; Thu, 15 Dec 2022 19:54:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C14C3F801D5
 for <alsa-devel@alsa-project.org>; Thu, 15 Dec 2022 19:54:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C14C3F801D5
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Fa0so+i6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671130453; x=1702666453;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j73SLV8Dy0hfxMlBy2XicZPFmXbzH0ZbGjxroUA8I0c=;
 b=Fa0so+i6d+tCVHzvCPzd6GLHU/j89UGHceNz+F5kdtsW/WSFn0nksxTW
 5T7vH1T2DeqQGlvUNmYbcN32yORG46JS3euaP0DlGDTW29r6/BkgySp84
 WmM/pEFVc365RogBHW4TfRVRzvGKGVTG+5xBSRlcytBXNmZHNE9PzPuB6
 gQS1QR3NeIRnlkqZMQh1nZ0ebvhxbp90Spkg0YLuMdlEyCxLcNc6i5hsG
 FA2gveYLMECix1ZXxzlMFaHT2W6JlyOz+c1P2+7ZLVlCB3ozw8KWWF43r
 b4HACmXPrDlXVBLoWRuhjBmn/6aU/1amrEufoJnI9VMwp3rm2VqTjNqRA w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="318819921"
X-IronPort-AV: E=Sophos;i="5.96,248,1665471600"; d="scan'208";a="318819921"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2022 10:54:05 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="738260652"
X-IronPort-AV: E=Sophos;i="5.96,248,1665471600"; d="scan'208";a="738260652"
Received: from mayurarx-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.35.200])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2022 10:54:05 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/3] ASoC: SOF: pm: Set target state earlier
Date: Thu, 15 Dec 2022 10:53:45 -0800
Message-Id: <20221215185347.1457541-2-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221215185347.1457541-1-ranjani.sridharan@linux.intel.com>
References: <20221215185347.1457541-1-ranjani.sridharan@linux.intel.com>
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
Cc: tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Curtis Malainey <cujomalainey@chromium.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

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
2.25.1

