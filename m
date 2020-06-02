Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB791EBCEF
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jun 2020 15:17:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2ED63168F;
	Tue,  2 Jun 2020 15:16:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2ED63168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591103850;
	bh=L8W+8mcW7tehoLHNruKxathHioAmFWgzPfCM36oBzVI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iRrBBoSaWvQFq7yPQlBJV0NUqFQwxGHygZEvDkyW+pS/NA10JkBuSCjC/SV13j8Mx
	 jkY/zhHo0MMa1HwifUVKOMgdSa/1mXxzOXjsHhNJedBnSLrfzYnTTa5bxJA/ocOqa/
	 aGwuXbW5Iy3TUA0BXRINIcc2EfR1zPF9EWdmHQU0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D43BDF802E8;
	Tue,  2 Jun 2020 15:10:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DF7FF8026F; Tue,  2 Jun 2020 13:54:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_BASE64_TEXT,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by alsa1.perex.cz (Postfix) with ESMTP id 4D949F800BC
 for <alsa-devel@alsa-project.org>; Tue,  2 Jun 2020 13:54:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D949F800BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="k9mn8oVK"
X-UUID: db722be8915d4774a20434feec800d44-20200602
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=L8W+8mcW7tehoLHNruKxathHioAmFWgzPfCM36oBzVI=; 
 b=k9mn8oVKytEFmfU9V9wfE7bOeHl582gKVvTUdOLHqqCH7lSp7cflofcwSgaHQ0ZeaoDugr6BF/FB6eHeRMa4ma2CVUniQg21aktdRPhztGUzRTYCM7UqUwSZOh1PjvKZdklXygr7vZ8rdF/qyB5qTjsL4yEYpKiAmqrxOacpFw0=;
X-UUID: db722be8915d4774a20434feec800d44-20200602
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 723940935; Tue, 02 Jun 2020 19:54:12 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Jun 2020 19:54:01 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 2 Jun 2020 19:54:01 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Alexander Tsoy <alexander@tsoy.me>,
 "Johan Hovold" <johan@kernel.org>, Hui Wang <hui.wang@canonical.com>,
 =?UTF-8?q?Szabolcs=20Sz=C5=91ke?= <szszoke.code@gmail.com>, Macpaul Lin
 <macpaul.lin@mediatek.com>, <alsa-devel@alsa-project.org>,
 <linux-usb@vger.kernel.org>
Subject: [PATCH] sound: usb: pcm: fix incorrect power state when playing sound
 after PM_AUTO suspend
Date: Tue, 2 Jun 2020 19:53:41 +0800
Message-ID: <1591098821-17910-1-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org>
References: <linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Content-Transfer-Encoding: base64
X-Mailman-Approved-At: Tue, 02 Jun 2020 15:10:44 +0200
Cc: linux-arm-kernel@lists.infradead.org, Macpaul Lin <macpaul.lin@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>
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

