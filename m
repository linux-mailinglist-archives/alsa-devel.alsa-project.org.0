Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E13A9F5B6F
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Nov 2019 23:56:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E3F415E2;
	Fri,  8 Nov 2019 23:55:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E3F415E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573253771;
	bh=LqdtgrJeltJW7dPkBa6iXF3fT8rYRvmgWV6xLmhjhSc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N5/rHUjCiE6QKshpow+F8rpPp6QlItMHsk3mEW8PInqsc2BoaTdA+npn7LNym5Pwm
	 PkSwgYJ/Kgp0mJorLMHuutvUv7ERT2eKl/fk+IZ76NZsh68Wp0TmSlP+5rGt/Puqre
	 qRMi7PyyFnohWCpZAe0e4uWGFVnFHPHhlxCCpVls=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2723AF8045F;
	Fri,  8 Nov 2019 23:54:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CA51F80111; Fri,  8 Nov 2019 23:52:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06F2DF80111
 for <alsa-devel@alsa-project.org>; Fri,  8 Nov 2019 23:51:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06F2DF80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Y8sUcXRB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573253512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tuigzR7KqJvNGjlF/XpuQ/aD5RxRIXEG/lZm5xEAOwQ=;
 b=Y8sUcXRBlXj/3EsORZjAk3rPEm2p1Ne28EUqaZNssnbgFEgX+CXI3gZgDFmaGfFt6p+OeN
 smGlH9zvEjmt6ElbCoW2HCMZz3p5OzqE5tT9ADDVABgXIOQpvShe4xxVD3q7BTRNTLciWr
 lWQ3jFt2770vwxEmva5lHrvW90QyTCg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130--IsMh_6EMCCewEpQBf4rBw-1; Fri, 08 Nov 2019 17:51:50 -0500
Received: by mail-wm1-f69.google.com with SMTP id f14so3155569wmc.0
 for <alsa-devel@alsa-project.org>; Fri, 08 Nov 2019 14:51:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+/4hj8nZSF54HC66dzjN61zZy0e2KLKFeJMKLTKWpE4=;
 b=QAeqqn2DrTAI7QQWliWgMcgylPR+bMUOrj/UFbxzgVSPeqS+TKwbniXgsk8dCoWDeH
 Tgs62xESeXU1DP6ITfMuSIPwAu/XkC8GQVtpJ2ekvYLp9NEQLVKXao5unFGXVTKmmuwW
 55TP3fl1iw57OXo7G8QYL7ahNr5+DWBXttJ3zwJzHD/nFvck+0+Qn2299OhytqYoLmcU
 FIumZJ13NW9lXi3vcfDq+a8cc8qNiLvetC4Efz0tb0sbf5tmuEE4ChhyT+/JRD4lbTNr
 aP27dE5xbXhqc5ajs3SsHvGCYjBr++TE/iyqu/QwVl/bi9cVIfcDy0/rJy7RCOIWYgwB
 Ddkg==
X-Gm-Message-State: APjAAAVmC/LU+vV3gcXhjtxKDi3As9z6m1pCHxlpIuybTNuxbI/gSwgh
 dj0qejCoPKXuXKdXsWF8li1WAQUIJQzFHqqotKYMiBQPkt1mTtFPwrgdJYyuPgYjhNojqIx6TTk
 a/sBPNbVLXaFBFJxpHpJwMXs=
X-Received: by 2002:a5d:530f:: with SMTP id e15mr11048732wrv.119.1573253508823; 
 Fri, 08 Nov 2019 14:51:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqzaUQooclxgqgiS2G4ERHBtkfojXBtzoK90bFhhRwph02uUu+HsS9Hds52LQN6XZF1WB/oLRA==
X-Received: by 2002:a5d:530f:: with SMTP id e15mr11048722wrv.119.1573253508581; 
 Fri, 08 Nov 2019 14:51:48 -0800 (PST)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl.
 [84.106.84.65])
 by smtp.gmail.com with ESMTPSA id d2sm11186741wmd.2.2019.11.08.14.51.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Nov 2019 14:51:47 -0800 (PST)
