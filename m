Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 894132413EE
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Aug 2020 01:47:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10E081616;
	Tue, 11 Aug 2020 01:46:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10E081616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597103245;
	bh=lZtvu4syA98shCQ6aGA8GxKp1kPJXRjcRCmykZ9I4YM=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZKaNDLwYjGpznfo130lrEmuYrNZlMhDdGdTs9sBeKG0zsFlDc3lSrDEdvI4MKPRzM
	 0z4oP0ppGRhiILFUCSifAW3l2zTy8ab+kkd9ShJaW/1xkpo6KH9wOH0GLe3so//XH1
	 uBrAm/KwozMDnzNhbOjkfCtHEbQhSDsrqbR3EL2w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47766F8022D;
	Tue, 11 Aug 2020 01:45:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7E1DF8022B; Tue, 11 Aug 2020 01:45:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,PRX_BODYSUB_1,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-oln040092075089.outbound.protection.outlook.com [40.92.75.89])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79D16F800BC
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 01:45:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79D16F800BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com
 header.b="BR3FY5HR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GLLSGTwRFQ59MJbTyHggDpvvy95qJDlu+bwP+bc1u4c9Ekwld+SmpqA2w7Le4TZrVJSjscxTkr7PJGR/D2VNkzHs0YzTzPGh4iGgCmo6bDVP8rLDYFHyX7zh/GQncVsrvOkNgZzRBcJ2XPvmFvEfGXAnljH0M+AkuwCTakwClSuhq5blJq231JeFitG9a5wuLxpikiwK/gQ51hagJhLMtQiOmHk2uInFiP57YAT60lybYXe+rCmdzxuuLsz5f9Yuz5iNqfNRgL2PHgHGGiRwErHNQzeEEMbCQOnD9DIS/T7phwE+OtoM7xAmxx96cQepPUPvSKsJF4sNhKQZJ9E9+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JT/7VHsSuJTbK1mbfrZh7hxdb0vU8pCTGSVWmFpgdN0=;
 b=MMD+B8Hg8diCTBG/H1AwNRvg9Gt8syn9X/k5u1g0tkPaiP/akSHygHNf27BGrmkXgF4C4YbHCTaoI5uTpIR5CN2SEAOPuhNHQ4ckD43m8LbKSm96djUkOin/uLOChMOuA5W5MOX3qwhdNApqbgPBNq4OLQCDdm0JvU0obrmlGWIAsTQWzsKoKMPiDdpybl5b9+L665w9S4rgIMGaNoYTwLKEkJ+jjQwE0gSZcev7fBGdKRP/lLNXwzkf7EcJU2WQYTXN0BDCYjRfVrZjYceLkq/62vSNg4f+coKa+xTfV0yQPEL/7G9IFkJSi4OHlZXFA1tfPXzBR9bvZFsEk6TUbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JT/7VHsSuJTbK1mbfrZh7hxdb0vU8pCTGSVWmFpgdN0=;
 b=BR3FY5HR3HaU4KFdg1NUbT2Oy5i1yX+flv53QNVOKjzBAmhwl/H2v+Z8CLQeva5paSASTwSpuY+Y5yR5igYK8TVnt2g9USOCjl4TXQgZ8NkxvGPBc/mmn6bOqRuAEwm+0j3FmWsJgj5kE6TYg3TBJMj/yQNYI4rABWgR5A8k7w52Xl+tIzumDjGjQ5vRjq6Kfnl/fMx8nCwKhkvXI84s6B0ZlqcJcvBK5dYU/8GCGHesU9wpEqYSZXfwjaKQjnkZm2VsJJo48upD4ut0kU56o618RmiLy938Q7zaGM1GMQ33N2tgOuXI/WY6RBm7gYJYFv2usEnXaYmCxHg7CWTqrw==
Received: from DB3EUR04FT057.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0c::4b) by
 DB3EUR04HT195.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0c::384)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16; Mon, 10 Aug
 2020 23:45:31 +0000
