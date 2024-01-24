Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B29FF83A220
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 07:36:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1818E3E8;
	Wed, 24 Jan 2024 07:36:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1818E3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706078174;
	bh=aED3lyIuDW38HNHoqQIsEqeBZJhGIuXIk8bK/Xd3uMw=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ElwV4wtiUGqRpY9AsHqPmUsfWRaze3Kj6nxpXMPAJtyPQPQ2FlhPk8REMhVfEKctI
	 4NrKoEf0GfbHSWKJ5B+BbAHpoiYePy5oLKudl5QSF7S8MpaXgfDadFEHEi2i/eUWAR
	 Y4auhjuNvMlVo0cfMOewK0BTGPsmWtYkI0n7cWjc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF982F80571; Wed, 24 Jan 2024 07:35:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 809DEF8057E;
	Wed, 24 Jan 2024 07:35:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF9AEF8028D; Wed, 24 Jan 2024 07:35:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2F619F8022B
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 07:35:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F619F8022B
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 40O6ZBiE4799581,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 40O6ZBiE4799581
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Jan 2024 14:35:11 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.17; Wed, 24 Jan 2024 14:35:11 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Jan 2024 14:35:11 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::48bb:4f38:369c:d153]) by
 RTEXMBS01.realtek.com.tw ([fe80::48bb:4f38:369c:d153%9]) with mapi id
 15.01.2507.035; Wed, 24 Jan 2024 14:35:11 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
Subject: Speaker can't mute when HP was plugged
Thread-Topic: Speaker can't mute when HP was plugged
Thread-Index: AdpOjvCUA+ACeherTNigndgskTRV1g==
Date: Wed, 24 Jan 2024 06:35:11 +0000
Message-ID: <38b82976a875451d833d514cee34ff6a@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
x-originating-ip: [172.22.102.106]
x-kse-serverinfo: RTEXMBS01.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: multipart/mixed;
	boundary="_002_38b82976a875451d833d514cee34ff6arealtekcom_"
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: A3HO27V3VF2QVIXVOKFE6M6ND6VZG5QC
X-Message-ID-Hash: A3HO27V3VF2QVIXVOKFE6M6ND6VZG5QC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A3HO27V3VF2QVIXVOKFE6M6ND6VZG5QC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--_002_38b82976a875451d833d514cee34ff6arealtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Speaker can't mute when HP was plugged for Dell platform.
I did disable speaker pass through and add verb to speaker pin.

Many Thinks.

BR,
Kailang

--_002_38b82976a875451d833d514cee34ff6arealtekcom_
Content-Type: application/octet-stream;
	name="0000-alc289-dell-0x0c0d-addverb.patch"
Content-Description: 0000-alc289-dell-0x0c0d-addverb.patch
Content-Disposition: attachment;
	filename="0000-alc289-dell-0x0c0d-addverb.patch"; size=1925;
	creation-date="Tue, 23 Jan 2024 09:15:44 GMT";
	modification-date="Wed, 24 Jan 2024 06:30:03 GMT"
Content-Transfer-Encoding: base64

