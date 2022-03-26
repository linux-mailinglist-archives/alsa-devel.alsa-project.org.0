Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A114EA93C
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Mar 2022 10:29:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09FBE17F1;
	Tue, 29 Mar 2022 10:28:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09FBE17F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648542585;
	bh=YSKQQQJZS30x9vl5zGY4uXLSlpKvtSnxYAHyiA3Xvjk=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nnJndecTW3k/0lUUnnsll5wWgUZBfv8v12P9btoQDOgE7oIj05TODPM0XnHEQ+GDT
	 rvc4WypROzwGsv22guE4wjnIh8fKFfhwCN+Mv+XjEWRr6nNhxxPPJ0vhpGypP+o1qN
	 6h+8U+elEYLEgwx6Ywv5H2WUppcWnFl0PJAPoKks=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC001F80517;
	Tue, 29 Mar 2022 10:28:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86FB7F8019D; Sat, 26 Mar 2022 05:13:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 T_KAM_HTML_FONT_INVALID, T_SCC_BODY_TEXT_LINE, URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail78-37.sinamail.sina.com.cn (mail78-37.sinamail.sina.com.cn
 [219.142.78.37])
 by alsa1.perex.cz (Postfix) with ESMTP id 42A63F800AA
 for <alsa-devel@alsa-project.org>; Sat, 26 Mar 2022 05:13:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42A63F800AA
Received: from unknown (HELO Dell)([116.232.54.164])
 by sina.net (10.75.30.235) with ESMTP
 id 623E92EB00029070; Sat, 26 Mar 2022 12:13:31 +0800 (CST)
X-Sender: zhuning@everest-semi.com
X-Auth-ID: zhuning@everest-semi.com
X-SMAIL-MID: 82B808D1E0814775A748F3EFFD2088AD
X-SMAIL-UIID: 82B808D1E0814775A748F3EFFD2088AD-20220326-121331
Date: Sat, 26 Mar 2022 12:13:31 +0800
From: "zhuning@everest-semi.com" <zhuning@everest-semi.com>
To: alsa-devel <alsa-devel@alsa-project.org>
Subject: [PATCH] ASoC: codecs: add support for ES8326 dts
X-Priority: 3
X-Has-Attach: no
X-Mailer: Foxmail 7.2.21.418[cn]
Mime-Version: 1.0
Message-ID: <2022032612133078633672@everest-semi.com>
X-Mailman-Approved-At: Tue, 29 Mar 2022 10:28:32 +0200
Content-Type: text/plain;
	charset="GB2312"
Content-Transfer-Encoding: base64
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "pierre-louis.bossart" <pierre-louis.bossart@linux.intel.com>
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

