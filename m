Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEC19AFB4E
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2024 09:41:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0D8386E;
	Fri, 25 Oct 2024 09:40:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0D8386E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729842061;
	bh=8v2fCxABYiuRzBSk7VpSit0opiveUCgKpDNkHqdNy7E=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=J8vLldNZ6YT7Dk0LsBskCopywrEnW09sl2JBTRqoJuPUgJHadx3O4Haq7AGOpprWx
	 7L7IV1WFNWYRdaJouBlLg04YdRUukDZRNo0f2Bhi8ZjhvGkhxuYg9TL+0VJ9s+QuV9
	 5nRsIlF3FthrQhZ2f8a2yXqjRTJ7yJYnnbRpNbTo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C4B7F805B6; Fri, 25 Oct 2024 09:40:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1B7EF805B0;
	Fri, 25 Oct 2024 09:40:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BEAD0F8016C; Fri, 25 Oct 2024 09:40:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9F625F8014C
	for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2024 09:40:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F625F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=temperror header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=aUDswyCH
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 49P7eB4a9262613,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1729842011; bh=8v2fCxABYiuRzBSk7VpSit0opiveUCgKpDNkHqdNy7E=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version;
	b=aUDswyCHcJTyahopYB4ioK5KaGoDKEleCW8BZvTcsPXe2f28gQ18+s+SsvUVYbCQY
	 AXOTSFwf0IgTuEwv/Y2xmHqGvYpAt+bbKdC1/5HJsDkIQTTF0SBGQ+xpQXOASwChFp
	 YOlyd1h96omcPWoOZSDMDdDruQXStytTKjr0/HaM1dM+FgKvmeHZcOGquVu1e4heit
	 cRobd4yLSOi6KkPRaKAXCB7nSy/iomUYoKe89cz8ozN8tYQt21ot3PUsCmc9EN+nv0
	 6/Ja4Zx2rfCcgYmoEEUwkC/vxVs+B20E1HEfLd6sIU0KyIsG/W2zSadAaxEUIqMrR5
	 3JqdMj0TIvTrw==
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 49P7eB4a9262613
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Oct 2024 15:40:11 +0800
Received: from RTEXMBS05.realtek.com.tw (172.21.6.98) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 25 Oct 2024 15:40:11 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS05.realtek.com.tw (172.21.6.98) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 25 Oct 2024 15:40:10 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::147b:e1e8:e867:41c2]) by
 RTEXMBS01.realtek.com.tw ([fe80::147b:e1e8:e867:41c2%7]) with mapi id
 15.01.2507.035; Fri, 25 Oct 2024 15:40:10 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
Subject: Limit internal Mic boost on Dell platform
Thread-Topic: Limit internal Mic boost on Dell platform
Thread-Index: AdsmsPt9iQQgIC6BQ16vfM294wlMVg==
Date: Fri, 25 Oct 2024 07:40:10 +0000
Message-ID: <561fc5f5eff04b6cbd79ed173cd1c1db@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
x-originating-ip: [172.21.6.42]
Content-Type: multipart/mixed;
	boundary="_002_561fc5f5eff04b6cbd79ed173cd1c1dbrealtekcom_"
MIME-Version: 1.0
Message-ID-Hash: YGIYDVUWTPFBWJ6FXAS3IVAPYOVEFSZX
X-Message-ID-Hash: YGIYDVUWTPFBWJ6FXAS3IVAPYOVEFSZX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YGIYDVUWTPFBWJ6FXAS3IVAPYOVEFSZX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--_002_561fc5f5eff04b6cbd79ed173cd1c1dbrealtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Attach patch will limit internal Mic boost on all Dell platform.

BR,
Kailang

--_002_561fc5f5eff04b6cbd79ed173cd1c1dbrealtekcom_
Content-Type: application/octet-stream;
	name="0000-dell-limit-intMic-boost.patch"
