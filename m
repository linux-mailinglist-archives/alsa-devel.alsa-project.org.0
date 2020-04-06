Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2D019F336
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Apr 2020 12:04:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E65482E;
	Mon,  6 Apr 2020 12:03:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E65482E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586167457;
	bh=cosRgUkETFWUpz1zrGqppVelkTb/EdiKwthvrI40eVk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zs6NUkrNZKSWPHFeonSaHo4FaOMECcndi+IJpwB/xTX1Qp7o79YrSNvvHfPcJ/UiY
	 tUC/7t8MPwlgqmnK5GBL4jvXsolP2ebStHDhxbOSM9OomhC+bzOkiLKfyfR5yLZ+bw
	 n3qIAHvhg6v2BtyG87yiN0Qqg5n59QrRqZIwkm/I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BB55F80140;
	Mon,  6 Apr 2020 12:02:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93D29F80143; Mon,  6 Apr 2020 12:02:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7947F80140
 for <alsa-devel@alsa-project.org>; Mon,  6 Apr 2020 12:02:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7947F80140
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Ep6+JiHM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586167349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YgS9jofllW0QuBHo5d2mmwkd2DEou6BQ1fGXyfMI4Ao=;
 b=Ep6+JiHMs73ijFqugyBDVCF6aR5TT6P+7kGOmajW9j+xF/edzOi73Qr/Gk2MVbhtMzgmp7
 KVAFYnU7A5auzFEuyoS4zH7R5OZuk9jLVI4PUvICCfC7hHS4Lj1qwjKeRPg+Z73xnelWzs
 2RVHcXmxLqHlJiFoLamkXi6L9NMsqcc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-Tf4r1xbrNN6FQYHqGsMm9w-1; Mon, 06 Apr 2020 06:02:25 -0400
X-MC-Unique: Tf4r1xbrNN6FQYHqGsMm9w-1
Received: by mail-wr1-f70.google.com with SMTP id j12so8066408wrr.18
 for <alsa-devel@alsa-project.org>; Mon, 06 Apr 2020 03:02:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/mR6gIV+wuubIGgZz93LSyLFuIVoxIq74tLYTafenVM=;
 b=K6mp13EHC/PlDlU3qYhSV414lxiXZFmsDKKCkVkPnHnjABbz334yMJUrcbgylMMrRQ
 NN7W70apztf0mTYX3lqF6w7MMbaU99Z2gXqWFG749gD2OurCrpQSwFpsGtOrx9OCXyv7
 cLUqq6J1xuAoZcwOJz7ubAxoH0Ev2ldY3hWpf9g5vHfmvYOQ+j53oMMXcu3vCuj5orsc
 cejRQrVmpH8bZ2hM/3yS/vNYYXvXZX4MElL4vpZX6qvFmgQKOfPJn+qDbH7//I/OdS0G
 Cx6LVt36j19LLcgSZw6Wqhj2WbVhZefQL0OZdv8MTUBSnPS8tv4QdsJiQqGMbBjghNbu
 1cwg==
X-Gm-Message-State: AGi0PuaI7VY1B3wWk4TrG9Enbs3IjgA9nnNMKYf/bSJ/o5PeLUVt5snY
 MtCZHizvgIEar3p85YEh2h87lNn6tAajThzfKHrXfgYOXZJ/Z9VXVORLvT+/4/vs1tymUMHqQWj
 +IDyRQeTnc9zbKEaCLH0Nz90=
X-Received: by 2002:a1c:418b:: with SMTP id
 o133mr22646343wma.165.1586167344235; 
 Mon, 06 Apr 2020 03:02:24 -0700 (PDT)
X-Google-Smtp-Source: APiQypKNqKUBxnjDRAvcx7MD40/C9psRpFFIEbt1ML2lfHU0A7y+WgLDG8bNuGAdDfev6VVnTvEvpg==
X-Received: by 2002:a1c:418b:: with SMTP id
 o133mr22646323wma.165.1586167343987; 
 Mon, 06 Apr 2020 03:02:23 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id s9sm25435245wmc.2.2020.04.06.03.02.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Apr 2020 03:02:23 -0700 (PDT)
Subject: Re: [PATCH 5/5] cht-bsw-rt5672: Fix HiFi-stereo-dmic2 conf not
 loading / working
To: Jaroslav Kysela <perex@perex.cz>
References: <20200405183454.34515-1-hdegoede@redhat.com>
 <20200405183454.34515-5-hdegoede@redhat.com>
 <1e466650-dc6f-4757-a36b-6f32639e99be@perex.cz>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <ff639b67-cfd8-f094-a385-f709b9d969f5@redhat.com>
Date: Mon, 6 Apr 2020 12:02:22 +0200
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

Ok so I found the following weird:

RemoveDevice."Speaker2" "Speaker2"

At a hunch I removed the extra "Speaker2", now I get:

[hans@localhost ~]$ alsaucm -c cht-bsw-rt5672 set _verb HiFi set _enadev Sp=
eaker
ALSA lib parser.c:1138:(verb_dev_list_add) error: unable to find device 'Mi=
c1'
...

Notice the error changed from being about Speaker2 to Mic1, so this looks g=
ood,
but then I did the same with the:

RemoveDevice."Mic1" "Mic1"

Line, dropping the extra "Mic1" I get:

[hans@localhost ~]$ alsaucm -c cht-bsw-rt5672 set _verb HiFi set _enadev Sp=
eaker
ALSA lib parser.c:1183:(verb_device_management) error: cannot remove device=
 'Mic'
...

Which is weird...

Even weirder I was thinking that the Rename + Remove lines should be after =
the last
include, so that they also get applied to the Conflicting devices of e.g . =
the
Headphones Section Device, but if I move the Rename + Remove lines for the =
Mic
to the end of the HiFi-stereo-dmic2.conf file I get:

[hans@localhost ~]$ alsaucm -c cht-bsw-rt5672 set _verb HiFi set _enadev Sp=
eaker
ALSA lib conf.c:1928:(_snd_config_load_with_include) _toplevel_:23:0:Unexpe=
cted end of file
ALSA lib utils.c:285:(uc_mgr_config_load) could not load configuration file=
 /usr/share/alsa/ucm2/cht-bsw-rt5672/HiFi-stereo-dmic2.conf
ALSA lib parser.c:1349:(parse_verb_file) error: failed to open verb file /u=
sr/share/alsa/ucm2/cht-bsw-rt5672/HiFi-stereo-dmic2.conf : 0
ALSA lib main.c:962:(snd_use_case_mgr_open) error: failed to import cht-bsw=
-rt5672 use case configuration -22
alsaucm: error failed to open sound card cht-bsw-rt5672: Invalid argument


Regards,

Hans


