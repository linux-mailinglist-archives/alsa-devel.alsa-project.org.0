Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B44E3D19FD
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jul 2021 00:55:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29F3516CF;
	Thu, 22 Jul 2021 00:55:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29F3516CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626908159;
	bh=xF55GcaDhtA8Jl8OJsN2BVgNq7BhbFqaKd28Gc/rMTc=;
	h=Date:From:Subject:To:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hCxkEbt5s5HmPUhc+KV5RJr8kFpdJbSbcGerCZBCkUr1ELc/SGelmc+p2hjf1kpEk
	 CWap66o6KFh7Olm8PFHY3o2MMfN71mdxDhJ4RaKP1m/Pt/tdY4NINTkqC0YHKPKjkS
	 4TJR0Kh4kW2SUGuqr1MCMmQv9qBvUGXQ7V2Gyf9c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58CF5F804DA;
	Thu, 22 Jul 2021 00:54:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ABF52F804CB; Thu, 22 Jul 2021 00:54:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx.ghoul.cz (mx.ghoul.cz [37.205.14.28])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4AC00F804AB
 for <alsa-devel@alsa-project.org>; Thu, 22 Jul 2021 00:54:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AC00F804AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ufiseru.cz header.i=@ufiseru.cz
 header.b="AX+trFGb"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 12A2956A3D
 for <alsa-devel@alsa-project.org>; Thu, 22 Jul 2021 00:54:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ufiseru.cz; s=dkim;
 t=1626908042; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=xF55GcaDhtA8Jl8OJsN2BVgNq7BhbFqaKd28Gc/rMTc=;
 b=AX+trFGbDpcaI54t/zDCcxuMiS2mhAfKunwGK7+hTlGW101Tw8p9mqIMxn/Lvd+RfslmUg
 iqkkBYhsTKJzTEbmh3SSMJ95I86Tay03oIHzMxbakG0lcalGxeHLHTptgia398wQaIVUER
 Pt0DnE7/UyqqPvPdS4Vv7lTy3A4myL7kbCqZyEMvxUMUakkNPjjMRXe8pH2zCkfdI1OrEs
 j4qssYLZxqt/sCFWb4HyayX9ZKWD8WdP9xu8eM9j89CBKItKKDeQIvUPkZpAOG7FnMGsXa
 gxVCoYFltsOpirPz6KMvyTt7aEJ98NPRlFwT+x8Rj0fYuPH7Jeq2BpEedl4klA==
MIME-Version: 1.0
Date: Wed, 21 Jul 2021 22:53:57 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "=?utf-8?B?SmFrdWIgRmnFoWVy?=" <jakub@ufiseru.cz>
Message-ID: <e52e42ccfd48c51132c925b3d4f34d54@ufiseru.cz>
Subject: Re: mic not working on JBL Quantum series USB headsets
To: alsa-devel@alsa-project.org
In-Reply-To: <c95dd9ae3e38b8a9965785b6f2b94bcca8df21ea.camel@tsoy.me>
References: <c95dd9ae3e38b8a9965785b6f2b94bcca8df21ea.camel@tsoy.me>
 <53ec08048f961a8a2564556e0daa78f0@ufiseru.cz>
X-Last-TLS-Session-Version: TLSv1.3
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

July 21, 2021 10:17 PM, "Alexander Tsoy" <alexander@tsoy.me> wrote:

> =D0=92 =D0=92=D1=82, 20/07/2021 =D0=B2 18:00 +0000, Jakub Fi=C5=A1er =
=D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>=20
>>=20My Quantum 800's microphone doesn't work and I found other reports
>> suggesting
>> this issue affects the whole Quantum product line.
>=20
>=20This device consists of two interfaces. The first interface contains =
a
> single playback endpoint and the second interface contains playback and
> capture endpoints. So JBL Quantum probably needs a registration quirk
> similar to Kingston HyperX devices. Please try the patch below:

The patch works! Thanks. Two new profiles appeared in Pulseaudio (via
Pipewire) with "Mono input" and the profile "Pro Audio" gained the
mono input as well. Both analog and digital profiles work for playback
but only the "Pro Audio" profile exposes the second output as well. This
profile is only available when using Pipewire (not in "plain" Pulse) but
I guess this is not an Alsa-related issue.

The microphone works in all three profiles as expected, everything
is there out-of-the-box with the patched kernel. What's the process to
get this patch to mainline? Should I be involved in it somehow?


> + REG_QUIRK_ENTRY(0x0ecb, 0x203e, 2), /* JBL Quantum 800 */

I think this is needed for the whole JBL Quantum headset product
line with USB connection according to what people have been
reporting so far.

I'm not familiar with the brand but from what I can tell, this=20
only=20includes models 300, 400, 600, 800 and "One" where 600 and
800 are wireless via USB dongle and the others are wired USB.

As far as I can tell all of the above except 300 have two outputs.
Might be relevant according to what you said:

> This device consists of two interfaces. The first interface contains a
> single playback endpoint and the second interface contains playback and
> capture endpoints.


Just FYI, the headset also claims to have support for DTS Surround and
a 7.1 ultimate-something, the latter being explicitly a proprietary thing=
.

I guess DTS support is proprietary, too, but I couldn't find anything abo=
ut
it except that "it is there". In Windows both modes are only available vi=
a
the proprietary application.

-j.
