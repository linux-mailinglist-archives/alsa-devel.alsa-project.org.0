Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C69E772C45B
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 14:34:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDEC284B;
	Mon, 12 Jun 2023 14:34:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDEC284B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686573295;
	bh=+bNHptp2V2lut6GtimuR3m5ZqbYJIEJA8llX4Kq9/2Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DkEvLPaJRgW3KKNGr6fu5iKgay6jZfK4OtIVm4fcGCA5MLpWHImi8LLfUdEMVrfsQ
	 OzHn/C4NNmkKX0I5vPbxfBRH9skcLGJUdmoJPhqh4amwDMwzX7vGMrPq3mkc4MSuei
	 KYKm3bj+vKX47/Y6FKeuG23z3nj+fS0kFASBrtjA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E285F80568; Mon, 12 Jun 2023 14:33:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 50680F8057C;
	Mon, 12 Jun 2023 14:33:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98C1AF80149; Mon, 12 Jun 2023 14:33:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4AE31F80149
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 14:30:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AE31F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Rz+Ii9wf
X-GND-Sasl: herve.codina@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686573009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b7GpRi53x4asj1T+mG5YB9K5F5kbtkPlrvMMs/bfkeM=;
	b=Rz+Ii9wfAJ84Hru5tWVZ2BHscLeDldbI7wxcUWvnboDxxaqAepsmlmzMDX9eCAB2TVZerH
	vMam8AYocthmCfwmrQ5zzf/Y93M02RvKwhMsqypIx2AbNP2HGdaMCxVnlZ444fWwbIQEQE
	/0corWxCLXrXGWmdJIQJRpTLjRtnkqRNuu143YDtSO4by62DLn4EhwHjh46lW7pdz21EUO
	eisZ/tCTUrLPnY4dkmB116U0m3ruME+grhCRDdh0uHhfDnStL+8WwaudxayplAr5HRyChX
	eF9a14vvZJSlCmiLVI+oJnJpAziN/1vjPf5Qt3/kgs0AN3BfNlPzjewLGrkRIQ==
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
Received: by mail.gandi.net (Postfix) with ESMTPA id B5C65240008;
	Mon, 12 Jun 2023 12:30:00 +0000 (UTC)
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
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v3 04/12] iio: consumer.h: Fix raw values documentation notes
Date: Mon, 12 Jun 2023 14:29:18 +0200
Message-Id: <20230612122926.107333-5-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612122926.107333-1-herve.codina@bootlin.com>
References: <20230612122926.107333-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SXIDXMCKOYRIYTYMZHJ64RITAIT3P4YP
X-Message-ID-Hash: SXIDXMCKOYRIYTYMZHJ64RITAIT3P4YP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SXIDXMCKOYRIYTYMZHJ64RITAIT3P4YP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The raw values notes mention 'ADC counts' and are not fully accurate.

Reword the notes in order to remove the 'ADC counts' and describe the
conversion needed between a raw value and a value in the standard units.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 include/linux/iio/consumer.h | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/include/linux/iio/consumer.h b/include/linux/iio/consumer.h
index 6802596b017c..f536820b9cf2 100644
--- a/include/linux/iio/consumer.h
+++ b/include/linux/iio/consumer.h
@@ -201,8 +201,9 @@ struct iio_dev
  * @chan:		The channel being queried.
  * @val:		Value read back.
  *
- * Note raw reads from iio channels are in adc counts and hence
- * scale will need to be applied if standard units required.
+ * Note, if standard units are required, raw reads from iio channels
+ * need the offset (default 0) and scale (default 1) to be applied
+ * as (raw + offset) * scale.
  */
 int iio_read_channel_raw(struct iio_channel *chan,
 			 int *val);
@@ -212,8 +213,9 @@ int iio_read_channel_raw(struct iio_channel *chan,
  * @chan:		The channel being queried.
  * @val:		Value read back.
  *
- * Note raw reads from iio channels are in adc counts and hence
- * scale will need to be applied if standard units required.
+ * Note, if standard units are required, raw reads from iio channels
+ * need the offset (default 0) and scale (default 1) to be applied
+ * as (raw + offset) * scale.
  *
  * In opposit to the normal iio_read_channel_raw this function
  * returns the average of multiple reads.
@@ -281,8 +283,9 @@ int iio_read_channel_attribute(struct iio_channel *chan, int *val,
  * @chan:		The channel being queried.
  * @val:		Value being written.
  *
- * Note raw writes to iio channels are in dac counts and hence
- * scale will need to be applied if standard units required.
+ * Note that for raw writes to iio channels, if the value provided is
+ * in standard units, the affect of the scale and offset must be removed
+ * as (value / scale) - offset.
  */
 int iio_write_channel_raw(struct iio_channel *chan, int val);
 
@@ -292,8 +295,9 @@ int iio_write_channel_raw(struct iio_channel *chan, int val);
  * @chan:		The channel being queried.
  * @val:		Value read back.
  *
- * Note raw reads from iio channels are in adc counts and hence
- * scale will need to be applied if standard units are required.
+ * Note, if standard units are required, raw reads from iio channels
+ * need the offset (default 0) and scale (default 1) to be applied
+ * as (raw + offset) * scale.
  */
 int iio_read_max_channel_raw(struct iio_channel *chan, int *val);
 
@@ -308,8 +312,9 @@ int iio_read_max_channel_raw(struct iio_channel *chan, int *val);
  * For ranges, three vals are always returned; min, step and max.
  * For lists, all the possible values are enumerated.
  *
- * Note raw available values from iio channels are in adc counts and
- * hence scale will need to be applied if standard units are required.
+ * Note, if standard units are required, raw available values from iio
+ * channels need the offset (default 0) and scale (default 1) to be applied
+ * as (raw + offset) * scale.
  */
 int iio_read_avail_channel_raw(struct iio_channel *chan,
 			       const int **vals, int *length);
-- 
2.40.1

