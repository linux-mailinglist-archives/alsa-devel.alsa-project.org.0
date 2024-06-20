Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E447490FF75
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jun 2024 10:51:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4387ADFA;
	Thu, 20 Jun 2024 10:51:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4387ADFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718873507;
	bh=JyxXab3gh+wCGMjIW6vDCbjLfD//HftTPx3aJXGP3m8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OxEhR/lBtdZL0Mi1/Ie6iSvi/+FBBejxfI1vOi2CkJ64RGq6j9JawAgkaIxazARNT
	 XYUXYOAClLDgnmJ7OviBwkrbZzUxsHzt8XcJMz3WbngL1X9k8lHV9KkWeM7BVZ7vfV
	 3ltHiL+8M0oKlAlq1M5SYI0BbUunDIvUJgEY1EvE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 429D6F80676; Thu, 20 Jun 2024 10:50:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E318CF8065E;
	Thu, 20 Jun 2024 10:50:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C54A7F8023A; Thu, 20 Jun 2024 10:45:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C599BF80154
	for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2024 10:43:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C599BF80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Y7/+Kz/c
Received: by mail.gandi.net (Postfix) with ESMTPA id 808192000D;
	Thu, 20 Jun 2024 08:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718872991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O2OniZ6NTuy93VyAe8/Sk6MsW0dFYWJCYUEKa4O7/i0=;
	b=Y7/+Kz/c2jd/6tPcvE4E6ugSwG+0jYbXBS0aNFaULtDeHyZliwze4pTKKBYpKGOFnk4PGV
	V+eXJJgSOFwRhBinungwT/q9hAcrnHhSX3Wd3XjRnb/lEJX0MkYC2BeyAMahoDqNzoK4ZF
	/GjZ74Lw/mJ0XF5OrPMkaaort1alUt01luU3ORpix/o6+6fwJ1UEw8AtFm7KHawEhQUoBY
	9z2gXIW11ZJIRDy+aWdga+Jazrjwm+9BFM1/CTKr8U+OQkIP/1+63VOZQ/F2VlkQ17wfog
	CyeVK92Ty+SSqwldY65xQ0qcGjYBHYWT+II2yqH7dmbT7iIIW3zKknFlcGMf3w==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	stable@vger.kernel.org
Subject: [PATCH 01/10] ASoC: fsl: fsl_qmc_audio: Check devm_kasprintf()
 returned value
Date: Thu, 20 Jun 2024 10:42:48 +0200
Message-ID: <20240620084300.397853-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240620084300.397853-1-herve.codina@bootlin.com>
References: <20240620084300.397853-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: EDAANJZBQA23JTWEKYPUFHIY2JEZLSP2
X-Message-ID-Hash: EDAANJZBQA23JTWEKYPUFHIY2JEZLSP2
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EDAANJZBQA23JTWEKYPUFHIY2JEZLSP2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

devm_kasprintf() can return a NULL pointer on failure but this returned
value is not checked.

Fix this lack and check the returned value.

Fixes: 075c7125b11c ("ASoC: fsl: Add support for QMC audio")
Cc: stable@vger.kernel.org
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 sound/soc/fsl/fsl_qmc_audio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/fsl/fsl_qmc_audio.c b/sound/soc/fsl/fsl_qmc_audio.c
index bfaaa451735b..dd90ef16fa97 100644
--- a/sound/soc/fsl/fsl_qmc_audio.c
+++ b/sound/soc/fsl/fsl_qmc_audio.c
@@ -604,6 +604,8 @@ static int qmc_audio_dai_parse(struct qmc_audio *qmc_audio, struct device_node *
 
 	qmc_dai->name = devm_kasprintf(qmc_audio->dev, GFP_KERNEL, "%s.%d",
 				       np->parent->name, qmc_dai->id);
+	if (!qmc_dai->name)
+		return -ENOMEM;
 
 	qmc_dai->qmc_chan = devm_qmc_chan_get_byphandle(qmc_audio->dev, np,
 							"fsl,qmc-chan");
-- 
2.45.0

