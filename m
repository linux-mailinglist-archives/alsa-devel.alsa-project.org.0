Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CFA66C0DB
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Jan 2023 15:05:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8EE956CB;
	Mon, 16 Jan 2023 15:04:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8EE956CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673877911;
	bh=rKhjvkQjqw5KgkQ2IGqQE+M1sJPep97rfaS5IO0auYg=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=I2rGFvCiSed3TH/u+ZzoKVLxbDNAULTgDcyujbdCegYWeVRSA1jBE9z11jVJgo4SH
	 tIY0FC3Jz4X2QjnnUisQkFSPeQ0Uj5L31EOXyBalusa4693Y90WW4DPZBsgCCCgaA3
	 3ck/2YKPgabT/jiQQS+rYt2u5P9iHCZKHC64p+TY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E8A3F80588;
	Mon, 16 Jan 2023 15:02:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 299F4F80570; Mon, 16 Jan 2023 15:02:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39B44F80571
 for <alsa-devel@alsa-project.org>; Mon, 16 Jan 2023 15:02:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39B44F80571
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NQ3kgJk1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 02D2C60FCA;
 Mon, 16 Jan 2023 14:02:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1345AC433EF;
 Mon, 16 Jan 2023 14:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673877757;
 bh=rKhjvkQjqw5KgkQ2IGqQE+M1sJPep97rfaS5IO0auYg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NQ3kgJk1vmkTeA1lOwjtfoxP/rT4tY+1KhWg4RhMbiT77aX/ozV1XBKLXQUvBlYjg
 4ZdNbYK7X6qEo1Nz0xQfq9bZIAyygVGDnASxf+sU6HiTb06+XHvD/T6XJvJvlScQJ8
 LmRHDh5xQD1T0h8H0WmNBWFZBbq6LLpvsD1CL2C7xfRwBgaZEc8zZl6OS5UH7CSuyo
 5ZCzZqq/sUh3eUoSsXZq2Iba2GLU5Wc0gTy2Ef/kxtYmo6xAmTCgVeYxG/3FgnmBF/
 UuRIBtlpEMCedDWLznp5koEuOiebyX2Ty1CrrX4p4qshlh7JvN1EQHSEBz91+mqbmU
 DWEE/p7TK8Dng==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 12/53] ASoC: support machine driver with max98360
Date: Mon, 16 Jan 2023 09:01:12 -0500
Message-Id: <20230116140154.114951-12-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230116140154.114951-1-sashal@kernel.org>
References: <20230116140154.114951-1-sashal@kernel.org>
MIME-Version: 1.0
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
 allen-kh.cheng@mediatek.com, lgirdwood@gmail.com, trevor.wu@mediatek.com,
 renzhijie2@huawei.com, tiwai@suse.com, jiaxin.yu@mediatek.com,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Mars Chen <chenxiangrui@huaqin.corp-partner.google.com>, tzungbi@kernel.org,
 matthias.bgg@gmail.com, julianbraha@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Mars Chen <chenxiangrui@huaqin.corp-partner.google.com>

[ Upstream commit 810948f45d99c46b60852ef2a5a2777c12d6bb3e ]

Signed-off-by: Mars Chen <chenxiangrui@huaqin.corp-partner.google.com>
Link: https://lore.kernel.org/r/20221228103812.450956-1-chenxiangrui@huaqin.corp-partner.google.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/mediatek/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 7bdb0ded831c..b027fba8233d 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -187,6 +187,7 @@ config SND_SOC_MT8186_MT6366_RT1019_RT5682S
 	depends on SND_SOC_MT8186 && MTK_PMIC_WRAP
 	select SND_SOC_MAX98357A
 	select SND_SOC_MT6358
+	select SND_SOC_MAX98357A
 	select SND_SOC_RT1015P
 	select SND_SOC_RT5682S
 	select SND_SOC_BT_SCO
-- 
2.35.1

