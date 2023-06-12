Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B3D72C44D
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 14:32:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFFD1828;
	Mon, 12 Jun 2023 14:32:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFFD1828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686573174;
	bh=P7VpvLIVFjDFX5wkT4nJQ6EgCvEJbfiP6isClUPHG+I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JdIci7Fjd8vmrkF4c64n+JpEJzYZ4qZsI2SKeoFPtX9rAKimatyO2QCTZfN4V1P6b
	 RVMjAbqGb1a2ZXp5a/jHvipf+iM39v44tlGETDtAJgPbDHOTRz86NY26jT20oooudY
	 dSJaXRAOTo5PlhiTfFZVJ7iIJWXr0gFbpGeUj6Z4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB67EF805C3; Mon, 12 Jun 2023 14:30:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 865A8F805BA;
	Mon, 12 Jun 2023 14:30:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66017F805B5; Mon, 12 Jun 2023 14:30:28 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 26A3EF8057F
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 14:30:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26A3EF8057F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FbrACQNU
X-GND-Sasl: herve.codina@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686573021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EtIqNDwbBWA1PHsoAgu1+IjHyQBQ7NRNZYEibfB8UtA=;
	b=FbrACQNUpBPPK5pcZMwmaX/axEgNj2WZRC9lGNgZRmfjVVnE2MNfUB/lgLcXOJDF3nn16P
	MXdqANhlnGoHShqijFAzWmMkqaxXZbBXrkjC0Lim9l9K3pH2E+dhnb74wJNlpidzh84Ega
	mIAkJoO8B76bflMipai82cPCadHM2S5hTDLw900Z5W4U5iwMe8TxQNRkurYPAVWD2Taw99
	lYsCoTebu4BQgREXxFtltBOUw1CDCSYRbLbXUhTLGA9mkbqvt/0K/TCIonSlG0n2X13sHX
	mbDNo71+/IPnE7XY6Y3IYWy3LxGSI30XszpVzuU1qg2OF7qt9jLe7IokC53Ndg==
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
Received: by mail.gandi.net (Postfix) with ESMTPA id DDF11240014;
	Mon, 12 Jun 2023 12:30:19 +0000 (UTC)
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
Subject: [PATCH v3 09/12] iio: inkern: Add a helper to query an available
 minimum raw value
Date: Mon, 12 Jun 2023 14:29:23 +0200
Message-Id: <20230612122926.107333-10-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612122926.107333-1-herve.codina@bootlin.com>
References: <20230612122926.107333-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XROLSZZEALYKOHYAUPDKZHUGG5FIRS4T
X-Message-ID-Hash: XROLSZZEALYKOHYAUPDKZHUGG5FIRS4T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XROLSZZEALYKOHYAUPDKZHUGG5FIRS4T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

A helper, iio_read_max_channel_raw() exists to read the available
maximum raw value of a channel but nothing similar exists to read the
available minimum raw value.

This new helper, iio_read_min_channel_raw(), fills the hole and can be
used for reading the available minimum raw value of a channel.
It is fully based on the existing iio_read_max_channel_raw().

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/iio/inkern.c         | 63 ++++++++++++++++++++++++++++++++++++
 include/linux/iio/consumer.h | 12 +++++++
 2 files changed, 75 insertions(+)

diff --git a/drivers/iio/inkern.c b/drivers/iio/inkern.c
index 4331e74191cf..4f383a5ef59f 100644
--- a/drivers/iio/inkern.c
+++ b/drivers/iio/inkern.c
@@ -909,6 +909,69 @@ int iio_read_max_channel_raw(struct iio_channel *chan, int *val)
 }
 EXPORT_SYMBOL_GPL(iio_read_max_channel_raw);
 
+static int iio_channel_read_min(struct iio_channel *chan,
+				int *val, int *val2, int *type,
+				enum iio_chan_info_enum info)
+{
+	const int *vals;
+	int length;
+	int ret;
+
+	ret = iio_channel_read_avail(chan, &vals, type, &length, info);
+	if (ret < 0)
+		return ret;
+
+	switch (ret) {
+	case IIO_AVAIL_RANGE:
+		switch (*type) {
+		case IIO_VAL_INT:
+			*val = vals[0];
+			break;
+		default:
+			*val = vals[0];
+			if (val2)
+				*val2 = vals[1];
+		}
+		return 0;
+
+	case IIO_AVAIL_LIST:
+		if (length <= 0)
+			return -EINVAL;
+		switch (*type) {
+		case IIO_VAL_INT:
+			*val = min_array(vals, length);
+			break;
+		default:
+			/* TODO: learn about min for other iio values */
+			return -EINVAL;
+		}
+		return 0;
+
+	default:
+		return -EINVAL;
+	}
+}
+
+int iio_read_min_channel_raw(struct iio_channel *chan, int *val)
+{
+	struct iio_dev_opaque *iio_dev_opaque = to_iio_dev_opaque(chan->indio_dev);
+	int ret;
+	int type;
+
+	mutex_lock(&iio_dev_opaque->info_exist_lock);
+	if (!chan->indio_dev->info) {
+		ret = -ENODEV;
+		goto err_unlock;
+	}
+
+	ret = iio_channel_read_min(chan, val, NULL, &type, IIO_CHAN_INFO_RAW);
+err_unlock:
+	mutex_unlock(&iio_dev_opaque->info_exist_lock);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(iio_read_min_channel_raw);
+
 int iio_get_channel_type(struct iio_channel *chan, enum iio_chan_type *type)
 {
 	struct iio_dev_opaque *iio_dev_opaque = to_iio_dev_opaque(chan->indio_dev);
diff --git a/include/linux/iio/consumer.h b/include/linux/iio/consumer.h
index f536820b9cf2..e9910b41d48e 100644
--- a/include/linux/iio/consumer.h
+++ b/include/linux/iio/consumer.h
@@ -301,6 +301,18 @@ int iio_write_channel_raw(struct iio_channel *chan, int val);
  */
 int iio_read_max_channel_raw(struct iio_channel *chan, int *val);
 
+/**
+ * iio_read_min_channel_raw() - read minimum available raw value from a given
+ *				channel, i.e. the minimum possible value.
+ * @chan:		The channel being queried.
+ * @val:		Value read back.
+ *
+ * Note, if standard units are required, raw reads from iio channels
+ * need the offset (default 0) and scale (default 1) to be applied
+ * as (raw + offset) * scale.
+ */
+int iio_read_min_channel_raw(struct iio_channel *chan, int *val);
+
 /**
  * iio_read_avail_channel_raw() - read available raw values from a given channel
  * @chan:		The channel being queried.
-- 
2.40.1

