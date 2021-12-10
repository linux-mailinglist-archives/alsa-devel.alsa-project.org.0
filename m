Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E9846FF77
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Dec 2021 12:08:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5979F20DA;
	Fri, 10 Dec 2021 12:07:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5979F20DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639134500;
	bh=RqBi9/3VoQjJ0h92wXXAWW4g+Rcwu/qM21BGuJRZVEw=;
	h=From:Subject:Date:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O1iuXyV1jD28gK4kUDcV+j511oJmwUiZ3aUUIMEIOXT264Th6bSr7ga+t68Fx4KHG
	 gnYfxWFfxpOgZlgam9eWoaL3K0Nhs+dRLZ8xr9YzBxe7VOt0/D21GpE3oBjKL50lmB
	 3MD8v2iy638/S5aboxC2X8xmgr3mhyStCWKb+SnQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1A09F804ED;
	Fri, 10 Dec 2021 12:07:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17ACFF8028D; Fri, 10 Dec 2021 12:07:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88AB4F8028D
 for <alsa-devel@alsa-project.org>; Fri, 10 Dec 2021 12:07:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88AB4F8028D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PzE8wHJ5"
Received: by mail-wm1-x335.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so8772533wme.0
 for <alsa-devel@alsa-project.org>; Fri, 10 Dec 2021 03:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :cc:to; bh=x9gEq6s4SQ/Y/FxoC+bzykQK0mZXKAzCdkeCzV1aA48=;
 b=PzE8wHJ5AA4Vg/9XGrhH4yAo5g4vnZzwcLKYrlFvcR4JNyvCIBHTLr4TIhwN4qxum1
 kMOxslNDujtntCR/TzSk3LiD/JSJndwUBsiCXZB89M+VbMzPEwQ1bKSMF7mh4KdRQL93
 7ARWd4oMGvhRzIecK7lo0kzJZIGrbQfN7Yc+mWIO8JW/eakLaAuXl98jtlerDeVEUh1y
 b5tl3G/sh59ZvYAcLRLZWNx9M+2e4cCbg5Qxrgkz5Vvhohixxj7J0fptwNA0n/WbBj2a
 d1TG84Fiph/jO81Rvlgt7x8r3TAJvM0M7F9K6gzVrZWm26H7CJOLZ3EsM6i2ZXUr/tD2
 KNQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:cc:to;
 bh=x9gEq6s4SQ/Y/FxoC+bzykQK0mZXKAzCdkeCzV1aA48=;
 b=KKRe/tawzb1FLTMkFIcuI8UiRI8eAhH4IYM2bEDtIZwoJAoDwBKTiNXovK9vd8xvLk
 9qOgCC3P/D2gjTskHOgBFWeE8Ah+BVe0klE2bJ3WNu6OqFK1r8k/5ptXjoU3cbZDGOrp
 HoqIDPa4dR0jUbzSAQ78FfkYkIn14KGRB3aIEYwtZvEia+t31IxEHuBVFNLSGgzRRVTx
 tdZUZzC88KkTfV3Yz60hb2BovtDRRsF0vopudPZvQ6go1PzKbi1tX42IvXs8ImGBcEe+
 ykcsjhxBJzGUo56SonutZH+xXzvsoVWs+yzcwoztFxhApz8jTTMtzVC5yAo1wKEhNMj0
 wVyg==
X-Gm-Message-State: AOAM531TWza0Em+6kpVcsKEGqHAZupRTiAy+w70Vt7WRVy65J1zl0Nnz
 7v+KsAwRKu6KP2+8wyOjwSMaRAXT7pBz5Q==
X-Google-Smtp-Source: ABdhPJwI++kvSmDLzeExD7eKzUBdlEK2U4U5g+Q0LUpop3GCZumCJMuSR2LQoGCxbBrwgOu59XJ3Og==
X-Received: by 2002:a1c:7309:: with SMTP id d9mr6727518wmb.172.1639134418400; 
 Fri, 10 Dec 2021 03:06:58 -0800 (PST)
Received: from [10.127.0.11] ([167.99.200.149])
 by smtp.gmail.com with ESMTPSA id x1sm2293334wru.40.2021.12.10.03.06.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 Dec 2021 03:06:58 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Amlogic DPCM audio card(s) speaker placement issue
Message-Id: <10DB0841-1BBB-4F06-A2A1-2B25D48A5F72@gmail.com>
Date: Fri, 10 Dec 2021 15:06:55 +0400
To: alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org
X-Mailer: Apple Mail (2.3608.120.23.2.7)
Cc: Matthias Reichl <hias@horus.com>, Jerome Brunet <jbrunet@baylibre.com>
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

Hello alsa-dev / linux-amlogic,

I=E2=80=99d like to describe a problem with speaker placement seen with =
the Amlogic
(meson) AIU and AXG audio drivers. Playing media in Kodi I=E2=80=99d =
noticed that
placement is consistently wrong; meaning the incorrect placement remains
the same over different media and Amlogic hardwares.

This was traced to a failure to get the channel map via =
snd_pcm_get_chmap()
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

