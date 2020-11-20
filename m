Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3BE2BB09D
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 17:33:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC3C21820;
	Fri, 20 Nov 2020 17:32:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC3C21820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605890024;
	bh=f0BWrScl8LITa0d86tCyNbDAQAWGAEq1uHJr2/X1yxA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bNgtOHrHDmOZx1ST19h6Lwr/N5eiiA66QrQuMlyaqURGdVgJ0EM+QsIHzsFmx8U9H
	 DfcgjVy6nJ6w3I35HrT/xh7b9C/bLZLzsEp2dAMLNiVuEG1KODX0SdL3sLD9a7JpPY
	 ZjmFjiXQM/IIBy3RFfy5e/kBCrP6Bnc5o/8tWlCQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43906F805F7;
	Fri, 20 Nov 2020 17:20:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4205F805F1; Fri, 20 Nov 2020 17:20:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9756F805E1
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 17:20:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9756F805E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NaXpA6SX"
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 25BB624073;
 Fri, 20 Nov 2020 16:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605889204;
 bh=f0BWrScl8LITa0d86tCyNbDAQAWGAEq1uHJr2/X1yxA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NaXpA6SX4OCwRvl0+77HJqDJYPPAtCgwmWemHCkMpkuup8b4u9UXHztiV2HXSfmcv
 +dYMOIMOt0FvoW0cpEL3UgHsEFG6wqSrcWUOzQJKJPL/S0AWxsLXGNiKWHcifm1FDJ
 6tuOesWrFDNw0U3ewyI8vyvv4IrAlU+Yq6N/WFM4=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
Subject: [PATCH 38/38] ASoC: samsung: smdk_wm8994: remove redundant
 of_match_ptr()
Date: Fri, 20 Nov 2020 17:16:52 +0100
Message-Id: <20201120161653.445521-38-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201120161653.445521-1-krzk@kernel.org>
References: <20201120161653.445521-1-krzk@kernel.org>
MIME-Version: 1.0
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

of_match_device() already handles properly !CONFIG_OF case, so passing
the argument via of_match_ptr() is not needed.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/samsung/smdk_wm8994.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/samsung/smdk_wm8994.c b/sound/soc/samsung/smdk_wm8994.c
index 696ab6abd1f6..8166e41e685b 100644
--- a/sound/soc/samsung/smdk_wm8994.c
+++ b/sound/soc/samsung/smdk_wm8994.c
@@ -170,7 +170,7 @@ static int smdk_audio_probe(struct platform_device *pdev)
 		smdk_dai[0].platforms->of_node = smdk_dai[0].cpus->of_node;
 	}
 
-	id = of_match_device(of_match_ptr(samsung_wm8994_of_match), &pdev->dev);
+	id = of_match_device(samsung_wm8994_of_match, &pdev->dev);
 	if (id)
 		*board = *((struct smdk_wm8994_data *)id->data);
 
-- 
2.25.1

