Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 653EC665D00
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 14:51:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 769E137A5;
	Wed, 11 Jan 2023 14:50:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 769E137A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673445077;
	bh=6oHgtmSl8WNmDwl22+JOCXB6qKPnm2EYrN9SzFL34ak=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=tkGowv2MNnlFDhwlop9p8v1x2df8qMs1DuS5BymdvztIGYYaKBZlNZFnllLBjPuKO
	 WRnA3kevx/+/bfkq00Hdg62CT5EVhELiDxWezf+UnZqaUJRUAuKB8o7SQqIKgfhvxT
	 fPd0HMQBvRjf+TSDq9CY40AhUFFXCswlS8XkF+XE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A77D7F80544;
	Wed, 11 Jan 2023 14:49:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 100CEF80539; Wed, 11 Jan 2023 14:49:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52F6EF8051B
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 14:49:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52F6EF8051B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ByaSXOKv
Received: (Authenticated sender: herve.codina@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 9E34AFF802;
 Wed, 11 Jan 2023 13:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1673444966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c9EnZLjG+M9U2ONqhUBGVZCcyMyK2X5wHaN45jR1ceg=;
 b=ByaSXOKvk4XEECyLn27Tk4Ldxvxm05KVnKRViSa66Hk/L1mzTW0KAhZ6+m64s+qGIQCqM+
 elsDF/epIy4V/u2A0zVBt2P49YhXxtnhz/EEMQw12FAkQSf4MOWbu/lZ0NpdyLMDXALo0U
 c87+3x9imIyZz+9/2Ul+WphA2uyg/+LOVsQCfjMHB0TDWuz2vUdZxvSQFcz0UELsZjq2np
 uO8GxdPQ1RhJFZGENK9PdGKov9nFqu+XwcT/Hl8sFe9TfkWs2gCdFGP5aXLT6cA//M1k3v
 vwKzbAx661jtzhKC/OV1y/HvrRMlRTofhyIAdU3iD/U/PtWLVNVDjTYVkTd8KA==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 3/3] MAINTAINERS: add the Renesas IDT821034 codec entry
Date: Wed, 11 Jan 2023 14:49:05 +0100
Message-Id: <20230111134905.248305-4-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230111134905.248305-1-herve.codina@bootlin.com>
References: <20230111134905.248305-1-herve.codina@bootlin.com>
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

After contributing the driver, add myself as the maintainer
for the Renesas IDT821034 codec.

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
2.38.1

