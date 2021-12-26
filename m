Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9F847F6A3
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Dec 2021 12:44:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A5971776;
	Sun, 26 Dec 2021 12:44:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A5971776
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640519098;
	bh=Gdbc0mKAWHgP6myoIpSCmJEHf+phJi1GxRoRstMmo+s=;
	h=From:Subject:Date:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eYzGDrtKRgO9HBiZZVLg4s1y3045xj9a+4PMNIWAzm6wWG6J3grsRfAyFvta68HFh
	 iajvHfRlXKBxkPfcLjBJ69XqgDF4A7v1O/rNSYN+58En8LuAjSvSXtLyXAsljS/Etp
	 mV1ehvEDF6CKFkp7+LNzFmcKjLsbiY7cf8Ne1WsM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1783F80227;
	Sun, 26 Dec 2021 12:43:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25CB5F8020C; Sun, 26 Dec 2021 12:43:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39755F800F5
 for <alsa-devel@alsa-project.org>; Sun, 26 Dec 2021 12:43:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39755F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HE0ks3fH"
Received: by mail-ed1-x534.google.com with SMTP id w16so50806073edc.11
 for <alsa-devel@alsa-project.org>; Sun, 26 Dec 2021 03:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :cc:to; bh=Gdbc0mKAWHgP6myoIpSCmJEHf+phJi1GxRoRstMmo+s=;
 b=HE0ks3fHCcBPdeyPIsoifbqDZTGd8GnRRPwU2R8IvLNjkEoqt26zVzelv8b3DMT/P1
 1aMiizHMDNdnDW6j3jFnHETBELy0POxOuHENpxkFAZqhxzX4zg5eUZ/Jo9hcW0wqBy7s
 8ycAlF/ND6bMxCMqcLm5zVwacMqkQD3CTT/v3rkYh+qprPF6vG9MdaCfweBbV5pwdazx
 ZfpkhPvZohyMpb5npoh9RC1SesZeBRSTmKmWL1XGtYsExS8db3S36gSBU03Fk8B208Mp
 VeUEvcSFYQZitsDO2ta9QWEn/srAfNrHG39rz9ez8Tktcx0PakqHsWmc18qNkYZ5+SZQ
 PFzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:cc:to;
 bh=Gdbc0mKAWHgP6myoIpSCmJEHf+phJi1GxRoRstMmo+s=;
 b=48FW3xlRdqc/4gBkV5B5luq8xWcrLwuKsBqwHW90ujQkrBb6RJaUUECd6ex6iMO82K
 ueyTLwXko/KE618SOUEduIK/wFBQH25dx5UUhwoqetWYrerKsuloTRClyYClb/c/8bbD
 o+kk4GYWTbQ9sxLBdj73x/yLiaLseiCvUnpzMWad3nEMl9EQEu6P83cT73va9/aUDxMt
 YyvD+NkiUqExROBAw7B2ZEAWxZQpql+fBh2wiLbfv58Gtw2MHmzv8TCtLYpVwo4HOW8i
 zpDiejTsE5P9HEITZ8TajhCAW9TClTQot6xqmTEMCgp+0apQVU2aJ6BquaKhVn9C1qUM
 x8dg==
X-Gm-Message-State: AOAM532Gjzuxa6mWGccXO5fUs135tK6aM/U//UdU08M+xp98fkwkoZru
 jU6fZFAnPQuiM/v0Keh4C4qx+wN9uAA=
X-Google-Smtp-Source: ABdhPJz4A6PvsLwR7NWVxil/RjyK2z20P5LZxN0jA2yOivUfhD70vP66o2y60UIy6zpGgrkldTwZwA==
X-Received: by 2002:a17:907:a42b:: with SMTP id
 sg43mr11025344ejc.717.1640519020982; 
 Sun, 26 Dec 2021 03:43:40 -0800 (PST)
Received: from [172.16.30.20] ([91.135.9.67])
 by smtp.gmail.com with ESMTPSA id 12sm4141673eja.187.2021.12.26.03.43.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 26 Dec 2021 03:43:40 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: [RESEND] Amlogic DPCM audio card(s) speaker placement issue
Message-Id: <ECC56215-1E02-4735-82F3-B68E73F56CB4@gmail.com>
Date: Sun, 26 Dec 2021 11:43:39 +0000
To: alsa-devel@alsa-project.org
X-Mailer: Apple Mail (2.3608.120.23.2.7)
Cc: Matthias Reichl <hias@horus.com>, linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
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

