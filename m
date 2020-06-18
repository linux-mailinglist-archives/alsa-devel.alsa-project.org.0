Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B3D1FDEA8
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 03:36:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4313E16E8;
	Thu, 18 Jun 2020 03:35:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4313E16E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592444196;
	bh=5/R3cDRpWytPNAck8gb5d6HKgxzL3ctP2Ttib7HQNI0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AGbxvA9jvlvU+wvRomn2clhRfMT8eB6e3u6XrUG8TDlRKcHpF33eGlxZJOeQz1dDk
	 uDnRc5deLKGuwQqK9+kkt0rP4N9TzXGwbH4KbXIpgH77g649FhBOgotpzVx6LiU3a0
	 Z/rFhWPhoOeKUZ7m49XkeltpK75v7erthy8UTNS8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB6B7F8044C;
	Thu, 18 Jun 2020 03:17:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C257F80445; Thu, 18 Jun 2020 03:17:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4061AF80322;
 Thu, 18 Jun 2020 03:17:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4061AF80322
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="0vEqDrQo"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B61AC21D90;
 Thu, 18 Jun 2020 01:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592443046;
 bh=5/R3cDRpWytPNAck8gb5d6HKgxzL3ctP2Ttib7HQNI0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=0vEqDrQoMjINoZolUzNVP48VcODNzYe1l65ZhL5oEF9OXMe7AzACn7Ejywr2PvdBy
 vwAEcEiwI71NrLOh+yvcc++X6rxt1YBYf+beKc+vAlcBXGWErlTiSe38QxH+rDs2t0
 SAQGUDlRrqM4t/vyUD1nBXikEliObijuUDE+KSDw=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 041/266] ASoC: SOF: Do nothing when DSP PM
 callbacks are not set
Date: Wed, 17 Jun 2020 21:12:46 -0400
Message-Id: <20200618011631.604574-41-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618011631.604574-1-sashal@kernel.org>
References: <20200618011631.604574-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 sound-open-firmware@alsa-project.org
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

From: Daniel Baluta <daniel.baluta@nxp.com>

[ Upstream commit c26fde3b15ed41f5f452f1da727795f787833287 ]

This provides a better separation between runtime and PM sleep
callbacks.

Only do nothing if given runtime flag is set and calback is not set.

With the current implementation, if PM sleep callback is set but runtime
callback is not set then at runtime resume we reload the firmware even
if we do not support runtime resume callback.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/20200515135958.17511-2-kai.vehmanen@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/pm.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index 195af259e78e..128680b09c20 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -266,7 +266,10 @@ static int sof_resume(struct device *dev, bool runtime_resume)
 	int ret;
 
 	/* do nothing if dsp resume callbacks are not set */
-	if (!sof_ops(sdev)->resume || !sof_ops(sdev)->runtime_resume)
+	if (!runtime_resume && !sof_ops(sdev)->resume)
+		return 0;
+
+	if (runtime_resume && !sof_ops(sdev)->runtime_resume)
 		return 0;
 
 	/* DSP was never successfully started, nothing to resume */
@@ -346,7 +349,10 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 	int ret;
 
 	/* do nothing if dsp suspend callback is not set */
-	if (!sof_ops(sdev)->suspend)
+	if (!runtime_suspend && !sof_ops(sdev)->suspend)
+		return 0;
+
+	if (runtime_suspend && !sof_ops(sdev)->runtime_suspend)
 		return 0;
 
 	if (sdev->fw_state != SOF_FW_BOOT_COMPLETE)
-- 
2.25.1

