Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 703B272C459
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 14:34:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3103836;
	Mon, 12 Jun 2023 14:33:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3103836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686573274;
	bh=EGWmWQF1su+a6hAP/Zf/0XQdg4FpArwAE9hZ8KIvt1M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OGX0Epy9ogO0aPRTYgNI8OYGRH00OzJQzZgWzVDhNNfER7vp0yMvhZ2SIp8PMO6Ol
	 r3dsI27dhuq4LBPXsBV7zUA1OABWigFkBmg65/pWg4wMGjO107NyhIPuUYAtJHBZYb
	 9BTq3fU2vdNxzjEnu0lO9zF9MPwgjbVAiAOqIvfI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49B16F80567; Mon, 12 Jun 2023 14:33:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9510DF80567;
	Mon, 12 Jun 2023 14:33:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94E4FF80130; Mon, 12 Jun 2023 14:33:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D3D7AF8052E
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 14:30:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3D7AF8052E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ipm5aZF+
X-GND-Sasl: herve.codina@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686573016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GcN60f95EyHfAlDdNZvBkHTH/4nZm0eD62az2U/xx6A=;
	b=Ipm5aZF+MxH/0yVuujxyILOsgp7H4wrDD1HcDBSi09vhPAyrcu2+JBURS2FlQBRIUAlqTt
	Jja8UVv5RfwlSCpisQfZAi+JX+mnr9jfrnLQbZ4mfwqDrFFED/4zlnwVQps9w3ZSupCiNk
	ohfmRQj3WQO3uzC705E0o6llbnpkmI0mUiudj1ZwkHwyelmftlADuFTTZSa9vFGDsL0zUI
	lGj25+tvQOdtgrO+Si6qOQI6Uj+ZgCzP7CAjP9LBgiBoKzutzcwnN4qBA5APJBSyb2hRQN
	wr844zVXq1KfJhygxGHI7bXDY9iXpI/s/91pWfjjSYYDaYPBs75MmKoQOj9Qrw==
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 16402240019;
	Mon, 12 Jun 2023 12:30:15 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v3 07/12] iio: inkern: Use max_array() to get the maximum
 value from an array
Date: Mon, 12 Jun 2023 14:29:21 +0200
Message-Id: <20230612122926.107333-8-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612122926.107333-1-herve.codina@bootlin.com>
References: <20230612122926.107333-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7DYJQYOH6QPTXYQYLSQILYBYNZ3CUQHX
X-Message-ID-Hash: 7DYJQYOH6QPTXYQYLSQILYBYNZ3CUQHX
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7DYJQYOH6QPTXYQYLSQILYBYNZ3CUQHX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use max_array() to get the maximum value from an array instead of a
custom local loop.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/iio/inkern.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/inkern.c b/drivers/iio/inkern.c
index ce537b4ca6ca..ae1a41d3a559 100644
--- a/drivers/iio/inkern.c
+++ b/drivers/iio/inkern.c
@@ -8,6 +8,7 @@
 #include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/mutex.h>
+#include <linux/minmax.h>
 
 #include <linux/iio/iio.h>
 #include <linux/iio/iio-opaque.h>
@@ -875,11 +876,7 @@ static int iio_channel_read_max(struct iio_channel *chan,
 			return -EINVAL;
 		switch (*type) {
 		case IIO_VAL_INT:
-			*val = vals[--length];
-			while (length) {
-				if (vals[--length] > *val)
-					*val = vals[length];
-			}
+			*val = max_array(vals, length);
 			break;
 		default:
 			/* FIXME: learn about max for other iio values */
-- 
2.40.1

