Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D1D3494F1
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 16:09:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C4F11669;
	Thu, 25 Mar 2021 16:08:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C4F11669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616684941;
	bh=Jx4wywouPi4A70kxLD7IC8dI7TSlEJn16vms0lwZ5ZE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mqhR9BluDHk/NQvl1YAPWspBDOAkrQdOSAiAFYjVQnd1HnNNxzgQTwWquTJpcfUk4
	 URxbbq0s4AWRhistqNUP9x7xHF81EgJuboZF39nSlHD2lA8PEN3sAcg6NmZbyZ3OU2
	 KmEguQlNJmX8VaTEMuwvUTm1hHAipUjcymXvJaqE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DE93F80103;
	Thu, 25 Mar 2021 16:07:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00A5FF80103; Thu, 25 Mar 2021 16:07:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33587F80103
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 16:07:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33587F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="X9/PomG8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616684844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sdW+h3VAQThOQw07Y6OKhgA+HyJmyOTTSfSPPcXsFkY=;
 b=X9/PomG8yFZQk/32HmrbwMgp/AMeW4EF//uRfVn58AfG2vVpqdCNbyl/mChHJ9ooww1wpD
 1CPvKlhfhX6AQoovgmgh6p1SkGhLAZEBG4zAXy3VC0CB2wni0C90VE8b3zWpIF9wfNkenT
 ymJA/5tuodIt43XojPZrncvtaoWShCY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-rKqLnuhCMZGfnFSATcVP6g-1; Thu, 25 Mar 2021 11:07:17 -0400
X-MC-Unique: rKqLnuhCMZGfnFSATcVP6g-1
Received: by mail-ej1-f71.google.com with SMTP id h14so2700746ejg.7
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 08:07:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sdW+h3VAQThOQw07Y6OKhgA+HyJmyOTTSfSPPcXsFkY=;
 b=T8/In6CFCrUmKcaGt1MYIfy4JSbTN4WLxFYB89+B8zExvCnkZPENUl22sJAaKlaytR
 ffGv0Hes88utJd4bcBDj2xbGAQxVlWutAAKXOeW5Z32G9MqfRStNXjZ45+TV37iLGtI5
 MwKoYTGi05aXqWLpK+zOzjQwASioSEDQ0B3d/5HdaXSd5ikbYHhP3b+VGu4W90FrvYK5
 dXskx1EzXPXa/uQC42Ad9CmWfYJCAYSDiksx1x6yiKBH8U16pW0Rh3BsvFTDoSUejyws
 jViau6xU/dO/Xv9pFjG9YFXvV4PWwwQDfudsaq9Chk3igJWxx/KTnK3+Y7sDXFMzGKXG
 jYLg==
X-Gm-Message-State: AOAM532E+48YGB8tsPNoXyVh3/pR4YYtPWr0a5L2KY7SRn1Unt0GHP+h
 cfGdb7kfS3Z9gtc0yaDFCEPJyIN60DCdq1mHU/3D/6FVwcNtv7LtAryTs//blQt66kkV5xXxDoo
 5A/op1o1+fnw1Y2CZWQT4hl4=
X-Received: by 2002:aa7:cb97:: with SMTP id r23mr9506803edt.106.1616684835558; 
 Thu, 25 Mar 2021 08:07:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydmbo8ZKmhunzAF9C+bbWnixIH0gXNfgg9UZR6Jx+UkTqtnCZVem1uAMv94NPAhu43ZR44SA==
X-Received: by 2002:aa7:cb97:: with SMTP id r23mr9506770edt.106.1616684835320; 
 Thu, 25 Mar 2021 08:07:15 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id oy8sm2537376ejb.58.2021.03.25.08.07.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 08:07:14 -0700 (PDT)
Subject: Re: [PATCH v4 2/2] ASoC: rt715:add micmute led state control supports
To: "Yuan, Perry" <Perry.Yuan@dell.com>, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>, "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "Limonciello, Mario" <Mario.Limonciello@dell.com>
References: <20210301093834.19524-1-Perry_Yuan@Dell.com>
 <20210308172409.GF4656@sirena.org.uk>
 <SJ0PR19MB4528847687FEEE4A4DED8E3F84659@SJ0PR19MB4528.namprd19.prod.outlook.com>
 <604693cc-08c7-2b5f-632a-58ed537c54a0@perex.cz>
 <5cad3045-7948-3282-c999-926095818d5f@redhat.com>
 <SJ0PR19MB452851406C9B48DE688F1C1384629@SJ0PR19MB4528.namprd19.prod.outlook.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <11d7916c-5e8a-f3a2-5906-ed007ed146a3@redhat.com>
Date: Thu, 25 Mar 2021 16:07:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <SJ0PR19MB452851406C9B48DE688F1C1384629@SJ0PR19MB4528.namprd19.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "oder_chiou@realtek.com" <oder_chiou@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "mgross@linux.intel.com" <mgross@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "pobrn@protonmail.com" <pobrn@protonmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
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

