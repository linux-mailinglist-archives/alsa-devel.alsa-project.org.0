Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3C87E79C6
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Nov 2023 08:35:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B8BE827;
	Fri, 10 Nov 2023 08:34:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B8BE827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699601719;
	bh=odm21jGIpShMSnEUp7HcWW6KcAXZJM7Q/C5MUYbstFU=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=VSTQC0GdRnV0kHr2bFP2+B64ek4FV3fkAS2AcNWYpLTHgkF9tVNcqCl9k7szRNDkN
	 OCMBQvk3KLs5bGV3QqhRuFrVpJl2GWga7I2iOnNOgfnrzG0EVDeTJF7PUnPCRWxHuo
	 ARIBrbZu/R8qTSLsubpaBSy3JqgzQ3xTRlkLHnlg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5CC2F80166; Fri, 10 Nov 2023 08:34:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7AB9F80166;
	Fri, 10 Nov 2023 08:34:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90CB3F80169; Fri, 10 Nov 2023 08:33:59 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 90FF4F800ED
	for <alsa-devel@alsa-project.org>; Fri, 10 Nov 2023 08:33:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90FF4F800ED
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 3AA7XgqK62118474,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 3AA7XgqK62118474
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Nov 2023 15:33:42 +0800
Received: from RTEXMBS06.realtek.com.tw (172.21.6.99) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Fri, 10 Nov 2023 15:33:42 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Fri, 10 Nov 2023 15:33:42 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::540c:c8d6:1d0f:ab9f]) by
 RTEXMBS01.realtek.com.tw ([fe80::540c:c8d6:1d0f:ab9f%5]) with mapi id
 15.01.2507.034; Fri, 10 Nov 2023 15:33:42 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
Subject: Add Dell ALC295 to pin fall back table
Thread-Topic: Add Dell ALC295 to pin fall back table
Thread-Index: AdoTp6/Qv2t2gIsQSzm8iJsMKtzVxg==
Date: Fri, 10 Nov 2023 07:33:42 +0000
Message-ID: <7c1998e873834df98d59bd7e0d08c72e@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
x-originating-ip: [172.22.102.106]
x-kse-serverinfo: RTEXMBS06.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: multipart/mixed;
	boundary="_002_7c1998e873834df98d59bd7e0d08c72erealtekcom_"
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: DDX7EIZ2LRDQ7M37SFOI6AZJFE7PP6S3
X-Message-ID-Hash: DDX7EIZ2LRDQ7M37SFOI6AZJFE7PP6S3
X-MailFrom: kailang@realtek.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DDX7EIZ2LRDQ7M37SFOI6AZJFE7PP6S3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--_002_7c1998e873834df98d59bd7e0d08c72erealtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

To add alc295 for pin fall back table.

Remove 5 pin quirks for Dell ALC295.
ALC295 was only support MIC2 for external MIC function.

ALC295 assigned model "ALC269_FIXUP_DELL1_MIC_NO_PRESENCE" for pin fall bac=
k table.
It was assigned wrong model. So, let's remove it.

BR,
Kailang

--_002_7c1998e873834df98d59bd7e0d08c72erealtekcom_
Content-Type: application/octet-stream; name="0000-alc295-fallback.patch"
Content-Description: 0000-alc295-fallback.patch
Content-Disposition: attachment; filename="0000-alc295-fallback.patch";
	size=2195; creation-date="Fri, 10 Nov 2023 07:17:21 GMT";
	modification-date="Fri, 10 Nov 2023 07:33:17 GMT"
Content-Transfer-Encoding: base64

