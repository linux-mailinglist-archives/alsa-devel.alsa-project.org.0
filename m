Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A68651986BD
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 23:41:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37BB01614;
	Mon, 30 Mar 2020 23:40:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37BB01614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585604472;
	bh=np4o+SLhBqto4477PafKc6evD4xcBbE2zIcPHLqYI3I=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dvSbCZUXTUFqStzKsOqU1ltCrW8U8sKnvX2aaNlbri9X51RZ/0sDhdEDvlUYglKMr
	 dHa3xMpdlBpPBaer8ojkrhT03+Ay0Ynhh7dGfZsjoKSLj44Z6l/2Z9x7m04KZBNMQW
	 BIHIOBZ7C0ZPt5tfohtLmxpS7ej/nJv5jYmg606Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36241F800EB;
	Mon, 30 Mar 2020 23:39:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CFFAF80148; Mon, 30 Mar 2020 23:39:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DCBDF800EB
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 23:39:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DCBDF800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="O89m2E+D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585604362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cLAxc9h/2g/Kt0lGCbg//O6dcS/quuDsYwk9z/L+Qyo=;
 b=O89m2E+DmBE+oMVwF1XLwnDhh4thAgTubueWNoFsNkMBufJ3ifyv3TmuWHMF84ImSC/8l6
 gUum1K3STHgVw7PUeUYgaf109/wnWNxZRipET3bRA+Skr/893GOz8EGQrg2QFyYpJHEYU9
 FJ9UFEnZHQsu/f0UXiBrp34Kd7ZWYCk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-P0GoRkH8PomWx8rqnlD5Lw-1; Mon, 30 Mar 2020 17:39:19 -0400
X-MC-Unique: P0GoRkH8PomWx8rqnlD5Lw-1
Received: by mail-wr1-f72.google.com with SMTP id w12so11934336wrl.23
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 14:39:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/gKl6HergYib0WERu35yxh1XJUzLXL9wB0owhTSev4Q=;
 b=QY274fC2o/aPo820n+bdVmtPvKzJFCoxh2DI5kSLnwMU7y+hAF5PDRBGM6kp5yBLb3
 poaW5D9To7BsiEyinZmYM9f4kHh9j+Y54DCrNeMK9PWr9SD5x733KRa/8pZCIwHYRKQq
 ZxbGy6Vw9LReFjD3uSQ/jjG/7kY+EZdOWxyIIoR3LKLg+ANgZxdIStsROo00D0i2W41v
 wMKty9XoNYjqlIK80DUPSgNpDbALuIi67GwSxPHeiYTDpcN6Y9hnALcyWvyepN3IUjgD
 sMDV3s3Mt5c7N4bg5Jm6WxrIzsyds40RkVlBbedut8U0HFNoBkuEHzltSq2hssHNAQjl
 Lzzw==
X-Gm-Message-State: ANhLgQ0DEMCCWwfgsYH3QogGNSImr32Am1wkA2wQXr8F5iLqJDySDwoM
 3Jv6AizsTDkh6aa52Mg+jHqNDAglLFUhUeQXvpZwOyTV+IlO0Q6L6UUvRxirUjYifeWFqXqFQX4
 tk/aWZ1G+6+eTcTxeKn2DNHo=
X-Received: by 2002:a1c:4486:: with SMTP id r128mr150477wma.32.1585604358864; 
 Mon, 30 Mar 2020 14:39:18 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vt1MlM3lb/jDSHAe2eg4l1SkYSASfix4qSdkD5YTppKiiQpllWIWX3XY7EZJobGgCkfYm49Cg==
X-Received: by 2002:a1c:4486:: with SMTP id r128mr150468wma.32.1585604358673; 
 Mon, 30 Mar 2020 14:39:18 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
 by smtp.gmail.com with ESMTPSA id u204sm1017836wmg.40.2020.03.30.14.39.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2020 14:39:18 -0700 (PDT)
Subject: Re: [PATCH 3/4] ASoC: Intel: bdw-rt5677: Remove ignore_suspend flag
 from SSP0 dai link
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20200319204947.18963-1-cezary.rojewski@intel.com>
 <20200319204947.18963-4-cezary.rojewski@intel.com>
 <dea20cf7-f324-a933-8f8e-e70a4dffa249@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <259cbb60-9e59-1132-8371-83f837577f86@redhat.com>
Date: Mon, 30 Mar 2020 23:39:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <dea20cf7-f324-a933-8f8e-e70a4dffa249@linux.intel.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Curtis Malainey <cujomalainey@google.com>, tiwai@suse.com,
 Dominik Brodowski <linux@dominikbrodowski.net>, lgirdwood@gmail.com,
 vkoul@kernel.org, broonie@kernel.org, Ben Zhang <benzh@google.com>
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

On 3/19/20 11:14 PM, Pierre-Louis Bossart wrote:
>=20
>=20
> On 3/19/20 3:49 PM, Cezary Rojewski wrote:
>> As of commit:
>> ASoC: soc-core: care .ignore_suspend for Component suspend
>>
>> function soc-core::snd_soc_suspend no longer ignores 'ignore_suspend'
>> flag for dai links. While BE dai link for System Pin is
>> supposed to follow standard suspend-resume flow, appended
>> 'ignore_suspend' flag disturbs that flow and causes audio to break
>> right after resume. Remove the flag to address this.
>>
>> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> Cc: Dominik Brodowski <linux@dominikbrodowski.net>
>> Cc: Mark Brown <broonie@kernel.org>
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>=20
> we should ask Ben and Curtis @ Google if the changes related to suspend i=
nterfere with the wake-on-voice support?
>=20
> Btw the .ignore_suspend is also set in bytcr_rt5640/51 drivers, so wonder=
ing if additional devices are broken, or if there's something off about Bro=
adwell in general. Hans, have you heard of any regressions on Baytrail devi=
ces?

I've just tested 5.6.0 on Bay Trail + a rt5651 codec,
using the bytcr_rt5651 machine driver which sets
ignore_suspend, as well as on a Cherry Trail + rt5645
device using the chtrt5645 machine driver which does
_not_ set ignore suspend.

Suspend/resume work fine on both and music playing
before suspend continues playing after suspend.

Note that the bytcr_rt5651 machine driver also does:

         snd_soc_dapm_ignore_suspend(&card->dapm, "Headphone");
         snd_soc_dapm_ignore_suspend(&card->dapm, "Speaker");

Which the bdw-rt5677 seems to not do...

Regards,

Hans


>=20
>> ---
>> =C2=A0 sound/soc/intel/boards/bdw-rt5677.c | 1 -
>> =C2=A0 1 file changed, 1 deletion(-)
>>
>> diff --git a/sound/soc/intel/boards/bdw-rt5677.c b/sound/soc/intel/board=
s/bdw-rt5677.c
>> index a94f498388e1..713ef48b36a8 100644
>> --- a/sound/soc/intel/boards/bdw-rt5677.c
>> +++ b/sound/soc/intel/boards/bdw-rt5677.c
>> @@ -343,7 +343,6 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] =3D=
 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .no_pcm =3D 1,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .dai_fmt =3D SND_=
SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 SND_SOC_DAIFMT_CBS_CFS,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ignore_suspend =3D 1,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ignore_pmdown_ti=
me =3D 1,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .be_hw_params_fix=
up =3D broadwell_ssp0_fixup,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ops =3D &bdw_rt5=
677_ops,
>>
>=20

