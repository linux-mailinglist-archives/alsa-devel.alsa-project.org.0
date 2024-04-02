Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8534B89AF09
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Apr 2024 09:18:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E499A227E;
	Sun,  7 Apr 2024 09:17:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E499A227E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712474279;
	bh=flqmIvc29aq03tyjckaFwyCD7FjGJloE0Stz4DI3BWU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hcE7nB4yp0+TI+XyxCwou/+8z97/wrB/MED11zWhk81TywjPYswe4Uxaq6yjK+jtw
	 SCEeVnFJ3dSIy0UsymqL7hAww8RwZWkdWmbmebUJj8N5zpQeR/EyVaowhUmm1eYqRn
	 GgEH8hGG0eSUpEFgG0U0rw380VSk5nY2PzE9DpO8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED01FF805D6; Sun,  7 Apr 2024 09:17:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E9BCF805B5;
	Sun,  7 Apr 2024 09:17:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DCC59F8058C; Tue,  2 Apr 2024 09:12:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B4518F80570
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 09:12:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4518F80570
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SlgINAU+
Received: by mail.gandi.net (Postfix) with ESMTPA id 01FCCFF80B;
	Tue,  2 Apr 2024 07:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712041943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7mFoXC/7lZncljkGK1+GfQv48vrdua/OVliFLiKRc2A=;
	b=SlgINAU+zuI8Bem8akyfc0t7xKmu4rUVZEM3IVa0IwYsK+DDPs1sDhofdMdra9u+xNJ1fF
	uMW8Popwmvhk1niBAJKFtVQi2IoqADVic4CZ9AsCQ8S6O1QBqgxnbd5r2ILYdrbHKaYVl7
	jBykm4J62EMwPAu8UwwJGOQOMY0S/496JI8257CFrXBxZB+vnCzjrvDVmfqfi85kOkS714
	RvcsnSri9LLhxE2zi/zUGXFfD+D1gPqCte7C2dGW14Gv0v0gCumDg9pfSzNxD/CZCWHNrn
	VIW3PKOnGDk6DZ6lhQTqvGZA4c8EuAS0HGXJimcl1BktvTdIyvT3KQbuwdBd2A==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	herve.codina@bootlin.com,
	christophercordahi@nanometrics.ca
Subject: [PATCH v2 04/13] ASoC: ti: davinci-i2s: Replace dev_err with
 dev_err_probe
Date: Tue,  2 Apr 2024 09:12:04 +0200
Message-ID: <20240402071213.11671-5-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240402071213.11671-1-bastien.curutchet@bootlin.com>
References: <20240402071213.11671-1-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: bastien.curutchet@bootlin.com
X-MailFrom: bastien.curutchet@bootlin.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: SVQZ7RHWQX7ACIUGE37FNXDF4DYEQFBZ
X-Message-ID-Hash: SVQZ7RHWQX7ACIUGE37FNXDF4DYEQFBZ
X-Mailman-Approved-At: Sun, 07 Apr 2024 07:14:05 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SVQZ7RHWQX7ACIUGE37FNXDF4DYEQFBZ/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In probe(), the dev_err() is used for every returned error.

Replace dev_err() with dev_err_probe() where -EPROBE_DEFER can be
returned.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 sound/soc/ti/davinci-i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/ti/davinci-i2s.c b/sound/soc/ti/davinci-i2s.c
index 5c906641640e..cd64f1384e18 100644
--- a/sound/soc/ti/davinci-i2s.c
+++ b/sound/soc/ti/davinci-i2s.c
@@ -708,7 +708,7 @@ static int davinci_i2s_probe(struct platform_device *pdev)
 
 	ret = edma_pcm_platform_register(&pdev->dev);
 	if (ret) {
-		dev_err(&pdev->dev, "register PCM failed: %d\n", ret);
+		dev_err_probe(&pdev->dev, ret, "register PCM failed\n");
 		goto err_unregister_component;
 	}
 
-- 
2.44.0

