Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B1112B251
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Dec 2019 08:18:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F1B0171E;
	Fri, 27 Dec 2019 08:17:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F1B0171E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577431118;
	bh=6JmLB2pscMPBC1wNVkGVShny4Wepp6ZN3by4/eJJXZg=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bad2JM516mfq0SkauGLNNr2umu17htjdiXz/HE62dee/mq5fbP18wrrVCRt1wdZnz
	 xmGGj6NrlWIVeeQE6Q1FlHvJI11vE1J5SRWky+lDxzIpN4K0ZMcSDShESRT5I/+QIE
	 OBqLr3bvo4aS3aMM+HjwC7QWk0Z2s5CQHFn1RujI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFA64F80131;
	Fri, 27 Dec 2019 08:16:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EC3BF80132; Fri, 27 Dec 2019 08:16:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=PRX_APP_ATTACH, SPF_HELO_NONE, 
 SPF_PASS autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9375F800CD
 for <alsa-devel@alsa-project.org>; Fri, 27 Dec 2019 08:16:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9375F800CD
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID xBR7Gi93005029,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTITCAS11.realtek.com.tw[172.21.6.12])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id xBR7Gi93005029
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Dec 2019 15:16:44 +0800
Received: from RTEXMB06.realtek.com.tw (172.21.6.99) by
 RTITCAS11.realtek.com.tw (172.21.6.12) with Microsoft SMTP Server (TLS) id
 14.3.468.0; Fri, 27 Dec 2019 15:16:44 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Fri, 27 Dec 2019 15:16:44 +0800
Received: from RTEXMB01.realtek.com.tw ([fe80::a917:b20f:da75:59e0]) by
 RTEXMB01.realtek.com.tw ([fe80::a917:b20f:da75:59e0%6]) with mapi id
 15.01.1779.005; Fri, 27 Dec 2019 15:16:44 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
Thread-Topic: [DELL] Add Bass Speaker and fixed dac for bass Speaker
Thread-Index: AdW8hXZo4dAF3G9aQLSU2/Y1RlW89A==
Date: Fri, 27 Dec 2019 07:16:43 +0000
Message-ID: <229c7efa2b474a16b7d8a916cd096b68@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.105.211]
Content-Type: multipart/mixed;
 boundary="_002_229c7efa2b474a16b7d8a916cd096b68realtekcom_"
MIME-Version: 1.0
Cc: " \(alsa-devel@alsa-project.org\)" <alsa-devel@alsa-project.org>
Subject: [alsa-devel] [DELL] Add Bass Speaker and fixed dac for bass Speaker
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

--_002_229c7efa2b474a16b7d8a916cd096b68realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Dell has new platform which has dual speaker connecting.
They want dual speaker which use same dac for output.

Many Thanks.

BR,
Kailang

--_002_229c7efa2b474a16b7d8a916cd096b68realtekcom_
Content-Type: application/octet-stream;
	name="0000-dell-alc289-dual-spk.patch"
Content-Description: 0000-dell-alc289-dual-spk.patch
Content-Disposition: attachment; filename="0000-dell-alc289-dual-spk.patch";
	size=2156; creation-date="Thu, 19 Dec 2019 06:18:06 GMT";
	modification-date="Thu, 19 Dec 2019 06:17:34 GMT"
Content-Transfer-Encoding: base64

