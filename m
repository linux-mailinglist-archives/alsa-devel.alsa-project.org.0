Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E0E15DF9C
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2020 17:10:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4C42167A;
	Fri, 14 Feb 2020 17:09:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4C42167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581696610;
	bh=YP4YI9+Bse5nrhbaSfpyaXQlwOZ49cneDGZfsbfw8OM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UwN4fu8djudKiu7DNrhEnH3PNVFQbBPHV1bfXxva1es3Av5OhJ5Q+ULjqXC23fD/z
	 n0R+Mbl1HfU3jOrQAv8aDd5aR0161e0LgJnbr5JaNrsulIFK7H7FrAK1gkgkoWxibC
	 MNb7AM0p4oIxHWDAVn3RWsrmx0ERXdFctltEGqz4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C651F80276;
	Fri, 14 Feb 2020 17:06:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98823F80290; Fri, 14 Feb 2020 17:06:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89968F800F0
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 17:06:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89968F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gL5syfcc"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1E766222C2;
 Fri, 14 Feb 2020 16:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581696400;
 bh=BMSj3i+Zs6AHfdEoKpkr+5pJSuTkEp65CL/I5pXfE30=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gL5syfccITRa7zVVmoA+jIjQ4Qb/72Wg4mOxCOMNNxfFzuRSmIX0hJWxJUThO5dI8
 BKLsJlJhU0g1veilL4c52EhrRv1cbHWyPp8R8Qcjr5hklLdqlqlLogsCFEdUsF+rvE
 LKxqUDOl3PbHQXiciy5m7z+CS7A2Eatrm2gwINto=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Fri, 14 Feb 2020 10:57:55 -0500
Message-Id: <20200214160149.11681-225-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214160149.11681-1-sashal@kernel.org>
References: <20200214160149.11681-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, Hulk Robot <hulkci@huawei.com>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 YueHaibing <yuehaibing@huawei.com>
Subject: [alsa-devel] [PATCH AUTOSEL 5.4 225/459] ASoC: Intel:
	kbl_da7219_max98357a: remove unused variable
	'constraints_16000' and 'ch_mono'
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: YueHaibing <yuehaibing@huawei.com>

[ Upstream commit c5614fb8e3d13be7bba79f71b798468a3a6224f7 ]

sound/soc/intel/boards/kbl_da7219_max98357a.c:343:48:
 warning: constraints_16000 defined but not used [-Wunused-const-variable=]
sound/soc/intel/boards/kbl_da7219_max98357a.c:348:27:
 warning: ch_mono defined but not used [-Wunused-const-variable=]

They are never used, so can be removed.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Link: https://lore.kernel.org/r/20191224140237.36732-1-yuehaibing@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/kbl_da7219_max98357a.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/sound/soc/intel/boards/kbl_da7219_max98357a.c b/sound/soc/intel/boards/kbl_da7219_max98357a.c
index 537a88932bb69..0d55319a0773c 100644
--- a/sound/soc/intel/boards/kbl_da7219_max98357a.c
+++ b/sound/soc/intel/boards/kbl_da7219_max98357a.c
@@ -336,19 +336,6 @@ static struct snd_soc_ops kabylake_dmic_ops = {
 	.startup = kabylake_dmic_startup,
 };
 
-static const unsigned int rates_16000[] = {
-	16000,
-};
-
-static const struct snd_pcm_hw_constraint_list constraints_16000 = {
-	.count = ARRAY_SIZE(rates_16000),
-	.list  = rates_16000,
-};
-
-static const unsigned int ch_mono[] = {
-	1,
-};
-
 SND_SOC_DAILINK_DEF(dummy,
 	DAILINK_COMP_ARRAY(COMP_DUMMY()));
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
