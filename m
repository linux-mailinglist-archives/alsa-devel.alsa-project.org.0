Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B24C02A3E3E
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 09:01:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53CF917F5;
	Tue,  3 Nov 2020 09:00:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53CF917F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604390495;
	bh=0QBSEOMZBWHt6e5tK2HT31+z/BJjLgKUQg5qu0chQ6Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JW7i6u1TQASXWqZwRQgVyK509g73CH/fKWLqNQGEtBGMUpYA2KS9W/b7N45mroL57
	 dwgKgRgNn35quC0QGUDBW9Fx8qq9hYCNrIq6CVwJ8MzQffSl5Mi4OnkpEI2E9o9GzP
	 JwJW8vBFNIlWSQWhu81WpCGSXumo08R+T5j5WvBs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBB3BF8015A;
	Tue,  3 Nov 2020 09:00:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50D42F804B4; Tue,  3 Nov 2020 08:59:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_BASE64_TEXT,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by alsa1.perex.cz (Postfix) with ESMTP id 2B86EF80108
 for <alsa-devel@alsa-project.org>; Tue,  3 Nov 2020 08:59:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B86EF80108
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="J2pwWnbe"
X-UUID: b06df6bec48b485686bd0572ade9a640-20201103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=0QBSEOMZBWHt6e5tK2HT31+z/BJjLgKUQg5qu0chQ6Q=; 
 b=J2pwWnbenV6tkSKAcpwga2IFdve5wPBz/3AMbBvaOBl2mAb+ACZyTo+CyCXWSXCct2E/VmGNKwkyrhYFSXmkRlewMSYaIIo3pxoo2FRMbsW1VzBlskiv/bpO1MXVRibUImyBPG1jEKGEDs1W+jHo4mzpHZ2MHPdQ2jq72gAPfIo=;
X-UUID: b06df6bec48b485686bd0572ade9a640-20201103
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 787465698; Tue, 03 Nov 2020 15:59:43 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 Nov 2020 15:59:41 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 3 Nov 2020 15:59:40 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <p.zabel@pengutronix.de>, <tzungbi@google.com>,
 <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v4 0/9] ASoC: Mediatek: Add support for MT8192 SoC
Date: Tue, 3 Nov 2020 15:59:29 +0800
Message-ID: <1604390378-23993-1-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Content-Transfer-Encoding: base64
Cc: shane.chien@mediatek.com, Bicycle.Tsai@mediatek.com,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Trevor.Wu@mediatek.com,
 kuninori.morimoto.gx@renesas.com
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

