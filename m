Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F3984D82
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2019 15:38:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A885D84A;
	Wed,  7 Aug 2019 15:37:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A885D84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565185079;
	bh=XOKtLTaaQOiEdYKxt6xdk89WCRzgggyc2WhnTuJ0BhU=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=g3fRckoS56B0cIKkGyTG4MygLsWACWkz4iZmzqBLoai7kVyPRkh3IYG11vMCr/V1n
	 5ghyphuhqVwevqm+Fjxo2irhY2iwnVCZXUxNUuX4syICSWqmz30BBNk7/WrHIFN7xP
	 p3zA/GNfE7wkhK1W/i1u5R/NPwI2uHy7yBQjM2cY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B2ECF8065C;
	Wed,  7 Aug 2019 15:31:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD9AFF8060E; Wed,  7 Aug 2019 15:31:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8E4DF8059F
 for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2019 15:30:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8E4DF8059F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="BC7xKV3U"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Wu9sugkEEsUhkvknH7uSAfy3bNShHg3ioU3CI9Flyl8=; b=BC7xKV3U+6Ft
 8BnglARL2Q/kiNkhN1uXN+DhE4MbYbxc+bGhxKitX+7dUE4E883tV8+/D4xtUb8Td0dln40xHe/d3
 f1AAM2xXAjLdRclxgLv6tikogMx5539KAH2Ju8d1QppL/AS8jnTdvRp0fu26xdlEQaDC4ys0Ne91L
 J2jNY=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hvM1h-0007fl-V5; Wed, 07 Aug 2019 13:30:50 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 4088D2742B9E; Wed,  7 Aug 2019 14:30:49 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
In-Reply-To: <20190806151214.6783-6-daniel.baluta@nxp.com>
X-Patchwork-Hint: ignore
Message-Id: <20190807133049.4088D2742B9E@ypsilon.sirena.org.uk>
Date: Wed,  7 Aug 2019 14:30:49 +0100 (BST)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, timur@kernel.org,
 robh@kernel.org, shengjiu.wang@nxp.com, angus@akkea.ca,
 linux-kernel@vger.kernel.org, tiwai@suse.com,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-imx@nxp.com, kernel@pengutronix.de, festevam@gmail.com,
 mihai.serban@gmail.com, l.stach@pengutronix.de
Subject: [alsa-devel] Applied "ASoC: dt-bindings: Introduce compatible
	strings for 7ULP and 8MQ" to the asoc tree
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

   ASoC: dt-bindings: Introduce compatible strings for 7ULP and 8MQ

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From 371be51a925a619f1fb149b8d7707e353d9c9f86 Mon Sep 17 00:00:00 2001
From: Daniel Baluta <daniel.baluta@nxp.com>
Date: Tue, 6 Aug 2019 18:12:14 +0300
Subject: [PATCH] ASoC: dt-bindings: Introduce compatible strings for 7ULP and
 8MQ

For i.MX7ULP and i.MX8MQ register map is changed. Add two new compatbile
strings to differentiate this.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
Link: https://lore.kernel.org/r/20190806151214.6783-6-daniel.baluta@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/devicetree/bindings/sound/fsl-sai.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl-sai.txt b/Documentation/devicetree/bindings/sound/fsl-sai.txt
index 2e726b983845..e61c0dc1fc0b 100644
--- a/Documentation/devicetree/bindings/sound/fsl-sai.txt
+++ b/Documentation/devicetree/bindings/sound/fsl-sai.txt
@@ -8,7 +8,8 @@ codec/DSP interfaces.
 Required properties:
 
   - compatible		: Compatible list, contains "fsl,vf610-sai",
-			  "fsl,imx6sx-sai" or "fsl,imx6ul-sai"
+			  "fsl,imx6sx-sai", "fsl,imx6ul-sai",
+			  "fsl,imx7ulp-sai" or "fsl,imx8mq-sai".
 
   - reg			: Offset and length of the register set for the device.
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
