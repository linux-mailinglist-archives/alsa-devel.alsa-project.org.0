Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 265D6174E6
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 11:19:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB5C41A9A;
	Wed,  8 May 2019 11:18:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB5C41A9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557307170;
	bh=QZeZwzFw3rLkNOT7dX+DUJb/SxPvYkMOWMtYCkKhtwc=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ArKvSkSl4x6+wof/AGhD03BxfsJ2KYCIZW3kxPy3AM6PyU9u2NlM84g04rLypJgrq
	 +9gOYXe5xxY9rRaq5AbJMpS7OofK93GXXNymQKleRR/CBl2fZvW0nmLeaIVTNrsRGS
	 SnEKQ/ITyGJu4ntLAMZ9aJAobWvtOdTZkKAgDmZs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3F21F89725;
	Wed,  8 May 2019 11:17:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD217F89715; Wed,  8 May 2019 11:17:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99105F896E6
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 11:17:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99105F896E6
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x489HU8E032767,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtitcas11.realtek.com.tw[172.21.6.12])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x489HU8E032767
 (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 8 May 2019 17:17:31 +0800
Received: from RTITMBSVM07.realtek.com.tw ([fe80::a512:a803:bf1e:b23]) by
 RTITCAS11.realtek.com.tw ([fe80::7c6d:ced5:c4ff:8297%15]) with mapi id
 14.03.0399.000; Wed, 8 May 2019 17:17:30 +0800
From: Kailang <kailang@realtek.com>
To: Takashi Iwai <tiwai@suse.de>
Thread-Topic: FW: move eapd coef function before ACT_PRE_PROBE state
Thread-Index: AdT/J/zgDi+/s6pzRJ+XG6C5XTeJJQErwFhQADei07D//3ubgP/+D9jwgANikQD//1vMgA==
Date: Wed, 8 May 2019 09:17:30 +0000
Message-ID: <6FAB7C47BCF00940BB0999A99BE3547A1D765CA5@RTITMBSVM07.realtek.com.tw>
References: <6FAB7C47BCF00940BB0999A99BE3547A1D765A9D@RTITMBSVM07.realtek.com.tw>
 <s5hmujy39go.wl-tiwai@suse.de>
 <6FAB7C47BCF00940BB0999A99BE3547A1D765C5E@RTITMBSVM07.realtek.com.tw>
 <s5hv9ylo167.wl-tiwai@suse.de>
In-Reply-To: <s5hv9ylo167.wl-tiwai@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.105.211]
MIME-Version: 1.0
Cc: " \(alsa-devel@alsa-project.org\)" <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] FW: move eapd coef function before ACT_PRE_PROBE
	state
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

Sorry!! I didn't get the mail.

> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Wednesday, May 8, 2019 3:28 PM
> To: Kailang <kailang@realtek.com>
> Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
> Subject: Re: FW: move eapd coef function before ACT_PRE_PROBE state
> 
> On Wed, 08 May 2019 08:59:02 +0200,
> Kailang wrote:
> >
> > Hi Takashi,
> >
> > I recreate patch as attach.
> 
> No, no, it's not what I meant.  I already *reviewed* and replied your patch.
> 
> I copy my previous reply once again.  Please read and test it.

Patch fail.

patch: **** malformed patch at line 10: @@ -796,10 +795,22 @@ static int alc_build_controls(struct hda_codec *codec)

