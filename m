Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEB4AEB8D2
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jun 2025 15:25:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 025D8602A5;
	Fri, 27 Jun 2025 15:25:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 025D8602A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751030716;
	bh=+TrzRqY8Il58dJlkG29xL5A4Fei8LD6arpxPpEexjTs=;
	h=From:To:Cc:Subject:Date:References:List-Id:List-Archive:List-Help:
	 List-Owner:List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gfUuo/kSIuZ2J9buyOK78G99/ymsAluc8W3sheCwtnA6tvKtFc9TEo8ihnD6iuYDA
	 k10IA6Wa+sxxztj21xWXrYdIhucoMm676nQz5LYqh9L/0lQ5KOBMu5L8aXEzI51Exh
	 PGJUvX9VJASTFSseHQyArpwolmUVwstZW0g3QRE8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF786F806B1; Fri, 27 Jun 2025 15:23:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 778F7F806B2;
	Fri, 27 Jun 2025 15:23:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BB55F80424; Mon, 23 Jun 2025 03:31:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 30E5DF800BF
	for <alsa-devel@alsa-project.org>; Mon, 23 Jun 2025 03:31:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30E5DF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256
 header.s=mail20170921 header.b=ro4Nb4Zk
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20250623013057epoutp03d6381912a8e6049f4047cc63a1bb167a~Lh9uqxjCF2528425284epoutp035
	for <alsa-devel@alsa-project.org>; Mon, 23 Jun 2025 01:30:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20250623013057epoutp03d6381912a8e6049f4047cc63a1bb167a~Lh9uqxjCF2528425284epoutp035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750642257;
	bh=Mr77qdFB5tfV8JMgy5odu5kOV600fnLVmwMR1Oacz00=;
	h=From:To:Cc:Subject:Date:References:From;
	b=ro4Nb4ZkT9+ab+MBrLRwU0xzENlDHete9esuHgd824yPLKqhelDds3Zt1SV5BR1CQ
	 dRgmt+shvcCi9jwCG3AtGPzE4N4mM43EmUceoMm/o39QWJKRroGH4Qdqo99mbLz4R+
	 IIT1GzLV0XHELcYmq+vyjAoESsTWc96l8wtl3Lr4=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250623013057epcas2p27e0e6f06ef8a29ec5e729fc807afc6fb~Lh9uC3XEl1683916839epcas2p2n;
	Mon, 23 Jun 2025 01:30:57 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.100]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bQVsD1ZzDz3hhTC; Mon, 23 Jun
	2025 01:30:56 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250623013055epcas2p15c17e1f34632e868cd504380d147490d~Lh9sh9qYo1524415244epcas2p1b;
	Mon, 23 Jun 2025 01:30:55 +0000 (GMT)
