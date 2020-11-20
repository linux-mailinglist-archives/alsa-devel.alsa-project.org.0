Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C1E2BB023
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 17:22:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DD801704;
	Fri, 20 Nov 2020 17:21:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DD801704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605889355;
	bh=/DycQ1hb3XETKxcgJtqoZZmUGffDzYpw1TgYfDhw+Fc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YPT8gH51KJM5Nf3N7HiKVtaSCbqZfow/5xJc9weTfCrYloDnCjRLB9SnsPGL7dg63
	 s8wKTYTWRzJLK6fmu5fC0m9Uh2s1drmMGCasrOpVs62mq1dHPl+us72yeRQ9dpy55o
	 CpT5HbEDKUVTY4JjxhYJTNLVMjRYRB79HAdDl0N8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6160EF804FD;
	Fri, 20 Nov 2020 17:18:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE2CFF804F2; Fri, 20 Nov 2020 17:18:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01FDBF804DF
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 17:18:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01FDBF804DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nY2He0xq"
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E0E0122470;
 Fri, 20 Nov 2020 16:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605889096;
 bh=/DycQ1hb3XETKxcgJtqoZZmUGffDzYpw1TgYfDhw+Fc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nY2He0xqB6LFhFYyPcS/lCdJ7Gs5C/ZsLZcQ7YZDAWcZA0pnLFldy0K38izU6tUaB
 +DFPOLMDCabAhy6KlnmE6T5+1EodBP3+38ktnvltT3JuIbkuYuNyPu1gcbOvjBnA7P
 yzf3B3LBriY2xJev3kA2K+6Oehsl7DdKJx1Q0Khc=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
Subject: [PATCH 09/38] ASoC: samsung: smdk_wm8994: drop of_match_ptr from
 of_device_id table
Date: Fri, 20 Nov 2020 17:16:23 +0100
Message-Id: <20201120161653.445521-9-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201120161653.445521-1-krzk@kernel.org>
References: <20201120161653.445521-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>
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

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it is not relevant here).  This fixes
compile warning (!CONFIG_OF on x86_64):

  sound/soc/samsung/smdk_wm8994.c:139:34: warning: ‘samsung_wm8994_of_match’ defined but not used [-Wunused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/samsung/smdk_wm8994.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/samsung/smdk_wm8994.c b/sound/soc/samsung/smdk_wm8994.c
index 64a1a64656ab..696ab6abd1f6 100644
--- a/sound/soc/samsung/smdk_wm8994.c
+++ b/sound/soc/samsung/smdk_wm8994.c
@@ -187,7 +187,7 @@ static int smdk_audio_probe(struct platform_device *pdev)
 static struct platform_driver smdk_audio_driver = {
 	.driver		= {
 		.name	= "smdk-audio-wm8994",
-		.of_match_table = of_match_ptr(samsung_wm8994_of_match),
+		.of_match_table = samsung_wm8994_of_match,
 		.pm	= &snd_soc_pm_ops,
 	},
 	.probe		= smdk_audio_probe,
-- 
2.25.1