> 
> ===
> 
> Unfortuantely, moving this doesn't suffice.  There is the hibernation resume
> that needs the explicit initialization again.
> 
> Also, calling this in alc_alloc_spec() isn't intuitive.  Although it'd become a
> larger patch, I prefer making it more explicit, e.g. creating
> alc_pre_init() function handling the pre-init procedure and call it from
> appropriate places.
> 
> So I can imagine a patch like below.  Does it work for you?
> 
> 
> thanks,
> 
> Takashi
> 
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -501,7 +501,6 @@ static void alc_eapd_shutup(struct hda_codec *codec)
>  /* generic EAPD initialization */
>  static void alc_auto_init_amp(struct hda_codec *codec, int type)  {
> -	alc_fill_eapd_coef(codec);
>  	alc_auto_setup_eapd(codec, true);
>  	alc_write_gpio(codec);
>  	switch (type) {
> @@ -796,10 +795,22 @@ static int alc_build_controls(struct hda_codec
> *codec)
>   * Common callbacks
>   */
> 
> +static void alc_pre_init(struct hda_codec *codec) {
> +	alc_fill_eapd_coef(codec);
> +}
> +
> +#define is_s4_resume(codec) \
> +	((codec)->core.dev.power.power_state.event == PM_EVENT_RESTORE)
> +
>  static int alc_init(struct hda_codec *codec)  {
>  	struct alc_spec *spec = codec->spec;
> 
> +	/* hibernation resume needs the full chip initialization */
> +	if (is_s4_resume(codec))
> +		alc_pre_init(codec);
> +
>  	if (spec->init_hook)
>  		spec->init_hook(codec);
> 
> @@ -1537,6 +1548,8 @@ static int patch_alc880(struct hda_codec *codec)
> 
>  	codec->patch_ops.unsol_event = alc880_unsol_event;
> 
> +	alc_pre_init(codec);
> +
>  	snd_hda_pick_fixup(codec, alc880_fixup_models, alc880_fixup_tbl,
>  		       alc880_fixups);
>  	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE); @@ -1788,6
> +1801,8 @@ static int patch_alc260(struct hda_codec *codec)
> 
>  	spec->shutup = alc_eapd_shutup;
> 
> +	alc_pre_init(codec);
> +
>  	snd_hda_pick_fixup(codec, alc260_fixup_models, alc260_fixup_tbl,
>  			   alc260_fixups);
>  	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE); @@ -2491,6
> +2506,8 @@ static int patch_alc882(struct hda_codec *codec)
>  		break;
>  	}
> 
> +	alc_pre_init(codec);
> +
>  	snd_hda_pick_fixup(codec, alc882_fixup_models, alc882_fixup_tbl,
>  		       alc882_fixups);
>  	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE); @@ -2665,6
> +2682,8 @@ static int patch_alc262(struct hda_codec *codec)  #endif
>  	alc_fix_pll_init(codec, 0x20, 0x0a, 10);
> 
> +	alc_pre_init(codec);
> +
>  	snd_hda_pick_fixup(codec, alc262_fixup_models, alc262_fixup_tbl,
>  		       alc262_fixups);
>  	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE); @@ -2809,6
> +2828,8 @@ static int patch_alc268(struct hda_codec *codec)
> 
>  	spec->shutup = alc_eapd_shutup;
> 
> +	alc_pre_init(codec);
> +
>  	snd_hda_pick_fixup(codec, alc268_fixup_models, alc268_fixup_tbl,
> alc268_fixups);
>  	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
> 
> @@ -7768,6 +7789,8 @@ static int patch_alc269(struct hda_codec *codec)
>  		spec->init_hook = alc5505_dsp_init;
>  	}
> 
> +	alc_pre_init(codec);
> +
>  	snd_hda_pick_fixup(codec, alc269_fixup_models,
>  		       alc269_fixup_tbl, alc269_fixups);
>  	snd_hda_pick_pin_fixup(codec, alc269_pin_fixup_tbl, alc269_fixups); @@
> -7910,6 +7933,8 @@ static int patch_alc861(struct hda_codec *codec)
>  	spec->power_hook = alc_power_eapd;
>  #endif
> 
> +	alc_pre_init(codec);
> +
>  	snd_hda_pick_fixup(codec, NULL, alc861_fixup_tbl, alc861_fixups);
>  	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
> 
> @@ -8007,6 +8032,8 @@ static int patch_alc861vd(struct hda_codec *codec)
> 
>  	spec->shutup = alc_eapd_shutup;
> 
> +	alc_pre_init(codec);
> +
>  	snd_hda_pick_fixup(codec, NULL, alc861vd_fixup_tbl, alc861vd_fixups);
>  	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
> 
> @@ -8742,6 +8769,8 @@ static int patch_alc662(struct hda_codec *codec)
>  		break;
>  	}
> 
> +	alc_pre_init(codec);
> +
>  	snd_hda_pick_fixup(codec, alc662_fixup_models,
>  		       alc662_fixup_tbl, alc662_fixups);
>  	snd_hda_pick_pin_fixup(codec, alc662_pin_fixup_tbl, alc662_fixups);
> 
> 
> ------Please consider the environment before printing this e-mail.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
