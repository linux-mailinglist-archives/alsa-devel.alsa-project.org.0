Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D54279C9ED
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 10:29:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78B48A4C;
	Tue, 12 Sep 2023 10:28:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78B48A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694507371;
	bh=0p/1q46yhmf778rHQ0SL4+DL3+yaVcl3v9Emkm3DAvI=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=FG2iRMdl2VwsETxuIdn/ZFb3JYSP0bFluZ9FUQZuv0mwvfFYVrVFiEZJHGv+HOVnL
	 1rvfgPpD3Yvzwrv80zlp76lbHW94M6PeJBBGe6CrF0RA2O3YPd/yBvjmEz3KKqZj4b
	 iY+atRhKSNbBzGXJyAO0IfYerKF+zl4XlGg5f7uI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1AD4F8055A; Tue, 12 Sep 2023 10:28:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EC3DFF80549;
	Tue, 12 Sep 2023 10:28:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C310FF8055B; Tue, 12 Sep 2023 10:28:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 47D0AF800AA
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 10:28:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47D0AF800AA
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 38C8SF8R02406487,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.92/5.92) with ESMTPS id 38C8SF8R02406487
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Sep 2023 16:28:15 +0800
Received: from RTEXMBS02.realtek.com.tw (172.21.6.95) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Tue, 12 Sep 2023 16:28:15 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS02.realtek.com.tw (172.21.6.95) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 12 Sep 2023 16:28:14 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::9cb8:8d5:b6b3:213b]) by
 RTEXMBS01.realtek.com.tw ([fe80::9cb8:8d5:b6b3:213b%5]) with mapi id
 15.01.2375.007; Tue, 12 Sep 2023 16:28:13 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
Subject: Update alc287_fixup_bind_dacs()
Thread-Topic: Update alc287_fixup_bind_dacs()
Thread-Index: AdnlUol8I+Z0iGB9Tiie4ML4h3gAPA==
Date: Tue, 12 Sep 2023 08:28:13 +0000
Message-ID: <e3f2aac3fe6a47079d728a6443358cc2@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
x-originating-ip: [172.22.102.106]
x-kse-serverinfo: RTEXMBS02.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: multipart/mixed;
	boundary="_002_e3f2aac3fe6a47079d728a6443358cc2realtekcom_"
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: RTWKTI45Z4O4YPRAEKPNBVA7YOEXNUXL
X-Message-ID-Hash: RTWKTI45Z4O4YPRAEKPNBVA7YOEXNUXL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RTWKTI45Z4O4YPRAEKPNBVA7YOEXNUXL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--_002_e3f2aac3fe6a47079d728a6443358cc2realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Two speakers platform will common use same function.
So, attach patch was an update.

BR,
Kailang

--_002_e3f2aac3fe6a47079d728a6443358cc2realtekcom_
Content-Type: application/octet-stream;
	name="0000-two-speaker-platform.patch"
Content-Description: 0000-two-speaker-platform.patch
Content-Disposition: attachment; filename="0000-two-speaker-platform.patch";
	size=1162; creation-date="Tue, 12 Sep 2023 07:38:33 GMT";
	modification-date="Tue, 12 Sep 2023 07:51:32 GMT"
Content-Transfer-Encoding: base64

RnJvbSA4NjY5NjZkYzQ2MDU3YzJkNzk4Y2VlZjZhMzM1Zjk1YmVjZDQ4ZDRjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFR1ZSwgMTIgU2VwIDIwMjMgMTU6MzE6NDkgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIEZpeGVkIHR3byBzcGVha2VyIHBsYXRmb3JtCgpJZiBzeXN0ZW0gaGFz
IHR3byBzcGVha2VycyBhbmQgb25lIGNvbm5lY3QgdG8gMHgxNCBwaW4sIHVzZSB0aGlzIGZ1bmN0
aW9uIHdpbGwgZGlzYWJsZSBpdC4KCkZpeGVzOmU0MzI1MmRiN2UyMCAoIkFMU0E6IGhkYS9yZWFs
dGVrIC0gQUxDMjg3IEkyUyBzcGVha2VyIHBsYXRmb3JtIHN1cHBvcnQiKQpTaWduZWQtb2ZmLWJ5
OiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CgpkaWZmIC0tZ2l0IGEvc291bmQv
cGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwpp
bmRleCBiN2U3OGJmY2ZmZDguLjg4N2MxYjE2Mzg2NSAxMDA2NDQKLS0tIGEvc291bmQvcGNpL2hk
YS9wYXRjaF9yZWFsdGVrLmMKKysrIGIvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKQEAg
LTcwNzMsOCArNzA3MywxMCBAQCBzdGF0aWMgdm9pZCBhbGMyODdfZml4dXBfYmluZF9kYWNzKHN0
cnVjdCBoZGFfY29kZWMgKmNvZGVjLAogCXNuZF9oZGFfb3ZlcnJpZGVfY29ubl9saXN0KGNvZGVj
LCAweDE3LCBBUlJBWV9TSVpFKGNvbm4pLCBjb25uKTsKIAlzcGVjLT5nZW4ucHJlZmVycmVkX2Rh
Y3MgPSBwcmVmZXJyZWRfcGFpcnM7CiAJc3BlYy0+Z2VuLmF1dG9fbXV0ZV92aWFfYW1wID0gMTsK
LQlzbmRfaGRhX2NvZGVjX3dyaXRlX2NhY2hlKGNvZGVjLCAweDE0LCAwLCBBQ19WRVJCX1NFVF9Q
SU5fV0lER0VUX0NPTlRST0wsCi0JCQkgICAgMHgwKTsgLyogTWFrZSBzdXJlIDB4MTQgd2FzIGRp
c2FibGUgKi8KKwlpZiAoc3BlYy0+Z2VuLmF1dG9jZmcuc3BlYWtlcl9waW5zWzBdICE9IDB4MTQp
IHsKKwkJc25kX2hkYV9jb2RlY193cml0ZV9jYWNoZShjb2RlYywgMHgxNCwgMCwgQUNfVkVSQl9T
RVRfUElOX1dJREdFVF9DT05UUk9MLAorCQkJCQkweDApOyAvKiBNYWtlIHN1cmUgMHgxNCB3YXMg
ZGlzYWJsZSAqLworCX0KIH0KIAogCg==

--_002_e3f2aac3fe6a47079d728a6443358cc2realtekcom_--
