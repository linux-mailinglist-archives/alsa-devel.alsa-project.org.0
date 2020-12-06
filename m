Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BFB2D04EA
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Dec 2020 13:52:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 856E51764;
	Sun,  6 Dec 2020 13:51:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 856E51764
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607259153;
	bh=8hGdS6UzgOQybCQZzGGsxEMYQS232BkGLLEIp+qUXEo=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SY631q7G5pA18dOOIV3YRITRTTgfsSddhleiCHN3YlG5uTfZQSrvL9ca6zivXcwiT
	 NoKuGjkzE6nXoiY7typBrzRRKkhwfQnclRDjaEs+WPwwV8aTXh8+zpipntdVAWfX/w
	 yHhkF5LBLP1J7j+UKmnkTCTwiYJB+O2Ake3F2Uro=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED478F8015F;
	Sun,  6 Dec 2020 13:50:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD7CDF8019D; Sun,  6 Dec 2020 13:50:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15EE5F8010A
 for <alsa-devel@alsa-project.org>; Sun,  6 Dec 2020 13:50:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15EE5F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="W1Kir29R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607259053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T7jE2hfLpSDcQcP0QFZRun/ot3D3Mun0pa7ySPKf3lo=;
 b=W1Kir29RS2Mi0juVGs857y7Z3Uex2UAWF1KGDE0qPXQCqf7Cj8Ok6h+n5G5OYZWELphSrD
 /bkmh+6LeoJmW+qIW8l3oILC4XqZ4MsJ4QztJDADQiVGR2qsq1ZEUYk6Nu5udGREkMOF+d
 8S3B22Cv01oaw1LJN+RmprTKES/W/1E=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-rRnwnoCBNyuiZ7-vby3gWQ-1; Sun, 06 Dec 2020 07:50:51 -0500
X-MC-Unique: rRnwnoCBNyuiZ7-vby3gWQ-1
Received: by mail-ed1-f69.google.com with SMTP id l33so1055094ede.1
 for <alsa-devel@alsa-project.org>; Sun, 06 Dec 2020 04:50:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T7jE2hfLpSDcQcP0QFZRun/ot3D3Mun0pa7ySPKf3lo=;
 b=uQgnYJRB2oKgtm2x6YlgbIMaCyOzSLRr9jSYKbWBgF3pMcKcgAWk23d6NH9UswsCqN
 fFXD+cT8eM1Wk56t8UsHz2XVxIlcKT/z86W2u3t4WYczyK6S7e417ahnhVyBeAbpvzui
 EQr3nkcrqMJtw6+mJORR6hleVXeeBtBFoV2vdwGEM8jtIT8wXRmK6kewfIP3TsiWmeMZ
 HY9f61Z72uXdF3wm8ytX7bcTvcOZLXRZ3oOcY9p1j6Z0N0pGbZZ0ljLMUtiqrY6SqU9C
 k2HWonux/gZ7bYRKNmVTpIu2Q1f28XAn8qjl77fayk1GJ0MY/ENiOGwoC/WA+i3UKhK9
 CHxg==
X-Gm-Message-State: AOAM533PZmOiLghpT0ZqUGjJvOFpb+39D8Q6L3zpesX+GUlLEVnsebI0
 /0nNUxj0SLUHIKI+WhgmMOyqA0V0hnkVeKUkrqJMsIR70qX8LhXuDGtAQhFdTUs5IMcpzei7fYk
 pkNVt0q0D3c1fg89TOYhW6BKyayNEYuIlSpQTsZ0pwKlRfa63v46qYFugU1kebn8eW/U7DPzd23
 4=
X-Received: by 2002:a50:fb97:: with SMTP id e23mr16030535edq.208.1607259049999; 
 Sun, 06 Dec 2020 04:50:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJznx7Sw5liE6hsOaAbguXfAcv1HlTtJ4uZ0yrDAYBobZkeNrTmsL/No+z6Bi6JEp8G6+IrvUg==
X-Received: by 2002:a50:fb97:: with SMTP id e23mr16030526edq.208.1607259049845; 
 Sun, 06 Dec 2020 04:50:49 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id e14sm7976504ejh.62.2020.12.06.04.50.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Dec 2020 04:50:49 -0800 (PST)
Subject: Re: [PATCH alsa-lib 1/3] chtnau8824: Fix mono speaker config not
 working
To: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org
References: <20201206124718.14060-1-hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <64ced200-a23c-cf5a-7f21-392561cb74da@redhat.com>
Date: Sun, 6 Dec 2020 13:50:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201206124718.14060-1-hdegoede@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Patch prefix should have been "PATCH alsa-ucm-conf", I have fixed this in
my git config now, sorry about that.

Regards,

Hans

On 12/6/20 1:47 PM, Hans de Goede wrote:
> Fix the Speaker define / var being changed from "Speaker" to "MonoSpeaker"
> not having any effect because the variable gets expanded before the if
> making the change is interpreted.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  ucm2/chtnau8824/HiFi.conf | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/ucm2/chtnau8824/HiFi.conf b/ucm2/chtnau8824/HiFi.conf
> index 3ccd6b1..d7a5f63 100644
> --- a/ucm2/chtnau8824/HiFi.conf
> +++ b/ucm2/chtnau8824/HiFi.conf
> @@ -34,8 +34,15 @@ SectionVerb {
>  	}
>  }
>  
> -Include.spk.File "/codecs/nau8824/${var:Speaker}.conf"
> -Include.hp.File "/codecs/nau8824/HeadPhones.conf"
> +# The includes using $vars in there path must be conditional otherwise the
> +# $var gets expanded before the other If-s above can change the vars.
> +If.cfg-includes {
> +	Condition { Type String Empty "" }
> +	True {
> +		Include.spk.File "/codecs/nau8824/${var:Speaker}.conf"
> +		Include.hp.File "/codecs/nau8824/HeadPhones.conf"
>  
> -Include.mic.File "/codecs/nau8824/InternalMic.conf"
> -Include.hsmic.File "/codecs/nau8824/HeadsetMic.conf"
> +		Include.mic.File "/codecs/nau8824/InternalMic.conf"
> +		Include.hsmic.File "/codecs/nau8824/HeadsetMic.conf"
> +	}
> +}
> 

