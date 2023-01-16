Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB5A66C0AA
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Jan 2023 15:03:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71A5056D9;
	Mon, 16 Jan 2023 15:02:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71A5056D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673877808;
	bh=4h4KUC5FpuOyk6IZUK3W1vwu6OuiMUrZWu9qOR0sw4s=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rU0svlmJ1fRQBjYlpZatBOBeR19exH6tPHt1UVDfbfjovtTXzprl/lnYPmcL6lJn+
	 1s0Jf1/EeLgPfDYB1WfJdraGJfD+WuAyx9UcnYjbnruUtPZE3Lh7T5p/gA0MxHmLvl
	 uX16lvQkCkt27CehXJXLkHKke1taL18O6khS6KU0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 731BDF80549;
	Mon, 16 Jan 2023 15:02:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B955FF80542; Mon, 16 Jan 2023 15:02:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 121B5F80240;
 Mon, 16 Jan 2023 15:02:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 121B5F80240
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ljQKFWxM
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7BC8A60FD1;
 Mon, 16 Jan 2023 14:02:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80EF4C43392;
 Mon, 16 Jan 2023 14:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673877722;
 bh=4h4KUC5FpuOyk6IZUK3W1vwu6OuiMUrZWu9qOR0sw4s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ljQKFWxMIQgs8HojcaGKkMlvjXiaPBQ7NO37bVra0z3vxkc/knhw9c7eJdRXvrLcJ
 FRobung3tvjcwKIkYhdEXeZh+QaZIKj3lHZaTqQG7Gp/HylEbIS4EfCYS+AZUOnuX1
 Q63cnGEvQKfBuT7jcCueQ70uxfwLjwmHscBDo7TntuMO6oSWRr4mD8853gaRhIMMJc
 rVldQ7UcDyp+250r5iDIfPc6QeHevUd44h+axUfB9/yb6GRbkwVPFgmlNxPIUa4g/y
 r7M7Sav4P8XLTuEULIea2Pcx7YxNSAST2dEGbyupIKG3MY9K3xZE98epFGIlVrCl5q
 WShhxuoP7XGmA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 04/53] ASoC: SOF: Add FW state to debugfs
Date: Mon, 16 Jan 2023 09:01:04 -0500
Message-Id: <20230116140154.114951-4-sashal@kernel.org>
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
 lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com, tiwai@suse.com,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, daniel.baluta@nxp.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Curtis Malainey <cujomalainey@chromium.org>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 sound-open-firmware@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Curtis Malainey <cujomalainey@chromium.org>

[ Upstream commit 9a9134fd56f6ba614ff7b2b3b0bac0bf1d0dc0c9 ]

Allow system health detection mechanisms to check the FW state, this
will allow them to check if the FW is in its "crashed" state going
forward to help automatically diagnose driver state.

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Link: https://lore.kernel.org/r/20221220125629.8469-4-peter.ujfalusi@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/debug.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index d9a3ce7b69e1..ade0507328af 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -353,7 +353,9 @@ int snd_sof_dbg_init(struct snd_sof_dev *sdev)
 			return err;
 	}
 
-	return 0;
+	return snd_sof_debugfs_buf_item(sdev, &sdev->fw_state,
+					sizeof(sdev->fw_state),
+					"fw_state", 0444);
 }
 EXPORT_SYMBOL_GPL(snd_sof_dbg_init);
 
-- 
2.35.1

