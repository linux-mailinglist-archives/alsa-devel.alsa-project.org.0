Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 582D44C04E3
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 23:49:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5DA518A3;
	Tue, 22 Feb 2022 23:48:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5DA518A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645570186;
	bh=t3KtrwsklSFs1HTvGFvtOem5h6Muc/8gpqVeKKJWgSw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YWG+nLyVgMm+d4vJokZAZV6656ysLP4GGMLLdVCC8CiurPnQtD3VWsNpOtgl1hI+v
	 URJkDWDci0BnInCAU83n40xCVLuCwJHg1yCun/GuqiYsBfEh8CZzGuOxAARvB9XgmB
	 k0sfZtaYKFpdI4jRHvcX7wlbBuV4m7BO/Y+X6KPU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AED1F801F5;
	Tue, 22 Feb 2022 23:48:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D569F8012C; Tue, 22 Feb 2022 23:48:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8879F80118
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 23:48:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8879F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Wtw2q7I5"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 76E6060A6B;
 Tue, 22 Feb 2022 22:48:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8FB1C340E8;
 Tue, 22 Feb 2022 22:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645570108;
 bh=t3KtrwsklSFs1HTvGFvtOem5h6Muc/8gpqVeKKJWgSw=;
 h=From:To:Cc:Subject:Date:From;
 b=Wtw2q7I5pBEyEPucEsAQVD4y8OrgAfKFay4ik2L/FtI7fiSp7ABst4THjkEDFjfps
 7b8vuvKkfakj6b34HWj84bxt+iJNhD5vyA0wvnl6fIqOGZpRttSUd8Sr2JxJU5zYlu
 07IEUlWbbL74CH0OzK/juDkcgqBq7SVvZO0GXNBDJjSK/Ot9tPa1fRkbuyysBY00O7
 lkSFUZn80YopX1QA6qIVLFZLCkikGsRKeDiK7qbxSq60POo7gHqqiFs/4awLK1eIO4
 +Mp+ddiHs0PF/rpyuXPxWFDPWVpnmr197LkG4TrI/lg48jw4KjO/ysaNrq9kEUAUHt
 L9jecHaCglZJg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: inno_rk3036: Use modern ASoC DAI format terminology
Date: Tue, 22 Feb 2022 22:48:16 +0000
Message-Id: <20220222224816.3636987-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1094; h=from:subject;
 bh=t3KtrwsklSFs1HTvGFvtOem5h6Muc/8gpqVeKKJWgSw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiFWgiiiWSqfjA+1ORpvBnGvmY8fbKS8PmweHca+Pt
 YIso1k+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYhVoIgAKCRAk1otyXVSH0FLEB/
 95DdCvp0Gwpb36EHgZfZxVJHqp3pgUwHsOPtklOs4JPkPkZ9ng4L0Kf8uqzL3WtL31bAbzphPyLzUi
 GloEv8H8hJsTyqTpbjds8Kj4TZB6wO57kA2i0lRQYEFsRL9adR2HI/KynzltBB3K8ZY1aQPmUem3jJ
 ajzAbL6an2HYOZhiNEFu8NaO0+z26NeYx71nWT1k2RyQBfz2U9vp5uD0abnfW65364o+/GJc1wnQrL
 Jrk8wjGsgT3D966SzGAJEMPvNVk5/Y4a7JR3A1w1A+bWDqxrVojhaob5nguZ6jUt1+MZ8h+29M2Zdw
 DLDLpQxjCIURZ5haoLZn2lkaGY+fPr
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

As part of moving to remove the old style defines for the bus clocks update
the inno_rk3036 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/inno_rk3036.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/inno_rk3036.c b/sound/soc/codecs/inno_rk3036.c
index e05c4f27486e..ca0f4c1911e4 100644
--- a/sound/soc/codecs/inno_rk3036.c
+++ b/sound/soc/codecs/inno_rk3036.c
@@ -200,12 +200,12 @@ static int rk3036_codec_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 
 	dev_dbg(component->dev, "rk3036_codec dai set fmt : %08x\n", fmt);
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBC_CFC:
 		reg01_val |= INNO_R01_PINDIR_IN_SLAVE |
 			     INNO_R01_I2SMODE_SLAVE;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		reg01_val |= INNO_R01_PINDIR_OUT_MASTER |
 			     INNO_R01_I2SMODE_MASTER;
 		break;
-- 
2.30.2

