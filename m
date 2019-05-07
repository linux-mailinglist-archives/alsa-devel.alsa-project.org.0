Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DFD160EE
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 11:30:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B04661816;
	Tue,  7 May 2019 11:29:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B04661816
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557221432;
	bh=RXwyHL4WIFdwbWN0JxIdHiAFyj4y0n7O0gW0xOX2OL4=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ORyl61EkxMr966hQWEEb2rwMV5UZFC8SbVwTYnR3nfAMDBe7vsSglb6VI1s24S188
	 OJshw6f1oTJBd1fJAk12hCBTm2UjesS3nOGjNWu9ao4ULbhxW1EE7fpoDtgearnvx1
	 kfxfpCqdyiyocWryBzoPeLnF9T00FnPYe2cREF/4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4F1DF89673;
	Tue,  7 May 2019 11:28:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5BBBF89674; Tue,  7 May 2019 11:28:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E808CF807B5
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 11:28:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E808CF807B5
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x479SZg5019897,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtitcas11.realtek.com.tw[172.21.6.12])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x479SZg5019897
 (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 7 May 2019 17:28:36 +0800
Received: from RTITMBSVM07.realtek.com.tw ([fe80::a512:a803:bf1e:b23]) by
 RTITCAS11.realtek.com.tw ([fe80::7c6d:ced5:c4ff:8297%15]) with mapi id
 14.03.0399.000; Tue, 7 May 2019 17:28:35 +0800
From: Kailang <kailang@realtek.com>
To: Takashi Iwai <tiwai@suse.de>
Thread-Topic: Support low power consumption for ALC3254
Thread-Index: AdUEqfFNg0PmEGXzT5G9nIHf8haChv//htAA//90EGCAAJXtgIAAAnAA//942gA=
Date: Tue, 7 May 2019 09:28:35 +0000
Message-ID: <6FAB7C47BCF00940BB0999A99BE3547A1D765ADB@RTITMBSVM07.realtek.com.tw>
References: <6FAB7C47BCF00940BB0999A99BE3547A1D765A46@RTITMBSVM07.realtek.com.tw>
 <s5himumirp1.wl-tiwai@suse.de>
 <6FAB7C47BCF00940BB0999A99BE3547A1D765A7C@RTITMBSVM07.realtek.com.tw>
 <s5hpnou39sk.wl-tiwai@suse.de> <s5hk1f239e1.wl-tiwai@suse.de>
In-Reply-To: <s5hk1f239e1.wl-tiwai@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.105.211]
MIME-Version: 1.0
Cc: " \(alsa-devel@alsa-project.org\)" <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] Support low power consumption for ALC3254
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Tuesday, May 7, 2019 5:24 PM
> To: Kailang <kailang@realtek.com>
> Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
> Subject: Re: Support low power consumption for ALC3254
> 
> On Tue, 07 May 2019 11:15:23 +0200,
> Takashi Iwai wrote:
> >
> > Now applied the patch.  Thanks.
> 
> Erm, the patch is utterly broken.  I fixed manually like below.
> Please confirm that it's the right fix.

Oh! Thanks a lot.
The patch is good.

