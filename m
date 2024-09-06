Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F0996F614
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2024 15:57:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC334E64;
	Fri,  6 Sep 2024 15:57:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC334E64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725631053;
	bh=Y8S3sIUeUo+i76VJqD3Gk9saCrU/jNFW7+ZyZebjSrU=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ic7W/UF6kSHxSvclpfs9Uklb1XA+UOTHOEJDIePk/xHLf8MYio7ZL5DIuG/kwPqB8
	 0K8BaunOicacu0b62mNaHec0diTZJR+kMwN72kD/FkQf8mEQpeHVen2m6gN00VnKYb
	 NbBuIQwjt/AF8Iw+nku9Lk7/yNyB4QuSX8jxPwTI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAF4BF806F7; Fri,  6 Sep 2024 15:55:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B5F5F806C3;
	Fri,  6 Sep 2024 15:55:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC067F8016C; Fri,  6 Sep 2024 14:20:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0D96F80107
	for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2024 14:20:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0D96F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jNExSRcy
Received: by mail.gandi.net (Postfix) with ESMTPSA id C0DBFC000B;
	Fri,  6 Sep 2024 12:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725625221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MtAkF99VG/OSc6QNgU0cRrGhkO1sSV69WMhxrgTuZIA=;
	b=jNExSRcyFcWBI1DsCEiYSceE1JAcAaEyvsNSpGlZ+CnUdyeO4hPy0kqSD5KcNtxR+JrCtz
	8pdSSbU2pzy54M70QEe2d+7T6Smnal/7UPkIqpBtxNpfJERTATWh1aG69wFnmQhAx4UfjG
	Er9rBqCgLzxzafnxqTRCMcHzlPr1ETQyCIOE0JJWnEIE/PZsQi+qyZoa27jCXb9vRdAf4r
	5FzBKLWClHEfzNSGyioGkjp3o9h3LfFdSDiY9OTCwi/1t5b6+1C4m5a6qtNtVLG5SJh8fi
	veazp6wgkPV4QmuqgAKOsZBuBKtOK5mM3eQonNdeurMvUW+amm8WbLVBPP7Zqw==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Fri, 06 Sep 2024 14:20:58 +0200
Subject: [PATCH] ASoC: tlv320aic31xx: Add support for loading filter
 coefficients
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240906-tlv320-filter-v1-1-6955f53ff435@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAKnz2mYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDCwMz3ZKcMmMjA920zJyS1CJdQwvL1JQUMzMTS7NkJaCegqLUtMwKsHn
 RsbW1ANhLRdpfAAAA
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, Romain Gantois <romain.gantois@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-Sasl: romain.gantois@bootlin.com
X-MailFrom: romain.gantois@bootlin.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: VFUUO3TNMI74B3QY5X7XXRW3ILOXZVKV
X-Message-ID-Hash: VFUUO3TNMI74B3QY5X7XXRW3ILOXZVKV
X-Mailman-Approved-At: Fri, 06 Sep 2024 13:55:01 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VFUUO3TNMI74B3QY5X7XXRW3ILOXZVKV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The TLV320DAC3100 Audio DAC has 25 built-in digital audio processing blocks
(PRBs). Each of these PRBs has a static filter structure with programmable
coefficients. Once a PRB is selected for use by the DAC, its filter
coefficients can be configured via a dedicated set of registers.

Define a new optional firmware which can be loaded by the TLV320DAC driver.
This firmware describes a full set of filter coefficients for all blocks
used by the various PRBs.

The firmware's binary format is heavily inspired by the one used in the
peb2466 driver. It includes a version marker to allow for potential
evolutions of the format.

Note that adaptive filtering is not supported i.e. filter coefficients are
loaded once before power-on and then cannot be changed while the DAC is
powered. This is why only page A coefficients are modified. Page B
coefficients are only used for adaptive filtering.

Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 sound/soc/codecs/tlv320aic31xx.c | 100 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/sound/soc/codecs/tlv320aic31xx.c b/sound/soc/codecs/tlv320aic31xx.c
index 2f94cfda0e33..7e624c4b77b6 100644
--- a/sound/soc/codecs/tlv320aic31xx.c
+++ b/sound/soc/codecs/tlv320aic31xx.c
@@ -12,6 +12,7 @@
  * and mono/stereo Class-D speaker driver.
  */
 
+#include <asm/unaligned.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -22,6 +23,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/regulator/consumer.h>
 #include <linux/acpi.h>
