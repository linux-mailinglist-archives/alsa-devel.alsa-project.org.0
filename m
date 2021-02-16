Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F80731CCC5
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Feb 2021 16:17:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E7951667;
	Tue, 16 Feb 2021 16:16:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E7951667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613488659;
	bh=hVkGkoE6N68LUgzMf2fZ7s9Stut+cE4Zo00Bv3pqH7M=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IFoJd0C6I81GqdtLsqZobLhz0kKraUjSLsvN9PXoqqspBKr320b7VMcLygs2i+C+j
	 uGoZeKBICl1y/sG0jzfyKiML5soatgNBiylXsH25io2plI/msW30XiTxB8+lD9fgMx
	 /cBpVTjYq05GqIEsf1wVoYaKFqoeuw2dMUlXd+hE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D28A5F80059;
	Tue, 16 Feb 2021 16:16:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84145F8015A; Tue, 16 Feb 2021 16:16:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15AF6F80059
 for <alsa-devel@alsa-project.org>; Tue, 16 Feb 2021 16:16:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15AF6F80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="g7mLsPet"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613488562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gBbEIRIxZ5LEiwRwYtYE0Dp5R2WloZzDS9tJl6kfcgA=;
 b=g7mLsPetIlq2s+5O6Oz1bmXlBsTu9WlBu/LKcAnZrsySE474B2QRFQiLIgdabNjuZOtQiY
 lXpj0+aB7UugzIiLjVzpzCE5eZHxwObaaX3a3cplnPyFz/t9XZcZBOPjaodtYVJQdmK9tL
 hgJ4OuT1456gvoAKHZEAG5qb0QgR+4A=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-5yAp7NXhPMamhFS9dA8_8g-1; Tue, 16 Feb 2021 10:15:58 -0500
X-MC-Unique: 5yAp7NXhPMamhFS9dA8_8g-1
Received: by mail-ej1-f69.google.com with SMTP id yd12so951729ejb.9
 for <alsa-devel@alsa-project.org>; Tue, 16 Feb 2021 07:15:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gBbEIRIxZ5LEiwRwYtYE0Dp5R2WloZzDS9tJl6kfcgA=;
 b=IsANCafwv3aeK+rE4EWmVZ92zfdnsGXmgYCCXDol1XdUjMeVP/Sk4YTAX2reJxQ0vL
 AF/S8Z3K8h6UIjH1tVurwsB/eXKdl51PNTHmV1yn59fQ+NhzDdsCdA3hG1nTMbBp1IRS
 GNL1iHSg8dH6E4afz9+hc0Z2nIaIZYI/vg4MDYx8hERLvcYa7Eb2STZhHumr+3cLSXaF
 7LLnHbmfItFmoyb63B32BDRjHshkPWW9U6Kx5DYSjrzbyibNbkLOPxeAm/qlJ+vUeNZo
 M0BGl8j+7UoIVhKADvl90rwgrbW2OnnprzHqhWl8d5MvrdopkpnkPJaJypX+rP7Ifs3M
 TXjQ==
X-Gm-Message-State: AOAM5302GCJf11g62POIQ2UOlLEa8jgS03K4xFHoGgLdif8xXjKsbAnr
 Spy3rhRATr92MnhDZXMwwR9xTP/oW2BzpbOxTPBMpp3jVNVREzz7Pm8GiunhS/uUyJ/Um2HsI8U
 hAg1xy9Ka4Wt3pUwBqnzXEJ1Nilcj75qqwodBecmetqw+s9cmJi16tcWZR7vAOxxMZbYa6BktMp
 Q=
X-Received: by 2002:aa7:cc98:: with SMTP id p24mr21978983edt.126.1613488556838; 
 Tue, 16 Feb 2021 07:15:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4Bti6sBhlXUzmBeByj3nYfLwozHwWMlgVRxAquS/tk3Ziw6BMluqrDzi44yPBjPpqbVCMlg==
X-Received: by 2002:aa7:cc98:: with SMTP id p24mr21978960edt.126.1613488556689; 
 Tue, 16 Feb 2021 07:15:56 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id o16sm4166923edt.83.2021.02.16.07.15.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Feb 2021 07:15:56 -0800 (PST)
Subject: Re: [PATCH 2/4] ASoC: rt5670: Remove 'HP Playback Switch' control
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Oder Chiou <oder_chiou@realtek.com>
References: <20210215142118.308516-1-hdegoede@redhat.com>
 <20210215142118.308516-3-hdegoede@redhat.com>
 <d3eb3192-851b-3d18-269a-725d74256010@perex.cz>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <294813c9-b417-a632-997d-0b81bad94dbe@redhat.com>
Date: Tue, 16 Feb 2021 16:15:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <d3eb3192-851b-3d18-269a-725d74256010@perex.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Bard Liao <bard.liao@intel.com>
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

On 2/15/21 7:09 PM, Jaroslav Kysela wrote:
> Dne 15. 02. 21 v 15:21 Hans de Goede napsal(a):
>> The RT5670_L_MUTE_SFT and RT5670_R_MUTE_SFT bits (bits 15 and 7) of the
>> RT5670_HP_VOL register are set / unset by the headphones deplop code
>> run by rt5670_hp_event() on SND_SOC_DAPM_POST_PMU / SND_SOC_DAPM_PRE_PMD.
>>
>> So we should not also export a control to userspace which toggles these
>> same bits.
> 
> I think that it may be worth to preserve the full-mute functionality.
> According the datasheet, the register 0x02 has volume range -46.5dB..12dB.
> Even the lowest volume may produce an audible output.
> 
> I would cache the mute switch value in rt5670_priv and update the
> POST_PMU/PRE_PMD code to use this settings.

Yes that should work.

Note though that patch 4/4 adds a mute for the master volume control, even
though I call it an "emulated" mute it is a full mute, it is just that
we now have 2 switches, 1 mixer switch and 1 mute switch, which must
both be true before we enable the path from the DAC through the mixer
which sits directly behind the "DAC1 Playback Volume" control.

And we need that mute anyways because the speaker output does not
have any volume control other then the master "DAC1 Playback Volume"
which has the same issue of only going very soft and not going to
a full mute.

So since we have a working mute in the master volume control, we don't
really need one for the "HP Playback Volume" control. with that all said,
your suggestion should work fine.

So the question is do we want to do as you suggest, or are we happy
with just having the master mute ?

Note I'm fine doing things either way I just wanted to ask before
spending time on implementing and testing your suggestion. Esp. the
testing which often seems to take at least as much time as actually
implementing things...

So if you can let me know how you want to proceed then I'll get
right to it.

Regards,

Hans

