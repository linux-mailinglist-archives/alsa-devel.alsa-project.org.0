Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0712216141D
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 15:05:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C0771668;
	Mon, 17 Feb 2020 15:04:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C0771668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581948310;
	bh=4UU4MoMrU+/oNwXcGFGjLVmIH/ZEaVTh2kenL8qtvUY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LsFePwEd8TrrNb3bXdCnU3Bb0PcACe98p05vE8Jfw0rIQ6dm3InLWF4/n4Hmg0/s0
	 iqY9TmnwqNCe1KEn+8RCC/5Ib43B24gQyIJlGjq1YjB5CE5YlP2P6xTkBTvwKaYmD7
	 5SKAMKBnm0MTIFSr+2yOSpNGvdXHyyFOOWAIrOKI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC38AF801F4;
	Mon, 17 Feb 2020 15:03:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B246F80172; Mon, 17 Feb 2020 15:03:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from berkelium.ap2c.org (berkelium.ap2c.org [81.56.109.121])
 by alsa1.perex.cz (Postfix) with ESMTP id B6F82F800B6
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 15:03:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6F82F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ap2c.com header.i=@ap2c.com
 header.b="P8bzdAuq"
Received: from berkelium.ap2c.org (localhost [127.0.0.1])
 by berkelium.ap2c.org (Postfix) with ESMTP id F3A391115;
 Mon, 17 Feb 2020 15:03:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ap2c.com; s=ap2cCom;
 t=1581948198; bh=gr5LuANKkxkymfIM8Fjh7yQ1wP5sA92Ugyg+o9cpwv4=;
 h=From:To:Subject:Date:In-Reply-To:References;
 b=P8bzdAuqkOrcclDe0cLfqGl0faROWggQ2aAzxd57TnI+oT83KktXYdbriyQiS0xHv
 M7cX79Z6izDnoTksSdLoxaEQW5Alm5F6phjTxZsnTt5lBDmZScz7HqGY8oR16sl3Ek
 Q34YnwnH2VCWwcuI5U51BUjJk2dXBQvmM0CD481s=
X-Virus-Scanned: amavisd-new at ap2c.org
Received: from berkelium.ap2c.org ([127.0.0.1])
 by berkelium.ap2c.org (berkelium.ap2c.org [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id KvCrov1aXXOG; Mon, 17 Feb 2020 15:03:17 +0100 (CET)
Received: from antimony.ap2c.org (unknown
 [IPv6:2a01:e34:ec20:ab90:63ad:3e9d:5e02:f5e0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by berkelium.ap2c.org (Postfix) with ESMTPSA;
 Mon, 17 Feb 2020 15:03:17 +0100 (CET)
From: =?ISO-8859-1?Q?Aur=E9lien?= Croc <aurelien@ap2c.com>
To: Takashi Iwai <tiwai@suse.de>, alsa-devel <alsa-devel@alsa-project.org>
Date: Mon, 17 Feb 2020 15:03:16 +0100
Message-ID: <2757884.e1HrdM282F@antimony.ap2c.org>
Organization: =?UTF-8?B?QVDCskM=?=
In-Reply-To: <s5himk5bq39.wl-tiwai@suse.de>
References: <1610933.XPBrhYXKCp@antimony.ap2c.org>
 <s5himk5bq39.wl-tiwai@suse.de>
MIME-Version: 1.0
Subject: Re: [alsa-devel] No sound with Realtek ALC298 on a Samsung Galaxy
	book
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

> The BIOS seems broken, it just sets a single output pin.
> You need to try to figure out the pin connections, e.g. via
> hdajackretask program.  The headphone might work with that.
> But the speaker output might need another special handling, and it's
> nothing but trial-and-test with the existing quirks for similar
> devices.  Take a look at sound/pci/hda/patch_realtek.c.

Thank you for your answer. I tried hdajackretask but I didn't succeed to ge=
t =

sound from headsets.. Maybe I didn't tried all the advanced features of thi=
s =

tool..
I also tried some quirks from  your file but it changes nothing. There are =
too =

many possibilities. It seems to be hard to test them all.

Don't you know a solution to get what is bugged or to get information about =

which channel is linked to headets or internal speakers from Windows driver=
s? =

I think about a tool to sniff communication between the driver and the soun=
d =

card? or read information from the sound card under windows?
Reverse engineering the Windows driver would lead to the solution but will =
be =

very long for me since I'm not familiar with the Intel HDA card and how thi=
s =

Realtek chip internally works.
Don't hesitate if you have any hints which could help me (and all the other =

users of this laptop..)
Cheers, =


Aur=E9lien

Le lundi 17 f=E9vrier 2020, 09:00:42 CET Takashi Iwai a =E9crit :
> On Sat, 15 Feb 2020 17:56:58 +0100,
> =

> Aur=E9lien Croc wrote:
> > Dear ALSA community,
> > =

> > I just bought a Samsung Galaxy book 12" laptop and I installed the late=
st
> > Fedora version (31) on it. Unfortunately when I try to listen something
> > there is absolutely no sound from speaker nor headsets. I checked that
> > volumes of the different channels were max. I also checked for muting
> > system but I didn't found anything.
> > Of course it works perfectly under Windows.
> > I saw on internet that many ALC298 users had troubles with it. I tried
> > different options to the intel hda driver (especially the model one) but
> > it
> > changes nothing.
> > =

> > Here is the alsa-info.sh output: http://alsa-project.org/db/?
> > f=3D871881e295972b9ecf252b25e90d659e38d939b8
> > I would appreciate some help in order to find a solution.
> > Tell me if you need more information.
> > Thanks in advance.
> =

> The BIOS seems broken, it just sets a single output pin.
> You need to try to figure out the pin connections, e.g. via
> hdajackretask program.  The headphone might work with that.
> But the speaker output might need another special handling, and it's
> nothing but trial-and-test with the existing quirks for similar
> devices.  Take a look at sound/pci/hda/patch_realtek.c.
> =

> =

> Takashi



_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
