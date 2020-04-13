Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE041A6918
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Apr 2020 17:48:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA3221681;
	Mon, 13 Apr 2020 17:47:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA3221681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586792893;
	bh=fkX5zy9inwQkWPHjnqFBqP+2ogtDVSNGF6QV4zLhV6E=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OZAhOqVYvOa0a5qzC2WyWQe8m0wuyc+xdOjktrpTs/sQWUF3bvSzDH5o4Kg9JRuzl
	 lBdA1Jh6+YOC6shxfdVgm4LtfyeDBx8Af6jwA84AR27XvGJouCGNVjwTlfg5MB7AXW
	 oPq72tRT1UBSTAS8ync8SlpEQwN1GvdAAgkkxIWU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB9E6F8010E;
	Mon, 13 Apr 2020 17:46:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3F70F80245; Mon, 13 Apr 2020 17:46:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 428D0F80115
 for <alsa-devel@alsa-project.org>; Mon, 13 Apr 2020 17:46:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 428D0F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="czLd0oXL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586792782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q6lLZ+1DT6crrPz53AqEbLawUoi2lOu//nUwhpk53Io=;
 b=czLd0oXLaJQ8mTJB4Ak+Aj7bVd/R/scGEKE+kUyno2wVyoHPFOC0Ktx9AcEAr2bHtwzxCU
 VRYENWunMgaZknJ7ZsZFx9jC1eInLSTKrgdHa9KcSGcG8HCyCuEKMHzNWYdxzwkdETeHJD
 G0gcqpFT31wZUfetigqEIKpW1q2w2f4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-rTcfDsPjPL6c7DdqjDfH-Q-1; Mon, 13 Apr 2020 11:46:20 -0400
X-MC-Unique: rTcfDsPjPL6c7DdqjDfH-Q-1
Received: by mail-wr1-f72.google.com with SMTP id m15so6950293wrb.0
 for <alsa-devel@alsa-project.org>; Mon, 13 Apr 2020 08:46:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q6lLZ+1DT6crrPz53AqEbLawUoi2lOu//nUwhpk53Io=;
 b=KUGSXEUgTjWMgZNUqRqXUSpQI+QUgBKbYQOADXnLusvL38dzbwu/25n6xoml+mGzr8
 juL3keaD3R8l2pBY2oJ0ZD+Uf8oymAAmHt4CQgOHKc8NRwFpfe5kgfrSZJVIMNxvXhoT
 Q9iN5B398veS1vHuW2Lnf8J9hgeay/h/Kh3pWwFmDuvdg4YpRdjs/0BDRTdqSDjM/VIr
 lJ6fyq449ROZfXDUnA26n5ThhEzVFaCDGO+tzw0SWLWpomqvD71BKFmm/419eArtUU7n
 2SqO8Ps72ygMIDyiAkve5hXrR3X1aUa96VchmqpAp1RoYvncxbpf9aCIIDPS94+QuQbW
 Wfqw==
X-Gm-Message-State: AGi0PuYsxExOtjy8EI4jVgcdmltnZSMgqwiUHlRbl1xzt3QFRO8BwOD/
 Jz8f5jCz2Fh0Fx2atlYpePSLV4s4hCqaRBhdSpaNQHOR+8gSBeSkKuEBdSWvbNnAhTGJnNlr/t0
 8G96scLk7EkHaD55a8t3DIqs=
X-Received: by 2002:a5d:5141:: with SMTP id u1mr18168670wrt.146.1586792778335; 
 Mon, 13 Apr 2020 08:46:18 -0700 (PDT)
X-Google-Smtp-Source: APiQypJVhKY2SSw/tLdOrKx0vfJM1pmLnvHCZ+IK3fKGNeDcRUqGsITSAQTsuy4OGDlqMMsuB06veA==
X-Received: by 2002:a5d:5141:: with SMTP id u1mr18168653wrt.146.1586792778065; 
 Mon, 13 Apr 2020 08:46:18 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id m1sm10020071wro.64.2020.04.13.08.46.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Apr 2020 08:46:17 -0700 (PDT)
Subject: Re: [PATCH] bytcht-es8316: fix Speaker or Headphone no sound if
 enable Mic or Headset
To: youling257 <youling257@gmail.com>, perex@perex.cz
References: <20200413145957.22459-1-youling257@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <ae69c1b0-b347-4366-4bb0-383aed69c4b1@redhat.com>
Date: Mon, 13 Apr 2020 17:46:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200413145957.22459-1-youling257@gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org
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

On 4/13/20 4:59 PM, youling257 wrote:
> alsaucm -c bytcht-es8316 set _verb HiFi set _enadev Mic, Speaker will no sound.
> alsaucm -c bytcht-es8316 set _verb HiFi set _enadev Headset, Headphone will no sound.

I see the problem, so the idea of the global EnableSequence is
to set defaults and then the EnableSequence of currently active
devices run on top.

If we drop the default off of both switched and then
shutdown the machine with no headphones inserted, so
the speakers being used, then the 'Speaker Switch' on
state will be saved on shutdown and restored on boot.

If we then boot with headphones inserted then AFAIK
pulseaudio will run the global EnableSequence + the
HeadPhones EnableSequence, leaving the 'Speaker Switch' on
and now we get audio on both.

The problem seems to be that alsaucm not only
runs the EnableSequence for the selected device
but also the global one, which pulseaudio normally
only does once at bootup.

I might be wrong here, maybe pulse will run the global
EnableSeq + EnableSeq of active devices + DisableSeq of
inactive devices when it starts. In that case the
running of the DisableSeq of inactive devices will
take care of turning off the speaker-switch when
booting with the headphones inserted. In which case
the default off of all switches can indeed be removed.
Note in that case we should also remove the default off
for the Headset + Internal Mic Switch, so a nack to
this patch regardless.

Jaroslav, can you give us some guidance on how this
is supposed to work ?

Also you say you use pulseaudio for your testing,
AFAIK pulse does not suffer from the problem the
alsaucm commands you mention do, so as long as
you only use pulse things should work.

Regards,

Hans




> 
> Signed-off-by: youling257 <youling257@gmail.com>
> ---
>   ucm2/codecs/es8316/EnableSeq.conf | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/ucm2/codecs/es8316/EnableSeq.conf b/ucm2/codecs/es8316/EnableSeq.conf
> index 551b79b..53bb115 100644
> --- a/ucm2/codecs/es8316/EnableSeq.conf
> +++ b/ucm2/codecs/es8316/EnableSeq.conf
> @@ -1,6 +1,4 @@
>   # Disable all inputs / outputs
> -cset "name='Speaker Switch' off"
> -cset "name='Headphone Switch' off"
>   cset "name='Headset Mic Switch' off"
>   cset "name='Internal Mic Switch' off"
>   
> 

