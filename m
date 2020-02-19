Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3717163FF4
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 10:07:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9ABB11704;
	Wed, 19 Feb 2020 10:06:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9ABB11704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582103227;
	bh=8vL7puauUqwwf8sAU66lbIgtKKPn4Uhnyv5ohIwkGtI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=npDw7O/JtHCGXP5PWojthp2qTw5n9UqQEi+nlJo9+ywYr6GLZg8Eg3k3Dl1Tk9Mz5
	 bWYvZpyFCdCSg+aHi/djfXBXgAhOJVi8Ii80ho6HmZuECAuQmiXR8riqDN4h89JzUA
	 8H1eGGA+7ke0VwhzSXXO0YCjJLzKyo0PRA4Ugy2E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B783F800C4;
	Wed, 19 Feb 2020 10:05:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9106CF80142; Wed, 19 Feb 2020 10:05:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from berkelium.ap2c.org (unknown
 [IPv6:2a01:e35:1386:d790:250:fcff:fe42:7bed])
 by alsa1.perex.cz (Postfix) with ESMTP id D4DF7F80142
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 10:05:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4DF7F80142
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ap2c.com header.i=@ap2c.com
 header.b="oEq1E4wC"
Received: from berkelium.ap2c.org (localhost [127.0.0.1])
 by berkelium.ap2c.org (Postfix) with ESMTP id C76EA136B
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 10:05:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ap2c.com; s=ap2cCom;
 t=1582103137; bh=8vL7puauUqwwf8sAU66lbIgtKKPn4Uhnyv5ohIwkGtI=;
 h=From:To:Subject:Date:In-Reply-To:References;
 b=oEq1E4wC5DC03TjMFBvDE8dVxj/ZjhcEBu/heqcHblwT7kfwPZFokBvoXEqf5YOfC
 B6feNcArUntCYoK6vDQ2bFVJIQCXwuGUgTkqZLexfZ5onZTEzsmirqie6VtFtIku00
 JtsVhfVvK1G1A9T3kcKnbWhYCUBltUhZC5WiliC0=
X-Virus-Scanned: amavisd-new at ap2c.org
Received: from berkelium.ap2c.org ([127.0.0.1])
 by berkelium.ap2c.org (berkelium.ap2c.org [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id W0XT8zd5unJ3 for <alsa-devel@alsa-project.org>;
 Wed, 19 Feb 2020 10:05:37 +0100 (CET)
Received: from antimony.ap2c.org (unknown
 [IPv6:2a01:e34:ec20:ab90:63ad:3e9d:5e02:f5e0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by berkelium.ap2c.org (Postfix) with ESMTPSA
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 10:05:37 +0100 (CET)
From: =?ISO-8859-1?Q?Aur=E9lien?= Croc <aurelien@ap2c.com>
To: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] No sound with Realtek ALC298 on a Samsung Galaxy book
Date: Wed, 19 Feb 2020 10:05:36 +0100
Message-ID: <3375274.Es2tsrqsTZ@antimony.ap2c.org>
Organization: =?UTF-8?B?QVDCskM=?=
In-Reply-To: <s5h1rqsc1kd.wl-tiwai@suse.de>
References: <1610933.XPBrhYXKCp@antimony.ap2c.org>
 <5023991.OkN0jAucn1@antimony.ap2c.org> <s5h1rqsc1kd.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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

Hi,=20

> Aha, so the input works but only the output doesn't?
> Then it's not about the basic stuff like pin configuration but rather
> the missing COEF setup or such that is specific to Realtek codec
> (and/or the Samsung platform).
>=20
> Kailang, do you have any clue?

While waiting for Kailang's answer (and I hope he'll get the solution!!),=20
isn't it possible to grab information from Windows? I'm sorry I don't know=
=20
very well how Realtek chip works but if the problem would comes from some=20
registers which are not well initialized isn't it possible to dump the stat=
e=20
of the realtek chip and its registers under Windows and compare it with the=
=20
one under Linux?
Because I'm not sure that revers engineer the Windows driver would really=20
easily lead to the solution.

Thank you again for your help.

Aur=E9lien



