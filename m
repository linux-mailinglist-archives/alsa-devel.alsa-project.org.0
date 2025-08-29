Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CE3B3B8F8
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Aug 2025 12:36:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4184602BA;
	Fri, 29 Aug 2025 12:36:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4184602BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756463776;
	bh=UDepf4fpuRjM4L2zNA+prx8VL1dyhtU0M4QRQ4BQz0w=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=JbVPZ4TwI6S9Mxy/VZjXlllm9gYvalZYSoWpax16nwp/4ckmXcSumJhe0VlXjWi0F
	 dN5I7jQJMOKFUpMeBY3ZR2mPglY1uSO+LkRUwTk+6wAvWcgE19ZQqOVqTeoHLO5Ysa
	 C5/jmBz/2ACwVzS8cp6XH1Ijz2+bdriRNKFLtfCs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9ED2F805CA; Fri, 29 Aug 2025 12:35:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CEC4F805C8;
	Fri, 29 Aug 2025 12:35:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B5B3F80171; Fri, 29 Aug 2025 12:34:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4B48AF80149
	for <alsa-devel@alsa-project.org>; Fri, 29 Aug 2025 12:34:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B48AF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=m.armsby@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=fBv+cbgY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1756463651; x=1757068451; i=m.armsby@gmx.de;
	bh=7qxrHnGoCdbOqbmGwjw8ueumOsgqm6e60cXrO4XyJmg=;
	h=X-UI-Sender-Class:Date:From:To:Subject:In-Reply-To:References:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=fBv+cbgYRF2L/MMdFrL7ul/tMhf5tHiKxLSQoWqG8FYKhB1lAzwI0SZzL0w31JI0
	 oafggBLRjgWbIFgylxJXrhm9ab2/AQU5a0StWhelA37w8zfESOMeV7A4as8G8aOrS
	 C/auXTGOUpWSiEFQ0uCha2Was7NL1bPBnvuINJY6rywuN/wyAXqFDGgq6/gWAZ1TC
	 dMnA9VsCn3SbNEs6OQJoC1BNpCeAskI0ePzKAopEgbMLYNJ2CFFG2RJWNMqYaGlck
	 LHz8lJIIpz5Igu70qeqC1CEuSFeONBM+spxEoVZIoo+CPjSm90NYgp0gJP2jQXXIl
	 uDHzR4v+M/1MZyk5ig==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([77.20.253.70]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MGQnF-1uhpgV1Rmv-006NXD for
 <alsa-devel@alsa-project.org>; Fri, 29 Aug 2025 12:34:10 +0200
Date: Fri, 29 Aug 2025 12:34:08 +0200
From: "M. Armsby" <m.armsby@gmx.de>
To: alsa-devel@alsa-project.org
Subject: =?US-ASCII?Q?Re=3A_URGENT=3A_ALSAfirewire_Drivers_Introduce_?=
 =?US-ASCII?Q?90ms_delay_-_Linux_is_Unusable_for_Pro_Audio?=
User-Agent: K-9 Mail for Android
In-Reply-To: <E7BF63E9-3CDF-4BD1-89BA-593215892369@gmx.de>
References: <E7BF63E9-3CDF-4BD1-89BA-593215892369@gmx.de>
Message-ID: <0C3794FE-E092-49A2-8163-469E2937FB84@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KqGXHeHFKQZf79+VgIelpwI4E2JmL51WcSDfqVTynGr3CCMya68
 Ob6pLKIbKoH6zkIZQWKWax7adaWDtmbk013u6fyXWgeKgSlXtnwQqrEdDy7UnYRsbYsJA7E
 kdXDgkEILYj0zvDYG9BLoxHZRVgjmYDVj505ZZev7KEs0aZAB94VJdIAhczbsUrSzW4o+qW
 zyl8jrCXM9faQYBpcUq3A==
UI-OutboundReport: notjunk:1;M01:P0:qQqfx3EyzAU=;J3WuSiOJKPXOhLyxOy/rXwRQtUO
 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
Message-ID-Hash: UPUY5ILHQH3OYJ7TVZK5JPC4VDC4QCPE
X-Message-ID-Hash: UPUY5ILHQH3OYJ7TVZK5JPC4VDC4QCPE
X-MailFrom: m.armsby@gmx.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UPUY5ILHQH3OYJ7TVZK5JPC4VDC4QCPE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 29 August 2025 11:33:33 CEST, "M=2E Armsby" <m=2Earmsby@gmx=2Ede> wrote:
>
>
>Dear maintainers,
>
>Linux is being ridiculed in the professional audio community =E2=80=94 no=
t because it can't do low-latency audio, but because the ALSA FireWire stac=
k  actively breaks it=2E Professional gear costing thousands of dollars lik=
e Motu RME Focusrite etc=2E etc=2E=20
>
>Since kernel 5=2E16+, FireWire audio devices are correctly detected and f=
unctional =E2=80=94 but they are burdened with an artificial +90ms latency =
offset due to missing timing metadata (e=2Eg=2E, cycle-match delay, transmi=
ssion latency) in the driver's interface to userspace=2E
>
>PipeWire and WirePlumber rely on accurate latency reporting=2E When it's =
missing, they fall back to worst-case assumptions =E2=80=94 adding ~90ms of=
 delay=2E This is NOT a PipeWire bug=2E It is a FAILURE of the ALSA FireWir=
e drivers to expose timing data that the hardware and firmware already prov=
ide=2E
>
>This bug:
>- Renders high-end interfaces (RME, Focusrite, Tascam, Motu, Terratec) un=
usable for real-time monitoring
>- Forces users to hack WirePlumber with hardcoded quantum rules
>- Damages Linux's credibility in music production
>- Makes Linux a JOKE in studios worldwide
>
>There is NO excuse for this in 2025=2E
>
>We have workarounds (see: https://forum=2Ecockos=2Ecom/showthread=2Ephp?t=
=3D274978), but they are fragile, device-specific, and do not scale=2E
>
>We demand:
>1=2E Immediate exposure of accurate device latency via ALSA control or hw=
dep interface
>2=2E Proper reporting of transmission/cycle delay to userspace
>3=2E A timeline for fixing this in mainline
>
>This is not a "nice-to-have"=2E It is a **critical defect** in a core mul=
timedia subsystem now using pipewire as standard=2E=20
>
>Linux can and must do better=2E
>Many are waiting to move to Linux, finally leaving windows=2E=20
>
>=E2=80=94 Martin Armsby (Martin A - maa)=20
>Professional Audio Producer / Linux Advocate
>
>Please see:
>Imagine if Linux Audio just worked - Firewire  <https://forum=2Ecockos=2E=
com/showthread=2Ephp?t=3D302305>
>and
><https://gitlab=2Efreedesktop=2Eorg/pipewire/pipewire/-/issues/4785>
>Thank you for reading=2E
>-- Martin Armsby
>-- Martin Armsby



Sorry, a link error:

<https://forum=2Ecockos=2Ecom/showthread=2Ephp?t=3D274978>=20

 should be:


<https://forum=2Ecockos=2Ecom/showpost=2Ephp?p=3D2883715&postcount=3D50>

Thanks
-- Martin Armsby
