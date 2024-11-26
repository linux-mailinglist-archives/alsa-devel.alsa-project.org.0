Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BE49D906B
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Nov 2024 03:36:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2572E64;
	Tue, 26 Nov 2024 03:36:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2572E64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1732588606;
	bh=fD7oxuqcr/IbuQwqpudBCn1RXp+6Ep7IWXZGYUY9+Gs=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZGIREJ8KvjZ05GkMA+X1KeFC3D7OlZ93a+D5mpbUuHBi+7zSbF4n0ITQmlxtdr2ov
	 CieFRRLEDRMcxUYMms3NAUcLuZ3R0HAH0x7wbCZEh0dtzYn2NlgG0pmbpaKUCEl7/h
	 ZpE8X+i49bjf4Q3onDjwd4XlgBzNoymfDlhD2zJs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9168EF805C6; Tue, 26 Nov 2024 03:36:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ECBB2F805BF;
	Tue, 26 Nov 2024 03:36:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C42C0F80496; Tue, 26 Nov 2024 03:36:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4F85BF800F0
	for <alsa-devel@alsa-project.org>; Tue, 26 Nov 2024 03:35:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F85BF800F0
Authentication-Results: alsa1.perex.cz;
	dkim=temperror header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=a9AnfCX4
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 4AQ2ZmwwE301071,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1732588548; bh=fD7oxuqcr/IbuQwqpudBCn1RXp+6Ep7IWXZGYUY9+Gs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version;
	b=a9AnfCX4hs+ytoF1IevjDCUHrcJup2Jr8GmzKDNq9hQ95o3iDRegXAhTnAhW1Vxul
	 spccjA4+Kc3vm5pA5QSwrAa42itU8i9KGTbEsojGaaXcZttxb4aJTnoujgqOrSXhPu
	 irkjeQl3PAp/fn/rIOov5DRhlPsTKRD9/DQIiX2G968sFmyNl1pJ8OmEUwD/VtngyR
	 T/bh7kpivgXfhznEh504d6sQd8HxWPaJKUnJnMHg4Z2zkOjIYjixJl9BUhbxHcqwAZ
	 JpdzJoKv/J3KKW36XQbtaGGWvUSa0cCTg6xeit6XsPfzn1qoNBzmb2VX2BIOgq2Tgh
	 onemK1SFQdIWA==
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 4AQ2ZmwwE301071
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 26 Nov 2024 10:35:48 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 26 Nov 2024 10:35:48 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Nov 2024 10:35:48 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::147b:e1e8:e867:41c2]) by
 RTEXMBS01.realtek.com.tw ([fe80::147b:e1e8:e867:41c2%7]) with mapi id
 15.01.2507.035; Tue, 26 Nov 2024 10:35:48 +0800
From: Kailang <kailang@realtek.com>
To: Takashi Iwai <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: RE: Set pcbeep to default value
Thread-Topic: Set pcbeep to default value
Thread-Index: Ads8sBHNzM+TirlYQ/mnHXgYWQoEn///nRkA//tCZACACctvgP/+tDQA
Date: Tue, 26 Nov 2024 02:35:48 +0000
Message-ID: <d2227d6f7c774a6da13018b98fb537ca@realtek.com>
References: <a76a10fc88e740f2b157375d44f167c7@realtek.com>
	<87r0731uk1.wl-tiwai@suse.de>	<cb9caa0e01f34e3b881bad24701c741f@realtek.com>
 <87v7wbxti2.wl-tiwai@suse.de>
In-Reply-To: <87v7wbxti2.wl-tiwai@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
x-originating-ip: [172.21.6.42]
Content-Type: multipart/mixed;
	boundary="_002_d2227d6f7c774a6da13018b98fb537carealtekcom_"
MIME-Version: 1.0
Message-ID-Hash: 2MRWZJBOHWHH65Q4Z3PUHFQ3EPMWP6J4
X-Message-ID-Hash: 2MRWZJBOHWHH65Q4Z3PUHFQ3EPMWP6J4
X-MailFrom: kailang@realtek.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2MRWZJBOHWHH65Q4Z3PUHFQ3EPMWP6J4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--_002_d2227d6f7c774a6da13018b98fb537carealtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

