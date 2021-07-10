Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD043C2ED1
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jul 2021 04:28:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 213BC16DC;
	Sat, 10 Jul 2021 04:27:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 213BC16DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625884103;
	bh=v8svG+L4x8wucij86aEqWhgJcc4SA+9efd9n0jHqBak=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pRcMjeGbQKsrA0RccsJ3VjHxlhhMDe4fammgxskNoCYzjZ0ljZawOtuv84GmqWa0y
	 nlTmFT70BBCBsHkOP8jnH4ICdn6fdud3nPHLhTnhSU/ZHOao+fD8N+VYjBs2jHMNuj
	 z3lIoFxN+dczdDNq7t2tYeoaMlVXKx0aYcaabl9Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBA6BF8050F;
	Sat, 10 Jul 2021 04:22:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 859EFF80516; Sat, 10 Jul 2021 04:22:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9FB5F804F3
 for <alsa-devel@alsa-project.org>; Sat, 10 Jul 2021 04:22:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9FB5F804F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ps/QxW0Q"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0101F613F8;
 Sat, 10 Jul 2021 02:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625883747;
 bh=v8svG+L4x8wucij86aEqWhgJcc4SA+9efd9n0jHqBak=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ps/QxW0QbIig7L7Gky6u3moIolPoeu29Usx3dbvoZiW27DTAEZhMzkYNtkLFbj6HF
 QAZUaVJRinf9QOFIGxdPGMG4RtxpoqkgFj9pL9ZkohWWJ3uFHoMLQCHYFYvREtyMa/
 kcK143djg7v4XzaOdHaMDUiVcUcsjA+7KMV8sIshIh/04behUEdZnOpvBEeutdAuT9
 9uM51fGMrqAyslAHFEPrrAtb+nSdMrmb42qfNkwKRroJmXM6mcFU5JzvnHNolflof9
 urEzdmFhVUUGpcLF6jRYeGE2IHay+h94RvyI1mcztsAeBpzPeWTAAeKS7/wrpwmwwK
 ifj0Tz1Xe5vVg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 024/104] ASoC: Intel: sof_sdw: add quirk support
 for Brya and BT-offload
Date: Fri,  9 Jul 2021 22:20:36 -0400
Message-Id: <20210710022156.3168825-24-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710022156.3168825-1-sashal@kernel.org>
References: <20210710022156.3168825-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>,
 Bard Liao <bard.liao@intel.com>, Yong Zhi <yong.zhi@intel.com>
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

[ Upstream commit 03effde3a2ea1d82c4dd6b634fc6174545d2c34f ]

Brya is another ADL-P product.

AlderLake has support for Bluetooth audio offload capability.
Enable the BT-offload quirk for ADL-P Brya and the Intel RVP.

Signed-off-by: Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>
Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Link: https://lore.kernel.org/r/20210521155632.3736393-2-kai.vehmanen@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/sof_sdw.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 5827a16773c9..2ba3eefb9c8d 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -197,7 +197,21 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		.driver_data = (void *)(SOF_RT711_JD_SRC_JD1 |
 					SOF_SDW_TGL_HDMI |
 					SOF_RT715_DAI_ID_FIX |
-					SOF_SDW_PCH_DMIC),
+					SOF_SDW_PCH_DMIC |
+					SOF_BT_OFFLOAD_SSP(2) |
+					SOF_SSP_BT_OFFLOAD_PRESENT),
+	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Brya"),
+		},
+		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
+					SOF_SDW_PCH_DMIC |
+					SOF_SDW_FOUR_SPK |
+					SOF_BT_OFFLOAD_SSP(2) |
+					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
 	{}
 };
-- 
2.30.2

