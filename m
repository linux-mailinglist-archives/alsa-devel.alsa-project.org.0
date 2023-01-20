Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1275A6751A5
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 10:52:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 929723005;
	Fri, 20 Jan 2023 10:51:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 929723005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674208360;
	bh=u7BC24PLXH1M5k4ZAwWCW9iGDRYP84c4x5XXlldKNUk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=avGZQkVjVasa0xAiDOEGH21c1/UgOxjYBHNc1gdSRdSCd0KJpCOu/okOIGsx/cPB5
	 phjgCrTdw5yq2y1+UTA7gKNUu0zwRQAQOp1+nkiirqQwRVT+raUOMAIUc+iGf3O/hr
	 fkT3r8d03O7MKUJVIbaVJMfu7sInmRsES7yXPfyk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBCF9F8055A;
	Fri, 20 Jan 2023 10:51:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1143F8053D; Fri, 20 Jan 2023 10:51:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5ECBAF804FE
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 10:50:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5ECBAF804FE
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jZyz3rpJ
Received: (Authenticated sender: herve.codina@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id B06FEFF80B;
 Fri, 20 Jan 2023 09:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1674208252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=89IPk7Ub6kTzIYPBJ6dyur64fSCxEPkfLYPQ09yEpxc=;
 b=jZyz3rpJZ061s7gHTXVPfF/CKxsDxshPnqHJQHrYvIeyVdlEndh1FM6iEnsfM+taTJPu4y
 brf0+uddDNWtdFQquLBpi3Pk/mArVEORvgBfWN+uy5WTydgloRQOXwhseTOiJwbBlAhFgA
 PvwseGIXYiblXHAcK0XH4sPSDlTw1mpm3Ds8ak97WSUa7ZzTvKttitsRdoF+SuBeEauydF
 epgTfkzB38um3FZ6uODzvUR+h2LVLPv5JZqOl608KPO23jvw02I2alESzb0l+YrGlouoVg
 k0kJwmzJsXXYPeD4Jo9TqmoDxKGBhX3ibUsuVPZkdjUWXTWCnK4pT6efjU5w3A==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 3/3] MAINTAINERS: add the Renesas IDT821034 codec entry
Date: Fri, 20 Jan 2023 10:50:36 +0100
Message-Id: <20230120095036.514639-4-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120095036.514639-1-herve.codina@bootlin.com>
References: <20230120095036.514639-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-gpio@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

After contributing the driver, add myself as the maintainer for the
Renesas IDT821034 codec.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9dcfadec5aa3..31115a7e01c1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17809,6 +17809,13 @@ F:	Documentation/devicetree/bindings/net/renesas,*.yaml
 F:	drivers/net/ethernet/renesas/
 F:	include/linux/sh_eth.h
 
+RENESAS IDT821034 ASoC CODEC
+M:	Herve Codina <herve.codina@bootlin.com>
+L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/sound/renesas,idt821034.yaml
+F:	sound/soc/codecs/idt821034.c
+
 RENESAS R-CAR GYROADC DRIVER
 M:	Marek Vasut <marek.vasut@gmail.com>
 L:	linux-iio@vger.kernel.org
-- 
2.39.0

