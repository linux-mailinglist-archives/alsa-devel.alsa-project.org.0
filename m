Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E6C55BD9F
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jun 2022 04:27:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50E22167D;
	Tue, 28 Jun 2022 04:26:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50E22167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656383243;
	bh=zrAyaFapqko+OKphU5GEF1mHMbCDxCUYsWwHGUS7jsg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b0KdU44Uz4cW3WkZjuzP/jyWdtoEUdpVaQrkbxVRVq0SI45gFrC8BdZxbK+l3JhlQ
	 W5g8wO/b26yoV+bCUQ/F850zNjSl5Axz8WTJze/OI6S0n9yY9RyP/j5wiGepHgpo+t
	 Q3FHWUWCYW1evwj0vduPLGDRGJlq9n0aeCxir8XE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED9D4F8052D;
	Tue, 28 Jun 2022 04:26:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F662F80115; Tue, 28 Jun 2022 04:26:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB450F80167
 for <alsa-devel@alsa-project.org>; Tue, 28 Jun 2022 04:26:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB450F80167
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="t4hXigOa"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 71D196192B;
 Tue, 28 Jun 2022 02:26:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70BCAC385A5;
 Tue, 28 Jun 2022 02:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656383186;
 bh=zrAyaFapqko+OKphU5GEF1mHMbCDxCUYsWwHGUS7jsg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=t4hXigOaqTpl/Vb8LEWm8z1b3nJ2Z1amgZgN6k9aKG1aS1JXtp70tJX9ukbrGKtSk
 ZIfU3lMkZ46HA40cT9Vb8O2nQmFNnKhItf1HKe9qF+s8vfOqf05UkyuRnI4WmMZJsg
 bOnfyHoslmPPCF2qKe3xiKpn4HJpfis94GkElJNVHInDR04+N6qhECgwCGdf+XrgUQ
 ERjXP0+mGPtkkqdkD5GDoeVZsORfLvwRIK8xPkD0amhTWus45riDLiOLdZwi4xjEKk
 vURM2JMqw/Ud/20ZP32e0gdN9SMQCYG19tsv3NPKyLUpxsoSTtLCu3usqWK0dQBRGK
 dZcqMalDSwzew==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 05/17] ALSA: x86: intel_hdmi_audio: enable
 pm_runtime and set autosuspend delay
Date: Mon, 27 Jun 2022 22:26:03 -0400
Message-Id: <20220628022615.596977-5-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628022615.596977-1-sashal@kernel.org>
References: <20220628022615.596977-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 jiasheng@iscas.ac.cn, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, tiwai@suse.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, nizhen@uniontech.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>, gushengxian@yulong.com
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

[ Upstream commit e87c65aeb46ca4f5b7dc08531200bcb8a426c62e ]

The existing code uses pm_runtime_get_sync/put_autosuspend, but
pm_runtime was not explicitly enabled. The autosuspend delay was not
set either, the value is set to 5s since HDMI is rather painful to
resume.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/20220616222910.136854-2-pierre-louis.bossart@linux.intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/x86/intel_hdmi_audio.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/x86/intel_hdmi_audio.c b/sound/x86/intel_hdmi_audio.c
index bf894087e5fa..84ac01b6e93d 100644
--- a/sound/x86/intel_hdmi_audio.c
+++ b/sound/x86/intel_hdmi_audio.c
@@ -42,6 +42,8 @@
 #include <drm/intel_lpe_audio.h>
 #include "intel_hdmi_audio.h"
 
+#define INTEL_HDMI_AUDIO_SUSPEND_DELAY_MS  5000
+
 #define for_each_pipe(card_ctx, pipe) \
 	for ((pipe) = 0; (pipe) < (card_ctx)->num_pipes; (pipe)++)
 #define for_each_port(card_ctx, port) \
@@ -1885,8 +1887,11 @@ static int hdmi_lpe_audio_probe(struct platform_device *pdev)
 	pdata->notify_audio_lpe = notify_audio_lpe;
 	spin_unlock_irq(&pdata->lpe_audio_slock);
 
+	pm_runtime_set_autosuspend_delay(&pdev->dev, INTEL_HDMI_AUDIO_SUSPEND_DELAY_MS);
 	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
 	pm_runtime_mark_last_busy(&pdev->dev);
+	pm_runtime_idle(&pdev->dev);
 
 	dev_dbg(&pdev->dev, "%s: handle pending notification\n", __func__);
 	for_each_port(card_ctx, port) {
-- 
2.35.1

