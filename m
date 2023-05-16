Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 218237056DB
	for <lists+alsa-devel@lfdr.de>; Tue, 16 May 2023 21:13:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DF72FA;
	Tue, 16 May 2023 21:13:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DF72FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684264432;
	bh=lPiyxEGcF1KlDHw4ofGuIh2DNUJsPU05Ns6yT7TUp6U=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=c82yVgIGMi3eaDaJfG6EvNEfDl3CTRICHvwuB1ONRtEQxiwnPexpIm9Z0DMY3FOdF
	 hra8/Mkpj1DZGzynU1pwPQUNTlPk6QgBFRnX6ObmA/cMzdL9lDK6wccx2GXCEhZ+NV
	 DwXQ06TPTFPOtyTdFYnhDBDDTpPSqJ1GIWuJ95/c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F392CF80087; Tue, 16 May 2023 21:13:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE8D5F80087;
	Tue, 16 May 2023 21:13:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F4F6F80272; Tue, 16 May 2023 21:12:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_FAIL,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr
 [IPv6:2a01:e0c:1:1599::10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2C006F8016D
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 21:12:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C006F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ap2c.com header.i=@ap2c.com header.a=rsa-sha256
 header.s=ap2cCom header.b=q1HarEY9
Received: from 82-65-29-218.subs.proxad.net (unknown [82.65.29.218])
	by smtp1-g21.free.fr (Postfix) with ESMTP id 225F3B0057C
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 21:12:50 +0200 (CEST)
Received: from berkelium.ap2c.org (localhost [127.0.0.1])
	by 82-65-29-218.subs.proxad.net (Postfix) with ESMTP id CAC131F6
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 21:12:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ap2c.com; s=ap2cCom;
	t=1684264369; bh=lPiyxEGcF1KlDHw4ofGuIh2DNUJsPU05Ns6yT7TUp6U=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=q1HarEY9m5ml+0pf3l2vmIb4Km6NNcjYTI5HZmCkABDDUFLJenxFL7e/HWFygDmGg
	 TSpFytmgnIBDDxLgd/oZE+4/FYmKBzr5+/xFBMt9v/oSNfqnhGQF4co1mgy14VeMvq
	 4kNWpoVbMASuxBPGT69S5m4ZHR27OsHecBXCkUCc=
X-Virus-Scanned: amavisd-new at ap2c.org
Received: from 82-65-29-218.subs.proxad.net ([127.0.0.1])
	by berkelium.ap2c.org (berkelium.ap2c.org [127.0.0.1]) (amavisd-new,
 port 10024)
	with ESMTP id gJRyH4V_SFzJ for <alsa-devel@alsa-project.org>;
	Tue, 16 May 2023 21:12:49 +0200 (CEST)
Received: from antimony.ap2c.org (unknown
 [IPv6:2a01:e0a:91c:5c0:fb80:e2b5:bf75:1e18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by 82-65-29-218.subs.proxad.net (Postfix) with ESMTPSA
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 21:12:49 +0200 (CEST)
From: =?ISO-8859-1?Q?Aur=E9lien?= <aurelien@ap2c.com>
To: alsa-devel@alsa-project.org
Subject: Re: Patch for Realtek ALC298 on a Samsung Galaxy book
Date: Tue, 16 May 2023 21:12:48 +0200
Message-ID: <12207548.O9o76ZdvQC@antimony.ap2c.org>
In-Reply-To: <441231b80626cca3862320ff8b8d35430234518c@ap2c.com>
References: <441231b80626cca3862320ff8b8d35430234518c@ap2c.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Message-ID-Hash: HTY4VKU2BWTD22FVPM6YOW4JSTAHHILT
X-Message-ID-Hash: HTY4VKU2BWTD22FVPM6YOW4JSTAHHILT
X-MailFrom: aurelien@ap2c.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HTY4VKU2BWTD22FVPM6YOW4JSTAHHILT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,=20

I sent this patch in order to get it integrated into the ALSA source code (=
or=20
at least in order to discuss this patch) but i got no news.
How can I do in order to integrate it?
Thanks in advance.

Aur=E9lien

Le vendredi 12 mai 2023, 09:04:57 CEST Aur=E9lien a =E9crit :
> Hi,=20
>=20
> Several years ago I sent several mails about problem with Realtek ALC 298
> sound card not working on Samsung Galaxy book. Due to a computer problem i
> had to stop working on it. However I succeed to get it working and I'm
> submitting the patch attached to this email.
>=20
> Internal speakers works very well.
> In order to get headset working I had to hack a little bit since it shares
> the same pin widget (0x17) with the internal speaker. It seems that the
> ALSA code have solutions to declare a pin widget as both internal and jack
> but if I use that it doesn't recognize the presence of the jack.. Maybe I=
'm
> wrong somewhere.
>=20
> Last but not least i saw that under windows the driver uses another mixer
> (0xd through the out widget 0x3 rather than mixer 0xc throught the out
> widget 0x2) when it uses the headset. It offers the opportunity to have a
> dedicated volume control for the headset independant from the internal
> speaker. Maybe it could be interesting to do the same under the Linux
> driver. Unfortunately I don't know how to do that.=20
>=20
> Do you think is it possible to integrate this patch to the ALSA code?
>=20
> Thanks in advance.
>=20
> Aur=E9lien


