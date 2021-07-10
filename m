Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F120E3C2E59
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jul 2021 04:27:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F7B616CC;
	Sat, 10 Jul 2021 04:26:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F7B616CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625884036;
	bh=aPEsAJGmsGNzWDFxYT9/4VLd8DXDuBcJnkwDQrRJGlk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GV4VqugpuiyKONIp80jnGmlxCF1ohd3X1Bfxamj4h/KrRjqGCXENhUFVuwG72kuci
	 84Aq8XoM6dG8rNzk3iEnEQtO06QDmGP+Sa8DGnHqxI8YmlaIUZG7Ws3SHGpj/ZjlZ3
	 ANHaZeJ+bZ1IT7nuCVFgz22Q34KO5/zwUs+CVyWY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95460F804FA;
	Sat, 10 Jul 2021 04:22:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8918CF804F2; Sat, 10 Jul 2021 04:22:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BA02F802C8
 for <alsa-devel@alsa-project.org>; Sat, 10 Jul 2021 04:22:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BA02F802C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jj0ZWhqS"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3B064613E8;
 Sat, 10 Jul 2021 02:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625883735;
 bh=aPEsAJGmsGNzWDFxYT9/4VLd8DXDuBcJnkwDQrRJGlk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jj0ZWhqSWsx3V9dGqFLvBtaiucrgMfCryzMMfa6U8+oP3FT+i8MJf73SVstu2Urck
 SsgoVOpeUFDrRqf+Ka4YzBpGTp7zn5XhLnQWlsOBWuxsRoD0S6CbpjCEouNVe0fHvO
 8iYbCubihRW1QE7c57x+SGS/fK9lfp23dBBGhHSIzN2R1mipogCRMhT+rdKvQt8isD
 zZ9O6mB4hy9TQw/i4cxlwFWtpWV2UGqOEftxFpB20uHD8JTurz4OJ0A0d04nJ/pjUD
 zAe3dPITgZbJAt92ex1dBoFtArIYFDJeq6Jiehfc5iCgkb522Knu8M5W0qUEeHRLSd
 DxrBBSzC8dZeA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 014/104] ASoC: intel/boards: add missing
 MODULE_DEVICE_TABLE
Date: Fri,  9 Jul 2021 22:20:26 -0400
Message-Id: <20210710022156.3168825-14-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710022156.3168825-1-sashal@kernel.org>
References: <20210710022156.3168825-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, Hulk Robot <hulkci@huawei.com>,
 Zou Wei <zou_wei@huawei.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org
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

From: Zou Wei <zou_wei@huawei.com>

[ Upstream commit a75e5cdf4dd1307bb1541edbb0c008f40896644c ]

This patch adds missing MODULE_DEVICE_TABLE definition which generates
correct modalias for automatic loading of this driver when it is built
as an external module.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zou Wei <zou_wei@huawei.com>
Link: https://lore.kernel.org/r/1620791647-16024-1-git-send-email-zou_wei@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/sof_da7219_max98373.c | 1 +
 sound/soc/intel/boards/sof_rt5682.c          | 1 +
 2 files changed, 2 insertions(+)

diff --git a/sound/soc/intel/boards/sof_da7219_max98373.c b/sound/soc/intel/boards/sof_da7219_max98373.c
index f3cb0773e70e..8d1ad892e86b 100644
--- a/sound/soc/intel/boards/sof_da7219_max98373.c
+++ b/sound/soc/intel/boards/sof_da7219_max98373.c
@@ -440,6 +440,7 @@ static const struct platform_device_id board_ids[] = {
 	},
 	{ }
 };
+MODULE_DEVICE_TABLE(platform, board_ids);
 
 static struct platform_driver audio = {
 	.probe = audio_probe,
diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 55505e207bc0..56e92a1ff34d 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -942,6 +942,7 @@ static const struct platform_device_id board_ids[] = {
 	},
 	{ }
 };
+MODULE_DEVICE_TABLE(platform, board_ids);
 
 static struct platform_driver sof_audio = {
 	.probe = sof_audio_probe,
-- 
2.30.2

