Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E3F7031C0
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 17:41:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB82A1D7;
	Mon, 15 May 2023 17:40:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB82A1D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684165262;
	bh=hztEnAUMnK28y+fZ4Fa1YltwPx6EsPwSx5QKFF7ZhhY=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JpX562YlrCgEQhEFPp3Tw67VxLqco6IkkxV8cPvhgHeYpOBkgCykQeLYSU08e3j0+
	 q1iXFZrtRBAFMg+RIM0ydUdQpYzOlhPoW3ITrfXK2+YKrf01NhcLO9xAfMfqwoslYk
	 MGap5dor6luiSpcOISYupXOc48YuqrSJi436Nuf8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45CF7F80431; Mon, 15 May 2023 17:40:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D8466F8025A;
	Mon, 15 May 2023 17:40:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC3E6F80272; Mon, 15 May 2023 17:40:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 89C6CF8016D
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 17:39:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89C6CF8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com
 header.a=rsa-sha256 header.s=fm3 header.b=hZUJlpID;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=wHpoPfHB
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id A9FA85C0159;
	Mon, 15 May 2023 11:39:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 15 May 2023 11:39:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:sender:subject:subject:to:to; s=fm3; t=1684165195; x=
	1684251595; bh=AVssNG9BSVypwRqGHj/kFH/S52Gl0uPTVICyWkI9P/0=; b=h
	ZUJlpIDxpWNR8IZEe9PvB/YmRXOIf6zeZLIMqIBagPIp+EaeIY2XbI1vUZ7/8DwA
	GW9Yz/8Tn8z/plhvPZk+5ij+HSB/ROQzkYhJEzmrnt8TD1VtYTQiObx8HiTS9n+j
	Pmk6DLmqkZiww2rB9xTy6lZMkJ2ef3YnI17hbw+rQasLjEZ/BL1OJECSVWp1tVBZ
	M6i4jrb67u3Xo7ISty+FVD8c43MKjIUvM+jplQ8trNDwyrj2BeiIZVmtvSC5HOwi
	edIP+XYYBgdMlbdiPcYbwRnMmBjxhmVzsJxKsAw/BztmIyO/VcLqylEBUIGZSGJV
	jttFRd+Qhi2zR/TZYKDIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1684165195; x=1684251595; bh=AVssNG9BSVypwRqGHj/kFH/S52Gl0uPTVIC
	yWkI9P/0=; b=wHpoPfHB5Yj4o1P1yQBJ4+JOblnyZSzQhQZvzh75XmAPiQMve53
	5jQDeuInngyucMzbBo/20H40Aa26husP5uHtOMTysfybWGGEwhnz9s6nCrtoKy7B
	aMWQVQ915SMvPwiG1ZFQXpSAs7yIG3XWPk2DM7HdLxfrrLTLfwZxtdCu1960IIrk
	zthqp2Vqch6TDivI8gw19UCt1ga7578DJlavPxI+U574/Z8ImGwPgQ+3eLz4iQE8
	xSRJC7R715BX27hSbcUrKbV2YKvV5dwWjvvM1FEv9tUIaEIvy80KCXSULHTWBETW
	O6m/Wos9Y5/3GFa7+wUb5YnPYI/pAkvYW3g==
X-ME-Sender: <xms:SlJiZHy0IJaiwBELHu4UQeu_Lthuvd8j1X_IXnauhC6stS49VIB7uA>
    <xme:SlJiZPRcWoDm4RnFOfCXRJAfn4UAvUCNIMjEkWZGW4LTs3WJ3X0AFTHAB1qlu85dz
    qunOHNWHIajzw>
X-ME-Received: 
 <xmr:SlJiZBUkTRYxDe8drk-F29c3jB1k1NvlCB2EAJ1q9wmTF850HXt29_omaeHhI85BeRFSWmrBR5COSfwWT52jw35Fpiz49cxLFN8>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrfeehjedgledvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkgggtugesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepveffveeh
    feegudelveellefgteeugfeuudegfeetfeektdehfeevuedvgfduleffnecuffhomhgrih
    hnpehmrghrmhgrrhgvkhdrnhgvthdphihouhhtuhgsvgdrtghomhdpghhithhhuhgsrdgt
    ohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:SlJiZBingos-7XzFHSiPYefZlznpuMwBTRRRtaNZ8FXOEr2QnADcPw>
    <xmx:SlJiZJB5JN8hsYTOsnaLsuzMi-q4m2b9WhF22NG7uqBlbnzzQm1DTQ>
    <xmx:SlJiZKK-ZTkc3EJzB0zNc4VZxY6xy2x0P22FRD3ELgn0fNMesXn8hg>
    <xmx:S1JiZMMozykOKax36SegaNqJlC2ntBHNYEpEurKxcpFeW5NyJabjQA>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 May 2023 11:39:53 -0400 (EDT)
Date: Mon, 15 May 2023 17:39:50 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>, Alex Xu <alex_y_xu@yahoo.ca>,
	Harald Arnesen <harald@skogtun.org>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Audio output heavily distorted on Xen PV dom0 if not recording
 (Intel ADL)
