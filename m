Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0A968C082
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 15:51:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE7A5210;
	Mon,  6 Feb 2023 15:50:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE7A5210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675695063;
	bh=Zy9dK5giYu5r5DOyPmVtsTr3kg7bbsjNrhR2v2BBGkE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=orhnMfJ5sJBp+4TFJbuMrCjb+fEHlyDRrjU8Hq94i+aerq7j6rj+ermsvqQ01NucF
	 2gR7vEGoNm9w55uNSA0R70WVSPiXDxvnlR0FSiuI+p/TYP/bN/FMc6ApPos4KUCSAD
	 VX2A/QfsGS2atOqC3dUIMhjZsqNTiFk1eauA8xEw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BA8DF80543;
	Mon,  6 Feb 2023 15:49:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A49B3F8053D; Mon,  6 Feb 2023 15:49:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
 version=3.4.6
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83D36F804FF
 for <alsa-devel@alsa-project.org>; Mon,  6 Feb 2023 15:49:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83D36F804FF
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OP2hH2uB
Received: (Authenticated sender: herve.codina@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 11B9360011;
 Mon,  6 Feb 2023 14:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1675694967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DCdYyqkSk91FGT2k2pmAC91uCq4Q0ikwYZO1U2uUWbc=;
 b=OP2hH2uBf0k0FjW+qDpKsiyI4NEqaiPGXNjF0y8inO3q50Fg4X6ThDa7XY3yPVx1vTcpIz
 EHUtbquhVj0NRMMgQRH88N7CQrbbjhjPS1MvSTtoSgYIHhORRbF1vBJPz9bCc4xaOTLBFY
 txCPHhwfRQMj6ggpQv4fSNvstpp62MkeIbEZNR/Exf3/HBb5Tfp6b6uSB5CHo3bBlZKfF8
 wSfB9VnEbMIrHZVxTu5dXQLhNavJ3li5UQo2xIC3LhchZwR0+a/ksk9fcp/F2TKzEm/tWl
 jn2iiUxbDiNrUTO2uoQOxaLKykF8xhw7D25rt22Jt6ff+l13iu4iO2MzKU0vCg==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 3/3] MAINTAINERS: add the Infineon PEB2466 codec entry
Date: Mon,  6 Feb 2023 15:49:04 +0100
Message-Id: <20230206144904.91078-4-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230206144904.91078-1-herve.codina@bootlin.com>
References: <20230206144904.91078-1-herve.codina@bootlin.com>
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
Infineon PEB2466 codec.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cd22e8e06561..0cd8a4d1f7b0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10184,6 +10184,13 @@ L:	linux-iio@vger.kernel.org
 S:	Maintained
 F:	drivers/iio/pressure/dps310.c
 
+INFINEON PEB2466 ASoC CODEC
+M:	Herve Codina <herve.codina@bootlin.com>
+L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/sound/infineon,peb2466.yaml
+F:	sound/soc/codecs/peb2466.c
+
 INFINIBAND SUBSYSTEM
 M:	Jason Gunthorpe <jgg@nvidia.com>
 M:	Leon Romanovsky <leonro@nvidia.com>
-- 
2.39.1

