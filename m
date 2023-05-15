Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F3C703F7E
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 23:18:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F9B51FE;
	Mon, 15 May 2023 23:17:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F9B51FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684185498;
	bh=IaxcoFr6Nt6ft3NR6WdHwpPrunBL9yvLCLfTKA/L8IM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iR7FXgHJUX8mnmFVpbWGtzMZeMByekAiUqExbPNO8b6sDrXWyq7WP5xswEhpz5NU5
	 q+rECmXQi7UpWjVAtHB8gEOMopKgZ6EpB5JojT/1C9iG6r+iJElLicPzCUyNpTgDSO
	 4s/u7m+5P2TbLD96RT6bhqmaVTJLxR/ublpiLkow=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2414F80272; Mon, 15 May 2023 23:17:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B6445F8025A;
	Mon, 15 May 2023 23:17:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15F1DF80272; Mon, 15 May 2023 23:17:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 06FBEF8016D
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 23:16:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06FBEF8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com
 header.a=rsa-sha256 header.s=fm3 header.b=OosfjjD7;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=zomwyGF7
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 7B267320095F;
	Mon, 15 May 2023 17:16:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 15 May 2023 17:16:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1684185414; x=1684271814; bh=8cLJDnxK2FqrxT5Uhqa5CYmlMZ9zz3pGLWM
	w5jBc95E=; b=OosfjjD7nuqxoXSZhs4rfwvgL8bCyN5pFsZrCpQIZuLmVLclFUw
	pea8f247KU4Ag7Uv5xUKHosYcuFlhTptG08cRnuxywB8qo0DVcS4otByQ5SnyCOx
	LHsDLOv7ulfc9OJpHVEXNucynhXSDFsHadg4/Fzj7JB+2yhA4t05QbJ4PistyLsG
	1FrFDjTGvy2iejuzerXOCCleds+1UdNt7VdSyjyMahTbs9FZp6gVt4GIbSUgVYTm
	VcU6sJpHEfHTOomWdPbnDtAkmeuPVmnjyWOPXLxnlCBpei6sO9KoHiONrVEWqztV
	+1JNpwZJRBJTYjnqkm5dAEQU+XkUceqHmaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1684185414; x=1684271814; bh=8cLJDnxK2Fqrx
	T5Uhqa5CYmlMZ9zz3pGLWMw5jBc95E=; b=zomwyGF7eaXeF1OP1qnJ/p9XEAkit
	VIGQO5XSb802VJThoh2OKPUCqET0Idp0GUv8iHEXZHKiwcYMIl7EcNmFNfkNtQ7x
	rfsp52jRX++VTp3seaDlqwlBo2HY4/jiyhjNdJWezVUE65WkqywTprMh3vjHDYZ/
	tmDVztzukx0TtCcIpg9nCqr2V5Ta31YKqhnxI6ikVHS6IJienYaASOnLi8biCDWH
	FWQV0FvF5RdGdnvdi9dufLBbN2koBftlqy4+3AZOmWc6A2XauEBtEPGsEXFFUnn6
	Imd+qKFK0dWPiuYcaFLqLz5Lc1Kw5oHUYU7yc43zic0rKJt+rOvsQPG3A==
X-ME-Sender: <xms:RaFiZIbz-ySCFZ7DASpKVIDVG4mLWJf4Nrg7GTimkIoM4sxJ_X8-gQ>
    <xme:RaFiZDYwjxcLXOxZBVaapgDalglVZ8a2a0BzgPKAMIzI2taRh9rrzd1mlYDPpmb6u
    iDKKm1H3BZ4bw>
