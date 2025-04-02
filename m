Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFB2A786AE
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Apr 2025 05:01:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBEAD601FC;
	Wed,  2 Apr 2025 05:00:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBEAD601FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1743562866;
	bh=4oVGhsSdEBBS8qqcg/UuXZ8JXhPW6g3SAPM12DRhJ2k=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=OCe6iYvWJTSLSf9R3bNQlHxkhGvEUdZ3ms0bOeoj3DyggJnPqLAlB1W6yIx4IFmRT
	 tGkeMec6CqxiWdP85R+IOYsUUbQ1T2UbmcTBd/5W2721vK8uzW86U6PLvjuPBAzU87
	 4RSkT+ORFs7yg9IadBgVqYjsOlslKuwh162qLR90=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CAC9F805B4; Wed,  2 Apr 2025 05:00:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F27B1F805B6;
	Wed,  2 Apr 2025 05:00:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28E5CF80301; Wed,  2 Apr 2025 05:00:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=BAYES_05,DKIM_INVALID,
	DKIM_SIGNED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C1D71F800AC
	for <alsa-devel@alsa-project.org>; Wed,  2 Apr 2025 05:00:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1D71F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=temperror header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=M236gK/P
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 53230AfcC3452509,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1743562810; bh=4oVGhsSdEBBS8qqcg/UuXZ8JXhPW6g3SAPM12DRhJ2k=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version;
	b=M236gK/Pj9r3iGfiLpBO2R3s4h9OXSxk+yFK1fdbsYzUo5YKU+olzYkRzrMojmJ7q
	 1tguNSNxqbrH/2D4fphNy+RhflY/hLvvxKovFD5sA1TKgX0X0Kxt+eHyuGx0sh6f6s
	 675pxC5nUA5WoLSrRJKtjaUVoUMK4OkShC1Mr8KVcsEGA666oBz9iKPYlRoZ4Kxkqg
	 GmKbamFBMlGE5LHa1eGFwlyWFF10QoQTaGB+cVXB97sRV5QS8DN/BP1Dc3HDHqoHcr
	 bgRUk2GA0n3VBOnXIojsDKDJtEufJQNMRHnRazNwoXONest2Z9rAL8fUCeMXbEPOEp
	 iZOnpH8bY70kw==
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 53230AfcC3452509
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Apr 2025 11:00:10 +0800
Received: from RTEXMBS05.realtek.com.tw (172.21.6.98) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 2 Apr 2025 11:00:10 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS05.realtek.com.tw (172.21.6.98) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 2 Apr 2025 11:00:10 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::f5bd:6ac9:46d:9547]) by
 RTEXMBS01.realtek.com.tw ([fe80::f5bd:6ac9:46d:9547%5]) with mapi id
 15.01.2507.035; Wed, 2 Apr 2025 11:00:10 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Support mute led function for HP platform
Thread-Topic: Support mute led function for HP platform
Thread-Index: AdujewFkDy1lacckSDm50D4dZeEuaw==
Date: Wed, 2 Apr 2025 03:00:10 +0000
Message-ID: <2c960ab58b4d4090ad4ee075f8cfdffd@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
x-originating-ip: [172.21.6.42]
Content-Type: multipart/mixed;
	boundary="_002_2c960ab58b4d4090ad4ee075f8cfdffdrealtekcom_"
MIME-Version: 1.0
Message-ID-Hash: EPJFIXQINMTXMHFTKDY53SNR4WZ6ZZSD
X-Message-ID-Hash: EPJFIXQINMTXMHFTKDY53SNR4WZ6ZZSD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EPJFIXQINMTXMHFTKDY53SNR4WZ6ZZSD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--_002_2c960ab58b4d4090ad4ee075f8cfdffdrealtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Attach was fixed mute led no function with HP platform.
Many Thanks.

BR,
Kailang

--_002_2c960ab58b4d4090ad4ee075f8cfdffdrealtekcom_
Content-Type: application/octet-stream;
	name="0000-alc245-hp-zbook-firefly-g12a-mute-led-01.patch"
Content-Description: 0000-alc245-hp-zbook-firefly-g12a-mute-led-01.patch
Content-Disposition: attachment;
	filename="0000-alc245-hp-zbook-firefly-g12a-mute-led-01.patch"; size=4147;
	creation-date="Tue, 01 Apr 2025 08:53:05 GMT";
	modification-date="Wed, 02 Apr 2025 02:47:58 GMT"
