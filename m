Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0363D19ED4F
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Apr 2020 20:12:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68959167D;
	Sun,  5 Apr 2020 20:11:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68959167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586110319;
	bh=7hFtF0fABhYNZn7mgOPdSIRJ2rJkn5B9KnaCY+Z1Pis=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fmT+1FXmjc3pe9KEd0CsmGPhEP4f+4Ic7o17i1FFqWD+RLiG1k1MP8Xa5XPQQxe3z
	 MsJ9iDi2wJ8KMxYzygRSLzzH65y6tZopeA7uervMI6qgFw+BfWID9HSXhXK+hSmvsq
	 SXATddfluIGeYtyRYzDwciA3fF6BfzBw1xMdTWQc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C7F7F8015A;
	Sun,  5 Apr 2020 20:10:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9C92F801D8; Sun,  5 Apr 2020 20:10:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CE09F80121
 for <alsa-devel@alsa-project.org>; Sun,  5 Apr 2020 20:10:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CE09F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="d+g1k7gQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586110210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vud1E9xnDHFek5PMJ7XBfqyuhhtGKSrJ3rCuIH5BP5Y=;
 b=d+g1k7gQePOzpQ7jK8OJ0FlL6WgBo0pn0mVknvUB2fvy+o86T/MsWXePHsuHK2rlMc+m08
 GDs6WYS9gpRPlUjRjt5adzGLxHWhMvgVe2H1u/OM3XsCNoUN4Zcumm8S4IoT5qB71i6Plh
 +0x7PqwSCJCCwZGOHzDllwKe2vyneR8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-94-QilncPFFM2WdtMxsAGxgug-1; Sun, 05 Apr 2020 14:10:07 -0400
X-MC-Unique: QilncPFFM2WdtMxsAGxgug-1
Received: by mail-wr1-f70.google.com with SMTP id d1so6773336wru.15
 for <alsa-devel@alsa-project.org>; Sun, 05 Apr 2020 11:10:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W3Hm+7JMDzAI7FHITytaBv/theC49hU8KhjgLlDKEtU=;
 b=TZ1MGMLZ1Y6Wqdmqy+7Yv0mIrQ8MRqXcrbdtNvBvNtA1Wo5PKOOIFfyeVHE2bPjcV/
 PVtUilKiSMGCSAamEnBmrys6GpkQwnKbDxlWgMZjBxTiHEQ4SgKEVDl0Q/47bLcm9d/S
 Flcps/acxSxOoZpmuAdDgr1gq1+YBWDb/Ik4iZmA3oyKlxexZkP+k7HodmetRcvx74Uf
 iH+HDcNV7CyGrLhqipjPFsUQhvD+tfjtZqh+Fehtw2jBlPC6gG1YkAuFIWeW/d/bkWjw
 BOb7Irzk4sUYikJSsQFCCgOJfeY27DqhHCObS6Gvm8dzTl6+h366/t1Rjaieo7/X4tfd
 f/nQ==
X-Gm-Message-State: AGi0PuaeK+Bg+0gJPqnH/eMvkgZM7DdTJYfClHK/MtakEkezpx5y7+j1
 wDCOOfQYmY+YqFaE6To6aFN9nQXrVsKoAMjYIDt0WMMyVfghMw1/t4N4/kboLC+Tv2xMHk/m28H
 e337TlesZzVHBIMHqoK7KNS0=
X-Received: by 2002:a7b:cd89:: with SMTP id y9mr19204090wmj.102.1586110206364; 
 Sun, 05 Apr 2020 11:10:06 -0700 (PDT)
X-Google-Smtp-Source: APiQypIz1Ldj8lwHNbOwuipDs4TMH1ft2euWSGq9IJDmCa8O/Ze5c6is0tYm3FxKVBlh2C7ayOI3VQ==
X-Received: by 2002:a7b:cd89:: with SMTP id y9mr19204075wmj.102.1586110206103; 
 Sun, 05 Apr 2020 11:10:06 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id v7sm22151214wrs.96.2020.04.05.11.10.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Apr 2020 11:10:05 -0700 (PDT)
