Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F4B2B8EC0
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Nov 2020 10:29:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBFE01654;
	Thu, 19 Nov 2020 10:28:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBFE01654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605778162;
	bh=wksjAYZ+f29uDmP4pZ+0UDw+CzXuDt1nAE13/tYR/0c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Iy41NWtxXhvJOOahkYlQYNIbWznzeMS0AFRRr5enEciIXPLVP76URA7OqREnCbcyn
	 LPIuPGj7YxHF2T4vXvU7NiSejml4XwQOKNqv+JmQR48mvxxnFjU/IpDQUnAwblEu0O
	 w17y4XjCuLl/iBEtI+B592AlevEN2REazQ+35Zsc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6AB7F801F5;
	Thu, 19 Nov 2020 10:27:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D95CF801ED; Thu, 19 Nov 2020 10:27:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=PRX_APP_ATTACH, SPF_HELO_NONE, 
 SPF_PASS autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA843F8015A
 for <alsa-devel@alsa-project.org>; Thu, 19 Nov 2020 10:27:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA843F8015A
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 0AJ9QxBK2026620,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb01.realtek.com.tw[172.21.6.94])
 by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 0AJ9QxBK2026620
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 Nov 2020 17:26:59 +0800
Received: from RTEXMBS02.realtek.com.tw (172.21.6.35) by
 RTEXMB01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2044.4; Thu, 19 Nov 2020 17:26:59 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.36) by
 RTEXMBS02.realtek.com.tw (172.21.6.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 19 Nov 2020 17:26:58 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::513b:ca8:6e55:15a2]) by
 RTEXMBS01.realtek.com.tw ([fe80::513b:ca8:6e55:15a2%8]) with mapi id
 15.01.2106.003; Thu, 19 Nov 2020 17:26:58 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
Subject: Dell AIO wrong sound tone
Thread-Topic: Dell AIO wrong sound tone
Thread-Index: Ada+Vbame/j5bVA8Sy+3hUmLjgVgfg==
Date: Thu, 19 Nov 2020 09:26:58 +0000
Message-ID: <582be5538aca4c5e86e436854e06036b@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.96]
Content-Type: multipart/mixed;
 boundary="_002_582be5538aca4c5e86e436854e06036brealtekcom_"
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

--_002_582be5538aca4c5e86e436854e06036brealtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Dell AIO only had one audio jack.
It will get wrong sound tone with replug speaker or HP or headset.
This patch will solve it.

Many thanks.

BR,
Kailang

--_002_582be5538aca4c5e86e436854e06036brealtekcom_
Content-Type: application/octet-stream; name="0000-dell-aio-headset.patch"
Content-Description: 0000-dell-aio-headset.patch
Content-Disposition: attachment; filename="0000-dell-aio-headset.patch";
	size=4048; creation-date="Thu, 19 Nov 2020 09:06:36 GMT";
	modification-date="Thu, 19 Nov 2020 09:23:12 GMT"
Content-Transfer-Encoding: base64

