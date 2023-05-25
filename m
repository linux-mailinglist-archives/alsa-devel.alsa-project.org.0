Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE11711476
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 20:39:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A24082A;
	Thu, 25 May 2023 20:38:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A24082A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685039988;
	bh=+wRpFKaNgkKh78Cigl7p41FzWfXPIwLCJ7DvoU6/oLs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uE6NJ9eOC71Z5roPiUvEydEVhp62occM2kRWUOx8DAtmgGYSuv8S5Fzy9Z2RsTezj
	 WNZp7Cj6SkTdRwibH1yaL1f1NOMWkBWcBuI0UYGQ8AqGPWVIzMMfxn1a3ZniJbtI2Y
	 XERwXAr6sXRUnDpSZhaviqu+H1j5o5Tj2C+8AoNk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 718F8F805B2; Thu, 25 May 2023 20:38:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FC11F805B6;
	Thu, 25 May 2023 20:38:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01654F80548; Thu, 25 May 2023 20:37:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C8C44F8057A;
	Thu, 25 May 2023 20:37:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8C44F8057A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HJXzUwtL
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B9E1464906;
	Thu, 25 May 2023 18:37:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD77CC4339E;
	Thu, 25 May 2023 18:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685039867;
	bh=+wRpFKaNgkKh78Cigl7p41FzWfXPIwLCJ7DvoU6/oLs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HJXzUwtLFMF/F1tRYAvPnk7j4LjYSZG6hu7+Eh9OgmrJ2+T3dcbxRjxp7nhMV4HnE
	 vduAgYlih2LuSRZ3hMLe9Un859YrO0y68SdbrVlqYo27gm/EwKj4O3y0I/cokMRscu
	 5Pl25LHLD1tXxTo1b+2XUt3tsutxrTTYAB/vkPhXi55SEcoK137PilKDGvcE8ExvCy
	 3EwwLj/tZNEXfO5YL2axPo+RPNsJFtYRoF8uEEnNWEftK+pSMCbx73kkmTEoJtatff
	 jwcrJs9ndALIR7Ja4PCCRovWtiFgHqyXBiJPvqRJoaksFnmNZKL9tDmS6DKNkWKPhR
	 nU86/sv/B9EwA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Sasha Levin <sashal@kernel.org>,
	pierre-louis.bossart@linux.intel.com,
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
Subject: [PATCH AUTOSEL 6.1 29/57] ASoC: SOF: pm: save io region state in case
 of errors in resume
Date: Thu, 25 May 2023 14:35:39 -0400
Message-Id: <20230525183607.1793983-29-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230525183607.1793983-1-sashal@kernel.org>
References: <20230525183607.1793983-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LCCBSZN27MYCONRS7SX6JY7CCROMEUOK
X-Message-ID-Hash: LCCBSZN27MYCONRS7SX6JY7CCROMEUOK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LCCBSZN27MYCONRS7SX6JY7CCROMEUOK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

[ Upstream commit 171b53be635ac15d4feafeb33946035649b1ca14 ]

If there are failures in DSP runtime resume, the device state will not
reach active and this makes it impossible e.g. to retrieve a possible
DSP panic dump via "exception" debugfs node. If
CONFIG_SND_SOC_SOF_DEBUG_ENABLE_DEBUGFS_CACHE=y is set, the data in
cache is stale. If debugfs cache is not used, the region simply cannot
be read.

To allow debugging these scenarios, update the debugfs cache contents in
resume error handler. User-space can then later retrieve DSP panic and
other state via debugfs (requires SOF debugfs cache to be enabled in
build).

Reported-by: Curtis Malainey <cujomalainey@chromium.org
Link: https://github.com/thesofproject/linux/issues/4274
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com
Reviewed-by: Curtis Malainey <cujomalainey@chromium.org
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com
Link: https://lore.kernel.org/r/20230512104638.21376-1-peter.ujfalusi@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/pm.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index 26ffcbb6e30f4..a1bfa5a37e2ad 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -159,7 +159,7 @@ static int sof_resume(struct device *dev, bool runtime_resume)
 		ret = tplg_ops->set_up_all_pipelines(sdev, false);
 		if (ret < 0) {
 			dev_err(sdev->dev, "Failed to restore pipeline after resume %d\n", ret);
-			return ret;
+			goto setup_fail;
 		}
 	}
 
@@ -173,6 +173,18 @@ static int sof_resume(struct device *dev, bool runtime_resume)
 			dev_err(sdev->dev, "ctx_restore IPC error during resume: %d\n", ret);
 	}
 
+setup_fail:
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_ENABLE_DEBUGFS_CACHE)
+	if (ret < 0) {
+		/*
+		 * Debugfs cannot be read in runtime suspend, so cache
+		 * the contents upon failure. This allows to capture
+		 * possible DSP coredump information.
+		 */
+		sof_cache_debugfs(sdev);
+	}
+#endif
+
 	return ret;
 }
 
-- 
2.39.2