Content-Description: 0000-dell-limit-intMic-boost.patch
Content-Disposition: attachment;
	filename="0000-dell-limit-intMic-boost.patch"; size=3668;
	creation-date="Fri, 18 Oct 2024 05:55:40 GMT";
	modification-date="Fri, 25 Oct 2024 07:37:14 GMT"
Content-Transfer-Encoding: base64

RnJvbSAxMmQ1OTlhMWJlZjFmOWM1ZDVjMTJhNmIyNTQwZTI3MDJlMDczYjIwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IEZyaSwgMTggT2N0IDIwMjQgMTM6NTM6MjQgKzA4MDAKU3ViamVjdDogW1BBVENIXSBMaW1p
dCBpbnRlcm5hbCBNaWMgYm9vc3Qgb24gRGVsbCBwbGF0Zm9ybQoKRGVsbCB3YW50IHRvIGxpbWl0
IGludGVybmFsIE1pYyBib29zdCBvbiBhbGwgRGVsbCBwbGF0Zm9ybS4KClNpZ25lZC1vZmYtYnk6
IEthaWxhbmcgWWFuZyA8a2FpbGFuZ0ByZWFsdGVrLmNvbT4KZGlmZiAtLWdpdCBhL3NvdW5kL3Bj
aS9oZGEvcGF0Y2hfcmVhbHRlay5jIGIvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKaW5k
ZXggZDYyY2I0YWI4YWUwLi5kN2NjNWJkMTRhMWMgMTAwNjQ0Ci0tLSBhL3NvdW5kL3BjaS9oZGEv
cGF0Y2hfcmVhbHRlay5jCisrKyBiL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCkBAIC03
NTI1LDYgKzc1MjUsNyBAQCBlbnVtIHsKIAlBTEMyODZfRklYVVBfU09OWV9NSUNfTk9fUFJFU0VO
Q0UsCiAJQUxDMjY5X0ZJWFVQX1BJTkNGR19OT19IUF9UT19MSU5FT1VULAogCUFMQzI2OV9GSVhV
UF9ERUxMMV9NSUNfTk9fUFJFU0VOQ0UsCisJQUxDMjY5X0ZJWFVQX0RFTEwxX0xJTUlUX0lOVF9N
SUNfQk9PU1QsCiAJQUxDMjY5X0ZJWFVQX0RFTEwyX01JQ19OT19QUkVTRU5DRSwKIAlBTEMyNjlf
RklYVVBfREVMTDNfTUlDX05PX1BSRVNFTkNFLAogCUFMQzI2OV9GSVhVUF9ERUxMNF9NSUNfTk9f
UFJFU0VOQ0UsCkBAIC03NTU5LDYgKzc1NjAsNyBAQCBlbnVtIHsKIAlBTEMyNTVfRklYVVBfQUNF
Ul9NSUNfTk9fUFJFU0VOQ0UsCiAJQUxDMjU1X0ZJWFVQX0FTVVNfTUlDX05PX1BSRVNFTkNFLAog
CUFMQzI1NV9GSVhVUF9ERUxMMV9NSUNfTk9fUFJFU0VOQ0UsCisJQUxDMjU1X0ZJWFVQX0RFTEwx
X0xJTUlUX0lOVF9NSUNfQk9PU1QsCiAJQUxDMjU1X0ZJWFVQX0RFTEwyX01JQ19OT19QUkVTRU5D
RSwKIAlBTEMyNTVfRklYVVBfSEVBRFNFVF9NT0RFLAogCUFMQzI1NV9GSVhVUF9IRUFEU0VUX01P
REVfTk9fSFBfTUlDLApAQCAtODA0Nyw2ICs4MDQ5LDEyIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
aGRhX2ZpeHVwIGFsYzI2OV9maXh1cHNbXSA9IHsKIAkJLmNoYWluZWQgPSB0cnVlLAogCQkuY2hh
aW5faWQgPSBBTEMyNjlfRklYVVBfSEVBRFNFVF9NT0RFCiAJfSwKKwlbQUxDMjY5X0ZJWFVQX0RF
TEwxX0xJTUlUX0lOVF9NSUNfQk9PU1RdID0geworCQkudHlwZSA9IEhEQV9GSVhVUF9GVU5DLAor
CQkudi5mdW5jID0gYWxjMjY5X2ZpeHVwX2xpbWl0X2ludF9taWNfYm9vc3QsCisJCS5jaGFpbmVk
ID0gdHJ1ZSwKKwkJLmNoYWluX2lkID0gQUxDMjY5X0ZJWFVQX0RFTEwxX01JQ19OT19QUkVTRU5D
RQorCX0sCiAJW0FMQzI2OV9GSVhVUF9ERUxMMl9NSUNfTk9fUFJFU0VOQ0VdID0gewogCQkudHlw
ZSA9IEhEQV9GSVhVUF9QSU5TLAogCQkudi5waW5zID0gKGNvbnN0IHN0cnVjdCBoZGFfcGludGJs
W10pIHsKQEAgLTgzMjcsNiArODMzNSwxMiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGhkYV9maXh1
cCBhbGMyNjlfZml4dXBzW10gPSB7CiAJCS5jaGFpbmVkID0gdHJ1ZSwKIAkJLmNoYWluX2lkID0g
QUxDMjU1X0ZJWFVQX0hFQURTRVRfTU9ERQogCX0sCisJW0FMQzI1NV9GSVhVUF9ERUxMMV9MSU1J
VF9JTlRfTUlDX0JPT1NUXSA9IHsKKwkJLnR5cGUgPSBIREFfRklYVVBfRlVOQywKKwkJLnYuZnVu
YyA9IGFsYzI2OV9maXh1cF9saW1pdF9pbnRfbWljX2Jvb3N0LAorCQkuY2hhaW5lZCA9IHRydWUs
CisJCS5jaGFpbl9pZCA9IEFMQzI1NV9GSVhVUF9ERUxMMV9NSUNfTk9fUFJFU0VOQ0UKKwl9LAog
CVtBTEMyNTVfRklYVVBfREVMTDJfTUlDX05PX1BSRVNFTkNFXSA9IHsKIAkJLnR5cGUgPSBIREFf
RklYVVBfUElOUywKIAkJLnYucGlucyA9IChjb25zdCBzdHJ1Y3QgaGRhX3BpbnRibFtdKSB7CkBA
IC0xMDk4OCw2ICsxMTAwMiw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaGRhX21vZGVsX2ZpeHVw
IGFsYzI2OV9maXh1cF9tb2RlbHNbXSA9IHsKIAl7LmlkID0gQUxDMjY5X0ZJWFVQX0RFTEwyX01J
Q19OT19QUkVTRU5DRSwgLm5hbWUgPSAiZGVsbC1oZWFkc2V0LWRvY2sifSwKIAl7LmlkID0gQUxD
MjY5X0ZJWFVQX0RFTEwzX01JQ19OT19QUkVTRU5DRSwgLm5hbWUgPSAiZGVsbC1oZWFkc2V0MyJ9
LAogCXsuaWQgPSBBTEMyNjlfRklYVVBfREVMTDRfTUlDX05PX1BSRVNFTkNFLCAubmFtZSA9ICJk
ZWxsLWhlYWRzZXQ0In0sCisJey5pZCA9IEFMQzI2OV9GSVhVUF9ERUxMNF9NSUNfTk9fUFJFU0VO
Q0VfUVVJRVQsIC5uYW1lID0gImRlbGwtaGVhZHNldDQtcXVpZXQifSwKIAl7LmlkID0gQUxDMjgz
X0ZJWFVQX0NIUk9NRV9CT09LLCAubmFtZSA9ICJhbGMyODMtZGFjLXdjYXBzIn0sCiAJey5pZCA9
IEFMQzI4M19GSVhVUF9TRU5TRV9DT01CT19KQUNLLCAubmFtZSA9ICJhbGMyODMtc2Vuc2UtY29t
Ym8ifSwKIAl7LmlkID0gQUxDMjkyX0ZJWFVQX1RQVDQ0MF9ET0NLLCAubmFtZSA9ICJ0cHQ0NDAt
ZG9jayJ9LApAQCAtMTE1NDIsMTYgKzExNTU3LDE2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25k
X2hkYV9waW5fcXVpcmsgYWxjMjY5X2ZhbGxiYWNrX3Bpbl9maXh1cF90YmxbXSA9IHsKIAlTTkRf
SERBX1BJTl9RVUlSSygweDEwZWMwMjg5LCAweDEwMjgsICJEZWxsIiwgQUxDMjY5X0ZJWFVQX0RF
TEw0X01JQ19OT19QUkVTRU5DRSwKIAkJezB4MTksIDB4NDAwMDAwMDB9LAogCQl7MHgxYiwgMHg0
MDAwMDAwMH0pLAotCVNORF9IREFfUElOX1FVSVJLKDB4MTBlYzAyOTUsIDB4MTAyOCwgIkRlbGwi
LCBBTEMyNjlfRklYVVBfREVMTDRfTUlDX05PX1BSRVNFTkNFLAorCVNORF9IREFfUElOX1FVSVJL
KDB4MTBlYzAyOTUsIDB4MTAyOCwgIkRlbGwiLCBBTEMyNjlfRklYVVBfREVMTDRfTUlDX05PX1BS
RVNFTkNFX1FVSUVULAogCQl7MHgxOSwgMHg0MDAwMDAwMH0sCiAJCXsweDFiLCAweDQwMDAwMDAw
fSksCiAJU05EX0hEQV9QSU5fUVVJUksoMHgxMGVjMDI1NiwgMHgxMDI4LCAiRGVsbCIsIEFMQzI1
NV9GSVhVUF9ERUxMMV9NSUNfTk9fUFJFU0VOQ0UsCiAJCXsweDE5LCAweDQwMDAwMDAwfSwKIAkJ
ezB4MWEsIDB4NDAwMDAwMDB9KSwKLQlTTkRfSERBX1BJTl9RVUlSSygweDEwZWMwMjM2LCAweDEw
MjgsICJEZWxsIiwgQUxDMjU1X0ZJWFVQX0RFTEwxX01JQ19OT19QUkVTRU5DRSwKKwlTTkRfSERB
X1BJTl9RVUlSSygweDEwZWMwMjM2LCAweDEwMjgsICJEZWxsIiwgQUxDMjU1X0ZJWFVQX0RFTEwx
X0xJTUlUX0lOVF9NSUNfQk9PU1QsCiAJCXsweDE5LCAweDQwMDAwMDAwfSwKIAkJezB4MWEsIDB4
NDAwMDAwMDB9KSwKLQlTTkRfSERBX1BJTl9RVUlSSygweDEwZWMwMjc0LCAweDEwMjgsICJEZWxs
IiwgQUxDMjc0X0ZJWFVQX0RFTExfQUlPX0xJTkVPVVRfVkVSQiwKKwlTTkRfSERBX1BJTl9RVUlS
SygweDEwZWMwMjc0LCAweDEwMjgsICJEZWxsIiwgQUxDMjY5X0ZJWFVQX0RFTEwxX0xJTUlUX0lO
VF9NSUNfQk9PU1QsCiAJCXsweDE5LCAweDQwMDAwMDAwfSwKIAkJezB4MWEsIDB4NDAwMDAwMDB9
KSwKIAlTTkRfSERBX1BJTl9RVUlSSygweDEwZWMwMjU2LCAweDEwNDMsICJBU1VTIiwgQUxDMlhY
X0ZJWFVQX0hFQURTRVRfTUlDLAo=

--_002_561fc5f5eff04b6cbd79ed173cd1c1dbrealtekcom_--
