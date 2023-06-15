Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DD4731CA7
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jun 2023 17:29:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46DD9852;
	Thu, 15 Jun 2023 17:29:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46DD9852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686842990;
	bh=27AHddirmO2Dv68jM8iD79Ph5a3xiszNLnqPZ+ZxtzA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Vce3ACGZBaMLBSDPn2m9v1P0JIlFabtlsXYlNDwTvoaQ5UdiIWnOjCkNWxUiWu67o
	 o6q1RuHlIQfiZNcoq9Io1t4OSj2ZoCU9Sn5JWMa02rVmTJi28Vvu97WCH9hS+QTeVs
	 cfatY+Vi53zmU829n1iQX4U8pj5FCs7QPoUfQaVQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0F11F805BF; Thu, 15 Jun 2023 17:27:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D85E2F8059F;
	Thu, 15 Jun 2023 17:27:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6FA5F8057A; Thu, 15 Jun 2023 17:26:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15089F800ED
	for <alsa-devel@alsa-project.org>; Thu, 15 Jun 2023 17:26:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15089F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=D9nSqMvh
X-GND-Sasl: herve.codina@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686842805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3aG9CCDrNQunLX6B2n6+DpdxX01wVb/HqBiIu8Vpkig=;
	b=D9nSqMvhhwyfLsaCRe3WKTBe/Omao6njjpCO0ZUme+SHNQNXEvMIcdBcpY2pXpjuqKC+pZ
	29lnniLwkxpMjPB9DLB+/7jMuLWl5JNnuCyCqxc9lyHjKy6B+feF7FOxvY7VSwZJSq3Vee
	ulGIdOuzqlASl5xhPhkC7aBYzYOtjzpvICVxXHnjivYhoKYChY6L+wSYlTsi4i5Ng43x07
	YkBBnm+59abt+OL5KtklcJ37yG5egnwhEFOALu0VX0r1Q3Mx0J9Q30TflOO6UPKlHz7yyC
	pYyzMVMZOkFGhjEnrnis4/fME5XTCplGfL7ADMEaYP2PnZbLCbyBqD1M0zN4FQ==
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
Received: by mail.gandi.net (Postfix) with ESMTPA id 72A26FF80E;
	Thu, 15 Jun 2023 15:26:44 +0000 (UTC)
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
Subject: [PATCH v5 06/13] iio: inkern: Fix headers inclusion order
Date: Thu, 15 Jun 2023 17:26:24 +0200
Message-Id: <20230615152631.224529-7-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230615152631.224529-1-herve.codina@bootlin.com>
References: <20230615152631.224529-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IXYOW5MOOT56TBUWPVQDIEW5TKI7DX3W
X-Message-ID-Hash: IXYOW5MOOT56TBUWPVQDIEW5TKI7DX3W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IXYOW5MOOT56TBUWPVQDIEW5TKI7DX3W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fix the mutex.h inclusion order as it seems to be the only one
misplaces.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/iio/inkern.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/inkern.c b/drivers/iio/inkern.c
index ce537b4ca6ca..71d0424383b6 100644
--- a/drivers/iio/inkern.c
+++ b/drivers/iio/inkern.c
@@ -5,9 +5,9 @@
  */
 #include <linux/err.h>
 #include <linux/export.h>
+#include <linux/mutex.h>
 #include <linux/property.h>
 #include <linux/slab.h>
-#include <linux/mutex.h>
 
 #include <linux/iio/iio.h>
 #include <linux/iio/iio-opaque.h>
-- 
2.40.1