X-ME-Received: 
 <xmr:RaFiZC9jcOpUerPdiTqyPLJsUWE6rrCEzAVf8eXGjubnqeNYn-yK4lruVIAu3KHGtM0wspGT-KkvXtE9IcV7NO-PVOECL6-0olE>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrfeehjedgudeiudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtdorredttdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeg
    ffdvvdekffeftefhkeffffdukeeuffetvdetuedtteevfedugfdujeellefgjeenucffoh
    hmrghinhepmhgrrhhmrghrvghkrdhnvghtpdihohhuthhusggvrdgtohhmpdhgihhthhhu
    sgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:RaFiZCrhLUEomDap4_Ee53hmFhVIXgTC6MCLRRdLHKfmQvds6f6rpA>
    <xmx:RaFiZDpf0DMG_AU0O4p2PXbIaTHZSetv7i7GqwePxhSGkSkFYzvxpQ>
    <xmx:RaFiZAREpdsp-zuy9VOYJCYeNkgxeUkdQJJnI1-cf6ivlNXWGCVfrw>
    <xmx:RqFiZK1ZLp8inkgtr0Yi3cAh-gk0XBBOcUhhViLeA2WQq4OsH-PUVg>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 May 2023 17:16:50 -0400 (EDT)
Date: Mon, 15 May 2023 23:16:44 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Alex Xu <alex_y_xu@yahoo.ca>,
	Harald Arnesen <harald@skogtun.org>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: Audio output heavily distorted on Xen PV dom0 if not recording
 (Intel ADL)
Message-ID: <ZGKhPxwfXJaxnjZt@mail-itl>
References: <ZGJSRmtZ5SBOLe5u@mail-itl>
 <87a5y5pdq1.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="U8XN7ph7qacrL6oH"
Content-Disposition: inline
In-Reply-To: <87a5y5pdq1.wl-tiwai@suse.de>
Message-ID-Hash: 4K2HIFVAICX43TJBCYBTIIIHNACQYDWL
X-Message-ID-Hash: 4K2HIFVAICX43TJBCYBTIIIHNACQYDWL
X-MailFrom: marmarek@invisiblethingslab.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4K2HIFVAICX43TJBCYBTIIIHNACQYDWL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--U8XN7ph7qacrL6oH
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 May 2023 23:16:44 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Alex Xu <alex_y_xu@yahoo.ca>,
	Harald Arnesen <harald@skogtun.org>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: Audio output heavily distorted on Xen PV dom0 if not recording
 (Intel ADL)

On Mon, May 15, 2023 at 10:00:06PM +0200, Takashi Iwai wrote:
> On Mon, 15 May 2023 17:39:50 +0200,
> Marek Marczykowski-G=C3=B3recki wrote:
> >=20
> > Hi,
> >=20
> > I have a rather interesting issue on HP EliteBook 1040, with Intel ADL
> > HDA. Sometimes (often) audio output is heavily distorted, but then
> > opening pavucontrol or just launching `parecord /dev/null` fixes the is=
sue
> > instantly. But, when the mixer or recording is closed, then few seconds
> > later issue comes back.
> >=20
> > You can hear this at https://cloud.marmarek.net/s/46prqZnwrqDkBdD
> > Initially recording was running, then about 10s stopped and you can
> > hear the issue few seconds later. Then I starter recording again, and
> > the issue is gone.
> > This is how it should sound: https://youtube.com/watch?v=3D4Tr0otuiQuU
> > I do not see any kernel messages when issue happens.
> >=20
> > The issue happens on Linux 6.1.26, 6.2.10, and 6.3.2. I haven't tested
> > other versions. It happens only when running under Xen (in PV dom0). The
> > very same Linux started directly works fine. Full dmesg of both native
> > and Xen boots is at https://gist.github.com/marmarek/548ee79282446344a1=
72109bcd943930
> >=20
> > When running Linux 6.3.2 there, I noticed that just after boot first
> > playback is okay, but if I start and stop recording it breaks. And then
> > after some time of idle it fixes itself again. I have not observed this
> > behavior on 6.2.10 (it was broken initially too), but I could be also
> > doing some things differently.=20
> >=20
> > I have few other ADL-based systems (but not HP), and they do not show
> > this issue, only this HP laptop is affected. Example dmesg from another
> > ADL-based system:
> > https://gist.github.com/marmarek/38c5ba3ec58f9300fbc1842ddc9fa4f5
> >=20
> > I'm not sure if that's the relevant difference, but comparing dmesg from
> > working and not working systems, I see those on boot for the
> > problematic case:
> >   snd_hda_intel 0000:00:1f.3: DSP detected with PCI class/subclass/prog=
-if info 0x040100                                                          =
                                                                           =
                                                                           =
                =20
