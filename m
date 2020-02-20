Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B182716597A
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2020 09:44:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E5C816A9;
	Thu, 20 Feb 2020 09:43:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E5C816A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582188255;
	bh=z69xbvBHw35Y1wwD6qsLxgic7krO2gddmEdeXtzZ0ak=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TvFk8JimkpMcMz/W7qZeUbsZDHXMooHIIcE34IA0JImCte17mESZRQfRLyLlZZJbs
	 HkMbsxZ9h4I7FytAsTun2bL0ouOs1qgphZD8xn1TpLe2hGtICxWTRjxFxwGC4SeTAW
	 5WcaR1gixuuGVPO7VwGaS3ONRw56Zd24J6pJVGMQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40CCFF80148;
	Thu, 20 Feb 2020 09:42:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D996BF80148; Thu, 20 Feb 2020 09:42:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=PRX_APP_ATTACH, SPF_HELO_NONE, 
 SPF_PASS autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 207BDF80101
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 09:42:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 207BDF80101
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID 01K8gMHt017120,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTEXMB06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id 01K8gMHt017120
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Feb 2020 16:42:22 +0800
Received: from RTEXDAG02.realtek.com.tw (172.21.6.101) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 20 Feb 2020 16:42:22 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXDAG02.realtek.com.tw (172.21.6.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 20 Feb 2020 16:42:22 +0800
Received: from RTEXMB01.realtek.com.tw ([fe80::1832:8abc:ec2d:974f]) by
 RTEXMB01.realtek.com.tw ([fe80::1832:8abc:ec2d:974f%6]) with mapi id
 15.01.1779.005; Thu, 20 Feb 2020 16:42:22 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
Subject: Enable Headset Button for ThinkPad X1
Thread-Topic: Enable Headset Button for ThinkPad X1
Thread-Index: AdXnyXI0ZdfTcXeHTu6pMdZldnMHkQ==
Date: Thu, 20 Feb 2020 08:42:21 +0000
Message-ID: <7f0b7128f40f41f6b5582ff610adc33d@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.105.169]
Content-Type: multipart/mixed;
 boundary="_002_7f0b7128f40f41f6b5582ff610adc33drealtekcom_"
MIME-Version: 1.0
Cc: Hui Wang <hui.wang@canonical.com>,
 " \(alsa-devel@alsa-project.org\)" <alsa-devel@alsa-project.org>
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

--_002_7f0b7128f40f41f6b5582ff610adc33drealtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Lenovo ThinkPad X1 want to support Headset Button.
Attach patch will enable it.

BR,
Kailang

--_002_7f0b7128f40f41f6b5582ff610adc33drealtekcom_
Content-Type: application/octet-stream;
	name="0000-thinkpad-hs-btn-support.patch"
Content-Description: 0000-thinkpad-hs-btn-support.patch
Content-Disposition: attachment;
	filename="0000-thinkpad-hs-btn-support.patch"; size=2081;
	creation-date="Wed, 12 Feb 2020 07:33:35 GMT";
	modification-date="Mon, 10 Feb 2020 08:33:56 GMT"
Content-Transfer-Encoding: base64