RnJvbSBlNzA3ZGQ3NjM5MGNmZGM4YjhjNjU2YjliOGI4ZWEzODYzZWQ1YzcyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFdlZCwgMjQgSmFuIDIwMjQgMTQ6MjE6NDcgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIEFkZCBzcGVha2VyIHBpbiB2ZXJidGFibGUgZm9yIERlbGwgZHVhbCBz
cGVha2VyIHBsYXRmb3JtCgpTU0lEIDB4MGMwZCBwbGF0Zm9ybS4gSXQgY2FuJ3QgbXV0ZSBzcGVh
a2VyIHdoZW4gSFAgcGx1Z2dlZC4KVGhpcyBwYXRjaCBhZGQgcXVpcmsgdG8gZmlsbCBzcGVha2Vy
IHBpbiB2ZXJidGFibGUuCkFuZCBkaXNhYmxlIHNwZWFrZXIgcGFzc3Rocm91Z2guCgpTaWduZWQt
b2ZmLWJ5OiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CgpkaWZmIC0tZ2l0IGEv
c291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0
ZWsuYwppbmRleCBmNmYxNjYyMmY5Y2MuLjY3YzU4ZGQwNDZmNyAxMDA2NDQKLS0tIGEvc291bmQv
cGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKKysrIGIvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVr
LmMKQEAgLTQzOSw2ICs0MzksMTAgQEAgc3RhdGljIHZvaWQgYWxjX2ZpbGxfZWFwZF9jb2VmKHN0
cnVjdCBoZGFfY29kZWMgKmNvZGVjKQogCQlhbGNfdXBkYXRlX2NvZWZfaWR4KGNvZGVjLCAweDY3
LCAweGYwMDAsIDB4MzAwMCk7CiAJCWZhbGx0aHJvdWdoOwogCWNhc2UgMHgxMGVjMDIxNToKKwlj
YXNlIDB4MTBlYzAyODU6CisJY2FzZSAweDEwZWMwMjg5OgorCQlhbGNfdXBkYXRlX2NvZWZfaWR4
KGNvZGVjLCAweDM2LCAxPDwxMywgMCk7CisJCWZhbGx0aHJvdWdoOwogCWNhc2UgMHgxMGVjMDIz
MDoKIAljYXNlIDB4MTBlYzAyMzM6CiAJY2FzZSAweDEwZWMwMjM1OgpAQCAtNDUyLDkgKzQ1Niw3
IEBAIHN0YXRpYyB2b2lkIGFsY19maWxsX2VhcGRfY29lZihzdHJ1Y3QgaGRhX2NvZGVjICpjb2Rl
YykKIAljYXNlIDB4MTBlYzAyODM6CiAJY2FzZSAweDEwZWMwMjg2OgogCWNhc2UgMHgxMGVjMDI4
ODoKLQljYXNlIDB4MTBlYzAyODU6CiAJY2FzZSAweDEwZWMwMjk4OgotCWNhc2UgMHgxMGVjMDI4
OToKIAljYXNlIDB4MTBlYzAzMDA6CiAJCWFsY191cGRhdGVfY29lZl9pZHgoY29kZWMsIDB4MTAs
IDE8PDksIDApOwogCQlicmVhazsKQEAgLTk3MzIsNiArOTczNCw3IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3Qgc25kX3BjaV9xdWlyayBhbGMyNjlfZml4dXBfdGJsW10gPSB7CiAJU05EX1BDSV9RVUlS
SygweDEwMjgsIDB4MGI3MSwgIkRlbGwgSW5zcGlyb24gMTYgUGx1cyA3NjIwIiwgQUxDMjk1X0ZJ
WFVQX0RFTExfSU5TUElST05fVE9QX1NQRUFLRVJTKSwKIAlTTkRfUENJX1FVSVJLKDB4MTAyOCwg
MHgwYmViLCAiRGVsbCBYUFMgMTUgOTUzMCAoMjAyMykiLCBBTEMyODlfRklYVVBfREVMTF9DUzM1
TDQxX1NQSV8yKSwKIAlTTkRfUENJX1FVSVJLKDB4MTAyOCwgMHgwYzAzLCAiRGVsbCBQcmVjaXNp
b24gNTM0MCIsIEFMQzI2OV9GSVhVUF9ERUxMNF9NSUNfTk9fUFJFU0VOQ0UpLAorCVNORF9QQ0lf
UVVJUksoMHgxMDI4LCAweDBjMGQsICJEZWxsIE9hc2lzIiwgQUxDMjg5X0ZJWFVQX1JUS19BTVBf
RFVBTF9TUEspLAogCVNORF9QQ0lfUVVJUksoMHgxMDI4LCAweDBjMTksICJEZWxsIFByZWNpc2lv
biAzMzQwIiwgQUxDMjM2X0ZJWFVQX0RFTExfRFVBTF9DT0RFQ1MpLAogCVNORF9QQ0lfUVVJUkso
MHgxMDI4LCAweDBjMWEsICJEZWxsIFByZWNpc2lvbiAzMzQwIiwgQUxDMjM2X0ZJWFVQX0RFTExf
RFVBTF9DT0RFQ1MpLAogCVNORF9QQ0lfUVVJUksoMHgxMDI4LCAweDBjMWIsICJEZWxsIFByZWNp
c2lvbiAzNDQwIiwgQUxDMjM2X0ZJWFVQX0RFTExfRFVBTF9DT0RFQ1MpLAo=

--_002_38b82976a875451d833d514cee34ff6arealtekcom_--