> >   snd_hda_intel 0000:00:1f.3: Digital mics found on Skylake+ platform, =
using SOF driver                                                           =
                                                                           =
                                                                           =
                =20
> >   sof-audio-pci-intel-tgl 0000:00:1f.3: DSP detected with PCI class/sub=
class/prog-if info 0x040100                                                =
                                                                           =
                                                                           =
                =20
> >   sof-audio-pci-intel-tgl 0000:00:1f.3: Digital mics found on Skylake+ =
platform, using SOF driver                                                 =
                                                                           =
                                                                           =
                =20
> >   sof-audio-pci-intel-tgl 0000:00:1f.3: enabling device (0000 -> 0002) =
                                                                           =
                                                                           =
                                                                           =
                =20
> >   xen: registering gsi 16 triggering 0 polarity 1                      =
                                                                           =
                                                                           =
                                                                           =
                =20
> >   Already setup the GSI :16                                            =
                                                                           =
                                                                           =
                                                                           =
                =20
> >   sof-audio-pci-intel-tgl 0000:00:1f.3: DSP detected with PCI class/sub=
class/prog-if 0x040100                                                     =
                                                                           =
                                                                           =
                =20
> >   sof-audio-pci-intel-tgl 0000:00:1f.3: bound 0000:00:02.0 (ops i915_au=
dio_component_bind_ops [i915])                                             =
                                                                           =
                                                                           =
                =20
> >   sof-audio-pci-intel-tgl 0000:00:1f.3: use msi interrupt mode         =
                                                                           =
                                                                           =
                                                                           =
                =20
> >   sof-audio-pci-intel-tgl 0000:00:1f.3: hda codecs found, mask 5       =
                                                                           =
                                                                           =
                                                                           =
                =20
> >   sof-audio-pci-intel-tgl 0000:00:1f.3: using HDA machine driver skl_hd=
a_dsp_generic now                                                          =
                                                                           =
                                                                           =
                =20
> >   sof-audio-pci-intel-tgl 0000:00:1f.3: DMICs detected in NHLT tables: =
2                                                                          =
                                                                           =
                                                                           =
                =20
> >   sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware info: version 2:2:0-57=
864                                                                        =
                                                                           =
                                                                           =
                =20
> >   sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware: ABI 3:22:1 Kernel ABI=
 3:23:0                                                                    =
                                                                           =
                                                                           =
                =20
> >   sof-audio-pci-intel-tgl 0000:00:1f.3: unknown sof_ext_man header type=
 3 size 0x30                                                               =
                                                                           =
                                                                           =
                =20
> >   sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware info: version 2:2:0-57=
864                                                                        =
                                                                           =
                                                                           =
                =20
> >   sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware: ABI 3:22:1 Kernel ABI=
 3:23:0                                                                    =
                                                                           =
                                                                           =
                =20
> >   sof-audio-pci-intel-tgl 0000:00:1f.3: Topology: ABI 3:22:1 Kernel ABI=
 3:23:0                                                                    =
                                                                           =
                                                                           =
                =20
> >   skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Parent card not yet av=
ailable, widget card binding deferred                                      =
                                                                           =
                                                                           =
                =20
> >   cs35l41-hda spi0-CSC3551:00-cs35l41-hda.0: DSP1: Firmware version: 3 =
                                                                           =
                                                                           =
                                                                           =
                =20
> >   cs35l41-hda spi0-CSC3551:00-cs35l41-hda.0: DSP1: cirrus/cs35l41-dsp1-=
spk-prot-103c8974.wmfw: Fri 27 Aug 2021 14:58:19 W. Europe Daylight Time   =
                                                                           =
                                                                           =
                =20
> >   cs35l41-hda spi0-CSC3551:00-cs35l41-hda.0: DSP1: Firmware: 400a4 vend=
or: 0x2 v0.43.1, 2 algorithms                                              =
                                                                           =
                                                                           =
                =20
> >   cs35l41-hda spi0-CSC3551:00-cs35l41-hda.0: DSP1: 0: ID cd v29.63.1 XM=
@94 YM@e                                                                   =
                                                                           =
                                                                           =
                =20
