Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5E34E4F9B
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Mar 2022 10:42:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FE351712;
	Wed, 23 Mar 2022 10:41:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FE351712
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648028541;
	bh=qBR3SvNcrZcljVM2Y6i1gpDt4x5uLToTdLMrmKaC1mE=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=njB2WK74SvI7iAa6YFPf5WqpQCWFk1BK/7DuRcaOS46s5ige4lriXnKB6ZTGdpX2A
	 HjuZ+zCS9myqQ5BWYKhNSsdS1kWlPO2PhHIA37nfS4L19JdneLSNOFkfLcBZFn7Rya
	 gUxSR88LIGff7Qso1CXLeFIWX4SHx+wq1Sw5swKU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC8A9F800AA;
	Wed, 23 Mar 2022 10:41:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4D42F802DB; Wed, 23 Mar 2022 10:41:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3340F800C1
 for <alsa-devel@alsa-project.org>; Wed, 23 Mar 2022 10:41:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3340F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="TkFjCdL/"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22N9f1Sn074507;
 Wed, 23 Mar 2022 04:41:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1648028461;
 bh=qBR3SvNcrZcljVM2Y6i1gpDt4x5uLToTdLMrmKaC1mE=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=TkFjCdL/Q2OA4OqWxt7VRK+7mszQA5AGgq0GP2He2pV0FaS/GRWZjb/PP1Mizuo57
 10vzDXGTEuk5hz4REuL+LcIUBwGVn1QsbNiOw0ZC1dlWqldgmEW4Lz3zsQyrzc7ezs
 xQCtrP2+9eYctBiY5QFca52b/IfEeFzz0z6blylI=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22N9f1lk050226
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 23 Mar 2022 04:41:01 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 23
 Mar 2022 04:41:01 -0500
Received: from DFLE107.ent.ti.com ([fe80::86f:14f0:164b:4dbe]) by
 DFLE107.ent.ti.com ([fe80::86f:14f0:164b:4dbe%17]) with mapi id
 15.01.2308.014; Wed, 23 Mar 2022 04:41:01 -0500
From: "Xu, Yang" <raphael-xu@ti.com>
To: =?utf-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>, Raphael-Xu <13691752556@139.com>,
 "broonie@kernel.org" <broonie@kernel.org>
Subject: RE: [EXTERNAL] Re: [PATCH v4 3/3] update tas27xx.h to support either
 TAS2764 or TAS2780
Thread-Topic: [EXTERNAL] Re: [PATCH v4 3/3] update tas27xx.h to support either
 TAS2764 or TAS2780
Thread-Index: AQHYPpASkoi1PLN6r0WeCLqV8PHzqKzMshTg
Date: Wed, 23 Mar 2022 09:41:01 +0000
Message-ID: <f4ae130bbdde4bf8842b23f3cb3c10b2@ti.com>
References: <20220323042644.635-1-13691752556@139.com>
 <20220323042644.635-3-13691752556@139.com>
 <f96222e2-dd66-45aa-7615-7fed99479da6@linux.intel.com>
In-Reply-To: <f96222e2-dd66-45aa-7615-7fed99479da6@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.85.136.126]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Ding,
 Shenghao" <shenghao-ding@ti.com>, "Navada Kanyana, Mukund" <navada@ti.com>
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