OK.

> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Monday, November 25, 2024 10:45 PM
> To: Kailang <kailang@realtek.com>
> Cc: Takashi Iwai <tiwai@suse.de>
> Subject: Re: Set pcbeep to default value
>=20
>=20
> External mail.
>=20
>=20
>=20
> On Mon, 25 Nov 2024 03:00:26 +0100,
> Kailang wrote:
> >
> >
> >
> > > -----Original Message-----
> > > From: Takashi Iwai <tiwai@suse.de>
> > > Sent: Friday, November 22, 2024 5:34 PM
> > > To: Kailang <kailang@realtek.com>
> > > Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
> > > Subject: Re: Set pcbeep to default value
> > >
> > >
> > > External mail.
> > >
> > >
> > >
> > > On Fri, 22 Nov 2024 08:29:56 +0100,
> > > Kailang wrote:
> > > >
> > > > Hi Takashi,
> > > >
> > > > Attach patch will set pcbeep to default value for ALC274.
> > >
> > > Could you resubmit with your Signed-off-by tag?
> >
> > Sorry! Attach again.
>=20
> You seem to have dropped Cc to alsa-devel ML.
> Also, nowadays we use linux-sound@vger.kernel.org for the main ML for ker=
nel
> patches.  Care to resubmit to there?
>=20
>=20
> thanks,
>=20
> Takashi

--_002_d2227d6f7c774a6da13018b98fb537carealtekcom_
Content-Type: application/octet-stream;
	name="0000-dell-alc274-beep-default.patch"
Content-Description: 0000-dell-alc274-beep-default.patch
Content-Disposition: attachment;
	filename="0000-dell-alc274-beep-default.patch"; size=812;
	creation-date="Thu, 21 Nov 2024 08:17:27 GMT";
	modification-date="Mon, 25 Nov 2024 01:57:21 GMT"
Content-Transfer-Encoding: base64

RnJvbSA1OTA5ODc4MzZmNWY4ZTU2NWU3ZmVkMzcyNTYxODVmNTUwNGQ2ZGE2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFRodSwgMjEgTm92IDIwMjQgMTY6MTY6MjYgKzA4MDAKU3ViamVjdDogW1BBVENIXSBTZXQg
UENCZWVwIHRvIGRlZmF1bHQgdmFsdWUgZm9yIEFMQzI3NAoKQklPUyBFbmFibGUgUEMgYmVlcCBw
YXRoIGNhdXNlIHBvcCBub2lzZSB2aWEgc3BlYWtlciBkdXJpbmcgYm9vdCB0aW1lLgpTZXQgdG8g
ZGVmYXVsdCB2YWx1ZSBmcm9tIGRyaXZlciB3aWxsIHNvbHZlIHRoZSBpc3N1ZS4KClNpZ25lZC1v
ZmYtYnk6IEthaWxhbmcgWWFuZyA8a2FpbGFuZ0ByZWFsdGVrLmNvbT4KZGlmZiAtLWdpdCBhL3Nv
dW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jIGIvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVr
LmMKaW5kZXggNTZhMzYyMmNhMmMxLi42NzAzNmZlNmM2Y2MgMTAwNjQ0Ci0tLSBhL3NvdW5kL3Bj
aS9oZGEvcGF0Y2hfcmVhbHRlay5jCisrKyBiL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5j
CkBAIC00NzMsNiArNDczLDggQEAgc3RhdGljIHZvaWQgYWxjX2ZpbGxfZWFwZF9jb2VmKHN0cnVj
dCBoZGFfY29kZWMgKmNvZGVjKQogCQlicmVhazsKIAljYXNlIDB4MTBlYzAyMzQ6CiAJY2FzZSAw
eDEwZWMwMjc0OgorCQlhbGNfd3JpdGVfY29lZl9pZHgoY29kZWMsIDB4NmUsIDB4MGMyNSk7CisJ
CWZhbGx0aHJvdWdoOwogCWNhc2UgMHgxMGVjMDI5NDoKIAljYXNlIDB4MTBlYzA3MDA6CiAJY2Fz
ZSAweDEwZWMwNzAxOgo=

--_002_d2227d6f7c774a6da13018b98fb537carealtekcom_--
