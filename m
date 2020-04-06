Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D36A319F34B
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Apr 2020 12:09:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EDBA1616;
	Mon,  6 Apr 2020 12:08:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EDBA1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586167775;
	bh=ZwkEezBHCmw3PGkDo8w8OyrdcWRKoeWeAgqnXj3OP/k=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q50JpTI07//qgApwjCnD4iyo7hNnejug/ukF8cKm3ko9pTtGx6kFgn2ABFUWsV3Sb
	 MRQkizscUFlsbclR+2CI/RW9OtbZkfvZNQTz3XHoV5lFuFz99qUEJF4MIv5WAVJiqY
	 25SZK5qugEc8h6OHenGEV1DkcOvwV5BJfyms777k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85AE1F80140;
	Mon,  6 Apr 2020 12:07:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23931F80143; Mon,  6 Apr 2020 12:07:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F18DF800CC
 for <alsa-devel@alsa-project.org>; Mon,  6 Apr 2020 12:07:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F18DF800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Jw8vJnrK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586167667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZwkEezBHCmw3PGkDo8w8OyrdcWRKoeWeAgqnXj3OP/k=;
 b=Jw8vJnrK52fn6KDc5tNYqLQIBGz/rsVdzAXLDIBOREZvE8j3LWJGtR0oVP08LbMuScaVaw
 dKPUNSiTxnzqN3Ep2dMV/9oHPp6wSX7T4r2LirdkwkHQ1gmHjMV83ZI+fpLv8bB1sZyK1+
 o3RYKr87r5HG0Be8WW4CWvldsp3mkl8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-h9M9h6j7O1W5Y-wIc3xj8A-1; Mon, 06 Apr 2020 06:07:45 -0400
X-MC-Unique: h9M9h6j7O1W5Y-wIc3xj8A-1
Received: by mail-wm1-f72.google.com with SMTP id s15so3949856wmc.0
 for <alsa-devel@alsa-project.org>; Mon, 06 Apr 2020 03:07:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZXhvhh732nyWAF9etIoyBflRmQCsS6M8EsR6/3H2r8M=;
 b=soG0HOmCULylb5JYqDKSjzWljhdrotrK4jt6WxpXIb8wmKRDB4U/NMEi4mRo+IUpVf
 PPqF+e00DYYf7GgejPq6XbJu89eJoD7iIVhvb6zNPq+EE2TovPclxmmlNKyRk30wvt0N
 Yikalx3Hh6lMDDXZZ5N8wNQmrt9sbhDtn4HMwTV+92M/9mU1XPMr9QnNbj3rmp74W682
 jgLOCCfqUHFc/qDthzKmzfhRGJ3kv/DDR5dCZO1HSVKDgCQzuy3yLAdCfa4Ytk6RYjO2
 tgGcpEdTii/mrVy4NXwp6IHmhye8h6gQS2CTNsoomY6pBp9sWDZRd2dVf0RSu+hgGuCE
 ckzg==
X-Gm-Message-State: AGi0PuaQc/074+NpKHbd050tFM79N3McpCFH8NmChy9/KBtbHsvSnvZ1
 8B1s/TwU0WnSslaT9kgHShbJJl3BadwtnfTQ3d8tvTXQ+7DJzCPQb8jupmfhfDHLz3qvXCzLmdq
 3rnlzxWFniq+c7HO1ODUlMHo=
X-Received: by 2002:a5d:6187:: with SMTP id j7mr24375369wru.419.1586167664512; 
 Mon, 06 Apr 2020 03:07:44 -0700 (PDT)
X-Google-Smtp-Source: APiQypJlAdYzZ/z/pAdYT8xsoEL7RBr/XOH8z2H2wD4iqzEuHw1yS9swaxB/Tx/NpCWSv4ByRihuvg==
X-Received: by 2002:a5d:6187:: with SMTP id j7mr24375344wru.419.1586167664076; 
 Mon, 06 Apr 2020 03:07:44 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id k84sm24546616wmk.2.2020.04.06.03.07.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Apr 2020 03:07:43 -0700 (PDT)
Subject: Re: [PATCH 5/5] cht-bsw-rt5672: Fix HiFi-stereo-dmic2 conf not
 loading / working
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>
References: <20200405183454.34515-1-hdegoede@redhat.com>
 <20200405183454.34515-5-hdegoede@redhat.com>
 <1e466650-dc6f-4757-a36b-6f32639e99be@perex.cz>
 <ff639b67-cfd8-f094-a385-f709b9d969f5@redhat.com>
Message-ID: <f2454e9d-a1b5-60be-d6ad-dafd1c78815a@redhat.com>
Date: Mon, 6 Apr 2020 12:07:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <ff639b67-cfd8-f094-a385-f709b9d969f5@redhat.com>
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

