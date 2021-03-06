Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7A332FDF3
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Mar 2021 00:04:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8977E1FAC;
	Sun,  7 Mar 2021 00:03:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8977E1FAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615071862;
	bh=H9gWKxOfbSKmFHgLjlnvDdsIcocSHok+DiEDdsem1M8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lyPgEn7aTZ/69GSz9W+2LbRoqjxhnkZBEA+1DyebqUHkmPjHaXwyVQgRFiPYcdsA7
	 9L/LopUl6eB5BxBPRDw48gmgf1Fxd4Ow3YzkPNeuM/p4t+z/T+Aw8fPjB9HbrSjJdF
	 DF/DBYh4TOmuTwQ7DZgk1pEBhldrhaH2DONzFWwk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EA01F80277;
	Sun,  7 Mar 2021 00:02:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96085F800ED; Sun,  7 Mar 2021 00:02:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70965F8025B
 for <alsa-devel@alsa-project.org>; Sun,  7 Mar 2021 00:02:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70965F8025B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="MvHEmthP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615071751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eO85NAVIODZKD0cA7nGIeB7WxAvpblq7jaLQSHnH2hY=;
 b=MvHEmthPv0S2cAnexcOAP3rb/HQ1oARXd/FTtH5Iqj4EpSnjM0KHMFDRumVSsug0CXzIeR
 mA0wGZTgM7NUEtVZAGkj4ghZQBN+wa/HaEKFb2+w+wzxS0fXjwnelJxccKg9+lxTq68pYZ
 WpT+SXEBdPN3oMfQWrnK2d2kQreFXoI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-O3Q3uRQ2ObClqwvDyGpeQQ-1; Sat, 06 Mar 2021 18:02:29 -0500
X-MC-Unique: O3Q3uRQ2ObClqwvDyGpeQQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54A8D26860;
 Sat,  6 Mar 2021 23:02:28 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-60.ams2.redhat.com [10.36.112.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC290179B3;
 Sat,  6 Mar 2021 23:02:26 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/2] ASoC: rt5645: The ALC3270 variant does not have a
 headset-mic pin
Date: Sun,  7 Mar 2021 00:02:23 +0100
Message-Id: <20210306230223.516566-2-hdegoede@redhat.com>
In-Reply-To: <20210306230223.516566-1-hdegoede@redhat.com>
References: <20210306230223.516566-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Oder Chiou <oder_chiou@realtek.com>, Hans de Goede <hdegoede@redhat.com>,
 alsa-devel@alsa-project.org, Bard Liao <bard.liao@intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The Asus T100HA and T101HA 2-in-1s use a rt5645 family codec and always
report that a headset (rather then headphones) are plugged in even when
regular headphones are plugged in.

And when a headset is used, then the headset-microphone does not work.
According to RealTek the ALC3270 variant used in these devices does not
support headsets only headphones.

Since the ALC3270 is a budget version of the regular ALC5645 codec,
I assume that it is using a package with less pins and the headset-mic
pin is simply not connected.

Detect if the codec is an ALC3270 based on the ACPI HID and if it is
an ALC3270 then always report SND_JACK_MICROPHONE as false, so that
userspace will not try to use the not-connected headset-mic.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/codecs/rt5645.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 06ea6fce427c..a468d76a680d 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -430,6 +430,9 @@ struct rt5645_platform_data {
 
 	/* Value to assign to snd_soc_card.long_name */
 	const char *long_name;
+
+	/* Some (package) variants have the headset-mic pin not-connected */
+	bool no_headset_mic;
 };
 
 struct rt5645_priv {
@@ -3180,7 +3183,7 @@ static int rt5645_jack_detect(struct snd_soc_component *component, int jack_inse
 		val &= 0x7;
 		dev_dbg(component->dev, "val = %d\n", val);
 
-		if (val == 1 || val == 2) {
+		if ((val == 1 || val == 2) && !rt5645->pdata.no_headset_mic) {
 			rt5645->jack_type = SND_JACK_HEADSET;
 			if (rt5645->en_button_func) {
 				rt5645_enable_push_button_irq(component, true);
@@ -3893,9 +3896,16 @@ static int rt5645_i2c_probe(struct i2c_client *i2c,
 		rt5645->pdata.dmic2_data_pin = QUIRK_DMIC2_DATA_PIN(quirk);
 	}
 
-	if (cht_rt5645_gpios && has_acpi_companion(&i2c->dev))
-		if (devm_acpi_dev_add_driver_gpios(&i2c->dev, cht_rt5645_gpios))
-			dev_dbg(&i2c->dev, "Failed to add driver gpios\n");
+	if (has_acpi_companion(&i2c->dev)) {
+		if (cht_rt5645_gpios) {
+			if (devm_acpi_dev_add_driver_gpios(&i2c->dev, cht_rt5645_gpios))
+				dev_dbg(&i2c->dev, "Failed to add driver gpios\n");
+		}
+
+		/* The ALC3270 package has the headset-mic pin not-connected */
+		if (acpi_dev_hid_uid_match(ACPI_COMPANION(&i2c->dev), "10EC3270", NULL))
+			rt5645->pdata.no_headset_mic = true;
+	}
 
 	rt5645->gpiod_hp_det = devm_gpiod_get_optional(&i2c->dev, "hp-detect",
 						       GPIOD_IN);
-- 
2.30.1