Hello alsa-dev people,

I=E2=80=99d like to describe a problem with speaker placement seen with =
the Amlogic
(meson) AIU and AXG drivers when playing multi-channel media. The =
problem=20
was traced to a failure to get the channel map via snd_pcm_get_chmap()
and further analysis showed this failed because the PCM controls are =
exposed
on a different device than the PCM stream.

e.g. on LibreTech LePotato with DPCM routing configured for HDMI output,
the hw PCM is on the single frontend device 0 but the PCM controls are
on device 2:

LePotato:~ # aplay -l
**** List of PLAYBACK Hardware Devices ****
card 0: LIBRETECHCC [LIBRETECH-CC], device 0: fe.dai-link-0 (*) []
 Subdevices: 1/1
 Subdevice #0: subdevice #0

LePotato:~ # amixer controls
numid=3D19,iface=3DMIXER,name=3D'PCM Playback Volume'
numid=3D18,iface=3DMIXER,name=3D'ACODEC Left DAC Sel'
numid=3D7,iface=3DMIXER,name=3D'ACODEC Mute Ramp Switch'
numid=3D2,iface=3DMIXER,name=3D'ACODEC Playback Channel Mode'
numid=3D3,iface=3DMIXER,name=3D'ACODEC Playback Switch'
numid=3D4,iface=3DMIXER,name=3D'ACODEC Playback Volume'
numid=3D5,iface=3DMIXER,name=3D'ACODEC Ramp Rate'
numid=3D17,iface=3DMIXER,name=3D'ACODEC Right DAC Sel'
numid=3D8,iface=3DMIXER,name=3D'ACODEC Unmute Ramp Switch'
numid=3D6,iface=3DMIXER,name=3D'ACODEC Volume Ramp Switch'
numid=3D1,iface=3DMIXER,name=3D'AIU ACODEC I2S Lane Select'
numid=3D16,iface=3DMIXER,name=3D'AIU ACODEC OUT EN Switch'
numid=3D15,iface=3DMIXER,name=3D'AIU ACODEC SRC'
numid=3D14,iface=3DMIXER,name=3D'AIU HDMI CTRL SRC'
numid=3D13,iface=3DMIXER,name=3D'AIU SPDIF SRC SEL'
numid=3D12,iface=3DPCM,name=3D'ELD',device=3D2
numid=3D11,iface=3DPCM,name=3D'IEC958 Playback Default',device=3D2
numid=3D10,iface=3DPCM,name=3D'IEC958 Playback Mask',device=3D2
numid=3D9,iface=3DPCM,name=3D'Playback Channel Map',device=3D2

=
https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/amlogic/=
meson-gxl-s905x-libretech-cc.dts#L136-L188

or on a Wetek Play 2:

WP2:~ # aplay -l
**** List of PLAYBACK Hardware Devices ****
card 0: WETEKPLAY2 [WETEK-PLAY2], device 0: fe.dai-link-0 (*) []
 Subdevices: 1/1
 Subdevice #0: subdevice #0
card 0: WETEKPLAY2 [WETEK-PLAY2], device 1: fe.dai-link-1 (*) []
 Subdevices: 1/1
 Subdevice #0: subdevice #0

WP2:~ # amixer controls
numid=3D7,iface=3DMIXER,name=3D'PCM Playback Volume'
numid=3D6,iface=3DMIXER,name=3D'AIU HDMI CTRL SRC'
numid=3D5,iface=3DMIXER,name=3D'AIU SPDIF SRC SEL'
numid=3D4,iface=3DPCM,name=3D'ELD',device=3D4
numid=3D3,iface=3DPCM,name=3D'IEC958 Playback Default',device=3D4
numid=3D2,iface=3DPCM,name=3D'IEC958 Playback Mask',device=3D4
numid=3D1,iface=3DPCM,name=3D'Playback Channel Map',device=3D4

=
https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/amlogic/=
meson-gxbb-wetek-play2.dts#L51-L97

It looks like the PCM controls of the backend hdmi-codec are not routed
through the DPCM driver the same way as PCM streams. We discussed that
issue with Jerome, the driver author, but it=E2=80=99s not clear which =
bits we
are missing. i.e. if it's something ASoC DPCM should be handling or if
some further plumbing in the card driver or userspace is needed?

Any hints into the right direction would be highly appreciated!

Christian