On 3/25/21 3:11 PM, Yuan, Perry wrote:
> Hi Hans
> 
>> -----Original Message-----
>> From: Hans de Goede <hdegoede@redhat.com>
>> Sent: Monday, March 22, 2021 11:02 PM
>> To: Jaroslav Kysela; Yuan, Perry; Mark Brown; pierre-
>> louis.bossart@linux.intel.com; Limonciello, Mario
>> Cc: pobrn@protonmail.com; oder_chiou@realtek.com; tiwai@suse.com;
>> mgross@linux.intel.com; lgirdwood@gmail.com; alsa-devel@alsa-project.org;
>> linux-kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org
>> Subject: Re: [PATCH v4 2/2] ASoC: rt715:add micmute led state control
>> supports
>>
>>
>> [EXTERNAL EMAIL]
>>
>> Hi,
>>
>> On 3/22/21 3:37 PM, Jaroslav Kysela wrote:
>>> Dne 22. 03. 21 v 10:25 Yuan, Perry napsal(a):
>>>> Hi Mark:
>>>>
>>>>> -----Original Message-----
>>>>> From: Mark Brown <broonie@kernel.org>
>>>>> Sent: Tuesday, March 9, 2021 1:24 AM
>>>>> To: Yuan, Perry
>>>>> Cc: pobrn@protonmail.com; pierre-louis.bossart@linux.intel.com;
>>>>> oder_chiou@realtek.com; perex@perex.cz; tiwai@suse.com;
>>>>> hdegoede@redhat.com; mgross@linux.intel.com; Limonciello, Mario;
>>>>> lgirdwood@gmail.com; alsa-devel@alsa-project.org; linux-
>>>>> kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org
>>>>> Subject: Re: [PATCH v4 2/2] ASoC: rt715:add micmute led state
>>>>> control supports
>>>>>
>>>>> On Mon, Mar 01, 2021 at 05:38:34PM +0800, Perry Yuan wrote:
>>>>>
>>>>>> +	/* Micmute LED state changed by muted/unmute switch */
>>>>>> +	if (mc->invert) {
>>>>>> +		if (ucontrol->value.integer.value[0] || ucontrol-
>>>>>> value.integer.value[1]) {
>>>>>> +			micmute_led = LED_OFF;
>>>>>> +		} else {
>>>>>> +			micmute_led = LED_ON;
>>>>>> +		}
>>>>>> +		ledtrig_audio_set(LED_AUDIO_MICMUTE, micmute_led);
>>>>>> +	}
>>>>>
>>>>> These conditionals on inversion seem weird and counterintuitive.  If
>>>>> we're going with this approach it would probably be clearer to
>>>>> define a custom operation for the affected controls that wraps the
>>>>> standard one and adds the LED setting rather than keying off invert like
>> this.
>>>>
>>>> Currently the sof soundwire driver has no generic led control yet.
>>>> This patch can handle the led control needs for MIC mute LED, definitely
>> the patch is a short term solution.
>>>> There is a feature request discussion when we started to implement this
>> solution.
>>>> https://github.com/thesofproject/linux/issues/2496#issuecomment-
>> 71389
>>>> 2620
>>>>
>>>> The workable way for now is that we put the LED mute control to the
>> codec driver.
>>>> When there is new and full sound LED solution implemented, this part will
>> be also optimized.
>>>> The Hardware privacy feature needs this patch to handle the Mic mute led
>> state change.
>>>> Before that full solution ready in kernel, could we take this as short term
>> solution?
>>>
>>> Perry, it's about the machine detection. Your code is too much generic
>>> even for the top-level LED trigger implementation. We need an extra
>>> check, if the proper LED's are really controlled on the specific
>>> hardware. Other hardware may use RT715 for a different purpose. Use
>>> DMI / ACPI checks to detect this hardware and don't misuse the inversion
>> flag to enable this code.
>>
>> I think this would be a goo candidate for the new generic LED handling:
>>
>> https://lore.kernel.org/alsa-devel/20210317172945.842280-1-
>> perex@perex.cz/
>>
>> And then use a udev-rule + hwdb and/or UCM profiles to configure the LED
>> trigger for specific models from userspace ?
>>
>> Regards,
>>
>> Hans
>>
>>
>>
> Because the SOF SDW design has no mic mute led control yet.
> So I add one short term solution to make Dell privacy working for now 
> Definitely , that is new solution I can add my patch on that to test as one user case .
> We really need to take the short term solution work for some system which support new SOF soundwire hardware which have  dependence on the MIC mute feature
> Meanwhile we can continue working on the new  "udev-rule + hwdb and/or UCM profiles" solution as to replace this one.
> If we agree that, I will submit another V6 addressing new feedback. 

The triggering of the LED trigger and the code registering the led_classdev
are in 2 separate subsystems; and should be merged separately.

If you post a new version of patch 1/2 addressing my review remarks then
I can merge that.

For merging the sound side of this you need to talk to the sound folks
(Jaroslav Kysela, Takashi Iwai, Mark Brown for files under sound/soc).

Regards,

Hans