Content-Transfer-Encoding: base64

RnJvbSBkM2FiZmQ5Mzk0ZTMwYmQ4OWI2ZDJmODI5NTIzYzExYTRmOWFkYjNhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFR1ZSwgMSBBcHIgMjAyNSAxNjo1MDowOCArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIEFMU0E6
IGhkYS9yZWFsdGVrIC0gU3VwcG9ydCBtdXRlIGxlZCBmdW5jdGlvbiBmb3IgSFAgcGxhdGZvcm0K
ClRoaXMgcGF0Y2ggd2FzIGludGVncmF0ZWQgQ1MgQW1wIGFuZCBzdXBwb3J0IG11dGUgbGVkIGZ1
bmN0aW9uIGZvciBIUCBwbGF0Zm9ybS4KClByaW9yaXR5OiBQMQpTaWduZWQtb2ZmLWJ5OiBLYWls
YW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CmRpZmYgLS1naXQgYS9zb3VuZC9wY2kvaGRh
L3BhdGNoX3JlYWx0ZWsuYyBiL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCmluZGV4IGI2
OWI2NTlhZTY1OS4uZWVjM2VhMWE3ZTA4IDEwMDY0NAotLS0gYS9zb3VuZC9wY2kvaGRhL3BhdGNo
X3JlYWx0ZWsuYworKysgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwpAQCAtNzU5MCw2
ICs3NTkwLDI0IEBAIHN0YXRpYyB2b2lkIGFsYzI0NV9maXh1cF9ocF9zcGVjdHJlX3gzNjBfMTZf
YWEweHh4KHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjLAogCWFsYzI0NV9maXh1cF9ocF9ncGlvX2xl
ZChjb2RlYywgZml4LCBhY3Rpb24pOwogfQogCitzdGF0aWMgdm9pZCBhbGMyNDVfZml4dXBfaHBf
emJvb2tfZmlyZWZseV9nMTJhKHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjLAorCQkJCQkgIGNvbnN0
IHN0cnVjdCBoZGFfZml4dXAgKmZpeCwgaW50IGFjdGlvbikKK3sKKwlzdHJ1Y3QgYWxjX3NwZWMg
KnNwZWMgPSBjb2RlYy0+c3BlYzsKKwlzdGF0aWMgY29uc3QgaGRhX25pZF90IGNvbm5bXSA9IHsg
MHgwMiB9OworCisJc3dpdGNoIChhY3Rpb24pIHsKKwljYXNlIEhEQV9GSVhVUF9BQ1RfUFJFX1BS
T0JFOgorCQlzcGVjLT5nZW4uYXV0b19tdXRlX3ZpYV9hbXAgPSAxOworCQlzbmRfaGRhX292ZXJy
aWRlX2Nvbm5fbGlzdChjb2RlYywgMHgxNywgQVJSQVlfU0laRShjb25uKSwgY29ubik7CisJCWJy
ZWFrOworCX0KKworCWNzMzVsNDFfZml4dXBfaTJjX3R3byhjb2RlYywgZml4LCBhY3Rpb24pOwor
CWFsYzI0NV9maXh1cF9ocF9tdXRlX2xlZF9jb2VmYml0KGNvZGVjLCBmaXgsIGFjdGlvbik7CisJ
YWxjMjg1X2ZpeHVwX2hwX2NvZWZfbWljbXV0ZV9sZWQoY29kZWMsIGZpeCwgYWN0aW9uKTsKK30K
KwogLyoKICAqIEFMQzI4NyBQQ00gaG9va3MKICAqLwpAQCAtNzkzOCw2ICs3OTU2LDcgQEAgZW51
bSB7CiAJQUxDMjU2X0ZJWFVQX0hFQURQSE9ORV9BTVBfVk9MLAogCUFMQzI0NV9GSVhVUF9IUF9T
UEVDVFJFX1gzNjBfRVUwWFhYLAogCUFMQzI0NV9GSVhVUF9IUF9TUEVDVFJFX1gzNjBfMTZfQUEw
WFhYLAorCUFMQzI0NV9GSVhVUF9IUF9aQk9PS19GSVJFRkxZX0cxMkEsCiAJQUxDMjg1X0ZJWFVQ
X0FTVVNfR0E0MDNVLAogCUFMQzI4NV9GSVhVUF9BU1VTX0dBNDAzVV9IRUFEU0VUX01JQywKIAlB
TEMyODVfRklYVVBfQVNVU19HQTQwM1VfSTJDX1NQRUFLRVIyX1RPX0RBQzEsCkBAIC0xMDIzMyw2
ICsxMDI1MiwxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGhkYV9maXh1cCBhbGMyNjlfZml4dXBz
W10gPSB7CiAJCS50eXBlID0gSERBX0ZJWFVQX0ZVTkMsCiAJCS52LmZ1bmMgPSBhbGMyNDVfZml4
dXBfaHBfc3BlY3RyZV94MzYwXzE2X2FhMHh4eCwKIAl9LAorCVtBTEMyNDVfRklYVVBfSFBfWkJP
T0tfRklSRUZMWV9HMTJBXSA9IHsKKwkJLnR5cGUgPSBIREFfRklYVVBfRlVOQywKKwkJLnYuZnVu
YyA9IGFsYzI0NV9maXh1cF9ocF96Ym9va19maXJlZmx5X2cxMmEsCisJfSwKIAlbQUxDMjg1X0ZJ
WFVQX0FTVVNfR0E0MDNVXSA9IHsKIAkJLnR5cGUgPSBIREFfRklYVVBfRlVOQywKIAkJLnYuZnVu
YyA9IGFsYzI4NV9maXh1cF9hc3VzX2dhNDAzdSwKQEAgLTEwNzczLDE1ICsxMDc5NiwxNSBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IGhkYV9xdWlyayBhbGMyNjlfZml4dXBfdGJsW10gPSB7CiAJU05E
X1BDSV9RVUlSSygweDEwM2MsIDB4OGUxMSwgIkhQIFRyZWtrZXIiLCBBTEMyODdfRklYVVBfQ1Mz
NUw0MV9JMkNfMiksCiAJU05EX1BDSV9RVUlSSygweDEwM2MsIDB4OGUxMiwgIkhQIFRyZWtrZXIi
LCBBTEMyODdfRklYVVBfQ1MzNUw0MV9JMkNfMiksCiAJU05EX1BDSV9RVUlSSygweDEwM2MsIDB4
OGUxMywgIkhQIFRyZWtrZXIiLCBBTEMyODdfRklYVVBfQ1MzNUw0MV9JMkNfMiksCi0JU05EX1BD
SV9RVUlSSygweDEwM2MsIDB4OGUxNCwgIkhQIFpCb29rIEZpcmVmbHkgMTQgRzEyIiwgQUxDMjg1
X0ZJWFVQX0hQX0dQSU9fTEVEKSwKLQlTTkRfUENJX1FVSVJLKDB4MTAzYywgMHg4ZTE1LCAiSFAg
WkJvb2sgRmlyZWZseSAxNCBHMTIiLCBBTEMyODVfRklYVVBfSFBfR1BJT19MRUQpLAotCVNORF9Q
Q0lfUVVJUksoMHgxMDNjLCAweDhlMTYsICJIUCBaQm9vayBGaXJlZmx5IDE0IEcxMiIsIEFMQzI4
NV9GSVhVUF9IUF9HUElPX0xFRCksCi0JU05EX1BDSV9RVUlSSygweDEwM2MsIDB4OGUxNywgIkhQ
IFpCb29rIEZpcmVmbHkgMTQgRzEyIiwgQUxDMjg1X0ZJWFVQX0hQX0dQSU9fTEVEKSwKLQlTTkRf
UENJX1FVSVJLKDB4MTAzYywgMHg4ZTE4LCAiSFAgWkJvb2sgRmlyZWZseSAxNCBHMTJBIiwgQUxD
Mjg1X0ZJWFVQX0hQX0dQSU9fTEVEKSwKLQlTTkRfUENJX1FVSVJLKDB4MTAzYywgMHg4ZTE5LCAi
SFAgWkJvb2sgRmlyZWZseSAxNCBHMTJBIiwgQUxDMjg1X0ZJWFVQX0hQX0dQSU9fTEVEKSwKLQlT
TkRfUENJX1FVSVJLKDB4MTAzYywgMHg4ZTFhLCAiSFAgWkJvb2sgRmlyZWZseSAxNCBHMTJBIiwg
QUxDMjg1X0ZJWFVQX0hQX0dQSU9fTEVEKSwKLQlTTkRfUENJX1FVSVJLKDB4MTAzYywgMHg4ZTFi
LCAiSFAgRWxpdGVCb29rIEcxMiIsIEFMQzI4NV9GSVhVUF9IUF9HUElPX0xFRCksCi0JU05EX1BD
SV9RVUlSSygweDEwM2MsIDB4OGUxYywgIkhQIEVsaXRlQm9vayBHMTIiLCBBTEMyODVfRklYVVBf
SFBfR1BJT19MRUQpLAorCVNORF9QQ0lfUVVJUksoMHgxMDNjLCAweDhlMTQsICJIUCBaQm9vayBG
aXJlZmx5IDE0IEcxMiIsIEFMQzI0NV9GSVhVUF9IUF9aQk9PS19GSVJFRkxZX0cxMkEpLAorCVNO
RF9QQ0lfUVVJUksoMHgxMDNjLCAweDhlMTUsICJIUCBaQm9vayBGaXJlZmx5IDE0IEcxMiIsIEFM
QzI0NV9GSVhVUF9IUF9aQk9PS19GSVJFRkxZX0cxMkEpLAorCVNORF9QQ0lfUVVJUksoMHgxMDNj
LCAweDhlMTYsICJIUCBaQm9vayBGaXJlZmx5IDE0IEcxMiIsIEFMQzI0NV9GSVhVUF9IUF9aQk9P
S19GSVJFRkxZX0cxMkEpLAorCVNORF9QQ0lfUVVJUksoMHgxMDNjLCAweDhlMTcsICJIUCBaQm9v
ayBGaXJlZmx5IDE0IEcxMiIsIEFMQzI0NV9GSVhVUF9IUF9aQk9PS19GSVJFRkxZX0cxMkEpLAor
CVNORF9QQ0lfUVVJUksoMHgxMDNjLCAweDhlMTgsICJIUCBaQm9vayBGaXJlZmx5IDE0IEcxMkEi
LCBBTEMyNDVfRklYVVBfSFBfWkJPT0tfRklSRUZMWV9HMTJBKSwKKwlTTkRfUENJX1FVSVJLKDB4
MTAzYywgMHg4ZTE5LCAiSFAgWkJvb2sgRmlyZWZseSAxNCBHMTJBIiwgQUxDMjQ1X0ZJWFVQX0hQ
X1pCT09LX0ZJUkVGTFlfRzEyQSksCisJU05EX1BDSV9RVUlSSygweDEwM2MsIDB4OGUxYSwgIkhQ
IFpCb29rIEZpcmVmbHkgMTQgRzEyQSIsIEFMQzI0NV9GSVhVUF9IUF9aQk9PS19GSVJFRkxZX0cx
MkEpLAorCVNORF9QQ0lfUVVJUksoMHgxMDNjLCAweDhlMWIsICJIUCBFbGl0ZUJvb2sgRzEyIiwg
QUxDMjQ1X0ZJWFVQX0hQX1pCT09LX0ZJUkVGTFlfRzEyQSksCisJU05EX1BDSV9RVUlSSygweDEw
M2MsIDB4OGUxYywgIkhQIEVsaXRlQm9vayBHMTIiLCBBTEMyNDVfRklYVVBfSFBfWkJPT0tfRklS
RUZMWV9HMTJBKSwKIAlTTkRfUENJX1FVSVJLKDB4MTAzYywgMHg4ZTJjLCAiSFAgRWxpdGVCb29r
IDE2IEcxMiIsIEFMQzI4NV9GSVhVUF9IUF9HUElPX0xFRCksCiAJU05EX1BDSV9RVUlSSygweDEw
M2MsIDB4OGUzNiwgIkhQIDE0IEVuc3Ryb20gT21uaUJvb2sgWCIsIEFMQzI4N19GSVhVUF9DUzM1
TDQxX0kyQ18yKSwKIAlTTkRfUENJX1FVSVJLKDB4MTAzYywgMHg4ZTM3LCAiSFAgMTYgUGlzdG9u
IE9tbmlCb29rIFgiLCBBTEMyODdfRklYVVBfQ1MzNUw0MV9JMkNfMiksCg==

--_002_2c960ab58b4d4090ad4ee075f8cfdffdrealtekcom_--
