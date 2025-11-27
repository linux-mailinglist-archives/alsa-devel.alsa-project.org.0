Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C84CB00EF
	for <lists+alsa-devel@lfdr.de>; Tue, 09 Dec 2025 14:30:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A9AD601F4;
	Tue,  9 Dec 2025 14:29:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A9AD601F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765287003;
	bh=NuF5IlJSliv7dduKXxzuAMnmr2O5+kS9hhU6jsMo2mw=;
	h=From:Date:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=q9OqNm745VfuxaVHGi1LMVH9+Hl94kEJtaChihdP33AxT3MBy0ueyQBncF6vhAqJA
	 +8G9A3aQb4huKSMwb/kRq2upuTseigKBFXwgdmvnN543DkW3Eu4EhlbP+SlUcbpaKZ
	 OgPpNcfh6ryjqBAvzUCCR7vfxMwaxzb67qJMSIXM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8609F80618; Tue,  9 Dec 2025 14:29:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 34E78F80602;
	Tue,  9 Dec 2025 14:29:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2EE32F80087; Thu, 27 Nov 2025 08:10:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-0.5 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,NML_ADSP_CUSTOM_MED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A058AF80087
	for <alsa-devel@alsa-project.org>; Thu, 27 Nov 2025 08:09:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A058AF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=TOEKd9KM
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-8823d5127daso5601086d6.0
        for <alsa-devel@alsa-project.org>;
 Wed, 26 Nov 2025 23:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764227393; x=1764832193;
 darn=alsa-project.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7qDpw//a4R5VvRtm7uZbHX0/pcASypZrERLxOL91hD8=;
        b=TOEKd9KMFPKGA6GfegFeKrGVr++5Y07tzpqvEUuLl0fYdRosFq/AL3aXacaAAnlKgM
         ZbHGnb46sYuywiMRLw9LJt6Mi3JngTTzDiJtLs9J4+mQ0BleW2LHHNAjHBvAEuUhoTsO
         lw6FESNoBxU+QiL3uZUM8smDFn/UghjQP2agrZORxxv1klRVp6zexUw42QHmyxC55nos
         oMHLl+DgdmC3VoSbgQLvvWHy3WqHGacl4+pJ0gstd+56NvIAb9LD9ZYBooycn4kJUBMJ
         dbx6u7/TWytOpsziDTSkAEZ1j33R/IlYzrusXhQO5rMyMin6r7qXfwPGBFMKEuEARS2C
         J1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764227393; x=1764832193;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7qDpw//a4R5VvRtm7uZbHX0/pcASypZrERLxOL91hD8=;
        b=Bh5Q4Vx9MyT4Y7IC2Ll9oMeNF/cef2WXGZplcxyYvuwMCfXT3WDSPGIDnqxtDETGS9
         V6zG1fO/fjQdb2Ve7TFC+xMu9qXc3FxdtGf/uQ5x7wSfkwKh856TIOHRRg7mSxuFRbPo
         eLZNik4oeTBFwcVOLBVuHGqeTpjsV6grDpwgncbR7pMm3c+k7+Vz2nWz6lBbkeRmDL6W
         6+tCa6LHk/lqEe0kwriSeZso8VoCsRlYOTo5yAgbWv5rzK+IFdMe2wzAnqKH+Nb+bIUM
         cjtiX1yURBiS9O4vZ6bwSKTekOxfYBHeLeJTghTqvInLqZYG+y+rPXOmHZq/53HMu+RJ
         0vBA==
X-Gm-Message-State: AOJu0YyzL9WSf94zjq6CTIJm/6KjHpSoCssXwuLPxYxEJJ9iJtpgkNRA
	JcwZZ4OsfJg7ZNnFnpUsmuXo3p/m/TbJg7UAn/kHrvIg7Mh5McHZfYQToQwC3udl2+khwU5IFRZ
	S6Zx3bWJ2SsMVyPByNA3Ilwa0Rl6tNDLRnDxu+Lk=
X-Gm-Gg: ASbGncvC6FrcMXOoq+21M0ah7cVlwkMuX9S1Ko2mLw/6ruiNW9OikEoVoZd6zAC3RK9
	flOWJi42wmXvCxZndJ2DgdNnadQ/mr0U4XsW2SZNJMVJrl5/zn312YCDhmccY03/WlP+LxA9BwC
	p72/9SBAMv2bT1nLafikPmyL1713zeXbqRPJNQZOXIAzh/Ke1XPyrfeqMilEr+YGWIARPtnuVDy
	uTk6HXOPjW3VKTbWjzDIgw3u6vJgSKNyCti/gIj7ICPK6hwyvKxZyCESMmAa1r8Nt2lB9h0
X-Google-Smtp-Source: 
 AGHT+IEhqIP+q5xk5I9MdjOIjKBy0VTH73Hs6EnLoHJyIFqLWWha+9r7OY9vyw6msnuS7adtao2b2x3/ijTSjd+ccJM=
X-Received: by 2002:a05:6214:194b:b0:882:401c:e391 with SMTP id
 6a1803df08f44-8847c5794c7mr348563396d6.57.1764227391499; Wed, 26 Nov 2025
 23:09:51 -0800 (PST)