VGhpcyBzZXJpZXMgb2YgcGF0Y2hlcyBhZGRzIHN1cHBvcnQgZm9yIE1lZGlhdGVrIEFGRSBmb3Ig
TVQ4MTkyIFNvQy4gQXQgdGhlIHNhbWUNCnRpbWUsIHRoZSBjYWxpYnJhdGlvbiBmdW5jdGlvbiBv
ZiBNVDYzNTkgaXMgY29tcGxldGVkIHdpdGggcmVhbCBtYWNoaW5lIGRyaXZlci4NClRoZSBwYXRj
aCBpcyBiYXNlZCBvbiBicm9vbmllIHRyZWUgImZvci1uZXh0IiBicmFuY2guDQoNCkNoYW5nZSBz
aW5jZSB2MzoNCiAgLSB1c2Ugbm9ybWFsIGNvbmRpdGlvbmFsIHN0YXRlbWVudHMgdG8gaW1wcm92
ZSBsZWdpYmxpdHkgaW4gW3YzLDMvOV0NCiAgLSByZW1vdmUgbXRrX2kyc19oZF9lbl9ldmVudCBh
cyB0aGVyZSdzIHRyYWNlIGluIHRoZSBjb3JlDQogIC0gaW1wb3ZlIG10ODE5Ml9pMnNfZW51bSBh
bmQgbXQ4MTkyX2FkZGFfZW51bQ0KDQpDaGFuZ2Ugc2luY2UgdjI6DQogIC0gc3BsaXQgdGhlIGRh
aSBkcml2ZXIgZmlsZXMgYXMgYSBzZXBhcmF0ZSBwYXRjaA0KICAtIGZpeCBkdC1iaW5kaW5ncyB0
byBHUEwtMi4wLW9ubHkgTGljZW5zZQ0KICAtIHJlbW92ZSB1bm5lY2Vzc2FyeSBwcmVwZXJ0eSBk
ZXNjcmlwdGlvbnMgc3VjaCBhcyAnbWF4SXRlbXMnDQoNCkNoYW5nZSBzaW5jZSB2MToNCiAgLSBm
aXhlZCBzb21lIHR5cG9zIHJlbGF0ZWQgdG8gZHQtYmluZGluZ3MgaW4gW3YxLDMvNV0gYW5kIFt2
MSw1LzVdDQogIC0gYWRkIHZlbmRvciBwcmVmaXggdG8gdGhlIHByb3BlcnRpZXMsIHN1Y2ggYXMg
Im1lZGlhdGVrLGFwbWl4ZWRzeXMiDQogIC0gYWRkIGEgZGVwZW5kZW5jeSBkZXNjcmlwdGlvbiB0
byBpbmRpY2F0ZSB0aGUgcmVxdWlyZWQgaGVhZGVyIGZpbGVzDQoNCkppYXhpbiBZdSAoOSk6DQog
IEFTb0M6IG1lZGlhdGVrOiBtdDYzNTk6IGFkZCB0aGUgY2FsaWJyYXRpb24gZnVuY3Rpb25zDQog
IEFTb0M6IG1lZGlhdGVrOiBtdDgxOTI6IGFkZCBwbGF0Zm9ybSBkcml2ZXINCiAgQVNvQzogbWVk
aWF0ZWs6IG10ODE5Mjogc3VwcG9ydCBpMnMgaW4gcGxhdGZvcm0gZHJpdmVyDQogIEFTb0M6IG1l
ZGlhdGVrOiBtdDgxOTI6IHN1cHBvcnQgYWRkYSBpbiBwbGF0Zm9ybSBkcml2ZXINCiAgQVNvQzog
bWVkaWF0ZWs6IG10ODE5Mjogc3VwcG9ydCBwY20gaW4gcGxhdGZvcm0gZHJpdmVyDQogIEFTb0M6
IG1lZGlhdGVrOiBtdDgxOTI6IHN1cHBvcnQgdGRtIGluIHBsYXRmb3JtIGRyaXZlcg0KICBkdC1i
aW5kaW5nczogbWVkaWF0ZWs6IG10ODE5MjogYWRkIGF1ZGlvIGFmZSBkb2N1bWVudA0KICBBU29D
OiBtZWRpYXRlazogbXQ4MTkyOiBhZGQgbWFjaGluZSBkcml2ZXIgd2l0aCBtdDYzNTksIHJ0MTAx
NSBhbmQNCiAgICBydDU2ODINCiAgZHQtYmluZGluZ3M6IG1lZGlhdGVrOiBtdDgxOTI6IGFkZCBt
dDgxOTItbXQ2MzU4LXJ0MTAxNS1ydDU2ODINCiAgICBkb2N1bWVudA0KDQogLi4uL2JpbmRpbmdz
L3NvdW5kL210ODE5Mi1hZmUtcGNtLnlhbWwgICAgICAgIHwgIDEwMCArDQogLi4uL3NvdW5kL210
ODE5Mi1tdDYzNTktcnQxMDE1LXJ0NTY4Mi55YW1sICAgIHwgICA0MiArDQogc291bmQvc29jL2Nv
ZGVjcy9tdDYzNTkuYyAgICAgICAgICAgICAgICAgICAgIHwgIDExMCArDQogc291bmQvc29jL2Nv
ZGVjcy9tdDYzNTkuaCAgICAgICAgICAgICAgICAgICAgIHwgICAgNyArDQogc291bmQvc29jL21l
ZGlhdGVrL0tjb25maWcgICAgICAgICAgICAgICAgICAgIHwgICAyMyArDQogc291bmQvc29jL21l
ZGlhdGVrL01ha2VmaWxlICAgICAgICAgICAgICAgICAgIHwgICAgMSArDQogc291bmQvc29jL21l
ZGlhdGVrL2NvbW1vbi9tdGstYWZlLWZlLWRhaS5jICAgIHwgICAxMyArLQ0KIHNvdW5kL3NvYy9t
ZWRpYXRlay9jb21tb24vbXRrLWJhc2UtYWZlLmggICAgICB8ICAgIDEgKw0KIHNvdW5kL3NvYy9t
ZWRpYXRlay9tdDgxOTIvTWFrZWZpbGUgICAgICAgICAgICB8ICAgMTYgKw0KIHNvdW5kL3NvYy9t
ZWRpYXRlay9tdDgxOTIvbXQ4MTkyLWFmZS1jbGsuYyAgICB8ICA2NjkgKysrKw0KIHNvdW5kL3Nv
Yy9tZWRpYXRlay9tdDgxOTIvbXQ4MTkyLWFmZS1jbGsuaCAgICB8ICAyNDQgKysNCiBzb3VuZC9z
b2MvbWVkaWF0ZWsvbXQ4MTkyL210ODE5Mi1hZmUtY29tbW9uLmggfCAgMTcwICsNCiAuLi4vc29j
L21lZGlhdGVrL210ODE5Mi9tdDgxOTItYWZlLWNvbnRyb2wuYyAgfCAgMTYzICsNCiBzb3VuZC9z
b2MvbWVkaWF0ZWsvbXQ4MTkyL210ODE5Mi1hZmUtZ3Bpby5jICAgfCAgMzA2ICsrDQogc291bmQv
c29jL21lZGlhdGVrL210ODE5Mi9tdDgxOTItYWZlLWdwaW8uaCAgIHwgICAxOSArDQogc291bmQv
c29jL21lZGlhdGVrL210ODE5Mi9tdDgxOTItYWZlLXBjbS5jICAgIHwgMjM4OSArKysrKysrKysr
KysrDQogc291bmQvc29jL21lZGlhdGVrL210ODE5Mi9tdDgxOTItZGFpLWFkZGEuYyAgIHwgMTQ3
MSArKysrKysrKw0KIHNvdW5kL3NvYy9tZWRpYXRlay9tdDgxOTIvbXQ4MTkyLWRhaS1pMnMuYyAg
ICB8IDIxMTAgKysrKysrKysrKysNCiBzb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTkyL210ODE5Mi1k
YWktcGNtLmMgICAgfCAgNDA5ICsrKw0KIHNvdW5kL3NvYy9tZWRpYXRlay9tdDgxOTIvbXQ4MTky
LWRhaS10ZG0uYyAgICB8ICA3NzggKysrKw0KIC4uLi9tZWRpYXRlay9tdDgxOTIvbXQ4MTkyLWlu
dGVyY29ubmVjdGlvbi5oICB8ICAgNjUgKw0KIC4uLi9tdDgxOTIvbXQ4MTkyLW10NjM1OS1ydDEw
MTUtcnQ1NjgyLmMgICAgICB8IDEwNTggKysrKysrDQogc291bmQvc29jL21lZGlhdGVrL210ODE5
Mi9tdDgxOTItcmVnLmggICAgICAgIHwgMzEzMSArKysrKysrKysrKysrKysrKw0KIDIzIGZpbGVz
IGNoYW5nZWQsIDEzMjkxIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9tdDgxOTIt
YWZlLXBjbS55YW1sDQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9zb3VuZC9tdDgxOTItbXQ2MzU5LXJ0MTAxNS1ydDU2ODIueWFtbA0KIGNyZWF0
ZSBtb2RlIDEwMDY0NCBzb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTkyL01ha2VmaWxlDQogY3JlYXRl
IG1vZGUgMTAwNjQ0IHNvdW5kL3NvYy9tZWRpYXRlay9tdDgxOTIvbXQ4MTkyLWFmZS1jbGsuYw0K
IGNyZWF0ZSBtb2RlIDEwMDY0NCBzb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTkyL210ODE5Mi1hZmUt
Y2xrLmgNCiBjcmVhdGUgbW9kZSAxMDA2NDQgc291bmQvc29jL21lZGlhdGVrL210ODE5Mi9tdDgx
OTItYWZlLWNvbW1vbi5oDQogY3JlYXRlIG1vZGUgMTAwNjQ0IHNvdW5kL3NvYy9tZWRpYXRlay9t
dDgxOTIvbXQ4MTkyLWFmZS1jb250cm9sLmMNCiBjcmVhdGUgbW9kZSAxMDA2NDQgc291bmQvc29j
L21lZGlhdGVrL210ODE5Mi9tdDgxOTItYWZlLWdwaW8uYw0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBz
b3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTkyL210ODE5Mi1hZmUtZ3Bpby5oDQogY3JlYXRlIG1vZGUg
MTAwNjQ0IHNvdW5kL3NvYy9tZWRpYXRlay9tdDgxOTIvbXQ4MTkyLWFmZS1wY20uYw0KIGNyZWF0
ZSBtb2RlIDEwMDY0NCBzb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTkyL210ODE5Mi1kYWktYWRkYS5j
DQogY3JlYXRlIG1vZGUgMTAwNjQ0IHNvdW5kL3NvYy9tZWRpYXRlay9tdDgxOTIvbXQ4MTkyLWRh
aS1pMnMuYw0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBzb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTkyL210
ODE5Mi1kYWktcGNtLmMNCiBjcmVhdGUgbW9kZSAxMDA2NDQgc291bmQvc29jL21lZGlhdGVrL210
ODE5Mi9tdDgxOTItZGFpLXRkbS5jDQogY3JlYXRlIG1vZGUgMTAwNjQ0IHNvdW5kL3NvYy9tZWRp
YXRlay9tdDgxOTIvbXQ4MTkyLWludGVyY29ubmVjdGlvbi5oDQogY3JlYXRlIG1vZGUgMTAwNjQ0
IHNvdW5kL3NvYy9tZWRpYXRlay9tdDgxOTIvbXQ4MTkyLW10NjM1OS1ydDEwMTUtcnQ1NjgyLmMN
CiBjcmVhdGUgbW9kZSAxMDA2NDQgc291bmQvc29jL21lZGlhdGVrL210ODE5Mi9tdDgxOTItcmVn
LmgNCg0KLS0gDQoyLjE4LjANCg==

