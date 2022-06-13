Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5778054A054
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jun 2022 22:55:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBCF3176E;
	Mon, 13 Jun 2022 22:54:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBCF3176E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655153711;
	bh=UMp07K+ID0ox8DseiUtnR2BEFu4qyiav/X3FrDm0hU4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bGNcU5bw77ibFG6vFRb7BnRrClLI67zN64v07evSHKTUVt28IqAEoEM4dNrjJQMXa
	 g5G2dfiVroIVB2O3baY15ZwL8qF04Kcsig6Al2KBXjPyZbTxrDkAtgAfJq4rHQ5xVh
	 cuojQCGKBnT9InF2ox0QwzdL/EXStdoThq5Er+/Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F013F804CC;
	Mon, 13 Jun 2022 22:54:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C719F804C1; Mon, 13 Jun 2022 22:54:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57C3FF80107
 for <alsa-devel@alsa-project.org>; Mon, 13 Jun 2022 22:53:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57C3FF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="AhN3G4GF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655153638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pbeEKIWTFge0JVD/JPFSerzEMhYRjfDnoCBkUR8Hd1Q=;
 b=AhN3G4GFBYE736COMCHbpFIXFzw5ZRfg92IxIlceFJN5mI6VWITR4YchQelph5/sTGXVDD
 aN0MxR6KTsF5FYIFQbheGSUwlPrugdjDhW8nRErKpfMWcUPc9Ezcql/CkKNGeyW+uMBxHP
 D2+Cdyf57BHNe6RMbxc2rU8UtUWKoYs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-247-iPkegYCRNyGLNKY0xf9AiA-1; Mon, 13 Jun 2022 16:53:57 -0400
X-MC-Unique: iPkegYCRNyGLNKY0xf9AiA-1
Received: by mail-ed1-f70.google.com with SMTP id
 j4-20020aa7ca44000000b0042dd12a7bc5so4640422edt.13
 for <alsa-devel@alsa-project.org>; Mon, 13 Jun 2022 13:53:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pbeEKIWTFge0JVD/JPFSerzEMhYRjfDnoCBkUR8Hd1Q=;
 b=iLOLDguxZorTqiXlVlXrdl/ZYGyywdXW8IWrNBFANQJLz4f6Nd9LgpiU5UsgwyAXpU
 p9jEk5A+LGKPDPjppc3gViz7JXuNPaGIfwOB7PDAnaAkeqsSk6uKwWY62VMvs5cogG/p
 xZV583u70L3hHh/KRhfYlUPaHJqFwUCqnnCekmHB6RiV2akrm/Yxq2X6eVDTkgE0i7Fw
 bQyftpr7pD8/y/TA1MKtTm35GYkhUjiYPI+pWkHmeECoT/ww5gUnlf7vNInmCzQhp7eh
 GOIl7Dagm1vOh0EbSeE4xkuiBz7RmSe0e9phvki0vH0iQsFF/FhXKBBljg1pdFeCjfCk
 F0kg==
X-Gm-Message-State: AJIora9EwMYPjwQOarsHx7Spv5Mp5CAMZaGo5xePEftcSi5TFbQ+dkhY
 IQ7OUjVO0BhOAJtEt05xcIWabPrxUY9IooOV44aZMNYg3u4BiS8wBUSGB03XGsnu9YyVJq7Hw1M
 EXoDHoVeoixqwtkjzyrpqDyA=
X-Received: by 2002:aa7:cb95:0:b0:434:ef34:664f with SMTP id
 r21-20020aa7cb95000000b00434ef34664fmr1843717edt.236.1655153635980; 
 Mon, 13 Jun 2022 13:53:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmZI6hqvgg2K14k6pRAKC4qnJK0SDNahBskTYL75G0iaHmDy91ZSqkrhiKHoiqjL5QAeAf+g==
X-Received: by 2002:aa7:cb95:0:b0:434:ef34:664f with SMTP id
 r21-20020aa7cb95000000b00434ef34664fmr1843702edt.236.1655153635736; 
 Mon, 13 Jun 2022 13:53:55 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a17090669c100b006fa84a0af2asm4291596ejs.16.2022.06.13.13.53.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 13:53:55 -0700 (PDT)
Message-ID: <632db5d6-e978-08b7-5fc2-e09988f66c85@redhat.com>
Date: Mon, 13 Jun 2022 22:53:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: How to add 2 different SND_PCI_QUIRKs for 2 models with the same
 PCI subsys vend + prod ids?