To: Jacob Rasmussen <jacobraz@google.com>
References: <CAGRrVHz0LZOXWprAqR+_e59k+NQwiax7je4dSHf85yeHepHV+g@mail.gmail.com>
 <093f1caf-dbb7-2d6f-9a1f-af19f4bee53d@redhat.com>
 <CAPZ+yNKmA4HDjAqNjkrA-AApmUOwpLE9THv=JTbqD8d_KSV=rg@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <5778c927-a470-b183-9e71-65840cc29a85@redhat.com>
Date: Fri, 8 Nov 2019 23:51:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <CAPZ+yNKmA4HDjAqNjkrA-AApmUOwpLE9THv=JTbqD8d_KSV=rg@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: -IsMh_6EMCCewEpQBf4rBw-1
X-Mimecast-Spam-Score: 0
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
 Ross Zwisler <zwisler@google.com>, Curtis Malainey <cujomalainey@google.com>,
 Mark Brown <broonie@kernel.org>, Fletcher Woodruff <fletcherw@google.com>,
 Bard Liao <bardliao@realtek.com>
Subject: Re: [alsa-devel] issue with jack detect using rt5645
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On 08-11-2019 18:28, Jacob Rasmussen wrote:
> Hello Hans,
> 
> On Fri, Nov 8, 2019 at 6:16 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi Ross,
>>
>> On 11/7/19 11:31 PM, Ross Zwisler wrote:
>>> We are trying to get a piece of Google hardware which uses the rt5645
>>> driver working correctly with newer kernels (currently one based on
>>> the latest v4.14 stable), and noticed that the following commit:
>>>
>>> commit 6b5da66322c5 ("ASoC: rt5645: read jd1_1 status for jd detection")
>>>
>>> broke jack support for our device.  Basically with that patch we never
>>> correctly see a jack insertion event, and audio is never routed to the
>>> headphones.
>>>
>>> With just that one patch reverted, things work correctly on our
>>> system.  The revert applies cleanly to linus/master.
>>>
>>> Here is the series where that patch was originally upstreamed:
>>>
>>> https://www.spinics.net/lists/alsa-devel/msg64331.html
>>>
>>> If we reverted that patch upstream, would it break other devices (the
>>> "GDP Win" device?) that use the rt5645 driver?
>>
>> Yes likely it will, the commit in question was added to fix jd
>> issue in the GDP win and other Cherry Trail devices using
>> standard Intel reference designs.
>>
>>> If so, how would you
>>> recommend proceeding?
>>>
>>> Does anyone have one of the "GDP Win" devices so we can test that and
>>> our device and make sure whatever solution we end up coming up with
>>> works for everyone?
>>
>> I have acccess to the following devices with a rt5645 codec:
>>
>>
>> rt5645:         Spk     Mic     JDmod   UCM
>> -Acer One S1003 stereo  ana     3       chtrt5645
>> -Asus T100HA    stereo  dmic1   3 inv   custom
>> -GPD Pocket     mono    diff    3 inv   chtrt5645-mono-speaker-analog-mic
>> -GPD win        mono    ana     3 inv   chtrt5645-mono-speaker-analog-mic
>> -Kazam Vision   stereo  ana     3       chtrt5645
>> -Lenovo Miix310 stereo  diff    3       chtrt5645
>> -Lenovo Miix320 stereo  dmic2   3       custom
>> -Teclast X80Pro mono    ana     3       chtrt5645-mono-speaker-analog-mic
>>
>> Which all work fine with the current code, have you tried all the
>> different jdmode values through the quirk moodule param?
> 
> I've tried setting jdmode to 0-7 through the quirk module param but
> none of them fixed the problem.
> 
>> If Playing with the quirk settings does not help, then I believe that
>> the best approach to fix this is to figure out which bit of the
>> pre 6b5da66322c5 behavior you need and to activate this behind a new
>> quirk option and set that quirk for the system in question.
>>
> 
> The part of pre 6b5da66322c5 behavior we need is which register is
> being read from to set val in jack_detect_work(). It looks like all
> the other devices that use this codec have jd_mode = 3, so I was
> thinking we could set buddy's jd_mode to something else and read from
> the old register if jd_mode is that something else. Does that seem
> reasonable?

The QUIRK_JD_MODE macro supports jd_mode 0-7 and we are currently
only using 0-3, so if you call this say mode 4 then yes that sounds
reasonable.

Regards,

Hans

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