RnJvbSAyZGZiNzY5ODcyYzY0ZWE1ODlmOTA5NjllZTNiNGJjODAzYmYxZDYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IE1vbiwgMTAgRmViIDIwMjAgMTY6MzA6MjYgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIEFkZCBIZWFkc2V0IEJ1dHRvbiBzdXBwb3J0ZWQgZm9yIFRoaW5rUGFk
CiBYMQoKVGhpbmtQYWQgd2FudCB0byBzdXBwb3J0IEhlYWRzZXQgQnV0dG9uIGNvbnRyb2wuClRo
aXMgcGF0Y2ggd2lsbCBlbmFibGUgaXQuCgpTaWduZWQtb2ZmLWJ5OiBLYWlsYW5nIFlhbmcgPGth
aWxhbmdAcmVhbHRlay5jb20+CgpkaWZmIC0tZ2l0IGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFs
dGVrLmMgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwppbmRleCAzZWU4OGFkZjU3ZTcu
Ljc4MmU4N2ExYmE5NyAxMDA2NDQKLS0tIGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMK
KysrIGIvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKQEAgLTU5MTcsNyArNTkxNyw3IEBA
IGVudW0gewogCUFMQzI4OV9GSVhVUF9EVUFMX1NQSywKIAlBTEMyOTRfRklYVVBfU1BLMl9UT19E
QUMxLAogCUFMQzI5NF9GSVhVUF9BU1VTX0RVQUxfU1BLLAotCisJQUxDMjg1X0ZJWFVQX1RISU5L
UEFEX0hFQURTRVRfSkFDSywKIH07CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaGRhX2ZpeHVwIGFs
YzI2OV9maXh1cHNbXSA9IHsKQEAgLTcwMzcsNyArNzAzNywxMiBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGhkYV9maXh1cCBhbGMyNjlfZml4dXBzW10gPSB7CiAJCS5jaGFpbmVkID0gdHJ1ZSwKIAkJ
LmNoYWluX2lkID0gQUxDMjk0X0ZJWFVQX1NQSzJfVE9fREFDMQogCX0sCi0KKwlbQUxDMjg1X0ZJ
WFVQX1RISU5LUEFEX0hFQURTRVRfSkFDS10gPSB7CisJCS50eXBlID0gSERBX0ZJWFVQX0ZVTkMs
CisJCS52LmZ1bmMgPSBhbGNfZml4dXBfaGVhZHNldF9qYWNrLAorCQkuY2hhaW5lZCA9IHRydWUs
CisJCS5jaGFpbl9pZCA9IEFMQzI4NV9GSVhVUF9TUEVBS0VSMl9UT19EQUMxCisJfSwKIH07CiAK
IHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3BjaV9xdWlyayBhbGMyNjlfZml4dXBfdGJsW10gPSB7
CkBAIC03MjcxLDggKzcyNzYsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9wY2lfcXVpcmsg
YWxjMjY5X2ZpeHVwX3RibFtdID0gewogCVNORF9QQ0lfUVVJUksoMHgxN2FhLCAweDIyNGMsICJU
aGlua3BhZCIsIEFMQzI5OF9GSVhVUF9UUFQ0NzBfRE9DSyksCiAJU05EX1BDSV9RVUlSSygweDE3
YWEsIDB4MjI0ZCwgIlRoaW5rcGFkIiwgQUxDMjk4X0ZJWFVQX1RQVDQ3MF9ET0NLKSwKIAlTTkRf
UENJX1FVSVJLKDB4MTdhYSwgMHgyMjVkLCAiVGhpbmtwYWQgVDQ4MCIsIEFMQzI2OV9GSVhVUF9M
SU1JVF9JTlRfTUlDX0JPT1NUKSwKLQlTTkRfUENJX1FVSVJLKDB4MTdhYSwgMHgyMjkyLCAiVGhp
bmtwYWQgWDEgWW9nYSA3dGgiLCBBTEMyODVfRklYVVBfU1BFQUtFUjJfVE9fREFDMSksCi0JU05E
X1BDSV9RVUlSSygweDE3YWEsIDB4MjI5MywgIlRoaW5rcGFkIFgxIENhcmJvbiA3dGgiLCBBTEMy
ODVfRklYVVBfU1BFQUtFUjJfVE9fREFDMSksCisJU05EX1BDSV9RVUlSSygweDE3YWEsIDB4MjI5
MiwgIlRoaW5rcGFkIFgxIFlvZ2EgN3RoIixBTEMyODVfRklYVVBfVEhJTktQQURfSEVBRFNFVF9K
QUNLKSwKKwlTTkRfUENJX1FVSVJLKDB4MTdhYSwgMHgyMjkzLCAiVGhpbmtwYWQgWDEgQ2FyYm9u
IDd0aCIsIEFMQzI4NV9GSVhVUF9USElOS1BBRF9IRUFEU0VUX0pBQ0spLAogCVNORF9QQ0lfUVVJ
UksoMHgxN2FhLCAweDMwYmIsICJUaGlua0NlbnRyZSBBSU8iLCBBTEMyMzNfRklYVVBfTEVOT1ZP
X0xJTkUyX01JQ19IT1RLRVkpLAogCVNORF9QQ0lfUVVJUksoMHgxN2FhLCAweDMwZTIsICJUaGlu
a0NlbnRyZSBBSU8iLCBBTEMyMzNfRklYVVBfTEVOT1ZPX0xJTkUyX01JQ19IT1RLRVkpLAogCVNO
RF9QQ0lfUVVJUksoMHgxN2FhLCAweDMxMGMsICJUaGlua0NlbnRyZSBTdGF0aW9uIiwgQUxDMjk0
X0ZJWFVQX0xFTk9WT19NSUNfTE9DQVRJT04pLAo=

--_002_7f0b7128f40f41f6b5582ff610adc33drealtekcom_--