MIME-Version: 1.0
From: Titas Valantinas <novatitas366@gmail.com>
Date: Thu, 27 Nov 2025 09:09:40 +0200
X-Gm-Features: AWmQ_bnCxt4LFa8ThhvXB3cX0wsBjbXXE8Rqrpcx8U9ltGEesrE41Zh-BGqQWnI
Message-ID: 
 <CAAS2jrV2FdSVb7L7fcVAYAPKU9iZs2RKG=qx-6RpC3cx-W2GrA@mail.gmail.com>
Subject: =?UTF-8?Q?Lenovo_Yoga_7_2=2Din=2D1_16AKP10=2C_Realtek_ALC287_codec_?=
	=?UTF-8?Q?=E2=80=93_Bottom_speakers_not_responding_to_volume_control_in_linu?=
	=?UTF-8?Q?x?=
To: alsa-devel@alsa-project.org
Content-Type: multipart/mixed; boundary="000000000000f945ce06448e325b"
X-MailFrom: novatitas366@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: VOIS37TVHZTGE4GZT6INTZQGPKRABE6O
X-Message-ID-Hash: VOIS37TVHZTGE4GZT6INTZQGPKRABE6O
X-Mailman-Approved-At: Tue, 09 Dec 2025 13:28:50 +0000
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VOIS37TVHZTGE4GZT6INTZQGPKRABE6O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--000000000000f945ce06448e325b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

different outputs of aplay, arecord, codec, dmesg, lspci commands.

Hardware:
- Laptop: Lenovo Yoga 7 2-in-1 16AKP10
- Audio: Intel HDA (Realtek ALC287 codec, quad speaker setup: 2 top + 2 bot=
tom)

Software:
- Distribution: [CachyOS]
- Kernel: [6.17.0-rc5-2-cachyos-rc and 6.16.6-3 (same result in both
kernel versions)]
- ALSA version: [Advanced Linux Sound Architecture Driver Version
k6.17.0-rc5-2-cachyos-rc. (got with command cat /proc/asound/version)]
- Desktop environment: [KDE Wayland]

Problem:
When adjusting system volume, only the top speakers change their volume
The bottom speakers keep playing at full volume regardless of system
settings. (expect when volume goes to 0 or mutes then all speakers
mute)

Steps tried:
- Tested with PipeWire
- Checked `alsamixer`: only one speaker group responds to volume changes.
- In Windows 11, all four speakers respond correctly =E2=86=92 confirms har=
dware works.
- Updated BIOS, firmware, and kernel =E2=86=92 issue persists.

Expected result:
- All four speakers (top + bottom) should respond to system volume control.

Actual result:
- Only the top speakers change volume. Bottom speakers remain loud at all t=
imes.

alsa-info.sh result:
http://alsa-project.org/db/?f=3D1e9f3782e184d05a0ef932305d6ac04bacbd51ad


sudo dmidecode -s system-product-name
sudo dmidecode -s system-version
sudo dmidecode -s system-manufacturer

results:
83JU
Yoga 7 2-in-1 16AKP10
LENOVO


dmesg | grep -iE 'snd|hda' result:
[    0.199062] ACPI: \_SB_.PCI0.GPPA.HDAU.PWRS: New power resource
[    5.701995] snd_acp_pci 0000:04:00.5: enabling device (0000 -> 0002)
[    5.704462] snd_hda_intel 0000:04:00.1: enabling device (0000 -> 0002)
[    5.704483] snd_hda_intel 0000:04:00.1: Handle vga_switcheroo audio clie=
nt
[    5.704544] snd_hda_intel 0000:04:00.6: enabling device (0000 -> 0002)
[    5.722776] snd_hda_intel 0000:04:00.1: bound 0000:04:00.0 (ops
amdgpu_dm_audio_component_bind_ops [amdgpu])
[    5.743110] snd_hda_codec_alc269 hdaudioC1D0: ALC287: picked fixup
for PCI SSID 17aa:38b5
[    5.743523] snd_hda_codec_alc269 hdaudioC1D0: autoconfig for
ALC287: line_outs=3D2 (0x17/0x14/0x0/0x0/0x0) type:speaker
[    5.743526] snd_hda_codec_alc269 hdaudioC1D0:    speaker_outs=3D0
(0x0/0x0/0x0/0x0/0x0)
[    5.743527] snd_hda_codec_alc269 hdaudioC1D0:    hp_outs=3D1
(0x21/0x0/0x0/0x0/0x0)
[    5.743528] snd_hda_codec_alc269 hdaudioC1D0:    mono: mono_out=3D0x0
[    5.743528] snd_hda_codec_alc269 hdaudioC1D0:    inputs:
[    5.743529] snd_hda_codec_alc269 hdaudioC1D0:      Mic=3D0x19

If you need more logs, I can provide them.

Thank you in advance for the help.

--000000000000f945ce06448e325b
Content-Type: application/gzip;
	name="aplay-arecord-codec-dmesg-lspci-outputs.tar.gz"
Content-Disposition: attachment;
	filename="aplay-arecord-codec-dmesg-lspci-outputs.tar.gz"
Content-Transfer-Encoding: base64
Content-ID: <f_mih37dxd0>
X-Attachment-Id: f_mih37dxd0

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
--000000000000f945ce06448e325b--
