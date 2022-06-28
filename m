Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D74F55BD77
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jun 2022 04:24:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B57A164F;
	Tue, 28 Jun 2022 04:23:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B57A164F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656383056;
	bh=uS6DuCuP8/gGQebHcRnj3kA+UnK0rgN6NhV7ivCC9/s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Viny2u84DtU2dB/H91RJXfJXHKDEbWSoUqsDtv/4Ifb2wmxOJpbqdT1A3vPilQ270
	 JICaYHVdlU1Qv0noNXLr9tPrBr3mQNGRfWYxnT95Dbz+xGLkcu7RM7pT6dwnFtgoeK
	 F2KCOjQB+HpANt7oJHGp9yMGD0H6/LcBIiwcX12o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9590EF8028B;
	Tue, 28 Jun 2022 04:23:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31210F804F2; Tue, 28 Jun 2022 04:23:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 507CEF80166
 for <alsa-devel@alsa-project.org>; Tue, 28 Jun 2022 04:23:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 507CEF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sO4na1EJ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 697ACB81C0B;
 Tue, 28 Jun 2022 02:23:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E373C34115;
 Tue, 28 Jun 2022 02:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656382993;
 bh=uS6DuCuP8/gGQebHcRnj3kA+UnK0rgN6NhV7ivCC9/s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sO4na1EJeq5i/gAT7YSqB7X9jUYl6atq/lH4TariM4Nhr5iusF9snQQEcqwdYpnbu
 gXHX0ULTB/sEXgoT+TYPkzYW+/ebqj7RnS9e6a+kQTQPxdGapcXZrZb59kCDnDZImn
 Pf1OlLeHKhe+mlPicuaqcbvGmN7B4zd7E4PK7k91PblweMaAyLpaS4/idOzsx1fbR1
 7pyenniEOLdNsC4HsWm1EMWxbPZiaF7QFf9pGqlD3n9nY0wlqAUxNpIY38m7/uZjaa
 mCsy8cH51EW+pBv48Tcm6zE+uVeutEzR818A9fQ7syNEGMBVmzJOsUNfwCObyCdxct
 Q62OrOIyvpnfg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 11/34] ALSA: x86: intel_hdmi_audio: enable
 pm_runtime and set autosuspend delay
Date: Mon, 27 Jun 2022 22:22:18 -0400
Message-Id: <20220628022241.595835-11-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628022241.595835-1-sashal@kernel.org>
References: <20220628022241.595835-1-sashal@kernel.org>
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
index dbaa43ffbbd2..2c150bce30bb 100644
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
@@ -1836,8 +1838,11 @@ static int hdmi_lpe_audio_probe(struct platform_device *pdev)
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

