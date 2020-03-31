Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4835219961D
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Mar 2020 14:17:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF2161662;
	Tue, 31 Mar 2020 14:16:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF2161662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585657022;
	bh=NuaVBr1UBqZLBmkZ15tLHVvRyGaeXNdRXGR3CYa75AY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hnTUzY2saJz3BGbiiBf1gjiIHwdmI1Ff/Aj0Z64/CmxBTPraYR2UoWj8iZ2ZIrNTz
	 QaVffC1r4obKrC9+Bohsc8veUhqv10/sz0Ub8Q/NdU8rxf0ytn7tEjvdgviqJX1I7I
	 sIPaFlEev6Gkebor3KLLZGPviP9bG087gPWxXZlM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED563F80157;
	Tue, 31 Mar 2020 14:15:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54A29F8014F; Tue, 31 Mar 2020 14:15:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5932BF80140
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 14:15:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5932BF80140
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="dgQu0q73"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585656914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NuaVBr1UBqZLBmkZ15tLHVvRyGaeXNdRXGR3CYa75AY=;
 b=dgQu0q73mzMwzrmT0oYUn6sKFyCi2Dds0rCQQeVpuCL8aTN1gJZA+SDfrHAmoVDDfbEBP/
 69J+yd8xRUWx1bi3jp3P9OF8gAAyOP2TZ6fj/Zc60khIDHBXScSB4KNdUHuEPjQWe8MUsj
 ZKIgjhGXzSg9DxFOHFGaRZnJN/joVQo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-GYgLohZePz-cDBx_8fWG1w-1; Tue, 31 Mar 2020 08:15:09 -0400
X-MC-Unique: GYgLohZePz-cDBx_8fWG1w-1
Received: by mail-wr1-f69.google.com with SMTP id b2so12418228wrq.8
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 05:15:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=t29uoclohG4cpybZvS5VnvB8PfgsOPbrk0/Y1AsJJhM=;
 b=hSggQUkgqRYc7nAJ4nKXTfUZziy4LgLnDLWjH3+BN2hzjceYhHthA76cdQESymUCiK
 0FKw+0OZE8ASLs0mZxJUdQ73RdGC7Y2ws7XGQdJFI0GmzuM7UfVPFM4gjdIoBfL844Sn
 Df/E2iig0Ii1UfmzKldQdmfB+i2ncb6gtsUONk4bmQfwZnvH9hagmVmQgTJdcSs6Ee04
 /40bjLoE0AI7rLIbG8621R+fdYF4XXhvGfkadmKgoG8sbyyQxwwnSHYQa8TmcrgTmyeR
 3VE3Q+0U5lcGTkkmxs8Vrp9hdCJ0Pf6TZIbah+DjuG9BRR2xt1nJSFKm88a3WxNFmKsi
 jsOw==
X-Gm-Message-State: ANhLgQ2aNWg33AfnXe5Ql+H4J+ff5D1J5v6/O4H14XmtO+GxCNrSFSRi
 njDnFzT3iV/58T4fZqeXFPFfVNDHGWXyFVeU1YNPnEMR72myluQldvrTRUvG4G2BvRF+FVlblAA
 Ani08lptMQ/5NE09QHKQpqGk=
X-Received: by 2002:adf:ed88:: with SMTP id c8mr13403472wro.118.1585656907920; 
 Tue, 31 Mar 2020 05:15:07 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvgGq2/6PQcCtvfEOn2kQTy2Xqq3V9LHCi+qVOAH7YiLn6ZAOttI7XEbQuB0lTy19gfV3s5zg==
X-Received: by 2002:adf:ed88:: with SMTP id c8mr13403445wro.118.1585656907678; 
 Tue, 31 Mar 2020 05:15:07 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
 by smtp.gmail.com with ESMTPSA id b6sm27682304wrp.59.2020.03.31.05.15.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2020 05:15:07 -0700 (PDT)
Subject: Re: [PATCH 3/4] ASoC: Intel: bdw-rt5677: Remove ignore_suspend flag
 from SSP0 dai link
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20200319204947.18963-1-cezary.rojewski@intel.com>
 <20200319204947.18963-4-cezary.rojewski@intel.com>
 <dea20cf7-f324-a933-8f8e-e70a4dffa249@linux.intel.com>
 <259cbb60-9e59-1132-8371-83f837577f86@redhat.com>
 <cfb3612e-e453-526d-8351-9167f26fecca@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <688bd1e5-c481-ea1a-8c3f-9cd8792a7430@redhat.com>
Date: Tue, 31 Mar 2020 14:15:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <cfb3612e-e453-526d-8351-9167f26fecca@linux.intel.com>
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

On 3/31/20 1:49 AM, Pierre-Louis Bossart wrote:
>=20
>>> Btw the .ignore_suspend is also set in bytcr_rt5640/51 drivers, so wond=
ering if additional devices are broken, or if there's something off about B=
roadwell in general. Hans, have you heard of any regressions on Baytrail de=
vices?
>>
>> I've just tested 5.6.0 on Bay Trail + a rt5651 codec,
>> using the bytcr_rt5651 machine driver which sets
>> ignore_suspend, as well as on a Cherry Trail + rt5645
>> device using the chtrt5645 machine driver which does
>> _not_ set ignore suspend.
>>
>> Suspend/resume work fine on both and music playing
>> before suspend continues playing after suspend.
>=20
> Thanks for testing Hans.
>=20
> I think we should remove those .ignore_suspend from all Baytrail/Cherrytr=
ail drivers, no one ever enabled advanced power management except in very s=
pecific Android distributions that are no longer maintained.

I agree, I believe I even submitted patches for that a couple
of years ago, but back then I think there was still some
hope to get S0i1 playback to work so the patches where
not accepted.

>> Note that the bytcr_rt5651 machine driver also does:
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 snd_soc_dapm_ignore_sus=
pend(&card->dapm, "Headphone");
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 snd_soc_dapm_ignore_sus=
pend(&card->dapm, "Speaker");
>>
>> Which the bdw-rt5677 seems to not do...
>=20
>=20
> On the bytcr_rt5661, these two lines were added in the initial code in 20=
16, and it's also part of the legacy byt-rt5640, so it's likely a copy/past=
e more than a feature added on purpose.

Could be, we should probably also drop those 2 calls together
with dropping the setting of the ignore_suspend flag.

Regards,

Hans



