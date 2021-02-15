Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C254831BAF2
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Feb 2021 15:24:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AE71167F;
	Mon, 15 Feb 2021 15:23:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AE71167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613399076;
	bh=emScLtY3fIzQ+3c2y79D+uMQHpHPNAeFjzQVr/LTbgk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nIbSv3WhIl0WXs8TZ47dggzfKpbKId5N3dLMFegOBl8oAhvBfUDWEQMs9QZlvWMM6
	 nLH3sR1sC/dAaKTbG85BV/C40cM1lFMPx902IhzqYzM+bD7QkCUrXD+k+EisqjI/8P
	 Hz61ip3YWt3pmrKdCSc4XjKTX0m1hTSyjMsc/85w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00068F802C9;
	Mon, 15 Feb 2021 15:22:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99B22F80258; Mon, 15 Feb 2021 15:21:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C5F1F80089
 for <alsa-devel@alsa-project.org>; Mon, 15 Feb 2021 15:21:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C5F1F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Q0tgx4vV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613398894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iNEhNTV+qPPu6yA+16unH67Dp1Q8rrYidgA4OuJ3Ps8=;
 b=Q0tgx4vVmy7WoFOHnG+Cdkik86W3woqWermbtAKyearlSXIHYZpUEiiQoJwVlefRInuFTL
 VRNfJEkgQZ992FNpR1P1n/4u8LO9SNWk3ZejH5rHf/H6r663zS1moymfBlISwffxh+HP2y
 vmeK7iZcbAZlHRY7mT5JGVwlZF6u6gY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-Lj654gyUNh-cjWUwCjj7GA-1; Mon, 15 Feb 2021 09:21:29 -0500
X-MC-Unique: Lj654gyUNh-cjWUwCjj7GA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 162AF1020C28;
 Mon, 15 Feb 2021 14:21:28 +0000 (UTC)
Received: from x1.localdomain (ovpn-115-74.ams2.redhat.com [10.36.115.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84E795D9CC;
 Mon, 15 Feb 2021 14:21:26 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH 3/4] ASoC: rt5670: Remove ADC vol-ctrl mute bits poking from
 Sto1 ADC mixer settings
Date: Mon, 15 Feb 2021 15:21:17 +0100
Message-Id: <20210215142118.308516-4-hdegoede@redhat.com>
In-Reply-To: <20210215142118.308516-1-hdegoede@redhat.com>
References: <20210215142118.308516-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

The SND_SOC_DAPM_MIXER declaration for "Sto1 ADC MIXL" and "Sto1 ADC MIXR"
was using the mute bits from the RT5670_STO1_ADC_DIG_VOL control as mixer
master mute bits.

But these bits are already exposed to userspace as controls as part of the
"ADC Capture Volume" / "ADC Capture Switch" control pair:

        SOC_DOUBLE("ADC Capture Switch", RT5670_STO1_ADC_DIG_VOL,
                RT5670_L_MUTE_SFT, RT5670_R_MUTE_SFT, 1, 1),
        SOC_DOUBLE_TLV("ADC Capture Volume", RT5670_STO1_ADC_DIG_VOL,
                        RT5670_L_VOL_SFT, RT5670_R_VOL_SFT,
                        127, 0, adc_vol_tlv),

Both the fact that the mute bits belong to the same reg as the vol-ctrl
and the "Digital Mixer Path" diagram in the datasheet clearly shows that
these mute bits are not part of the mixer and having 2 separate controls
poking at the same bits is a bad idea.

Remove the master-mute bits settings from the  "Sto1 ADC MIXL" and
"Sto1 ADC MIXR" DAPM widget declarations, avoiding these bits getting
poked from 2 different places.

This should not cause any issues for userspace. AFAICT the rt567x codecs
are only used on x86/ACPI devices and the UCM profiles used there already
set the "ADC Capture Switch" as needed.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/codecs/rt5670.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/rt5670.c b/sound/soc/codecs/rt5670.c
index 0f372a748b0e..4d22fa4e8ab7 100644
--- a/sound/soc/codecs/rt5670.c
+++ b/sound/soc/codecs/rt5670.c
@@ -1652,12 +1652,10 @@ static const struct snd_soc_dapm_widget rt5670_dapm_widgets[] = {
 			    RT5670_PWR_ADC_S1F_BIT, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("ADC Stereo2 Filter", RT5670_PWR_DIG2,
 			    RT5670_PWR_ADC_S2F_BIT, 0, NULL, 0),
-	SND_SOC_DAPM_MIXER("Sto1 ADC MIXL", RT5670_STO1_ADC_DIG_VOL,
-			   RT5670_L_MUTE_SFT, 1, rt5670_sto1_adc_l_mix,
-			   ARRAY_SIZE(rt5670_sto1_adc_l_mix)),
-	SND_SOC_DAPM_MIXER("Sto1 ADC MIXR", RT5670_STO1_ADC_DIG_VOL,
-			   RT5670_R_MUTE_SFT, 1, rt5670_sto1_adc_r_mix,
-			   ARRAY_SIZE(rt5670_sto1_adc_r_mix)),
+	SND_SOC_DAPM_MIXER("Sto1 ADC MIXL", SND_SOC_NOPM, 0, 0,
+			   rt5670_sto1_adc_l_mix, ARRAY_SIZE(rt5670_sto1_adc_l_mix)),
+	SND_SOC_DAPM_MIXER("Sto1 ADC MIXR", SND_SOC_NOPM, 0, 0,
+			   rt5670_sto1_adc_r_mix, ARRAY_SIZE(rt5670_sto1_adc_r_mix)),
 	SND_SOC_DAPM_MIXER("Sto2 ADC MIXL", SND_SOC_NOPM, 0, 0,
 			   rt5670_sto2_adc_l_mix,
 			   ARRAY_SIZE(rt5670_sto2_adc_l_mix)),
-- 
2.30.1