+#include <linux/firmware.h>
 #include <linux/of.h>
 #include <linux/slab.h>
 #include <sound/core.h>
@@ -1638,6 +1640,98 @@ static const struct i2c_device_id aic31xx_i2c_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, aic31xx_i2c_id);
 
+static int tlv320dac3100_fw_load(struct aic31xx_priv *aic31xx,
+				 const u8 *data, size_t size)
+{
+	int ret, reg;
+	u16 val16;
+
+	/*
+	 * Coefficients firmware binary structure. Multi-byte values are big-endian.
+	 *
+	 * @0, 16bits: Magic (0xB30C)
+	 * @2, 16bits: Version (0x0100 for version 1.0)
+	 * @4, 8bits: DAC Processing Block Selection
+	 * @5, 62 16-bit values: Page 8 buffer A DAC programmable filter coefficients
+	 * @129, 12 16-bit values: Page 9 Buffer A DAC programmable filter coefficients
+	 *
+	 * Filter coefficients are interpreted as two's complement values
+	 * ranging from -32 768 to 32 767. For more details on filter coefficients,
+	 * please refer to the TLV320DAC3100 datasheet, tables 6-120 and 6-123.
+	 */
+
+	if (size != 153) {
+		dev_err(aic31xx->dev, "firmware size is %zu, expected 153 bytes\n", size);
+		return -EINVAL;
+	}
+
+	/* Check magic */
+	val16 = get_unaligned_be16(data);
+	if (val16 != 0xb30c) {
+		dev_err(aic31xx->dev, "fw magic is 0x%04x expected 0xb30c\n", val16);
+		return -EINVAL;
+	}
+	data += 2;
+
+	/* Check version */
+	val16 = get_unaligned_be16(data);
+	if (val16 != 0x0100) {
+		dev_err(aic31xx->dev, "invalid firmware version 0x%04x! expected 1", val16);
+		return -EINVAL;
+	}
+	data += 2;
+
+	ret = regmap_write(aic31xx->regmap, AIC31XX_DACPRB, *data);
+	if (ret) {
+		dev_err(aic31xx->dev, "failed to write PRB index: err %d\n", ret);
+		return ret;
+	}
+	data += 1;
+
+	/* Page 8 Buffer A coefficients */
+	for (reg = 2; reg < 126; reg++) {
+		ret = regmap_write(aic31xx->regmap, AIC31XX_REG(8, reg), *data);
+		if (ret) {
+			dev_err(aic31xx->dev,
+				"failed to write page 8 filter coefficient %d: err %d\n", reg, ret);
+			return ret;
+		}
+		data++;
+	}
+
+	/* Page 9 Buffer A coefficients */
+	for (reg = 2; reg < 26; reg++) {
+		ret = regmap_write(aic31xx->regmap, AIC31XX_REG(9, reg), *data);
+		if (ret) {
+			dev_err(aic31xx->dev,
+				"failed to write page 9 filter coefficient %d: err %d\n", reg, ret);
+			return ret;
+		}
+		data++;
+	}
+
+	dev_info(aic31xx->dev, "done loading DAC filter coefficients\n");
+
+	return ret;
+}
+
+static int tlv320dac3100_load_coeffs(struct aic31xx_priv *aic31xx,
+				     const char *fw_name)
+{
+	const struct firmware *fw;
+	int ret;
+
+	ret = request_firmware(&fw, fw_name, aic31xx->dev);
+	if (ret)
+		return ret;
+
+	ret = tlv320dac3100_fw_load(aic31xx, fw->data, fw->size);
+
+	release_firmware(fw);
+
+	return ret;
+}
+
 static int aic31xx_i2c_probe(struct i2c_client *i2c)
 {
 	struct aic31xx_priv *aic31xx;
@@ -1727,6 +1821,12 @@ static int aic31xx_i2c_probe(struct i2c_client *i2c)
 		}
 	}
 
+	if (aic31xx->codec_type == DAC3100) {
+		ret = tlv320dac3100_load_coeffs(aic31xx, "tlv320dac3100-coeffs.bin");
+		if (ret)
+			dev_warn(aic31xx->dev, "Did not load any filter coefficients\n");
+	}
+
 	if (aic31xx->codec_type & DAC31XX_BIT)
 		return devm_snd_soc_register_component(&i2c->dev,
 				&soc_codec_driver_aic31xx,

---
base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
change-id: 20240806-tlv320-filter-189edd66496c

Best regards,
-- 
Romain Gantois <romain.gantois@bootlin.com>

