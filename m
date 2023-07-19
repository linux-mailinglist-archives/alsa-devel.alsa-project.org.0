Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF7D75C0F0
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 10:11:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E98B1207;
	Fri, 21 Jul 2023 10:10:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E98B1207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689927068;
	bh=7J1nIPyuGYSf3HOqYO7UBi0MnJCgENrksGlqEcnDaSk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DdNuiaJ51crn2kpQy0VG1pSTSiljsU5EeQ0W4J4V1YMk2cjHsBb41U9BRHz7WlmWe
	 WqPd5EMAN0YH4VP+gxgDfzqq669gRcCxUBtLrvhYr0TNQ7SkfjUWBvS74E1yLaVQ/7
	 cqM3t5bL911T7KHM8pc3dxx0ad86BnIO+2dIEzlg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 349CBF805B3; Fri, 21 Jul 2023 10:08:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D759F805A9;
	Fri, 21 Jul 2023 10:08:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA6F9F8047D; Wed, 19 Jul 2023 23:04:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sender11-of-o51.zoho.eu (sender11-of-o51.zoho.eu
 [31.186.226.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A378F800D2
	for <alsa-devel@alsa-project.org>; Wed, 19 Jul 2023 23:03:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A378F800D2
ARC-Seal: i=1; a=rsa-sha256; t=1689800607; cv=none;
	d=zohomail.eu; s=zohoarc;
	b=JHx7AR6Hnr1doh8CJzPCNrmUNzfJU1XJxjnHcmIGnQOt04V8Z1WhPxec4MAv2PMNA9PQVGZDCphNad9mViIyndr2hyGnWdKVIDC7LXbgEtjlCdLvIp7WebALu2dVaUWtpVaQfCaw9+Snuel+Z37c6ejIKcdKMELQImynXg9woH4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu;
 s=zohoarc;
	t=1689800607;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
	bh=7J1nIPyuGYSf3HOqYO7UBi0MnJCgENrksGlqEcnDaSk=;
	b=cntOCeOM2L4XqmWVInhZhbwjXv4tsULHch2FmN6UWrPeocY2hM3MMld7qZBDacchP4qOX6mRiYylet+VNUx9K6zZM/fi5VpEk5VJ+qGxjPVBxbUMs4l/5ooqz8lXJo38kPymbtZy15u6+5gR9D2AOm2LUk21XsQI7r4Ogd2oNQs=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	spf=pass  smtp.mailfrom=carl@uvos.xyz;
	dmarc=pass header.from=<carl@uvos.xyz>
Received: from [10.0.0.2] (ip-037-201-241-223.um10.pools.vodafone-ip.de
 [37.201.241.223]) by mx.zoho.eu
	with SMTPS id 1689800603755716.7045560364239;
 Wed, 19 Jul 2023 23:03:23 +0200 (CEST)
Message-ID: <b63ed57c9af6b6e4d52a2f73bf5d18bfbf5a996a.camel@uvos.xyz>
Subject: Re: [BUG REPORT] sound: pci: ctxfi: htimestamp dose not work on
 EMU20k during recording
From: Carl Klemm <carl@uvos.xyz>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
Date: Wed, 19 Jul 2023 23:03:22 +0200
In-Reply-To: <875y6gjhqt.wl-tiwai@suse.de>
References: <dde0a305793ad7ddbd9e001e463207a84c2afcc9.camel@uvos.xyz>
	 <87y1jcl5sj.wl-tiwai@suse.de>
	 <f9387d7455ed16cd59b24482a5f9ac5fdf274796.camel@uvos.xyz>
	 <87mszsl2ad.wl-tiwai@suse.de>
	 <5695f090fc97519dcfb0bd499ba6db6f9db48ce0.camel@uvos.xyz>
	 <875y6gjhqt.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-MailFrom: carl@uvos.xyz
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: TFZ6DF4BMGBYMIQ46RELUCAWH7XNPJ75
X-Message-ID-Hash: TFZ6DF4BMGBYMIQ46RELUCAWH7XNPJ75
X-Mailman-Approved-At: Fri, 21 Jul 2023 08:08:44 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TFZ6DF4BMGBYMIQ46RELUCAWH7XNPJ75/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 2023-07-19 at 12:52 +0200, Takashi Iwai wrote:


> Or just a matter of a stream assignment?=C2=A0 When only one playback or
> one capture is running, it's the first one.
>=20
> That is, when you run two playbacks, do they both behave correctly?

I cant make pipewire use the hwmixer hand have 2 playback streams open,
but having pipewire have its stream open and opening another with aplay
dose not trigger the issue.

Carl

>=20
>=20
>=20
> > With regards
> > Carl
> >=20
> >=20
> > On Wed, 2023-07-19 at 10:43 +0200, Takashi Iwai wrote:
> > > [Please keep ML in Cc.]
> > >=20
> > > On Wed, 19 Jul 2023 10:10:47 +0200,
> > > Carl Klemm wrote:
> > > >=20
> > > > Hi,
> > > >=20
> > > > The values only seam nonsensical if playback and record is
> > > > active
> > > > at
> > > > the same time, otherwise eatch on its own is fine
> > >=20
> > > That's an interesting point.=C2=A0 You mean "values" as the PCM
> > > positions?
> > > That is, when running in full-duplex mode, only the capture
> > > stream
> > > shows strange PCM positions, while PCM playback shows correctly?
> > > Or are both screwed up?
> > >=20
> > > And, how strange they are?=C2=A0 They jump up/down, random values, or
> > > any
> > > patterns?
> > >=20
> > >=20
> > > thanks,
> > >=20
> > > Takashi
> > >=20
> > > >=20
> > > > Carl Klemm
> > > >=20
> > > > On Wed, 2023-07-19 at 09:27 +0200, Takashi Iwai wrote:
> > > > > On Wed, 19 Jul 2023 09:10:12 +0200,
> > > > > Carl Klemm wrote:
> > > > > >=20
> > > > > > Hi,
> > > > > >=20
> > > > > > see
> > > > > > https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/3352
> > > > > > htimestamp returns nonesensical values when recording is
> > > > > > active
> > > > > > on
> > > > > > a
> > > > > > EMU20k device
> > > > >=20
> > > > > The driver doesn't provide any own implementation of PCM
> > > > > tstamp,
> > > > > hence
> > > > > it must be the standard values.=C2=A0 That said, the incorrect
> > > > > values
> > > > > are
> > > > > rather the "avail", that is the PCM position, not the
> > > > > timestamp
> > > > > itself, I suppose.
> > > > >=20
> > > > > Is it only about recording, i.e. playback doesn't show any
> > > > > wrong
> > > > > values?
> > > > >=20
> > > > > In anyway, try to enable the tracing for snd_pcm, get the
> > > > > position
> > > > > and
> > > > > the system timestamp during recording, and verify whether the
> > > > > reported
> > > > > values are reasonable or not.
> > > > >=20
> > > > >=20
> > > > > Takashi
> > > >=20
> >=20
> > [E][07941.175466] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7952 current_time: 7941210935880 diff: 18446744073709551601 then:
> > 7941211290770
> > [E][07941.181068] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7943 current_time: 7941216741198 diff: 18446744073709551610 then:
> > 7941216894261
> > [E][07941.186902] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7944 current_time: 7941222546507 diff: 18446744073709551608 then:
> > 7941222728163
> > [E][07941.192886] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7952 current_time: 7941228351809 diff: 18446744073709551601 then:
> > 7941228710780
> > [E][07941.198397] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7939 current_time: 7941234157102 diff: 18446744073709551614 then:
> > 7941234223624
> > [E][07941.204180] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7938 current_time: 7941239962387 diff: 18446744073709551615 then:
> > 7941240006443
> > [E][07941.210000] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7938 current_time: 7941245767663 diff: 18446744073709551614 then:
> > 7941245825549
> > [E][07941.216093] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7951 current_time: 7941251572932 diff: 18446744073709551601 then:
> > 7941251918146
> > [E][07941.221913] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7951 current_time: 7941257378195 diff: 18446744073709551601 then:
> > 7941257737228
> > [E][07941.227410] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7938 current_time: 7941263183452 diff: 18446744073709551614 then:
> > 7941263235480
> > [E][07941.233326] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7943 current_time: 7941268988704 diff: 18446744073709551609 then:
> > 7941269152326
> > [E][07941.239330] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7951 current_time: 7941274793952 diff: 18446744073709551601 then:
> > 7941275154059
> > [E][07941.245125] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7951 current_time: 7941280599197 diff: 18446744073709551601 then:
> > 7941280949453
> > [E][07941.250629] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7938 current_time: 7941286404439 diff: 18446744073709551614 then:
> > 7941286455133
> > [E][07941.256777] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7953 current_time: 7941292209678 diff: 18446744073709551599 then:
> > 7941292601285
> > [E][07941.262236] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7938 current_time: 7941298014915 diff: 18446744073709551614 then:
> > 7941298061737
> > [E][07941.268330] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7950 current_time: 7941303820150 diff: 18446744073709551602 then:
> > 7941304154202
> > [E][07941.273839] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7937 current_time: 7941309625384 diff: 18446744073709551615 then:
> > 7941309665174
> > [E][07941.279963] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7952 current_time: 7941315430617 diff: 18446744073709551601 then:
> > 7941315787255
> > [E][07941.285746] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7950 current_time: 7941321235848 diff: 18446744073709551602 then:
> > 7941321569953
> > [E][07941.291391] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7943 current_time: 7941327041077 diff: 18446744073709551609 then:
> > 7941327216583
> > [E][07941.297389] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7952 current_time: 7941332846304 diff: 18446744073709551600 then:
> > 7941333213145
> > [E][07941.302900] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7939 current_time: 7941338651530 diff: 18446744073709551613 then:
> > 7941338723348
> > [E][07941.308700] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7939 current_time: 7941344456756 diff: 18446744073709551614 then:
> > 7941344523963
> > [E][07941.314754] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7950 current_time: 7941350261980 diff: 18446744073709551603 then:
> > 7941350578904
> > [E][07941.320740] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7957 current_time: 7941356067201 diff: 18446744073709551595 then:
> > 7941356563621
> > [E][07941.326445] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7953 current_time: 7941361872420 diff: 18446744073709551599 then:
> > 7941362269448
> > [E][07941.332159] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7949 current_time: 7941367677637 diff: 18446744073709551603 then:
> > 7941367984347
> > [E][07941.337710] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7938 current_time: 7941373482853 diff: 18446744073709551614 then:
> > 7941373535566
> > [E][07941.344076] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7962 current_time: 7941379288068 diff: 18446744073709551590 then:
> > 7941379900297
> > [E][07941.349625] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7951 current_time: 7941385093282 diff: 18446744073709551601 then:
> > 7941385449141
> > [E][07941.355731] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7951 current_time: 7941390898496 diff: 18446744073709551587 then:
> > 7941391556174
> > [E][07941.360932] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7938 current_time: 7941396703728 diff: 18446744073709551614 then:
> > 7941396757427
> > [E][07941.367370] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7966 current_time: 7941402508975 diff: 18446744073709551586 then:
> > 7941403195706
> > [E][07941.372849] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7951 current_time: 7941408314234 diff: 18446744073709551601 then:
> > 7941408672490
> > [E][07941.378678] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7953 current_time: 7941414119503 diff: 18446744073709551600 then:
> > 7941414501317
> > [E][07941.384162] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7939 current_time: 7941419924779 diff: 18446744073709551614 then:
> > 7941419986057
> > [E][07941.390471] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7961 current_time: 7941425730059 diff: 18446744073709551592 then:
> > 7941426294532
> > [E][07941.396045] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7950 current_time: 7941431535340 diff: 18446744073709551602 then:
> > 7941431869128
> > [E][07941.401553] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7937 current_time: 7941437340623 diff: 18446744073709551615 then:
> > 7941437379595
> > [E][07941.407959] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7964 current_time: 7941443145906 diff: 18446744073709551588 then:
> > 7941443784286
> > [E][07941.413288] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7943 current_time: 7941448951190 diff: 18446744073709551609 then:
> > 7941449114419
> > [E][07941.419291] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7952 current_time: 7941454756473 diff: 18446744073709551601 then:
> > 7941455114484
> > [E][07941.425089] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7951 current_time: 7941460561755 diff: 18446744073709551601 then:
> > 7941460912171
> > [E][07941.430733] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7944 current_time: 7941466367035 diff: 18446744073709551608 then:
> > 7941466556234
> > [E][07941.436707] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7952 current_time: 7941472172313 diff: 18446744073709551601 then:
> > 7941472530079
> > [E][07941.442359] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7945 current_time: 7941477977588 diff: 18446744073709551607 then:
> > 7941478184186
> > [E][07941.448774] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7972 current_time: 7941483782860 diff: 18446744073709551581 then:
> > 7941484598957
> > [E][07941.454067] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7949 current_time: 7941489588128 diff: 18446744073709551603 then:
> > 7941489890618
> > [E][07941.459981] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7954 current_time: 7941495393393 diff: 18446744073709551598 then:
> > 7941495804032
> > [E][07941.465514] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7942 current_time: 7941501198655 diff: 18446744073709551610 then:
> > 7941501338799
> > [E][07941.471543] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7952 current_time: 7941507003914 diff: 18446744073709551601 then:
> > 7941507365781
> > [E][07941.477389] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7954 current_time: 7941512809169 diff: 18446744073709551599 then:
> > 7941513211755
> > [E][07941.483126] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7951 current_time: 7941518614420 diff: 18446744073709551602 then:
> > 7941518948997
> > [E][07941.488955] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7951 current_time: 7941524419666 diff: 18446744073709551601 then:
> > 7941524778411
> > [E][07941.494443] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7938 current_time: 7941530224908 diff: 18446744073709551615 then:
> > 7941530268479
> > [E][07941.500748] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7959 current_time: 7941536030145 diff: 18446744073709551593 then:
> > 7941536571231
> > [E][07941.506439] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7955 current_time: 7941541835378 diff: 18446744073709551598 then:
> > 7941542262262
> > [E][07941.512176] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7951 current_time: 7941547640606 diff: 18446744073709551601 then:
> > 7941547999216
> > [E][07941.517884] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7947 current_time: 7941553445831 diff: 18446744073709551605 then:
> > 7941553708319
> > [E][07941.524067] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7964 current_time: 7941559251053 diff: 18446744073709551588 then:
> > 7941559890112
> > [E][07941.529490] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7947 current_time: 7941565056272 diff: 18446744073709551605 then:
> > 7941565314660
> > [E][07941.535422] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7953 current_time: 7941570861489 diff: 18446744073709551600 then:
> > 7941571244838
> > [E][07941.540915] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7939 current_time: 7941576666704 diff: 18446744073709551613 then:
> > 7941576738578
> > [E][07941.547071] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7954 current_time: 7941582471917 diff: 18446744073709551598 then:
> > 7941582893934
> > [E][07941.552602] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7942 current_time: 7941588277128 diff: 18446744073709551610 then:
> > 7941588426386
> > [E][07941.558616] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7951 current_time: 7941594082338 diff: 18446744073709551601 then:
> > 7941594439327
> > [E][07941.564233] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7943 current_time: 7941599887548 diff: 18446744073709551609 then:
> > 7941600057002
> > [E][07941.570379] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7958 current_time: 7941605692757 diff: 18446744073709551594 then:
> > 7941606202302
> > [E][07941.576034] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7951 current_time: 7941611497966 diff: 18446744073709551601 then:
> > 7941611856973
> > [E][07941.581841] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7952 current_time: 7941617303175 diff: 18446744073709551601 then:
> > 7941617663756
> > [E][07941.587575] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7948 current_time: 7941623108384 diff: 18446744073709551604 then:
> > 7941623397723
> > [E][07941.593446] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7951 current_time: 7941628913592 diff: 18446744073709551601 then:
> > 7941629268165
> > [E][07941.599258] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7952 current_time: 7941634718800 diff: 18446744073709551601 then:
> > 7941635081079
> > [E][07941.605137] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7955 current_time: 7941640524007 diff: 18446744073709551597 then:
> > 7941640959020
> > [E][07941.610999] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7958 current_time: 7941646329213 diff: 18446744073709551595 then:
> > 7941646821854
> > [E][07941.616479] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7943 current_time: 7941652134417 diff: 18446744073709551609 then:
> > 7941652303030
> > [E][07941.622474] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7951 current_time: 7941657939620 diff: 18446744073709551601 then:
> > 7941658296736
> > [E][07941.628101] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7944 current_time: 7941663744822 diff: 18446744073709551609 then:
> > 7941663924731
> > [E][07941.634137] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7954 current_time: 7941669550023 diff: 18446744073709551598 then:
> > 7941669960304
> > [E][07941.639590] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7939 current_time: 7941675355223 diff: 18446744073709551614 then:
> > 7941675413688
> > [E][07941.645711] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7952 current_time: 7941681160421 diff: 18446744073709551600 then:
> > 7941681533333
> > [E][07941.651310] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7943 current_time: 7941686965617 diff: 18446744073709551609 then:
> > 7941687134136
> > [E][07941.657041] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7938 current_time: 7941692770813 diff: 18446744073709551614 then:
> > 7941692827758
> > [E][07941.663178] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7955 current_time: 7941698576008 diff: 18446744073709551598 then:
> > 7941699001535
> > [E][07941.668893] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7950 current_time: 7941704381202 diff: 18446744073709551602 then:
> > 7941704715221
> > [E][07941.674446] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7940 current_time: 7941710186395 diff: 18446744073709551613 then:
> > 7941710269789
> > [E][07941.680593] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7955 current_time: 7941715991587 diff: 18446744073709551598 then:
> > 7941716415042
> > [E][07941.686388] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7954 current_time: 7941721796777 diff: 18446744073709551598 then:
> > 7941722210004
> > [E][07941.692138] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7952 current_time: 7941727601965 diff: 18446744073709551601 then:
> > 7941727959870
> > [E][07941.697635] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7938 current_time: 7941733407151 diff: 18446744073709551614 then:
> > 7941733458411
> > [E][07941.704051] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7965 current_time: 7941739212336 diff: 18446744073709551587 then:
> > 7941739873218
> > [E][07941.709378] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7944 current_time: 7941745017520 diff: 18446744073709551608 then:
> > 7941745201106
> > [E][07941.715386] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7952 current_time: 7941750822704 diff: 18446744073709551600 then:
> > 7941751207207
> > [E][07941.721011] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7945 current_time: 7941756627888 diff: 18446744073709551607 then:
> > 7941756834795
> > [E][07941.727166] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7960 current_time: 7941762433072 diff: 18446744073709551592 then:
> > 7941762987511
> > [E][07941.732826] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7954 current_time: 7941768238257 diff: 18446744073709551598 then:
> > 7941768647630
> > [E][07941.738924] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7967 current_time: 7941774043443 diff: 18446744073709551585 then:
> > 7941774747571
> > [E][07941.744093] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7938 current_time: 7941779848630 diff: 18446744073709551614 then:
> > 7941779916617
> > [E][07941.749981] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7942 current_time: 7941785653819 diff: 18446744073709551610 then:
> > 7941785803979
> > [E][07941.755971] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7951 current_time: 7941791459009 diff: 18446744073709551602 then:
> > 7941791793040
> > [E][07941.761480] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7938 current_time: 7941797264199 diff: 18446744073709551615 then:
> > 7941797304275
> > [E][07941.767323] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7939 current_time: 7941803069389 diff: 18446744073709551613 then:
> > 7941803144861
> > [E][07941.773233] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7944 current_time: 7941808874578 diff: 18446744073709551608 then:
> > 7941809056043
> > [E][07941.779192] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7951 current_time: 7941814679768 diff: 18446744073709551602 then:
> > 7941815013533
> > [E][07941.785061] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7953 current_time: 7941820484957 diff: 18446744073709551599 then:
> > 7941820883999
> > [E][07941.790735] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7948 current_time: 7941826290145 diff: 18446744073709551605 then:
> > 7941826557450
> > [E][07941.796628] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7951 current_time: 7941832095332 diff: 18446744073709551601 then:
> > 7941832449467
> > [E][07941.802437] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7951 current_time: 7941837900518 diff: 18446744073709551601 then:
> > 7941838258230
> > [E][07941.808261] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7952 current_time: 7941843705704 diff: 18446744073709551600 then:
> > 7941844082280
> > [E][07941.813795] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7940 current_time: 7941849510890 diff: 18446744073709551612 then:
> > 7941849617096
> > [E][07941.819851] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7952 current_time: 7941855316077 diff: 18446744073709551601 then:
> > 7941855672529
> > [E][07941.826059] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7955 current_time: 7941861121263 diff: 18446744073709551583 then:
> > 7941861881393
> > [E][07941.831284] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7943 current_time: 7941866926467 diff: 18446744073709551609 then:
> > 7941867107258
> > [E][07941.836962] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7938 current_time: 7941872731686 diff: 18446744073709551614 then:
> > 7941872784957
> > [E][07941.843100] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7953 current_time: 7941878536917 diff: 18446744073709551600 then:
> > 7941878921641
> > [E][07941.848876] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7951 current_time: 7941884342157 diff: 18446744073709551601 then:
> > 7941884697692
> > [E][07941.854375] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7938 current_time: 7941890147405 diff: 18446744073709551614 then:
> > 7941890197324
> > [E][07941.860755] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7963 current_time: 7941895952659 diff: 18446744073709551589 then:
> > 7941896576563
> > [E][07941.866293] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7951 current_time: 7941901757918 diff: 18446744073709551601 then:
> > 7941902114583
> > [E][07941.872100] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7951 current_time: 7941907563181 diff: 18446744073709551601 then:
> > 7941907920957
> > [E][07941.877615] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7939 current_time: 7941913368447 diff: 18446744073709551613 then:
> > 7941913437713
> > [E][07941.884059] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7967 current_time: 7941919173715 diff: 18446744073709551585 then:
> > 7941919880467
> > [E][07941.889929] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7953 current_time: 7941924978985 diff: 18446744073709551582 then:
> > 7941925751665
> > [E][07941.895321] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7951 current_time: 7941930784278 diff: 18446744073709551601 then:
> > 7941931141570
> > [E][07941.900831] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7938 current_time: 7941936589589 diff: 18446744073709551614 then:
> > 7941936652062
> > [E][07941.907388] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7962 current_time: 7941942394915 diff: 18446744073709551581 then:
> > 7941943210508
> > [E][07941.912713] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7950 current_time: 7941948200264 diff: 18446744073709551602 then:
> > 7941948534041
> > [E][07941.918438] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7947 current_time: 7941954005631 diff: 18446744073709551605 then:
> > 7941954261084
> > [E][07941.924058] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7939 current_time: 7941959811012 diff: 18446744073709551614 then:
> > 7941959878628
> > [E][07941.930154] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7951 current_time: 7941965616403 diff: 18446744073709551601 then:
> > 7941965974824
> > [E][07941.935935] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7950 current_time: 7941971421800 diff: 18446744073709551602 then:
> > 7941971755591
> > [E][07941.941849] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7955 current_time: 7941977227202 diff: 18446744073709551597 then:
> > 7941977669892
> > [E][07941.947276] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7939 current_time: 7941983032606 diff: 18446744073709551614 then:
> > 7941983096492
> > [E][07941.953351] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7950 current_time: 7941988838010 diff: 18446744073709551602 then:
> > 7941989172025
> > [E][07941.958989] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7943 current_time: 7941994643412 diff: 18446744073709551609 then:
> > 7941994811156
> > [E][07941.964806] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7944 current_time: 7942000448811 diff: 18446744073709551609 then:
> > 7942000627887
> > [E][07941.970476] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7938 current_time: 7942006254206 diff: 18446744073709551615 then:
> > 7942006297822
> > [E][07941.976412] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7943 current_time: 7942012059594 diff: 18446744073709551609 then:
> > 7942012234515
> > [E][07941.982090] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7938 current_time: 7942017864976 diff: 18446744073709551614 then:
> > 7942017912070
> > [E][07941.988026] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7944 current_time: 7942023670352 diff: 18446744073709551609 then:
> > 7942023848031
> > [E][07941.994067] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7954 current_time: 7942029475720 diff: 18446744073709551598 then:
> > 7942029888272
> > [E][07941.999820] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7952 current_time: 7942035281081 diff: 18446744073709551601 then:
> > 7942035640335
> > [E][07942.005624] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7952 current_time: 7942041086434 diff: 18446744073709551601 then:
> > 7942041444237
> > [E][07942.011114] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7938 current_time: 7942046891778 diff: 18446744073709551615 then:
> > 7942046936945
> > [E][07942.017463] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7962 current_time: 7942052697112 diff: 18446744073709551591 then:
> > 7942053283676
> > [E][07942.022832] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7942 current_time: 7942058502437 diff: 18446744073709551610 then:
> > 7942058654921
> > [E][07942.028545] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7939 current_time: 7942064307753 diff: 18446744073709551614 then:
> > 7942064366784
> > [E][07942.034656] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7952 current_time: 7942070113060 diff: 18446744073709551600 then:
> > 7942070476097
> > [E][07942.040232] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7942 current_time: 7942075918359 diff: 18446744073709551611 then:
> > 7942076054028
> > [E][07942.046144] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7947 current_time: 7942081723649 diff: 18446744073709551606 then:
> > 7942081966481
> > [E][07942.052470] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7969 current_time: 7942087528931 diff: 18446744073709551583 then:
> > 7942088291577
> > [E][07942.057559] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7938 current_time: 7942093334205 diff: 18446744073709551614 then:
> > 7942093381015
> > [E][07942.063466] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7942 current_time: 7942099139473 diff: 18446744073709551610 then:
> > 7942099288116
> > [E][07942.069482] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7952 current_time: 7942104944735 diff: 18446744073709551601 then:
> > 7942105302029
> > [E][07942.075284] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7951 current_time: 7942110749991 diff: 18446744073709551601 then:
> > 7942111104396
> > [E][07942.080798] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7938 current_time: 7942116555242 diff: 18446744073709551614 then:
> > 7942116617840
> > [E][07942.086694] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7943 current_time: 7942122360489 diff: 18446744073709551610 then:
> > 7942122517046
> > [E][07942.092413] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7939 current_time: 7942128165731 diff: 18446744073709551614 then:
> > 7942128233228
> > [E][07942.098509] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7952 current_time: 7942133970968 diff: 18446744073709551601 then:
> > 7942134329269
> > [E][07942.103991] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7937 current_time: 7942139776199 diff: 18446744073709551615 then:
> > 7942139814057
> > [E][07942.110108] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7951 current_time: 7942145581425 diff: 18446744073709551601 then:
> > 7942145928146
> > [E][07942.115901] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7951 current_time: 7942151386648 diff: 18446744073709551602 then:
> > 7942151720732
> > [E][07942.121830] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7956 current_time: 7942157191867 diff: 18446744073709551596 then:
> > 7942157650214
> > [E][07942.127292] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7941 current_time: 7942162997082 diff: 18446744073709551611 then:
> > 7942163111709
> > [E][07942.133355] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7952 current_time: 7942168802295 diff: 18446744073709551600 then:
> > 7942169174366
> > [E][07942.139299] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7958 current_time: 7942174607506 diff: 18446744073709551594 then:
> > 7942175118308
> > [E][07942.144942] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7951 current_time: 7942180412715 diff: 18446744073709551601 then:
> > 7942180761795
> > [E][07942.150894] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7958 current_time: 7942186217924 diff: 18446744073709551595 then:
> > 7942186707777
> > [E][07942.156257] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7938 current_time: 7942192023131 diff: 18446744073709551614 then:
> > 7942192078529
> > [E][07942.162371] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7952 current_time: 7942197828337 diff: 18446744073709551601 then:
> > 7942198190746
> > [E][07942.168176] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7952 current_time: 7942203633541 diff: 18446744073709551601 then:
> > 7942203995896
> > [E][07942.174050] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7955 current_time: 7942209438742 diff: 18446744073709551597 then:
> > 7942209869601
> > [E][07942.179781] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7951 current_time: 7942215243941 diff: 18446744073709551601 then:
> > 7942215600628
> > [E][07942.185583] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7951 current_time: 7942221049139 diff: 18446744073709551601 then:
> > 7942221402455
> > [E][07942.191370] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7951 current_time: 7942226854336 diff: 18446744073709551602 then:
> > 7942227191285
> > [E][07942.197436] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7962 current_time: 7942232659532 diff: 18446744073709551590 then:
> > 7942233257158
> > [E][07942.202979] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7950 current_time: 7942238464727 diff: 18446744073709551602 then:
> > 7942238798526
> > [E][07942.208807] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7952 current_time: 7942244269921 diff: 18446744073709551601 then:
> > 7942244626091
> > [E][07942.214302] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7938 current_time: 7942250075114 diff: 18446744073709551614 then:
> > 7942250122868
> > [E][07942.220511] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7956 current_time: 7942255880306 diff: 18446744073709551597 then:
> > 7942256330904
> > [E][07942.226136] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7948 current_time: 7942261685497 diff: 18446744073709551605 then:
> > 7942261956943
> > [E][07942.231833] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7943 current_time: 7942267490686 diff: 18446744073709551609 then:
> > 7942267654646
> > [E][07942.237530] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7938 current_time: 7942273295873 diff: 18446744073709551614 then:
> > 7942273350836
> > [E][07942.243834] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7960 current_time: 7942279101060 diff: 18446744073709551592 then:
> > 7942279653624
> > [E][07942.249456] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7952 current_time: 7942284906246 diff: 18446744073709551600 then:
> > 7942285276891
> > [E][07942.255249] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7952 current_time: 7942290711433 diff: 18446744073709551601 then:
> > 7942291068470
> > [E][07942.260760] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7939 current_time: 7942296516619 diff: 18446744073709551614 then:
> > 7942296580042
> > [E][07942.266927] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7955 current_time: 7942302321804 diff: 18446744073709551598 then:
> > 7942302745838
> > [E][07942.272660] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7951 current_time: 7942308126986 diff: 18446744073709551601 then:
> > 7942308478941
> > [E][07942.278286] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7944 current_time: 7942313932167 diff: 18446744073709551609 then:
> > 7942314107175
> > [E][07942.284133] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7945 current_time: 7942319737346 diff: 18446744073709551607 then:
> > 7942319952189
> > [E][07942.289880] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7943 current_time: 7942325542524 diff: 18446744073709551610 then:
> > 7942325700844
> > [E][07942.295819] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7949 current_time: 7942331347700 diff: 18446744073709551604 then:
> > 7942331640346
> > [E][07942.301504] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7943 current_time: 7942337152874 diff: 18446744073709551609 then:
> > 7942337324153
> > [E][07942.307364] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7946 current_time: 7942342958047 diff: 18446744073709551607 then:
> > 7942343182835
> > [E][07942.313342] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7953 current_time: 7942348763218 diff: 18446744073709551599 then:
> > 7942349161408
> > [E][07942.319084] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7951 current_time: 7942354568388 diff: 18446744073709551602 then:
> > 7942354902635
> > [E][07942.324773] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7945 current_time: 7942360373556 diff: 18446744073709551607 then:
> > 7942360593210
> > [E][07942.330728] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7952 current_time: 7942366178723 diff: 18446744073709551600 then:
> > 7942366546680
> > [E][07942.336605] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7955 current_time: 7942371983890 diff: 18446744073709551597 then:
> > 7942372423985
> > [E][07942.342697] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7968 current_time: 7942377789057 diff: 18446744073709551584 then:
> > 7942378517014
> > [E][07942.347975] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7944 current_time: 7942383594225 diff: 18446744073709551608 then:
> > 7942383795091
> > [E][07942.353669] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7940 current_time: 7942389399394 diff: 18446744073709551613 then:
> > 7942389488870
> > [E][07942.359754] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7952 current_time: 7942395204563 diff: 18446744073709551600 then:
> > 7942395574194
> > [E][07942.365824] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7964 current_time: 7942401009733 diff: 18446744073709551589 then:
> > 7942401643079
> > [E][07942.371033] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7938 current_time: 7942406814903 diff: 18446744073709551615 then:
> > 7942406853189
> > [E][07942.376827] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7937 current_time: 7942412620072 diff: 18446744073709551615 then:
> > 7942412647719
> > [E][07942.382766] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7943 current_time: 7942418425241 diff: 18446744073709551609 then:
> > 7942418585673
> > [E][07942.388570] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7729 current_time: 7942424230410 diff: 18446744073709551609 then:
> > 7942424390739
> > [E][07942.389568] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 248
> > current_time: 7942425356776 diff: 18446744073709551615 then:
> > 7942425389902
> > [E][07942.389732] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 256
> > current_time: 7942425538181 diff: 0 then: 7942425557061
> > [E][07942.394256] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7473 current_time: 7942430035851 diff: 248 then: 7942424390739
> > [E][07942.395559] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 256
> > current_time: 7942431343210 diff: 18446744073709551615 then:
> > 7942431380631
> > [E][07942.400108] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942435841788 diff: 504 then: 7942424390739
> > [E][07942.401369] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 256
> > current_time: 7942437148314 diff: 18446744073709551615 then:
> > 7942437189597
> > [E][07942.407178] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 256
> > current_time: 7942442953521 diff: 18446744073709551615 then:
> > 7942442998527
> > [E][07942.410564] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942446340654 diff: 967 then: 7942424390739
> > [E][07942.412981] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 264
> > current_time: 7942448758855 diff: 18446744073709551615 then:
> > 7942448802286
> > [E][07942.418906] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 264
> > current_time: 7942454564323 diff: 18446744073709551609 then:
> > 7942454726680
> > [E][07942.422720] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942457950631 diff: 1479 then: 7942424390739
> > [E][07942.424621] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 264
> > current_time: 7942460369938 diff: 18446744073709551613 then:
> > 7942460441794
> > [E][07942.430390] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 256
> > current_time: 7942466175705 diff: 18446744073709551615 then:
> > 7942466210537
> > [E][07942.433779] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942469560608 diff: 1991 then: 7942424390739
> > [E][07942.436201] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 256
> > current_time: 7942471981635 diff: 18446744073709551615 then:
> > 7942472021711
> > [E][07942.442140] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 264
> > current_time: 7942477787736 diff: 18446744073709551609 then:
> > 7942477960529
> > [E][07942.445389] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942481170585 diff: 2503 then: 7942424390739
> > [E][07942.447997] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 264
> > current_time: 7942483594009 diff: 18446744073709551607 then:
> > 7942483818743
> > [E][07942.453622] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 256
> > current_time: 7942489400459 diff: 18446744073709551615 then:
> > 7942489441806
> > [E][07942.456990] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942492780562 diff: 3015 then: 7942424390739
> > [E][07942.459417] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 264
> > current_time: 7942495207086 diff: 18446744073709551615 then:
> > 7942495239096
> > [E][07942.465759] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 280
> > current_time: 7942501013881 diff: 18446744073709551592 then:
> > 7942501576696
> > [E][07942.468724] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942504390539 diff: 3527 then: 7942424390739
> > [E][07942.471162] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 264
> > current_time: 7942506820843 diff: 18446744073709551609 then:
> > 7942506982920
> > [E][07942.476848] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 264
> > current_time: 7942512627968 diff: 18446744073709551615 then:
> > 7942512667567
> > [E][07942.480224] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942516000516 diff: 4039 then: 7942424390739
> > [E][07942.482662] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 264
> > current_time: 7942518435246 diff: 18446744073709551614 then:
> > 7942518482257
> > [E][07942.488729] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 272
> > current_time: 7942524242667 diff: 18446744073709551603 then:
> > 7942524549570
> > [E][07942.491987] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942527610493 diff: 4551 then: 7942424390739
> > [E][07942.494267] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 264
> > current_time: 7942530050226 diff: 18446744073709551615 then:
> > 7942530088406
> > [E][07942.500230] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 264
> > current_time: 7942535857913 diff: 18446744073709551608 then:
> > 7942536049507
> > [E][07942.503748] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942539220470 diff: 5063 then: 7942424390739
> > [E][07942.506243] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 280
> > current_time: 7942541665727 diff: 18446744073709551599 then:
> > 7942542061333
> > [E][07942.512189] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 280
> > current_time: 7942547473659 diff: 18446744073709551593 then:
> > 7942548007470
> > [E][07942.515081] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942550830447 diff: 5575 then: 7942424390739
> > [E][07942.517517] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 264
> > current_time: 7942553281706 diff: 18446744073709551614 then:
> > 7942553335022
> > [E][07942.523610] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 272
> > current_time: 7942559089860 diff: 18446744073709551602 then:
> > 7942559429695
> > [E][07942.527048] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942562440424 diff: 6087 then: 7942424390739
> > [E][07942.529483] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 280
> > current_time: 7942564898119 diff: 18446744073709551599 then:
> > 7942565301302
> > [E][07942.535043] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 264
> > current_time: 7942570706473 diff: 18446744073709551610 then:
> > 7942570862457
> > [E][07942.538393] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942574050401 diff: 6599 then: 7942424390739
> > [E][07942.541131] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 280
> > current_time: 7942576514920 diff: 18446744073709551597 then:
> > 7942576951394
> > [E][07942.546935] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 280
> > current_time: 7942582323454 diff: 18446744073709551598 then:
> > 7942582753424
> > [E][07942.550275] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942585660378 diff: 7111 then: 7942424390739
> > [E][07942.552452] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 264
> > current_time: 7942588132068 diff: 18446744073709551610 then:
> > 7942588274224
> > [E][07942.558164] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 264
> > current_time: 7942593940761 diff: 18446744073709551615 then:
> > 7942593982799
> > [E][07942.561601] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942597270355 diff: 7623 then: 7942424390739
> > [E][07942.564163] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 272
> > current_time: 7942599749525 diff: 18446744073709551606 then:
> > 7942599981472
> > [E][07942.570113] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 280
> > current_time: 7942605558355 diff: 18446744073709551600 then:
> > 7942605931029
> > [E][07942.573099] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942608880332 diff: 8135 then: 7942424390739
> > [E][07942.575883] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 272
> > current_time: 7942611367242 diff: 18446744073709551602 then:
> > 7942611700828
> > [E][07942.581533] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 272
> > current_time: 7942617176188 diff: 18446744073709551609 then:
> > 7942617351803
> > [E][07942.584781] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942620490309 diff: 8647 then: 7942424390739
> > [E][07942.587376] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 272
> > current_time: 7942622985184 diff: 18446744073709551607 then:
> > 7942623193001
> > [E][07942.593342] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 280
> > current_time: 7942628794225 diff: 18446744073709551600 then:
> > 7942629159838
> > [E][07942.596328] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942632100286 diff: 9159 then: 7942424390739
> > [E][07942.599119] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 280
> > current_time: 7942634603305 diff: 18446744073709551602 then:
> > 7942634936777
> > [E][07942.604762] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 272
> > current_time: 7942640412417 diff: 18446744073709551609 then:
> > 7942640581620
> > [E][07942.608072] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942643710263 diff: 9671 then: 7942424390739
> > [E][07942.610438] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 264
> > current_time: 7942646221557 diff: 18446744073709551615 then:
> > 7942646257759
> > [E][07942.616695] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 280
> > current_time: 7942652030722 diff: 18446744073709551595 then:
> > 7942652513387
> > [E][07942.619858] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942655320240 diff: 10183 then: 7942424390739
> > [E][07942.622380] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 280
> > current_time: 7942657839916 diff: 18446744073709551601 then:
> > 7942658197517
> > [E][07942.628117] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 272
> > current_time: 7942663649134 diff: 18446744073709551604 then:
> > 7942663935816
> > [E][07942.631286] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942666930217 diff: 10695 then: 7942424390739
> > [E][07942.633714] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 264
> > current_time: 7942669458379 diff: 18446744073709551613 then:
> > 7942669533296
> > [E][07942.639813] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 280
> > current_time: 7942675267651 diff: 18446744073709551600 then:
> > 7942675631568
> > [E][07942.642779] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942678540194 diff: 11207 then: 7942424390739
> > [E][07942.645617] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 280
> > current_time: 7942681076946 diff: 18446744073709551601 then:
> > 7942681434631
> > [E][07942.651109] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 264
> > current_time: 7942686886261 diff: 18446744073709551615 then:
> > 7942686927638
> > [E][07942.654546] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942690150171 diff: 11719 then: 7942424390739
> > [E][07942.657395] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 288
> > current_time: 7942692695594 diff: 18446744073709551594 then:
> > 7942693212750
> > [E][07942.662745] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 264
> > current_time: 7942698504940 diff: 18446744073709551614 then:
> > 7942698563067
> > [E][07942.666300] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942701760148 diff: 12231 then: 7942424390739
> > [E][07942.668667] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 272
> > current_time: 7942704314301 diff: 18446744073709551609 then:
> > 7942704485264
> > [E][07942.674358] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 264
> > current_time: 7942710123673 diff: 18446744073709551614 then:
> > 7942710176319
> > [E][07942.677598] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942713370125 diff: 12743 then: 7942424390739
> > [E][07942.680228] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 272
> > current_time: 7942715933059 diff: 18446744073709551611 then:
> > 7942716047265
> > [E][07942.686086] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 272
> > current_time: 7942721742452 diff: 18446744073709551609 then:
> > 7942721906967
> > [E][07942.689519] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942724980102 diff: 13255 then: 7942424390739
> > [E][07942.691776] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 264
> > current_time: 7942727551852 diff: 18446744073709551615 then:
> > 7942727594698
> > [E][07942.697743] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 272
> > current_time: 7942733361259 diff: 18446744073709551608 then:
> > 7942733564463
> > [E][07942.700801] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942736590079 diff: 13767 then: 7942424390739
> > [E][07942.703848] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 288
> > current_time: 7942739170673 diff: 18446744073709551595 then:
> > 7942739666180
> > [E][07942.709520] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 280
> > current_time: 7942744980090 diff: 18446744073709551601 then:
> > 7942745336691
> > [E][07942.712425] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942748200056 diff: 14279 then: 7942424390739
> > [E][07942.715118] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 272
> > current_time: 7942750789509 diff: 18446744073709551610 then:
> > 7942750939882
> > [E][07942.720844] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 264
> > current_time: 7942756598929 diff: 18446744073709551614 then:
> > 7942756660733
> > [E][07942.724022] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942759810033 diff: 14791 then: 7942424390739
> > [E][07942.727158] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 288
> > current_time: 7942762408353 diff: 18446744073709551592 then:
> > 7942762974921
> > [E][07942.732442] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 264
> > current_time: 7942768217782 diff: 18446744073709551615 then:
> > 7942768259994
> > [E][07942.735761] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942771420010 diff: 15303 then: 7942424390739
> > [E][07942.738237] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 264
> > current_time: 7942774027217 diff: 18446744073709551615 then:
> > 7942774058208
> > [E][07942.744268] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 280
> > current_time: 7942779836661 diff: 18446744073709551605 then:
> > 7942780087049
> > [E][07942.747250] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942783029987 diff: 15815 then: 7942424390739
> > [E][07942.750274] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 288
> > current_time: 7942785646106 diff: 18446744073709551597 then:
> > 7942786091015
> > [E][07942.755666] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 264
> > current_time: 7942791455548 diff: 18446744073709551615 then:
> > 7942791485875
> > [E][07942.759146] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942794639964 diff: 16327 then: 7942424390739
> > [E][07942.761478] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 272
> > current_time: 7942797264990 diff: 18446744073709551615 then:
> > 7942797298729
> > [E][07942.767293] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 272
> > current_time: 7942803074425 diff: 18446744073709551615 then:
> > 7942803111955
> > [E][07942.770478] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942806249941 diff: 16839 then: 7942424390739
> > [E][07942.773091] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 264
> > current_time: 7942808883847 diff: 18446744073709551615 then:
> > 7942808912461
> > [E][07942.779226] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 280
> > current_time: 7942814693261 diff: 18446744073709551601 then:
> > 7942815044910
> > [E][07942.782222] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942817859918 diff: 17351 then: 7942424390739
> > [E][07942.784976] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 280
> > current_time: 7942820502670 diff: 18446744073709551604 then:
> > 7942820795341
> > [E][07942.790547] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 272
> > current_time: 7942826312072 diff: 18446744073709551614 then:
> > 7942826364500
> > [E][07942.793812] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942829469895 diff: 17863 then: 7942424390739
> > [E][07942.796572] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 280
> > current_time: 7942832121462 diff: 18446744073709551605 then:
> > 7942832390569
> > [E][07942.802153] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 272
> > current_time: 7942837930839 diff: 18446744073709551615 then:
> > 7942837971873
> > [E][07942.805413] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942841079872 diff: 18375 then: 7942424390739
> > [E][07942.807952] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 272
> > current_time: 7942843740199 diff: 18446744073709551615 then:
> > 7942843771503
> > [E][07942.813872] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 272
> > current_time: 7942849549539 diff: 18446744073709551610 then:
> > 7942849690665
> > [E][07942.816914] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942852689849 diff: 18887 then: 7942424390739
> > [E][07942.819669] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 272
> > current_time: 7942855358863 diff: 18446744073709551611 then:
> > 7942855490103
> > [E][07942.825392] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 272
> > current_time: 7942861168174 diff: 18446744073709551615 then:
> > 7942861209754
> > [E][07942.828709] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942864299826 diff: 19399 then: 7942424390739
> > [E][07942.831204] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 272
> > current_time: 7942866977468 diff: 18446744073709551615 then:
> > 7942867022764
> > [E][07942.837002] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 272
> > current_time: 7942872786743 diff: 18446744073709551615 then:
> > 7942872820786
> > [E][07942.840323] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942875909803 diff: 19911 then: 7942424390739
> > [E][07942.842946] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 280
> > current_time: 7942878595998 diff: 18446744073709551609 then:
> > 7942878763660
> > [E][07942.848822] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 280
> > current_time: 7942884405228 diff: 18446744073709551606 then:
> > 7942884639898
> > [E][07942.851852] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942887519780 diff: 20423 then: 7942424390739
> > [E][07942.854551] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 280
> > current_time: 7942890214435 diff: 18446744073709551610 then:
> > 7942890369077
> > [E][07942.860448] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 280
> > current_time: 7942896023615 diff: 18446744073709551606 then:
> > 7942896266387
> > [E][07942.863794] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942899129757 diff: 20935 then: 7942424390739
> > [E][07942.866172] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 280
> > current_time: 7942901832770 diff: 18446744073709551609 then:
> > 7942901993909
> > [E][07942.871867] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 272
> > current_time: 7942907641897 diff: 18446744073709551615 then:
> > 7942907685468
> > [E][07942.875114] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942910739734 diff: 21447 then: 7942424390739
> > [E][07942.877777] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 280
> > current_time: 7942913450999 diff: 18446744073709551610 then:
> > 7942913598882
> > [E][07942.884102] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 296
> > current_time: 7942919260072 diff: 18446744073709551587 then:
> > 7942919918482
> > [E][07942.886685] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942922349711 diff: 21959 then: 7942424390739
> > [E][07942.889642] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 288
> > current_time: 7942925069124 diff: 18446744073709551599 then:
> > 7942925457845
> > [E][07942.895272] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 280
> > current_time: 7942930878156 diff: 18446744073709551607 then:
> > 7942931090532
> > [E][07942.898170] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942933959688 diff: 22471 then: 7942424390739
> > [E][07942.901062] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 280
> > current_time: 7942936687169 diff: 18446744073709551608 then:
> > 7942936883190
> > [E][07942.906749] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 272
> > current_time: 7942942496163 diff: 18446744073709551615 then:
> > 7942942538653
> > [E][07942.910131] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942945569665 diff: 22983 then: 7942424390739
> > [E][07942.912823] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 288
> > current_time: 7942948305140 diff: 18446744073709551602 then:
> > 7942948639386
> > [E][07942.918632] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 288
> > current_time: 7942954114096 diff: 18446744073709551602 then:
> > 7942954448124
> > [E][07942.921529] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942957179642 diff: 23495 then: 7942424390739
> > [E][07942.924139] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 272
> > current_time: 7942959923030 diff: 18446744073709551615 then:
> > 7942959959516
> > [E][07942.930503] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 296
> > current_time: 7942965731945 diff: 18446744073709551591 then:
> > 7942966318764
> > [E][07942.933322] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942968789619 diff: 24007 then: 7942424390739
> > [E][07942.935985] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 280
> > current_time: 7942971540843 diff: 18446744073709551605 then:
> > 7942971802099
> > [E][07942.941698] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 280
> > current_time: 7942977349728 diff: 18446744073709551609 then:
> > 7942977516026
> > [E][07942.944932] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942980399596 diff: 24519 then: 7942424390739
> > [E][07942.947384] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 272
> > current_time: 7942983158600 diff: 18446744073709551615 then:
> > 7942983201861
> > [E][07942.953577] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 288
> > current_time: 7942988967460 diff: 18446744073709551598 then:
> > 7942989392558
> > [E][07942.956548] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7942992009573 diff: 25031 then: 7942424390739
> > [E][07942.959315] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 288
> > current_time: 7942994776312 diff: 18446744073709551601 then:
> > 7942995130448
> > [E][07942.965158] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 288
> > current_time: 7943000585154 diff: 18446744073709551599 then:
> > 7943000973446
> > [E][07942.968142] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7943003619550 diff: 25543 then: 7942424390739
> > [E][07942.970756] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 280
> > current_time: 7943006393988 diff: 18446744073709551609 then:
> > 7943006571441
> > [E][07942.976567] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 280
> > current_time: 7943012202812 diff: 18446744073709551608 then:
> > 7943012384307
> > [E][07942.979562] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7943015229527 diff: 26055 then: 7942424390739
> > [E][07942.982258] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 280
> > current_time: 7943018011628 diff: 18446744073709551614 then:
> > 7943018075662
> > [E][07942.988621] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 304
> > current_time: 7943023820428 diff: 18446744073709551589 then:
> > 7943024437694
> > [E][07942.991171] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7943026839504 diff: 26567 then: 7942424390739
> > [E][07942.993852] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 272
> > current_time: 7943029629208 diff: 18446744073709551615 then:
> > 7943029669235
> > [E][07942.999666] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 272
> > current_time: 7943035437972 diff: 18446744073709551614 then:
> > 7943035484273
> > [E][07943.002976] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7943038449481 diff: 27079 then: 7942424390739
> > [E][07943.005833] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 288
> > current_time: 7943041246725 diff: 18446744073709551599 then:
> > 7943041649926
> > [E][07943.011275] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 272
> > current_time: 7943047055470 diff: 18446744073709551615 then:
> > 7943047092246
> > [E][07943.014384] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7943050059458 diff: 27591 then: 7942424390739
> > [E][07943.017399] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 288
> > current_time: 7943052864210 diff: 18446744073709551601 then:
> > 7943053214302
> > [E][07943.023263] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 296
> > current_time: 7943058672944 diff: 18446744073709551599 then:
> > 7943059078120
> > [E][07943.026234] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7943061669435 diff: 28103 then: 7942424390739
> > [E][07943.029000] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 288
> > current_time: 7943064481664 diff: 18446744073709551602 then:
> > 7943064814991
> > [E][07943.034710] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 288
> > current_time: 7943070290371 diff: 18446744073709551606 then:
> > 7943070527286
> > [E][07943.037514] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7943073279412 diff: 28615 then: 7942424390739
> > [E][07943.040479] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 280
> > current_time: 7943076099060 diff: 18446744073709551608 then:
> > 7943076293892
> > [E][07943.046447] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 288
> > current_time: 7943081907734 diff: 18446744073709551601 then:
> > 7943082262049
> > [E][07943.049131] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7943084889389 diff: 29127 then: 7942424390739
> > [E][07943.051936] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 280
> > current_time: 7943087716396 diff: 18446744073709551615 then:
> > 7943087753449
> > [E][07943.057761] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 280
> > current_time: 7943093525040 diff: 18446744073709551614 then:
> > 7943093578004
> > [E][07943.060782] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7943096499366 diff: 29639 then: 7942424390739
> > [E][07943.064049] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 296
> > current_time: 7943099333662 diff: 18446744073709551593 then:
> > 7943099857403
> > [E][07943.069661] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 288
> > current_time: 7943105142267 diff: 18446744073709551602 then:
> > 7943105475978
> > [E][07943.072351] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7943108109343 diff: 30151 then: 7942424390739
> > [E][07943.075277] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 280
> > current_time: 7943110950856 diff: 18446744073709551610 then:
> > 7943111098321
> > [E][07943.080982] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 280
> > current_time: 7943116759431 diff: 18446744073709551615 then:
> > 7943116798316
> > [E][07943.084071] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7943119719320 diff: 30663 then: 7942424390739
> > [E][07943.087090] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 288
> > current_time: 7943122567988 diff: 18446744073709551601 then:
> > 7943122909309
> > [E][07943.092895] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 288
> > current_time: 7943128376531 diff: 18446744073709551602 then:
> > 7943128710115
> > [E][07943.095848] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7943131329297 diff: 31175 then: 7942424390739
> > [E][07943.098504] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 280
> > current_time: 7943134185061 diff: 18446744073709551610 then:
> > 7943134325006
> > [E][07943.104223] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 280
> > current_time: 7943139993581 diff: 18446744073709551614 then:
> > 7943140039389
> > [E][07943.107175] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7943142939274 diff: 31687 then: 7942424390739
> > [E][07943.110223] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 288
> > current_time: 7943145802088 diff: 18446744073709551606 then:
> > 7943146039347
> > [E][07943.115838] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 280
> > current_time: 7943151610579 diff: 18446744073709551615 then:
> > 7943151654082
> > [E][07943.119069] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7943154549251 diff: 32199 then: 7942424390739
> > [E][07943.121982] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 296
> > current_time: 7943157419050 diff: 18446744073709551600 then:
> > 7943157801447
> > [E][07943.127530] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 280
> > current_time: 7943163227498 diff: 18446744073709551611 then:
> > 7943163344782
> > [E][07943.130738] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7943166159228 diff: 32711 then: 7942424390739
> > [E][07943.133978] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 312
> > current_time: 7943169035927 diff: 18446744073709551583 then:
> > 7943169794965
> > [E][07943.139363] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 288
> > current_time: 7943174844334 diff: 18446744073709551602 then:
> > 7943175178113
> > [E][07943.142135] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7943177769205 diff: 33223 then: 7942424390739
> > [E][07943.145005] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 288
> > current_time: 7943180652724 diff: 18446744073709551609 then:
> > 7943180821564
> > [E][07943.150733] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bab1380 device: front:1 avail: 280
> > current_time: 7943186461093 diff: 18446744073709551613 then:
> > 7943186547875
> > [E][07943.153687] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2016
> > get_avail()] handle: 0x56197bcad0d0 device: surround40:1 avail:
> > 7217 current_time: 7943189379182 diff: 33735 then: 7942424390739
> > [E][07943.153810] spa.alsa=C2=A0=C2=A0=C2=A0=C2=A0 | [=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alsa-pcm.c: 2024
> > get_avail()] surround40:1: wrong htimestamps from driver, disabling

