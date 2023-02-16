Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AECE0699624
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 14:45:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2FBF207;
	Thu, 16 Feb 2023 14:44:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2FBF207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676555114;
	bh=EwJU31GGGgId58bp7CyafPPSBOPn+KxTJaWlfd/egFA=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F3pG1oE1ePRLfHqzBIfXKYPYM53FRGG7BKpQ1Zna20Mdvmv+bGl+0qKTW/Ak3Y4lR
	 2O0sJZdY8V0+2rQNFfyXAsVxnTS1PvDVEP+5HAY4qPjGcNbDKwmJ1Iwx4vDk0qvo2/
	 cd60obeVo7M+QuvsB++1eqImmuZu1vrn9i9xvy5o=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BBB6DF80551;
	Thu, 16 Feb 2023 14:42:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C1ACF80527; Thu, 16 Feb 2023 14:42:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C82BAF800E3
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 14:42:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C82BAF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GGnDlsQK
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 50EF02000F;
	Thu, 16 Feb 2023 13:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676554970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G+UNtwo9Blm4QFpeMaX/6I3K3Hv55FXb27tDybz/bIc=;
	b=GGnDlsQKnm32EqXRhRtWw3vWV7IhW6gwCQ9Zcc2qQ2SlvMMEgXUIf8gcmeBVE7/hR/KTbH
	+rzz8rSoLknBWiWdbDmXx4q1wLlmc5Vst5TOmT4OF54hVji7ZnlU+BCaX//ArNE2G6wLlm
	oue/norEFSMynbNNvMlbObBPOkO5AXawYnoMfK1z3ui0dWixcUWrQZvHOafVX9ACDOe74/
	uNGHgkkiCVJyG9MXFJu97ukIKz6M+wNlPWSzzAdAqgP/IaxwZUeykKT8+9vE/HbfrbmAZL
	ZxQT2euUlh16g4T3kVT+A2nnxVJ8PCAh54wiyKT3qg0QpLn6HwBBIsPFxkUeSA==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Li Yang <leoyang.li@nxp.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>
Subject: [PATCH v5 04/10] powerpc/8xx: Use a larger CPM1 command check mask
Date: Thu, 16 Feb 2023 14:42:20 +0100
Message-Id: <20230216134226.1692107-5-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216134226.1692107-1-herve.codina@bootlin.com>
References: <20230216134226.1692107-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UFO2IRYYZFA44LEBLLBLAXAB6TOMOQHS
X-Message-ID-Hash: UFO2IRYYZFA44LEBLLBLAXAB6TOMOQHS
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UFO2IRYYZFA44LEBLLBLAXAB6TOMOQHS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The CPM1 command mask is defined for use with the standard
CPM1 command register as described in the user's manual:
  0  |1        3|4    7|8   11|12      14| 15|
  RST|    -     |OPCODE|CH_NUM|     -    |FLG|

In the QMC extension the CPM1 command register is redefined
(QMC supplement user's manuel) with the following mapping:
  0  |1        3|4    7|8           13|14| 15|
  RST|QMC OPCODE|  1110|CHANNEL_NUMBER| -|FLG|

Extend the check command mask in order to support both the
standard CH_NUM field and the QMC extension CHANNEL_NUMBER
field.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Acked-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/8xx/cpm1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/8xx/cpm1.c b/arch/powerpc/platforms/8xx/cpm1.c
index 8ef1f4392086..6b828b9f90d9 100644
--- a/arch/powerpc/platforms/8xx/cpm1.c
+++ b/arch/powerpc/platforms/8xx/cpm1.c
@@ -100,7 +100,7 @@ int cpm_command(u32 command, u8 opcode)
 	int i, ret;
 	unsigned long flags;
 
-	if (command & 0xffffff0f)
+	if (command & 0xffffff03)
 		return -EINVAL;
 
 	spin_lock_irqsave(&cmd_lock, flags);
-- 
2.39.1

