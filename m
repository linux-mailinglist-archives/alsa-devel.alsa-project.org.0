Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C66374782C
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jul 2023 20:07:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 264907F1;
	Tue,  4 Jul 2023 20:06:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 264907F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688494027;
	bh=CM++rz1PbRfywdn1gZCBikP/gK4AxB2huLNBauE/8CA=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=aDd9YUBS3pNk9Vs60XBvN7gE2R8qZYzgmlR2IFCWqyWsI5l9XzttNUR/NFCwNTy2D
	 puj486ENPhqwkU34lB/Hahkig9gYu/FZ3fwg+UCvaoBMDzmeEH5YkZ6TuUyuguEJrC
	 1PeOwPnxlVyEzLgxPA22OOzZkycYzjQSklerexps=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87BFEF80153; Tue,  4 Jul 2023 20:06:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E387F80093;
	Tue,  4 Jul 2023 20:06:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E79EF80125; Tue,  4 Jul 2023 20:06:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_FAIL,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 397F4F80104
	for <alsa-devel@alsa-project.org>; Tue,  4 Jul 2023 20:06:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 397F4F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ap2c.com header.i=@ap2c.com header.a=rsa-sha256
 header.s=ap2cCom header.b=Y42Ge6nN
Received: from 82-65-29-218.subs.proxad.net (unknown
 [IPv6:2a01:e0a:5ef:1450:250:fcff:fe42:7bed])
	by smtp5-g21.free.fr (Postfix) with ESMTP id 55B115FFAF
	for <alsa-devel@alsa-project.org>; Tue,  4 Jul 2023 20:06:07 +0200 (CEST)
Received: from berkelium.ap2c.org (localhost [127.0.0.1])
	by 82-65-29-218.subs.proxad.net (Postfix) with ESMTP id 1C5225E1
	for <alsa-devel@alsa-project.org>; Tue,  4 Jul 2023 20:06:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ap2c.com; s=ap2cCom;
	t=1688493966; bh=CM++rz1PbRfywdn1gZCBikP/gK4AxB2huLNBauE/8CA=;
	h=From:To:Subject:Date;
	b=Y42Ge6nNT9VnDaQNs9eSWTCRWoTgl21gOaxUfuUJT4vmodaykXPr8fjXPH0S8Z0yI
	 bSLOuipoe47+Dy93aNHYqEnfh2w9zz2VRW2quAzMtWyULl+kD1AYSC50wfHi6tnVhO
	 ZHfD6dXpPzNYqrhyXGPLq5flU+ciNqlyBltlxeEs=
X-Virus-Scanned: amavisd-new at ap2c.org
Received: from 82-65-29-218.subs.proxad.net ([127.0.0.1])
	by berkelium.ap2c.org (berkelium.ap2c.org [127.0.0.1]) (amavisd-new,
 port 10024)
	with ESMTP id GIx-iVo1WtYi for <alsa-devel@alsa-project.org>;
	Tue,  4 Jul 2023 20:06:05 +0200 (CEST)
Received: from antimony.ap2c.org (unknown
 [IPv6:2a01:e0a:91b:86f0:eaee:9e47:2c1b:535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by 82-65-29-218.subs.proxad.net (Postfix) with ESMTPSA
	for <alsa-devel@alsa-project.org>; Tue,  4 Jul 2023 20:06:05 +0200 (CEST)
From: =?ISO-8859-1?Q?Aur=E9lien?= <aurelien@ap2c.com>
To: alsa-devel@alsa-project.org
Subject: Garbage returned while reading unused S/PDIF, A CM106 like sound card
Date: Tue, 04 Jul 2023 20:06:04 +0200
Message-ID: <5962046.lOV4Wx5bFT@antimony.ap2c.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Message-ID-Hash: QOYEBYXS6QE5L3MCSETUCOPCFT4ROMDV
X-Message-ID-Hash: QOYEBYXS6QE5L3MCSETUCOPCFT4ROMDV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QOYEBYXS6QE5L3MCSETUCOPCFT4ROMDV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello,=20

I encounter troubles while using S/PDIF input on an CM106 like sound card=20
(vendor 0x0d8c, device 0x0102) when the remote device which is connected by=
 S/
PDIF to the sound card is powered off.
In that case garbage data are reading from the S/PDIF rather than.. nothing

It is really boring since this S/PDIF input is connected to the output=20
speakers and once the remote deviced is powered off it emits a really=20
disturbing sound.
Since there is no input on the S/PDIF I guess that it could be a driver bug?
If it's an hardware bug (I don't encounter the problem under windows..) is =
it=20
possible to make a hack in order to distinguish between real data and noise=
 on=20
the S/PDIF input?

Unfortunately this test is performed on an embedded device which runs linux=
=20
5.16.17-sun50iw6. I don't know if this problem still occurs with newer alsa=
=20
version.

Thank you in advance for your help.
Regards,=20

Aur=E9lien


