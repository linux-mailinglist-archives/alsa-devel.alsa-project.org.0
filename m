Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E28E051D876
	for <lists+alsa-devel@lfdr.de>; Fri,  6 May 2022 15:05:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BDC217C8;
	Fri,  6 May 2022 15:04:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BDC217C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651842305;
	bh=gWc8hvL78+aop2VFzOSTirEQ6yFK+AXuqs5+QAVfsl0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HKixrehcqaVRkPepYdhmjEyg8hPHKvjOeMfqm4v41dLUTXd0+azdTPVjMyzgbaasd
	 xDbcWguCLM0M9M8FC5qYtst2AJsP22v/TUo6vIFfOqDFC2DEwSMdBwMT5RGiExNyvU
	 TiVjo7GQVQm5hIo+WdM7cvaZJiTC/t4R/wEShOOo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02CB2F800D3;
	Fri,  6 May 2022 15:04:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70710F8014B; Fri,  6 May 2022 15:04:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 277C4F800D3
 for <alsa-devel@alsa-project.org>; Fri,  6 May 2022 15:03:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 277C4F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BPxVhH1r"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 417C661FFC;
 Fri,  6 May 2022 13:03:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBC0FC385B1;
 Fri,  6 May 2022 13:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651842236;
 bh=gWc8hvL78+aop2VFzOSTirEQ6yFK+AXuqs5+QAVfsl0=;
 h=From:To:Cc:Subject:Date:From;
 b=BPxVhH1rDQ8hg8bdnlAs0q4Jrwh22vl7oPx/1GrXLOpHX+QG0KszN/RDvP1AobhTl
 WYgDXvvsuQ4G2T22cSIBgGO0Zcl4yT1CDvy4Pe1DeoS6yRYtlZet7ObpMbFOeR5eAE
 PrdxXIzGInSPgMuMRPCI276FCO992M1ky725KE0mzmYjY4zhj/yc4wZPDcXnLfQAcP
 UviV94p4+05Ox/XVMla0GEYWz0LOWn1rda+QAhi6wKwBoFpGG2dgpuxZIzF4bFYfm0
 12rWpYW/O+WmO5PRc1347/+hp1xqEajAOP3My7kmECt4NrJeMYeTYf6IFISRyCb6qn
 7M0iua7/m/xgA==
From: Mark Brown <broonie@kernel.org>
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: sam9g20_wm8731: Use dev_err_probe() for
 snd_soc_register_card()
Date: Fri,  6 May 2022 14:03:49 +0100
Message-Id: <20220506130349.451452-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=791; h=from:subject;
 bh=gWc8hvL78+aop2VFzOSTirEQ6yFK+AXuqs5+QAVfsl0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBidRxNjBZbmjacSHASSv61r8SORisrlHi8gZLtnmpc
 hJjbnbeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYnUcTQAKCRAk1otyXVSH0O01B/
 9IP3wuDW1jl3N76L1EEYaDdfV+B9l4U5cZY94i6wf+A6jHIIXOH2ta8i1+zUgi3Cm6NM5nyrZV8SXy
 5UpiKDLYCae4j2D/SY+7Orb9ALmy2tDrnOrNRB9SereUNSMtXmU+zLl9XyJGf9O95lGGHKVrl+dN7X
 D7ICVZKVlUmY2eyY+r1DxnSU0+6WOwtE/HB6QpgBkvaUPBQF7F/Lii3/yC4+A5n68dygnnQ0F3GBmB
 6mKVOFFAFtNPy3+wTyMd+Y9728mqj5HB+dJ3d02G7FISjVswdDB4Q7f70SwqFF/jz4JCr8gk6PriEy
 Js3pYjqJXYIYyL7Pjpi1Oy+0fy9j6Y
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

Log the error code when snd_soc_regster_card() fails, but fold in the
silencing of deferred probe errors.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/atmel/sam9g20_wm8731.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/atmel/sam9g20_wm8731.c b/sound/soc/atmel/sam9g20_wm8731.c
index 0365b583ba70..4d25fb61c652 100644
--- a/sound/soc/atmel/sam9g20_wm8731.c
+++ b/sound/soc/atmel/sam9g20_wm8731.c
@@ -171,7 +171,8 @@ static int at91sam9g20ek_audio_probe(struct platform_device *pdev)
 
 	ret = snd_soc_register_card(card);
 	if (ret) {
-		dev_err(&pdev->dev, "snd_soc_register_card() failed\n");
+		dev_err_probe(&pdev->dev, ret,
+			      "snd_soc_register_card() failed: %d\n", ret);
 		goto err;
 	}
 
-- 
2.30.2

