Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCB719F2F0
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Apr 2020 11:51:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF1DC1665;
	Mon,  6 Apr 2020 11:51:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF1DC1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586166718;
	bh=IGG3WtlsMMNebsi1HSr0zvicK76jhRavSdWZ7SKm6x4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AeMrvqILXyQgGqP8GJdUxyi+smX2koiKmzCm9NyQ+gJGncA3iweTwpnSEc/c7SMcP
	 6dJdpQN0UYQtvuAvuXjXWRV1C31IDviQsZm0xDeVcN1NjZtIYrC0n5gkFu+2IlghWV
	 eroQ4kBS9pTjWlnpbJO9j963Mtf3NXxtJAHFSMX8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAE03F800CC;
	Mon,  6 Apr 2020 11:50:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06D83F80143; Mon,  6 Apr 2020 11:50:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DA5AF800CC
 for <alsa-devel@alsa-project.org>; Mon,  6 Apr 2020 11:50:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DA5AF800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Pp3c7i3H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586166611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wTLvuO4PpmqByUmaB0cZoppGUZDVyLDIUKjjjMjR2Ho=;
 b=Pp3c7i3HkB2bmXxM/BADtDF39u87sHLWTiGk6Px2aaJynwEh0c7n8j6YmuVgz9eE1z2xZE
 dudrpPB198i7Yscz0hwBp4Q+wIZ9aWqwUczjEnpDifOxgFUeOTF5ydzkVZKt/wSpdqYQi/
 wCE11ieZRrdocD6vfm4il8Kpc1OjCp4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-AY2wjVqTNl-9HYS2q6bhAg-1; Mon, 06 Apr 2020 05:50:09 -0400
X-MC-Unique: AY2wjVqTNl-9HYS2q6bhAg-1
Received: by mail-wm1-f71.google.com with SMTP id t62so1188536wma.0
 for <alsa-devel@alsa-project.org>; Mon, 06 Apr 2020 02:50:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WwsgYBdtqFMhPhYANCioYWGzZgs4pxaqwYxCxPeE6Bc=;
 b=C/IyCqgxmPy0UtickuLwoeQC3UCwZsiszXeim+raOHIDtOxDMQ2zzdPmZT7/kBqnCr
 xD9yo658FHKp3r/rG9tLjq2Rc28nTidcyPF5NqplQ0G3LB53fm3iBMmjVb2NxR0qzlMq
 tgXj4LLQ8qLQMGdAfg1Nm5ssANQk5gNiJIsAJbUy5YjPL8HCv4buBrwNDWWnqIm4ZmdX
 3VjpGRAXj7yhWORNfx4lxMM2VqQ7VwwP9oZXZTIic9qMVVhPkgNYuG+Tt2KSV2s37Za/
 iwF7mMVHkcotLFe6TEVrV4M8sC4CM1wiXwSyw2rVM/omOpcBQ6GJbPDuUK1AeYPK0UzQ
 rmEw==
X-Gm-Message-State: AGi0PuZdn5dBKy8IrZvm61RF4VVCOUenLkn5LmqN3bbfeXNGJEirU+sv
 lisxHPmn5E1Bu6Z7erIwy+Nxe3PPkopEpXhzkpFwnduFZ2fX8Qdzl/E9hJjIq5cM0FK5rXeakGO
 d50fZss0bWAQGItJ6hzXmGbU=
X-Received: by 2002:adf:e54f:: with SMTP id z15mr1241111wrm.342.1586166607898; 
 Mon, 06 Apr 2020 02:50:07 -0700 (PDT)
X-Google-Smtp-Source: APiQypIhAiZBv0G96XHbKfZvQnlpf0aik0BckrmTFvEiG4PQOfgrTLWzC6CnYjDyZCHjlpMrAuQ3TA==
X-Received: by 2002:adf:e54f:: with SMTP id z15mr1241077wrm.342.1586166607603; 
 Mon, 06 Apr 2020 02:50:07 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id z16sm10461560wrg.66.2020.04.06.02.50.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Apr 2020 02:50:07 -0700 (PDT)
Subject: Re: [PATCH 5/5] cht-bsw-rt5672: Fix HiFi-stereo-dmic2 conf not
 loading / working
To: Jaroslav Kysela <perex@perex.cz>
References: <20200405183454.34515-1-hdegoede@redhat.com>
 <20200405183454.34515-5-hdegoede@redhat.com>
 <1e466650-dc6f-4757-a36b-6f32639e99be@perex.cz>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <08414d2b-0498-4e38-3178-b7549d6534ff@redhat.com>
Date: Mon, 6 Apr 2020 11:50:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1e466650-dc6f-4757-a36b-6f32639e99be@perex.cz>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
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

On 4/6/20 11:34 AM, Jaroslav Kysela wrote:
> Dne 05. 04. 20 v 20:34 Hans de Goede napsal(a):
>> Fix HiFi-stereo-dmic2 conf not loading because of references to
>> non existing devices in the ConflictingDevices sections.
>>
>> Stop playing Rename + Remove tricks with the output (Speaker2) and
>> input (DMIC1) devices which we do not want to be part of this config,
>> this does not work now that we only allow devices which are actually
>> part of our config in the ConflictingDevices sections.
>=20
> The Remove and Rename operations should also manage (remove and rename) d=
evices in ConflictingDevices/SupportedDevices sections. What's the exact er=
ror you hit?
>=20
> If I simulate this via ucm-validator I get this device structure:
>=20
>  =C2=A0Verb: "HiFi"
>  =C2=A0=C2=A0=C2=A0 File: HiFi-stereo-dmic2.conf
>  =C2=A0=C2=A0=C2=A0 Device: "Headphones"
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ConflictingDevices.0 =3D Speaker
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Value.PlaybackPriority =3D 300
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Value.PlaybackPCM =3D 'hw:${CardId}'
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Value.JackControl =3D 'Headphone Jack'
>  =C2=A0=C2=A0=C2=A0 Device: "Headset"
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ConflictingDevices.0 =3D Mic
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Value.CapturePriority =3D 300
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Value.CapturePCM =3D 'hw:${CardId}'
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Value.JackControl =3D 'Headset Mic Jack'
>  =C2=A0=C2=A0=C2=A0 Device: "Speaker"
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ConflictingDevices.0 =3D Headphones
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Value.PlaybackPriority =3D 200
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Value.PlaybackPCM =3D 'hw:${CardId}'
>  =C2=A0=C2=A0=C2=A0 Device: "Mic"
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ConflictingDevices.0 =3D Headset
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Value.CapturePriority =3D 200
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Value.CapturePCM =3D 'hw:${CardId}'
>=20
> It appears like an issue in alsa-lib.

With an unmodified UCM2 profile I get the following:

[hans@localhost ~]$ alsaucm -c cht-bsw-rt5672 set _verb HiFi set _enadev Sp=
eaker
ALSA lib parser.c:1138:(verb_dev_list_add) error: unable to find device 'Sp=
eaker2'
ALSA lib parser.c:1433:(parse_verb_file) error: device management error in =
verb 'HiFi'
ALSA lib main.c:962:(snd_use_case_mgr_open) error: failed to import cht-bsw=
-rt5672 use case configuration -2
alsaucm: error failed to open sound card cht-bsw-rt5672: No such file or di=
rectory

Note the _enadev does not matter, things break before it gets parsed,
if I replace Speaker with XXX I get the exact same errors.

I'm happy to try any alsa-lib patches on this (Thinkpad8) hw for you.

Regards,

Hans

