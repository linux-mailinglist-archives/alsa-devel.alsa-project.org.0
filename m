Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0591D17B84D
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Mar 2020 09:27:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91EAB828;
	Fri,  6 Mar 2020 09:27:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91EAB828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583483272;
	bh=ZzDZdtpWkxebyJDINyq5iS7IBkVQW5yF/nXM7wNEAFA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mIa27zV7xuUZEkl3Qs+Xz+Ao6XyWKCDBVYB/i3veC3UaTz9kbjFquZbo758pL73ub
	 QhD2xyt756wqjtelrAc7Y0QX1WBHKPg4B2aE/qdCAnnJT28qggzCXl5CKMpZUw1QV7
	 AHklSkXdEQzq2OoMGItIE3Xn2PovkXs67Qi79Prk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E242F801F5;
	Fri,  6 Mar 2020 09:26:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08E71F801ED; Fri,  6 Mar 2020 09:26:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1AB6AF8012D
 for <alsa-devel@alsa-project.org>; Fri,  6 Mar 2020 09:25:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AB6AF8012D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="di5Wh3Dy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583483155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7q1rexrC52afNRHxFz0+gkt+WasYgXGpKFqphBUUNOw=;
 b=di5Wh3DywDFCV8obRZ09eLc3QuM8sDaikDGLxfgwjsgUjb+MP2LFwwsAmnhl5Jxz5suvOv
 ObwNjyaH2wBBHtEQ/NyKgGAzH7ZxLjXL45cB5ApNmFOn/M8CX3CwWFvMRc4CyFCBPSkPH9
 QfAJi2Kko4AH6/uH0KfvnYPYzTVn9yY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-hyfaXp0BNZ6yizvGOm4WLA-1; Fri, 06 Mar 2020 03:25:54 -0500
X-MC-Unique: hyfaXp0BNZ6yizvGOm4WLA-1
Received: by mail-wm1-f69.google.com with SMTP id m4so588804wmi.5
 for <alsa-devel@alsa-project.org>; Fri, 06 Mar 2020 00:25:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7q1rexrC52afNRHxFz0+gkt+WasYgXGpKFqphBUUNOw=;
 b=sRTLr+ZTYsO64BxwASx53kDxqWygPGD+ihkK1hhPetBWy/0QRZHu3EMv8MoJ0bsV/t
 yqBkOc8gAiaOb6L4oChTx4s9G7DV78tuYCKs1ztjQF72nMRTRUWU/uA0uwYi25KPm4F4
 uoFkbaqBtZ8GD5xd1e6bK7rPdO95rKcqqilV4D2PIGzcY9CRhdPyut6+6KJhnec8jc0S
 z+MwByleyE6zK+NRknwzUoPMbteF5HXrhOg2IlZHjk8zQ77lnJmop6hSmKHaa7RHVorb
 WzVg/pI422JxKkhzleGYvBFQNsBtcTMGTAjAHnbub396BjfPyj3KhGavHc6DDqbFa4cU
 Qkog==
X-Gm-Message-State: ANhLgQ30kWgoz/KdM8nTrFvugC5xmY8zS/yEmlWWrsM4y64f20wMYK7b
 HiPM+Ju9+jVsqahInQg3io1nyqOpOSHHjKR96a2jIqFawSkklFGqBFkL63SJdPlPWmqPHPqpLdg
 I5ufZbrNKmxDBPRPpayAlZb8=
X-Received: by 2002:a7b:c5c2:: with SMTP id n2mr589941wmk.18.1583483152602;
 Fri, 06 Mar 2020 00:25:52 -0800 (PST)
X-Google-Smtp-Source: ADFU+vsTPYIq7OX0REkp7a2QKVHJnJ4Fcr0KBJVqwCsqCdijeV6FYHSic07iCapQ0j4jLZCfzkaZug==
X-Received: by 2002:a7b:c5c2:: with SMTP id n2mr589923wmk.18.1583483152343;
 Fri, 06 Mar 2020 00:25:52 -0800 (PST)
Received: from x1.localdomain ([109.38.141.242])
 by smtp.gmail.com with ESMTPSA id 25sm12616463wmg.30.2020.03.06.00.25.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Mar 2020 00:25:51 -0800 (PST)
Subject: Re: Automatically switching snd_hda_intel.power_save value when
 switching from battery to ac ?
To: Takashi Iwai <tiwai@suse.de>
References: <2ea1d6fe-aec6-71bc-3716-ae851fbfaa9f@redhat.com>
 <s5hr1y5eww0.wl-tiwai@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <88cbe1bd-5e47-6045-6b7a-2b090361797e@redhat.com>
Date: Fri, 6 Mar 2020 09:25:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <s5hr1y5eww0.wl-tiwai@suse.de>
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

On 3/6/20 8:59 AM, Takashi Iwai wrote:
> On Thu, 05 Mar 2020 15:33:04 +0100,
> Hans de Goede wrote:
>>
>> Hi,
>>
>> Because of a bug-report about power-saving related plops/clocks on a
>> Lenovo T470s, I've asked inside Red Hat if people with a T470s and
>> running a recent kernel were also experiencing this.
>>
>> Most people are happy with the audio, but I did get a few bug reports
>> about plops on the headphones-jack.
>>
>> One of the suggestions which I got from 2 different users is to
>> disable power-saving for the HDA driver when on AC, esp. since most
>> headphones-jack use (esp. with an external amplifier which amplifies
>> the problem) is done while the laptop is sitting on a desk and thus
>> typically is connected to a charger.
>>
>> I'm personally not necessarily a fan of changing settings based
>> on being connected to ac or not, but I guess that in this case
>> it might not be such a bad idea ?
> 
> Actually the power-saving-toggle-on-demand used to be the standard
> behavior by some power management tools including some
> thinkpad-specific one, IIRC.  So the behavior itself isn't too bad if
> the pop noise can't be fully eliminated.

Right, atleast TLP does something like this, and maybe also some of
the Ubuntu pm scripts. But if we are going to do this I would like to
come up with some upstream, non 3th party (from a std gnu/linux
perspective), solution.

Note upstream does not necessarily mean inside the kernel, it could be
e.g. part of systemd, e.g. a udev rule (not sure if that is possible)
or done by some pm suspend/resume hooks which are installed by default
(not sure if systemd's suspend code supports hooks though).

If there is consensus that this is something which is a good idea /
a reasonable thing to do; and also consensus that this should be done
outside the kernel I can take a look at putting together a systemd
pull-req for this.

Regards,

Hans

