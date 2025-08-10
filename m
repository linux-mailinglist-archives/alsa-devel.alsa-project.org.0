Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD18B1FA22
	for <lists+alsa-devel@lfdr.de>; Sun, 10 Aug 2025 15:36:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DDAC601ED;
	Sun, 10 Aug 2025 15:35:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DDAC601ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1754832969;
	bh=J4ACxLV7nz+cWFSXibKnYWDDfibbBU8fuOxe4Js6N2k=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=g0agm/jQl16zgBfzDM6+Gult6nSELGNnwPvq9S3EkCWwEGZVm13z/3SUXD7gDTq5a
	 eNiX6uIaDymDsxC8DCwDrJoH8CbCDcJ8HRXIXRxrupB7XkPbop1FGbOl3JBh5LN1fx
	 rzAhy+ZBPOEVyK//IXuuYLkD1wl1Ti1e2+aLcXTU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44BABF805D2; Sun, 10 Aug 2025 15:35:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29972F805C4;
	Sun, 10 Aug 2025 15:35:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DBA1F80272; Sun, 10 Aug 2025 15:35:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ADD94F8010B
	for <alsa-devel@alsa-project.org>; Sun, 10 Aug 2025 15:35:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADD94F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=m.armsby@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=SNAITBuH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1754832918; x=1755437718; i=m.armsby@gmx.de;
	bh=YgiIQbK1bimeJ2PF7eOxvXerS+32p7Xow9lBWXfMga8=;
	h=X-UI-Sender-Class:Date:From:To:Subject:In-Reply-To:References:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=SNAITBuH8CiseaLQQnmn++O8gE1lBnJJl8GPEiXerVHQp3Kyc2u74GJNbarMt3bb
	 1zgt7F9avv3CB5Oko3plfbTCYjURIXuevHSDXLVQ5Pvio7trbK2hk1u5LHVnP25VS
	 jCRt3tMhyA9ktRWdwhgCTdAweEKCkcLaqVYyg1UdZD/JmpuAopBA3fLe6+I5FuONr
	 DBVOALYvoGmrEpAzxrtcLRvIR+o9DONoEIcT3wrheHdv8M3OMn6NUYQ92WfJ/bvaU
	 IRAjbciQwgd9sX2L6PXCB+mQHvts06VnbV63NY6wdaba5i7b197ZAo6rVUJRof0k8
	 /dh1MYBs9REfqIlO6w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([109.40.242.36]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MtOGa-1uSthI26Fa-00rg5p for
 <alsa-devel@alsa-project.org>; Sun, 10 Aug 2025 15:35:18 +0200
Date: Sun, 10 Aug 2025 15:35:17 +0200
From: "M. Armsby" <m.armsby@gmx.de>
To: alsa-devel@alsa-project.org
Subject: Re: ALSAfirewire broken / Pipewire 90ms delay
User-Agent: K-9 Mail for Android
In-Reply-To: <FD6FDA7B-D958-47BB-B90C-1A82349F94E4@gmx.de>
References: <224C5A41-DCED-4FA2-BE82-898F257DA2E9@gmx.de>
 <20250724143813.GA23616@workstation.local>
 <FD6FDA7B-D958-47BB-B90C-1A82349F94E4@gmx.de>
Message-ID: <F53B8EB4-F269-4666-B3EA-ED297C7E5C23@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Iq9+aXkAZ2pNZQ74fGq1iJMZk0CMX3D2LGJibqMJDt94/2h20YC
 a5q4/6vQ+XtEL8al8yQ4e8WPyCp0mArcQPwbq4jToTuPjKe6REHmrgBt+12q2GCEaZstaz/
 Er4aPEn3QQiKTs520zGtLv7t6ITn9k2ibYICn63G2af2ZKPDpEhDTRIps+Am+kP3xB4CmVd
 7yFePbrZB2ZlUgRQZef1A==
UI-OutboundReport: notjunk:1;M01:P0:AotwnQWBaQw=;OBQ3jk1Wlxop1MSRw9vrCOC0LFR
 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
 DHnvAld
Message-ID-Hash: QA6OYQ3CTP7MDKSMVSKSS6ENNUNLL2XM
X-Message-ID-Hash: QA6OYQ3CTP7MDKSMVSKSS6ENNUNLL2XM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QA6OYQ3CTP7MDKSMVSKSS6ENNUNLL2XM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 30 July 2025 21:36:00 CEST, "M=2E Armsby" <m=2Earmsby@gmx=2Ede> wrote:
>The new ALSAfirewire drivers are very good=2E Well done to everyone who w=
orked on them!=20
>
>Today I tested brand new CachyOS with xfce desktop kernel 6=2E15=20
>Initial Pipewire test showed RTT 98ms at 64/44100 so I uninstalled all tr=
aces of Pipewire and installed PulseAudio and Jack2 instead=2E
>I first tested ALSA direct from Reaper with Echo Audiofire4, Pianoteq and=
 the RTT was as expected around 8ms (no 90ms)
>Then Jack2 with ALSAfirewire=2E
>The result was very similar and around 2% less rtCPU usage but a few X-ru=
ns on page refresh=2E
>I then set CPU to balanced and Jack failed with hundreds of X-runs wherea=
s your wonderful ALSAfirewire alone continued with no X-runs  :)=20
>
>
>So you don't need to re-invent anything and there is nothing reasonable a=
bout 90ms delay=2E=20
>ALSAfirewire is working fine as long Pipewire isn't involved=2E
>
>Please fix the Pipewire problem as now nearly all distros are issued with=
 it and everyone is blaming ALSAfirewire stack!
>This madness should be stopped don't you agree?=20
>
>Please=2E
>
>Thanks Martin Armsby=20
>
>
>-------- Original Message --------
>From: Takashi Sakamoto <o-takashi@sakamocchi=2Ejp>
>Sent: 24 July 2025 16:38:13 CEST
>To: m=2Earmsby@gmx=2Ede
>Cc: alsa-devel@alsa-project=2Eorg
>Subject: Re: ALSAfirewire broken
>
>
>
>The 90ms delay is reasonable=2E=2E=2E, depending on the PCM buffer
>configuration=2E
>
>At present, all of drivers in ALSA firewire stack works with such delay
>due to queued initial packet=2E Therefore PipeWire computes the delay
>as expected=2E We would need to reeinvent the packet streaming engine if
>reducing the delay=2E
>
>
>Thanks
>
>Takashi Sakamoto
>
>-- Martin Armsby

So everyone is pleased ALSAfirewire is working so well with RTT under 10ms

The issue about 90ms is successfully addressed at my request:

<https://gitlab=2Efreedesktop=2Eorg/pipewire/pipewire/-/issues/4785>

I hope you can further support Firewire as many are now really excited abo=
ut finally being able to use it in professional studios without the (firewi=
re playback only) dreaded 90ms=2E

Im so glad I managed to wake the sleeping Firewire dragon and Wim Taymans =
is working on the buffers correction needed to work around ALSAfirewire 90m=
s which no one needed=2E

Cheers

Martin Armsby
Martin A - maa
-- Martin Armsby
