Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B3A11179
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 04:28:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17F9F172A;
	Thu,  2 May 2019 04:27:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17F9F172A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556764125;
	bh=BtujYNt0TIfk+lSFy8Uf4UNtLY6KG7VvyeTAEw2HI/A=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=T+vaW4665hqkVVsWV6HvPpJMeT95r6o6IU6nYltGXhS1C8kVwveC/MbU389ufcMG9
	 8CjmOGjW19qSdLVgmQMCw4eJ5MZeYjukjPXfYOQ34vdJUwHauAZIDDDjF0mpCiqsnn
	 2SX8kroe4zK+1V0H/s4K+S//meHd+k6xMNWrD6gY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E4F4F89763;
	Thu,  2 May 2019 04:19:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83D28F896EC; Thu,  2 May 2019 04:18:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25706F8972B
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 04:18:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25706F8972B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="GeS5vzv2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=w71+PzJbOW+X480SNOlDParjGMhCg61EaUcDJiNLQ4Q=; b=GeS5vzv2tlTE
 9VsWdYdOSLLAPTE4mhF8Ko5Llldw+pc084YAt1tdTaIYOSDqwVl/2OQ73NrIdS/7QDV9J/vojbSO1
 zEFID9qqU6aOeyhfIoDMnPFz1F4gB5faP3FH1Zp/JKj5XycpPZJ/K1ujSdFORNERSgtY4Wk7e5BUl
 wuJI8=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hM1Ih-0005r9-0z; Thu, 02 May 2019 02:18:19 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 0E304441D3C; Thu,  2 May 2019 03:18:16 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Viorel Suman <viorel.suman@nxp.com>
In-Reply-To: 
X-Patchwork-Hint: ignore
Message-Id: <20190502021816.0E304441D3C@finisterre.ee.mobilebroadband>
Date: Thu,  2 May 2019 03:18:15 +0100 (BST)
Cc: Nicolin Chen <nicoleotsuka@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: fsl_audmix: remove "model" attribute
	from DT document" to the asoc tree
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

   ASoC: fsl_audmix: remove "model" attribute from DT document

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

From d04195b0a351b6c7bc086bd8590e5f303122a0be Mon Sep 17 00:00:00 2001
From: Viorel Suman <viorel.suman@nxp.com>
Date: Wed, 10 Apr 2019 11:06:37 +0000
Subject: [PATCH] ASoC: fsl_audmix: remove "model" attribute from DT document

Remove "model" attribute from fsl_audmix DT document.

Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/devicetree/bindings/sound/fsl,audmix.txt | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl,audmix.txt b/Documentation/devicetree/bindings/sound/fsl,audmix.txt
index 45f807ec21a5..840b7e0d6a63 100644
--- a/Documentation/devicetree/bindings/sound/fsl,audmix.txt
+++ b/Documentation/devicetree/bindings/sound/fsl,audmix.txt
@@ -38,9 +38,6 @@ Device driver required properties:
 			  to SAI interfaces to be provided, the first SAI in the
 			  list being used to route the AUDMIX output.
 
-  - model		: Must contain machine driver name which will configure
-			  and instantiate the appropriate audio card.
-
 Device driver configuration example:
 ======================================
   audmix: audmix@59840000 {
@@ -50,5 +47,4 @@ Device driver configuration example:
     clock-names = "ipg";
     power-domains = <&pd_audmix>;
     dais = <&sai4>, <&sai5>;
-    model = "imx-audmix";
   };
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
