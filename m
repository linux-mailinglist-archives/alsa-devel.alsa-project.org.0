Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B34E16440A2
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Dec 2022 10:53:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48B00189A;
	Tue,  6 Dec 2022 10:52:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48B00189A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670320403;
	bh=fnYpf1KMAowkcUXWPb36W/ocy6bzlV1c1fTke1mPyUk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rQErm/KDfBxI5xk/m7w8DV2KwDPgFW+pZRrHPnC0Uc2qTNG7bY14dv1KyVoGQSc+M
	 59LFFpVY1+nLRg07ThyD2Vs2ikELuG+uMrbeZ/7umAwvsJX/bE362oDtW84uUGEDLV
	 yEbDoRTMoMp0sYUpbOsnbtCBurDymaAb8IxyxShw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F6BDF805AE;
	Tue,  6 Dec 2022 10:50:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93B7EF805AC; Tue,  6 Dec 2022 10:50:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_ZEN_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A71B7F8055C
 for <alsa-devel@alsa-project.org>; Tue,  6 Dec 2022 10:50:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A71B7F8055C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tvUuC84f"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 21D036160D;
 Tue,  6 Dec 2022 09:50:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 855B9C43148;
 Tue,  6 Dec 2022 09:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670320234;
 bh=fnYpf1KMAowkcUXWPb36W/ocy6bzlV1c1fTke1mPyUk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tvUuC84fQHFCf78pQ0fxsC4nHTa9rfrAArVivVGFmhROf9+jcuoyIC7ml+faJ3IR/
 +NVVckO1RDcFa+VbCzcLCzv/v22QWA3rB472V0WAx3pTsWG0n17sPMvQcvRDjdc32/
 ryDC52MyBG963nLepBwnr9jix7qHCLwaNGBffWJXkIfL0ijl/DZ3caCXZju9wWyN8I
 CP/4Z2pLD09w9ZzC8jTMJeHvlIahpN4pXp3eIDh7Ky0sp7pmsErxUT/1FvIU4g+ket
 GId8LsssFDnTkhSr4fnIrVr7HzR7BxbxnGpxLnyB03/7hVILO9CDKao7FSFwnwaXsH
 bWWO+K9zuxj6Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 02/10] ASoC: fsl_micfil: explicitly clear CHnF
 flags
Date: Tue,  6 Dec 2022 04:50:19 -0500
Message-Id: <20221206095027.987587-2-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221206095027.987587-1-sashal@kernel.org>
References: <20221206095027.987587-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, lgirdwood@gmail.com,
 Mark Brown <broonie@kernel.org>, shengjiu.wang@gmail.com
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

From: Shengjiu Wang <shengjiu.wang@nxp.com>

[ Upstream commit b776c4a4618ec1b5219d494c423dc142f23c4e8f ]

There may be failure when start 1 channel recording after
8 channels recording. The reason is that the CHnF
flags are not cleared successfully by software reset.

This issue is triggerred by the change of clearing
software reset bit.

CHnF flags are write 1 clear bits. Clear them by force
write.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Link: https://lore.kernel.org/r/1651925654-32060-2-git-send-email-shengjiu.wang@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/fsl/fsl_micfil.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index ead4bfa13561..6c794605e33c 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -201,6 +201,14 @@ static int fsl_micfil_reset(struct device *dev)
 	if (ret)
 		return ret;
 
+	/*
+	 * Set SRES should clear CHnF flags, But even add delay here
+	 * the CHnF may not be cleared sometimes, so clear CHnF explicitly.
+	 */
+	ret = regmap_write_bits(micfil->regmap, REG_MICFIL_STAT, 0xFF, 0xFF);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
-- 
2.35.1