Received: from KORCO117793 (unknown [12.36.188.221]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250623013055epsmtip25fb5f985a1455d7e584e8c4b38d15be0~Lh9seXYb62694126941epsmtip2F;
	Mon, 23 Jun 2025 01:30:55 +0000 (GMT)
From: =?ks_c_5601-1987?B?wMy9wrrz?= <seungbin.lee@samsung.com>
To: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<gregkh@linuxfoundation.org>, <pierre-louis.bossart@linux.intel.com>,
	<perex@perex.cz>, <tiwai@suse.de>
Cc: <pilsun.jang@samsung.com>, <s47.kang@samsung.com>,
	<donghee.moon@samsung.com>
Subject: FW: [PATCH] ASoC: soc-compress: Fix race condition in
 soc_compr_open_fe
Date: Mon, 23 Jun 2025 10:30:55 +0900
Message-ID: <000601dbe3de$76d88db0$6489a910$@samsung.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: Advj3mr08xRpmMsJSo27IdBrP6wTfw==
Content-Language: ko
X-CMS-MailID: 20250623013055epcas2p15c17e1f34632e868cd504380d147490d
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250623013055epcas2p15c17e1f34632e868cd504380d147490d
References: 
 <CGME20250623013055epcas2p15c17e1f34632e868cd504380d147490d@epcas2p1.samsung.com>
X-MailFrom: seungbin.lee@samsung.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4FQS5B6HL2KHPOC2OVV3VZB7XNHIDYLZ
X-Message-ID-Hash: 4FQS5B6HL2KHPOC2OVV3VZB7XNHIDYLZ
X-Mailman-Approved-At: Fri, 27 Jun 2025 13:23:20 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="ks_c_5601-1987"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4FQS5B6HL2KHPOC2OVV3VZB7XNHIDYLZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

QWRkIHJlY2lwaWVudCBhZGRpdGlvbiBhbmQgbW9kaWZpY2F0aW9uIHBhdGNoIHRvIHRoZSBib2R5
IG9mIHRoZQ0KdHJhbnNtaXNzaW9uLg0KDQogDQoNCkZyb206IMDMvcK68yA8c2V1bmdiaW4ubGVl
QHNhbXN1bmcuY29tIDxtYWlsdG86c2V1bmdiaW4ubGVlQHNhbXN1bmcuY29tPiA+IA0KU2VudDog
VGh1cnNkYXksIEp1bmUgMTksIDIwMjUgMTA6MjUgQU0NClRvOiAndGl3YWlAc3VzZS5kZScgPHRp
d2FpQHN1c2UuZGUgPG1haWx0bzp0aXdhaUBzdXNlLmRlPiA+DQpTdWJqZWN0OiBbUEFUQ0hdIEFT
b0M6IHNvYy1jb21wcmVzczogRml4IHJhY2UgY29uZGl0aW9uIGluIHNvY19jb21wcl9vcGVuX2Zl
DQoNCiANCg0KSGkNCg0KIA0KDQpJIGFtIHNlbmRpbmcgdGhpcyBlbWFpbCB0byByZXBvcnQgYW4g
aXNzdWUgZm91bmQgaW4gc291bmQvc29jL3NvYy0NCmNvbXByZXNzLmMuDQoNCiANCg0KU2NlbmFy
aW86IFBsYXlpbmcgYSBtaXggb2YgTVAzIGFuZCBXQVYgZmlsZXMgcmVwZWF0ZWRseSBmcm9tIFlv
dVR1YmUgTXVzaWMNCmJ5IHByZXNzaW5nICJuZXh0Ii4NCg0KIA0KDQpJc3N1ZSBvY2N1cnMgd2hl
biBzbmRfc29jX2RwY21fcnVudGltZV91cGRhdGUgaXMgY2FsbGVkIGFuZA0Kc29jX2NvbXByX3Ry
aWdnZXJfZmUgaXMgaW52b2tlZCwgY2F1c2luZyB0aGUgdmFsdWUgb2YgobBmZS0NCj5kcGNtW3N0
cmVhbV0ucnVudGltZV91cGRhdGWhsSB0byBjaGFuZ2UgbWlkLXByb2Nlc3MuIFRoaXMgcmVzdWx0
cyBpbiBhDQpwcm9ibGVtIHdoZXJlLCBkdXJpbmcgdGhlIGNsb3Npbmcgb2YgdGhlIEJFIGNvbm5l
Y3RlZCB0byB0aGUgRkUgaW4NCnNuZF9zb2NfZHBjbV9ydW50aW1lX3VwZGF0ZSwgb25seSB0aGUg
ZW50cnkgaXMgcmVtb3ZlZCBmcm9tIHRoZSBsaXN0DQp3aXRob3V0IGFjdHVhbGx5IGJlaW5nIGNs
b3NlZC4NCg0KIA0KDQpUaGUgYXR0YWNoZWQgcGF0Y2ggcmVzb2x2ZXMgdGhpcyBpc3N1ZSBhcyBj
b25maXJtZWQgdGhyb3VnaCB0ZXN0aW5nLg0KDQogDQoNCkFkZGl0aW9uYWxseSwgd2hpbGUgcGVy
Zm9ybWluZyBEUENNIHJlbGF0ZWQgb3BlcmF0aW9ucyBpbiBzb2MtY29tcHJlc3MuYywNCnNuZF9z
b2NfZHBjbV9tdXRleF9sb2NrIGlzIHVzZWQ7IGhvd2V2ZXIsIHNvY19jb21wcl90cmlnZ2VyX2Zl
IGRvZXMgbm90DQpoYXZlIHRoaXMgbG9jay4gUGxlYXNlIHJldmlldyB0aGUgYXR0YWNoZWQgcGF0
Y2ggcmVnYXJkaW5nIHRoaXMgbWF0dGVyLg0KDQogDQoNClRoYW5rIHlvdS4NCg0KIA0KDQpGcm9t
IDcyYTAzNDBiZjdkY2NjNmY1M2RjMmQwMmUwNGJiM2Y4OTRkNzk2ZTMgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxDQoNCkZyb206IFNldW5nYmluIExlZSA8c2V1bmdiaW4ubGVlQHNhbXN1bmcuY29t
DQo8bWFpbHRvOnNldW5nYmluLmxlZUBzYW1zdW5nLmNvbT4gPg0KDQpEYXRlOiBXZWQsIDE4IEp1
biAyMDI1IDEzOjMzOjAyICswOTAwDQoNClN1YmplY3Q6IFtQQVRDSF0gQVNvQzogc29jLWNvbXBy
ZXNzOiBGaXggcmFjZSBjb25kaXRpb24gaW4gc29jX2NvbXByX29wZW5fZmUNCg0KIA0KDQpJZiB0
aGUgc29jX2NvbXByX3RyaWdnZXJfZmUgZnVuY3Rpb24gaXMgY2FsbGVkIGR1cmluZw0Kc25kX3Nv
Y19kcGNtX3J1bnRpbWVfdXBkYXRlIGV4ZWN1dGlvbiwNCg0KdGhlIEZFJ3MgRFBDTSBydW50aW1l
IHVwZGF0ZSB2YXJpYWJsZSBtYXkgYmUgY2hhbmdlZC4NCg0KVGhlbiB0aGUgQkUgbGlzdCBjb25u
ZWN0ZWQgdG8gdGhlIEZFIGZsaWVzIGF3YXksIGFuZCB0aGUgQkUgY2Fubm90IGJlDQpjbG9zZWQu
DQoNCiANCg0KVGhpcyBuZWVkcyB0byBiZSBwcm90ZWN0ZWQgYnkgdGhlIHNuZF9zb2NfZHBjbV9t
dXRleF9sb2NrLg0KDQogDQoNCkNoYW5nZS1JZDogSWJmZDE3MTJlNmJhZjQxYTMwYWZhMzU3YTkx
YWRhODNkMjA1Zjk2OGINCg0KU2lnbmVkLW9mZi1ieTogU2V1bmdiaW4gTGVlIDxzZXVuZ2Jpbi5s
ZWVAc2Ftc3VuZy5jb20NCjxtYWlsdG86c2V1bmdiaW4ubGVlQHNhbXN1bmcuY29tPiA+DQoNCi0t
LQ0KDQpzb3VuZC9zb2Mvc29jLWNvbXByZXNzLmMgfCA0ICsrKysNCg0KMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKQ0KDQogDQoNCmRpZmYgLS1naXQgYS9zb3VuZC9zb2Mvc29jLWNvbXBy
ZXNzLmMgYi9zb3VuZC9zb2Mvc29jLWNvbXByZXNzLmMNCg0KaW5kZXggZmM4ZGI1NDM1MjU0MS4u
MWEyYTNmZTZhMjM0MCAxMDA2NDQNCg0KLS0tIGEvc291bmQvc29jL3NvYy1jb21wcmVzcy5jDQoN
CisrKyBiL3NvdW5kL3NvYy9zb2MtY29tcHJlc3MuYw0KDQpAQCAtMjg2LDYgKzI4Niw4IEBAIHN0
YXRpYyBpbnQgc29jX2NvbXByX3RyaWdnZXJfZmUoc3RydWN0IHNuZF9jb21wcl9zdHJlYW0NCipj
c3RyZWFtLCBpbnQgY21kKQ0KDQogDQoNCiAgICAgICAgICAgc25kX3NvY19jYXJkX211dGV4X2xv
Y2soZmUtPmNhcmQpOw0KDQogDQoNCisgICAgICAgICBzbmRfc29jX2RwY21fbXV0ZXhfbG9jayhm
ZSk7DQoNCisNCg0KICAgICAgICAgIHJldCA9IHNuZF9zb2NfZGFpX2NvbXByX3RyaWdnZXIoY3B1
X2RhaSwgY3N0cmVhbSwgY21kKTsNCg0KICAgICAgICAgIGlmIChyZXQgPCAwKQ0KDQogICAgICAg
ICAgICAgICAgICAgIGdvdG8gb3V0Ow0KDQpAQCAtMzE1LDYgKzMxNyw4IEBAIHN0YXRpYyBpbnQg
c29jX2NvbXByX3RyaWdnZXJfZmUoc3RydWN0IHNuZF9jb21wcl9zdHJlYW0NCipjc3RyZWFtLCBp
bnQgY21kKQ0KDQogDQoNCiBvdXQ6DQoNCiAgICAgICAgICBmZS0+ZHBjbVtzdHJlYW1dLnJ1bnRp
bWVfdXBkYXRlID0gU05EX1NPQ19EUENNX1VQREFURV9OTzsNCg0KKyAgICAgICAgIHNuZF9zb2Nf
ZHBjbV9tdXRleF91bmxvY2soZmUpOw0KDQorDQoNCiAgICAgICAgICBzbmRfc29jX2NhcmRfbXV0
ZXhfdW5sb2NrKGZlLT5jYXJkKTsNCg0KICAgICAgICAgIHJldHVybiByZXQ7DQoNCn0NCg0KLS0g
DQoNCjIuMzQuMQ0KDQogDQoNCg==
