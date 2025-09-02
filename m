Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCE0B3F758
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Sep 2025 10:00:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F63C601B6;
	Tue,  2 Sep 2025 10:00:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F63C601B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756800050;
	bh=GyQWy8JOWscW0ybAhRtNmYaEX3SEbhlunk2Mp/D2Cyo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LB3FtgOM4OsTCht4jtqTbk864Qz8IT2V92Ml4X8EQ7bJaLl7xEQn9OODyiRp8Hu15
	 5/NBHZvN5+Cn7KsDwyJAtRl37/xdjZKoODztenB4hSYKSF9BCgsGZ/WjnTkGlZi0Z6
	 APRlJXDQpZZ7DmJFGjdFw/Rph6r8cilyTkN9ZkXA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DF1FF805C7; Tue,  2 Sep 2025 10:00:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E93FDF805C7;
	Tue,  2 Sep 2025 10:00:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 220BCF80246; Tue,  2 Sep 2025 10:00:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DB6E7F801F5
	for <alsa-devel@alsa-project.org>; Tue,  2 Sep 2025 10:00:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB6E7F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=m.armsby@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=sI8JWhHt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1756799999; x=1757404799; i=m.armsby@gmx.de;
	bh=1CBYuzYpCXkGl5JES8uvRduOr6YdzywVe08CkRllJAw=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:In-Reply-To:References:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=sI8JWhHtzr2O1dGOAANCNzznVbKHoyPpBOcSJ4X5jHMxUOX+u/Gokqyo9I0HzwIq
	 OmvT/HHhgzdtEuMUB6JhYPYLjdWQrt/+XR4JJisklanNkUOZzLSI9+/ckWuOvmdrS
	 3eGK+wF1enRjfJFoWYcWTaT6JEJQKHflMXt5xQtMf8EmyIhbrT3+rWsnBRdeJADxO
	 oLjpEE5NRojC7MknD1aqfn0/U4s/2z2XNyP4BOtEeWGROBFedQWzelLLKO6FWJULa
	 q+XGaq5z8e61pqVQCH0WfhDCJRaC8fO30nT+S4qhYszwbm9lUQpvWPT+4bnFj9C37
	 jbzg/yojqyItS1S5Pg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([77.20.253.70]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N17Ye-1uUVTZ31zu-011Hvr; Tue, 02
 Sep 2025 09:59:59 +0200
Date: Tue, 02 Sep 2025 09:59:58 +0200
From: "M. Armsby" <m.armsby@gmx.de>
To: alsa-devel@alsa-project.org
CC: Takashi Sakamoto <o-takashi@sakamocchi.jp>, linux-kernel@vger.kernel.org
Subject: Re: ALSAfirewire broken / Pipewire 90ms delay
User-Agent: K-9 Mail for Android
In-Reply-To: <FD6FDA7B-D958-47BB-B90C-1A82349F94E4@gmx.de>
References: <224C5A41-DCED-4FA2-BE82-898F257DA2E9@gmx.de>
 <20250724143813.GA23616@workstation.local>
 <FD6FDA7B-D958-47BB-B90C-1A82349F94E4@gmx.de>
Message-ID: <48A27ABA-5EF6-400D-A47A-103C1A4ABC6D@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+jWPIt2ohuTWS8lhI1A8h4PY8+EI2SKjodHg0QBbRAz3lUSMG0G
 4j8499EYPmYkfHzRSFlsjGv122eYVLp+/M0CCyD7MlTVWFheTUMle3STLWLwsWtHSahFe0j
 sR8ieha7GPUNXCrdw2D7jA89MIRu6BHY5ixrUqIzPPu05SamXtwzfJmpDRlo/1N/Sp9Cvnk
 LEw+/ErrhEqs0IYRGF8BQ==
UI-OutboundReport: notjunk:1;M01:P0:kmP0ASunhWE=;7NvzwRwtVe96nDZsXZXD1ONtnWm
 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
 pkfBf2i35y4KNoKAoP8
Message-ID-Hash: J5S32X4OXPZ2RXIDZQVTLZTPOTYI2XP6
X-Message-ID-Hash: J5S32X4OXPZ2RXIDZQVTLZTPOTYI2XP6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J5S32X4OXPZ2RXIDZQVTLZTPOTYI2XP6/>
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

@wtaymans =20
Wim Taymans and some guest programmers found a simple workaround to bypass=
 the 90ms delay:

monitor=2Ealsa=2Erules =3D [
  {
    matches =3D [ { node=2Ename =3D "alsa_output=2Efirewire-0x000a35003926=
b6db=2Epro-output-0" } ]
    actions =3D { update-props =3D {
       api=2Ealsa=2Eperiod-num =3D 3
    } }
  }=20
]

The communication from DAW to pure ALSAfirewire is not burdened with 90ms =
so please change the pins or whatever pipewire is using, so that it can avo=
id the 90ms like a DAW does when communicating directly to ALSAfirewire dri=
ver=2E=20
It must be obvious and easy to see in comparison and thus fix=2E=20

ALSAfirewire RTT =3D 10ms
Pipewire-Firewire RTT =3D 10 + 90ms

Please, many professionals are waiting for this fix which will boost Linux=
 up to professional level=2E=20

Thanks





-- Martin Armsby
