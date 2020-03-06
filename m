Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EA317B90C
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Mar 2020 10:13:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52C9D14E;
	Fri,  6 Mar 2020 10:12:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52C9D14E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583485989;
	bh=KNSJPV/XX0dfxIZ7wUWZKmEVCq1PAae65O4FAjKmY/o=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GYvdaVSz7uFgJhnLNF//SruDPRPa8oukSHSXhfzMbeL9lBFplNibQqdc//EwOFkj+
	 1+t/KD3dFEAB9xNnbfebyP32YOlnZm/t3XzgawxpK8UowvEHfy3GTPVJFlWzEidr5j
	 wiC3A4FIgGQRw3PojvutURcMLUX3FSUNACw8xgdA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32BA6F8028C;
	Fri,  6 Mar 2020 10:10:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B19FCF80229; Fri,  6 Mar 2020 10:10:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9F36F801F5
 for <alsa-devel@alsa-project.org>; Fri,  6 Mar 2020 10:10:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9F36F801F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="AiQUfjHp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583485821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EXMCvzcmUjoHMO6vAmg7kROcN076NYlcP76uLGNrouc=;
 b=AiQUfjHpZYjW0tZ9PvRMFMQh+0gzVeWvb0TrWgckTufjcTpMePTGUqlVwDoiu+NS7KvaXw
 ezjA8vpfHzZitQCWXDuOXunlpGDe3/ZzHp704qQvQbvDj55wraFRtkKPk+K4nSoNmzF9HZ
 pwY2VjPD5L82HYsxL/v015vgNLnGS3g=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-wK4yv6ckNlyJg__ncxvYLQ-1; Fri, 06 Mar 2020 04:10:19 -0500
X-MC-Unique: wK4yv6ckNlyJg__ncxvYLQ-1
Received: by mail-wr1-f69.google.com with SMTP id x14so714091wrv.23
 for <alsa-devel@alsa-project.org>; Fri, 06 Mar 2020 01:10:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EXMCvzcmUjoHMO6vAmg7kROcN076NYlcP76uLGNrouc=;
 b=CJz3fUVdhkGTfY4A06k2OnJL+8fHce9wCBNmrpveyiLMFIRapnlwBGnkVKBiyq0U2U
 09msMyqa68eP7zJD+EEhI6+fJIlj11Is/CP+6eILhQLRD2+i81Pw8Zyl65BZmNizPhNn
 1/fw2wXQtWNgMtAyXZjHNRN6cLqKvkgSFqOz/OinlXGwwiKE2Ag1hZLymQ0YxepooAFL
 A6YRmf/zR4imAy/xHqVzrfK8gQXPa82NwD/lsR0V2KSyryoEji/xXCI6ImDrB8adVL4c
 CEBXYNIJFhp8sOyN6V4EJF2zSXw6X9Rid/0GfiHNiHZZ57n5cZ4mpFeoGeaEPepy1ONL
 BUrA==
X-Gm-Message-State: ANhLgQ1WJm00nEZQE5CSGBJB7pxkofppusSIsVFpsQOIkjHvxYA5njSa
 7Bc4USmfoj+qbSO0OZlfpK99dWw5+Q8+EfH0njO2XhoaTH/vUiayslI6FgbaIAA5Nc8z8IrSIZU
 58HhYrplSuSwl16Y2zstLycA=
X-Received: by 2002:a1c:9c96:: with SMTP id f144mr2849046wme.98.1583485818011; 
 Fri, 06 Mar 2020 01:10:18 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtNEFyywGtW0xqihCVEup1VHe1r/NiMu1wjbuvzJiL+AozPNpIfT7g/KHq8VOFKbYoYMYQFCg==
X-Received: by 2002:a1c:9c96:: with SMTP id f144mr2849010wme.98.1583485817754; 
 Fri, 06 Mar 2020 01:10:17 -0800 (PST)
Received: from x1.localdomain ([2a0e:5700:4:11:42c0:3c5d:2f33:1a6c])
 by smtp.gmail.com with ESMTPSA id i7sm2303361wrm.27.2020.03.06.01.10.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Mar 2020 01:10:17 -0800 (PST)
Subject: Re: Automatically switching snd_hda_intel.power_save value when
 switching from battery to ac ?