RnJvbTogeWFuZ3hpYW9odWEgPHlhbmd4aWFvaHVhQGV2ZXJlc3Qtc2VtaS5jb20+DQpTdWJqZWN0
OiBbUEFUQ0ggMS8xXSBBU29DOiBjb2RlY3M6IGFkZCBzdXBwb3J0IGZvciBFUzgzMjYgZHRzDQoN
ClRoZSBFUzgzMjYgY29kZWMgaXMgbm90IGNvbXBhdGlibGUgd2l0aCBFUzgzMTYgYW5kIHJlcXVp
cmVzIGEgZGVkaWNhdGVkIGRyaXZlci4NCg0KVGhpcyBpcyBhIHNlcGFyYXRlIHBhdGNoIGZvciBF
UzgzMjYgZHRzDQoNClNpZ25lZC1vZmYtYnk6IERhdmlkIFlhbmcgPHlhbmd4aWFvaHVhQGV2ZXJl
c3Qtc2VtaS5jb20+DQotLS0NCiAuLi4vYmluZGluZ3Mvc291bmQvZXZlcmVzdCxlczgzMjYueWFt
bCAgICAgICAgfCAxMDkgKysrKysrKysrKysrKysrKysrDQogMSBmaWxlIGNoYW5nZWQsIDEwOSBp
bnNlcnRpb25zKCspDQogY3JlYXRlIG1vZGUgMTAwNzU1IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9zb3VuZC9ldmVyZXN0LGVzODMyNi55YW1sDQoNCmRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvZXZlcmVzdCxlczgzMjYueWFtbCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9ldmVyZXN0LGVzODMyNi55
YW1sDQpuZXcgZmlsZSBtb2RlIDEwMDc1NQ0KaW5kZXggMDAwMDAwMDAwMDAwLi44Y2FlOWMzMjhk
YmMNCi0tLSAvZGV2L251bGwNCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9zb3VuZC9ldmVyZXN0LGVzODMyNi55YW1sDQpAQCAtMCwwICsxLDEwOSBAQA0KKyMgU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQ0KDQorJVlB
TUwgMS4yDQoNCistLS0NCg0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvc291
bmQvZXZlcmVzdCxlczgzMjYueWFtbCMNCg0KKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9y
Zy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KDQorDQoNCit0aXRsZTogRXZlcmVzdCBFUzgzMjYg
YXVkaW8gQ09ERUMNCg0KKw0KDQorbWFpbnRhaW5lcnM6DQoNCisgIC0gRGF2aWQgWWFuZyA8eWFu
Z3hpYW9odWFAZXZlcmVzdC1zZW1pLmNvbT4NCg0KKw0KDQorcHJvcGVydGllczoNCg0KKyAgY29t
cGF0aWJsZToNCg0KKyAgICBjb25zdDogZXZlcmVzdCxlczgzMjYNCg0KKw0KDQorICByZWc6DQoN
CisgICAgbWF4SXRlbXM6IDENCg0KKw0KDQorICBjbG9ja3M6DQoNCisgICAgaXRlbXM6DQoNCisg
ICAgICAtIGRlc2NyaXB0aW9uOiBjbG9jayBmb3IgbWFzdGVyIGNsb2NrIChNQ0xLKQ0KDQorDQoN
CisgIGNsb2NrLW5hbWVzOg0KDQorICAgIGl0ZW1zOg0KDQorICAgICAgLSBjb25zdDogbWNsaw0K
DQorDQoNCisgICIjc291bmQtZGFpLWNlbGxzIjoNCg0KKyAgICBjb25zdDogMA0KDQorDQoNCisg
IG1jbGstcmF0ZToNCg0KKyAgICBkZXNjcmlwdGlvbjoNCg0KKyAgICAgIGNsb2NrIHJhdGUgb2Yg
bWNsaw0KDQorICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQz
Mi1hcnJheQ0KDQorICAgIG1pbkl0ZW1zOiAxDQoNCisNCg0KKyAgZXZlcmVzdCxqYWNrLXBvbDoN
Cg0KKyAgICBkZXNjcmlwdGlvbjoNCg0KKyAgICAgIGp1c3QgdGhlIHZhbHVlIG9mIHJlZyA1Ny4g
Qml0KDMpIGRlY2lkZXMgd2hldGhlciB0aGUgamFjayBwb2xhcml0eSBpcyBpbnZlcnRlZC4NCg0K
KyAgICAgIEJpdCgyKSBkZWNpZGVzIHdoZXRoZXIgdGhlIGJvdHRvbSBvbiB0aGUgaGVhZHNldCBp
cyBpbnZlcnRlZC4NCg0KKyAgICAgIEJpdCgxKS8oMCkgZGVjaWRlcyB0aGUgbWljIHByb3Blcml0
eSB0byBiZSBPTVRQL0NUSUEgb3IgYXV0by4NCg0KKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55
YW1sIy9kZWZpbml0aW9ucy91aW50OC1hcnJheQ0KDQorICAgIG1pbmltdW06IDANCg0KKyAgICBt
YXhpbXVtOiAweDBmDQoNCisgICAgZGVmYXVsdDogMHgwZg0KDQorICANCg0KKyAgZXZlcmVzdCxt
aWMxLXNyYzoNCg0KKyAgICBkZXNjcmlwdGlvbjoNCg0KKyAgICAgIHRoZSB2YWx1ZSBvZiByZWcg
MkEgd2hlbiBoZWFkc2V0IHBsdWdnZWQuDQoNCisgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFt
bCMvZGVmaW5pdGlvbnMvdWludDgtYXJyYXkNCg0KKyAgICBtaW5pbXVtOiAweDAwDQoNCisgICAg
bWF4aW11bTogMHg3Nw0KDQorICAgIGRlZmF1bHQ6IDB4MjINCg0KKw0KDQorICBldmVyZXN0LG1p
YzItc3JjOg0KDQorICAgIGRlc2NyaXB0aW9uOg0KDQorICAgICAgdGhlIHZhbHVlIG9mIHJlZyAy
QSB3aGVuIGhlYWRzZXQgdW5wbHVnZ2VkLg0KDQorICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlh
bWwjL2RlZmluaXRpb25zL3VpbnQ4LWFycmF5DQoNCisgICAgbWluaW11bTogMHgwMA0KDQorICAg
IG1heGltdW06IDB4NzcNCg0KKyAgICBkZWZhdWx0OiAweDQ0DQoNCisNCg0KKyAgZXZlcmVzdCxh
bWljMS1zcmM6DQoNCisgICAgZGVzY3JpcHRpb246DQoNCisgICAgICB0aGUgdmFsdWUgb2YgcmVn
IDIzIHdoZW4gaGVhZHNldCBwbHVnZ2VkLg0KDQorICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlh
bWwjL2RlZmluaXRpb25zL3VpbnQ4LWFycmF5DQoNCisgICAgbWluaW11bTogMHgxOQ0KDQorICAg
IG1heGltdW06IDB4MjkNCg0KKyAgICBkZWZhdWx0OiAweDE5DQoNCisNCg0KKyAgZXZlcmVzdCxh
bWljMi1zcmM6DQoNCisgICAgZGVzY3JpcHRpb246DQoNCisgICAgICB0aGUgdmFsdWUgb2YgcmVn
IDIzIHdoZW4gaGVhZHNldCB1bnBsdWdnZWQuDQoNCisgICAgICBTZXQgdG8gMHgxOSBpZiBkbWlj
IHVzZWQuIFNldCB0byAweDI5IGlmIGFtaWMgdXNlZC4NCg0KKyAgICAkcmVmOiAvc2NoZW1hcy90
eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50OC1hcnJheQ0KDQorICAgIG1pbmltdW06IDB4MTkN
Cg0KKyAgICBtYXhpbXVtOiAweDI5DQoNCisgICAgZGVmYXVsdDogMHgxOQ0KDQorDQoNCisgIGV2
ZXJlc3QsamFjay1kZXRlY3QtaW52ZXJ0ZWQ6DQoNCisgICAgZGVzY3JpcHRpb246DQoNCisgICAg
ICBEZWZpbmVkIHRvIGludmVydCB0aGUgamFjayBkZXRlY3Rpb24uDQoNCisgICAgJHJlZjogL3Nj
aGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvZmxhZw0KDQorDQoNCityZXF1aXJlZDoNCg0K
KyAgLSBjb21wYXRpYmxlDQoNCisgIC0gcmVnDQoNCisgIC0gIiNzb3VuZC1kYWktY2VsbHMiDQoN
CisNCg0KKw0KDQorYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQoNCisNCg0KK2V4YW1wbGVz
Og0KDQorICAtIHwNCg0KKyAgICBpMmMwIHsNCg0KKyAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+
Ow0KDQorICAgICAgI3NpemUtY2VsbHMgPSA8MD47DQoNCisgICAgICBlczgzMjY6IGNvZGVjQDE5
IHsNCg0KKyAgICAgICAgY29tcGF0aWJsZSA9ICJldmVyZXN0LGVzODMyNiI7DQoNCisgICAgICAg
IHJlZyA9IDwweDE5PjsNCg0KKyAgICAgICAgY2xvY2tzID0gPCZjbGtzIDEwPjsNCg0KKyAgICAg
ICAgY2xvY2stbmFtZXMgPSAibWNsayI7DQoNCisgICAgICAgICNzb3VuZC1kYWktY2VsbHMgPSA8
MD47DQoNCisgICAgICAgIG1pYzEtc3JjID0gWzIyXTsNCg0KKyAgICAgICAgbWljMi1zcmMgPSBb
NDRdOw0KDQorICAgICAgICBhbWljMS1zcmMgPSBbMTldOw0KDQorICAgICAgICBhbWljMi1zcmMg
PSBbMTldOw0KDQorICAgICAgICBqYWNrLXBvbCA9IFswZV07DQoNCisgICAgICB9Ow0KDQorICAg
IH07DQoNCi0tIA0KMi4xNy4xDQoNCg==
