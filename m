Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 006FC5325DA
	for <lists+alsa-devel@lfdr.de>; Tue, 24 May 2022 10:59:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EF881709;
	Tue, 24 May 2022 10:58:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EF881709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653382755;
	bh=jA+86ogMSNSqscd+A3yknUaKOUj5/IB8cX3qtK/8rG0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aScI+Zh3C/ZlMSmWZKCkKcVDYgrPOBYuThqFNefq9wRBWsyM+rIE+KUXB/NCmaPWY
	 P6K146FsZtyog6AQYHRhQtcaJ7mp9TfPKN7xBOcPenhlJjvUiVwcDoSf03oSK6UD3i
	 sPCwX+NJEN9Q/bchRxrgEyLrIMzJsQ/D+TlqGhhg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E56B9F800E3;
	Tue, 24 May 2022 10:58:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E369DF804D1; Tue, 24 May 2022 10:58:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=3.0 required=5.0 tests=PRX_APP_ATTACH, SPF_HELO_NONE, 
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D65D6F800E3
 for <alsa-devel@alsa-project.org>; Tue, 24 May 2022 10:58:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D65D6F800E3
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 24O8w3Hg9028805,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 24O8w3Hg9028805
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 24 May 2022 16:58:03 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 24 May 2022 16:58:03 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 24 May 2022 16:58:03 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::754e:2219:bbef:d0cd]) by
 RTEXMBS01.realtek.com.tw ([fe80::754e:2219:bbef:d0cd%5]) with mapi id
 15.01.2308.027; Tue, 24 May 2022 16:58:03 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
Subject: Add new type for ALC245
Thread-Topic: Add new type for ALC245
Thread-Index: AdhvTF9xNtUj6e/rQD69V1fvT29tMQ==
Date: Tue, 24 May 2022 08:58:02 +0000
Message-ID: <cef26a7cd3d146eb96a3994ce79e34d2@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.99]
x-kse-serverinfo: RTEXDAG01.realtek.com.tw, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?us-ascii?Q?Clean,_bases:_2022/5/24_=3F=3F_06:14:00?=
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: multipart/mixed;
 boundary="_002_cef26a7cd3d146eb96a3994ce79e34d2realtekcom_"
MIME-Version: 1.0
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
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

--_002_cef26a7cd3d146eb96a3994ce79e34d2realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Attach patch will add new codec type for ALC245.

BR,
Kailang

--_002_cef26a7cd3d146eb96a3994ce79e34d2realtekcom_
Content-Type: application/octet-stream; name="0000-add-type-alc245.patch"
Content-Description: 0000-add-type-alc245.patch
Content-Disposition: attachment; filename="0000-add-type-alc245.patch";
	size=1744; creation-date="Tue, 24 May 2022 08:24:25 GMT";
	modification-date="Tue, 24 May 2022 08:28:00 GMT"
Content-Transfer-Encoding: base64