Message-ID: <ZGJSRmtZ5SBOLe5u@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="H6ORtSF8lCkI8Lt0"
Content-Disposition: inline
Message-ID-Hash: UVX7R27XEM33HT7P5PUNFMYVAYC4LHZY
X-Message-ID-Hash: UVX7R27XEM33HT7P5PUNFMYVAYC4LHZY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UVX7R27XEM33HT7P5PUNFMYVAYC4LHZY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--H6ORtSF8lCkI8Lt0
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 May 2023 17:39:50 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>, Alex Xu <alex_y_xu@yahoo.ca>,
	Harald Arnesen <harald@skogtun.org>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Audio output heavily distorted on Xen PV dom0 if not recording
 (Intel ADL)

Hi,

I have a rather interesting issue on HP EliteBook 1040, with Intel ADL
HDA. Sometimes (often) audio output is heavily distorted, but then
opening pavucontrol or just launching `parecord /dev/null` fixes the issue
instantly. But, when the mixer or recording is closed, then few seconds
later issue comes back.

You can hear this at https://cloud.marmarek.net/s/46prqZnwrqDkBdD
Initially recording was running, then about 10s stopped and you can
hear the issue few seconds later. Then I starter recording again, and
the issue is gone.
This is how it should sound: https://youtube.com/watch?v=3D4Tr0otuiQuU
I do not see any kernel messages when issue happens.

The issue happens on Linux 6.1.26, 6.2.10, and 6.3.2. I haven't tested
other versions. It happens only when running under Xen (in PV dom0). The
very same Linux started directly works fine. Full dmesg of both native
and Xen boots is at https://gist.github.com/marmarek/548ee79282446344a17210=
9bcd943930

When running Linux 6.3.2 there, I noticed that just after boot first
playback is okay, but if I start and stop recording it breaks. And then
after some time of idle it fixes itself again. I have not observed this
behavior on 6.2.10 (it was broken initially too), but I could be also
doing some things differently.=20

I have few other ADL-based systems (but not HP), and they do not show
this issue, only this HP laptop is affected. Example dmesg from another
ADL-based system:
https://gist.github.com/marmarek/38c5ba3ec58f9300fbc1842ddc9fa4f5

I'm not sure if that's the relevant difference, but comparing dmesg from
working and not working systems, I see those on boot for the
problematic case:
  snd_hda_intel 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if =
info 0x040100                                                              =
                                                                           =
                                                                           =
            =20
  snd_hda_intel 0000:00:1f.3: Digital mics found on Skylake+ platform, usin=
g SOF driver                                                               =
                                                                           =
                                                                           =
            =20
  sof-audio-pci-intel-tgl 0000:00:1f.3: DSP detected with PCI class/subclas=
s/prog-if info 0x040100                                                    =
                                                                           =
                                                                           =
            =20
  sof-audio-pci-intel-tgl 0000:00:1f.3: Digital mics found on Skylake+ plat=
form, using SOF driver                                                     =
                                                                           =
                                                                           =
            =20
  sof-audio-pci-intel-tgl 0000:00:1f.3: enabling device (0000 -> 0002)     =
                                                                           =
                                                                           =
                                                                           =
            =20
  xen: registering gsi 16 triggering 0 polarity 1                          =
                                                                           =
                                                                           =
                                                                           =
            =20
  Already setup the GSI :16                                                =
                                                                           =
                                                                           =
                                                                           =
            =20
  sof-audio-pci-intel-tgl 0000:00:1f.3: DSP detected with PCI class/subclas=
s/prog-if 0x040100                                                         =
                                                                           =
                                                                           =
            =20
  sof-audio-pci-intel-tgl 0000:00:1f.3: bound 0000:00:02.0 (ops i915_audio_=
component_bind_ops [i915])                                                 =
                                                                           =
                                                                           =
            =20
  sof-audio-pci-intel-tgl 0000:00:1f.3: use msi interrupt mode             =
                                                                           =
                                                                           =
                                                                           =
            =20
  sof-audio-pci-intel-tgl 0000:00:1f.3: hda codecs found, mask 5           =
                                                                           =
                                                                           =
                                                                           =
            =20
  sof-audio-pci-intel-tgl 0000:00:1f.3: using HDA machine driver skl_hda_ds=
p_generic now                                                              =
                                                                           =
                                                                           =
            =20
  sof-audio-pci-intel-tgl 0000:00:1f.3: DMICs detected in NHLT tables: 2   =
                                                                           =
                                                                           =
                                                                           =
            =20
  sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware info: version 2:2:0-57864 =
                                                                           =
                                                                           =
                                                                           =
            =20
  sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware: ABI 3:22:1 Kernel ABI 3:2=
3:0                                                                        =
                                                                           =
                                                                           =
            =20
  sof-audio-pci-intel-tgl 0000:00:1f.3: unknown sof_ext_man header type 3 s=
