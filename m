Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6E91746DE
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Feb 2020 13:39:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9095C16E0;
	Sat, 29 Feb 2020 13:39:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9095C16E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582979996;
	bh=uKEB6Vx6x3Ty2rPHKz4AXA9jhddebxWvXW3rHPUWvs0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pFySV9Awso139uKE+IJEYLypvvtf97utitgKLKgutyhuYzGQ3C/ifbsadx2czMaIW
	 YT5S+UWsAeov5KXOovjC/En4Tti2ZpTqNorEkSDNWkTWqIWDQasA+N5UvfUfu/G6cJ
	 GuIYuarIzDONTWPSNxk6BVXF2S2zeJaQUVMEnErU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34C6CF80089;
	Sat, 29 Feb 2020 13:38:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB60BF8013E; Sat, 29 Feb 2020 13:38:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ****
X-Spam-Status: No, score=4.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HELO_DYNAMIC_IPADDR,RDNS_NONE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from ber75-3-78-194-10-185.fbxo.proxad.net (unknown
 [IPv6:2a01:e34:ec20:ab90:82ee:73ff:fe69:7f62])
 by alsa1.perex.cz (Postfix) with ESMTP id B2608F800E1
 for <alsa-devel@alsa-project.org>; Sat, 29 Feb 2020 13:38:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2608F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ap2c.com header.i=@ap2c.com
 header.b="Z2gSk7vT"
Received: from mail-gateway.ap2c.org (localhost [127.0.0.1])
 by ber75-3-78-194-10-185.fbxo.proxad.net (Postfix) with ESMTP id 1D37B10C3A3; 
 Sat, 29 Feb 2020 13:38:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ap2c.com; s=ap2cCom;
 t=1582979888; bh=uKEB6Vx6x3Ty2rPHKz4AXA9jhddebxWvXW3rHPUWvs0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Z2gSk7vTfVu1d1dnu/y7KapDhM3ugygUyqQXeFlHX4xCZsonp85ScksUdVE1fxnz4
 wPf7z286lTI0PsngHH2fQWDoodWPJskOg2MN9cP4XZ+ys1aD/hr2tWC8OHA9V814bX
 meHMW9BCaoT0p+b1nnIrfr6VxZ0I7pep2w5TvVRo=
X-Virus-Scanned: amavisd-new at ap2c.orgm
Received: from ber75-3-78-194-10-185.fbxo.proxad.net ([127.0.0.1])
 by mail-gateway.ap2c.org (berkelium.ap2c.org [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id vAA25ZYUXTWg; Sat, 29 Feb 2020 13:38:07 +0100 (CET)
Received: from antimony.ap2c.org (unknown
 [IPv6:2a01:e34:ec20:ab90:63ad:3e9d:5e02:f5e0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ber75-3-78-194-10-185.fbxo.proxad.net (Postfix) with ESMTPSA;
 Sat, 29 Feb 2020 13:38:07 +0100 (CET)
From: =?ISO-8859-1?Q?Aur=E9lien?= Croc <aurelien@ap2c.com>
To: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] No sound with Realtek ALC298 on a Samsung Galaxy book
Date: Sat, 29 Feb 2020 13:37:37 +0100
Message-ID: <15991530.MgTdZOinpY@antimony.ap2c.org>
Organization: =?UTF-8?B?QVDCskM=?=
In-Reply-To: <bd2f299ee9784fe2898cc303ff3516d0@realtek.com>
References: <1610933.XPBrhYXKCp@antimony.ap2c.org>
 <s5h1rqsc1kd.wl-tiwai@suse.de> <bd2f299ee9784fe2898cc303ff3516d0@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Cc: Takashi Iwai <tiwai@suse.de>, Kailang <kailang@realtek.com>
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

> Sorry.
> Samsung didn't request this platform need to support Linux.

I can understand that you can't work on my problem if your client (Samsung)=
=20
didn't paid for that. However is it possible to get ALC298 specs in order t=
o=20
understand how to configure it (in particular a document which explains its=
=20
COEF registers and their meaning) and I will do the job.

Thank you in advance.
Regards,

Aur=E9lien

P.S. : sorry for those who received this email twice: I had trouble with th=
e=20
SMTP server..