RnJvbSBkMWEyOTM2NmJiMjBjZmMxNWRmM2ZmOWZkYzM3MTNkNDRmYmQ3YjRmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFRodSwgMTkgRGVjIDIwMTkgMTQ6MTI6MTUgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIEFkZCBCYXNzIFNwZWFrZXIgYW5kIGZpeGVkIGRhYyBmb3IgYmFzcwog
c3BlYWtlcgoKRGVsbCBoYXMgbmV3IHBsYXRmb3JtIHdoaWNoIGhhcyBkdWFsIHNwZWFrZXIgY29u
bmVjdGluZy4KVGhleSB3YW50IGR1YWwgc3BlYWtlciB3aGljaCB1c2Ugc2FtZSBkYWMgZm9yIG91
dHB1dC4KClNpZ25lZC1vZmYtYnk6IEthaWxhbmcgWWFuZyA8a2FpbGFuZ0ByZWFsdGVrLmNvbT4K
CmRpZmYgLS1naXQgYS9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYyBiL3NvdW5kL3BjaS9o
ZGEvcGF0Y2hfcmVhbHRlay5jCmluZGV4IGRiZmFmZWU5NzkzMS4uNzEyNThjMjU2ZGMzIDEwMDY0
NAotLS0gYS9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYworKysgYi9zb3VuZC9wY2kvaGRh
L3BhdGNoX3JlYWx0ZWsuYwpAQCAtNTkwNyw2ICs1OTA3LDggQEAgZW51bSB7CiAJQUxDMjk0X0ZJ
WFVQX0FTVVNfSU5UU1BLX0hFQURTRVRfTUlDLAogCUFMQzI1Nl9GSVhVUF9NRURJT05fSEVBRFNF
VF9OT19QUkVTRU5DRSwKIAlBTEMyOTRfRklYVVBfQVNVU19JTlRTUEtfR1BJTywKKwlBTEMyODlf
RklYVVBfREVMTF9TUEsyLAorCUFMQzI4OV9GSVhVUF9EVUFMX1NQSywKIH07CiAKIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgaGRhX2ZpeHVwIGFsYzI2OV9maXh1cHNbXSA9IHsKQEAgLTcwMDgsNiArNzAx
MCwyMSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGhkYV9maXh1cCBhbGMyNjlfZml4dXBzW10gPSB7
CiAJCS5jaGFpbmVkID0gdHJ1ZSwKIAkJLmNoYWluX2lkID0gQUxDMjk0X0ZJWFVQX0FTVVNfSU5U
U1BLX0hFQURTRVRfTUlDCiAJfSwKKwlbQUxDMjg5X0ZJWFVQX0RFTExfU1BLMl0gPSB7CisJCS50
eXBlID0gSERBX0ZJWFVQX1BJTlMsCisJCS52LnBpbnMgPSAoY29uc3Qgc3RydWN0IGhkYV9waW50
YmxbXSkgeworCQkJeyAweDE3LCAweDkwMTcwMTMwIH0sIC8qIGJhc3Mgc3BrICovCisJCQl7IH0K
KwkJfSwKKwkJLmNoYWluZWQgPSB0cnVlLAorCQkuY2hhaW5faWQgPSBBTEMyNjlfRklYVVBfREVM
TDRfTUlDX05PX1BSRVNFTkNFCisJfSwKKwlbQUxDMjg5X0ZJWFVQX0RVQUxfU1BLXSA9IHsKKwkJ
LnR5cGUgPSBIREFfRklYVVBfRlVOQywKKwkJLnYuZnVuYyA9IGFsYzI4NV9maXh1cF9zcGVha2Vy
Ml90b19kYWMxLAorCQkuY2hhaW5lZCA9IHRydWUsCisJCS5jaGFpbl9pZCA9IEFMQzI4OV9GSVhV
UF9ERUxMX1NQSzIKKwl9LAogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfcGNpX3F1aXJr
IGFsYzI2OV9maXh1cF90YmxbXSA9IHsKQEAgLTcwODAsNiArNzA5Nyw4IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3Qgc25kX3BjaV9xdWlyayBhbGMyNjlfZml4dXBfdGJsW10gPSB7CiAJU05EX1BDSV9R
VUlSSygweDEwMjgsIDB4MDhhZCwgIkRlbGwgV1lTRSBBSU8iLCBBTEMyMjVfRklYVVBfREVMTF9X
WVNFX0FJT19NSUNfTk9fUFJFU0VOQ0UpLAogCVNORF9QQ0lfUVVJUksoMHgxMDI4LCAweDA4YWUs
ICJEZWxsIFdZU0UgTkIiLCBBTEMyMjVfRklYVVBfREVMTDFfTUlDX05PX1BSRVNFTkNFKSwKIAlT
TkRfUENJX1FVSVJLKDB4MTAyOCwgMHgwOTM1LCAiRGVsbCIsIEFMQzI3NF9GSVhVUF9ERUxMX0FJ
T19MSU5FT1VUX1ZFUkIpLAorCVNORF9QQ0lfUVVJUksoMHgxMDI4LCAweDA5N2UsICJEZWxsIFBy
ZWNpc2lvbiIsIEFMQzI4OV9GSVhVUF9EVUFMX1NQSyksCisJU05EX1BDSV9RVUlSSygweDEwMjgs
IDB4MDk3ZCwgIkRlbGwgUHJlY2lzaW9uIiwgQUxDMjg5X0ZJWFVQX0RVQUxfU1BLKSwKIAlTTkRf
UENJX1FVSVJLKDB4MTAyOCwgMHgxNjRhLCAiRGVsbCIsIEFMQzI5M19GSVhVUF9ERUxMMV9NSUNf
Tk9fUFJFU0VOQ0UpLAogCVNORF9QQ0lfUVVJUksoMHgxMDI4LCAweDE2NGIsICJEZWxsIiwgQUxD
MjkzX0ZJWFVQX0RFTEwxX01JQ19OT19QUkVTRU5DRSksCiAJU05EX1BDSV9RVUlSSygweDEwM2Ms
IDB4MTU4NiwgIkhQIiwgQUxDMjY5X0ZJWFVQX0hQX01VVEVfTEVEX01JQzIpLAo=

--_002_229c7efa2b474a16b7d8a916cd096b68realtekcom_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--_002_229c7efa2b474a16b7d8a916cd096b68realtekcom_--
