Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 845B473B325
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Jun 2023 11:00:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B52F0823;
	Fri, 23 Jun 2023 10:59:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B52F0823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687510849;
	bh=/hTbZj/Pa+Nzd59V/qjms0RDfk5/KWt2J2oHLNyyvaw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TIQsELlGfP5C+F7Gh4bBZBfsY2iL+D4jXHgB+e6ioLbiBe+2zpr9dJ3UItzherFwJ
	 X4K7Mx2WCOKj3BGJt/rvpXp2tuoIirKfb7O2qrBsRtP2yUNhQBibarPZ3zD9/em4l+
	 1lpjNZTQ2mjWIZkLoL3eWBIqmPW2jZtD7xD+XF80=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1F31F8058C; Fri, 23 Jun 2023 10:59:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E1E3DF80589;
	Fri, 23 Jun 2023 10:59:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 951DAF801F5; Fri, 23 Jun 2023 10:58:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 05D2EF80169
	for <alsa-devel@alsa-project.org>; Fri, 23 Jun 2023 10:58:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05D2EF80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ONhXLrnB
X-GND-Sasl: herve.codina@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687510729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/hsiLkhiPhkv1THloCiztKYYIF7LrdRF7qyhpJmA/Ws=;
	b=ONhXLrnBHT9aoyHuwq5KlvouXzbQh+QAmv9J7ceVVSq34ivg6s8qyGIr6i04Sagh36RmE5
	QX5t9pUBXx8h4CQxdlHYVRAdUnpCPiZ7B64oigbrIStqKvmyXOxh4QsLrrg4MvujZFuNaP
	BqfMwsfKiRw7UaBllrYpDvsidpVA5t8euhAHUmC0W4piebJHsAK+XMLIylcD1yi8cbCk1l
	fUpajUGxh2VxZM8U6BfKDYpZmT1NIw+chgYSsMPisZnwSJPEE27cYzbiWk6/kFRs0qWjK3
	JkttD8Dx+vz3+ndT3Ph4yLXVgJZsZrX90UlV3MAc4PdcN/q8wXB1fbwC98NNow==
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
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 2F61FE0004;
	Fri, 23 Jun 2023 08:58:48 +0000 (UTC)
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
	Wojciech Ziemba <wojciech.ziemba@intel.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v6 05/13] iio: inkern: Remove the 'unused' variable usage in
 iio_channel_read_max()
Date: Fri, 23 Jun 2023 10:58:22 +0200
Message-Id: <20230623085830.749991-6-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230623085830.749991-1-herve.codina@bootlin.com>
References: <20230623085830.749991-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ILU3LNYZ2D6TZOGOFY2Q7RW7QAN5M6MA
X-Message-ID-Hash: ILU3LNYZ2D6TZOGOFY2Q7RW7QAN5M6MA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ILU3LNYZ2D6TZOGOFY2Q7RW7QAN5M6MA/>
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
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
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

