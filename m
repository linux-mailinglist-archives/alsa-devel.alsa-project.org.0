Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A0D3C31FE
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jul 2021 04:50:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EFB51788;
	Sat, 10 Jul 2021 04:49:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EFB51788
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625885434;
	bh=L97dLeP6erxCCovARaRHBZiyyAeRSD+wLyweSRUnot8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nv0UYw/Z4UpPa4ncrndxyjd6wWLaj/BTSzTAZdw6Mnw9fzmMAk6KdnzG14yCsIQw7
	 h0Eq+mfBk9Lj7WyWYb06/Qrizl7YkZK2L77rNJhcmOca4GyxuyCEOMosopRq0gz4eY
	 GrIUEOfLAMSi60Scdje1kW0b+ocnUXXzWxaOf8PU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57A24F805AD;
	Sat, 10 Jul 2021 04:35:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FED8F80549; Sat, 10 Jul 2021 04:35:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E779DF8053A
 for <alsa-devel@alsa-project.org>; Sat, 10 Jul 2021 04:35:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E779DF8053A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UeeNOMWT"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 18FDA613EE;
 Sat, 10 Jul 2021 02:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625884508;
 bh=L97dLeP6erxCCovARaRHBZiyyAeRSD+wLyweSRUnot8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UeeNOMWTQMTvWk0JgSxlj6yJyHKsjny+e4Wf+XNMyLIqaT2YCSwiD6iWTQEGK8XtC
 408GyObvKqc7BQ2OA3nabFWzJdlmTz/5VAk/UFHbY0NQ0WSA7pv8KeZjjwdtmYEyBy
 8qtrcAXQvQ7OYEHUxYFMO0zyJRhEW30Y5d6HMG3Vf0cBSgPXZzCEkZfR9AR2JAmpHT
 uVIPa2s7l+5Schlxon6AQFOTe8YOVbHAy4hPbvXCnjAIK1TZUoPq7KvBqUy06ydP3c
 8vheqkshtgkgApr8Pn6kV94Cv2j6D95gNrIGhMom/zBnWc0sd4UiqGpo0P3aLh39iK
 21MoiGpA+E+Bw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 34/39] ALSA: hda: Add IRQ check for
 platform_get_irq()
Date: Fri,  9 Jul 2021 22:31:59 -0400
Message-Id: <20210710023204.3171428-34-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710023204.3171428-1-sashal@kernel.org>
References: <20210710023204.3171428-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, Xin Tan <tanxin.ctf@gmail.com>,
 Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Jiajun Cao <jjcao20@fudan.edu.cn>, linux-tegra@vger.kernel.org,
 Thierry Reding <treding@nvidia.com>
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

From: Jiajun Cao <jjcao20@fudan.edu.cn>

[ Upstream commit 8c13212443230d03ff25014514ec0d53498c0912 ]

The function hda_tegra_first_init() neglects to check the return
value after executing platform_get_irq().

hda_tegra_first_init() should check the return value (if negative
error number) for errors so as to not pass a negative value to
the devm_request_irq().

Fix it by adding a check for the return value irq_id.

Signed-off-by: Jiajun Cao <jjcao20@fudan.edu.cn>
Signed-off-by: Xin Tan <tanxin.ctf@gmail.com>
Reviewed-by: Thierry Reding <treding@nvidia.com>
Link: https://lore.kernel.org/r/20210622131947.94346-1-jjcao20@fudan.edu.cn
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/hda_tegra.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index e85fb04ec7be..b567c4bdae00 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -363,6 +363,9 @@ static int hda_tegra_first_init(struct azx *chip, struct platform_device *pdev)
 	unsigned short gcap;
 	int irq_id = platform_get_irq(pdev, 0);
 
+	if (irq_id < 0)
+		return irq_id;
+
 	err = hda_tegra_init_chip(chip, pdev);
 	if (err)
 		return err;
-- 
2.30.2

