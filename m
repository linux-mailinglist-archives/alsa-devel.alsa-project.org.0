Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C68FB12A8D7
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Dec 2019 19:24:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 131A116CE;
	Wed, 25 Dec 2019 19:23:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 131A116CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577298255;
	bh=lDgQAF203gy6P9jbzcL47WrOup/E2AWHjNPmQijsPnM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=FhtK046JzB9DOhIP9Qv7F8gr82uJJPYQdHNBwhOahYHMvDg3Th5lNdiYeLqGsWXdT
	 0CcR2Jd9aEbyUYNy8YjbPufV9PyNK96gf/V7cyVbnKINKNhYfdhy8TNIMUU0dU/5Do
	 bIhVP8+0nO8UBoUNYrnXigwB6s/Zr18+2INEiTyI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CD2EF80146;
	Wed, 25 Dec 2019 19:21:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD754F80132; Wed, 25 Dec 2019 19:21:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD07BF80130
 for <alsa-devel@alsa-project.org>; Wed, 25 Dec 2019 19:21:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD07BF80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="uH6apubv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=RHTSyzg20+DKoxwp23AnlNO9Er8xvALnIY9xs/PqfYo=; b=uH6apubvEbSU
 30tZFvvz+TySptaWSZhJfIg0yenQ8A09L5ei8zrNoKlCwudJt3lKHa7BVpoo/BMlOSkfWfv/PsgIW
 b58On2K6L+9gs71XXslaeNSqQ6s9AKAPHzLL3L58ZXcS434nTvnWPRPApSUXAuKYfCONwMITooMcA
 Mgo2U=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1ikBHz-0001o4-QI; Wed, 25 Dec 2019 18:21:43 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 4F018D01A24; Wed, 25 Dec 2019 18:21:43 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: 
Message-Id: 
X-Patchwork-Hint: ignore
Date: Wed, 25 Dec 2019 18:21:43 +0000 (GMT)
Cc: Rob Herring <robh@kernel.org>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: qcom: dt-bindings: Add compatible for
	DB845c and Lenovo Yoga" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: qcom: dt-bindings: Add compatible for DB845c and Lenovo Yoga

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 834d899794f4ec3bbf9836c85e8f76b7de6e8a59 Mon Sep 17 00:00:00 2001
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Thu, 19 Dec 2019 10:31:52 +0000
Subject: [PATCH] ASoC: qcom: dt-bindings: Add compatible for DB845c and Lenovo
 Yoga

This patch adds compatible strings for DB845c and Lenovo Yoga C630
soundcard. Based on this compatible strings common machine driver
will be in better position to setup board specific configuration.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/r/20191219103153.14875-11-srinivas.kandagatla@linaro.org
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/devicetree/bindings/sound/qcom,sdm845.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sdm845.txt b/Documentation/devicetree/bindings/sound/qcom,sdm845.txt
index 408c4837e6d5..ca8c89e88bfa 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sdm845.txt
+++ b/Documentation/devicetree/bindings/sound/qcom,sdm845.txt
@@ -5,7 +5,10 @@ This binding describes the SDM845 sound card, which uses qdsp for audio.
 - compatible:
 	Usage: required
 	Value type: <stringlist>
-	Definition: must be "qcom,sdm845-sndcard"
+	Definition: must be one of this
+			"qcom,sdm845-sndcard"
+			"qcom,db845c-sndcard"
+			"lenovo,yoga-c630-sndcard"
 
 - audio-routing:
 	Usage: Optional
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
