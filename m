Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 437C32D7100
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Dec 2020 08:36:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D00E616A1;
	Fri, 11 Dec 2020 08:35:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D00E616A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607672209;
	bh=y6BJ8+pVZsuwv1wN0mvEk0V4nMDFfwyT7TH+DTtvTe4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vHz4HtThALRRNTy/gPLbm3poWlnA5cTk5IYyt50Dh0CDTfvQSwoDZicWo26uTYQTX
	 Ho7J4prN90PpF546XB4Lh8qKhtj4eBmvg5cQmHn1rB2ctxSpdTYQwKmwAdSPyzm7Rh
	 AOqfmntfhNVaekfvO3ZQ/VQIR47Ne+AdgYv3Gbng=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BFBAF80217;
	Fri, 11 Dec 2020 08:35:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE7FCF8020D; Fri, 11 Dec 2020 08:35:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=HTML_MESSAGE,PRX_APP_ATTACH,
 PRX_BODY_135,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDDFFF80105
 for <alsa-devel@alsa-project.org>; Fri, 11 Dec 2020 08:35:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDDFFF80105
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 0BB7YwzeE022935,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmbs03.realtek.com.tw[172.21.6.34])
 by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 0BB7YwzeE022935
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 11 Dec 2020 15:34:58 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXMBS03.realtek.com.tw (172.21.6.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 11 Dec 2020 15:34:58 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.36) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 11 Dec 2020 15:34:57 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::513b:ca8:6e55:15a2]) by
 RTEXMBS01.realtek.com.tw ([fe80::513b:ca8:6e55:15a2%8]) with mapi id
 15.01.2106.003; Fri, 11 Dec 2020 15:34:57 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
Subject: Add supported for more Lenovo ALC285 Headset Button
Thread-Topic: Add supported for more Lenovo ALC285 Headset Button
Thread-Index: AdbPj89EPTJxPXaPRSacZY8DLgpP2A==
Date: Fri, 11 Dec 2020 07:34:57 +0000
Message-ID: <9757dfc7542544319124a5481f941fda@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.96]
Content-Type: multipart/mixed;
 boundary="_004_9757dfc7542544319124a5481f941fdarealtekcom_"
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

--_004_9757dfc7542544319124a5481f941fdarealtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

This platform had more SSID.
So, use pin quirk for this platform.

Many Thanks.

Kailang

--_004_9757dfc7542544319124a5481f941fdarealtekcom_
Content-Type: application/octet-stream;
	name="0000-alc285-more-thinkpad-hsb.patch"
Content-Description: 0000-alc285-more-thinkpad-hsb.patch
Content-Disposition: attachment;
	filename="0000-alc285-more-thinkpad-hsb.patch"; size=987;
	creation-date="Fri, 11 Dec 2020 06:19:52 GMT";
	modification-date="Fri, 11 Dec 2020 07:31:28 GMT"
Content-Transfer-Encoding: base64

RnJvbSBkNzU1Yjg1OTA0MjJmNGFiYjU4ZjRjMWZhYTg1YjgzYTZhZGU1NzAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBrYWlsYW5nIDxrYWlsYW5nQHJlYWx0ZWsuY29tPgpEYXRlOiBG
cmksIDExIERlYyAyMDIwIDE0OjE3OjA5ICswODAwClN1YmplY3Q6IFtQQVRDSF0gQUxTQTogaGRh
L3JlYWx0ZWsgLSBBZGQgc3VwcG9ydGVkIGZvciBtb3JlIExlbm92byBBTEMyODUgSGVhZHNldCBC
dXR0b24KCkFkZCBzdXBwb3J0ZWQgZm9yIG1vcmUgTGVub3ZvIEFMQzI4NSBIZWFkc2V0IEJ1dHRv
bi4KClNpZ25lZC1vZmYtYnk6IEthaWxhbmcgWWFuZyA8a2FpbGFuZ0ByZWFsdGVrLmNvbT4KCmRp
ZmYgLS1naXQgYS9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYyBiL3NvdW5kL3BjaS9oZGEv
cGF0Y2hfcmVhbHRlay5jCmluZGV4IDg2MTZjNTYyNDg3MC4uYTk3NTVjN2VhYmUzIDEwMDY0NAot
LS0gYS9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYworKysgYi9zb3VuZC9wY2kvaGRhL3Bh
dGNoX3JlYWx0ZWsuYwpAQCAtODU3Myw2ICs4NTczLDEwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
c25kX2hkYV9waW5fcXVpcmsgYWxjMjY5X3Bpbl9maXh1cF90YmxbXSA9IHsKIAkJezB4MTIsIDB4
OTBhNjAxMzB9LAogCQl7MHgxOSwgMHgwM2ExMTAyMH0sCiAJCXsweDIxLCAweDAzMjExMDFmfSks
CisJU05EX0hEQV9QSU5fUVVJUksoMHgxMGVjMDI4NSwgMHgxN2FhLCAiTGVub3ZvIiwgQUxDMjg1
X0ZJWFVQX1RISU5LUEFEX05PX0JBU1NfU1BLX0hFQURTRVRfSkFDSywKKwkJezB4MTQsIDB4OTAx
NzAxMTB9LAorCQl7MHgxOSwgMHgwNGExMTA0MH0sCisJCXsweDIxLCAweDA0MjExMDIwfSksCiAJ
U05EX0hEQV9QSU5fUVVJUksoMHgxMGVjMDI4NSwgMHgxN2FhLCAiTGVub3ZvIiwgQUxDMjg1X0ZJ
WFVQX0xFTk9WT19QQ19CRUVQX0lOX05PSVNFLAogCQl7MHgxMiwgMHg5MGE2MDEzMH0sCiAJCXsw
eDE0LCAweDkwMTcwMTEwfSwK

--_004_9757dfc7542544319124a5481f941fdarealtekcom_--
