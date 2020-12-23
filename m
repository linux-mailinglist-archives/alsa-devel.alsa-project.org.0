Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3E62E196E
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Dec 2020 08:45:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CB6117D8;
	Wed, 23 Dec 2020 08:44:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CB6117D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608709545;
	bh=AbKLbHkbOufoZoynXBoGQ03ONqmeruzSaJECZydgUf8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=az4zunDvBV2EDgMA+z0V+kPjbDw7qMKLWHJuDlRcdlpkreUbXmHVab+/R58c/bt4n
	 Bg7dtaHE/zmyjow9x379SeYaqGuuXF3ZEEh8TcfKRM4Q/AwEKINh9O6PnD/7HQFd5F
	 pTq7LgnZOvfnwm4Gim+iNnAUFGcDd1FlhW9mK/QE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5C9AF801EB;
	Wed, 23 Dec 2020 08:44:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C4DDF801D5; Wed, 23 Dec 2020 08:44:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=PRX_APP_ATTACH, SPF_HELO_NONE, 
 SPF_PASS autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8AF74F80116
 for <alsa-devel@alsa-project.org>; Wed, 23 Dec 2020 08:43:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AF74F80116
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 0BN7hu3kB008275,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmbs01.realtek.com.tw[172.21.6.94])
 by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 0BN7hu3kB008275
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 23 Dec 2020 15:43:56 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 23 Dec 2020 15:43:56 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::5d07:e256:a2a2:81ee]) by
 RTEXMBS01.realtek.com.tw ([fe80::5d07:e256:a2a2:81ee%5]) with mapi id
 15.01.2106.006; Wed, 23 Dec 2020 15:43:56 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
Subject: Dell 0x0a58 change name
Thread-Topic: Dell 0x0a58 change name
Thread-Index: AdbY/yF2CXJ2T0xXQmuD7EGzprsE1w==
Date: Wed, 23 Dec 2020 07:43:55 +0000
Message-ID: <efe7c196158241aa817229df7835d645@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.96]
Content-Type: multipart/mixed;
 boundary="_002_efe7c196158241aa817229df7835d645realtekcom_"
MIME-Version: 1.0
Cc: " \(alsa-devel@alsa-project.org\)" <alsa-devel@alsa-project.org>
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

--_002_efe7c196158241aa817229df7835d645realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Dell want change platform name to 'Dell' only.

BR,
Kailang

--_002_efe7c196158241aa817229df7835d645realtekcom_
Content-Type: application/octet-stream; name="0001-dell-0x0a58.patch"
Content-Description: 0001-dell-0x0a58.patch
Content-Disposition: attachment; filename="0001-dell-0x0a58.patch"; size=1201;
	creation-date="Wed, 23 Dec 2020 07:36:36 GMT";
	modification-date="Wed, 23 Dec 2020 07:41:47 GMT"
Content-Transfer-Encoding: base64

RnJvbSA0NDZhZjI5YjA4NjZlNmY0OTNkOGVjMGFkYTQ0MWZhYmJjZWMwMWMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBrYWlsYW5nIDxrYWlsYW5nQHJlYWx0ZWsuY29tPgpEYXRlOiBX
ZWQsIDIzIERlYyAyMDIwIDE1OjM0OjU3ICswODAwClN1YmplY3Q6IFtQQVRDSF0gQUxTQTogaGRh
L3JlYWx0ZWsgLSBNb2RpZnkgRGVsbCBwbGF0Zm9ybSBuYW1lCgpEZWxsIHBsYXRmb3JtIFNTSUQ6
MHgwYTU4IGNoYW5nZSBwbGF0Zm9ybSBuYW1lLgoKU2lnbmVkLW9mZi1ieTogS2FpbGFuZyBZYW5n
IDxrYWlsYW5nQHJlYWx0ZWsuY29tPgpkaWZmIC0tZ2l0IGEvc291bmQvcGNpL2hkYS9wYXRjaF9y
ZWFsdGVrLmMgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwppbmRleCBkZGU1YmEyMDk1
NDEuLjAwNmFmNjU0MWRhZCAxMDA2NDQKLS0tIGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVr
LmMKKysrIGIvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKQEAgLTc4ODUsNyArNzg4NSw3
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3BjaV9xdWlyayBhbGMyNjlfZml4dXBfdGJsW10g
PSB7CiAJU05EX1BDSV9RVUlSSygweDEwMjgsIDB4MDliZiwgIkRlbGwgUHJlY2lzaW9uIiwgQUxD
MjMzX0ZJWFVQX0FTVVNfTUlDX05PX1BSRVNFTkNFKSwKIAlTTkRfUENJX1FVSVJLKDB4MTAyOCwg
MHgwYTJlLCAiRGVsbCIsIEFMQzIzNl9GSVhVUF9ERUxMX0FJT19IRUFEU0VUX01JQyksCiAJU05E
X1BDSV9RVUlSSygweDEwMjgsIDB4MGEzMCwgIkRlbGwiLCBBTEMyMzZfRklYVVBfREVMTF9BSU9f
SEVBRFNFVF9NSUMpLAotCVNORF9QQ0lfUVVJUksoMHgxMDI4LCAweDBhNTgsICJEZWxsIFByZWNp
c2lvbiAzNjUwIFRvd2VyIiwgQUxDMjU1X0ZJWFVQX0RFTExfSEVBRFNFVF9NSUMpLAorCVNORF9Q
Q0lfUVVJUksoMHgxMDI4LCAweDBhNTgsICJEZWxsIiwgQUxDMjU1X0ZJWFVQX0RFTExfSEVBRFNF
VF9NSUMpLAogCVNORF9QQ0lfUVVJUksoMHgxMDI4LCAweDE2NGEsICJEZWxsIiwgQUxDMjkzX0ZJ
WFVQX0RFTEwxX01JQ19OT19QUkVTRU5DRSksCiAJU05EX1BDSV9RVUlSSygweDEwMjgsIDB4MTY0
YiwgIkRlbGwiLCBBTEMyOTNfRklYVVBfREVMTDFfTUlDX05PX1BSRVNFTkNFKSwKIAlTTkRfUENJ
X1FVSVJLKDB4MTAzYywgMHgxNTg2LCAiSFAiLCBBTEMyNjlfRklYVVBfSFBfTVVURV9MRURfTUlD
MiksCg==

--_002_efe7c196158241aa817229df7835d645realtekcom_--
