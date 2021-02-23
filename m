Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF81F322BD4
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Feb 2021 15:01:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C677F167A;
	Tue, 23 Feb 2021 15:00:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C677F167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614088868;
	bh=gg8fFQas9yuDcX74B1+iQBBZjmRyb1iX0qQq/SlQHeM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dQw7DfVxtDnr+Jn000nbLPw5pgF/CPZLr8R5NfzCUuzABabxmyw7EKwpQ0LKQBfIa
	 1BbddThbsxXZGtuTrKwcYkRCXfa7g/iQ1sxIQQNAwlefuUotORmPzmeKzT2KQ4p8gY
	 +jbBjWUcUJ6sPi1hVOM4dycG4/KwxZwpkIjZWtiM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87A83F8016A;
	Tue, 23 Feb 2021 15:00:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0337CF8016D; Tue, 23 Feb 2021 15:00:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEB73F80169
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 15:00:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEB73F80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Um+g6EyM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614088805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=41E2cd5aY+7OngIqqyAop+dmdMBTECl/P3yYNYWkkQ4=;
 b=Um+g6EyMTh8ZSpnxdCiI3aWqtWG19Lsp846CtS2HfxVB6Odep2MY3EosiKQn/4LDrnr/pl
 CgjPMv0D2UIanzd7YlYoS+umeSZ37v7orsUrtPghwkbDEs85TgICVICG2fFxFyzYSRptqC
 +2c4wnvJV51Eqiymm26RTq6PuFyKMUs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-YgSyZSl8P9uYVrMMM1Qhkg-1; Tue, 23 Feb 2021 08:59:20 -0500
X-MC-Unique: YgSyZSl8P9uYVrMMM1Qhkg-1
Received: by mail-ed1-f72.google.com with SMTP id q1so687749edv.5
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 05:59:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=41E2cd5aY+7OngIqqyAop+dmdMBTECl/P3yYNYWkkQ4=;
 b=OVEJwBkfQDV638BiiszjGTaRshLpNY9W5hA11wOhbVNGLcuQyVGiCR8WdliH8MBLyo
 TIYF8qHKcDNVYI1wn7/ruKrgSfS9ENYZZrb3vQ1EGGfknWVnGy/8nZ8dub+2X7p+Qdp6
 2gKxFU5xu7xl54vs2/cdKndUV+HS9S4Xf0GWzOv8EhTWSTgr450m3zJywEoNDiIDzNTb
 lNAYuZFkbP6j1Bml43DcffdMngssGDw+c7haTE16z0YlbZV1S4W49yQafwRyhjWW6MX/
 fxGEKQxl2yIeB4QssTFjVyz8uN05mZ/893wM+Z/i9UmDgAmcprgOFzWY0K2HGlYVmzpA
 mleg==
X-Gm-Message-State: AOAM532j0fuMw5YwNNMWf/gGQuSlCu7SNKlzKt23UESP3maMfHmhkjVy
 ZrIbSwkQBQq/NGZ0cLJB7onDBP8/KtI6FvA/a6H+gtlDVCzgNhm4TjEbbRdV7twIRPGo4HwcP+s
 Xaued+dcsxS0zlGpzdD6Pg0LCHjyTza/m7BtkHAcjiKvAJDM1HHnHaY4HqRBM1JpIGRn2SBT7f8
 g=
X-Received: by 2002:a17:906:3856:: with SMTP id
 w22mr25950289ejc.77.1614088759152; 
 Tue, 23 Feb 2021 05:59:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzL526NQtgqdQBuFYbtky9iwjF+c/Hup34DClAqUCjyh5Q9yZ8zUhr+NmP29rccFaq/pU1aMg==
X-Received: by 2002:a17:906:3856:: with SMTP id
 w22mr25950266ejc.77.1614088758993; 
 Tue, 23 Feb 2021 05:59:18 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id bz25sm6326731ejc.97.2021.02.23.05.59.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 05:59:18 -0800 (PST)
Subject: Re: [RFC 2/2] ASoC: rt5670: Add LED trigger support
To: Mark Brown <broonie@kernel.org>
References: <20210215142419.308651-1-hdegoede@redhat.com>
 <20210215142419.308651-3-hdegoede@redhat.com>
 <20210223134506.GF5116@sirena.org.uk>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <578b1ee3-f426-c5b5-bc78-5a91108ebdc8@redhat.com>
Date: Tue, 23 Feb 2021 14:59:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210223134506.GF5116@sirena.org.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
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

On 2/23/21 2:45 PM, Mark Brown wrote:
> On Mon, Feb 15, 2021 at 03:24:19PM +0100, Hans de Goede wrote:
> 
>> Add support for controlling a speaker and/or microphone mute LED through
>> LED triggers using the new generic LED trigger module.
> 
>> -	SOC_DOUBLE_EXT("DAC1 Playback Switch", SND_SOC_NOPM, 0, 1, 1, 0,
>> +	SOC_DOUBLE_EXT_ACCESS("DAC1 Playback Switch", SND_SOC_NOPM, 0, 1, 1, 0,
>> +			SNDRV_CTL_ELEM_ACCESS_SPK_LED,
>>  			rt5670_dac1_playback_switch_get, rt5670_dac1_playback_switch_put),
> 
>> -	SOC_DOUBLE("ADC Capture Switch", RT5670_STO1_ADC_DIG_VOL,
>> -		RT5670_L_MUTE_SFT, RT5670_R_MUTE_SFT, 1, 1),
>> +	SOC_DOUBLE_ACCESS("ADC Capture Switch", RT5670_STO1_ADC_DIG_VOL,
>> +			  RT5670_L_MUTE_SFT, RT5670_R_MUTE_SFT, 1, 1,
>> +			  SNDRV_CTL_ELEM_ACCESS_MIC_LED),
> 
> Why just these particular controls - what if a system has separate mutes
> for speakers or something?

These are the main volume controls, which are always in the output / input
path independent on if we are outputting to e.g. speakers or the headphones.

We want to use the main volume control for this, because there always is
only 1 output mute LED and 1 input mute LED. Well at least that is the assumption
the current ledtrig-audio.c code has.

The idea is to only turn the single LED on if we are sure there will be not
sound output on any of the outputs, which is why we tie the LED to the
mute switch on the main volume control.

Regards,

Hans

