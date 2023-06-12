Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9015B72C448
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 14:32:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEF80FA;
	Mon, 12 Jun 2023 14:31:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEF80FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686573146;
	bh=j43ADNsIjjYmwoEmxuUqQg7nZkVYO+9i2b8VbRnKZ+0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vjg8VjpS+5UrQYb0fcyX8cZ80cVE8dTao3CsMXDChWEhw89SQzVXS3/hdx3B+hRQs
	 K5ujuKuKGMBcdbgIgdsTNcD84v9hgOTTZ2fa9325NSWZ15jM6sN3dKbhI5rxDfQxs6
	 A9QjFksu7CtJG4p7dbNyQHe9vmio8yfwkyCNd+y8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36E67F805B6; Mon, 12 Jun 2023 14:30:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7EB2F805AE;
	Mon, 12 Jun 2023 14:30:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73626F8058C; Mon, 12 Jun 2023 14:30:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 43CF5F8025E
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 14:30:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43CF5F8025E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GPwEuaot
X-GND-Sasl: herve.codina@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686573014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0zjmMFQWF61zw9+cDMz5UXwQs5v91FQYhgIX9kfi+g8=;
	b=GPwEuaotHYy+KeLmHieSOGl4ZFBSI5jW9fbAzyelPnPJgZSUYNy2nJ9FQH481z2kbd79ev
	mWK4v88w1xCDOy6EglLRLeaHs00makBSqA4AJGxjD6TwPfQDBwPPuKovSv7V3mxM5r2QCp
	4VJ4UhiAKmRONu8MVSCmGOtzpzNqp/GrwQrjNtfnG+qvyDEhHEeQy84ifJMS/jfoKeB2Nu
	nL1gGVg//0h7FtGkBRbit2gDlLHOX6XzuJD2VJwlxwdDUnQv5HshickA5soSnBtXunBI28
	F9NolqiQPJl671dfvtxW3HhlH+LUGXfIaVs81/ZEVZ8FUjXXh369AS6RxJxgdw==
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
Received: by mail.gandi.net (Postfix) with ESMTPA id F177A24000C;
	Mon, 12 Jun 2023 12:30:11 +0000 (UTC)
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
Subject: [PATCH v3 06/12] minmax: Introduce {min,max}_array()
Date: Mon, 12 Jun 2023 14:29:20 +0200
Message-Id: <20230612122926.107333-7-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612122926.107333-1-herve.codina@bootlin.com>
References: <20230612122926.107333-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FJCZH7Q5UJMBE3V5SKZJAAVEJ6EM5XW6
X-Message-ID-Hash: FJCZH7Q5UJMBE3V5SKZJAAVEJ6EM5XW6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FJCZH7Q5UJMBE3V5SKZJAAVEJ6EM5XW6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Introduce min_array() (resp max_array()) in order to get the
minimal (resp maximum) of values present in an array.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 include/linux/minmax.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/include/linux/minmax.h b/include/linux/minmax.h
index 396df1121bff..37a211f22404 100644
--- a/include/linux/minmax.h
+++ b/include/linux/minmax.h
@@ -133,6 +133,32 @@
  */
 #define max_t(type, x, y)	__careful_cmp((type)(x), (type)(y), >)
 
+#define __minmax_array(op, array, len) ({			\
+	typeof(array) __array = (array);			\
+	typeof(len) __len = (len);				\
+	typeof(*__array + 0) __element = __array[--__len];	\
+	while (__len--)						\
+		__element = op(__element, __array[__len]);	\
+	__element; })
+
+/**
+ * min_array - return minimum of values present in an array
+ * @array: array
+ * @len: array length
+ *
+ * Note that @len must not be zero (empty array).
+ */
+#define min_array(array, len) __minmax_array(min, array, len)
+
+/**
+ * max_array - return maximum of values present in an array
+ * @array: array
+ * @len: array length
+ *
+ * Note that @len must not be zero (empty array).
+ */
+#define max_array(array, len) __minmax_array(max, array, len)
+
 /**
  * clamp_t - return a value clamped to a given range using a given type
  * @type: the type of variable to use
-- 
2.40.1

