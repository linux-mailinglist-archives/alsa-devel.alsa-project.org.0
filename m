Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CACC66C0B0
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Jan 2023 15:03:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7F1D56D5;
	Mon, 16 Jan 2023 15:02:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7F1D56D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673877826;
	bh=gd6nnAxCXX6nRwCMcVtm0qxihQ4usvTBVYQsxON9ZlI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Om8BSva83DD1gYVKx+cYe/a9tho0z6OJXeZOu1Nn7/g6wuj1dTo48S+FC3stXt+0F
	 Zj7ldSP9W5prgz0qNdlA9KMUSAY8JIup6H9oRJRVzjECZ0vf1xVh7v/TODUaBc1McB
	 KA5iB0xlOqFqks2/37kRCVKX3v4+lUBlxtqEpPeE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63733F80563;
	Mon, 16 Jan 2023 15:02:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69AAAF8053D; Mon, 16 Jan 2023 15:02:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F563F8023A;
 Mon, 16 Jan 2023 15:02:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F563F8023A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=F7VYT2Fl
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A84B160FCC;
 Mon, 16 Jan 2023 14:02:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 966CCC433F2;
 Mon, 16 Jan 2023 14:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673877721;
 bh=gd6nnAxCXX6nRwCMcVtm0qxihQ4usvTBVYQsxON9ZlI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=F7VYT2FlXIS5w2rDCSnB2KQBhT/fWc/g5qeby3PrjLiM1eVrdv/NPTwdlen0LOcuj
 5oYP55PiHZgXYSzzbs7KTDuLKNZAzFDKBtcIfN1l3ePOjy1lkzLX7FpxfTmaeUfkkQ
 WVxT3Ke6R6L956eJ8BWUkTjpB3/0bCTKSwx2VJsYoSvsNH9v6sfVBcig4+pZjTx1q4
 3+WCYLju/Riv6HhnciIbgHcMS36fVLwt6kMdtgNWQAU5/bkX2bbje6MwZaKYyTtoy0
 SQmCSmLCGzXtHRWSc+I9Wn26JJBOxmGHYik8ZIegmIZbpIAYUtireUrEnuWht4KX80
 76ezWsYI8AjBA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 03/53] ASoC: SOF: pm: Always tear down pipelines
 before DSP suspend
Date: Mon, 16 Jan 2023 09:01:03 -0500
Message-Id: <20230116140154.114951-3-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230116140154.114951-1-sashal@kernel.org>
References: <20230116140154.114951-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, Bard Liao <yung-chuan.liao@linux.intel.com>,
 tiwai@suse.com, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 daniel.baluta@nxp.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Curtis Malainey <cujomalainey@chromium.org>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 sound-open-firmware@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

[ Upstream commit d185e0689abc98ef55fb7a7d75aa0c48a0ed5838 ]

When the DSP is suspended while the firmware is in the crashed state, we
skip tearing down the pipelines. This means that the widget reference
counts will not get to reset to 0 before suspend. This will lead to
errors with resuming audio after system resume. To fix this, invoke the
tear_down_all_pipelines op before skipping to DSP suspend.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Curtis Malainey <cujomalainey@chromium.org>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Link: https://lore.kernel.org/r/20221220125629.8469-3-peter.ujfalusi@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/pm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index 5f88c4a01fa3..8722bbd7fd3d 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -192,6 +192,9 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 	if (runtime_suspend && !sof_ops(sdev)->runtime_suspend)
 		return 0;
 
+	if (tplg_ops && tplg_ops->tear_down_all_pipelines)
+		tplg_ops->tear_down_all_pipelines(sdev, false);
+
 	if (sdev->fw_state != SOF_FW_BOOT_COMPLETE)
 		goto suspend;
 
@@ -216,9 +219,6 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 		goto suspend;
 	}
 
-	if (tplg_ops->tear_down_all_pipelines)
-		tplg_ops->tear_down_all_pipelines(sdev, false);
-
 	/* suspend DMA trace */
 	sof_fw_trace_suspend(sdev, pm_state);
 
-- 
2.35.1

