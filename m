Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF59975C0F2
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 10:11:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27E641FC;
	Fri, 21 Jul 2023 10:10:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27E641FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689927095;
	bh=vl39SjEBBiEHeU35YyItlKLjlmuTsJZ5BIP+awmUSUU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=biUlBQh3jYGUohXGNCW+Ylw4SLon7+4+ve0ZzsdKXVpgQF7H36Abd+emur+I2P4XX
	 k23VU9/zTVVerbtM9s2KeTPOaLJlolV6ajb5XrRhXuSDxk4rQ+jXPQ7JmARwkIFp2X
	 6xcYbnqGiMHalV4QDtcx6HjcnHwT8IrFZ28bxHvc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C8E8F805C5; Fri, 21 Jul 2023 10:08:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC5D1F805BE;
	Fri, 21 Jul 2023 10:08:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D569F8047D; Thu, 20 Jul 2023 04:03:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F52AF80153
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 04:03:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F52AF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=nuCKAiKA
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b73564e98dso3292371fa.3
        for <alsa-devel@alsa-project.org>;
 Wed, 19 Jul 2023 19:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689818598; x=1692410598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vl39SjEBBiEHeU35YyItlKLjlmuTsJZ5BIP+awmUSUU=;
        b=nuCKAiKAZHEPzdQuvsihNK2guhH9LSMV+QkCdAgcUL+ZAOgqWmx49M0o7aoN/j1D4U
         uv0nqL/dssH0wBjCVs2HgqQaJl80gHVqSJ8Q9tLsuwV8WjZ9NO02X/UwTvsbvtUBhMS2
         fmjKm+eBFUOgyYu0JjyHwjT9EKNFu6lrk11aow5E44BUcJUDe+j2tEPM0Uhgu6PkUZMw
         l+SimakqjaCHw1mHnPGgWaCEuW7cDf6HtPYEHw559awZkM1SzKX2ZCEDlPXGBkoS6H0l
         igYqzhRwwiyN3mVqiPBkDtETUllv6E08srnvcn6+5z18xY+xq6fFXWcLCwxRjZww3q2O
         Gdpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689818598; x=1692410598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vl39SjEBBiEHeU35YyItlKLjlmuTsJZ5BIP+awmUSUU=;
        b=DEdW6OL8PwnPrYyF+m/A9Zll3n0426+5p46aBHqYyTDLPP8PmL5a78DmRg1/oqLfTc
         5PuvOSEqkL1LaJuGvTJD1o2oAhHdxSNAXgCD3CUoKvlJ4bvL3p0UDT0qjqh0hh2Nu9kj
         tmT+FGvCpLS+5MVDIAGv7mMsMCa6v3DLdcGHf+hPsjeOYei+Rfghu5JiSaEb7/eYojLR
         S7v2bSmQ3maSK546dhDTdlxQE0ysLFeCB2KmUEIeIs4wIMEpHLi39jUMFIyn7veRSpS8
         ZrM7lJTij6Vw+/HxeLCaFjKHXJLuh1Gha6XAAbgwvx4NHf1ggPmdGdlHAbnptrOSWaFU
         /5uw==
X-Gm-Message-State: ABy/qLYfiYhv+Y9d8mdTGuS9dxjTx8w6D65Bp7JLa9sTrO6jRC7nt3xk
	GZw/qTKmH0qlB4FMWDe/eMdXjI4pdeK2Eg9Rx9g2vIezUqxOqw==
X-Google-Smtp-Source: 
 APBJJlEIdgSYcrvEm+OORHBwKAmqCLZkKjYAk//uuyohXw5xlllWNTha5gmb+grJxcjKjoIGzbrOTcCf5Fju9UdsY9A=
X-Received: by 2002:a05:651c:14b:b0:2b6:d63d:cc1e with SMTP id
 c11-20020a05651c014b00b002b6d63dcc1emr1251563ljd.51.1689818597920; Wed, 19
 Jul 2023 19:03:17 -0700 (PDT)
MIME-Version: 1.0
References: <3ee79b53-5c1b-1542-ceea-e51141e3ab74@gmail.com>
In-Reply-To: <3ee79b53-5c1b-1542-ceea-e51141e3ab74@gmail.com>
From: Racinglee <cydiaimpactor2003@gmail.com>
Date: Wed, 19 Jul 2023 19:03:06 -0700
Message-ID: 
 <CAL4Djy3KeD51LtT0bT2aRe9S_uwMiAfa-X=V2SfdnYt-MYp5ng@mail.gmail.com>
