Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 581743740CD
	for <lists+alsa-devel@lfdr.de>; Wed,  5 May 2021 18:38:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE02716F2;
	Wed,  5 May 2021 18:37:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE02716F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620232702;
	bh=IT+5WeIpLY9wMHs/s4Kw3Wm0X2t8cPHtpBTEP+qGz78=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SYEW4m0DjNZFyv352sNRxM3stja4G1JeGLIcfM6OB5VRpCZ1/v0ZOK02yRmMZFypG
	 PVVCmm3WoHmyhO7xqyh6D9JgQV5RM+Kprhl9DA3+vUOugVp/VGWz9EJisCVG750V+P
	 kO+FRs5jmPH3bfuTP7Wz+FJQo7stMgZ7fYZSojZc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C91EF80510;
	Wed,  5 May 2021 18:33:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3B6FF8025F; Wed,  5 May 2021 18:33:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C11AF8026D
 for <alsa-devel@alsa-project.org>; Wed,  5 May 2021 18:33:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C11AF8026D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YxO/UBAH"
Received: by mail.kernel.org (Postfix) with ESMTPSA id EE46361453;
 Wed,  5 May 2021 16:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232400;
 bh=IT+5WeIpLY9wMHs/s4Kw3Wm0X2t8cPHtpBTEP+qGz78=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YxO/UBAHQpUiWt4LQqkVHMmt6sZ11j3l+jPWN9yrjv2Jv4xcHMM0t3DWPTqAiuO0C
 mhceTM5Aq1KCWgYVCma7zn8xQZ8B1XZcYVjb4jzmq/WO/zRr9awW/z4m6Fd9rhXkTr
 9seVSjPRugfhUEs1U38fPDsMkLjJ2XkqxwAKrUKdUStO7XFt8EHlZvGCvKrsjvfEiT
 li8JwxGOEPpkZ5HuOQ0ZpY1epWZFTivKpVwKNG+SeQoT4l/doXlkClHXjdfpvZ2aYI
 wREehq5da4bTGLfFoJ8RwpIpBiWZ0AuHx1snlG1OsBrMlg4FqORrZlRd+4ggN5LMno
 QhXxtZzKKz/cw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 081/116] ASoC: Intel: sof_sdw: add quirk for new
 ADL-P Rvp
Date: Wed,  5 May 2021 12:30:49 -0400
Message-Id: <20210505163125.3460440-81-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163125.3460440-1-sashal@kernel.org>
References: <20210505163125.3460440-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>,
 Bard Liao <bard.liao@intel.com>
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

From: Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>

[ Upstream commit d25bbe80485f8bcbbeb91a2a6cd8798c124b27b7 ]

Add quirks for jack detection, rt711 DAI and DMIC

Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20210415175013.192862-6-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/sof_sdw.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 8adce6417b02..ecd3f90f4bbe 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -187,6 +187,17 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 					SOF_RT715_DAI_ID_FIX |
 					SOF_SDW_FOUR_SPK),
 	},
+	/* AlderLake devices */
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alder Lake Client Platform"),
+		},
+		.driver_data = (void *)(SOF_RT711_JD_SRC_JD1 |
+					SOF_SDW_TGL_HDMI |
+					SOF_SDW_PCH_DMIC),
+	},
 	{}
 };
 
-- 
2.30.2

