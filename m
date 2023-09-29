Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8276C7B3F1E
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Sep 2023 10:16:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 211D314A9;
	Sat, 30 Sep 2023 10:15:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 211D314A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696061783;
	bh=4obIZ+10ckeVMZcbOVIG1esu1eGUX5gk6OFocjgA65U=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=svIhDmSQKKcLBTmne9FK9AefjVWdHCOBJcEranfToGeVLnsK/1/EixADTHSR2vBeh
	 GmnbuLaV8k7105TtahHWac9aIJUpqzw6HgxvptBtgRJ225fNHORknD0yDDm8oXv1vJ
	 +GMIf7BC1Iy7Yslukq5LU5AtKsJnX5iZgfkciQno=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F5F6F8057E; Sat, 30 Sep 2023 10:12:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C353CF805AA;
	Sat, 30 Sep 2023 10:12:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 886C3F801D5; Fri, 29 Sep 2023 15:01:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F17BBF8016A
	for <alsa-devel@alsa-project.org>; Fri, 29 Sep 2023 15:01:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F17BBF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256
 header.s=mail header.b=Sf24mHE1
Received: from localhost (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 438B540C6D;
	Fri, 29 Sep 2023 15:01:50 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
	by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yBXZ-MBNDPfL; Fri, 29 Sep 2023 15:01:49 +0200 (CEST)
From: Antoine Gennart <gennartan@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1695992509; bh=4obIZ+10ckeVMZcbOVIG1esu1eGUX5gk6OFocjgA65U=;
	h=From:To:Cc:Subject:Date;
	b=Sf24mHE1kBIPLQAA9oQAqTezyw8bAS7NbZU4GyPD4nuS7wNkMJcOM9/0mSHWLm28U
	 SqD2d3fDeMQ+LJyJqz3VHnp2MwIV1xnDLIYMK2CgHBUVCqtBIhW7CfeH19zkYvVbej
	 NJkylyBAogtE5nc1ul1NU75i04P7NV8fmBot1z54MvgDLVJ3ellrwbaj+NBY5qG+/C
	 /dybzk8P5vq8e1n++QR5XPWHoviR4209/zJ47Ch8TAeXbZ/qMhn+6v2zP5ovWhvlpv
	 a3gArvJSnmg0nHV//2inNvgQtppYYj2G3P8R3LG07gOhkzp/G0L/tDxcQTCqwjaIQH
	 yfQaUOErQJ/AA==
To: linux-kernel@vger.kernel.org
Cc: shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	Antoine Gennart <gennartan@disroot.org>
Subject: [PATCH] audio: tlv320adc3xxx: BUG: Correct micbias setting
Date: Fri, 29 Sep 2023 15:01:17 +0200
Message-Id: <20230929130117.77661-1-gennartan@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: gennartan@disroot.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: CBIIRUIIMB7KOQXZUTDGEAHRIBAJRQH2
X-Message-ID-Hash: CBIIRUIIMB7KOQXZUTDGEAHRIBAJRQH2
X-Mailman-Approved-At: Sat, 30 Sep 2023 08:11:57 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CBIIRUIIMB7KOQXZUTDGEAHRIBAJRQH2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The micbias setting for tlv320adc can also have the value '3' which
means that the micbias ouput pin is connected to the input pin AVDD.

Signed-off-by: Antoine Gennart <gennartan@disroot.org>
---
 sound/soc/codecs/tlv320adc3xxx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tlv320adc3xxx.c b/sound/soc/codecs/tlv320adc3xxx.c
index b976c1946286..420bbf588efe 100644
--- a/sound/soc/codecs/tlv320adc3xxx.c
+++ b/sound/soc/codecs/tlv320adc3xxx.c
@@ -293,7 +293,7 @@
 #define ADC3XXX_BYPASS_RPGA		0x80
 
 /* MICBIAS control bits */
-#define ADC3XXX_MICBIAS_MASK		0x2
+#define ADC3XXX_MICBIAS_MASK		0x3
 #define ADC3XXX_MICBIAS1_SHIFT		5
 #define ADC3XXX_MICBIAS2_SHIFT		3
 
@@ -1099,7 +1099,7 @@ static int adc3xxx_parse_dt_micbias(struct adc3xxx *adc3xxx,
 	unsigned int val;
 
 	if (!of_property_read_u32(np, propname, &val)) {
-		if (val >= ADC3XXX_MICBIAS_AVDD) {
+		if (val > ADC3XXX_MICBIAS_AVDD) {
 			dev_err(dev, "Invalid property value for '%s'\n", propname);
 			return -EINVAL;
 		}
-- 
2.34.1