ize 0x30                                                                   =
                                                                           =
                                                                           =
            =20
  sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware info: version 2:2:0-57864 =
                                                                           =
                                                                           =
                                                                           =
            =20
  sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware: ABI 3:22:1 Kernel ABI 3:2=
3:0                                                                        =
                                                                           =
                                                                           =
            =20
  sof-audio-pci-intel-tgl 0000:00:1f.3: Topology: ABI 3:22:1 Kernel ABI 3:2=
3:0                                                                        =
                                                                           =
                                                                           =
            =20
  skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Parent card not yet availa=
ble, widget card binding deferred                                          =
                                                                           =
                                                                           =
            =20
  cs35l41-hda spi0-CSC3551:00-cs35l41-hda.0: DSP1: Firmware version: 3     =
                                                                           =
                                                                           =
                                                                           =
            =20
  cs35l41-hda spi0-CSC3551:00-cs35l41-hda.0: DSP1: cirrus/cs35l41-dsp1-spk-=
prot-103c8974.wmfw: Fri 27 Aug 2021 14:58:19 W. Europe Daylight Time       =
                                                                           =
                                                                           =
            =20
  cs35l41-hda spi0-CSC3551:00-cs35l41-hda.0: DSP1: Firmware: 400a4 vendor: =
0x2 v0.43.1, 2 algorithms                                                  =
                                                                           =
                                                                           =
            =20
  cs35l41-hda spi0-CSC3551:00-cs35l41-hda.0: DSP1: 0: ID cd v29.63.1 XM@94 =
YM@e                                                                       =
                                                                           =
                                                                           =
            =20
  cs35l41-hda spi0-CSC3551:00-cs35l41-hda.0: DSP1: 1: ID f20b v0.1.0 XM@176=
 YM@0                                                                      =
                                                                           =
                                                                           =
            =20
  cs35l41-hda spi0-CSC3551:00-cs35l41-hda.0: DSP1: spk-prot: E:\Amp Tuning\=
HP\840\0527\103C8972_220527.bin                                            =
                                                                           =
                                                                           =
            =20
  snd_hda_codec_realtek ehdaudio0D0: bound spi0-CSC3551:00-cs35l41-hda.0 (o=
ps cs35l41_hda_comp_ops [snd_hda_scodec_cs35l41])                          =
                                                                           =
                                                                           =
            =20
  cs35l41-hda spi0-CSC3551:00-cs35l41-hda.1: DSP1: Firmware version: 3     =
                                                                           =
                                                                           =
                                                                           =
            =20
  cs35l41-hda spi0-CSC3551:00-cs35l41-hda.1: DSP1: cirrus/cs35l41-dsp1-spk-=
prot-103c8974.wmfw: Fri 27 Aug 2021 14:58:19 W. Europe Daylight Time       =
                                                                           =
                                                                           =
            =20
  cs35l41-hda spi0-CSC3551:00-cs35l41-hda.1: DSP1: Firmware: 400a4 vendor: =
0x2 v0.43.1, 2 algorithms                                                  =
                                                                           =
                                                                           =
            =20
  cs35l41-hda spi0-CSC3551:00-cs35l41-hda.1: DSP1: 0: ID cd v29.63.1 XM@94 =
YM@e                                                                       =
                                                                           =
                                                                           =
            =20
  cs35l41-hda spi0-CSC3551:00-cs35l41-hda.1: DSP1: 1: ID f20b v0.1.0 XM@176=
 YM@0                                                                      =
                                                                           =
                                                                           =
            =20
  cs35l41-hda spi0-CSC3551:00-cs35l41-hda.1: DSP1: spk-prot: E:\Amp Tuning\=
HP\840\0527\103C8972_220527.bin                                            =
                                                                           =
                                                                           =
            =20
  snd_hda_codec_realtek ehdaudio0D0: bound spi0-CSC3551:00-cs35l41-hda.1 (o=
ps cs35l41_hda_comp_ops [snd_hda_scodec_cs35l41])


Any ideas?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--H6ORtSF8lCkI8Lt0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmRiUkcACgkQ24/THMrX
1yz2mwgAmMIGzSRjyG1OfL5ghFtQYQLIPnLgsJ8WY/F+vGctnASJXWn+HGcgG2a+
e2rsNrxCrBAKB732zAFIF7pU0a4FPbLG+AvajFkd/NriaZIGZK+iHQe2fKnogBMI
VzSaSHPoP1JMQwq+sMn+V7HZFnYtDcZDcXj3VFfKiEUPGlYpRxnQwJhcPe7TueEr
Mc+3H/An93BuSl+ngq3CV1SCDL5QtSZnWrQm4UDm4QdFuOoyHbrpHnOlZRYQL8+A
cQZUyFDu0d/2zmXb8PD7iL6jTBXrO1wnwF8/ppAI3vhJ0NAE68Cffem5mdmmn7HS
uzJ3OKM+CHTy+co/RIBaRDduSAWqpQ==
=Jf2h
-----END PGP SIGNATURE-----

--H6ORtSF8lCkI8Lt0--