RnJvbSA4ZDk3ZDY3OGZkYmYwY2U5OGQ2MjgxYzA3NjgwNTgxNDgyNjhiMzY5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBrYWlsYW5nIDxrYWlsYW5nQHJlYWx0ZWsuY29tPgpEYXRlOiBU
aHUsIDE5IE5vdiAyMDIwIDE3OjA0OjIxICswODAwClN1YmplY3Q6IFtQQVRDSF0gQUxTQTogaGRh
L3JlYWx0ZWsgLSBGaXhlZCBEZWxsIEFJTyB3cm9uZyBzb3VuZCB0b25lCgpUaGlzIHBsYXRmb3Jt
IG9ubHkgaGFkIG9uZSBhdWRpbyBqYWNrLgpJZiBpdCBwbHVnZ2VkIHNwZWFrZXIgdGhlbiByZXBs
dWcgd2l0aCBzcGVha2VyIG9yIGhlYWRzZXQsIHRoZSBzb3VuZCB0b25lIHdpbGwgCmNoYW5nZSB0
byBhYm5vcm1hbC4KClNpZ25lZC1vZmYtYnk6IEthaWxhbmcgWWFuZyA8a2FpbGFuZ0ByZWFsdGVr
LmNvbT4KCmRpZmYgLS1naXQgYS9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYyBiL3NvdW5k
L3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCmluZGV4IDczOWRiYWY1NDUxNy4uMjcwNjlkOTk1NjJk
IDEwMDY0NAotLS0gYS9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYworKysgYi9zb3VuZC9w
Y2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwpAQCAtMTE5LDYgKzExOSw3IEBAIHN0cnVjdCBhbGNfc3Bl
YyB7CiAJdW5zaWduZWQgaW50IG5vX3NodXR1cF9waW5zOjE7CiAJdW5zaWduZWQgaW50IHVsdHJh
X2xvd19wb3dlcjoxOwogCXVuc2lnbmVkIGludCBoYXNfaHNfa2V5OjE7CisJdW5zaWduZWQgaW50
IG5vX2ludGVybmFsX21pY19waW46MTsKIAogCS8qIGZvciBQTEwgZml4ICovCiAJaGRhX25pZF90
IHBsbF9uaWQ7CkBAIC00NTIzLDYgKzQ1MjQsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGNvZWZf
ZncgYWxjMjI1X3ByZV9oc21vZGVbXSA9IHsKIAogc3RhdGljIHZvaWQgYWxjX2hlYWRzZXRfbW9k
ZV91bnBsdWdnZWQoc3RydWN0IGhkYV9jb2RlYyAqY29kZWMpCiB7CisJc3RydWN0IGFsY19zcGVj
ICpzcGVjID0gY29kZWMtPnNwZWM7CiAJc3RhdGljIGNvbnN0IHN0cnVjdCBjb2VmX2Z3IGNvZWYw
MjU1W10gPSB7CiAJCVdSSVRFX0NPRUYoMHgxYiwgMHgwYzBiKSwgLyogTERPIGFuZCBNSVNDIGNv
bnRyb2wgKi8KIAkJV1JJVEVfQ09FRigweDQ1LCAweGQwODkpLCAvKiBVQUogZnVuY3Rpb24gc2V0
IHRvIG1lbnVhbCBtb2RlICovCkBAIC00NTk3LDYgKzQ1OTksMTEgQEAgc3RhdGljIHZvaWQgYWxj
X2hlYWRzZXRfbW9kZV91bnBsdWdnZWQoc3RydWN0IGhkYV9jb2RlYyAqY29kZWMpCiAJCXt9CiAJ
fTsKIAorCWlmIChzcGVjLT5ub19pbnRlcm5hbF9taWNfcGluKSB7CisJCWFsY191cGRhdGVfY29l
Zl9pZHgoY29kZWMsIDB4NDUsIDB4Zjw8MTIgfCAxPDwxMCwgNTw8MTIpOworCQlyZXR1cm47CisJ
fQorCiAJc3dpdGNoIChjb2RlYy0+Y29yZS52ZW5kb3JfaWQpIHsKIAljYXNlIDB4MTBlYzAyNTU6
CiAJCWFsY19wcm9jZXNzX2NvZWZfZncoY29kZWMsIGNvZWYwMjU1KTsKQEAgLTUxNjMsNiArNTE3
MCwxMSBAQCBzdGF0aWMgdm9pZCBhbGNfZGV0ZXJtaW5lX2hlYWRzZXRfdHlwZShzdHJ1Y3QgaGRh
X2NvZGVjICpjb2RlYykKIAkJe30KIAl9OwogCisJaWYgKHNwZWMtPm5vX2ludGVybmFsX21pY19w
aW4pIHsKKwkJYWxjX3VwZGF0ZV9jb2VmX2lkeChjb2RlYywgMHg0NSwgMHhmPDwxMiB8IDE8PDEw
LCA1PDwxMik7CisJCXJldHVybjsKKwl9CisKIAlzd2l0Y2ggKGNvZGVjLT5jb3JlLnZlbmRvcl9p
ZCkgewogCWNhc2UgMHgxMGVjMDI1NToKIAkJYWxjX3Byb2Nlc3NfY29lZl9mdyhjb2RlYywgY29l
ZjAyNTUpOwpAQCAtNjEyMSw2ICs2MTMzLDIyIEBAIHN0YXRpYyB2b2lkIGFsYzI3NF9maXh1cF9o
cF9oZWFkc2V0X21pYyhzdHJ1Y3QgaGRhX2NvZGVjICpjb2RlYywKIAl9CiB9CiAKK3N0YXRpYyB2
b2lkIGFsY19maXh1cF9ub19pbnRfbWljKHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjLAorCQkJCSAg
ICBjb25zdCBzdHJ1Y3QgaGRhX2ZpeHVwICpmaXgsIGludCBhY3Rpb24pCit7CisJc3RydWN0IGFs
Y19zcGVjICpzcGVjID0gY29kZWMtPnNwZWM7CisKKwlzd2l0Y2ggKGFjdGlvbikgeworCWNhc2Ug
SERBX0ZJWFVQX0FDVF9QUkVfUFJPQkU6CisJCWFsY191cGRhdGVfY29lZl9pZHgoY29kZWMsIDB4
NDUsIDB4Zjw8MTIgfCAxPDwxMCwgNTw8MTIpOworCQlzcGVjLT5ub19pbnRlcm5hbF9taWNfcGlu
ID0gdHJ1ZTsKKwkJYnJlYWs7CisJY2FzZSBIREFfRklYVVBfQUNUX0lOSVQ6CisJCWFsY19jb21i
b19qYWNrX2hwX2pkX3Jlc3RhcnQoY29kZWMpOworCQlicmVhazsKKwl9Cit9CisKIC8qIGZvciBo
ZGFfZml4dXBfdGhpbmtwYWRfYWNwaSgpICovCiAjaW5jbHVkZSAidGhpbmtwYWRfaGVscGVyLmMi
CiAKQEAgLTYzMjAsNiArNjM0OCw3IEBAIGVudW0gewogCUFMQzI4NV9GSVhVUF9USElOS1BBRF9O
T19CQVNTX1NQS19IRUFEU0VUX0pBQ0ssCiAJQUxDMjg3X0ZJWFVQX0hQX0dQSU9fTEVELAogCUFM
QzI1Nl9GSVhVUF9IUF9IRUFEU0VUX01JQywKKwlBTEMyMzZfRklYVVBfREVMTF9BSU9fSEVBRFNF
VF9NSUMsCiB9OwogCiBzdGF0aWMgY29uc3Qgc3RydWN0IGhkYV9maXh1cCBhbGMyNjlfZml4dXBz
W10gPSB7CkBAIC03NzM4LDYgKzc3NjcsMTIgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBoZGFfZml4
dXAgYWxjMjY5X2ZpeHVwc1tdID0gewogCQkudHlwZSA9IEhEQV9GSVhVUF9GVU5DLAogCQkudi5m
dW5jID0gYWxjMjc0X2ZpeHVwX2hwX2hlYWRzZXRfbWljLAogCX0sCisJW0FMQzIzNl9GSVhVUF9E
RUxMX0FJT19IRUFEU0VUX01JQ10gPSB7CisJCS50eXBlID0gSERBX0ZJWFVQX0ZVTkMsCisJCS52
LmZ1bmMgPSBhbGNfZml4dXBfbm9faW50X21pYywKKwkJLmNoYWluZWQgPSB0cnVlLAorCQkuY2hh
aW5faWQgPSBBTEMyNTVfRklYVVBfREVMTDFfTUlDX05PX1BSRVNFTkNFCisJfSwKIH07CiAKIHN0
YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3BjaV9xdWlyayBhbGMyNjlfZml4dXBfdGJsW10gPSB7CkBA
IC03ODE1LDYgKzc4NTAsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9wY2lfcXVpcmsgYWxj
MjY5X2ZpeHVwX3RibFtdID0gewogCVNORF9QQ0lfUVVJUksoMHgxMDI4LCAweDA5N2QsICJEZWxs
IFByZWNpc2lvbiIsIEFMQzI4OV9GSVhVUF9EVUFMX1NQSyksCiAJU05EX1BDSV9RVUlSSygweDEw
MjgsIDB4MDk4ZCwgIkRlbGwgUHJlY2lzaW9uIiwgQUxDMjMzX0ZJWFVQX0FTVVNfTUlDX05PX1BS
RVNFTkNFKSwKIAlTTkRfUENJX1FVSVJLKDB4MTAyOCwgMHgwOWJmLCAiRGVsbCBQcmVjaXNpb24i
LCBBTEMyMzNfRklYVVBfQVNVU19NSUNfTk9fUFJFU0VOQ0UpLAorCVNORF9QQ0lfUVVJUksoMHgx
MDI4LCAweDBhMmUsICJEZWxsIiwgQUxDMjM2X0ZJWFVQX0RFTExfQUlPX0hFQURTRVRfTUlDKSwK
KwlTTkRfUENJX1FVSVJLKDB4MTAyOCwgMHgwYTMwLCAiRGVsbCIsIEFMQzIzNl9GSVhVUF9ERUxM
X0FJT19IRUFEU0VUX01JQyksCiAJU05EX1BDSV9RVUlSSygweDEwMjgsIDB4MTY0YSwgIkRlbGwi
LCBBTEMyOTNfRklYVVBfREVMTDFfTUlDX05PX1BSRVNFTkNFKSwKIAlTTkRfUENJX1FVSVJLKDB4
MTAyOCwgMHgxNjRiLCAiRGVsbCIsIEFMQzI5M19GSVhVUF9ERUxMMV9NSUNfTk9fUFJFU0VOQ0Up
LAogCVNORF9QQ0lfUVVJUksoMHgxMDNjLCAweDE1ODYsICJIUCIsIEFMQzI2OV9GSVhVUF9IUF9N
VVRFX0xFRF9NSUMyKSwKQEAgLTgzNTMsNiArODM5MCw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
c25kX2hkYV9waW5fcXVpcmsgYWxjMjY5X3Bpbl9maXh1cF90YmxbXSA9IHsKIAkJezB4MTksIDB4
MDJhMTEwMjB9LAogCQl7MHgxYSwgMHgwMmExMTAzMH0sCiAJCXsweDIxLCAweDAyMjExMDFmfSks
CisJU05EX0hEQV9QSU5fUVVJUksoMHgxMGVjMDIzNiwgMHgxMDI4LCAiRGVsbCIsIEFMQzIzNl9G
SVhVUF9ERUxMX0FJT19IRUFEU0VUX01JQywKKwkJezB4MjEsIDB4MDIyMTEwMTB9KSwKIAlTTkRf
SERBX1BJTl9RVUlSSygweDEwZWMwMjM2LCAweDEwM2MsICJIUCIsIEFMQzI1Nl9GSVhVUF9IUF9I
RUFEU0VUX01JQywKIAkJezB4MTQsIDB4OTAxNzAxMTB9LAogCQl7MHgxOSwgMHgwMmExMTAyMH0s
Cg==

--_002_582be5538aca4c5e86e436854e06036brealtekcom_--