Subject: Re: 6.4 and higher causes audio distortion
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux ALSA Development <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: cydiaimpactor2003@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: O3METW2LB4NB3IPLLIYOPUXNUFL6BLHH
X-Message-ID-Hash: O3METW2LB4NB3IPLLIYOPUXNUFL6BLHH
X-Mailman-Approved-At: Fri, 21 Jul 2023 08:08:45 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O3METW2LB4NB3IPLLIYOPUXNUFL6BLHH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, Jul 15, 2023 at 3:56=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:
>
> Hi,
>
> I notice a regression report on Bugzilla [1]. Quoting from it:
>
> > I have a Lenovo ThinkPad X1 Yoga Gen 7 running Arch Linux. Linux 6.4 an=
d higher, cause audio distortion. Sometimes, this occurs to the point that =
nearly nothing is discernible. This carries over to wired headphones. The i=
ssue occurs on the entire mainline 6.4.x kernel series and also the 6.4.3 s=
table and 6.5 RC1 kernel, which are the latest at the time of writing. The =
issue occurs on both the Arch distributed kernels, and the mainline kernels=
.
> >
> > Linux kernels 6.3.x are not affected and neither is the 6.1 LTS kernel =
series which is what I am temporarily using. On Windows 10/11 too, the audi=
o works as it should. This indicates that my hardware is not at fault. Blue=
tooth audio is not impacted from my testing, either.
> >
> > The distortion doesn't start immediately. It either occurs automaticall=
y after a random amount of time, or when I increase/decrease the volume, or=
 when I skip forward/backward to a section. In order to stop the distortion=
, I have to either increase/decrease the volume until it stops, or skip for=
ward/backward until it stops, or restart Pipewire via systemd, however it s=
tarts again due to one of the aforementioned reasons.
> >
> > At the time of this report, I am running Pipewire 0.3.74 and Wireplumbe=
r 0.4.14. This also doesn't seem like a Pipewire/Wireplumber issue, since t=
hese same versions work fine on the 6.1 LTS kernels without causing any aud=
io distortion.
> >
> > I wrote about this on the Arch Linux forums, too, and seems like at lea=
st two other people are facing this issue. Here's the forum post: https://b=
bs.archlinux.org/viewtopic.php?id=3D287068
> >
> > Furthermore, I filed a bug report on the Arch Linux Bug Reporter, where=
 they suggested that the issue is a kernel regression and should be reporte=
d upstream, here. Here's the bug report that I filed on the Arch Linux Bug =
Reporter for anyone interested: https://bugs.archlinux.org/task/79081?proje=
ct=3D1&pagenum=3D10
> >
> > I have attached the dmesg outputs of the mainline 6.5 RC1 kernel.
> >
> > Here's some audio related hardware information from my device:
> >
> > inxi -A
> >
> > Audio:
> > Device-1: Intel Alder Lake PCH-P High Definition Audio
> > driver: sof-audio-pci-intel-tgl
> > API: ALSA v: k6.5.0-rc1-1-mainline status: kernel-api
> >
> >
> > pactl info
> >
> > Server String: /run/user/1000/pulse/native
> > Library Protocol Version: 35
> > Server Protocol Version: 35
> > Is Local: yes
> > Client Index: 138
> > Tile Size: 65472
> > User Name: tux
> > Host Name: NSA-Terminal-4
> > Server Name: PulseAudio (on PipeWire 0.3.74)
> > Server Version: 15.0.0
> > Default Sample Specification: float32le 2ch 48000Hz
> > Default Channel Map: front-left,front-right
> > Default Sink: alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic=
.HiFi__hw_sofhdadsp__sink
> > Default Source: alsa_input.pci-0000_00_1f.3-platform-skl_hda_dsp_generi=
c.HiFi__hw_sofhdadsp_6__source
> > Cookie: f9dc:5e7a
> >
> >
> > I can't figure out why this is happening. Kindly ask for any more infor=
mation that is necessary. Thank you.
>
> See Bugzilla for the full thread and attached dmesg.
>
> Anyway, I'm adding it to regzbot so that it doesn't fall through
> cracks unnoticed:
>
> #regzbot introduced: v6.3..v6.4 https://bugzilla.kernel.org/show_bug.cgi?=
id=3D217673
> #regzbot title: PipeWire + Wireplumber audio distortion on Lenovo ThinkPa=
d X1 Yoga Gen 7
> #regzbot link: https://bbs.archlinux.org/viewtopic.php?id=3D287068
> #regzbot link: https://bugs.archlinux.org/task/79081?project=3D1&pagenum=
=3D10
>
> Thanks.
>
> [1]: https://bugzilla.kernel.org/show_bug.cgi?id=3D217673
>
> --
> An old man doll... just what I always wanted! - Clara

Updating regzbot after newer findings and determinations about the
possible culprit commit

#regzbot title: 6.4 and higher causes audio distortion

#regzbot introduced: v6.4-rc1..1bf83fa6654c
https://bugzilla.kernel.org/show_bug.cgi?id=3D217673#c5
