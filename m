Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F353D2D7101
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Dec 2020 08:37:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 420AD16F6;
	Fri, 11 Dec 2020 08:36:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 420AD16F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607672252;
	bh=S700ACgpvLfHIS0O77VrJTX4gpeO47Dk7rzBn87g02o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FoP7IAuj5CvNQezF/IwanGrFiriEUcS0bF2o74uFN/Vs1IqsaKehKDHyGz6eo0c7k
	 cqTBz+dxChjaAnDpxEKUQR5ddJrc/4j0XXiN+/1LVGMQB/p/0hm9ZEPJTagYKzCx86
	 U2rQy3u65dsBFhJbaNyjApx86udma6rI1Q+vjjy0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F59CF80240;
	Fri, 11 Dec 2020 08:36:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4F7FF8021D; Fri, 11 Dec 2020 08:36:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=PRX_APP_ATTACH, SPF_HELO_NONE, 
 SPF_NONE autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9AFCBF8011F
 for <alsa-devel@alsa-project.org>; Fri, 11 Dec 2020 08:36:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AFCBF8011F
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 0BB7aXV01023460,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmbs02.realtek.com.tw[172.21.6.35])
 by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 0BB7aXV01023460
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 11 Dec 2020 15:36:33 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.36) by
 RTEXMBS02.realtek.com.tw (172.21.6.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 11 Dec 2020 15:36:33 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::513b:ca8:6e55:15a2]) by
 RTEXMBS01.realtek.com.tw ([fe80::513b:ca8:6e55:15a2%8]) with mapi id
 15.01.2106.003; Fri, 11 Dec 2020 15:36:33 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
Subject: Add supported for more Lenovo ALC285 Headset Button -- again
Thread-Topic: Add supported for more Lenovo ALC285 Headset Button -- again
Thread-Index: AdbPkEzGE3Hof+oFRkmOufM0dT2XgA==
Date: Fri, 11 Dec 2020 07:36:33 +0000
Message-ID: <bb1f1da1526d460885aa4257be81eb94@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.96]
Content-Type: multipart/mixed;
 boundary="_002_bb1f1da1526d460885aa4257be81eb94realtekcom_"
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

--_002_bb1f1da1526d460885aa4257be81eb94realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

This platform had more SSID.
So, use pin quirk for this platform.

Many Thanks.

Kailang


--_002_bb1f1da1526d460885aa4257be81eb94realtekcom_
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

--_002_bb1f1da1526d460885aa4257be81eb94realtekcom_--