Subject: Re: [PATCH 3/4] ASoC: Intel: bdw-rt5677: Remove ignore_suspend flag
 from SSP0 dai link
From: Hans de Goede <hdegoede@redhat.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20200319204947.18963-1-cezary.rojewski@intel.com>
 <20200319204947.18963-4-cezary.rojewski@intel.com>
 <dea20cf7-f324-a933-8f8e-e70a4dffa249@linux.intel.com>
 <259cbb60-9e59-1132-8371-83f837577f86@redhat.com>
Message-ID: <fdb1f5f5-53a2-f1ae-c193-145c8a7f4f42@redhat.com>
Date: Sun, 5 Apr 2020 20:10:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <259cbb60-9e59-1132-8371-83f837577f86@redhat.com>
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

On 3/30/20 11:39 PM, Hans de Goede wrote:
> Hi,
>=20
> On 3/19/20 11:14 PM, Pierre-Louis Bossart wrote:
>>
>>
>> On 3/19/20 3:49 PM, Cezary Rojewski wrote:
>>> As of commit:
>>> ASoC: soc-core: care .ignore_suspend for Component suspend
>>>
>>> function soc-core::snd_soc_suspend no longer ignores 'ignore_suspend'
>>> flag for dai links. While BE dai link for System Pin is
>>> supposed to follow standard suspend-resume flow, appended
>>> 'ignore_suspend' flag disturbs that flow and causes audio to break
>>> right after resume. Remove the flag to address this.
>>>
>>> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>> Cc: Dominik Brodowski <linux@dominikbrodowski.net>
>>> Cc: Mark Brown <broonie@kernel.org>
>>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>>
>> we should ask Ben and Curtis @ Google if the changes related to suspend =
interfere with the wake-on-voice support?
>>
>> Btw the .ignore_suspend is also set in bytcr_rt5640/51 drivers, so wonde=
ring if additional devices are broken, or if there's something off about Br=
oadwell in general. Hans, have you heard of any regressions on Baytrail dev=
ices?
>=20
> I've just tested 5.6.0 on Bay Trail + a rt5651 codec,
> using the bytcr_rt5651 machine driver which sets
> ignore_suspend, as well as on a Cherry Trail + rt5645
> device using the chtrt5645 machine driver which does
> _not_ set ignore suspend.
>=20
> Suspend/resume work fine on both and music playing
> before suspend continues playing after suspend.
>=20
> Note that the bytcr_rt5651 machine driver also does:
>=20
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 snd_soc_dapm_ignore_suspend(&=
card->dapm, "Headphone");
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 snd_soc_dapm_ignore_suspend(&=
card->dapm, "Speaker");
>=20
> Which the bdw-rt5677 seems to not do...

I just noticed something which is somewhat related to this
discussion (and also somewhat off topic).

I just noticed on a Bay Trail device with a RT5672 codec
and on a Cherry Trail device with a RT5645 codec that
if an input / recording audio stream is active while
suspending the tablet, then after resume audio is broken,
playback seems to work (audio samples get consumed at normal
speed) but it is silent.  Recording also is broken, not
sure if it is broken, or just silent too.

When this happens, closing all apps which consume audio
and waiting 5 seconds for a runtime-suspend to kick in
fixes things. After this both record and playback
works again.

Any idea what the cause for this problem might be?

I can reproduce this in 2 ways:

1. Have the sound capplet of GNOME's control-panel
open, this shows a VU meter for the default audio
input, this VU meter stops working after a suspend
resume and playback also stops working if a suspend/resume
is done with the VU meter active when suspending.

2. Start a sound recording in gnome-sound-recorder
and then suspend + resume.

Regards,

Hans

