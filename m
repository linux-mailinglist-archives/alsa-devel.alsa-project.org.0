Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BC27BB208
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 09:12:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66E4C1DD;
	Fri,  6 Oct 2023 09:11:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66E4C1DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696576344;
	bh=rM04QNF83DbXEdI05diJhC14LTLT2iGFWHeRrD+pYoU=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qU8k6w3ry/93E/K3bfKuDqPvo+iHeJRGY74TG3oWs+ekGszCRl/f65n3s/1yoXxPd
	 T8gUuGrIe4S+M3PcpmHjM3xSsB17UVfhlLctsmAQa2VArpDnfzHVDETbGIayI9HgP5
	 MykkN1CL/nVcXpDYwOl0sYyYRrAriLmxEdbOnXpk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A05DFF80558; Fri,  6 Oct 2023 09:11:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 31020F80310;
	Fri,  6 Oct 2023 09:11:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12541F8047D; Fri,  6 Oct 2023 09:08:38 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D2337F801EB
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 09:08:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2337F801EB
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 396786IT01526042,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.92/5.92) with ESMTPS id 396786IT01526042
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Oct 2023 15:08:06 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Fri, 6 Oct 2023 15:08:06 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 6 Oct 2023 15:08:05 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::9cb8:8d5:b6b3:213b]) by
 RTEXMBS01.realtek.com.tw ([fe80::9cb8:8d5:b6b3:213b%5]) with mapi id
 15.01.2375.007; Fri, 6 Oct 2023 15:08:05 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
Subject: Intel RVP board change model
Thread-Topic: Intel RVP board change model
Thread-Index: Adn4I3n7aoo5V46ZSiu2wz08AyJNDg==
Date: Fri, 6 Oct 2023 07:08:05 +0000
Message-ID: <28112f54c0c6496f97ac845645bc0256@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
x-originating-ip: [172.22.102.106]
x-kse-serverinfo: RTEXDAG01.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: multipart/mixed;
	boundary="_002_28112f54c0c6496f97ac845645bc0256realtekcom_"
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: J42VEQMMZCZ5XHKWUJI55YEYWI25Y25V
X-Message-ID-Hash: J42VEQMMZCZ5XHKWUJI55YEYWI25Y25V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J42VEQMMZCZ5XHKWUJI55YEYWI25Y25V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--_002_28112f54c0c6496f97ac845645bc0256realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Intel RVP board has lose headset Mic issue via reboot state.
Attach patch will solve it.

BR,
Kailang

--_002_28112f54c0c6496f97ac845645bc0256realtekcom_
Content-Type: application/octet-stream; name="0000-Intel-rvp-board.patch"
Content-Description: 0000-Intel-rvp-board.patch
Content-Disposition: attachment; filename="0000-Intel-rvp-board.patch";
	size=2042; creation-date="Tue, 03 Oct 2023 08:57:57 GMT";
	modification-date="Fri, 06 Oct 2023 07:04:30 GMT"
Content-Transfer-Encoding: base64

