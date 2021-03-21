Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFEE343331
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Mar 2021 16:34:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAD1D829;
	Sun, 21 Mar 2021 16:33:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAD1D829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616340875;
	bh=eS+zn36fisUxN2CLQ0nlYpmOFh+jtUVrCL40sXFd93U=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fk0pI/kHJrEPSD+IyWfXhgNmphgs+1WobqfczRon5ZAwFlUB7XlCZzEDqvm+9YB62
	 kPpdwgUM8b1bycmPvlkVI1QwZUJbfKyi9OiKoxMJiF2EGRy7cjgOZt3jjlt7OL9DCE
	 oYtITbrArp8D93qFC58MpzCeikXQk4VIQSuA1NIc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAEC7F80257;
	Sun, 21 Mar 2021 16:33:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCFB8F80254; Sun, 21 Mar 2021 16:33:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B5FEF80155
 for <alsa-devel@alsa-project.org>; Sun, 21 Mar 2021 16:33:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B5FEF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jmsLkopr"
Received: by mail-pl1-x632.google.com with SMTP id k4so5266120plk.5
 for <alsa-devel@alsa-project.org>; Sun, 21 Mar 2021 08:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=r0U+DE5qJnTQ3kRfYyrwXQg8XIU2gEf2QfD79ym1R0w=;
 b=jmsLkoprnq3UaqjBElrMeEuK8b4+TsJRFDQRTuxjudHG8ZID8h/sUFgSLHhsUE+dgT
 aDJy6OGfmHm8O8vrryASEbyTR230Eu/ceEgEF8wBvf4KA9MdDulPIa4RqQX+6jmnkdbf
 wn+b4uP7sgBa+ai4nY9mSb5qlLNoNrKiNcjDD6pphq8lhmjaCDVQFAFfLHS06GDpctu/
 bzqDjObi+vSqI2Plsp5B0zsd4JyKxuHP+BCeHI/LNw0PEwHBvMBUGGodcZrLqxEy+f1d
 YbZhth/fpLtxiXm0p1YDU2YDd+NKoAGOoqdfRDxvqBP7D8+CRw0jECqWe0M7eHzEc49y
 cLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r0U+DE5qJnTQ3kRfYyrwXQg8XIU2gEf2QfD79ym1R0w=;
 b=EDUFFjtLuAGuCCdGAI/p8ozlXfbSABpDXnwsgR/fHQKZ2fC9kj3Sifm4goVhwqVRhe
 iDh4RCZJbPVGV9vyhRyJa5KfCMkA+yR5dfFzplfQ8/7O87h+mGj2XsL2WSu2UOVcJVLZ
 Rtpo8Mfryj0McSO2KddEHHKasGRyvAUKsS4Sn+yDgngtir6dUifdkwL4Trnp+gO1WcTg
 ZdNjujp91rvDRsSFQ+1By0FBXSVostyZ5DmD0Glks4+vZi2SydjIe9uKCCh8d6X1eruc
 V0NRQF0i6IoEB33ltuTS0d6vWAMeMKWE/RiIMCucf0E0w09E2Dndv9snKXBzwcfV72tX
 e7gA==
X-Gm-Message-State: AOAM532MyJ7i/S4qh6spjiTPVH0ZQedpSVpVvKEk89MFBqcKPQmjgQgA
 3x5WOcLlDmQn8++yngCmtOA=
X-Google-Smtp-Source: ABdhPJy2FjTJgTxZ6mjw3gj3pZU3EwRWc+4AKQqVeap+HoBd1ehxo6/2TdsRbKI/UOdAuBL8dlNxzQ==
X-Received: by 2002:a17:902:7407:b029:e4:9645:fdf6 with SMTP id
 g7-20020a1709027407b02900e49645fdf6mr23266820pll.19.1616340780571; 
 Sun, 21 Mar 2021 08:33:00 -0700 (PDT)
Received: from [0.0.0.0] ([38.84.76.15])
 by smtp.gmail.com with ESMTPSA id d14sm11184315pji.22.2021.03.21.08.32.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Mar 2021 08:33:00 -0700 (PDT)
Subject: Re: [PATCH v4 1/2] platform/x86: dell-privacy: Add support for Dell
 hardware privacy
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "Yuan, Perry" <Perry.Yuan@dell.com>,
 "pobrn@protonmail.com" <pobrn@protonmail.com>,
 "oder_chiou@realtek.com" <oder_chiou@realtek.com>,
 "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "mgross@linux.intel.com" <mgross@linux.intel.com>,
 "Limonciello, Mario" <Mario.Limonciello@dell.com>
References: <20210301093753.16300-1-Perry_Yuan@Dell.com>
 <551e30d2-0211-f3cb-fbb8-ee5b2f22a851@linux.intel.com>
 <SJ0PR19MB4528E7C88C955D2EE96CE3B484939@SJ0PR19MB4528.namprd19.prod.outlook.com>
 <ab14a0b2-3f3a-3796-8baf-76e635d82340@linux.intel.com>
From: Perry Yuan <perry979106@gmail.com>
Message-ID: <58d2e2f2-e552-6ecf-b1c3-bf38ad5d2e35@gmail.com>
Date: Sun, 21 Mar 2021 23:32:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <ab14a0b2-3f3a-3796-8baf-76e635d82340@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
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

Hi Pierre:
Thanks for your review!
On 2021/3/8 23:59, Pierre-Louis Bossart wrote:
> 
> 
> 
>>>>    module_param(force_rfkill, bool, 0444);
>>>>    MODULE_PARM_DESC(force_rfkill, "enable rfkill on non whitelisted
>>>> models");
>>>>
>>>> +
>>>
>>> spurious line change
>> I just want to make them separate with more space .
>> If it cause concern, I will remote the line in V5.
> 
> it's fine to improve spaces/alignment, just do it in a separate patch.
> 
>>
>>>
>>>>    static const struct dmi_system_id dell_device_table[] __initconst 
>>>> = {
>>>>        {
>>>>            .ident = "Dell laptop",
>>>> @@ -2205,11 +2209,17 @@ static int __init dell_init(void)
>>>>        dell_laptop_register_notifier(&dell_laptop_notifier);
>>>>
>>>>        if (dell_smbios_find_token(GLOBAL_MIC_MUTE_DISABLE) &&
>>>> -        dell_smbios_find_token(GLOBAL_MIC_MUTE_ENABLE)) {
>>>> -        micmute_led_cdev.brightness =
>>> ledtrig_audio_get(LED_AUDIO_MICMUTE);
>>>> -        ret = led_classdev_register(&platform_device->dev,
>>> &micmute_led_cdev);
>>>> -        if (ret < 0)
>>>> -            goto fail_led;
>>>> +
>>>     dell_smbios_find_token(GLOBAL_MIC_MUTE_ENABLE)) {
>>>
>>> not sure why you changed the alignment?
>> The previous alignment is a little not correct.
>> So I adjust it
>> If it cause concern, will restore it to original shape.
> 
> same here, use a different patch.
> 
As you suggested,I should add the alignment change in another patch.
But if i keep the old alignment, the code will be very odd.
Seems like that I have to change the below code to new alignment in this 
patch.

if (dell_smbios_find_token(GLOBAL_MIC_MUTE_DISABLE) &&
     dell_smbios_find_token(GLOBAL_MIC_MUTE_ENABLE)) { <<--- changed back
	if (!privacy_valid)
	    	has_privacy = true;
	else
	    	has_privacy = false;
	if (!has_privacy) {
		micmute_led_cdev.brightness <<----------- new alignment
		...
	}
...
}


