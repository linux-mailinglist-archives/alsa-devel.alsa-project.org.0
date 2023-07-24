Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 683EC75E72A
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jul 2023 03:25:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F01D5828;
	Mon, 24 Jul 2023 03:24:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F01D5828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690161911;
	bh=nWnY/htNiU0QB4lq9mZCz0EvhOKHHpbvJcGE9z1a7Mg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eDC4sLEMbFH6GUu1xPuhhPPly5mfhvq2URkYGWngBHepYAc5UVRXh8zJJ6XR3zja7
	 rAn6NCIVuyFFZ6+IShwIRkchFvIjk0VIpU/fr1sZA+zzokHkX/a5wbXIVq19Vls/b3
	 mMb34/Z+Gek+b882k4aJXHlNHk2Cz36pxzd6zOaM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3282F8055A; Mon, 24 Jul 2023 03:23:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 32C84F80310;
	Mon, 24 Jul 2023 03:23:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15A06F80520; Mon, 24 Jul 2023 03:23:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4BAE5F800C7;
	Mon, 24 Jul 2023 03:23:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BAE5F800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RPa4F4Kn
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3B2E860F00;
	Mon, 24 Jul 2023 01:23:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AF02C433C7;
	Mon, 24 Jul 2023 01:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690161796;
	bh=nWnY/htNiU0QB4lq9mZCz0EvhOKHHpbvJcGE9z1a7Mg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RPa4F4Knng5gpVtiDm8uYFqyK+1RUFDxMeWBaQeEAJ6bRSJRgr8C9lTOvn7ei9fQt
	 X5zY+2ubXzvEKOg9ppfWlqrMDUp6IzhDPikpGAIEAWaywopEOzX/CBgFYl1J+EsSL4
	 2Xf6b9sm2PY3voB0teqBEdtyL5yF1U/ie/fHNKu3eM6P4iAH7s7W6Iyf+ZSd1RZUuL
	 DLY939tmLDOEyDc8l0isPHYnTpeNtChsq8IBk//8mcReb7sbMO9P9aHL3nRXSOZ5iU
	 eZfAekUMw1xYpWh9zSU3mxzJREjULY/a3WI2FV+FzIDKMVfIxX8U2jD2U8KcXLGSP/
	 rgyfYfmlGQ8AA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	sound-open-firmware@alsa-project.org,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.1 33/41] ASoC: SOF: core: Free the firmware trace
 before calling snd_sof_shutdown()
Date: Sun, 23 Jul 2023 21:21:06 -0400
Message-Id: <20230724012118.2316073-33-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724012118.2316073-1-sashal@kernel.org>
References: <20230724012118.2316073-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.40
Content-Transfer-Encoding: 8bit
Message-ID-Hash: W7ADMNOSQVBO4PST7WPCQU5TM4TS4FPJ
X-Message-ID-Hash: W7ADMNOSQVBO4PST7WPCQU5TM4TS4FPJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W7ADMNOSQVBO4PST7WPCQU5TM4TS4FPJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

[ Upstream commit d389dcb3a48cec4f03c16434c0bf98a4c635372a ]

The shutdown is called on reboot/shutdown of the machine.
At this point the firmware tracing cannot be used anymore but in case of
IPC3 it is using and keeping a DMA channel active (dtrace).

For Tiger Lake platforms we have a quirk in place to fix rare reboot issues
when a DMA was active before rebooting the system.
If the tracing is enabled this quirk will be always used and a print
appears on the kernel log which might be misleading or not even correct.

Release the fw tracing before executing the shutdown to make sure that this
known DMA user is cleared away.

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20230616100039.378150-4-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 625977a29d8a8..75a1e2c6539f2 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -479,8 +479,10 @@ int snd_sof_device_shutdown(struct device *dev)
 	if (IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE))
 		cancel_work_sync(&sdev->probe_work);
 
-	if (sdev->fw_state == SOF_FW_BOOT_COMPLETE)
+	if (sdev->fw_state == SOF_FW_BOOT_COMPLETE) {
+		sof_fw_trace_free(sdev);
 		return snd_sof_shutdown(sdev);
+	}
 
 	return 0;
 }
-- 
2.39.2