SGkgU2xhd2luc2tpLA0KDQpUaGFua3MgZm9yIHlvdXIgZmVlZGJhY2suSGVyZSBpcyB0aGUgdGFy
Z2V0IHdlIHdhbnQgdG8gZG8gd2hlbiBzdWJtaXR0aW5nIGFsbCB0aGUgcGF0Y2hzOg0KMS4gcmVu
YW1lIHRhczI3NjQuYyB0byB0YXMyN3h4LmMNCjIucmVuYW1lIHRhczI3NjQuaCB0byB0YXMyN3h4
LmgNCjMudXBkYXRlIE1ha2VmaWxlDQo0LnVwZGF0ZSBLY29uZmlnDQo1LnJlbmFtZSB0YXMyNzY0
LnlhbWwgdG8gdGFzMjd4eC55YW1sDQo2LnVwZGF0ZSB0YXMyN3h4LmMgdG8gc3VwcG9ydCBlaXRo
ZXIgVEFTMjc2NCBvciBUQVMyNzgwDQo3LiB1cGRhdGUgdGFzMjd4eC5oIHRvIHN1cHBvcnQgZWl0
aGVyIFRBUzI3NjQgb3IgVEFTMjc4MA0KQXMganVzdCB0byBtYWtlIGV2ZXJ5dGhpbmcgY2xlYXIs
d2UgcGxhbiB0byBkbyBpdGVtMSB0byA1IGZpcnN0bHkuQ291bGQgeW91IGxldCB1cyBrbm93IHdo
YXQncyB5b3VyIHN1Z2dlc3Rpb24/U2hvdWxkIHdlIHN0b3AgdGhpcyBwYXRjaCByb3V0aW5nIGFu
ZCBzdGFydCBhIG5ldyBwYXRjaCBzdWJtaXQgcHJvY2Vzcz8NClJlZ2FyZGluZyBpdGVtIDYgdG8g
Nyx3ZSBjYW4gc3VibWl0IHNlcGFyYXRlIHBhdGNoIHByb2Nlc3MgYWZ0ZXIgd2UgZmluaXNoIGl0
ZW0gMSB0byA1Lg0KDQpSZWdhcmRzDQpSYXBoYWVsDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQpGcm9tOiBBbWFkZXVzeiBTxYJhd2nFhHNraSA8YW1hZGV1c3p4LnNsYXdpbnNraUBsaW51
eC5pbnRlbC5jb20+IA0KU2VudDogV2VkbmVzZGF5LCBNYXJjaCAyMywgMjAyMiA0OjI5IFBNDQpU
bzogUmFwaGFlbC1YdSA8MTM2OTE3NTI1NTZAMTM5LmNvbT47IGJyb29uaWVAa2VybmVsLm9yZw0K
Q2M6IE5hdmFkYSBLYW55YW5hLCBNdWt1bmQgPG5hdmFkYUB0aS5jb20+OyBhbHNhLWRldmVsQGFs
c2EtcHJvamVjdC5vcmc7IERpbmcsIFNoZW5naGFvIDxzaGVuZ2hhby1kaW5nQHRpLmNvbT47IFh1
LCBZYW5nIDxyYXBoYWVsLXh1QHRpLmNvbT4NClN1YmplY3Q6IFtFWFRFUk5BTF0gUmU6IFtQQVRD
SCB2NCAzLzNdIHVwZGF0ZSB0YXMyN3h4LmggdG8gc3VwcG9ydCBlaXRoZXIgVEFTMjc2NCBvciBU
QVMyNzgwDQoNCk9uIDMvMjMvMjAyMiA1OjI2IEFNLCBSYXBoYWVsLVh1IHdyb3RlOg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBSYXBoYWVsLVh1IDwxMzY5MTc1MjU1NkAxMzkuY29tPg0KPiAtLS0NCj4gICBz
b3VuZC9zb2MvY29kZWNzL3RhczI3eHguaCB8IDI3ICsrKysrKysrKysrKysrKysrKystLS0tLS0t
LQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9jb2RlY3MvdGFzMjd4eC5oIGIvc291bmQvc29j
L2NvZGVjcy90YXMyN3h4LmggDQo+IGluZGV4IDY3ZDZmZDkwM2M0Mi4uMDJiMjljMDMwZDM3IDEw
MDY0NA0KPiAtLS0gYS9zb3VuZC9zb2MvY29kZWNzL3RhczI3eHguaA0KPiArKysgYi9zb3VuZC9z
b2MvY29kZWNzL3RhczI3eHguaA0KPiBAQCAtMSwxOCArMSwyMCBAQA0KPiAgIC8qIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgKi8NCj4gICAvKg0KPiAtICogdGFzMjc2NC5o
IC0gQUxTQSBTb0MgVGV4YXMgSW5zdHJ1bWVudHMgVEFTMjc2NCBNb25vIEF1ZGlvIA0KPiBBbXBs
aWZpZXINCj4gKyAqIHRhczI3eHguaCAtIEFMU0EgU29DIFRleGFzIEluc3RydW1lbnRzIFRBUzI3
NjQvVEFTMjc4MA0KPiArICoJCU1vbm8gQXVkaW8gQW1wbGlmaWVyDQo+ICAgICoNCj4gLSAqIENv
cHlyaWdodCAoQykgMjAyMCBUZXhhcyBJbnN0cnVtZW50cyBJbmNvcnBvcmF0ZWQgLSAgDQo+IGh0
dHBzOi8vd3d3LnRpLmNvbQ0KPiArICogQ29weXJpZ2h0IChDKSAyMDIyIFRleGFzIEluc3RydW1l
bnRzIEluY29ycG9yYXRlZCAtDQo+ICsgKgkJaHR0cHM6Ly93d3cudGkuY29tDQo+ICAgICoNCj4g
LSAqIEF1dGhvcjogRGFuIE11cnBoeSA8ZG11cnBoeUB0aS5jb20+DQo+ICsgKiBBdXRob3I6DQo+
ICAgICovDQo+ICAgDQo+IC0jaWZuZGVmIF9fVEFTMjc2NF9fDQo+IC0jZGVmaW5lIF9fVEFTMjc2
NF9fDQo+ICsjaWZuZGVmIF9fVEFTMjdYWF9fSF8NCj4gKyNkZWZpbmUgX19UQVMyN1hYX19IXw0K
PiAgIA0KPiAgIC8qIEJvb2sgQ29udHJvbCBSZWdpc3RlciAqLw0KPiAtI2RlZmluZSBUQVMyNzY0
X0JPT0tDVExfUEFHRQkwDQo+IC0jZGVmaW5lIFRBUzI3NjRfQk9PS0NUTF9SRUcJMTI3DQo+ICsj
ZGVmaW5lIFRBUzI3WFhfQk9PS0NUTF9QQUdFCTANCj4gKyNkZWZpbmUgVEFTMjdYWF9CT09LQ1RM
X1JFRwkxMjcNCj4gICAjZGVmaW5lIFRBUzI3NjRfUkVHKHBhZ2UsIHJlZykJKChwYWdlICogMTI4
KSArIHJlZykNCj4gICANCj4gICAvKiBQYWdlICovDQo+IEBAIC03Nyw2ICs3OSwxMCBAQA0KPiAg
ICNkZWZpbmUgVEFTMjc2NF9URE1fQ0ZHM19SWFNfU0hJRlQJMHg0DQo+ICAgI2RlZmluZSBUQVMy
NzY0X1RETV9DRkczX01BU0sJCUdFTk1BU0soMywgMCkNCj4gICANCj4gKy8qIFRETSBDb25maWd1
cmF0aW9uIFJlZzQgKi8NCj4gKyNkZWZpbmUgVEFTMjc2NF9URE1fQ0ZHNAkJVEFTMjc2NF9SRUco
MFgwLCAweDBkKQ0KPiArI2RlZmluZSBUQVMyNzY0X1RETV9DRkc0X1RYX09GRlNFVF9NQVNLCUdF
Tk1BU0soMywgMSkNCj4gKw0KPiAgIC8qIFRETSBDb25maWd1cmF0aW9uIFJlZzUgKi8NCj4gICAj
ZGVmaW5lIFRBUzI3NjRfVERNX0NGRzUJCVRBUzI3NjRfUkVHKDBYMCwgMHgwZSkNCj4gICAjZGVm
aW5lIFRBUzI3NjRfVERNX0NGRzVfVlNOU19NQVNLCUJJVCg2KQ0KPiBAQCAtODksNCArOTUsOSBA
QA0KPiAgICNkZWZpbmUgVEFTMjc2NF9URE1fQ0ZHNl9JU05TX0VOQUJMRQlCSVQoNikNCj4gICAj
ZGVmaW5lIFRBUzI3NjRfVERNX0NGRzZfNTBfTUFTSwlHRU5NQVNLKDUsIDApDQo+ICAgDQo+IC0j
ZW5kaWYgLyogX19UQVMyNzY0X18gKi8NCj4gKy8qIElOVCZDTEsgQ0ZHICovDQo+ICsjZGVmaW5l
IFRBUzI3WFhfQ0xLX0NGRwkJCVRBUzI3NjRfUkVHKDBYMCwgMHg1YykNCj4gKyNkZWZpbmUgVEFT
MjdYWF9DTEtfQ0ZHX01BU0sJCUdFTk1BU0soNywgNikNCj4gKyNkZWZpbmUgVEFTMjdYWF9DTEtf
Q0ZHX0VOQUJMRQkJKEJJVCg3KSB8IEJJVCg2KSkNCj4gKw0KPiArI2VuZGlmIC8qIF9fVEFTMjdY
WF9fSF8gKi8NCj4gXCBObyBuZXdsaW5lIGF0IGVuZCBvZiBmaWxlDQoNCkFuZCB0aGlzIHBhdGNo
IHNob3VsZCBwcm9iYWJseSBnbyBiZWZvcmUgcGF0Y2ggMiwgb3RoZXJ3aXNlIHRoZXJlIHdpbGwg
YmUgYnVpbGQgZmFpbHVyZSBvbiBwYXRjaCAyPw0K