> 
> 
> Takashi
> 
> ===
> 
> From: Kailang Yang <kailang@realtek.com>
> Subject: [PATCH] ALSA: hda/realtek - Support low power consumption for
> ALC295
> 
> Enter to close more power control widgets at suspend.
> Remove hp_pin check. Add the default pin 0x21 as headphone.
> Supported low power consumption, it must do depop procedure when headset
> jack was plugged or unplugged.
> So, alc225_init() and alc225_shutup() must run delay when headset jack was
> plugged or unplugged.
> If depop procedure not run with delay, it will have a chance to let power
> consumption raise high.
> 
> [ A few compile fixes by tiwai ]
> 
> Fixes: 8983eb602af5 ("ALSA: hda/realtek - Move to ACT_INIT state")
> Signed-off-by: Kailang Yang <kailang@realtek.com>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/pci/hda/patch_realtek.c | 46
> +++++++++++++++++++++++++++++--------------
>  1 file changed, 31 insertions(+), 15 deletions(-)
> 
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index d743f2b0e3cf..e733d323f1a7 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -119,6 +119,7 @@ struct alc_spec {
>  	unsigned int no_depop_delay:1;
>  	unsigned int done_hp_init:1;
>  	unsigned int no_shutup_pins:1;
> +	unsigned int ultra_low_power:1;
> 
>  	/* for PLL fix */
>  	hda_nid_t pll_nid;
> @@ -3269,8 +3270,7 @@ static void alc225_init(struct hda_codec *codec)
>  	bool hp1_pin_sense, hp2_pin_sense;
> 
>  	if (!hp_pin)
> -		return;
> -
> +		hp_pin = 0x21;
>  	msleep(30);
> 
>  	hp1_pin_sense = snd_hda_jack_detect(codec, hp_pin); @@ -3280,25
> +3280,31 @@ static void alc225_init(struct hda_codec *codec)
>  		msleep(2);
> 
>  	alc_update_coefex_idx(codec, 0x57, 0x04, 0x0007, 0x1); /* Low power */
> +	if (spec->ultra_low_power) {
> +		alc_update_coef_idx(codec, 0x08, 0x0f << 2, 3<<2);
> +		alc_update_coef_idx(codec, 0x0e, 7<<6, 7<<6);
> +		alc_update_coef_idx(codec, 0x33, 1<<11, 0);
> +		msleep(30);
> +	}
> 
> -	if (hp1_pin_sense)
> +	if (hp1_pin_sense || spec->ultra_low_power)
>  		snd_hda_codec_write(codec, hp_pin, 0,
>  			    AC_VERB_SET_AMP_GAIN_MUTE, AMP_OUT_MUTE);
>  	if (hp2_pin_sense)
>  		snd_hda_codec_write(codec, 0x16, 0,
>  			    AC_VERB_SET_AMP_GAIN_MUTE, AMP_OUT_MUTE);
> 
> -	if (hp1_pin_sense || hp2_pin_sense)
> +	if (hp1_pin_sense || hp2_pin_sense || spec->ultra_low_power)
>  		msleep(85);
> 
> -	if (hp1_pin_sense)
> +	if (hp1_pin_sense || spec->ultra_low_power)
>  		snd_hda_codec_write(codec, hp_pin, 0,
>  			    AC_VERB_SET_PIN_WIDGET_CONTROL, PIN_OUT);
>  	if (hp2_pin_sense)
>  		snd_hda_codec_write(codec, 0x16, 0,
>  			    AC_VERB_SET_PIN_WIDGET_CONTROL, PIN_OUT);
> 
> -	if (hp1_pin_sense || hp2_pin_sense)
> +	if (hp1_pin_sense || hp2_pin_sense || spec->ultra_low_power)
>  		msleep(100);
> 
>  	alc_update_coef_idx(codec, 0x4a, 3 << 10, 0); @@ -3311,11 +3317,8 @@
> static void alc225_shutup(struct hda_codec *codec)
>  	hda_nid_t hp_pin = alc_get_hp_pin(spec);
>  	bool hp1_pin_sense, hp2_pin_sense;
> 
> -	if (!hp_pin) {
> -		alc269_shutup(codec);
> -		return;
> -	}
> -
> +	if (!hp_pin)
> +		hp_pin = 0x21;
>  	/* 3k pull low control for Headset jack. */
>  	alc_update_coef_idx(codec, 0x4a, 0, 3 << 10);
> 
> @@ -3325,28 +3328,36 @@ static void alc225_shutup(struct hda_codec
> *codec)
>  	if (hp1_pin_sense || hp2_pin_sense)
>  		msleep(2);
> 
> -	if (hp1_pin_sense)
> +	if (hp1_pin_sense || spec->ultra_low_power)
>  		snd_hda_codec_write(codec, hp_pin, 0,
>  			    AC_VERB_SET_AMP_GAIN_MUTE, AMP_OUT_MUTE);
>  	if (hp2_pin_sense)
>  		snd_hda_codec_write(codec, 0x16, 0,
>  			    AC_VERB_SET_AMP_GAIN_MUTE, AMP_OUT_MUTE);
> 
> -	if (hp1_pin_sense || hp2_pin_sense)
> +	if (hp1_pin_sense || hp2_pin_sense || spec->ultra_low_power)
>  		msleep(85);
> 
> -	if (hp1_pin_sense)
> +	if (hp1_pin_sense || spec->ultra_low_power)
>  		snd_hda_codec_write(codec, hp_pin, 0,
>  			    AC_VERB_SET_PIN_WIDGET_CONTROL, 0x0);
>  	if (hp2_pin_sense)
>  		snd_hda_codec_write(codec, 0x16, 0,
>  			    AC_VERB_SET_PIN_WIDGET_CONTROL, 0x0);
> 
> -	if (hp1_pin_sense || hp2_pin_sense)
> +	if (hp1_pin_sense || hp2_pin_sense || spec->ultra_low_power)
>  		msleep(100);
> 
>  	alc_auto_setup_eapd(codec, false);
>  	alc_shutup_pins(codec);
> +	if (spec->ultra_low_power) {
> +		msleep(50);
> +		alc_update_coef_idx(codec, 0x08, 0x0f << 2, 0x0c << 2);
> +		alc_update_coef_idx(codec, 0x0e, 7<<6, 0);
> +		alc_update_coef_idx(codec, 0x33, 1<<11, 1<<11);
> +		alc_update_coef_idx(codec, 0x4a, 3<<4, 2<<4);
> +		msleep(30);
> +	}
>  }
> 
>  static void alc_default_init(struct hda_codec *codec) @@ -5526,7 +5537,12
> @@ static void alc_fixup_headset_jack(struct hda_codec *codec,  static void
> alc295_fixup_chromebook(struct hda_codec *codec,
>  				    const struct hda_fixup *fix, int action)  {
> +	struct alc_spec *spec = codec->spec;
> +
>  	switch (action) {
> +	case HDA_FIXUP_ACT_PRE_PROBE:
> +		spec->ultra_low_power = true;
> +		break;
>  	case HDA_FIXUP_ACT_INIT:
>  		switch (codec->core.vendor_id) {
>  		case 0x10ec0295:
> --
> 2.16.4
> 
> 
> ------Please consider the environment before printing this e-mail.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
