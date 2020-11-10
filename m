Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 264F32AD12B
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Nov 2020 09:19:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6B7516D1;
	Tue, 10 Nov 2020 09:18:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6B7516D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604996374;
	bh=TKBOSDs5SG5iZh6CckK8QZc6kQZOfaoRrMqk9Jg2YQY=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h8V7PI0vKcYIOkyeBwO9RvDqpDns8gyQiYCgFxvjAPGC67LJ5JeVH3iWCd5qrW/yk
	 Diuwwf+IF8n1ySnOFhxoMrA1P0c+GmLGmYPkhXD8gQ6m6HVrU4yj8gUxUMBg+zmhPU
	 uTFFFVbNeA7rbjkekQccoYrYU2cRWP9rvK5GPROs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AFE3F800AE;
	Tue, 10 Nov 2020 09:18:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31EDBF801D5; Tue, 10 Nov 2020 09:17:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by alsa1.perex.cz (Postfix) with ESMTP id B1B70F80059
 for <alsa-devel@alsa-project.org>; Tue, 10 Nov 2020 09:17:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1B70F80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="TTX30iUD"
X-UUID: 5d54318515aa4cab9a44b62fe30a18ca-20201110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=TKBOSDs5SG5iZh6CckK8QZc6kQZOfaoRrMqk9Jg2YQY=; 
 b=TTX30iUD7UaD4Y7EwJahVXuwmLfxY/7qoVflQIevBV/QLbGUUdh8HF1EEfZPv04FmlPvSLpLv4lQm+pVaY8el/swO/ziFntCv7ka24hnNYo0APIV5Xu251k6GG8/xfnptZ8Oi0Rd3fRzQN3uahikA3WI6fH5+e31NmiMTZRe7dk=;
X-UUID: 5d54318515aa4cab9a44b62fe30a18ca-20201110
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1701661434; Tue, 10 Nov 2020 16:17:48 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Nov 2020 16:17:46 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 10 Nov 2020 16:17:47 +0800
Message-ID: <1604996266.2817.1.camel@mtkswgap22>
Subject: Re: [PATCH] ALSA: usb-audio: disable 96khz support for HUAWEI USB-C
 HEADSET
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Takashi Iwai <tiwai@suse.de>
Date: Tue, 10 Nov 2020 16:17:46 +0800
In-Reply-To: <s5h5z6dljf7.wl-tiwai@suse.de>
References: <1604995443-30453-1-git-send-email-macpaul.lin@mediatek.com>
 <s5h5z6dljf7.wl-tiwai@suse.de>
Content-Type: text/plain; charset="ISO-8859-1"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
Cc: alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 Christopher Swenson <swenson@swenson.io>, linux-kernel@vger.kernel.org,
 Macpaul Lin <macpaul@gmail.com>, Eddie Hung <eddie.hung@mediatek.com>,
 Takashi Iwai <tiwai@suse.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Alexander Tsoy <alexander@tsoy.me>, linux-mediatek@lists.infradead.org,
 Nick Kossifidis <mickflemm@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Nicola Lunghi <nick83ola@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Ainge Hsu <ainge.hsu@mediatek.com>
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

