Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB764EC135
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 13:56:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6956818C8;
	Wed, 30 Mar 2022 13:55:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6956818C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648641389;
	bh=FeVBirWUDsSNdHRMTaN1D2cMhlAoxiuriyc5vJocNC0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KuHPVgDJM7lph/JQ97v6FNdRNYVBUCro5NogQhAMmPG/9GUxQSYq8PSV0xL9AFMdH
	 1rf8zB6iE6/vnIRb4YsPu4sYMUSTDE1hUH7Yh4LMhhl3HMtL/5KPSskLAAtIxCpltI
	 b9hx2H6c74oHSxIe3pg9f1ovX1gwCjEofMqRqC+I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5AFFF8051B;
	Wed, 30 Mar 2022 13:49:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B7F3F805E7; Wed, 30 Mar 2022 13:49:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E56E5F8051A
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 13:49:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E56E5F8051A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lokuT5Nr"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9AB51615E7;
 Wed, 30 Mar 2022 11:49:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55AF6C34113;
 Wed, 30 Mar 2022 11:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648640945;
 bh=FeVBirWUDsSNdHRMTaN1D2cMhlAoxiuriyc5vJocNC0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lokuT5NroYXJWdWxvIFiM76UQwyaVWs+Eya8ee2sLEZxT69/i6165aaFj9JOG76ax
 73vKzvjQv6u02sX7663/mWhPVtzJzWk0oohz23caSHy1Bks6paTplDhcJFjHkU5dFB
 OuPWBFd7LPERX1kwzCcQy/YBLAFKvDYrIDXUQn5twlv96HC3jOiff0DGSUjNRC4pBz
 zXfrVQpLGZn+f3NjbGyuOFVdrcsxpISXNKWRiyfzcBhrSxbEzLv13bUPqC3z8an25G
 tIrIFpv6PMCtknMAKvnKjxBIqWMIKNa/som1WGItr0a6pVyJMi2pU7THm+7hDrBSjs
 V5RkoVC+x5jMw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 20/59] ASoC: madera: Add dependencies on MFD
Date: Wed, 30 Mar 2022 07:47:52 -0400
Message-Id: <20220330114831.1670235-20-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330114831.1670235-1-sashal@kernel.org>
References: <20220330114831.1670235-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, tiwai@suse.com,
 lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>
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

From: Charles Keepax <ckeepax@opensource.cirrus.com>

[ Upstream commit ec29170c724ca30305fc3a19ba2ee73ecac65509 ]

The Madera CODECs use regmap_irq functions but nothing ensures that
regmap_irq is built into the kernel. Add dependencies on the ASoC
symbols for the relevant MFD component. There is no point in building
the ASoC driver if the MFD doesn't support it and the MFD part contains
the necessary dependencies to ensure everything is built into the
kernel.

Reported-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20220203115025.16464-1-ckeepax@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 3a610ba183ff..0d4e1fb9befc 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -707,6 +707,7 @@ config SND_SOC_CS4349
 
 config SND_SOC_CS47L15
 	tristate
+	depends on MFD_CS47L15
 
 config SND_SOC_CS47L24
 	tristate
@@ -714,15 +715,19 @@ config SND_SOC_CS47L24
 
 config SND_SOC_CS47L35
 	tristate
+	depends on MFD_CS47L35
 
 config SND_SOC_CS47L85
 	tristate
+	depends on MFD_CS47L85
 
 config SND_SOC_CS47L90
 	tristate
+	depends on MFD_CS47L90
 
 config SND_SOC_CS47L92
 	tristate
+	depends on MFD_CS47L92
 
 # Cirrus Logic Quad-Channel ADC
 config SND_SOC_CS53L30
-- 
2.34.1

