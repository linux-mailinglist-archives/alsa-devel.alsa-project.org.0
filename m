Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF2E31BAFF
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Feb 2021 15:26:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25FD8166D;
	Mon, 15 Feb 2021 15:25:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25FD8166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613399161;
	bh=+FSbl6/rj0FR/+2qQLp1JrGKZwImAXL3gGOBnQGpe7w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y5AnthdxqegP9nGNgcQWAM1lyU9GY0fDHAfspnBQ2KYCRXeu2ywT2njEePKo7aLqb
	 ygVDjjUywTC7MtQRpicY2djoilTZ5eWt3FZdDoipwOEjzDNUUQ68KpcbAPg7S47YHR
	 PwTb4QbPHj04j+8EVShtYLrlpSez71eE+2FnOsfc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D02ACF80258;
	Mon, 15 Feb 2021 15:24:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B0D0F8028B; Mon, 15 Feb 2021 15:24:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBFC4F80089
 for <alsa-devel@alsa-project.org>; Mon, 15 Feb 2021 15:24:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBFC4F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Hspr7Rep"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613399067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DJXuEU5RYWYd6rDFLPZR3jVgPWGSvaYx2Us0eEUxZEc=;
 b=Hspr7ReppJI8NBc2QM7hYYq47O/B+zDO6MZiyX1JBQLcHqbzaOxxtFXB/cit4HLj12KXv/
 TeLZSirQqF43HXMRwVU06UBRp3tikGnJRIK+lszs42WxBsA7aJtj84ZcA8QDblhfjVrOjz
 ZGi0Vdd/Ecyc1+mfQvdl/Il231vsNSc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-5tlD9RYWOWmh72xUs0varw-1; Mon, 15 Feb 2021 09:24:26 -0500
X-MC-Unique: 5tlD9RYWOWmh72xUs0varw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 301B2107ACC7;
 Mon, 15 Feb 2021 14:24:25 +0000 (UTC)
Received: from x1.localdomain (ovpn-115-74.ams2.redhat.com [10.36.115.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D90AE150;
 Mon, 15 Feb 2021 14:24:23 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Oder Chiou <oder_chiou@realtek.com>
Subject: [RFC 2/2] ASoC: rt5670: Add LED trigger support
Date: Mon, 15 Feb 2021 15:24:19 +0100
Message-Id: <20210215142419.308651-3-hdegoede@redhat.com>
In-Reply-To: <20210215142419.308651-1-hdegoede@redhat.com>
References: <20210215142419.308651-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Bard Liao <bard.liao@intel.com>
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

Add support for controlling a speaker and/or microphone mute LED through
LED triggers using the new generic LED trigger module.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/codecs/rt5670.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt5670.c b/sound/soc/codecs/rt5670.c
index feab15d0686a..9233710e3a4f 100644
--- a/sound/soc/codecs/rt5670.c
+++ b/sound/soc/codecs/rt5670.c
@@ -690,7 +690,8 @@ static const struct snd_kcontrol_new rt5670_snd_controls[] = {
 	/* DAC Digital Volume */
 	SOC_DOUBLE("DAC2 Playback Switch", RT5670_DAC_CTRL,
 		RT5670_M_DAC_L2_VOL_SFT, RT5670_M_DAC_R2_VOL_SFT, 1, 1),
-	SOC_DOUBLE_EXT("DAC1 Playback Switch", SND_SOC_NOPM, 0, 1, 1, 0,
+	SOC_DOUBLE_EXT_ACCESS("DAC1 Playback Switch", SND_SOC_NOPM, 0, 1, 1, 0,
+			SNDRV_CTL_ELEM_ACCESS_SPK_LED,
 			rt5670_dac1_playback_switch_get, rt5670_dac1_playback_switch_put),
 	SOC_DOUBLE_TLV("DAC1 Playback Volume", RT5670_DAC1_DIG_VOL,
 			RT5670_L_VOL_SFT, RT5670_R_VOL_SFT,
@@ -708,8 +709,9 @@ static const struct snd_kcontrol_new rt5670_snd_controls[] = {
 			RT5670_INL_VOL_SFT, RT5670_INR_VOL_SFT,
 			31, 1, in_vol_tlv),
 	/* ADC Digital Volume Control */
-	SOC_DOUBLE("ADC Capture Switch", RT5670_STO1_ADC_DIG_VOL,
-		RT5670_L_MUTE_SFT, RT5670_R_MUTE_SFT, 1, 1),
+	SOC_DOUBLE_ACCESS("ADC Capture Switch", RT5670_STO1_ADC_DIG_VOL,
+			  RT5670_L_MUTE_SFT, RT5670_R_MUTE_SFT, 1, 1,
+			  SNDRV_CTL_ELEM_ACCESS_MIC_LED),
 	SOC_DOUBLE_TLV("ADC Capture Volume", RT5670_STO1_ADC_DIG_VOL,
 			RT5670_L_VOL_SFT, RT5670_R_VOL_SFT,
 			127, 0, adc_vol_tlv),
@@ -3253,6 +3255,8 @@ static int rt5670_i2c_probe(struct i2c_client *i2c,
 
 	}
 
+	snd_ctl_led_request();
+
 	pm_runtime_enable(&i2c->dev);
 	pm_request_idle(&i2c->dev);
 
-- 
2.30.1