VGhpcyBwYXRjaCBmaXggaW5jb3JyZWN0IHBvd2VyIHN0YXRlIGNoYW5nZWQgYnkgdXNiX2F1ZGlv
X3N1c3BlbmQoKQ0Kd2hlbiBDT05GSUdfUE0gaXMgZW5hYmxlZC4NCg0KQWZ0ZXIgcmVjZWl2aW5n
IHN1c3BlbmQgUE0gbWVzc2FnZSB3aXRoIGF1dG8gZmxhZywgdXNiX2F1ZGlvX3N1c3BlbmQoKQ0K
Y2hhbmdlIGNhcmQncyBwb3dlciBzdGF0ZSB0byBTTkRSVl9DVExfUE9XRVJfRDNob3QuIE9ubHkg
d2hlbiB0aGUgb3RoZXINCnJlc3VtZSBQTSBtZXNzYWdlIHdpdGggYXV0byBmbGFnIGNhbiBjaGFu
Z2UgcG93ZXIgc3RhdGUgdG8NClNORFJWX0NUTF9QT1dFUl9EMCBpbiBfX3VzYl9hdWRpb19yZXN1
bWUoKS4NCg0KSG93ZXZlciwgd2hlbiBzeXN0ZW0gaXMgbm90IHVuZGVyIGF1dG8gc3VzcGVuZCwg
cmVzdW1lIFBNIG1lc3NhZ2Ugd2l0aA0KYXV0byBmbGFnIG1pZ2h0IG5vdCBiZSBhYmxlIHRvIHJl
Y2VpdmUgb24gdGltZSB3aGljaCBjYXVzZSB0aGUgcG93ZXINCnN0YXRlIHdhcyBpbmNvcnJlY3Qu
IEF0IHRoaXMgdGltZSwgaWYgYSBwbGF5ZXIgc3RhcnRzIHRvIHBsYXkgc291bmQsDQp3aWxsIGNh
dXNlIHNuZF91c2JfcGNtX29wZW4oKSB0byBhY2Nlc3MgdGhlIGNhcmQgYW5kIHNldHVwX2h3X2lu
Zm8oKSB3aWxsDQpyZXN1bWUgdGhlIGNhcmQuDQoNCkJ1dCBldmVuIHRoZSBjYXJkIGlzIGJhY2sg
dG8gd29yayBhbmQgYWxsIGZ1bmN0aW9uIG5vcm1hbCwgdGhlIHBvd2VyDQpzdGF0ZSBpcyBzdGls
bCBpbiBTTkRSVl9DVExfUE9XRVJfRDNob3QuIFdoaWNoIGNhdXNlIHRoZSBpbmZpbml0ZSBsb29w
DQpoYXBwZW5lZCBpbiBzbmRfcG93ZXJfd2FpdCgpIHRvIGNoZWNrIHRoZSBwb3dlciBzdGF0ZS4g
VGh1cyB0aGUNCnN1Y2Nlc3NpdmUgc2V0dGluZyBpb2N0bCBjYW5ub3QgYmUgcGFzc2VkIHRvIGNh
cmQuDQoNCkhlbmNlIHdlIHN1Z2dlc3QgdG8gY2hhbmdlIHBvd2VyIHN0YXRlIHRvIFNORFJWX0NU
TF9QT1dFUl9EMCB3aGVuIGNhcmQNCmhhcyBiZWVuIHJlc3VtZWQgc3VjY2Vzc2Z1bGx5Lg0KDQpT
aWduZWQtb2ZmLWJ5OiBNYWNwYXVsIExpbiA8bWFjcGF1bC5saW5AbWVkaWF0ZWsuY29tPg0KLS0t
DQogc291bmQvdXNiL3BjbS5jIHwgICAxMSArKysrKysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCAx
MSBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9zb3VuZC91c2IvcGNtLmMgYi9zb3VuZC91
c2IvcGNtLmMNCmluZGV4IGE0ZTQwNjQuLmQ2NjdlY2IgMTAwNjQ0DQotLS0gYS9zb3VuZC91c2Iv
cGNtLmMNCisrKyBiL3NvdW5kL3VzYi9wY20uYw0KQEAgLTEzMjIsNiArMTMyMiwxNyBAQCBzdGF0
aWMgaW50IHNldHVwX2h3X2luZm8oc3RydWN0IHNuZF9wY21fcnVudGltZSAqcnVudGltZSwgc3Ry
dWN0IHNuZF91c2Jfc3Vic3RyZQ0KIAlpZiAoZXJyIDwgMCkNCiAJCXJldHVybiBlcnI7DQogDQor
CS8qIGZpeCBpbmNvcnJlY3QgcG93ZXIgc3RhdGUgd2hlbiByZXN1bWluZyBieSBvcGVuIGFuZCBs
YXRlciBpb2N0bHMgKi8NCisJaWYgKElTX0VOQUJMRUQoQ09ORklHX1BNKSAmJg0KKwkJc25kX3Bv
d2VyX2dldF9zdGF0ZShzdWJzLT5zdHJlYW0tPmNoaXAtPmNhcmQpDQorCQkJPT0gU05EUlZfQ1RM
X1BPV0VSX0QzaG90KSB7DQorCQkvKiBzZXQgdGhlc2UgdmFyaWFibGVzIGZvciBwb3dlciBzdGF0
ZSBjb3JyZWN0aW9uICovDQorCQlzdWJzLT5zdHJlYW0tPmNoaXAtPmF1dG9zdXNwZW5kZWQgPSAw
Ow0KKwkJc3Vicy0+c3RyZWFtLT5jaGlwLT5udW1fc3VzcGVuZGVkX2ludGYgPSAxOw0KKwkJZGV2
X2luZm8oJnN1YnMtPmRldi0+ZGV2LA0KKwkJCSJjaGFuZ2UgcG93ZXIgc3RhdGUgZnJvbSBEM2hv
dCB0byBEMFxuIik7DQorCX0NCisNCiAJcmV0dXJuIHNuZF91c2JfYXV0b3Jlc3VtZShzdWJzLT5z
dHJlYW0tPmNoaXApOw0KIH0NCiANCi0tIA0KMS43LjkuNQ0K