RnJvbSAxMWUwNzI4ZTE2NmRkZGQ5YzU3OWQ3M2U2OGI5YWZjYzJjYzUyMTZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IEZyaSwgNiBPY3QgMjAyMyAxNDo0NzozNyArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIEFMU0E6
IGhkYS9yZWFsdGVrOiBDaGFuZ2UgbW9kZWwgZm9yIEludGVsIFJWUCBib2FyZAoKSW50ZWwgUlZQ
IGJvYXJkICgweDEyY2MpIGhhcyBIZWFkc2V0IE1pYyBpc3N1ZSBmb3IgcmVib290LgpJZiBzeXN0
ZW0gcGx1Z2dlZCBoZWFkc2V0IHdoZW4gc3lzdGVtIHJlYm9vdCB0aGUgaGVhZHNldCBNaWMgd2Fz
IGdvbmUuCgpGaXhlczoxYTkzZjEwYzViMTIgKCJBTFNBOiBoZGEvcmVhbHRlazogQWRkICJJbnRl
bCBSZWZlcmVuY2UgYm9hcmQiIGFuZCAiTlVDIDEzIiBTU0lEIGluIHRoZSBBTEMyNTYiKQpTaWdu
ZWQtb2ZmLWJ5OiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CmRpZmYgLS1naXQg
YS9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYyBiL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVh
bHRlay5jCmluZGV4IDc1MTc4M2YzYTE1Yy4uZGRjYjI2ZmQ4NjEyIDEwMDY0NAotLS0gYS9zb3Vu
ZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYworKysgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0
ZWsuYwpAQCAtOTg1NCw3ICs5ODU0LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfcGNpX3F1
aXJrIGFsYzI2OV9maXh1cF90YmxbXSA9IHsKIAlTTkRfUENJX1FVSVJLKDB4MTBlYywgMHgxMjRj
LCAiSW50ZWwgUmVmZXJlbmNlIGJvYXJkIiwgQUxDMjk1X0ZJWFVQX0NIUk9NRV9CT09LKSwKIAlT
TkRfUENJX1FVSVJLKDB4MTBlYywgMHgxMjUyLCAiSW50ZWwgUmVmZXJlbmNlIGJvYXJkIiwgQUxD
Mjk1X0ZJWFVQX0NIUk9NRV9CT09LKSwKIAlTTkRfUENJX1FVSVJLKDB4MTBlYywgMHgxMjU0LCAi
SW50ZWwgUmVmZXJlbmNlIGJvYXJkIiwgQUxDMjk1X0ZJWFVQX0NIUk9NRV9CT09LKSwKLQlTTkRf
UENJX1FVSVJLKDB4MTBlYywgMHgxMmNjLCAiSW50ZWwgUmVmZXJlbmNlIGJvYXJkIiwgQUxDMjI1
X0ZJWFVQX0hFQURTRVRfSkFDSyksCisJU05EX1BDSV9RVUlSSygweDEwZWMsIDB4MTJjYywgIklu
dGVsIFJlZmVyZW5jZSBib2FyZCIsIEFMQzI5NV9GSVhVUF9DSFJPTUVfQk9PSyksCiAJU05EX1BD
SV9RVUlSSygweDEwZjcsIDB4ODMzOCwgIlBhbmFzb25pYyBDRi1TWjYiLCBBTEMyNjlfRklYVVBf
SEVBRFNFVF9NT0RFKSwKIAlTTkRfUENJX1FVSVJLKDB4MTQ0ZCwgMHhjMTA5LCAiU2Ftc3VuZyBB
dGl2IGJvb2sgOSAoTlA5MDBYM0cpIiwgQUxDMjY5X0ZJWFVQX0lOVl9ETUlDKSwKIAlTTkRfUENJ
X1FVSVJLKDB4MTQ0ZCwgMHhjMTY5LCAiU2Ftc3VuZyBOb3RlYm9vayA5IFBlbiAoTlA5MzBTQkUt
SzAxVVMpIiwgQUxDMjk4X0ZJWFVQX1NBTVNVTkdfQU1QKSwKQEAgLTEwMDkxLDcgKzEwMDkxLDcg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfcGNpX3F1aXJrIGFsYzI2OV9maXh1cF90YmxbXSA9
IHsKIAlTTkRfUENJX1FVSVJLKDB4ODA4NiwgMHgyMDc0LCAiSW50ZWwgTlVDIDgiLCBBTEMyMzNf
RklYVVBfSU5URUxfTlVDOF9ETUlDKSwKIAlTTkRfUENJX1FVSVJLKDB4ODA4NiwgMHgyMDgwLCAi
SW50ZWwgTlVDIDggUnVnZ2VkIiwgQUxDMjU2X0ZJWFVQX0lOVEVMX05VQzhfUlVHR0VEKSwKIAlT
TkRfUENJX1FVSVJLKDB4ODA4NiwgMHgyMDgxLCAiSW50ZWwgTlVDIDEwIiwgQUxDMjU2X0ZJWFVQ
X0lOVEVMX05VQzEwKSwKLQlTTkRfUENJX1FVSVJLKDB4ODA4NiwgMHgzMDM4LCAiSW50ZWwgTlVD
IDEzIiwgQUxDMjI1X0ZJWFVQX0hFQURTRVRfSkFDSyksCisJU05EX1BDSV9RVUlSSygweDgwODYs
IDB4MzAzOCwgIkludGVsIE5VQyAxMyIsIEFMQzI5NV9GSVhVUF9DSFJPTUVfQk9PSyksCiAJU05E
X1BDSV9RVUlSSygweGYxMTEsIDB4MDAwMSwgIkZyYW1ld29yayBMYXB0b3AiLCBBTEMyOTVfRklY
VVBfRlJBTUVXT1JLX0xBUFRPUF9NSUNfTk9fUFJFU0VOQ0UpLAogCiAjaWYgMAo=

--_002_28112f54c0c6496f97ac845645bc0256realtekcom_--