RnJvbSA0ZGIwNzU1MWM3ZThlMGMyMjk3YTk4NGEzZDMyODI1Y2JjNDA1NWIxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IEZyaSwgMTAgTm92IDIwMjMgMTU6MTY6MDYgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIEFkZCBEZWxsIEFMQzI5NSB0byBwaW4gZmFsbCBiYWNrIHRhYmxlCgpB
ZGQgQUxDMjk1IHRvIHBpbiBmYWxsIGJhY2sgdGFibGUuClJlbW92ZSA1IHBpbiBxdWlya3MgZm9y
IERlbGwgQUxDMjk1LgpBTEMyOTUgd2FzIG9ubHkgc3VwcG9ydCBNSUMyIGZvciBleHRlcm5hbCBN
SUMgZnVuY3Rpb24uCkFMQzI5NSBhc3NpZ25lZCBtb2RlbCAiQUxDMjY5X0ZJWFVQX0RFTEwxX01J
Q19OT19QUkVTRU5DRSIgZm9yIHBpbiBmYWxsIGJhY2sgdGFibGUuCkl0IHdhcyBhc3NpZ25lZCB3
cm9uZyBtb2RlbC4gU28sIGxldCdzIHJlbW92ZSBpdC4KClNpZ25lZC1vZmYtYnk6IEthaWxhbmcg
WWFuZyA8a2FpbGFuZ0ByZWFsdGVrLmNvbT4KZGlmZiAtLWdpdCBhL3NvdW5kL3BjaS9oZGEvcGF0
Y2hfcmVhbHRlay5jIGIvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKaW5kZXggMGRmNDRi
MTg3NmYzLi41MWFjZWY1ZmU3NWQgMTAwNjQ0Ci0tLSBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVh
bHRlay5jCisrKyBiL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCkBAIC0xMDgxNSwyMiAr
MTA4MTUsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9oZGFfcGluX3F1aXJrIGFsYzI2OV9w
aW5fZml4dXBfdGJsW10gPSB7CiAJCXsweDEyLCAweDkwYTYwMTMwfSwKIAkJezB4MTcsIDB4OTAx
NzAxMTB9LAogCQl7MHgyMSwgMHgwMzIxMTAyMH0pLAotCVNORF9IREFfUElOX1FVSVJLKDB4MTBl
YzAyOTUsIDB4MTAyOCwgIkRlbGwiLCBBTEMyNjlfRklYVVBfREVMTDRfTUlDX05PX1BSRVNFTkNF
LAotCQl7MHgxNCwgMHg5MDE3MDExMH0sCi0JCXsweDIxLCAweDA0MjExMDIwfSksCi0JU05EX0hE
QV9QSU5fUVVJUksoMHgxMGVjMDI5NSwgMHgxMDI4LCAiRGVsbCIsIEFMQzI2OV9GSVhVUF9ERUxM
NF9NSUNfTk9fUFJFU0VOQ0UsCi0JCXsweDE0LCAweDkwMTcwMTEwfSwKLQkJezB4MjEsIDB4MDQy
MTEwMzB9KSwKLQlTTkRfSERBX1BJTl9RVUlSSygweDEwZWMwMjk1LCAweDEwMjgsICJEZWxsIiwg
QUxDMjY5X0ZJWFVQX0RFTEwxX01JQ19OT19QUkVTRU5DRSwKLQkJQUxDMjk1X1NUQU5EQVJEX1BJ
TlMsCi0JCXsweDE3LCAweDIxMDE0MDIwfSwKLQkJezB4MTgsIDB4MjFhMTkwMzB9KSwKLQlTTkRf
SERBX1BJTl9RVUlSSygweDEwZWMwMjk1LCAweDEwMjgsICJEZWxsIiwgQUxDMjY5X0ZJWFVQX0RF
TEwxX01JQ19OT19QUkVTRU5DRSwKLQkJQUxDMjk1X1NUQU5EQVJEX1BJTlMsCi0JCXsweDE3LCAw
eDIxMDE0MDQwfSwKLQkJezB4MTgsIDB4MjFhMTkwNTB9KSwKLQlTTkRfSERBX1BJTl9RVUlSSygw
eDEwZWMwMjk1LCAweDEwMjgsICJEZWxsIiwgQUxDMjY5X0ZJWFVQX0RFTEwxX01JQ19OT19QUkVT
RU5DRSwKLQkJQUxDMjk1X1NUQU5EQVJEX1BJTlMpLAogCVNORF9IREFfUElOX1FVSVJLKDB4MTBl
YzAyOTgsIDB4MTAyOCwgIkRlbGwiLCBBTEMyOThfRklYVVBfREVMTDFfTUlDX05PX1BSRVNFTkNF
LAogCQlBTEMyOThfU1RBTkRBUkRfUElOUywKIAkJezB4MTcsIDB4OTAxNzAxMTB9KSwKQEAgLTEw
ODc0LDYgKzEwODU4LDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfaGRhX3Bpbl9xdWlyayBh
bGMyNjlfZmFsbGJhY2tfcGluX2ZpeHVwX3RibFtdID0gewogCVNORF9IREFfUElOX1FVSVJLKDB4
MTBlYzAyODksIDB4MTAyOCwgIkRlbGwiLCBBTEMyNjlfRklYVVBfREVMTDRfTUlDX05PX1BSRVNF
TkNFLAogCQl7MHgxOSwgMHg0MDAwMDAwMH0sCiAJCXsweDFiLCAweDQwMDAwMDAwfSksCisJU05E
X0hEQV9QSU5fUVVJUksoMHgxMGVjMDI5NSwgMHgxMDI4LCAiRGVsbCIsIEFMQzI2OV9GSVhVUF9E
RUxMNF9NSUNfTk9fUFJFU0VOQ0UsCisJCXsweDE5LCAweDQwMDAwMDAwfSwKKwkJezB4MWIsIDB4
NDAwMDAwMDB9KSwKIAlTTkRfSERBX1BJTl9RVUlSSygweDEwZWMwMjU2LCAweDEwMjgsICJEZWxs
IiwgQUxDMjU1X0ZJWFVQX0RFTEwxX01JQ19OT19QUkVTRU5DRSwKIAkJezB4MTksIDB4NDAwMDAw
MDB9LAogCQl7MHgxYSwgMHg0MDAwMDAwMH0pLAo=

--_002_7c1998e873834df98d59bd7e0d08c72erealtekcom_--