On 4/6/20 12:02 PM, Hans de Goede wrote:
> Hi,
>=20
> On 4/6/20 11:34 AM, Jaroslav Kysela wrote:
>> Dne 05. 04. 20 v 20:34 Hans de Goede napsal(a):
>>> Fix HiFi-stereo-dmic2 conf not loading because of references to
>>> non existing devices in the ConflictingDevices sections.
>>>
>>> Stop playing Rename + Remove tricks with the output (Speaker2) and
>>> input (DMIC1) devices which we do not want to be part of this config,
>>> this does not work now that we only allow devices which are actually
>>> part of our config in the ConflictingDevices sections.
>>
>> The Remove and Rename operations should also manage (remove and rename) =
devices in ConflictingDevices/SupportedDevices sections. What's the exact e=
rror you hit?
>>
>> If I simulate this via ucm-validator I get this device structure:
>>
>> =C2=A0=C2=A0Verb: "HiFi"
>> =C2=A0=C2=A0=C2=A0=C2=A0 File: HiFi-stereo-dmic2.conf
>> =C2=A0=C2=A0=C2=A0=C2=A0 Device: "Headphones"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ConflictingDevices.0 =3D Speaker
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Value.PlaybackPriority =3D 300
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Value.PlaybackPCM =3D 'hw:${CardId}=
'
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Value.JackControl =3D 'Headphone Ja=
ck'
>> =C2=A0=C2=A0=C2=A0=C2=A0 Device: "Headset"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ConflictingDevices.0 =3D Mic
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Value.CapturePriority =3D 300
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Value.CapturePCM =3D 'hw:${CardId}'
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Value.JackControl =3D 'Headset Mic =
Jack'
>> =C2=A0=C2=A0=C2=A0=C2=A0 Device: "Speaker"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ConflictingDevices.0 =3D Headphones
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Value.PlaybackPriority =3D 200
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Value.PlaybackPCM =3D 'hw:${CardId}=
'
>> =C2=A0=C2=A0=C2=A0=C2=A0 Device: "Mic"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ConflictingDevices.0 =3D Headset
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Value.CapturePriority =3D 200
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Value.CapturePCM =3D 'hw:${CardId}'
>>
>> It appears like an issue in alsa-lib.
>=20
> Ok so I found the following weird:
>=20
> RemoveDevice."Speaker2" "Speaker2"
>=20
> At a hunch I removed the extra "Speaker2", now I get:
>=20
> [hans@localhost ~]$ alsaucm -c cht-bsw-rt5672 set _verb HiFi set _enadev =
Speaker
> ALSA lib parser.c:1138:(verb_dev_list_add) error: unable to find device '=
Mic1'
> ...
>=20
> Notice the error changed from being about Speaker2 to Mic1, so this looks=
 good,
> but then I did the same with the:
>=20
> RemoveDevice."Mic1" "Mic1"
>=20
> Line, dropping the extra "Mic1" I get:
>=20
> [hans@localhost ~]$ alsaucm -c cht-bsw-rt5672 set _verb HiFi set _enadev =
Speaker
> ALSA lib parser.c:1183:(verb_device_management) error: cannot remove devi=
ce 'Mic'
> ...
>=20
> Which is weird...
>=20
> Even weirder I was thinking that the Rename + Remove lines should be afte=
r the last
> include, so that they also get applied to the Conflicting devices of e.g =
. the
> Headphones Section Device, but if I move the Rename + Remove lines for th=
e Mic
> to the end of the HiFi-stereo-dmic2.conf file I get:
>=20
> [hans@localhost ~]$ alsaucm -c cht-bsw-rt5672 set _verb HiFi set _enadev =
Speaker
> ALSA lib conf.c:1928:(_snd_config_load_with_include) _toplevel_:23:0:Unex=
pected end of file
> ALSA lib utils.c:285:(uc_mgr_config_load) could not load configuration fi=
le /usr/share/alsa/ucm2/cht-bsw-rt5672/HiFi-stereo-dmic2.conf
> ALSA lib parser.c:1349:(parse_verb_file) error: failed to open verb file =
/usr/share/alsa/ucm2/cht-bsw-rt5672/HiFi-stereo-dmic2.conf : 0
> ALSA lib main.c:962:(snd_use_case_mgr_open) error: failed to import cht-b=
sw-rt5672 use case configuration -22
> alsaucm: error failed to open sound card cht-bsw-rt5672: Invalid argument

Last mail, sorry about the spam.

Ok, this is caused by me removing the extra "Mic1" at the end of the Remove=
Device line.

Things still do not work with the in my mind more logical order of
having these at the end though.

Regards,

Hans