Received: from DB7P191MB0332.EURP191.PROD.OUTLOOK.COM (2a01:111:e400:7e0c::46)
 by DB3EUR04FT057.mail.protection.outlook.com
 (2a01:111:e400:7e0c::125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16 via Frontend
 Transport; Mon, 10 Aug 2020 23:45:31 +0000
Received: from DB7P191MB0332.EURP191.PROD.OUTLOOK.COM
 ([fe80::a5a5:98a7:8748:f661]) by DB7P191MB0332.EURP191.PROD.OUTLOOK.COM
 ([fe80::a5a5:98a7:8748:f661%5]) with mapi id 15.20.3261.024; Mon, 10 Aug 2020
 23:45:31 +0000
From: Stuart Naylor <stuartiannaylor@outlook.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Hector Martin
 'marcan' <marcan@marcan.st>
Subject: RE: USB audio cuts 2-3 secs at start
Thread-Topic: USB audio cuts 2-3 secs at start
Thread-Index: AQHWZQG9kcNnxLiut0KuIZ3DNKabkqkw2LEAgAE5Awg=
Date: Mon, 10 Aug 2020 23:45:31 +0000
Message-ID: <DB7P191MB033205209A79C181EFB49C22A8440@DB7P191MB0332.EURP191.PROD.OUTLOOK.COM>
References: <mailman.12167.1595955329.5591.alsa-devel@alsa-project.org>
 <DB7P191MB03327F9F65BA389A950607AFA8730@DB7P191MB0332.EURP191.PROD.OUTLOOK.COM>,
 <bcf009b2-9a35-8b2f-5629-2fb991c41ea0@marcan.st>
In-Reply-To: <bcf009b2-9a35-8b2f-5629-2fb991c41ea0@marcan.st>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:E15CF387EA9CF2BC9F2F7E914BB4B9E4EE5587DF4E9C9ABCC8AECCD9D70497E6;
 UpperCasedChecksum:2404414D7939747F48AD5CFE98A263C83D04B077B71739F81CE5C9538C21EDDD;
 SizeAsReceived:6983; Count:43
x-tmn: [lSNu/1f6hDtEjrrCrCR3YmAZoLdt6Jwk]
x-ms-publictraffictype: Email
x-incomingheadercount: 43
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 58425e1e-48cb-44df-a1f0-08d83d877800
x-ms-traffictypediagnostic: DB3EUR04HT195:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Qcq8xMYYuNUxhJoaPts6JW4ekR/SVMWJ25eXArlWTq3wCYoWDvJIWd1JcSootzOJT5exBSvi/jRhpEBCF1cmOGBFtRtXdGXdxb4CRhbkaGWmsaM9WEsgRY53qMU32fgWKtkTfwMUle8YH6LmDo3vY8FPVJpnuLteQRQ4wp5SwjJK8QXjcNunALUOCRkyf0DP3etfLQ2apySglBbGP/U9RAAnIwUCoKgo8NGwh8WCjBpY7DiR7VdSoIk/Q33/xadP
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7P191MB0332.EURP191.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: bz+nXOMIOd0mYPbTmbyVAZ9UgDemYDYz3RxtJ9kQSLzN/zr6+PmAbTC3304ZFOUBoM2r4IAfdUsWqPrIZEjB4bigedZKKVmarcBN955jF35afTUG4B/UKwDY7IO8Eg5i59ATzMcfKsdFRUla6526ng==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: DB3EUR04FT057.eop-eur04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 58425e1e-48cb-44df-a1f0-08d83d877800
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2020 23:45:31.5262 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3EUR04HT195
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Thanks for the reply.

Windows it works with and a recent firmware fix solved that as its shipped =
with Windows behaving the same.
The Anker Power conf has a smartphone app that makes the firmware update a =
button click.
I don=92t think they could make a secret update to windows and also I did o=
riginally think the same.
I used sox with the -n option to constantly send a null silent stream.
The unit doesn=92t seem to like that as received some weird effects with re=
cording.
Its almost like the unit prefers to switch modes and can do so quickly but =
not both at once.
I guess it operates in a similar manner to wideband Bluetooth as its both U=
SB & Bluetooth but only one connected device and interface can be used at o=
ne time.

On X86 and I say X86 as the difference might be Pulseaudio not architecture=
 just my Socs where quick tests with aplay.
I haven=92t looked at the asound.conf of Ubuntu desktop but Alsa could be s=
et to use the PA Server.
Again I was using aplay but onX86 Ubuntu only the very first play cuts and =
all subsequent are then like windows.
I am fairly sure PA doesn=92t employ keepalive trickles but maybe it does?

I would of probably agreed with you until my sox hack produced such an arra=
y of problems.

Stuart

Sent from Mail<https://go.microsoft.com/fwlink/?LinkId=3D550986> for Window=
s 10

From: Hector Martin 'marcan'<mailto:marcan@marcan.st>
Sent: 10 August 2020 05:47
To: Stuart Naylor<mailto:stuartiannaylor@outlook.com>; alsa-devel@alsa-proj=
ect.org<mailto:alsa-devel@alsa-project.org>
Subject: Re: USB audio cuts 2-3 secs at start

On 29/07/2020 02.08, Stuart Naylor wrote:
> http://alsa-project.org/db/?f=3D6b107178c9939f235a390c07cb5c1f71d6a6e0c0
>
> Its an Anker power conf and for some reason the first couple of seconds o=
f aplay do not play via USB.
>
> Alsa-info above anyone and tips or ideas?

I bet this is just the way the hardware behaves. It probably takes a few
seconds to turn on its amplifiers and audio path when USB streaming starts.

If it doesn't happen in other OSes, then most likely those OSes
continuously stream audio to the device even when it is unused. The
workaround would be to do the same, e.g. use pulseaudio and disable
suspend-on-idle, or use JACK, or something along those lines that always
keeps the device running (with silence when no app is using it).

--
Hector Martin "marcan" (marcan@marcan.st)
Public Key: https://mrcn.st/pub

