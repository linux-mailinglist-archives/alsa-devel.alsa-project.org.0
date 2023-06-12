Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2E172C458
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 14:34:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0383582A;
	Mon, 12 Jun 2023 14:33:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0383582A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686573254;
	bh=5MBk2tEfr7UuAj9szy/piV0lUfQmXzh3dO2Uq6NpU4Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a0b7foLTb/dpdgQEwEjmFPV08FaGo77lqG7zHR3Z5gbG9gQVF+QGEVHfuvNnv5f0i
	 P0IujFQiXEdgVQM12snNo+vSH+ByYbYxWroqSHxjuT0mNMmOxxYW0fe1jTGx9fKepI
	 o9bVm9O5moCdBwiygV2kAar8FekGdpgoZZSYXn7I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8CE92F8055A; Mon, 12 Jun 2023 14:33:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C70B7F80132;
	Mon, 12 Jun 2023 14:33:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91268F8055B; Mon, 12 Jun 2023 14:33:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 21AE3F80130
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 14:30:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21AE3F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lMmnGJ+L
X-GND-Sasl: herve.codina@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686573011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AVqcs+RF8g9xZnk2mzzhe0NIqtDoWUK9eXmhpelzoNA=;
	b=lMmnGJ+LkP+t8FpO2lpB6zuReoAinfucdXaQVqg8GA52ppvsP3CdnBI6bPA7uv86R+V17R
	CYeGD2KCsIqcB9EyR84I7KybSX61YrUr8wdX0zsjyrEQMvUOjXRHYCGNGFMHDF+RSs+5Wt
	8T7Lkn0e5OFFhZAn5hA2ON5gyv/YqZNwqWjykvuwBqAQOiJ/4RfwUM1bub5GaR56cpsR3G
	NV9ULgdAXhDqST4zTQyUhl2+Z333eB9yREiqCJvehHtHtANd4f/ZkcEYSSWXC9rDZy/LEE
	sIhJT1YChAWdqaT5ggxBfzUyRyNKJI0eUqShfQaSRDGqFCLdO6BnlzvY/Qf3Wg==
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
Received: by mail.gandi.net (Postfix) with ESMTPA id E81F1240024;
	Mon, 12 Jun 2023 12:30:09 +0000 (UTC)
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
Subject: [PATCH v3 05/12] iio: inkern: Remove the 'unused' variable usage in
 iio_channel_read_max()
Date: Mon, 12 Jun 2023 14:29:19 +0200
Message-Id: <20230612122926.107333-6-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612122926.107333-1-herve.codina@bootlin.com>
References: <20230612122926.107333-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7XNUUNUQTZBMFPQ6MO57VUZ7P3TRTI2X
X-Message-ID-Hash: 7XNUUNUQTZBMFPQ6MO57VUZ7P3TRTI2X
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7XNUUNUQTZBMFPQ6MO57VUZ7P3TRTI2X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The code uses a local variable to initialize a null pointer in order to
avoid accessing this null pointer later on.

Simply removed the 'unused' variable and check for the null pointer just
before accessing it.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/iio/inkern.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/inkern.c b/drivers/iio/inkern.c
index f738db9a0c04..ce537b4ca6ca 100644
--- a/drivers/iio/inkern.c
+++ b/drivers/iio/inkern.c
@@ -849,14 +849,10 @@ static int iio_channel_read_max(struct iio_channel *chan,
 				int *val, int *val2, int *type,
 				enum iio_chan_info_enum info)
 {
-	int unused;
 	const int *vals;
 	int length;
 	int ret;
 
-	if (!val2)
-		val2 = &unused;
-
 	ret = iio_channel_read_avail(chan, &vals, type, &length, info);
 	if (ret < 0)
 		return ret;
@@ -869,7 +865,8 @@ static int iio_channel_read_max(struct iio_channel *chan,
 			break;
 		default:
 			*val = vals[4];
-			*val2 = vals[5];
+			if (val2)
+				*val2 = vals[5];
 		}
 		return 0;
 
-- 
2.40.1