T24gVHVlLCAyMDIwLTExLTEwIGF0IDA5OjEyICswMTAwLCBUYWthc2hpIEl3YWkgd3JvdGU6DQo+
IE9uIFR1ZSwgMTAgTm92IDIwMjAgMDk6MDQ6MDMgKzAxMDAsDQo+IE1hY3BhdWwgTGluIHdyb3Rl
Og0KPiA+IA0KPiA+IFRoZSBIVUFXRUkgVVNCLUMgaGVhZHNldCAoVklEOjB4MTJkMSwgUElEOjB4
M2EwNykgcmVwb3J0ZWQgaXQgc3VwcG9ydHMNCj4gPiA5Nmtoei4gSG93ZXZlciB0aGVyZSB3aWxs
IGJlIHNvbWUgcmFuZG9tIGlzc3VlIHVuZGVyIDk2a2h6Lg0KPiA+IE5vdCBzdXJlIGlmIHRoZXJl
IGlzIGFueSBhbHRlcm5hdGUgc2V0dGluZyBjb3VsZCBiZSBhcHBsaWVkLg0KPiA+IEhlbmNlIDQ4
a2h6IGlzIHN1Z2dlc3RlZCB0byBiZSBhcHBsaWVkIGF0IHRoaXMgbW9tZW50Lg0KPiA+IA0KPiA+
IFNpZ25lZC1vZmYtYnk6IE1hY3BhdWwgTGluIDxtYWNwYXVsLmxpbkBtZWRpYXRlay5jb20+DQo+
ID4gU2lnbmVkLW9mZi1ieTogRWRkaWUgSHVuZyA8ZWRkaWUuaHVuZ0BtZWRpYXRlay5jb20+DQo+
ID4gLS0tDQo+ID4gIHNvdW5kL3VzYi9mb3JtYXQuYyB8ICAgIDUgKysrKysNCj4gPiAgMSBmaWxl
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9zb3VuZC91
c2IvZm9ybWF0LmMgYi9zb3VuZC91c2IvZm9ybWF0LmMNCj4gPiBpbmRleCAxYjI4ZDAxLi42ZjZl
NzliIDEwMDY0NA0KPiA+IC0tLSBhL3NvdW5kL3VzYi9mb3JtYXQuYw0KPiA+ICsrKyBiL3NvdW5k
L3VzYi9mb3JtYXQuYw0KPiA+IEBAIC0yMTcsNiArMjE3LDExIEBAIHN0YXRpYyBpbnQgcGFyc2Vf
YXVkaW9fZm9ybWF0X3JhdGVzX3YxKHN0cnVjdCBzbmRfdXNiX2F1ZGlvICpjaGlwLCBzdHJ1Y3Qg
YXVkaW9mDQo+ID4gIAkJCSAgICAoY2hpcC0+dXNiX2lkID09IFVTQl9JRCgweDA0MWUsIDB4NDA2
NCkgfHwNCj4gPiAgCQkJICAgICBjaGlwLT51c2JfaWQgPT0gVVNCX0lEKDB4MDQxZSwgMHg0MDY4
KSkpDQo+ID4gIAkJCQlyYXRlID0gODAwMDsNCj4gPiArCQkJLyogSHVhd2VpIGhlYWRzZXQgY2Fu
J3Qgc3VwcG9ydCA5NmtIeiBmdWxseSAqLw0KPiA+ICsJCQlpZiAocmF0ZSA9PSA5NjAwMCAmJg0K
PiA+ICsJCQkgICAgY2hpcC0+dXNiX2lkID09IFVTQl9JRCgweDEyZDEsIDB4M2EwNykgJiYNCj4g
PiArCQkJICAgIGxlMTZfdG9fY3B1KHVkZXYtPmRlc2NyaXB0b3IuYmNkRGV2aWNlKSA9PSAweDQ5
KQ0KPiANCj4gVGhpcyBjYXVzZXMgdGhlIGNvbXBpbGUgZXJyb3IgZHVlIHRvIHRoZSB1bmtub3du
IHVkZXYuDQo+IElzIHRoaXMgYmNkRGV2aWNlIGNoZWNrIG1hbmRhdG9yeT8NCg0KVGhpcyBtZWFu
cyBmaXJtd2FyZSB2ZXJzaW9uIG9mIHRoZSBoZWFkc2V0IGFzIGZhciBhcyBJIGtub3cuLg0KU29y
cnkgSSdsbCBjaGVjayB0aGUgY29tcGlsZSBlcnJvciBhbmQgcmVzZW5kIGxhdGVyLg0KDQo+IA0K
PiB0aGFua3MsDQo+IA0KPiBUYWthc2hpDQoNClRoYW5rcw0KTWFjcGF1bCBMaW4NCg0K