To: Takashi Iwai <tiwai@suse.de>
References: <2ea1d6fe-aec6-71bc-3716-ae851fbfaa9f@redhat.com>
 <s5hr1y5eww0.wl-tiwai@suse.de>
 <88cbe1bd-5e47-6045-6b7a-2b090361797e@redhat.com>
 <s5hlfodetxy.wl-tiwai@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <4b0bf898-1e71-e2c5-7f17-a0acadc19139@redhat.com>
Date: Fri, 6 Mar 2020 10:10:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <s5hlfodetxy.wl-tiwai@suse.de>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>
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

On 3/6/20 10:03 AM, Takashi Iwai wrote:
> On Fri, 06 Mar 2020 09:25:49 +0100,
> Hans de Goede wrote:
>>
>> Hi,
>>
>> On 3/6/20 8:59 AM, Takashi Iwai wrote:
>>> On Thu, 05 Mar 2020 15:33:04 +0100,
>>> Hans de Goede wrote:
>>>>
>>>> Hi,
>>>>
>>>> Because of a bug-report about power-saving related plops/clocks on a
>>>> Lenovo T470s, I've asked inside Red Hat if people with a T470s and
>>>> running a recent kernel were also experiencing this.
>>>>
>>>> Most people are happy with the audio, but I did get a few bug reports
>>>> about plops on the headphones-jack.
>>>>
>>>> One of the suggestions which I got from 2 different users is to
>>>> disable power-saving for the HDA driver when on AC, esp. since most
>>>> headphones-jack use (esp. with an external amplifier which amplifies
>>>> the problem) is done while the laptop is sitting on a desk and thus
>>>> typically is connected to a charger.
>>>>
>>>> I'm personally not necessarily a fan of changing settings based
>>>> on being connected to ac or not, but I guess that in this case
>>>> it might not be such a bad idea ?
>>>
>>> Actually the power-saving-toggle-on-demand used to be the standard
>>> behavior by some power management tools including some
>>> thinkpad-specific one, IIRC.  So the behavior itself isn't too bad if
>>> the pop noise can't be fully eliminated.
>>
>> Right, atleast TLP does something like this, and maybe also some of
>> the Ubuntu pm scripts. But if we are going to do this I would like to
>> come up with some upstream, non 3th party (from a std gnu/linux
>> perspective), solution.
>>
>> Note upstream does not necessarily mean inside the kernel, it could be
>> e.g. part of systemd, e.g. a udev rule (not sure if that is possible)
>> or done by some pm suspend/resume hooks which are installed by default
>> (not sure if systemd's suspend code supports hooks though).
>>
>> If there is consensus that this is something which is a good idea /
>> a reasonable thing to do; and also consensus that this should be done
>> outside the kernel I can take a look at putting together a systemd
>> pull-req for this.
> 
> I have a mixed feeling about introducing it in standard.
> The power-saving itself is always good no matter whether it's cabled
> or not, it's merely a workaround for the problem that couldn't be
> fully fixed in kernel side.  So it was provided as an option for users
> who really need it.  But it's certainly a feasible option.

Ok, I have mixed feelings about this myself too, so I'll refrain
from trying to do a standard implementation of this then.

> OTOH, I still wonder about the cause of the noise on Thinkpad.  In
> general, if that comes from the codec power down (the Realtek one),
> it's usually fixable in a certain level.  Or if it's at the power down
> of the link (power_save_controller option), it's often hard and we
> keep the blacklist.

According to the reports which I have (I got quite a bit of feedback
when asking about T470s audio plops on an internal mailinglist) things
are fine for most users. The few users who do have issues are all hearing
the plops on the headphones. IIRC I had 2 clear reports about this and
maybe, do not remember. One of the clear reports deemed the plops as
audible but acceptable (using actual wired headphones) and one deemed
them unacceptable. The reporter who had a real issue with the plops on
the headphones was using an external amplifier hooked up to the
headphones jacks, amplifying the plops.

Since it is only on the headphones jack I think it is a codec issue,
if you can take a look at it that would be great, but otherwise I
believe that we can live with this (and the user with the external
amplifier can overrule the default value for the module option).

Regards,

Hans

