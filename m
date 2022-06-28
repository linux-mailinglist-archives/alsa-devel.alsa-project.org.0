Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7572F55BD4A
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jun 2022 04:20:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 146281654;
	Tue, 28 Jun 2022 04:19:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 146281654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656382847;
	bh=xsox+oAtcdAZJHzJsBu55rSS/MQ8PPD/eM3Wo9jAC4I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HRQ4ankj5GktEe/ZdT+iFR3H6wfLkgH+VMiI/uHkexi+Q9e5FqN7n2iyKgxNU3crD
	 qOhNwxY8Ajbd4jct4vE1aKi5Qgr8TuHByeAste3QUNFiyqK9faQk6aefw8bPzgihji
	 OgSd/mBBLaROFnBmDYLio03S7zRobSTU4QJFKSA8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85782F80115;
	Tue, 28 Jun 2022 04:19:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14765F804F2; Tue, 28 Jun 2022 04:19:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCDCFF80115
 for <alsa-devel@alsa-project.org>; Tue, 28 Jun 2022 04:19:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCDCFF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="p2Z8eRsT"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5D52A617D4;
 Tue, 28 Jun 2022 02:19:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85CD3C341CB;
 Tue, 28 Jun 2022 02:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656382777;
 bh=xsox+oAtcdAZJHzJsBu55rSS/MQ8PPD/eM3Wo9jAC4I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=p2Z8eRsT1OsYqxc6lh/SV9hQ00Tp+RAClPJOHpB844e/ZT79JWXg42dGWvgGm6JUb
 abF4WcAytSr5ZkExwBi+GH2syLSZoB+rgTzG097bt4SnYuAJgh1nx395GGIly1reB1
 LwmO5OVIOMQf9KEw4eYRRN9oMA13GvI5POTah8uX5WeIdZ0d8FJD4uSgBpO4SpZrHj
 mRxaxuND7Rz8vYzbP/o6n7VHe+6ezN6Ilf+dJwv4FdDZYxAGMb2UM/JUTO0FDAB24g
 qo3GDZd3Q7/RnMWLIgyToMDmgro7YHQgd2379kGChTqRkTL64F4WBhFnKS72DC4yQ6
 1AW+czaUR5WyQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 18/53] ALSA: x86: intel_hdmi_audio: enable
 pm_runtime and set autosuspend delay
Date: Mon, 27 Jun 2022 22:18:04 -0400
Message-Id: <20220628021839.594423-18-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628021839.594423-1-sashal@kernel.org>
References: <20220628021839.594423-1-sashal@kernel.org>
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
index 0d828e35b401..3b04c70a73e3 100644
--- a/sound/x86/intel_hdmi_audio.c
+++ b/sound/x86/intel_hdmi_audio.c
@@ -33,6 +33,8 @@
 #include <drm/intel_lpe_audio.h>
 #include "intel_hdmi_audio.h"
 
+#define INTEL_HDMI_AUDIO_SUSPEND_DELAY_MS  5000
+
 #define for_each_pipe(card_ctx, pipe) \
 	for ((pipe) = 0; (pipe) < (card_ctx)->num_pipes; (pipe)++)
 #define for_each_port(card_ctx, port) \
@@ -1802,8 +1804,11 @@ static int __hdmi_lpe_audio_probe(struct platform_device *pdev)
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