RnJvbSBkZmMyOTc3YzcxZGE3ZTQyMjMwNzIyMmQxZTRhZDAzM2MyYTAwYjRmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBrYWlsYW5nIDxrYWlsYW5nQHJlYWx0ZWsuY29tPgpEYXRlOiBU
dWUsIDI0IE1heSAyMDIyIDE2OjE0OjA0ICswODAwClN1YmplY3Q6IFtQQVRDSF0gQUxTQTogaGRh
L3JlYWx0ZWsgLSBBZGQgbmV3IHR5cGUgZm9yIEFMQzI0NQoKQWRkIG5ldyB0eXBlIGZvciBBTEMy
NDUuCgpTaWduZWQtb2ZmLWJ5OiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CmRp
ZmYgLS1naXQgYS9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYyBiL3NvdW5kL3BjaS9oZGEv
cGF0Y2hfcmVhbHRlay5jCmluZGV4IDhhM2UyZmU0MjEwNi4uMzMzNGVjMDIxMzMyIDEwMDY0NAot
LS0gYS9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYworKysgYi9zb3VuZC9wY2kvaGRhL3Bh
dGNoX3JlYWx0ZWsuYwpAQCAtMzA0OCw2ICszMDQ4LDcgQEAgZW51bSB7CiAJQUxDMjY5X1RZUEVf
QUxDMjU3LAogCUFMQzI2OV9UWVBFX0FMQzIxNSwKIAlBTEMyNjlfVFlQRV9BTEMyMjUsCisJQUxD
MjY5X1RZUEVfQUxDMjQ1LAogCUFMQzI2OV9UWVBFX0FMQzI4NywKIAlBTEMyNjlfVFlQRV9BTEMy
OTQsCiAJQUxDMjY5X1RZUEVfQUxDMzAwLApAQCAtMzA4NSw2ICszMDg2LDcgQEAgc3RhdGljIGlu
dCBhbGMyNjlfcGFyc2VfYXV0b19jb25maWcoc3RydWN0IGhkYV9jb2RlYyAqY29kZWMpCiAJY2Fz
ZSBBTEMyNjlfVFlQRV9BTEMyNTc6CiAJY2FzZSBBTEMyNjlfVFlQRV9BTEMyMTU6CiAJY2FzZSBB
TEMyNjlfVFlQRV9BTEMyMjU6CisJY2FzZSBBTEMyNjlfVFlQRV9BTEMyNDU6CiAJY2FzZSBBTEMy
NjlfVFlQRV9BTEMyODc6CiAJY2FzZSBBTEMyNjlfVFlQRV9BTEMyOTQ6CiAJY2FzZSBBTEMyNjlf
VFlQRV9BTEMzMDA6CkBAIC0zNjEyLDcgKzM2MTQsOCBAQCBzdGF0aWMgdm9pZCBhbGMyMjVfaW5p
dChzdHJ1Y3QgaGRhX2NvZGVjICpjb2RlYykKIAloZGFfbmlkX3QgaHBfcGluID0gYWxjX2dldF9o
cF9waW4oc3BlYyk7CiAJYm9vbCBocDFfcGluX3NlbnNlLCBocDJfcGluX3NlbnNlOwogCi0JaWYg
KHNwZWMtPmNvZGVjX3ZhcmlhbnQgIT0gQUxDMjY5X1RZUEVfQUxDMjg3KQorCWlmIChzcGVjLT5j
b2RlY192YXJpYW50ICE9IEFMQzI2OV9UWVBFX0FMQzI4NyAmJgorCQlzcGVjLT5jb2RlY192YXJp
YW50ICE9IEFMQzI2OV9UWVBFX0FMQzI0NSkKIAkJLyogcmVxdWlyZWQgb25seSBhdCBib290IG9y
IFMzIGFuZCBTNCByZXN1bWUgdGltZSAqLwogCQlpZiAoIXNwZWMtPmRvbmVfaHBfaW5pdCB8fAog
CQkJaXNfczNfcmVzdW1lKGNvZGVjKSB8fApAQCAtOTY4MCw3ICs5NjgzLDEwIEBAIHN0YXRpYyBp
bnQgcGF0Y2hfYWxjMjY5KHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjKQogCWNhc2UgMHgxMGVjMDI0
NToKIAljYXNlIDB4MTBlYzAyODU6CiAJY2FzZSAweDEwZWMwMjg5OgotCQlzcGVjLT5jb2RlY192
YXJpYW50ID0gQUxDMjY5X1RZUEVfQUxDMjE1OworCQlpZiAoYWxjX2dldF9jb2VmMChjb2RlYykg
JiAweDAwMTApCisJCQlzcGVjLT5jb2RlY192YXJpYW50ID0gQUxDMjY5X1RZUEVfQUxDMjQ1Owor
CQllbHNlCisJCQlzcGVjLT5jb2RlY192YXJpYW50ID0gQUxDMjY5X1RZUEVfQUxDMjE1OwogCQlz
cGVjLT5zaHV0dXAgPSBhbGMyMjVfc2h1dHVwOwogCQlzcGVjLT5pbml0X2hvb2sgPSBhbGMyMjVf
aW5pdDsKIAkJc3BlYy0+Z2VuLm1peGVyX25pZCA9IDA7Cg==

--_002_cef26a7cd3d146eb96a3994ce79e34d2realtekcom_--
