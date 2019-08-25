Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E95EA9C54B
	for <lists+alsa-devel@lfdr.de>; Sun, 25 Aug 2019 19:50:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43106166F;
	Sun, 25 Aug 2019 19:49:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43106166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566755410;
	bh=+cLZk5PLp3WmQe1NQQTcukmYv19ySpCRDLUquev22mw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VWIviilGJL8lwh7VejNCtp+4y7LXZAT2LCGoLUHYHOqYCkBgLdFsALlI3wzpTfDh5
	 r1O+oLqBPB6sPTiJ1YlGZp5DdqetdPN1X7OLoWdEkne6o2wlbzTo9q8W3rEzACW0ZU
	 QVqBF8da/ARYFNkKNPm5dyMCAYGr0Z7YR25h0T3k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA266F801ED;
	Sun, 25 Aug 2019 19:48:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91887F80213; Sun, 25 Aug 2019 19:48:23 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E7C0F801ED
 for <alsa-devel@alsa-project.org>; Sun, 25 Aug 2019 19:38:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E7C0F801ED
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D07FE83F42
 for <alsa-devel@alsa-project.org>; Sun, 25 Aug 2019 17:38:18 +0000 (UTC)
Received: by mail-ed1-f71.google.com with SMTP id e9so8237092edv.18
 for <alsa-devel@alsa-project.org>; Sun, 25 Aug 2019 10:38:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CK1a23hD4lHdM/UHCYL3dWOeCp7ea2G2doEW1IlG12o=;
 b=Iox0AY/IDbsw7nnr7HoFOYpy9j7dw69s2xwAdDlJvN4CLkY5ivVP8Vz9J7fW+tdL9x
 CbzXtz7/SzLZodjDqyzZ7AJVQpEH6K9MBpKYLkTgU7GmCIcyzZcAAnKdKsDId+KALqeg
 OKzF4yly0y310Zcv/cParXMdEV3r8l3DM2JUbJiJfzRgRJADIvqeHy4cKsvo+hvtjzSn
 nWyuBQUepTau02xLLdjRAkWuzzEieJKUcsfPEA5z3LFJaPmqKnK4B6iIMLZwRqb+bwEt
 wDYZRSZe59eB6doq5wqNJ4ZlEK9eT2JZQyE9J9Xh4AuYQYLwtZDsedKUDXDm+rTk2iH+
 /JOA==
X-Gm-Message-State: APjAAAXwa1Ak52ZB7M4dBQh8V9OxHC7xeeKOuoYwhg/OzNyL+ZVJyYPU
 /spbTgyL9qL0/PNnulQQLTWtv0xXuIizmjZS4R+vf+qF5S/FalceWoBfzmEZb/Mhd7TIr9UQnKs
 67cN0Qs/j8hn+08uj13/49Kw=
X-Received: by 2002:a50:f05a:: with SMTP id u26mr14914558edl.116.1566754697638; 
 Sun, 25 Aug 2019 10:38:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy//Oidu64o3SogMsT7m8oHy4BJyX16GMS3wuS3JJc9u+iiQQPgmxOGqTa6iW0EjR/CbX4hXQ==
X-Received: by 2002:a50:f05a:: with SMTP id u26mr14914547edl.116.1566754697496; 
 Sun, 25 Aug 2019 10:38:17 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl.
 [84.106.84.65])
 by smtp.gmail.com with ESMTPSA id c15sm2459120ejs.17.2019.08.25.10.38.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Aug 2019 10:38:16 -0700 (PDT)
To: Katsuhiro Suzuki <katsuhiro@katsuster.net>,
 Mark Brown <broonie@kernel.org>, David Yang <yangxiaohua@everest-semi.com>,
 Daniel Drake <drake@endlessm.com>
References: <20190824210426.16218-1-katsuhiro@katsuster.net>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <943932bf-2042-2a69-c705-b8e090e96377@redhat.com>
Date: Sun, 25 Aug 2019 19:38:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190824210426.16218-1-katsuhiro@katsuster.net>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: es8316: limit headphone mixer volume
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

On 24-08-19 23:04, Katsuhiro Suzuki wrote:
> This patch limits Headphone mixer volume to 4 from 7.
> Because output sound suddenly becomes very loudly with many noise if
> set volume over 4.
> 
> Signed-off-by: Katsuhiro Suzuki <katsuhiro@katsuster.net>

Higher then 4 not working matches my experience, see this comment from
the UCM file: alsa-lib/src/conf/ucm/codecs/es8316/EnableSeq.conf :

# Set HP mixer vol to -6 dB (4/7) louder does not work
cset "name='Headphone Mixer Volume' 4"

Limiting this to the actual working range at the kernel level seems
sensible:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>   sound/soc/codecs/es8316.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
> index 8dfb5dbeebbf..bc4141e1eb7f 100644
> --- a/sound/soc/codecs/es8316.c
> +++ b/sound/soc/codecs/es8316.c
> @@ -91,7 +91,7 @@ static const struct snd_kcontrol_new es8316_snd_controls[] = {
>   	SOC_DOUBLE_TLV("Headphone Playback Volume", ES8316_CPHP_ICAL_VOL,
>   		       4, 0, 3, 1, hpout_vol_tlv),
>   	SOC_DOUBLE_TLV("Headphone Mixer Volume", ES8316_HPMIX_VOL,
> -		       0, 4, 7, 0, hpmixer_gain_tlv),
> +		       0, 4, 4, 0, hpmixer_gain_tlv),
>   
>   	SOC_ENUM("Playback Polarity", dacpol),
>   	SOC_DOUBLE_R_TLV("DAC Playback Volume", ES8316_DAC_VOLL,
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
