Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E49E30C2F2
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 16:08:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8C48176A;
	Tue,  2 Feb 2021 16:07:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8C48176A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612278496;
	bh=XYduWC12K8v5Yxck2JmTQP182pOqQ9sVEGNrfm3Bilo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vF+N3RV3drY5QWpIG3KjPbTwz7unTHoC9ZkZzmavW2zxWklBRQYuuLrDfUJi1yuQc
	 45IV82L1zRGe/H90R6UBe5CNWn+N9lxCf+w9FLJ4C48OdPWkq9tFBOtPQgcr60nMo4
	 R+v8Nxh8pWIJ07xqLGJ77ihqli2zLukd2JDfPpog=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9C7AF8013C;
	Tue,  2 Feb 2021 16:06:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95210F800E1; Tue,  2 Feb 2021 16:06:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B71EF800E1
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 16:06:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B71EF800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FVY8bZai"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C602D64E06;
 Tue,  2 Feb 2021 15:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612278384;
 bh=XYduWC12K8v5Yxck2JmTQP182pOqQ9sVEGNrfm3Bilo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FVY8bZaiIk3bMa/cDdya67ND8EzBq2AHxQgauwecDu11CESGNWZKcT6g9UaSfoX0g
 lX0CDdifF4UQYhVFx0Zq72YeYNn5dfX55BYivUaUwhSq317uK3ct6QPv1WurtU7HZ/
 vCkhOtwJ6MXrGPboR1qpCttAkR8KaXXPQmslBa42vEu0wRfx/Hn5Bz5JWeir6opzO2
 GigfHNRXGteOZQDSgmGQBCiAwKImNDKlELW5g1rFdHqxF/dB8mVkcYTE6w4YbFc5aa
 5yP1UlrBDBI17TLpv+G9JSKX9B0vCN/7+3iq51d7xFpDJuvQG1SDkQBFR4JV8kx4AI
 V2pax2UezS46g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 06/25] ASoC: Intel: Skylake: Zero
 snd_ctl_elem_value
Date: Tue,  2 Feb 2021 10:05:56 -0500
Message-Id: <20210202150615.1864175-6-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210202150615.1864175-1-sashal@kernel.org>
References: <20210202150615.1864175-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Ricardo Ribalda <ribalda@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

From: Ricardo Ribalda <ribalda@chromium.org>

[ Upstream commit 1d8fe0648e118fd495a2cb393a34eb8d428e7808 ]

Clear struct snd_ctl_elem_value before calling ->put() to avoid any data
leak.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Link: https://lore.kernel.org/r/20210121171644.131059-2-ribalda@chromium.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/skylake/skl-topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index 40bee10b0c65a..1bde9ce04de33 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -3631,7 +3631,7 @@ static void skl_tplg_complete(struct snd_soc_component *component)
 		sprintf(chan_text, "c%d", mach->mach_params.dmic_num);
 
 		for (i = 0; i < se->items; i++) {
-			struct snd_ctl_elem_value val;
+			struct snd_ctl_elem_value val = {};
 
 			if (strstr(texts[i], chan_text)) {
 				val.value.enumerated.item[0] = i;
-- 
2.27.0

