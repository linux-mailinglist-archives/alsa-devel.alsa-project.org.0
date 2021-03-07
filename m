Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5465330273
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Mar 2021 16:07:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFED41F06;
	Sun,  7 Mar 2021 16:06:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFED41F06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615129623;
	bh=iUPpI2GQfslmakVaOCm8OugwXm5E4VHUQpUW8Cv0SlM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lnpYMnZQVN2qAWrgSohPd6EaJp/RmfItDDJDpXfNIDPaykJ2AqVgnajWa2niJxuRu
	 fMgKkwInaNxHc/tErKSzWg1fe+BYqbb5wXihNYHuur/34FPrMvK3kaAu35UxU1nvI/
	 ygraS/SMuiTUP5r/UPtyH8IDWanXkmumb6QWO+Bw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23081F80256;
	Sun,  7 Mar 2021 16:05:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3646F8025A; Sun,  7 Mar 2021 16:05:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB131F80139
 for <alsa-devel@alsa-project.org>; Sun,  7 Mar 2021 16:05:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB131F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="buEDlRWC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615129514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FRxKNSzdoSQFDgbfTbAJZOqTecAuPT1kBP8LvYPa0IA=;
 b=buEDlRWC+AeeuQMrGpEIuvToi6jaojCCBBvkLAHNyw7Dw9bzj2HjczV0okHELOlm4XC8cf
 D1MLwaW1LVoV3NQrM3j9dS5+tzJMVJxc6pQQKZ5Hs9AX7edO6g4fKWlSdK6isP2AGQTcLi
 ZgH00N4ZrDlCoYr5S7EO5gyPu6PiP68=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-uBiPNu-SMh-JQ_XO43_2sA-1; Sun, 07 Mar 2021 10:05:10 -0500
X-MC-Unique: uBiPNu-SMh-JQ_XO43_2sA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 194C91846096;
 Sun,  7 Mar 2021 15:05:09 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-90.ams2.redhat.com [10.36.112.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C0DE619D7C;
 Sun,  7 Mar 2021 15:05:06 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH resend 1/2] ASoC: rt5640: Rename 'Mono DAC Playback Volume' to
 'DAC2 Playback Volume'
Date: Sun,  7 Mar 2021 16:05:02 +0100
Message-Id: <20210307150503.34906-2-hdegoede@redhat.com>
In-Reply-To: <20210307150503.34906-1-hdegoede@redhat.com>
References: <20210307150503.34906-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

Rename 'Mono DAC Playback Volume' to 'DAC2 Playback Volume' and move it
from rt5640_specific_snd_controls[] to rt5640_snd_controls[].

The RT5640_DAC2_DIG_VOL register controlled by this mixer-element has
nothing to do with the Mono (Amplified) output which is only available
on the ALC5640 chip and not on the ALC5642 chip.

The RT5640_DAC2_DIG_VOL volume-control is the main volume control for
audio coming from the I2S2 / AIF2 input of the chip and as such is also
available on the ALC5642.

This commit results in the following userspace visible changes:

1. On devices with an ACL5640 codec, the 'Mono DAC Playback Volume'
control is renamed to 'DAC2 Playback Volume' allowing the alsa-lib
mixer code to properly group it with the 'DAC2 Playback Switch' which
is controlling the mute bits in the RT5640_DAC2_DIG_VOL register.

Note the removal of the 'Mono DAC Playback Volume' is not an issue for
userspace because the UCM profiles do not use it (the UCM profiles are
shared betweent the 5640 and 5642 and only the 5640 had this control).

2. On devices with an ACL5642 codec, there now will be a new
'DAC2 Playback Volume', grouped with the 'DAC2 Playback Switch'

Having a complete 'DAC2 Playback Volume' / 'DAC2 Playback Switch' pair
on both variants will allow enabling hardware-volume control by
setting the UCM PlaybackMasterElem to "DAC2" on devices where the
I2S2/AIF2 interface of the codec is used.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/codecs/rt5640.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index a5674c227b3a..82508c152bee 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -400,6 +400,9 @@ static const struct snd_kcontrol_new rt5640_snd_controls[] = {
 	/* DAC Digital Volume */
 	SOC_DOUBLE("DAC2 Playback Switch", RT5640_DAC2_CTRL,
 		RT5640_M_DAC_L2_VOL_SFT, RT5640_M_DAC_R2_VOL_SFT, 1, 1),
+	SOC_DOUBLE_TLV("DAC2 Playback Volume", RT5640_DAC2_DIG_VOL,
+			RT5640_L_VOL_SFT, RT5640_R_VOL_SFT,
+			175, 0, dac_vol_tlv),
 	SOC_DOUBLE_TLV("DAC1 Playback Volume", RT5640_DAC1_DIG_VOL,
 			RT5640_L_VOL_SFT, RT5640_R_VOL_SFT,
 			175, 0, dac_vol_tlv),
@@ -443,9 +446,6 @@ static const struct snd_kcontrol_new rt5640_specific_snd_controls[] = {
 	/* MONO Output Control */
 	SOC_SINGLE("Mono Playback Switch", RT5640_MONO_OUT, RT5640_L_MUTE_SFT,
 		1, 1),
-
-	SOC_DOUBLE_TLV("Mono DAC Playback Volume", RT5640_DAC2_DIG_VOL,
-		RT5640_L_VOL_SFT, RT5640_R_VOL_SFT, 175, 0, dac_vol_tlv),
 };
 
 /**
-- 
2.30.1