> >   cs35l41-hda spi0-CSC3551:00-cs35l41-hda.0: DSP1: 1: ID f20b v0.1.0 XM=
@176 YM@0                                                                  =
                                                                           =
                                                                           =
                =20
> >   cs35l41-hda spi0-CSC3551:00-cs35l41-hda.0: DSP1: spk-prot: E:\Amp Tun=
ing\HP\840\0527\103C8972_220527.bin                                        =
                                                                           =
                                                                           =
                =20
> >   snd_hda_codec_realtek ehdaudio0D0: bound spi0-CSC3551:00-cs35l41-hda.=
0 (ops cs35l41_hda_comp_ops [snd_hda_scodec_cs35l41])                      =
                                                                           =
                                                                           =
                =20
> >   cs35l41-hda spi0-CSC3551:00-cs35l41-hda.1: DSP1: Firmware version: 3 =
                                                                           =
                                                                           =
                                                                           =
                =20
> >   cs35l41-hda spi0-CSC3551:00-cs35l41-hda.1: DSP1: cirrus/cs35l41-dsp1-=
spk-prot-103c8974.wmfw: Fri 27 Aug 2021 14:58:19 W. Europe Daylight Time   =
                                                                           =
                                                                           =
                =20
> >   cs35l41-hda spi0-CSC3551:00-cs35l41-hda.1: DSP1: Firmware: 400a4 vend=
or: 0x2 v0.43.1, 2 algorithms                                              =
                                                                           =
                                                                           =
                =20
> >   cs35l41-hda spi0-CSC3551:00-cs35l41-hda.1: DSP1: 0: ID cd v29.63.1 XM=
@94 YM@e                                                                   =
                                                                           =
                                                                           =
                =20
> >   cs35l41-hda spi0-CSC3551:00-cs35l41-hda.1: DSP1: 1: ID f20b v0.1.0 XM=
@176 YM@0                                                                  =
                                                                           =
                                                                           =
                =20
> >   cs35l41-hda spi0-CSC3551:00-cs35l41-hda.1: DSP1: spk-prot: E:\Amp Tun=
ing\HP\840\0527\103C8972_220527.bin                                        =
                                                                           =
                                                                           =
                =20
> >   snd_hda_codec_realtek ehdaudio0D0: bound spi0-CSC3551:00-cs35l41-hda.=
1 (ops cs35l41_hda_comp_ops [snd_hda_scodec_cs35l41])
> >=20
> >=20
> > Any ideas?
>=20
> Could you try to switch to the legacy HD-audio driver (e.g. by passing
> snd_intel_dspcfg.dsp_driver=3D1 option) and check whether the issue
> persists or not?  This will narrow down whether it's SOF-specific
> problem or not, at least.

This does help! With snd_intel_dspcfg.dsp_driver=3D1 the issue doesn't
happen anymore, the audio output just works the whole time. But, the
built-in microphone disappeared, only external (unplugged) is listed. I
guess that's kind-of expected.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--U8XN7ph7qacrL6oH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmRioT8ACgkQ24/THMrX
1yxkeAf/fL5qgmpUP5v/gcjaisa6PYaT6UmdmlBmMiH3/ur11VWMqpPK1hKmsEV3
/wYPzBS2YGPMOWYHE4wVMntldQnmcx0fHc6khiSeoHcLFw5hfKlShnXsz1B9wG0Y
9xVjYNMcq1vI5FEloQRaeC7TmCQEQNxJycd/ZEchRAMH6AzvC4/MVAdaNHGgG1Dm
vb/87Jwz2rgYtFB/rygthKvU5YyB+jHG7Afo0hAIks3YMFJkqR57bk3bKfcsfyCG
VKrhl6hhUpaPZbVvPaXo90QLz4Lre0I1GdiXWvSVVvn1b5mFAcD+gFzoaTFRGqfq
cergKH/PLl7/fFVS1zx6SKtfq1WfYg==
=k02Z
-----END PGP SIGNATURE-----

--U8XN7ph7qacrL6oH--
