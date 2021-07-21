Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0490F3D1A26
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jul 2021 01:04:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7973A16AE;
	Thu, 22 Jul 2021 01:03:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7973A16AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626908655;
	bh=ysXtldeJ4f8Pb2/FM8hMNFJ0BTclyW14qjGLhqGweXA=;
	h=Date:From:Subject:To:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r9rehmlBw6qSUojv6dparW3BJzujqCdHZ0fyKCibct+XmrUQlhruJH9VvMkIALoFR
	 OTyckA3Q2Xi3MHhW/gV1XKgU8IxGSeoPN6GM09G9xrjZMjZWDL2xlV2EMdLbwf2OT7
	 hqdWxqml4BuGQ7bdFjJIvPgU7znXh62oCMQTwhfo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0EE4F804AD;
	Thu, 22 Jul 2021 01:02:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A219DF804AC; Thu, 22 Jul 2021 01:02:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx.ghoul.cz (mx.ghoul.cz [37.205.14.28])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 810DEF80143
 for <alsa-devel@alsa-project.org>; Thu, 22 Jul 2021 01:02:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 810DEF80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ufiseru.cz header.i=@ufiseru.cz
 header.b="R1o8P1an"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DC03C56D0C
 for <alsa-devel@alsa-project.org>; Thu, 22 Jul 2021 01:02:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ufiseru.cz; s=dkim;
 t=1626908526; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=cG0LFRJjqDsR+e1MF2QuwqxJTPjKploBJhXnTkAvlM0=;
 b=R1o8P1anm8xSuMDP7oAVbnqy+KOyc/unZKeN1OcaFGJbcvl0uKTTzpjk+B9XCl+V3yOpRC
 0flxXA30lOAcBljVOK2xywXA880vhYViLWLJ5gwPr6XqQQPgkRZN+bCQoz3dnSWawRMSCX
 Sh5ugPf7DdPAqJ+PCMtQHrlldFv9bgK916FJf7P7SAkTVC9SXuuDwqdkxuYdcEJqfNCWpT
 yEd2rpdfKekoaoDuI7V2Hkh93bOfKFjNCNNBM/ut0uUBbG6Qjmyp85BWjOTe/os3bpqFB5
 nPjeIPAqW5lXHs23tKl57370f+hesSVaXt7WqSWdrbU3rJ3nK5VYzl5CaiFEMA==
MIME-Version: 1.0
Date: Wed, 21 Jul 2021 23:02:04 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "=?utf-8?B?SmFrdWIgRmnFoWVy?=" <jakub@ufiseru.cz>
Message-ID: <918d9ff6e2a0a2924798cec37e3becb9@ufiseru.cz>
Subject: Re: mic not working on JBL Quantum series USB headsets
To: alsa-devel@alsa-project.org
In-Reply-To: <25121b3c1ac2f68d3ab60c9403975480fdde2121.camel@tsoy.me>
References: <25121b3c1ac2f68d3ab60c9403975480fdde2121.camel@tsoy.me>
 <c95dd9ae3e38b8a9965785b6f2b94bcca8df21ea.camel@tsoy.me>
 <53ec08048f961a8a2564556e0daa78f0@ufiseru.cz>
 <927fdcf7d478c50c2d5fa67b69d9fdfd@ufiseru.cz>
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

July 22, 2021 12:55 AM, "Alexander Tsoy" <alexander@tsoy.me> wrote:

> =D0=92 =D0=A1=D1=80, 21/07/2021 =D0=B2 22:34 +0000, Jakub Fi=C5=A1er =
=D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>=20
>>=20
>> I guess DTS support is proprietary, too, but I couldn't find anything
>> about
>> it except that "it is there". In Windows both modes are only available
>> via
>> the proprietary application.
>=20
>=20According to lsusb output [1] this device works in UAC 1.0 mode and
> doesn't expose any of these capabilities. Presumably Windows driver is
> switching the device into some proprietary vendor specific mode or it
> is processing surround sound entirely in software.
>=20

I=20think users will be happy with their mics working, don't think any
Linux user bought these expecting DTS to work. Anyway, I'll study up=20
a=20little bit on this later and try to figure out if it is HW or SW. I'l=
l
post my findings here.

  -j.
