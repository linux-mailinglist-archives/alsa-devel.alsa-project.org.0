Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CACAA7113F7
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 20:35:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24E201E4;
	Thu, 25 May 2023 20:34:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24E201E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685039726;
	bh=mfi9pA8TtpQSlQKzzbalZaPXkKkmtsGD+l1SjdXJ0yA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lhB/yL/lHl4Ql3I+v5TLvgFYw5GgirSdo1w4LsVZzsVzs8B+m+fHupSK93mV94VQP
	 7fGdcIRqDB5jOX4/FXq34hDinCOHL+tfqeZNIxPhfU5404httDVPQPkm4k2XvpZdPg
	 LAKm6sY6ToC/9pa4lzQb8acW2QuBRsaRq++EjkEI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92120F8024E; Thu, 25 May 2023 20:34:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D498EF8026A;
	Thu, 25 May 2023 20:34:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14636F80544; Thu, 25 May 2023 20:34:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DE4B0F80007;
	Thu, 25 May 2023 20:34:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE4B0F80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jMmhHDXj
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D0A2E60BA8;
	Thu, 25 May 2023 18:34:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFCD1C43446;
	Thu, 25 May 2023 18:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685039641;
	bh=mfi9pA8TtpQSlQKzzbalZaPXkKkmtsGD+l1SjdXJ0yA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jMmhHDXjlkRpJASzSF9KjbU/al7RDFy/oyrMSzeH1lXy5Kta8j08ftqGGluFT3xiw
	 4bMz1s7XsoNB5qunFzwSiLF7PFzc58qGSGC488/gbO/gCDVna6b3JNuIotmQzle4/a
	 5DvPMTwLufzddSPZQT58eX+a09KYKL9l61nJIIIHWJjOOEEyBWvx4c4KZcv4AHe1m4
	 093WFaYrXtq8QFoO6Lx5Ex0+T5My4Y2D9HyhId4uPZDh4r42/5xqXO0m2GHlhIT9ge
	 K4nazGzymsbPEr7m+Wh6wcaIODFsrSJpk4DfYnIwpIiwXQe+bjCsEUOxRALnSEWR1V
	 a8cDifdUxrw8g==
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
Subject: [PATCH AUTOSEL 6.3 31/67] ASoC: SOF: debug: conditionally bump
 runtime_pm counter on exceptions
Date: Thu, 25 May 2023 14:31:08 -0400
Message-Id: <20230525183144.1717540-31-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230525183144.1717540-1-sashal@kernel.org>
References: <20230525183144.1717540-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BTBYHCE6LTI2G7KMJQTF5WCGV4ILW6NV
X-Message-ID-Hash: BTBYHCE6LTI2G7KMJQTF5WCGV4ILW6NV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BTBYHCE6LTI2G7KMJQTF5WCGV4ILW6NV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit 3de975862f985f1c9e225a0d13aa3d501373f7c3 ]

When a firmware IPC error happens during a pm_runtime suspend, we
ignore the error and suspend anyways. However, the code
unconditionally increases the runtime_pm counter. This results in a
confusing configuration where the code will suspend, resume but never
suspend again due to the use of pm_runtime_get_noresume().

The intent of the counter increase was to prevent entry in D3, but if
that transition to D3 is already started it cannot be stopped. In
addition, there's no point in that case in trying to prevent anything,
the firmware error is handled and the next resume will re-initialize
the firmware completely.

This patch changes the logic to prevent suspend when the device is
pm_runtime active and has a use_count > 0.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com
Link: https://lore.kernel.org/r/20230512103315.8921-2-peter.ujfalusi@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/debug.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index ade0507328af4..5042312b1b98d 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -437,8 +437,8 @@ void snd_sof_handle_fw_exception(struct snd_sof_dev *sdev, const char *msg)
 		/* should we prevent DSP entering D3 ? */
 		if (!sdev->ipc_dump_printed)
 			dev_info(sdev->dev,
-				 "preventing DSP entering D3 state to preserve context\n");
-		pm_runtime_get_noresume(sdev->dev);
+				 "Attempting to prevent DSP from entering D3 state to preserve context\n");
+		pm_runtime_get_if_in_use(sdev->dev);
 	}
 
 	/* dump vital information to the logs */
-- 
2.39.2