To: Takashi Iwai <tiwai@suse.de>
References: <7e3aa97a-77c9-3367-8929-a86049286d75@redhat.com>
 <87k09l7ys7.wl-tiwai@suse.de>
 <5ca147d1-3a2d-60c6-c491-8aa844183222@redhat.com>
 <87ilp57wpa.wl-tiwai@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <87ilp57wpa.wl-tiwai@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "nikitashvets@flyium.com" <nikitashvets@flyium.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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

Hi,

On 6/13/22 11:13, Takashi Iwai wrote:
> On Mon, 13 Jun 2022 10:46:28 +0200,
> Hans de Goede wrote:
>>
>> Hi,
>>
>> On 6/13/22 10:28, Takashi Iwai wrote:
>>> On Mon, 13 Jun 2022 09:54:47 +0200,
>>> Hans de Goede wrote:
>>>>
>>>> Hi All,
>>>>
>>>> There is a problem with the sound on the Lenovo Yoga Duet 7 13IML05, which
>>>> requires a SND_PCI_QUIRK to fix. But there already is an existing quirk
>>>> for another Lenovo laptop using the same  PCI subsys vend + prod ids.
>>>>
>>>> For more details see:
>>>> https://wiki.archlinux.org/title/Lenovo_Yoga_Duet_7_13IML05#Audio
>>>>
>>>> So I guess this means that we need to add a way to also include a DMI match
>>>> for SND_PCI_QUIRKs ?
>>>>
>>>> Maybe add a:
>>>>
>>>> const struct dmi_systemid *dmi_ids;
>>>>
>>>> member to struct snd_pci_quirk and a new
>>>> SND_PCI_QUIRK_DMI macro to set this?
>>>
>>> Do both machines have the very same codec?  I couldn't find
>>> alsa-info.sh output for Duet 7, but at least, C940 seems with ALC298
>>> (0x10ec0298), judging from
>>>   https://bugzilla.kernel.org/show_bug.cgi?id=205755
>>> If Duet 7 has a different codec (e.g. ALC287 0x10ec0287), we can
>>> distinguish from that.
>>
>> I've just asked the reporter of this for alsa-info.sh output.
>>
>> So assuming the codec is indeed different how would I go about
>> fixing this ?
> 
> It'll be something like below.

Thanks.

The alsa-info.sh output for the Yoga Duet 7 is here:

http://alsa-project.org/db/?f=5500aa1b489d2ef4ee6ac3ee613f11f3ed8ecfa8

This confirms that the codec is different, so I've asked
@nikitashvets to test the below patch you suggested and
he has confirmed that this fixes things (thank you @nikitashvets).

Takashi, if you can turn this into a proper patch (-series?)
and merge it that would be great!

Regards,

Hans





