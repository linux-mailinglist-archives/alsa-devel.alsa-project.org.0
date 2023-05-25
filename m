Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E77711474
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 20:39:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D70B3DF2;
	Thu, 25 May 2023 20:38:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D70B3DF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685039963;
	bh=JAtkvFZ0/2pDlmSFKy5Da72TvMQtgupm8Xn67ZxEypA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hvLn5BoartEbw/CxYvZIhF/4qyf+ka6JP557an2jo2SEDb191cGn6rTfp8NMEqm3M
	 DmYyKee4Qo2xX+zoo8S/nKK8ed0ZMrO8HyKSEwqHGsBtWHxSELfVGLn82M8qBEReFN
	 cj7nVfdXoDjd0sjaBa0UaOxkamy0b5q6jROMJTM0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37C61F8057B; Thu, 25 May 2023 20:37:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 716CBF8057B;
	Thu, 25 May 2023 20:37:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB3E0F80552; Thu, 25 May 2023 20:37:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EADAAF80548;
	Thu, 25 May 2023 20:37:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EADAAF80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=R7blsWeZ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AFE0A648D3;
	Thu, 25 May 2023 18:37:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B99DAC433D2;
	Thu, 25 May 2023 18:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685039865;
	bh=JAtkvFZ0/2pDlmSFKy5Da72TvMQtgupm8Xn67ZxEypA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R7blsWeZmMkM9pURA2uF/C3cKiZ/RjwH38+z8jjELgfKUbTIqYtfX+ALfufG5JJU4
	 mT5UxSNVgqGTIAlBcfAuHnZ9okCC6vAmdRIDqbM/j6NOIxTmRnuuBbT5FS0zvIfQ8D
	 l50a0g+UNXdDeR+yRXtND99BEF9MkC5nJOQ86NvFrmoCFvKbyIopJd43iyzbqhheqh
	 x3sdneKW9pXDZNgZEiKg+LTqh57bpMrJIlNK/X09IqavPmpIYzKwyvBRv/zSo0xO/a
	 kHwH+If+QQO8spLTfM7IcaKkZNFTy6cR5e7aiuuJ5iLsovzNheGCZEPf+UW5xbi0wu
	 UMCiJmAS+xijg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	daniel.baluta@nxp.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	sound-open-firmware@alsa-project.org,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.1 28/57] ASoC: SOF: sof-client-probes: fix
 pm_runtime imbalance in error handling
Date: Thu, 25 May 2023 14:35:38 -0400
Message-Id: <20230525183607.1793983-28-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230525183607.1793983-1-sashal@kernel.org>
References: <20230525183607.1793983-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4BG45DUFFPJ6BQPUBUNSASJASGTEVJNH
X-Message-ID-Hash: 4BG45DUFFPJ6BQPUBUNSASJASGTEVJNH
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4BG45DUFFPJ6BQPUBUNSASJASGTEVJNH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit bc424273c74c1565c459c8f2a6ed95caee368d0a ]

When an error occurs, we need to make sure the device can pm_runtime
suspend instead of keeping it active.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com
Link: https://lore.kernel.org/r/20230512103315.8921-4-peter.ujfalusi@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/sof-client-probes.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
index ddeabbb5580e1..1e521a9e34d27 100644
--- a/sound/soc/sof/sof-client-probes.c
+++ b/sound/soc/sof/sof-client-probes.c
@@ -441,12 +441,7 @@ static ssize_t sof_probes_dfs_points_read(struct file *file, char __user *to,
 
 	ret = sof_probes_points_info(cdev, &desc, &num_desc);
 	if (ret < 0)
-		goto exit;
-
-	pm_runtime_mark_last_busy(dev);
-	err = pm_runtime_put_autosuspend(dev);
-	if (err < 0)
-		dev_err_ratelimited(dev, "debugfs read failed to idle %d\n", err);
+		goto pm_error;
 
 	for (i = 0; i < num_desc; i++) {
 		offset = strlen(buf);
@@ -464,6 +459,13 @@ static ssize_t sof_probes_dfs_points_read(struct file *file, char __user *to,
 	ret = simple_read_from_buffer(to, count, ppos, buf, strlen(buf));
 
 	kfree(desc);
+
+pm_error:
+	pm_runtime_mark_last_busy(dev);
+	err = pm_runtime_put_autosuspend(dev);
+	if (err < 0)
+		dev_err_ratelimited(dev, "debugfs read failed to idle %d\n", err);
+
 exit:
 	kfree(buf);
 	return ret;
-- 
2.39.2