> 
> 
> Takashi
> 
> -- 8< --
> diff --git a/sound/pci/hda/hda_auto_parser.c b/sound/pci/hda/hda_auto_parser.c
> index cd1db943b7e0..7c6b1fe8dfcc 100644
> --- a/sound/pci/hda/hda_auto_parser.c
> +++ b/sound/pci/hda/hda_auto_parser.c
> @@ -819,7 +819,7 @@ static void set_pin_targets(struct hda_codec *codec,
>  		snd_hda_set_pin_ctl_cache(codec, cfg->nid, cfg->val);
>  }
>  
> -static void apply_fixup(struct hda_codec *codec, int id, int action, int depth)
> +void __snd_hda_apply_fixup(struct hda_codec *codec, int id, int action, int depth)
>  {
>  	const char *modelname = codec->fixup_name;
>  
> @@ -829,7 +829,7 @@ static void apply_fixup(struct hda_codec *codec, int id, int action, int depth)
>  		if (++depth > 10)
>  			break;
>  		if (fix->chained_before)
> -			apply_fixup(codec, fix->chain_id, action, depth + 1);
> +			__snd_hda_apply_fixup(codec, fix->chain_id, action, depth + 1);
>  
>  		switch (fix->type) {
>  		case HDA_FIXUP_PINS:
> @@ -870,6 +870,7 @@ static void apply_fixup(struct hda_codec *codec, int id, int action, int depth)
>  		id = fix->chain_id;
>  	}
>  }
> +EXPORT_SYMBOL_GPL(__snd_hda_apply_fixup);
>  
>  /**
>   * snd_hda_apply_fixup - Apply the fixup chain with the given action
> @@ -879,7 +880,7 @@ static void apply_fixup(struct hda_codec *codec, int id, int action, int depth)
>  void snd_hda_apply_fixup(struct hda_codec *codec, int action)
>  {
>  	if (codec->fixup_list)
> -		apply_fixup(codec, codec->fixup_id, action, 0);
> +		__snd_hda_apply_fixup(codec, codec->fixup_id, action, 0);
>  }
>  EXPORT_SYMBOL_GPL(snd_hda_apply_fixup);
>  
> diff --git a/sound/pci/hda/hda_local.h b/sound/pci/hda/hda_local.h
> index aca592651870..682dca2057db 100644
> --- a/sound/pci/hda/hda_local.h
> +++ b/sound/pci/hda/hda_local.h
> @@ -348,6 +348,7 @@ void snd_hda_apply_verbs(struct hda_codec *codec);
>  void snd_hda_apply_pincfgs(struct hda_codec *codec,
>  			   const struct hda_pintbl *cfg);
>  void snd_hda_apply_fixup(struct hda_codec *codec, int action);
> +void __snd_hda_apply_fixup(struct hda_codec *codec, int id, int action, int depth);
>  void snd_hda_pick_fixup(struct hda_codec *codec,
>  			const struct hda_model_fixup *models,
>  			const struct snd_pci_quirk *quirk,
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index a1a7842e7b5f..f2b0de3aa756 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -7004,6 +7004,7 @@ enum {
>  	ALC287_FIXUP_LEGION_15IMHG05_SPEAKERS,
>  	ALC287_FIXUP_LEGION_15IMHG05_AUTOMUTE,
>  	ALC287_FIXUP_YOGA7_14ITL_SPEAKERS,
> +	ALC298_FIXUP_LENOVO_C940_DUET7,
>  	ALC287_FIXUP_13S_GEN2_SPEAKERS,
>  	ALC256_FIXUP_SET_COEF_DEFAULTS,
>  	ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE,
> @@ -7022,6 +7023,23 @@ enum {
>  	ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE,
>  };
>  
> +/* A special fixup for Lenovo C940 and Yoga Duet 7;
> + * both have the very same PCI SSID, and we need to apply different fixups
> + * depending on the codec ID
> + */
> +static void alc298_fixup_lenovo_c940_duet7(struct hda_codec *codec,
> +					   const struct hda_fixup *fix,
> +					   int action)
> +{
> +	int id;
> +
> +	if (codec->core.vendor_id == 0x10ec0298)
> +		id = ALC298_FIXUP_LENOVO_SPK_VOLUME; /* C940 */
> +	else
> +		id = ALC287_FIXUP_YOGA7_14ITL_SPEAKERS; /* Duet 7 */
> +	__snd_hda_apply_fixup(codec, id, action, 0);
> +}
> +
>  static const struct hda_fixup alc269_fixups[] = {
>  	[ALC269_FIXUP_GPIO2] = {
>  		.type = HDA_FIXUP_FUNC,
> @@ -8721,6 +8739,10 @@ static const struct hda_fixup alc269_fixups[] = {
>  		.chained = true,
>  		.chain_id = ALC269_FIXUP_HEADSET_MODE,
>  	},
> +	[ALC298_FIXUP_LENOVO_C940_DUET7] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc298_fixup_lenovo_c940_duet7,
> +	},
>  	[ALC287_FIXUP_13S_GEN2_SPEAKERS] = {
>  		.type = HDA_FIXUP_VERBS,
>  		.v.verbs = (const struct hda_verb[]) {
> @@ -9274,7 +9296,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x17aa, 0x31af, "ThinkCentre Station", ALC623_FIXUP_LENOVO_THINKSTATION_P340),
>  	SND_PCI_QUIRK(0x17aa, 0x3802, "Lenovo Yoga DuetITL 2021", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
>  	SND_PCI_QUIRK(0x17aa, 0x3813, "Legion 7i 15IMHG05", ALC287_FIXUP_LEGION_15IMHG05_SPEAKERS),
> -	SND_PCI_QUIRK(0x17aa, 0x3818, "Lenovo C940", ALC298_FIXUP_LENOVO_SPK_VOLUME),
> +	SND_PCI_QUIRK(0x17aa, 0x3818, "Lenovo C940 / Yoga Duet 7", ALC298_FIXUP_LENOVO_C940_DUET7),
>  	SND_PCI_QUIRK(0x17aa, 0x3819, "Lenovo 13s Gen2 ITL", ALC287_FIXUP_13S_GEN2_SPEAKERS),
>  	SND_PCI_QUIRK(0x17aa, 0x3820, "Yoga Duet 7 13ITL6", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
>  	SND_PCI_QUIRK(0x17aa, 0x3824, "Legion Y9000X 2020", ALC285_FIXUP_LEGION_Y9000X_SPEAKERS),
> 

